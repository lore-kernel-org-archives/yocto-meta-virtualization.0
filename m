Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D34D78796
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:46:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3055.1732207583060943436
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 08:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxnjVKzG;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-212581a0b33so11798945ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 08:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732207582; x=1732812382; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4RDE2Bm0w47+F3H6+ZVoKt6ueuFCX1OhDZFwGmYYrEU=;
        b=PxnjVKzGsD7AkN1OtrSes9gYRT/PdsU+G53InOvzYpHFHd4BztFtgUyPB+Xisn2JtY
         mNtRYDnaAwGdK9UM3u4gy+9GXogX9Nx+JHwPMzRGDAguSCtXZ/rfg30aT+NNdhV+6v0S
         TS/C0t99w37Zqgk6YJHCIALS1OxkkOPSkIFkrtoW5EE4VsI9WiFZyvBalpijxUzYgngC
         JISETDoQz5dXEAHVsHu0nQRwbpxDpuFI6lqQrBwiiYUDSi/6CaYbs/h4EoYBK4CBqT7q
         6SQDnv4pLzNuHmgxr95rUUPU4LGaKe2Jm2+phENAL3gnhFdh8a9r4M8Uf8ZZJnmX4VsM
         9OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732207582; x=1732812382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RDE2Bm0w47+F3H6+ZVoKt6ueuFCX1OhDZFwGmYYrEU=;
        b=RP/5ivwoKMnfn2MeUBPcJ4uw6AMETcmdELB7DeGyktt1YNcrVQTxvvVdl04PHDUUwI
         aQxhjNMtSktMZtOUFvVe4+9UOnQMLWevHO9ZcxL4AlErR5l+0Yqcti4wUMstJ+i3+5Vk
         og6Kg30aMrSzipjH1CGQainBzFXtXPFGBjWVNwS+83DR+KXOkZwCTN/iz2HV3MpUT7x2
         ZHS6trbURn7aOUWhRq6MVsIx+5gRM9HaD0MdAuNu+fRowfDHYsGPmoMX3UrfoOfqfyXb
         zW+ZOAAQ9pnsUAaCdXjfpffkPlKLNAgXs9mVdmxSjRVDVndo3pEn6xltSfmgaRS1c3m1
         +w1Q==
X-Gm-Message-State: AOJu0YxawkEgesFukkkE+9YM5f7tRjXyVjTSS+qRWtrNdSjg1z/5aD4J
	YL4jx5G/LfIxfXfhXsmNH2R7qwMoXLptojMfn9087bmMXjRCLn1KGcH4MhqFtL4gTS6t2BIAw8L
	EG4Z7i6Ao4tYDwxFNkGVr9lrvIwE=
X-Gm-Gg: ASbGncv94pWD5OnFGrorBjbkjjgi+uhFEs7MUK21teDZRbLmPlq1I6srpOjWm8yh0Cl
	yRRBKCkU0jab2CxYg84AJ4Tj78TLakL8=
X-Google-Smtp-Source: AGHT+IFRIdWKSFGe5ciGpMlEmixxHheKHgeq7m8aL/ZrsX1D2FsL5TRbmQHyQE0+SH9TciHPegIvyblGzk32/BciNSk=
X-Received: by 2002:a17:902:ce87:b0:212:4aec:f646 with SMTP id
 d9443c01a7336-2126a42140fmr88454165ad.33.1732207582182; Thu, 21 Nov 2024
 08:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com> <Zz66Tw7AuYZ5eTpC@gmail.com>
 <3a52f570-ec67-40f3-aa13-7be24ba2b229@amd.com>
In-Reply-To: <3a52f570-ec67-40f3-aa13-7be24ba2b229@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Nov 2024 11:46:10 -0500
Message-ID: <CADkTA4O22sge3xC__qvd_e0=0c3XtR0mktAaiJUTXB6EgL3DNQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
 u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009d05b106276f0151"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 16:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8998

--0000000000009d05b106276f0151
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 11:28=E2=80=AFAM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

>
> On 11/20/2024 9:42 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> > In message: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6=
]
> u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
> > on 18/11/2024 Sandeep Gundlupet Raju wrote:
> >
> >> Include xen-boot-env.inc file if BOOTMODE=3D"xen" and also remove xen
> >> u-boot boot script variables from xen-boot-cmd.inc.
> > Is the BOOMODE variable documented somewhere ? In the main
> > uboot recipes ?
> [Sandeep]: Bruce, Variable is defined in
>
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipe=
s-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33
> to support multiple u-boot boot target
>
> https://github.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_=
versal.h#L124-L132
> for u-boot distro boot. I don't think we have a documentation defining
> all the variables.
>

Can we just put a comment above the line in the file ? so someone can
lookup the definition if they are wondering.

Bruce



