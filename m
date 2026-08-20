Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCBDC5DF88
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:13:10 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3902.1787260382055019726
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VBW4Xf9C;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52b3934af3fso3035561cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260381; x=1787865181; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=VBW4Xf9CepDRS2VcVDyfyt0qdKfsniwwoQniWaHbHD7owVL8IfmGHO0iWAQM3s9xcs
         wBUmE10+rr0boA6VtIN5m13cDs8CV33Nh3KmFcVtfGulckIN5Rl2Uiy7LBckPUEHgI4l
         aZh0GqjSDkauGWfrnbIA4+KUq5xKwrwWpVlf7Z/J7BpNaYvN05NnQgLDWXl+jnbdMhu7
         ff2PfQZfEYSnDr2QYS+ftgHLgvXQ0W3jR2SKMET8pM5OACIRAX22h6TerxRbyd4k4FhX
         4DBSjJlP9g52C2KehbhpDJNLlm0S1/2/cMxPSqYpMNtM0jS8rAcTmR9OdyDnQSFecrao
         Au5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260381; x=1787865181;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=TW61jry7kVVAuJdnMjkK5MTf5OkMtYT1EJiMROaMTlRTM8zhOte28EUhuZdL3ZdRoq
         YWT1EOItl52xG2+F4k3R6nL33LiRy3JORjM/w6siht2za3PpDz74Fn7diD7vMRFC2D21
         vBaajOd3OpEFSSznIRCpqt5qDTv5EwJikCyat0n5KX02Y4HhylAJs5GZ47wjDQWACSQP
         YOqcytQpNLAQ99IllrVsxIJlaH4BHEC03ot6WcwyECBorb06hXcRSbMFPCVhWJd7vPnH
         7k/nHzlT30v4fbcjJthE3Uhgy0kWCQxo+yiuYVcEvdKqoZeme4cwbA8ZK4aWRS2LGfd0
         vsrw==
X-Gm-Message-State: AOJu0Ywbl9I0tG1HnjJrbUW3AKnrLEp/QpDjKqmqP/fPTAxByfHPbVS2
	QiuS9vK1ELvF9kWXJ3WphVEcv31zQwGQVO+C/8fQxsYlHv9/e9UwjvhaIv4nLe1u
X-Gm-Gg: AR+sD13GrLR8Xagy0HJmj1AZqhHAuUElwowc4zxtVfujjzaAF2A83h5VqAVUvFI/Ygu
	lp8y+6gQTmva6SB09725ovyZu/f74FwhP4CzVw5SG0l/zOeFtnqB8cAeJUxDzFZf2rMp0my63NZ
	ThIg42GlX8XbBfSh3dExnRHLjVU3EA036/h2wo1ppbUFNJYzFrtTSQwNW0m1QIh3xe3LitFjVa3
	O/iFGHPIFip6Pzeb5OIiV+p1yW+SZm/n3jm+zxK4Bw0L0+ZrI31WbqSalUJyS03IimFYY8u7AMo
	KZcZpzXvJYUVSqgz+m8qD2x4R+SF7wmYr8NurjTcPx+OBCX8k+xzb5QDYINSTp8QpXTR17I1rSe
	Y1yVwRyLpqjdj/+zqLUehSVHwmNsFP8WfYlBULOMpR4pxA6XCgzK+bqeU5g4i6jvdhuxapyomD8
	q1Au0rwaDs9oUNydLzNfFuwDpRWyHkZlZdgoWvt7ySr44Cps2rSf4Bcl4dIYpq46b7u+XY8KFpc
	egqXqB8SFJkaYuMd3bT32xIRlCsL7ktMRRXQNA07lTLp7QTbosj0DnA/9MMYcSwtjmrd1VboH0Y
	MZQq7JpvxDnZm6wZS4ZvHmamWMpbAgNwTOahSwIgzAkl5m+v8LXKPwxeUZcf
X-Received: by 2002:ac8:5855:0:b0:52d:8748:c616 with SMTP id d75a77b69052e-52df59e7c29mr13117791cf.37.1787260380755;
        Thu, 20 Aug 2026 14:13:00 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a35basm46709416d6.35.2026.08.20.14.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:12:59 -0700 (PDT)
Message-ID: <6a876ddb.3668febf.36d2eb.03ab@mx.google.com>
Date: Thu, 20 Aug 2026 14:12:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH 5/5]
 python3-testscenarios: update to 0.6.2
In-Reply-To: <20260819094512.1153-5-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
 <20260819094512.1153-5-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:13:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10054

merged

Bruce

