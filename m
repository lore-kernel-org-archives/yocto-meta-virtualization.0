Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.3931.1638417870166975548
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 20:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mskKUqOt;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id m25so26260521qtq.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aMRaGFw7xH1nCq5dycyNWy6jwrAkWwI+sU6VDtRcpW8=;
        b=mskKUqOt/GVqzxC5/IasfaBUW4F9gW7Rp74YggOHdMtLHIHMMtd1pyPjxwezpp6DEP
         lLUZOVLjRax/tykBthpkJLQ50osZv0lWlIiWuf5D8QNB0YqMYG/IzT8NlWEmR6u0RUYI
         uhiOiKYN5x6i+V2G2LLFcrwv/1ut7BiwsscFB7fpFDrdJxzIqBS3xX7v1auIZdWUt5DO
         pcF+0aGvN2dONvVrYkjO/Tlr268f/Y9RxNaLEGeEc7iCa1ExkG1pGLHt5yzPI4AKrj7q
         G6f0r/pAUiYdv5P3/8+PXE2WxyzNhkB98Fi+bTq1Hy+b9vXR21Ffq6LmP/XSZc+jfZUh
         tRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aMRaGFw7xH1nCq5dycyNWy6jwrAkWwI+sU6VDtRcpW8=;
        b=RGcoqTGVkdnsFeWSdHn3mtbjib5NV97EnLEDWjPBLH0v7RF77TGhCaFbmoQJ9nM7pq
         97lzZ/1tyqYXgZg+Hn3YOGHoY7BsWRt09y45FEc25+nTq2a3iNMXkHoZZohp30v8DnEY
         rPbmqc+IzkkRZiWOURAy6jyyU2dvPw9H/a9NsoekIjJJ6MMTYmz9qkV5knY3dspXMpwc
         SUgdZ04A/zjR7MM0z7WJb7aSgwOOGwP1EOGPSUBWYUreX4N2OQGLMCKTr3bplnLhUiZx
         1M/Vbz8exHENdb/+1mtQDR6FxoyplCIz3FedR4buU+StVQu8+/iG2gu7tLWxIBe+uvhv
         wq3w==
X-Gm-Message-State: AOAM530Sg8kvzYcgYofnYZuaY6aApAKsAdouwqfEYApYhJ/uLoIoifVv
	haZa5OTdTuIQ69wQtJVuDgc=
X-Google-Smtp-Source: ABdhPJzA0EevXo8H1h+yIdz2zuYNMe7qtqQ5V77nuhKueOmBqVDwxRAhpLUk9iUhGZ+Gs7Bgwb4gRQ==
X-Received: by 2002:ac8:5f4e:: with SMTP id y14mr11355547qta.305.1638417869125;
        Wed, 01 Dec 2021 20:04:29 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id l14sm787681qki.133.2021.12.01.20.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 20:04:28 -0800 (PST)
Date: Wed, 1 Dec 2021 23:04:27 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][honister][PATCH 1/5] uxen-guest-tools: fix build against kernels 5.4+
Message-ID: <20211202040424.GA17427@gmail.com>
References: <20211201164034.33610-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211201164034.33610-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

5/5 are now merged to honister.

Thanks!

Bruce

