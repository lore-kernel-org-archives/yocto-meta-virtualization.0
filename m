Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20454C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 14:44:28 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.12032.1651761859139493661
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 May 2022 07:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1WFh1P1;
 spf=pass (domain: gmail.com, ip: 209.85.219.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id y2so7990982ybi.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 May 2022 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VGHZ1FC0+PYF6e4vO/GEn69SohE2WkOgOf04zxcu3MA=;
        b=L1WFh1P1JeMsi7wwlSEqsokZWrUZIILH3r0OymUZfpI4+G6XCQVV9OblpsEEajbhF5
         kE2AfVvKMYaad6Zkd6b2qUrLLT8lWr1CBwWSy541Yv/jIqPpMzDgWeTqj7UXXm9SuEWx
         1EDOQNwKUpxsV10pjqAZQW4V7gxIF2bk4qxRDRK7tZPvh2s013dkqGDec7Tdt9sMrvIj
         7EPg0z5DUpqwbXn/nV8QK1gsj36gfkuAZ3SubwUV9kzc6OlnyGvuNe8z2Plj4E8NN4PI
         rqUTPwgIuntPWQJJOLnhFp/MG64ac3ndEwyLuq/Ev08lNo5rWHY1XXo9CvNBZk/bTpSK
         e9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VGHZ1FC0+PYF6e4vO/GEn69SohE2WkOgOf04zxcu3MA=;
        b=Z59ncmI5hXSJ9776FR6nVg25LFBWSy23lWS+8QynB4MhZ18+YvK6AiCSvzaOfI/ONk
         1baFmABWaXBlw7JaHsG9U2uDdE7aemusZGqqBBhgwpqb3OaJO6dUnFH12fHk+dLCc02w
         9/1fvBLhMN8BAn4crAYZUfxMor+JVu5YOCBFnVzqOL4qQ37VChiXssacFx+J3eK9rihD
         7W6TMUioG5IY+HtJ6ncrDyalGGPY8UUI0kZ/izTy0YTgb2UirCLG7Su69D7HYOayhn2N
         PWa7qweGJeweTB0MeFQCppImD2ytWLbRKwvHISwHIxYTUcSFsU0YIh0dfRCUxpVTnkm9
         iPBA==
X-Gm-Message-State: AOAM5315DF8/l/O/VGQXdH4nsiwXAzB6mZyb9/AB4BIdjgg68y/sP4Cp
	rB2Z368WHul2iM023aqffV7ADSlOHbW8IsKcbZ0=
X-Google-Smtp-Source: 
 ABdhPJyLX+fKDFbBt/c5idwz50B0Y4o1ZcegLouC2lDhsmuQo62D+m20IShdbqbS/aT72M9AfNnh1qXccU1dk8nsiT0=
X-Received: by 2002:a05:6902:1285:b0:649:ae47:176a with SMTP id
 i5-20020a056902128500b00649ae47176amr13403980ybu.40.1651761858262; Thu, 05
 May 2022 07:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
In-Reply-To: <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 May 2022 10:44:06 -0400
Message-ID: 
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 May 2022 14:44:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7247

On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
> >
> > On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Christopher,
> >>
> >>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.or=
g <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> The Spectre and Meltdown mitigations for Xen run PV guests within
> >>> HVM virtual machines, so Qemu is no longer only needed for systems
> >>> configured to run HVM guests.
> >>>
> >>> With the split xen hypervisor and tools recipes, the bios dependencie=
s
> >>> belong in the tools recipe, so move them and replace the hvm
> >>> PACKAGECONFIG option with the recommendation based on target arch.
> >>>
> >>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>
> >> I can build and run on x86 qemu and I get stuck during init in Dom0 (w=
hich is apparently already known).
> >>
> >
> > It is likely the xencommond init.d still causing issues.
> >
> > I'm doing a revert of all those changes locally, and will start some te=
sts.
>
> Please let me know if you need some testing.
> On my side, I have the issue on arm64, arm32 and x86 at the moment.

I'm still able to build and boot here, so I haven't reproduced the
issue .. so I'm still hesitating to revert all the xencommons changes,
as I can't prove to myself they are the issue.

I created a kirkstone branch today, and I'll be adding the latest Xen
patches to it, but I need to get a handle on what everyone is seeing
for failures.

I assume you are still seeing problems with the boot on all the
platforms you mentioned above ?

Bruce

>
> Chees
> Bertrand
>
> >
> > Bruce
> >
> >> Cheers
> >> Bertrand
> >>
> >>
> >>> ---
> >>> Unchanged since v1
> >>>
> >>> recipes-extended/xen/xen-tools.inc | 9 ++-------
> >>> recipes-extended/xen/xen.inc | 6 +++---
> >>> 2 files changed, 5 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
> >>> index 6bbc8cd..54bc477 100644
> >>> --- a/recipes-extended/xen/xen-tools.inc
> >>> +++ b/recipes-extended/xen/xen-tools.inc
> >>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
> >>>
> >>> RDEPENDS:${PN}-dev =3D ""
> >>>
> >>> -# Qemu is necessary on ARM platforms, and to support HVM guests on x=
86
> >>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d=
)}"
> >>> -QEMU:arm =3D "qemu"
> >>> -QEMU:aarch64 =3D "qemu"
> >>> -
> >>> RRECOMMENDS:${PN} =3D " \
> >>> - ${QEMU} \
> >>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
> >>> + qemu \
> >>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vga=
bios', '', d)} \
> >>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP=
_RRECOMMENDS}', d)} \
> >>> ${PN}-flask \
> >>> ${PN}-hvmloader \
> >>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.=
inc
> >>> index 8b86de5..4c38ccf 100644
> >>> --- a/recipes-extended/xen/xen.inc
> >>> +++ b/recipes-extended/xen/xen.inc
> >>> @@ -9,13 +9,11 @@ require xen-arch.inc
> >>> PACKAGECONFIG ??=3D " \
> >>> sdl \
> >>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}=
 \
> >>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
> >>> "
> >>>
> >>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
> >>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkp=
olicy-native,"
> >>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d,"
> >>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware=
/bios.bin",--disable-seabios,seabios ipxe vgabios,"
> >>> PACKAGECONFIG[externalblktap] =3D ",,,"
> >>>
> >>> DEPENDS =3D " \
> >>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
> >>> --disable-rombios \
> >>> --disable-ocamltools \
> >>> --disable-qemu-traditional \
> >>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim'=
, '--disable-pvshim', d)} \
> >>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> >>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bios.=
bin"', \
> >>> + '--disable-pvshim --disable-seabios', d)} \
> >>> "
> >>>
> >>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios-0.7a.bin"
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/7226
> >>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
> >>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bertrand.marquis@arm.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
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

