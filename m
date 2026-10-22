Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6795.1792696150468253580
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CUbgl1hn;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917b78dfe30so3220076d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696149; x=1793300949; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=CUbgl1hnj9wamY7t/br2xq7lYecOTDSkg88Uc1P2ru6fitvOR+MY2oBqCgZJsk24eb
         fs7qykjVeVSYzJ74UuMSpBvVvrtF9aGBWm2dCGcn2PzcV2cavouXRxvM9iDX8Tb+M5gg
         2G+04Av/LYEig7Ag8JeaQ/plIEzZn+61HUf/8Ce7seD0+bQhOVVFlXB0dMaP3Fj2xKsF
         RSw4Oc4g9kSYa5hVPkydNE+9fW1d+xfiDesID7SDNoDC12X4oY/tPeBsYHtcODeDFGVU
         kQGitv18GNilZMyHAGITIPEPU1QyffgUFCn7cqYtG6314uo4ZwYOFZIdhJmr5SBt202t
         k0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696149; x=1793300949;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=wNLP+z7/BCSLRYXJMF0NZ4yeuaKs+gt2Dji5tf076upRT9rDM6s0ei+isjuZoG7ufd
         3nRQp3bVGWGFhbm9Q55gK2l58Sy2Qt5zqT52gbvlMdoLg7QuQY3m9pHSqqlaXaOT332p
         nGsKbdGiYLuuwTmigl3Rw3dU+jkr/DQuyrMpJdWsbzRM2ek3+DSlBiztUG3NOUcKrgQ5
         MuHog083oSwXdpBQj78+Lgy7rIkmrg3FlOArivl+RAo8AtNF9RbFNfNGhLz1pY0Ax1jb
         rb0AaTbEUyNsdUNCiCXATVtrCw2csQO4TwQ+KV8ttV1bUs0/gCDkRz2pnmX5Uv038oMy
         c4vg==
X-Gm-Message-State: AFq9FYKAU1ZRHKdwaQhZmxp3SfFBI2SPiaJ56kFOD3Bmb7JfZURENYoS
	/86W7VrzMIEFgjVCEmIJID3sS0RVZMzhVfRtaUu1h2LbepjqpRZi64tYqv7Xs/21
X-Gm-Gg: AYBFou2duiOVn3+wTGPjjcNbvrw2+dQ9Jd1IyTOmK5r2H3aMpzKV1pUUyCPMSx0eyTH
	xRpQ3yT3MtvkMXUgx5TJYthVtyvzmfq+eGFzhxegSF3ZmYbYr4exTmF4gNXD9YMKRnB3RBwMyLZ
	YoDFKhEyKLJmskwwirQBsZ7LHon/f3eOLLQprKlEIvm/TA0AJs7qQiSuv66AgZ9+fGtXA3oslWk
	V2eJr0+by0w5JTiv5SKbVhISJzrlG0a18MG8+55nJ99iaB0dsf2V2Qfre9f/Xwru0Q0z/yEDPcd
	oD4J0Pbwmorhr6Bfggzd3F+xT7s/aWKkLMj0/4QByMjAYUWPzbLawTkQauYdKnQQqJriup43CMG
	gREP4ts5z//yUinqXqRKRkeyZIICQ2faQXKejXKQjEa5WubT0PcQCJoqNJNOZxXxTlbXLky5Rqw
	v6el9b4IfJ94RbNnthFWJizEzt1tl3GbXj+fyo0Z2Pr0cBnT2D15FJX7KR03uvwWrAzYpqH+ePn
	PonctF7gALhkajjfQyXHMDiXx70aGiWbt7bx/B91RlRYGTDSTPP0GMPlfI69VY/4Kya7JgeoeeZ
	Kq9iklKulVB9TAIyonWFYil/e39VuCgpWFBGTiCV+ltlWJnqpLOywnTgcQPb1qwU7bu8Mg1Uj6z
	gWQ80SLRNxfShCTksoI9HizhOf9ImwwpHGSBVcYKPSWt7hQXp4XSiAteRUIxH8dVeIERnO6QAjw
	==
X-Received: by 2002:a05:620a:6007:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-93f6fa10691mr63886385a.77.1792696149179;
        Thu, 22 Oct 2026 12:09:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fa78435sm27985585a.6.2026.10.22.12.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:08 -0700 (PDT)
Message-ID: <6ada5f54.69adf265.2324da.b5ba@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: peter.marko@siemens.com
Subject: Re: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2026-47766
In-Reply-To: <20261005205303.1224158-1-peter.marko@siemens.com>
References: <20261005205303.1224158-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10125

merged

Bruce
