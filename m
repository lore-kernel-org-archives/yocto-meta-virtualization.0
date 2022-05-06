Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8E3C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 16:27:08 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.102.1651854424284247961
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 09:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k9E8i7FB;
 spf=pass (domain: gmail.com, ip: 209.85.219.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id w17so13741833ybh.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=78RMr9hfORZ7WjSyWj/dLbkl7pe4a99MbtkLjvjTpJY=;
        b=k9E8i7FB4X+nnE9220Vsnob59F37NQleCAH1lZKRGcLaee8aKJn0+fMHcNAEbQkbYw
         H+IIRW16VtmUPcU+D8ng19aK2zKzeBtDNJtCHvU5tt5+W2ku+ww6ocLT4j/thmGM2Q56
         GE+YaQvBV/ryvmRIcjPHItIC6KE20BhqkmTY5EKsslPfRfBgK1DBfmZwcJvnVvX20/AR
         4TVD3gvIoreubzPBfAtWQw/jPes/BosGgHTsGziALNmuxhZbsBfYSAu4EH4p7wnYEARg
         i2qjgNMiwdVkUi34HIgIJh3ceddKOyABgPzN/1QSZ0za/flQRA8Gqx3i5vLIoWCQ9ZQv
         c/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=78RMr9hfORZ7WjSyWj/dLbkl7pe4a99MbtkLjvjTpJY=;
        b=sjaZ3Q17aHCfE+cBQZ85lHCZJAn88+vYovXZssPF8mjJKD7rsc0XCloaX75D4l7c8K
         cCEtuUPb8h2CktiW0WIU2SXwNnpKqRFjgAjlKQKyVk3ZmOu1lG0QUVjP2P8NHlHmFc2X
         1ia1rB1POH5yFFqQ9LNdt1gZHNM1mqjggDN3o+JcHXaVaUuclqktndnRy9Mv8dJrTuwQ
         1Bq36AGvWe+FYs9WfUhHHDA/vyZVmSpHhKCvy4E6RXEaGtySJgTmutbKDZlA16Cq+RwQ
         3Ug5Bosev4o2r2bHqE7A2mR8CzdEOpY50rn2Tuxk7r8doMhAfg6kNNacp6nPdz+vLfaQ
         wL7w==
X-Gm-Message-State: AOAM533AIPynsvFq28I3qAHpDxqiZ7uYqbvQyueuDWvDbbSE85cX0xpt
	QzKZFWZ/CVMOIvhX4m0uU7nGItD+8rQpvjBqB8M=
X-Google-Smtp-Source: 
 ABdhPJwUuxfyEaUbqqc9vIJEgw2SIC1ADDzsx7SfEEOC+jdFBd0bPn/DgjRkmrhWPyJhR9oN0Q32TGzze/tGWDm2Zmg=
X-Received: by 2002:a25:40c9:0:b0:645:71c9:b3a1 with SMTP id
 n192-20020a2540c9000000b0064571c9b3a1mr3068253yba.557.1651854423325; Fri, 06
 May 2022 09:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
 <E67177DB-D51F-4C4D-ABB7-92E2BC937C17@arm.com>
 <CADkTA4Mr7KNkhSyA9v4ZJ+krso9o=6JSYhFKm=Dho1bPXaLfbA@mail.gmail.com>
 <4B991E23-6D0F-46B7-BDD9-5A94662FA0F2@arm.com>
In-Reply-To: <4B991E23-6D0F-46B7-BDD9-5A94662FA0F2@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 May 2022 12:26:52 -0400
Message-ID: 
 <CADkTA4PZpXxz51v81ZoXWkJZNtgSLF7Aae5T4Ok_wbjPpBtW8Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
To: Bertrand Marquis <bertrand.marquis@arm.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 May 2022 16:27:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7252

On Fri, May 6, 2022 at 11:08 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
>
>
> > On 6 May 2022, at 14:39, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
> >
> > On Fri, May 6, 2022 at 9:04 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >>> On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> >>>
> >>> On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
> >>> <Bertrand.Marquis@arm.com> wrote:
> >>>>
> >>>> Hi Bruce,
> >>>>
> >>>>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> >>>>>
> >>>>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
> >>>>> <Bertrand.Marquis@arm.com> wrote:
> >>>>>>
> >>>>>> Hi Christopher,
> >>>>>>
> >>>>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoprojec=
t.org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>>>>>
> >>>>>>> The Spectre and Meltdown mitigations for Xen run PV guests within
> >>>>>>> HVM virtual machines, so Qemu is no longer only needed for system=
s
> >>>>>>> configured to run HVM guests.
> >>>>>>>
> >>>>>>> With the split xen hypervisor and tools recipes, the bios depende=
ncies
> >>>>>>> belong in the tools recipe, so move them and replace the hvm
> >>>>>>> PACKAGECONFIG option with the recommendation based on target arch=
.
> >>>>>>>
> >>>>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> >>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>>>>>
> >>>>>> I can build and run on x86 qemu and I get stuck during init in Dom=
0 (which is apparently already known).
> >>>>>>
> >>>>>
> >>>>> It is likely the xencommond init.d still causing issues.
> >>>>>
> >>>>> I'm doing a revert of all those changes locally, and will start som=
e tests.
> >>>>
> >>>> Please let me know if you need some testing.
> >>>> On my side, I have the issue on arm64, arm32 and x86 at the moment.
> >>>
> >>> I'm still able to build and boot here, so I haven't reproduced the
> >>> issue .. so I'm still hesitating to revert all the xencommons changes=
,
> >>> as I can't prove to myself they are the issue.
> >>>
> >>> I created a kirkstone branch today, and I'll be adding the latest Xen
> >>> patches to it, but I need to get a handle on what everyone is seeing
> >>> for failures.
> >>>
> >>> I assume you are still seeing problems with the boot on all the
> >>> platforms you mentioned above ?
> >>
> >> Here is the linux logs for dom0 on my system:
> >> [ 7.854317] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disab=
led.
> >> Configuring packages on first boot....
> >> (This may take several minutes. Please do not power off the machine.)
> >> Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
> >> update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (conti=
nuing)
> >> Removing any system startup links for run-postinsts ...
> >> /etc/rcS.d/S99run-postinsts
> >> INIT: Entering runlevel: 5
> >> Configuring network interfaces... udhcpc: started, v1.35.0
> >> udhcpc: broadcasting discover
> >> udhcpc: broadcasting discover
> >> udhcpc: broadcasting discover
> >> udhcpc: no lease, failing
> >> ifup: failed to bring up eth0
> >> Starting random number generator daemon.
> >> Starting OpenBSD Secure Shell server: sshd
> >> generating ssh RSA host key...
> >> sync: ignoring all arguments
> >> sync: ignoring all arguments
> >> generating ssh ECDSA host key...
> >> sync: ignoring all arguments
> >> sync: ignoring all arguments
> >> generating ssh ED25519 host key...
> >> sync: ignoring all arguments
> >> sync: ignoring all arguments
> >> done.
> >> Starting syslogd/klogd: done
> >> Starting domain watchdog daemon: xenwatchdogd startup
> >>
> >>
> >> And it stays stuck there.
> >>
> >> This is arm64 but I have the same on x86 with almost the same logs.
> >>
> >> If you want me to test something in particular to check if it solves t=
he issue, just tell me what.
> >> I do not have much time to investigate right now but I will try to dig=
 a bit from middle of next week so please keep me in touch.
> >>
> >
> > Thanks for the data point .. it is very helpful!
> >
> > Would it be possible to get a log of the image you built, and how you
> > launched it ? I'm assuming it is standard, but i'm looking for
> > anything that might show how I'm doing something differently!
>
> For the easy parts:
> - config: MACHINE=3Dqemuarm64, DISTRO_FEATURES =3D " virtualization xen"
> - build Xen-image-minimal
> - launch: runqemu serialstdio nographic
>
> I am using current xen staging with a modified xen recipe but I just trie=
d with stable 4.16 and I have exactly the same.
>
> Here is my build config:
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "qemuarm64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.0"
> TUNE_FEATURES        =3D "aarch64 armv8a crc cortexa57"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "stable:d53ac6e9561d782818d5491b7c4066f4a712d358=
"
> meta-oe
> meta-python
> meta-filesystems
> meta-networking      =3D "stable:bb2b5b31a80eb164e47649036878773614e4dbdf=
"
> meta-virtualization  =3D "stable:ea91e97711e3ceda4f4eab9db0d393568ee8bb46=
"
> meta-arm-toolchain
> meta-arm
> meta-arm-bsp         =3D "stable:50b34c5cc9496441152ad28bf1022e5fc5ab0a7e=
"
>
> For the build log could you be a bit more specific as there are a lot of =
logs.
>

I'm ok without the build logs, what you have above lets me get close.

My main development box uses systemd as the init system for the
distro, are you using poky + sysvinit ?

Poky (Yocto Project Reference Distro)
4.1+snapshot-5f85f75ecf1d5ea48975a04436bce947fd2bb41f qemux86-64 hvc0
qemux86-64 login: root
root@qemux86-64:~# uname -a
Linux qemux86-64 5.15.37-yocto-standard #1 SMP PREEMPT Tue May 3
23:43:14 UTC 2022 x86_64 GNU/Linux

I'll keep trying to reproduce the issues here.

Bruce

> Meta-virtualization status is kirkstone + patch for qemu-arm32 support.
>
> Cheers
> Bertrand
>
> >
> > Bruce
> >
> >> Cheers
> >> Bertrand
> >>
> >>
> >>>
> >>> Bruce
> >>>
> >>>>
> >>>> Chees
> >>>> Bertrand
> >>>>
> >>>>>
> >>>>> Bruce
> >>>>>
> >>>>>> Cheers
> >>>>>> Bertrand
> >>>>>>
> >>>>>>
> >>>>>>> ---
> >>>>>>> Unchanged since v1
> >>>>>>>
> >>>>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
> >>>>>>> recipes-extended/xen/xen.inc | 6 +++---
> >>>>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extende=
d/xen/xen-tools.inc
> >>>>>>> index 6bbc8cd..54bc477 100644
> >>>>>>> --- a/recipes-extended/xen/xen-tools.inc
> >>>>>>> +++ b/recipes-extended/xen/xen-tools.inc
> >>>>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
> >>>>>>>
> >>>>>>> RDEPENDS:${PN}-dev =3D ""
> >>>>>>>
> >>>>>>> -# Qemu is necessary on ARM platforms, and to support HVM guests =
on x86
> >>>>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '=
', d)}"
> >>>>>>> -QEMU:arm =3D "qemu"
> >>>>>>> -QEMU:aarch64 =3D "qemu"
> >>>>>>> -
> >>>>>>> RRECOMMENDS:${PN} =3D " \
> >>>>>>> - ${QEMU} \
> >>>>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)}=
 \
> >>>>>>> + qemu \
> >>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe=
 vgabios', '', d)} \
> >>>>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BL=
KTAP_RRECOMMENDS}', d)} \
> >>>>>>> ${PN}-flask \
> >>>>>>> ${PN}-hvmloader \
> >>>>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/=
xen.inc
> >>>>>>> index 8b86de5..4c38ccf 100644
> >>>>>>> --- a/recipes-extended/xen/xen.inc
> >>>>>>> +++ b/recipes-extended/xen/xen.inc
> >>>>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
> >>>>>>> PACKAGECONFIG ??=3D " \
> >>>>>>> sdl \
> >>>>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '',=
 d)} \
