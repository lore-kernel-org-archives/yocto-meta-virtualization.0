Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCE8C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 03:07:40 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web12.27877.1652065657360056565
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 May 2022 20:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IxGu/hgX;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2f7b815ac06so130314337b3.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 May 2022 20:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fgc/4kAukc3Y+RVey/UosA3m7WwN+qlIAHpJVKam2bc=;
        b=IxGu/hgXFNobS7yMHzLZBPtu3WxjQnYS70nYtSqCBVPREeBd2dXr9YlX5DPcoPcKe+
         G1I9mlCuEQt1ZEvnZBW1/iB2SEElHm/ZSX3gTjqFhCkT/ROFo5W5NsNZriYV7u52sra2
         A8RFJN25ZFhj0BsTVj6jP+J3PD9w2xFYrdH+jWpZKi3Jn6Z/9hFJURRtlOLlVoWRWVhh
         mXV5jGzouQNEgtzxCgJB45Z+7k/KaTHaMwRABSzyXxWW1A7kpMc4r8IF/8bR4yrOPIsh
         kBN+7plVLoG/gNqJK1Qdk9qfNG8NRttMkuRCrZaRBS0p42KSiycfv3O6UJRx9RKoly6x
         HSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fgc/4kAukc3Y+RVey/UosA3m7WwN+qlIAHpJVKam2bc=;
        b=s479ZNW+wRgsijIlhK6cFhQGPUWXpClyQgfPdB5UPJfcywOvkHfdsj3dDHa61X8Rwz
         ajHmVO8WLlU0GTxVn7+BdRpOEmpPzdkerlyBqksS5xDakaPcZoABPiJB5y7FQekf5Ppd
         cHsVVl5ttiMmlBcLT3PQhZa4Fvfsqc3494HxS3sZ+sBQAZ1aLKRAz3jYe4d9/F9tlS8P
         rfuEdlRo10zZ+VqbbGypEaSLWvPOfMuNPuAwVOxHLYjB3pJ4AaAxMjjPSLO/r4nCXjxa
         7XqHKFS94df6CRHe3jTuoC0pRh4/S6rE+4c3LTCZtP6u3sdE5gGs9ny7qGOwxEOI+xli
         ySgg==
X-Gm-Message-State: AOAM5327S41w0lwJRI1beSVNUAbo4cQjDqiLiWCFrRaK/sQWmIwBU78C
	z3si7AS563D6Oa7HV9Y2PNdxAl3u8BTQLSq29gk=
X-Google-Smtp-Source: 
 ABdhPJyI4xYu2c2l7ybltqjPtv7jxvCNuZn1lj8g42/G0U6q5OHT6ImIJ+B2tCqva8PNaJAJcTyYiVVjGOrf74UHxBQ=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr11894829ywc.64.1652065656421; Sun, 08
 May 2022 20:07:36 -0700 (PDT)
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
 <16EC90D8EC771C3B.14104@lists.yoctoproject.org>
 <16EC9D21932CCA78.5869@lists.yoctoproject.org>
In-Reply-To: <16EC9D21932CCA78.5869@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 May 2022 23:07:25 -0400
Message-ID: 
 <CADkTA4PuBYcx5qX-1ZnTR0Eg5kDHEBg+=7B-MZstK=ZGB+aTzw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 03:07:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7254

