Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2DDC54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:27 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1304.1785258558892583909
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BVZgDg0X;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ace427b29so6550137.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258558; x=1785863358; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=BVZgDg0XYfBp462GnU/sdegNvuWmBiKqCrEduHSILw5hxc1ax5yJ5HSpahw28TIusM
         jPodRIbHXfAOwcIWARWN5aao3hkIfiu6l2ey/7obZ5DUPKnMtbKTrFFESk7J3+mg/zBh
         EPQPQfFCMyLCaPN1BJvRBguZ14rwvDN4TUDYlGHAJJAzCMHAhnHQoIDW174Sn0u2Z8wZ
         8RqjTHhsBPHBIN6T28EvCjs1FhldWX4yg4f9dduebieEup7VKl1xufUrP4tpo2ZUA+Lc
         xMjCFOF9vJDbMGOSUcNUYF/yOms7/ZVWtmbBwyxgQCpsZfAoCUdNh28PpKTNWbLk8PkD
         K8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258558; x=1785863358;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=h68ETO99S2gfU412aigygt7OS+GemNX6aqdZkAGzow4ZtAchzP/JCh/BYJAo0HbLpv
         /sMR0tdNY4Og3cLEZrdacT2/IM4x8rNKKHNflvB4GsLhdQKHvCGptkYQXyRSzJyO5PTY
         9TRSPXZxQUMifKY/COF8bE75242y5hhaZbljdoiqTooHmrchSCU9q5HVxe+kw+CJmOvz
         /JRUbpkKGBgHkbAJaZ5oBjv8xp+w5M4hzACQUjDrhGyLJ9FSWHyYBObzY3B6aOBFmrmC
         6gaLoty2JM2BAk1B4mIqLiFEIFuHIwMkTuj0vDlB+qdLWJh5W7nXFzyOhZgD9VWNO041
         mpzw==
X-Gm-Message-State: AOJu0YxKvF/gN4afG1WCrPtZw8r8Tvz7tjtEeRGWmdpLoZ8jXUyBO0kl
	4McT9brnzhIUW2+Tsv+IJfTK0bhsVxGwiaL3OPDvn3lj2nKKIjej8b5UWwiu9ugy
X-Gm-Gg: AR+sD10GqGypwU/1m9LTDra57txUL0ZF4gGOaVQ7nrS+WEo77SNu0AiFffOL68ejUiN
	eMDCfqMLSJTxU3UpKrjvGBner7o3urIMYyX3CI/E38aW85wrcZHpcytFXTrYo5mXoIfx3ezYimQ
	SwGCJ3FNoKd/GzRipg9dfn++P+R+8msh+tPPqeenaplt2SDrN3IPyxVBkNbgTX1XXrGtdmsFTpk
	UYuu7RIaD5reUx8y3s+1GWKnkVxnGX4kdjNOGry2Cyc28r+BfWy8Xzipoep16gdwG2RObfWoRS4
	MO5Hq/Z0QEMdnLLqAZ4qvPY2lLiFsoFMbHcrsg1UgGgI6ArJN9fG3REUUFWPzJXkazxn7rTzk9X
	Yg+CuMPpdbKDjJvFQEuPa+TBhnD4Z92E58Lg/UjRazsIK4RM4gmO5wjDtGb4Ml+HFutqXqB2dhU
	z8XYbtIqhuvhEV7UnmprXiEoIwc6RLPt5hPvYyk2/VWjgvZjf9Fu50a7HEx7hSEx4sWn+pPQ+dO
	NJJYQIpq0Btij2TQSzdKNYoJdDRaffa2Dr6Of1+v9BShtUaKA9y+ogvDLG8qpvumStM/RbLaokx
	5IE=
X-Received: by 2002:a05:6102:f0a:b0:73a:128c:4e3d with SMTP id ada2fe7eead31-7549f950b96mr1494335137.8.1785258557604;
        Tue, 28 Jul 2026 10:09:17 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977b2360ed2sm237426241.4.2026.07.28.10.09.16
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:16 -0700 (PDT)
Message-ID: <6a68e23c.78148561.3855c5.5427@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: set status for
 CVE-2019-10152 and CVE-2020-1726
In-Reply-To: <20260721171238.42383-1-peter.marko@siemens.com>
References: <20260721171238.42383-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9994

merged

Bruce

