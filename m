Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360F1C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 21:08:00 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.16299.1664917679148877844
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RfVZxPRl;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id s9so9159672qkg.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ee1YleZbCZ4yooFMzsjJOjG4RlksRRaW5q8T6rYhQfA=;
        b=RfVZxPRlNcTVSDD+kR6N69OeUT+2COEqIBWYO+4TQkG67Qj1HVODDUiispu9AIaRTW
         WuGbLpuPgFiloPAMGi8PL+tS1K4sn2PQs5UzUcJ+zRbFYN7/aTccoQNIlG0E3mjJSsxH
         fw1rhg8V+TIuL2aqQE+l/I1NBU5fZWwoo1IMxF9EucCGZ9RWu6b/kXA9oxKIAHmx47yn
         IjEZiO34Ox5Sg5RNeEZge/78J6EXNDpQzN1qL0XesCC3tSiBrWtxlv8w56Z+gryxI2LU
         yt6lWxfThDrSczhnswAc4AvfY3g0yBJgfE/P/AX84BAQ6xn2Y2lcD40sMEFt8SYfQaYe
         KuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ee1YleZbCZ4yooFMzsjJOjG4RlksRRaW5q8T6rYhQfA=;
        b=KaeE5vfcAbCe4yZ+8q6ENY82efh94iGFqIiPBvSOBmiXLL0/Yjpw60Q1Lxx8wYNWmi
         7nMOnYyVYtPV8VP5hT9OZ+6wCFPE0BcgvPCTGtSNmQkLK3vElZlUEZ0/Dw1/Jkbespkw
         JLnn8RSvOIGp5KUNipg8wf2sb12PElboUkSfIS9amhOUKWSexj65eYIk1i+CEoysMMUy
         jNltAm1GsgT1iO3MbYPRlgdA8MfUfBFTsZo6Jkh2LO18uJ+oaNP90X5i+1XD8j03NHWk
         F41OXAU3t+lyarWb3WLzkGSIZCP/jwg6dMipc4s7yv9OWfk8WOvZIq3xrgrrNQEMtvI3
         c05A==
X-Gm-Message-State: ACrzQf0vMN5/IeZ6vCIMwT21B3jb6pdACe4cm+jhwgJ3Om+a/Tolkme4
	U7cnQVgV4jWhkoUx89Ux/80=
X-Google-Smtp-Source: 
 AMsMyM7WOeVOWvetcMYqFhG2dQ2MJ2R2NldL/dUvWpUMsZkDHVdYq/vfZp3jWn8uWp0TWrMbz/fkKQ==
X-Received: by 2002:a05:620a:25d0:b0:6bb:f597:1a3 with SMTP id
 y16-20020a05620a25d000b006bbf59701a3mr17888235qko.43.1664917678034;
        Tue, 04 Oct 2022 14:07:58 -0700 (PDT)
Received: from gmail.com
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 f1-20020ac81341000000b00339b8a5639csm12451160qtj.95.2022.10.04.14.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 14:07:57 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:07:55 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [meta-virtualization][PATCH 1/2] cloud-init: package
 nonarch_libdir
Message-ID: <20221004210755.GC60875@gmail.com>
References: <20220929214224.2054-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929214224.2054-1-danismostlikely@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 21:08:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7642

both cloud-init patches are merged.

Bruce

In message: [meta-virtualization][PATCH 1/2] cloud-init: package nonarch_libdir
on 29/09/2022 Dan McGregor wrote:

> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> cloud-init installs its data in nonarch_libdir, not libdir, so package
> that. On non-multilib builds this wouldn't be noticed.
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  recipes-extended/cloud-init/cloud-init_21.4.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index 5cb62272c23..9c9b56f18e3 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -40,7 +40,8 @@ inherit python3native
>  PACKAGES += "${PN}-systemd"
>  
>  FILES:${PN} += "${sysconfdir}/* \
> -                ${datadir}/*"
> +                ${datadir}/* \
> +                ${nonarch_libdir}/${BPN}/*"
>  
>  FILES:${PN}-systemd += "${systemd_unitdir}/*"
>  RDEPENDS:${PN}-systemd += " ${PN}"
> -- 
> 2.37.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7634): https://lists.yoctoproject.org/g/meta-virtualization/message/7634
> Mute This Topic: https://lists.yoctoproject.org/mt/94005025/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