On Fri, May 6, 2022 at 4:12 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, May 6, 2022 at 12:27 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Fri, May 6, 2022 at 11:08 AM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> > >
> > >
> > >
> > > > On 6 May 2022, at 14:39, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
> > > >
> > > > On Fri, May 6, 2022 at 9:04 AM Bertrand Marquis
> > > > <Bertrand.Marquis@arm.com> wrote:
> > > >>
> > > >> Hi Bruce,
> > > >>
> > > >>> On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
> > > >>>
> > > >>> On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
> > > >>> <Bertrand.Marquis@arm.com> wrote:
> > > >>>>
> > > >>>> Hi Bruce,
> > > >>>>
> > > >>>>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.=
com> wrote:
> > > >>>>>
> > > >>>>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
> > > >>>>> <Bertrand.Marquis@arm.com> wrote:
> > > >>>>>>
> > > >>>>>> Hi Christopher,
> > > >>>>>>
> > > >>>>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctopr=
oject.org <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >>>>>>>
> > > >>>>>>> The Spectre and Meltdown mitigations for Xen run PV guests wi=
thin
> > > >>>>>>> HVM virtual machines, so Qemu is no longer only needed for sy=
stems
> > > >>>>>>> configured to run HVM guests.
> > > >>>>>>>
> > > >>>>>>> With the split xen hypervisor and tools recipes, the bios dep=
endencies
> > > >>>>>>> belong in the tools recipe, so move them and replace the hvm
> > > >>>>>>> PACKAGECONFIG option with the recommendation based on target =
arch.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.i=
o>
> > > >>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > > >>>>>>
> > > >>>>>> I can build and run on x86 qemu and I get stuck during init in=
 Dom0 (which is apparently already known).
> > > >>>>>>
> > > >>>>>
> > > >>>>> It is likely the xencommond init.d still causing issues.
> > > >>>>>
> > > >>>>> I'm doing a revert of all those changes locally, and will start=
 some tests.
> > > >>>>
> > > >>>> Please let me know if you need some testing.
> > > >>>> On my side, I have the issue on arm64, arm32 and x86 at the mome=
nt.
> > > >>>
> > > >>> I'm still able to build and boot here, so I haven't reproduced th=
e
> > > >>> issue .. so I'm still hesitating to revert all the xencommons cha=
nges,
> > > >>> as I can't prove to myself they are the issue.
> > > >>>
> > > >>> I created a kirkstone branch today, and I'll be adding the latest=
 Xen
> > > >>> patches to it, but I need to get a handle on what everyone is see=
ing
> > > >>> for failures.
> > > >>>
> > > >>> I assume you are still seeing problems with the boot on all the
> > > >>> platforms you mentioned above ?
> > > >>
> > > >> Here is the linux logs for dom0 on my system:
> > > >> [ 7.854317] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: d=
isabled.
> > > >> Configuring packages on first boot....
> > > >> (This may take several minutes. Please do not power off the machin=
e.)
> > > >> Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
> > > >> update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (c=
ontinuing)
> > > >> Removing any system startup links for run-postinsts ...
> > > >> /etc/rcS.d/S99run-postinsts
> > > >> INIT: Entering runlevel: 5
> > > >> Configuring network interfaces... udhcpc: started, v1.35.0
> > > >> udhcpc: broadcasting discover
> > > >> udhcpc: broadcasting discover
> > > >> udhcpc: broadcasting discover
> > > >> udhcpc: no lease, failing
> > > >> ifup: failed to bring up eth0
> > > >> Starting random number generator daemon.
> > > >> Starting OpenBSD Secure Shell server: sshd
> > > >> generating ssh RSA host key...
> > > >> sync: ignoring all arguments
> > > >> sync: ignoring all arguments
> > > >> generating ssh ECDSA host key...
> > > >> sync: ignoring all arguments
> > > >> sync: ignoring all arguments
> > > >> generating ssh ED25519 host key...
> > > >> sync: ignoring all arguments
> > > >> sync: ignoring all arguments
> > > >> done.
> > > >> Starting syslogd/klogd: done
> > > >> Starting domain watchdog daemon: xenwatchdogd startup
> > > >>
> > > >>
> > > >> And it stays stuck there.
> > > >>
> > > >> This is arm64 but I have the same on x86 with almost the same logs=
.
> > > >>
> > > >> If you want me to test something in particular to check if it solv=
es the issue, just tell me what.
> > > >> I do not have much time to investigate right now but I will try to=
 dig a bit from middle of next week so please keep me in touch.
