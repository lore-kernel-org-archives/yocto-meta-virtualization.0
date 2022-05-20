Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B233C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:55:22 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web12.8450.1653051316257720659
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 May 2022 05:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hxeVH8EC;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2ff39b44b06so85849647b3.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 May 2022 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgRz0ImnzSQeC3YnjZXScMyC6vipmo1OE6NV/3pdpQw=;
        b=hxeVH8EC/ul7EusVQ4Y4C4/uN8V/XEY/7lE3nhxkQGjq4PnTxo4OkVRaol7u5ZIoZ9
         V9Y+yQsyskLDsGbbgFg/A+bjsTKoNDK6p/bIzASl8PTN4isK8WyotqfAKVQ9u2hqMjPI
         pSUwic3HKL73mWoIlu8Y1oJUqeIdrZwzMb+yoWlpe2SQa+ImO7FchrXeOz3z0B1DG67a
         jeRyIXr8DWyChUNfbhos/0JP9Da7z5giVnOsTJTc6k8RpckyOFEpYPzrxKoFKhjmAHUf
         DgBjl8eAdcwGcym6WOVZTC3U9c8ZF6cFE0wD8FEQfaiH3xczNzgNCG4cT1F08xWzkxEK
         4ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgRz0ImnzSQeC3YnjZXScMyC6vipmo1OE6NV/3pdpQw=;
        b=kavTCAyoFUlHzlZlwYI4s95jeqyslPl6wKDidvmTHDRbhcrlZnmSvWxsOXMTd+9FpH
         cc/9PsNZTAi867BiApWJHDOCCFOWAPue1YxYLZ9WgxgAgyEEK6QMZ3NthzyIjaCVaxPD
         wD0rZHQxCecgp24YEY0hSUq8c8FS/G0KSM5XRMRiPhANzu/XSB+nvty+pAJ9vBsaVBuz
         P72JiCIW83+SzcTgIVf2Cpkbe20fAVVyHYLDFU6A6aA3Kw35x+qFoX4WhvIcUieRd2Gw
         u/RxslnA0/enY4IPzK4fZ9mbEjlSnaCV3QV4DwRHyfMHav/k8Uv9X1MvDUF27NkSZYm9
         mP/g==
X-Gm-Message-State: AOAM532TqG8Z5Z4bMRBwZLR6qPK4LUEKmbnG65sOMbFp6Dt0gQ8GHl0U
	GyrwSwR0eclVQOLPlj29Uf468gFxSIE+T9TjWC7Prg/BpuQ=
X-Google-Smtp-Source: 
 ABdhPJwt1WqdG3YEzwu3ZgJn7AAeIPzMVyhLjjcnh1uOnQfga/Y8MS3rs+Y3LP23lf7fDzee4VvxQkiSla9XLhVFbjk=
X-Received: by 2002:a81:6dd4:0:b0:2ff:413a:f812 with SMTP id
 i203-20020a816dd4000000b002ff413af812mr9934092ywc.323.1653051315267; Fri, 20
 May 2022 05:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220519193936.39214-1-sakib.sajal@windriver.com>
 <CADkTA4PnUxAvrEYoMuiSBMK4mvwT+SVoX_j0AJ_aSm=Ne+09sw@mail.gmail.com>
 <9bfc9744-309c-d087-6f8f-d81bf46f1419@windriver.com>
In-Reply-To: <9bfc9744-309c-d087-6f8f-d81bf46f1419@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 May 2022 08:55:04 -0400
Message-ID: 
 <CADkTA4PhqOSn=s9E+N4wQKy=GFAY2yBTzBs41p4KJ6CbWP_wuQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: do not build or install docs
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 May 2022 12:55:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7296

