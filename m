Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83EEC4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:38:00 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8981.1784583477051110707
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MiDRDo+M;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so7371911e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583476; x=1785188276; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=MiDRDo+MaOVln8rRoGTnlLINDK13kECQGIeKdRCdrN9uMuzhfkh+qPsOaGMYpWYunG
         kgifZ+93uo1I7aOS3TixzMurePlb34DGfwkyAOtaKqL+lVsoyd/Xrt3Wp0yb/R9FpSbl
         4BDx79JUydrhBc4bO7fbfs87hoIGFXU+/MtilhXtqpRGn2A+j1angqNSVQyaDQ+vd9aO
         jkvgP0EOip61Q7nkYjyUh4RCDABfWMytfpki0K3A//9pEXoJ/cG6XHP2YegQCIzj+ITc
         ZmU+qEYR38dfsC6ew8g0RNBT08r/LJn/zC5D4yhwI4x421RKS8mfpUhwIY+WdcPww5aZ
         nbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583476; x=1785188276;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=tHiRUeQtCcP7BWMFIfchQnO7X235DNLFJW/V17cLdAA/ef40sd27CHgb6H/EjfzU65
         eQg0g78djpzvgBNN5w8a2j5auL+Uj115pvMGNfbQ99iVEzdYuKSrdmX5yX130XAjHgSn
         z5K18cVaOjJMcg0S9f3GVaj/DFE23F+btAdyNZUKh53DUKc+MCyqm/X6JjfPvvhlSpfi
         CtFFLlnEaQyvoPJOFprYQ1kXI4f4y5TJogpEA9EbQYhl1VQIWSHNPAjkiBNX5v94vQx1
         lUPYZB3iMU/u6aC5Nma0mCAYXi/6GfPJ7BB16cokYZzmk0mze6Kp+1VNBJkFd8c0lqAM
         Mubw==
X-Forwarded-Encrypted: i=1; AHgh+RpsPj1ytjvBxApHyfzHU/YT99Or41Ux5GYmEytREyI54VMM5uGLB2K1mPbogurOOZ1s7EfZIpWw6W4JTZVdlOpeYEYP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxhvzw3uiDTa2/tzDFxX2a+E2qHGJGhaBBheA7UpLtn3WPiJ93s
	F4ta4icKgvrtpCAgt+X3vpk3U7mh4t0i40JFrlUz1QAy5IMNZSg6d0kP
X-Gm-Gg: AfdE7cmGBVZek0GC8PD3r2yegMO7yOa3+ofrLqiiWSXtgEZfka+mq1WlP5GfdR6ncWB
	pUWuPihQYW/UwLqfhfQx2cYFfaWtVDmZcp2OHQ0UshlMDEi+7jqI5svBtYVQoqoF5TtPOFTN3qy
	QZd1S14VcEvGKjh7UQdtU/ba8AfEHFZzt/3Pd3ggibMDnKyPmzZOjcF21+LJ1pdjK77lvguiu1h
	R7CVGEami1gaKQYXEKC62edSQg0ZvWWYGMTJy/vUDuQXqKm0uBXoawP+vq+hnM2PLid5xjttf0a
	yfhJwrYrXD8Sxsngfp1thCsjee70lH7foJrDmn2/wTbFj7gksHvc3BsnP678E8dFV2sxpQtXwRc
	5eXYGsEFetTaHuWZ4LP5rEqcSHtjb0b5/zojGScR9FvkV5g+Q37GVbiM79YUXAhNBoYgyq70wTk
	GM0j/Xo6qakDQ5C1RXSQGwZ9fM19HEKt3cjC4/HbIX+7FLeW32mCsp1DkEZNEfjt+/141sbKpbP
	b4WTQzwkRSg7g5SknIkG62PVRr7gFdr9Nv/9tbC7Qu+j2PcDPD5crHFuOoprJSqXMgMpXyC+57/
	GVE=
X-Received: by 2002:a05:6122:45a8:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c1b67db743mr4695684e0c.1.1784583475897;
        Mon, 20 Jul 2026 14:37:55 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1f6c6e46csm11844637e0c.16.2026.07.20.14.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:37:55 -0700 (PDT)
Message-ID: <6a5e9533.f9485dc7.d752d.82e3@mx.google.com>
Date: Mon, 20 Jul 2026 14:37:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 2/2] docker-moby: Fix
 CVE-2026-42306
In-Reply-To: <20260715172549.1152428-2-deeratho@cisco.com>
References: <20260715172549.1152428-1-deeratho@cisco.com>
 <20260715172549.1152428-2-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9969

merged

Bruce

