Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315F8C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:40:44 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.20237.1741282839758820873
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqIQwyRW;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-472242b0da5so8152061cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 09:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282839; x=1741887639; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yZSuKEc7xS0Bf4ytJE32GmwC3zfWJhLRLzvzgV0twQ=;
        b=lqIQwyRW/bBjp+nTAiok8TjUxrtDxoUQabp5pRICsAsirswep3Sa9LLPKs8V8KV02d
         kTfJ2ZOK6SmszD3TE9WZdW+q1C8DRcDFA9ad/YOMMi7QN+DTYYb7Dmrm4xrZgkqjUO+W
         ECmxA/oJUZxwX/LMhLAYwyhamOc21SpMSvmicEM+0p4NPDmxEZuRzGIeVCjKlJn5kyfu
         o35ZiSQy6As9CUsQ3i1JsucWP88Xlzhb4GF5UMZShopOj/nZs9Y9oVwIvLjYMfV1VQQK
         rLU894ndDY00cv87dRWDpVck+XPDi82E8OxvluQ7OSuMblB6w8SKhUnm4fPqfPKtAif8
         Gq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282839; x=1741887639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yZSuKEc7xS0Bf4ytJE32GmwC3zfWJhLRLzvzgV0twQ=;
        b=jCXKsm0MYBVP3KLkKa4MWbH0nUZQn4O4hb45xluJVChbgU/YoeyPjjNnDpOYs7UxWj
         BcYsZxkxuNZBiF40Odipdo6LO04Gu4VaI2NTIVSxjYWO9RDW/zkHrGJxPXUTupc3QJT8
         bkzRgb9FKEPYooREBa8Xaad23fUzY1RXZqqB1YeQneiU/71MVutohUv7zPCLGgyCWk3Q
         HFkKa7CUeAUjLQA4Ha4aA+BQHTeUmEMFhWYaJ/rTpdiLfDetwW0xfIIKNxQuUNTxtRfW
         v/ZDjn1vtwgFA5jEmuf7ZGenuyolBeY2emDNYjvKC6zr8OZWyAKVoRl3vfo6/uNogdJn
         z2aw==
X-Gm-Message-State: AOJu0YznTdWUvgjJ5m3iCbnMp+9J3WEHAaj+l+G6PfU0h/OE/Mg2tVla
	AYswVqneYPgs3S+uCl3kuu80xjzvwY3jmExr8WdgLOmQdNcHO6k0BtkQfsUBZK4=
X-Gm-Gg: ASbGnctN0Isicei9nw/MEGILncTK+pLsG8XPRyJQmVMzMcWyhT23fma8X1Gi2C820vc
	CnNSj/SeoKdkmGa4Xh9jghkJh5uMZd9JcGkG2WCFM014LQHSeH0mxDjWtk5qbX52JQwwEKhlQTn
	trxy9UGatWHUUkPJZ6+d2s6nH/ZDLFnJy5UtqwavBnwdl/wII+X1d/a/R05DcPCtX/Bgs8VXNCY
	daQPB2+7DN5Nxs9VeFEd6DFeM6a34IfZ1Vzi4BfsSUHGnFsKwJxXCnHxWjrykPvo1iInwCyJjb9
	xUEmUdXqG3D8Jyd6AvqoGyC7OK25wGvU5WcyHwKIg3wYAv+jsulER1VYtMY3Uu5lEloyKF61MVa
	6djdYicbpKEH2mX5IxG8ws1A=
X-Google-Smtp-Source: AGHT+IErELtdshmy5xv7tzV6XO/x2aehdE/xK9A7di5Po69lkY1+tP5txP7Ha7jPy9ODi00GtZMhYA==
X-Received: by 2002:a05:622a:120a:b0:472:139c:3b50 with SMTP id d75a77b69052e-4750b441996mr134115701cf.13.1741282838683;
        Thu, 06 Mar 2025 09:40:38 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4751d9a41cfsm9759231cf.35.2025.03.06.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:40:38 -0800 (PST)
Date: Thu, 6 Mar 2025 17:40:36 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-core: WORKDIR -> UNPACKDIR
 transition
Message-ID: <Z8neFEq35aJJUeQs@gmail.com>
References: <20250221024006.4178241-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221024006.4178241-1-changqing.li@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:40:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9156

staged to master-next.

Bruce


In message: [meta-virtualization][PATCH] nagios-core: WORKDIR -> UNPACKDIR transition
on 21/02/2025 Changqing Li via lists.yoctoproject.org wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> This adapts to the oe-core rework to enforce a separate directory
> for unpacking local sources (UNPACKDIR) instead of directly using
> WORKDIR.
> 
> Follows the preliminary guideline from:
> https://lists.openembedded.org/g/openembedded-architecture/message/2007
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.6.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
> index 59b70895..7ec930cd 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.6.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
> @@ -106,14 +106,14 @@ do_install() {
>  
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>          install -d ${D}${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
> +        install -m 644 ${UNPACKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
>          # use our own service file
>          rm -f ${D}${systemd_unitdir}/system/nagios.service
>          install -d ${D}${sysconfdir}/tmpfiles.d
> -        install -m 755 ${WORKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
> +        install -m 755 ${UNPACKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
>      else
>          install -d ${D}${sysconfdir}/default/volatiles
> -        install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
> +        install -m 0644 ${UNPACKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
>      fi
>  }
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9148): https://lists.yoctoproject.org/g/meta-virtualization/message/9148
> Mute This Topic: https://lists.yoctoproject.org/mt/111302140/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


