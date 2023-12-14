Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A76DC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 20:00:51 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.38442.1702584042881631496
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Dec 2023 12:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gvK5BfAC;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b9ef61b6b8so5560738b6e.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Dec 2023 12:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702584042; x=1703188842; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=No/JYrfh84BtO1sHWym5lCm78FJBAFs0wIi7l4uAgos=;
        b=gvK5BfACx7L41Gn33bKopwaGUpcaDFR82jvnA0PAcwdYYR3PO/hE9f7g5/v59ufaCG
         Mej4GFnlzlBXKPHw68yG24FPT2NWQzD9Tki5zDRc7PK9vjq88RD1v/uYuhit2U5lrB7x
         j1ayPdayLYA6ztnmsuOQQ3SQa6tMd0Iv8f014weRWHXML5Np25OdYwgZulYFvwQ5JsI0
         Dehh/vas89CxiiVVs1nvhFrPjUva0Blzm8gDrTF65+fUmfnpoimtnoc0wewX6JnOMLWC
         eZXcpWuCtJwQ50arXQ//M0o9P7ooXnTBGRSkrt+FhM/ZhdlN2Vgp375Cq5Y8ht6vili3
         uCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702584042; x=1703188842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No/JYrfh84BtO1sHWym5lCm78FJBAFs0wIi7l4uAgos=;
        b=lzXBUeT2Rbtj7AtYg0PAuQNaivhD39CW6n+JpJ/claJ75XBHVxWyZHfF+AQAKIcAKL
         xu3Ro31P2KEQiXb57cCuUpy5Id2UjNPqSpHWltCxpTWXNr6UtEwVIL4AEROACg+xU/VP
         SyjLGUOjezxQpt6kZLI3yWWqCOb6NpEMdSxCWZFqcLvOcdA0GlGyIiKgUUocqFKnppjE
         1QzaJ49JpYzOZ9ZQ5b63fMf3nAypa4OwGywapFS9+oeD35hotgSiKGABQup45x7MauXd
         fMdKpVkErkwegaDKWiRu0QHT0jOnAMsFPF4iWsk/kHZZcxrIAt16pQY2ckikEvGC5wSH
         p+og==
X-Gm-Message-State: AOJu0YyKZsp40JnWuiToC1GbqgdN38EcJBVWdms72moZ/Nlbx1YBzkJk
	GtHdmOmeYAwl5VFPqqAEMBc=
X-Google-Smtp-Source: AGHT+IFp6niEmCRJhybQuifzF9IKjHeHZflZLPdmNO3NCW3BRs8v4Q4di6xPy052L0f/G/3j4oAwQA==
X-Received: by 2002:a05:6808:2390:b0:3b5:6432:e0eb with SMTP id bp16-20020a056808239000b003b56432e0ebmr13063035oib.38.1702584041258;
        Thu, 14 Dec 2023 12:00:41 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id eb12-20020ad44e4c000000b0067ef472cc1bsm1884721qvb.10.2023.12.14.12.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 12:00:36 -0800 (PST)
Date: Thu, 14 Dec 2023 20:00:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove
 device_type dt nodes
Message-ID: <ZXte4Xc5wn89MFlU@gmail.com>
References: <20231213010029.2111483-1-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213010029.2111483-1-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Dec 2023 20:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8508

merged to master.

Bruce

In message: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove device_type dt nodes
on 12/12/2023 Sandeep Gundlupet Raju wrote:

> Remove device_type device tree nodes as these nodes are no longer
> required for Xen qemu boot.
> 
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../device-tree/files/zynqmp-xen-qemu.dtsi         | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> index 249a786b..336d7a25 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> @@ -1,16 +1,2 @@
>  / {
> -        cpus {
> -                cpu@1 {
> -                        //compatible = "disabled";
> -                        device_type = "none";
> -                };
> -                cpu@2 {
> -                        //compatible = "disabled";
> -                        device_type = "none";
> -                };
> -                cpu@3 {
> -                        //compatible = "disabled";
> -                        device_type = "none";
> -                };
> -        };
>  };
> -- 
> 2.34.1
> 