> >>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)=
} \
> >>>>>>> "
> >>>>>>>
> >>>>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl=
,"
> >>>>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,ch=
eckpolicy-native,"
> >>>>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,sy=
stemd,"
> >>>>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firm=
ware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
> >>>>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
> >>>>>>>
> >>>>>>> DEPENDS =3D " \
> >>>>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
> >>>>>>> --disable-rombios \
> >>>>>>> --disable-ocamltools \
> >>>>>>> --disable-qemu-traditional \
> >>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvs=
him', '--disable-pvshim', d)} \
> >>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> >>>>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/b=
ios.bin"', \
> >>>>>>> + '--disable-pvshim --disable-seabios', d)} \
> >>>>>>> "
> >>>>>>>
> >>>>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/fir=
mware/vgabios-0.7a.bin"
> >>>>>>> --
> >>>>>>> 2.25.1
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>> IMPORTANT NOTICE: The contents of this email and any attachments a=
re confidential and may also be privileged. If you are not the intended rec=
ipient, please notify the sender immediately and do not disclose the conten=
ts to any other person, use it for any purpose, or store or copy the inform=
ation in any medium. Thank you.
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >>>>> thee at its end
> >>>>> - "Use the force Harry" - Gandalf, Star Trek II
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7251): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7251
> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

