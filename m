Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228131061B1E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 19:39:21 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4026.1774899551234888223
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 12:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FCtRH/6h;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cd7ecedf2cso506615985a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774899550; x=1775504350; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WJQvrvsfiCqaDyx8TP1znTTYNZUz9eZKZPUxYrHP/0=;
        b=FCtRH/6hlremZtIM9fkt8CXH3bxsP+0MLuUae7+HHj1chqeyrFKWxu6+ZH2dqXK8vo
         F+1qUOPn7xqcw/JczQN1Tpfwf3V21Qd1WRwfB/Wz0U4h0U/xH0DyiFJRVzI1XhSOU+i7
         piEgdbDXO0g0+/dogjZ1RNh3efhfOs7nrq+ruj+sJ92q/77GhHZzBFm2FgBIwAj2XM89
         HMULM92v1Esf70Q2kN7GfjN4Q5xe5RT/OrPuM2oNF5zKClIu3L/HNTDDKYj1GZoruvS8
         Cic+aQiA1pWGkAuUOe87Yh7wDBADuLdD8AEFyeYBJVnF53VydE7ke/YtCbO0sOHqv5En
         zW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899550; x=1775504350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WJQvrvsfiCqaDyx8TP1znTTYNZUz9eZKZPUxYrHP/0=;
        b=pV51+thpL32EVAIgfl0/dcezpxecxsWELKexaaqWqbrMqUkAqD4l+4FnbeLVlxDYaR
         HK2G3EwHO+ktxXKfjx50cfmbK/h9WJ15XFvTWvZTf7dqLYX8Tx3obJdkmHQWLMRwSAan
         UQoiburUSRHwOVDKyqCnan8OzLqMlFS7YPYVV3lz1WeiGN1ltdTIxZlB7zuHgzH4vnv8
         InR6G3156NYoqaT5s5xjMg2sMj7WZURQNRG0i91flsFyP8mvJVOxWB/frU8K14rt4+kb
         cHzx71r8+LPB6Tbw4ij5msmtmWWfCcGNVUR28n/AeX8dTNj+RX1oZ5lm+cALm3KvwkAT
         JV9g==
X-Gm-Message-State: AOJu0YwIcyBBD2C8GbA1rXlmMOV63Qt1s2emFBIaNliIPUtUQTRVs6S7
	uNiYVYWIkAh+GmO/SEuqekJj2p/Ce+dBMcQ9F46dmcMvqtm/swtTQXQF
X-Gm-Gg: ATEYQzwOxUChCA0n8dh03D3/lj5JiFZqO4Q/lVWEcneRj3P7G+X7rUNnAAtyUMmSGpA
	VA6nWQLvMXqHyfz/i4YEvYqrGmK38M6iK9k59bn7pqfoRInlTXmmir2sJwUGV9q0Z9EeUXM1NWY
	4yny+TiJx1o+UNlk49mEk3pKUnlWQurtmEvgmvZKTfp11Lz31NG3GfKPx53DKfUpdEs1zbFg7MZ
	88aBPmwk//MfcC8JK7clKCUUppqdL7Gy0gAOP3F+DhOKm15PqByx024TeYjFLwEBVfD6RiPSnjP
	r3GDMA+1nHSx7Yp4tFn5UodNR/BJMWKaxfTn5SO94iZXryNwY55ZqwcAv0Xtnz7Huoqilvxqbrn
	CFTGiojT7zJ0sRMWCSFhAqPLGV8G7C+Wezlx7VUYV0GwqUNvR6HR5VloDN958+PuIOq4gxNYmpO
	idrXpN+9hs0YUOC6Sp5o77Nt6N2WbeztholLf6mzD8Y8r8ZK+GeNgCuc8JXOBW0YBJU9A8pJjXa
	rUaNvQ6DzO9YAHENC8agZ0PTcRwF79P3VeS3a2RJHQ1YXA=
X-Received: by 2002:a05:620a:4482:b0:8d0:162:31b with SMTP id af79cd13be357-8d01c68bad6mr1786885085a.32.1774899549985;
        Mon, 30 Mar 2026 12:39:09 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027db4770sm800676085a.0.2026.03.30.12.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:39:09 -0700 (PDT)
Date: Mon, 30 Mar 2026 19:39:07 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com,
	xe-linux-external@cisco.com
Subject: Re: [meta-virtualization] [master] [PATCH] containerd: Add
 CVE_PRODUCT to align with NVD CPE
Message-ID: <acrRWz1CV-jbVTh6@gmail.com>
References: <20260327110600.2686287-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327110600.2686287-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 19:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9684

merged.

Bruce

In message: [meta-virtualization] [master] [PATCH] containerd: Add CVE_PRODUCT to align with NVD CPE
on 27/03/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> `CVE_PRODUCT` has been set to `linuxfoundation:containerd` to align
> with the product naming defined in the NVD CPE database for
> `containerd`.
> 
> Only a single CPE entry exists in the NVD for this product:
>  `cpe:2.3:a:linuxfoundation:containerd`
> 
> The NVD references for this CPE confirm that it corresponds to the
> source code used in our recipe.
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-containers/containerd/containerd_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index d69518d4..51d7c2e2 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -105,3 +105,6 @@ RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>  ## configured in the distro, since we may have collisions.
>  CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
>  inherit cni_networking
> +
> +# Add CVE_PRODUCT to match the NVD CPE product name
> +CVE_PRODUCT = "linuxfoundation:containerd"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9676): https://lists.yoctoproject.org/g/meta-virtualization/message/9676
> Mute This Topic: https://lists.yoctoproject.org/mt/118532463/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


