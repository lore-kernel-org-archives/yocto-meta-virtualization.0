Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E93C54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:27 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1307.1785258563209285712
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=czXaJc0L;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-736eea06c3eso12700137.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258562; x=1785863362; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=czXaJc0LBpZeflbtcdUB7iXwaSuUdhJ8Nb3UVZ/0lfcEvj7Z1IDplS3YpRKeTngDYr
         xDD5aV8ZqcNcq9zZTDniLvzxxrCqSdnkKQsXEi9kJFxAuihn/MQGC23qs/mVdUukUUfI
         rgV+XPuWDSn+iLh3xNQMJse/IemTwKwBywoWM1gX04Ew/M4Ci9DrK6/DU0aFrhY7lUbV
         EHkKs/mHY19Hxt07IvtCjtTdxm9O5eQZRabwBySVl0HRvbHCRFryoWaoQCF7KzWmV+dD
         wIEBhrKwK4Uco17Dd0ZD+HEGXVnO5SKFuZz7vqyXfaLfPJgtNMiDNJvZPTwrJHsdCwQM
         neXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258562; x=1785863362;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=HYHol0nRT8PEoWvR/KD75m82sNufESifmmUMtml2cYZucGotx4UHYFb45lJV9IFac8
         4wE5JyTRaxI/me2gPB5etVP7D4BM/i4s38fWalLqJtSsLIVLNOeeePC7Kks7e6LdnR2l
         Uhr8kuap9M7vD9F8oXGbn1U9SiCEoYN0KiAwZY8LVSjipipxCLeJwAEMKkHsQ5tPz7Bm
         4VEJW7q1xHh5sMvyPmVnzkmoGhgTv0K1F2pFk8IYh3rkervmrSxEsGqfDfhE2O/n8dlb
         LKp+iRW6hohRHikVtQApPbSdw8T8YV1ZINpx9ZUur3aCtVhAKjyHyNfzdUz5FG2lW3VK
         Uf6Q==
X-Gm-Message-State: AOJu0YyJhw/DuEqDLfKcFX1XcXzIOO3WQkWiH3MVZ0uTBIP2v1lz7Ekr
	FqRzIsaj1OWf9p3bm5+w/unTQ6SLRQpHLjp3jsju6aeWzxt8S676gh50MQCkzEud
X-Gm-Gg: AR+sD11Aad8DOmItefVmhdxE/1C0pG1SCu9g2JfSoA+bzCu8wQfUTDbrarKt2sbMA7Q
	0u42mdjdIIzhnzo6/JPVrPThec63D3Q7/xaqo6iPQ39RcpLWsiOZ62qc4iklhG/Z7U3+7s+khZ2
	DohiVr4SwAnnmg+bCEYzV9q4PeuqlgoOpvhMzSDBA1uJMfixPbS9/Tjw+ygoDTAgxlkEK/tCNlA
	JsdS3kzuNp0zKZHYovsAQQTGamUpuzFoG0MGEdYPzfvdAFuiXLaviMO8c/tPl9b9HCoJ2I8ghkI
	a34L+a8S1Ioh2/TMlrOn31HW/oobTGJtlmGWVU4urKK1wPj6I0MqUUWUoiNVKOp/k1XYPYiYTD0
	dkYHuQkxFEECn0o7wHFfdaBYcdPszSybCo4rBgCM8aD/SGA95YmOgtceLB2gRd3RY5MTWhWGMfu
	m6sRHzG2r5Hb2UxRwqhCLSJBCAUYiK5ceC0jQchKJICsGnmHNNtA9uX1RsLQoTJ3VFD3H4M0QAs
	tJf2mxKwYUts7GJHch5l9DFjGgVCgHlz5nSBNCuzaI7bysrKR8YJ7YSxDv1og/BDmdXIgG+N/Kt
	nV4kvwA0/iDSTg==
X-Received: by 2002:a05:6102:3594:b0:74f:6b13:8639 with SMTP id ada2fe7eead31-754a2ec3571mr1632938137.28.1785258562121;
        Tue, 28 Jul 2026 10:09:22 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-755a4879dafsm28729137.0.2026.07.28.10.09.20
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:20 -0700 (PDT)
Message-ID: <6a68e240.26dcea81.30dc92.6800@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:20 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] podman: set status for
 CVE-2019-10152 and CVE-2020-1726
In-Reply-To: <20260721171224.42368-1-peter.marko@siemens.com>
References: <20260721171224.42368-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9996

merged

Bruce

