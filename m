Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE4CC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:11:03 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.22332.1690503057728288824
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fjQMK5Hr;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso2570635e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Jul 2023 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690503056; x=1691107856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkyXvX04kkSbPeIlK41C2J+H2O8j+kDfN+7l2OP9XvU=;
        b=fjQMK5Hr1empgB9LjrRN7hCJ00NhDMvmOwGSslybBKFI7A3DFahy8PqV0xJ1dRPpAq
         fd8NHpa7AdHA4GhVxExqDWCQP7+inlIAUpHTGMBIiPfNie0F16e+787wR72vjXhL6vFU
         67qmvZz2JvxsuB2nuO4dRvJxVy3DoQPmw4NnOpV2xXaKbhRmMZGGLHre9t34MD/aMeit
         IOce9jsIhzNgonSP3XByrlas8yzBvq9z7U0nRZKJ54+5J/8TMk04sA63Wojbbo+SZGcz
         o8smqKKw82ikA/ZSbtMFok38XKFY1bb1u0RdoA7TkaceXKt55LeoBvPZSg6MYzAknTvK
         plhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690503056; x=1691107856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkyXvX04kkSbPeIlK41C2J+H2O8j+kDfN+7l2OP9XvU=;
        b=Qf0lKXKfslphv243qp+RFCw/gxwlrEYR2F3YhrpJB0ZLTHRIqLZxqQbl95vykdy5lZ
         s2Oz85QmweVD+zFQjaCe6GWJ10zUX772OLz/IpGqjKwPXvfN8E7R6n1Pe5H7SY9Ol7kn
         qPa3fgUXrSuvLn8bMdLzCbi0ONu3/SgHyOKNE+Cbwq7MtoVrzb8hScRYOT0iOPnOXSxt
         ErIAB65m1NY0aUcIj7IMSE8crEbIES7NKDtdRfcKaj8ztjeCXBe2RP05WR7PGBfLIEoN
         6lUlNTEhCJAqaliwjk4PXo9YC7Ft3yBj0slGZpbyywOMz6hWM/iY6jB+gMKUs1ke8igy
         8/1w==
X-Gm-Message-State: ABy/qLa0sbCtAzwZhdkohUeBzZ/LXY6UVNLgs+SDmLFcmUx2LtiiI/V6
	CXCk2vjovwvBHjLBlYElnOcCaBJNqaffn09tsTA=
X-Google-Smtp-Source: APBJJlG+IFR8qaTMmrHiZ+MXi/gzXLKmIOanlLBxAih/Arx08RPNTES/JMMbEblZEwfsZLAg3ficR9I9tZaKZ40mDg4=
X-Received: by 2002:a05:6512:3115:b0:4fb:52a3:e809 with SMTP id
 n21-20020a056512311500b004fb52a3e809mr435894lfb.28.1690503055508; Thu, 27 Jul
 2023 17:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 27 Jul 2023 17:10:43 -0700
Message-ID: <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000001d8b05060180ea20"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:11:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8145

--0000000000001d8b05060180ea20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <
sandeep.gundlupet-raju@amd.com> wrote:

> Add Xen dt and u-boot script support for AMD ZynqMP and Versal devices.
>

Hi Sandeep - this is a slightly surprising submission. I'm unsure about
meta-virtualization being the right place for this as typically hardware
enablement is more appropriately done in a BSP layer, where engineers who
have knowledge about and access to specific hardware can collaborate on
maintaining the machine-specific aspects of recipes.

Xen in this (non-BSP) layer has support for qemu MACHINES, plus generic
x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latter
is a special-case that has been discussed by Xen and Yocto community
members as a basic commodity reference hardware platform for testing (and
using) Xen, and the community for this layer has more of the interested
parties participating in it than meta-raspberrypi does.

Are you experiencing difficulties with maintaining your Xen recipe
components in a separate layer?

Christopher


