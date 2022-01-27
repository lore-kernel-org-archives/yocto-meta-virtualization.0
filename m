Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B95DC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 17:03:19 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.515.1643302998692812539
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 09:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8Ij3VYx;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r10so4560717edt.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=k5XmQWMGjvfT1GLs6QN0AXecvc7RGxJWKY0bXv6CWso=;
        b=k8Ij3VYxziX9lWfbQS3VEcjoQit5qaFLMHGxFzei2tVIXo3kzZFSl1l8gwTPtQs6AP
         iBm+Up7NNC96nDe5GBj/lciQ9fJlA0VfrijOurPxLKIaOee084nFoxD55PmD9V1Zne7j
         5RGSS2AaZCCHrD2u+w6Ki1l5TRU8bl8w/43uGvkfpLPjNpKa4xdO4BAl2vMpSwNXYUFx
         BwRznBLUZZKwUxfMRo/wAIGIBY47FSaMv3a1RxmCW/VZFVobFiagsMld4IVqcXIHYKDH
         Ne9BydbnbTcgdGvtH0e6ETuinexWHfJpQWZlKW0c3JTQauuuOu2a2KhILtwg7PTU2h7a
         OGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=k5XmQWMGjvfT1GLs6QN0AXecvc7RGxJWKY0bXv6CWso=;
        b=Me9a4wnBPsFIdGzLlS2DUn4ww4wb07SKz4r3/D5XkTszyihEeHGtjBDq5Dxhb4/3VV
         9UQHHHmGFJPNxPWlpvgGDPuoZ3eBWkd2oK5V7BH1GJFHYUn41pI+irYeCeKhSGY+0DgT
         5W9LqlKoTpPZUDf3tA6BO5zg71yqDD6VJ8AtvhgEVUr+C6M32YUBmY/RWrMjiCfWyzjd
         QFFkygbSqYVoei1p8tdIjlOeWajn6VMeSwaGy6guydcBCDCx5jyyHcFfwcQWv7M6NFYP
         4Gh7ejanTMQSiHN2Yc5dfnn5TMf1e4iVx8I4sLHKEXM7j3MYuyDdQ+HmHlxLrvblCWlx
         QBUQ==
X-Gm-Message-State: AOAM530bto0aDCnmLeelyuwkdlYMxhCIxMOR8rjTEjZdLY+11Nn9F+pr
	AKSTW3Nx+oepxUOeVazsH3bssEIkLLtViEYKw7wawCjG+WE=
X-Google-Smtp-Source: 
 ABdhPJwIGzIqedl46x5Z7FhuzLquSrnL/aTE9R7SgvH7Nys19S04NC4wB0fmg7xq1m6hX64P+rwpkdR4GHPJG+yf7Jg=
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr4412955edb.185.1643302996807;
 Thu, 27 Jan 2022 09:03:16 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Jan 2022 12:03:05 -0500
Message-ID: 
 <CADkTA4NOXAdTmLd0sGLvis9DW2ENaKZEPG3QfqZ_Pf37QcR0sA@mail.gmail.com>
Subject: heads up: incoming changes
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jan 2022 17:03:19 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7035

Just a heads up that a full round of updates are pending for a lot of
packages. I've been stuck working with the latest go, and the fact
that more projects have dropped their vendor'd dependencies. So if you
are considering updating one, it is worth asking here, or on IRC .. to
save us all wasted effort.

I'm almost through the plumbing and expect to start pushing tested
updates to master-next in the next week or so (well in time for
release).

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

