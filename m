Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE561061B20
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 19:48:41 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4272.1774900119950227620
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 12:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QRDsH0Bw;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a08fa355a1so22496816d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 12:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900119; x=1775504919; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/Fmz9MqV99nQqyZGFfwsNFBY5v5fbca+ZCcr8J3PDA=;
        b=QRDsH0BwDtBa8hMJGNP/byQxqrDdAC67v2Oyb33btVCq2mb4gET1k4SxQUaBOxmwlO
         4/tG0MNY4ZQeVXDNAA50Ijji2IikjeLjNmy3mYUNps7KI2hxAwa/Kvi58ApqGV2pBzBa
         RN4wIWu4eEvyXnxi2EnRY9yVmDM05OQi9qWq8f2eHfcJmS8UAC3pe4/0L5/1XgaqeQ3C
         im6d28dXZCRBGQtNZB1Y51K4/ln3FshYyqOYae9soFEc90znO3S7yvL9QBZkOjAR1CTs
         vTYiRqWqOhToHWrSIRGr/rosd8foeYvcLM09UrnfVjnmsYhTSP+d2ppxaw4AbZ8SV07k
         CRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900119; x=1775504919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/Fmz9MqV99nQqyZGFfwsNFBY5v5fbca+ZCcr8J3PDA=;
        b=Tf9hWFXiQN35XdfZcOdOEY1e9OGCr7qt9WQ8ZWzmYcTRu6Ti7oPqxJ+6/5lCKChKli
         S0Jh92gTnzTF5X6kPDxobIl4z+RdZwL88Q+fnhzPmlVL75rDSk84uBaLOC7MkMSAWp2u
         /z8v4DySDe1BYsgJ7nsLjjZTWb96Z1ureBS37AvKSbRIn+4pKjXUlBurSmgvPNbGteAY
         bJhGqEiaXajGkt+TSvfj06ERGhlToZJik38cqq4dlB/wgYRwQWVjkwe17+APYGPsR7AL
         kUSpcFjrjPAhFGU+I4fau4HiZ/a+8wjNijZIPZOSVWgbMgtv2D/yM4+FGz3MN1KSKV92
         HfTg==
X-Gm-Message-State: AOJu0YyipSaHmTTfQYT6z9sZY5WVr/U3qIMsSkscyvJKAIVE6PKxh2wM
	VB+ybUh5DtF+tMWw0E8KpV6/LCZgG2Ti79dyfdQH8/0Xp8XFQjP1qSvb
X-Gm-Gg: ATEYQzwu4HA7RXgS2gdNf75wMFan3mv985yHzwP9RNgwt7qPAaZopvNtgmVDXSwx3dK
	65CzJaNpw8xckmiiB+qLKofQFJYNfbnoY8va8JKjNxa7RU5tQAFEAQbGnird7YwA1fDIldpijvn
	XzJQzXHHaGb0SiiEeKIbwyGxoQLvFt7sWq8/eY1yyv2xmlyy0mHjnTP6SGkro8Hf4aII1eFZWUM
	sU+IM5Lp8XYX2fSGQSgZsv9rRk1NDkyCoBcFbH4BKqLqDl9tfxQ9BXmet65I0IfkTt4gkUkWA4c
	ZuemnJQB3aVUGU17tiPWdb3iZ5RoxaNMW5VT/PQaxkE+KecIteKfNw0mX29hvjo2CxRKqvHqGqd
	sZXVOkEGTLts8tAF14F3GGzrEGmIXsuCqbotMKQrP6zkT1QfcEC7GKZWdnPgjfPYtn9szTmpluQ
	qd9+XBYlNaFlPYzMUE6ElFXAcSG3eeSV1TiA/HNUbrrp6y09f8KVnBMM81PEA3diOxnKXqEOWZH
	zS2pIROxzqN1ecRikZ4Mocb9eSPiMFS5OZr
X-Received: by 2002:a05:6214:448b:b0:8a0:e086:64d1 with SMTP id 6a1803df08f44-8a0e0866876mr81004016d6.53.1774900118667;
        Mon, 30 Mar 2026 12:48:38 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc1923c6sm72228146d6.22.2026.03.30.12.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:48:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:48:36 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jonas.gorski@bisdn.de
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 0/4] runc: update to
 1.1.15
Message-ID: <acrTlFWe3YF8dX4l@gmail.com>
References: <20260327140640.126833-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327140640.126833-1-jonas.gorski@bisdn.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 19:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9685



In message: [meta-virtualization][kirkstone][PATCH 0/4] runc: update to 1.1.15
on 27/03/2026 Jonas Gorski via lists.yoctoproject.org wrote:

> runc has been stuck at 1.1.4 for long while in kirkstone, and the last
> attempt at updating it had to be reverted.
> 
> In order to reduce the amount of open vulnerabilities, update it to the
> latest 1.1 release, 1.1.15, by first updating it to 1.1.12, which was
> the last 1.1 release in master, then updating it to 1.1.15.
> 
> To keep the amount of patches short, I squashed the cherry-picked
> updates from master to a single patch each.
> 
> In case anyone wonders, runc-opencontainers and runc-docker were at
> different commits before they were both bumped to 1.2.0-rc2, which is
> why their diffs looks different.
> 
> I runtested runc-opencontainers, and compile-tested runc-docker.

Thanks for the extra details, it made this much easier to
merge.

I confirmed bug/cve only in the 3rd digit bumps, so this is
now merged and pushed to the server.

Bruce

> 
> Jonas Gorski (4):
>   runc-opencontainers: update to 1.1.12
>   runc-docker: update to 1.1.12
>   runc-opencontainers: update to 1.1.15
>   runc-docker: update to 1.1.15
> 
>  ...spect-GOBUILDFLAGS-for-runc-and-remove-re.patch | 14 +++++++-------
>  recipes-containers/runc/runc-docker_git.bb         |  4 ++--
>  recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> -- 
> 2.53.0
> 
> 
> -- 
> BISDN GmbH
> K�rnerstra�e 7-10
> 10785 Berlin
> Germany
> Phone: +49 30 610 816 100
> Managing Directors:�Dr.-Ing. Hagen Woesner, Andreas K�psel
> 
> 
> Commercial 
> register:�
> Amtsgericht Berlin-Charlottenburg HRB 141569 B
> VAT ID No:�
> DE283257294
> 
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9677): https://lists.yoctoproject.org/g/meta-virtualization/message/9677
> Mute This Topic: https://lists.yoctoproject.org/mt/118535116/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


