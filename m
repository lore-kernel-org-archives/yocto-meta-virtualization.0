Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B38EC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 18:48:58 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.30426.1752691729061248169
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 11:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WKSM9WnX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32f1763673cso1801791fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 11:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691727; x=1753296527; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPVPjYKUPa4zNsmPGvrq4rBHaOXoSEqSXLsLW4irkWI=;
        b=WKSM9WnXQn4tUunkdMpWad4/eTugIDjQAyx5uZWE4NDpwt/jw3NglRukvBmqCLDY4v
         rnxgkB3VPM/uWkzEd5fZo251BHyWALzxJPC25+cFLE5142yfmqqgDIpxMOgosoYL24Dc
         1EiMX422dazQSZwVDBtuJ03rpafSUSyzRxlWmK0Kp8iYmUFqqaOWMUGWirHB1oIdQetM
         ciJiGKS/yJ/s8T2mZ47Fk6VaUEhjLxvpUMq7SXZde6OAFOFSWpkJ3R/FvI5WlRy61W2h
         DPlBljIWS4OyT1zmvzH0EAUEK6FbIcztYi9EIdiK8WTyG3q9a7Jro0sk5ILI7yLHY7fm
         8sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691727; x=1753296527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPVPjYKUPa4zNsmPGvrq4rBHaOXoSEqSXLsLW4irkWI=;
        b=GtAPbaF3GieSVan677FR1NmtIby7jFQN1gaLNlhNrWjuQCKSSyfK9h95Hs4LZO9iAX
         5r7eaBkFRALBmj0Y88B8DRm2INJD2ZP78lADKC0bM/aBNxiHAcG2Hl164jIafAVzelTe
         DaT4G9DiWfdCEEUh82Sh5LYBIXw43sZZzdLNGv3pMpLNQ9pl+ar+GazvDmO4WQ39brp0
         szyP9P9paVVNnyvR8EVO9QmBQY0W18IkMZLyjlXWYu33duiITOokhpHcx0Lyy9Hhn2eV
         dTficy2iB34DOxlVH3IgPq4QhJfbHY6+tkqyRsvsv9XLMVd0TxwIkZvBw8fEw86TuAlk
         UHnQ==
X-Gm-Message-State: AOJu0Yy17k+hTEOHQEJCY/GpGmBMk4aO1UfL4EtXhLIlSZ/OdjzRBNr5
	ONsMYVo4HiA1bgIgaqcLT97QzJ8uUT4feATKxSSjxkiIDHB21O5k0ET5LuOdJPkq
X-Gm-Gg: ASbGncuTYlYT1/gsvpMGg6SZdqVBURgGaXGkbFpDTR5ALelakuyayRFPcynXdvWvuDX
	Fj7rCfgdhIoMHHOxSIdiu8Rvomt35gvyFpQQyaMo37IQN6w0Z7Che18bZYCkW8kzLQ8zqaZgA25
	GTzCWZ3A6xmA58u2CcpmXvFE0IRgUb036r3l4yOyOCc9Z1jHmtdZRvJTfgLddCIN5jd5suR3srb
	fgz08OTFsJdzm9Tld1qhxF02n0VipI/twtHas+NVmed8+8qCoTbzCYuEbdV1Y6bjI3dgeWWZNjd
	eicuQqpmvZgJ/grWdpBWfODgdBFi4JTmbmkBtny8YeYApj/K1s7TdCfm+Csi7us+G1rE5zXVjlb
	N4ryLsieX4Mxph7376gaiQ1o4iX/q0JDzXMhyRT62r05M6cogWzZiHF9N/7LMTDs2Lgd7NyX1XB
	3E
X-Google-Smtp-Source: AGHT+IEEzOQgSMaRrCopgmm2NY+0LmMjG3UxSTwQr/tEbkRQgMv1bmd7hsMNLRdJLZIQL+2+lhqqzg==
X-Received: by 2002:a05:651c:1986:b0:32a:62a2:f726 with SMTP id 38308e7fff4ca-3308f484a0bmr10998221fa.4.1752691726636;
        Wed, 16 Jul 2025 11:48:46 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab912336sm21766971fa.99.2025.07.16.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:48:45 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:48:43 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peng.zhang1.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][walnascar][PATCH]
 packagegroup-container: fix do_package_wrte_rpm issue in multilib build
Message-ID: <aHf0C57p1v4i3JAU@gmail.com>
References: <20250715071349.2948270-1-peng.zhang1.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715071349.2948270-1-peng.zhang1.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 18:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9313

merged.

Bruce

In message: [meta-virtualization][master][walnascar][PATCH] packagegroup-container: fix do_package_wrte_rpm issue in multilib build
on 15/07/2025 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> 
> When build lib32-packagegroup-container, the follwing error occurred:
> 
> ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
> depend on packages which are dynamically renamed (lib32-ipset-dbg to ipset-dbg)
> ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
> depend on packages which are dynamically renamed (lib32-ipset to ipset)
> ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
> depend on packages which are dynamically renamed (lib32-ipset-dev to ipset-dev)
> 
> To resolve this issue in a multilib build, set PACKAGE_ARCH appropriately to avoid using allarch.
> 
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index f5e20344..b94e6799 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -2,6 +2,8 @@ SUMMARY = "All packages for container host"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>  
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
>  inherit packagegroup
>  
>  COMPATIBLE_HOST = "^(?!(mips|riscv)).*"
> -- 
> 2.50.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9308): https://lists.yoctoproject.org/g/meta-virtualization/message/9308
> Mute This Topic: https://lists.yoctoproject.org/mt/114162900/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


