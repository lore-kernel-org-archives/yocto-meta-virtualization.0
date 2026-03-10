Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6D1FD88C9
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 22:40:39 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7742.1773182438840705606
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 15:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFYWji9C;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd847b4b23so300587385a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182438; x=1773787238; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7gbqiA1BpQuPMdWtYELMd+SusB+tjdt9VP4dtula+U=;
        b=DFYWji9CMhb9OjVlIWUa33+mWH6Gbguq4UWs1GPWVvCRT1C7T66EvoIHzb8NVa0rH3
         ylkTehu3oI/tgFvvtelQDlpavzPqNXMheqQ1L8HAA5Gf0+lRK31KbZyHcZ2E56MVBXAB
         0HAZ6lXvTBYBognYwCETCOvV5vUFK6DDsVrzWNoufmiAvS83A+M2F37Kwz2yrLXYyjXh
         DISseBe/t3N+h/sZ2zFIYrzJs7qyG1WAXq4W2XJGKf2DBrX20MKUNfGj5xaa4dS4BfOA
         rw0xOYriSQ3yDV1RjmPe3gsT8+hhCzkR+j2xCCM22pvoa1M9HSmhmDzqi85aZgLKe/lj
         en8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182438; x=1773787238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7gbqiA1BpQuPMdWtYELMd+SusB+tjdt9VP4dtula+U=;
        b=OjAMbtaiK2hHsIzIMxdiv98Rpl7UyVErs+sjM5Zm0jGVEkxLEh04cnLj55/KEVQUZz
         1cRF/Pdn3JymiaaCXk0hctDjjXd65xuiKFd/8zMi1RGUuHSv8v4yhWzhLjX0lSxlAZ4E
         KjW3m2G+jB8ddRHc0Wj6/66HATjY3dK6Fd/jUOVoMYk1ok7+ZIuDyhXGkneeG7OOnikU
         PA3VBp7CpiezzLKV31e2xBlQfRk8ENltKcGwlcYnKS6lnBDmC/8qbc7u1lWvaV5+2ZtQ
         UskWIizIru9rGy0Np74CPffZZJCm9YEPoOEzrLvGc+47956APnsy6UiBCGUG5ViCXoak
         oezA==
X-Gm-Message-State: AOJu0YzJ0BEQywyNYC7KMLmspWUep4rJCRaShmj47JamQZDms/Z2LMW6
	hW/MrBcni5NiGXx8qt3LxHE+5nOXzygxo2yuIhQJZkRsdAXBqZ5uaT+w
X-Gm-Gg: ATEYQzwwjOE1Fy+iBhKAmsbyREckO5RLum7UsSlieB4v8DsgcsHjZTFR4ylepn46+DP
	RyylJnWBJ2pctkhn3k6kbZzEMEnQs97vhu8LPOT90Jeoeox+3SzjnzkuIe0kQ1FlHN2+fNynWOz
	eK0dtvJgpLgjSC3CXshOQX5UKExoz1BjhYaENjBuwQT+LkHbxWotaQHImBV0jgXEYtALnZuDtP6
	3ArzKN777Ums5o2utZi8+qg18S52Wu6f1x3IQVSXXeEkuGM4pdFx/lM3btgHcqmxP3dxBLoiaTx
	SMUTCRAwqx4J2JHkJtMp9bUis4EBHrhoH4nzCy2oUEpHcnOSVDiQ7p8uf9egDGUcrW8RKSCMPCl
	CDpU7l7D1hHGm5nClctiQceR1ElLutFohdlqyH7LX7hqE538yOrdo6CLKqcg/j1eXxL9OBQpe7S
	Kfoo3rAbfp0ypE8oqgZS/v2XvGw0mr1UZcsbsJUgJVWyM6RQkx10pMAZawDBJnT+bm2fTIz1Azq
	DNE6iF7FvcPH5ihjP/X6ME7QYgjn6GhjxGc
X-Received: by 2002:a05:620a:4551:b0:8cd:9707:6315 with SMTP id af79cd13be357-8cda19ba6a7mr82061885a.9.1773182437675;
        Tue, 10 Mar 2026 15:40:37 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21348e2sm16687985a.35.2026.03.10.15.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:40:36 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:40:34 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: liuyd.fnst@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: Use packageconfig to
 control fuse-overlayfs depend
Message-ID: <abCd4oJCXiiacC_P@gmail.com>
References: <20260310072754.663-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310072754.663-1-liuyd.fnst@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 22:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9638

In message: [meta-virtualization][PATCH] podman: Use packageconfig to control fuse-overlayfs depend
on 10/03/2026 Yiding Liu (Fujitsu) via lists.yoctoproject.org wrote:

> The RDEPEND fuse-overlayfs is an Optional package so use packageconfig to control it.
> 
> Refer to https://podman.io/docs/installation
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  recipes-containers/podman/podman_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 53b9b6a0..4495d2d9 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -68,7 +68,8 @@ EXTRA_OEMAKE = " \
>  PODMAN_FEATURES ?= "docker"
>  
>  PACKAGECONFIG ?= ""
> -PACKAGECONFIG[rootless] = ",,,fuse-overlayfs slirp4netns,,"
> +PACKAGECONFIG[rootless] = ",,,slirp4netns,,"
> +PACKAGECONFIG[fuse] = ",,,fuse-overlayfs,,"

Whether right or wrong, fuse-overlayfs was being pulled in
by rootless.

So it should stay pulled in by rootless (unless you can show
me that there's no requirement at all from rootless .. and
that information needs to be in the commit message).

It can also just stay in both, since last I checked, having
the depdendency in twice doesn't cause any issues.

Bruce

>  
>  do_compile() {
>  	cd ${S}/src
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9631): https://lists.yoctoproject.org/g/meta-virtualization/message/9631
> Mute This Topic: https://lists.yoctoproject.org/mt/118237141/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


