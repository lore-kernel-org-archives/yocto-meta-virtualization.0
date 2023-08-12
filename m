Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED28EB64DD
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 03:16:17 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.59423.1691810174728836489
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 20:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s3tK1YLx;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a7a180c3faso2266285b6e.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Aug 2023 20:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691810174; x=1692414974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVgcQctoBahUerLzQ/iMVzH6fIg1ZNt6V4ZjmbngPa0=;
        b=s3tK1YLxdO3jaVXqQQivzBNKsA8Fu4r2TD0QXldDETh77oLeQjAdTjXLUSHXiudaP+
         t7+7xuuu11Zw8aE1EkVI8jDkp4yQ+22UAdcGpWywn1J6DGrMlHZM1AWx5yC8W16FiAu6
         z1n0r9NYfXxhn7gWgNNTt4BqRiO21/pkbnd+53ZiORFg/tuXkGq9ggYcRsaJ7s45D1IG
         A3vvrqJNhWsjUZ6EOpuNzGjQSBZikEyIhHq9oL3wopc94JWShZRIFWiER4uM0e050Tmp
         N11JBeQHUQVAdRCvxidwW4T1yLHB4l/3h/1Ny5O6S7r+2oZQLzsqmOx9ESKYeur5ThIk
         6IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691810174; x=1692414974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVgcQctoBahUerLzQ/iMVzH6fIg1ZNt6V4ZjmbngPa0=;
        b=HkdnWS+jDJ8+ePxxtPI7r7lPy+jY5t6KEKJ6E9X1BqTY6OY5NMK425yzogcNfUl7sv
         Wur04vb4iAXnelSWfXYXzRVDOku+5jx9FWM+7X/rpZZ3gvpIMNGGVAuscX+3eVtUwV3W
         Ewd2RjVl92euC9tXSvBJOK8yWpWjpCLON+KcR6KkSQvvE4D+g1Zam47AaTavgTQF3dEy
         hc7NT0FSuM5OW4TypDIuFt1BGbDFAey6tJYwD4pnDXCniQhc04pfqvwWfpogCvpEANcK
         TwhUcMlEUpKejZXFAxdC8415eDmntAupcr4taVtn2vRK72zvriUM+x/95lTgWevl/rF+
         55zw==
X-Gm-Message-State: AOJu0YyG/W+dYqrPkLOzXpK04oy9bos6OLqrLSmYsW4gBNFHKdJ0Sv0h
	SB/G2rdKbN8WlTzFIA/wnqg=
X-Google-Smtp-Source: AGHT+IH2x/VjWPsIEGf8xDhFKJwQmz7rerNC7P82agoykT56FmD9K66HwTIgcMZgXdVTi8K09NL2OA==
X-Received: by 2002:a05:6808:204:b0:3a7:2f1d:ea4e with SMTP id l4-20020a056808020400b003a72f1dea4emr3943985oie.41.1691810173911;
        Fri, 11 Aug 2023 20:16:13 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r11-20020a0ccc0b000000b0063d5c9de720sm1667454qvk.80.2023.08.11.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 20:16:13 -0700 (PDT)
Date: Sat, 12 Aug 2023 03:16:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Leonard Anderweit <L.Anderweit@phytec.de>
Cc: meta-virtualization@lists.yoctoproject.org, upstream@phytec.de
Subject: Re: [meta-virtualization][PATCH] podman-compose: Add missing runtime
 dependency python-dotenv
Message-ID: <ZNb5e7ZEjvS6hR+q@gmail.com>
References: <20230811125337.102460-1-l.anderweit@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811125337.102460-1-l.anderweit@phytec.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 12 Aug 2023 03:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8175

merged.

Bruce

In message: [meta-virtualization][PATCH] podman-compose: Add missing runtime dependency python-dotenv
on 11/08/2023 Leonard Anderweit wrote:

> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>  recipes-containers/podman-compose/podman-compose_1.0.6.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> index cb569209e675..04c1be9bcb5b 100644
> --- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> +++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> @@ -12,4 +12,7 @@ S = "${WORKDIR}/git"
>  
>  DEPENDS += "${PYTHON_PN}-pyyaml-native"
>  
> -RDEPENDS:${PN} += "${PYTHON_PN}-pyyaml"
> +RDEPENDS:${PN} += "\
> +    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-dotenv \
> +"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8173): https://lists.yoctoproject.org/g/meta-virtualization/message/8173
> Mute This Topic: https://lists.yoctoproject.org/mt/100682814/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


