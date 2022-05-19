Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0FFC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 20:35:07 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.751.1652992500971719380
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 13:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RGqIu9VR;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id q135so10977322ybg.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 13:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7G9EX4NLHMbKfY02HCdl6KVHaEMi9JxvhnTIeN/jWU=;
        b=RGqIu9VRH8sJxT+OmBpDq+s0K0ak7bSGlloaGOR3lj150hmPgI7nXeIYfaLnlkVKi3
         D4sLeSbVpwguy+hTXVNgb9hlPULvahoqCh8NJP4LplDVB+6hWUnjF8kB02krsamFIjsa
         dKncK/Ez7y0u63fmIVWa0mlA4iqYlePasSpGYNPnLr+hOH+3pc+q2mtDnXIUITprnTS+
         lU+FlGtN5tajwba9T3TubHWvax3Yuppy+G9BzwaqZQY1BqNM0tXWng8df6SMV2KSy9Mm
         JPiu9HL8Sfyp6CcAFF08zUM2xNiXHRCVlZ6C56py8/iJtdJllM3YncHMDnUdjyVGtrRq
         itmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7G9EX4NLHMbKfY02HCdl6KVHaEMi9JxvhnTIeN/jWU=;
        b=QOxc3DhY/Ib1Vu44XxP+GDNis62Et9D3zVaWrlqhQnizCHStzuVi7YhaTgoh/6Y40q
         9YyHIVdy7zVESTLHPxGHpGCK8GmcqLLYCb3QUhNOF1a3wdl5nv9Nt16Lrof9mam83mc0
         sOD8dOIxkmOouYGxnGeUOvDE4TsTSN93Yj6Rbjd0l1V9E2WlpKPuJFwF8Sabiie7bFrY
         7BcHCeiG+HvvLWhvMLRaGCjiW4r1nRQSX2nTm7MgbVNGAtkeSQls6qoU7UQ0UIu067y9
         fgdvvlhzcwKgt/w7cJZdtxHEmHcG+9qIuVLQ544QNzwZ/kwbPysy8xW7r9RYAX2dNxPC
         kXSA==
X-Gm-Message-State: AOAM533k0xhLry9S8MsH8o5BaHSavdsVBUKkf7IzepMRPRpWiQyyHg5s
	V5u9G54Xd/JpMa0lAYJ6MP7YwYHeqXpdDJ9YzxE=
X-Google-Smtp-Source: 
 ABdhPJxfZrIaCcMg455TE2vmo0lC6ERXlKId6t/xl3scdxd8kLa/JsCpy5vT+0Ik1WWrAv7gd3jTAFu4fIKWbRwjv20=
X-Received: by 2002:a25:b6c9:0:b0:64a:9f32:5ac4 with SMTP id
 f9-20020a25b6c9000000b0064a9f325ac4mr5907586ybm.131.1652992500033; Thu, 19
 May 2022 13:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220519193936.39214-1-sakib.sajal@windriver.com>
In-Reply-To: <20220519193936.39214-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 May 2022 16:34:49 -0400
Message-ID: 
 <CADkTA4PnUxAvrEYoMuiSBMK4mvwT+SVoX_j0AJ_aSm=Ne+09sw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: do not build or install docs
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 May 2022 20:35:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7293

On Thu, May 19, 2022 at 3:39 PM <sakib.sajal@windriver.com> wrote:
>
> When using oe-core, podman do_compile fails with the error:
>    .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/bin/go-md2man:
>    No such file or directory
>    make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Error 127
> Whereas when using poky, the build passes without issues.
>
> Investigating the native go-md2man binaries from both oe-core and poky
> builds using ldd, it appears that the issue lies with how go-md2man is linked.
> On oe-core it is linked to the loader in recipe sysroot:
>    tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
>    => /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)
>
> whereas on poky its linked to sysroot-uninative:
>    tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>    => /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)
>
> I have confirmed that this issue exists on both Ubuntu 18.04 and
> Fedora 35.
>
> Rather have this fail for people using only oe-core, skip generating the
> documentation for podman until the problem can be resolved.

I'm building podman nightly without seeing this error.

So your message about "people using only oe-core" doesn't make sense,
can you clarify ?

Bruce


>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
>
> diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> new file mode 100644
> index 0000000..1363ee8
> --- /dev/null
> +++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
> @@ -0,0 +1,35 @@
> +From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Fri, 13 May 2022 13:06:29 -0400
> +Subject: [PATCH] Makefile: do not compile or install docs
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index cb230d8e9..7e07ab61a 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -202,7 +202,7 @@ GV_SHA=e943b1806d94d387c4c38d96719432d50a84bbd0
> + default: all
> +
> + .PHONY: all
> +-all: binaries docs
> ++all: binaries
> +
> + .PHONY: binaries
> + binaries: podman podman-remote rootlessport ## Build podman, podman-remote and rootlessport binaries
> +@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
> +       /usr/bin/podman info  # will catch a broken conmon
> +
> + .PHONY: install
> +-install: .gopathok install.bin install.remote install.man install.systemd  ## Install binaries to system locations
> ++install: .gopathok install.bin install.remote install.systemd  ## Install binaries to system locations
> +
> + .PHONY: install.catatonit
> + install.catatonit:
> +--
> +2.33.0
> +
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f805cb6..8339a16 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,6 +20,7 @@ DEPENDS = " \
>  SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
> +    file://0001-Makefile-do-not-compile-or-install-docs.patch \
>  "
>
>  LICENSE = "Apache-2.0"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7290): https://lists.yoctoproject.org/g/meta-virtualization/message/7290
> Mute This Topic: https://lists.yoctoproject.org/mt/91216450/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

