Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2847ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:51:42 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.32798.1661482298815508625
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GOZGvxSO;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id e28so392370qts.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=lg5K+/7AKwrLpi4L+xe2MUFGhQxBJm920w6msZJ1PuI=;
        b=GOZGvxSO7WlMGluSByLPSji1s6/KjVOonYR/1yHB4fQ7mxFP6VZgQp3zVGla5YWMzu
         iTT+be/unnj4XcT7fdDXOUKS8dm1zRIunOyStGdRY2k8Adz6YAIY34oSaMAuct7O1Wk3
         9rs1uwTgd5e9Xb5/QctUFLKcEzOywnH76Xm+BKvmdlreLGx1JaFajyEq4+EZt2lVn+rX
         z5olDRRcwOpxKP/y+SV/474SQq9uU2Cf34bjtNFZqiXx0rF91D8y5ZLWR+Oei3a7B1f8
         hlev+UfiXF9Kvay8L1PMn1QSIyPLU/9mSGg2Vxr6NqlffXzrGFfFyJdZhrHRedtqCgXO
         Sv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=lg5K+/7AKwrLpi4L+xe2MUFGhQxBJm920w6msZJ1PuI=;
        b=rbceDoPMXTV/1izUeiCoMK6i5ZLPNF1eaSvpSALZRfzTBOAY450jAc9xnmT8f4tBEy
         Uk/9hqw6uwD+w8QCw/qyB3Dha3HNM4j01cJehZEUYCiwhJqJcZQZyUbOx7v/Exf36q/6
         a2MAQdPax6Knn4AvU5/fgqJDiux1L1jEc7CHeH73LtU3hzAdaTD8j2zRTzgbyzO5OZ4D
         mdV+Vw1AGmD2AOqpP+PnGSOSOafu/utyyZAV4RX92pY7v0DRjXL4kc+FkjpVYwOV6O5X
         egXQsDzDhKv2FafmBOCBGa4CAaH8We4SVVVoAWRNJvZS7Kh/EuqBfVnMdyzVPqHfwatT
         qTGA==
X-Gm-Message-State: ACgBeo1mESz1Lf8r53ni/bQ6zBBV4BVrWWCpGA5hbn9p8lpCY6oYp76U
	nm+LcFFNAJZDBd0GSW3yemB6u1Y5kQE=
X-Google-Smtp-Source: 
 AA6agR7fe73ExyBERtkrDxmg2jFol4zzYRQuch41gAol7Th5u5NVIpJNR7Bc8FygPd9lp8N6joUONw==
X-Received: by 2002:ac8:5a55:0:b0:343:72f9:7053 with SMTP id
 o21-20020ac85a55000000b0034372f97053mr6260087qta.518.1661482297679;
        Thu, 25 Aug 2022 19:51:37 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bn6-20020a05620a2ac600b006b5df4d2c81sm883586qkb.94.2022.08.25.19.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:51:36 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:51:35 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master-next][PATCH] lxc: fix compilation
 error for ARM/ARM64
Message-ID: <20220826025132.GA23530@gmail.com>
References: <20220825131705.17413-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825131705.17413-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 02:51:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7568

Thanks for the fixup!

Queued to master-next

Bruce


In message: [meta-virtualization][master-next][PATCH] lxc: fix compilation error for ARM/ARM64
on 25/08/2022 Chen Qi wrote:

> There's compilation error when building lxc for ARM/ARM64 BSPs.
> The error message is as below:
> 
>   | ../git/src/lxc/cgroups/cgfsng.c:1234:111: error: incompatible
>     type for argument 10 of 'sd_bus_call_method_asyncv'
> 
> The 10th argument is of type va_list but NULL is supplied, thus causing
> compilation error.
> 
> So we use sd_bus_call_method_async to replace the asyncv one to
> solve this issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...method_async-to-replace-the-asyncv-o.patch | 49 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch b/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch
> new file mode 100644
> index 0000000..ef87a0c
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch
> @@ -0,0 +1,49 @@
> +From b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Thu, 25 Aug 2022 05:45:53 -0700
> +Subject: [PATCH] use sd_bus_call_method_async to replace the asyncv one
> +
> +The sd_bus_call_method_asyncv's 10th parameter is of type
> +va_list and supplying NULL when invoking it causes compilation
> +error. Just replace it with the async one.
> +
> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/4187]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + meson.build              | 4 ++--
> + src/lxc/cgroups/cgfsng.c | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 21955a050..f8bdcf4e8 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -295,9 +295,9 @@ if not want_sd_bus.disabled()
> +         has_sd_bus = false
> +     endif
> + 
> +-    if not cc.has_function('sd_bus_call_method_asyncv', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
> ++    if not cc.has_function('sd_bus_call_method_async', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
> +         if not sd_bus_optional
> +-            error('libsystemd misses required sd_bus_call_method_asyncv function')
> ++            error('libsystemd misses required sd_bus_call_method_async function')
> +         endif
> + 
> +         has_sd_bus = false
> +diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
> +index 8a3615893..d90e5385e 100644
> +--- a/src/lxc/cgroups/cgfsng.c
> ++++ b/src/lxc/cgroups/cgfsng.c
> +@@ -1232,7 +1232,7 @@ static int unpriv_systemd_create_scope(struct cgroup_ops *ops, struct lxc_conf *
> + 	if (r < 0)
> + 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to connect to user bus: %s", strerror(-r));
> + 
> +-	r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
> ++	r = sd_bus_call_method_async(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL);
> + 	if (r < 0)
> + 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to subscribe to signals: %s", strerror(-r));
> + 
> +-- 
> +2.37.1
> +
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index bcc1795..9cabe05 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -44,6 +44,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=master;protocol=https \
>  	file://templates-use-curl-instead-of-wget.patch \
>  	file://0001-download-don-t-try-compatbility-index.patch \
>  	file://tests-our-init-is-not-busybox.patch \
> +	file://0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7562): https://lists.yoctoproject.org/g/meta-virtualization/message/7562
> Mute This Topic: https://lists.yoctoproject.org/mt/93247732/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