> > > >>
> > > >
> > > > Thanks for the data point .. it is very helpful!
> > > >
> > > > Would it be possible to get a log of the image you built, and how y=
ou
> > > > launched it ? I'm assuming it is standard, but i'm looking for
> > > > anything that might show how I'm doing something differently!
> > >
> > > For the easy parts:
> > > - config: MACHINE=3Dqemuarm64, DISTRO_FEATURES =3D " virtualization x=
en"
> > > - build Xen-image-minimal
> > > - launch: runqemu serialstdio nographic
> > >
> > > I am using current xen staging with a modified xen recipe but I just =
tried with stable 4.16 and I have exactly the same.
> > >
> > > Here is my build config:
> > > Build Configuration:
> > > BB_VERSION           =3D "2.0.0"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "universal"
> > > TARGET_SYS           =3D "aarch64-poky-linux"
> > > MACHINE              =3D "qemuarm64"
> > > DISTRO               =3D "poky"
> > > DISTRO_VERSION       =3D "4.0"
> > > TUNE_FEATURES        =3D "aarch64 armv8a crc cortexa57"
> > > TARGET_FPU           =3D ""
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =3D "stable:d53ac6e9561d782818d5491b7c4066f4a712=
d358"
> > > meta-oe
> > > meta-python
> > > meta-filesystems
> > > meta-networking      =3D "stable:bb2b5b31a80eb164e47649036878773614e4=
dbdf"
> > > meta-virtualization  =3D "stable:ea91e97711e3ceda4f4eab9db0d393568ee8=
bb46"
> > > meta-arm-toolchain
> > > meta-arm
> > > meta-arm-bsp         =3D "stable:50b34c5cc9496441152ad28bf1022e5fc5ab=
0a7e"
> > >
> > > For the build log could you be a bit more specific as there are a lot=
 of logs.
> > >
> >
> > I'm ok without the build logs, what you have above lets me get close.
> >
> > My main development box uses systemd as the init system for the
> > distro, are you using poky + sysvinit ?
> >
> > Poky (Yocto Project Reference Distro)
> > 4.1+snapshot-5f85f75ecf1d5ea48975a04436bce947fd2bb41f qemux86-64 hvc0
> > qemux86-64 login: root
> > root@qemux86-64:~# uname -a
> > Linux qemux86-64 5.15.37-yocto-standard #1 SMP PREEMPT Tue May 3
> > 23:43:14 UTC 2022 x86_64 GNU/Linux
> >
> > I'll keep trying to reproduce the issues here.
>
> A clean build with sysvinit has failed to bring up the console on a
> secondary builder (both qemux86-64 and quemarm64)
>
> I'll do some debug and see how it has gone wrong (since xencommon
> should be firing for sysvinit).

I've fixed up the sysvinit boot, and will double check both systemd
and sysvinit in my latest builds.

I expect to have a fix in the tree on Monday, and we can move on with
the other changes :)

Bruce

>
> Bruce
>
>
> Bruce
>
> >
> > Bruce
> >
> > > Meta-virtualization status is kirkstone + patch for qemu-arm32 suppor=
t.
> > >
> > > Cheers
> > > Bertrand
> > >
> > > >
> > > > Bruce
> > > >
> > > >> Cheers
> > > >> Bertrand
> > > >>
> > > >>
> > > >>>
> > > >>> Bruce
> > > >>>
> > > >>>>
> > > >>>> Chees
> > > >>>> Bertrand
> > > >>>>
> > > >>>>>
> > > >>>>> Bruce
> > > >>>>>
> > > >>>>>> Cheers
> > > >>>>>> Bertrand
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>> ---
> > > >>>>>>> Unchanged since v1
> > > >>>>>>>
> > > >>>>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
> > > >>>>>>> recipes-extended/xen/xen.inc | 6 +++---
> > > >>>>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
> > > >>>>>>>
> > > >>>>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-ext=
ended/xen/xen-tools.inc
> > > >>>>>>> index 6bbc8cd..54bc477 100644
> > > >>>>>>> --- a/recipes-extended/xen/xen-tools.inc
> > > >>>>>>> +++ b/recipes-extended/xen/xen-tools.inc
> > > >>>>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
> > > >>>>>>>
> > > >>>>>>> RDEPENDS:${PN}-dev =3D ""
> > > >>>>>>>
> > > >>>>>>> -# Qemu is necessary on ARM platforms, and to support HVM gue=
sts on x86
> > > >>>>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu=
', '', d)}"
> > > >>>>>>> -QEMU:arm =3D "qemu"
> > > >>>>>>> -QEMU:aarch64 =3D "qemu"
> > > >>>>>>> -
> > > >>>>>>> RRECOMMENDS:${PN} =3D " \
> > > >>>>>>> - ${QEMU} \
> > > >>>>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '',=
 d)} \
