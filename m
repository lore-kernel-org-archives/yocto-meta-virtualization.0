Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.14715.1634048300017927076
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 07:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pn01XTNJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id z24so14833946qtv.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Oct 2021 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C0N6NWRgyR3OHrdHIEmLsgN2GSN3amPMFLmfVAFe3Mk=;
        b=pn01XTNJHI3KMz5+2fJmbHwq2E5wq4udJwgSpQerrXusBhCvwmJe2yfPZF9bG5F/m1
         zY2KEgHVrKD7kWbDYPz+Xje2rTxjjJh7sj3lIlbbqjgiYBCt/+QAKm6beQ8NCyfZvbwy
         xIbctubcCVJU90Rl+67nRA30WGIrfwpVyj4FwhGlgmxDJpVAefuqA9y6lgpXpSfUpvIo
         aEAXj/CKtsML2K9OZXnXYqMatMZZXVQO2UpFDtQZkm/u81H5ZqjgrnIFzxq9JkV1SXrN
         OYs4qXJfmXHWtO4KtR4Bp+AQV40FiYCWGnm6bdRiPOb2lHjcR67Oa8VB/WSudAXLw+R0
         PN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C0N6NWRgyR3OHrdHIEmLsgN2GSN3amPMFLmfVAFe3Mk=;
        b=ozoO7gKVy+jFdAvYxgxDZ61uM1hPp8oByHxTIBStLK8UzFIKxW3WETK8alNyggCV+P
         NdI/NhrFSyBEboXWCWV7Waa1LOJrhRNUkggTdBGsbhYXpUshbHuxzBX68vTRUzqzvUBZ
         zILU4G4xLzw8Vr595V3QKZ+heRAGKwoGAUYryMHMYGaXhgjSbHH4vW+A9JkHqRi2+raj
         /VYv+SBowoj3I/BpaRTQ2x/lfnLB1U+Cb5Ws1tL/ma80Zh1mnB6HP+PlTBPtKC04xWb6
         TvZT2yl5jrdlqSlcRN6R8MmaVOEt75YYJjylWLk6z3mEp74fDm+tGVSxaPSZ0Vne7W2l
         pTGA==
X-Gm-Message-State: AOAM532xFW28katQLheTc5Z5mqaISg4CcGsft71QzEnQWMJK0e6ZOw5R
	EaF4aGkKT8eZDD+TRBef/+E=
X-Google-Smtp-Source: ABdhPJzKc2qB2WHIwBIjeetgBE6HOgqaPwrfkS+HOh+YtD0l9oMk41vp2XSeYACRyCIpkEV6AnxAaQ==
X-Received: by 2002:a05:622a:1451:: with SMTP id v17mr8292176qtx.25.1634048299078;
        Tue, 12 Oct 2021 07:18:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id x123sm5699175qkb.130.2021.10.12.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 07:18:18 -0700 (PDT)
Date: Tue, 12 Oct 2021 10:18:16 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] xen: add missing pkgconfig inherit
Message-ID: <20211012141814.GA14065@gmail.com>
References: <20211012115650.960242-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20211012115650.960242-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] xen: add missing pkgconfig inherit
on 12/10/2021 Ross Burton wrote:

> New oe-core pulls in less default dependencies[1], so add an explicit
> inherit of pkgconfig as it is needed to configure Xen.
> 
> [1] https://lists.openembedded.org/g/openembedded-core/message/156185
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index c0a087e..d3c7a7d 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -2,7 +2,7 @@ HOMEPAGE = "http://xen.org"
>  LICENSE = "GPLv2"
>  SECTION = "console/tools"
>  
> -inherit autotools-brokensep
> +inherit autotools-brokensep pkgconfig
>  
>  require xen-arch.inc
>  
> -- 
> 2.25.1
> 

> 
> 
> 

