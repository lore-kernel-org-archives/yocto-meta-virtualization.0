Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BED1C624D5
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:34:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8258.1788269645720864651
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BBMOUQwn;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so778798a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269644; x=1788874444; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=BBMOUQwnRLeP/oYP+bsk2EIiZP0lNNI8juxSzjKwLFG6CHfiE8BokyOyont1UzGs+/
         6qSq20XCuwCdAZWGrRQrSoMbBuSZhtE6PGbtP93mHexgYXKK9wYA6JhKTLNetPAO7yGs
         TcdKhgXSazsRCVTlmMcFm8nFfsr2C9Si8flGavGVqNGSXr3bYzW4e7n34XknBSKKnKSv
         DuCSGr8isgTIMjZMid9GM6zOPYJPfLy3VXiKhU5Z85v42G5mH4+6lwqV1bx/LPpjg5NP
         fTRGHPBJaJI8DMw/JER94MDLjJVR4jf5ISsUanFAXx7pJBaYekIHfjykyxInCtDie7Xl
         NCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269644; x=1788874444;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Pw07Q60pP5x5vat87JeW7NpW8Axq+p1aLVQylL+GGLElln9JR9KEMQBUTo266XVPhW
         4HdsDw2xYVpp4+LliaWv/O1W/V3QELXSAlJbMK7jIX039s7PJdortr1pb9Jnz7wFDyse
         h5PDMqBV9OgiG5AHwQPKoePlOmto3uq9BlUJRxTd9w/Q75Rp5hfqqWFoy69uIB9z+aiT
         h+1dnhWtSDPLiaJ3K0vt/xuHXjlNO45fFo/MyJBU586y00MF2uUo20XEkGz3enJHxdGx
         hdkkVsminXqowny+6pbZRCPHVgNesK0e3pcveXHweC9yLMN6dRqelxK/LxdzAJ8K0OA5
         y6gA==
X-Gm-Message-State: AFuF++l6LExxi0vxghY7RBaT3/ou/1Lv1OKPfSwr6kQ5fH+6CAmLnADZ
	sm2fylMmTu2W6ps5zbOsmiotGEa7HX1hcio13g1Ky3ED3QOsML1xq5xg
X-Gm-Gg: AYBFou2dpc8g2L+zduRDHpF22AeRBO90QwusqP0KDUS7NQZeYmKNpHegeoYwKDCBFXe
	K/C28VD0r9DW52rtmRGXmqHoABn28gz9pxWZELuq5C4vPzkyyC0Yr9f3INKs0siOLn9f/WzRLV8
	GwOnRgriqN4TfBAbnLtNEkpXlK9KKc29V1WQAxi7Rh1FxsAVku6adwsfdYHiukZNnWkMXNSnX6z
	gpXrzU7aUsDa+fUItUU6HwPNdKSZS8dfZUjOIN4BRA8Vr8qkzjH7QdO7HVWrsKN5I0UHgFU/vz/
	Mp77cW6aWu3eM1tdyiaCV9pHNHHml3t6wdgUoVQFSMZdw4ZnSYVGBBB1hVAXPeW3gtmxD64F0Qp
	oJPfPiRtxI8s3NKeWhEc/qWUNemXdITwvTKyUvAIQ2W0tJLK8hjgvxEhtD2hrcbvqP37FExxPCu
	0jI2fwFUy3H0e7mvcFyCwtgfs2n4e8zgFbZOpjKwsC5ASJa5484XRnoTUgpNvt3zPijxRI1fVq1
	e+GNSa2pcO/4c59pk8ihCYDTdMifJ3fEChrMAQy+VjkJtXeaMTOa3d+9CCmaf76uGg8Rd0RZ4o3
	KDmtq0MhIl8gvbrgYNQ+KnQWixHvUenZD/MQWyP7B0PYq91icNP06sSXfr4v
X-Received: by 2002:a05:6402:238a:b0:6a1:c4f:3153 with SMTP id 4fb4d7f45d1cf-6a663a267dbmr5756896a12.2.1788269643629;
        Tue, 01 Sep 2026 06:34:03 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66d052d81sm907691a12.23.2026.09.01.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:34:02 -0700 (PDT)
Message-ID: <6a96d44a.a58ff27b.187b81.0e6c@mx.google.com>
Date: Tue, 01 Sep 2026 06:34:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: devanshp@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] runc: correct CVE_PRODUCT mapping
In-Reply-To: <20260821050837.51540-1-devanshp@cisco.com>
References: <20260821050837.51540-1-devanshp@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10068

merged

Bruce