> >
> > Bruce
> >
> >> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> >> ---
> >>   .../u-boot/u-boot-xlnx-scr.bbappend           |  7 +++-
> >>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -----------------=
--
> >>   2 files changed, 6 insertions(+), 36 deletions(-)
> >>
> >> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> >> index ec64d246..4e39c316 100644
> >> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappen=
d
> >> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappen=
d
> >> @@ -1,4 +1,9 @@
> >> -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from
> configuration
> >> +# Include xen-boot-cmd.inc only if BOOTMODE =3D "xen" is set from
> configuration
> >>   # file and xen enabled in DISTRO_FEATURES.
> >> +include ${@'xen-boot-env.inc' if d.getVar('BOOTMODE') =3D=3D 'xen' an=
d
> bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
> >> +
> >> +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from
> configuration
> >> +# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is
> supports multiple
> >> +# boot modes such as JTAG and SD(ext4 and ramdisk).
> >>   ENABLE_XEN_UBOOT_SCR ?=3D ""
> >>   include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =
=3D=3D
> '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else =
''}
> >> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> index 7a4e41a6..6fccc7b4 100644
> >> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> >> @@ -1,38 +1,3 @@
> >>   FILESEXTRAPATHS:append :=3D ":${THISDIR}/u-boot-xlnx-scr"
> >>
> >>   SRC_URI +=3D "file://boot.cmd.xen"
> >> -
> >> -# Image offsets for Xen boot
> >> -KERNEL_OFFSET:zynqmp ?=3D "0xE00000"
> >> -KERNEL_OFFSET:versal ?=3D "0xE00000"
> >> -
> >> -DEVICETREE_OFFSET:zynqmp ?=3D "0xC000000"
> >> -DEVICETREE_OFFSET:versal ?=3D "0xC000000"
> >> -
> >> -RAMDISK_OFFSET:zynqmp ?=3D "0x2600000"
> >> -RAMDISK_OFFSET:versal ?=3D "0x2600000"
> >> -
> >> -XEN_OFFSET:zynqmp ?=3D "0xBA00000"
> >> -XEN_OFFSET:versal ?=3D "0xBA00000"
> >> -XEN_LOAD_ADDRESS ?=3D "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
> >> -
> >> -# If dom0-ramdisk is used for Xen boot then set RAMDISK image to
> cpio.gz
> >> -XEN_IMAGE_NAME ?=3D "xen"
> >> -RAMDISK_IMAGE ?=3D "rootfs.cpio.gz"
> >> -
> >> -# Set the amount of memory for dom0 depending on total available
> memory size(DDR).
> >> -DOM0_MEM ?=3D "1500M"
> >> -
> >> -# Specify which UART console Xen should use. You can sepecify the
> devicetree
> >> -# alias or full path to a node in the devicetree
> >> -# XEN_SERIAL_CONSOLES ?=3D "serial0" or XEN_SERIAL_CONSOLES ?=3D
> "/axi/serial@ff000000"
> >> -XEN_SERIAL_CONSOLES ?=3D "serial0"
> >> -
> >> -# Specify additional Xen paramaters which will be appended to
> xen-bootargs
> >> -# This can alos be used for debugging purposes.
> >> -# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall
> guest_loglvl=3Ddebug"
> >> -XEN_CMDLINE_APPEND ?=3D ""
> >> -
> >> -# Specify the max number of vcpus for dom0
> >> -# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
> >> -DOM0_MAX_VCPUS ?=3D "1"
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8996):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8996
> Mute This Topic: https://lists.yoctoproject.org/mt/109660021/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009d05b106276f0151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 21, 2024 at 11:28=E2=80=AFAM Sandeep Gu=
ndlupet Raju via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproje=
ct.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@lists.yoc=
toproject.org">amd.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
On 11/20/2024 9:42 PM, Bruce Ashfield via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wr=
ote:<br>
&gt; In message: [meta-virtualization][master][scarthgap][styhead][PATCH 4/=
6] u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen<br>
&gt; on 18/11/2024 Sandeep Gundlupet Raju wrote:<br>
&gt;<br>
&gt;&gt; Include xen-boot-env.inc file if BOOTMODE=3D&quot;xen&quot; and al=
so remove xen<br>
&gt;&gt; u-boot boot script variables from xen-boot-cmd.inc.<br>
&gt; Is the BOOMODE variable documented somewhere ? In the main<br>
&gt; uboot recipes ?<br>
[Sandeep]: Bruce, Variable is defined in <br>
<a href=3D"https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-co=
re/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-c=
ore/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33</a> <br>
to support multiple u-boot boot target <br>
<a href=3D"https://github.com/Xilinx/u-boot-xlnx/blob/master/include/config=
s/xilinx_versal.h#L124-L132" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_versal.h#L1=
24-L132</a> <br>
for u-boot distro boot. I don&#39;t think we have a documentation defining =
<br>
all the variables.<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Can we just put a comment above the line=
 in the file ? so someone can lookup the definition if they are wondering.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt; Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandee=