In message: [meta-virtualization][honister][PATCH 1/5] uxen-guest-tools: fix build against kernels 5.4+
on 01/12/2021 Martin Jansa wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> This is a compile only fix to update the uxen kernel modules to
> work against newer kernels.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...m-support-fix-build-for-kernel-s-5.4.patch | 97 +++++++++++++++++++
>  .../uxen/uxen-guest-tools_4.1.8.bb            |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch
> 
> diff --git a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch
> new file mode 100644
> index 0000000..a3325ce
> --- /dev/null
> +++ b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-kernel-s-5.4.patch
> @@ -0,0 +1,97 @@
> +From 21bb6953a64390dd1c5a8b7520eb5e2c18ea3ff1 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Mon, 29 Nov 2021 21:01:03 -0500
> +Subject: [PATCH] vm-support: fix build for kernel's > 5.4
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +---
> + a/uxenhc/hypercall.c             | 10 +++++++++-
> + a/v4vvsock/v4v_vsock.c           |  2 ++
> + a/vmdiagnostics/vm_diagnostics.c |  9 ++++++++-
> + 3 files changed, 19 insertions(+), 2 deletions(-)
> +
> +diff --git a/uxenhc/hypercall.c b/uxenhc/hypercall.c
> +index 0b9ef3f..04957a8 100644
> +--- a/uxenhc/hypercall.c
> ++++ b/uxenhc/hypercall.c
> +@@ -10,6 +10,7 @@
> + #include <linux/mm.h>
> + #include <linux/spinlock.h>
> + #include <linux/compiler.h>
> ++#include <linux/version.h>
> + 
> + #include <xen/xen.h>
> + #include <xen/version.h>
> +@@ -124,7 +125,11 @@ static int __init uxen_hypercall_init(void)
> +     printk(KERN_INFO "using uxen hypervisor\n");
> + 
> +     if (!uxen_hcbase) {
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,8,0))
> +         uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL, PAGE_KERNEL_EXEC);
> ++#else
> ++	uxen_hcbase =  __vmalloc(PAGE_SIZE, GFP_KERNEL);
> ++#endif
> +         if (!uxen_hcbase) {
> +             ret = -ENOMEM;
> +             goto out;
> +@@ -149,8 +154,11 @@ static void __exit uxen_hypercall_exit(void)
> + {
> + }
> + 
> ++
> ++#define KBUILD_MODFILE "uxenhc"
> ++
> + module_init(uxen_hypercall_init);
> + module_exit(uxen_hypercall_exit);
> ++MODULE_LICENSE("GPL");
> + MODULE_AUTHOR("paulian.marinca@bromium.com");
> + MODULE_DESCRIPTION("uXen hypercall support");
> +-MODULE_LICENSE("GPL");
> +diff --git a/v4vvsock/v4v_vsock.c b/v4vvsock/v4v_vsock.c
> +index 8d80d7d..cd7e8ce 100644
> +--- a/v4vvsock/v4v_vsock.c
> ++++ b/v4vvsock/v4v_vsock.c
> +@@ -578,8 +578,10 @@ static const struct proto_ops vsock_dgram_ops = {
> +     .ioctl = sock_no_ioctl,
> +     .listen = sock_no_listen,
> +     .shutdown = sock_no_shutdown,
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,10,0))
> +     .setsockopt = sock_no_setsockopt,
> +     .getsockopt = sock_no_getsockopt,
> ++#endif
> +     .sendmsg = vsock_sendmsg,
> +     .recvmsg = vsock_recvmsg,
> +     .mmap = sock_no_mmap,
> +diff --git a/vmdiagnostics/vm_diagnostics.c b/vmdiagnostics/vm_diagnostics.c
> +index 9ff94fb..db14e57 100644
> +--- a/vmdiagnostics/vm_diagnostics.c
> ++++ b/vmdiagnostics/vm_diagnostics.c
> +@@ -22,6 +22,7 @@
> + #include <linux/timekeeping.h>
> + #include <linux/types.h>
> + #include <linux/vmstat.h>
> ++#include <linux/version.h>
> + 
> + #include <uxen-v4vlib.h>
> + 
> +@@ -403,10 +404,16 @@ static void vm_handle_request_stat_task(struct vm_diagnostics_context *context,
> +  
> +             task_payload.state = task_state_to_char(task);
> +             task_payload.num_threads = get_nr_threads(task);
> ++
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5,5,0))
> +             task_payload.start_time_nsec = task->real_start_time;
> ++#else
> ++            task_payload.start_time_nsec = task->start_boottime;
> ++#endif
> ++
> +             task_payload.last_run_cpu_id = task_cpu(task);
> + 
> +-            thread_group_cputime_adjusted(task, &user_nsec, &system_nsec);
> ++            //thread_group_cputime_adjusted(task, &user_nsec, &system_nsec);
> +             task_payload.user_nsec = user_nsec;
> +             task_payload.system_nsec = system_nsec;
> + 
> +-- 
> +2.19.1
> +
> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> index 2ca0cb1..06dc376 100644
> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> @@ -9,6 +9,7 @@ SRC_URI = " \
>      https://www.bromium.com/wp-content/uploads/2019/11/uxen-${PV}.zip;name=uxen \
>      https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
>      file://fix-Makefile-for-OE-kernel-build.patch \
> +    file://0001-vm-support-fix-build-for-kernel-s-5.4.patch \
>      "
>  
>  SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
> -- 
> 2.32.0
> 
