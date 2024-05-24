Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8EBC25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:52:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3149.1716576710947622036
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 11:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQBkBnV5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bf59b781d6so1084612a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716576710; x=1717181510; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fK++lDLEda64zOqHYRFcCzF0lsV4YGUdqStiC9STJA=;
        b=VQBkBnV5QhiEX/LPOESUmKaTWoLRdSgpL5ajrhWbW9esNDImazYS8h4g4kR5rPZxPy
         EUhhymA+j+feY04lzt3rSELQCnCfPdXXcJ+l0gKfgB6TmjOZKQlFO5iyEnNbG2C5JocS
         khTbZoQ8vl/H1PquUwMyHKRX0q2clyy0fLuJ7OUeFgZtEoeM/PJguSKVmzqurd/+0Rb2
         8vV1J9HOa+datpKQk2JAqsD9xIIKlcbo4lC1SPk+WpMWZZzyUmQ2TI26/l8W6Swbkrqh
         eo+AiSdEtRqVW6ZMvsURdQVfJHNdB2UpzBPs9COxa8ByxNOZezIrt1BQm2OVGqgvcA4j
         WC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716576710; x=1717181510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fK++lDLEda64zOqHYRFcCzF0lsV4YGUdqStiC9STJA=;
        b=IkuwBCDRT9VKA33msaO/a/AMNyu8pD91e6bCqF/ajQN8uKTBl+NKSrYSz7O+OAz/ON
         ivHWarfRTZreVSZGiqwEQl3HlOhKickXt89PQos9LFue/AXCxOIhu559llyHuDgZ0Xv3
         CRdx+gVR1opSFB2lNXQ0n2Q7Cfk00Au08RyoKSaL0gEySdx6WrlNY/9snOrPhws0Jz2b
         6pBjpEV0cXUAfkplu6ELofU1nqFQowtHdiWtX03AU4iAAxXFYR527sP1myBUIXWZY1PS
         naUSz9uBIFKPjZowxPO/jfLuoChXEsD28PP68+7lwI3XiGWGkYhBpq3Xmg7bPxMleXa0
         XOnQ==
X-Gm-Message-State: AOJu0YyLNJILR9eIfdmOvVyyFEvCR6fz1n/85AV3VnVCiMYyZ3e6yjrq
	qDhhC2euDCzG6JSOV2ByWFUPoZENc91GYuKyzWvEI9gxJqRndu6jyDJ9znSqgskBpvc8Mh0Q4xK
	flM0x8NpGCLg9LT+luct6jUGHaJg=
X-Google-Smtp-Source: AGHT+IGN0f/Sact6oXaRt6Shq7glsIO794XleMd5Whtfc5Vi21IxwA39PVXWjCu1MP14Q4+JS4e6nG5R0mfakOGt52Y=
X-Received: by 2002:a17:90a:cf85:b0:2b3:28df:96b1 with SMTP id
 98e67ed59e1d1-2bf5e139409mr3003487a91.7.1716576709629; Fri, 24 May 2024
 11:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240524062746.232409-1-martin.jansa@gmail.com> <20240524062746.232409-2-martin.jansa@gmail.com>
In-Reply-To: <20240524062746.232409-2-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 May 2024 14:51:38 -0400
Message-ID: <CADkTA4MHBSF5Crmut+U232k2ub7Dk-xGUOdvPwj-nPD9-xb3Qw@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC][PATCH 2/4] docker-compose: use GO_SRCURI_DESTSUFFIX
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 18:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8753

Ack'd. This also makes sense.

I'm adjusting my scripts to update all similar recipes to adapt to the
oe-core changes.

Bruce