> > > >>>>>>> + qemu \
> > > >>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios =
ipxe vgabios', '', d)} \
> > > >>>>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '=
${BLKTAP_RRECOMMENDS}', d)} \
> > > >>>>>>> ${PN}-flask \
> > > >>>>>>> ${PN}-hvmloader \
> > > >>>>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/=
xen/xen.inc
> > > >>>>>>> index 8b86de5..4c38ccf 100644
> > > >>>>>>> --- a/recipes-extended/xen/xen.inc
> > > >>>>>>> +++ b/recipes-extended/xen/xen.inc
> > > >>>>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
> > > >>>>>>> PACKAGECONFIG ??=3D " \
> > > >>>>>>> sdl \
> > > >>>>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',=
 '', d)} \
> > > >>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', ''=
, d)} \
> > > >>>>>>> "
> > > >>>>>>>
> > > >>>>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/li=
bsdl,"
> > > >>>>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolic=
y,checkpolicy-native,"
> > > >>>>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-system=
d,systemd,"
> > > >>>>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/=
firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
> > > >>>>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
> > > >>>>>>>
> > > >>>>>>> DEPENDS =3D " \
> > > >>>>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
> > > >>>>>>> --disable-rombios \
> > > >>>>>>> --disable-ocamltools \
> > > >>>>>>> --disable-qemu-traditional \
> > > >>>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable=
-pvshim', '--disable-pvshim', d)} \
> > > >>>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> > > >>>>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmwa=
re/bios.bin"', \
> > > >>>>>>> + '--disable-pvshim --disable-seabios', d)} \
> > > >>>>>>> "
> > > >>>>>>>
> > > >>>>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share=
/firmware/vgabios-0.7a.bin"
> > > >>>>>>> --
> > > >>>>>>> 2.25.1
> > > >>>>>>>
> > > >>>>>>>
> > > >>>>>>>
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> IMPORTANT NOTICE: The contents of this email and any attachmen=
ts are confidential and may also be privileged. If you are not the intended=
 recipient, please notify the sender immediately and do not disclose the co=
ntents to any other person, use it for any purpose, or store or copy the in=
formation in any medium. Thank you.
> > > >>>>>
> > > >>>>>
> > > >>>>>
> > > >>>>> --
> > > >>>>> - Thou shalt not follow the NULL pointer, for chaos and madness=
 await
> > > >>>>> thee at its end
> > > >>>>> - "Use the force Harry" - Gandalf, Star Trek II
> > > >>>>
> > > >>>> IMPORTANT NOTICE: The contents of this email and any attachments=
 are confidential and may also be privileged. If you are not the intended r=
ecipient, please notify the sender immediately and do not disclose the cont=
ents to any other person, use it for any purpose, or store or copy the info=
rmation in any medium. Thank you.
> > > >>>
> > > >>>
> > > >>>
> > > >>> --
> > > >>> - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
> > > >>> thee at its end
> > > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > > >>
> > > >> IMPORTANT NOTICE: The contents of this email and any attachments a=
re confidential and may also be privileged. If you are not the intended rec=
ipient, please notify the sender immediately and do not disclose the conten=
ts to any other person, use it for any purpose, or store or copy the inform=
ation in any medium. Thank you.
> > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informati=
on in any medium. Thank you.
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7253): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7253
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

