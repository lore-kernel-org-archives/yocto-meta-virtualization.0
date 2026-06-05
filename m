Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6094CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:31:58 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.712.1780630310141902053
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 20:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e74/NO2D;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91550dfc11fso163121785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630309; x=1781235109; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbZYdGuSkZEMJ5zAEGoAqIkMLqKKcXFTRtHxQgm345w=;
        b=e74/NO2DDeitc1kGeFMcKZHJm4pw+jRZ/J/9fc7HJzamyxQ4KB6LKhLVyz7hkfjQIM
         ybLAX4MeEtNgiKLIc2Y/GyVbzyraXosPVPfS7UEkFfc7RjrYpIgw7HWmiQYqy78zVkmd
         ezyfEopWJIspGfCz4oPE74RRPG3/FDiPl/1sZwm4Y0QfBT+Fg8mS6tL1aESbAUSdXoTE
         AOSQcfIgTxlxqdW4F79gBedcti0BN/J7/ugT2fY+/dUjaZYcHlXsIosU6bZGfoheS8M7
         Rs73X5AmaMOt5b6BjraJr0DcKiLZHR99WNObB48OrIDbobVbv/tmcSitDIDC/jeYkpwX
         xInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630309; x=1781235109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbZYdGuSkZEMJ5zAEGoAqIkMLqKKcXFTRtHxQgm345w=;
        b=OfG3vAWCM8MR+PVSS9B3lMX2Adfy5z/AniyDSMpJVpy9e4/usMq0ywWTXhE30Wbmrp
         iBg9nWVGLX43MfaBr1pKUXgu4/AmE+cOqkM5Z+e+4szP6WqC4lPIFTxxfQ0rv28Ms5D1
         iYb/KcPzveUmKJKexQDdBqUvsmxeHKWAuM3pnWod2d0ylp5A5NAu+WLmTc9ofydSH9Eb
         kBZHMTWqlRHBotJssQ3CtZAaq7iyMp7re9hHcIfE9CbU2fxh+HMszxk2bGLzPCqYGWhE
         w1grKOLxXbHma6URhG8B/M4KWArC4OWo95EW/opDGms7tn2y9k25bUM3rh6kTGlGIiZf
         VfOA==
X-Gm-Message-State: AOJu0YzuLfUCQ4f29rah9iivGklFfhSu8+TXjozaUZ8IuStzRPtDPNf9
	7LGzsAsiNx7j7V2dzxJdGsC/h0pGGAVIE95Xks6jNE4oZsvENFyFodUF
X-Gm-Gg: Acq92OGG9XAgnsyfV7m/Uqk1kaVxWlBOiuI2ya/z6378wgZ/sFYkZyOamNesNr4oZwm
	6iNRL938XdzoH+u1GroOcVnkSo1QMEunXYQb/nVxkPF/iwy0vFukA0P448+kw8thrLkbpS1/uqP
	GZICHfZB97JeJAog42TpPejEcH0Rh8HwaMWvgN1B4/EZx6VEYUS7T6rivrsHjVi4bvNBlqZclai
	4zihR8cgfMWmw7hZrq5faTm4Btu3mmKkvu952dozMMd9zkX3TtTO6HZRwxUSYRlPITQH4FCRjWM
	bqfUtdJ2nwv/r46mpryiqfeNx4bVTfrkF+RJ9upkmbaFirZOBTa+t/mT6L5HQScKgt8mPW/99Rx
	AgbmaeP2JgbQ5/1z0a3fBGCHh+20oBkGxYzXGh7m6LD3pxbZ9e0yvO8x37TubhP4pjBsbPWDypZ
	tNtU0rVcUGhqkgEDPWZk4DNRkxEaDnkVt3Vh/eeKPd8uBw+oK3VfZxSztu5IWprPq7Is6mvtM0L
	kjDl2xKQZ+kyfsrqJmNE1HRe5VXFkiSxORoMJF6JHFE7Gh536vX3xik3BFpKWS2R9y8TsnFTgzN
	332b6DmQipFE2Y5jJenFzS9d7K960Blv
X-Received: by 2002:a05:620a:410f:b0:915:8502:f7fd with SMTP id af79cd13be357-915a9c9afc5mr366705585a.17.1780630309069;
        Thu, 04 Jun 2026 20:31:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3c764asm781573585a.37.2026.06.04.20.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:31:48 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:31:46 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 0/7] Container improvements
Message-ID: <aiJDIinJWZhO4Jid@gmail.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2026 03:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9853

Just ack'ing the series.

I'm working through issues with the recipe bumps right now, but
will get to this shortly and have a closer look.

Bruce

In message: [meta-virtualization][PATCH 0/7] Container improvements
on 29/05/2026 Tim Orling via lists.yoctoproject.org wrote:

> This series:
>   * Adds a class to create/run containers with a non-root user
>   * Adds new containers:
>     - app-container-python
>     - app-containter-mosquitto
>     - app-container-valkey
>     - app-container-nginx
>   * Modifies app-container-curl to be more like the upstream
>     experience (and more like the above containers)
>   * Allows meta-webserver/recipes-http to be parsed for
>     vcontainer distro so we can build multiarch containers
>     for app-container-nginx, etc.
> 
> Each of these containers was built in a MACHINE=qemuarm64
> environment as well as mc:container-amd64+mc:container-arm64
> multiarch environment.
> 
> The resulting containers were tested with simple command line
> usage compared to Docker provided equivalents to ensure the
> same expected behavior.
> 
> Tim Orling (7):
>   classes: add container-nonroot-user.bbclass
>   recipes-containers/images: add app-container-python
>   recipes-containers/images: add app-container-mosquitto
>   recipes-containers/images: add app-container-valkey
>   recipes-containers/images: add app-container-nginx
>   vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd
>   app-container-curl: use multilayer mode; container-nonroot-user
> 
>  classes/container-nonroot-user.bbclass        | 68 ++++++++++++++++
>  conf/distro/include/vcontainer-bbmask.inc     |  2 +-
>  conf/layer.conf                               |  1 +
>  .../images/app-container-curl.bb              | 29 ++++++-
>  .../images/app-container-mosquitto.bb         | 46 +++++++++++
>  .../images/app-container-nginx.bb             | 77 +++++++++++++++++++
>  .../images/app-container-python.bb            | 57 ++++++++++++++
>  .../images/app-container-valkey.bb            | 61 +++++++++++++++
>  8 files changed, 336 insertions(+), 5 deletions(-)
>  create mode 100644 classes/container-nonroot-user.bbclass
>  rename {recipes-demo => recipes-containers}/images/app-container-curl.bb (58%)
>  create mode 100644 recipes-containers/images/app-container-mosquitto.bb
>  create mode 100644 recipes-containers/images/app-container-nginx.bb
>  create mode 100644 recipes-containers/images/app-container-python.bb
>  create mode 100644 recipes-containers/images/app-container-valkey.bb
> 
> -- 
> 2.54.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9826): https://lists.yoctoproject.org/g/meta-virtualization/message/9826
> Mute This Topic: https://lists.yoctoproject.org/mt/119557384/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


