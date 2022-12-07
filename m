Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC952C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:42:22 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.22407.1670434941617305283
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 09:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OhMIYs06;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id z144so7943754iof.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 09:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UsOiCPhfb/PDaK6ztOcwQzdhZ8qhIe2cRe2UR4ZFN20=;
        b=OhMIYs06ygn5ZrYdUvjqrCd85FesQbLQUNprZ37Vk0l6AGexUJ/euRKqRyIKvgfGHT
         zTveTDuC6aD4fXcVvh4GFPqdJjCWmTxJ8QUYdeG16AAWjKLoBpGDMzy+mBqyeyx0n9gt
         8IuLQ1hXM/n+JNsGJduqU7p5LbvNar0KSO1dcQdznphq2S/3NWtiuVQfRoW/fqPFxZ4E
         L3u+sHvZ5ECA7e/eQjp0yd7qtg/3AVKxrJuNtFzkbHiHN2cRQcaa2Y6GEfujYAd+h00O
         TJ64mIEi9FU2x9U68A7I6xIxzkYQ8nPcm60/PKjQG7Iqxi87a7KX06UPDaWMcDs6ONAK
         NrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsOiCPhfb/PDaK6ztOcwQzdhZ8qhIe2cRe2UR4ZFN20=;
        b=tHyFBB8CX6S3Qnz31z1zUoJO06EvSaL0en8aGeXCTnrpE3QM9nyQ7f72TBBr7TT7nZ
         mpgwu0N3cXTn9I5LGSQM1Ryu9+vTeMVODaDb2pQO0vy1JxsVx6FDV8gf71t3cwuQ3WXg
         Zf5JUXcJsXvkr/sWGPDHYDIIJn1clo7/9nOeBUj6fwWUU0Wi9nsHa8Hl1FvP/vYYeYSe
         RfudnqbyJCDx3eTDi6tw9fhP2BpfoyM2SgQNSMfB9vtKgcAbeye4lN3PF4dZjcjfagxu
         do9qof5fb+Go5fRZvJS3bqbSOUyJBxGvh2m9aKxJgqNv89Dlsy7tF5uCrgfUXRhYhsSv
         gjrA==
X-Gm-Message-State: ANoB5plo9LM7z/JLDvFWI0l3+woYz2CSKd420I2ueKMYCFPjONMlF7xA
	4dv++Vv+ldrbnjvfdWE+cLh45mLZjGwSy1kOVEk=
X-Google-Smtp-Source: AA0mqf7ZqAt/1Vk9ujk1GFgrpP0TtMmjmma37BwMCvlzrP44iyF2fAjok9Kw8Er/tjjP0o+dwv/DZZOLJuVuxbjAH/Q=
X-Received: by 2002:a05:6638:4103:b0:375:1a70:9c5c with SMTP id
 ay3-20020a056638410300b003751a709c5cmr38986916jab.129.1670434940925; Wed, 07
 Dec 2022 09:42:20 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MN2zsffiyVtYx_DLDutMW-cHon3LbKASbOdCs22wwauQ@mail.gmail.com>
 <10752.1670433336167964170@lists.yoctoproject.org>
In-Reply-To: <10752.1670433336167964170@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 12:42:10 -0500
Message-ID: <CADkTA4PUkWx2LP6NPaMSCHjQfGe3fGqVeE56comKeSqwM-4Caw@mail.gmail.com>
Subject: Re: [meta-virtualization] kvmtool patch error
To: nathan.fisher@gd-ms.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 17:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7743

Hmmm you must have something different in your environment.

It patches and builds fine from a fully cleaned build here.

At this point, you'll have to send a patch to fix it, as it is somehow
unique to your setup.

Bruce



Bruce

On Wed, Dec 7, 2022 at 12:15 PM Nathan.Fisher@gd-ms.com via
lists.yoctoproject.org
<nathan.fisher=gd-ms.com@lists.yoctoproject.org> wrote:
>
> I just tried a build using the master-next branch and I got the same error
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7741): https://lists.yoctoproject.org/g/meta-virtualization/message/7741
> Mute This Topic: https://lists.yoctoproject.org/mt/95519084/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

