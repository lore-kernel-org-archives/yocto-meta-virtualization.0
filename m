Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CBEC5AD4C
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 03:00:36 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.26910.1700535636105075382
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Nov 2023 19:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRm6m/2I;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b074e318b5so121318339f.0;
        Mon, 20 Nov 2023 19:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700535635; x=1701140435; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enyok2xQDFTYYlmJrC/qQjuM4rTcBeK7oBTEp2NzCvc=;
        b=nRm6m/2I0+LIoN7XraYy7c1XnvzDeb4LjRoa7mRE+GHxoDzhtQkMgUkaSVdiZ/bAJl
         CHISAHdQqfCiStdN2bJjlsZFwu73WuG8XX5I91hI5v0/pDRL6UX4mXL6YwooBGzP5aX+
         RVwOYR+XN5GJzZzAI3a9mxqzvu4vI4XOiTm6emzAjkK5jvlpfElbZNh8IMAbLM2uCZ1J
         FOpqGR5UNWlswwRp50OFwf3FUxnkxdfkq8XJjE9Jz+echEp7h5KDfiMuM5uo15Flu7GB
         xCjkgdmQDBRkrii5wrfM9ivHkJYksRJkSfqD7ObCEPw8300TvYXP6bKlfVDfxMjOa3Ff
         oYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700535635; x=1701140435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Enyok2xQDFTYYlmJrC/qQjuM4rTcBeK7oBTEp2NzCvc=;
        b=Qx6HnqDpiX8TU+1KjMq9i303l2q8J/ePQ4KXXP+rzM5ipzJys9lLjoK0wXOp/Xb9eY
         weZhWqelQ6+LVvLKCW1bTUv8q5i1mEZVGlgC+X8EP/UlbucrvRJOApQHHRyi8tnMxXJ6
         uQuFZO7wwi4/LZeTUKoo1dy50qbINVj0syjDHzQ7H9+kwT33Zg6WvJa3PNYIWdxc2lbh
         7CaZZ79DI2waB4dIN8q/n7wcIdmNfbU0p7veBhnMPNcHXZTnjLsE/bDDDo24BlaC+fNT
         Y9TMvPEVN/PpQrrMjUENGzTvYQ5rKWzPjxrDTzl/h4+gtIjeE9MTYvoTGFeBFV8uVqRS
         hPqA==
X-Gm-Message-State: AOJu0YwDySERCYwCdIXm0y0f8I9mMxJGyW8fN0x0daHptAbaWTTmbkgL
	LnrQnZ5EbaVIeKFtf0OofxgVczDtpXm7hZaBoPk=
X-Google-Smtp-Source: AGHT+IFQa4qVORg8aCz4cDZRU724HA0oEMgpe85b29OqWoN+PUaVbxwkvJL3AcZ1DEdwdbYDNUMpqt2i+OSJ+04WVQc=
X-Received: by 2002:a05:6602:6408:b0:7b0:5b08:3fe1 with SMTP id
 gn8-20020a056602640800b007b05b083fe1mr1474101iob.8.1700535635146; Mon, 20 Nov
 2023 19:00:35 -0800 (PST)
MIME-Version: 1.0
References: <2023112021510697052353@mail.local> <CADkTA4O9JP3kHrC7AOy_JGsQApk+YHuzTD+C23quBrQdSN38oQ@mail.gmail.com>
 <202311202249029960e95f@mail.local>
In-Reply-To: <202311202249029960e95f@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2023 22:00:23 -0500
Message-ID: <CADkTA4PgTBOWHvqZLwAN4bX_DhTk1qP0cR2Qdf=GbgLDY7DHiQ@mail.gmail.com>
Subject: Re: meta-virt fails check-layer-nightly
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Nov 2023 03:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8461

On Mon, Nov 20, 2023 at 5:49=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> This is nanbield which uses meta-virt master
>

That solves the mystery. There is a nanbield branch in meta-virt that
has a workaround
for that routine not existing in oe-core nanbield.

The branch configuration for the AB is not something I normally tweak,
if I can figure
out what file to change, i can send a patch.

Bruce

> On 20/11/2023 17:17:01-0500, Bruce Ashfield wrote:
> > What branch ? We resolved that issue quite some time ago for master
> > and for the older branches.
> >
> > If something happened to Joshua's change in master, I'm not aware of
> > it, and will wait for a patch to meta-virt to fix it up.
> >
> > Bruce
> >
> > On Mon, Nov 20, 2023 at 4:51=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hi Bruce,
> > >
> > > check-layer-nightly is failing for meta-virt:
> > >
> > > Loaded 0 entries from dependency cache.
> > > Parsing recipes...ERROR: ExpansionError during parsing /home/pokybuil=
d/yocto-worker/check-layer-nightly/build/meta-virtualization/recipes-extend=
ed/images/container-base.bb
> > > Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbak=
e/lib/bb/data_smart.py", line 481, in DataSmart.expandWithRefs(s=3D"${@oe.g=
o.map_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
> > >                      tb =3D sys.exc_info()[2]
> > >     >                raise ExpansionError(varname, s, exc).with_trace=
back(tb) from exc
> > >
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbak=
e/lib/bb/data_smart.py", line 465, in DataSmart.expandWithRefs(s=3D"${@oe.g=
o.map_arch(d.getVar('TARGET_ARCH'))}", varname=3D'OCI_IMAGE_ARCH'):
> > >                      try:
> > >     >                    s =3D __expand_python_regexp__.sub(varparse.=
python_sub, s)
> > >                      except SyntaxError as e:
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbak=
e/lib/bb/data_smart.py", line 153, in VariableParse.python_sub(match=3D<re.=
Match object; span=3D(0, 43), match=3D"${@oe.go.map_arch(d.getVar('TARGET_A=
RCH'))}">):
> > >                          self.contains[k].update(parser.contains[k])
> > >     >            value =3D utils.better_eval(codeobj, DataContext(sel=
f.d), {'d' : self.d})
> > >                  return str(value)
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/bitbak=
e/lib/bb/utils.py", line 434, in better_eval(source=3D<code object <module>=
 at 0x7f1275c759a0, file "Var <OCI_IMAGE_ARCH>", line 1>, locals=3D{'d': <b=
b.data_smart.DataSmart object at 0x7f127678f790>}, extraglobals=3D{'d': <bb=
.data_smart.DataSmart object at 0x7f127678f790>}):
> > >                  ctx[g] =3D extraglobals[g]
> > >     >    return eval(source, ctx, locals)
> > >
> > >   File "Var <OCI_IMAGE_ARCH>", line 1, in <module>
> > > bb.data_smart.ExpansionError: Failure expanding variable OCI_IMAGE_AR=
CH, expression was ${@oe.go.map_arch(d.getVar('TARGET_ARCH'))} which trigge=
red exception AttributeError: module 'oe' has no attribute 'go'
> > > The variable dependency chain for the failure is: OCI_IMAGE_ARCH -> I=
MAGE_CMD:oci
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/17=
19/steps/23/logs/stdio
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