On Fri, May 24, 2024 at 2:28=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> * see:
>   https://lists.openembedded.org/g/openembedded-architecture/message/2007
>   https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b6=
57fb4c58429ab14f1edc2473c1327
>
> * the files are now unpacked in different directory and LIC_FILES_CHKSUM
>   doesn't match:
>   Fixes:
>   ERROR: QA Issue: docker-compose: LIC_FILES_CHKSUM points to an invalid =
file:
>   docker-compose/v2.26.0/docker-compose-v2.26.0/src/import/LICENSE [licen=
se-checksum]
>
> * fixes:
>   http://errors.yoctoproject.org/Errors/Details/772692/
>   ERROR: QA Issue: docker-compose: LIC_FILES_CHKSUM points to an invalid =
file: TOPDIR/tmp-glibc/work/core2-64-oe-linux/docker-compose/v2.26.0/docker=
-compose-v2.26.0/src/import/LICENSE [license-checksum]
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../docker-compose/docker-compose_git.bb      |   2 +-
>  recipes-containers/docker-compose/src_uri.inc | 372 +++++++++---------
>  2 files changed, 187 insertions(+), 187 deletions(-)
>
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/re=
cipes-containers/docker-compose/docker-compose_git.bb
> index 07650126..326d23d9 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D " \
>  SRCREV_FORMAT=3D"compose_survey"
>  SRCREV_compose =3D "3371227794f5f3645f4f19829c60a741635ed329"
>
> -SRC_URI =3D "git://github.com/docker/compose;name=3Dcompose;branch=3Dmai=
n;protocol=3Dhttps"
> +SRC_URI =3D "git://github.com/docker/compose;name=3Dcompose;branch=3Dmai=
n;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
>
>  include src_uri.inc
>
> diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-cont=
ainers/docker-compose/src_uri.inc
> index 1978abc7..8327cb0e 100644
> --- a/recipes-containers/docker-compose/src_uri.inc
> +++ b/recipes-containers/docker-compose/src_uri.inc
> @@ -1,930 +1,930 @@
>  #       k8s.io/api v0.29.2
>  # [1] git ls-remote https://github.com/kubernetes/api d47313059888ec984b=
f8432ed155fae5be935c31
>  SRCREV_k8s.io-api=3D"d47313059888ec984bf8432ed155fae5be935c31"
> -SRC_URI +=3D "git://github.com/kubernetes/api;name=3Dk8s.io-api;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/k8s.io/api"
> +SRC_URI +=3D "git://github.com/kubernetes/api;name=3Dk8s.io-api;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s=
.io/api"
>
>  #       k8s.io/utils v0.0.0-20230726121419-3b25d923346b
>  # [1] git ls-remote https://github.com/kubernetes/utils 3b25d923346b3814=
e0898684c97390092f31a61e
>  SRCREV_utils=3D"3b25d923346b3814e0898684c97390092f31a61e"
> -SRC_URI +=3D "git://github.com/kubernetes/utils;name=3Dutils;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/k8=
s.io/utils"
> +SRC_URI +=3D "git://github.com/kubernetes/utils;name=3Dutils;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io=
/utils"
>
>  #       k8s.io/klog/v2 v2.110.1
>  # [1] git ls-remote https://github.com/kubernetes/klog e3f75b8af2707d64b=
5dd4c440ae8384ed2f2c386
>  SRCREV_klog-v2=3D"e3f75b8af2707d64b5dd4c440ae8384ed2f2c386"
> -SRC_URI +=3D "git://github.com/kubernetes/klog;name=3Dklog-v2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/k8s.io/klog/v2"
> +SRC_URI +=3D "git://github.com/kubernetes/klog;name=3Dklog-v2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s=
.io/klog/v2"
>
>  #       gotest.tools/v3 v3.5.1
>  # [1] git ls-remote https://github.com/gotestyourself/gotest.tools 81cea=
1abc596b025bf2573c7fdf97740512e4c6c
>  SRCREV_v3=3D"81cea1abc596b025bf2573c7fdf97740512e4c6c"
> -SRC_URI +=3D "git://github.com/gotestyourself/gotest.tools;name=3Dv3;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/gotest.tools/v3"
> +SRC_URI +=3D "git://github.com/gotestyourself/gotest.tools;name=3Dv3;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetc=
h/gotest.tools/v3"
>
>  #       dario.cat/mergo v1.0.0
>  # [1] git ls-remote https://github.com/imdario/mergo 131de815afc35a77c41=
ae99da6c8f4288b6cb513
>  SRCREV_mergo=3D"131de815afc35a77c41ae99da6c8f4288b6cb513"
> -SRC_URI +=3D "git://github.com/imdario/mergo;name=3Dmergo;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/dario=
.cat/mergo"
> +SRC_URI +=3D "git://github.com/imdario/mergo;name=3Dmergo;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/dario.cat=
/mergo"
>
>  #       gopkg.in/inf.v0 v0.9.1
>  # [1] git ls-remote https://github.com/go-inf/inf d2d2541c53f18d2a059457=
998ce2876cc8e67cbf
>  SRCREV_inf.v0=3D"d2d2541c53f18d2a059457998ce2876cc8e67cbf"
> -SRC_URI +=3D "git://github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.i=
n/inf.v0"
> +SRC_URI +=3D "git://github.com/go-inf/inf;name=3Dinf.v0;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/in=
f.v0"
>
>  #       go.uber.org/mock v0.4.0
>  # [1] git ls-remote https://github.com/uber/mock 74a29c6e6c2cbb8ccee94db=
061c1604ff33fd188
>  SRCREV_mock=3D"74a29c6e6c2cbb8ccee94db061c1604ff33fd188"
> -SRC_URI +=3D "git://github.com/uber/mock;name=3Dmock;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.or=
g/mock"
> +SRC_URI +=3D "git://github.com/uber/mock;name=3Dmock;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/mo=
ck"
>
>  #       golang.org/x/exp v0.0.0-20240112132812-db7319d0e0e3
>  # [1] git ls-remote https://go.googlesource.com/exp db7319d0e0e361ccef5c=
449b760df8e5f2d5087c
>  SRCREV_exp=3D"db7319d0e0e361ccef5c449b760df8e5f2d5087c"
> -SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.o=
rg/x/exp"
> +SRC_URI +=3D "git://go.googlesource.com/exp;name=3Dexp;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x=
/exp"
>
>  #       golang.org/x/sys v0.16.0
>  # [1] git ls-remote https://go.googlesource.com/sys 0829ab15b6946f47c400=
12db2e0c04772730317d
>  SRCREV_sys=3D"0829ab15b6946f47c40012db2e0c04772730317d"
> -SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.o=
rg/x/sys"
> +SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x=
/sys"
>
>  #       gopkg.in/yaml.v3 v3.0.1
>  # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f566=
08cd2c32c51f8194bf51
>  SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> -SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopk=
g.in/yaml.v3"
> +SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v3;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in=
/yaml.v3"
>
>  #       golang.org/x/mod v0.14.0
>  # [1] git ls-remote https://go.googlesource.com/mod 6e58e47c7bd6672665dc=
35cce7b1f325d2addd67
>  SRCREV_mod=3D"6e58e47c7bd6672665dc35cce7b1f325d2addd67"
> -SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.o=
rg/x/mod"
> +SRC_URI +=3D "git://go.googlesource.com/mod;name=3Dmod;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x=
/mod"
>
>  #       golang.org/x/net v0.20.0
>  # [1] git ls-remote https://go.googlesource.com/net cb5b10f0bbc51089bf49=
030ce3bd43bbfee08c23
>  SRCREV_net=3D"cb5b10f0bbc51089bf49030ce3bd43bbfee08c23"
> -SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang.o=
rg/x/net"
> +SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x=
/net"
>
>  #       gopkg.in/yaml.v2 v2.4.0
>  # [1] git ls-remote https://github.com/go-yaml/yaml 7649d4548cb53a614db1=
33b2a8ac1f31859dda8c
>  SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> -SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopk=
g.in/yaml.v2"
> +SRC_URI +=3D "git://github.com/go-yaml/yaml;name=3Dyaml.v2;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in=
/yaml.v2"
>
>  #       k8s.io/apiserver v0.29.2
>  # [1] git ls-remote https://github.com/kubernetes/apiserver 4c39f36a732c=
fb11f3fc75110c7301336b6b64e3
>  SRCREV_apiserver=3D"4c39f36a732cfb11f3fc75110c7301336b6b64e3"
> -SRC_URI +=3D "git://github.com/kubernetes/apiserver;name=3Dapiserver;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/k8s.io/apiserver"
> +SRC_URI +=3D "git://github.com/kubernetes/apiserver;name=3Dapiserver;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetc=
h/k8s.io/apiserver"
>
>  #       k8s.io/client-go v0.29.2
>  # [1] git ls-remote https://github.com/kubernetes/client-go 62c5e9e7b4bd=
09d2b43dcad1464376322398e994
>  SRCREV_client-go=3D"62c5e9e7b4bd09d2b43dcad1464376322398e994"
> -SRC_URI +=3D "git://github.com/kubernetes/client-go;name=3Dclient-go;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/k8s.io/client-go"
> +SRC_URI +=3D "git://github.com/kubernetes/client-go;name=3Dclient-go;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetc=
h/k8s.io/client-go"
>
>  #       sigs.k8s.io/json v0.0.0-20221116044647-bc3834ca7abd
>  # [1] git ls-remote https://github.com/kubernetes-sigs/json bc3834ca7abd=
3a90f03ef00a27ad80cb892f9c21
>  SRCREV_json=3D"bc3834ca7abd3a90f03ef00a27ad80cb892f9c21"
> -SRC_URI +=3D "git://github.com/kubernetes-sigs/json;name=3Djson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/sigs.k8s.io/json"
> +SRC_URI +=3D "git://github.com/kubernetes-sigs/json;name=3Djson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sig=
s.k8s.io/json"
>
>  #       sigs.k8s.io/yaml v1.3.0
>  # [1] git ls-remote https://github.com/kubernetes-sigs/yaml 9535b3b1e289=
3fe44efb37c5c9f5665e245d786a
>  SRCREV_yaml=3D"9535b3b1e2893fe44efb37c5c9f5665e245d786a"
> -SRC_URI +=3D "git://github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/sigs.k8s.io/yaml"
> +SRC_URI +=3D "git://github.com/kubernetes-sigs/yaml;name=3Dyaml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sig=
s.k8s.io/yaml"
>
>  #       golang.org/x/sync v0.6.0
>  # [1] git ls-remote https://go.googlesource.com/sync 59c1ca1e4661ed4452b=
e4069ceea3c233f4deec1
>  SRCREV_sync=3D"59c1ca1e4661ed4452be4069ceea3c233f4deec1"
> -SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang=
.org/x/sync"
> +SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org=
/x/sync"
>
>  #       golang.org/x/term v0.16.0
>  # [1] git ls-remote https://go.googlesource.com/term ae941452f58ff9bf62f=
7e9dca3ea6ae3d214a68b
>  SRCREV_x-term=3D"ae941452f58ff9bf62f7e9dca3ea6ae3d214a68b"
> -SRC_URI +=3D "git://go.googlesource.com/term;name=3Dx-term;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gola=
ng.org/x/term"
> +SRC_URI +=3D "git://go.googlesource.com/term;name=3Dx-term;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.o=
rg/x/term"
>
>  #       golang.org/x/text v0.14.0
>  # [1] git ls-remote https://go.googlesource.com/text 6c97a165dd661335ff7=
bce6104a008558123c353
>  SRCREV_text=3D"6c97a165dd661335ff7bce6104a008558123c353"
> -SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang=
.org/x/text"
> +SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org=
/x/text"
>
>  #       golang.org/x/time v0.3.0
>  # [1] git ls-remote https://go.googlesource.com/time 2c09566ef13fb555640=
1ddff3c53c3dbc2a42dac
>  SRCREV_time=3D"2c09566ef13fb5556401ddff3c53c3dbc2a42dac"
> -SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/golang=
.org/x/time"
> +SRC_URI +=3D "git://go.googlesource.com/time;name=3Dtime;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org=
/x/time"
>
>  #       go.uber.org/goleak v1.3.0
>  # [1] git ls-remote https://github.com/uber-go/goleak 31095c657c34bba405=
a8d480db27989aa5f60b9c
>  SRCREV_goleak=3D"31095c657c34bba405a8d480db27989aa5f60b9c"
> -SRC_URI +=3D "git://github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
uber.org/goleak"
> +SRC_URI +=3D "git://github.com/uber-go/goleak;name=3Dgoleak;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber=
.org/goleak"
>
>  #       golang.org/x/tools v0.17.0
>  # [1] git ls-remote https://go.googlesource.com/tools 0b1f1d4bc227cc2e61=
0854f23e14696becb9e46c
>  SRCREV_tools=3D"0b1f1d4bc227cc2e610854f23e14696becb9e46c"
> -SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gola=
ng.org/x/tools"
> +SRC_URI +=3D "git://go.googlesource.com/tools;name=3Dtools;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.o=
rg/x/tools"
>
>  #       golang.org/x/crypto v0.18.0
>  # [1] git ls-remote https://go.googlesource.com/crypto dbb6ec16ecef7a666=
38d8514be54b13660551b0a
>  SRCREV_crypto=3D"dbb6ec16ecef7a66638d8514be54b13660551b0a"
> -SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
lang.org/x/crypto"
> +SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang=
.org/x/crypto"
>
>  #       golang.org/x/oauth2 v0.11.0
>  # [1] git ls-remote https://go.googlesource.com/oauth2 2e4a4e2bfb69ca760=
9cb423438c55caa131431c1
>  SRCREV_oauth2=3D"2e4a4e2bfb69ca7609cb423438c55caa131431c1"
> -SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
lang.org/x/oauth2"
> +SRC_URI +=3D "git://go.googlesource.com/oauth2;name=3Doauth2;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang=
.org/x/oauth2"
>
>  #       k8s.io/apimachinery v0.29.2
>  # [1] git ls-remote https://github.com/kubernetes/apimachinery dc7e034c8=
6479d49be4b0eefad307621e10caa0e
>  SRCREV_apimachinery=3D"dc7e034c86479d49be4b0eefad307621e10caa0e"
> -SRC_URI +=3D "git://github.com/kubernetes/apimachinery;name=3Dapimachine=
ry;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/k8s.io/apimachinery"
> +SRC_URI +=3D "git://github.com/kubernetes/apimachinery;name=3Dapimachine=
ry;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/k8s.io/apimachinery"
>
>  #       k8s.io/kube-openapi v0.0.0-20231010175941-2dd684a91f00
>  # [1] git ls-remote https://github.com/kubernetes/kube-openapi 2dd684a91=
f00351087fe2f4ed5408d4d2f3775ab
>  SRCREV_kube-openapi=3D"2dd684a91f00351087fe2f4ed5408d4d2f3775ab"
> -SRC_URI +=3D "git://github.com/kubernetes/kube-openapi;name=3Dkube-opena=
pi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/k8s.io/kube-openapi"
> +SRC_URI +=3D "git://github.com/kubernetes/kube-openapi;name=3Dkube-opena=
pi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/k8s.io/kube-openapi"
>
>  #       github.com/moby/term v0.5.0
>  # [1] git ls-remote https://github.com/moby/term 9c3c875fad924eb6c9dd32a=
361b5fc0a49a4feb9
>  SRCREV_term=3D"9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9"
> -SRC_URI +=3D "git://github.com/moby/term;name=3Dterm;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/moby/term"
> +SRC_URI +=3D "git://github.com/moby/term;name=3Dterm;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mob=
y/term"
>
>  #       github.com/docker/go v1.5.1-1.0.20160303222718-d30aec9fd63c
>  # [1] git ls-remote https://github.com/docker/go d30aec9fd63c35133f8f79c=
3412ad91a3b08be06
>  SRCREV_go=3D"d30aec9fd63c35133f8f79c3412ad91a3b08be06"
> -SRC_URI +=3D "git://github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/d=
ocker/go"
> +SRC_URI +=3D "git://github.com/docker/go;name=3Dgo;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docke=
r/go"
>
>  #       github.com/docker/cli v26.0.0+incompatible
>  # [1] git ls-remote https://github.com/docker/cli 2ae903e86cab51f694c819=
721cdfdf5eec693720
>  SRCREV_cli=3D"2ae903e86cab51f694c819721cdfdf5eec693720"
> -SRC_URI +=3D "git://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/docker/cli"
> +SRC_URI +=3D "git://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/doc=
ker/cli"
>
>  #       github.com/r3labs/sse v0.0.0-20210224172625-26fe804710bc
>  # [1] git ls-remote https://github.com/r3labs/sse 26fe804710bc39ea7ea663=
6d36f27c438bd2c06f
>  SRCREV_sse=3D"26fe804710bc39ea7ea6636d36f27c438bd2c06f"
> -SRC_URI +=3D "git://github.com/r3labs/sse;name=3Dsse;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/r3labs/sse"
> +SRC_URI +=3D "git://github.com/r3labs/sse;name=3Dsse;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/r3l=
abs/sse"
>
>  #       github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
>  # [1] git ls-remote https://github.com/mgutz/ansi 9520e82c474b0a04dd04f8=
a40959027271bab992
>  SRCREV_ansi=3D"9520e82c474b0a04dd04f8a40959027271bab992"
> -SRC_URI +=3D "git://github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/mgutz/ansi"
> +SRC_URI +=3D "git://github.com/mgutz/ansi;name=3Dansi;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mg=
utz/ansi"
>
>  #       github.com/pkg/errors v0.9.1
>  # [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c176=
7a985424175c39b465
>  SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> -SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/pkg/errors"
> +SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
pkg/errors"
>
>  #       github.com/spf13/cobra v1.8.0
>  # [1] git ls-remote https://github.com/spf13/cobra a0a6ae020bb3899ff0276=
067863e50523f897370
>  SRCREV_cobra=3D"a0a6ae020bb3899ff0276067863e50523f897370"
> -SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/spf13/cobra"
> +SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
spf13/cobra"
>
>  #       github.com/spf13/pflag v1.0.5
>  # [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d=
4e90b7116f5accb7cab
>  SRCREV_pflag=3D"2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
> -SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/spf13/pflag"
> +SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpflag;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
spf13/pflag"
>
>  #       google.golang.org/grpc v1.59.0
>  # [1] git ls-remote https://github.com/grpc/grpc-go 7765221f4bf6104973db=
7946d56936cf838cad46
>  SRCREV_grpc=3D"7765221f4bf6104973db7946d56936cf838cad46"
> -SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.=
golang.org/grpc"
> +SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.gola=
ng.org/grpc"
>
>  #       github.com/gofrs/flock v0.8.1
>  # [1] git ls-remote https://github.com/gofrs/flock 6f010d1acea74a32f2f20=
66bfe324c08bbee30e3
>  SRCREV_flock=3D"6f010d1acea74a32f2f2066bfe324c08bbee30e3"
> -SRC_URI +=3D "git://github.com/gofrs/flock;name=3Dflock;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/gofrs/flock"
> +SRC_URI +=3D "git://github.com/gofrs/flock;name=3Dflock;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
gofrs/flock"
>
>  #       github.com/google/uuid v1.6.0
>  # [1] git ls-remote https://github.com/google/uuid 0f11ee6918f41a04c201e=
ceeadf612a377bc7fbc
>  SRCREV_uuid=3D"0f11ee6918f41a04c201eceeadf612a377bc7fbc"
> -SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/google/uuid"
> +SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/g=
oogle/uuid"
>
>  #       github.com/gorilla/mux v1.8.1
>  # [1] git ls-remote https://github.com/gorilla/mux b4617d0b9670ad14039b2=
739167fd35a60f557c5
>  SRCREV_mux=3D"b4617d0b9670ad14039b2739167fd35a60f557c5"
> -SRC_URI +=3D "git://github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/gorilla/mux"
> +SRC_URI +=3D "git://github.com/gorilla/mux;name=3Dmux;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go=
rilla/mux"
>
>  #       github.com/moby/locker v1.0.1
>  # [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d=
1487c965f24d30742fe
>  SRCREV_locker=3D"281af2d563954745bea9d1487c965f24d30742fe"
> -SRC_URI +=3D "git://github.com/moby/locker;name=3Dlocker;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/moby/locker"
> +SRC_URI +=3D "git://github.com/moby/locker;name=3Dlocker;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/moby/locker"
>
>  #       github.com/rivo/uniseg v0.2.0
>  # [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c2=
41e2dddd06a9bc9e53d
>  SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
> -SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/rivo/uniseg"
> +SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/rivo/uniseg"
>
>  #       github.com/buger/goterm v1.0.4
>  # [1] git ls-remote https://github.com/buger/goterm a73545aae7d693f786ce=
4cc687460efca4845f31
>  SRCREV_goterm=3D"a73545aae7d693f786ce4cc687460efca4845f31"
> -SRC_URI +=3D "git://github.com/buger/goterm;name=3Dgoterm;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/buger/goterm"
> +SRC_URI +=3D "git://github.com/buger/goterm;name=3Dgoterm;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.co=
m/buger/goterm"
>
>  #       github.com/morikuni/aec v1.0.0
>  # [1] git ls-remote https://github.com/morikuni/aec 39771216ff4c63d11f5e=
604076f9c45e8be1067b
>  SRCREV_aec=3D"39771216ff4c63d11f5e604076f9c45e8be1067b"
> -SRC_URI +=3D "git://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/morikuni/aec"
> +SRC_URI +=3D "git://github.com/morikuni/aec;name=3Daec;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/m=
orikuni/aec"
>
>  #       github.com/otiai10/copy v1.14.0
>  # [1] git ls-remote https://github.com/otiai10/copy fba066acb0eb6e25d510=
073787741c0a8b31bf1e
>  SRCREV_copy=3D"fba066acb0eb6e25d510073787741c0a8b31bf1e"
> -SRC_URI +=3D "git://github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/otiai10/copy"
> +SRC_URI +=3D "git://github.com/otiai10/copy;name=3Dcopy;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
otiai10/copy"
>
>  #       github.com/beorn7/perks v1.0.1
>  # [1] git ls-remote https://github.com/beorn7/perks 37c8de3658fcb183f997=
c4e13e8337516ab753e6
>  SRCREV_perks=3D"37c8de3658fcb183f997c4e13e8337516ab753e6"
> -SRC_URI +=3D "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/beorn7/perks"
> +SRC_URI +=3D "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/beorn7/perks"
>
>  #       github.com/go-logr/logr v1.3.0
>  # [1] git ls-remote https://github.com/go-logr/logr 8adefbede0fe82bdee4f=
b8c9c9bdc7bc5d91388f
>  SRCREV_logr=3D"8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f"
> -SRC_URI +=3D "git://github.com/go-logr/logr;name=3Dlogr;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/go-logr/logr"
> +SRC_URI +=3D "git://github.com/go-logr/logr;name=3Dlogr;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
go-logr/logr"
>
>  #       github.com/go-logr/stdr v1.2.2
>  # [1] git ls-remote https://github.com/go-logr/stdr 521af2addfa7c81c8a65=
d0e85ed34bb6bb6dc262
>  SRCREV_stdr=3D"521af2addfa7c81c8a65d0e85ed34bb6bb6dc262"
> -SRC_URI +=3D "git://github.com/go-logr/stdr;name=3Dstdr;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/go-logr/stdr"
> +SRC_URI +=3D "git://github.com/go-logr/stdr;name=3Dstdr;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/=
go-logr/stdr"
>
>  #       github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
>  # [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e94=
68cdfd1efcd7d196cd1d
>  SRCREV_shlex=3D"e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
> -SRC_URI +=3D "git://github.com/google/shlex;name=3Dshlex;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/google/shlex"
> +SRC_URI +=3D "git://github.com/google/shlex;name=3Dshlex;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/google/shlex"
>
>  #       github.com/miekg/pkcs11 v1.1.1
>  # [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa9=
95a41f92d786eb418a7d
>  SRCREV_pkcs11=3D"f3481918a208bd212aa995a41f92d786eb418a7d"
> -SRC_URI +=3D "git://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/miekg/pkcs11"
> +SRC_URI +=3D "git://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.co=
m/miekg/pkcs11"
>
>  #       github.com/docker/buildx v0.13.1
>  # [1] git ls-remote https://github.com/docker/buildx 788433953af10f2a698=
f5c07611dddce2e08c7a0
>  SRCREV_buildx=3D"788433953af10f2a698f5c07611dddce2e08c7a0"
> -SRC_URI +=3D "git://github.com/docker/buildx;name=3Dbuildx;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/docker/buildx"
> +SRC_URI +=3D "git://github.com/docker/buildx;name=3Dbuildx;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.c=
om/docker/buildx"
>
>  #       github.com/docker/docker v26.0.0+incompatible
>  # [1] git ls-remote https://github.com/moby/moby 8b79278316b532d396048bc=
8c2fa015a85d53a53
>  SRCREV_docker=3D"8b79278316b532d396048bc8c2fa015a85d53a53"
> -SRC_URI +=3D "git://github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/docker/docker"
> +SRC_URI +=3D "git://github.com/moby/moby;name=3Ddocker;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/d=
ocker/docker"
>
>  #       github.com/google/go-cmp v0.6.0
>  # [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af35=
732bc0789e5a2278c6d5f
>  SRCREV_go-cmp=3D"c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
> -SRC_URI +=3D "git://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/google/go-cmp"
> +SRC_URI +=3D "git://github.com/google/go-cmp;name=3Dgo-cmp;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.c=
om/google/go-cmp"
>
>  #       github.com/moby/buildkit v0.13.1
>  # [1] git ls-remote https://github.com/moby/buildkit 2ae42e0c0c793d7d66b=
7a23424af6fd6c2f9c8f3
>  SRCREV_buildkit=3D"2ae42e0c0c793d7d66b7a23424af6fd6c2f9c8f3"
> -SRC_URI +=3D "git://github.com/moby/buildkit;name=3Dbuildkit;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/moby/buildkit"
> +SRC_URI +=3D "git://github.com/moby/buildkit;name=3Dbuildkit;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/moby/buildkit"
>
>  #       go.opentelemetry.io/otel v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_otel=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
el;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/go.opentelemetry.io/otel"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
el;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/go.opentelemetry.io/otel"
>
>  #       github.com/aws/smithy-go v1.19.0
>  # [1] git ls-remote https://github.com/aws/smithy-go f982aed889669e4bc6f=
1cd03f56697f1b27964a4
>  SRCREV_smithy-go=3D"f982aed889669e4bc6f1cd03f56697f1b27964a4"
> -SRC_URI +=3D "git://github.com/aws/smithy-go;name=3Dsmithy-go;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/aws/smithy-go"
> +SRC_URI +=3D "git://github.com/aws/smithy-go;name=3Dsmithy-go;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/aws/smithy-go"
>
>  #       github.com/gogo/protobuf v1.3.2
>  # [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ed=
e29f62fe3ce239267c1bc
>  SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
> -SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/gogo/protobuf"
> +SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/gogo/protobuf"
>
>  #       github.com/google/gofuzz v1.2.0
>  # [1] git ls-remote https://github.com/google/gofuzz 379e164120fbc98885a=
8f494b5aa41ba94f64c56
>  SRCREV_gofuzz=3D"379e164120fbc98885a8f494b5aa41ba94f64c56"
> -SRC_URI +=3D "git://github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/google/gofuzz"
> +SRC_URI +=3D "git://github.com/google/gofuzz;name=3Dgofuzz;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.c=
om/google/gofuzz"
>
>  #       github.com/imdario/mergo v0.3.16
>  # [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196f=
820886a2b24f2771729e9
>  SRCREV_imdario-mergo=3D"14fe2b165b83359196f820886a2b24f2771729e9"
> -SRC_URI +=3D "git://github.com/darccio/mergo;name=3Dimdario-mergo;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/imdario/mergo"
> +SRC_URI +=3D "git://github.com/darccio/mergo;name=3Dimdario-mergo;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/imdario/mergo"
>
>  #       github.com/moby/sys/user v0.1.0
>  # [1] git ls-remote https://github.com/moby/sys c0711cde08c8fa33857a2c28=
721659267f49b5e2
>  SRCREV_user=3D"c0711cde08c8fa33857a2c28721659267f49b5e2"
> -SRC_URI +=3D "git://github.com/moby/sys;name=3Duser;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
moby/sys/user"
> +SRC_URI +=3D "git://github.com/moby/sys;name=3Duser;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby=
/sys/user"
>
>  #       github.com/containerd/log v0.1.0
>  # [1] git ls-remote https://github.com/containerd/log 0fc1e28871fdf2786e=
2cc51bbe4133db6547a199
>  SRCREV_log=3D"0fc1e28871fdf2786e2cc51bbe4133db6547a199"
> -SRC_URI +=3D "git://github.com/containerd/log;name=3Dlog;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/containerd/log"
> +SRC_URI +=3D "git://github.com/containerd/log;name=3Dlog;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/containerd/log"
>
>  #       github.com/davecgh/go-spew v1.1.1
>  # [1] git ls-remote https://github.com/davecgh/go-spew 8991bc29aa16c548c=
550c7ff78260e27b9ab7c73
>  SRCREV_go-spew=3D"8991bc29aa16c548c550c7ff78260e27b9ab7c73"
> -SRC_URI +=3D "git://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/davecgh/go-spew"
> +SRC_URI +=3D "git://github.com/davecgh/go-spew;name=3Dgo-spew;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/davecgh/go-spew"
>
>  #       github.com/docker/go-units v0.5.0
>  # [1] git ls-remote https://github.com/docker/go-units e682442797b36348f=
8e1f98defdbf32bac0b6c6f
>  SRCREV_go-units=3D"e682442797b36348f8e1f98defdbf32bac0b6c6f"
> -SRC_URI +=3D "git://github.com/docker/go-units;name=3Dgo-units;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/docker/go-units"
> +SRC_URI +=3D "git://github.com/docker/go-units;name=3Dgo-units;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/docker/go-units"
>
>  #       github.com/mitchellh/go-ps v1.0.0
>  # [1] git ls-remote https://github.com/mitchellh/go-ps 147ff83818ae93991=
3b2e20b91ae3cd6c391771c
>  SRCREV_go-ps=3D"147ff83818ae939913b2e20b91ae3cd6c391771c"
> -SRC_URI +=3D "git://github.com/mitchellh/go-ps;name=3Dgo-ps;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/mitchellh/go-ps"
> +SRC_URI +=3D "git://github.com/mitchellh/go-ps;name=3Dgo-ps;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/mitchellh/go-ps"
>
>  #       github.com/sirupsen/logrus v1.9.3
>  # [1] git ls-remote https://github.com/sirupsen/logrus d40e25cd45ed9c6b2=
b66e6b97573a0413e4c23bd
>  SRCREV_logrus=3D"d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
> -SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/sirupsen/logrus"
> +SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/sirupsen/logrus"
>
>  #       github.com/go-openapi/swag v0.22.3
>  # [1] git ls-remote https://github.com/go-openapi/swag 0579829e66fde26b2=
7d401921afb73704c4d463d
>  SRCREV_swag=3D"0579829e66fde26b27d401921afb73704c4d463d"
> -SRC_URI +=3D "git://github.com/go-openapi/swag;name=3Dswag;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/go-openapi/swag"
> +SRC_URI +=3D "git://github.com/go-openapi/swag;name=3Dswag;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.c=
om/go-openapi/swag"
>
>  #       github.com/gogo/googleapis v1.4.1
>  # [1] git ls-remote https://github.com/gogo/googleapis 1f0e43f50bc0606e3=
85ffae1bc80b5b231dcd042
>  SRCREV_googleapis=3D"1f0e43f50bc0606e385ffae1bc80b5b231dcd042"
> -SRC_URI +=3D "git://github.com/gogo/googleapis;name=3Dgoogleapis;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/gogo/googleapis"
> +SRC_URI +=3D "git://github.com/gogo/googleapis;name=3Dgoogleapis;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/gogo/googleapis"
>
>  #       github.com/golang/protobuf v1.5.3
>  # [1] git ls-remote https://github.com/golang/protobuf 5d5e8c018a13017f9=
d5b8bf4fad64aaa42a87308
>  SRCREV_golang-protobuf=3D"5d5e8c018a13017f9d5b8bf4fad64aaa42a87308"
> -SRC_URI +=3D "git://github.com/golang/protobuf;name=3Dgolang-protobuf;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/golang/protobuf"
> +SRC_URI +=3D "git://github.com/golang/protobuf;name=3Dgolang-protobuf;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/golang/protobuf"
>
>  #       github.com/mailru/easyjson v0.7.7
>  # [1] git ls-remote https://github.com/mailru/easyjson c120ca7ced6051261=
161ce15e8f1542a4b2567fc
>  SRCREV_easyjson=3D"c120ca7ced6051261161ce15e8f1542a4b2567fc"
> -SRC_URI +=3D "git://github.com/mailru/easyjson;name=3Deasyjson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/mailru/easyjson"
> +SRC_URI +=3D "git://github.com/mailru/easyjson;name=3Deasyjson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/mailru/easyjson"
>
>  #       github.com/mattn/go-isatty v0.0.17
>  # [1] git ls-remote https://github.com/mattn/go-isatty ed75e619dc0f0489f=
d4062163a7d061eaa249b9c
>  SRCREV_go-isatty=3D"ed75e619dc0f0489fd4062163a7d061eaa249b9c"
> -SRC_URI +=3D "git://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/mattn/go-isatty"
> +SRC_URI +=3D "git://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/mattn/go-isatty"
>
>  #       github.com/moby/spdystream v0.2.0
>  # [1] git ls-remote https://github.com/moby/spdystream dbc715126c0e3fa07=
721879c6d265b2b82c71e5b
>  SRCREV_spdystream=3D"dbc715126c0e3fa07721879c6d265b2b82c71e5b"
> -SRC_URI +=3D "git://github.com/moby/spdystream;name=3Dspdystream;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/moby/spdystream"
> +SRC_URI +=3D "git://github.com/moby/spdystream;name=3Dspdystream;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/moby/spdystream"
>
>  #       github.com/moby/sys/signal v0.7.0
>  # [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a172=
9145eee854ea31f5
>  SRCREV_signal=3D"b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
> -SRC_URI +=3D "git://github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/moby/sys/signal"
> +SRC_URI +=3D "git://github.com/moby/sys;name=3Dsignal;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mo=
by/sys/signal"
>
>  #       github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f
>  # [1] git ls-remote https://github.com/mxk/go-flowrate cca7078d478f8520f=
85629ad7c68962d31ed7682
>  SRCREV_go-flowrate=3D"cca7078d478f8520f85629ad7c68962d31ed7682"
> -SRC_URI +=3D "git://github.com/mxk/go-flowrate;name=3Dgo-flowrate;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/mxk/go-flowrate"
> +SRC_URI +=3D "git://github.com/mxk/go-flowrate;name=3Dgo-flowrate;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/mxk/go-flowrate"
>
>  #       google.golang.org/genproto v0.0.0-20231016165738-49dd2c1f3d0b
>  # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d=
0bf0f025ccaf8eeaaad902e3c63846
>  SRCREV_genproto=3D"49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
> -SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/google.golang.org/genproto"
> +SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/google.golang.org/genproto"
>
>  #       google.golang.org/protobuf v1.31.0
>  # [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 68463=
f0e96c93bc19ef36ccd3adfe690bfdb568c
>  SRCREV_google.golang.org-protobuf=3D"68463f0e96c93bc19ef36ccd3adfe690bfd=
b568c"
> -SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dgoogle=
.golang.org-protobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/=
${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
> +SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dgoogle=
.golang.org-protobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI=
_DESTSUFFIX}/vendor.fetch/google.golang.org/protobuf"
>
>  #       github.com/stretchr/testify v1.8.4
>  # [1] git ls-remote https://github.com/stretchr/testify f97607b89807936a=
c4ff96748d766cf4b9711f78
>  SRCREV_testify=3D"f97607b89807936ac4ff96748d766cf4b9711f78"
> -SRC_URI +=3D "git://github.com/stretchr/testify;name=3Dtestify;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/stretchr/testify"
> +SRC_URI +=3D "git://github.com/stretchr/testify;name=3Dtestify;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/stretchr/testify"
>
>  #       github.com/containerd/ttrpc v1.2.2
>  # [1] git ls-remote https://github.com/containerd/ttrpc ac26f8cbea1c440d=
451dd19a4a1b847fd073f3c3
>  SRCREV_ttrpc=3D"ac26f8cbea1c440d451dd19a4a1b847fd073f3c3"
> -SRC_URI +=3D "git://github.com/containerd/ttrpc;name=3Dttrpc;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/containerd/ttrpc"
> +SRC_URI +=3D "git://github.com/containerd/ttrpc;name=3Dttrpc;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/containerd/ttrpc"
>
>  #       github.com/josharian/intern v1.0.0
>  # [1] git ls-remote https://github.com/josharian/intern 8e6ff32b3e7c0b01=
8c43953085fe2ac330fe9acd
>  SRCREV_intern=3D"8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
> -SRC_URI +=3D "git://github.com/josharian/intern;name=3Dintern;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/josharian/intern"
> +SRC_URI +=3D "git://github.com/josharian/intern;name=3Dintern;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/josharian/intern"
>
>  #       github.com/json-iterator/go v1.1.12
>  # [1] git ls-remote https://github.com/json-iterator/go 024077e996b04851=
7130b21ea6bf12aa23055d3d
>  SRCREV_json-iterator-go=3D"024077e996b048517130b21ea6bf12aa23055d3d"
> -SRC_URI +=3D "git://github.com/json-iterator/go;name=3Djson-iterator-go;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/json-iterator/go"
> +SRC_URI +=3D "git://github.com/json-iterator/go;name=3Djson-iterator-go;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/json-iterator/go"
>
>  #       github.com/moby/sys/symlink v0.2.0
>  # [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a226410=
5f4903a222aea964
>  SRCREV_symlink=3D"03b9f8d59a07f5206a2264105f4903a222aea964"
> -SRC_URI +=3D "git://github.com/moby/sys;name=3Dsymlink;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/moby/sys/symlink"
> +SRC_URI +=3D "git://github.com/moby/sys;name=3Dsymlink;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/m=
oby/sys/symlink"
>
>  #       github.com/serialx/hashring v0.0.0-20200727003509-22c0c7ab6b1b
>  # [1] git ls-remote https://github.com/serialx/hashring 22c0c7ab6b1be4be=
7b950bae8b117767da7b18b6
>  SRCREV_hashring=3D"22c0c7ab6b1be4be7b950bae8b117767da7b18b6"
> -SRC_URI +=3D "git://github.com/serialx/hashring;name=3Dhashring;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/serialx/hashring"
> +SRC_URI +=3D "git://github.com/serialx/hashring;name=3Dhashring;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/serialx/hashring"
>
>  #       github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
>  # [1] git ls-remote https://github.com/tonistiigi/units 6950e57a87eaf136=
bbe44ef2ec8e75b9e3569de2
>  SRCREV_units=3D"6950e57a87eaf136bbe44ef2ec8e75b9e3569de2"
> -SRC_URI +=3D "git://github.com/tonistiigi/units;name=3Dunits;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/tonistiigi/units"
> +SRC_URI +=3D "git://github.com/tonistiigi/units;name=3Dunits;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/tonistiigi/units"
>
>  #       github.com/tonistiigi/vt100 v0.0.0-20230623042737-f9a4f7ef6531
>  # [1] git ls-remote https://github.com/tonistiigi/vt100 f9a4f7ef65311848=
d4d4791c649a178c8e97386b
>  SRCREV_vt100=3D"f9a4f7ef65311848d4d4791c649a178c8e97386b"
> -SRC_URI +=3D "git://github.com/tonistiigi/vt100;name=3Dvt100;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/tonistiigi/vt100"
> +SRC_URI +=3D "git://github.com/tonistiigi/vt100;name=3Dvt100;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/tonistiigi/vt100"
>
>  #       google.golang.org/appengine v1.6.7
>  # [1] git ls-remote https://github.com/golang/appengine 5d1c1d03f8703c2e=
81478d9a30e9afa2d3e4bd8a
>  SRCREV_appengine=3D"5d1c1d03f8703c2e81478d9a30e9afa2d3e4bd8a"
> -SRC_URI +=3D "git://github.com/golang/appengine;name=3Dappengine;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/google.golang.org/appengine"
> +SRC_URI +=3D "git://github.com/golang/appengine;name=3Dappengine;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go=
ogle.golang.org/appengine"
>
>  #       github.com/fsnotify/fsevents v0.1.1
>  # [1] git ls-remote https://github.com/fsnotify/fsevents f721bd2b045774a=
566e8f7f5fa2a9985e04c875d
>  SRCREV_fsevents=3D"f721bd2b045774a566e8f7f5fa2a9985e04c875d"
> -SRC_URI +=3D "git://github.com/fsnotify/fsevents;name=3Dfsevents;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/fsnotify/fsevents"
> +SRC_URI +=3D "git://github.com/fsnotify/fsevents;name=3Dfsevents;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/fsnotify/fsevents"
>
>  #       github.com/tilt-dev/fsnotify v1.4.8-0.20220602155310-fff9c274a37=
5
>  # [1] git ls-remote https://github.com/tilt-dev/fsnotify fff9c274a375301=
ae46812f257aa68393790c45b
>  SRCREV_fsnotify=3D"fff9c274a375301ae46812f257aa68393790c45b"
> -SRC_URI +=3D "git://github.com/tilt-dev/fsnotify;name=3Dfsnotify;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/tilt-dev/fsnotify"
> +SRC_URI +=3D "git://github.com/tilt-dev/fsnotify;name=3Dfsnotify;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/tilt-dev/fsnotify"
>
>  #       go.opentelemetry.io/otel/sdk v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_sdk=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dsd=
k;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/go.opentelemetry.io/otel/sdk"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dsd=
k;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/go.opentelemetry.io/otel/sdk"
>
>  #       github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
>  # [1] git ls-remote https://github.com/Azure/go-ansiterm d185dfc1b5a1261=
16ea5a19e148e29d16b4574c9
>  SRCREV_go-ansiterm=3D"d185dfc1b5a126116ea5a19e148e29d16b4574c9"
> -SRC_URI +=3D "git://github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/Azure/go-ansiterm"
> +SRC_URI +=3D "git://github.com/Azure/go-ansiterm;name=3Dgo-ansiterm;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch=
/github.com/Azure/go-ansiterm"
>
>  #       github.com/Microsoft/hcsshim v0.11.4
>  # [1] git ls-remote https://github.com/microsoft/hcsshim b16edf62c1723de=
b948632261b445d0228d973e0
>  SRCREV_hcsshim=3D"b16edf62c1723deb948632261b445d0228d973e0"
> -SRC_URI +=3D "git://github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/Microsoft/hcsshim"
> +SRC_URI +=3D "git://github.com/microsoft/hcsshim;name=3Dhcsshim;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/Microsoft/hcsshim"
>
>  #       github.com/aws/aws-sdk-go-v2 v1.24.1
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_aws-sdk-go-v2=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Daws-sdk-go-v2;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/aws/aws-sdk-go-v2"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Daws-sdk-go-v2;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/aws/aws-sdk-go-v2"
>
>  #       github.com/cespare/xxhash/v2 v2.2.0
>  # [1] git ls-remote https://github.com/cespare/xxhash a76eb16a93c1e30527=
c073ca831d9048b4b935f6
>  SRCREV_xxhash-v2=3D"a76eb16a93c1e30527c073ca831d9048b4b935f6"
> -SRC_URI +=3D "git://github.com/cespare/xxhash;name=3Dxxhash-v2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/cespare/xxhash/v2"
> +SRC_URI +=3D "git://github.com/cespare/xxhash;name=3Dxxhash-v2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/cespare/xxhash/v2"
>
>  #       github.com/docker/go-metrics v0.0.1
>  # [1] git ls-remote https://github.com/docker/go-metrics b619b3592b65de4=
f087d9f16863a7e6ff905973c
>  SRCREV_go-metrics=3D"b619b3592b65de4f087d9f16863a7e6ff905973c"
> -SRC_URI +=3D "git://github.com/docker/go-metrics;name=3Dgo-metrics;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/docker/go-metrics"
> +SRC_URI +=3D "git://github.com/docker/go-metrics;name=3Dgo-metrics;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/=
github.com/docker/go-metrics"
>
>  #       github.com/eiannone/keyboard v0.0.0-20220611211555-0d226195f203
>  # [1] git ls-remote https://github.com/eiannone/keyboard 0d226195f2038e2=
82bb90d2e24f7f29aa7c5b210
>  SRCREV_keyboard=3D"0d226195f2038e282bb90d2e24f7f29aa7c5b210"
> -SRC_URI +=3D "git://github.com/eiannone/keyboard;name=3Dkeyboard;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/eiannone/keyboard"
> +SRC_URI +=3D "git://github.com/eiannone/keyboard;name=3Dkeyboard;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/eiannone/keyboard"
>
>  #       github.com/felixge/httpsnoop v1.0.4
>  # [1] git ls-remote https://github.com/felixge/httpsnoop c5817c27ec12540=
9c069052fdd171023c353501c
>  SRCREV_httpsnoop=3D"c5817c27ec125409c069052fdd171023c353501c"
> -SRC_URI +=3D "git://github.com/felixge/httpsnoop;name=3Dhttpsnoop;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/felixge/httpsnoop"
> +SRC_URI +=3D "git://github.com/felixge/httpsnoop;name=3Dhttpsnoop;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/felixge/httpsnoop"
>
>  #       github.com/gorilla/websocket v1.5.0
>  # [1] git ls-remote https://github.com/gorilla/websocket 9111bb834a68b89=
3cebbbaed5060bdbc1d9ab7d2
>  SRCREV_websocket=3D"9111bb834a68b893cebbbaed5060bdbc1d9ab7d2"
> -SRC_URI +=3D "git://github.com/gorilla/websocket;name=3Dwebsocket;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/gorilla/websocket"
> +SRC_URI +=3D "git://github.com/gorilla/websocket;name=3Dwebsocket;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/gorilla/websocket"
>
>  #       github.com/hashicorp/errwrap v1.1.0
>  # [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d=
14dd0caaacbd13e76254d02c0
>  SRCREV_errwrap=3D"7b00e5db719c64d14dd0caaacbd13e76254d02c0"
> -SRC_URI +=3D "git://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/hashicorp/errwrap"
> +SRC_URI +=3D "git://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/hashicorp/errwrap"
>
>  #       github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
>  # [1] git ls-remote https://github.com/munnerz/goautoneg a7dc8b61c822528=
f973a5e4e7b272055c6fdb43e
>  SRCREV_goautoneg=3D"a7dc8b61c822528f973a5e4e7b272055c6fdb43e"
> -SRC_URI +=3D "git://github.com/munnerz/goautoneg;name=3Dgoautoneg;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/munnerz/goautoneg"
> +SRC_URI +=3D "git://github.com/munnerz/goautoneg;name=3Dgoautoneg;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/munnerz/goautoneg"
>
>  #       github.com/pelletier/go-toml v1.9.5
>  # [1] git ls-remote https://github.com/pelletier/go-toml fed146406641307=
5eac02cd4dc368b5221845541
>  SRCREV_go-toml=3D"fed1464066413075eac02cd4dc368b5221845541"
> -SRC_URI +=3D "git://github.com/pelletier/go-toml;name=3Dgo-toml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/pelletier/go-toml"
> +SRC_URI +=3D "git://github.com/pelletier/go-toml;name=3Dgo-toml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/pelletier/go-toml"
>
>  #       github.com/prometheus/common v0.44.0
>  # [1] git ls-remote https://github.com/prometheus/common 94bf9828e56d967=
0579b28a9f78237d3cd8d0395
>  SRCREV_common=3D"94bf9828e56d9670579b28a9f78237d3cd8d0395"
> -SRC_URI +=3D "git://github.com/prometheus/common;name=3Dcommon;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/prometheus/common"
> +SRC_URI +=3D "git://github.com/prometheus/common;name=3Dcommon;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/prometheus/common"
>
>  #       github.com/prometheus/procfs v0.12.0
>  # [1] git ls-remote https://github.com/prometheus/procfs ff0ad85f7e8bcd5=
c677d99143f14a2a3aab533aa
>  SRCREV_procfs=3D"ff0ad85f7e8bcd5c677d99143f14a2a3aab533aa"
> -SRC_URI +=3D "git://github.com/prometheus/procfs;name=3Dprocfs;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/prometheus/procfs"
> +SRC_URI +=3D "git://github.com/prometheus/procfs;name=3Dprocfs;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/prometheus/procfs"
>
>  #       github.com/tonistiigi/fsutil v0.0.0-20240301111122-7525a1af2bb5
>  # [1] git ls-remote https://github.com/tonistiigi/fsutil 7525a1af2bb545e=
89dc9bced785bff7a3b7f08c2
>  SRCREV_fsutil=3D"7525a1af2bb545e89dc9bced785bff7a3b7f08c2"
> -SRC_URI +=3D "git://github.com/tonistiigi/fsutil;name=3Dfsutil;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/tonistiigi/fsutil"
> +SRC_URI +=3D "git://github.com/tonistiigi/fsutil;name=3Dfsutil;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/tonistiigi/fsutil"
>
>  #       gopkg.in/cenkalti/backoff.v1 v1.1.0
>  # [1] git ls-remote https://github.com/cenkalti/backoff 61153c768f31ee5f=
130071d08fc82b85208528de
>  SRCREV_backoff.v1=3D"61153c768f31ee5f130071d08fc82b85208528de"
> -SRC_URI +=3D "git://github.com/cenkalti/backoff;name=3Dbackoff.v1;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/gopkg.in/cenkalti/backoff.v1"
> +SRC_URI +=3D "git://github.com/cenkalti/backoff;name=3Dbackoff.v1;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
opkg.in/cenkalti/backoff.v1"
>
>  #       github.com/Microsoft/go-winio v0.6.1
>  # [1] git ls-remote https://github.com/microsoft/go-winio 070c828abb873d=
a9e71c7247740253b50f7cf049
>  SRCREV_go-winio=3D"070c828abb873da9e71c7247740253b50f7cf049"
> -SRC_URI +=3D "git://github.com/microsoft/go-winio;name=3Dgo-winio;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/Microsoft/go-winio"
> +SRC_URI +=3D "git://github.com/microsoft/go-winio;name=3Dgo-winio;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/Microsoft/go-winio"
>
>  #       github.com/acarl005/stripansi v0.0.0-20180116102854-5a71ef0e047d
>  # [1] git ls-remote https://github.com/acarl005/stripansi 5a71ef0e047df0=
427e87a79f27009029921f1f9b
>  SRCREV_stripansi=3D"5a71ef0e047df0427e87a79f27009029921f1f9b"
> -SRC_URI +=3D "git://github.com/acarl005/stripansi;name=3Dstripansi;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/acarl005/stripansi"
> +SRC_URI +=3D "git://github.com/acarl005/stripansi;name=3Dstripansi;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/=
github.com/acarl005/stripansi"
>
>  #       github.com/containerd/console v1.0.4
>  # [1] git ls-remote https://github.com/containerd/console 8f6c4e4faef5a3=
26d2cd907097d04c0239ee5e2f
>  SRCREV_console=3D"8f6c4e4faef5a326d2cd907097d04c0239ee5e2f"
> -SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/containerd/console"
> +SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gi=
thub.com/containerd/console"
>
>  #       github.com/fvbommel/sortorder v1.0.2
>  # [1] git ls-remote https://github.com/fvbommel/sortorder 26fad50c6b32a3=
064c09ed089865c16f2f3615f6
>  SRCREV_sortorder=3D"26fad50c6b32a3064c09ed089865c16f2f3615f6"
> -SRC_URI +=3D "git://github.com/fvbommel/sortorder;name=3Dsortorder;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/fvbommel/sortorder"
> +SRC_URI +=3D "git://github.com/fvbommel/sortorder;name=3Dsortorder;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/=
github.com/fvbommel/sortorder"
>
>  #       github.com/klauspost/compress v1.17.4
>  # [1] git ls-remote https://github.com/klauspost/compress 98ff542abe3108=
aa760c1558f80d393be0136539
>  SRCREV_compress=3D"98ff542abe3108aa760c1558f80d393be0136539"
> -SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/klauspost/compress"
> +SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/klauspost/compress"
>
>  #       github.com/mattn/go-colorable v0.1.13
>  # [1] git ls-remote https://github.com/mattn/go-colorable 11a925cff3d38c=
293ddc8c05a16b504e3e2c63be
>  SRCREV_go-colorable=3D"11a925cff3d38c293ddc8c05a16b504e3e2c63be"
> -SRC_URI +=3D "git://github.com/mattn/go-colorable;name=3Dgo-colorable;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/mattn/go-colorable"
> +SRC_URI +=3D "git://github.com/mattn/go-colorable;name=3Dgo-colorable;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/mattn/go-colorable"
>
>  #       github.com/mattn/go-runewidth v0.0.15
>  # [1] git ls-remote https://github.com/mattn/go-runewidth 44b7c5b4d67df8=
ca22917b6800c158a6d3be3560
>  SRCREV_go-runewidth=3D"44b7c5b4d67df8ca22917b6800c158a6d3be3560"
> -SRC_URI +=3D "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/mattn/go-runewidth"
> +SRC_URI +=3D "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/mattn/go-runewidth"
>
>  #       github.com/moby/sys/mountinfo v0.7.1
>  # [1] git ls-remote https://github.com/moby/sys 4950d7687cf6c9b138dc0e18=
c2c7351e1f6ed497
>  SRCREV_mountinfo=3D"4950d7687cf6c9b138dc0e18c2c7351e1f6ed497"
> -SRC_URI +=3D "git://github.com/moby/sys;name=3Dmountinfo;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/moby/sys/mountinfo"
> +SRC_URI +=3D "git://github.com/moby/sys;name=3Dmountinfo;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com=
/moby/sys/mountinfo"
>
>  #       github.com/modern-go/reflect2 v1.0.2
>  # [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc52=
31aea69b8861c540102b087070
>  SRCREV_reflect2=3D"2b33151c9bbc5231aea69b8861c540102b087070"
> -SRC_URI +=3D "git://github.com/modern-go/reflect2;name=3Dreflect2;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/modern-go/reflect2"
> +SRC_URI +=3D "git://github.com/modern-go/reflect2;name=3Dreflect2;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/modern-go/reflect2"
>
>  #       github.com/pmezard/go-difflib v1.0.0
>  # [1] git ls-remote https://github.com/pmezard/go-difflib 792786c7400a13=
6282c1664665ae0a8db921c6c2
>  SRCREV_go-difflib=3D"792786c7400a136282c1664665ae0a8db921c6c2"
> -SRC_URI +=3D "git://github.com/pmezard/go-difflib;name=3Dgo-difflib;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/pmezard/go-difflib"
> +SRC_URI +=3D "git://github.com/pmezard/go-difflib;name=3Dgo-difflib;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch=
/github.com/pmezard/go-difflib"
>
>  #       github.com/jonboulle/clockwork v0.4.0
>  # [1] git ls-remote https://github.com/jonboulle/clockwork 606c48b92358f=
cca153952b56fb0d14d6845f84a
>  SRCREV_clockwork=3D"606c48b92358fcca153952b56fb0d14d6845f84a"
> -SRC_URI +=3D "git://github.com/jonboulle/clockwork;name=3Dclockwork;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/jonboulle/clockwork"
> +SRC_URI +=3D "git://github.com/jonboulle/clockwork;name=3Dclockwork;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch=
/github.com/jonboulle/clockwork"
>
>  #       github.com/mattn/go-shellwords v1.0.12
>  # [1] git ls-remote https://github.com/mattn/go-shellwords 973b9d5391598=
d4ee601db46fa32f6e186a356ac
>  SRCREV_go-shellwords=3D"973b9d5391598d4ee601db46fa32f6e186a356ac"
> -SRC_URI +=3D "git://github.com/mattn/go-shellwords;name=3Dgo-shellwords;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/mattn/go-shellwords"
> +SRC_URI +=3D "git://github.com/mattn/go-shellwords;name=3Dgo-shellwords;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/mattn/go-shellwords"
>
>  #       github.com/moby/patternmatcher v0.6.0
>  # [1] git ls-remote https://github.com/moby/patternmatcher 347bb8d8d557f=
90d1b75cd8bca3c0177f380a979
>  SRCREV_patternmatcher=3D"347bb8d8d557f90d1b75cd8bca3c0177f380a979"
> -SRC_URI +=3D "git://github.com/moby/patternmatcher;name=3Dpatternmatcher=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/moby/patternmatcher"
> +SRC_URI +=3D "git://github.com/moby/patternmatcher;name=3Dpatternmatcher=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/moby/patternmatcher"
>
>  #       go.opentelemetry.io/otel/trace v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_trace=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dtr=
ace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/go.opentelemetry.io/otel/trace"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dtr=
ace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/go.opentelemetry.io/otel/trace"
>
>  #       github.com/cenkalti/backoff/v4 v4.2.1
>  # [1] git ls-remote https://github.com/cenkalti/backoff a04a6fe64ffb0e3f=
d0816460529d300be5f252df
>  SRCREV_v4=3D"a04a6fe64ffb0e3fd0816460529d300be5f252df"
> -SRC_URI +=3D "git://github.com/cenkalti/backoff;name=3Dv4;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/cenkalti/backoff/v4"
> +SRC_URI +=3D "git://github.com/cenkalti/backoff;name=3Dv4;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.co=
m/cenkalti/backoff/v4"
>
>  #       github.com/docker/distribution v2.8.3+incompatible
>  # [1] git ls-remote https://github.com/distribution/distribution 4772604=
ae973031ab32dd9805a4bccf61d94909f
>  SRCREV_distribution=3D"4772604ae973031ab32dd9805a4bccf61d94909f"
> -SRC_URI +=3D "git://github.com/distribution/distribution;name=3Ddistribu=
tion;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/docker/distribution"
> +SRC_URI +=3D "git://github.com/distribution/distribution;name=3Ddistribu=
tion;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ven=
dor.fetch/github.com/docker/distribution"
>
>  #       github.com/moby/sys/sequential v0.5.0
>  # [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a=
529457e6283ed9f7
>  SRCREV_sequential=3D"b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
> -SRC_URI +=3D "git://github.com/moby/sys;name=3Dsequential;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/moby/sys/sequential"
> +SRC_URI +=3D "git://github.com/moby/sys;name=3Dsequential;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.co=
m/moby/sys/sequential"
>
>  #       github.com/shibumi/go-pathspec v1.3.0
>  # [1] git ls-remote https://github.com/shibumi/go-pathspec 30eddf187f623=
05a5b34f662049d077211abaacd
>  SRCREV_go-pathspec=3D"30eddf187f62305a5b34f662049d077211abaacd"
> -SRC_URI +=3D "git://github.com/shibumi/go-pathspec;name=3Dgo-pathspec;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/shibumi/go-pathspec"
> +SRC_URI +=3D "git://github.com/shibumi/go-pathspec;name=3Dgo-pathspec;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/shibumi/go-pathspec"
>
>  #       go.opentelemetry.io/proto/otlp v1.0.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-prot=
o-go 97744b2e4a0fa6787b96b9c3c740daefca754333
>  SRCREV_otlp=3D"97744b2e4a0fa6787b96b9c3c740daefca754333"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-proto-go;nam=
e=3Dotlp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/go.opentelemetry.io/proto/otlp"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-proto-go;nam=
e=3Dotlp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
/vendor.fetch/go.opentelemetry.io/proto/otlp"
>
>  #       github.com/docker/cli-docs-tool v0.7.0
>  # [1] git ls-remote https://github.com/docker/cli-docs-tool 3149c9122955=
95f6fc3bd7d3ee9283d97a4aedf6
>  SRCREV_cli-docs-tool=3D"3149c912295595f6fc3bd7d3ee9283d97a4aedf6"
> -SRC_URI +=3D "git://github.com/docker/cli-docs-tool;name=3Dcli-docs-tool=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/docker/cli-docs-tool"
> +SRC_URI +=3D "git://github.com/docker/cli-docs-tool;name=3Dcli-docs-tool=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/docker/cli-docs-tool"
>
>  #       github.com/hashicorp/go-version v1.6.0
>  # [1] git ls-remote https://github.com/hashicorp/go-version 78d058c56188=
91f74d604bd15356fca690b64d8a
>  SRCREV_go-version=3D"78d058c5618891f74d604bd15356fca690b64d8a"
> -SRC_URI +=3D "git://github.com/hashicorp/go-version;name=3Dgo-version;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/hashicorp/go-version"
> +SRC_URI +=3D "git://github.com/hashicorp/go-version;name=3Dgo-version;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/hashicorp/go-version"
>
>  #       github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1=
dd
>  # [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd=
9b15be4a9909b8ac7a4e313eec94
>  SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
> -SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/modern-go/concurrent"
> +SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/modern-go/concurrent"
>
>  #       github.com/xeipuuv/gojsonschema v1.2.0
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203eb=
6ab2a67d0a623d9c19e5e5a64927
>  SRCREV_gojsonschema=3D"82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
> -SRC_URI +=3D "git://github.com/xeipuuv/gojsonschema;name=3Dgojsonschema;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/xeipuuv/gojsonschema"
> +SRC_URI +=3D "git://github.com/xeipuuv/gojsonschema;name=3Dgojsonschema;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/xeipuuv/gojsonschema"
>
>  #       go.opentelemetry.io/otel/metric v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_metric=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dme=
tric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/go.opentelemetry.io/otel/metric"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dme=
tric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ven=
dor.fetch/go.opentelemetry.io/otel/metric"
>
>  #       github.com/AlecAivazis/survey/v2 v2.3.7
>  # [1] git ls-remote https://github.com/AlecAivazis/survey fa37277e6394c2=
9db7bcc94062cb30cd7785a126
>  SRCREV_v2=3D"fa37277e6394c29db7bcc94062cb30cd7785a126"
> -SRC_URI +=3D "git://github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/AlecAivazis/survey/v2"
> +SRC_URI +=3D "git://github.com/AlecAivazis/survey;name=3Dv2;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/AlecAivazis/survey/v2"
>
>  #       github.com/containerd/containerd v1.7.13
>  # [1] git ls-remote https://github.com/containerd/containerd 7c3aca7a610=
df76212171d200ca3811ff6096eb8
>  SRCREV_containerd=3D"7c3aca7a610df76212171d200ca3811ff6096eb8"
> -SRC_URI +=3D "git://github.com/containerd/containerd;name=3Dcontainerd;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/containerd/containerd"
> +SRC_URI +=3D "git://github.com/containerd/containerd;name=3Dcontainerd;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fe=
tch/github.com/containerd/containerd"
>
>  #       github.com/docker/go-connections v0.5.0
>  # [1] git ls-remote https://github.com/docker/go-connections fa09c952e3e=
adbffaf8afc5b8a1667158ba38ace
>  SRCREV_go-connections=3D"fa09c952e3eadbffaf8afc5b8a1667158ba38ace"
> -SRC_URI +=3D "git://github.com/docker/go-connections;name=3Dgo-connectio=
ns;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/docker/go-connections"
> +SRC_URI +=3D "git://github.com/docker/go-connections;name=3Dgo-connectio=
ns;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/docker/go-connections"
>
>  #       github.com/Masterminds/semver/v3 v3.2.1
>  # [1] git ls-remote https://github.com/Masterminds/semver e06051f8fcc4c8=
b4a4990c337b9862a2448722e5
>  SRCREV_semver-v3=3D"e06051f8fcc4c8b4a4990c337b9862a2448722e5"
> -SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver-v3;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/Masterminds/semver/v3"
> +SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver-v3;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/=
github.com/Masterminds/semver/v3"
>
>  #       github.com/containerd/continuity v0.4.3
>  # [1] git ls-remote https://github.com/containerd/continuity 1743d9104d9=
44131cdedaba33a59d2f9bd80a6f2
>  SRCREV_continuity=3D"1743d9104d944131cdedaba33a59d2f9bd80a6f2"
> -SRC_URI +=3D "git://github.com/containerd/continuity;name=3Dcontinuity;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/containerd/continuity"
> +SRC_URI +=3D "git://github.com/containerd/continuity;name=3Dcontinuity;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fe=
tch/github.com/containerd/continuity"
>
>  #       github.com/containerd/typeurl/v2 v2.1.1
>  # [1] git ls-remote https://github.com/containerd/typeurl 7ef6316b771f95=
9cbb208b229e3423a466947df3
>  SRCREV_typeurl-v2=3D"7ef6316b771f959cbb208b229e3423a466947df3"
> -SRC_URI +=3D "git://github.com/containerd/typeurl;name=3Dtypeurl-v2;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/containerd/typeurl/v2"
> +SRC_URI +=3D "git://github.com/containerd/typeurl;name=3Dtypeurl-v2;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch=
/github.com/containerd/typeurl/v2"
>
>  #       github.com/google/gnostic-models v0.6.8
>  # [1] git ls-remote https://github.com/google/gnostic-models 577692584cd=
f09674595bba0c182d0e8a44655d3
>  SRCREV_gnostic-models=3D"577692584cdf09674595bba0c182d0e8a44655d3"
> -SRC_URI +=3D "git://github.com/google/gnostic-models;name=3Dgnostic-mode=
ls;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/google/gnostic-models"
> +SRC_URI +=3D "git://github.com/google/gnostic-models;name=3Dgnostic-mode=
ls;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/google/gnostic-models"
>
>  #       github.com/mitchellh/reflectwalk v1.0.2
>  # [1] git ls-remote https://github.com/mitchellh/reflectwalk e0c24fdb021=
963cd2c4013097a0b993a7c4e344f
>  SRCREV_reflectwalk=3D"e0c24fdb021963cd2c4013097a0b993a7c4e344f"
> -SRC_URI +=3D "git://github.com/mitchellh/reflectwalk;name=3Dreflectwalk;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/mitchellh/reflectwalk"
> +SRC_URI +=3D "git://github.com/mitchellh/reflectwalk;name=3Dreflectwalk;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/mitchellh/reflectwalk"
>
>  #       github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407=
bfb
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407bf=
bf5f6dae44c4f4b1cf6a39b5fc5bb
>  SRCREV_gojsonpointer=3D"02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
> -SRC_URI +=3D "git://github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointe=
r;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/xeipuuv/gojsonpointer"
> +SRC_URI +=3D "git://github.com/xeipuuv/gojsonpointer;name=3Dgojsonpointe=
r;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/github.com/xeipuuv/gojsonpointer"
>
>  #       github.com/distribution/reference v0.5.0
>  # [1] git ls-remote https://github.com/distribution/reference 49c28499d2=
19290c3226822e9cfcd4ede6d75379
>  SRCREV_reference=3D"49c28499d219290c3226822e9cfcd4ede6d75379"
> -SRC_URI +=3D "git://github.com/distribution/reference;name=3Dreference;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/distribution/reference"
> +SRC_URI +=3D "git://github.com/distribution/reference;name=3Dreference;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fe=
tch/github.com/distribution/reference"
>
>  #       github.com/mitchellh/mapstructure v1.5.0
>  # [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d934=
10fce4361f4912bb1ff88110a81311
>  SRCREV_mapstructure=3D"ab69d8d93410fce4361f4912bb1ff88110a81311"
> -SRC_URI +=3D "git://github.com/mitchellh/mapstructure;name=3Dmapstructur=
e;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/mitchellh/mapstructure"
> +SRC_URI +=3D "git://github.com/mitchellh/mapstructure;name=3Dmapstructur=
e;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/github.com/mitchellh/mapstructure"
>
>  #       github.com/skratchdot/open-golang v0.0.0-20200116055534-eef84239=
7966
>  # [1] git ls-remote https://github.com/skratchdot/open-golang eef8423979=
666925a58eb77f9db583e54320d5a4
>  SRCREV_open-golang=3D"eef8423979666925a58eb77f9db583e54320d5a4"
> -SRC_URI +=3D "git://github.com/skratchdot/open-golang;name=3Dopen-golang=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/skratchdot/open-golang"
> +SRC_URI +=3D "git://github.com/skratchdot/open-golang;name=3Dopen-golang=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/skratchdot/open-golang"
>
>  #       github.com/emicklei/go-restful/v3 v3.11.0
>  # [1] git ls-remote https://github.com/emicklei/go-restful 30bec7807481e=
62e1e1e59ad57e7f22054806966
>  SRCREV_go-restful-v3=3D"30bec7807481e62e1e1e59ad57e7f22054806966"
> -SRC_URI +=3D "git://github.com/emicklei/go-restful;name=3Dgo-restful-v3;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/emicklei/go-restful/v3"
> +SRC_URI +=3D "git://github.com/emicklei/go-restful;name=3Dgo-restful-v3;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/emicklei/go-restful/v3"
>
>  #       github.com/go-openapi/jsonpointer v0.19.6
>  # [1] git ls-remote https://github.com/go-openapi/jsonpointer 5df0d69a6b=
e189afff354877d332f9ede32afe12
>  SRCREV_jsonpointer=3D"5df0d69a6be189afff354877d332f9ede32afe12"
> -SRC_URI +=3D "git://github.com/go-openapi/jsonpointer;name=3Djsonpointer=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/go-openapi/jsonpointer"
> +SRC_URI +=3D "git://github.com/go-openapi/jsonpointer;name=3Djsonpointer=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/go-openapi/jsonpointer"
>
>  #       github.com/hashicorp/go-cleanhttp v0.5.2
>  # [1] git ls-remote https://github.com/hashicorp/go-cleanhttp 6d9e2ac5d8=
28e5f8594b97f88c4bde14a67bb6d2
>  SRCREV_go-cleanhttp=3D"6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
> -SRC_URI +=3D "git://github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhtt=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/hashicorp/go-cleanhttp"
> +SRC_URI +=3D "git://github.com/hashicorp/go-cleanhttp;name=3Dgo-cleanhtt=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/github.com/hashicorp/go-cleanhttp"
>
>  #       github.com/in-toto/in-toto-golang v0.5.0
>  # [1] git ls-remote https://github.com/in-toto/in-toto-golang ec599036d2=
7ebaca3e8c03559d3f8fd5fe429dfe
>  SRCREV_in-toto-golang=3D"ec599036d27ebaca3e8c03559d3f8fd5fe429dfe"
> -SRC_URI +=3D "git://github.com/in-toto/in-toto-golang;name=3Din-toto-gol=
ang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/in-toto/in-toto-golang"
> +SRC_URI +=3D "git://github.com/in-toto/in-toto-golang;name=3Din-toto-gol=
ang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/github.com/in-toto/in-toto-golang"
>
>  #       github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82=
bc51
>  # [1] git ls-remote https://github.com/kballard/go-shellquote 95032a82bc=
518f77982ea72343cc1ade730072f0
>  SRCREV_go-shellquote=3D"95032a82bc518f77982ea72343cc1ade730072f0"
> -SRC_URI +=3D "git://github.com/kballard/go-shellquote;name=3Dgo-shellquo=
te;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/kballard/go-shellquote"
> +SRC_URI +=3D "git://github.com/kballard/go-shellquote;name=3Dgo-shellquo=
te;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/kballard/go-shellquote"
>
>  #       github.com/moby/docker-image-spec v1.3.1
>  # [1] git ls-remote https://github.com/moby/docker-image-spec f1d00ebd2d=
6d6805170d5543dbca4b850f35f9af
>  SRCREV_docker-image-spec=3D"f1d00ebd2d6d6805170d5543dbca4b850f35f9af"
> -SRC_URI +=3D "git://github.com/moby/docker-image-spec;name=3Ddocker-imag=
e-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/moby/docker-image-spec"
> +SRC_URI +=3D "git://github.com/moby/docker-image-spec;name=3Ddocker-imag=
e-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/v=
endor.fetch/github.com/moby/docker-image-spec"
>
>  #       github.com/hashicorp/go-multierror v1.1.1
>  # [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec5=
7696378079ecc3accd3d6f29401b3a0
>  SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
> -SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-multier=
ror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/hashicorp/go-multierror"
> +SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-multier=
ror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/github.com/hashicorp/go-multierror"
>
>  #       github.com/mitchellh/copystructure v1.2.0
>  # [1] git ls-remote https://github.com/mitchellh/copystructure d4ce1f938=
f7a7ea2a40bff4544b56be9c00b5e84
>  SRCREV_copystructure=3D"d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84"
> -SRC_URI +=3D "git://github.com/mitchellh/copystructure;name=3Dcopystruct=
ure;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/mitchellh/copystructure"
> +SRC_URI +=3D "git://github.com/mitchellh/copystructure;name=3Dcopystruct=
ure;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/github.com/mitchellh/copystructure"
>
>  #       github.com/prometheus/client_model v0.5.0
>  # [1] git ls-remote https://github.com/prometheus/client_model 1c92cadf7=
d8fa1726bae12e6025cca9b86d2ba5f
>  SRCREV_client_model=3D"1c92cadf7d8fa1726bae12e6025cca9b86d2ba5f"
> -SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_mod=
el;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/prometheus/client_model"
> +SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_mod=
el;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/prometheus/client_model"
>
>  #       github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7b=
d5415
>  # [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd5=
415a7ac448318e64f11a24cd21e594b
>  SRCREV_gojsonreference=3D"bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
> -SRC_URI +=3D "git://github.com/xeipuuv/gojsonreference;name=3Dgojsonrefe=
rence;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/xeipuuv/gojsonreference"
> +SRC_URI +=3D "git://github.com/xeipuuv/gojsonreference;name=3Dgojsonrefe=
rence;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ve=
ndor.fetch/github.com/xeipuuv/gojsonreference"
>
>  #       github.com/opencontainers/go-digest v1.0.0
>  # [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea5=
11f75cfa3ef6098cc253c5c3609b037a
>  SRCREV_go-digest=3D"ea51bea511f75cfa3ef6098cc253c5c3609b037a"
> -SRC_URI +=3D "git://github.com/opencontainers/go-digest;name=3Dgo-digest=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/opencontainers/go-digest"
> +SRC_URI +=3D "git://github.com/opencontainers/go-digest;name=3Dgo-digest=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.=
fetch/github.com/opencontainers/go-digest"
>
>  #       github.com/aws/aws-sdk-go-v2/config v1.26.6
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 857d5277b41f290=
ab7ba0e0f6f96f940045f69b7
>  SRCREV_config=3D"857d5277b41f290ab7ba0e0f6f96f940045f69b7"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/aws/aws-sdk-go-v2/config"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dconfig;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/aws/aws-sdk-go-v2/config"
>
>  #       github.com/go-openapi/jsonreference v0.20.2
>  # [1] git ls-remote https://github.com/go-openapi/jsonreference 1f158e56=
3669961b8e54817e3ea57978d439ffff
>  SRCREV_jsonreference=3D"1f158e563669961b8e54817e3ea57978d439ffff"
> -SRC_URI +=3D "git://github.com/go-openapi/jsonreference;name=3Djsonrefer=
ence;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/go-openapi/jsonreference"
> +SRC_URI +=3D "git://github.com/go-openapi/jsonreference;name=3Djsonrefer=
ence;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ven=
dor.fetch/github.com/go-openapi/jsonreference"
>
>  #       github.com/prometheus/client_golang v1.17.0
>  # [1] git ls-remote https://github.com/prometheus/client_golang fa1408ee=
351f6aba15c6d0207f7a0021eb3af406
>  SRCREV_client_golang=3D"fa1408ee351f6aba15c6d0207f7a0021eb3af406"
> -SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_go=
lang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/prometheus/client_golang"
> +SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_go=
lang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/ven=
dor.fetch/github.com/prometheus/client_golang"
>
>  #       go.opentelemetry.io/otel/sdk/metric v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_sdk-metric=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dsd=
k-metric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/go.opentelemetry.io/otel/sdk/metric"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dsd=
k-metric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
/vendor.fetch/go.opentelemetry.io/otel/sdk/metric"
>
>  #       github.com/opencontainers/image-spec v1.1.0-rc6
>  # [1] git ls-remote https://github.com/opencontainers/image-spec 6c2b5fa=
fa0731a97aad0c2a68bac238d6c98c690
>  SRCREV_image-spec=3D"6c2b5fafa0731a97aad0c2a68bac238d6c98c690"
> -SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-sp=
ec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/opencontainers/image-spec"
> +SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-sp=
ec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendo=
r.fetch/github.com/opencontainers/image-spec"
>
>  #       github.com/theupdateframework/notary v0.7.0
>  # [1] git ls-remote https://github.com/notaryproject/notary b0b6bfdd4933=
081e8d5ae026b24e8337311dd598
>  SRCREV_notary=3D"b0b6bfdd4933081e8d5ae026b24e8337311dd598"
> -SRC_URI +=3D "git://github.com/notaryproject/notary;name=3Dnotary;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/theupdateframework/notary"
> +SRC_URI +=3D "git://github.com/notaryproject/notary;name=3Dnotary;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/g=
ithub.com/theupdateframework/notary"
>
>  #       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1a=
cdcaa24
>  # [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers ced1acd=
caa24dc39c01b039fc37576c395f506cf
>  SRCREV_go-fuzz-headers=3D"ced1acdcaa24dc39c01b039fc37576c395f506cf"
> -SRC_URI +=3D "git://github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-=
headers;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
> +SRC_URI +=3D "git://github.com/AdaLogics/go-fuzz-headers;name=3Dgo-fuzz-=
headers;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/=
vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
>
>  #       github.com/inconshreveable/mousetrap v1.1.0
>  # [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053e=
e7ef85a6bd26368364a6d27f1641c1d21
>  SRCREV_mousetrap=3D"4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
> -SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetra=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/inconshreveable/mousetrap"
> +SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetra=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor=
.fetch/github.com/inconshreveable/mousetrap"
>
>  #       sigs.k8s.io/structured-merge-diff/v4 v4.4.1
>  # [1] git ls-remote https://github.com/kubernetes-sigs/structured-merge-=
diff cf09e71f4508bfc416135048e392a8a4990bf4e3
>  SRCREV_structured-merge-diff-v4=3D"cf09e71f4508bfc416135048e392a8a4990bf=
4e3"
> -SRC_URI +=3D "git://github.com/kubernetes-sigs/structured-merge-diff;nam=
e=3Dstructured-merge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${W=
ORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
> +SRC_URI +=3D "git://github.com/kubernetes-sigs/structured-merge-diff;nam=
e=3Dstructured-merge-diff-v4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${G=
O_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
>
>  #       github.com/compose-spec/compose-go/v2 v2.0.2
>  # [1] git ls-remote https://github.com/compose-spec/compose-go d0722c0e5=
564b4970f6634592638c0577ef8e028
>  SRCREV_compose-go-v2=3D"d0722c0e5564b4970f6634592638c0577ef8e028"
> -SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-go=
-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/compose-spec/compose-go/v2"
> +SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-go=
-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vend=
or.fetch/github.com/compose-spec/compose-go/v2"
>
>  #       tags.cncf.io/container-device-interface v0.6.2
>  # [1] git ls-remote https://github.com/cncf-tags/container-device-interf=
ace fb50bf8fc8b2c3c8fda6d23ab7e044774dcca678
>  SRCREV_container-device-interface=3D"fb50bf8fc8b2c3c8fda6d23ab7e044774dc=
ca678"
> -SRC_URI +=3D "git://github.com/cncf-tags/container-device-interface;name=
=3Dcontainer-device-interface;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/tags.cncf.io/container-device-interf=
ace"
> +SRC_URI +=3D "git://github.com/cncf-tags/container-device-interface;name=
=3Dcontainer-device-interface;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
GO_SRCURI_DESTSUFFIX}/vendor.fetch/tags.cncf.io/container-device-interface"
>
>  #       github.com/aws/aws-sdk-go-v2/credentials v1.16.16
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 a75d7694eb27092=
12655ee25e811d72a1188a68b
>  SRCREV_credentials=3D"a75d7694eb2709212655ee25e811d72a1188a68b"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dcredentials;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/aws/aws-sdk-go-v2/credentials"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dcredentials;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch=
/github.com/aws/aws-sdk-go-v2/credentials"
>
>  #       github.com/aws/aws-sdk-go-v2/service/sso v1.18.7
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 a75d7694eb27092=
12655ee25e811d72a1188a68b
>  SRCREV_sso=3D"a75d7694eb2709212655ee25e811d72a1188a68b"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dsso;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/aws/aws-sdk-go-v2/service/sso"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dsso;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/aws/aws-sdk-go-v2/service/sso"
>
>  #       github.com/aws/aws-sdk-go-v2/service/sts v1.26.7
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_sts=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dsts;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/aws/aws-sdk-go-v2/service/sts"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dsts;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/aws/aws-sdk-go-v2/service/sts"
>
>  #       github.com/aws/aws-sdk-go-v2/internal/ini v1.7.3
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 857d5277b41f290=
ab7ba0e0f6f96f940045f69b7
>  SRCREV_ini=3D"857d5277b41f290ab7ba0e0f6f96f940045f69b7"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/aws/aws-sdk-go-v2/internal/ini"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dini;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.=
com/aws/aws-sdk-go-v2/internal/ini"
>
>  #       github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0
>  # [1] git ls-remote https://github.com/grpc-ecosystem/grpc-gateway 09e39=
65a330155f7db8482269d7d91b9bceb7641
>  SRCREV_grpc-gateway-v2=3D"09e3965a330155f7db8482269d7d91b9bceb7641"
> -SRC_URI +=3D "git://github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-g=
ateway-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
> +SRC_URI +=3D "git://github.com/grpc-ecosystem/grpc-gateway;name=3Dgrpc-g=
ateway-v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX=
}/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
>
>  #       google.golang.org/genproto/googleapis/api v0.0.0-20231016165738-=
49dd2c1f3d0b
>  # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d=
0bf0f025ccaf8eeaaad902e3c63846
>  SRCREV_api=3D"49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
> -SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dapi;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/google.golang.org/genproto/googleapis/api"
> +SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dapi;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go=
ogle.golang.org/genproto/googleapis/api"
>
>  #       google.golang.org/genproto/googleapis/rpc v0.0.0-20231016165738-=
49dd2c1f3d0b
>  # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d=
0bf0f025ccaf8eeaaad902e3c63846
>  SRCREV_rpc=3D"49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
> -SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Drpc;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/google.golang.org/genproto/googleapis/rpc"
> +SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Drpc;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go=
ogle.golang.org/genproto/googleapis/rpc"
>
>  #       github.com/docker/docker-credential-helpers v0.8.0
>  # [1] git ls-remote https://github.com/docker/docker-credential-helpers =
8396edb35f8d7229e75482e9d82c7729fa7001b7
>  SRCREV_docker-credential-helpers=3D"8396edb35f8d7229e75482e9d82c7729fa70=
01b7"
> -SRC_URI +=3D "git://github.com/docker/docker-credential-helpers;name=3Dd=
ocker-credential-helpers;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpe=
rs"
> +SRC_URI +=3D "git://github.com/docker/docker-credential-helpers;name=3Dd=
ocker-credential-helpers;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SR=
CURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker-credential-helpers"
>
>  #       github.com/aws/aws-sdk-go-v2/service/ssooidc v1.21.7
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 f53c9bcd7ccef6f=
d9f13f77512e78e3a7aa3cc01
>  SRCREV_ssooidc=3D"f53c9bcd7ccef6fd9f13f77512e78e3a7aa3cc01"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dssooidc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/aws/aws-sdk-go-v2/service/ssooidc"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dssooidc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/git=
hub.com/aws/aws-sdk-go-v2/service/ssooidc"
>
>  #       github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
>  # [1] git ls-remote https://github.com/grpc-ecosystem/go-grpc-middleware=
 df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd
