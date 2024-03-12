Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429C9C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 18:44:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.4738.1710269051891551974
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 11:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mE4msfRJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29c078370aaso1840108a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710269051; x=1710873851; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mra/Zw5FgH7CnvVvQgJR6dDfIuGVfDzvOPNsdi9rAgM=;
        b=mE4msfRJwqlHz+/6KxVgDVCn223EXA6Twyw//cuKwu42Qu6ljdA4V3TPPio7ydVT2Z
         xefTaWLZw3oZqcef2wzKHY/OgDVuikZH9J+y4lxiPo8h9Xnx9nmm4Am76GMc796+91n3
         +uAT+PBA/0fyj9/DCu2ZJ0ra5vXuaIY7AU2KgtZlfIkXvJqqH0B0tGNJFOP1EXwN+sSg
         mGbIGZL4NTourrCGxIdo2JLymLrp5513bJXfxddQ45vEqXSZe0uofEhg6LCxZXFXehz9
         rEYfe+s7H/4FwySggxksplxi1kK+de60/op+bklcy27QsrLRaPMy2kgyLOMBJhJcpvey
         /c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710269051; x=1710873851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mra/Zw5FgH7CnvVvQgJR6dDfIuGVfDzvOPNsdi9rAgM=;
        b=byBfVoRSmiJmJLNv1ugBbUmmTG9k9YnpfDmQvAb2H0GvtMd64G4eIkzDF07i5u91LB
         AisSKmxYlagVYCuUoWXOOp0zbs3e9oPs3eHrqf7WaOAGBdZW9iyteu+G9B/Ks2kKNCm+
         YAx64dfASY7gKU0jdjs1j0yepOI+dMVsfmdw2vDoFG0U2DYjjd7XYz7AyQS5nLOcJWBO
         zXsypvl/11cMqI6dipRq2mzBRun7YkKBhzSZkqMfBF5+KJECi+kt75y2DzUjl8U8EM7T
         7Ox5uqYbKVi9gftD9L6nQTkNgGNiiqGnCA5UeN97SZfvHtnLdkfd4ueZMIdsW/NunmUb
         btjg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Zwubtn5iTsWG2WFLnxxQdf/9b0ovZBUVmRamG+R5G9RFYMuFjpn+3uFXhp+xfTDshSAJJwZAaPPCndVd9MxqQwuyULPYBuwO1Y+CWeHP90JZNREN2p4S29U=
X-Gm-Message-State: AOJu0YyuxfoQPhQ8jwT00RvqLAhAoOPDdmj/iB09qiIlPUn16XEtLX9e
	XCQbNm3dbZPXaN/+fzSGB/2gVdu4aky1yK4Vs99nN4NV2b1aWqHynWY8O9sTY3rRCkM/yxaJ6h/
	KLecaJ4vv3vgQxwtpfRjKdGmGZso=
X-Google-Smtp-Source: AGHT+IFXMqNxSo+otbpJyy2QhUjZTBwWHZUTVbKTOuA98DkoBmf9F+2eSXLxcfLLAARbUxFS5qKObPebAulMBZ5Wp38=
X-Received: by 2002:a17:90a:fd01:b0:29b:a149:2fe4 with SMTP id
 cv1-20020a17090afd0100b0029ba1492fe4mr8881214pjb.34.1710269051146; Tue, 12
 Mar 2024 11:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
 <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
 <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com> <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
In-Reply-To: <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Mar 2024 14:43:59 -0400
Message-ID: <CADkTA4M1_a+E11jTbFQTuxvUaPR=+TE+rNOo4+46B3f4_ed8Bg@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, 
	meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 18:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8629

On Tue, Mar 12, 2024 at 1:58=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Mon, Mar 11, 2024 at 6:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> > On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.com>=
 wrote:
> > > On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield <bruce.ashfiel=
d@gmail.com> wrote:
> > >>
> > >> Hi all,
> > >>
> > >> I'm still looking for help with this.
> > >>
> > >> It's all fine and well that folks have packages that they are
> > >> interested in more than others, but it needs to be more than
> > >> maintainers that step up and fix the niche packages.
> > >>
> > >> I'm still holding the meta-virt master-next -> master push until Cep=
h
> > >> is upgraded and working.
> > >>
> > >> I know absolutely nothing about CMake, so I'm flailing around in the
> > >> build of Ceph and have gotten no further since I last asked for help=
.
> > >
> > > Well I did try, but I am no CMake expert nor ceph expert either. I go=
t stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the vendored l=
ibraries.
> >
> > I ended up with that as well (just a few minutes ago), I tried setting
> > some Thrift variables, but it refuses to detect those as well.
> >
> > The errors seem to rotate .. and it isn't even obvious if some are
> > really fatal, or not.
> >
> > Perhaps it just isn't something that cross builds anymore, and I'll
> > just blacklist it with the broken
> > recipe.
> >
> > I'll have one more try with it tomorrow before giving up.
>
> Hi Bruce, Tim,
>
> I had a look at this yesterday, and I (possibly?) made some progress
> with it but wanted to ask before getting too far with an approach:
> would it be OK to pull out at least some of those vendored components
> into some new separate recipes, so that rebuilding that compile stage
> when it needs it is faster?
>

I'm fine with stripping it down to the bare minimum to be buildable.

I'd rather have a building (but small) recipe, and then we can see if there=
's
demand for more components.

I was also poking at this today, and I'm still seeing dramatically differen=
t
results when I call compile multiple times .. all the way back to cmake
complaining it can't find the python3 interpreter, which was a problem
I thought I had solved!

Feel free to grab me on the #meta-virt channel if you have any interactive
questions.

Bruce

> Christopher
>
>
> >
> > Bruce
> >
> > > We can only take so much abuse from upstream ;)
> > >
> > >
> > >>
> > >> Bruce
> > >>
> > >> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
> > >> lists.yoctoproject.org
> > >> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >> >
> > >> > Hi all,
> > >> >
> > >> > If anyone has experience with Cmake, I could use a hand completing=
 the
> > >> > ceph upgrade that is marked as WIP in master-next.
> > >> >
> > >> > It took me a few hours today, but I managed to get past python3
> > >> > detection issues, but now I'm running into a compiler test failure
> > >> > during the build.
> > >> >
> > >> > To me, it looks like our sysroot isn't being passed, which could b=
e
> > >> > related to the toolchain.cmake not being used (since the compiler =
test
> > >> > is being launched by a sub component).
> > >> >
> > >> > I'm inclined to be stubborn about this, and keep working on gettin=
g
> > >> > the package bumped, as it has missed a few upgrades and is in need=
 of
> > >> > some love.
> > >> >
> > >> > Bruce
> > >> >
> > >> > --
> > >> > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> > >> > thee at its end
> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> > >> >
> > >> >
> > >> >
> > >>
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> > >>
> > >>
> > >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8626): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8626
> > Mute This Topic: https://lists.yoctoproject.org/mt/104759213/3619036
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [christopher.w.clark+meta-virt@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

