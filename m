Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC28BFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:42:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11392.1777376539212572875
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DjPhDTv9;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d4f78fc9f6so1235442485a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376538; x=1777981338; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pM6Nz4KWZwuDOCQ/5iMxPh1w6WYfDuDbMGyshW5kiQ4=;
        b=DjPhDTv9sTIhyqIPqQ9SrcyFTgl/64ktR9thcRG1JSH53leoipeBCzWP3FA/Q/3UAf
         bLX8yQz7WvBIYJNqE3TQ2jUf9X12DOqaEaJExWOSCh6OI/HBYDSxGyFegqkoF7c2lgpH
         FcwYMvBvMkvaf3nYYkB8qYUAa5JWRD8mSGwEAZ+YgoF4ihCHJp9kCJIDRhwF9ApWBtIz
         52zvbfJ/6C4NGTZjxtt9rxDm5hfahc1oQHkwz0XdLymbSivLKB57fFUridxAQ2qiX/3t
         dSy1UHu98oFW4NHy3WQOP8fZyhXVeYazJZQBUACcVU9kq/EVtexwUR/GUuH4qrxNty/P
         uOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376538; x=1777981338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM6Nz4KWZwuDOCQ/5iMxPh1w6WYfDuDbMGyshW5kiQ4=;
        b=RP7V831frHCSarEaJ7o4lX7hVovqj+jYbToouPFSl4RmER9jq8gAa5pVFFihxAZDah
         UaoghXrP4A9bly45XH2SO71LMGFZZ1JBgmFXNqCDBfBhgJ6fVOgm9EgnjRJtIn8z4D4j
         gXAyjNAMa6zTULJ5Rmc2zcNIHLp8yM9qgYQLhehBzRXoH4hVIIWu/z8Mp6X/HiEsdsED
         ac75lzIPGExkPPtPFVvFXEjZGSIK59pZ6JMNspy2/FHOpoqEg3hhwbNffT2cu7CEv8pV
         hIbbZSsidWLGJdHfseuSIyPJyQYcI2UmXuBqxSKvXBveyjauNzKh6D8yDDeg7BUHP1+C
         U4UQ==
X-Gm-Message-State: AOJu0Yxdjl4v3t0viTeEE+uRQ8KUA8LjRGeoiUhFfatuuRxGeRSN6324
	e9mCluNHcxM018dQgHelXoJdDUKtGubbRJudSDxT28bS7zhgsgmNjYnb
X-Gm-Gg: AeBDietgRxCc4ZyLCvhy+KcCtYbL1GoLzpOl5ZymnJiiie+fFgsYZh8a2Nm66Y6dr44
	JkKxkMbD3h4PL7u5R8Ub5BVb5v0xXgjezBiuZrdq3D/lCjDs5k39+QKqwCG1twx/8iDHuam/DnI
	mQl7iCeGbC5kNIjSl1GwfIVjn2MnwryVDt8fmdpuseneXz+pWRGpDRcrF44D7R5P8HJP290RvTD
	bV2Mk0c8K1kDMMm/aLbXoxfxD2Opjf3sT7MmBlyoNVDt4r3gO61NmzFsa2Uj+54i4vrqt2w12c9
	OSvQaLLWuyCdS15/D+aemIuv45l3CzV3ZMfNWN3FjCABWHRyTMJlHLrJfuEbFp6DwkYHYwP6Y4E
	3pcQvPBLQj5QmOdJ3GOFXoxnpNInq8OgjR2TqgN8XJLu97mo9wrbZSPDALdwWR/BwqfcpnVMef9
	4K4U8hrrOmkgKHRVIrVYZZzEmcAChTmcT7rMPbwD3FeIQvaHojXtm1fvdhOSzGjoH3cFmltJ6cv
	OWc+g0OBDE4gtVu6nfIJGFTqocO5kBwDzybZER/Xl4EVe0=
X-Received: by 2002:a05:620a:4510:b0:8d6:7dc4:6906 with SMTP id af79cd13be357-8f7d9201c5emr328044985a.33.1777376538020;
        Tue, 28 Apr 2026 04:42:18 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e2999812sm17670596d6.46.2026.04.28.04.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:42:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:42:15 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hjadon@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH]
 containerd-opencontainers: align CVE_PRODUCT with NVD CPE naming
Message-ID: <afCdF9LzJOlJqbSD@gmail.com>
References: <20260423043817.4194116-1-hjadon@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423043817.4194116-1-hjadon@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:42:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9762

merged.

Bruce

In message: [meta-virtualization] [scarthgap] [PATCH] containerd-opencontainers: align CVE_PRODUCT with NVD CPE naming
on 22/04/2026 Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.yoctoproject.org wrote:

> From: Himanshu Jadon <hjadon@cisco.com>
> 
> Update CVE_PRODUCT from containerd to linuxfoundation:containerd in
> containerd-opencontainers recipe to match the vendor-qualified
> NVD CPE naming.
> 
> This aligns with the master update[1] and avoids potential CVE lookup
> gaps caused by an unqualified product token.
> 
> Reference:
> [1] https://git.yoctoproject.org/meta-virtualization/commit/?id=f829fbfda0f14365235d48dbe2055121fbc0718c
> 
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 3144a5a6..4ecc915a 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -96,4 +96,4 @@ COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
>  
>  RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>  
> -CVE_PRODUCT = "containerd"
> +CVE_PRODUCT = "linuxfoundation:containerd"
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9722): https://lists.yoctoproject.org/g/meta-virtualization/message/9722
> Mute This Topic: https://lists.yoctoproject.org/mt/118967266/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


