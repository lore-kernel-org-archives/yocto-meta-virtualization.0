Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665C6C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 21:03:38 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.427.1651007010085621748
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kdb4kqaU;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id fu47so562385qtb.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZLijqMtQqxyESw9qeJX31WAnfxczyE1qG9NPVKBW49U=;
        b=Kdb4kqaU2aw/6vAw/ouKZnojlw6OTGSXisgnRfp0ZbEexaOfC0+/zGxLzskZfq8Bx6
         ruES+cx7ndRbDuX4KwYwP72CsZvD1vqs5aXkZWC2PG/5bnu80lzBv/neMyjdyYd116X1
         7P+1jy5CLoxmsG83TsmA8b1sCgvqpmm/eJcJBFisOSEU8F8ppZG6Xi5aMvb6u7P4+LpX
         MbHr4KQPD61rbojHDj/ORhQsigXkY+EN0M6yrJXdywDCGJftfdfezayAS46r6mDCAiL2
         GxZ5R7qOeDkHy0TCOem7AXIo+MkSaDlbvJgb5VtXbciZEO4/sNLFACZCR9e37PRSHmVY
         ZbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZLijqMtQqxyESw9qeJX31WAnfxczyE1qG9NPVKBW49U=;
        b=WUC9V/KoX/tB0b6l2oD1hRVOJCcdVzQyuQr94YkN6PN/+5TIGiSn8MhQIm8tqjm+6b
         o8x2E67JEHxgXvnIbNy6qTK3AkzC27fvbDd6iG9fhduI8a1nELtEj/8N5haZ/Lz66r7J
         FJp9omVSXZ5A41ModLrMsOwf2Sn2O91ONhp6sZ0ouQRnI+FCTvegSkqowIEwuIi2EPpw
         UlaArTJuLu4sEa5BY+EHuQ6PKRBeBUAMUkjLY0rpnY+Zdh0VLAyh1BIf+JR4PQV/MAZy
         DEHdzsc9LgKOlctmmAdbKE0VpO9BRAxQp2Zi2htpmyeemMqLPUBPZBcjkAjemWAo/MQp
         2Tbg==
X-Gm-Message-State: AOAM531VjEPYVxosSz+lZiGOa4uD6Ypo12w174he2h6DCZ9HDB9I6dy6
	fARskhryWM6yRa+FmayrXuI=
X-Google-Smtp-Source: 
 ABdhPJweK4CX0+vExKAAU2UqTTzJvqCpTA3Hc7Q2DFnF5Z8gPudP+26teZzWPPfaUU1gF1mdFgIsfA==
X-Received: by 2002:ac8:5f95:0:b0:2f1:fa72:4aef with SMTP id
 j21-20020ac85f95000000b002f1fa724aefmr16903897qta.263.1651007009021;
        Tue, 26 Apr 2022 14:03:29 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 i62-20020a37b841000000b0069c10d27571sm7141830qkf.70.2022.04.26.14.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 14:03:28 -0700 (PDT)
Date: Tue, 26 Apr 2022 17:03:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: Fix error on undefining
 domain and segfault on libvirt_driver_qemu.so
Message-ID: <20220426210325.GA55546@gmail.com>
References: <20220426075157.3961307-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426075157.3961307-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 21:03:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7220

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: Fix error on undefining domain and segfault on libvirt_driver_qemu.so
on 26/04/2022 He Zhe wrote:

