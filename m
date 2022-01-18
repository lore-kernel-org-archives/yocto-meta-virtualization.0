Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3F1C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 11:18:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.11315.1642504734334521346
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 03:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=ibYSJ79T;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id v123so26875871wme.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 03:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IInCVSB+AnT6M0LVsZ7VqdWvGUSG5tgskT/tLY1UhgU=;
        b=ibYSJ79T8Ehom82weNunFAPvm8ftONkQuNlYlUv4J6yDUnvziakG9X98kunIge19PH
         GqduD/WD7BiExI3Pt9MSrju2qm7oqd8tsI787qkTb8dPNAz7EP8ATcuGtF4B3lgKLIfg
         k7Da++o7sYnam67FfTmOru4n8tTjhAacIoM0JiBJAJIlkPol4/pBMjNZ9TKBBVacdx1E
         7vSBXXQNJ4R/N9Q269ek0cQjkJaBlzi10YzU91rzGu5mjUqrjefohvnnEsRw/W3GfnoU
         1xTSQnm6z9UzcTfCFI3/Kx119T5HIx88jEFvx787y/JObFkar3TzyQ3bTEYNbe2dFPK1
         IzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IInCVSB+AnT6M0LVsZ7VqdWvGUSG5tgskT/tLY1UhgU=;
        b=Y/lpZ8BiAlw3VWmlarnnh8f0i0wyFRfWuEJkjC1Do1dG3Rn49pMpQ3tbnLCgYR7mP5
         C4xoWu5e3U4SR0RE8t1rFto995yc7czS9RzVcJmE6d+a5VzK6n+iTh3neJ4N2y2msdV1
         lGnJjLSHY7O3moeWymh/g8wO6K8ydVotXroZpEfNsxZnca+l/lKEXNZoyymedbI3Trz2
         uwgw8O249Bb8jDOvgtpsjP2jr4eNnGc5X1WiDwAqO1G9S9mOZpbYZDqF73gjR15AXdKL
         48TLMyZIQ8vnMVBH0hA54gDN+RdyZuNlQ6Ldh7NbYE39zIsyTSwH7mHApR+Kj/8lcDLp
         ZyJA==
X-Gm-Message-State: AOAM530RBMt+IQpkiY2BLSOwsuHEWsiRMIFfSmItncytCMyM3iyRCcpc
	5rqGpz6cFE2QCvsMwe7fB55vihfEakQsU9DLRb+wjg==
X-Google-Smtp-Source: 
 ABdhPJwnG9okdl6llmuMmIysMfU18n1/OPALSjhpcS2DtqRwbr+V5ve6EoMQqAtvHED4ZkHQEHYaSvRj9P6UUK6Dmvs=
X-Received: by 2002:a05:600c:3d85:: with SMTP id
 bi5mr18920103wmb.62.1642504732370;
 Tue, 18 Jan 2022 03:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 18 Jan 2022 11:18:41 +0000
Message-ID: 
 <CAAnfSTtTQNQmY5DZSeZ=KRQ=F5-BGkdK=OswPHfyG7OAxJnuMQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Jan 2022 11:18:55 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7012

On Mon, 17 Jan 2022 at 18:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> Your change + my update are now queued:
>
> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b
>
> If you have any cycles for test build, that would be great .. since
> somehow my own build didn't notice the empty package, so I can't say I
> fully trust it.

SETUPTOOLS_SETUP_PATH defaults to S, so you can remove the assignment entirely.

Ross

