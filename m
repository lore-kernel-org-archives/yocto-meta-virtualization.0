Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4C6C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 13:39:58 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web09.9583.1651844394163448831
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 06:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e3NYUdTm;
 spf=pass (domain: gmail.com, ip: 209.85.219.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id r11so12907865ybg.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AxUhVFETLhMTYOe2yDCqDZkXejRDXEiOXVHp2zyR5E8=;
        b=e3NYUdTmAOFYOCmeoKlC7pWxtTEmL1o3pzdn7EC8o++tX0dFpmzbFclFSDfBXcPcyc
         +vn83Cqa+iatcrXBejSNBtM+Yc3PVMF15tqxoklIG4PEgHUhaEHlCzcmn+btBIV7Mu+b
         PtLNZE39q4WyWiSE7/vPbRsbtM5G///sMTxP0G4BhL9OIE7w7eFOiQdC9hsKlIjCuh9Q
         oxY6ix755Bfg2ql/WcjiOmjH/SfJLZmH1nfWFerXt7p7zVZzCAC9LzxV12SGLcemgjSp
         EbWn+T/vMmblQpCeW+nKbiskUSjAqmR84ioMYxMPtL4QvI0wAv1sA8dzI4M/VTRFMF6Q
         7Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AxUhVFETLhMTYOe2yDCqDZkXejRDXEiOXVHp2zyR5E8=;
        b=cfgSrpedtKoKIacIQZ1hqINN1zuXloQmgzlZzvDanARNfG1VTP7JtVP1wQ9V9fN6Jo
         B1kb4GADhVL4+YAllXDlsK2C98CWmOhkwcnLEj5TC6Xgkcsz4N66GasXD3x+MktyVQ5g
         I02HbYBqRK/plQ9SI4J+ut7uRlavjWUwXNzjI+14AZHMRISRpHSkX7lBBkaRAyfdeFYd
         Hhf6any9V8KxiN7O6tm5h9dczkCdG2JmLyxBViZAIk+x8XRVMd3JnMOlWGjsymgqqrIc
         OeiRu0YVAPQSigXC+KfOeMAEUosS90QeZHAg0OSGn8yRdL7F88X/WGVudbqCriRARFSG
         +URA==
X-Gm-Message-State: AOAM532TzFi2YvKI/XI0FUj0SknkH/yMCy4RZG0yXErKqWBXtxky/8Rk
	yfcjntlrAG4vzz4iKR8O72fvCQUn03l/Smfzcc8=
X-Google-Smtp-Source: 
 ABdhPJynk4+4qkVL7h8/HX3PyWdVsdRKnTEw1oR9nbhkWWuXIZ/zjtHbtTRpK8t5botLnFzIWxJr7TxnWIKnPDmpTBc=
X-Received: by 2002:a25:40c9:0:b0:645:71c9:b3a1 with SMTP id
 n192-20020a2540c9000000b0064571c9b3a1mr2399603yba.557.1651844393194; Fri, 06
 May 2022 06:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
 <E67177DB-D51F-4C4D-ABB7-92E2BC937C17@arm.com>
In-Reply-To: <E67177DB-D51F-4C4D-ABB7-92E2BC937C17@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 May 2022 09:39:42 -0400
Message-ID: 
 <CADkTA4Mr7KNkhSyA9v4ZJ+krso9o=6JSYhFKm=Dho1bPXaLfbA@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 May 2022 13:39:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7250

On Fri, May 6, 2022 at 9:04 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Bruce,
>
> > On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> >
> > On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> >>>
> >>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
> >>> <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Christopher,
> >>>>
> >>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.=
org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>>>
> >>>>> The Spectre and Meltdown mitigations for Xen run PV guests within
> >>>>> HVM virtual machines, so Qemu is no longer only needed for systems
> >>>>> configured to run HVM guests.
> >>>>>
> >>>>> With the split xen hypervisor and tools recipes, the bios dependenc=
ies
> >>>>> belong in the tools recipe, so move them and replace the hvm
> >>>>> PACKAGECONFIG option with the recommendation based on target arch.
> >>>>>
> >>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> >>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>>
> >>>> I can build and run on x86 qemu and I get stuck during init in Dom0 =
(which is apparently already known).
> >>>>
> >>>
> >>> It is likely the xencommond init.d still causing issues.
> >>>
> >>> I'm doing a revert of all those changes locally, and will start some =
tests.
> >>
> >> Please let me know if you need some testing.
> >> On my side, I have the issue on arm64, arm32 and x86 at the moment.
> >
> > I'm still able to build and boot here, so I haven't reproduced the
> > issue .. so I'm still hesitating to revert all the xencommons changes,
> > as I can't prove to myself they are the issue.
> >
> > I created a kirkstone branch today, and I'll be adding the latest Xen
> > patches to it, but I need to get a handle on what everyone is seeing
> > for failures.
> >
> > I assume you are still seeing problems with the boot on all the
> > platforms you mentioned above ?
>
> Here is the linux logs for dom0 on my system:
> [    7.854317] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disab=
led.
> Configuring packages on first boot....
>  (This may take several minutes. Please do not power off the machine.)
> Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
> update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continui=
ng)
>  Removing any system startup links for run-postinsts ...
>   /etc/rcS.d/S99run-postinsts
> INIT: Entering runlevel: 5
> Configuring network interfaces... udhcpc: started, v1.35.0
> udhcpc: broadcasting discover
> udhcpc: broadcasting discover
> udhcpc: broadcasting discover
> udhcpc: no lease, failing
> ifup: failed to bring up eth0
> Starting random number generator daemon.
> Starting OpenBSD Secure Shell server: sshd
>   generating ssh RSA host key...
> sync: ignoring all arguments
> sync: ignoring all arguments
>   generating ssh ECDSA host key...
> sync: ignoring all arguments
> sync: ignoring all arguments
>   generating ssh ED25519 host key...
> sync: ignoring all arguments
> sync: ignoring all arguments
> done.
> Starting syslogd/klogd: done
> Starting domain watchdog daemon: xenwatchdogd startup
>
>
> And it stays stuck there.
>
> This is arm64 but I have the same on x86 with almost the same logs.
>
> If you want me to test something in particular to check if it solves the =
issue, just tell me what.
> I do not have much time to investigate right now but I will try to dig a =
bit from middle of next week so please keep me in touch.
>

