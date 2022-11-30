Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE3CC4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:08:20 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.2668.1669781296231424440
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 20:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U7p9Y9K+;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id 135so28486iou.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 20:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/pqNZHRiKrWH4/+dH/DT1ZDiOhPZXCmQ9Ded3pkIpPw=;
        b=U7p9Y9K+uySrIMb37BrYbzFJiO233F9AT9tTW47tM7vjZqdwO7Zq0Cdqf4dyPRJ/Qv
         ovzWzmKydyV9a5fPpe/8AmVD1lMg68Ys3z/OGX40qZlJLmIp10+4HtoM7Zb8X+KGuTEr
         QwLAI2thrdWvU4eu7oXY+PYdTeHLpv76Ka4kDhRhSZIW04N+mBaQ4q15vtSB29B8wizM
         1cVtey8wBph8XPEbXIvwO52WVY7TKaem92B1hhmygdelqe4h+LJQkGJXmBtRK2fvJuhk
         i30isThAXggOWo5ZWZKpB50OEPpADykehGgUICIlJXDK+m9AyUJ8BckVWbT5y3HUl/BH
         XJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pqNZHRiKrWH4/+dH/DT1ZDiOhPZXCmQ9Ded3pkIpPw=;
        b=IxhskA4+AKKfJYVQe6/Dwez9+4HEM3t/LZmFzUZozAefGUXB2WCklu5kaEhAPwb5xo
         5hb3vu6mXxiUx6tu/1H32k5ih65IICq/zzpcfrhDj94XX0NUd3usiccAafiT279mXKsH
         S9y3zpXLvWN29CEoWB6uiR27V6Vlb5CkhZAAORhTcV47eH8Wo/OjwNPpBEF1MINfZGD7
         qaE8//76nkfRyCoG2NQmqdiRtMkU29x3L4HKWcORjzJxDANnV1+3xZSu/BbejPvxXI6F
         bZQU/XEol9cooagaaPJgml+CpxrKJ0GwFMQ15PxExa/utToGSYqTZ5zl3rprravc8VpK
         PHBg==
X-Gm-Message-State: ANoB5pmoi+TAWc1DOmn918liNOVDpwLLNpt6uys3vUXPW6HqIUzznCkC
	Y0dvg6Ml4TruoGmr7mFKcgoQeUci4StOVBnaIlA=
X-Google-Smtp-Source: AA0mqf5IxbCAXZ5EGavtX/iGrLh/aBQVcyoOE6RNrT8jOW34Z8EmK7iA8sn/D8Id87OcRqn4JUhvt5SqZl86EigHn2w=
X-Received: by 2002:a6b:b487:0:b0:6df:c0ce:74d5 with SMTP id
 d129-20020a6bb487000000b006dfc0ce74d5mr306609iof.99.1669781295485; Tue, 29
 Nov 2022 20:08:15 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+o+wXUrREoX2N10ks3YDMmACex+xYi3d9XewTns==BntSw@mail.gmail.com>
 <CADkTA4MoryRn=OOOQL7j0BHkjrB5Tyd35T+=f9=AA7YOqfd32A@mail.gmail.com> <CAL5F+o+VmqasZyrpBpaP2xjdfF+Z8SWGebrJzLLKDNvzo88_Xw@mail.gmail.com>
In-Reply-To: <CAL5F+o+VmqasZyrpBpaP2xjdfF+Z8SWGebrJzLLKDNvzo88_Xw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Nov 2022 23:08:04 -0500
Message-ID: <CADkTA4OV3Gi28DKamNKHaK3veUEM-bvzQH1HSV533XvvkRJtZA@mail.gmail.com>
Subject: Re: [meta-virtualization] Backport Repo branch changes (master=>main)
 to Kirkstone branch
To: Anthony Davies <anthony.t.davies@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 04:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7711

Cherry-picked.

Hopefully it works now!

Bruce

On Tue, Nov 29, 2022 at 10:56 PM Anthony Davies
<anthony.t.davies@gmail.com> wrote:
>
> Yq is the one I had issues with
>
> On Wed, 30 Nov 2022, 14:21 Bruce Ashfield, <bruce.ashfield@gmail.com> wrote:
>>
>> Which recipes ?
>>
>> I normally port all branch changes as far back as possible, but I may
>> have missed some.
>>
>> Bruce
>>
>> On Tue, Nov 29, 2022 at 7:19 PM Anthony Davies
>> <anthony.t.davies@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > Is it possible to backport these patches from master to kirkstone?
>> >
>> > I could do it but I am not confident about submitting patches via email.
>> >
>> > Regards,
>> >
>> > Tony Davies
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7705): https://lists.yoctoproject.org/g/meta-virtualization/message/7705
>> > Mute This Topic: https://lists.yoctoproject.org/mt/95348458/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

