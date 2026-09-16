Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823E6C982C3
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:59:18 +0000 (UTC)
Received: from mail-ed2-f15.google.com (mail-ed2-f15.google.com [74.125.228.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15605.1789567149550945514
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 06:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Buv0otKn;
 spf=pass (domain: gmail.com, ip: 74.125.228.79, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed2-f15.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so1506845a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567148; x=1790171948; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Buv0otKnKNS8/xhjttZNPJEHWYsCOaXu/1og9JLxuOGOvEUhUlu2d3vV0U0i0rWv/W
         WUlejSOdOKq7Y08df8dtCckmRr/QlqjqFYsmDsMTmv11LfRswjxytJEWntrubdJ+lsHi
         0JBjRVVPWly8qGMC+M8dgoAFlTbGiCMonWx+GWJNaOdOmcAdMXZjfF/q2EY6kiqcAU1y
         OlSpHt0TXumlS160Jwky15ATc31Dvx4O/9TeQ0CxI+Y2rEkR7DaI8ZbmKxZfKxHDhS2a
         PNeKP9sepcmz2ICBtZSPfRHD2nfXKGJxyFGLiVDQb345ru33+yrT5WZG9W99Mn82fc44
         QQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567148; x=1790171948;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=iqsMHn56/u3mDf7b6CTRkpx4UFpFVYeFt7BpkBye8QF9JWpZbJUynW3tkMqyToDnUt
         YzntemD/nuqkGGWmtfIANjVnCkmyJT+aO8d3Dp6LEkkDX5dhUTik0zoNLgIa5yc/ocuo
         IKPsEL/Qe1nVgT6fKuURXdvw2iKT22oF6SAj+C9OtrGJT+EhnNKUkwDxill8NlkxGRRv
         aAjZlIjaiGUkA2VCg1lUdx6C9UQjw0JRaDrV5Wk204wDjJ1EGchOrCmkG24lrGOVnLfX
         qzTUoF0jsOvI8ujYakib51NOyz/crpwoG0j/a5tjEwZ0XtiI7DPYgP53LUfq8eRAe5Rh
         hHWw==
X-Gm-Message-State: AFuF++nTxqYbTrf0X5czLO7KKwOO41xGonCL59C8uMchCMUYXqz3zn13
	S0uDsGlgjiPgT7PTK4rW4LpXbyTXOtFSZrP02L/mHUBhqu2PI4K22GXp
X-Gm-Gg: AYBFou1iScWe65y9K4BI95gQPdHdN13XzUyd0URjQqAhZuu6GyxVVrUw0sWQr+R4dDf
	Jt3DD7FKRSHTR/o9etiL/isnbWgcZvRrq38sATxyAJvFY2+51tCi0AGKc7a4tIqvZIMbTdUFFiA
	Vqr2k31MZCy9Zw+ORuMPfQLRO2b/Epsk51MnP7I6p/1fpITXuQ4RC7pUPUiVW1qzlYiOtYu78Mr
	gH6tDTfI+QimBsiRfFwFf75aJAVKBDgtXxt1DPSe6+elonslsp6q7lVhh3rsBvutQYN9/qFt3dR
	b5DxLv1cogSwxu6qsYsZHI2EIuaEUO8tOTTHSs9G3aD1iP/Yaq5ZmYTULNQPaGgPp7RnJ7W2KFw
	fbAWo+Nt0Ioujahff0RdjmhdpeqHGHiGdwtZuY3mHw1Z5hhNs6H+stVlMPdC0eRvgAUyVVWVRtM
	hwq3PyzgZByJ1uCUMux4tx9U4L+oB4dYaHh3XCdMW0kcQgQoJH1feex8xt2S0szb9YT4amf/W56
	tBG3ehUMAHXWHaOuwrNvJ4PCcl0+MzeOR8wBHKtVlqWum4jric1nddkXLf1IEuIyMSBnqEZe5We
	9csKaLiAW4fS/FVyKsqH98r+9nw007+1lw5NQVbXyWPqsxbf5cqGU0XyVH0lFxzbdcPzXcRGWGa
	5hNIoeQ==
X-Received: by 2002:a05:6402:3215:b0:6a7:ee56:6156 with SMTP id 4fb4d7f45d1cf-6aa223d83c5mr2267241a12.24.1789567146948;
        Wed, 16 Sep 2026 06:59:06 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cf66150sm1887625a12.0.2026.09.16.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:06 -0700 (PDT)
Message-ID: <6aaaa0aa.2b2ce8c7.de1b6.975c@mx.google.com>
Date: Wed, 16 Sep 2026 06:59:06 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: harish.kore@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] podman: make manpages optional
 via PACKAGECONFIG
In-Reply-To: <20260902203324.1508535-1-harish.kore@windriver.com>
References: <20260902203324.1508535-1-harish.kore@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Sep 2026 13:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10079

merged

Bruce

