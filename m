Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DABC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 20:54:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.3777.1743454478159223088
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 13:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XSg2WWUu;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52VKsah03499126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 15:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743454476;
	bh=DlE1MDeax328nP/tV16wU7+lTftKzBLa7LIk9xAbW4s=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=XSg2WWUuwVyJWy8NhHBjGWEhqcE3tv6Q6FWlSYsAh7NogC/n/TH60cWMu0SzVrJIP
	 aY+w/BsovnlpRqcneW/ir9bbeAWDyUkp8iC7L+uiGs55v41gXbVJYc5stQP+x6OGmK
	 eXzGKLChObHdd2kFGORdKloZQSVyNiZk0rRnwyaY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52VKsa47013705
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 Mar 2025 15:54:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 31
 Mar 2025 15:54:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 31 Mar 2025 15:54:36 -0500
Received: from [10.249.32.249] ([10.249.32.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VKsZ8n045283;
	Mon, 31 Mar 2025 15:54:35 -0500
Message-ID: <2c13bb98-32f2-4bb3-b6c7-236aa0205174@ti.com>
Date: Mon, 31 Mar 2025 15:54:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] [PATCH] layer.conf: Update to the new
 release layer series
To: <richard.purdie@linuxfoundation.org>,
        <meta-virtualization@lists.yoctoproject.org>
References: <20250330135615.1769001-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250330135615.1769001-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Mar 2025 20:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9181


I know we are in the middle of fixing the infrastructure against the bot 
attacks, but can we get this patch pulled onto master?  This is blocking 
our nightly master builds.


On 3/30/2025 8:56 AM, Richard Purdie via lists.yoctoproject.org wrote:
> Update to the walnascar release.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   conf/layer.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index fc35ce40..3db840e7 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -21,7 +21,7 @@ BBFILES_DYNAMIC += " \
>   # This should only be incremented on significant changes that will
>   # cause compatibility issues with other layers
>   LAYERVERSION_virtualization-layer = "1"
> -LAYERSERIES_COMPAT_virtualization-layer = "styhead"
> +LAYERSERIES_COMPAT_virtualization-layer = "walnascar"
>   LAYERDEPENDS_virtualization-layer = " \
>       core \
>       openembedded-layer \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9179): https://lists.yoctoproject.org/g/meta-virtualization/message/9179
> Mute This Topic: https://lists.yoctoproject.org/mt/111986532/6551054
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

