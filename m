Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC739C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 23:02:34 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web12.9157.1660604546038121218
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 16:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FUqyEQCo;
 spf=pass (domain: gmail.com, ip: 209.85.210.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so6386813oti.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=d3SrqTqmbYjuKlmFGmqDvKJUWPyI+41XShtLdSAX/bU=;
        b=FUqyEQCo1jPcHXlroEpbC0Bm3qYSnEWX6aFo/csnqpCt7lURj0vnOQpHKOlEK3gk2o
         Nu1v2xsOiOCX+SUf0buyTeOwQFe8NMJrtYX7/X/cGplcP2u5TfT4EN5p3zpQY7BlNkRQ
         4oT1myqP+vsVgM1EAICoaiMXyx/ScB7FslxKvRzXIYpuTH2DhVIF7izwZRZT3LTsF69h
         capTIt2TostnF4nyeJ5ybJCk3QjW09ZhISQAelJqdF+0niKdWYKoSgBdywU84Ca7K8Zs
         G80GKG22K0vrJBXZ8vZ4rhhs+ImEZEkTpI5pmF/DKfq0vCcPBqVKqOZtbubG0sKApVWf
         rDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d3SrqTqmbYjuKlmFGmqDvKJUWPyI+41XShtLdSAX/bU=;
        b=H3tIXfwI7+hSb/9IzzIEf/1XGhMaB80hqr/yFvsV7MqTjvNy7uSl5U40FsVB8q3+EQ
         pIPVIzFyY3MEqsrkdLvlS8gXHkEHZiHbr5O08X5KN4T3+w0hptGgqhDMhdZQZPoqVoek
         7JSuNWNsBH4k5rqLAig+8wf5cmJ0JTXPpE2pWOKxZHuHoe5mbgEgwZuKhlDQej2T0O/7
         SvyDa41ax2KGOxUmLpDJ1rcbnpJj7f0bxrk2qOUKSeBUMvQyWxyf0t6+vo5nnSBmYmR5
         RRBbKP1mDwAGadGkK5RqRjupMYgq7ouhrf+xh7URsvRruwf/1uH2v3xveomSGH/TT3ls
         Q4cQ==
X-Gm-Message-State: ACgBeo0mTtSapX1Z8Y4SNncqePn3ATYhbT4WpzKmdOwmxM4oWELitaAD
	StgWWJWmj/6c3jxc8Kds9PhAlUGx7Ik7IabTDgM=
X-Google-Smtp-Source: 
 AA6agR4LCILJhfijN41HkCv9OTMRvHqSO5go8UcAXy40dpAlMSGwpwcq5QUtu7lz+e/H1p748dJGMv+2XeXU6vDsy8c=
X-Received: by 2002:a9d:baa:0:b0:638:98cb:d80f with SMTP id
 39-20020a9d0baa000000b0063898cbd80fmr3404748oth.190.1660604545247; Mon, 15
 Aug 2022 16:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <170B661D39CECA43.31461@lists.yoctoproject.org>
In-Reply-To: <170B661D39CECA43.31461@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Aug 2022 19:02:13 -0400
Message-ID: 
 <CADkTA4MSEVXxoxk-70-+1L+JT6c=rsOf=WWyN9sXQPOrU2y8Og@mail.gmail.com>
Subject: Re: [meta-virtualization] Request for test! ... lxc
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Aug 2022 23:02:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7524

On Sun, Aug 14, 2022 at 11:12 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> If anyone is a lxc user, I just worked through a sizable update from 4.x to 5.x.
>
> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=67c13e9ec856ed3e9af0febad03d29581dd1f0ac
>
> In particular, the build is now meson based .. and a lot of the old
> options (and patches) don't really apply to the new structure.
>
> I've tested the update through a basic smoke test, in a systemd based image.
>
> So now is the heads up to test other workflows and send patches if
> something is broken!

after updating my oe-core and other layers today, I'm seeing a build
error in the new LXC, not sure if it is also in the old.

So if anyone tries this out, and sees a compilation problem, I'm aware
of it and looking into it.

Bruce

>
> Cheers,
>
> Bruce
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7522): https://lists.yoctoproject.org/g/meta-virtualization/message/7522
> Mute This Topic: https://lists.yoctoproject.org/mt/93029377/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

