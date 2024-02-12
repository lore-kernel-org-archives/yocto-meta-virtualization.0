Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4769C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:21:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.8905.1707751265635103547
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 07:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3U/b7Qj;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2909a632e40so1794711a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707751265; x=1708356065; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7glWMr8l16c9eg+uPLtC2JnhZgyG1Lo0n5nR5zpVwCc=;
        b=e3U/b7QjL8vp3UE9plsP1stLcWFgCVnYnChfmkrAsqvO0RskLTy8fh6BZwe5UVS8H+
         cEtL+6HYoYS6P0sbsSCaVg9SLRiqEI9q0epk7+DkD/30qsddZsP+WF0pFyWSNntJrZNI
         IV5+Sz/ImK55vl1iV9RxLnNe+XqRjIe5YtbuMfdPF3dGdb95Wp7haMDfuzNMCEEXLnt8
         1fBr+2yInO0Z1XbEkBojbgOGkaDEOBscRXYyP9gCk5kSACrKIm4vWdkn6Io68FEzz++M
         LJs+xrVgKVJ/Bf++tJp+FVSJquoZgreKGn+/C7KKmG4sGIfBG8yloxiWiVJ9ZIVGJKq3
         tiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707751265; x=1708356065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7glWMr8l16c9eg+uPLtC2JnhZgyG1Lo0n5nR5zpVwCc=;
        b=VjQh4+BfS9wBRoQEgDVD3BTTb8xCZOfO7C/D3c7vgP27V4lu2bjjtc8TQsuwpi8HAt
         WCJTJIHerBUpEdpd3rBJD8JLeApcsE1mEeLCzYtMqCd9o7UAqAqG8FUjmfcrQQbEUZ6C
         OnJbjB2xdZezeMAqvsFwTA0Ga+gVbR7w8hhcyZAXPw2KYjcepJdrJZX701qczHCDQMjf
         kz0Kz8RGYWyJQD/ll1cq6FaJDpzxgG/9k8KoDzOoxmxuSJP93xRd1p//sEyGhxtMxSaL
         nMYonKUc0F9PNYpsIgz7VBN560GQY8Var2Yi66C/vrFxlanXdsRvRASmqbU1lO8c+QcQ
         6yRw==
X-Gm-Message-State: AOJu0YyhhtjojhNXkLhvGFD5V1XDun3y/+SYS878NFn7uxqGSKsv8ONK
	6AGIjvA96T8Bo8iA0W9uGM5WAdy0ZfxaSvcQbfnNGlsSp2chxD0/A+hI7EELPqzHLww+szDGZQD
	uqjGF0Ip1IBGbpZmQuQUnGWWv6Uc=
X-Google-Smtp-Source: AGHT+IHDdyMjVP31CQK5Yp6mx3Tx41qokz0HfuG1LOqWy0OmeuC2vWesuFcDhK5znrfmqc6yRUd9Bv0Lt/lHCgEzBc8=
X-Received: by 2002:a17:90b:3115:b0:290:33e7:9291 with SMTP id
 gc21-20020a17090b311500b0029033e79291mr3127156pjb.37.1707751264856; Mon, 12
 Feb 2024 07:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20240212145243.35052-1-fathi.boudra@linaro.org>
In-Reply-To: <20240212145243.35052-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Feb 2024 10:20:53 -0500
Message-ID: <CADkTA4O=+5248CMDpnSQuZ=Exr9LdzgCoOOscU8sy7397E98kg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: bump to 4.2.2 release
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Feb 2024 15:21:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8564

On Mon, Feb 12, 2024 at 9:52=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.o=
rg> wrote:
>
> Update upx recipe from 3.96 to 4.2.2 release.
> Use the released tarball instead of git repositories.
> Rewrite the recipe, simplified by using the latest released tarball.
> Update the homepage.

I don't mind the update, but I do pretty much insist on git
repositories versus tarballs.

So I'd take an update, but not the change of format of the recipe.

Cheers,

Bruce

>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-extended/upx/upx_4.2.2.bb | 14 ++++++++++
>  recipes-extended/upx/upx_git.bb   | 45 -------------------------------
>  2 files changed, 14 insertions(+), 45 deletions(-)
>  create mode 100644 recipes-extended/upx/upx_4.2.2.bb
>  delete mode 100644 recipes-extended/upx/upx_git.bb
>
> diff --git a/recipes-extended/upx/upx_4.2.2.bb b/recipes-extended/upx/upx=
_4.2.2.bb
> new file mode 100644
> index 00000000..cb46d19c
> --- /dev/null
> +++ b/recipes-extended/upx/upx_4.2.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Ultimate executable compressor."
> +HOMEPAGE =3D "https://upx.github.io/"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c63=
74a"
> +DEPENDS =3D "libucl zlib xz"
> +
> +SRC_URI =3D "https://github.com/upx/upx/releases/download/v${PV}/upx-${P=
V}-src.tar.xz"
> +SRC_URI[sha256sum] =3D "42ee0455eea610ef7ee732aa1f657b34a351ebcfa64a24c1=
e2a7aaec74c1e038"
> +
> +S =3D "${WORKDIR}/upx-${PV}-src"
> +
> +inherit pkgconfig cmake
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_g=
it.bb
> deleted file mode 100644
> index 2a5f08be..00000000
> --- a/recipes-extended/upx/upx_git.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -HOMEPAGE =3D "http://upx.sourceforge.net"
> -SUMMARY =3D "Ultimate executable compressor."
> -
> -SRCREV_upx =3D "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
> -SRCREV_vendor_doctest =3D "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
> -SRCREV_vendor_lzma_sdk =3D "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
> -SRCREV_vendor_ucl =3D "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
> -SRCREV_vendor_zlib =3D "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
> -SRCREV_FORMAT =3D "upx"
> -SRC_URI =3D "git://github.com/upx/upx;name=3Dupx;branch=3Ddevel;protocol=
=3Dhttps \
> -           git://github.com/upx/upx-vendor-doctest;name=3Dvendor_doctest=
;subdir=3Dgit/vendor/doctest;branch=3Dupx-vendor;protocol=3Dhttps \
> -           git://github.com/upx/upx-vendor-lzma-sdk;name=3Dvendor_lzma_s=
dk;subdir=3Dgit/vendor/lzma-sdk;branch=3Dupx-vendor;protocol=3Dhttps \
> -           git://github.com/upx/upx-vendor-ucl;name=3Dvendor_ucl;subdir=
=3Dgit/vendor/ucl;branch=3Dupx-vendor;protocol=3Dhttps \
> -           git://github.com/upx/upx-vendor-zlib;name=3Dvendor_zlib;subdi=
r=3Dgit/vendor/zlib;branch=3Dupx-vendor;protocol=3Dhttps \
> -"
> -
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D353753597aa110e0ded3508408c63=
74a"
> -
> -DEPENDS =3D "zlib libucl xz cmake-native"
> -
> -# inherit cmake
> -
> -S =3D "${WORKDIR}/git"
> -
> -PV =3D "3.96+"
> -
> -EXTRA_OEMAKE +=3D " \
> -    UPX_UCLDIR=3D${STAGING_DIR_TARGET} \
> -    UPX_LZMADIR=3D${STAGING_DIR_TARGET} \
> -"
> -
> -# FIXME: The build fails if security flags are enabled
> -SECURITY_CFLAGS =3D ""
> -
> -do_compile() {
> -    oe_runmake -C src all
> -}
> -
> -do_install:append() {
> -    install -d ${D}${bindir}
> -    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
> -}
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8563): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8563
> Mute This Topic: https://lists.yoctoproject.org/mt/104312316/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

