Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBEBC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 20:29:21 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.89410.1657052951939108041
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 13:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eqn75uHO;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id g14so15474676qto.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/hYGAzqjg58wQs8iOs8Tj9hMlaPli3epdaCWdemNEgo=;
        b=Eqn75uHO9HJQdl1+pqB4LR/ugGFCre/avOnLB1CRQi1b2z5Fn7x841tv85NZb4dz8U
         WFTAp7NUrKv1zmN3t28Rnt2o0KOSk78LPs6J5IZH08+efGtxOi27WslzcFKnI/jooyNi
         Mqo/9JaLT85ntIl8iUsDU2r/HV++RKn7hjRQGWg0Nnt7UsZ/aKPKE/ZEY/KwS522IS6V
         Vs5D699NMcJRfg9KRJH9hWoWNFPoNy7jH2KHmDWfdzOcL0fRzqeJZm9EuM8tM4TkOSTN
         fklVRdpsQgIjwTR0g9pUbNFTg9SVuXtkOiYSzvk3NPSZFue2hg1p7GRDX4ju3ESB4ILC
         IhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/hYGAzqjg58wQs8iOs8Tj9hMlaPli3epdaCWdemNEgo=;
        b=dmtQfV7sy+Mp5aI3r9ES7Ot7QDp5MHN6zg7OU4ZGIkMU032aV3ZpoESKi0ztwkS5PX
         azV4/4UENstk9NkF6CBhx+bYU44czVUR4V/mS6X0zSDQtHIg+l1jxY1fafcp88BACXq5
         7luJTurOZXFMveZvXR2dPYw+B4ZhbFepv/Eh1QfQ5qadMBUqdAOOgArojNvGdmVicB89
         9wrj7TiGGSYxuqnqD8MbuDhwzhp1H8cx+TtC7DpleSh8+9w8m3pFaZWE0BR5n5dybnKj
         Mr6onQ4/0F9kthiEDDdXJccoQii7x6csr11IQCYvsujawCIXdlhrL4bMfosmbaB9I6LZ
         Hksg==
X-Gm-Message-State: AJIora/PiRVGDlOdclCIHgfy02huXpBdMT3EbN+YfDlnwGXV+tQUaVCK
	Cr7Nl/4eTUfR2mxSkoe2zng=
X-Google-Smtp-Source: 
 AGRyM1vp4+XUZEYzpgLXCQD19yN7JJvtbYlfIJ1REmF3rHsVWhdv5ThQgX2CMVIQ1yrzSsPdOcniQQ==
X-Received: by 2002:ac8:7d84:0:b0:31e:7996:36e6 with SMTP id
 c4-20020ac87d84000000b0031e799636e6mr8811217qtd.628.1657052950907;
        Tue, 05 Jul 2022 13:29:10 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05620a004e00b006a6d20386f6sm25787784qkt.42.2022.07.05.13.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:29:10 -0700 (PDT)
Date: Tue, 5 Jul 2022 16:29:08 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com,
	christopher.w.clark@gmail.com
Subject: Re: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console
 only if not there already
Message-ID: <20220705202907.GD24762@gmail.com>
References: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 20:29:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7409

Looks ok to me. I'll give it another day to hear from Christopher, and then
I'll do the merge.

Bruce

In message: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console only if not there already
on 28/06/2022 Bertrand Marquis wrote:

> The base inittab recipe is creating inittab entries for consoles listed
> in SERIAL_CONSOLES.
> For qemu, this contains "115200,hvc0" so an entry is created in inittab
> for it.
> Prevent to create a second entry if hvc0 is present in SERIAL_CONSOLES.
> 
> On qemuarm, this solves issues with the console when starting on top of
> Xen as dom0.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_xen.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> index 7f92bd1..724f47d 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> @@ -1,4 +1,10 @@
> +
> +
>  do_install:append() {
> -                echo "" >> ${D}${sysconfdir}/inittab
> -                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +    # if SERIAL_CONSOLES contains hvc0, it is already added in inittab so do
> +    # not add it twice
> +    if echo "${SERIAL_CONSOLES}" | grep -vq "hvc0"; then
> +        echo "" >> ${D}${sysconfdir}/inittab
> +        echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
> +    fi
>  }
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7400): https://lists.yoctoproject.org/g/meta-virtualization/message/7400
> Mute This Topic: https://lists.yoctoproject.org/mt/92046232/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


