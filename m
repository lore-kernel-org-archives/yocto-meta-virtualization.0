Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08880C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:52:57 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.31349.1690548766831517610
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jul 2023 05:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ANaRCHfu;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-78bb3ff7cbcso83432839f.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jul 2023 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690548766; x=1691153566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoFXS4H0CZUUHe0ruErqTux/grAi3XOU1pBPbi5FPtM=;
        b=ANaRCHfudWO1ZaxD8mz/BBstwmtyfbWSV9dzisMOfRp/VlZk/CfcrKtZFByHI3PZ51
         PxmGrTR6VKsuEoPKND74JJ6cUXmuU8jICdIMMaqAeqnmwHa1r9iMH5aWzd5KIqqabtpn
         N6eEx3sjR+WKKlKlsgAvtfJwNvVfXcxIdcxcIB5v/Nzj9Si46ncK8Og+GKYOsbwQEQLG
         EldSIC3rRce7iSQrj6copvg6tzUC71kD5HOj+oyDTWi9eFtv80WZ8CgYJ0gULEubxwim
         eE+SDSSMMC8A1kA+Mln8Njy9Ca/XoadAsb3rUozVzToQ/bk1VScDt0NUzleLZyfauhko
         oNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548766; x=1691153566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoFXS4H0CZUUHe0ruErqTux/grAi3XOU1pBPbi5FPtM=;
        b=gHZ5GPLcFZK70fqLEA00iPoHwJ1EiAZEsyAI/7wYo0hd/8TSYzkTrrUHHtbKCXMZuo
         zhfnthk5eQYerOBqkj7K01ZF9aTSpaHSC8H0ng6FBcgWMs2n/N3OjKIDlsFtSrp7WVb5
         1rCDU1aWNRKWkET6o8fMKXs6ZP0jM78nw2Ty7XuDx6qRX1KGcQhegjcon/camyT41G5g
         yCUwjcnmgH9NKyIIQvR6wWqREV6RSiLgy751OCVoCu/aCS91yw2YN+Cj0p1/LUomQP37
         YGV15vGlbpC7VL4H/Qm8rwCOJ9MBhagZpWKsIX4Ed6v0PgGoNJegrftmbxAi6yqcTb5r
         ay0w==
X-Gm-Message-State: ABy/qLZjP+nufmyA/vzyIfoSN9dKhlO0knIZ7H4crQFKqL4F2sxmgsGR
	LJZ+V5NEGwU8hETpt9WSyC9TFXpn3XQv1YFHEeM=
X-Google-Smtp-Source: APBJJlGnuNzT1CDG4yhrYzbgd2+CvojIqP5aSaL7SEQDWLCBo+gkPenlCcCGmS7pFn7l3xGRhPPQ9iVHkplZ1fszOaU=
X-Received: by 2002:a6b:6a05:0:b0:786:2b08:709d with SMTP id
 x5-20020a6b6a05000000b007862b08709dmr2732464iog.13.1690548765948; Fri, 28 Jul
 2023 05:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com> <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
In-Reply-To: <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 28 Jul 2023 08:52:35 -0400
Message-ID: <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: sandeep.gundlupet-raju@amd.com, meta-virtualization@lists.yoctoproject.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jul 2023 12:52:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8149

I'm travelling today, so I can't formulate a full answer at the moment.

I just wanted to let everyone know that I have been reading and do
have an opinion which I'll send out when I get a chance to properly
write an email.

I hadn't seen the patches in great detail before this send, so I need
to go through things and have a closer look.

Generally speaking, I support having related recipes in a layer, as a
full reference stack.  Perhaps there's a subset of things that are too
hardware/board specific, but again, I haven't looked in detail yet.
Layer "expansion" is also an issue for maintenance in the overall
ecosystem. Having too many layers is an issue for maintenance, along
with having too few layers that don't have a clean split between
distro/machine and functionality.

