Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5C9C44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:46:52 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92813.1783086407716728899
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DqhluSkI;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c01089e8aso4682541cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086407; x=1783691207; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7zfW+0QEBcUuNw5Ngl/96Mbb+Q7hC7/CpEon4V1XgE=;
        b=DqhluSkIYZ1OUBsCVYcPCkp4ANxyG5Jyae1jB7CwfAiA63UorTAgFEpIcH8rZM7ijb
         pkdNECVfCbRkIdeaiiHCO0N5Rn50jaWRC8y2Gqj5+thNsmQQWmZnA8fHsmFZmYc9hhjb
         Pnx1wq02ZLoNxESYFLX1oeU/Obtiu/Tzc8I8eYEo7dAlS/kSGOT7hLhyM+xwC7ftlrEp
         oyjmDwp4A9JP0QcsgykxoLuOcAY84pexT3aPaH4IJYcqWO13IkziMpBX/Y4CPzNYZeNc
         OPDZi86RmgXvVty+MWm7xH9VTrw0FfIBOAqgzOSPW9Rgn8FIIqgdq13+UL6wgj06kdkB
         jtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086407; x=1783691207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7zfW+0QEBcUuNw5Ngl/96Mbb+Q7hC7/CpEon4V1XgE=;
        b=RKG+ZxIC90twHCTE6k+RbndRphg0BIvjX6/5NZ2r8WjqNa4bQYtIf4YyJccizRuTMy
         TGgPD5PMg4hyAHk5pvKRlotzl8L21WvhOZdqSD73Kb1MI1bqQuIfta3xyQjXizu1au9+
         EwbgawvrfhndbU51rla0hZrpfqb5Az2sRMqkLBwd8Jmcinyb/lFhC1DqGa566T3qQrJ+
         Oa9Rzf8jcaSNyfKFce4n7BqccCZdVlrmGFhmCaoexL15HyCqm1wD9WjikXokymrTP9BQ
         lPfr+dNp4T6+9HH1Lp/xajeCA1QjWNBtDwV43bawye4Tc22NTALzbxnb0he4skzUP0bm
         Vtgg==
X-Gm-Message-State: AOJu0YwTk2mEPpZotmusJNjrgH3DRZgI6N1CkQVxwx7EVfdBLIw1yDYC
	5SXIwgSRCThqhxRwKg/GesCVIaJszjlSkyIb9RaeLD03+sDtN16iGWlolfO6Fk9s
X-Gm-Gg: AfdE7clvyTnKfR0IF5XwZCRjq6DPiui3qpO2XZ21vhk99r8kT+RhnRo2Mb8XAPInxQZ
	2af+AqLvU5L+VgF7LMoDQVcQHe4Ckf5FZltiuXdpfzdSh6tO78EAtGy0lugoUYmyRbrtgQssjng
	AxSE8hnd8+xWhIrWPR6AwjoHKnvlmDeETmWmbGe34MBBpgOelPZCHb1ndEnbdoMCBiJVaQr4jKb
	YxamcjXGaaQaN1ymkeA+2KFBi+H8hc98OBVGpB574qbUPyDsg8N0HGUWdgdRFRlaSUVlBkp5Vg0
	nYB/GphlWSbWxd849M3OzW6//mhWNq57AUBGGYLGh6D5d1SngDBnlh1QOfvS+JRFReKCeyJ+gxo
	SMmZTERHryYaxL8Jg7Akxvb7xHiYUI4kJiowUhPHM4LPXBLGmNq1v/2i7OCU4GwIe8rKFyRGLzK
	lHlLhWSBIdimk04AHYmmmAPi0fKn8CzVEMUZrvgQpWPenNzzPwSEWSmOqJC6NN9idCaKhNEywAn
	9rLHrpGSRYCXVorH4GslUwqte2v4g0ctivTnU4MT8k9CJVfuJnKbt8OmjPjdBsQsWQuwOAO7Kf6
	Lvt+sREj/Sg=
X-Received: by 2002:a05:622a:1452:b0:51b:fdd4:a1d6 with SMTP id d75a77b69052e-51c2ad59c89mr118695461cf.31.1783086406618;
        Fri, 03 Jul 2026 06:46:46 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b5d704sm18170811cf.12.2026.07.03.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:46:46 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:46:44 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mark.yang@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker-compose: add CVE_PRODUCT and
 CVE_STATUS for CVE-2025-62725
Message-ID: <ake9RL8ybvG7cPV9@gmail.com>
References: <20260702074427.263216-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702074427.263216-1-mark.yang@lge.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:46:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9915

merged.

Bruce

In message: [meta-virtualization][PATCH] docker-compose: add CVE_PRODUCT and CVE_STATUS for CVE-2025-62725
on 02/07/2026 mark.yang via lists.yoctoproject.org wrote:

> From: "mark.yang" <mark.yang@lge.com>
> 
> Add CVE_PRODUCT to docker-compose that matches CPE.
> <vendor>:<product> must be set to docker:compose for proper matching.
> 
> CVE-2025-62725 was fixed in 2.40.2, but its record encodes the range as
> a plain "< 2.40.2" version string that automated version comparison
> cannot use, so mark it as fixed-version.
> 
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  recipes-containers/docker-compose/docker-compose_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
> index d3798e35..5526912b 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -33,6 +33,10 @@ GO_IMPORT = "import"
>  
>  PV = "5.1.4"
>  
> +CVE_PRODUCT = "docker:compose"
> +
> +CVE_STATUS[CVE-2025-62725] = "fixed-version: fixed in 2.40.2"
> +
>  COMPOSE_PKG = "github.com/docker/compose/v2"
>  
>  # go-mod-discovery configuration

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9909): https://lists.yoctoproject.org/g/meta-virtualization/message/9909
> Mute This Topic: https://lists.yoctoproject.org/mt/120079933/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


