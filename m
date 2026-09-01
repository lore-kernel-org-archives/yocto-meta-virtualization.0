Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A66EC624D5
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:34:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8156.1788269653649953543
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qrlx/uNC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c207cb16cf5so790332366b.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269652; x=1788874452; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=qrlx/uNCT3QJEJaSqiuVsU0awl3ci46q1tlPzLWICE5zGB9ffMTewYTVkSNeNjRD8A
         L/Bta0KP9l+LyUuvG6ppsO4hRlvuJGBup+Se/oPoldITHIXnZX6R5B9vkkqjexvpMJp1
         uldtMDhSXP6fNnqI+7fgQA4DShyXcChg8h6BBwXGCQfekh2n5bUMtBZ9pDXT3nlXgQ4R
         UuQcHLvoJfVKzkJPPpG/vb10G9bVckD8pSTzDg8pdLwEdasNyqhTaJgolWZbY3mPrkhz
         ZVjrt3lV+d90j1fag9+PRvNq9npuao+rc38Wqa79nSFMnVH71j34MQoUmN1cCXvagdBI
         nrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269652; x=1788874452;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=r7GbLI3LdfJkLPPou3dKxCqX9ZMZ82tGcD6/SB+mfGefsMCOiGDgGe1C7N3YQh0B7I
         VhGbfM06R74b3F5geVu/fHCR7gkNQ51zJlJEh3Jf/poykiOd66k99d8639a38dRqUwd6
         KgFFBbSkoK9MVpgn5svqWcI1tHlyL6Bor6bjhRU8Ns3BOEZo8fYS/pnE29cQqpMgw9IB
         j2EJLeDic7T4PtyM2BXWRR577luMfzE04u5IuJ9H7HxlgHq1ijPAbixsTrtQndqzc8ZA
         UlWnEJJ4o0EP8NWkpDG98KqbTGfls4xdPzXBN7CcXLzZyrr39N7oZoR7PUdJRuT4qKnD
         yfLA==
X-Gm-Message-State: AFuF++nYnScAUbf2o1xEhQJBZinP5nssyYgJxtnmgXnUrFuvve+TE7Zk
	xQAQZCpudiixyJKHMAb75LAu4MuIfYlhERz3a20tuTLtE2xDsbSQlwOAICRVGhMg
X-Gm-Gg: AR+sD13XuMAzaa0+THMRkCxmbZV03IWnIb8C3//Beb9k9qFN25qMfaRKOaPwOwmruJM
	nrNg6fUYqTjblxoITnXp6E+Z7eP86ldVy+lrlguBkKZqpSNPPcuEn8dVzZrGY7ohTC9omFMMaXQ
	JqJb7qQ04DAh/oFPtlL2QJfkLIzN2lDFOeAEIfYvc0ka5GZmjUxFcC/Zw3FdMiLRsHnoNvEW9hd
	XrmJGdwI/oY20m+Y+A+mFz9gUjYFXsrH6E2xtcGjqVfpPN/ynkBCNoXTtUDv9TfwzRmgKmZObBk
	5TuciqV2aVsJjRo7Ux1G28eSHwitjYh+MBsIicGEqeHfd5In1ckLPws7yOC2+dhhJKvsaPJEHk5
	ytBldUQh9BLHqutTJ211Og0iCQO1jRPT1TOk8QMihfqtxo7BIAB8B/69IueqtBQ20TCK0JGmXXU
	5ZnMjaP6fpHbA9jqrQO77ID8ndtfcxJUq22DBVsnh4NVY7vXKv7K6yqBHspyu2LjLw8/Wk89xyv
	HiprKra/1slQd2ZXCD5Xkt4cSqu/bdSmxMcpHM9uw6hFruLrZ4krkYgMknCTSoH/w4aAV6bgDHg
	1xIjP4nxXs+rhiSV7m3Do5jUkEDDsE16QoSC5t1L4+9q/FdjYjQX/uxEHn4jDQ==
X-Received: by 2002:a17:906:b816:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c25b3d93374mr452699466b.24.1788269651714;
        Tue, 01 Sep 2026 06:34:11 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c258a7587cdsm379387366b.34.2026.09.01.06.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:34:10 -0700 (PDT)
Message-ID: <6a96d452.5483758a.8a450.c654@mx.google.com>
Date: Tue, 01 Sep 2026 06:34:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: devanshp@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][PATCH] go-logrus: correct CVE_PRODUCT mapping
In-Reply-To: <20260821050853.52159-1-devanshp@cisco.com>
References: <20260821050853.52159-1-devanshp@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10070

merged

Bruce

