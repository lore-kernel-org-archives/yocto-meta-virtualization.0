Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330F9C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:46:24 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93489.1783086373395891378
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IVzw8laG;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e85499ffbso48082685a.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086372; x=1783691172; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDelMj32cb3N3hzLJAQBD+VbRtMOXhJfZzSk2teujcE=;
        b=IVzw8laGvQcL4bbx669aKVlArDdXUGMleyBFgix9iTLadYPVPmeKAep243av5llB4K
         O4ZH/4P6mDegj81sYxhARS4vK1jSv+9QqIROvkznVc8qCuUPHqJWCAsYcCWhA7LYsxBM
         MMqwTL3Bqk7N1GYU7nLy9ymKNhe2PFWOizRdvtp5RhqSDcw/4rXOlsMTYYhqlzUvo4lq
         4r0sPmNkPU1Qgbz7joNpNcD2YEc5AwV9mlZZUqwp53n26rzw8B9Kb9Fq1swvgwmLNEW+
         bGUi8QzKQU5SRE9Solcw8MtS1NnzjvbdD0f/AX2+lvRXZE+I2SXYFSO312WZ/KieBp8Y
         g5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086372; x=1783691172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDelMj32cb3N3hzLJAQBD+VbRtMOXhJfZzSk2teujcE=;
        b=Y9iGd4g/F2iJjlgs3u/PEGraXhOiaKFOfIsY4C3jTw6/4VITvxjXF7VnenSZ4tkP4E
         bCoJtHYmZAMu/hMDBgQi5ycYPzlEYuvL0mT7RXFzIJLMV/2aGD+y5U7HOMB4aruvT+Cx
         luPXiNkp5oH15QCNSADsS+fHdGnueVt8qZw2CFgL/EfasWXJA4AcH/MXsh8p9IALAMkE
         Ey1RcAX7F+fO1niGnTt2e8IGOGyL/V9Wmmz/9hFB/OsgUcAHGu4HCl4xhca7HJvDVqc/
         eCYeXgUSXJJwaMT8WyEOrq0qWxqZLEAB91pHx3WtwzU0EoaTU4X5TTiKVNfZBENr+2T5
         h5mg==
X-Gm-Message-State: AOJu0YxCtZkk20mEF+dgVC+SXCi6rOfTicHC4ea95qRABdkl/XNhtcz8
	DNFKDE4L+E966MwRqLq/rq8Xt8HResfCk/p8CG8hKfXxJFshM55sREw+
X-Gm-Gg: AfdE7cno42lfG0b+VZaxcLqAuOZZpJ3WBFMKb2BpGrKpOvxmvfgGh4Eois+T2EC/8D4
	xi58K5XTapSycw2g4WJMvtGzVmMU+tAdbQlLptTQyGgiA4BttwmmKhEs8vYRt8XuvDYp0H6d55B
	btbIt7mpCBReVPnDQdjBH0HBUlzc75zzYAFV65yjOXMkXk6agXXj/SBw2JD85slfSbPZE5j0dnk
	yYqVWbnzeArm9hQLsRJw1s8vsRsTzmnSTaNh1C26ehsQvRJmOaAxK2CNICNyQxsMITuG5BUIKUA
	h24DOaKEQkI4xuPoiWAG+81XTV0gWp9MbgC04tD2CKxKgro8GJce8nykA9lCvTCAVaG5nbOU5c7
	IEcNZEu4n0P/5/GQYIA12J301RLsh4tStFzVDGAGU1rsd4RPcUldIUfdbPhekQ2r6BS+aCZNZ95
	hqvrOw5hFJmOODpWAq2P2xDf7KqKWcvlOjQSlsAEibRyjRBgPBS5JZNhccZZYaTsaGmDxdz/FuF
	ycT2X2kM6wwQBc+GP33CbHwuuVqFLSzWSpy0/SQJFOILpkolWTv8X6aD+XNXs8FTMT/ksJX8HH5
	difLU/xsjxs=
X-Received: by 2002:a05:620a:3189:b0:915:5930:94e6 with SMTP id af79cd13be357-92e7b3b3893mr1261248085a.51.1783086372173;
        Fri, 03 Jul 2026 06:46:12 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbf5absm165388685a.34.2026.07.03.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:46:11 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:46:09 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [meta-virtualization][PATCH] alpine-oci-base: upgrade to 3.24.1
Message-ID: <ake9IRJIT8l8mQTi@gmail.com>
References: <20260630190643.75464-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630190643.75464-2-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:46:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9914

merged.

Thanks for the updates, I haven't added these packaged images to
my regular update flows, so revision bumps are welcome!

Bruce

In message: [meta-virtualization][PATCH] alpine-oci-base: upgrade to 3.24.1
on 30/06/2026 Tim Orling via lists.yoctoproject.org wrote:

> Upstream release notes:
> https://alpinelinux.org/posts/Alpine-3.24.1-released.html
> 
> CVE: CVE-2026-34180
> CVE: CVE-2026-34181
> CVE: CVE-2026-34182
> CVE: CVE-2026-34183
> CVE: CVE-2026-42764
> CVE: CVE-2026-42766
> CVE: CVE-2026-42767
> CVE: CVE-2026-42768
> CVE: CVE-2026-42769
> CVE: CVE-2026-42770
> CVE: CVE-2026-45445
> CVE: CVE-2026-45446
> CVE: CVE-2026-45447
> CVE: CVE-2026-7383
> CVE: CVE-2026-9076
> 
> The full git commit log:
> https://git.alpinelinux.org/aports/log/?h=v3.24.1
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../{alpine-oci-base_3.23.bb => alpine-oci-base_3.24.bb}    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-containers/oci-base-images/{alpine-oci-base_3.23.bb => alpine-oci-base_3.24.bb} (83%)
> 
> diff --git a/recipes-containers/oci-base-images/alpine-oci-base_3.23.bb b/recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
> similarity index 83%
> rename from recipes-containers/oci-base-images/alpine-oci-base_3.23.bb
> rename to recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
> index 7bf067d3..88e14789 100644
> --- a/recipes-containers/oci-base-images/alpine-oci-base_3.23.bb
> +++ b/recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
> @@ -21,11 +21,11 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  inherit container-bundle
>  
>  # Remote container from Docker Hub
> -CONTAINER_BUNDLES = "docker.io/library/alpine:3.23"
> +CONTAINER_BUNDLES = "docker.io/library/alpine:3.24"
>  
>  # REQUIRED: Pinned digest for reproducible builds
> -# Get with: skopeo inspect docker://docker.io/library/alpine:3.23 | jq -r '.Digest'
> -CONTAINER_DIGESTS[docker.io_library_alpine_3.23] = "sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11"
> +# Get with: skopeo inspect docker://docker.io/library/alpine:3.24 | jq -r '.Digest'
> +CONTAINER_DIGESTS[docker.io_library_alpine_3.24] = "sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b"
>  
>  # Enable deployment to DEPLOY_DIR_IMAGE for use as OCI base layer
>  CONTAINER_BUNDLE_DEPLOY = "1"
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9908): https://lists.yoctoproject.org/g/meta-virtualization/message/9908
> Mute This Topic: https://lists.yoctoproject.org/mt/120052438/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


