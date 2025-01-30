Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A593C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 18:54:55 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.2159.1738263288786171654
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 10:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5ih6EUa;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b702c3c021so111741685a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 10:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738263288; x=1738868088; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1F0t9hXJ2zGedGyFbXRUs066WkszJd7NMIg+yu9d8AY=;
        b=H5ih6EUabvJEEvQul7gH+RToSZ4kVcvU4bkiCtB5jGc8acv8XTm1yn2TzrhgEVDEo5
         uOa/kGBUJh4z+3xgTDwC42NxKH6GmPAS/TRITY2zJ4BYP8wfLitjNjQBMvrewfmxTo/r
         tT6fH6SdXCXUvNYikq2k0nsQd+fSZPnYK/JC9fkXs4j2Nju4UWHIRSIEfHL+uwU5r8RR
         QeUP0K6MM7ewe4xs8Tcko5qxRIS/UlZGsAmEsMgl+5ngDt38SpAPHtFqxyc3IxDLRBtB
         arKWXKtcNiDYeN+rdxbyx3kAoetutZv4epLctHx2qptpK0i+pIqKUSZoVbDqPDIIzH7i
         Pm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263288; x=1738868088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F0t9hXJ2zGedGyFbXRUs066WkszJd7NMIg+yu9d8AY=;
        b=qxXZsnoFAp7eUIaaJjBq9NZfwVJ8B/zlGl9XoESWXnUkgBao978baAccXa+a8W9q9r
         ct3O82/J36aSSa8OwOokDiO2DuDYO5bx9h/m7jXcSLbIi2s8+CDmjA7jHwwSDo7DVvtr
         fyCnin2cjsU06DA7RwmKU+p9pjLeRWiywQUgF1cBZjIwr5cmT2Y1yhgMd57QBlarj5kD
         hot9IQmbQ7LVGJj3UCm9GD4vBHdPy33RJ1RSfQ342PPo7BR5/JktnXshEcSFh+zp3Rg3
         /dhsmuWw2yn/jjm7iDIcWc5rEGzv3Jg+RoVeeGfmPmpNFcMt+Cf+ixcJ8Z1gzeC2jv7A
         EmuA==
X-Gm-Message-State: AOJu0YxcGyScMSKje2cp7rl3YjV0D2qEBfDqudmWgPVtb+zUxrO5o/e5
	ur4TOSNjib4bZABnJXxakpkujjNf/c6X7/v5f8brlB+AijqZYtc8BWmtyigdPb4=
X-Gm-Gg: ASbGncu1ow5SDtSc17peYg2npwqoU50m9l/1wVpLf9WtMHBw6MUYrttFyFgX33C5Wgw
	vFDSUncHXlL77bcALc43lbJl7UXP34lhmvWI2nXN++tz9rqH/M3XkQucASIzOHs0dNX4zG5IO6Y
	QaySCMUsvWcrhhxKxw7CRx7c5vvRzGvsCQKt5THBaiZBuW4BOF42fne/x1TgXarYIl0gSYInZll
	ASaHXx9ekdGCFalU4GX5cblbxGH4Vbl2iNI+nTxkHxSGuIXofSTPklJ0yrZwyIacrHIorN1/I4C
	GHHgjbenO/9zezhPvOLBfIbU+Y8vEFSVGZYY5TMA3MWHUTLCbz3GhCzhLnaXG3yIXFwpXw==
X-Google-Smtp-Source: AGHT+IHr6lfAzJJBuWUaKjEzZmAoiebl/htLuuY8FWgCgeieXNKsyRkas2+D6nAogdmjYJ35zQunlg==
X-Received: by 2002:a05:620a:1a8a:b0:7be:82fc:6871 with SMTP id af79cd13be357-7bffcce56cfmr1329227785a.18.1738263287769;
        Thu, 30 Jan 2025 10:54:47 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba83sm101734685a.9.2025.01.30.10.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:54:47 -0800 (PST)
Date: Thu, 30 Jan 2025 18:54:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/5] buildah: update to
 1.26.8
Message-ID: <Z5vK9BU7r0p2GYEp@gmail.com>
References: <20250122082847.3470429-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122082847.3470429-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 18:54:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9114

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/5] buildah: update to 1.26.8
on 22/01/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 024e82c1..9e074415 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
>  
>  S = "${WORKDIR}/git"
>  
> -BUILDAH_VERSION = "1.26"
> -SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
> +SRCREV_buildah = "e2feca77516568553dc1318019cea90ae000e0f3"
>  
> -PV = "${BUILDAH_VERSION}"
> +PV = "1.26.8"
>  
>  inherit go
>  inherit goarch
> @@ -23,7 +22,7 @@ GO_WORKDIR = "${GO_INSTALL}"
>  GOBUILDFLAGS += "-mod vendor"
>  
>  SRC_URI = " \
> -    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
> +    git://github.com/containers/buildah;branch=release-1.26;name=buildah;protocol=https \
>      "
>  
>  DEPENDS = "libdevmapper btrfs-tools gpgme"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9107): https://lists.yoctoproject.org/g/meta-virtualization/message/9107
> Mute This Topic: https://lists.yoctoproject.org/mt/110749645/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


