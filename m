Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDF2C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 05:19:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.20614.1661404741276657962
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 22:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgOW2cQ0;
 spf=pass (domain: gmail.com, ip: 209.85.128.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-333a4a5d495so512713747b3.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 22:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TlABFw5wget+2t+XB6QqAhu1Pwh+0UiQkQ6IRHGsRkg=;
        b=GgOW2cQ0B/9kmu93d2w2AI966kmBYpkSuQMVLb01mXTUohgglE3o+b8sGwJPOB4YXs
         UJarLnAhAi2ja4I8SwwtahYErsSwhpU4x7vKqT5rvQw7pDd03cmNkRiQ/2kPlqDRSMdb
         4YD983GNTfeAKPNko5NJOq8lnviNpdLfjL3Ds2mYEw4zISg0uVfFy1E91ObKKa+/Mf8T
         xHEa5i9F2OqtUN6rDqGCHngaIdaGWM7ISYa9muhWwo66sh03LMMfKNDWv7XZEzZTl9YN
         lP1ZDaYdurT8Oem6gArxj61j3NHO+9EMzdEkCsLyLY+y2giuvXI0hc0+jjqpveXdfCGe
         Z4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TlABFw5wget+2t+XB6QqAhu1Pwh+0UiQkQ6IRHGsRkg=;
        b=vUf9HeSZE+ny/psrV8Hj2yKf+cM1A2TV95ciW8Vg0M6AOwGCaeYaFz7eMG57Cf4k4+
         kYSpNkHTnBAuYG+UCSePc/wOA/YR52R+ci1ecR7VfFmmNfQodURcewhLeF5F4lJSV336
         6zPTinHVxmAUBFo/VwsFuJ2rRv6E0vapbzLCGsz34h+dDMjiVIq7O5SBZebVqu7r18aK
         r19MHQXy54UxTWc9j++g4nnv+tMaDXZRFw858gbSkBYleVCW+Zf6cHIdu4UMEmWoqj0q
         DFsV0B/yvQiBZFcAi/Wu90mCBY7bTzvs5P2mrtzVgHx1loi1nF2EWMIdMVUf9Tb/S2vx
         6leA==
X-Gm-Message-State: ACgBeo1EnLtnosmra+PFksNgoOTbzT/M0Jv8xUhV/swVWXF0PTJ1I3Md
	yrIGPg9WLchhYKumm5+9zKjfnxW1sY2iGp/95AlzRiUDdpyDdg==
X-Google-Smtp-Source: 
 AA6agR5dr0k2VjQoxGi7cFjbOwElTYvU/407YapkxiCm/1uwKRdzUrWEwFvyHfM2xWbVnPT8/tanLw2wcVN8Qh/83r8=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr2432730ywf.71.1661404740221; Wed, 24 Aug
 2022 22:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220825033204.22165-1-kai.kang@windriver.com>
In-Reply-To: <20220825033204.22165-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 22:18:33 -0700
Message-ID: 
 <CAMKF1sqmihMGfZar+hK-om4zPZeZwmspM0+FXv2Qk_tEHvzVyw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix build with glibc-2.36
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 05:19:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7561

you wanna wait for the latest glibc patch I have sent to oe-core

https://lists.openembedded.org/g/openembedded-core/message/169820

this patch won't be needed. Infact test it out if you can.

On Wed, Aug 24, 2022 at 8:32 PM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> add only necessary definitions from linux/fs.h, because including whole
> causes conflicts with sys/mount.h:
>
> | In file included from /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/fs.h:19,
> |                  from ../libvirt-8.1.0/src/util/virfile.c:74:
> | /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
> |    95 | enum fsconfig_command {
> |       |      ^~~~~~~~~~~~~~~~
> | In file included from ../libvirt-8.1.0/src/util/virfile.c:46:
> | /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/sys/mount.h:189:6: note: originally defined here
> |   189 | enum fsconfig_command
> |       |      ^~~~~~~~~~~~~~~~
> | /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
> |    96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
> |       |         ^~~~~~~~~~~~~~~~~
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../0002-fix-build-with-glibc-2.36.patch      | 61 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch b/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch
> new file mode 100644
> index 0000000..bd7e59f
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch
> @@ -0,0 +1,61 @@
> +libvirt: fix build with glibc-2.36
> +
> +add only necessary definitions from linux/fs.h, because including whole
> +causes conflicts with sys/mount.h:
> +
> +| In file included from /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/fs.h:19,
> +|                  from ../libvirt-8.1.0/src/util/virfile.c:74:
> +| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
> +|    95 | enum fsconfig_command {
> +|       |      ^~~~~~~~~~~~~~~~
> +| In file included from ../libvirt-8.1.0/src/util/virfile.c:46:
> +| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/sys/mount.h:189:6: note: originally defined here
> +|   189 | enum fsconfig_command
> +|       |      ^~~~~~~~~~~~~~~~
> +| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
> +|    96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
> +|       |         ^~~~~~~~~~~~~~~~~
> +
> +...
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/lxc/lxc_container.c |  1 -
> + src/util/virfile.c      | 10 +++++++++-
> + 2 files changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
> +index d5410e9..3f49fb8 100644
> +--- a/src/lxc/lxc_container.c
> ++++ b/src/lxc/lxc_container.c
> +@@ -34,7 +34,6 @@
> + #include <linux/unistd.h>
> +
> + /* For MS_MOVE */
> +-#include <linux/fs.h>
> +
> + #if WITH_CAPNG
> + # include <cap-ng.h>
> +diff --git a/src/util/virfile.c b/src/util/virfile.c
> +index a04f888..1cf118d 100644
> +--- a/src/util/virfile.c
> ++++ b/src/util/virfile.c
> +@@ -71,7 +71,15 @@
> + # endif
> + # include <sys/ioctl.h>
> + # include <linux/cdrom.h>
> +-# include <linux/fs.h>
> ++// #include <linux/fs.h>       /* FIGETBSZ, FIBMAP, FS_IOC_* */
> ++// linux/fs.h unfortunately causes conflict with sys/mount.h since glibc-2.36
> ++// https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
> ++// add the necessary definitions
> ++
> ++#define FS_IOC_GETFLAGS                 _IOR('f', 1, long)
> ++#define FS_IOC_SETFLAGS                 _IOW('f', 2, long)
> ++#define FS_NOCOW_FL                     0x00800000 /* Do not cow file */
> ++
> + #endif
> +
> + #if WITH_LIBATTR
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 89f82bf..20e2e98 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://hook_support.py \
>             file://gnutls-helper.py \
>             file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
> +           file://0002-fix-build-with-glibc-2.36.patch \
>            "
>
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7560): https://lists.yoctoproject.org/g/meta-virtualization/message/7560
> Mute This Topic: https://lists.yoctoproject.org/mt/93242053/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

