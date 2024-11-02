Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07098E677E4
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:11:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.11199.1730520687278037695
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fnAyWiWP;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cbf2fc28feso16329496d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520686; x=1731125486; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ectxEdYguVefU3DLIPfA9NWOXN0u2B47xChllDX2yYo=;
        b=fnAyWiWPzI03+YJv1EDT6YATx0Y2q/2eU68Xz8rHGfxawCdBcvHiLiGiw7lf8m7pZL
         oLPE4loDc0m1vfbR3OEFoIcL5XKKN2VbAthTDw3S6SHRrPKsTRpUUvneqjiXAuBS7uUl
         Jtiy49yy9hpGx16jgsz3TQHxjWeVQjKuKxVSXgAA02Bh0OYmYba+TdDTCUBvwSc0/aXm
         Xu+MY27BCs1krY1WsQBtKU9i+vt2Z31qAmKHSIECRcLtOFdKnmR16Dc9D0gCe9NttaEM
         tfh5G1DVhPRgmoZvHF763bWirwdP6KiQR3YwzcDN6ViODlelCPTI8NUpi+OsZCnsxw3s
         AUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520686; x=1731125486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ectxEdYguVefU3DLIPfA9NWOXN0u2B47xChllDX2yYo=;
        b=g/jXSsWhXSTfs/EnnP7oCT5krFghSsdTaufbZz8T0vQ8gyNXBsfKQV1YDAmTSlmRuR
         VyEArMJcdZlqQtwzk4NcCtwHhN+dX8lWjtN5+166GFPUGmA59/39AHkehpKcyrD1BjeF
         JGm2l/s1T+zDgjpdZ0nmKu4ZbmGQ4/No1bu5Oa07Xm+FX6QqXorXcJvDwHL72xbeLyNj
         X/+e6TBIe0MALsMcQuPmsBJbnFAalOsYnOlkBJKnxWvunCV5px0No0Sith4gxdSt6BCC
         dxJgbmrl9Nleqx3z2ZDLd1w5hV7OoEa4DvJh2eDgQUPWm/fLy8JSUpi9JLNGhCVSYXDH
         ZasA==
X-Gm-Message-State: AOJu0YzSDa5Vv6L4GitMVVaqW05ORyLEGZQWIrkWEygZHY1l2U7zXSL0
	3euu9M0wlc9SIXU3JvTK57k5ajMGSpDwcgUzlA+G+kUZCUiuM2yNp2HnAw==
X-Google-Smtp-Source: AGHT+IE331tAKjPhNz/q8l1qrazqtO5FVshKK5yQYgSQmkb9R3elHgCaNM+3STsEnIkN5lGUmITmLQ==
X-Received: by 2002:a05:6214:46a0:b0:6cc:255:202f with SMTP id 6a1803df08f44-6d18586b5e2mr414105686d6.51.1730520686090;
        Fri, 01 Nov 2024 21:11:26 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415a703sm26116286d6.85.2024.11.01.21.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 21:11:25 -0700 (PDT)
Date: Sat, 2 Nov 2024 00:11:23 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade
 1.1.12 -> 1.1.14
Message-ID: <ZyWma42RwwpKNf2H@gmail.com>
References: <20241016101449.2971072-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016101449.2971072-1-divya.chellam@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:11:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8954

This patch doesn't apply to Kirkstone.

The version of runc-docker in that branch is not the
same as in the context of the patch.

So either you have a bunch of local upgrades to the
recipe, or this shouldn't have been for Kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.12 -> 1.1.14
on 16/10/2024 dchellam via lists.yoctoproject.org wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
> 
> Issue: LIN1022-10708
> 
> Includes fix for CVE-2024-45310 and other bug fixes
> 
> Changelog:
> ==========
> https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md
> 
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index afecac67..72acdecb 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>  
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
> +SRCREV_runc-docker = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
>             file://0001-runc-Add-console-socket-dev-null.patch;patchdir=src/import \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=src/import \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=src/import \
>            "
>  
> -RUNC_VERSION = "1.1.12"
> +RUNC_VERSION = "1.1.14"
>  
>  CVE_PRODUCT = "runc"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8929): https://lists.yoctoproject.org/g/meta-virtualization/message/8929
> Mute This Topic: https://lists.yoctoproject.org/mt/109041162/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