>  SRCREV_go-grpc-middleware=3D"df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd"
> -SRC_URI +=3D "git://github.com/grpc-ecosystem/go-grpc-middleware;name=3D=
go-grpc-middleware;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
> +SRC_URI +=3D "git://github.com/grpc-ecosystem/go-grpc-middleware;name=3D=
go-grpc-middleware;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_D=
ESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
>
>  #       github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.14.11
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_imds=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dimds;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/aws/aws-sdk-go-v2/feature/ec2/imds"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dimds;protocol=3D=
https;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github=
.com/aws/aws-sdk-go-v2/feature/ec2/imds"
>
>  #       go.opentelemetry.io/otel/exporters/prometheus v0.42.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 6=
0666c554065ac4da502fe28943eea4b938ab479
>  SRCREV_prometheus=3D"60666c554065ac4da502fe28943eea4b938ab479"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dpr=
ometheus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/go.opentelemetry.io/otel/exporters/prometheus"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dpr=
ometheus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
/vendor.fetch/go.opentelemetry.io/otel/exporters/prometheus"
>
>  #       github.com/matttproud/golang_protobuf_extensions v1.0.4
>  # [1] git ls-remote https://github.com/matttproud/golang_protobuf_extens=
ions c182affec369e30f25d3eb8cd8a478dee585ae7d
>  SRCREV_golang_protobuf_extensions=3D"c182affec369e30f25d3eb8cd8a478dee58=
5ae7d"
> -SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;nam=
e=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protob=
uf_extensions"
> +SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;nam=
e=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/matttproud/golang_protobuf_e=
xtensions"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_otlptrace=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptrace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptrace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/=
vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
>
>  #       github.com/secure-systems-lab/go-securesystemslib v0.4.0
>  # [1] git ls-remote https://github.com/secure-systems-lab/go-securesyste=
mslib abcd7c95c952df38eb237fab3764ef1b8d2b15c9
>  SRCREV_go-securesystemslib=3D"abcd7c95c952df38eb237fab3764ef1b8d2b15c9"
> -SRC_URI +=3D "git://github.com/secure-systems-lab/go-securesystemslib;na=
me=3Dgo-securesystemslib;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/secure-systems-lab/go-securesy=
stemslib"
> +SRC_URI +=3D "git://github.com/secure-systems-lab/go-securesystemslib;na=
me=3Dgo-securesystemslib;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SR=
CURI_DESTSUFFIX}/vendor.fetch/github.com/secure-systems-lab/go-securesystem=
slib"
>
>  #       github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.5.10
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_endpoints-v2=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dendpoints-v2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dendpoints-v2;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fetc=
h/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric v0.42.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 6=
0666c554065ac4da502fe28943eea4b938ab479
>  SRCREV_otlpmetric=3D"60666c554065ac4da502fe28943eea4b938ab479"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetric;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}=
/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric"
>
>  #       github.com/aws/aws-sdk-go-v2/internal/configsources v1.2.10
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_configsources=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dconfigsources;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/aws/aws-sdk-go-v2/internal/configsources"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dconfigsources;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/aws/aws-sdk-go-v2/internal/configsources"
>
>  #       github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.1=
0.10
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244=
357a82ef00fa6a61a9bfb9b39
>  SRCREV_presigned-url=3D"47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dpresigned-url;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Dpresigned-url;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.fet=
ch/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url"
>
>  #       go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0=
.46.1
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-c=
ontrib ba19074a6785b2b65c86a52c0649cf040319fa96
>  SRCREV_otelhttp=3D"ba19074a6785b2b65c86a52c0649cf040319fa96"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/htt=
p/otelhttp"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelhttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTS=
UFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/ot=
elhttp"
>
>  #       github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1=
.10.4
>  # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 0d643a8f0a8ad09=
075f41a60acba6a208cb36c58
>  SRCREV_accept-encoding=3D"0d643a8f0a8ad09075f41a60acba6a208cb36c58"
> -SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Daccept-encoding;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding"
> +SRC_URI +=3D "git://github.com/aws/aws-sdk-go-v2;name=3Daccept-encoding;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}/vendor.f=
etch/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc =
v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_otlptracegrpc=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptracegrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src=
/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlp=
tracegrpc"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptracegrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFF=
IX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptrac=
egrpc"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp =
v1.21.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 9=
8b32a6c3a87fbee5d34c063b9096f416b250897
>  SRCREV_otlptracehttp=3D"98b32a6c3a87fbee5d34c063b9096f416b250897"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptracehttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src=
/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlp=
tracehttp"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lptracehttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFF=
IX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptrac=
ehttp"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrp=
c v0.42.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 6=
0666c554065ac4da502fe28943eea4b938ab479
>  SRCREV_otlpmetricgrpc=3D"60666c554065ac4da502fe28943eea4b938ab479"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetricgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/ot=
lpmetricgrpc"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetricgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUF=
FIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpme=
tricgrpc"
>
>  #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichtt=
p v0.42.0
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 6=
0666c554065ac4da502fe28943eea4b938ab479
>  SRCREV_otlpmetrichttp=3D"60666c554065ac4da502fe28943eea4b938ab479"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetrichttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/ot=
lpmetrichttp"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go;name=3Dot=
lpmetrichttp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUF=
FIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpme=
trichttp"
>
>  #       go.opentelemetry.io/contrib/instrumentation/google.golang.org/gr=
pc/otelgrpc v0.46.1
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-c=
ontrib ba19074a6785b2b65c86a52c0649cf040319fa96
>  SRCREV_otelgrpc=3D"ba19074a6785b2b65c86a52c0649cf040319fa96"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.=
golang.org/grpc/otelgrpc"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelgrpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_DESTS=
UFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.gola=
ng.org/grpc/otelgrpc"
>
>  #       go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/o=
telhttptrace v0.46.1
>  # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-c=
ontrib ba19074a6785b2b65c86a52c0649cf040319fa96
>  SRCREV_otelhttptrace=3D"ba19074a6785b2b65c86a52c0649cf040319fa96"
> -SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelhttptrace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/$=
{BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/ne=
t/http/httptrace/otelhttptrace"
> +SRC_URI +=3D "git://github.com/open-telemetry/opentelemetry-go-contrib;n=
ame=3Dotelhttptrace;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${GO_SRCURI_=
DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/ht=
tp/httptrace/otelhttptrace"
>
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8748): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8748
> Mute This Topic: https://lists.yoctoproject.org/mt/106277146/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

