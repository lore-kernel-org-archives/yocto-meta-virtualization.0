Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2C4CAC597
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:14:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.6335.1758248067150801704
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=De5oSX2J;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5e88d9994so18517571cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758248066; x=1758852866; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onSpiFP4xSjLG/xjEMBwAWnLV8asVHrNM1c3wS6X1cE=;
        b=De5oSX2JHY/WvmZ9tCCqOC31+LKo6rPe4ksoDh2LPHWZYDMTZ42frp9JJJkDsqyQSG
         rTL0O4aNQl4KQyjf0BUBaIWYw97h+QQyR0tRJ74jb/iWNgB2wK9ndNG9GtkBLyaCiy56
         eSNs03GvnQjMpuMRe5dW/nDT3uDI3J/h1P3foho8e9yVUNAsPQjaZBGWM45sJ0wo3rGt
         aEM8lRBswrX9Dttg+P/MYo4VFXea4d+Jdnvbjlo7wOFuby9xmyoAB3NWqu72DKJ+0XQ+
         OTIGOcyvL0mEQcIypRHtgfeFWsAuvb4eKWz1w9MlOjuKSE1gUozaqo92YjRVoBcE5VUg
         Ck6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758248066; x=1758852866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onSpiFP4xSjLG/xjEMBwAWnLV8asVHrNM1c3wS6X1cE=;
        b=n7e0zsrsgJZk552AkEn3q0S8fXcbaHnvraRS11SuCWP7ImXpt1QhBkga/ty/tPsXI6
         D5wvruvQSzASTEBnEv4wY1P+kfc7FLwsQ99dK3f2NgHAfSt/B28milIejisyFvqjcz+l
         92gQP9ljdBHl/UvOiSe3YkxxTy94MyLBh889fYuTblLj6fNu2/hU609SVsmZ9cEZ2aec
         fv3V4kXT4fX8jl1oSKP2h1bIDK6a3nXAidS6mKxcpVtACC43wuEuTea1HxkQ+Or08EIU
         Ii7WeG1wi9wKiWQ1ODaeuqq1sw0FtkGsHs/y+WEydEePxyBKaEqvGTFtb96p2To9+M7G
         zE4Q==
X-Gm-Message-State: AOJu0YwinF9hJWygbzNw8emyi4LNIBGAHY6wMKPjFxxRfNfrL+BE0UyR
	arkUbZwM7Yvfpml1lSops2A0f9rGXtVsy08K2ZZVjWfcXagpt7PQcGrI
X-Gm-Gg: ASbGnctgH3IuLvL03BNNehKzlWI613mEkIu0eQbndlvCmK1bzvxi4So5Fy9aTOPqQur
	ntyUmjUUe9s71OOB4ASmZM8VJNCJdOjX7PQc5/RhmDGt2neO08XqKnFWCFVtIbkgIsjPNNeRXMm
	pKSomU2PQuoFhn3btqidyZMHdwCudo/kxYymPdeDnZDGI6IGvsKnQPEoBCstNXDXlMPOKleQsWA
	uwXBc4I3ZDc60MZnBcNvv8yYKRx2JR4LHFREX4b+2ixTkNH8HYs92Ga2A97QKFcLcWblCqhCf70
	OktzwoviB/bBUTVMwb0/O3m0h2ciWMAlVaQp2QbY700RJgG1+o07uTex5nWEqp0y+rfgfAr1u6r
	TBnUODpKuI1yZ0UmTEmM7/nabPktACI8AdEKwoKJw46F+VJR/EWU54CjUah/FxYLMGPvQTRwW4R
	gcxZfrgFuutPi//H3w7xSOLNyrJabF73oO6fukFD/JCLJTq95T41E=
X-Google-Smtp-Source: AGHT+IGJwefB2NoHHf6nq4QHgM7Hw6YIKj/72BqsFPCftQHMms5aRGcmgDIyQaalifLDG6qp4Kluew==
X-Received: by 2002:a05:620a:1a05:b0:817:c961:90b5 with SMTP id af79cd13be357-83ba438b173mr213871685a.34.1758248065760;
        Thu, 18 Sep 2025 19:14:25 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83633b04dadsm264461585a.64.2025.09.18.19.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:14:25 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:14:23 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: spushpka@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [Master] [PATCH] grpc-go 1.59.0+git: Mark
 CVE-2023-44487 as Patched
Message-ID: <aMy8f10VYVmk13p7@gmail.com>
References: <20250916090628.1157706-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916090628.1157706-1-spushpka@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:14:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9400

In message: [meta-virtualization] [Master] [PATCH] grpc-go 1.59.0+git: Mark CVE-2023-44487 as Patched
on 16/09/2025 Shubham Pushpkar via lists.yoctoproject.org wrote:

> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44487
> Type: Security Advisory
> CVE: CVE-2023-44487
> Score: 7.5
> 
> Analysis:
> - CVE fix is available at [1][2].
> - Current grpc-go v1.59.0 source has the fix integrated.[3]
> - So, marking the patch as Patched.

Why do we need to mark this as patched ? The version number
should be outside of the impacted versions, hence there's no
need for something explicit

What am I missing ?

Bruce

> 
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-44487
> [2] https://github.com/grpc/grpc-go/pull/6703
> [3] https://github.com/grpc/grpc-go/commit/e88f12e0517d [v1.59.x]
> 
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  recipes-devtools/go/grpc-go_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
> index c2990869..08c9f91f 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -46,3 +46,4 @@ CVE_PRODUCT += "grpc"
>  # grpc-go (Go implementation in meta-virtualization) does not
>  # contain the affected HPACK code path.
>  CVE_STATUS[CVE-2024-7246] = "not-applicable-config: CVE is for grpc (C-core), not grpc-go."
> +CVE_STATUS[CVE-2023-44487] = "fixed-version: Fix for the vulnerability is already integrated as part of v1.59.x source."
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9395): https://lists.yoctoproject.org/g/meta-virtualization/message/9395
> Mute This Topic: https://lists.yoctoproject.org/mt/115269866/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


