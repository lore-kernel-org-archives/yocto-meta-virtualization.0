Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF85D597BA
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:21:50 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.100708.1731453704726411798
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 15:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNzqvA3m;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-50de14e7d8cso2451945e0c.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 15:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731453704; x=1732058504; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8onnhSTDsEWe0+LZtXJxMDhtcES3LBDtRr7eHHEvJ8=;
        b=BNzqvA3mK0Jai/X9Y9Z1/KvPxpsCWPhz475bl12PiNEc5PIY5RT7mt6cgrlk3SUp/K
         T6qr6+MwI5Y4yGpftdJbjX0QC4gKooOzYhDYT+kv7399WyMGllPajRjI7LynwFmSnPsQ
         QEtb/Q5iIDOLHxtrkQDNlT480Y4Vh6oOgqiLU8Tf9JIrxBaC/TlYlnF7yK/513z6WMJH
         nT9sqLsD3PtUKDBCn6Gzr+heJbVniq+KCrD2kl8OY6y9zqaMF335xcXJpP2EFlN/LHrN
         YAtaZNHNR/DjgnVkzBsatmtzdJx/WRfOgEo9ppg2eY1iQ+5xvBRke++gF1baRa6Bet7R
         1XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453704; x=1732058504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8onnhSTDsEWe0+LZtXJxMDhtcES3LBDtRr7eHHEvJ8=;
        b=oyNnQ7bGR0uiH+olG2S2zAHUI0uvIqe37yVOYQ/971PJTK3gCZDLen+tT4NKcOlUvD
         +1T+9SF8juqthsBqQma5H9f13YgsmY5eUsd4hF+9TwoeQ0jC8ZR9jY7DaWLKu9fLGH3/
         kXKW1daSjCIQLs/A2J7OQa6gP8pgqzEvOQyErqpl4jVl8OJyuk7+lVc9AsCIxbA5jA1m
         XmnWTZMcC4FG5U4Jg8Zvf+cZtNBEKEyDNZKsalPivreAXnH5v/9/D/x5xZ1WNAzra/sG
         CDouBwFqXZlRjod4tf4Ihbo97svXEmEMKlX0/qUfPjVXPoP2b3MnFOsI8gQgtCz0oKU4
         LEWw==
X-Gm-Message-State: AOJu0YzLNcB3VtL97fleHEr1140ynuELEDVdYzJq5JTWOxphuMbMk9sz
	n+KAw3Zlx+C/eOk6ICv+X+TIdPzhIPCPHJP/UjnMUoVQxuR2qx/m
X-Google-Smtp-Source: AGHT+IGfesBK3YTv9Emgck6MTlYIQOlnOPHHo3M3DPKk2oSWOSd2oZjXExDEDWuk9Qceh4Kd4OqmoQ==
X-Received: by 2002:a05:6122:2014:b0:50d:354a:19ae with SMTP id 71dfb90a1353d-51443f22f32mr4856171e0c.10.1731453703704;
        Tue, 12 Nov 2024 15:21:43 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961df9fdsm76849586d6.19.2024.11.12.15.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:21:43 -0800 (PST)
Date: Tue, 12 Nov 2024 23:21:41 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization]
 [master][scarthgap][styhead][kirkstone][PATCH] go-cli: use main branch
Message-ID: <ZzPjBWxtD2+wHij7@gmail.com>
References: <20241111163628.111992-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111163628.111992-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 23:21:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8966

I had to tweak it a bit for kirkstone, but it is now applied
everywhere!

Bruce

In message: [meta-virtualization] [master][scarthgap][styhead][kirkstone][PATCH] go-cli: use main branch
on 11/11/2024 Martin Jansa via lists.yoctoproject.org wrote:

> * master was renamed to main long time ago
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-devtools/go/go-cli_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
> index 8a4992bd..37f65c33 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
>  SRCNAME = "cli"
>  
>  PKG_NAME = "github.com/codegangsta/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
>  
>  SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
>  PV = "1.1.0+git"
> -- 
> 2.47.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8962): https://lists.yoctoproject.org/g/meta-virtualization/message/8962
> Mute This Topic: https://lists.yoctoproject.org/mt/109518136/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


