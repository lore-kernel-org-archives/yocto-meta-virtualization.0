Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BFAC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:12:59 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3854.1787260377810624233
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nLAIIdfo;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9309d4ea213so24242585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260377; x=1787865177; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=nLAIIdfoEkDzykBnVGT4KM3NCfxet8xJI8p/ExnSvnZw+QRLsFzp7t7K4e7ODb5r6T
         DszVHdtTwkkIl0WFX6sQPyaAX01TuzheW4hO1bX58jM0YPNM2v/bwGxFr4iWkZ8l7DaB
         wWiIK398IJ2niIDYhtK4rcsUwpm+RL4xQuGAk/2xHY2DwaYQq5nEoJ8nooKC5zwEiagI
         fi0eOUqDavRk+6AMkUKkjfHRZm4BU+vDZx+lpr8T8wnY9vQ/n3BqX9zZL1X7PDNnmhvY
         VRAKWhGDOS+2fUqDwbXtvOK8/9MtnOr+d0aJ1eM1FagVIwQZuxFylFWJl8cIPhfEhZyl
         tB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260377; x=1787865177;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=mmnYfsRuBBysSCb+jNTWQ7L57M+2NP3g0O3ej+48CS5yyk6H9oddewyFJIKYA2+rOO
         jZVJALePK/LLHUHGGzIJ47QX9QhgoR2brpI6PvYdUZRp05oieJoW2qT6H9py8Ty72/UY
         mpQXtk5UysycAriEJIGy9/MOS26jix0aIlJ+UXQ2kAnWjDvR66rpy/e5qWwxfWrgBl+B
         ZQMsmwBDVplQsaxo2s84peKUPj41fu/Xs0vnyNVhMmYv5nmN1MfDq3n1p18CMO0ktWKX
         d+XnBoeRPKkXqHUBflwBvzxiw2VnwvtauHlOXGGIkI9tjuss8DJ9SpwzxfQVtFTQeUUx
         43qA==
X-Gm-Message-State: AOJu0Yxk91zvhoTcYLqABcaZkyBkmw4oY5Y/82BWAe5EJm/H8BkQNgEG
	YIkcFQdzJ0KiQfpPou7eYlxxv4/RjDT3hFkAwxNYYFPstHPHz1a6wkuB
X-Gm-Gg: AR+sD106lldgLRvPtFE4/urLy4LU1ULv/YoqrabdONt3FFc0XQKUhUtUUlLZrnrApNO
	wJUN2mFSbb0hXgoo/SP/nDDKh99ZAWLpi8jFJUxL4KF11nIFgy8vzIUMhhFx30btXic+BE0V6mQ
	O5izM0G8VSx+XdHaYReSF370DlX5Sa3OhMj4k9B7k3GHKRI6BW4ZJBxY8JUoIE469/GSfaX+Ho5
	QALtQvK3zlzJTsFQISAk244RF1n4cc/xjOYJwP72CVanqnMfo1kPXFKYFtSPcKTLnEhY0Pkf79A
	xg8ZoOxl3feqwIGY8MTtF0Ay5Ev8e8KoWaIg/1FUaUjA9BHuAjRjlG7dYQShOk5YHPzcCjJTqZW
	nzwoDk/7Xt2r7I8CcVwPCMfbB2ivuFGIiOQSz3tzqok1AUj2KmTRAh3L1KoJwnRj7RxaPzyqrAU
	QJxEJptreyNvxuJyaDCr0X5V+avrbMM5edzAQ4ex1DmlH5cbc94wucZI75vB3Ea/u79YwX0YjF/
	cr10JB9RTKIGaOjZs3J0/Fzm0ZNN1xY0Ndi8nT0oie2ddH3F+fte4VPOxTVgKzPyo1TogRD+2N2
	NoAZYKiT1RdKLHfDKueZZjIn/ycytvCvhh8qUxCBAkiRmxFZ8O4+Xgpf4JSJZbLFH4jlqMw=
X-Received: by 2002:a05:620a:15ac:b0:92e:e2fc:26d3 with SMTP id af79cd13be357-93739616719mr89957685a.46.1787260376628;
        Thu, 20 Aug 2026 14:12:56 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372056b7a4sm454402185a.27.2026.08.20.14.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:12:56 -0700 (PDT)
Message-ID: <6a876dd8.e0a65cc7.2d8b3a.2ccf@mx.google.com>
Date: Thu, 20 Aug 2026 14:12:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH 3/5]
 python3-pecan: migrate to python_setuptools_build_meta and use SPDX-2
 BSD-3-Clause instead of bare BSD
In-Reply-To: <20260819094512.1153-3-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
 <20260819094512.1153-3-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10052

merged

Bruce