Even if some of this does land in a non-xilinx specific layer (that
isn't meta-virt), we'd be well served to have a README or other file
in meta-virt that explains how to build for hardware platforms. Having
only qemu available in meta-virt, and then having integrators wander
off into the wild world of non peer reviewed vendor layers and forks
of various components is something that I've been concerned about for
quite some time.

That all being said, don't take any of the above as more than my
initial thoughts. I'm extremely pleased to see Christophers review and
questions .. that's exactly what we need!

Bruce



On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> +CC Bertrand
>
> On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via lists.=
yoctoproject.org <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.org> =
wrote:
>>
>> Hi Chris,
>>
>> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org wrote=
:
>>
>>
>> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <sandeep.=
gundlupet-raju@amd.com> wrote:
>>>
>>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal devices.
>>
>>
>> Hi Sandeep - this is a slightly surprising submission. I'm unsure about =
meta-virtualization being the right place for this as typically hardware en=
ablement is more appropriately done in a BSP layer, where engineers who hav=
e knowledge about and access to specific hardware can collaborate on mainta=
ining the machine-specific aspects of recipes.
>>
>> [Sandeep]: I checked with Bruce before I submit the patches, Since we ha=
d xilinx dynamic layer, he has no objection in accepting the patches.
>
>
> That is generous, but I think you could make the layer maintenance respon=
sibilities easier and help with establishing good practice for hardware sup=
port if these changes can go into a BSP layer instead, if that is an option=
? I do appreciate that you are working on enabling Xen to work on additiona=
l platforms.
>
> The Xilinx dynamic layer could be removed from meta-virtualization by add=
ing its Xen image creation logic to the primary Xen hypervisor recipe -- po=
ssibly with a new mkimage task? --  to be enabled via new settings in an Ar=
m or Xilinx MACHINE configuration.
>
>>
>> Xen in this (non-BSP) layer has support for qemu MACHINES, plus generic =
x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latter i=
s a special-case that has been discussed by Xen and Yocto community members=
 as a basic commodity reference hardware platform for testing (and using) X=
en, and the community for this layer has more of the interested parties par=
ticipating in it than meta-raspberrypi does.
>>
>> Are you experiencing difficulties with maintaining your Xen recipe compo=
nents in a separate layer?
>>
>> [Sandeep]: No we are not experiencing any difficulties in maintaining th=
ese files, currently all the dtsi files are in meta-petalinux layer and if =
users are using without meta-petalinux distro layer(building xen-image-mini=
mal), then Xen doesn't work on ZynqMP and Versal devices.
>
>
> Do you know which layer defines the MACHINE configurations for those hard=
ware devices? It seems like that could be a suitable BSP layer for these ch=
anges?
>
>>
>> Mark Hatle and myself we discussed on this and we saw rpi u-boot script =
and other files in this layer, we thought this is a good place to move thes=
e files.
>
>
> I see how the raspberry pi dynamic layer can give that impression which i=
s unfortunate. The motivation for the inclusion of the rpi files in meta-vi=
rtualization is to enable collaboration on hardware testing (and reproducti=
on and diagnosis if needed) of the Arm architecture functionality of the pr=
imary Xen recipes, on a low-cost commodity hardware board, with agreement o=
n this from Xen stakeholders at multiple different organizations. X86 doesn=
't need it as generic x86-64 support (see meta-yocto-bsp) is enough.
>
> Christopher
>
>
>>
>> Mark can chime in here to add any additional comments.
>>
>>
>> Christopher
>>
>>>
>>>
>>> User can enable xen u-boot script by adding below variable from
>>> configuration file as shown below.
>>>
>>> BOOTMODE =3D "xen"
>>>
>>> This u-boot script also supports to configure below Xen params from
>>> configuration file.
>>>
>>> params          variable assignment
>>> ------          -------------------
>>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
>>> dom0_mem        DOM0_MEM =3D "1500M"
>>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
>>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>>>
>>> Sandeep Gundlupet Raju (2):
>>>   recipes-bsp: Add device-tree files for Xen support
>>>   recipes-bsp: Add u-boot-xlnx scripts for Xen support
>>>
>>>  .../device-tree/device-tree.bbappend          |  19 +++
>>>  .../files/versal-net-xen-qemu.dtsi            |   2 +
>>>  .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>>>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>>>  .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>>>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>>>  .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++++
>>>  .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>>>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>>>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>>>  10 files changed, 408 insertions(+)
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/devic=
e-tree.bbappend
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/versal-net-xen-qemu.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/versal-net-xen.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/versal-xen-qemu.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/versal-xen.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/zynqmp-xen-qemu.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/files=
/zynqmp-xen.dtsi
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xln=
x-scr.bbappend
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xln=
x-scr/boot.cmd.xen
>>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-c=
md.inc
>>>
>>> --
>>> 2.34.1
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8146): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8146
>> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/3619037
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[christopher.w.clark@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

