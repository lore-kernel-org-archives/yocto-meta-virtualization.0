Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F68C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:50:04 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.96469.1705355398113336670
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 13:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lp2KvoLh;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-680a13af19bso58578716d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 13:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705355397; x=1705960197; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiCpZ6VXngBsZO4mlA3DvOk99oDUwnbFBJBEIESvgzM=;
        b=lp2KvoLh8n+EQXClBvgISk41n8bWrhpBd4frIPnDfnrBMfKgdif9yPcL67642FTrN9
         sID8wuA0v39IX4NwB+TVH+4NSPCHvR/XRyKnWKYN7vSsh2uI+zwzm5/MR1UlX9/486TO
         cT106Yv2lns97GtPcAe1j3bij29fZyd15LM0/FYy2/WiwmasuLmS95XssM3x8cRw4B65
         KNPVXnzMztNUURgtc//MPPN2oKyKzLQ39HVpY61PyRDd7+Bpj8C+yD3Sq+Pmp9BWjfUz
         OddRat6ZD5EI14LYydsvkR1447Yq8tqSUBwSfdfKIOJAHkcuurLm5g3b/MjEEB698SN9
         Ix3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705355397; x=1705960197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiCpZ6VXngBsZO4mlA3DvOk99oDUwnbFBJBEIESvgzM=;
        b=tlI/FoAtqw/3sILmmaansZ3BQ5tzjECnGgp+LiAi2o25mrMJcfUU6aWEj+wbr9fpHD
         wvNahYCwDkz/QCABIrg1hRroPLDDbuOf98TXnf6BdDVP92gDpv6V+QL4fOw+DGfcY0Cf
         SvO4yeHH4uCz8EZ4fB8vPNvVRmg6thy8Vk3SbVeyomDunj9H7tGWsqrbLEfWY0Oe0lp9
         ksZ5jUBEbyCwt2RjopXX4GHL/eefUgE1YwLT2lwBZkwBw73Z1w4OVbgNJsGdCER0lZyn
         fZRKsMnFpk061wEwOMfgaNBL5ACXAiJ+yxafw6Ixu9g9rUHtoVdtMoc/auCD5mTyN2Zs
         DMzA==
X-Gm-Message-State: AOJu0YyHtYZmUpzJ5qjX53mYT7dOHUAP397vwEEa01lgVYeTfJq4KPhM
	+UwIJLF0w7yh5oEuzlRMrV1BuPDiOOFx3g==
X-Google-Smtp-Source: AGHT+IEOM6tizIScTILvr703DoBN4dCLBjePIpwuROvpCLpbUAz2cs4U1G0U3DCBE0bHVobLEIlvfg==
X-Received: by 2002:a05:6214:224a:b0:67f:820d:9bea with SMTP id c10-20020a056214224a00b0067f820d9beamr7995711qvc.45.1705355397094;
        Mon, 15 Jan 2024 13:49:57 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id v7-20020ad448c7000000b006816843f6dcsm434182qvx.137.2024.01.15.13.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:49:56 -0800 (PST)
Date: Mon, 15 Jan 2024 21:49:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 0/3] small changes on criu and lxc
Message-ID: <ZaWog4qSMBaXLeof@gmail.com>
References: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 21:50:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8541

In message: [meta-virtualization][PATCH 0/3] small changes on criu and lxc
on 07/01/2024 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Hi Bruce,
> 
> There are 3 small fix on criu and lxc package.
> 
> patch 1 and 2 related to criu, when using criu dump, it failed and report errors
> due to missing sock diag features in kernel and cgroup not init correctly, so add
> kernel configuration fragments to enable sock diag and add crgoup-lite to RDEPENDS.
> 
> patch 3 related to lxc ptest, some of test cases cannot fully clean the system environment
> after exit, that cause lxc-test-unpriv in failure status, so adjust the lxc-test-unpriv
> case order to first.

Everything looks reasonable to me, and is now staged on master-next.

Bruce

> 
> Thanks,
> 
> Br,
> Xiangyu
> 
> 
> Xiangyu Chen (3):
>   criu: add kernel configuration features
>   criu: add cgroup-lite to RDEPENDS
>   lxc: adjust the lxc-test-unpriv running order
> 
>  recipes-containers/criu/criu_git.bb           |  2 +-
>  recipes-containers/lxc/files/run-ptest        | 25 ++++++++++++++++++-
>  recipes-kernel/linux/linux-yocto/criu.cfg     |  8 ++++++
>  recipes-kernel/linux/linux-yocto/criu.scc     |  4 +++
>  .../linux/linux-yocto_virtualization.inc      |  1 +
>  5 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-yocto/criu.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/criu.scc
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8526): https://lists.yoctoproject.org/g/meta-virtualization/message/8526
> Mute This Topic: https://lists.yoctoproject.org/mt/103576948/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


