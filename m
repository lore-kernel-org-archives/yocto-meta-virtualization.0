Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6BCC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:22:22 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.11930.1643995341370800370
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M7UzWopU;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id k25so6259918qtp.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H0ApyigRMFuNoqUDPkyveaML4kLg8zYcqzj0iydHiSY=;
        b=M7UzWopUfxf5Qcz59TtjKmuIi/K7g4ztCVBwdoMvxLoMiQoNewmYYcV33V7hghFmFr
         dXtz9iytwWrfRILI4p0iPE8Rtlln62BBuTBjX3ovHaj12vl6uX2o6HtACzN2Wv6GNIGf
         qgTqX4Xj0OiWJ8aGLA5BZPaL5jOCz3Zrfs3/l7tvETGXuou+9tMKS/eIPYyNrXi0L4JL
         /fRqBZJECRks9VNs1e8UQh001RsJ/F8gB2Is61xY/HlCU2LGkXgvivjQ9sMr2deCuNVG
         NoShWvXdTe+JXV8cVV+1KKLr+hELpU0OWDyFqm6KR9SI4088Qjr2Xom6kIL6kDTDuAZW
         x31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H0ApyigRMFuNoqUDPkyveaML4kLg8zYcqzj0iydHiSY=;
        b=LcfeQ+L9TMYvUx/FtSm8URb/1fLXB2wCise6N/2KoGhhpion1ZxTJxkHgUgJuH0ktB
         hlkoqAuAoOFOcokxWseBAuLtnzU7JvtbiQLuP/VDuoOwMchjCCx7LKXutGiZbSwYX4Ev
         QSK7guL8DQGmDRRZ4P1JTDHXgK2UIpAoSvtM9vyQIavZh6Ra50MsakLxWj8y5bfkGRlA
         xpKvk3TmtLzoDIbxPq6XaYC7z34vwzHuTAVLwW8Gzpq9OQJTlHIrZlfpq57Igl9Y9Sgp
         R6UZoRqThKVcWVY1RF4rcShNUncXyc5xZ06RDSomMQmJzd3a6OMTS2QmRkADnlu4JQD5
         qRBA==
X-Gm-Message-State: AOAM533ABViitGVAokV8MQcOIQpnGb4hENcbpYCoctWL19f8j+WUFIck
	BN9eBFjF5rKjyrjNNZ5xPukqqRobPSsu3A==
X-Google-Smtp-Source: 
 ABdhPJzB4eSI6iauhCjncoxkKTqS50mv3IhRbckgm1dtRR5FhRcW5f5yuETYMsmM+nGJxRpfhzDY0g==
X-Received: by 2002:ac8:5fce:: with SMTP id k14mr2719036qta.235.1643995340339;
        Fri, 04 Feb 2022 09:22:20 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w8sm1404199qti.21.2022.02.04.09.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:22:19 -0800 (PST)
Date: Fri, 4 Feb 2022 12:22:18 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [hardknott][PATCH] libvirt: fix
 CVE-2021-3975
Message-ID: <20220204172217.GD451@gmail.com>
References: <20220129071457.45838-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129071457.45838-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:22:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7052

merged to hardknott.

Bruce

In message: [meta-virtualization] [hardknott][PATCH] libvirt: fix CVE-2021-3975
on 29/01/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libvirt/libvirt/CVE-2021-3975.patch       | 43 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_6.3.0.bb     |  1 +
>  2 files changed, 44 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2021-3975.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch b/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch
> new file mode 100644
> index 0000000..72cee94
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch
> @@ -0,0 +1,43 @@
> +From 30de45c73106cacfc0aacc8f11c88e1aa5372d77 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Sat, 29 Jan 2022 13:25:54 +0800
> +Subject: [PATCH] qemu: Add missing lock in qemuProcessHandleMonitorEOF
> +
> +qemuMonitorUnregister will be called in multiple threads (e.g. threads
> +in rpc worker pool and the vm event thread).  In some cases, it isn't
> +protected by the monitor lock, which may lead to call g_source_unref
> +more than one time and a use-after-free problem eventually.
> +
> +Add the missing lock in qemuProcessHandleMonitorEOF (which is the only
> +position missing lock of monitor I found).
> +
> +Suggested-by: Michal Privoznik <mprivozn@redhat.com>
> +Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> +Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> +Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/libvirt/libvirt/commit/1ac703a7d0789e46833f4013a3876c2e3af18ec7]
> +CVE: CVE-2021-3975
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/qemu/qemu_process.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/qemu/qemu_process.c b/src/qemu/qemu_process.c
> +index 8ea470f..64b8472 100644
> +--- a/src/qemu/qemu_process.c
> ++++ b/src/qemu/qemu_process.c
> +@@ -315,7 +315,9 @@ qemuProcessHandleMonitorEOF(qemuMonitorPtr mon,
> +     /* We don't want this EOF handler to be called over and over while the
> +      * thread is waiting for a job.
> +      */
> ++    virObjectLock(mon);
> +     qemuMonitorUnregister(mon);
> ++    virObjectUnlock(mon);
> + 
> +     /* We don't want any cleanup from EOF handler (or any other
> +      * thread) to enter qemu namespace. */
> +-- 
> +2.17.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
> index 091296e..8e95ad6 100644
> --- a/recipes-extended/libvirt/libvirt_6.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
> @@ -46,6 +46,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://CVE-2020-25637_4.patch \
>             file://CVE-2021-3631.patch \
>             file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
> +           file://CVE-2021-3975.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7038): https://lists.yoctoproject.org/g/meta-virtualization/message/7038
> Mute This Topic: https://lists.yoctoproject.org/mt/88762739/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


