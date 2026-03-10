Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99537FD88C8
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7703.1773182298163664439
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 15:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BobBZP49;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509064418a8so42274661cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182297; x=1773787097; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RgBpe9qrGcxRezwXUVDV2+w7CuLCVc617BnzpVhVXRY=;
        b=BobBZP49XPUuPWEBDUDE6DtqneLP2B7IpIE5CghuzPLPj+7S9HAnbncxCw2qh4VjFa
         8G13XktcOaFj9zbUWrt5yMZWUcqcRgHDYZSND6UqsakIOXJkGY7yCNDycOXDwSmKeRQ+
         Rq0A7Tuvdjul1bS68V0yXiuvn5hlGICjrBJ6QWAR87kRcMvmoawmNOTA7NlD6TCuILjT
         9fegwtESOj15e8YkzSBLNQxD3xwg3lyL6raOldBegH9vY51Hk2Y+m1TlhDsExqcHoMBT
         k1DrX2yIsUrxKw2N9A9oMK7BixOhOEhIIfaAE0YaRHUWwJi5jo/2n2EjDHIvQfAf0Lth
         rdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182297; x=1773787097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgBpe9qrGcxRezwXUVDV2+w7CuLCVc617BnzpVhVXRY=;
        b=o3m7txDdolLKjqpSNAO+D+tDXMCioe7UTKNhY4grNQ1GXov/IZw3rI/AT2Vh1cJ2q0
         9uGdcB/EAGioO9hV+GnUj8qsrkjDFeMIIj7nrwmCOnwNMGcR2XEZqBNJrgzNVTm8NWZ5
         TwBiM11bWZvdm3VVQOsGUP1+9AekF2qPQgUi8Y5PtPSSm0hWtuX5w2S81tyzu0mdyPB2
         SvqNLsUjoqVLtQupRu/O0BH+nxoPjU0ZeHQ75h4Gf8dC10oof4HKyUey8Q+dqBJGvy63
         bZr83tyb1rQL+Z+OUOJIY//C2S9np1Dj8u4WmP8UA4l9evnU+y3sd53Wl9G/ni9/FwP4
         GtNg==
X-Gm-Message-State: AOJu0YwIg8tfqNzb6KLsZbUVzWY8U/XLr2b7AZvyWOSqAnrSSjhEGMio
	Zrs1LG81dy+gfnpx9pDxdw3iLjyA3zB3qPBNODbAhqUcLu8trWuZGKeO
X-Gm-Gg: ATEYQzzsJBRehokDSwTz30gcDZQk9b5AY9+XOFDkmlvtfNFVKw6qwKzRsa8Q5tRREY9
	9BWPTrE+E62IpOR6vozZrTgQRMjqs3hEJX37dfYuL/przgU/DCiY/SrdYPcR/wU1bKTAsSt5+l0
	nRt9J5YxcbhLREFjf8sjUvgX0Pe+iBAkrprADEwvEFqQuFqNrOSJwgmCJ5uhW60/i5YnUTG29EF
	PhU9+15Jqw5LnzSdKPlTubBM21lA203rVqWie+6W8YsC7BjKTMdQv/UPjFzWKVXVWe1Hv2JBqhZ
	wtwMEJLKzEkGnnKVlzfa/51HHz6M6Y6Zzkh7+hGiAJdjjEPpZo8Rmb5YOKLvrnOyQg9GPNO1+We
	UHlAy35jbJMTp7hPO+1YzsbDh52ccWS3G/uUscq3odlPUKSXzvR1xyRhouCHC+7NyHu5NDHt8Dw
	J4e5o1GCPqLjl15upO9MxfPccRJ8nglJ3YiKAxbnADjtPvAGjtoECkaGuOgaKizkeYgbr2MaVL7
	wK9jdCZPFh5IZBHt9pRTLoYsDGLkge0Bs1w
X-Received: by 2002:a05:622a:164a:b0:4b6:24ba:dc6a with SMTP id d75a77b69052e-5093a17c6a2mr5371061cf.38.1773182297099;
        Tue, 10 Mar 2026 15:38:17 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd54f9sm2958836d6.6.2026.03.10.15.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:38:16 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:38:15 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to
 dynamic layer for meta-webserver
Message-ID: <abCdV-WOM6O4DYfk@gmail.com>
References: <20260310135815.3353144-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310135815.3353144-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9637

In message: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to dynamic layer for meta-webserver
on 10/03/2026 Martin Jansa via lists.yoctoproject.org wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
> 
> it depends on cockpit recipe from there, fixes:
> ERROR: Nothing PROVIDES 'cockpit' (but meta-virtualization/recipes-extended/cockpit-machines/cockpit-machines_346.bb DEPENDS on or otherwise requires it)
> in bitbake world builds

I guess alternatively, could a skiprecipe be raised if webserver
isn't in the collections ?

Or meta-weberver becomes a dependency (which I do not want).

Bruce

> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  conf/layer.conf                                                 | 2 ++
>  .../recipes-extended}/cockpit-machines/cockpit-machines_346.bb  | 0
>  2 files changed, 2 insertions(+)
>  rename {recipes-extended => dynamic-layers/webserver/recipes-extended}/cockpit-machines/cockpit-machines_346.bb (100%)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 6eadc87f..a0f13f01 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -16,6 +16,8 @@ BBFILES_DYNAMIC += " \
>      raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bbappend \
>      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
>      xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
> +    webserver:${LAYERDIR}/dynamic-layers/webserver/*/*/*.bb \
> +    webserver:${LAYERDIR}/dynamic-layers/webserver/*/*/*.bbappend \
>  "
>  
>  # This should only be incremented on significant changes that will
> diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/dynamic-layers/webserver/recipes-extended/cockpit-machines/cockpit-machines_346.bb
> similarity index 100%
> rename from recipes-extended/cockpit-machines/cockpit-machines_346.bb
> rename to dynamic-layers/webserver/recipes-extended/cockpit-machines/cockpit-machines_346.bb

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9633): https://lists.yoctoproject.org/g/meta-virtualization/message/9633
> Mute This Topic: https://lists.yoctoproject.org/mt/118241115/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


