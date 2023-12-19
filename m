Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635E1C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 03:04:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.4220.1702955060270252422
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 19:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JY3Qt4u2;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78102c516a7so4642285a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Dec 2023 19:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702955059; x=1703559859; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVcrb7p5xtQrSrwq3yDI5+fjnjyhl07HSQgGaaRENZY=;
        b=JY3Qt4u2ljXg8ZGqfJWO7l0dXXvtHuCUnvdgGU9QQB46nVlt+PH/ZR7JLvRiIXYRD2
         iF4ChxRRqsVQottsI/m5n6B66hx/qwpg43+Ypoyl039BoPwvSyKpVmk2pk/8M59+olLb
         6A/W+a2NlxbuuiD+wy4oj3Kizz44rzKdPNPHnoKbi1T5g33rpkn1hMCoYLVcl6GzDFhu
         19YZ3SvM7NYciBu3EL265BMyW1NwNlNo/fe0cwGyqwnsUSw0Ae06sdZ6OcLTqHOGwhuV
         8EUn5ihBWrJ2oyIEMYovLoiF1WrPTCW+GN1hnD/u1apjCzFP8/CCcuY/xLP1zMyoC3Zf
         LFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702955059; x=1703559859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVcrb7p5xtQrSrwq3yDI5+fjnjyhl07HSQgGaaRENZY=;
        b=vhB1/Sjl1Sk8ozuporMH2sBCm7Ir4dRiDNa7G0n1DY0Uid5z971YLyEN1cgLO+nN4Z
         MKYj4KyZl9RuIGYCjGL8CL7GA+WZpHMLFxhIBoyvvQ7daGbPm1mOtBDlXt+8NHBl9fYN
         GIpZ4fn9Dn6ss7VHAaGGGUQ3aBeLDna40nosCiQPQa4oni3QDrYCfO7y5gQ77rhR7rnq
         VLPuPSxKM8fj/ivibadtpHnGlV2E2WVL54EO5uulOISrbhk2mxtEVQVxVCov+Vb6EWMg
         rb3kxgngzAQ9py0H9ADCnqK1XAfjksfO217oxaJC6LmlEvuuDuXe7BO/5EOrb9i29OnT
         NJWQ==
X-Gm-Message-State: AOJu0YyyxBwNKikC7ADSZoT1uJh0EDByRz2guQsh7e0FzReX0CJ7yQCR
	KgGppHZcHCUS8+CvmpmrzVo=
X-Google-Smtp-Source: AGHT+IEo/P2Iu5gR9isyY8lDp2NzktUZBWACrUyF4SuRg1jmiv7CXFnvW1mSA+/LE3MRoxOBDPM5ZQ==
X-Received: by 2002:a05:620a:1244:b0:77f:3126:c016 with SMTP id a4-20020a05620a124400b0077f3126c016mr19740600qkl.124.1702955059160;
        Mon, 18 Dec 2023 19:04:19 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id uw2-20020a05620a4d8200b0077f103c8ad6sm8813231qkn.82.2023.12.18.19.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 19:04:18 -0800 (PST)
Date: Tue, 19 Dec 2023 03:04:17 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove
 device_type dt nodes
Message-ID: <ZYEIMaQFGHLqzq17@gmail.com>
References: <20231213010029.2111483-1-sandeep.gundlupet-raju@amd.com>
 <ZXte4Xc5wn89MFlU@gmail.com>
 <a5aa7075-f6f5-4029-b301-d36ca47a56b2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5aa7075-f6f5-4029-b301-d36ca47a56b2@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 03:04:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8514


In message: Re: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove device_type dt nodes
on 15/12/2023 Sandeep Gundlupet Raju via lists.yoctoproject.org wrote:

> Hi Bruce,
> 
> Can you apply this patch to Nanbield?

No problem. This is now merged.

Bruce

> 
> Thanks,
> 
> Sandeep
> 
> On 12/14/2023 1:00 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> > merged to master.
> > 
> > Bruce
> > 
> > In message: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove device_type dt nodes
> > on 12/12/2023 Sandeep Gundlupet Raju wrote:
> > 
> > > Remove device_type device tree nodes as these nodes are no longer
> > > required for Xen qemu boot.
> > > 
> > > Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> > > ---
> > >   .../device-tree/files/zynqmp-xen-qemu.dtsi         | 14 --------------
> > >   1 file changed, 14 deletions(-)
> > > 
> > > diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> > > index 249a786b..336d7a25 100644
> > > --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> > > +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> > > @@ -1,16 +1,2 @@
> > >   / {
> > > -        cpus {
> > > -                cpu@1 {
> > > -                        //compatible = "disabled";
> > > -                        device_type = "none";
> > > -                };
> > > -                cpu@2 {
> > > -                        //compatible = "disabled";
> > > -                        device_type = "none";
> > > -                };
> > > -                cpu@3 {
> > > -                        //compatible = "disabled";
> > > -                        device_type = "none";
> > > -                };
> > > -        };
> > >   };
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > 
> > > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8509): https://lists.yoctoproject.org/g/meta-virtualization/message/8509
> Mute This Topic: https://lists.yoctoproject.org/mt/103141849/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