p.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com<=
/a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++-<br>
&gt;&gt;=C2=A0 =C2=A0.../recipes-bsp/u-boot/xen-boot-cmd.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 35 -------------------<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+), 36 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-=
scr.bbappend b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bba=
ppend<br>
&gt;&gt; index ec64d246..4e39c316 100644<br>
&gt;&gt; --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bba=
ppend<br>
&gt;&gt; +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bba=
ppend<br>
&gt;&gt; @@ -1,4 +1,9 @@<br>
&gt;&gt; -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set fr=
om configuration<br>
&gt;&gt; +# Include xen-boot-cmd.inc only if BOOTMODE =3D &quot;xen&quot; i=
s set from configuration<br>
&gt;&gt;=C2=A0 =C2=A0# file and xen enabled in DISTRO_FEATURES.<br>
&gt;&gt; +include ${@&#39;xen-boot-env.inc&#39; if d.getVar(&#39;BOOTMODE&#=
39;) =3D=3D &#39;xen&#39; and bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;xen&#39;, True, False, d) else &#39;&#39;}<br>
&gt;&gt; +<br>
&gt;&gt; +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set fr=
om configuration<br>
&gt;&gt; +# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is su=
pports multiple<br>
&gt;&gt; +# boot modes such as JTAG and SD(ext4 and ramdisk).<br>
&gt;&gt;=C2=A0 =C2=A0ENABLE_XEN_UBOOT_SCR ?=3D &quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0include ${@&#39;xen-boot-cmd.inc&#39; if d.getVar(&#39=
;ENABLE_XEN_UBOOT_SCR&#39;) =3D=3D &#39;1&#39; and bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;xen&#39;, True, False, d) else &#39;&#39;}<br>
&gt;&gt; diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd=
.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
&gt;&gt; index 7a4e41a6..6fccc7b4 100644<br>
&gt;&gt; --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br=
>
&gt;&gt; +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br=
>
&gt;&gt; @@ -1,38 +1,3 @@<br>
&gt;&gt;=C2=A0 =C2=A0FILESEXTRAPATHS:append :=3D &quot;:${THISDIR}/u-boot-x=
lnx-scr&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI +=3D &quot;file://boot.cmd.xen&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# Image offsets for Xen boot<br>
&gt;&gt; -KERNEL_OFFSET:zynqmp ?=3D &quot;0xE00000&quot;<br>
&gt;&gt; -KERNEL_OFFSET:versal ?=3D &quot;0xE00000&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -DEVICETREE_OFFSET:zynqmp ?=3D &quot;0xC000000&quot;<br>
&gt;&gt; -DEVICETREE_OFFSET:versal ?=3D &quot;0xC000000&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -RAMDISK_OFFSET:zynqmp ?=3D &quot;0x2600000&quot;<br>
&gt;&gt; -RAMDISK_OFFSET:versal ?=3D &quot;0x2600000&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -XEN_OFFSET:zynqmp ?=3D &quot;0xBA00000&quot;<br>
&gt;&gt; -XEN_OFFSET:versal ?=3D &quot;0xBA00000&quot;<br>
&gt;&gt; -XEN_LOAD_ADDRESS ?=3D &quot;${@append_baseaddr(d,d.getVar(&#39;XE=
N_OFFSET&#39;))}&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# If dom0-ramdisk is used for Xen boot then set RAMDISK image to =
cpio.gz<br>
&gt;&gt; -XEN_IMAGE_NAME ?=3D &quot;xen&quot;<br>
&gt;&gt; -RAMDISK_IMAGE ?=3D &quot;rootfs.cpio.gz&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# Set the amount of memory for dom0 depending on total available =
memory size(DDR).<br>
&gt;&gt; -DOM0_MEM ?=3D &quot;1500M&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# Specify which UART console Xen should use. You can sepecify the=
 devicetree<br>
&gt;&gt; -# alias or full path to a node in the devicetree<br>
&gt;&gt; -# XEN_SERIAL_CONSOLES ?=3D &quot;serial0&quot; or XEN_SERIAL_CONS=
OLES ?=3D &quot;/axi/serial@ff000000&quot;<br>
&gt;&gt; -XEN_SERIAL_CONSOLES ?=3D &quot;serial0&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# Specify additional Xen paramaters which will be appended to xen=
-bootargs<br>
&gt;&gt; -# This can alos be used for debugging purposes.<br>
&gt;&gt; -# Examples: XEN_CMDLINE_APPEND ?=3D &quot;sched=3Dcredit loglvl=
=3Dall guest_loglvl=3Ddebug&quot;<br>
&gt;&gt; -XEN_CMDLINE_APPEND ?=3D &quot;&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# Specify the max number of vcpus for dom0<br>
&gt;&gt; -# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or DOM0_MAX_VCP=
US =3D &quot;2-4&quot;<br>
&gt;&gt; -DOM0_MAX_VCPUS ?=3D &quot;1&quot;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8996): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8996" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8996</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109660021/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109660021/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009d05b106276f0151--

