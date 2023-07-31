Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D77C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:20:53 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.2767.1690827646886244246
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 11:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Az8jE8lV;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5222bc91838so7183407a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690827645; x=1691432445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sK5LqjSJCYnYJbUSnUS1BrDtJcvynwGy9Eev3sp956w=;
        b=Az8jE8lVhTmj5Xx1GYTnN0CCFIQuG9v+WF3dv2bviQGDfvd7GwNIO6mWgSkRkNsLic
         x281fNb5Euso/cpmL0qkEiWw1ul0rnoyp5jNWRNhTAv+wh+3X0ikRg4JofFA4NDtohrQ
         NVRQ9tFoP19+rN4yRvuV96V5EwcJozoDWYnNTQgah+VzZKDsrK7B9GSyHeElSi1RUOYr
         gPMlzA51D2xLwQhMaZNCZylsH12kon5rgZO5QPLf6ktEnAsWzF3JhP3e+q+U0AMM1TlT
         vkrkjQdGr0YufybpSHraVywcY8prq/jYNBH/3wviNwjEgnXEEnOIbSuf/ByZeOG/WndY
         goww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690827645; x=1691432445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sK5LqjSJCYnYJbUSnUS1BrDtJcvynwGy9Eev3sp956w=;
        b=jZ2TMPBHnXGBPn17+OmStVW7VD09Ng6uvh2MphsItLy3loljlxObcWIIfZ3WLo6FEH
         WlrEGb+CAWp9kaaNcISADcX1uenWTS+55BZYepL/PdgUMwqv1K7LtwjmQTkDXK9ZS9A+
         BbMhERcudAaxHwYk+/GIjDNZeek/XBthw6Euucs/Dkbl6me6kClvL7ef53NcOckaSt1k
         VwzFr5M0gxp30P4GTSNbCXgg16+bNzrikOrWFmMs/lj1iCVzL4DF2fC21I/3i8/W4ihW
         4W2IO2908/aqO/DT4Z0hVBcdYm4ql+YvzSijBuIsmrv0RWKG136MToB/svAuqkebyW7T
         fZOQ==
X-Gm-Message-State: ABy/qLaYqzxWrlJwg8ztCMLaavoAdKdke7Y5vEIgPP59vZx4o/D+caCT
	KrIbwRXkQ9A8Egj8MkCVfUDhwF4J3/2SjZsjlwo=
X-Google-Smtp-Source: APBJJlHHZ1HaW7w2tr9BOswgFlmZz2ZSW87nIcacMJM3EVBWiMk+Ah6L06RQw+cZUjwTN55IKQMvOvNBjjCgoxc8RYA=
X-Received: by 2002:aa7:c418:0:b0:522:d6f4:c0e8 with SMTP id
 j24-20020aa7c418000000b00522d6f4c0e8mr562477edq.20.1690827644946; Mon, 31 Jul
 2023 11:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com> <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
 <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
In-Reply-To: <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 31 Jul 2023 11:20:32 -0700
Message-ID: <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: sandeep.gundlupet-raju@amd.com, meta-virtualization@lists.yoctoproject.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000274ce00601cc7d67"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 18:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8152

--000000000000274ce00601cc7d67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 5:52=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> I'm travelling today, so I can't formulate a full answer at the moment.
>
> I just wanted to let everyone know that I have been reading and do
> have an opinion which I'll send out when I get a chance to properly
> write an email.
>
> I hadn't seen the patches in great detail before this send, so I need
> to go through things and have a closer look.
>
> Generally speaking, I support having related recipes in a layer, as a
> full reference stack.  Perhaps there's a subset of things that are too
> hardware/board specific, but again, I haven't looked in detail yet.
> Layer "expansion" is also an issue for maintenance in the overall
> ecosystem. Having too many layers is an issue for maintenance, along
> with having too few layers that don't have a clean split between
> distro/machine and functionality.


