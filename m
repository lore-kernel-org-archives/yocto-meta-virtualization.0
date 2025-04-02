Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FBFC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:21:31 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.4367.1743560474937243263
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 19:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXWbxvEq;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47662449055so32653331cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560474; x=1744165274; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fwpai+f2tVJ591u8ShP8Xg5KPrqf0G5vi4yoNryHxQ=;
        b=AXWbxvEqx7pSQvviOQbudS/1lU0piQFx1Cq4iD+rMHNijTjkF2dVTdDQocvvLjGArs
         xykpnSZLCzUgeT0W1zyb8mnXsigauf05OO4xkvahWn1NP3eymGi5HrIQ906j3k7wa90t
         4/WCLdChvF6jcQZIYYwfSVAVE2Pc1HtN9DWoXfWWg0qUMepGhwgiYOFK7AICDx76PB5m
         /IoFlkYeuNpCLiDhrr/3Wp4r/mRdSANcSr1gAW8vVBJ71sivLYYQdgGrdZvuXA8NlkI8
         XFtHeGy+OhXTMgIPBHg0/lSBbZaPI9skjq12x412sf/D63wDsnL94vy41thlrEDn/NUZ
         Glqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560474; x=1744165274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fwpai+f2tVJ591u8ShP8Xg5KPrqf0G5vi4yoNryHxQ=;
        b=umLIA2P6DNf/CD+ch4enuhtbfNlaLh7dv4NIgpb9uelEck/gwqcVR+OxrGJ8VNUSru
         /ucwH5aA0oeGsrauSQFuU4i73+L6PMlFLpQE7hwOW/f6TJPaZC9bj5XnPAvGI7bZW0hr
         aLYRf2OStDs4Pu+a+r7q2Tv/qcDdviDj93nDXea6Ih9D/VyM2PJhuKYvWWMOqqVMk+KK
         Vfvu4ckO4yID2Z6ISh035o2/7L5c/vQ/SXxypDAdDNjXBmxrKgTmaDhVLgroNRZxtCx0
         K5MIvYfQdhnQ9xo2h5K3RmPLIpU4JAMKINIJuAlBSStdOaAWdMg375mGIF95hA1auJwN
         J72g==
X-Gm-Message-State: AOJu0Yy8taSBg4wqnM3DqIbibiyckodN0RizOK/ktrELQmekWY+qWurx
	yo/O1nvQyPoOb/I+ERLR6ag8gGLfEO9uvRygi908f8AzoCmbzZOA
X-Gm-Gg: ASbGnct671XACuU/EAqaZpw1VBpLhilrNT1B0TxR+Wltm3W+lj/1vyfB5SrvUrUJGps
	K0wHMeKRXpimeZmnOkSdkF79+wjrTL9uURzngXp3ewfNCguEcNord1Ro4VuBeNa4Nranq8g8kSk
	OaxVKX8YJOVKCdZfqn4N+L9zHRKA1bUzJAQThz9YWkoeDH+ZF5sYvpf4ivnsB9KTMcRnW1j0RLd
	gzVLgg8tNj2uFyz+qsuH9eOTx89roSUq23RAPA8GZMYzwLtRF+5YBN/Gb6IvzFxiWq8T0vj+v40
	mplLyp35R2oHz1iUBUzweKykeqXxCbSnN2FvX6P7J2L4fR+W9HENnvilTOtAwoGCYYR/t21PqYm
	gEaFoBrI+s84qLR5kHljH1c4=
X-Google-Smtp-Source: AGHT+IEaMuR/fVWnEtHg7AnnAOUOhNOz4jWpRDXOY6oKFSdeAvGlPD0l+xQUwzlKWDNHIrMeh6YiJQ==
X-Received: by 2002:a05:622a:107:b0:472:28d:62b0 with SMTP id d75a77b69052e-477f79d6039mr226562821cf.41.1743560473784;
        Tue, 01 Apr 2025 19:21:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317ba3bsm73643601cf.51.2025.04.01.19.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:21:13 -0700 (PDT)
Date: Wed, 2 Apr 2025 02:21:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: guocai.he.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][carthgap][PATCH 1/1] criu: Adjust to glibc
 __rseq_size semantic change
Message-ID: <Z-yfF0ZdirCQvT9e@gmail.com>
References: <20250325084039.294966-1-guocai.he.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325084039.294966-1-guocai.he.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 02:21:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9183


merged.

Bruce

In message: [meta-virtualization][carthgap][PATCH 1/1] criu: Adjust to glibc __rseq_size semantic change
on 25/03/2025 guocai he via lists.yoctoproject.org wrote:

