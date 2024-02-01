Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9B4C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:20:12 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.16365.1706797204936233647
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 06:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJlcKtKx;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68c4300518bso4565766d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797204; x=1707402004; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkaV0CoUMUUqIlGmIrLYiBsU6wxDyhZdbS/jaJHXtHg=;
        b=kJlcKtKxf2iFEA6wVeTDhZCJrdPB7+x6Ik66QSBu1B741+xrElPl5hh4pWN00BVep8
         tneBNbzP0KN9JqCH5oEdqUgk8wpNzfAcmLu7XN2nrdUtoEJioHu2mHzW48A75I8emWcH
         61JbLlAF/6Tu0ed49AYgsRTAB3qtyn3u85mZ62ygd/nscCbH1VjUgzTiJnkNwbsQJgkZ
         IwvpEEE54XTtW9j6EUxYJ9q8c1mC49Wm9itT9yldP/qZo16zL4PPuM+Q4G2uHgUhG0db
         gjW7g6BYrgc7uS+cy5Gb1/rvObdaX5wH/djLTNN2jnnHtrGoDFTowUjFiq3/4UBd0fMK
         GaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797204; x=1707402004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkaV0CoUMUUqIlGmIrLYiBsU6wxDyhZdbS/jaJHXtHg=;
        b=LwNFfHCtGLKOEhsUJ5up22xoq7rab4VGdOGtp2KPGdi8DTg66QYMcs/gYtI5xYkTJu
         nyYIEN/MyP3lE6dp002P9h1Y5JSEBBiyv4/2V+Sx++Czptf2ZRdi+j0zi5M3gqUTvwCS
         f20vYpQQVGHMMCW5er6m8Q5UpS9idK4s6quJtD6t+0ze0E2cVt4ANg9W3LbU0VQI2eT1
         fO06HBLTFeLnWi4TuVBinRb0WmR8DHk6T4XtiFLIrhfnlcWQWa99itqrJRsaaLJVZwko
         1isS96xnoYqkz/4R+F6rjbRUlT+V7F8cUyzMyvAUfGXQvW22Vdra5Y2sR6VdZQKH+5/Q
         YmJA==
X-Gm-Message-State: AOJu0Yzd8GWlqN7Y23UtNojiDVuzCCxe6JsB1RmZFSlpA9iehKRSL11W
	BDCZvpGXYDXY0+Wokb42CbgFD/n5ysvOHLxsx/OwUAWbhpqZc/vc
X-Google-Smtp-Source: AGHT+IHj2m+XGo5npbPv32/fRT7JCyfdfbFj1Rkclo/SviNPBDMyjqMyOI1B9NT0E5QT3AOtrS/Npg==
X-Received: by 2002:a05:6214:f6a:b0:68c:45d2:354a with SMTP id iy10-20020a0562140f6a00b0068c45d2354amr5845921qvb.18.1706797203977;
        Thu, 01 Feb 2024 06:20:03 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id qp7-20020a056214598700b0068c4201f4e6sm5217511qvb.144.2024.02.01.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:20:03 -0800 (PST)
Date: Thu, 1 Feb 2024 14:20:01 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 0/3] Upgrade bbappends for
 nanbield compatibility
Message-ID: <ZbuokdlBvnCoPjvZ@gmail.com>
References: <20240126173050.1137474-1-alex.stewart@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126173050.1137474-1-alex.stewart@ni.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 14:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8561

In message: [meta-virtualization][m-c-s][PATCH 0/3] Upgrade bbappends for nanbield compatibility
on 26/01/2024 Alex Stewart wrote:

> This patchset upgrades the bbappends of some recipes whose base versions
> have advanced in the main layers' nanbield releases.

Thanks for the updates. Most appreciated. I've just started updating
more parts of m-c-s and this helps me along with that effort.

Bruce

> 
> Alex Stewart (3):
>   qemu: upgrade bbappend to 8.%
>   libvirt: upgrade bbappend to 9.%
>   iproute2: upgrade bbappend to 6.%
> 
>  .../qemu/{qemu_7.%.bbappend => qemu_8.%.bbappend}                 | 0
>  .../libvirt/{libvirt_8.%.bbappend => libvirt_9.%.bbappend}        | 0
>  .../iproute2/{iproute2_5.%.bbappend => iproute2_6.%.bbappend}     | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/qemu/{qemu_7.%.bbappend => qemu_8.%.bbappend} (100%)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_8.%.bbappend => libvirt_9.%.bbappend} (100%)
>  rename meta-openstack/recipes-support/iproute2/{iproute2_5.%.bbappend => iproute2_6.%.bbappend} (100%)
> 
> -- 
> 2.40.1
> 

