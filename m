Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF6DC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:56:45 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.19599.1744232197048002506
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 13:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8xNzZ39;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47698757053so691871cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744232196; x=1744836996; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ub1LjQ40CMNm+97l7wYnmmA2og+hp/jnTzgbit3t4Ss=;
        b=Q8xNzZ39xBuEqRO4LebvsRDAZsFzsPce9KXV/FUq+dxvwdc9claXBwiI2rZAH8EfcB
         vkPkcQb2ywUcCnQOAeUbwKIowuSHGyOjHIXeVk8mGhaovqb/YxG3urwqKg8evKIijGQw
         VV6F4goGhmfoj2x2NhHf5J8bymCTs175J7ZkZwq6XUv2ZMlVSQ2lbAUv14710hGosl40
         Klg+Czu9Bq+eCBZVKo+zBv5QVjkCwCdLBXODToTALj1piDVrZVwNF3ZuCHosziZROly/
         gO0Qe7EPEFH1AgIHSzOJUxRlSX72LY9p6K3/kXxT7UivzZP/ZelEixl2PNC5oIKDRTWq
         FCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744232196; x=1744836996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub1LjQ40CMNm+97l7wYnmmA2og+hp/jnTzgbit3t4Ss=;
        b=C3BhxLh9+Xx1EOgdcmdNQNU04G5FAJlKfXEaHi9BbtxbHRXUoB7RoJwbx+wjh64rJv
         AFR0KBrmlDfxvY0cBPHb2f4Ar4qBzBKdk2KITcp+i8h8RRVuAp7fK0paXrh7NYtCCRjE
         fZUHekgqFqyUobW6+ejx/0u3lYOAzUlr/c+6jqD3Mn2flKKr3COhecwjat+69P/lTxP7
         ZBV23PFrjYvDfSC7FuvuV7HzPfXD1w8ANVTcuK2XZA/8CUZg/MuogoLWlzzvCjT7IlHt
         eilkoSZ57VEw+mr3cCt4wtJt10qrUpjEEJLS5g+UKe7Yod6zK5Tzq58yp0064MfuYfRE
         on2A==
X-Gm-Message-State: AOJu0YxzUB9FsYiMGPUMCiaLe1uF2rEuE3J/rM+jVkmtx6ajuXPPOsqa
	nSQs3dEdihtVhWkp7JiRm/iIi8OEDxinOC26DA8HZNWhiY+kyokc
X-Gm-Gg: ASbGncsCnTtR3XMy99aN7tvz97mQ8cbS6/us/N3CxWFdvZT2vL6w60+tt/HoINumHLN
	fiHTXh4IaiMHCJkFuBa/z8Piief9PV2lpQ/kmsrpRc3KVJZ0sssTKUssqla6WJdu/wN9IOSFWJ9
	b/7w43zj2BPxCOS3f4XBZhoBexGiJnS6BXege6bnO3FP5FM8fN1rrhAO2FVPDIlltsDppd0Onx0
	1t4BzD23E2xTAToOj3VPhgVqbPAHhe7ga5r6Kgigsr8Ssb9kAcnFuVJOXzk/JIpbAc6iNpFfWP4
	hK9eCYceMJuQbjzbL15M7VnmYRDHmRxlXcD8ViAEdU2qTYhJXG+ISQLISrQWUnm/D9LFfMhgIeR
	KKs8BEmu6xKMKr9NLXxs=
X-Google-Smtp-Source: AGHT+IE+OMJDpmRA3wHjewkpsOgEzTpfNyrduhkP6BW1ObKa5UbpIFJjy55ck/t7siV+vDb3etl7bA==
X-Received: by 2002:ac8:5954:0:b0:476:84c0:4864 with SMTP id d75a77b69052e-4796cbc64camr4454631cf.31.1744232195968;
        Wed, 09 Apr 2025 13:56:35 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47964de11a0sm11409971cf.36.2025.04.09.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:56:35 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:56:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Maohui <leimaohui@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 1/3] open-iscsi-user: Update
 the Upstream-Status accordingly
Message-ID: <Z_bfAeTQ-M7Zy1D1@gmail.com>
References: <20250407104025.2468-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407104025.2468-1-leimaohui@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 20:56:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9216

All three patches are applied.

Bruce

In message: [meta-virtualization][m-c-s][PATCH 1/3] open-iscsi-user: Update the Upstream-Status accordingly
on 07/04/2025 Lei Maohui wrote:

> Fix the "QA Issue: Missing Upstream-Status in patch"
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch           | 1 +
>  .../files/0001-Makefile-Fix-build-error-of-cross-build.patch     | 1 +
>  ...01-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch | 1 +
>  .../open-iscsi/files/0001-fix-build-error-of-cross-build.patch   | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
> index ef11366b..437c876a 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
> @@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
>  Date: Wed, 18 May 2022 11:32:29 +0900
>  Subject: [PATCH] Fix /usr/bin/sed to sed.
>  
> +Upstream-Status: Pending
>  Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>  ---
>   doc/Makefile   | 2 +-
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
> index bdb9e45f..facca528 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
> @@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
>  Date: Wed, 18 May 2022 10:28:53 +0900
>  Subject: [PATCH] Makefile: Fix build error of cross build.
>  
> +Upstream-Status: Pending
>  Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>  ---
>   Makefile | 2 +-
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
> index 8cea597e..aa1b5a30 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
> @@ -3,6 +3,7 @@ From: Lei Maohui <leimaohui@fujitsu.com>
>  Date: Fri, 20 May 2022 17:59:03 +0900
>  Subject: [PATCH] Modified path of systemd service from /usr/lib to /lib.
>  
> +Upstream-Status: Pending
>  Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>  ---
>   etc/Makefile | 2 +-
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
> index 8eec2dc5..ee1edead 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-build-error-of-cross-build.patch
> @@ -7,6 +7,7 @@ The error likes as following
>  | configure: error: cannot run C compiled programs.
>  | If you meant to cross compile, use `--host'.
>  
> +Upstream-Status: Pending
>  Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>  ---
>   Makefile | 2 +-
> -- 
> 2.43.0
> 

