Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DB1C369B5
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:39:58 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.5071.1744663197958745233
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 13:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0oij8oH;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so4424495a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744663197; x=1745267997; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EjM57AcyCmeg8F+cLNAlJtyZxFpSjtXg5mb7tRIdkV0=;
        b=I0oij8oHTld4jamcdEnTB2uG828Q4bqwF3WKdshoGjSKSduQ1UBvdFmm0Bh+AeBrEb
         5G8xjvT9b008kdfhcIBmUBpwjB3cHlLgUOqnb/i7d9+Zz1/wanGZSJDRXxpGP7qd8Ekl
         xJTjCsGbu5nAe4RFTHvQU9FHgbSROfAUOiE2Nws3dg7PFokKfupNLaDAXq7jbYy1UzNq
         +IDrhODmu+lH1tXAUSBD147qKbA7OhfDE8eNh31LPJheNhq8GKpnO7+rGDy7hImO75nv
         it0iZhGlEFPdkO6l1YcTq4yODSHPjgUO9Zj9U7IL5s0KJA3TY+BIpcPRwkeJfdCx1mZs
         focw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663197; x=1745267997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjM57AcyCmeg8F+cLNAlJtyZxFpSjtXg5mb7tRIdkV0=;
        b=l4ED9yAHqp6UiXR4UL24zN6EGQqTP8FgpuB0oXqkftxuAn116kabiNmArpzhna/Edu
         8YbVkZJ0ujDjzXcD1XVZWpJ+vMqo6Vbf3omFvPb5wefwJxxQJ2EPShTO2KiPKYf/AUdB
         4ZY0Rl0IXw47jdMpVGRltVP6M2P55+vv6Tk4MRYTGUbNGqCN1XX8IouasaALVYWIw8cW
         +MwW45tdE1QTfT9BukLqG/qULLqnnWlWH/xZYq8z9hRIvs/SYjUHVXDTHdV1Jt3gWqoB
         xEoSBD2Lh7q6gcSJZEJrdUhKuqJ9LGLo6nc8uhgtfLK/5sZN+z3wv3cgMtXYhqDzZ4SY
         hwsQ==
X-Gm-Message-State: AOJu0YyaZ/iLmuE8V3pVuWn0Sj5Af2yRF8HwXA3W8Ogr34l8VuJb8GCI
	i/VkbkUCj4Tg1LMjjlBJbsuxmN1Zy8mw8Et3p+o2Bk5SPCTAm9rmEQke0WMDRveAloGqR4tKz9m
	26aL0igywVdDw0ALI9/yTN6IJ76Y=
X-Gm-Gg: ASbGnctwHbRbQE+KTZjEXepKRsrC1b8KkPQdxfjwTHYe+pJ+Nk35azG5cKZixrbeQZ5
	4qWiFbrhzYcVuu+zfkdVxFD22wtNAhGAA8UsxEO0NAJWK0A8q6NSBCxCQjhKl05Qb5OPloVJM4K
	E2AH9iSx/G78jR9i5BRcLd
X-Google-Smtp-Source: AGHT+IG6wx0acSOSwGODyMfcdRGgQEArjLUlkCjc4HxqFt8360SQupnUcMjPG9uH07xT0qM6QKPVKs2ILqHmMTalCac=
X-Received: by 2002:a17:90b:3e84:b0:2ff:6608:78e2 with SMTP id
 98e67ed59e1d1-30823644ffdmr22528758a91.16.1744663196921; Mon, 14 Apr 2025
 13:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250414195431.487573-1-pkj@axis.com>
In-Reply-To: <20250414195431.487573-1-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Apr 2025 16:39:45 -0400
X-Gm-Features: ATxdqUHTcdzIybq1ZLiJYHGzMZNOJd2KN8XQMYd6bbXVLkmc4kUBsoOiAuR7Knw
Message-ID: <CADkTA4OaNNSXi0SyL8ckOqwVgb9mxeH5ofBSme+Yp7z40fX-OA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Update to 4.45.1
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001af7440632c30e19"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 20:39:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9224

--0000000000001af7440632c30e19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:54=E2=80=AFPM Peter Kjellerstedt via
lists.yoctoproject.org <peter.kjellerstedt=3Daxis.com@lists.yoctoproject.or=
g>
wrote:

> Refactor the recipe to use the gomod fetcher.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> Bruce, I know you prefer to do things your own way, so feel free to
> ignore this. However, the current version of yq does not build with go
> 1.24 that comes with Walnascar so the yq recipe needs to be updated one
> way or the other. Since I have no idea how you update the dependencies
> in the current version of the recipe, it was easiest for me to generate
> a new recipe using one of our tools.
>

Yes, I'll do the update myself in the next few days.

I have no interest in using the oe mod fetchers, given the flux and
my inability to debug and support them.

Bruce



