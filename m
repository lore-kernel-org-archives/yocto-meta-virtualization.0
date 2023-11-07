Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFBCC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 01:50:19 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.1166.1699321816537670045
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 17:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KritMFx5;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77897c4ac1fso327304685a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 17:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699321815; x=1699926615; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PlRicDChHqY50xv/wHWdMmHNeKG8gzv7S/yfuDxLz8=;
        b=KritMFx5OTo0T0apgjWTvj7u9hapGdMjBU3Lja5Z/uKT7J+LIlRQhSm3+wOYWigKVL
         YjjxwBXRQbHyJ6lvA+L+8RGh6/2Dks17PcqFtpxzGNQBsNGIXD8wp2VW4W2VT8PuXPmI
         SEGOuhevbABzTMVY5yaNI/1Htn7NPlaWVWoDPjDvM7qLhvZLi/xvxT+ZdWcsE26YdP9m
         RXrS7/TPpPELFON2AnzbitqDYf3dUZ9a45F8LJ7idFWqVyw9CYtibujDpTo51dT+uGwU
         axd6/xQBbrRMhOcMyiQlQhQBgEuqXFh+MMkG2q4eg1ARp4ViwRxI+MWCOTFSAQeJBcnL
         SRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699321815; x=1699926615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PlRicDChHqY50xv/wHWdMmHNeKG8gzv7S/yfuDxLz8=;
        b=O1DGh510qexVOSxxFXmypnTs7R6RULmpIKwGGMvkc23/bgcdSXSoNR9tRPwER0Utni
         EUrREksYvWT38xz9iEBg0MwE7KAtQ2oqfrFhzC6lfXfvVmhwdmZZ9v9A2Qr9RcpwYUyL
         zK/0jbKsXprOO/NrouvxuFV4Izf52wzTyeoDzGILYZfHhBiGuP6YbeAAbgnejNhcppVZ
         D3IM9VDzvyurBBHq56OeZPLbe1hrA4AUa49VOk39iRBsRVASDap42tCy5POcFRkTAVW8
         RuZO+lUCBaf+RoKJlcxIDg0WA1kGS7NEONkDwYm1cEjacURTdynM0qHqvF98Ym7aMpsz
         AqzA==
X-Gm-Message-State: AOJu0YwGIoTkq0WEvApNBgEhL2V/nRUGTCUZjWhcW8zeaptQM5MOPo2t
	hAgb0WmjCVzmzZj30hNEx4NUhWfP6HScdUAH
X-Google-Smtp-Source: AGHT+IHD3Mdotd3esH09dvVUKnArZ9yrNl0ZErtcu5ZprOUMwtBLTQGLz76sMxbPb6UGdbhCgIWs+A==
X-Received: by 2002:a05:620a:4407:b0:776:fb0c:6b5c with SMTP id v7-20020a05620a440700b00776fb0c6b5cmr36511152qkp.13.1699321815408;
        Mon, 06 Nov 2023 17:50:15 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e27-20020a05620a12db00b0076d25b11b62sm3825948qkl.38.2023.11.06.17.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 17:50:15 -0800 (PST)
Date: Tue, 7 Nov 2023 01:50:13 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] grpc-go: add grpc to CVE_PRODUCT
Message-ID: <ZUmX1cUbzSachiPP@gmail.com>
References: <20231105140429.1973258-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105140429.1973258-1-peter.marko@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 01:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8431

merged to master-next.

Bruce

In message: [meta-virtualization][PATCH 1/2] grpc-go: add grpc to CVE_PRODUCT
on 05/11/2023 Peter Marko via lists.yoctoproject.org wrote:

> From: Peter Marko <peter.marko@siemens.com>
> 
> Some cves are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
> See https://nvd.nist.gov/vuln/detail/CVE-2023-44487
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-devtools/go/grpc-go_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
> index d5bfaab9..b3b58ed4 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -39,3 +39,7 @@ go_grpc_sysroot_preprocess () {
>  FILES:${PN} += " \
>      ${prefix}/local/go/src/${PKG_NAME}/* \
>  "
> +
> +# some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
> +# it's better to have false positives than false negatives
> +CVE_PRODUCT += "grpc"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8422): https://lists.yoctoproject.org/g/meta-virtualization/message/8422
> Mute This Topic: https://lists.yoctoproject.org/mt/102400850/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