>
> User can enable xen u-boot script by adding below variable from
> configuration file as shown below.
>
> BOOTMODE =3D "xen"
>
> This u-boot script also supports to configure below Xen params from
> configuration file.
>
> params          variable assignment
> ------          -------------------
> duart           XEN_SERIAL_CONSOLES =3D "serial0"
> dom0_mem        DOM0_MEM =3D "1500M"
> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>
> Sandeep Gundlupet Raju (2):
>   recipes-bsp: Add device-tree files for Xen support
>   recipes-bsp: Add u-boot-xlnx scripts for Xen support
>
>  .../device-tree/device-tree.bbappend          |  19 +++
>  .../files/versal-net-xen-qemu.dtsi            |   2 +
>  .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>  .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>  .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>  .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>  .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++++++
>  .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>  .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>  .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>  10 files changed, 408 insertions(+)
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.d=
tsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
>  create mode 100644
> dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>
> --
> 2.34.1
>
>

--0000000000001d8b05060180ea20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM S=
andeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com"=
>sandeep.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Add Xen dt and u-boot script support for A=
MD ZynqMP and Versal devices.<br></blockquote><div><br></div><div><div>Hi S=
andeep - this is a slightly=C2=A0surprising submission. I&#39;m unsure abou=
t meta-virtualization being the right place for this as typically hardware =
enablement is more appropriately done in a BSP layer, where engineers who h=
ave knowledge about and access to specific hardware can collaborate on main=
taining the machine-specific aspects of recipes.</div><div><br></div><div>X=
en in this (non-BSP) layer has support for qemu MACHINES, plus generic x86-=
64 and the Raspberry Pi 4 board for Arm platform coverage; the latter is a =
special-case that has been discussed by Xen and Yocto community members as =
a basic commodity reference hardware platform for testing (and using) Xen, =
and the community for this layer has more of the interested parties partici=
pating in it than meta-raspberrypi does.</div></div><div><br></div><div>Are=
 you experiencing difficulties with maintaining your Xen recipe components =
in a separate layer?</div><div><br></div><div>Christopher</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
User can enable xen u-boot script by adding below variable from<br>
configuration file as shown below.<br>
<br>
BOOTMODE =3D &quot;xen&quot;<br>
<br>
This u-boot script also supports to configure below Xen params from<br>
configuration file.<br>
<br>
params=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 variable assignment<br>
------=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -------------------<br>
duart=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XEN_SERIAL_CONSOLES =3D &quot=
;serial0&quot;<br>
dom0_mem=C2=A0 =C2=A0 =C2=A0 =C2=A0 DOM0_MEM =3D &quot;1500M&quot;<br>
dom0_max_vcpus=C2=A0 DOM0_MAX_VCPUS =3D &quot;1&quot;<br>
extra params=C2=A0 =C2=A0 XEN_CMDLINE_APPEND =3D &quot;loglvl=3Dall&quot;<b=
r>
<br>
Sandeep Gundlupet Raju (2):<br>
=C2=A0 recipes-bsp: Add device-tree files for Xen support<br>
=C2=A0 recipes-bsp: Add u-boot-xlnx scripts for Xen support<br>
<br>
=C2=A0.../device-tree/device-tree.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 19 +++<br>
=C2=A0.../files/versal-net-xen-qemu.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../device-tree/files/versal-net-xen.dtsi=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
67 ++++++++++<br>
=C2=A0.../device-tree/files/versal-xen-qemu.dtsi=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0.../device-tree/files/versal-xen.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 59 +++++++++<br>
=C2=A0.../device-tree/files/zynqmp-xen-qemu.dtsi=C2=A0 =C2=A0 |=C2=A0 16 ++=
+<br>
=C2=A0.../device-tree/files/zynqmp-xen.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 123 ++++++++++++++++++<br>
=C2=A0.../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../u-boot/u-boot-xlnx-scr/boot.cmd.xen=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 80 ++++++++++++<br>
=C2=A0.../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 38 ++++++<br>
=C2=A010 files changed, 408 insertions(+)<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/devi=
ce-tree.bbappend<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-net-xen-qemu.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-net-xen.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-xen-qemu.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/versal-xen.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/zynqmp-xen-qemu.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/file=
s/zynqmp-xen.dtsi<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xl=
nx-scr.bbappend<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xl=
nx-scr/boot.cmd.xen<br>
=C2=A0create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-=
cmd.inc<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000001d8b05060180ea20--

