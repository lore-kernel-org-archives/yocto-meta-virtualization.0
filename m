Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2F6C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 18:43:54 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.21167.1690915427823282109
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 11:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cd8eWEQP;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-40fda409ca7so3116991cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690915427; x=1691520227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kl0PsOPVeuyMCWFYNF9vhARFUL7vAIXCgNtxWNfv7U0=;
        b=cd8eWEQP+kkKe77cE47eSz/4QzqHGwRuIiQW0FwKqPkWKplgVCswbUY8NCTuuR5bmN
         s35xIJ+Zek+RFiEGA6piJzkKjFiZgsUB4TCip/lyrz3H51c2BpstdB7DSWfKKuG2DTjT
         8P5A1hch63p326YSr0B2mXBC1dWfLySNZXSks1VLotRc2pqhYuog9UZYpMBWSOhCBDuM
         +SlM5RRP7LBg+BZbXzFN4DTBbBkUJzdirQs6OeEq7kpudUN4tbf9tVV3kt5WCnXv1nnw
         BJyTMT36nmyHBNUJpTA25kHJuVw4yfP1H9sMUh3R3i22y74lTCwwRP2ZcJYiaGW71Yj2
         Nlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690915427; x=1691520227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl0PsOPVeuyMCWFYNF9vhARFUL7vAIXCgNtxWNfv7U0=;
        b=bjXnwruSLoK2fbbQUMX6MYodcOqRDBtgaaC6AzayFk9psIxVELe9bEhufX0S/GFeqc
         0VgXCy3fMy49Ud/Gz9ntckWvUeZNbV541ZyxMQ1bL8pM691kTB5pcM/3xuOtQdWgHCYb
         RPeujOl4ZfVguGncFTxwzbth46+qsIrPdtYPx0f6qUWQkfPmWbTLiZZLPTNjgrYiyEp/
         RsTpxL7upjjWofQqxaRok+3uGK5vEEo5RQRYCDyF8cFwPbI69aTxR5BSqy1HqWcWmxx4
         hrDo/RzBc4/i0WiM09mWtg8uESRf2/gXetg/lAqJKLkppYihdQ2GqWFZUvJETvosYf2Z
         TIBw==
X-Gm-Message-State: ABy/qLapqLyeNdAfKDMSWT8mrNVC8iUAO0mgVaWqdOCWYaXp0VLLYmqt
	6CMcWayV5dRmiFSFJrdB/uQ=
X-Google-Smtp-Source: APBJJlHYKMNM6GS41SCkEX30W7uVtVKOTDmDGvkap3KPKbE5/LW3CBp3J/n7C+h1bYmj/Q/bZAhbnw==
X-Received: by 2002:ac8:7d45:0:b0:40e:5556:edce with SMTP id h5-20020ac87d45000000b0040e5556edcemr10473744qtb.59.1690915426818;
        Tue, 01 Aug 2023 11:43:46 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 10-20020ac8208a000000b00401f7f23ab6sm4690351qtd.85.2023.08.01.11.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 11:43:46 -0700 (PDT)
Date: Tue, 1 Aug 2023 14:43:44 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: ignore CVE-2022-2989 and
 CVE-2023-0778
Message-ID: <ZMlSYDq6sQu0n79j@gmail.com>
References: <20230729212428.1528245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729212428.1528245-1-peter.marko@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 18:43:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8162

merged.

Bruce


In message: [meta-virtualization][PATCH] podman: ignore CVE-2022-2989 and CVE-2023-0778
on 29/07/2023 Peter Marko via lists.yoctoproject.org wrote:

> From: Peter Marko <peter.marko@siemens.com>
> 
> NVD shows only redhat links and does not mention fixed-in release
> se these CVEs will show-up in reports indefinitely.
> They are already fixed in current version, so ignore them.
> 
> CVE-2022-2989
> * https://github.com/advisories/GHSA-4wjj-jwc9-2x96
> * https://github.com/containers/podman/pull/15618
> * commit d82a41687e614d9ac8b2d169dee47fe226835e4c Add container GID to additional groups
> 
> CVE-2023-0778
> * https://github.com/advisories/GHSA-qwqv-rqgf-8qh8
> * https://github.com/containers/podman/pull/17528
> * commit 6ca857feb07a5fdc96fd947afef03916291673d8 volume,container: chroot to source before exporting content
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 145b46f..9060e85 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -34,6 +34,9 @@ S = "${WORKDIR}/git"
>  
>  PV = "4.6.0-rc1+git${SRCPV}"
>  
> +CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
> +CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
> +
>  PACKAGES =+ "${PN}-contrib"
>  
>  PODMAN_PKG = "github.com/containers/libpod"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8150): https://lists.yoctoproject.org/g/meta-virtualization/message/8150
> Mute This Topic: https://lists.yoctoproject.org/mt/100434748/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


