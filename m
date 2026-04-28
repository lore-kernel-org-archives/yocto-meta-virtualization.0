Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3F7FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:42:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11044.1777376527406887431
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z60EXXnF;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8f83efb5729so40798585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376526; x=1777981326; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zCPkFvtRNM18CmsS4bsrKRBDj+r8BmTBLW3pC98ycKc=;
        b=Z60EXXnFenLkbEDK0DUXpJHVED4xWjid8dCVcM0xuUPUmE+U/8zecvjt/fDVWJRO6/
         SZmfUbypDDUN1Dp8PtY4knclXdZyQQSZENMaFuXkPwfxyErCflDErQKJT5upbGrO7BW9
         dzyceLRYpZWsEch1PbrIHlH4jmFEKBkX7pOjKaVcVEjO1OWti7z87iVRp8eLgsfi4NAs
         H/eCqGnBgM72rs8bQecy3ESGF0Elv2IKKJMWT8xkWrjod4gXSTQbTAa+2MsZ7uMblBJR
         DESr7GMMPff9DJ6ORNJyuFb4J8OufSlKWr+jcx9bb2l+FGpKNhMAuf+4dJbnMrfGgMEw
         +vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376526; x=1777981326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCPkFvtRNM18CmsS4bsrKRBDj+r8BmTBLW3pC98ycKc=;
        b=kCb33CEnXVYqG9fNisW6t/DrTz8YzHFZ0TE81VeGs+ngvXFXjhCQrdj2g6o6QHBSuI
         zzeMMPhb9YkzVzAdW7KXR91qDVtzRM4G4499R9BFJ2ZnCLxluEAmMxgA9q5i/mG9IIxp
         5RiuitouRLyrCn+k04CfVsbDKt8olV1NpKfkHpcADgC66b6fvLCAhAR4uca/BqJscW3c
         S9s9MVMVcYyjgF4yy28tAkIjDDCUbaXvmIkReGAXgN2DuGPKEqqBw/z48+4mvcVTKP9d
         rYM8dXNNDRVd8vif3jydRZcgR9R+z+Q1kVxPAKqvc8Znka9oPRz0Jitn/n0qSKl869GR
         DH2Q==
X-Gm-Message-State: AOJu0Yz7N3SxJEdLTTw9FSS02Yp/Um7C77eump3vCCYLQD5dFTqOqeto
	717pTespMcocfnlbQh4OQwMLUAzJDLSqlbabZtpg40P0hg/wK5VdXum7/056RXEXPHKxeA==
X-Gm-Gg: AeBDiev8u3LjgpOmmP4CjYI5Xu1F7WPebdg+qBQGP/HbB+kzkMuKPx9PLx8Jm0sksOM
	6Hqz0mPoG/l2NXjnOPNncX5UEByFHvVQUIvLX7qP0qqf8dq2i37qJMcqEUuOPI4YYFbv3SfosPy
	qxF6Y2FB1LE94PRTDIA3oNg23XH6ctb7vCKeK4nOQOKBhgeEIkHkqbJxeis9Bqvl7UG6APRVlrk
	btNU3ZXrPRmFLooZtQ03xW8FzzmvTw/D31Luba4VbSRYR26oot9nouCATxh+wvqwTAtcBdi8SC2
	iRLhKyAKV/chRaCaADJfqxb10TwhR7heYxilL8m8YTFgi+Tr51bL6h49Z45x1faGmBPmq2W6Wmx
	Np00eDSBLjfu63CxZPx6qkOfKWR0nXBoOehCiu1zFqVG84GIDZlMq5XDSX8NzO48pvnT0lpDKda
	Ix72C4ldHJVL7WuAv+HAx38sl22rXNyIn48yghCRIhonR8XD3ID+8uaYCcaVW/oalf4grQsguql
	7SZ/rEVD8nHHV2KyGOCRoGm8c5iAcrqZ4zmwQu4Tym6WuuBkWebeuQ9FQ==
X-Received: by 2002:a05:620a:7117:b0:8cf:d386:1db1 with SMTP id af79cd13be357-8f7d9208050mr327985285a.31.1777376526414;
        Tue, 28 Apr 2026 04:42:06 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c899f58fsm167043485a.44.2026.04.28.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:42:05 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:42:04 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] cni: Add CVE_PRODUCT
 to align with NVD CPE
Message-ID: <afCdDJ03VsjDkBoI@gmail.com>
References: <20260423043932.2406-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423043932.2406-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9761

merged.

Bruce

In message: [meta-virtualization] [scarthgap] [PATCH] cni: Add CVE_PRODUCT to align with NVD CPE
on 22/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> `CVE_PRODUCT` has been set to `linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins`
> to align with the product naming defined in the NVD CPE database for `cni`.
> 
> The NVD CPE database contains product variants for this project under:
>  `cpe:2.3:a:linuxfoundation:container_network_interface`
>  `cpe:2.3:a:linuxfoundation:cni_network_plugins`
> 
> The NVD references for these CPEs confirm that they correspond to the
> source code used in our recipe.
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit 84c856c442e420a8fcaa9498d1f0dc2fe511cc01)
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-networking/cni/cni_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index b41b47cf..9c203aee 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -96,3 +96,6 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
>  deltask compile_ptest_base
>  
>  RDEPENDS:${PN} += " ca-certificates"
> +
> +# Add CVE_PRODUCT to match the NVD CPE product names
> +CVE_PRODUCT = "linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9723): https://lists.yoctoproject.org/g/meta-virtualization/message/9723
> Mute This Topic: https://lists.yoctoproject.org/mt/118967272/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


