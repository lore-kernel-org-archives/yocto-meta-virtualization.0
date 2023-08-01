Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D40DC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 18:33:04 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.20947.1690914782808479642
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Aug 2023 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=A+YHcfW/;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-348c6696960so22944715ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 11:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690914782; x=1691519582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96+7qBikpKd27BQDZa/tWghkno1F//RT6lUCnxGizsA=;
        b=A+YHcfW/RytJkxLMSxd3hMgbLSjQHPBj8Xh/x5HhfeNeDN+9+3g58nJt39z/VP7owa
         DmqDQo7R4TRCR/9HvlY9WMEJRwIm+ULLGp18DkGpwjCkMUyYrC/D+Ezvt/nLtbwjG4tF
         5yqiMCr4g3ls8McYUFR1cw3epBxzI+TOYev6fg88jQLsiJ5DJfIZmQi+QeynclAJkTrp
         wju1KdVHqQQnKPJbnoDnbqXUZzZyqswupD5cVzYrTbJK71hJUJFYtGGAOT9VghTkVGI0
         HGwcn1V/z7Mky0ZP+DbXh4utAkqWF4IBtlmWby82yJa5bXB+TcZP4fZFoRquoI54hKz9
         BoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690914782; x=1691519582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96+7qBikpKd27BQDZa/tWghkno1F//RT6lUCnxGizsA=;
        b=mEMB5DDSY9L/k6sHznM+mhaqyYYclgvrQJX6ts00fIpDVaSSaWzIolqOk/5yRsBqBM
         c6pjNJ2ER6ukvTSxgFUi/8uMWxCFqRCSsc9ssAa7/qOyvT7TwXt5qOiQCy0vhvTzf4NL
         /lWAmU5b/QSaRYcjA5ql6YdW+5XrDTd8vHihkd74YSwtgz4SAJlPDt9hCFWTOaa6l7yH
         dv2SkbzKAKao56EG0u42AW5YQhltIxsnKCTkZsU9cjlwVjddxWn4wU4k/E0LpfDUuzLA
         +mLUv9Fe5eSXklvOhPdxyGFuQedVPnaiy6qWauR/WQMXQ5An51hsBvsgYOXoWo6PVW/Q
         r0HQ==
X-Gm-Message-State: ABy/qLYYY5cAaCFrtfs5PthuGWe3xgobzBCdBHmNapvdotJxDaP5GoNH
	tecuAMi/bJUiWtJs2loRAqypq2okpfDpoA/X1CM=
X-Google-Smtp-Source: APBJJlGtwzPA2Y52a4FxOQeNEOs2w8pRzIfpENwyd4P9eTEoYuZVnduCeDMrzI3c0c+EA1tp/y9wvg3iFlhRNAOMzDk=
X-Received: by 2002:a05:6e02:dc8:b0:348:fe78:e9d0 with SMTP id
 l8-20020a056e020dc800b00348fe78e9d0mr11127908ilj.6.1690914781887; Tue, 01 Aug
 2023 11:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com> <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
 <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com> <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
In-Reply-To: <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Aug 2023 14:33:00 -0400
Message-ID: <CADkTA4OL0j4v=kSCxhFQNmo1ouMcV+yZy86L1ew_SX9arb3mnQ@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 18:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8158

