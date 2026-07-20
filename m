Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50ECC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:40:20 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9100.1784583610044848513
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eWqQjUa+;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59cd803792aso6323581e0c.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583609; x=1785188409; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=eWqQjUa+yTyyVdUeHU1paW9UIL68ROE9iiSxiec1ir87zMhgDt3WEm0ohALabtIpM3
         pxcs0gZFFXdYxxYEw/5wO69+PTMnaLMybwvbQK5gi4KzEs4JKIuOEZiIj6GwpsCjv0OF
         Pk/NxVzFiSSDEb+577DO6yST9gxgj6w89favSS7VPc+Utqs82DzPAXpXqYo9FgOfD6cp
         sGFsiqykElXd6eVOj8bVbX7BMbQwrNClB2xp2R+kpZefQKP0LJ9Omdz9Cqb78e7S5RMc
         uucKDOtDufwpyHPEvI58WIfg6KRKRdnEOGBevq/ZacAW9ixZfHa84DkQtOf57yPnL6v5
         PEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583609; x=1785188409;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=B7wYJ24Hvhb6p73u37s9MWiY0b1lQx+AdaKsAl9Zm+s+TFQDZ/k3rgUOLr9zP1xY6S
         G9m6Eb95n15Rbx2rE805rWceHNJ711wVg6mJal3ZLFsOGNMhvHrhoe32Sd98njU7yXoH
         bAiZiYEbMdIY7KpBiOecO/v3Ge8LSGxFCluD9qWGkeW6VLlt17JnGKMVI38LTkoAotY2
         M4NIgh5b3ghgnRxTNgsvnvWKiEjxJiTsmNA8g8+juTtKhvtODcqGAHHHKNSBUPFHlU9t
         Ei9faNczS+QQl5yHh0VG4PO5Z1Fm6YMt5wD1nSqohIwT55h3ciT9XvO6VZzMjFVQRSgA
         jzLg==
X-Forwarded-Encrypted: i=1; AHgh+RrHrX/9M8M5ZyHNLbFDb65Zcn7QXolLDrKP9CfKv7kCKcd+oCGDFkcAyPbIGgZXQ5HhZ5g2Xtyd3mJRB9eHZZWxswmA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz0T+JWe/E8Ro7AwX82kr27fidnRAQEHgA0zSj93Z4jCxxoR0XL
	wif3sOHjM5RH8DpyM1K9eKcGVS5cnmEYD6mbqwHxLcIC0DdgxNHDdHMJ
X-Gm-Gg: AfdE7cmD93xxR3bewxdWqL0YO5+CYkjqXrpIuEo4RLCfHYyDoma2vLuSIkCuHfinoGs
	5Lc2tcoB1yhWQaySjValYW11Z19JjY95RqGQSpvtgYZSIySuV3MoyYn+yxFFAhtdXDLKkSARWIL
	i+ceik7DBipIDpvzqh7bw9bQ968SbUI8HNSHbGzIqDQa9g/NOcMtrEz7APWD9FYstx9ZjjQCW0N
	wEaqmA7zJnRiQ9Gpby66ZTfIfza9J+1yZfzb69om/9ybCy9x0BD0Evxsvm6/JUEuxLGO2ojU9i3
	EavDoMkVunROfBK7IM8c1ndgUYfNZ8sa2CVH+7xyi6BnmJWTdrw1RcMzRPvsIgA720rf0FyvqJZ
	+DozhI3clDQeFRY9Imu6ghGJI/r6j63Kl2+R5BGWaCAp/qzfqtvIEUV13H+qSnbBqMr3a1YHD7C
	TuwgcXRBh7pMUtjHsx04tnoG93/Bn5lp4R5Ug6tIED0jtNKpXGGKWjxjTVB8XPjrtE87osIg/HC
	DfNl+JfsDBUIiqoelaozfNKI/iFT/Js1cf4YdUsz91RJYJqidpxSwwlwnvvTr0wroZthUv807je
	WNdOeVZTJscVhA==
X-Received: by 2002:a05:6122:e182:b0:5bf:8469:c7a0 with SMTP id 71dfb90a1353d-5c1b652cc91mr4488549e0c.3.1784583608803;
        Mon, 20 Jul 2026 14:40:08 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1f6c72d73sm10515058e0c.17.2026.07.20.14.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:40:08 -0700 (PDT)
Message-ID: <6a5e95b8.4dd0f610.8ea44.c77f@mx.google.com>
Date: Mon, 20 Jul 2026 14:40:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] crun: set status for CVE-2025-24965
In-Reply-To: <20260719204812.449816-1-peter.marko@siemens.com>
References: <20260719204812.449816-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9971

merged

Bruce

