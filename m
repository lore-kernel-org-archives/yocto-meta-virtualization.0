Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B2BC2D0CD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 02:45:28 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.11974.1747709121912126549
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 May 2025 19:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VeQ7RkN9;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7cd0a7b672bso343565685a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 May 2025 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747709121; x=1748313921; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJIdZZ1vMYT/m6UaeHVAnRAXOlfG5ZXxwEEp/7e4b/Q=;
        b=VeQ7RkN9d0rkXJ1F7yCZkT9P8fzQxvAf8GKAaHqdBRTrfamI0E2FBxPsRAXlWnP/Ir
         PJVyTTDZFF2a1xCIRmieMeTZsTKg/hTSYRk7JXQaYkhmPL3aJAkRHD+2eMNj558rPvMC
         xrmeoKFjPeP1qQh5GbURjopn+u//zjl5DANl1k5hdiTCJHZ0Yf4HS2hdweQ4t+vbQ+t2
         dPvrjE5AR0WYX20EiaHHFxF0mUz8HOOsaaB9t73JNx1TzkUaVzTqqFfcpI7aC7CMXmnm
         FrC5R9TG5l/TMbiEuhm3MxuRJY6z3gfW+szOImhL+drBNu9oRbn189ihv76CfILmRpy8
         jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747709121; x=1748313921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJIdZZ1vMYT/m6UaeHVAnRAXOlfG5ZXxwEEp/7e4b/Q=;
        b=F+/oBlirt4YF47duDX+EE1vYDsSgDnYiUFGrP+8Wc+TBr8jMtV0Ky+pFZclnuxtQ/2
         5syqwdeQmdXsW3jPb2uM0kJBLHjoIQNZFT622Mq/uxkX9Qk6/F6vPZX3AaIMqHsmzhO1
         /DoDqbZKoRv22UsdeM2eXSFVPp3UP5RS1Tlx1LfaxRc1OUdPp5QHyzhR4fzpxJGaJs6+
         YgGxBN28vmkoMY6wFGJzXuIVccexIb3XbiPZZWYhG63eENwT2jRXsuWvd8btIXaEeL99
         s4vZ/3Ty64qiTR+0mTuIiNVNutpd+Zv8hG4ECa6AwGvKabmbhpXRackOKCebydqiyGtm
         +h3g==
X-Gm-Message-State: AOJu0Yx2oCSXozp0ymqVAhErG2q0SOKN1zLT8C4kaNwcbb/bEwVMfzjD
	AngoM7KNxS5wBLR/nRLEAebbdl38G+zq6t0RwSoJLVn/mRlb4U3aRQV8AX+0BF9B
X-Gm-Gg: ASbGncuXaOCsbACVa8hOyaP3G4MzkE+HulTEtbojNOMAZ5NLLmhpSyE4Jr12IkBIYc8
	ZMBqW8/MfusrLd9XOKrsmkZAyjbQjhfW9ppgkLoYxhvkKNCOVqCDL4NPUsRkmZds5ITpvonV6EU
	U19vj4jdmba+MnZBtXfhqXUZ9cR0ZyJ7K2MSVvF/2K0+tWap5cPHwMCoK+fTCC5OtpR1WMRA+cS
	K5AdUWAWESilzVbit1X2DCjxK/5vJEfO24ytgYkMNyax/K+q0UaR+wLyQ32+VxKpNab3Y2QujHi
	k4R6UjgX9yu7UhaeJ86ED9iDhCbhs2h372+hI3VBy7VSsI1x0vrl5fdti8zryEmOUc5dTLbfH98
	tkC1YXhwf6eMh2tlv97z16U/FhRLGIA==
X-Google-Smtp-Source: AGHT+IEWlBryonBNi9qbrfVxPc8trMoepRJ2xtIBwMaABATC6pjfzKkrddsC3N5j7wMsjsWgFni+7g==
X-Received: by 2002:ae9:ec0a:0:b0:7cd:90eb:7d70 with SMTP id af79cd13be357-7cd90eb7e13mr1468910985a.35.1747709120762;
        Mon, 19 May 2025 19:45:20 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467da087sm669064385a.41.2025.05.19.19.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:45:20 -0700 (PDT)
Date: Mon, 19 May 2025 22:45:18 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] yq_git: add back apply=no for
 SRC_URI diff
Message-ID: <aCvsvsqzANCXZKZ1@gmail.com>
References: <20250507024419.4032646-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507024419.4032646-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 May 2025 02:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9250

I tweaked the commit message slightly.

It wasn't dropped accidently, it was dropped completely
on purpose (it didn't fail in my testing).

This is now merged to master.

Bruce

In message: [meta-virtualization][PATCH] yq_git: add back apply=no for SRC_URI diff
on 06/05/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This apply=no was accidently dropped during last upgrade. This causes
> do_patch error when using git shallow tarball.
> 
> The original patch that added apply=no is:
> https://lists.yoctoproject.org/g/meta-virtualization/message/8804
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 9682ec95..b1700bd2 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -25,7 +25,7 @@ SRCREV_text = "566b44fc931e2542778a18423c655ce99b4f1402"
>  SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/golang.org/x/text"
>  
>  SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
> -SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff"
> +SRC_URI += "git://github.com/pkg/diff;name=diff;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/pkg/diff;apply=no"
>  
>  SRCREV_color = "1c8d8706604ee5fb9a464e5097ba113101828a75"
>  SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor/github.com/fatih/color"
> -- 
> 2.48.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9245): https://lists.yoctoproject.org/g/meta-virtualization/message/9245
> Mute This Topic: https://lists.yoctoproject.org/mt/112662291/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


