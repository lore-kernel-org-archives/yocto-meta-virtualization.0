Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D71BC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 20:45:13 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.57090.1674161108569829791
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 12:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzMbQGAH;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id g16so515159qtu.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U31n9aZMASFfhJvb8DOJ9UeolESGHdquayffSmKog+M=;
        b=dzMbQGAHaStBKekhnMuG1vTPcFqUEuOtq7akuoddISP8uCTBEvXrKkWiK84F52HQpf
         NspFnXx/wFLDg2IBUQRh5Q4k2UW2F/Dp1M9WqoSyoVR62eH4QMzjOnn2CMHKt6mS89kJ
         qF/oqIzEf++6fCS9sjqT7WF8PhmQoPInXedmYK843gjbHVWDBJZl0C7rJ1XsE+eJuYWK
         rHAww0DTVwuB0jL6+e4fjb4zP0ZMN/AtdGHeZI1af31I+ckiJwQD3ivtV6CusGHvQCFu
         G+G0XU6Yx6bfC83dxeXoWuDbcZESut9osxsUaQLRysi90Cz7O+18dEZZ0N4NyGShjZci
         m7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U31n9aZMASFfhJvb8DOJ9UeolESGHdquayffSmKog+M=;
        b=bkItmg8u6IUtLhPiHtiY44SsIcv3xILk9tnv7DfX4qn/v2N1a14MfeUIhqT0Og85v+
         gtruFequ/p5/wbJ8X4e+oejkLKR/HhjFYGnEx3ZQ4nYZ5/y1SFQtnitrjqjoaPRJyrGP
         2RIYaZUMfJ4R3gcL+uupELhAIXDtPI9culLX/hfydAe1Ftp6mZgEqPd/Jgnhg5Yue2PG
         +F+ox/1cjuaZeJfB8lNK2zuw2HFF2moQgZbbRr5IInO7UHtULjv7FyYHRQCkCDr1Ea5r
         VdndeMWFvUja5K8Airq38ohLrZqsB44No7s93cJKMbjw+5zducO7LIwOPatTwngWSCa7
         3BXA==
X-Gm-Message-State: AFqh2koToA60abGG+jXfjvY+zYkPaCOrw9ETy6zMNzjYCwEhYiDJGFiN
	TF8uqSoUnhJ72dj8xCRIGEB3EaPQuih25g==
X-Google-Smtp-Source: AMrXdXuDmBHvYhRASIpOXt/QrfmzzlVp5Vo7eNTRyUHYmPFGkM2y1uaSs61j5Qrhx48RzfbfFR1+ag==
X-Received: by 2002:ac8:6049:0:b0:3b6:3040:a2fc with SMTP id k9-20020ac86049000000b003b63040a2fcmr22718632qtm.9.1674161107543;
        Thu, 19 Jan 2023 12:45:07 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a254f00b007056237b41bsm24749292qko.67.2023.01.19.12.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:45:07 -0800 (PST)
Date: Thu, 19 Jan 2023 15:45:05 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix libraries contain
 build folder path cause QA warning
Message-ID: <Y8mr0fWOQBB094zX@gmail.com>
References: <20230119092412.630153-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119092412.630153-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7825

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix libraries contain build folder path cause QA warning
on 19/01/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> libvirt debug trace contains source path, and some utils was located to
> yocto sysroot folder, those full source path cause yocto QA buildpath
> check failed and report "xxxx contains reference to TMPDIR" warnings.
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...ove-build-path-information-to-avoid-.patch | 58 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch b/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
> new file mode 100644
> index 0000000..1e09cd6
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
> @@ -0,0 +1,58 @@
> +From 9660b76325c841a5f5c7d5b2fb439a1fd64105c9 Mon Sep 17 00:00:00 2001
> +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> +Date: Thu, 19 Jan 2023 17:07:37 +0800
> +Subject: [PATCH] messon.build: remove build path information to avoid yocto QA
> + buildpath check warnings
> +
> +libvirt debug trace contains source path, and some utils was located to
> +yocto sysroot folder, those full source path cause yocto QA buildpath check failed and report warnings as below:
> +
> +WARNING: libvirt-8.1.0-r0 do_package_qa: QA Issue: File /usr/libexec/libvirt_lxc in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt.so.0.8001.0 in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/lock-driver/lockd.so in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/connection-driver/libvirt_driver_lxc.so in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/connection-driver/libvirt_driver_storage.so in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/connection-driver/libvirt_driver_network.so in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_fs.so in package libvirt contains reference to TMPDIR
> +File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_disk.so in package libvirt contains reference to TMPDIR
> +File /usr/bin/virt-ssh-helper in package libvirt contains reference to TMPDIR [buildpaths]
> +
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + meson.build | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 9016c04..fb78d44 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -26,8 +26,8 @@ endif
> + conf = configuration_data()
> + 
> + conf.set('_GNU_SOURCE', 1)
> +-conf.set_quoted('abs_top_builddir', meson.build_root())
> +-conf.set_quoted('abs_top_srcdir', meson.source_root())
> ++conf.set_quoted('abs_top_builddir', ' ')
> ++conf.set_quoted('abs_top_srcdir', ' ')
> + conf.set_quoted('PACKAGE', meson.project_name())
> + conf.set_quoted('PACKAGE_NAME', meson.project_name())
> + conf.set_quoted('PACKAGE_VERSION', meson.project_version())
> +@@ -1830,9 +1830,9 @@ if conf.has('WITH_LIBVIRTD')
> +       use_storage = true
> + 
> +       conf.set('WITH_STORAGE_FS', 1)
> +-      conf.set_quoted('MOUNT', mount_prog.path())
> +-      conf.set_quoted('UMOUNT', umount_prog.path())
> +-      conf.set_quoted('MKFS', mkfs_prog.path())
> ++      conf.set_quoted('MOUNT', '/usr/bin/mount')
> ++      conf.set_quoted('UMOUNT', '/usr/bin/umount')
> ++      conf.set_quoted('MKFS', '/usr/sbin/mkfs')
> + 
> +       showmount_prog = find_program('showmount', required: false, dirs: libvirt_sbin_path)
> +       showmount_path = ''
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 0ffd510..d529db1 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>             file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
> +           file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7818): https://lists.yoctoproject.org/g/meta-virtualization/message/7818
> Mute This Topic: https://lists.yoctoproject.org/mt/96374330/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


