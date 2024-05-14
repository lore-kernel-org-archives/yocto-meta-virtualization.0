Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C9EC25B74
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 02:33:08 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.5940.1715653984629065863
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 May 2024 19:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BgNQFNNF;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43dff9b28f6so27446791cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 May 2024 19:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715653984; x=1716258784; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+yh661mNStYcC6YPmGj+Ud6W2kWZxkYCtzdR7rPPR0=;
        b=BgNQFNNF1WhSZeAkXHkDTKOmFHVYNnmsmsNOf5Us8MppWASPIEG6y7n0AYrcZShoac
         HHuOYKMHVbSGa16uupM28AsQSPGlv+xpwCWHkJwq6xyPFVGZR7C4C84rdszm59jcdUAx
         Ri/44aJ0DHB2cBy/suBoyFwFaHmxDfR+BDHP2m8JtK2B03tWpdGOv9f54oCXTmTXvMaR
         9l70O/Oqo8ia1BP3ny5S9Py6D97R+LJ2KTIkmcKeAMH1b8Zt1TreBOdXeRtJ7ysdOrte
         3MC3T5ZMvlNanaM1Ilf6bc5h81gtFk0McFGJOkk6cO/A/QRXxQmaLtU6dXSEE9Xnr7e8
         rbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715653984; x=1716258784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+yh661mNStYcC6YPmGj+Ud6W2kWZxkYCtzdR7rPPR0=;
        b=u5RwCjIqoBCO0YOfhil9U/mDdJRw5b6tF1rG8LJ/nR5BZ/nzYz4lRjZ7LEJ0lvBGNu
         NQNHTL2AKcVXnI/ayibAGcK40wHBamEBp6ktirmLHfdAoHUEXCnMKXFXdZ8q9q78aVmB
         Qejsuc6dXBo2i8oB9ZRl7jZzGMlNbzMwhk8XjlYvsMQ2935ceW+rbER4g0cTzn+k2Fka
         mAgcbCPXi4OBXYfsS4OhFrP6D+jrQ6Zz5/YYqlzHDd/mHoUjpKOKvM4n5huz43ueJndc
         KXzptMohA+AzmJInsdPy9qqKKgUrnpgpPXNefQJs0JoOTNAX51w5Lr8MN2e9wdeKV1Sn
         Qn3Q==
X-Gm-Message-State: AOJu0YzXtI2f7MyErOxsVQst0rthRED7cE+ymWLfEGkBSaBJRDKy5veB
	g5tnUyzTGRi9zCdI1A6O7Qmogy00fZ5lWCGEBr0VCAJiS0XwExjge2qM3rTn
X-Google-Smtp-Source: AGHT+IHYNCkN7ksMv3Sf4UQjg4qVnPrDfkGkd1VP+8W7piw6fK2W/1QOofBAYBUxW+9p8YpDhSHRvA==
X-Received: by 2002:a05:622a:12:b0:43a:b29d:36ae with SMTP id d75a77b69052e-43dfcc86429mr185096401cf.9.1715653983626;
        Mon, 13 May 2024 19:33:03 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e046467a4sm46272431cf.83.2024.05.13.19.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 19:33:03 -0700 (PDT)
Date: Mon, 13 May 2024 22:33:01 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] sysvinit-inittab: Use UNPACKDIR
 instead of WORKDIR
Message-ID: <ZkLNXYDAiuayeQV9@gmail.com>
References: <20240508190016.3865000-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508190016.3865000-1-richard.purdie@linuxfoundation.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 May 2024 02:33:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8722

Thanks Richard,

Merged to master.

Bruce

In message: [meta-virtualization] [PATCH] sysvinit-inittab: Use UNPACKDIR instead of WORKDIR
on 08/05/2024 Richard Purdie via lists.yoctoproject.org wrote:

> Now that UNPACKDIR has been introduced to OE-Core, use it in the
> do_install fuction so that as/when things move around and UNPACKDIR
> is no longer WORKDIR, it continues to work correctly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc b/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
> index bf52da0e..5010dfd3 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
> +++ b/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
> @@ -4,6 +4,6 @@ SRC_URI += "file://getty-wrapper"
>  
>  do_install:append() {
>      install -d ${D}${base_sbindir}
> -    install -m 0755 ${WORKDIR}/getty-wrapper ${D}${base_sbindir}/getty-wrapper
> +    install -m 0755 ${UNPACKDIR}/getty-wrapper ${D}${base_sbindir}/getty-wrapper
>  }
>  FILES:${PN} += "${base_sbindir}/getty-wrapper"
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8718): https://lists.yoctoproject.org/g/meta-virtualization/message/8718
> Mute This Topic: https://lists.yoctoproject.org/mt/105987707/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


