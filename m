Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4486EC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 06:06:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.26907.1690524409323337222
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 23:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=H4CtKzHa;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5217bb5ae05so2161474a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690524408; x=1691129208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vBulWX0wfDgAu4m+kDNNm9SbYyFzaKnuSmMspftfSAA=;
        b=H4CtKzHag0cCdBPpMmuxlsmI+rl9iEKOC+iCEPc76fHdFdtRpyG94zJlk+LiNvYzPN
         4BqvRABScMS8A+70I0j2VLRH2QwTXYfBU4sjgEDiQAuETivB/LG2/Z1j2BIQxWQFxAJO
         hPfNt1bcue4XIgPjwItMzRX3eP+n6QT20RhWLmFgq46FJNwx8OvguzWFgnWyTYT0pcZ1
         a+1SwLab0OSQWTAF1UxZlwRZ6+xXU6z8fGLjyCMo0SwhKgzA74tCLCUMnHH82424DU0U
         TtMeO95bkluBXsHk+6RvyEVK3wIoYxUEoGDFFhdpjv/p/IRPqpdEk/l4LX6PIaMa+uqW
         Tvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524408; x=1691129208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBulWX0wfDgAu4m+kDNNm9SbYyFzaKnuSmMspftfSAA=;
        b=HXOEti3wARlIcqlWDG6inUZ3F6QRNdF5qsfLYZY5AR3Dyj73+UbYfQduys/WbH2wIC
         MR0PjFmsNdINXIVdmOsouyKCVXGJhz1sV8r/G0qlyEovcx/1u2uie7IPJiKrDpc9mQV9
         K/QxhtPQg5ktmKnyBxH0j+fNjQSWFwFsuPcSLsVsfBIZou2zlk2NxqJQQN9L//x2dzA+
         65EaeQek4+PS49izQOiy1EKsHpAf+1tHrXstQZpZxKxTm4unWk8xnVOuLBLtwpJE5YeO
         eAYIQXoQEWFh8U+27n6xpmQJ9+A8FJcs94t7OEcoKQp/9rJLL97YkY1ggyFQIkbY6cpQ
         T9eQ==
X-Gm-Message-State: ABy/qLaUUfgaB3vPusPIKgh3yrgovg73hMqaSCZB7KgNtltbNdz9Iwan
	iEkyHLRu/RvMdx6JHqbN6sEPjWuEBxjH8mQFt+A=
X-Google-Smtp-Source: APBJJlGJ3fhvRee5jq+r5XHDfMdN8nWLUFSS9HYYFSPxGdfMaG1NND/Ek9KdVozgzj5lTiyjMbDUFcofHQoAYjsVFto=
X-Received: by 2002:a05:6402:12da:b0:521:d23d:6850 with SMTP id
 k26-20020a05640212da00b00521d23d6850mr733152edx.21.1690524407526; Thu, 27 Jul
 2023 23:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com> <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com>
In-Reply-To: <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 27 Jul 2023 23:06:35 -0700
Message-ID: <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000cb776a060185e2bb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jul 2023 06:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8147

--000000000000cb776a060185e2bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC Bertrand

On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Hi Chris,
> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org wrote:
>
>
> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <
> sandeep.gundlupet-raju@amd.com> wrote:
>
>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal devices.
>>
>
> Hi Sandeep - this is a slightly surprising submission. I'm unsure about
> meta-virtualization being the right place for this as typically hardware
> enablement is more appropriately done in a BSP layer, where engineers who
> have knowledge about and access to specific hardware can collaborate on
> maintaining the machine-specific aspects of recipes.
>
> [Sandeep]: I checked with Bruce before I submit the patches, Since we had
> xilinx dynamic layer, he has no objection in accepting the patches.
>

That is generous, but I think you could make the layer maintenance
responsibilities easier and help with establishing good practice for
hardware support if these changes can go into a BSP layer instead, if that
is an option? I do appreciate that you are working on enabling Xen to work
on additional platforms.

The Xilinx dynamic layer could be removed from meta-virtualization by
adding its Xen image creation logic to the primary Xen hypervisor recipe --
possibly with a new mkimage task? --  to be enabled via new settings in an
Arm or Xilinx MACHINE configuration.


