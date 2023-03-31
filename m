Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B24C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 13:59:49 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.55299.1680271183661469533
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 06:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cs1kr8+p;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id r19so288943ilj.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 31 Mar 2023 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680271183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0eYNTJDLbEkE0WSXgJyh6VtXpXVeQS/QfqGuMgDj6E=;
        b=cs1kr8+pqBmcUCKc+Eqm1L8qWj46taJQ57qaYx19igW4f+NtwH7KT4vxES9Wu3JS4A
         VAS3zjEoqP87fo5Zv15KatqW17UWEF63vwAzosNfKIy1YC0/dnVwLO/1EEJFc+yK34Uk
         tdCksjoCv923E48Z1q0TTOCEuuXjgtayxUMZ8foaft8lsimbaHSVKxzA/w0RaFRAImtP
         S4bvAETPUi48qmLpvz1ROpxQvJfkcvWRsGT0j4Cc/H8t5EIzZI1hscI8CKNW6hzn677e
         PcjnIWUgqopXRKAPmA0kHf6JjCfJBM4iic+c8pcGgr5Q7TF7xy9FburATiV1yJdFNCjh
         OR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0eYNTJDLbEkE0WSXgJyh6VtXpXVeQS/QfqGuMgDj6E=;
        b=b7TjL22KVr4SyhGfxuJEDTqgIE39gDr7eeMNuwIcr4YXbzs/5jmB/cx+0gHQW0gWa2
         pBkFkeoLmneXnXWI4IzpRS9CU8CsM/FDmZ8nwaOar7/b1VdK0Vza6u4J2DlVMWsNiVzL
         wYWkqqJ+5yNFPTbrT61q4+ZvfQF7otifrJ9WCR8VV+bIFaBV4mVgOmIHsPR81u8A5ziO
         sDFgSq+p5ZRIRHEp2q3MamrnJ3OFnM9J5BcDVxeBLcCgTmMCuwabTPNHWqen74/+WLw1
         pu6AsRrDsKNGU6sNfcINnndxYSXQZ4pp4mdkBFqQDBjRBfhl+5jVRRL5Yb+NaVLvd50T
         d8NQ==
X-Gm-Message-State: AAQBX9d/3jJP3ZkiEC3qDXIQ9BYdZQsUeqHtvbVoUqJDjY/sdRraF/ol
	Q1z9bZybHvO8DQixDXAdmmaBzItPFGl1e8x3+FE=
X-Google-Smtp-Source: AKy350Y40/4V7SEwKidEDfeVN/lJ/C6h62IyCP6rgRmpkxAuwaKkzIKD0VXahoEh3olNjEAFCqT7DSLsrcy7lFELUE4=
X-Received: by 2002:a05:6e02:1d9d:b0:315:8de2:2163 with SMTP id
 h29-20020a056e021d9d00b003158de22163mr13969583ila.5.1680271182790; Fri, 31
 Mar 2023 06:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230329141847.337386-1-joakimr@axis.com> <CANPvuRnL62+UmHEBMkiSqadLD5HnoX=kiDkep-pXoxcox+KXgg@mail.gmail.com>
 <566ccb86-0063-832e-580a-c619bbd4d378@axis.com>
In-Reply-To: <566ccb86-0063-832e-580a-c619bbd4d378@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 Mar 2023 09:59:31 -0400
Message-ID: <CADkTA4PeAmongW4DbbnaDfsJqFp8W2TiixdunzRYTL1VRNmHTQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] upx: Bump to v3.99
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	Joakim Roubert <joakimr@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 31 Mar 2023 13:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7975

On Fri, Mar 31, 2023 at 4:07=E2=80=AFAM Joakim Roubert <joakim.roubert@axis=
.com> wrote:
>
> On 2023-03-29 19:18, Jose Quaresma wrote:
> >
> > The AUTOREV will break the reproducibility of this package.
>
> How should we do here? If I checkout the tag v3.99 in for the UPX repo
> and carry out the update submodules, I will end up with a different
> commit ID for the submodules every time. How can we pinpoint one that
> sticks and actually is the one that corresponds to the v3.99?

The submodules shouldn't be changing when you check out the same tag.

i.e. git submodule status

Should always return the same commit IDs when you check out the same
tag, since those hashes are recorded in the git repository.

It would obviously still be better if we could use the gitsm fetcher,
but the way the repository is layed out was causing problems, so we've
switched to this. It might be worth double checking if gitsm on master
can handle the layout now, or if there's a way to fix things up to
work.

But assuming that the hashes aren't changing, you can just capture the
hashes reported by git submodule status, put those in the recipe and
that will get us the same results as the gitsm fetches for that
upstream project tag.

Bruce

>
> https://github.com/upx/upx/blob/devel/.gitmodules#L9
>
> Or should we just go with the single commit (with the commit message
> "Automatically created from git devel branch 4cbdb055db52") in upx-vendor=
?
>
> I believe that is what we had with v3.96, but now those commits seem to
> have vanished from the git repos so 3.96 fails to download the sources.
>
> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7974): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7974
> Mute This Topic: https://lists.yoctoproject.org/mt/97929374/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

