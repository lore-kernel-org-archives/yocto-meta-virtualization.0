Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D1DC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:27:09 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8774.1784582824070745984
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BlmN+q2S;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-969524c1a63so3363441241.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582823; x=1785187623; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=BlmN+q2SlinJ4M9JtDwHcjth9iTnvVs4Mkot/HYanC/JMt0AEFxH3JVXRVrySz4iBg
         c6rXvMuOmUWcAhehlcsl+379NgdZdYDFFYKW2AffoEW/N+ndEmOLp/vaGefx2tsGVDAE
         NU+ZrteG2+1Runp7MbGN+hJDgR7lZVxDQ0KtV33eeuUoVV1GVUMwRAZFdWUlVECx3snr
         a+SedekNtXUjHxiISZuq2cWwqSv8keW1Dqr4R/K6UaJZN+oKpla1ApQrQXjDv6iaOAlg
         g/akmcmzHRSZF2c9kI8kiFP2YvUjLoZtuMTwtk87qBZW6F510q5DUHsPCG9ho5PQLVkj
         vhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582823; x=1785187623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=J9mp0wjs8IQB+WuSFhs1B81VC1UR7KXYUC//PUBvKqzLxaGDWrQA99oHGSWihH6do3
         RzIDwdncef24SR5kGqRvvuqZFdgC3c2wAjt1fjjkUMvR1uvNp51G/9mWx9mtaX0amWad
         iRajd1nSDy6+WUdzkP2uI8P7y7YTITyNLTElk+XKz9n4z1X9oP0CVGX+y5y0cUJFh3sy
         oYfsJdWTi0yWMKEdNCLL53q6Qs7lhDC6Cm//gzWtg7+SaWqKn0sbIP1h86G7ZeX1Wv1s
         o9P9HruidwhA9mrP+RWXDLTPQImphld7hcqluo+lvQX/S11e8HkTCzBm8Z0Usgl106KZ
         9HBw==
X-Forwarded-Encrypted: i=1; AHgh+Rpw7bMpzXUjkUfo0/5HLBgDiIOHtTzBMh2fDXwTOY+W9Ry4DrieNj7J7iGaziVBm2NUBZV/A2vEBnjZjZoPkpaYvUBM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy2WL0WcF64ioTIJ85CQUz4+3y0DkRbW1zB/68zMo3hZPeQY7jK
	R+vquWi2+gwKOpM956i/CJagEdpauWrQCvUsg696JqCHWEXOkto7gXE3
X-Gm-Gg: AfdE7cnHb3ioyboaK3+haUKGEYns0xHQ8bqyK4Gmqf1TyOVSsDgwn2OKhczJuJ8veD4
	S7jGrtpVRi1xa4BMtx1mgCdlMnDu1zmE/+2btZPPWlLGTRF/X4Fm3TaEtiXS3W0t8/32mbj1ysw
	QrGjHtI6VbmtmSPuPQ/A09XexvpI0jl9wPhB1n7EFAJi82/gfzf/3VjtAEcmoVzE2ES6YsD34rU
	qpS2YofmXlLo+Jk5wt00K2c/DVzjqNaf0dI4jbrl03mct7iuSBC+sZST7jjbSRsARJ8L3QoFCsl
	g70a/dSGDEEoBxt0HI/r4vdDalu3ewya9icR9pl3xKy+6IzsPNZtsFLC2Edp8Oh1nN1QeTJ51ul
	ebR5WzgzLck2WKfm8j9+JxBw0J6/eQOsiGZDy25s2P+dgN+vw7mtjLPP4V6Kbm1qdrkplxTECj1
	diIcMnnGXcLGTSx9iraxLvNxoOYG/y2YivoV/zYiuZRG53OEzJRa3JwPIEgCX1bPENzFjDeBWRW
	kcFaqqS9p8roMOf2gOLPfeijGpHBHwdFsGwz50RmiJn9qX4k0ccGzRsI8YUJtz1j58oudQWZ89A
	EkE=
X-Received: by 2002:a05:6102:5e83:b0:722:826e:1423 with SMTP id ada2fe7eead31-747536fa410mr4785372137.20.1784582822925;
        Mon, 20 Jul 2026 14:27:02 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc60c50bsm9054034241.8.2026.07.20.14.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:27:02 -0700 (PDT)
Message-ID: <6a5e92a6.eda3a0c3.29521e.05d5@mx.google.com>
Date: Mon, 20 Jul 2026 14:27:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 2/3] containerd: fix CVE-2026-47262
In-Reply-To: <20260710122652.3004381-2-deeratho@cisco.com>
References: <20260710122652.3004381-1-deeratho@cisco.com>
 <20260710122652.3004381-2-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9965

merged

Bruce

