Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D902BC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:13:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3904.1787260383672184734
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M/rzm7VU;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so1833276d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260383; x=1787865183; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=M/rzm7VUD5u30wPECJo/pSeFFH3nlBCYOrtaHit4FDPuyr7k89+YsEGNQshI80ekye
         V7UEnEMooz4EuxbNXTOh+A1gu90A28x8GCHpE9gUQOgO9Rq6+s0ODqq6UX8VzNnwKmkk
         kB9Jfawk8doeWysl8UU7yYhX18TMV5tQh6o1XdMn/vjFoG/mXcAX1dWTuvdBtzZnwzGJ
         m7HshkrzWQtj29LO2HDYGxom+3Cq0mNmejoEBbrcnyF4eTucBI/sTB3SK3mMJWN7sFcK
         1tWnQX7ZlAYDv2A3jEQHsCM7oRLFYQo2B1wohv0NIATvFMx7NKvW6pJ47Z286vhl/+sH
         0vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260383; x=1787865183;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=QByKpz7qnwfF/PBBPebyi4ER4k2jW1rJ5p1nLS9v7gDq5Ou9sFJtmauIkeCtAqmuWV
         OJYRAzsLS1ht+IeStQnKEamAkOJ0PQRytBhI8WGcJujAfu0hggU1ifGYbLGpQyeDkpTm
         gRX8L1YPg6Q+hkOcw+GjuETobJBjypfKx3pCX67FPo2mI+Pj0tSrKkTvTiJizaBNBNQz
         oyKjFLbgiWjI2ubPzLs7fryCmTCYQ3jGDH6mNCu75q/C7WVTbpiMI47pmxvmLzHGIuNL
         FTpwmUj/hXyh3eAtFOuvku8z3+0z205vT1jxAy6zdfCrOMINXXimEh74QNSp4ePZxEdh
         6dww==
X-Gm-Message-State: AFuF++mIAOfX8JYvZ4bqQYhn2GLAPmbYr0puFBswnAsVwc6QITcZbsGh
	PhJOgQB4BiFRM71mTDBFZus3iAf71UxZGI/1U1EDr6tM+RlioVi9DlbMekJHTwDt
X-Gm-Gg: AR+sD133G223mEbCYnSrlPhcqaBRQhYa5Bfi8rJKocjHy3yo+n1/oQSnJOyw+Z+uw29
	OhTfmxujyFX9a4cwNrLWq80kkpFF7HDEaCV7vi4zsoV2V0cBQ7G5KR9LuFqedgKnJ25K1XU/Nq6
	XZGAPfajHhe/Gewdp8GoKv/LiWh/lKLZj1wbcnxrXLhBxLENza3eUrFceAE99mahxgwKl2IgjUx
	kKyxpbvASRpWQaqcmLgQDiI1xlDujxnLa889fihaJHuWsfmqfcflS/Po/YKqPN36SN8LZLBQgz9
	FlUIj2sDxgAKrqfYZUVcNCKq9iPMTayOSqP9GQP9x74p4CTVVM3CS8BChRgAYQCfON7Q6/t0HR7
	9NdjTL0SdzDylPYpuD7tGLKhppxOHZ+Tzru2svJGM9it9qBJb2fCm5QuxpNLQVbo0IpatAkubLv
	8Kr7P+qaH5/n1HT/iCOAXnz/Vdnz1rM70p/zm86C7RlmpEhTfSuVFSAOtG9PCx8WXdG1IJlduZ2
	64+va2WhOcaulislz+ucOuMZScOgepbNnk5WpUCOBPPQR5El0SZNGeMmcL08vMnYgxKdN/eMr4t
	0a6nm4kP1bdI12xfvgbfW6Qq7FMWOG922vKax6L/XhP9Vclo+umY9WXWmiMc
X-Received: by 2002:a05:6214:8017:b0:90c:8301:25 with SMTP id 6a1803df08f44-90c830100c7mr1993526d6.6.1787260382447;
        Thu, 20 Aug 2026 14:13:02 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a1139sm47108476d6.34.2026.08.20.14.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:13:01 -0700 (PDT)
Message-ID: <6a876ddd.d0999061.2c123c.8e52@mx.google.com>
Date: Thu, 20 Aug 2026 14:13:01 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] podman: fix CVE-2026-57231
In-Reply-To: <20260723134221.2504100-1-deeratho@cisco.com>
References: <20260723134221.2504100-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10055

merged

Bruce

