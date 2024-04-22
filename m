Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED59C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 15:12:33 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.21155.1713798745095738357
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 08:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abTuhToW;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f05341128so313866185a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713798744; x=1714403544; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Hlq9gzzG5dKPJVx31XBFPFZsblPfRJxaJy6oDx83QU=;
        b=abTuhToWsOZt7gBctB+Pbsz5AC1z+wcoV5ZMzetTa+MMjpgKgLhXGlHCvB93uejegq
         xRi3ex6SKuD7fFBd8CqHTOOhjRcxw5CGhlNtIRxDVTF1/GnWpuEckQ15gBPufSyqsTs4
         fWdOiVRi9sp9fk3GA8cMGlbvTutGLDb/j+xDlPTZxBHBy5pUX2AUK/nB8kaCMffABNE8
         X/c24AiWOBkqN3svQxtdDkbGg5R1sQAhhW+yAQ1GUPtmSoL4COxaYCTE2WruSGteyQz4
         X70Zcp1R8l7wIO4Bf6s7nuap/nM/gTy8AjuSdalNuGq5btqsCZnwjpoqWIzR8Bwm8UAJ
         OKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798744; x=1714403544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hlq9gzzG5dKPJVx31XBFPFZsblPfRJxaJy6oDx83QU=;
        b=qiGZhXEcvaXQe7QjfKXPAIK2hpujuBGa5wpm5tFLdbbWbMoakr9kwpMzWYP2jyaaTC
         mFZfqy2+dJDSIgcS0GpajGuVkWzqf1+HbM7bnqhuJLXWF/eBx7FgeCXXss4E4nNNCLJc
         FnRi2sRja1nss13hnpwmLn/OMSZrtsJn1drzwl7et8qC+PcVwO35FQLoMEykYaF5Bhl9
         oU0Opu1IHucgWlXk+aZkQ8IJ7fg1OVRVfHyIoaL4Z+QYYFm8nL3Tk775zOxx/UGEUQHY
         nLcpHhj4oSQXC9aBQ4EMc+SZCRiH9xuHbQXZZo79Uq/ZnzPm6mYb3ms30uYYSLBROH88
         dVCg==
X-Gm-Message-State: AOJu0YwCk5UyGUsxgmOj3CpJaadWjB5io4QVgeFPR8rLa6KlxnTSM7DD
	MbU2RHFwn+P8BGwJbudyjkz1dtJOLc+XOyi6sCaq62mlQ1P87U50ZJtY8A==
X-Google-Smtp-Source: AGHT+IH7Ue5SJd1eK6lU99H6jFvnzKmi+mDVhQu1j5zMEgiyllRDV+nMbM5s9A7r0l8LeNHXiopwQg==
X-Received: by 2002:a05:620a:846:b0:78e:c0ef:50f with SMTP id u6-20020a05620a084600b0078ec0ef050fmr11742076qku.41.1713798743945;
        Mon, 22 Apr 2024 08:12:23 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id u11-20020a05620a120b00b0078d73533196sm4352452qkj.76.2024.04.22.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 08:12:23 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:12:21 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] conmon/crun/docker-compose/nerdctl:
 get rid of go-md2man dependency
Message-ID: <ZiZ+VfLUKiyGOm5c@gmail.com>
References: <20240418032248.697032-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418032248.697032-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 15:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8693

In message: [meta-virtualization][PATCH] conmon/crun/docker-compose/nerdctl: get rid of go-md2man dependency
on 17/04/2024 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The go-md2man dependency is not needed for these recipes.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/conmon/conmon_git.bb                 | 2 +-
>  recipes-containers/crun/crun_git.bb                     | 2 +-
>  recipes-containers/docker-compose/docker-compose_git.bb | 1 -
>  recipes-containers/nerdctl/nerdctl_git.bb               | 1 -
>  4 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
> index d7047ed0..ab8a4ef2 100644
> --- a/recipes-containers/conmon/conmon_git.bb
> +++ b/recipes-containers/conmon/conmon_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  
> -DEPENDS = "glib-2.0 go-md2man-native libseccomp"
> +DEPENDS = "glib-2.0 libseccomp"
>  
>  SRCREV = "affab49967eb62f75d2a47398344ab053326289f"
>  SRC_URI = "\
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index 89ba21b4..c0f9ead6 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -26,7 +26,7 @@ inherit autotools-brokensep pkgconfig features_check
>  
>  PACKAGECONFIG ??= ""
>  
> -DEPENDS = "yajl libcap go-md2man-native m4-native"
> +DEPENDS = "yajl libcap m4-native"

crun still has the capability to build man pages, so this
can still be required and I don't want to remove it.

As for the others, technically it is still used, but is
now typically built from the vendored source versus our
dependency.

I would be ok with removing it from the packages that are
now using a vendored copy or don't build man pages (in a
v2)

Bruce

>  # TODO: is there a packageconfig to turn this off ?
>  DEPENDS += "libseccomp"
>  DEPENDS += "systemd"
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
> index 07650126..afb3150a 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -3,7 +3,6 @@ SUMMARY =  "Multi-container orchestration for Docker"
>  DESCRIPTION = "Docker compose v2"
>  
>  DEPENDS = " \
> -    go-md2man \
>      rsync-native \
>  "
>  
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 8868274f..dce5b2cc 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -4,7 +4,6 @@ DESCRIPTION = "nerdctl: Docker-compatible CLI for containerd \
>      "
>  
>  DEPENDS = " \
> -    go-md2man \
>      rsync-native \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8683): https://lists.yoctoproject.org/g/meta-virtualization/message/8683
> Mute This Topic: https://lists.yoctoproject.org/mt/105591667/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


