Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38168C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:57:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.6549.1657205848488625313
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=COlN1zsl;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id k14so23038655qtm.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n/DF6sZ+uEJ1QOiTaD13ONA7Y70Is7QL2yMI2PysMpM=;
        b=COlN1zslKExLXs8F+zqk/knFXkMJxiCbA4MA/Ku+iW+uQHNnIp3kFsC1+rMpV33cOa
         t8pxVupwR3Ky9cmIrOgXrQ6Ye1UQ67K8sTNyESLcTapPaao+fV5YzEYSugOIH3Hsu2gb
         H3LPSd+3RKteYphoy3R2zghc1rvrAT2pcGY9Dxn24FnpxXv9R1v13Q+xgERvb+CN7tT8
         wOXZjo0L4ApA1YxvDPVFq60M3EJsLHRcvBKvorKIjttEL1Yeyf6hRbqu/4OWf1GCNWsn
         v2ECgSik8UzQ1209OsS9swx28803dklTQm4RaqwZJYQIeXawq1KrD1Lt/88P3uTBEpqm
         qfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n/DF6sZ+uEJ1QOiTaD13ONA7Y70Is7QL2yMI2PysMpM=;
        b=4bDm+eyqSzF3ZrTtFFBtQLWh+HBsrqY/oIdgGCf915eK7uVRiNtXJrnZGeCckwCHw6
         HiQZmpazZEcDd1zdobCcrgA0QQxBL451Sy01rrUIQC/MEPJwL3yBPDdbyQzDcGSqcOxB
         btX4Y6okzyJ3vOgLQPIOcGSOPZwaR4HagF838EhzMrV92f8R73z8F0Bc8OKXpeevjx/t
         7n/NIM/ALwBX32NzQM3UQIpbk50iA64NIpPnkUeffTSOfTZ/01t7wek0n5YD7L+JoOCD
         150bp/QI7/p1W8sBS3gyfOq4dnnj6b10pm/bUWQ6H8sXdNDsTflC8nwXCfAcflg4wnYD
         iXqA==
X-Gm-Message-State: AJIora/VLGClj/geFp76Rd2qbGkDoiV/yVWMy3GLTCpJUWO3iBI/rmaa
	thONy/f5p3ZejwYcY6OfC4PNCl5EF1mlyw==
X-Google-Smtp-Source: 
 AGRyM1vI1G5Sh1FKM1VZVdYXhYjgqnvxUtshdWWRphWYu0o4btwU8uYEAFvnc1RmTBdu7Xo5MpR6dA==
X-Received: by 2002:ad4:5ded:0:b0:472:f1e0:9562 with SMTP id
 jn13-20020ad45ded000000b00472f1e09562mr19149863qvb.85.1657205847388;
        Thu, 07 Jul 2022 07:57:27 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bp10-20020a05622a1b8a00b0031d4044c464sm11425534qtb.46.2022.07.07.07.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:57:26 -0700 (PDT)
Date: Thu, 7 Jul 2022 10:57:25 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] containerd:
 upgrade to 1.6.6
Message-ID: <20220707145724.GB40251@gmail.com>
References: <20220707062949.110913-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707062949.110913-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 14:57:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7417

I have a batched set of package updates pending, I've pushed
them to master-next, with more to come in the next few days.

Once I merge them to master, I'll cherry-pick the equivalent
update to this to kirkstone.

Bruce

In message: [meta-virtualization][master][kirkstone][PATCH] containerd: upgrade to 1.6.6
on 06/07/2022 Chen Qi wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb           | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index b0f92b12..c28b1510 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "d12516713c315ea9e651eb1df89cf32ff7c8137c"
> +SRCREV = "10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
>             file://0001-Add-build-option-GODEBUG-1.patch \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
> @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v1.6.1"
> -CVE_VERSION = "1.6.1"
> +CONTAINERD_VERSION = "v1.6.6"
> +CVE_VERSION = "1.6.6"
>  
>  EXTRA_OEMAKE += "GODEBUG=1"
>  
> @@ -56,7 +56,7 @@ do_compile() {
>  		     metrics filters identifiers labels leases plugin server services \
>  		     cmd cio containers namespaces oci events log reaper sys rootfs nvidia seed apparmor seccomp \
>  		     cap cri userns atomic ioutil os registrar seutil runtimeoptions netns \
> -                     shutdown schedcore tracing; do
> +                     shutdown schedcore tracing kmutex; do
>          if [ -d ${S}/src/import/${c} ]; then
>  	    ln -sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com/containerd/containerd/${c}
>          fi
> -- 
> 2.37.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7414): https://lists.yoctoproject.org/g/meta-virtualization/message/7414
> Mute This Topic: https://lists.yoctoproject.org/mt/92223491/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


