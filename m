Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD8DCD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:28:34 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27938.1781116108649178055
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=idUby04R;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51778077b28so77968131cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781116108; x=1781720908; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ATYN/tVsNlD8azE5i8f1+/c/GpzdpwIBeWtxrCg3uU=;
        b=idUby04RTH0zYT5cnevp7lCD27XD9YwgvGO4Rhu5phhX2/T2OlSGCUOPCXcJn2OCYC
         x74zqWlCfdPumP0BlngkvGD0YwLeP9PHoBwqecEnNnb4Regx3O8zBy/nZgeVNV7kOaV9
         Qm/ERFAc54C3DBTbSnRjS57oFE6KSSlke7ok0vtTeLe98VkK9G49AtgEBbYWJFbZ+kWi
         mSh0+5rTgK5Xc9Rhf1PxzqLRWxbHPk0/N3PXu0cTeQxRsKzEr5hktUOvDMg9wsErO7Z3
         8s5zrx4pp1OVNMJy9Y+swiJaDAlSsUfWLK8ouyvLRbFpvXmGJRsNHwHTU0qpS7nEdyv/
         Ndng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781116108; x=1781720908;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ATYN/tVsNlD8azE5i8f1+/c/GpzdpwIBeWtxrCg3uU=;
        b=ZQZ1Y7A6jryTobH2cjQiMUxamZh2rTDsBuwrSgVRM271QoK4d+qGVyJpL+03VcZ+TB
         bDIlVzBZS9YTbfjfv4Dd0wYc6nzU1qWYr+EHi/umbLcZ879qC3fjdTXAW/ah4Jqwznym
         skW6pwG+n/jTRCZMjjq8waUz+q1wpzmN6ClyKABZFxAhN5nUIo2RK2vDK+rLYRIGCwAd
         xghFy/jSMAGkaio6DZaVqkzksSpZj7/gm96IUSNnKz9EYzfclfrcDuUnQGnwsWoO794V
         yth1j2CoNAwGf47phSWi+ghCCmXoz8qXpQ2/Ya3TqiUw2lC8jtLJEUgjiaQfQobzNcZx
         Q25A==
X-Gm-Message-State: AOJu0YyN7LlufqC2z34AW544CPVXcb9ar0IT4Oten1ZUth9qR39oeu+r
	t87BdGFdqdzoYk4h40+sZBqZ77z0G/d4UbmY1c7IKlGDZULJDjzI6quCUd8kK4sw
X-Gm-Gg: Acq92OFpKYGChBeUf0uc0eYumx7l0wz1y8GOi21MiM50V209G/DXrnabVSx3YNCczNF
	50EB3fIFqDbyPRxHg3Jz24JCcbEaVu9GGAa2jr2Y13W+lkNqNQc4JlwzmxFYuL01UlBiDfjrlM2
	I7jQi5kabJ77oXratUT71peDaqGiWQ9cXJhV75+MrXRKHGjCPpOjrcVOIYzAUDTofdPeFLEG7CF
	HU2YMFk26CLTFDGoXAxMoIlBijNs9L3LhEYRJYIGKZihGcU6PZJ04+xzEA6CJZr4HHHa2hGVR6t
	M4nEyDOf/0kT/97j9eIQq5zrifwx89vN2rfVCv29p+QU5UKsGYzuTBmU/TrCRNxq2N+HqeQM0Xq
	AI2YBzuWNPQpvJcY+KqnltCcJ5RuzzBDfscxM7XnU/fHg7BJ7s9ic+NJpKwrnWI05b3xqIdyCaj
	iop4O3at8j5ZTqlDff7k+hDs1XMqweABwTtvgeySjr8WJdZDpHb2fDIrkEsP2yIXhWmmBpkEceb
	8DEpO5FyNUlB034TpdmLrkyMmSUC3PO52BidnSUe2JBAslEmueRZ0KmGDVnlzVD8gP5N4QexxJU
	8xtATWA+Ks/z0618Fvrj1vKSMTNW6imp07Ha8SlhwNiCew==
X-Received: by 2002:a05:622a:248a:b0:516:d54f:aacb with SMTP id d75a77b69052e-51795a48317mr382924591cf.1.1781116107711;
        Wed, 10 Jun 2026 11:28:27 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517a549be2asm129939871cf.26.2026.06.10.11.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:28:27 -0700 (PDT)
Message-ID: <6a29accb.1373bea1.140cb8.4e5e@mx.google.com>
Date: Wed, 10 Jun 2026 11:28:27 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] lxc: Fix CVE-2026-39402
In-Reply-To: <20260603100416.63452-1-sudumbha@cisco.com>
References: <20260603100416.63452-1-sudumbha@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9862

Merged into scarthgap as 69efbf20.

Thanks for the backport.

Bruce

