Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1E1C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 03:12:48 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web12.12497.1660533162987547390
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 20:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eRKx1GMr;
 spf=pass (domain: gmail.com, ip: 209.85.161.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id
 e2-20020a4ab982000000b004354ba9a591so1164155oop.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 20:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=R8JxyS/2sTQw2dimRoVlKH/4wfVSHsW2NmFAoEbBbPM=;
        b=eRKx1GMrOJuyj6baPfgs3JHuMyCn9uk+BEYSAHsxVbfIfqYLjfpqOe/+3xMKPPXPkF
         2Ff0U44J4pQhSyxUV+pyABsVqMXDThu+uoXZl6bFKCqOpFmgMct90G2lzXEuoEoHuCy1
         NQtEBGj7y1CjssjLmLszOYgPNY4M/GHfMaRd7/DPrJ1GKKmlUIfxPjXlsPqw4WneIdAx
         I2rLpyd67jh7jZ49mPLEuogilif5tQ+IiPP7Chq3yYkL7ykiXGGkI0Fdq/OWyNvPggFT
         C82W9VVH3jv08/MdvqeWMih65SgyqqOQtuEFi0qI1Y51RvIhy+chf/ADEwfiraaBhpgY
         RyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=R8JxyS/2sTQw2dimRoVlKH/4wfVSHsW2NmFAoEbBbPM=;
        b=QvNOsWeiYiM+xCB0dv8qmUpwZHITQPGuPnTMsjzsMpaK3sOog4xdFUfQC+35HYZ/Ks
         /Rk+gz0+0rdkcjIgISer6MdTvmaUqU/4TggwtESvAuiQ8GMmbzs2zrSFurHxzJsMiWVV
         zRRSN3HbpTs1cJcNvsmdX4ezoPMOdDNSVlQ8+RG66XzLBOG0q24kjf7ydq6aP8umk3k6
         8CeA7DSM4vwrADCU3OqIiroH4cjw+xkh9WPaRzvSXCgI5F64R7jl01yoUV820VYkPtgi
         LQbg0unn9YjVd8uuuxZ6NJaXwo2pe4h1QUMEFW6C5IGtojFdYdawP+7AxDcUujxZTEJB
         XYxg==
X-Gm-Message-State: ACgBeo0roHMceBmJppJRiGNN36KkWC8d7hWapm671voZMVkoYbow8N3y
	9uJ8KAuXh/6hwoZ7S7VDbCY+e4Yj40Vk3ltAG5gEU6pNA8o=
X-Google-Smtp-Source: 
 AA6agR5ji1xzOoa6NWeX4GASL/ybaRc35C0jkMChUYUctKeMlEkk47H89ErXlSasvx2BOJRXErCsWoH7OeMbJtXlH9U=
X-Received: by 2002:a4a:434d:0:b0:441:9b4:ffad with SMTP id
 l13-20020a4a434d000000b0044109b4ffadmr4274268ooj.31.1660533161463; Sun, 14
 Aug 2022 20:12:41 -0700 (PDT)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 14 Aug 2022 23:12:30 -0400
Message-ID: 
 <CADkTA4MPeiP0Qj_pmTJQKed+c7J8Ju-YdySXjFtau9cwcQKz9w@mail.gmail.com>
Subject: Request for test! ... lxc
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Aug 2022 03:12:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7522

If anyone is a lxc user, I just worked through a sizable update from 4.x to 5.x.

https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=67c13e9ec856ed3e9af0febad03d29581dd1f0ac

In particular, the build is now meson based .. and a lot of the old
options (and patches) don't really apply to the new structure.

I've tested the update through a basic smoke test, in a systemd based image.

So now is the heads up to test other workflows and send patches if
something is broken!

Cheers,

Bruce


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