> Even if some of this does land in a non-xilinx specific layer (that
> isn't meta-virt), we'd be well served to have a README or other file
> in meta-virt that explains how to build for hardware platforms. Having
> only qemu available in meta-virt, and then having integrators wander
> off into the wild world of non peer reviewed vendor layers and forks
> of various components is something that I've been concerned about for
> quite some time.
>

Thanks for replying -- the challenges of dealing with layer
proliferation are real, which is part of what motivated the introduction of
the dynamic layer for the Raspberry Pi board in support of enabling simpler
testing, and I hadn't given that enough consideration in my response
earlier. Without a reference document or direct example, it's not easy - it
takes practical experience and persistence with it at the moment, so thanks
for doing that work, Sandeep, and I apologise. The dynamic layers are good
for enabling compatibility with composition and these changes are in
support of a positive experience with enabling Xen platforms, so please
continue.

best,

Christopher


>
> That all being said, don't take any of the above as more than my
> initial thoughts. I'm extremely pleased to see Christophers review and
> questions .. that's exactly what we need!
>
> Bruce
>
>
>
> On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > +CC Bertrand
> >
> > On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via
> lists.yoctoproject.org <sandeep.gundlupet-raju=3D
> amd.com@lists.yoctoproject.org> wrote:
> >>
> >> Hi Chris,
> >>
> >> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org
> wrote:
> >>
> >>
> >> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <
> sandeep.gundlupet-raju@amd.com> wrote:
> >>>
> >>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal device=
s.
> >>
> >>
> >> Hi Sandeep - this is a slightly surprising submission. I'm unsure abou=
t
> meta-virtualization being the right place for this as typically hardware
> enablement is more appropriately done in a BSP layer, where engineers who
> have knowledge about and access to specific hardware can collaborate on
> maintaining the machine-specific aspects of recipes.
> >>
> >> [Sandeep]: I checked with Bruce before I submit the patches, Since we
> had xilinx dynamic layer, he has no objection in accepting the patches.
> >
> >
> > That is generous, but I think you could make the layer maintenance
> responsibilities easier and help with establishing good practice for
> hardware support if these changes can go into a BSP layer instead, if tha=
t
> is an option? I do appreciate that you are working on enabling Xen to wor=
k
> on additional platforms.
> >
> > The Xilinx dynamic layer could be removed from meta-virtualization by
> adding its Xen image creation logic to the primary Xen hypervisor recipe =
--
> possibly with a new mkimage task? --  to be enabled via new settings in a=
n
> Arm or Xilinx MACHINE configuration.
> >
> >>
> >> Xen in this (non-BSP) layer has support for qemu MACHINES, plus generi=
c
> x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latter
> is a special-case that has been discussed by Xen and Yocto community
> members as a basic commodity reference hardware platform for testing (and
> using) Xen, and the community for this layer has more of the interested
> parties participating in it than meta-raspberrypi does.
> >>
> >> Are you experiencing difficulties with maintaining your Xen recipe
> components in a separate layer?
> >>
> >> [Sandeep]: No we are not experiencing any difficulties in maintaining
> these files, currently all the dtsi files are in meta-petalinux layer and
> if users are using without meta-petalinux distro layer(building
> xen-image-minimal), then Xen doesn't work on ZynqMP and Versal devices.
> >
> >
> > Do you know which layer defines the MACHINE configurations for those
> hardware devices? It seems like that could be a suitable BSP layer for
> these changes?
> >
> >>
> >> Mark Hatle and myself we discussed on this and we saw rpi u-boot scrip=
t
> and other files in this layer, we thought this is a good place to move
> these files.
> >
> >
> > I see how the raspberry pi dynamic layer can give that impression which
> is unfortunate. The motivation for the inclusion of the rpi files in
> meta-virtualization is to enable collaboration on hardware testing (and
> reproduction and diagnosis if needed) of the Arm architecture functionali=
ty
> of the primary Xen recipes, on a low-cost commodity hardware board, with
> agreement on this from Xen stakeholders at multiple different
> organizations. X86 doesn't need it as generic x86-64 support (see
> meta-yocto-bsp) is enough.
> >
> > Christopher
> >
> >
> >>
> >> Mark can chime in here to add any additional comments.
> >>
> >>
> >> Christopher
> >>
> >>>
> >>>
> >>> User can enable xen u-boot script by adding below variable from
> >>> configuration file as shown below.
> >>>
> >>> BOOTMODE =3D "xen"
> >>>
> >>> This u-boot script also supports to configure below Xen params from
> >>> configuration file.
> >>>
> >>> params          variable assignment
> >>> ------          -------------------
> >>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
> >>> dom0_mem        DOM0_MEM =3D "1500M"
> >>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
> >>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
> >>>
> >>> Sandeep Gundlupet Raju (2):
> >>>   recipes-bsp: Add device-tree files for Xen support
> >>>   recipes-bsp: Add u-boot-xlnx scripts for Xen support
> >>>
> >>>  .../device-tree/device-tree.bbappend          |  19 +++
> >>>  .../files/versal-net-xen-qemu.dtsi            |   2 +
> >>>  .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
> >>>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
> >>>  .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
> >>>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
> >>>  .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++=
++
> >>>  .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
> >>>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
> >>>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
> >>>  10 files changed, 408 insertions(+)
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.d=
tsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
> >>>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8146):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8146
> >> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/3619037
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b
> [christopher.w.clark@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000274ce00601cc7d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023 at 5:52=E2=80=AF=
AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D=
"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I&#39;m travelling today, so I can&#39;t f=
ormulate a full answer at the moment.<br>
<br>
I just wanted to let everyone know that I have been reading and do<br>
have an opinion which I&#39;ll send out when I get a chance to properly<br>
write an email.<br>
<br>
I hadn&#39;t seen the patches in great detail before this send, so I need<b=
r>
to go through things and have a closer look.<br>
<br>
Generally speaking, I support having related recipes in a layer, as a<br>
full reference stack.=C2=A0 Perhaps there&#39;s a subset of things that are=
 too<br>
hardware/board specific, but again, I haven&#39;t looked in detail yet.<br>
Layer &quot;expansion&quot; is also an issue for maintenance in the overall=
<br>
ecosystem. Having too many layers is an issue for maintenance, along<br>
with having too few layers that don&#39;t have a clean split between<br>
distro/machine and functionality.</blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Even if some of this does land in a non-xilinx specific layer (that<br>
isn&#39;t meta-virt), we&#39;d be well served to have a README or other fil=
e<br>
in meta-virt that explains how to build for hardware platforms. Having<br>
only qemu available in meta-virt, and then having integrators wander<br>
off into the wild world of non peer reviewed vendor layers and forks<br>
of various components is something that I&#39;ve been concerned about for<b=
r>
quite some time.<br></blockquote><div><br></div><div><div>Thanks for replyi=
ng -- the challenges of dealing with layer proliferation=C2=A0are real, whi=
ch is part of what motivated the introduction of the dynamic layer for the =
Raspberry Pi board in support of enabling simpler testing, and I hadn&#39;t=
 given that enough consideration in my response earlier. Without a referenc=
e document or direct example, it&#39;s not easy - it takes practical experi=
ence and persistence with it at the moment, so thanks for doing that work, =
Sandeep, and I apologise. The dynamic layers are good for enabling compatib=
ility with composition and these changes are in support of a positive exper=
ience with enabling Xen platforms, so please continue.</div><div><br></div>=
</div><div>best,</div><div><br></div><div>Christopher</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
That all being said, don&#39;t take any of the above as more than my<br>
initial thoughts. I&#39;m extremely pleased to see Christophers review and<=
br>
questions .. that&#39;s exactly what we need!<br>
<br>
Bruce<br>
<br>
<br>
<br>
On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark<br>
&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">chri=
stopher.w.clark@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; +CC Bertrand<br>
&gt;<br>
&gt; On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via <a =
href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.yoctoproject.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:=
amd.com@lists.yoctoproject.org" target=3D"_blank">amd.com@lists.yoctoprojec=
t.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Chris,<br>
&gt;&gt;<br>
&gt;&gt; On 7/27/2023 6:10 PM, Christopher Clark via <a href=3D"http://list=
s.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject=
.org</a> wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju &lt=
;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com" target=3D"_blank">sandee=
p.gundlupet-raju@amd.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Add Xen dt and u-boot script support for AMD ZynqMP and Versal=
 devices.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Sandeep - this is a slightly surprising submission. I&#39;m uns=
ure about meta-virtualization being the right place for this as typically h=
ardware enablement is more appropriately done in a BSP layer, where enginee=
rs who have knowledge about and access to specific hardware can collaborate=
 on maintaining the machine-specific aspects of recipes.<br>
&gt;&gt;<br>
&gt;&gt; [Sandeep]: I checked with Bruce before I submit the patches, Since=
 we had xilinx dynamic layer, he has no objection in accepting the patches.=
<br>
&gt;<br>
&gt;<br>
&gt; That is generous, but I think you could make the layer maintenance res=
ponsibilities easier and help with establishing good practice for hardware =
support if these changes can go into a BSP layer instead, if that is an opt=
ion? I do appreciate that you are working on enabling Xen to work on additi=
onal platforms.<br>
&gt;<br>
&gt; The Xilinx dynamic layer could be removed from meta-virtualization by =
adding its Xen image creation logic to the primary Xen hypervisor recipe --=
 possibly with a new mkimage task? --=C2=A0 to be enabled via new settings =
in an Arm or Xilinx MACHINE configuration.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Xen in this (non-BSP) layer has support for qemu MACHINES, plus ge=
neric x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the la=
tter is a special-case that has been discussed by Xen and Yocto community m=
embers as a basic commodity reference hardware platform for testing (and us=
ing) Xen, and the community for this layer has more of the interested parti=
es participating in it than meta-raspberrypi does.<br>
&gt;&gt;<br>
&gt;&gt; Are you experiencing difficulties with maintaining your Xen recipe=
 components in a separate layer?<br>
&gt;&gt;<br>
&gt;&gt; [Sandeep]: No we are not experiencing any difficulties in maintain=
ing these files, currently all the dtsi files are in meta-petalinux layer a=
nd if users are using without meta-petalinux distro layer(building xen-imag=
e-minimal), then Xen doesn&#39;t work on ZynqMP and Versal devices.<br>
&gt;<br>
&gt;<br>
&gt; Do you know which layer defines the MACHINE configurations for those h=
ardware devices? It seems like that could be a suitable BSP layer for these=
 changes?<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Mark Hatle and myself we discussed on this and we saw rpi u-boot s=
cript and other files in this layer, we thought this is a good place to mov=
e these files.<br>
&gt;<br>
&gt;<br>
&gt; I see how the raspberry pi dynamic layer can give that impression whic=
h is unfortunate. The motivation for the inclusion of the rpi files in meta=
-virtualization is to enable collaboration on hardware testing (and reprodu=
ction and diagnosis if needed) of the Arm architecture functionality of the=
 primary Xen recipes, on a low-cost commodity hardware board, with agreemen=
t on this from Xen stakeholders at multiple different organizations. X86 do=
esn&#39;t need it as generic x86-64 support (see meta-yocto-bsp) is enough.=
<br>
&gt;<br>
&gt; Christopher<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Mark can chime in here to add any additional comments.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Christopher<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; User can enable xen u-boot script by adding below variable fro=
m<br>
&gt;&gt;&gt; configuration file as shown below.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; BOOTMODE =3D &quot;xen&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This u-boot script also supports to configure below Xen params=
 from<br>
&gt;&gt;&gt; configuration file.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; params=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable assignment<b=
r>
&gt;&gt;&gt; ------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -------------------<b=
r>
&gt;&gt;&gt; duart=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_SERIAL_CONSO=
LES =3D &quot;serial0&quot;<br>
&gt;&gt;&gt; dom0_mem=C2=A0 =C2=A0 =C2=A0 =C2=A0 DOM0_MEM =3D &quot;1500M&q=
uot;<br>
&gt;&gt;&gt; dom0_max_vcpus=C2=A0 DOM0_MAX_VCPUS =3D &quot;1&quot;<br>
&gt;&gt;&gt; extra params=C2=A0 =C2=A0 XEN_CMDLINE_APPEND =3D &quot;loglvl=
=3Dall&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sandeep Gundlupet Raju (2):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0recipes-bsp: Add device-tree files for Xen support=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0recipes-bsp: Add u-boot-xlnx scripts for Xen suppo=
rt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/device-tree.bbappend=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 19 +++<br>
&gt;&gt;&gt;=C2=A0 .../files/versal-net-xen-qemu.dtsi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/files/versal-net-xen.dtsi=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 67 ++++++++++<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/files/versal-xen-qemu.dtsi=C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/files/versal-xen.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 59 +++++++++<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/files/zynqmp-xen-qemu.dtsi=C2=A0 =C2=A0 =
|=C2=A0 16 +++<br>
&gt;&gt;&gt;=C2=A0 .../device-tree/files/zynqmp-xen.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 123 ++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 .../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt;&gt;=C2=A0 .../u-boot/u-boot-xlnx-scr/boot.cmd.xen=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 80 ++++++++++++<br>
&gt;&gt;&gt;=C2=A0 .../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 38 ++++++<br>
&gt;&gt;&gt;=C2=A0 10 files changed, 408 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/device-tree.bbappend<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/versal-net-xen-qemu.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/versal-net-xen.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/versal-xen-qemu.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/versal-xen.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/zynqmp-xen-qemu.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/dev=
ice-tree/files/zynqmp-xen.dtsi<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-b=
oot/u-boot-xlnx-scr.bbappend<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-b=
oot/u-boot-xlnx-scr/boot.cmd.xen<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-b=
oot/xen-boot-cmd.inc<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.34.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#8146): <a href=3D"https://lists.yoctoproject.o=
rg/g/meta-virtualization/message/8146" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.yoctoproject.org/g/meta-virtualization/message/8146</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1004=
01326/3619037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/100401326/3619037</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.y=
octoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopro=
ject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virt=
ualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w=
.clark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000274ce00601cc7d67--