On Fri, May 20, 2022 at 12:06 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2022-05-19 16:34, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Thu, May 19, 2022 at 3:39 PM <sakib.sajal@windriver.com> wrote:
> >> When using oe-core, podman do_compile fails with the error:
> >>     .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/bin/go-md2man:
> >>     No such file or directory
> >>     make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Error 127
> >> Whereas when using poky, the build passes without issues.
> >>
> >> Investigating the native go-md2man binaries from both oe-core and poky
> >> builds using ldd, it appears that the issue lies with how go-md2man is linked.
> >> On oe-core it is linked to the loader in recipe sysroot:
> >>     tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
> >>     => /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)
> >>
> >> whereas on poky its linked to sysroot-uninative:
> >>     tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> >>     => /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)
> >>
> >> I have confirmed that this issue exists on both Ubuntu 18.04 and
> >> Fedora 35.
> >>
> >> Rather have this fail for people using only oe-core, skip generating the
> >> documentation for podman until the problem can be resolved.
> > I'm building podman nightly without seeing this error.
> >
> > So your message about "people using only oe-core" doesn't make sense,
> > can you clarify ?
> >
> > Bruce
>
> Apologies for being vague.
>
> podman fails to compile, on both Ubuntu 18.04 and Fedora 35, using the
> latest master branch of bitbake, openembedded-core, meta-openembedded
> and meta-virtualization.

ok, so this is specific to those distros. Since there are quite a few
different CI pipelines, and my own local builds that aren't seeing the
error.

>
> Below are the steps to reproduce and bblayers.conf (default local.conf):
>
> steps to reproduce:
>
> . openembedded-core/oe-init-build-env <build_dir>
>
> bitbake podman
>
>
> bblayers.conf :
>
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION = "7"
>
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
>
> BBLAYERS ?= " \
>    ..../repos/openembedded-core/meta \
>    ..../repos/meta-openembedded/meta-oe \
>    ..../repos/meta-openembedded/meta-python \
>    ..../repos/meta-openembedded/meta-networking \
>    ..../repos/meta-openembedded/meta-filesystems \
>    ..../repos/meta-virtualization \
>

ok, cool. Nothing strange in that configuration.

At this point, I'll suggest you carry that patch locally while you
work through the dependent recipe, since I'd rather not merge the
patch that disables the documentation for all distros.

I'll see if I can get myself a containerized environment and reproduce
the issue.

Bruce

>
> - Sakib
>
>
> >
> >
> >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> ---
> >>   ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++++
> >>   recipes-containers/podman/podman_git.bb       |  1 +
> >>   2 files changed, 36 insertions(+)
> >>   create mode 100644 recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> >>
> >> diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> >> new file mode 100644
> >> index 0000000..1363ee8
> >> --- /dev/null
> >> +++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> >> @@ -0,0 +1,35 @@
> >> +From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 2001
> >> +From: Sakib Sajal <sakib.sajal@windriver.com>
> >> +Date: Fri, 13 May 2022 13:06:29 -0400
> >> +Subject: [PATCH] Makefile: do not compile or install docs
> >> +
> >> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> +---
> >> + Makefile | 4 ++--
> >> + 1 file changed, 2 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/src/import/Makefile b/src/import/Makefile
> >> +index cb230d8e9..7e07ab61a 100644
> >> +--- a/src/import/Makefile
> >> ++++ b/src/import/Makefile
> >> +@@ -202,7 +202,7 @@ GV_SHA=e943b1806d94d387c4c38d96719432d50a84bbd0
> >> + default: all
> >> +
> >> + .PHONY: all
> >> +-all: binaries docs
> >> ++all: binaries
> >> +
> >> + .PHONY: binaries
> >> + binaries: podman podman-remote rootlessport ## Build podman, podman-remote and rootlessport binaries
> >> +@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
> >> +       /usr/bin/podman info  # will catch a broken conmon
> >> +
> >> + .PHONY: install
> >> +-install: .gopathok install.bin install.remote install.man install.systemd  ## Install binaries to system locations
> >> ++install: .gopathok install.bin install.remote install.systemd  ## Install binaries to system locations
> >> +
> >> + .PHONY: install.catatonit
> >> + install.catatonit:
> >> +--
> >> +2.33.0
> >> +
> >> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> >> index f805cb6..8339a16 100644
> >> --- a/recipes-containers/podman/podman_git.bb
> >> +++ b/recipes-containers/podman/podman_git.bb
> >> @@ -20,6 +20,7 @@ DEPENDS = " \
> >>   SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
> >>   SRC_URI = " \
> >>       git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
> >> +    file://0001-Makefile-do-not-compile-or-install-docs.patch \
> >>   "
> >>
> >>   LICENSE = "Apache-2.0"
> >> --
> >> 2.33.0
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7290): https://lists.yoctoproject.org/g/meta-virtualization/message/7290
> >> Mute This Topic: https://lists.yoctoproject.org/mt/91216450/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

