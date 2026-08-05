Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A50C561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:51:01 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6677.1785966659763916082
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 14:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YeHZjZr5;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5283e3eff60so9719481cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 14:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785966659; x=1786571459; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=YeHZjZr59hJLgpJsTjF8RLge6CI29N6pHJxP6WtsaAwqUDyGIyglzLG6PtDxBtYDWA
         0MLhZJuc/fnV5jOgcdgmRncQDmD50ynXFvZYUINS/kpqhzxVa9FosLUG8OeK4vAmV30m
         A3sJJOFoo6O0op8cEp3hcnxIenBBt5D4f35CBnLkj5J4okIB5fIFR6AEnVCvtwij0ucC
         jPcp8BDZ7uXo3vt8yTvpOS34nFAfymQlB8G1vXOED1kbwmJ2zMjU81yzIkvXLUMozuf6
         ndU2Z/zU98zg7q71BL7UpfjUV3D6p3+Tu4/z/iAx5jNIcugJptcoxcMFs/DhdiZ4h8YV
         ERmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785966659; x=1786571459;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=YQq+yEkg7ljZD4lWbZPdLYBWdOPbYJu1smxMY7sC/J41qJ8CoSl7LfxVuk95C5x9G3
         NxB9dPrR+VxpAr+05J8WpFNFGFnlkTJPgczLjsthdN4JjKHIS+3RHLkADTRugi17PNfc
         rTMT3/VNsubqyg+od4esMNeALNQJcUL01px+dv1+57Lu7UdHxdQibWjYJvVl1iEJAWKG
         7lw4+jzBpIIk0wdpEW0nXuSWXQRcwy9Zmjobtc984IIWCDZeQFHjzEalk5dlkaGJr2sG
         N3sEtKUcUHb1XaPZmq0UwjTLtzhCd18jZ3rqd9ja5nDFPWwqj0gNGNdAgOZwqiJILBEp
         Z3tQ==
X-Gm-Message-State: AOJu0Yw+uuzmw8HBGRI2dE29zmsD7NREeQ0lUq6M1Y0zbTQ51gSLLuJ4
	DVZwhUx47CRY/z1ko+pGRJmvx/24vlyuVzFb0I4LXI7Qx5BlgU8CxPeXFyiMuiF2
X-Gm-Gg: AR+sD10hTT8R/3K5RvUWPt8//UiDo8Vnmcbk1FThP3sXdfk9GlT4s7VOWDvK/0yHKN6
	rQfO/NbDdmL6TpLdz0YJpujpYoqOcmopCfeHJBBP5PqeTGYTIBXEfATJiRDc/OxJtpHByJQN6I8
	gwJ89EkiryXz+HQZlOfUvlLyPyjGCaUxUt3LASpz6xE+o3anTD2GS0KHbyOdf/mDvbRy0pAy/AS
	TfuT+r2mBR52SzbhfrfxMm8Z0Qo05qzJwwVcUzbfr11xgxfusN0jB0k3B7iJagCthi487+A1Imf
	Laqxi6BPWJt3v0WnMMrRiXSHc8wQvniobzuprUb4SPW5eXQD9iTz+JcaVtTtqHBQYYDpBy7z6E5
	mViFRGL730Cd8B3BgpCni9vNTuwxFE8m0VXhfnqRGd2JlwZ5pRIj+q8Ju+yHa0UWDz01CamB0Hm
	P8fc8E2U11Ohtx6w5G62e19vWgnTSbLfuCb4MwIaZ0wZ91IAQCdr6BJhBC1ZAMSl+zq2uzNCB1d
	qTpQSxX544o+3qQdLLticdVPRrF730rC/uAhMWl69g8zCnH0kJt6fVM58lQogzCPC24KEOLMvz0
	8ZQFpytX1KK+2CxTJYRucZNJN6wJWiWYjXZycZQG8qszLRaDzmj+Fc5G3PaBwhjwdlQIhvdyIA=
	=
X-Received: by 2002:a05:622a:509:b0:517:78c7:d93a with SMTP id d75a77b69052e-52ce602ce1fmr98442121cf.16.1785966658652;
        Wed, 05 Aug 2026 14:50:58 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm34738486d6.10.2026.08.05.14.50.57
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:50:57 -0700 (PDT)
Message-ID: <6a73b041.a40fb949.15942e.d665@mx.google.com>
Date: Wed, 05 Aug 2026 14:50:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] docker-compose: add
 CVE_PRODUCT and CVE_STATUS for CVE-2025-62725
In-Reply-To: <20260805050459.1743048-1-devanshp@cisco.com>
References: <20260805050459.1743048-1-devanshp@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 21:51:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10023

merged

Bruce

