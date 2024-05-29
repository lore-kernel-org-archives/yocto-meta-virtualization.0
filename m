Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37776C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 13:40:50 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.14528.1716990044512009903
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 06:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPYYMi9P;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-627efad69b4so19802567b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716990044; x=1717594844; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAO7F1WNTz40rAG5SipRb60q0URe2XXOmeAv2Wsr+nc=;
        b=mPYYMi9Pqdiyg21JZVreDeR1ZS7Q0HiBZspDfB2P2Fl3mqeO1vyhAr6loE62bElQvC
         Lw0n7qx2iFULjuXYhOpoL8DjsxQscAMNpNZTxuvxKkoyPmYrHPt4bSJhxY5UFEGGhAaB
         g64x93Kd4gY+0yJPTnk9pVGlcgM2fEnpd8GkD08SBT5ETR0gEeJzhC087krs+74H/GA0
         /6f+yMmREB0DI9AiGsIav0eDb8rdrNSrPeEOk4iY0TyNTT85Bna+jXVyTI5O5up3+YyQ
         Bh45s2UzylJZ1d1G1Xst2/U7qEDtfMc1HiWwPotncuMxqp+mL2Va+ntvP8fU598RZeSu
         0msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990044; x=1717594844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAO7F1WNTz40rAG5SipRb60q0URe2XXOmeAv2Wsr+nc=;
        b=ClYszQWJ9ky6LCY5IZH/SOIkRYXCgmnceNyVAhJXQ0oGPDwumnEgtaXZtuFJTAJYpr
         r7dow7suU4svvTc4kJdoOD6d0RF4wWnzaZm1StuTVv14HJjwyVGdgQ4FH4+YjSrT3YGJ
         HvdqAud7YduKdNQ7Q8fuQGnD1Ff9CR44dKzYp8kfh/Dhh0oOwvxZlcMjbzCQ41ly7o1s
         fk9X/bJn6IKQEsvaFgP5PYWAQ2A6Nsh+5gWeIp7IR0iRIoqzv3kFpehoJxOmfWDEwMIP
         lYd21znhMmNF3DDsmYI88vfHhVbDP0IxaSYsXlHwH02h1JdlAEhhKWjWQ4diwqawAOBP
         FbZQ==
X-Gm-Message-State: AOJu0Yw48Upgcqf6cEyCzAuvp0LIzM7Rqsodk6Qr67eH5FCTStUsyLH6
	KhWKM9feiQzUn0u/mNfF5CWen3baPxbZX8GYMtUtEL1aLyffrk6KCvRxAw==
X-Google-Smtp-Source: AGHT+IEhET98fdRiSDbcOZ5/vjUexuKt68jW00eUPb0UX/ZSZItr4jc9S9fN0TeDEylqbFWDwIa6Tw==
X-Received: by 2002:a0d:e68b:0:b0:61e:124c:e71f with SMTP id 00721157ae682-62a08da7f74mr145855077b3.26.1716990043436;
        Wed, 29 May 2024 06:40:43 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd32207sm469663785a.112.2024.05.29.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:40:43 -0700 (PDT)
Date: Wed, 29 May 2024 13:40:41 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yogita.Urade@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] buildah: upgrade to
 1.34.3
Message-ID: <ZlcwWYV5DkkUapmS@gmail.com>
References: <20240524083155.3543182-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524083155.3543182-1-yogita.urade@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 13:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8782

I couldn't merge this prviously, as this would have made the
scarthgap version of buildah newer than the one on master.

But I've bumped master to 1.36, so this is now merged to
scarthgap

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/1] buildah: upgrade to 1.34.3
on 24/05/2024 Urade, Yogita via lists.yoctoproject.org wrote:

> From: Yogita Urade <yogita.urade@windriver.com>
> 
> Includes fix for: CVE-2024-1753
> 
> Changelog:
> =========
> 2db756331 (tag: v1.34.3) [release-1.34] Bump Buildah to v1.34.3
> 699d1ed51 [release-1.34] CVE-2024-24786 protobuf to 1.33
> 4ffe07267 Merge pull request #5419 from TomSweeneyRedHat/dev/tsweeney/cve-1.34
> 968e8ab62 [release-1.34] Bump to Buildah v1.34.3-dev
> 776a1463d (tag: v1.34.2) [release-1.34] Bump to Buildah v1.34.2
> afc086b65 conformance tests: don't break on trailing zeroes in layer blobs
> 3deda1913 [release-1.34] CVE-2024-1753 container escape fix
> 14d60c988 Merge pull request #5365 from edsantiago/skip_unshare_on_rhel--1.34
> 4f775b4a1 tests: skip_if_no_unshare(): check for --setuid
> dbeb097c6 Merge pull request #5352 from TomSweeneyRedHat/dev/tsweeney/buildah_1_34_1
> 
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 64ee4f7d..90ffc238 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
>  
>  S = "${WORKDIR}/git"
>  
> -BUILDAH_VERSION = "1.34.1"
> +BUILDAH_VERSION = "1.34.3"
>  
>  PV = "${BUILDAH_VERSION}"
>  
> @@ -28,7 +28,7 @@ GO_WORKDIR = "${GO_INSTALL}"
>  GOBUILDFLAGS += "-mod vendor"
>  
>  SRCREV_FORMAT = "buildah_storage"
> -SRCREV_buildah = "dbeb097c6fbf4bfd643f096992da572a97a8ec12"
> +SRCREV_buildah = "2db756331014a4f355507df47d2622d05532da1f"
>  SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
>  
>  SRC_URI = " \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8750): https://lists.yoctoproject.org/g/meta-virtualization/message/8750
> Mute This Topic: https://lists.yoctoproject.org/mt/106278054/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


