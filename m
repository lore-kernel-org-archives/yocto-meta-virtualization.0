Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265C1C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 04:03:17 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.27953.1700539395313046324
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 20:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2WdR+C4;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b006f7c473so180544139f.2;
        Mon, 20 Nov 2023 20:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700539394; x=1701144194; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haYKTfhhOHK81KyyvmHk22D0ANhLpvwc3n+Zq6Ka6HQ=;
        b=I2WdR+C47uSn/5C5xPOjYtYPAlPKUGJY+TzQieJE5fqvsS5T+tiMpjJESp4jrolDlN
         kNQMdZs6x9xbRTrki0btU4EMmdiCwEDgeqIpZEMMPcy5TgeQIqChOnFLtDgnyuzxV3As
         91yolL4rx5Wgvw+YORAekqp6mk1OzCLfmNWPob6JKlnmM9xlfypWz8c9kYEFhR4MeLBN
         huxfL/kMOMrj5EbsS6hDYppM2sOQT1NQV3XnV4SMh1CKSOnizo++HwW1p4neXblMiNYe
         Ai2hykGMzoE6/VLOn9R53HAoVzG1kkS2Vc2Dh3EPamtBBqMbYYhmKREgCy5b5wEYpdgF
         F6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700539394; x=1701144194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haYKTfhhOHK81KyyvmHk22D0ANhLpvwc3n+Zq6Ka6HQ=;
        b=dJtENWYz8rFRBXL6VATjB/Pd9wF9TxprDKQWrUuvWgd61ujjMUA6z7uWw2BKQnnp5e
         X/au14jNh0Hn6QSYGMqqxsZx6jCLJDjL1GkmNd9Kqq7oCGqhgSrTpBW/Fwu/tUppdL/Y
         X7LpaGZGKMf6aFs5DzBTsNtZJufPzEhCwgtQTJhy7edvulIRrfVSmhZJMNMPlAULF1jI
         /WwrSf1ViXvhei0UgroPoSz4gteBLcBRNnMp95RdItIb0W/m2Gx1/p/PPXIWd2a8E+Ih
         xTsyfqRRL6RmIVHu1byo29+RItDYMdWAefJe4gwrNkW1WMzyJ6xJfpUrsnO7vgm5UAaW
         GhfA==
X-Gm-Message-State: AOJu0Ywf+wJal/wGQif+1FlJ1Oib1BZw+2jx5ZvUJEYPGnD0J1bfY/j6
	4aMeccLE0sPrzW2rnGZzpAS6BneVXoFNaWYtusY=
X-Google-Smtp-Source: AGHT+IEfHbisXTPQ2uxYzSCvfJ8QhfAPhK6JOz2XyREPQSnBDs4dG98MtdhI4zNQINxkXY8QEkC4uyoioxOfcKPJBCk=
X-Received: by 2002:a05:6602:702:b0:7aa:125a:b0c4 with SMTP id
 f2-20020a056602070200b007aa125ab0c4mr11226765iox.5.1700539394359; Mon, 20 Nov
 2023 20:03:14 -0800 (PST)
MIME-Version: 1.0
References: <2023112021510697052353@mail.local> <CADkTA4O9JP3kHrC7AOy_JGsQApk+YHuzTD+C23quBrQdSN38oQ@mail.gmail.com>
 <202311202249029960e95f@mail.local> <17998426C3192B68.30166@lists.yoctoproject.org>
In-Reply-To: <17998426C3192B68.30166@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2023 23:03:02 -0500
Message-ID: <CADkTA4M2R7yCqh334QDCU542syUQaOxmb7+Sa3-+2DfZwKAySw@mail.gmail.com>
Subject: Re: [meta-virtualization] meta-virt fails check-layer-nightly
To: bruce.ashfield@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Nov 2023 04:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8462

On Mon, Nov 20, 2023 at 10:00=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Nov 20, 2023 at 5:49=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > This is nanbield which uses meta-virt master
> >
>
> That solves the mystery. There is a nanbield branch in meta-virt that
> has a workaround
> for that routine not existing in oe-core nanbield.

And yes, I realize that meta-virt master still has nanbield in its
LAYERSERIES_COMPAT variable, but core hasn't added a
new compat name that I've seen, so I have no way that I know
of to declare the incompatibility.

Bruce

>
> The branch configuration for the AB is not something I normally tweak,
> if I can figure
> out what file to change, i can send a patch.
>
> Bruce
>
> > On 20/11/2023 17:17:01-0500, Bruce Ashfield wrote:
> > > What branch ? We resolved that issue quite some time ago for master
> > > and for the older branches.
> > >
> > > If something happened to Joshua's change in master, I'm not aware of
> > > it, and will wait for a patch to meta-virt to fix it up.
> > >
> > > Bruce
> > >
> > > On Mon, Nov 20, 2023 at 4:51=E2=80=AFPM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > Hi Bruce,
> > > >
> > > > check-layer-nightly is failing for meta-virt:
> > > >
> > > > Loaded 0 entries from dependency cache.
> > > > Parsing recipes...ERROR: ExpansionError during parsing /home/pokybu=
ild/yocto-worker/check-layer-nightly/build/meta-virtualization/recipes-exte=
nded/images/container-base.bb
> > > > Traceback (most recent call last):
> > > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitb=
ake/lib/bb/data_smart.py", line 481, in DataSmart.expandWithRefs(s=3D"${@oe=
.go.map_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
> > > >                      tb =3D sys.exc_info()[2]
> > > >     >                raise ExpansionError(varname, s, exc).with_tra=
ceback(tb) from exc
> > > >
> > > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitb=
ake/lib/bb/data_smart.py", line 465, in DataSmart.expandWithRefs(s=3D"${@oe=
.go.map_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
> > > >                      try:
> > > >     >                    s =3D __expand_python_regexp__.sub(varpars=
e.python_sub, s)
> > > >                      except SyntaxError as e:
> > > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitb=
ake/lib/bb/data_smart.py", line 153, in VariableParse.python_sub(match=3D<r=
e.Match object; span=3D(0, 43), match=3D"${@oe.go.map_arch(d.getVar('TARGET=
_ARCH'))}">):
> > > >                          self.contains[k].update(parser.contains[k]=
)
> > > >     >            value =3D utils.better_eval(codeobj, DataContext(s=
elf.d), {'d' : self.d})
> > > >                  return str(value)
> > > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitb=
ake/lib/bb/utils.py", line 434, in better_eval(source=3D<code object <modul=
e> at 0x7f1275c759a0, file "Var <OCI_IMAGE_ARCH>", line 1>, locals=3D{'d': =
<bb.data_smart.DataSmart object at 0x7f127678f790>}, extraglobals=3D{'d': <=
bb.data_smart.DataSmart object at 0x7f127678f790>}):
> > > >                  ctx[g] =3D extraglobals[g]
> > > >     >    return eval(source, ctx, locals)
> > > >
> > > >   File "Var <OCI_IMAGE_ARCH>", line 1, in <module>
> > > > bb.data_smart.ExpansionError: Failure expanding variable OCI_IMAGE_=
ARCH, expression was ${@oe.go.map_arch(d.getVar('TARGET_ARCH'))} which trig=
gered exception AttributeError: module 'oe' has no attribute 'go'
> > > > The variable dependency chain for the failure is: OCI_IMAGE_ARCH ->=
 IMAGE_CMD:oci
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/=
1719/steps/23/logs/stdio
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8461): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8461
> Mute This Topic: https://lists.yoctoproject.org/mt/102717308/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