On Mon, Jul 31, 2023 at 2:20=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
>
>
> On Fri, Jul 28, 2023 at 5:52=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> I'm travelling today, so I can't formulate a full answer at the moment.
>>
>> I just wanted to let everyone know that I have been reading and do
>> have an opinion which I'll send out when I get a chance to properly
>> write an email.
>>
>> I hadn't seen the patches in great detail before this send, so I need
>> to go through things and have a closer look.
>>
>> Generally speaking, I support having related recipes in a layer, as a
>> full reference stack.  Perhaps there's a subset of things that are too
>> hardware/board specific, but again, I haven't looked in detail yet.
>> Layer "expansion" is also an issue for maintenance in the overall
>> ecosystem. Having too many layers is an issue for maintenance, along
>> with having too few layers that don't have a clean split between
>> distro/machine and functionality.
>>
>>
>> Even if some of this does land in a non-xilinx specific layer (that
>> isn't meta-virt), we'd be well served to have a README or other file
>> in meta-virt that explains how to build for hardware platforms. Having
>> only qemu available in meta-virt, and then having integrators wander
>> off into the wild world of non peer reviewed vendor layers and forks
>> of various components is something that I've been concerned about for
>> quite some time.
>
>
> Thanks for replying -- the challenges of dealing with layer proliferation=
 are real, which is part of what motivated the introduction of the dynamic =
layer for the Raspberry Pi board in support of enabling simpler testing, an=
d I hadn't given that enough consideration in my response earlier. Without =
a reference document or direct example, it's not easy - it takes practical =
experience and persistence with it at the moment, so thanks for doing that =
work, Sandeep, and I apologise. The dynamic layers are good for enabling co=
mpatibility with composition and these changes are in support of a positive=
 experience with enabling Xen platforms, so please continue.
>

I'm finally back at a keyboard after 20+ hours of driving in the past 4 day=
s.

I won't dig in much more to the patches, but I wanted to be clear that
I wasn't criticizing your comment in the slightest. We need that sort
of review.

If we do find something that is inappropriate that I miss in the
patches, please flag it and I'll remove it and ask for it to go to a
BSP layer.

Cheers,

Bruce

> best,
>
> Christopher
>
>>
>>
>> That all being said, don't take any of the above as more than my
>> initial thoughts. I'm extremely pleased to see Christophers review and
>> questions .. that's exactly what we need!
>>
>> Bruce
>>
>>
>>
>> On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
>> <christopher.w.clark@gmail.com> wrote:
>> >
>> > +CC Bertrand
>> >
>> > On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via lis=
ts.yoctoproject.org <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.or=
g> wrote:
>> >>
>> >> Hi Chris,
>> >>
>> >> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org wr=
ote:
>> >>
>> >>
>> >> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <sande=
ep.gundlupet-raju@amd.com> wrote:
>> >>>
>> >>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal devic=
es.
>> >>
>> >>
>> >> Hi Sandeep - this is a slightly surprising submission. I'm unsure abo=
ut meta-virtualization being the right place for this as typically hardware=
 enablement is more appropriately done in a BSP layer, where engineers who =
have knowledge about and access to specific hardware can collaborate on mai=
ntaining the machine-specific aspects of recipes.
>> >>
>> >> [Sandeep]: I checked with Bruce before I submit the patches, Since we=
 had xilinx dynamic layer, he has no objection in accepting the patches.
>> >
>> >
>> > That is generous, but I think you could make the layer maintenance res=
ponsibilities easier and help with establishing good practice for hardware =
support if these changes can go into a BSP layer instead, if that is an opt=
ion? I do appreciate that you are working on enabling Xen to work on additi=
onal platforms.
>> >
>> > The Xilinx dynamic layer could be removed from meta-virtualization by =
adding its Xen image creation logic to the primary Xen hypervisor recipe --=
 possibly with a new mkimage task? --  to be enabled via new settings in an=
 Arm or Xilinx MACHINE configuration.
>> >
>> >>
>> >> Xen in this (non-BSP) layer has support for qemu MACHINES, plus gener=
ic x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latte=
r is a special-case that has been discussed by Xen and Yocto community memb=
ers as a basic commodity reference hardware platform for testing (and using=
) Xen, and the community for this layer has more of the interested parties =
participating in it than meta-raspberrypi does.
>> >>
>> >> Are you experiencing difficulties with maintaining your Xen recipe co=
mponents in a separate layer?
>> >>
>> >> [Sandeep]: No we are not experiencing any difficulties in maintaining=
 these files, currently all the dtsi files are in meta-petalinux layer and =
if users are using without meta-petalinux distro layer(building xen-image-m=
inimal), then Xen doesn't work on ZynqMP and Versal devices.
>> >
>> >
>> > Do you know which layer defines the MACHINE configurations for those h=
ardware devices? It seems like that could be a suitable BSP layer for these=
 changes?
>> >
>> >>
>> >> Mark Hatle and myself we discussed on this and we saw rpi u-boot scri=
pt and other files in this layer, we thought this is a good place to move t=
hese files.
>> >
>> >
>> > I see how the raspberry pi dynamic layer can give that impression whic=
h is unfortunate. The motivation for the inclusion of the rpi files in meta=
-virtualization is to enable collaboration on hardware testing (and reprodu=
ction and diagnosis if needed) of the Arm architecture functionality of the=
 primary Xen recipes, on a low-cost commodity hardware board, with agreemen=
t on this from Xen stakeholders at multiple different organizations. X86 do=
esn't need it as generic x86-64 support (see meta-yocto-bsp) is enough.
>> >
>> > Christopher
>> >
>> >
>> >>
>> >> Mark can chime in here to add any additional comments.
>> >>
>> >>
>> >> Christopher
>> >>
>> >>>
>> >>>
>> >>> User can enable xen u-boot script by adding below variable from
>> >>> configuration file as shown below.
>> >>>
>> >>> BOOTMODE =3D "xen"
>> >>>
>> >>> This u-boot script also supports to configure below Xen params from
>> >>> configuration file.
>> >>>
>> >>> params          variable assignment
>> >>> ------          -------------------
>> >>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
>> >>> dom0_mem        DOM0_MEM =3D "1500M"
>> >>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
>> >>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>> >>>
>> >>> Sandeep Gundlupet Raju (2):
>> >>>   recipes-bsp: Add device-tree files for Xen support
>> >>>   recipes-bsp: Add u-boot-xlnx scripts for Xen support
>> >>>
>> >>>  .../device-tree/device-tree.bbappend          |  19 +++
>> >>>  .../files/versal-net-xen-qemu.dtsi            |   2 +
>> >>>  .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>> >>>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>> >>>  .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>> >>>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>> >>>  .../device-tree/files/zynqmp-xen.dtsi         | 123 +++++++++++++++=
+++
>> >>>  .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>> >>>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>> >>>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>> >>>  10 files changed, 408 insertions(+)
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/de=
vice-tree.bbappend
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/versal-net-xen-qemu.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/versal-net-xen.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/versal-xen-qemu.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/versal-xen.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/zynqmp-xen-qemu.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/fi=
les/zynqmp-xen.dtsi
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-=
xlnx-scr.bbappend
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-=
xlnx-scr/boot.cmd.xen
>> >>>  create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boo=
t-cmd.inc
>> >>>
>> >>> --
>> >>> 2.34.1
>> >>>
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#8146): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8146
>> >> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/3619037
>> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [christopher.w.clark@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

