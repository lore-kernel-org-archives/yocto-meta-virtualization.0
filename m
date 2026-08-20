Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8398CC5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:12:59 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3896.1787260376062395207
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r0oM8ACE;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5218927884fso2688991cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260375; x=1787865175; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=r0oM8ACEVaQJnWl0OXZ9kS36RRjCesUnJfeXVvn13hX/EiO+H3Ncq4AdOmHcyPBkO1
         Bm01Xw/8ynKbOlcsX4xaJ/dJoWf/9ReFjwYBDkH2LFg1oHy0MQNiAVuzCFpqW5v7Imzv
         bYK7aoJwzwKMnamuHNa0hD8FTKKrEvkv+P/3h9XwEpFTTMCnRrpa6GXWbN8yLvj3cn3w
         YyQf+QJd1xbN1i9oaqBoD2HZQ/F69hPC+ugMNNmBnpLPkzcVRZR74MmRSay//8vfpOzD
         oZl5gdFNVwaYdS0I6KesbNZ7pUPnqfGuCVOYAK4BZRf3tEjCPg1+tIEPxDSRD6WVNw0w
         ZhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260375; x=1787865175;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=cpUN8Oxxqjb452L32q8aeEw40FXZBq81GCzo5RPh76UZLFHcn0PNuz0K9UbEDHjtnh
         rM1cVRFVaDFQ6GXsNgQWnw0dHMssPkl2AJM1c3WpB9B92EOOHgDoqu010f0j2s0Tt3RH
         bqNhP/GZq9ok4XOsTYe/MpuJoltRnuyJXOz+jzFGL2BkhfxMHQRZ+KGrw2QqLSubvwkz
         Azpjn5DndJxT+LHoFYkgMb/SlEA42g1XqhNdGVKGyh0LKCQl5hPjTVyjQLF7ERedCtqJ
         tXkPxywAZlSzFcQ4HRzt0jHGZIZod//xaUKfUInxP8Ff3jveOGvqGdxo2aIu7eh4GlOS
         wWNg==
X-Gm-Message-State: AOJu0Yx41Ie9a8bcyj/y4NUO6O1fZtN0DZKDN9sfZWPPEYjGoAqDZy5M
	lg+WzQi3Dv8ogHxUpHZ/mc+ihZLxNExH8849Q1l6aXqJQ/phqTURZvfh
X-Gm-Gg: AR+sD101I1XP7EcTYkTn8n3IZ3IKc5xFyhl6HoWgHIL8AoVoWY2MMEaVFnf7vuwB7Ea
	YufwyFZORxvaPYqvmIcfJSczpOICEu25+aYds7mvY3EuY3nYc76mDWR4Q85PzzLxYS2nuJeMRzZ
	IwLEimi3BSup/6oWAZDoZkzjIHHBEJ/Nv2DnXwB4Wnj73ef1F09G/iE/FsAEl2Wnm/qfIPvAnOe
	Z/Cuh4cgss6Gca3RXH6DLaWISd/s6pYa/sQScZ5ShfaiHtqikvTHrnUl6hx8fF/q+NKJ/0Ebd+V
	ivXvhm+MG/7r7QGH5oWmfaUPmatGiHyN9zx/cUjHDVoLQsfgp+ri3AZ1tPRzuOGjwwDPnJqmvJB
	J7g+/phJSRwksLJLG7MH/V2QAlH00mOjeSLTq2D05ib644coBXSuTz/wrvFt+bIh5MEakZXWIZg
	/XKDm4eT2njcKpcoygxf9Wf/NFO16eUnvQcMsvAnft4+n/oVJFvxZ8oQTCpBiJpRBgsKe8LXRmS
	Ja4FBIbUnJGKkADq4/9XKmf9xoYIffBy1TbJ/wjb+5Ct7WDcF//M9CdZrU0hNkE1B9yoIrpDWW3
	dyEMbhxYkGA3aRBKW2kKmtMiQBb6C19Q2qm6Ah+h4VDGR9KHZLd9xt25N7ed
X-Received: by 2002:a05:622a:1249:b0:517:8d24:64d8 with SMTP id d75a77b69052e-52df5733500mr14782601cf.13.1787260374857;
        Thu, 20 Aug 2026 14:12:54 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd859db06sm38481421cf.12.2026.08.20.14.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:12:54 -0700 (PDT)
Message-ID: <6a876dd6.bfbe2361.38c424.df9d@mx.google.com>
Date: Thu, 20 Aug 2026 14:12:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH 2/5]
 python3-django-nose, python3-nose-exclude: drop dead python3-nose RDEPENDS
 and use SPDX-2 BSD-3-Clause instead of bare BSD
In-Reply-To: <20260819094512.1153-2-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
 <20260819094512.1153-2-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10051

merged

Bruce

