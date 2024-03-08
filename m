Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EBCC54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:38:25 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.2427.1709926695091183118
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 11:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MoGeF0Fp;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4d34fbbd91eso756609e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709926694; x=1710531494; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HO3PNyT8/N+Ff2t9x8cnUrTt2guF3Yu/1adQlTFOTuI=;
        b=MoGeF0FpcWIDPfYWgBvaVJFYVcBJgyoJK6Z3VnFZwhw2Gzc2nJUnUk5JggB+JlE2m3
         UWBw6awQxxNIoVPGl0zbi02nHs4bbCVvxeN9bdwon3WzrrlY/6WjOxXeZfzdtXdln5kI
         6h8VwwXJRJRWoj4EqLr5JoimWHjl3Dc6CcRFh5eb8H8Ages2MIyewoJt+rdd9NrXUHhC
         NTiMc7aN2PBNs/KlFinzXG7XqqvEl3YzkWV950M1vSsS9xZh2c/TgGbfcFyHFWI6iemk
         E2309h4aqJqLwBVeXhj0Jw7FSH8IHaSBeNUdJExmciyq/9Ha4nE07BhxHpL/JoXmDg3O
         2Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709926694; x=1710531494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO3PNyT8/N+Ff2t9x8cnUrTt2guF3Yu/1adQlTFOTuI=;
        b=jrOYf5PEVn61GNu/HIrPDehj68qhEsfImscvywKVftl2S3zRwJN67WstNcFZQ4ffeM
         UY9SKO9YgmrSV+FAYTox3VvroSF4ipWe3czb/bAQ0DzUxUOCby2eV7AuLqe0xAdoiXLN
         gUKitAO3+4mpS4RS34Jv0LYafYOvlclObdOeLTi6jdsgPmFCnVS00L7sQopvaFsDCVLS
         mLU0sPNF+8RUnMFsPt1xKcvRm7on9dx0WfRZKhV3AqP69YZkZgbOwtrct6As2z6b9HPa
         OP8mqijhd2YEjccgNXpv0gX6yVs2EQeLutRKrwR2t+u8nbW2JJN8CBDGSvUo5i6Mm/0u
         p9zA==
X-Gm-Message-State: AOJu0YwoYjaxuKRkYClA+/kh51b1W67ILbGiWPMwWZ/i9Zr/FfDiQLC8
	uuds04BT2vTswpeFOK7hD4NqtBji399TdeJMZifwAdBTAew8V/vbEsEGreh7dbw=
X-Google-Smtp-Source: AGHT+IHxmFPEkxhPdHV++dNC4RljTKttlWiGcDvvnZuqxfUlgCTB+yxlyPuNFfdVaK9frPKWrP8Quw==
X-Received: by 2002:a05:6122:1796:b0:4c9:75c3:e79b with SMTP id o22-20020a056122179600b004c975c3e79bmr290159vkf.6.1709926693908;
        Fri, 08 Mar 2024 11:38:13 -0800 (PST)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id i12-20020ad4410c000000b0068ff1c7b4easm47073qvp.62.2024.03.08.11.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 11:38:13 -0800 (PST)
Date: Fri, 8 Mar 2024 19:38:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][0/1] add support of virt-manager
Message-ID: <ZetpI7ehWjMHMFyj@gmail.com>
References: <20240301130704.28605-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301130704.28605-1-paul.leguendekerneizon@savoirfairelinux.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 19:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8617

I've staged this on master-next, it built fine for me as well. It
would also be nice to get a README that outlines how it can be
tested.

Bruce

In message: [meta-virtualization][0/1] add support of virt-manager
on 01/03/2024 Paul Le Guen de Kerneizon wrote:

> Hello community,
> This patch adds the support of virt-manager. The recipe has direct dependency on
> some packages available currently on Yocto Nanbield which are `usbids` and
> `libosinfo` from meta-openembedded.
> virt-manager patch is currently under review on virt-manager repository. See the
> PR at: https://github.com/virt-manager/virt-manager/pull/631
> 
> Waiting for your review, feel free to ask any questions or remarks.
> Regards,
> Paul Le Guen de Kerneizon, Savoir-faire Linux
> 
> Paul Le Guen de Kerneizon (1):
>   virt-manager: add package
> 
>  ....py-move-global-args-to-install-args.patch | 76 +++++++++++++++++++
>  .../virt-manager/virt-manager_4.1.0.bb        | 54 +++++++++++++
>  2 files changed, 130 insertions(+)
>  create mode 100644 recipes-extended/virt-manager/virt-manager/0001-setup.py-move-global-args-to-install-args.patch
>  create mode 100644 recipes-extended/virt-manager/virt-manager_4.1.0.bb
> 
> --
> 2.34.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8600): https://lists.yoctoproject.org/g/meta-virtualization/message/8600
> Mute This Topic: https://lists.yoctoproject.org/mt/104662990/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


