Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1E4C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:30:28 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.9930.1651239018902035683
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 06:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VFUlxd/s;
 spf=pass (domain: gmail.com, ip: 209.85.219.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id j2so14558434ybu.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FqnGsZ/tjdDiap6BbwFlUS6stzSwOlRi9wLTWnYvMp8=;
        b=VFUlxd/s/iH8s6MAosHL89NkI9MNEvcfst6bQP3dbjU75x9qo3KauBUdcd71CQPFyv
         0rDbq2RMBqJpCzKd3ym9lzzsK2BWxNX/jSENqOqZyWIMToU6PT7pQtbmnlivUgcA/KGB
         gIJN4Z09n7b4/qHH+oeFAtU8LI2me2a4MBPH78vX8XNbHEwAR5Nb+Mu5kE36L9Ew+8nB
         pnH3Q1jhqAiaB4PoIGBR3NqP0wVOA2JwwVjHRINgff/2ncmXvfD1qb57n1KiXitn7YkN
         2Ii+KXan9FItDUsv3SEyzpTLewSV2/J9AWv5JMA+dtgao7R1C+LVH1ICW+bz4oAMPsUM
         k/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FqnGsZ/tjdDiap6BbwFlUS6stzSwOlRi9wLTWnYvMp8=;
        b=0IZDd0WyZLpRGJikfZxZt42dUlbzFCtZXp7ogVs6Wm8npiIl844caNof+vepbBZTSE
         NeH3dRD516cw1QtEt+YgUAFoupR6Px7/FAj6fWMzWvvpjFU2c6z1QxQTdKrPfqnjQUr9
         IiaG7XDkinYwOZ1srgV+aa1xcuFGFK3rGWAhEPAhC7O2a0jBe7AE35GIVy5vFM2FxsPt
         MuEFqPpejVDtecm7nRDUuo8blPaMzsUxc+k13oq9C5kKt3D5SY3IEaa0Z039KnrYRsPI
         Mk6x2QJKLFoZd54aiAJS7g4debjpvhF+PskFelSC6ETtUVqrwO5qMBay6b5pU8I8ZG7d
         aheA==
X-Gm-Message-State: AOAM530RDJpxwvD9sNLotz09cKNckYfoclBIt+nWNQBxgSsbdjyX3qoS
	Soqs/9qhhm9tWINU7EdqdLJqvdL2sh3AMboEm7Q=
X-Google-Smtp-Source: 
 ABdhPJxpDRDTpang43P1VLdfL9GO4tNWGkNc8UucTb4vBpjjNIteCtunyrBe79Ey3dnv+VP1MZH0JYP1+rjNMHY0HsQ=
X-Received: by 2002:a25:428b:0:b0:648:f57a:ffd9 with SMTP id
 p133-20020a25428b000000b00648f57affd9mr8088341yba.382.1651239017968; Fri, 29
 Apr 2022 06:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
In-Reply-To: <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Apr 2022 09:30:06 -0400
Message-ID: 
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"cardoe@cardoe.com" <cardoe@cardoe.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>,
 Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 13:30:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7233

On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org =
<christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > The Spectre and Meltdown mitigations for Xen run PV guests within
> > HVM virtual machines, so Qemu is no longer only needed for systems
> > configured to run HVM guests.
> >
> > With the split xen hypervisor and tools recipes, the bios dependencies
> > belong in the tools recipe, so move them and replace the hvm
> > PACKAGECONFIG option with the recommendation based on target arch.
> >
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> I can build and run on x86 qemu and I get stuck during init in Dom0 (whic=
h is apparently already known).
>

It is likely the xencommond init.d still causing issues.

I'm doing a revert of all those changes locally, and will start some tests.

Bruce

> Cheers
> Bertrand
>
>
> > ---
> > Unchanged since v1
> >
> > recipes-extended/xen/xen-tools.inc | 9 ++-------
> > recipes-extended/xen/xen.inc       | 6 +++---
> > 2 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/=
xen-tools.inc
> > index 6bbc8cd..54bc477 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
> >
> > RDEPENDS:${PN}-dev =3D ""
> >
> > -# Qemu is necessary on ARM platforms, and to support HVM guests on x86
> > -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}=
"
> > -QEMU:arm =3D "qemu"
> > -QEMU:aarch64 =3D "qemu"
> > -
> > RRECOMMENDS:${PN} =3D " \
> > -    ${QEMU} \
> > -    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
> > +    qemu \
> > +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vg=
abios', '', d)} \
> >     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKT=
AP_RRECOMMENDS}', d)} \
> >     ${PN}-flask \
> >     ${PN}-hvmloader \
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> > index 8b86de5..4c38ccf 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -9,13 +9,11 @@ require xen-arch.inc
> > PACKAGECONFIG ??=3D " \
> >     sdl \
> >     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d=
)} \
> > -    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
> >     "
> >
> > PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
> > PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpol=
icy-native,"
> > PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd,=
"
> > -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware/b=
ios.bin",--disable-seabios,seabios ipxe vgabios,"
> > PACKAGECONFIG[externalblktap] =3D ",,,"
> >
> > DEPENDS =3D " \
> > @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
> >     --disable-rombios \
> >     --disable-ocamltools \
> >     --disable-qemu-traditional \
> > -    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim=
', '--disable-pvshim', d)} \
> > +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> > +        '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/=
bios.bin"', \
> > +        '--disable-pvshim --disable-seabios', d)} \
> >     "
> >
> > EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/=
vgabios-0.7a.bin"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7226
> > Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