>
>  recipes-devtools/yq/yq-go-mods.inc  | 37 ++++++++++++
>  recipes-devtools/yq/yq-licenses.inc | 24 ++++++++
>  recipes-devtools/yq/yq_4.45.1.bb    | 40 +++++++++++++
>  recipes-devtools/yq/yq_git.bb       | 87 -----------------------------
>  4 files changed, 101 insertions(+), 87 deletions(-)
>  create mode 100644 recipes-devtools/yq/yq-go-mods.inc
>  create mode 100644 recipes-devtools/yq/yq-licenses.inc
>  create mode 100644 recipes-devtools/yq/yq_4.45.1.bb
>  delete mode 100644 recipes-devtools/yq/yq_git.bb
>
> diff --git a/recipes-devtools/yq/yq-go-mods.inc
> b/recipes-devtools/yq/yq-go-mods.inc
> new file mode 100644
> index 00000000..0ba399f3
> --- /dev/null
> +++ b/recipes-devtools/yq/yq-go-mods.inc
> @@ -0,0 +1,37 @@
> +SRC_URI +=3D "\
> +    gomod://
> github.com/a8m/envsubst;version=3Dv1.4.2;sha256sum=3D231eedf3a12c110a43c9=
5f1658b26fba66f24ab289cbd249605b48c5544897ad
> \
> +    gomod://
> github.com/alecthomas/participle/v2;version=3Dv2.1.1;sha256sum=3Dbea61133=
40aa301c0cc73d0a12cbd3453853ecad9bcec0eefae78eff15d67441
> \
> +    gomod://
> github.com/alecthomas/repr;version=3Dv0.4.0;sha256sum=3De4d4ec046c3ad7425=
c8e78352dc114ab34b1dd7f3a42c640e19cb51c94484c36
> \
> +    gomod://
> github.com/cpuguy83/go-md2man/v2;version=3Dv2.0.4;mod=3D1;sha256sum=3D14c=
3afa2ef623555c1b4834d1f88b14df77549afee85e5750c19102465b78aba
> \
> +    gomod://
> github.com/davecgh/go-spew;version=3Dv1.1.0;mod=3D1;sha256sum=3Dbcb293932=
51237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc
> \
> +    gomod://
> github.com/dimchansky/utfbom;version=3Dv1.1.1;sha256sum=3D0c1a11101602d5f=
57ac3e790c0b72e09ff87d8d535535f43fbee9e6a42327350
> \
> +    gomod://
> github.com/elliotchance/orderedmap;version=3Dv1.7.1;sha256sum=3D86680515e=
ff3f3d3944149ef3e054dfdd8e6b9bad8fe00ee0a862893754c6a39
> \
> +    gomod://
> github.com/fatih/color;version=3Dv1.18.0;sha256sum=3D4dc6907b7f6807b37c21=
ad527d966437d398f03472115f471eaa8fe5875363d3
> \
> +    gomod://
> github.com/goccy/go-json;version=3Dv0.10.4;sha256sum=3Dd89fa5215f5c2e0077=
b67dbc6e043db1b6427e93bdf5faacb7c536afca95e454
> \
> +    gomod://
> github.com/goccy/go-yaml;version=3Dv1.13.3;sha256sum=3D0d2c0c516c9aa022bc=
448ed4b8056340c4ccfb3ba70e3f873c319d4b66e75f59
> \
> +    gomod://
> github.com/inconshreveable/mousetrap;version=3Dv1.1.0;mod=3D1;sha256sum=
=3D1c1b15911aa8a0bd5cd0f6670ec23d1086496f3615fdf53306aff2b476ce9be1
> \
> +    gomod://
> github.com/jinzhu/copier;version=3Dv0.4.0;sha256sum=3D45a9bad09e85195732f=
408f9d505dc2b7f8868f9ddc3a1a7188999e5ca2d0775
> \
> +    gomod://
> github.com/magiconair/properties;version=3Dv1.8.9;sha256sum=3D8361b76b967=
090e33192173d91fb3de5f5ea43f6b8d23e927bf6d698fc8a0250
> \
> +    gomod://
> github.com/mattn/go-colorable;version=3Dv0.1.13;sha256sum=3D08be322dcc584=
a9fcfde5caf0cf878b4e11cd98f252e32bc704e92c5a4ba9d15
> \
> +    gomod://
> github.com/mattn/go-isatty;version=3Dv0.0.16;mod=3D1;sha256sum=3D714766ec=
82d67db895ade8af6b8054ad430c3cea5e15b3a888f23ed2f3e1b863
> \
> +    gomod://
> github.com/mattn/go-isatty;version=3Dv0.0.20;sha256sum=3Df2d5f89ca451577e=
17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc
> \
> +    gomod://
> github.com/pelletier/go-toml/v2;version=3Dv2.2.3;sha256sum=3Da51f4dc7b62b=
d7c26b387d912dfae87ca1449082f26574c9f614ae640318b092
> \
> +    gomod://
> github.com/pkg/diff;version=3Dv0.0.0-20210226163009-20ebb0f2a09e;sha256su=
m=3Df35b23fdd2b9522ddd46cc5c0161b4f0765c514475d5d4ca2a86aca31388c8bd
> \
> +    gomod://
> github.com/pmezard/go-difflib;version=3Dv1.0.0;mod=3D1;sha256sum=3D74b2e7=
66eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2
> \
> +    gomod://
> github.com/russross/blackfriday/v2;version=3Dv2.1.0;mod=3D1;sha256sum=3Dc=
39547cce6e866e8cfa395d2937bce30801cd07f0b901c2133248f1fba12f58d
> \
> +    gomod://
> github.com/spf13/cobra;version=3Dv1.8.1;sha256sum=3Dbf27a276f87257c93bc05=
7309df30265a19beefc3d5fc887cbd8fc99ad35466a
> \
> +    gomod://
> github.com/spf13/pflag;version=3Dv1.0.5;sha256sum=3Dfc6e704f2f6a84ddcdce6=
de0404e5340fa20c8676181bf5d381b17888107ba84
> \
> +    gomod://
> github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D1350354d52d=
2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1
> \
> +    gomod://
> github.com/stretchr/testify;version=3Dv1.7.0;mod=3D1;sha256sum=3Dfff8168d=
98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf
> \
> +    gomod://
> github.com/yuin/gopher-lua;version=3Dv1.1.1;sha256sum=3Dac45a1524a3904916=
7f1bb2334b67f728559cb1e60c535c54b3a09f1fc772b45
> \
> +    gomod://
> golang.org/toolchain;version=3Dv0.0.1-go1.22.5.linux-amd64;sha256sum=3D0e=
b73889fac3ef46a759ca3f8079a7ff656158ee6aedfe127221101824001a77
> \
> +    gomod://
> golang.org/x/net;version=3Dv0.33.0;sha256sum=3Da85014e77369f99c3f9eebe128=
9b4d0757d58248ca12337642923818ae22ca19
> \
> +    gomod://
> golang.org/x/sys;version=3Dv0.0.0-20220811171246-fbc7d0a398ab;mod=3D1;sha=
256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024
> \
> +    gomod://
> golang.org/x/sys;version=3Dv0.28.0;sha256sum=3D0ed47a83fe7d7a7e743e815172=
bc10c1ac0ed0d31ebb095e75717428e09aa895
> \
> +    gomod://
> golang.org/x/sys;version=3Dv0.6.0;mod=3D1;sha256sum=3Df033333096fe198f315=
1deed93f2deba74e50bbfe7739134045bc3b7ce4a5024
> \
> +    gomod://
> golang.org/x/text;version=3Dv0.21.0;sha256sum=3Dbe3db791651af6f2cb0225aa5=
d5578c23149b2017246ba8e59586080baadd612
> \
> +    gomod://
> gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-20d25e280405;mod=3D1;sh=
a256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb45ee40c33f
> \
> +    gomod://
> gopkg.in/op/go-logging.v1;version=3Dv1.0.0-20160211212156-b2cb9fa56473;sh=
a256sum=3D028f2b859f2d7800d07a6fb36ef1562a95219941f3b1421cdad5e95c44986ab3
> \
> +    gomod://
> gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9f266ea9e77c;mod=3D1;sha=
256sum=3D21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939
> \
> +    gomod://
> gopkg.in/yaml.v3;version=3Dv3.0.1;sha256sum=3Daab8fbc4e6300ea08e6afe1caea=
18a21c90c79f489f52c53e2f20431f1a9a015
> \
> +"
> diff --git a/recipes-devtools/yq/yq-licenses.inc
> b/recipes-devtools/yq/yq-licenses.inc
> new file mode 100644
> index 00000000..80ddb5e7
> --- /dev/null
> +++ b/recipes-devtools/yq/yq-licenses.inc
> @@ -0,0 +1,24 @@
> +GO_MOD_LICENSES =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
> +
> +LIC_FILES_CHKSUM +=3D "\
> +    file://pkg/mod/
> github.com/a8m/envsubst@v1.4.2/LICENSE;md5=3D20cbf74752fb062bc260b078d71d=
7e30
> \
> +    file://pkg/mod/
> github.com/alecthomas/participle/v2@v2.1.1/COPYING;md5=3Dc9b197062ffa2eb2=
7eed3d8ef59c1a56
> \
> +    file://pkg/mod/
> github.com/dimchansky/utfbom@v1.1.1/LICENSE;md5=3Dd5b81a403268b5ea485b4a2=
579630c17
> \
> +    file://pkg/mod/
> github.com/elliotchance/orderedmap@v1.7.1/LICENSE;md5=3D47a0bd50edb147474=
7d074fc0ba1ead5
> \
> +    file://pkg/mod/
> github.com/fatih/color@v1.18.0/LICENSE.md;md5=3D316e6d590bdcde7993fb17566=
2c0dd5a
> \
> +    file://pkg/mod/
> github.com/goccy/go-json@v0.10.4/LICENSE;md5=3D33a07164132d795872805bfc53=
f6097d
> \
> +    file://pkg/mod/
> github.com/goccy/go-yaml@v1.13.3/LICENSE;md5=3D346470d8ac0a6ffe1eb8635a45=
2cec2b
> \
> +    file://pkg/mod/
> github.com/magiconair/properties@v1.8.9/LICENSE.md;md5=3D714beb7325ffa89d=
5a68d936a3bb04e5
> \
> +    file://pkg/mod/
> github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=3D24ce168f90aec2456a73d=
e1839037245
> \
> +    file://pkg/mod/
> github.com/mattn/go-isatty@v0.0.20/LICENSE;md5=3Df509beadd5a11227c27b5d2a=
d6c9f2c6
> \
> +    file://pkg/mod/
> github.com/pelletier/go-toml/v2@v2.2.3/LICENSE;md5=3D390892c6562af0d807e5=
27b06d635f94
> \
> +    file://pkg/mod/
> github.com/pkg/diff@v0.0.0-20210226163009-20ebb0f2a09e/LICENSE;md5=3Dd025=
0703509998b3201f5dd7f26e8c35
> \
> +    file://pkg/mod/
> github.com/spf13/cobra@v1.8.1/LICENSE.txt;md5=3D920d76114a32b0fb75b3f2718=
c5a91be
> \
> +    file://pkg/mod/
> github.com/spf13/pflag@v1.0.5/LICENSE;md5=3D1e8b7dc8b906737639131047a590f=
21d
> \
> +    file://pkg/mod/
> github.com/yuin/gopher-lua@v1.1.1/LICENSE;md5=3D5ea59bf62229a35ae7b2c7208=
524163e
> \
> +    file://pkg/mod/
> golang.org/x/net@v0.33.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a \
> +    file://pkg/mod/
> golang.org/x/sys@v0.28.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a \
> +    file://pkg/mod/
> golang.org/x/text@v0.21.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a =
\
> +    file://pkg/mod/
> gopkg.in/op/go-logging.v1@v1.0.0-20160211212156-b2cb9fa56473/LICENSE;md5=
=3Dd01d49c2816e0112c83b3a9f77029b8a
> \
> +    file://pkg/mod/
> gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c \
> +"
> diff --git a/recipes-devtools/yq/yq_4.45.1.bb b/recipes-devtools/yq/
> yq_4.45.1.bb
> new file mode 100644
> index 00000000..b942ca0b
> --- /dev/null
> +++ b/recipes-devtools/yq/yq_4.45.1.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "A lightweight and portable command-line YAML processor"
> +HOMEPAGE =3D "https://github.com/mikefarah/yq"
> +
> +LICENSE =3D "MIT & ${GO_MOD_LICENSES}"
> +LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd62f8269b9bff37fe9aa7dcc2"
> +require ${BPN}-licenses.inc
> +
> +SRCREV =3D "8bf425b4d1344db7cd469a8d10a390876e0c77fd"
> +SRCREV_FORMAT =3D "default"
> +
> +SRC_URI =3D
> "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3D${G=
O_SRCURI_DESTSUFFIX}"
> +SRC_URI +=3D "file://run-ptest"
> +require ${BPN}-go-mods.inc
> +
> +S =3D "${WORKDIR}/git"
> +
> +GO_IMPORT =3D "github.com/mikefarah/yq"
> +
> +inherit go-mod ptest
> +
> +do_install:append() {
> +    # these bring in dependencies for the -dev package on bash, and we
> don't
> +    # need them .. so we remove them to avoid needing that rdepends
> +    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
> +    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
> +    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_PATH}/tes=
ts
> +    cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    bash \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.b=
b
> deleted file mode 100644
> index 3d0714c7..00000000
> --- a/recipes-devtools/yq/yq_git.bb
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -SUMMARY =3D "a lightweight and portable command-line YAML processor "
> -HOMEPAGE =3D "https://github.com/mikefarah/yq"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd62f8269b9bff37fe9aa7dcc2"
> -
> -SRCREV_yq =3D "dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1"
> -SRCREV_color =3D "daf2830f2741ebb735b21709a520c5f37d642d85"
> -SRCREV_lexer =3D "6cdefc42e112ac71cbe316e1eed264ea62f58e25"
> -SRCREV_cobra =3D "b43be995ebb4bee335a787bd44498b91aef7619c"
> -SRCREV_pflag =3D "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
> -SRCREV_logging =3D "b2cb9fa56473e98db8caba80237377e83fe44db5"
> -SRCREV_yaml =3D "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> -SRCREV_xerrors =3D "65e65417b02f28de84b55f16b46a1e789149973a"
> -SRCREV_envsubst =3D "16035fe3571ad42c7796bf554f978bb2df64231b"
> -SRCREV_participle =3D "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
> -SRCREV_utfbom =3D "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
> -SRCREV_orderedmap =3D "1e43e194ff533a346bab5f9b66b738256f199c8a"
> -SRCREV_go-json =3D "5efc7d07eeeba186df630d9ab4ac78c761938c27"
> -SRCREV_copier =3D "d132b069fe1a77d09e4c260852b389a730bbe9ba"
> -SRCREV_properties =3D "c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264"
> -SRCREV_net =3D "f3363e06e74cdc304618bf31d898b78590103527"
> -SRCREV_text =3D "434eadcdbc3b0256971992e8c70027278364c72c"
> -SRCREV_diff =3D "20ebb0f2a09e612109b224b32f79370409108bcc"
> -
> -SRCREV_FORMAT =3D "yq_color"
> -SRC_URI =3D
> "git://${GO_IMPORT};name=3Dyq;branch=3Dmaster;protocol=3Dhttps;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}
> \
> -           git://
> github.com/fatih/color;name=3Dcolor;destsuffix=3Dbuild/vendor/src/github.=
com/fatih/color;branch=3Dmain;protocol=3Dhttps
> \
> -           git://
> github.com/goccy/go-yaml;name=3Dlexer;destsuffix=3Dbuild/vendor/src/githu=
b.com/goccy/go-yaml/;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/spf13/cobra;name=3Dcobra;nobranch=3D1;destsuffix=3Dbuild/vendo=
r/src/github.com/spf13/cobra;branch=3Dmain;protocol=3Dhttps
> \
> -           git://
> github.com/spf13/pflag;name=3Dpflag;destsuffix=3Dbuild/vendor/src/github.=
com/spf13/pflag;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/op/go-logging.git;name=3Dlogging;destsuffix=3Dbuild/vendor/src=
/gopkg.in/op/go-logging.v1;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/go-yaml/yaml.git;name=3Dyaml;branch=3Dv3;destsuffix=3Dbuild/ve=
ndor/src/gopkg.in/yaml.v3;protocol=3Dhttps
> \
> -           git://
> github.com/golang/xerrors;name=3Dxerrors;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3Dbuild/vendor/src/golang.org/x/xerrors
> \
> -           git://
> github.com/a8m/envsubst;name=3Denvsubst;destsuffix=3Dbuild/vendor/src/git=
hub.com/a8m/envsubst;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/alecthomas/participle;name=3Dparticiple;destsuffix=3Dbuild/ven=
dor/src/github.com/alecthomas/participle;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/dimchansky/utfbom;name=3Dutfbom;destsuffix=3Dbuild/vendor/src/=
github.com/dimchansky/utfbom;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/elliotchance/orderedmap;name=3Dorderedmap;destsuffix=3Dbuild/v=
endor/src/github.com/elliotchance/orderedmap;branch=3Dmaster;protocol=3Dhtt=
ps
> \
> -           git://
> github.com/goccy/go-json;name=3Dgo-json;destsuffix=3Dbuild/vendor/src/git=
hub.com/goccy/go-json;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/jinzhu/copier;name=3Dcopier;destsuffix=3Dbuild/vendor/src/gith=
ub.com/jinzhu/copier;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/magiconair/properties;name=3Dproperties;destsuffix=3Dbuild/ven=
dor/src/github.com/magiconair/properties;branch=3Dmain;protocol=3Dhttps
> \
> -           git://
> github.com/golang/net;name=3Dnet;destsuffix=3Dbuild/vendor/src/golang.org=
/x/net;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/golang/text;name=3Dtext;destsuffix=3Dbuild/vendor/src/golang.o=
rg/x/text;branch=3Dmaster;protocol=3Dhttps
> \
> -           git://
> github.com/pkg/diff;name=3Ddiff;destsuffix=3Dbuild/vendor/src/github.com/=
pkg/diff;branch=3Dmain;protocol=3Dhttps;apply=3Dno
> \
> -           file://run-ptest \
> -           "
> -
> -PV =3D "4.30.8+git${SRCREV_yq}"
> -GO_IMPORT =3D "github.com/mikefarah/yq"
> -
> -inherit go ptest
> -
> -do_compile:prepend() {
> -    # arrange for some of the golang built ins to be found
> -    (
> -       cd ${WORKDIR}/build/src/
> -       ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/
> golang.org .
> -
> -       cd ${WORKDIR}/build/
> -       ln -sf ${UNPACKDIR}/build/vendor .
> -    )
> -
> -    # arrange for the fetched dependencies to be found
> -    export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
> -    export GO111MODULE=3Doff
> -}
> -
> -do_install:append() {
> -    # these bring in dependencies for the -dev package on bash, and we
> don't
> -    # need them .. so we remove them to avoid needing that rdepends
> -    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
> -    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
> -    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
> -}
> -
> -do_install_ptest() {
> -    install -d ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/scripts/*
> ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/*
> ${D}${PTEST_PATH}/tests
> -    cp -r ${S}/src/github.com/mikefarah/yq/examples
> ${D}${PTEST_PATH}/tests
> -}
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -    bash \
> -"
> -
> -BBCLASSEXTEND =3D "native"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9223):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9223
> Mute This Topic: https://lists.yoctoproject.org/mt/112264276/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001af7440632c30e19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 14, 2025 at 3:54=
=E2=80=AFPM Peter Kjellerstedt via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axi=
s.com@lists.yoctoproject.org">axis.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Refactor the r=
ecipe to use the gomod fetcher.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
Bruce, I know you prefer to do things your own way, so feel free to<br>
ignore this. However, the current version of yq does not build with go<br>
1.24 that comes with Walnascar so the yq recipe needs to be updated one<br>
way or the other. Since I have no idea how you update the dependencies<br>
in the current version of the recipe, it was easiest for me to generate<br>
a new recipe using one of our tools.<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Yes, I&#39;ll do the u=
pdate myself in the next few days.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I have no interest in using the oe mod fetchers, given the flux =
and</div><div class=3D"gmail_default" style=3D"font-size:small">my inabilit=
y to debug and support them.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
=C2=A0recipes-devtools/yq/yq-go-mods.inc=C2=A0 | 37 ++++++++++++<br>
=C2=A0recipes-devtools/yq/yq-licenses.inc | 24 ++++++++<br>
=C2=A0recipes-devtools/yq/<a href=3D"http://yq_4.45.1.bb" rel=3D"noreferrer=
" target=3D"_blank">yq_4.45.1.bb</a>=C2=A0 =C2=A0 | 40 +++++++++++++<br>
=C2=A0recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 87 -------------=
----------------<br>
=C2=A04 files changed, 101 insertions(+), 87 deletions(-)<br>
=C2=A0create mode 100644 recipes-devtools/yq/yq-go-mods.inc<br>
=C2=A0create mode 100644 recipes-devtools/yq/yq-licenses.inc<br>
=C2=A0create mode 100644 recipes-devtools/yq/<a href=3D"http://yq_4.45.1.bb=
" rel=3D"noreferrer" target=3D"_blank">yq_4.45.1.bb</a><br>
=C2=A0delete mode 100644 recipes-devtools/yq/<a href=3D"http://yq_git.bb" r=
el=3D"noreferrer" target=3D"_blank">yq_git.bb</a><br>
<br>
diff --git a/recipes-devtools/yq/yq-go-mods.inc b/recipes-devtools/yq/yq-go=
-mods.inc<br>
new file mode 100644<br>
index 00000000..0ba399f3<br>
--- /dev/null<br>
+++ b/recipes-devtools/yq/yq-go-mods.inc<br>
@@ -0,0 +1,37 @@<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/a8m/envsubst;version=3D=
v1.4.2;sha256sum=3D231eedf3a12c110a43c95f1658b26fba66f24ab289cbd249605b48c5=
544897ad" rel=3D"noreferrer" target=3D"_blank">github.com/a8m/envsubst;vers=
ion=3Dv1.4.2;sha256sum=3D231eedf3a12c110a43c95f1658b26fba66f24ab289cbd24960=
5b48c5544897ad</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alecthomas/participle/v=
2;version=3Dv2.1.1;sha256sum=3Dbea6113340aa301c0cc73d0a12cbd3453853ecad9bce=
c0eefae78eff15d67441" rel=3D"noreferrer" target=3D"_blank">github.com/alect=
homas/participle/v2;version=3Dv2.1.1;sha256sum=3Dbea6113340aa301c0cc73d0a12=
cbd3453853ecad9bcec0eefae78eff15d67441</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/alecthomas/repr;version=
=3Dv0.4.0;sha256sum=3De4d4ec046c3ad7425c8e78352dc114ab34b1dd7f3a42c640e19cb=
51c94484c36" rel=3D"noreferrer" target=3D"_blank">github.com/alecthomas/rep=
r;version=3Dv0.4.0;sha256sum=3De4d4ec046c3ad7425c8e78352dc114ab34b1dd7f3a42=
c640e19cb51c94484c36</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/cpuguy83/go-md2man/v2;v=
ersion=3Dv2.0.4;mod=3D1;sha256sum=3D14c3afa2ef623555c1b4834d1f88b14df77549a=
fee85e5750c19102465b78aba" rel=3D"noreferrer" target=3D"_blank">github.com/=
cpuguy83/go-md2man/v2;version=3Dv2.0.4;mod=3D1;sha256sum=3D14c3afa2ef623555=
c1b4834d1f88b14df77549afee85e5750c19102465b78aba</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/davecgh/go-spew;version=
=3Dv1.1.0;mod=3D1;sha256sum=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c319=
8988fcd461a1cdf05cc" rel=3D"noreferrer" target=3D"_blank">github.com/davecg=
h/go-spew;version=3Dv1.1.0;mod=3D1;sha256sum=3Dbcb29393251237b79a17b6c19bf2=
9134f43e8f438c3198988fcd461a1cdf05cc</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/dimchansky/utfbom;versi=
on=3Dv1.1.1;sha256sum=3D0c1a11101602d5f57ac3e790c0b72e09ff87d8d535535f43fbe=
e9e6a42327350" rel=3D"noreferrer" target=3D"_blank">github.com/dimchansky/u=
tfbom;version=3Dv1.1.1;sha256sum=3D0c1a11101602d5f57ac3e790c0b72e09ff87d8d5=
35535f43fbee9e6a42327350</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/elliotchance/orderedmap=
;version=3Dv1.7.1;sha256sum=3D86680515eff3f3d3944149ef3e054dfdd8e6b9bad8fe0=
0ee0a862893754c6a39" rel=3D"noreferrer" target=3D"_blank">github.com/elliot=
chance/orderedmap;version=3Dv1.7.1;sha256sum=3D86680515eff3f3d3944149ef3e05=
4dfdd8e6b9bad8fe00ee0a862893754c6a39</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/fatih/color;version=3Dv=
1.18.0;sha256sum=3D4dc6907b7f6807b37c21ad527d966437d398f03472115f471eaa8fe5=
875363d3" rel=3D"noreferrer" target=3D"_blank">github.com/fatih/color;versi=
on=3Dv1.18.0;sha256sum=3D4dc6907b7f6807b37c21ad527d966437d398f03472115f471e=
aa8fe5875363d3</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/goccy/go-json;version=
=3Dv0.10.4;sha256sum=3Dd89fa5215f5c2e0077b67dbc6e043db1b6427e93bdf5faacb7c5=
36afca95e454" rel=3D"noreferrer" target=3D"_blank">github.com/goccy/go-json=
;version=3Dv0.10.4;sha256sum=3Dd89fa5215f5c2e0077b67dbc6e043db1b6427e93bdf5=
faacb7c536afca95e454</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/goccy/go-yaml;version=
=3Dv1.13.3;sha256sum=3D0d2c0c516c9aa022bc448ed4b8056340c4ccfb3ba70e3f873c31=
9d4b66e75f59" rel=3D"noreferrer" target=3D"_blank">github.com/goccy/go-yaml=
;version=3Dv1.13.3;sha256sum=3D0d2c0c516c9aa022bc448ed4b8056340c4ccfb3ba70e=
3f873c319d4b66e75f59</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/inconshreveable/mousetr=
ap;version=3Dv1.1.0;mod=3D1;sha256sum=3D1c1b15911aa8a0bd5cd0f6670ec23d10864=
96f3615fdf53306aff2b476ce9be1" rel=3D"noreferrer" target=3D"_blank">github.=
com/inconshreveable/mousetrap;version=3Dv1.1.0;mod=3D1;sha256sum=3D1c1b1591=
1aa8a0bd5cd0f6670ec23d1086496f3615fdf53306aff2b476ce9be1</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/jinzhu/copier;version=
=3Dv0.4.0;sha256sum=3D45a9bad09e85195732f408f9d505dc2b7f8868f9ddc3a1a718899=
9e5ca2d0775" rel=3D"noreferrer" target=3D"_blank">github.com/jinzhu/copier;=
version=3Dv0.4.0;sha256sum=3D45a9bad09e85195732f408f9d505dc2b7f8868f9ddc3a1=
a7188999e5ca2d0775</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/magiconair/properties;v=
ersion=3Dv1.8.9;sha256sum=3D8361b76b967090e33192173d91fb3de5f5ea43f6b8d23e9=
27bf6d698fc8a0250" rel=3D"noreferrer" target=3D"_blank">github.com/magicona=
ir/properties;version=3Dv1.8.9;sha256sum=3D8361b76b967090e33192173d91fb3de5=
f5ea43f6b8d23e927bf6d698fc8a0250</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mattn/go-colorable;vers=
ion=3Dv0.1.13;sha256sum=3D08be322dcc584a9fcfde5caf0cf878b4e11cd98f252e32bc7=
04e92c5a4ba9d15" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-c=
olorable;version=3Dv0.1.13;sha256sum=3D08be322dcc584a9fcfde5caf0cf878b4e11c=
d98f252e32bc704e92c5a4ba9d15</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mattn/go-isatty;version=
=3Dv0.0.16;mod=3D1;sha256sum=3D714766ec82d67db895ade8af6b8054ad430c3cea5e15=
b3a888f23ed2f3e1b863" rel=3D"noreferrer" target=3D"_blank">github.com/mattn=
/go-isatty;version=3Dv0.0.16;mod=3D1;sha256sum=3D714766ec82d67db895ade8af6b=
8054ad430c3cea5e15b3a888f23ed2f3e1b863</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/mattn/go-isatty;version=
=3Dv0.0.20;sha256sum=3Df2d5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41=
b57cd0b7b8cc" rel=3D"noreferrer" target=3D"_blank">github.com/mattn/go-isat=
ty;version=3Dv0.0.20;sha256sum=3Df2d5f89ca451577e17464b9bb596dc0d0ecececb5e=
aa63622c41b57cd0b7b8cc</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pelletier/go-toml/v2;ve=
rsion=3Dv2.2.3;sha256sum=3Da51f4dc7b62bd7c26b387d912dfae87ca1449082f26574c9=
f614ae640318b092" rel=3D"noreferrer" target=3D"_blank">github.com/pelletier=
/go-toml/v2;version=3Dv2.2.3;sha256sum=3Da51f4dc7b62bd7c26b387d912dfae87ca1=
449082f26574c9f614ae640318b092</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pkg/diff;version=3Dv0.0=
.0-20210226163009-20ebb0f2a09e;sha256sum=3Df35b23fdd2b9522ddd46cc5c0161b4f0=
765c514475d5d4ca2a86aca31388c8bd" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/pkg/diff;version=3Dv0.0.0-20210226163009-20ebb0f2a09e;sha256sum=3Df3=
5b23fdd2b9522ddd46cc5c0161b4f0765c514475d5d4ca2a86aca31388c8bd</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/pmezard/go-difflib;vers=
ion=3Dv1.0.0;mod=3D1;sha256sum=3D74b2e766eb215377864d587badf57e95521f692d2a=
7860b3c7759093f9c9bec2" rel=3D"noreferrer" target=3D"_blank">github.com/pme=
zard/go-difflib;version=3Dv1.0.0;mod=3D1;sha256sum=3D74b2e766eb215377864d58=
7badf57e95521f692d2a7860b3c7759093f9c9bec2</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/russross/blackfriday/v2=
;version=3Dv2.1.0;mod=3D1;sha256sum=3Dc39547cce6e866e8cfa395d2937bce30801cd=
07f0b901c2133248f1fba12f58d" rel=3D"noreferrer" target=3D"_blank">github.co=
m/russross/blackfriday/v2;version=3Dv2.1.0;mod=3D1;sha256sum=3Dc39547cce6e8=
66e8cfa395d2937bce30801cd07f0b901c2133248f1fba12f58d</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/cobra;version=3Dv=
1.8.1;sha256sum=3Dbf27a276f87257c93bc057309df30265a19beefc3d5fc887cbd8fc99a=
d35466a" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/cobra;versio=
n=3Dv1.8.1;sha256sum=3Dbf27a276f87257c93bc057309df30265a19beefc3d5fc887cbd8=
fc99ad35466a</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/spf13/pflag;version=3Dv=
1.0.5;sha256sum=3Dfc6e704f2f6a84ddcdce6de0404e5340fa20c8676181bf5d381b17888=
107ba84" rel=3D"noreferrer" target=3D"_blank">github.com/spf13/pflag;versio=
n=3Dv1.0.5;sha256sum=3Dfc6e704f2f6a84ddcdce6de0404e5340fa20c8676181bf5d381b=
17888107ba84</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/stretchr/objx;version=
=3Dv0.1.0;mod=3D1;sha256sum=3D1350354d52d2287a62336ecc0d56232d4c47699af9bba=
49c67c2b48254da98f1" rel=3D"noreferrer" target=3D"_blank">github.com/stretc=
hr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D1350354d52d2287a62336ecc0d5623=
2d4c47699af9bba49c67c2b48254da98f1</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/stretchr/testify;versio=
n=3Dv1.7.0;mod=3D1;sha256sum=3Dfff8168d98e6a07156c454a1b6e925509f3177e96c15=
5516d7f96b4079cca3bf" rel=3D"noreferrer" target=3D"_blank">github.com/stret=
chr/testify;version=3Dv1.7.0;mod=3D1;sha256sum=3Dfff8168d98e6a07156c454a1b6=
e925509f3177e96c155516d7f96b4079cca3bf</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://github.com/yuin/gopher-lua;version=
=3Dv1.1.1;sha256sum=3Dac45a1524a39049167f1bb2334b67f728559cb1e60c535c54b3a0=
9f1fc772b45" rel=3D"noreferrer" target=3D"_blank">github.com/yuin/gopher-lu=
a;version=3Dv1.1.1;sha256sum=3Dac45a1524a39049167f1bb2334b67f728559cb1e60c5=
35c54b3a09f1fc772b45</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/toolchain;version=3Dv0.=
0.1-go1.22.5.linux-amd64;sha256sum=3D0eb73889fac3ef46a759ca3f8079a7ff656158=
ee6aedfe127221101824001a77" rel=3D"noreferrer" target=3D"_blank">golang.org=
/toolchain;version=3Dv0.0.1-go1.22.5.linux-amd64;sha256sum=3D0eb73889fac3ef=
46a759ca3f8079a7ff656158ee6aedfe127221101824001a77</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/net;version=3Dv0.33.0=
;sha256sum=3Da85014e77369f99c3f9eebe1289b4d0757d58248ca12337642923818ae22ca=
19" rel=3D"noreferrer" target=3D"_blank">golang.org/x/net;version=3Dv0.33.0=
;sha256sum=3Da85014e77369f99c3f9eebe1289b4d0757d58248ca12337642923818ae22ca=
19</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/sys;version=3Dv0.0.0-=
20220811171246-fbc7d0a398ab;mod=3D1;sha256sum=3Df033333096fe198f3151deed93f=
2deba74e50bbfe7739134045bc3b7ce4a5024" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/sys;version=3Dv0.0.0-20220811171246-fbc7d0a398ab;mod=3D1;sha2=
56sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024</a=
> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/sys;version=3Dv0.28.0=
;sha256sum=3D0ed47a83fe7d7a7e743e815172bc10c1ac0ed0d31ebb095e75717428e09aa8=
95" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys;version=3Dv0.28.0=
;sha256sum=3D0ed47a83fe7d7a7e743e815172bc10c1ac0ed0d31ebb095e75717428e09aa8=
95</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/sys;version=3Dv0.6.0;=
mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b=
7ce4a5024" rel=3D"noreferrer" target=3D"_blank">golang.org/x/sys;version=3D=
v0.6.0;mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134=
045bc3b7ce4a5024</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://golang.org/x/text;version=3Dv0.21.=
0;sha256sum=3Dbe3db791651af6f2cb0225aa5d5578c23149b2017246ba8e59586080baadd=
612" rel=3D"noreferrer" target=3D"_blank">golang.org/x/text;version=3Dv0.21=
.0;sha256sum=3Dbe3db791651af6f2cb0225aa5d5578c23149b2017246ba8e59586080baad=
d612</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/check.v1;version=3Dv0.0.0=
-20161208181325-20d25e280405;mod=3D1;sha256sum=3D5c306e0d633cd66a11b40e2e5f=
bbc6da42110db7d72ea3c1524ceb45ee40c33f" rel=3D"noreferrer" target=3D"_blank=
">gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-20d25e280405;mod=3D1;sh=
a256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb45ee40c33f<=
/a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/op/go-logging.v1;version=
=3Dv1.0.0-20160211212156-b2cb9fa56473;sha256sum=3D028f2b859f2d7800d07a6fb36=
ef1562a95219941f3b1421cdad5e95c44986ab3" rel=3D"noreferrer" target=3D"_blan=
k">gopkg.in/op/go-logging.v1;version=3Dv1.0.0-20160211212156-b2cb9fa56473;s=
ha256sum=3D028f2b859f2d7800d07a6fb36ef1562a95219941f3b1421cdad5e95c44986ab3=
</a> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/yaml.v3;version=3Dv3.0.0-=
20200313102051-9f266ea9e77c;mod=3D1;sha256sum=3D21579860a20306fcf43b1bd234d=
1fba319499c77611b71c05f9bf3ba90dab939" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9f266ea9e77c;mod=3D1;sha2=
56sum=3D21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939</a=
> \<br>
+=C2=A0 =C2=A0 gomod://<a href=3D"http://gopkg.in/yaml.v3;version=3Dv3.0.1;=
sha256sum=3Daab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a01=
5" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3;version=3Dv3.0.1;s=
ha256sum=3Daab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015=
</a> \<br>
+&quot;<br>
diff --git a/recipes-devtools/yq/yq-licenses.inc b/recipes-devtools/yq/yq-l=
icenses.inc<br>
new file mode 100644<br>
index 00000000..80ddb5e7<br>
--- /dev/null<br>
+++ b/recipes-devtools/yq/yq-licenses.inc<br>
@@ -0,0 +1,24 @@<br>
+GO_MOD_LICENSES =3D &quot;Apache-2.0 &amp; BSD-2-Clause &amp; BSD-3-Clause=
 &amp; MIT&quot;<br>
+<br>
+LIC_FILES_CHKSUM +=3D &quot;\<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/a8m/envsubst@v1.=
4.2/LICENSE;md5=3D20cbf74752fb062bc260b078d71d7e30" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/a8m/envsubst@v1.4.2/LICENSE;md5=3D20cbf74752fb062b=
c260b078d71d7e30</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/alecthomas/parti=
ciple/v2@v2.1.1/COPYING;md5=3Dc9b197062ffa2eb27eed3d8ef59c1a56" rel=3D"nore=
ferrer" target=3D"_blank">github.com/alecthomas/participle/v2@v2.1.1/COPYIN=
G;md5=3Dc9b197062ffa2eb27eed3d8ef59c1a56</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/dimchansky/utfbo=
m@v1.1.1/LICENSE;md5=3Dd5b81a403268b5ea485b4a2579630c17" rel=3D"noreferrer"=
 target=3D"_blank">github.com/dimchansky/utfbom@v1.1.1/LICENSE;md5=3Dd5b81a=
403268b5ea485b4a2579630c17</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/elliotchance/ord=
eredmap@v1.7.1/LICENSE;md5=3D47a0bd50edb1474747d074fc0ba1ead5" rel=3D"noref=
errer" target=3D"_blank">github.com/elliotchance/orderedmap@v1.7.1/LICENSE;=
md5=3D47a0bd50edb1474747d074fc0ba1ead5</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/fatih/color@v1.1=
8.0/LICENSE.md;md5=3D316e6d590bdcde7993fb175662c0dd5a" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/fatih/color@v1.18.0/LICENSE.md;md5=3D316e6d590b=
dcde7993fb175662c0dd5a</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/goccy/go-json@v0=
.10.4/LICENSE;md5=3D33a07164132d795872805bfc53f6097d" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/goccy/go-json@v0.10.4/LICENSE;md5=3D33a07164132d=
795872805bfc53f6097d</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/goccy/go-yaml@v1=
.13.3/LICENSE;md5=3D346470d8ac0a6ffe1eb8635a452cec2b" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/goccy/go-yaml@v1.13.3/LICENSE;md5=3D346470d8ac0a=
6ffe1eb8635a452cec2b</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/magiconair/prope=
rties@v1.8.9/LICENSE.md;md5=3D714beb7325ffa89d5a68d936a3bb04e5" rel=3D"nore=
ferrer" target=3D"_blank">github.com/magiconair/properties@v1.8.9/LICENSE.m=
d;md5=3D714beb7325ffa89d5a68d936a3bb04e5</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mattn/go-colorab=
le@v0.1.13/LICENSE;md5=3D24ce168f90aec2456a73de1839037245" rel=3D"noreferre=
r" target=3D"_blank">github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=3D24=
ce168f90aec2456a73de1839037245</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/mattn/go-isatty@=
v0.0.20/LICENSE;md5=3Df509beadd5a11227c27b5d2ad6c9f2c6" rel=3D"noreferrer" =
target=3D"_blank">github.com/mattn/go-isatty@v0.0.20/LICENSE;md5=3Df509bead=
d5a11227c27b5d2ad6c9f2c6</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pelletier/go-tom=
l/v2@v2.2.3/LICENSE;md5=3D390892c6562af0d807e527b06d635f94" rel=3D"noreferr=
er" target=3D"_blank">github.com/pelletier/go-toml/v2@v2.2.3/LICENSE;md5=3D=
390892c6562af0d807e527b06d635f94</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/pkg/diff@v0.0.0-=
20210226163009-20ebb0f2a09e/LICENSE;md5=3Dd0250703509998b3201f5dd7f26e8c35"=
 rel=3D"noreferrer" target=3D"_blank">github.com/pkg/diff@v0.0.0-2021022616=
3009-20ebb0f2a09e/LICENSE;md5=3Dd0250703509998b3201f5dd7f26e8c35</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/cobra@v1.8=
.1/LICENSE.txt;md5=3D920d76114a32b0fb75b3f2718c5a91be" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/spf13/cobra@v1.8.1/LICENSE.txt;md5=3D920d76114a=
32b0fb75b3f2718c5a91be</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/spf13/pflag@v1.0=
.5/LICENSE;md5=3D1e8b7dc8b906737639131047a590f21d" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/spf13/pflag@v1.0.5/LICENSE;md5=3D1e8b7dc8b906737639=
131047a590f21d</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://github.com/yuin/gopher-lua@=
v1.1.1/LICENSE;md5=3D5ea59bf62229a35ae7b2c7208524163e" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/yuin/gopher-lua@v1.1.1/LICENSE;md5=3D5ea59bf622=
29a35ae7b2c7208524163e</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/net@v0.33.0/LI=
CENSE;md5=3D7998cb338f82d15c0eff93b7004d272a" rel=3D"noreferrer" target=3D"=
_blank">golang.org/x/net@v0.33.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d=
272a</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/sys@v0.28.0/LI=
CENSE;md5=3D7998cb338f82d15c0eff93b7004d272a" rel=3D"noreferrer" target=3D"=
_blank">golang.org/x/sys@v0.28.0/LICENSE;md5=3D7998cb338f82d15c0eff93b7004d=
272a</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://golang.org/x/text@v0.21.0/L=
ICENSE;md5=3D7998cb338f82d15c0eff93b7004d272a" rel=3D"noreferrer" target=3D=
"_blank">golang.org/x/text@v0.21.0/LICENSE;md5=3D7998cb338f82d15c0eff93b700=
4d272a</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/op/go-logging.v1@v=
1.0.0-20160211212156-b2cb9fa56473/LICENSE;md5=3Dd01d49c2816e0112c83b3a9f770=
29b8a" rel=3D"noreferrer" target=3D"_blank">gopkg.in/op/go-logging.v1@v1.0.=
0-20160211212156-b2cb9fa56473/LICENSE;md5=3Dd01d49c2816e0112c83b3a9f77029b8=
a</a> \<br>
+=C2=A0 =C2=A0 file://pkg/mod/<a href=3D"http://gopkg.in/yaml.v3@v3.0.1/LIC=
ENSE;md5=3D3c91c17266710e16afdbb2b6d15c761c" rel=3D"noreferrer" target=3D"_=
blank">gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3D3c91c17266710e16afdbb2b6d15c76=
1c</a> \<br>
+&quot;<br>
diff --git a/recipes-devtools/yq/<a href=3D"http://yq_4.45.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">yq_4.45.1.bb</a> b/recipes-devtools/yq/<a href=
=3D"http://yq_4.45.1.bb" rel=3D"noreferrer" target=3D"_blank">yq_4.45.1.bb<=
/a><br>
new file mode 100644<br>
index 00000000..b942ca0b<br>
--- /dev/null<br>
+++ b/recipes-devtools/yq/<a href=3D"http://yq_4.45.1.bb" rel=3D"noreferrer=
" target=3D"_blank">yq_4.45.1.bb</a><br>
@@ -0,0 +1,40 @@<br>
+SUMMARY =3D &quot;A lightweight and portable command-line YAML processor&q=
uot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/mikefarah/yq" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/mikefarah/yq</a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT &amp; ${GO_MOD_LICENSES}&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd6=
2f8269b9bff37fe9aa7dcc2&quot;<br>
+require ${BPN}-licenses.inc<br>
+<br>
+SRCREV =3D &quot;8bf425b4d1344db7cd469a8d10a390876e0c77fd&quot;<br>
+SRCREV_FORMAT =3D &quot;default&quot;<br>
+<br>
+SRC_URI =3D &quot;git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;=
destsuffix=3D${GO_SRCURI_DESTSUFFIX}&quot;<br>
+SRC_URI +=3D &quot;file://run-ptest&quot;<br>
+require ${BPN}-go-mods.inc<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+GO_IMPORT =3D &quot;<a href=3D"http://github.com/mikefarah/yq" rel=3D"nore=
ferrer" target=3D"_blank">github.com/mikefarah/yq</a>&quot;<br>
+<br>
+inherit go-mod ptest<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 # these bring in dependencies for the -dev package on bash, =
and we don&#39;t<br>
+=C2=A0 =C2=A0 # need them .. so we remove them to avoid needing that rdepe=
nds<br>
+=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules<br>
+=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts<br>
+=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests<b=
r>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/test=
s<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_P=
ATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests=
<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 bash \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">yq_git.bb</a> b/recipes-devtools/yq/<a href=3D"http=
://yq_git.bb" rel=3D"noreferrer" target=3D"_blank">yq_git.bb</a><br>
deleted file mode 100644<br>
index 3d0714c7..00000000<br>
--- a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">yq_git.bb</a><br>
+++ /dev/null<br>
@@ -1,87 +0,0 @@<br>
-SUMMARY =3D &quot;a lightweight and portable command-line YAML processor &=
quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/mikefarah/yq" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/mikefarah/yq</a>&quot;<br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd6=
2f8269b9bff37fe9aa7dcc2&quot;<br>
-<br>
-SRCREV_yq =3D &quot;dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1&quot;<br>
-SRCREV_color =3D &quot;daf2830f2741ebb735b21709a520c5f37d642d85&quot;<br>
-SRCREV_lexer =3D &quot;6cdefc42e112ac71cbe316e1eed264ea62f58e25&quot;<br>
-SRCREV_cobra =3D &quot;b43be995ebb4bee335a787bd44498b91aef7619c&quot;<br>
-SRCREV_pflag =3D &quot;2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab&quot;<br>
-SRCREV_logging =3D &quot;b2cb9fa56473e98db8caba80237377e83fe44db5&quot;<br=
>
-SRCREV_yaml =3D &quot;f6f7691b1fdeb513f56608cd2c32c51f8194bf51&quot;<br>
-SRCREV_xerrors =3D &quot;65e65417b02f28de84b55f16b46a1e789149973a&quot;<br=
>
-SRCREV_envsubst =3D &quot;16035fe3571ad42c7796bf554f978bb2df64231b&quot;<b=
r>
-SRCREV_participle =3D &quot;49f4822ed012d9818c80ca4fcdeb7e2d55c04806&quot;=
<br>
-SRCREV_utfbom =3D &quot;6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4&quot;<br>
-SRCREV_orderedmap =3D &quot;1e43e194ff533a346bab5f9b66b738256f199c8a&quot;=
<br>
-SRCREV_go-json =3D &quot;5efc7d07eeeba186df630d9ab4ac78c761938c27&quot;<br=
>
-SRCREV_copier =3D &quot;d132b069fe1a77d09e4c260852b389a730bbe9ba&quot;<br>
-SRCREV_properties =3D &quot;c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264&quot;=
<br>
-SRCREV_net =3D &quot;f3363e06e74cdc304618bf31d898b78590103527&quot;<br>
-SRCREV_text =3D &quot;434eadcdbc3b0256971992e8c70027278364c72c&quot;<br>
-SRCREV_diff =3D &quot;20ebb0f2a09e612109b224b32f79370409108bcc&quot;<br>
-<br>
-SRCREV_FORMAT =3D &quot;yq_color&quot;<br>
-SRC_URI =3D &quot;git://${GO_IMPORT};name=3Dyq;branch=3Dmaster;protocol=3D=
https;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/fatih/color;name=3Dcolor;destsuffix=3Dbuild/vendor/src/github.com/fatih/c=
olor;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/fatih/color;name=3Dcolor;destsuffix=3Dbuild/vendor/src/github.com=
/fatih/color;branch=3Dmain;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/goccy/go-yaml;name=3Dlexer;destsuffix=3Dbuild/vendor/src/github.com/goccy=
/go-yaml/;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/goccy/go-yaml;name=3Dlexer;destsuffix=3Dbuild/vendor/src/g=
ithub.com/goccy/go-yaml/;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/spf13/cobra;name=3Dcobra;nobranch=3D1;destsuffix=3Dbuild/vendor/src/githu=
b.com/spf13/cobra;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/spf13/cobra;name=3Dcobra;nobranch=3D1;destsuffix=3Db=
uild/vendor/src/github.com/spf13/cobra;branch=3Dmain;protocol=3Dhttps</a> \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/spf13/pflag;name=3Dpflag;destsuffix=3Dbuild/vendor/src/github.com/spf13/p=
flag;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/spf13/pflag;name=3Dpflag;destsuffix=3Dbuild/vendor/src/github.c=
om/spf13/pflag;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/op/go-logging.git;name=3Dlogging;destsuffix=3Dbuild/vendor/src/gopkg.in/o=
p/go-logging.v1;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/op/go-logging.git;name=3Dlogging;destsuffix=3Dbuild/=
vendor/src/gopkg.in/op/go-logging.v1;branch=3Dmaster;protocol=3Dhttps</a> \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/go-yaml/yaml.git;name=3Dyaml;branch=3Dv3;destsuffix=3Dbuild/vendor/src/go=
pkg.in/yaml.v3;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/go-yaml/yaml.git;name=3Dyaml;branch=3Dv3;destsuffix=3Dbuild/vendor/sr=
c/gopkg.in/yaml.v3;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/golang/xerrors;name=3Dxerrors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
build/vendor/src/golang.org/x/xerrors" rel=3D"noreferrer" target=3D"_blank"=
>github.com/golang/xerrors;name=3Dxerrors;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3Dbuild/vendor/src/golang.org/x/xerrors</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/a8m/envsubst;name=3Denvsubst;destsuffix=3Dbuild/vendor/src/github.com/a8m=
/envsubst;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/a8m/envsubst;name=3Denvsubst;destsuffix=3Dbuild/vendor/src=
/github.com/a8m/envsubst;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/alecthomas/participle;name=3Dparticiple;destsuffix=3Dbuild/vendor/src/git=
hub.com/alecthomas/participle;branch=3Dmaster;protocol=3Dhttps" rel=3D"nore=
ferrer" target=3D"_blank">github.com/alecthomas/participle;name=3Dparticipl=
e;destsuffix=3Dbuild/vendor/src/github.com/alecthomas/participle;branch=3Dm=
aster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/dimchansky/utfbom;name=3Dutfbom;destsuffix=3Dbuild/vendor/src/github.com/=
dimchansky/utfbom;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/dimchansky/utfbom;name=3Dutfbom;destsuffix=3Dbuild=
/vendor/src/github.com/dimchansky/utfbom;branch=3Dmaster;protocol=3Dhttps</=
a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/elliotchance/orderedmap;name=3Dorderedmap;destsuffix=3Dbuild/vendor/src/g=
ithub.com/elliotchance/orderedmap;branch=3Dmaster;protocol=3Dhttps" rel=3D"=
noreferrer" target=3D"_blank">github.com/elliotchance/orderedmap;name=3Dord=
eredmap;destsuffix=3Dbuild/vendor/src/github.com/elliotchance/orderedmap;br=
anch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/goccy/go-json;name=3Dgo-json;destsuffix=3Dbuild/vendor/src/github.com/goc=
cy/go-json;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/goccy/go-json;name=3Dgo-json;destsuffix=3Dbuild/vendor/sr=
c/github.com/goccy/go-json;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/jinzhu/copier;name=3Dcopier;destsuffix=3Dbuild/vendor/src/github.com/jinz=
hu/copier;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/jinzhu/copier;name=3Dcopier;destsuffix=3Dbuild/vendor/src/=
github.com/jinzhu/copier;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/magiconair/properties;name=3Dproperties;destsuffix=3Dbuild/vendor/src/git=
hub.com/magiconair/properties;branch=3Dmain;protocol=3Dhttps" rel=3D"norefe=
rrer" target=3D"_blank">github.com/magiconair/properties;name=3Dproperties;=
destsuffix=3Dbuild/vendor/src/github.com/magiconair/properties;branch=3Dmai=
n;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/golang/net;name=3Dnet;destsuffix=3Dbuild/vendor/src/golang.org/x/net;bran=
ch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/golang/net;name=3Dnet;destsuffix=3Dbuild/vendor/src/golang.org/x/net;bra=
nch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/golang/text;name=3Dtext;destsuffix=3Dbuild/vendor/src/golang.org/x/text;b=
ranch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/golang/text;name=3Dtext;destsuffix=3Dbuild/vendor/src/golang.org/x/te=
xt;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/pkg/diff;name=3Ddiff;destsuffix=3Dbuild/vendor/src/github.com/pkg/diff;br=
anch=3Dmain;protocol=3Dhttps;apply=3Dno" rel=3D"noreferrer" target=3D"_blan=
k">github.com/pkg/diff;name=3Ddiff;destsuffix=3Dbuild/vendor/src/github.com=
/pkg/diff;branch=3Dmain;protocol=3Dhttps;apply=3Dno</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-PV =3D &quot;4.30.8+git${SRCREV_yq}&quot;<br>
-GO_IMPORT =3D &quot;<a href=3D"http://github.com/mikefarah/yq" rel=3D"nore=
ferrer" target=3D"_blank">github.com/mikefarah/yq</a>&quot;<br>
-<br>
-inherit go ptest<br>
-<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 # arrange for some of the golang built ins to be found<br>
-=C2=A0 =C2=A0 (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build/src/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/s=
rc/cmd/vendor/<a href=3D"http://golang.org" rel=3D"noreferrer" target=3D"_b=
lank">golang.org</a> .<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${UNPACKDIR}/build/vendor .<br>
-=C2=A0 =C2=A0 )<br>
-<br>
-=C2=A0 =C2=A0 # arrange for the fetched dependencies to be found<br>
-=C2=A0 =C2=A0 export GOPATH=3D&quot;${GOPATH}:${WORKDIR}/build/vendor/&quo=
t;<br>
-=C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
-}<br>
-<br>
-do_install:append() {<br>
-=C2=A0 =C2=A0 # these bring in dependencies for the -dev package on bash, =
and we don&#39;t<br>
-=C2=A0 =C2=A0 # need them .. so we remove them to avoid needing that rdepe=
nds<br>
-=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules<br>
-=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts<br>
-=C2=A0 =C2=A0 rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests<b=
r>
-}<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/scr=
ipts/*" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq/script=
s/*</a> ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/acc=
eptance_tests/*" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/=
yq/acceptance_tests/*</a> ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -r ${S}/src/<a href=3D"http://github.com/mikefarah/yq/exa=
mples" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq/example=
s</a> ${D}${PTEST_PATH}/tests<br>
-}<br>
-<br>
-RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 bash \<br>
-&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9223): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9223" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9223</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112264276/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112264276/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000001af7440632c30e19--