> Xen in this (non-BSP) layer has support for qemu MACHINES, plus generic
> x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latter
> is a special-case that has been discussed by Xen and Yocto community
> members as a basic commodity reference hardware platform for testing (and
> using) Xen, and the community for this layer has more of the interested
> parties participating in it than meta-raspberrypi does.
>
> Are you experiencing difficulties with maintaining your Xen recipe
> components in a separate layer?
>
> [Sandeep]: No we are not experiencing any difficulties in maintaining
> these files, currently all the dtsi files are in meta-petalinux layer and
> if users are using without meta-petalinux distro layer(building
> xen-image-minimal), then Xen doesn't work on ZynqMP and Versal devices.
>

Do you know which layer defines the MACHINE configurations for those
hardware devices? It seems like that could be a suitable BSP layer for
these changes?


> Mark Hatle and myself we discussed on this and we saw rpi u-boot script
> and other files in this layer, we thought this is a good place to move
> these files.
>

I see how the raspberry pi dynamic layer can give that impression which is
unfortunate. The motivation for the inclusion of the rpi files in
meta-virtualization is to enable collaboration on hardware testing (and
reproduction and diagnosis if needed) of the Arm architecture functionality
of the primary Xen recipes, on a low-cost commodity hardware board, with
agreement on this from Xen stakeholders at multiple different
organizations. X86 doesn't need it as generic x86-64 support (see
meta-yocto-bsp) is enough.

Christopher



> Mark can chime in here to add any additional comments.
>

> Christopher
>
>
>>
>> User can enable xen u-boot script by adding below variable from
>> configuration file as shown below.
>>
>> BOOTMODE =3D "xen"
>>
>> This u-boot script also supports to configure below Xen params from
>> configuration file.
>>
>> params          variable assignment
>> ------          -------------------
>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
>> dom0_mem        DOM0_MEM =3D "1500M"
>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>>
>> Sandeep Gundlupet Raju (2):
>>   recipes-bsp: Add device-tree files for Xen support
>>   recipes-bsp: Add u-boot-xlnx scripts for Xen support
>>
>>  .../device-tree/device-tree.bbappend          |  19 +++
>>  .../files/versal-net-xen-qemu.dtsi            |   2 +
>>  .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>>  .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>>  .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++++
>>  .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>>  10 files changed, 408 insertions(+)
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.=
dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
>>  create mode 100644
>> dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>>
>> --
>> 2.34.1
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8146):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8146
> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cb776a060185e2bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0">+=
CC Bertrand</a><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupe=
t Raju via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org=
</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@lists.yoctoproj=
ect.org">amd.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <p>Hi Chris,<br>
    </p>
    <div>On 7/27/2023 6:10 PM, Christopher Clark
      via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists=
.yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 27, 2023 at
            4:22=E2=80=AFPM Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sa=
ndeep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.=
com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add Xen dt and =
u-boot
            script support for AMD ZynqMP and Versal devices.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div>Hi Sandeep - this is a slightly=C2=A0surprising submission=
.
              I&#39;m unsure about meta-virtualization being the right plac=
e
              for this as typically hardware enablement is more
              appropriately done in a BSP layer, where engineers who
              have knowledge about and access to specific hardware can
              collaborate on maintaining the machine-specific aspects of
              recipes.</div>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: I checked with Bruce before I submit the patches, Since
    we had xilinx dynamic layer, he has no objection in accepting the
    patches.<br></div></blockquote><div><br></div><div>That is generous, bu=
t I think you=C2=A0could make the layer maintenance responsibilities easier=
 and help with establishing good practice for hardware support if these cha=
nges can go into a BSP layer instead, if that is an option? I do appreciate=
 that you are working on enabling Xen to work on additional platforms.</div=
><div><br></div><div>The Xilinx dynamic layer could be removed from meta-vi=
rtualization by adding=C2=A0its Xen image creation logic to the primary Xen=
 hypervisor recipe -- possibly with a new mkimage task? --=C2=A0 to be enab=
