Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC084C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 02:35:37 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.34896.1749090937424967129
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 19:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PfD+RLDg;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4772f48f516so16809741cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jun 2025 19:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749090936; x=1749695736; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UftOa8+mss0gwZaeWY3EqQWSv13KOUeklNBwxk3DNXk=;
        b=PfD+RLDgRnrOTjjMyovhmn/yUWXUjNxNbaSNA/5zB0CPuKkUZQCaqv4B3paLTJOLg7
         JcXLuOf2neD6m02a9XV0vsEtEUgbHJh+ryx5AoWORfbWL/v0/c32OZbtF2FazKNrZZRZ
         M4h1tmes1/tFKA6L9poDHGn7TcjByUbdl1FxBT4IGM3/f4U4FhVuZTwPjC65vojiBtRQ
         2yUYcsNaMFEwI9QFLDaG11Yh3DU0zVp4lkCASlwc2skdMf9Yw2ivpW59fbIQrjtdOWyH
         QiJGNQaF6Va/6MC8aNWj/Z2VJV2zuom2/d3VaKsKtCRXPhxtqPYhWhmNpWp2xZRC3iww
         C63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749090936; x=1749695736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UftOa8+mss0gwZaeWY3EqQWSv13KOUeklNBwxk3DNXk=;
        b=etYimADbMUEPyk5coxkdoasSNPCAV5KkgUxQ0hO7+F4Jj0hAlITuDbDI6TrXX++4te
         QmEWtMXD9h31u49hIEMyl+APIXB4uHSZ/224nkhf8iH44ASAq9ci79hNir1Yj6hBbsP0
         EMEy4+ablhaKm5cDMYHiyq1vXLJOCXAwTgFLiLXD8rxozfuW/5kLNJzz5lr/F3YgbHeh
         R0jKQBjEGcw/RVIp1s2YrhjA34d4AprHqsHlhmoZZYXBEzYK0H1+gkXozgNuayfNExOl
         2U96mlHxievoHiEXGYDsgB34WaGehNsV8sIQv+pPsqYQG1GIjeu6dEPIG1k0cnCYQYY4
         MJuw==
X-Gm-Message-State: AOJu0Yy7U/lE2nbewfWAurlnByxsviRqrbc7zQIcNXGZJzNyqMz8RFZ2
	gXbNUEcSpWJkP9o7XzNEkZ1M9NFD0sPVnMadXntc/1850/606GF07qkDrRZHV0oP
X-Gm-Gg: ASbGncuiPB1HQuCSa7SLO4AwOW5Gr+RUfoRXTN7c5aja5L8MB+V2TsDPlJJ6CYkiiv0
	sjSphC7t7uWMUaFePvl7SQ0FUfxRmd1C8nPnq6Q00ujjb268co3i5pmCCY4XNG/28+4lL7sD79y
	pADPNm7S3hP7c4rUtV1RnQ4YVmECIwU22mRwlWiusPtOSCZNdWiT0ku8L/gMw3XsJkwArFYlUlx
	9BvFoaDYFvgICGRLVKkgnYYbgi638wOuEW3fM93j/0WxoUQuqfuPHL5DvjnTyz6b0eBvThCYB59
	DpocYkTtaZonjXULIL8jX174Ebv6kr4XqOJnaa1joOsXE6vslp8vFXQLvrgO8d9ZlwKlgN2jFoZ
	gh0dPZrLf2WGCVBE//9gmKV4eNi1UCiYl6XItfw5c
X-Google-Smtp-Source: AGHT+IEuzC7wZDdWXnuxBwOyDbkI2V+/BZGAeA82s+rpAEeBjYLV0vT7ram/85/9xPG5S8nQ6UJzpw==
X-Received: by 2002:a05:622a:64b:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a5ae71a542mr29633041cf.10.1749090936269;
        Wed, 04 Jun 2025 19:35:36 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772abcsm101675231cf.5.2025.06.04.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 19:35:35 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:35:33 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][walnascar][PATCH] yq_git: add back
 apply=no for SRC_URI diff
Message-ID: <aEECdbsHPWFJNpSf@gmail.com>
References: <20250604022136.2193000-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604022136.2193000-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 02:35:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9271

merged to walnascar

Bruce

In message: [meta-virtualization][walnascar][PATCH] yq_git: add back apply=no for SRC_URI diff
on 04/06/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This apply=no was dropped during last upgrade. This causes
> do_patch error when using git shallow tarball.
> 
> The original patch that added apply=no is:
> https://lists.yoctoproject.org/g/meta-virtualization/message/8804
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9268): https://lists.yoctoproject.org/g/meta-virtualization/message/9268
> Mute This Topic: https://lists.yoctoproject.org/mt/113460042/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


