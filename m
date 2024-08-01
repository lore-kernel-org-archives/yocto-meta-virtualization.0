Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08B5C3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 16:03:38 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.72201.1722528216763985507
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 09:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBlWtRY/;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bb987d3a98so1075596d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528216; x=1723133016; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9B7hhF5o5Wj7Gyx0fxWY0JFEY/RL9XP9/9hq/sI5wbk=;
        b=SBlWtRY/tP4N+MOXbGoFOBYszXpfp572yvtXHWpkxaUMOKsQosOI/IPw8/Q+Nn/smc
         TuH5OwNlphOl/K89R0xtl+x5GtokoBODds7LZ/hMQf4AYgXCliJzKjpmxd/wsNCqnyIq
         +jMLlaizVs+E2mw4fuuN8IfQEWGIIq0T0ySR+AqESsPDIx5E9Uf4Hd+vtXI+FjucAyXd
         SjyPw3jP1UEs2blp1CSqpUDE/Sahe6UGh0FqhhjbIorajew7Wq41+Nvnz1xYw5z+s4xT
         ts+WkF+qPgekbG/KJVx7PnBBRW2BoQXXLO99RnvgbWM0OHNGCcPLBDFoeFW2+6qMiZxR
         scOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528216; x=1723133016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9B7hhF5o5Wj7Gyx0fxWY0JFEY/RL9XP9/9hq/sI5wbk=;
        b=SgzMuJpdf//tNfROSYek5vJFYiKJ81YRvbDwXdOhCJHDizno0Quaa/jbRLOF/HDKjb
         BSfs+oSJUksBh+bXgkIJ/Fs30HYZl5IN/ofP0iIDP/Nwr0IEKM+LQ6sMC3h4BNRjsl4o
         9K9DsTYrmQvtI+j/ndOCwEFhvDV6rPfsbbWg1SkYO2ssbE+YpK9ddHzcXiV+ZeBoGgRV
         h3ej1ellODfLWxCNLVtUlPVDy5U6587mG4BlMkNxDTFCH7ijY+938QK3GDTLYewQo8tS
         hRDG42BjyKeTPkPxXDS38uWr4rnwWP5MWHKcaCMfqr5hvNDtRBY0VtCQDUbaGTV+KPO3
         s62A==
X-Gm-Message-State: AOJu0YxQup6YxOa665IFPytSbJfnS8AdMCwVLMcAPR41jn5mR5ZpX8Do
	svXFllkxUOCAt4FMw8yPaCtJTRxOdTFPYo1tLjFPoZ35j6CeGuQs
X-Google-Smtp-Source: AGHT+IE904K8pwmzfwkvOX+MgwlOIE+pgd8Ce6zICDZPN6Chngat+FKJpTQiyrVd++iA2NInMz8BBw==
X-Received: by 2002:a05:6214:3d8c:b0:6b8:6f6e:6714 with SMTP id 6a1803df08f44-6bb9836b9camr5995276d6.26.1722528215407;
        Thu, 01 Aug 2024 09:03:35 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3fac3b21sm86592506d6.114.2024.08.01.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:34 -0700 (PDT)
Date: Thu, 1 Aug 2024 16:03:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] xen-image-minimal: Add missing
 dependency causing intermittent failures
Message-ID: <Zqux1XWvGMYHp8Lj@gmail.com>
References: <20240731142311.47693-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731142311.47693-1-richard.purdie@linuxfoundation.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 16:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8853

This looks ok to me, and it passed my local testing, so it
is now merged (along with the rest of master-next)

Bruce


In message: [meta-virtualization] [PATCH] xen-image-minimal: Add missing dependency causing intermittent failures
on 31/07/2024 Richard Purdie via lists.yoctoproject.org wrote:

> "bitbake xen-image-minimal -c do_image_wic" fails with:
> 
> | ERROR: _exec_cmd: install -m 0644 tmp/deploy/images/qemux86-64/xen-qemux86-64.gz tmp/work/qemux86_64-poky-linux/xen-image-minimal/1.0/tmp-wic/hdd/boot/xen.gz returned '1' instead of 0
> | output: install: cannot stat 'tmp/deploy/images/qemux86-64/xen-qemux86-64.gz': No such file or directory
> |
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/media/build/poky/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_image_wic) failed with exit code '1'
> 
> Add the missing dependency to avoid this.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index fe79a485..e6fa93ca 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -102,6 +102,7 @@ QB_SERIAL_OPT = "-serial mon:stdio"
>  # qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
>  # to boot this image, so add it here:
>  IMAGE_FSTYPES:qemux86-64 += "wic"
> +do_image_wic[depends] += "xen:do_deploy"
>  # Networking: the qemuboot.bbclass default virtio network device works ok
>  # and so does the emulated e1000 -- choose according to the network device
>  # drivers that are present in your dom0 Linux kernel. To switch to e1000:
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8849): https://lists.yoctoproject.org/g/meta-virtualization/message/8849
> Mute This Topic: https://lists.yoctoproject.org/mt/107646890/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


