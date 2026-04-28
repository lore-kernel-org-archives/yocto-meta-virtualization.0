Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE260FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:42:03 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11386.1777376515472652168
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RcvibvwF;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8d68f702851so1284762085a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376514; x=1777981314; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nas6asvHo/ym6VNjuT7TycTQsVTh8wGw4fpsHbvHdWA=;
        b=RcvibvwFuPi2bc+SdDafyf5tTZYYZ5caOVlCqKddBRMQxlujey5ItrNmRI7+yQV5D5
         lcZn42ZGKsS2fu2C0bQYwIiGXY0fgQzk7xe6hfVm1q0IPNpqv5ZmeHYmqKPDcoH6aW1F
         DSU+3kcIT3sP0xq5HHc7hc8Xeb2akD9leFMOVAIzUYn+qmtRqk0qRTBVp362Pa54zdc0
         bVUxU0YulGaJlEnwtNBsw7Ts75KceQLBLpch3l5tmp26fWVQLYYAACo7JyJdrfVd7Ld+
         yes7C4AxSP0C2pZJMnXDb5MBYNzLNuxv7/jnvAmWegCt0rn0wOoUkc2DWKb3UQzugTpO
         d0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376514; x=1777981314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nas6asvHo/ym6VNjuT7TycTQsVTh8wGw4fpsHbvHdWA=;
        b=Bc0iQGB7KgJnNOhOl3+biLp4sOiwTPocIJuz+Eg7GqA2Decgo18SC0oMGZOfuxr77r
         U4HuP0XN+dY02HNusflmtndbraTIXgDV+7aSjzqB+W4CG84M0Bp02ilNiE13cVwHCFrF
         VjkRi3cxmmyx4XS4RAILA0DUkKRna0E/DuO969npCyVq90zLupSHIrmVAqlxlDHp1hk5
         RxNRDqKPNhyNkMhV3AOn7yT080AF6Oa4mTOh7o0H23DAcwQ2z0xo9PVSu+yRJC7Q57Yx
         2BeFV2sIhnG+nFwd3BYD/bTxVfSXQlID8B6KOmHTFxX5zraHleukgvIIBu2en6gE3tJi
         WbrQ==
X-Gm-Message-State: AOJu0Yyhv4CTcHRkILXZKDcLOiHLOOYeCJBztDEWVgi5CGME4kss8v/5
	pHzjtbqJ9Ac8lESAPaiNuKdrGE+IQQnbxPNeLytLKuDCpy+rmgQMFZ6LIMrmYaUNzYvSgQ==
X-Gm-Gg: AeBDieui8jZNoyrYktkQZSH9hKvdqgM7S1P7z4CukHuXGjJSh/nxZ05fOxNWYrnCpUK
	dqFXoY3efG5eb9OOTfSY1m1jvuR4r9TmJ3BAjI8w6h7KWXvU7HIgm97koJ3uYtq5KLzvkPlB9Dk
	ReEZNYyjUfJ6dIYEwOs7AAfBptk3/Yi/Yui+8JccdMNjukGmgYZARoJLnoO6Lel/ezcehhsCFDR
	BxFOpNrZExH8Fld35PdNhqkCuDG0wL3D6ezkujMkfLfmMya8LrbDx/sSu1jDWVldEcYJqmWCVU9
	4W989pjf5w0xuTtn/6g1zRLChbwAnaEL6xm8OOQRb1obFesVZHk1gCDrL7rSjsO+p+2w6uPpjmw
	RIDu/90jU5VAJgIXiyKUS3Qej3SUdUqqO0zD1/8cwoTKMDb8BWT2JmCXFZsPXuG9jQZ5hvs6/SR
	hd0TrSkWPO5JHvPvXaLGq1m+Mx2H1Tjv7yMXqZNTmRUl3a5wZ48i9BgGBqaUQNGrpIFrWc5NbTN
	kbIMa1fN92cb25Ka8F1AEVyrswKobilvNQaMjk7d/Ko9jwstkOJF9OQIQ==
X-Received: by 2002:a05:620a:4446:b0:8f0:10b0:9e5a with SMTP id af79cd13be357-8f7d97ffa53mr331159585a.50.1777376514439;
        Tue, 28 Apr 2026 04:41:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c87a0942sm195544385a.42.2026.04.28.04.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:41:53 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:41:52 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] criu: Add CVE_PRODUCT
 to align with NVD CPE
Message-ID: <afCdAPuBibNtiYqJ@gmail.com>
References: <20260423044030.3599-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423044030.3599-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9760

merged.

Bruce

In message: [meta-virtualization] [scarthgap] [PATCH] criu: Add CVE_PRODUCT to align with NVD CPE
on 22/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> CVE_PRODUCT has been set to criu:checkpoint/restore_in_userspace to align
> with the product naming used in the NVD CPE database for criu.
> 
> The slash-containing product token is intentional as NVD references this
> project under checkpoint/restore_in_userspace.
> 
> Only a single CPE entry exists in the NVD for this product:
>  cpe:2.3:a:criu:checkpoint/restore_in_userspace
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit 484a57d2df5d02e2cc64a7b7e03be93ffeaff8d4)
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-containers/criu/criu_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index cccd3e3c..a8915d16 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -111,3 +111,5 @@ FILES:${PN}-staticdev += " \
>              ${libexecdir}/compel/std.lib.a \
>              ${libexecdir}/compel/fds.lib.a \
>              "
> +
> +CVE_PRODUCT = "criu:checkpoint\/restore_in_userspace"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9724): https://lists.yoctoproject.org/g/meta-virtualization/message/9724
> Mute This Topic: https://lists.yoctoproject.org/mt/118967280/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


