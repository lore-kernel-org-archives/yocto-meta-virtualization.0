Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC700C4167B
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 03:21:09 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.1852.1669778463188852208
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 19:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NgWOo8Od;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id i80so289919ioa.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 19:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O46T9ymaRUAiEtqlni1ogNybeXRqi9h7iBakDWz/dMk=;
        b=NgWOo8OdprcVPdwjCmwM6KPuD/P550DHOR6Lap/Edtv91V/MbbhVMH2g9so57e3Mkn
         OZVaHyAHuq2p+YX2rI7bnhcgHYA+vK5DI0sb4HVwEWqLvVRyQbYjaY5WYC9dDdx/t7Xg
         2Pr9d4s8TE54ZD3+k16Gptq0v1vis48ZbSBEaoOKAyQiDK4zDMTzkCbqpmO5zbzL5GKm
         lYcHUrcbUWdEQzbBUAPKJ7X78NzdqPgzaSDtMoF6/QAwmcs42O40PzSB9ldnrUn9qe84
         jkUYRjjBIYqdD/jhMu2KAUDZ1A7is1zA1bG5iG4LeD0mxYsjdcm7/W8b/rmIhIHNmPhu
         Z0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O46T9ymaRUAiEtqlni1ogNybeXRqi9h7iBakDWz/dMk=;
        b=vE6VGFEmeF6VlJS09peoUEulDjVLZPSsdZ6j1oYGx8y/gVVaEZ9K7xCHbrdsZNtUpp
         JI1sgBR243IT3VspfXkWy/qMWrUBYNRms9U/0ZfpMaegq/ZrRULVrK6er7dNncNhWMzx
         5MB6BBQRIPCmyW+Kg3Fuq+LbKEaZknjWl2TvsYfKhZPTib5LOACiBxXs4ZwdnTw4uAzS
         5rqPY9KknmVM81FYY5DYSVFs6k4cVIkGK7df+wWAQKkUwWqi0WuN/FrCCDmXeHNA+G/L
         bFh2B5bG4UYCLllJBbyZuYJ9l0w+iksX2V2hmwEFm5Oj9awtjXUbubfjOzayCeEs1Xtw
         Xvwg==
X-Gm-Message-State: ANoB5pkRMapaymcI5CEiTSYu5z3+UQ24fBqONjlHnp6f7aU0hoC4bJbQ
	siFAQwxJb72O1aNEg1+hwH/KAbIrhvnPCtwgNUE=
X-Google-Smtp-Source: AA0mqf6Jn+DglRBHoteq9vIC2HMOYKUgF7GHL5Y+hKUJlKGu6iPRtTg+oVQZl7f/SuvznR65SkBfPoBQFaHwYGQQ4Og=
X-Received: by 2002:a02:6d53:0:b0:372:f7ed:9f78 with SMTP id
 e19-20020a026d53000000b00372f7ed9f78mr21640014jaf.245.1669778462362; Tue, 29
 Nov 2022 19:21:02 -0800 (PST)
MIME-Version: 1.0
References: <CAL5F+oJ78-LCD44FjQrJzrjrVcN2m1bCqUv746HFVdMFuUvPgw@mail.gmail.com>
In-Reply-To: <CAL5F+oJ78-LCD44FjQrJzrjrVcN2m1bCqUv746HFVdMFuUvPgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Nov 2022 22:20:51 -0500
Message-ID: <CADkTA4OBu7UNq_mHWf8WCzW0Sev8Y2b6yGag5maCJfqzy3b_iQ@mail.gmail.com>
Subject: Re: [meta-virtualization] k3s (kirkstone) segfaults when run on hardware
To: Anthony Davies <anthony.t.davies@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 03:21:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7707

On Tue, Nov 29, 2022 at 7:28 PM Anthony Davies
<anthony.t.davies@gmail.com> wrote:
>
> Hi,
>
> I have created an image that includes k3s. When my hardware boots and I attempt to execute k3s straight out segfaults, output from "k3s --debug" and no logs are created.
>

What are the details of your hardware ? k3s is running fine for me on
everything that I have available. So we'll need to try and figure out
some differences.

Bruce

> On #meta-virt it was suggested to try another go program on my image, I installed "go-helloworld" which runs successfully.
>
> Regards,
>
> Tony Davies
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7706): https://lists.yoctoproject.org/g/meta-virtualization/message/7706
> Mute This Topic: https://lists.yoctoproject.org/mt/95348603/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

