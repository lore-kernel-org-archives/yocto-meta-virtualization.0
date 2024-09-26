Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0CDFC619B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 13:00:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.42106.1727355645613417508
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 06:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQhwp/oz;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e07d85e956so877382a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Sep 2024 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727355645; x=1727960445; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brf5LybfH0uxkJXltdG987QbsJMb4GcsPRy7O/wVcRk=;
        b=iQhwp/ozWQx+l+u/5mYvvDcBJ0RGdXvi/yMoQDxiIgHXhutHXZveBS18sOeG0akboF
         YtBQDiApg2H/81fHAYWeZUxtUSslsiqBGjHFDFfB/c85776aYymlEYGtFTGoUwx8xijg
         4JaJH6joPuuqWJcuYlDF905P+sZgauemL/DEhkVLRR0YIzi8JuTON10FaQgtzbjsjEm0
         hmhLU7L1CePs4S+GlB7i3LedAxo7kU0sGpaCFe8dS9nY6i3Z5eN4Yl/DFVe9Bts75ZqW
         aRrlXfGYIMxosUt/zOldqkY0yZuMar5DZucrIBBqxN7L+qSEZGjOk6XATFNHOESy1DiV
         VYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355645; x=1727960445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brf5LybfH0uxkJXltdG987QbsJMb4GcsPRy7O/wVcRk=;
        b=Il6JLi1XoUTd3HU5MT0sMf51xukWsV9mwIv3fb8vZcEUczuTx8mvoA8P4oMQeABUiI
         CId0xRqg/LMc7a/iEwdIw/L+T4vZnYa9kl80p3jEVMmnl9V3NF8VFhTbxnTRirjz0czw
         a4oDXZ1L58cth8Z17ASKS3GiFZ8CCtrpbQXSwMHFDU9VB83l/EPCCYqogxpBCtalvg6E
         rPxKvQ2pBnKdYfZGOeanpR5Gy4x7a+G/jM1CwkjlCUxS/yiWIUImJtUtlpPPEHOplrWd
         fQWt9FnojyK/vvYhczXFtJvMmqwCYLhej8zcXquOZD9ivg3A0Xgiqfo3wFSsDQ+G3sTy
         Ba1g==
X-Forwarded-Encrypted: i=1; AJvYcCUcEXmCXN0B7RBXLG5ZRJSgp/gNfePPXDEFJI0+FfOAFC9EciyE94ESAGA4ZuytY0FbaqKJV4GQPWjpzUF4L5te23BQ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxq8oOHzfOt3/mLl7ZOv/M0s29OLqrlDNngjHe6hC4nHCG8SduA
	oWPq5R0T7wbB7YEyOolBahrMnrJ539YRja25p5PCecwEde3dsIFMkysAA9DogbrkHsSKCTBvZ96
	U59BUGCECmQagStKGg0I5kGcJOsMXpdxP
X-Google-Smtp-Source: AGHT+IH2/BusMdmOLXE3dz/9ntUef1du5gPfuGsjeXeTu06kG0mIJE67qb7lzK5F1riX/38czmF8j8m9IRkVipI/9BY=
X-Received: by 2002:a17:90a:a790:b0:2d3:c0e5:cbac with SMTP id
 98e67ed59e1d1-2e06ae2cb2fmr7104790a91.7.1727355644818; Thu, 26 Sep 2024
 06:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <g6fqs7n55g3tl5f3iqq4evfjvdbo3p33eyhmpqkwbtpqnwt6m5@sj4psvs2kglu>
 <CADkTA4NwyiEzkXuSwV5Uow679-3hq2mh7MpQxT-f4WwSaiS8-Q@mail.gmail.com>
 <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k> <17F43535C026254E.21522@lists.yoctoproject.org>
In-Reply-To: <17F43535C026254E.21522@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Sep 2024 09:00:33 -0400
Message-ID: <CADkTA4P36FDCqZuzNBxcjsXzkrSUBtrJ7ncvb_d0zCOfimBtEg@mail.gmail.com>
Subject: Re: [meta-virtualization] Backporting Xen 4.19 to scarthgap
To: bruce.ashfield@gmail.com
Cc: Amneesh Singh <a-singh21@ti.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Sep 2024 13:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8900

On Wed, Sep 11, 2024 at 9:57=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
>
> On Fri, Sep 6, 2024 at 9:55=E2=80=AFAM Amneesh Singh <a-singh21@ti.com> w=
rote:
>>
>> On 09:44-20240906, Bruce Ashfield wrote:
>> > On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Singh <a-singh21@ti.com=
> wrote:
>> >
>> > > Hello,
>> > >
>> > > Is backporting Xen 4.19+stable to scarthgap a possibility?
>> > >
>> >
>> > I don't hold quite as strictly to the "no new major versions in stable
>> > branches"
>>
>> I agree, freezing Xen to 4.18, would limit things in my opinion.
>>
>
> That's not quite what I meant.
>
> There's very few recipes that we are willing to carry multiple versions
> of in main layers, Xen is one of them. If it wasn't for that, this would =
be
> a definite no, since if someone wants new features, we simply point
> them at the next release.
>
> It also isn't something that I'd continually do (again, I'm only talking
> about the official meta-virt layers/branches) as more Xen releases
> arrive through the lifetime of a LTS. The support matrix is too high
> at that point, and again, I'd just point to the new releases.
>
>
>>
>> > as OE core does.  In particular for recipes that I carry multiple vers=
ions
>> > of.
>> >
>> > Xen does fall into that category, if there's a compelling reason (i.e.=
 a
>> > feature we can't backport that is required), then 4.19 could be added,=
 but
>> > not made the default version (that would break policy).
>>
>> I am mostly interested in dynamic node programming using overlay dtbo.
>> Although, I have not tried it with dom0less domains yet.
>>
>> Other than that, I have a patchset which I'll have to rewrite to make it
>> work with 4.18 :p, so I was trying to avoid that.
>>
>> What do you think? Is it possible to make this work?
>
>
> It should definitely be possible, and something I'm willing to do as it i=
s
> an already tested version in master. I also so like to keep things we
> want to support in meta-virt itself, versus external mixin layers
> (when possible).
>
> Have you tried just taking the recipes from meta-virt master and seeing
> how the work on scarthgap ? I'm still doing current release bug fixing
> and package updates, so it will be a while before I get a chance to try
> that myself.

I never did get any follow ups to this.

But I did go ahead and push a lightly tested Xen 4.19 recipe to scarthgap.

Bruce

>
> Bruce
>
>
>>
>>
>> >
>> > Bruce
>> >
>>
>> Regards
>> Amneesh
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8880): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8880
> Mute This Topic: https://lists.yoctoproject.org/mt/108304314/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

