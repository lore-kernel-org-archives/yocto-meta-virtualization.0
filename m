Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBEEC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:43:32 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.68484.1753983804623782886
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 10:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqVuPH0H;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7e666032b89so53905285a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753983804; x=1754588604; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XqByH83pq/00cJzEPeDfJfgibz8zq5MkV6joQrCHpA=;
        b=lqVuPH0HZ5zwkLheZPBhHswHU9TYu5Z28rnPIUdkURZNx8FiN/J1R+nyKrvPK38NFD
         6UpJXBeQwjn8XuG9Of9LBnmxBR/OfMK4JjMhoXXuzuEE+3aARTnmF72fiuiG0dLssc4L
         xN2zTJNBcOWy5EQBswP2CiIJzIkU23LHQpfS+gK1U+ZPLGUJzkg6CrWv1tOS1Uk6EQg4
         ShxSg43a/cwD1tD5Df+/fYEUWhcfHBJp3T3og+xEDEZZ9Q1OM2F8PjA5BdCVl5kcuuA0
         Jqe/yZUmadnLSq0yyuAjztT/N0D2XQhjwbcTEunC+Yu1dUu1mEAIAYBH/LgbTMk3Ypx4
         LcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983804; x=1754588604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XqByH83pq/00cJzEPeDfJfgibz8zq5MkV6joQrCHpA=;
        b=QbhR3c4aFmjtkaBXR7I/Z12GfSswdSODEMDfil15B7Dnr+5jLHE8C3zoIemPqveW+b
         KlBB2dhLcHJqFLczEVYpN6vFN4R62WVD2nZMOsw7myvgeMkVPZ2jP6NyhVasdJWfo2sB
         Kdot4cJCx8zykS2DTVSTxN/3wiEyVMar/fwh17N/MO22WdSGUQVjtzf6JtLCCb0ysCCg
         1OvjfMv4D8VbKxsyPdXcmGqMwnryUNO045yfhKniCP83jeDRIQ8HDOaT7FggLU4PsmPx
         ZuPg0nFfuX/RbXX+Myu7T1EV5gFbKXKEGIXbJIz4mu6s3K2DFcjiB3oE6gN7VxPbuEZf
         OCIg==
X-Gm-Message-State: AOJu0YyzFAJwPdWwDEYSBNVCm3+frmT7cyc+o2LLgHsFomGSJRc4QnMy
	vwbZCD4K605O9z+jU3ouhpMeNXtex9nL48N+mKGGzB3gauZDIwSZZYshxBu+IF3P
X-Gm-Gg: ASbGncvGNaOYWPNcEFPeF7+cAlk7N6L7H+yIsPXYmXBwrxgbkwBhdjAaqrh2lF1xWDf
	Yha/8DIk9x7l6e2XtHbNJmThzzdqjIqXv07JyWMGAJlnIlt022xL/W9aUk8YdCbEfDm4iQPyqbF
	YayIs/Vi/sE7XB8gl7H0xTrkBzHfZUWzbEuK9TMClZN4MRwbYh6JLM9cLsKDLprxbI6jgcSn/Qw
	TvMEG7xgadz06Cd7kewSOKVYTYN3CPQwwBhotTZkbGrXsOeqTMce6WG+wCM74wTguhLP/68nFb0
	QVVqPGoecsu13Kr8CP8Bupx/pHa4rh3YZZUZH/Wvgl9SiMeuhUKZYAwwUSKIijFDx13aE178vxC
	gskHYWLOg7mw3KAhWiVhaOIujiXoaHzBqRai2JM8njo9noRktArRvOjYn0r+rnLEXGnNM+HN4g7
	Ch
X-Google-Smtp-Source: AGHT+IFy/x5+uxQa79Ko7gcTGf+xFsEaTp3jD5a02G9IUnqm1f/aBvnXfVRLA3ZcXQM8OuGT/rt8cQ==
X-Received: by 2002:a05:620a:9167:b0:7e3:3417:a5e3 with SMTP id af79cd13be357-7e66efec7efmr1005093385a.19.1753983803357;
        Thu, 31 Jul 2025 10:43:23 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7584d3sm111248485a.83.2025.07.31.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 10:43:22 -0700 (PDT)
Date: Thu, 31 Jul 2025 13:43:21 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] containerd: drop CVE_VERSION
Message-ID: <aIurOZMhqnfnCDft@gmail.com>
References: <20250722101648.2113984-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722101648.2113984-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 17:43:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9335


In message: [meta-virtualization][PATCH] containerd: drop CVE_VERSION
on 22/07/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> It's easy to forget to update this CVE_VERSION setting. So remove
> it. The default value of CVE_VERSION is PV.

Indeed! and now that I've renamed the recipe to just be containerd,
we don't need the explicit assignement.

This is now merged.

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index b1723547..022f9123 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -17,7 +17,6 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
>  CONTAINERD_VERSION = "v2.1.3"
> -CVE_VERSION = "v2.0.2"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9328): https://lists.yoctoproject.org/g/meta-virtualization/message/9328
> Mute This Topic: https://lists.yoctoproject.org/mt/114283976/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


