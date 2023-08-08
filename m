Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8737EC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 18:01:31 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.68957.1691517682499389777
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 11:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iBrifglT;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-348d6bc349eso26952435ab.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691517681; x=1692122481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2Pz1xEQSQhRJzQ5VBTC/oywMuTC3+rKslQmCYX09gQ=;
        b=iBrifglTVab02sOtFo5r8vYHUabpp/NZ9HyvDOZ7h2OHeWx11tPIDPWetL4/fxvHGc
         2uuXnibjPnUDafOCUI+WiUQkYwTALZBTj54TC+q3sO64NtDzKI29GCTk/1/KVU8lLQ0t
         iH/sh9bw3Lz54QCubtaTxRfcjZZ8Lwc4ksJVzgnP0g/TCSXPCbC6NvZxMxQAnsDsqYrv
         soufqefyOZaXM8l3oIi8Xbhg0RSCaiV4ZCZynzSQbNlT2wGvOTUuSw3tnjWE6qu64mPj
         uHiPL+bQLbKpX0muyct/Od40mF25gREEIowWDSOSjwnpXC0VqPB3kvasRADJICqu4Cuy
         cF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691517681; x=1692122481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2Pz1xEQSQhRJzQ5VBTC/oywMuTC3+rKslQmCYX09gQ=;
        b=XOx9797LhADaLIts+V4oxDev0KxpQ/jnGdIBP53i3KMTnzvVyBnulEehR05SSFimCr
         nLc4DAvS7xVzxGHqaXQow5LhynhcbyGzQ+o8680AYdBm7spUSomWATORIRhlS7HjkkaM
         OjAVgE9X/BZoUz2GnwM5yx298Q9F9z1S+ASEjNXZgAYO2dDdumC9svh9Xr9cPd7qhLMI
         CMnxKdN54/8gnbR14RURoo2WD3PbRdQVren/9Q8ukvOXDA7BDpHOdVoixzYrJdNjwOqd
         MhV7gz0MORV3gh7dbyjZTKZBsabCeGMCEuQAg3czhB46VuVbT+zWC21HFt+Fjg6KophS
         TAbg==
X-Gm-Message-State: AOJu0YxCdia1G+nej5qH+67V2aTNqqLByHQUw1IpqoHr68i5jykmQcEo
	NXFTjtH7K5p79JVHvqLsmLQfCBMZRqdj2u3b3V4=
X-Google-Smtp-Source: AGHT+IEDuy2fVPizCfhjOztoGt7duH4nF41kcCi6zmQEE4tgqwkj+aFvEAnTR5MlrQUbbM7hKqM4/S4vWuxDYUuMiPQ=
X-Received: by 2002:a05:6e02:1c0b:b0:349:3020:d103 with SMTP id
 l11-20020a056e021c0b00b003493020d103mr550726ilh.25.1691517681484; Tue, 08 Aug
 2023 11:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com> <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
 <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
 <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
 <CADkTA4OL0j4v=kSCxhFQNmo1ouMcV+yZy86L1ew_SX9arb3mnQ@mail.gmail.com> <90adcafb-a036-020b-2d34-d85c06a7d179@amd.com>
In-Reply-To: <90adcafb-a036-020b-2d34-d85c06a7d179@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Aug 2023 14:01:19 -0400
Message-ID: <CADkTA4Myee3=c1yXctAvvgrBLJiT-HQdCpkCGm2wTsuWXJA4tQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 18:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8171

