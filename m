Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1758BC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:00:06 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.51802.1699020004607996843
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VmRlHkkI;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35957d77afcso3409395ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699020004; x=1699624804; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pqANDGroTkm3ze/2D1Vb+phAmleekwOOHMyJZmwxOA=;
        b=VmRlHkkIOYW4aWv9e+wVhZE2JccgsN//NaDkGOoFRhn7fjagV/5lkNMulmyvFQZd/T
         sjqJM4CZFtiVRXLkcuXopIQJ0Nsbr2pwTHik+M6+hHkp3y8SEI+XFmieFGYdhcccUbee
         IuSv5gmhKM0o4AkIvDBm+QDB6uTsW5oFYenBgqq9hEWkHjgpZ9Qs9Be1XyJYc3gVcfRe
         TXJ3o2QmIBBOh9XzWPA61UNoe4tLPStPqFBkAZssY3DkkiEzbABZmEjZaf967ZEEtsRb
         pICAvxn8j/akYdycH+by8A9v5OIHZQRbxSZrFd1jHnFQKwQB9zfIs72TfD3e1sRmED3h
         20BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699020004; x=1699624804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pqANDGroTkm3ze/2D1Vb+phAmleekwOOHMyJZmwxOA=;
        b=rQnFDEq/LFkRxYRpX2d2g5//sAFHH1pTcSpZwqcH21Er8hEzxqL7l1kYGkLvn3ssU1
         oZQz4HQIwqx/Ppp29VN/h3mp+8MIFRxACFW7DN62bEinRG6PGsik5wZZB1vHEzpdrISC
         vdSCT5qSsgNvZY8hG9wcxuh8wvK2HZ26gMKHGwbLK3fB39/5SVbZFYMEp9aOwgwD9yRy
         MNycOBxcfuQv026AYPCsts4MmVjedcTPnypIxKjg5kK2ew/3TXDsIdRrO5NO/mSTRVEw
         v/S4qcdBJvdhewYmRPigxyH9v3rZmaGViHoS350in2D5ZPMo0Fgkwds+2ig45AynsDhh
         A1oQ==
X-Gm-Message-State: AOJu0YzZ1BS0o/TQBNt20Y/hYtMdrSnuXAbDnenwg5CBBL1Vcdl+IVTo
	mADFTZadj+L+aa/gRwkzj3Zh0qvEoD0l/q/sQg8=
X-Google-Smtp-Source: AGHT+IGYbimCZnc39ygBkw5H9mSNB+2VLyUmRl9wnDpASSFV/UQvp8cXSIazOErh4iRB8cv8V2M3TAwPZGvvQ2JVfl4=
X-Received: by 2002:a92:7a0a:0:b0:34a:95f9:650c with SMTP id
 v10-20020a927a0a000000b0034a95f9650cmr2188162ilc.10.1699020003704; Fri, 03
 Nov 2023 07:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <06ec1922fd901a02d492158a995cfbeeb158e379.camel@siemens.com>
 <CADkTA4Mgak8=Hg1eFjUfXiskt5=QO0-cGyOA6zLn4Ck9EUn3GA@mail.gmail.com>
 <e109a5972f41d6410f9680765fb2c5dd53fc8c4e.camel@siemens.com>
 <17941DFC88BEAF3E.3650@lists.yoctoproject.org> <CADkTA4OcA=z3xwb4rCigLF331oiWyEEOgJoU07OpUpn9y8qKxQ@mail.gmail.com>
 <632b380ea47e25224c67e6c7358ae5ea25a27663.camel@siemens.com>
In-Reply-To: <632b380ea47e25224c67e6c7358ae5ea25a27663.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 Nov 2023 09:59:52 -0400
Message-ID: <CADkTA4PffsPrmCrHeAM9A5zivxPeuHJk497mEyY2Uf=Za3NRUw@mail.gmail.com>
Subject: Re: [meta-virtualization] use of yocto-cfg-fragments
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:00:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8419

On Fri, Nov 3, 2023 at 9:14=E2=80=AFAM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bruce,
>
> thanks for looking into this!
>
> On Fri, 2023-11-03 at 09:00 -0400, Bruce Ashfield wrote:
> > > > I cannot easily point you to something publicly available... But ro=
ughly it's a
> > > > combination of meta-virtualization and a kernel recipe derived from=
 kernel-yocto.bbclass.
> > > >
> > > > Now I long as one doesn't have any type=3Dkmeta, meta-virtualizatio=
n doesn't pull
> > > > git://git.yoctoproject.org/yocto-kernel-cache and adding
> > > > "file://features/debug;type=3Dkmeta;destsuffix=3Dfeatures/debug" to=
 SRC_URI causes
> > > > yocto-kernel-cache to be pulled even though there is no logical rea=
son for this.
> > >
> > > That's not what my local tests show. It is keying off an inherit of
> > > kernel-yocto,
> > > not kmeta, but even by extension, seeing that fragment merging is ava=
ilable
> > > (whether keyed of kmeta or the inherit of kernel-yocto), that is the =
logic as to
> > > why it pulls it in (and the use of it is what I explained above).
> >
> > Cancel that comment, I do see it now. And yes, if there's any kmeta fra=
gments
> > in the SRC_URI that is used to construct the kernel include file name, =
which
> > then double checks if kernel-yocto is inherited, and the combination of=
 the two
> > indicates that the fragments should be made available for the packages =
in the
> > layer to be properly supported at runtime.
> >
> > There should be a way for you to manipulate the do_kernel_metadata[depe=
nds]
> > value in your own bbappend to remove the dependency on the repo.
> >
> > I can also try and think up another variable or a way to exclude that
> > dependency
> > .. but again, it is an intended dependency, and I was trying for a ligh=
ter touch
> > with the existing checks, and I don't want to make them too complex or =
introduce
> > a bug where the fragments stop being pulled in where they have currentl=
y been
> > pulled as a dependency.
>
> This unfortunately means undoing the whole linux-yocto_virtualization.inc
> with all appended KERNEL_MODULE_AUTOLOAD and KERNEL_FEATURES and turns to=
 be
> quite messy at the end.
>
> So the logic of pulling the whole linux-yocto_virtualization.inc
> if d.getVar('SRC_URI').find('type=3Dkmeta')
> is not so obvious... For those re-using type=3Dkmeta for something else t=
han
> yocto-kernel-cache.

In theory, I created the type=3Dkmeta for just that purpose, kernel-cache a=
nd
fragment extensions, so keying on it is at least consistent :)

But I do agree that it is pulling in (potential) support for ALL of the fea=
tures
in meta-virt. That's a balance between having too many fine grained
distro features, versus the one big switch "virtualization".

It could be finer grained, let me see what I can come up with to slim thing=
s
down a bit .. but as it relates to the kernel-cache, even a more fine grain=
ed
trigger will want the kernel-cache for either virtualization,
containers, xen, etc.

I'll follow up later today, once I've thought about this a bit more.

Bruce

>
> We tend to trust our kernel configs and want to know which modules we loa=
d...
> For instance if we only do containers, we still might want meta-virtualiz=
ation,
> but not necessary KVM, right?
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