> Backport a patch to fix segfault when undefining virtual machines.
> 
> virsh undefine vm
> rpc-libvirtd[9725]: segfault at 18 ip 00007f8b0a5f17a9 sp 00007f8b3f8cbb60
> error 4 in libvirt_driver_qemu.so[7f8b0a56e000+113000]
> error: Code: a4 01 0f 84 89 03 00 00 4c 89 ff e8 d1 ed f7 ff 85 c0 0f 88 b9
>              02 00 00 48 8b 45 b8 48 8b b0 80 00 00 00 48 8b 86 b0 02 00 00
>              <48> 8b 78 18 48 85 ff 0f 84 42 01 00 00 e8 b5 02 f8 ff 48 89 45 c0
> Disconnected from qemu:///system due to end of file
> error: Failed to undefine domain 'vm'
> error: End of file while reading data: Input/output error
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...n-fault-in-virtqemud-executing-qemuD.patch | 52 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch b/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch
> new file mode 100644
> index 00000000..85870e09
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch
> @@ -0,0 +1,52 @@
> +From 823a62ec8aac4fb75e6e281164f3eb56ae47597c Mon Sep 17 00:00:00 2001
> +From: Boris Fiuczynski <fiuczy@linux.ibm.com>
> +Date: Tue, 1 Mar 2022 18:47:59 +0100
> +Subject: [PATCH] qemu: segmentation fault in virtqemud executing
> + qemuDomainUndefineFlags
> +
> +Commit 5adfb3472342741c443ac91dee0abb18b5a3d038 causes a segmentation fault.
> +
> +Stack trace of thread 664419:
> + #0  0x000003ff62ec553c in qemuDomainUndefineFlags (dom=0x3ff6c002810, flags=<optimized out>) at ../src/qemu/qemu_driver.c:6618
> + #1  0x000003ff876a7e5c in virDomainUndefineFlags (domain=domain@entry=0x3ff6c002810, flags=<optimized out>) at ../src/libvirt-domain.c:6519
> + #2  0x000002aa2b64a808 in remoteDispatchDomainUndefineFlags (server=0x2aa2c3d7880, msg=0x2aa2c3d2770, args=<optimized out>, rerr=0x3ff8287b950, client=<optimized out>)
> +        at src/remote/remote_daemon_dispatch_stubs.h:13080
> + #3  remoteDispatchDomainUndefineFlagsHelper (server=0x2aa2c3d7880, client=<optimized out>, msg=0x2aa2c3d2770, rerr=0x3ff8287b950, args=<optimized out>, ret=0x0)
> +        at src/remote/remote_daemon_dispatch_stubs.h:13059
> + #4  0x000003ff8758bbf4 in virNetServerProgramDispatchCall (msg=0x2aa2c3d2770, client=0x2aa2c3e3050, server=0x2aa2c3d7880, prog=0x2aa2c3d8010)
> +        at ../src/rpc/virnetserverprogram.c:428
> + #5  virNetServerProgramDispatch (prog=0x2aa2c3d8010, server=server@entry=0x2aa2c3d7880, client=0x2aa2c3e3050, msg=0x2aa2c3d2770) at ../src/rpc/virnetserverprogram.c:302
> + #6  0x000003ff8758c260 in virNetServerProcessMsg (msg=<optimized out>, prog=<optimized out>, client=<optimized out>, srv=0x2aa2c3d7880) at ../src/rpc/virnetserver.c:140
> + #7  virNetServerHandleJob (jobOpaque=0x2aa2c3e2d30, opaque=0x2aa2c3d7880) at ../src/rpc/virnetserver.c:160
> + #8  0x000003ff874c49aa in virThreadPoolWorker (opaque=<optimized out>) at ../src/util/virthreadpool.c:164
> + #9  0x000003ff874c3f62 in virThreadHelper (data=<optimized out>) at ../src/util/virthread.c:256
> + #10 0x000003ff86c1cf8c in start_thread () from /lib64/libc.so.6
> + #11 0x000003ff86c9650e in thread_start () from /lib64/libc.so.6
> +
> +Signed-off-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> +Reviewed-by: Jim Fehlig <jfehlig@suse.com>
> +Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> +
> +Upstream-Status: Backport [823a62ec8aac4fb75e6e281164f3eb56ae47597c]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + src/qemu/qemu_driver.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
> +index bcd9bdb436..8337eed510 100644
> +--- a/src/qemu/qemu_driver.c
> ++++ b/src/qemu/qemu_driver.c
> +@@ -6615,7 +6615,7 @@ qemuDomainUndefineFlags(virDomainPtr dom,
> +         }
> +     }
> + 
> +-    if (vm->def->os.loader->nvram) {
> ++    if (vm->def->os.loader && vm->def->os.loader->nvram) {
> +         nvram_path = g_strdup(vm->def->os.loader->nvram);
> +     } else if (vm->def->os.firmware == VIR_DOMAIN_OS_DEF_FIRMWARE_EFI) {
> +         qemuDomainNVRAMPathFormat(cfg, vm->def, &nvram_path);
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index 61b7a443..f8deba45 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://dnsmasq.conf \
>             file://hook_support.py \
>             file://gnutls-helper.py \
> +           file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
> -- 
> 2.25.1
> 

