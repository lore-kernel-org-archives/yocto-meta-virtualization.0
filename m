Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D298ACD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:58:24 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28609.1781117904328658642
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JnUhTop9;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ccea53f35cso70759136d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781117903; x=1781722703; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNPpmBUXtNlIqXJgvW53R8CQL/qSu9qFU8feYJdwhOM=;
        b=JnUhTop9vN99FD9fdvGbdJoL36zk76qu979iOrsZHfAnjMcQQJDBqVUE0iuCE8jnhJ
         O2chK52q7eyq6UFU7DnWiTPOjrmtA+qsGtGm6tUKjl2E4rdTUg2Z1b0RLZlw2No6KgRu
         rLWYJqA21lyLAlaDcwjuqzK4ZzMiGvZsGzfI4bXm0a7cUfVS35bfcuIRlVp+dmvFZnKT
         jolXD2lfXvbDp2UxGctNhTO7tolUZhu8MmKC3g8HdpGRFrac19Xz/cGJf8D3ooFPddwr
         1Jjz53HIek8ERNq9YKbpY5JXpUeq9NVkv00ghVVxalNOScjzkr55rNuuB7mFk9haPJ6N
         A0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781117903; x=1781722703;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uNPpmBUXtNlIqXJgvW53R8CQL/qSu9qFU8feYJdwhOM=;
        b=j9oCQ8Dif+JM2G4AKoVJJPL0USPbJy77+OfwYItPx26869jXXAGuwBGdGRE3ug1bDx
         PoJk8fp+l0iUGxrGh3Qa7uUy1GAGSwXJGyucNIuVZH9FFsYePFuU/FDfRxPLuKAw7ICQ
         DArwSIns3MCSGMx0UFfKdWIMZECvx64CZwj4BMyl7uZDRTOrXlPbo5mHuuMtEGi7vcxs
         KBP1IJNnv0tNwroD6EYzi4fGMDjxXCidnETRHhA9lvw6xftS5LYHhe2Rd2mTnCj5nPnx
         aztIUdve7IC6/BsT4GH8wQFn7qcLR9bSNVF/I2RVeuv9t/NBycu5kVtBs5DEiAHcemkC
         CpkQ==
X-Gm-Message-State: AOJu0YyHL4r/nkCMUY2pt+tN+poAIO3kBp+qOP+9Yxu2FtbhqHK+u2kp
	84s/h8ZW+R4dpUACKPIEsU1T5zXOz9H9K756Bj7VbWYYGf42vfiVXHxGfRtCUzrG
X-Gm-Gg: Acq92OHuPDwYzbZj8LtaqAkcWkDTFiZWmG2TjjQPfKeBjeFnojkfM9wBFNthmcc8KmR
	Gdf+Z7Tc/RznaLLHQBFwpkKK/mNbUExqyo654AgpJBVad1U9wlwf3ESYfZqUhpD2CKAOrmjogwK
	ZHmP1W2UvEyTfaXNh7ZK/1BueEjyvSMCXlD/Ws07nLdKCVp9uJ4o2XrD3F+MpR+dKx/NVKlsXjp
	AlnKHYHQLRhLFOMWHklhb2rmI35sSm3Asw7JLqE0FZ5FE/KlJnbTE+k6C4Cf82Ya1FN3eVxqsVD
	F4QPGRweC49Gsy3QzOPGoRg1Q5glIVVSGpPNSBlvLW9THaVT5Pu3rtXB5GuIopL6jgc9QoHplmO
	Xhw+uyYQIuvUhriYCKp2tRjHQYc2WAWun/8z/Jaod4OviMFvzy0vQFEdzyLClt+k40IrSG6vlCg
	R4iwbksT5uhIrQFQdkHd00R4/89fSc1hmj4qhSm8WgtQTl5eCQj9U2JyeWs0dxUX1ucPySXbJhD
	DMfDN6ZuUIagbgjG+jZZZc7yi4Fc2N4BPOBsR5/weP8x4itYFCFGjRoiQPwPR0TSkrs63zTdmL5
	WYmJA/vojTjPliK7SCNcmRPYfnE5KdHyYR8=
X-Received: by 2002:a05:6214:5083:b0:8ac:af21:5746 with SMTP id 6a1803df08f44-8cee63b34a9mr439404346d6.42.1781117903198;
        Wed, 10 Jun 2026 11:58:23 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm244766286d6.14.2026.06.10.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:58:22 -0700 (PDT)
Message-ID: <6a29b3ce.4c95d0d1.30047b.de6c@mx.google.com>
Date: Wed, 10 Jun 2026 11:58:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haitao.liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 2/2] openvswitch: re-enable ptest
In-Reply-To: <20260601090145.412741-2-haitao.liu@windriver.com>
References: <20260601090145.412741-1-haitao.liu@windriver.com>
 <20260601090145.412741-2-haitao.liu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:58:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9867

Merged into wrynose as e79d06b1.

The 1/2 (3.7.0 -> 3.7.1) wasn't in my queue anymore, so I
cherry-picked the master commit instead (now fc50b4d9 on wrynose).
Master's SRCREV is slightly past the v3.7.1 tag itself — the same
content but a few post-tag nits.

I also had to retarget the context SRCREV on your ptest patch since
it was built against the v3.7.1 tag exactly and we landed at v3.7.1-tip.
No functional change.

Thanks.

Bruce