> From: Guocai He <guocai.he.cn@windriver.com>
> 
> On criu version 3.19.0:
> When use "criu restore -d -D checkpoint" to restore, the error is:
> 1272: Error (criu/cr-restore.c:1498): 1295 killed by signal 11: Segmentation fault
> 
> The root casue is that the glibc updated and criu should adjust to glibc __rseq_size semantic change.
> 
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb           |  3 +-
>  ...to-glibc-__rseq_size-semantic-change.patch | 94 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 09503624..cccd3e3c 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -21,7 +21,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
>             file://0002-criu-Change-libraries-install-directory.patch \
>             file://0003-crit-pycriu-build-and-install-wheels.patch \
>             file://0004-pycriu-attr-pycriu.version.__version__.patch \
> -	   file://0005-pycriu-skip-dependency-check-during-build.patch \
> +           file://0005-pycriu-skip-dependency-check-during-build.patch \
> +           file://0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch \
>             "
>  
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> diff --git a/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch b/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
> new file mode 100644
> index 00000000..29715614
> --- /dev/null
> +++ b/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
> @@ -0,0 +1,94 @@
> +From 123e558a4bfa8964f9e55d0c0ecc080e6c3a38f3 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 10 Jul 2024 18:34:50 +0200
> +Subject: [PATCH] criu: Adjust to glibc __rseq_size semantic change
> +
> +In commit 2e456ccf0c34a056e3ccafac4a0c7effef14d918 ("Linux: Make
> +__rseq_size useful for feature detection (bug 31965)") glibc 2.40
> +changed the meaning of __rseq_size slightly: it is now the size
> +of the active/feature area (20 bytes initially), and not the size
> +of the entire initially defined struct (32 bytes including padding).
> +The reason for the change is that the size including padding does not
> +allow detection of newly added features while previously unused
> +padding is consumed.
> +
> +The prep_libc_rseq_info change in criu/cr-restore.c is not necessary
> +on kernels which have full ptrace support for obtaining rseq
> +information because the code is not used.  On older kernels, it is
> +a correctness fix because with size 20 (the new value), rseq
> +registeration would fail.
> +
> +The two other changes are required to make rseq unregistration work
> +in tests.
> +
> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/
> +089345f77a34d1bc7ef146d650636afcd3cdda21]
> +
> +Signed-off-by: Florian Weimer <fweimer@redhat.com>
> +Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> +---
> + criu/cr-restore.c             | 8 ++++++++
> + test/zdtm/static/rseq00.c     | 5 ++++-
> + test/zdtm/transition/rseq01.c | 5 ++++-
> + 3 files changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/criu/cr-restore.c b/criu/cr-restore.c
> +index 270049721..80eb13743 100644
> +--- a/criu/cr-restore.c
> ++++ b/criu/cr-restore.c
> +@@ -3103,7 +3103,15 @@ static void prep_libc_rseq_info(struct rst_rseq_param *rseq)
> + 	if (!kdat.has_ptrace_get_rseq_conf) {
> + #if defined(__GLIBC__) && defined(RSEQ_SIG)
> + 		rseq->rseq_abi_pointer = encode_pointer(__criu_thread_pointer() + __rseq_offset);
> ++		/*
> ++		 * Current glibc reports the feature/active size in
> ++		 * __rseq_size, not the size passed to the kernel.
> ++		 * This could be 20, but older kernels expect 32 for
> ++		 * the size argument even if only 20 bytes are used.
> ++		 */
> + 		rseq->rseq_abi_size = __rseq_size;
> ++		if (rseq->rseq_abi_size < 32)
> ++			rseq->rseq_abi_size = 32;
> + 		rseq->signature = RSEQ_SIG;
> + #else
> + 		rseq->rseq_abi_pointer = 0;
> +diff --git a/test/zdtm/static/rseq00.c b/test/zdtm/static/rseq00.c
> +index 471ad6a43..7add7801e 100644
> +--- a/test/zdtm/static/rseq00.c
> ++++ b/test/zdtm/static/rseq00.c
> +@@ -46,12 +46,15 @@ static inline void *__criu_thread_pointer(void)
> + static inline void unregister_glibc_rseq(void)
> + {
> + 	struct rseq *rseq = (struct rseq *)((char *)__criu_thread_pointer() + __rseq_offset);
> ++	unsigned int size = __rseq_size;
> + 
> + 	/* hack: mark glibc rseq structure as failed to register */
> + 	rseq->cpu_id = RSEQ_CPU_ID_REGISTRATION_FAILED;
> + 
> + 	/* unregister rseq */
> +-	syscall(__NR_rseq, (void *)rseq, __rseq_size, 1, RSEQ_SIG);
> ++	if (__rseq_size < 32)
> ++		size = 32;
> ++	syscall(__NR_rseq, (void *)rseq, size, 1, RSEQ_SIG);
> + }
> + #else
> + static inline void unregister_glibc_rseq(void)
> +diff --git a/test/zdtm/transition/rseq01.c b/test/zdtm/transition/rseq01.c
> +index 0fbcc2dca..08a7a8e1a 100644
> +--- a/test/zdtm/transition/rseq01.c
> ++++ b/test/zdtm/transition/rseq01.c
> +@@ -33,7 +33,10 @@ static inline void *thread_pointer(void)
> + static inline void unregister_old_rseq(void)
> + {
> + 	/* unregister rseq */
> +-	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), __rseq_size, 1, RSEQ_SIG);
> ++	unsigned int size = __rseq_size;
> ++	if (__rseq_size < 32)
> ++		size = 32;
> ++	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), size, 1, RSEQ_SIG);
> + }
> + #else
> + static inline void unregister_old_rseq(void)
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9173): https://lists.yoctoproject.org/g/meta-virtualization/message/9173
> Mute This Topic: https://lists.yoctoproject.org/mt/111893502/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


