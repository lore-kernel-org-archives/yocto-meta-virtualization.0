Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AA6C64E90
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.11238.1650478201741405300
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pCnTlpym;
 spf=pass (domain: gmail.com, ip: 209.85.217.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id f32so2329658vsv.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WLSUVxwszuJcg+liX1/w+HtUUpUIamAoF4qfqKEon3U=;
        b=pCnTlpymKxj9TIsw6hTgvWW/UJi4JtWY/Fnmtr93S1v42bTFFd3jKgkpPYB+JnzM9T
         QDmrFJQiB/tDdxzG04Uv7K5Vdn7revDxgU6CDQhwpfXrJ8JHh7XmUiYGc+MSF/uPXxr3
         Dm2fjCkx+7BKD/YKyZXOzknXm0CjOoetUxxH0fGo6jDuXd0Uc8GdLSxksKubvu2WCGyA
         OWeMpGkuvmF9D8Hy+kTl0XR3oKctE1QHxKZD31NcJMoowaYvzCwp+0JGXqU0bV607oGV
         vgsCG1AKjMyQNT0i89QwhCw4fUKXxWscXoBgvDCCm4Pnc656JXF17hVS8VZElGxOpsTS
         JXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WLSUVxwszuJcg+liX1/w+HtUUpUIamAoF4qfqKEon3U=;
        b=VBsrGvNVdnNo+IF7lBt9ktGzs2Sx4I3iuPArxn9iTigHhdFsvtiEd4Fr0UX/EVm9D9
         kZfxhsrJgeQRNqD4SNRx10/MS4wRAsVfvbWGSx13NSS9igbgq1TVP7UG/CJ34xuLReGq
         sZX+zWY+DFwEtxFMKun56AGHUTBXAQ9fA/ARaQSHZP+q/LhL0VK+MiESecmE4iqxVhWw
         61MCQznLNWZDLZ58LYwcx1S4Unbca2tMyjCF+KbzdqiplQJ4XtNQwSU8DIP/hYZ/9yrj
         +CBX70pOzCQiitZpS9wzaMWcYx7DhgkeXV9BDwHgI7KXDwIMukHgN6ce1NnftmKmDLeB
         88uw==
X-Gm-Message-State: AOAM5305u4MEbFJrEIxNHeipozAiGWq1MThfFOPKXsi9EsKgEX19TAPr
	reiHv+iPGn19fj6FTfoohvo=
X-Google-Smtp-Source: 
 ABdhPJysw8nC0ko289ABFQrxV4rIv5NiDrhAc3tsN/dITg9gTTQJtNAbbDNeQA+5Z6VJnBNQm8njwQ==
X-Received: by 2002:a05:6102:21c4:b0:32a:3768:b30d with SMTP id
 r4-20020a05610221c400b0032a3768b30dmr6844428vsg.27.1650478200557;
        Wed, 20 Apr 2022 11:10:00 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l10-20020ab06cea000000b0035d2bdd79acsm557632uai.24.2022.04.20.11.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:10:00 -0700 (PDT)
Date: Wed, 20 Apr 2022 14:09:58 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Michal Orzel <michal.orzel@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, cardoe@gentoo.org,
	bertrand.marquis@arm.com, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH v2 0/3] xen: Update recipes for xen
 and xen-tools
Message-ID: <20220420180957.GB60199@gmail.com>
References: <20220419090713.134057-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419090713.134057-1-michal.orzel@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7203

In message: [meta-virtualization] [PATCH v2 0/3] xen: Update recipes for xen and xen-tools
on 19/04/2022 Michal Orzel wrote:

> Before the next Yocto release, Xen recipes need to be updated.
> This patch series:
> - updates 4.15 recipes (4.15.2)
> - introduces 4.16 recipes (4.16.1)
> - removes 4.14 recipes
> 
> v2 bumps SRCREV of 4.16 recipes to 4.16.1 as it was released a few days ago.
> v2 adds R-by from Christopher and Bertrand to all the patches.

Staged on master-next.

Bruce

> 
> Michal Orzel (3):
>   xen: Bump SRCREV of 4.15 recipes to 4.15.2
>   xen: Add recipes for stable Xen 4.16 release and update master
>   xen: Remove 4.14 recipes and related patches
> 
>  .../include/meta-virt-default-versions.inc    |   4 +-
>  ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
>  ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
>  ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
>  recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
>  recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
>  recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
>  recipes-extended/xen/xen-tools_git.bb         |   6 +-
>  recipes-extended/xen/xen_4.15.bb              |   4 +-
>  .../xen/{xen_4.14.bb => xen_4.16.bb}          |   6 +-
>  recipes-extended/xen/xen_git.bb               |   6 +-
>  11 files changed, 34 insertions(+), 363 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
>  delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
>  create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
>  rename recipes-extended/xen/{xen_4.14.bb => xen_4.16.bb} (79%)
> 
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7188): https://lists.yoctoproject.org/g/meta-virtualization/message/7188
> Mute This Topic: https://lists.yoctoproject.org/mt/90557810/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


