Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAFFFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:41:43 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11382.1777376500484289935
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aJEFr5c3;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8d67a483d3eso1286300785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376499; x=1777981299; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlMjq0PAXmJEwzQTwJLfkUPU6vn/tn34GhN73gqYr04=;
        b=aJEFr5c3cF/T+x2i5cGDNJgToRtGGtbzHHYa9ob/wMAzKhT+NGJ/VltqPdUA3JDvKA
         XE6Rtvbjflt8RXuu0Xee9hcD1j/bXdxxmWiJJcWmQrrlcx/qxTyvjNPxtcqoqJ1Of/+q
         9/1Dea4fNNrc6dOY8B6q+y8183gOM/g7WCru+rHYHxHHDEbnUqtO+LWMp1eS9V1aFiqj
         nWLP0ztdMIIlhgQuHkt8Gml6SGU5Ey1pIMR4Q/npdX+NHz7FK0SfMQ1/FR4PSz9GJ/OC
         JpjBYhm1LT6bcd3Jlt4pNfTsvQ5dRWFqMtV1gTPtgyLhG+eQyG5WTIbD7nMyXqoHF8zw
         eLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376499; x=1777981299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlMjq0PAXmJEwzQTwJLfkUPU6vn/tn34GhN73gqYr04=;
        b=hCN42ipzuIjdn3jSJxTEAIkBnE+8JjQBX9BziE+JSd4MWUxv3cQ7/Uo37PK3BxOn7O
         0IpmbY61ksq3QlE3dsS19aSNcC85SWOtDfZ1Lcj/ASOI0501LUBLSsTGQ2KoSU8hu5Zn
         dXQxtOk2O/LHsSJiUWb+W45q8/hMI7ec9+wNiEqcRngciAnJrJ1kYXBsXimXK7NXmbNg
         cBLqZYCSLrAcZmdaF/woV9oWbSXHrb/NYxytaGU8r9eFp5nrpFCPGhIHdNcOf/qKtO1i
         PgtadTKuMn89PbMgsmh5IBJRVWBxmf6ETu8Ub1xHsW6+r3xnx+Qua+clEYUZBq7uWpSK
         iTpQ==
X-Gm-Message-State: AOJu0YxGUwrDRGSr7VSQYcsnHYEx58Arl+DfQ9Mmx4jvhou7oyjVlp7k
	Igdu9o2/1IeI8+zgYEpyX/jSogXLBiErGaf3MhEu3ArIB+VntbYi8FBW
X-Gm-Gg: AeBDievgYx7WNztQrd2oHwe9mLG/viT14p5yjT5EL0ggT3Pwkry6WnaGR0+hUn/5HEl
	sH4B6LFPe0K+FneaYdi+l+rm7T7h+JB5FMlFDuEouWG07gQtbx32wGHMZDrXvrKp1q76xphYh2A
	hZ65UJURBQUBAKWZ33qmJGuO065Fu/V/DC2lG6Ld0EyDveOypzKauaWGyptwXETBMmuM3BM1yoz
	cNyDI8eX0HEWJP9zYRCwF6L4A5UuDfOBD9uH17iWzRkSy45bo+kpqHzR0E9j+SHS9EQRZ/D9hgr
	Ekb10yQHzG9SuP+ddRH/B+u91a3jzJmxPrRqrvdQKHZTFeSW+zeWah5jBZ7+ybfpi5mYRGS21x5
	tYFVk0hh7k6aZ7kR0Y1izLx8KM76wHCUOYvCJpAZpqqHukouhQpe7JILy3mrmi5Z4QYhxiaUeoy
	bO8CNHQNgmEl88PGmPRTrLZHhVR3Htnhd0Ug64pva/zYxbx6PYCbPLz/jYYxs7ZLl0iOPz/nt5m
	PXj5uFdVwFFmBO2koqqiYLJDF8jHV99m8xPKDsiNySJ8M4=
X-Received: by 2002:a05:620a:29d4:b0:8f0:5793:ea7a with SMTP id af79cd13be357-8f7d8f0ec50mr352803085a.33.1777376499348;
        Tue, 28 Apr 2026 04:41:39 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4fb6176sm172299885a.16.2026.04.28.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:41:38 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:41:37 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] go-distribution: Add
 CVE_PRODUCT to align with NVD CPE
Message-ID: <afCc8WvfAajsEIUo@gmail.com>
References: <20260423044141.4659-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423044141.4659-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9759

merged.

Bruce

In message: [meta-virtualization] [scarthgap] [PATCH] go-distribution: Add CVE_PRODUCT to align with NVD CPE
on 22/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> CVE_PRODUCT has been set to docker:registry to align with the NVD CPE
> product namespace for the distribution/registry codebase.
> 
> Only a single CPE entry exists in the NVD for this product:
>  cpe:2.3:a:docker:registry
> 
> This ensures CVEs tracked for docker registry are matched for this recipe.
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit f8bbbf1f7d7b5c7ef6b2c9c86a93cb44524bc740)
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-devtools/go/go-distribution_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
> index 598df964..740fdfe4 100644
> --- a/recipes-devtools/go/go-distribution_git.bb
> +++ b/recipes-devtools/go/go-distribution_git.bb
> @@ -39,3 +39,5 @@ go_distribution_digeset_sysroot_preprocess () {
>  }
>  
>  FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> +
> +CVE_PRODUCT = "docker:registry"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9725): https://lists.yoctoproject.org/g/meta-virtualization/message/9725
> Mute This Topic: https://lists.yoctoproject.org/mt/118967290/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


