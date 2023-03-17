Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D7EC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 19:33:10 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.29069.1679081586192450623
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 12:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T6UQ+eWg;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id c19so6811164qtn.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679081585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wNMXfCVHsx05hf4I0KOSiPry/OEiFnvM52qwaXPMts=;
        b=T6UQ+eWgZn0nq6k5qs1u+2Q4JIIVMFI0su+Ln1XOaYwvJ2J2svTlZFyw2DkAdFQWcp
         /KRovCcDuAaKgu3gxoCUVCm0zyyd+tws1etY7jCMMGMQStWXgZdDczIGpsMLPHUDw1JE
         P/QZCZNt1QrnwQek1w1o7wbOoJ4F2jcNi07LdfB2o40CgwXQSlfzlvs3syjPLk+gVp0v
         PgRsIMK9T0NGIWTBqUmq0Ie5xTY0rPNUyrGzzxnX+DT4QWHTWw00QjrdgHlO/UXVs4O0
         5Rlf5QVJO6QxvRYFBKw86q3El1VyzZEXB9KTOczKGmZGBmN2tSHTYW3z+T5Xrn3bA3jd
         LKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679081585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wNMXfCVHsx05hf4I0KOSiPry/OEiFnvM52qwaXPMts=;
        b=v2tIIuihP1/ONUDSthbEVszvmxWoPAPzDpIh7VXGqNZqAJTQwVOVOxR6J0OUfR2zwt
         YjLmqkZh2QHMFXcMkdGwNlt7t9ja4BcBcIgfYHwe28d6mApVgSwhUcQcQ2xMzwaqjquv
         MdEQb24KUnU6UYdgZquiwzgwpWOgKO4ZwvJidLU0PasLFeITBQ14Q06RzM8ha2CLe6Sx
         YxMlj0R+b76ipmOkRttx1Oj0JGUD/yh9heT1jhrALlJgOqOtySYaHLwKpAfvOuksDtqn
         T6sOUk+WwXdbaw5ok4n5DMpJx2DUA9WCSvWRh13pIYCBRVHhzi8DaqvKPBlt85EEtc2B
         6V7A==
X-Gm-Message-State: AO0yUKXyDI+0yQDj1NiaGuLgfcjv7H7mY7M0TzLhDI07qNYanGGtZ+Ew
	yINEowGrBf+dyvvN42bSOmghln7lcubyCA==
X-Google-Smtp-Source: AK7set9LB+2NW0Yu+UGmdhDkKGj3YDUGC7G6vKEIppVCWaz+q8psKvDBuRRfESZYtZu8QFx22/czZQ==
X-Received: by 2002:ac8:59c6:0:b0:3d4:8ce9:cefb with SMTP id f6-20020ac859c6000000b003d48ce9cefbmr7425176qtf.4.1679081585094;
        Fri, 17 Mar 2023 12:33:05 -0700 (PDT)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a431000b0074571b64f0fsm2296031qko.53.2023.03.17.12.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:33:04 -0700 (PDT)
Date: Fri, 17 Mar 2023 15:33:03 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 0/2] fix the template of
 lxc download failure on kirkstone
Message-ID: <ZBTAb7w8Z5gKFeGo@gmail.com>
References: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 19:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7946

In message: [meta-virtualization][kirkstone][PATCH 0/2] fix the template of lxc download failure on kirkstone
on 17/03/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Hi Bruce,
> 
> This series of patch to fix the template of lxc-download on kirkstone.
> 
> When we using a download container command[1], the lxc-create would report missing 
> "fi" error, this has been already fixed on master, so backport those changes in 
> templates-use-curl-instead-of-wget.patch to kirkstone.
> 
> 05f316f70a4d : lxc: update to 5.x and meson
> 211918936180 : treewide: bulk update patches with status field
> 
> After backport those changes, the lxc-create with download template still has 
> failure, after checking the image website url, it was redirected to a mirror
> site, so curl need to add a -L option to support url redirect, the version of 
> curl in kirkstone also need to add an option -f to use return an error code to 
> tell the caller when http/https has errors.

Thanks for the explanation, you answered my questions about
"is this an issue in master" and "why aren't these just cherr picks".

These are merged to kirkstone.

Bruce

> 
> 
> [1] lxc-create -t download -n test -- --dist archlinux --release current --arch arm64
> 
> 
> Xiangyu Chen (2):
>   lxc: backport changes from master for
>     templates-use-curl-instead-of-wget.patch
>   lxc: add -L and -f for curl in
>     templates-use-curl-instead-of-wget.patch
> 
>  .../templates-use-curl-instead-of-wget.patch  | 40 ++++++++++---------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7943): https://lists.yoctoproject.org/g/meta-virtualization/message/7943
> Mute This Topic: https://lists.yoctoproject.org/mt/97669932/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


