Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6A5C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 02:46:49 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.141291.1698633998789080745
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 29 Oct 2023 19:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mc4LdOtS;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso14229575ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Oct 2023 19:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698633998; x=1699238798; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FlywW56MdAeg3HClAHIeYYarzmt9YaPsX8oktBZ93A=;
        b=Mc4LdOtSff2GDWXE74qOHhAhuPWWr4xg2vqtU6pfcx6WaMdsAzlqfFXaoq2qHsGJiY
         soPIB8WUnBqFqpXoRVlWgPbmNdsniLuf/SDYxixysB8sUlj2LKFjqoabDhu/CEMyjHln
         mCzgjMGeXrXd1z9CbCkbUvX8WcaPckAVYAWXrSGzr78BOkZS38greI9NYPz3sDtfXiwa
         3vcZGfKea3Yya1vGuHhr1ho4RNHOFLPdgNjejdl4L9OUxtCa7jWyayb/311XSvnkNtf2
         c1LfrEz1m0WWnqA7sfPTRusLE62P+oXKMBjtOacxWO08l4bc2fsBdIFIkDK2FY9KbsPh
         qZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698633998; x=1699238798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FlywW56MdAeg3HClAHIeYYarzmt9YaPsX8oktBZ93A=;
        b=jQ9OSffnJF0u4UtJL/TEQGPicT+HY7nkxmsHNsF1qDq9PhBweYoSmnCif6dFTH1eDF
         tA1Ota7gfwv7yL4reu9CQeg+zIFDLToygytBcXAEMQA8vyolrIh4cS75gzOlZOuGjgE0
         NrDiMOgLVI8HlRCn2/F8vMprYE2GrYBJvwuv26r2Ypl4f7UAjv9GFUAOn2goHc1v2xp6
         RstCOvcV8oUlapqFxx8S+06aGk62nIeqmcCDPZtLIHaopqevMVYeyidHop6OxH4zuPeM
         gUWlV6Mi5odL+YiS3gpe0AYYRqnEUgK48xWGVLp/9qApTglyIygoUJaWTCMsSfhYkGBn
         rR1w==
X-Gm-Message-State: AOJu0Yx5wJqqUpLGtOujI4nnF5HW0hrvAwGvoL/j/zs2voSiFb/vNk4Y
	uPtt8PB9dl+a3uN0H9KNpzLYHNfGui5r4FKX++FMXRir0AA=
X-Google-Smtp-Source: AGHT+IFlxcbF0DpQSHrYS7ycgRuigCgNIsgWvvDx6ookeIHJ0EtuR2DdM+ZE8oRuAvHpiOuO4mB4B0rqDQZBvqs5yEA=
X-Received: by 2002:a05:6e02:1c2c:b0:351:4f0c:b95c with SMTP id
 m12-20020a056e021c2c00b003514f0cb95cmr12356610ilh.24.1698633997904; Sun, 29
 Oct 2023 19:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhKrJ3FEs2Fo0D0gY3UNRMZ4tm3gR5L2-7jMtckWgoviJCwSg@mail.gmail.com>
In-Reply-To: <CAAhKrJ3FEs2Fo0D0gY3UNRMZ4tm3gR5L2-7jMtckWgoviJCwSg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 29 Oct 2023 22:46:27 -0400
Message-ID: <CADkTA4NGWaGf_naOr59raA5M2EDXj3shCXsB_GrmWoAhiHyTxg@mail.gmail.com>
Subject: Re: [meta-virtualization] dunfell docker builds broken after go CVE-2023-29406
To: Dan Walkes <danwalkes@trellis-logic.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Oct 2023 02:46:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8407

On Sun, Oct 29, 2023 at 9:37=E2=80=AFPM Dan Walkes <danwalkes@trellis-logic=
.com> wrote:
>
> Hi Everyone,
>
> I've noticed that dunfell docker-ce builds are broken with the latest
> poky dunfell branch when testing with tegra.  Full details at [1].
>
> Attempts to start any container fail with `http:invalid Host header`
>
> I see a relevant discussion at [2] which mentions docker 19.03 from
> the dunfell branch no longer being maintained, so it seems unlikely
> the fix at [3] will be backported.
>
> I have a workaround for the time being to revert the patch at [4] in
> poky but I'm wondering if there's any better suggestion/option for
> dealing with this on the dunfell branch.

Probably the best bet is to build a newer docker against the old
release. You'd also need a newer golang.

IIRC there's a mixin layer to provide the newer golang, and as
for docker, that's something that can also be done in a separate layer
(or shared via a mixin).

As for what I can do in the dunfell meta-virt layer itself, that answer
isn't so clear as we don't jump forward major versions in the
maintained branches, and it would also run into the golan version
issues.

Bruce

>
> Thank you,
> Dan Walkes
>
> 1: https://github.com/OE4T/tegra-demo-distro/issues/277
> 2: https://lists.yoctoproject.org/g/meta-virtualization/message/8184
> 3: https://github.com/docker/cli/issues/4437#issuecomment-1637715017
> 4: https://github.com/yoctoproject/poky/commit/f7f7d5514cf0f63a34d1c75efb=
031829808ddf2e
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8406): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8406
> Mute This Topic: https://lists.yoctoproject.org/mt/102267438/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

