Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD84C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:38:00 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8980.1784583475282117286
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hRZj3HOX;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74a86e9d4a8so196401137.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583474; x=1785188274; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=hRZj3HOXkP3lL6+qHJx9C/jJGYpuyoODfikqBbhCzrl4wVLnHVtfcXpkIIF30lvH+L
         QYq6Vm5oaWu3Ln0KLedfcB302MxchY4XgsWUMQ3+tAb9uaQr2Tlj/ssukzLC/ig9dcFy
         RlPztwAiuNJqKSGab9oT6y3+Qg6v1EPMN9nj3mvlICaj1xSHf27fRiEP2MRzD56NLdvn
         BF7pkCidzVxCCb8qboV14zv3PNEUuqu80/AHamcrc++FuZB/01BnD+VveOjglpmwWWEj
         kcHA50o+Ef+1dLxiE4vR34M8yWGj6ix+Z8Z7zX5W8bkV1Lzc3UfNEkcy4rv6cCuOE09U
         Igrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583474; x=1785188274;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=mFkNmLx1YhCxpOwLuim5Ke2npr0LxC96QkJCtu+tEBsLnFCW5gmKpP18Ezrdwn6q2u
         7EA20RwtNlf3WlpT7JO6ZWVrT6D4ZAgk/ZIlOVBnpBTgOl4GJp6kdqL7HAsaIu+Bsr2V
         hO/Boj+Nu/qmMLHlEe6wqgb2Dps1G9SGhnsfMKOBtrvd9SspAXaWRrdbyCrr2hUaIEMG
         jAVKRvYboVnpeFoUzqLrXnS+zbm1YFWJCsFSyCPMu3Yj8xkSZH2LPOWZSDk0o9YV3VzF
         UWmZG4QtrHibiuKnYttdTN+ORfjdiZAKwx/VI9hD9pDxNAHOIhqobciSJYDjAWo6tNgK
         8GPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGahZHBbmaiMvZJSgQhdMbSqi07poSfY9r+7xL6xFzZqFJP/HAiiz+Gl+peVJt6FeSKz758gOGg1qYd7nTdVRvA2Sd@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzQTTI0GpnZ0cE1EHFDzFzJ73d3XMM8H+pvx3xtupIXgKcYn9zN
	SIt95DCXrcIX41fYhsMFXmcG7VMiiZRfijE/EmXamFyncS/LfqslRNlb
X-Gm-Gg: AfdE7cmUM67D+U1cXKAtBCeimB/MpFA+GzcHIVgboY2QJBMtpItNun5qIYdYcZLDaw0
	QwBsvIlV+OsPwJisOf5rs1JpBBNt35qHsoR4v7yikBPoXURX548E1JKeSfLdxSBTddEe1CNt8PB
	IxQHSXqjwhRwdZpF7ae1qPUVdlvij751YD0lOjfJmRGd2MT/DJA4aQhGMy0JXQhXWa+xISoINph
	tGt3orUHl6ixYRng5UVU8DpOCqqddPNT+m+OJf12luNtC54GyL0F3qGQvSnOgSDsQh+LSVMVB4f
	jrh5IvAgR130DiygDO5qL5a5fOCQ0456zSOs5nbWvUuuqyzMZJr29YydH9MCjyCNBVkeDJl//fo
	vVubew+C/gL4RNACYu8iNRiRznsti4OtdSWI3LwT9SP2niU/vSmt6XEbs+DZU0WYz06OkSviE4j
	8wxXgpGbwaDVEVTvso65wBso3qig3LVl+TIPnaRI6X+upEl+cqTMzNzzJ08vb0irXT9CLfNwmSZ
	5zl9N3YqV1N5vdIccaX4lo8KRANzxeGu5HKwARG0nauC0VMHIXMTzu8VZhJA7oDuOM61YJZ/kNC
	ZIk=
X-Received: by 2002:a05:6102:3f4c:b0:738:be7b:add3 with SMTP id ada2fe7eead31-747534c9b80mr4671721137.6.1784583474098;
        Mon, 20 Jul 2026 14:37:54 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc79b680sm9197708241.13.2026.07.20.14.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:37:53 -0700 (PDT)
Message-ID: <6a5e9531.40beed2f.22d257.18b3@mx.google.com>
Date: Mon, 20 Jul 2026 14:37:53 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/2] docker-moby: Fix
 CVE-2026-41568
In-Reply-To: <20260715172549.1152428-1-deeratho@cisco.com>
References: <20260715172549.1152428-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9968

merged

Bruce

