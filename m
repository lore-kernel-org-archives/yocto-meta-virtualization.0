Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B00C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 18:34:05 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.35739.1641839645034465236
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 10:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SCBjJSS8;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y17so15320838qtx.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KCh798N2H+iG7iCuJSCCnZ8u6jPi5dSxtBnrpR2l/OY=;
        b=SCBjJSS89K7aSJ+aFTjvH6Sw07cWtOowLu2uj4ud2o/pdMgWpHUdq6A1nPOwhRnfy7
         9O+ogiXNp1DC4HgyP8iJjzUvcjQ0ghmkkIdGxDInG/t1RaIDUyPATntRNgbLQ0Oi0Oi5
         /aOn+MGWdqINcYFk2bKmfJrKDnYcNzInX+zhYBDXxTEpBwWWLtfFR2njWWHZ4s474NV/
         b9A0VsobwAJc3OUnA91P1fHZDVaPEU2mH8Lalm253NbGiQROA04RJ0GwLmOcnlxTXgVA
         HnrO97TTT3cKo3OFgP4pmJfIZMyYHDl1Isa/mS8RlLHaxYZnf4I4zTTTMgnDoW6coFZu
         Zeiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KCh798N2H+iG7iCuJSCCnZ8u6jPi5dSxtBnrpR2l/OY=;
        b=Z2AHw/b0zVGsNMHD82rzyarL8O2inp2/AvWUTE5b+i2ZMi1YtbX0M489maQh+HvkEb
         cUzE+k71XwKpmBwzM4/7lr+/JlGF3LQubmue4k6CztFx8EwJKKn/Wh9+NJJqEtVJqVT0
         3rX/vO2MNSHdHIGaA5rhMc5b9cNFAOIMYXosbevR+zccdN98ZOaF4Y+YOztQWPIWw1Vt
         VAN2UM84pJ8TZgX6W7e3R/+cSEjmQj94aJ17SVLIS8hUs8ZeJvLBnYm10e070I/LWd5x
         OmIwpnhTbtR2MvmTnFXKaXzi4bZSj/GAHhRzMI0fYn1wu/P7XB9E4rP6dJb13SpSImjd
         3how==
X-Gm-Message-State: AOAM531Cxr2K0ZIM1TDb8AlattSMqsXfqpyI2kprniUCkEH9Qci+v8jX
	YD5K8IJHLt0qwtoUlCIUuyH3MDEl0qiWMA==
X-Google-Smtp-Source: 
 ABdhPJxJgVrXHSpmUXcNwqUEjgn2lRsN9cLqo2kPiHelkpNPJGDmMFyUa9SWbD3b8MKNAZiPWy3F4g==
X-Received: by 2002:ac8:5f8e:: with SMTP id j14mr886127qta.39.1641839643818;
        Mon, 10 Jan 2022 10:34:03 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z15sm2052957qtj.77.2022.01.10.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 10:34:03 -0800 (PST)
Date: Mon, 10 Jan 2022 13:34:01 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] busybox-initrd: oe-core
 has upgraded to 1.33.2
Message-ID: <20220110183358.GA58832@gmail.com>
References: <20220110123756.60947-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110123756.60947-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jan 2022 18:34:05 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6995

merged!

Bruce

In message: [meta-virtualization][hardknott][PATCH] busybox-initrd: oe-core has upgraded to 1.33.2
on 10/01/2022 Ross Burton wrote:

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../{busybox-initrd_1.33.1.bb => busybox-initrd_1.33.2.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.33.1.bb => busybox-initrd_1.33.2.bb} (100%)
> 
> diff --git a/recipes-core/busybox/busybox-initrd_1.33.1.bb b/recipes-core/busybox/busybox-initrd_1.33.2.bb
> similarity index 100%
> rename from recipes-core/busybox/busybox-initrd_1.33.1.bb
> rename to recipes-core/busybox/busybox-initrd_1.33.2.bb
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6993): https://lists.yoctoproject.org/g/meta-virtualization/message/6993
> Mute This Topic: https://lists.yoctoproject.org/mt/88321919/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