led via new settings in an Arm or Xilinx MACHINE configuration.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div><br>
            </div>
            <div>Xen in this (non-BSP) layer has support for qemu
              MACHINES, plus generic x86-64 and the Raspberry Pi 4 board
              for Arm platform coverage; the latter is a special-case
              that has been discussed by Xen and Yocto community members
              as a basic commodity reference hardware platform for
              testing (and using) Xen, and the community for this layer
              has more of the interested parties participating in it
              than meta-raspberrypi does.</div>
          </div>
          <div><br>
          </div>
          <div>Are you experiencing difficulties with maintaining your
            Xen recipe components in a separate layer?</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: No we are not experiencing any difficulties in
    maintaining these files, currently all the dtsi files are in
    meta-petalinux layer and if users are using without meta-petalinux
    distro layer(building xen-image-minimal), then Xen doesn&#39;t work on
    ZynqMP and Versal devices.</div></blockquote><div><br></div><div>Do you=
 know which layer defines the MACHINE configurations for those hardware dev=
ices? It seems like that could be a suitable=C2=A0BSP layer for these chang=
es?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div>Mark Hatle and myself we discussed on
    this and we saw rpi u-boot script and other files in this layer, we
    thought this is a good place to move these files.</div></blockquote><di=
v><br></div><div>I see how the raspberry pi dynamic layer can give that imp=
ression which is unfortunate. The motivation for the inclusion of the rpi f=
iles in meta-virtualization is to enable collaboration on hardware testing =
(and reproduction and diagnosis if needed) of the Arm architecture function=
ality of the primary Xen recipes, on a low-cost commodity hardware board, w=
ith agreement on this from Xen stakeholders at multiple different organizat=
ions. X86 doesn&#39;t need it as generic x86-64 support (see meta-yocto-bsp=
) is enough.</div><div><br></div><div>Christopher</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Mark can=
 chime in
    here to add any additional comments.<br></div></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div><blockquote type=3D"cite"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div><br>
          </div>
          <div>Christopher</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            User can enable xen u-boot script by adding below variable
            from<br>
            configuration file as shown below.<br>
            <br>
            BOOTMODE =3D &quot;xen&quot;<br>
            <br>
            This u-boot script also supports to configure below Xen
            params from<br>
            configuration file.<br>
            <br>
            params=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable assignment<br=
>
            ------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -------------------<br=
>
            duart=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_SERIAL_CONSOL=
ES =3D &quot;serial0&quot;<br>
            dom0_mem=C2=A0 =C2=A0 =C2=A0 =C2=A0 DOM0_MEM =3D &quot;1500M&qu=
ot;<br>
            dom0_max_vcpus=C2=A0 DOM0_MAX_VCPUS =3D &quot;1&quot;<br>
            extra params=C2=A0 =C2=A0 XEN_CMDLINE_APPEND =3D &quot;loglvl=
=3Dall&quot;<br>
            <br>
            Sandeep Gundlupet Raju (2):<br>
            =C2=A0 recipes-bsp: Add device-tree files for Xen support<br>
            =C2=A0 recipes-bsp: Add u-boot-xlnx scripts for Xen support<br>
            <br>
            =C2=A0.../device-tree/device-tree.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 19 +++<br>
            =C2=A0.../files/versal-net-xen-qemu.dtsi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
            =C2=A0.../device-tree/files/versal-net-xen.dtsi=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 67
            ++++++++++<br>
            =C2=A0.../device-tree/files/versal-xen-qemu.dtsi=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
            =C2=A0.../device-tree/files/versal-xen.dtsi=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 59
            +++++++++<br>
            =C2=A0.../device-tree/files/zynqmp-xen-qemu.dtsi=C2=A0 =C2=A0 |=
=C2=A0 16 +++<br>
            =C2=A0.../device-tree/files/zynqmp-xen.dtsi=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 123
            ++++++++++++++++++<br>
            =C2=A0.../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
            =C2=A0.../u-boot/u-boot-xlnx-scr/boot.cmd.xen=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 80
            ++++++++++++<br>
            =C2=A0.../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 38 ++++++<br>
            =C2=A010 files changed, 408 insertions(+)<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbapp=
end<br>
            =C2=A0create mode 100644
dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.dts=
i<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-=
xen.dtsi<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-=
qemu.dtsi<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.=
dtsi<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-=
qemu.dtsi<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.=
dtsi<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappe=
nd<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.c=
md.xen<br>
            =C2=A0create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
            <br>
            -- <br>
            2.34.1<br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8146): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8146" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8146</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100401326/361=
9037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/100401326/3619037</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark@gm=
ail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cb776a060185e2bb--

