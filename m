Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535C8CEFCFA
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:29:52 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98525.1767727791769074534
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bL34Re86;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2d56eaaceso133646585a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727791; x=1768332591; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGS15FZVL57VqWREnHYRH37r6GsipUGNM7SXgrS5Q/U=;
        b=bL34Re86xAJnA0nVNGfZnbltuYQVWBUvDzEK74fbcU5feTwEz/PbeCD8KVOS0EktaB
         L86ncMeDOkzij9Ok3okYAuiqs9RAFdG0KE0UgedOFTO0ZdRCfZsrwAaguUzvl+qg0axl
         nHMXpsYxEFS9RwHItMFdjPFCrQbNmjKCKPRrPQVODx6rm6MpAUB0URc00asD1wIG8r6m
         +rYNBgCRZnkmUpr6HXsSOhMmTOZMcWULrVedcE0igMt6itPEo3ZkbjqYWcAl+u4uBlmt
         eegKBLdaaM9JsMYxhAdReeuDE653dWmQ6HbwHQKMMO8lj+oXsNCCrVeTP6M4IoNFmp3w
         9xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727791; x=1768332591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGS15FZVL57VqWREnHYRH37r6GsipUGNM7SXgrS5Q/U=;
        b=To3RzX83sbpN36X59mQQ5fGNEoxzrmByyIlxDBtgnNduYJ15SAuXIMwIYzbicgTaSU
         L3qttMWbbHyhbJPNaGKGb7JkSDe2kpCF2UjRB/LbNEiBPQja1DZxPioXuZxCn4XH15wy
         jNje/Ct9M10XEczoHU6nRNE8RFOaZoer4TY4kjM4yEOtbajXON0Aq4xHS3FcqPUTuwfY
         RU9TkrIXHOqlJor95qME4yvK7801rlS7+DCeY1F2+ZpYAZPK09gDZQ20TOKWC2cdzdgc
         M1gMbDXO19fTsV2vq0/5aj+IJmJ4uZkl8C/UYTQb9TgC8GLhTzBCS5m1K53geFzrBnjS
         w5ag==
X-Gm-Message-State: AOJu0Yyjw2aMurq/nCxu/QNNbkaTEKFVZmiCDFHBA5nqq8l++3p5znsF
	pxkPV4gRXdY4xFSxtuTpNP9mF0IyLxuTZBOqhDwFbKb/JaaL/cFLPHBHhakQDmqesIM=
X-Gm-Gg: AY/fxX4+KAyIOArCjnxV4hy1Bi8oEQrNXL343whFRhKCAu5p6NaTQct2KcB7+57FZ5t
	ouz+lSjabR9Za6iAeas0spzKdkB0ozxlTRgZPARaT1pTtQmRChlc6eB9sSdMM8Wm1X7LDMIm1kq
	rSjPwRYxpypRMkcdsHORq5EHzw+Ng7OBJKb20g8At7gobFdok0avJ5IfobbrdmwkJRhZxU3L9DZ
	G/y1YW9Qx/KJ5LnEMn4YWjzJ/u4/HXyR7IqbCRNCW3QXIe/q1af0FrSD9LOqA8Kvic5P5DTi4Zd
	x74g1oVmlHguPb/+9n2EOlD0AsWUKcZqr7FX6AZ7ZRtUCdudnJoGRRDOaf2K8qTndruWCs/eT9s
	SoRJlvV93rORIYqusyqHN/ygCI3cQcX0l23dz27ltIuRizx0DQOJhvsER+m6Kxl9U/bqZRk7rgl
	VYhxpALoz5RP/cNX6Z2sk/yB0FXA2wl543ewnBKuh/3aSGtHk6/hVbSEFXc1Jc1534
X-Google-Smtp-Source: AGHT+IEishX1VPEvupdazZbyIZyFt5DdAhctfHT9xMPf6Y6skvysG8zs3/L7BbhKuhV8tephz0wYEw==
X-Received: by 2002:a05:620a:4504:b0:8b2:eb9f:f1dd with SMTP id af79cd13be357-8c37ebdc600mr503750785a.79.1767727790657;
        Tue, 06 Jan 2026 11:29:50 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53129fsm222796085a.44.2026.01.06.11.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:29:50 -0800 (PST)
Date: Tue, 6 Jan 2026 14:29:48 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: yi.zhao@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-dotenv: add
 UPSTREAM_CHECK_PYPI_PACKAGE
Message-ID: <aV1irCAZ2W++7Ogy@gmail.com>
References: <20251218142933.3335853-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218142933.3335853-1-yi.zhao@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9523

While I don't use devtool, I have no object to the patch.

This is merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-dotenv: add UPSTREAM_CHECK_PYPI_PACKAGE
on 18/12/2025 Yi Zhao via lists.yoctoproject.org wrote:

> Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
> verison.
> 
> Before the patch:
> $ devtool latest-version python3-dotenv
> INFO: Current version: 1.1.0
> INFO: Latest version: 1.0.1
> 
> After the patch:
> $ devtool latest-version python3-dotenv
> INFO: Current version: 1.1.0
> INFO: Latest version: 1.2.1
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  recipes-devtools/python/python3-dotenv_1.1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-devtools/python/python3-dotenv_1.1.0.bb b/recipes-devtools/python/python3-dotenv_1.1.0.bb
> index f297e6a6..7e20a444 100644
> --- a/recipes-devtools/python/python3-dotenv_1.1.0.bb
> +++ b/recipes-devtools/python/python3-dotenv_1.1.0.bb
> @@ -6,6 +6,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
>  
>  PYPI_PACKAGE = "python_dotenv"
> +UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>  
>  SRC_URI[sha256sum] = "41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9494): https://lists.yoctoproject.org/g/meta-virtualization/message/9494
> Mute This Topic: https://lists.yoctoproject.org/mt/116842741/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


