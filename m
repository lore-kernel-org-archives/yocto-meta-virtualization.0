Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D2CC5DF88
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:12:59 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3853.1787260374414567057
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P16kW488;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-902e4af2d9dso10201806d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260373; x=1787865173; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=P16kW4888YHKSrtqJb47u825XVyoBVVtMjq4nFgejaFQ9AcvnRnep/bGJkBCHduUsz
         RKgK22jZ8XzWIip/niA6H9zOWqEtvMlryVP4fpWfbFrcGfcRSD/jiaJyJX3IAoc0yt5r
         uvDPKDKWHf1gfo8XmpLKpxqMwXkVXObkbBZjSWJAZofnvCv7jvdSJzCGQd9CrJunf8OY
         04r63EoEZYfx3ec58/qGi3K/4ioCQqvOr7xy1ch4wfMgNvl3D2yz2ixiUT8gKwjvJM5h
         /2CrGunwsTVU1tZieGndVEIJbqVrPic2FYSpn5xzshZJNsFR9eiU+1zQlhTZhpWvIS2H
         XpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260373; x=1787865173;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=OG9v5VQb1lFz2nkVSQncz+M8L7bCDP147UIpF9nHcb3WlBSDtfa2KAYcbk4ZzOiXr0
         RUMYeaQ1SJd6A9VvzAXVTbrvXUPIn37eyCRQ5DIlrFyt9KBloT/QXAVyy3N+djNlx6Fc
         mTkUh4hBpK2BL+feSw7BCHLPCvyWZ4eMCRXSuXIMnij3f5VlTH5c6P0cB4umYA+B94ud
         gYNFayhb06eWMwhIvIbHYBjenKaYovaaE/krFZryOjTTTi3qjJ3j8QhVrZAvxh9iYBZ2
         L4CN6D0EDhq0Cnqt8KfXLLDTR9jUDIMRGDyY/R1bI3jsE5Bft+VDPGmuxw3Ep/5/IHLj
         BJrQ==
X-Gm-Message-State: AOJu0YwmQlMP4u0veKu+cW5Lvf3ybe3K/gn8mIn/e6Jw+7+v3BlVZ3dz
	GmHb7QjJ6RewS0myWwn07wJzl35o0XIz/A/JDmA8pP1sGhhCwcjHdNNY
X-Gm-Gg: AR+sD12qro3Zjn57PZuzZ0prppMoey42OyLEXb59qPRi5onjkBnnlC+smIllLwvCtgt
	+474EcEmM14ftilz110XbixPx9coEtQvrl/LD0Nw8X+bvMDPuTeY5US0E6IlZ/qwd0rjkrZRJs+
	Qou5ySDz13HIAg1aEnzR6u0xJGVMkt+mK9dvjssx4VHMj4p1eMbDx8DICviACoD+eV+m1CQwn9+
	dUC6SvLsa0ZXx9wvBBHSYR3CmCNpEcUNkVLOrPlBIu0F4juTOEv13LTwjuViK7VOXIf37BYVjiX
	P3ax1odvymfpUP2M4By9fxOaIub/QJ6eChqWRawlzpUcnqF5rqYyMI4wAmK6yLAYPhmoeBs3NEq
	EE0mjhaZEze8kw8u4tvREsAARxk6ESPqfNSEFd39SIq4YtcxlIfpFhRjRr6AQFqQAp+Pl/EG+2K
	TE2nttxmUVJzsFmImPOTcVGUJB2aFQX7flLXTczmTht3JoxILKtCZrgEQyEMYm5i7T5XkcPvTx5
	dgxH9Ovm5HZK/zcfOUC4gZenaKTOynkPO2OT/tmQD8IhxDtH/TpKMt+bFmv0J/yqMBs5EdoVRQd
	iGEya3/TNwiPLgcmiIhJnDjdtwne4mePQ0dLA1GNv9vearL39Fe0Y2EB4tQl
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr98868285a.22.1787260373051;
        Thu, 20 Aug 2026 14:12:53 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204aa8a6sm454727985a.11.2026.08.20.14.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:12:52 -0700 (PDT)
Message-ID: <6a876dd4.d6f58ba8.295622.21e0@mx.google.com>
Date: Thu, 20 Aug 2026 14:12:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH 1/5]
 python3-*: Use SPDX-2 BSD-3-Clause instead of bare BSD
In-Reply-To: <20260819094512.1153-1-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10050

merged

Bruce

