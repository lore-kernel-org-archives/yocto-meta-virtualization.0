Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2814FD8FF6
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 18:21:02 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76814.1772130052725820054
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 10:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iM0kGRy2;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cbae8f69cbso109014585a.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772130052; x=1772734852; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yudxD3G/Gh9pBRCBTrPfLLullvfSgCe32Sz7GISa73g=;
        b=iM0kGRy2xPiYOrDw+Bi6g+c4wOKxY/aMRx7LVYrOD4M5rggeAKSC4o+FPf2YH7ToEn
         c9pN8xoxH7n4BSH5istfSKpA18zrUxFkEtjSXM5BNOBOBd9bpqdiBwgTgvst/IP37x32
         oJ/9ORgdVmYbFWaYFVon6fo9L68MJIPoUSDuxmrg7Es/2WCrjaPyu/wNEFUW9x+uzEhq
         UNkDMmd+7OHYBUK0vfnO764WwavVRirXgpbztTXqC+ENiVVUCYXF2VhiPt+Ckw5pqznk
         /6hqR0R39eFMqf30sADA7mF8zSiDSKQSDkHABn5F8so5JCQl2CL2ij28CjUk/2G4n/RC
         eyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772130052; x=1772734852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yudxD3G/Gh9pBRCBTrPfLLullvfSgCe32Sz7GISa73g=;
        b=RMcpxGZ7VA7JE7Qy0KdL28BWJzbsgcvu5QlNDZSJDVOKZbe1Ykft9sKrGqgLlNiaH/
         L/BmYX53GZ8E50GrQUx1g5TVj4mj/1iJsGQu4lxqh62tMVVtWf3r9M/8JOeDptwxWx2D
         51lc80BgCzqv9SjG4iHZQ6PH7TLYd18ceoZ4Mjuxr/7n6FxyqiTBZP3k38ybwvjdO6tq
         9syhhI0Ti/+aorTdgEjsAgqQturTAux9flvpPCVqj1KN+UdA+4QcjhA5enLi7WqRYiFN
         KKY+H0F76vsOOKuwtp03P72Ma5DPfl0WcPpDITzoENMqWHW3Cdh2dxUNp1wFfW2WdIUg
         mO8g==
X-Gm-Message-State: AOJu0YxCHTkIcJErZ4WCsUJ/K1KJFwiNePjtZHqH3x1Cbz9YM/4sZptk
	/3E3nzf/pp+i3YCYbhvmyJDPaV98okfXjWEJEtRQLGANYKyG5ah3tN2d
X-Gm-Gg: ATEYQzz5fZ90D4TEaFCNfwy0MZ7znDimzMSQVT4q/RTzwCe9rPMP9TOTz9JCC4CiopR
	5DQm9xh+7YiLW/j7tooA1LYXHxYBk9pNgbM46STYOthX0GgDkUxrdR6Hhqt8d6N6mSZy05XjqG/
	3QWIFntBgXF4VeX/VLy6v+wQqykPw9IAjySoRnyjF7Fo+LuD02Ec+631C2epNVwwY48govTBx9v
	hcmFzPkAvL5MXxcN7mQvdkZtlFirwzKB4zh4HYDog1mSJzsXGjGUyniPfcc+ECE0C0AbMTcfpot
	4HY6hbyTMVdCdvuWphjkSX+6Yt3jaAkOQZsB2Ako5CDvIZc9SP95FRowU2FjSfueuuKGZL95aFJ
	Rb+xYrK88MrOyKEVHSYgHWmJ7ck84D25xqedsPx3hDpbQYn1Q2wa6T8kAjS2UqISqftKfM3SAzq
	w13owcFAo4QiXMW2JJJtRnBkXjC/lU+0K/VZ6aKS4elInhCwaO8xNUgyEN3D5LK9WJMLzUePqrQ
	u5If6NYTV7hTdgJxtPcgdC7UojSFYPnQ4D+
X-Received: by 2002:a05:620a:29d3:b0:8c6:b16c:a56 with SMTP id af79cd13be357-8cbbf4021cfmr451281085a.38.1772130051654;
        Thu, 26 Feb 2026 10:20:51 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf7175c6sm268802385a.37.2026.02.26.10.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:20:51 -0800 (PST)
Date: Thu, 26 Feb 2026 13:20:49 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: AdrianF <adrian.freihofer@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-oe][scarthgap][PATCH 1/1] image-oci-unmoci: preserve file
 modes
Message-ID: <aaCPAYgmFjUAFc0D@gmail.com>
References: <20260226172529.2551136-1-adrian.freihofer@siemens.com>
 <20260226172529.2551136-2-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226172529.2551136-2-adrian.freihofer@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Feb 2026 18:21:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9611

merged.

Bruce

In message: [meta-oe][scarthgap][PATCH 1/1] image-oci-unmoci: preserve file modes
on 26/02/2026 AdrianF wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Based on the following patch:
> 
>    Subject: [meta-virtualization][PATCH] image-oci-umoci: preserve file modes in rootfs
>    From: "Florian Wickert via lists.yoctoproject.org" <FlorianWickert=gmail.com@lists.yoctoproject.org>
> 
>    cp does not preserve file modes by default.
>    This will break sudo (among others) which needs the suid flag to do its
>    work.
> 
>    This patch adds the --preserve=mode flag to the cp call to fix this.
> 
>    Signed-off-by: Florian Wickert <FlorianWickert@gmail.com>
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  classes/image-oci-umoci.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index c77750fb..9bd154fb 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -50,7 +50,7 @@ IMAGE_CMD:oci() {
>  
>      bbdebug 1 "OCI: populating rootfs"
>      bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
> -    cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
> +    cp -r -a --no-preserve=ownership ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
>  
>      bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name"
>      umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
> -- 
> 2.53.0
> 

