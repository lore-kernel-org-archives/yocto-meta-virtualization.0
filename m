Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5477BC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:27 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1371.1785258565811817664
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ceexA+we;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso9762e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258565; x=1785863365; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=ceexA+wePRW2wh2sNZsh0wDEJ8lCAVY+Kyhx3qE+/3NBGGgu8H/7tde7OCnopQOa4n
         RV10EW7yKHRrF0I3FtYUKEqL0p6BZFtijAObcspF8THZQCbuV7RhcLZOSiODqn4vzmFN
         +CMsU4VGJkOLk0ml4kp48UBmJz/Mh3zc9GwOgU6l1AfOKf5OnSlzLHJ72IeHtXHoVnIs
         J8QY53B2x5pIpFnsQVJmY8dO1eXPgWyILvQXnmspsy8bfSY1ntNwX8na8QaBPJLiSEq/
         pTooAxJwBGb//5T0e86q31wgSkbzUY+8yZQfQLbnjNtjtxqs4brHtmE/fhR6yfzwwlRb
         nk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258565; x=1785863365;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=SofwrR6+dniOV8y7bka+8PSPexXmUkJ1/5o3ZoEulyILIgyaC8hSmJX07twYs8wWMt
         tq8ASmwrPQjzbPAq3kapd6l+fkCrmOqrk5+Z2fr1Ug1HggaeR0ix8172+n98TNGtVeqS
         n53H0Uj/gfAtUludMpPm/w1Wc+iOqC64vcmXSELcMmf8fwECMlgbI4Kfj3lX50I8SyUC
         jp6E/CHuQRyy9p6DJDYKX+5TPfniki+ePDGdepBYeHaeg56IUeuAa1p0F6ZnFzlM890n
         483S2VkewyxgcefJMKGCeEm0alw0JiaRd/HmRvnXu2RnFWM5ox30ctRz5YwYsulT8372
         ka6A==
X-Gm-Message-State: AOJu0Ywo4gW3N7TZouRwvjDdjxTLpywKVGs6lsQ9vCSZJWUeRSnDleKX
	rq6vso+ILO+7g4eyioVKEVJzG7KM72f3Zsy5ysZ8FxcplGxonBmiX3QiGXa+xH1g
X-Gm-Gg: AR+sD11qa39I1sW7k51BKEzrqikerrjrmUvgfwOy4jb6i9DfmkhngoHOXMlnvxbE9Gz
	dHI9NQtiKPepJtkWfPF4J7dlz4j6vUsRHfgCfLEBGqtiajQl2pjgiUyq6OkziLX8oRQZxFKlTeJ
	4gnXPqt9ljFj/TuvWopONWoIX+wl4xyglcTZhe1i1uJ2KtzZapbxbzgK6AoXH++keTXna2+Y0/5
	I989IDJXRwI6kWaLP5ofE6ueFdacHXCtK8n6AtTr9MDQSr4UVCtW8o1cmzH3FtfXLB6nu1H+623
	CK/tDlMWN+VJ742XFBsicNtToPtlwypDiWnUkho+izGDf8myBSiHaFLGWiSbhRAkPtO+FpVcx5O
	GRuSDP34zmAwsAOvnjIhfGWYWkbVfeOoNpTG1kQQn4Sth2hitcOCAe8Pa8SnpiuGQv8MsgIf488
	abo1IXoQ0h3l0gJsngKP4ijvFaVuSY78aagsB87OrDMVbolVEpjx3m8SdvlHvSZotXLVLmU1UiA
	hjm80VHE0cxTqJsD5MeDKANHt26Z4N+PP2iPgCWUvh5XVdjcfE5NRDyXFVAHqjY2wZ1Ongo8X5Z
	Ntg=
X-Received: by 2002:a05:6122:8b09:b0:5c3:367c:c001 with SMTP id 71dfb90a1353d-5c33fb04265mr1643047e0c.12.1785258564590;
        Tue, 28 Jul 2026 10:09:24 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34d50e6f6sm273945e0c.5.2026.07.28.10.09.23
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:23 -0700 (PDT)
Message-ID: <6a68e243.ec7609bc.21f514.dcf3@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:23 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] podman: fix CVE-2026-57231
In-Reply-To: <20260723134124.2502950-1-deeratho@cisco.com>
References: <20260723134124.2502950-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9997

merged

Bruce

