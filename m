Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01415C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:03:01 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.153808.1719262974170373290
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DEoG1HAA;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b970a97e8eso2608480eaf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719262973; x=1719867773; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lawP3M3Aj/O2JUB2+n3aLMbcITinzfCOVoVw14UNwoM=;
        b=DEoG1HAAfLdA/L6/f3M3TbitmMHrzu9nvV7BOz0A3lSoJr4Ir5hcSXqP7rxgrbT4EZ
         AQVhnQQoWc/pzn1ZRgAFtwkGo8VhVKqTvWD2EtGZ6T1ShmsiIit2BosZyGyo38h4PPQ7
         22fLoTZgSA2MK35D45PrO+S0FVP/gWxnzK+4pXUHhw5lT+uybI1G3KgAnYn1agccVPOz
         1wdVJrotdG5OXnTRmZPRoncUyqiqTvAzRlb/O6H9XbM5CBBv0tSmpKmeoTVdlADSJr7c
         5xyNas1opnwb+Qsl1W9CN1my49w8e4BFXmvrYHnX4gA3zqEjOwJSa5Ist0e4S5Ls9keW
         DNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262973; x=1719867773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lawP3M3Aj/O2JUB2+n3aLMbcITinzfCOVoVw14UNwoM=;
        b=OrASyboKMUV93tTtfChVnU3CyadexYwsVFmC6ayXkqG6WCOFo4Zessg7r2YHDMjS5m
         kEJSFfgKKaH/I0XJ9SNlEZHHiMcrQk3fRznyB59c0hLqCzkJbxgLvguAfy5o1USo3D5l
         6ysFa93DkcOMvSnE+brylGIsfiGCBxhM98hvZL9Gu7OfUSDYJVk3Psrb1gBupicgOCMu
         MvId/muhsHEhe3R3WoP/iNtXJYsmJnV5x5VHBT29b7TQtB6b3f+y3FM8B0zF5h73kSS1
         emz4M7cKXvgRs+rv4Hzo1CopBZOAUWYr/B55lbQp6NRpN7tpkK7og9A+ffAy/Nj4foQe
         eHLQ==
X-Gm-Message-State: AOJu0Ywjwf4GLxW4dTpNYogMJlMegcggmeSniZRuxfTxH635udl/HC6K
	CIicXlnGLFxLKUIDepcXg7AJGoLqC8C1s0m0GYiZCKqs28xRvkHxH5Q+HE+6
X-Google-Smtp-Source: AGHT+IFksM0kVMHpfcBfN2Ur7lhBTg2lQYLZ9+uLJZgRnvcVyCzyF7PjtbFWIglK7Yd0t5uz5AVuOQ==
X-Received: by 2002:a05:6358:6f81:b0:19f:424f:d06b with SMTP id e5c5f4694b2df-1a23c1e2881mr685912855d.28.1719262973093;
        Mon, 24 Jun 2024 14:02:53 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef6c1c2sm37542826d6.138.2024.06.24.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:02:52 -0700 (PDT)
Date: Mon, 24 Jun 2024 21:02:50 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: pavel@zhukoff.net
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH] meta-virt-container.inc:
 Install shadow in read-only rootfs
Message-ID: <Znne+idYjo2hvWEQ@gmail.com>
References: <20240613085409.1860824-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613085409.1860824-2-pavel@zhukoff.net>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:03:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8808

I haven't forgotten about this, I was just buried in getting some
cross container install items to work and was behind on my patch
queue.

I'll think about this more this week and see if there's an alternate
solution.

Bruce

In message: [meta-virtualization][RFC][PATCH] meta-virt-container.inc: Install shadow in read-only rootfs
on 13/06/2024 Pavel Zhukov via lists.yoctoproject.org wrote:

> Podman requires /etc/sub[g]uid for rootless mode but the file is being deleted
> if shadow is in ROOTFS_RO_UNNEEDED (even if different package like the
> podman itself provides it) and rpm backend is used.
> 
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  conf/distro/include/meta-virt-container.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/distro/include/meta-virt-container.inc b/conf/distro/include/meta-virt-container.inc
> index c3ac8394..7a8a9616 100644
> --- a/conf/distro/include/meta-virt-container.inc
> +++ b/conf/distro/include/meta-virt-container.inc
> @@ -38,3 +38,4 @@ VIRTUAL-RUNTIME_container_orchestration ??= "k3s"
>  
>  VIRTUAL-RUNTIME_cri ??= "virtual-containerd"
>  VIRTUAL-RUNTIME_cni ??= "cni"
> +ROOTFS_RO_UNNEEDED:remove = " shadow"
> -- 
> 2.44.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8796): https://lists.yoctoproject.org/g/meta-virtualization/message/8796
> Mute This Topic: https://lists.yoctoproject.org/mt/106648146/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


