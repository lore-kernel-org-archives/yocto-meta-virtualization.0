Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8124C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 04:04:39 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.336.1652328271911107112
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oliz59oR;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id hh4so3483559qtb.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 May 2022 21:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kylFp+qHDCo1EKroJyn/cpgDkhlpf6JTDK3dGgvNF5U=;
        b=Oliz59oRR166uSZPmAB2vVkYDgaziomu4/HO4THfxVlj6hR7BXlelYj5CsyL/Z7hEe
         Y0Nr53SZup8xHZyJOHPu8/8kdQ5Jh54IETx4vpNKlxbV74CxEvvGtkNQ6mjwDtJcT1Jz
         6IKwkaSrn/wXV88QrE0xljjhzidzcLr4CQaB/C6zrjFtzPh2gMnz4q1QA547vRINeaf3
         iLgg23zhXqy0uaCCAzzIG4h935jmvBbnN2cPjWnY7F19uLCVSqK2TLyzOo4iHGb14o4i
         yM+07fPJObLflRfPs7jn2I2prHuEMA1oYVmT1E5lgUsAZ/3HeFuvpD5CLHsfMGG4EkH4
         201A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kylFp+qHDCo1EKroJyn/cpgDkhlpf6JTDK3dGgvNF5U=;
        b=K0gcwyICEMawLwL98AK9j/RgA3SrTlM6pafIUoxpvpaAkHHzQb0SiJZJ4/So9PKhv4
         m6W4G75Luw56xY0Sx0cEhUmSzY1q2ctAn2tJumIqUtRn/Pfft8LtgvYkCwnBJcX8Y8kS
         v96pzXHTdVZdoJiH4w8uzL0n+bNaOqNH1sJxPkTTAixpuswTrAOsPtnuI2Qyz5MHeYmT
         5FT3opf4O0Devq0Y1keyZC3RxZnMSh2DW7IZW6zLUMK8ME0/+M2GB99FpyEEQIArAbLu
         Q+PnGOQMDNAJduvDqRYlj4t8PivuHsxPxE3/uGFai6UNq0YTtATwxdOzoD6ZW4k1II4y
         tTyQ==
X-Gm-Message-State: AOAM531Wjau94MoVpK/BoPF63jwRBr9BAtzjcwxg0ttE6EU8p+v+P5yM
	fKGF5X5wR5nKoI8DVFb+Zr5jkLDRiggvDA==
X-Google-Smtp-Source: 
 ABdhPJwFmjnvEO9W5rAL9G7kJpA9ws1t21UpXx6QviI0KEIYs13WPtlXDGYPlxsHzckY3DVfB4wcnA==
X-Received: by 2002:ac8:7d81:0:b0:2f3:ca7a:653b with SMTP id
 c1-20020ac87d81000000b002f3ca7a653bmr25691601qtd.638.1652328270935;
        Wed, 11 May 2022 21:04:30 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 i6-20020ac87646000000b002f39b99f6acsm2293788qtr.70.2022.05.11.21.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:04:30 -0700 (PDT)
Date: Thu, 12 May 2022 00:04:28 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [honister][PATCH] dev86: fix a build race
Message-ID: <20220512040425.GA19187@gmail.com>
References: <20220511025355.324356-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511025355.324356-1-anuj.mittal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 May 2022 04:04:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7278

merged to honister.

Bruce

In message: [meta-virtualization] [honister][PATCH] dev86: fix a build race
on 11/05/2022 Anuj Mittal wrote:

> From: Ross Burton <ross.burton@arm.com>
> 
> Fix a race in cpp/ where token[12].h are written to a temporary file
> with the same name.
> 
> Also update the status of cross.patch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit 36433bfef3b690ee1211f04a38022b1f3dc2b383)
> ---
>  ...1-cpp-fix-race-writing-token.h-files.patch | 42 +++++++++++++++++++
>  recipes-extended/dev86/dev86/cross.patch      |  2 +-
>  recipes-extended/dev86/dev86_git.bb           |  3 +-
>  3 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> 
> diff --git a/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> new file mode 100644
> index 0000000..d6e7999
> --- /dev/null
> +++ b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> @@ -0,0 +1,42 @@
> +Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/23]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From f507ee398ae20e4e97f01dfbd9a8709a90bc760f Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 29 Apr 2022 16:44:08 +0100
> +Subject: [PATCH] cpp: fix race writing token.h files
> +
> +The rules for token1.h and token2.h both write to a temporary file tmp.h
> +before renaming to token1.h or token2.h. However, in a parallel build
> +these will execute at the same time and race.
> +
> +  gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
> +  gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
> +  mv tmp.h token1.h
> +  mv tmp.h token2.h
> +  mv: cannot stat 'tmp.h': No such file or directory
> +
> +By using gperf --output-file, the race is avoided entirely.
> +---
> + cpp/Makefile | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/cpp/Makefile b/cpp/Makefile
> +index 0ea43cc..743694f 100644
> +--- a/cpp/Makefile
> ++++ b/cpp/Makefile
> +@@ -20,9 +20,7 @@ token1.o: token1.h
> + token2.o: token2.h
> + 
> + token1.h: token1.tok
> +-	gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
> +-	mv tmp.h token1.h
> ++	gperf -aptTc -N is_ctok -H hash1 --output-file $@ $<
> + 
> + token2.h: token2.tok
> +-	gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
> +-	mv tmp.h token2.h
> ++	gperf -aptTc -k1,3 -N is_ckey -H hash2 --output-file $@ $<
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/dev86/dev86/cross.patch
> index 041a8d3..fd62c5d 100644
> --- a/recipes-extended/dev86/dev86/cross.patch
> +++ b/recipes-extended/dev86/dev86/cross.patch
> @@ -1,6 +1,6 @@
>  Build ifdef using BUILD_CC, not CC.
>  
> -Upstream-Status: Pending
> +Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/22]
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
>  
>  diff --git a/Makefile b/Makefile
> diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
> index 88e9cf3..094fcbd 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -11,7 +11,8 @@ SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https;branch=master \
>      file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
>      file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch \
>      file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
> -	file://cross.patch \
> +    file://cross.patch \
> +    file://0001-cpp-fix-race-writing-token.h-files.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7275): https://lists.yoctoproject.org/g/meta-virtualization/message/7275
> Mute This Topic: https://lists.yoctoproject.org/mt/91028521/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