Thanks for the data point .. it is very helpful!

Would it be possible to get a log of the image you built, and how you
launched it ? I'm assuming it is standard, but i'm looking for
anything that might show how I'm doing something differently!

Bruce

> Cheers
> Bertrand
>
>
> >
> > Bruce
> >
> >>
> >> Chees
> >> Bertrand
> >>
> >>>
> >>> Bruce
> >>>
> >>>> Cheers
> >>>> Bertrand
> >>>>
> >>>>
> >>>>> ---
> >>>>> Unchanged since v1
> >>>>>
> >>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
> >>>>> recipes-extended/xen/xen.inc | 6 +++---
> >>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/=
xen/xen-tools.inc
> >>>>> index 6bbc8cd..54bc477 100644
> >>>>> --- a/recipes-extended/xen/xen-tools.inc
> >>>>> +++ b/recipes-extended/xen/xen-tools.inc
> >>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
> >>>>>
> >>>>> RDEPENDS:${PN}-dev =3D ""
> >>>>>
> >>>>> -# Qemu is necessary on ARM platforms, and to support HVM guests on=
 x86
> >>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '',=
 d)}"
> >>>>> -QEMU:arm =3D "qemu"
> >>>>> -QEMU:aarch64 =3D "qemu"
> >>>>> -
> >>>>> RRECOMMENDS:${PN} =3D " \
> >>>>> - ${QEMU} \
> >>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
> >>>>> + qemu \
> >>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe v=
gabios', '', d)} \
> >>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKT=
AP_RRECOMMENDS}', d)} \
> >>>>> ${PN}-flask \
> >>>>> ${PN}-hvmloader \
> >>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xe=
n.inc
> >>>>> index 8b86de5..4c38ccf 100644
> >>>>> --- a/recipes-extended/xen/xen.inc
> >>>>> +++ b/recipes-extended/xen/xen.inc
> >>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
> >>>>> PACKAGECONFIG ??=3D " \
> >>>>> sdl \
> >>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d=
)} \
> >>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} =
\
> >>>>> "
> >>>>>
> >>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
> >>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,chec=
kpolicy-native,"
> >>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,syst=
emd,"
> >>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmwa=
re/bios.bin",--disable-seabios,seabios ipxe vgabios,"
> >>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
> >>>>>
> >>>>> DEPENDS =3D " \
> >>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
> >>>>> --disable-rombios \
> >>>>> --disable-ocamltools \
> >>>>> --disable-qemu-traditional \
> >>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshi=
m', '--disable-pvshim', d)} \
> >>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> >>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bio=
s.bin"', \
> >>>>> + '--disable-pvshim --disable-seabios', d)} \
> >>>>> "
> >>>>>
> >>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmw=
are/vgabios-0.7a.bin"
> >>>>> --
> >>>>> 2.25.1
> >>>>>
> >>>>>
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>> Links: You receive all messages sent to this group.
> >>>>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/7226
> >>>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
> >>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [bertrand.marquis@arm.com]
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>
> >>>>
> >>>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
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