On Tue, Aug 8, 2023 at 1:48=E2=80=AFPM Gundlupet Raju, Sandeep
<sandeep.gundlupet-raju@amd.com> wrote:
>
> Hi Bruce, Chris,
>
> Thanks for considering this.
>
> On 8/1/2023 12:33 PM, Bruce Ashfield wrote:
> > On Mon, Jul 31, 2023 at 2:20=E2=80=AFPM Christopher Clark
> > <christopher.w.clark@gmail.com> wrote:
> >>
> >>
> >> On Fri, Jul 28, 2023 at 5:52=E2=80=AFAM Bruce Ashfield <bruce.ashfield=
@gmail.com> wrote:
> >>> I'm travelling today, so I can't formulate a full answer at the momen=
t.
> >>>
> >>> I just wanted to let everyone know that I have been reading and do
> >>> have an opinion which I'll send out when I get a chance to properly
> >>> write an email.
> >>>
> >>> I hadn't seen the patches in great detail before this send, so I need
> >>> to go through things and have a closer look.
> >>>
> >>> Generally speaking, I support having related recipes in a layer, as a
> >>> full reference stack.  Perhaps there's a subset of things that are to=
o
> >>> hardware/board specific, but again, I haven't looked in detail yet.
> >>> Layer "expansion" is also an issue for maintenance in the overall
> >>> ecosystem. Having too many layers is an issue for maintenance, along
> >>> with having too few layers that don't have a clean split between
> >>> distro/machine and functionality.
> >>>
> >>>
> >>> Even if some of this does land in a non-xilinx specific layer (that
> >>> isn't meta-virt), we'd be well served to have a README or other file
> >>> in meta-virt that explains how to build for hardware platforms. Havin=
g
> >>> only qemu available in meta-virt, and then having integrators wander
> >>> off into the wild world of non peer reviewed vendor layers and forks
> >>> of various components is something that I've been concerned about for
> >>> quite some time.
> >>
> >> Thanks for replying -- the challenges of dealing with layer proliferat=
ion are real, which is part of what motivated the introduction of the dynam=
ic layer for the Raspberry Pi board in support of enabling simpler testing,=
 and I hadn't given that enough consideration in my response earlier. Witho=
ut a reference document or direct example, it's not easy - it takes practic=
al experience and persistence with it at the moment, so thanks for doing th=
at work, Sandeep, and I apologise. The dynamic layers are good for enabling=
 compatibility with composition and these changes are in support of a posit=
ive experience with enabling Xen platforms, so please continue.
> >>
> > I'm finally back at a keyboard after 20+ hours of driving in the past 4=
 days.
> >
> > I won't dig in much more to the patches, but I wanted to be clear that
> > I wasn't criticizing your comment in the slightest. We need that sort
> > of review.
> >
> > If we do find something that is inappropriate that I miss in the
> > patches, please flag it and I'll remove it and ask for it to go to a
> > BSP layer.
> [Sandeep]: Bruce any updates on patch review? Mark Hatle had a minor one
> on commit message. I was thinking to send a v2 patch once Bruce has
> finished his review.

I didn't see anything that was a red-flag to remove, so I've merged it
as-is to master.

If anything causes issues, we'll revisit and do incremental updates.

Bruce

> > Cheers,
> >
> > Bruce
> >
> >> best,
> >>
> >> Christopher
> >>
> >>>
> >>> That all being said, don't take any of the above as more than my
> >>> initial thoughts. I'm extremely pleased to see Christophers review an=
d
> >>> questions .. that's exactly what we need!
> >>>
> >>> Bruce
> >>>
> >>>
> >>>
> >>> On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
> >>> <christopher.w.clark@gmail.com> wrote:
> >>>> +CC Bertrand
> >>>>
> >>>> On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via l=
ists.yoctoproject.org <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.=
org> wrote:
> >>>>> Hi Chris,
> >>>>>
> >>>>> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org =
wrote:
> >>>>>
> >>>>>
> >>>>> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <san=
deep.gundlupet-raju@amd.com> wrote:
> >>>>>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal dev=
ices.
> >>>>>
> >>>>> Hi Sandeep - this is a slightly surprising submission. I'm unsure a=
bout meta-virtualization being the right place for this as typically hardwa=
re enablement is more appropriately done in a BSP layer, where engineers wh=
o have knowledge about and access to specific hardware can collaborate on m=
aintaining the machine-specific aspects of recipes.
> >>>>>
> >>>>> [Sandeep]: I checked with Bruce before I submit the patches, Since =
we had xilinx dynamic layer, he has no objection in accepting the patches.
> >>>>
> >>>> That is generous, but I think you could make the layer maintenance r=
esponsibilities easier and help with establishing good practice for hardwar=
e support if these changes can go into a BSP layer instead, if that is an o=
ption? I do appreciate that you are working on enabling Xen to work on addi=
tional platforms.
> >>>>
> >>>> The Xilinx dynamic layer could be removed from meta-virtualization b=
y adding its Xen image creation logic to the primary Xen hypervisor recipe =
-- possibly with a new mkimage task? --  to be enabled via new settings in =
an Arm or Xilinx MACHINE configuration.
> >>>>
> >>>>> Xen in this (non-BSP) layer has support for qemu MACHINES, plus gen=
eric x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the lat=
ter is a special-case that has been discussed by Xen and Yocto community me=
mbers as a basic commodity reference hardware platform for testing (and usi=
ng) Xen, and the community for this layer has more of the interested partie=
s participating in it than meta-raspberrypi does.
> >>>>>
> >>>>> Are you experiencing difficulties with maintaining your Xen recipe =
components in a separate layer?
> >>>>>
> >>>>> [Sandeep]: No we are not experiencing any difficulties in maintaini=
ng these files, currently all the dtsi files are in meta-petalinux layer an=
d if users are using without meta-petalinux distro layer(building xen-image=
-minimal), then Xen doesn't work on ZynqMP and Versal devices.
> >>>>
> >>>> Do you know which layer defines the MACHINE configurations for those=
 hardware devices? It seems like that could be a suitable BSP layer for the=
se changes?
> >>>>
> >>>>> Mark Hatle and myself we discussed on this and we saw rpi u-boot sc=
ript and other files in this layer, we thought this is a good place to move=
 these files.
> >>>>
> >>>> I see how the raspberry pi dynamic layer can give that impression wh=
ich is unfortunate. The motivation for the inclusion of the rpi files in me=
ta-virtualization is to enable collaboration on hardware testing (and repro=
duction and diagnosis if needed) of the Arm architecture functionality of t=
he primary Xen recipes, on a low-cost commodity hardware board, with agreem=
ent on this from Xen stakeholders at multiple different organizations. X86 =
doesn't need it as generic x86-64 support (see meta-yocto-bsp) is enough.
> >>>>
> >>>> Christopher
> >>>>
> >>>>
> >>>>> Mark can chime in here to add any additional comments.
> >>>>>
> >>>>>
> >>>>> Christopher
> >>>>>
> >>>>>>
> >>>>>> User can enable xen u-boot script by adding below variable from
> >>>>>> configuration file as shown below.
> >>>>>>
> >>>>>> BOOTMODE =3D "xen"
> >>>>>>
> >>>>>> This u-boot script also supports to configure below Xen params fro=
m
> >>>>>> configuration file.
> >>>>>>
> >>>>>> params          variable assignment
> >>>>>> ------          -------------------
> >>>>>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
> >>>>>> dom0_mem        DOM0_MEM =3D "1500M"
> >>>>>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
> >>>>>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
> >>>>>>
> >>>>>> Sandeep Gundlupet Raju (2):
> >>>>>>    recipes-bsp: Add device-tree files for Xen support
> >>>>>>    recipes-bsp: Add u-boot-xlnx scripts for Xen support
> >>>>>>
> >>>>>>   .../device-tree/device-tree.bbappend          |  19 +++
> >>>>>>   .../files/versal-net-xen-qemu.dtsi            |   2 +
> >>>>>>   .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
> >>>>>>   .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
> >>>>>>   .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
> >>>>>>   .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
> >>>>>>   .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++=
++++++
> >>>>>>   .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
> >>>>>>   .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
> >>>>>>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
> >>>>>>   10 files changed, 408 insertions(+)
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/device-tree.bbappend
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/versal-net-xen-qemu.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/versal-net-xen.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/versal-xen-qemu.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/versal-xen.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/zynqmp-xen-qemu.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree=
/files/zynqmp-xen.dtsi
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-bo=
ot-xlnx-scr.bbappend
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-bo=
ot-xlnx-scr/boot.cmd.xen
> >>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-=
boot-cmd.inc
> >>>>>>
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>> Links: You receive all messages sent to this group.
> >>>>> View/Reply Online (#8146): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/8146
> >>>>> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/361903=
7
> >>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [christopher.w.clark@gmail.com]
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

