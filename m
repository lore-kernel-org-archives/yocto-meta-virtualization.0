Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D93AE64004
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 18:24:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.5743.1732213464315768606
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 10:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=deBbCECe;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e59746062fso1077999a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732213464; x=1732818264; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T0T6HobJpbLZ5zcl5o4cMXWOeu+28QqmdZYXEUCEfKU=;
        b=deBbCECeq3HWpWVkIPkIpHtCNd8NKIBQTWTrNM2mG9t8Irp0qftQrOE8ETIDXFtRc/
         pjW2v/GsZeXfN/fV58Ql3aQlEcOIduG88pVcI8Bw/r8R4hZAgrn/ObRlRZVZ8isvcYvU
         xpdTrmA71qClXrwdpXZ5uTzTUxXUfkL3ZYodPh7TYIm0BQQrLNX/QVjkWOiwDw5wU2Yo
         oJHXJQ/Ity0eqs3eTTiHd0gIzdARt9gWNlWZGXS6ZFaXNtrVlXym1q2ZCTnuZaWDopLv
         WKjwaflftVAfycOrlTgX2w0g3elmR/ZdQJQz9RmvF/0tRK7/+pc4GLxKEzEVUjx/8xmN
         txKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732213464; x=1732818264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0T6HobJpbLZ5zcl5o4cMXWOeu+28QqmdZYXEUCEfKU=;
        b=EifqKMzFNZ/UyhLSJ9Mbbn2P1cdUvSR1TUP64FQH85FXLTSaAfTlyfparjnuCrtS8c
         EQG11+2KKx1qQGirO4gnEY+q+XBcBwPffjnoTG7l/WqpFkqPBde0lt16pSNuEby2ptWg
         4n78zOaLzHPINYX0Dzd6/8eXmMIFSADJ33GCSUuPrhGpyRPhchlxcOAOpe+OTZ1GNaxz
         rP3u2EOc1hnYnSH+qK6HHskoQx2KMEOftAATOq0qeJDIVgm1vNMfoT4LAVR/sYHdEsTZ
         0sk6jo3M/qsNkK6rmnjzt3+Q2eF9wGKxJAQ28ScsDLVB+xb6vdNHrpon028hx+4vxQC9
         9WzQ==
X-Gm-Message-State: AOJu0YzW2ZD+zsYm0Cj7tWuvm6DLXytjrHBmDMOUF5WkG9ysmC2nWeun
	DxcsisRnIzoFo8hiDJg4szy3WaxDqwp3tqkq3z8jUysqdVgtN1ZxVuPleb5ZV2YyX00h1smYh1W
	Y21UdQYxvoVuzBw2uDDTPJ+n/6ZI=
X-Gm-Gg: ASbGncvRBXv9xod2MqYQRUwXBLADP6zK5eenQQF3vr5oJD8Qfow0bK5jgeCBurg7roB
	ec1boIgs1Wr6V9qyTxIoCeR+erbaCNYQB
X-Google-Smtp-Source: AGHT+IGagaAxSOPRc1PzW1GG6U1Ri0UBH6XnZD+scwjra22Qi6QyvYXB3MnwAsL4dXzICdZFpPWrZ+mOCZRWSwzq+No=
X-Received: by 2002:a17:90b:4f8c:b0:2ea:4578:46c8 with SMTP id
 98e67ed59e1d1-2eaca7c69d3mr8331253a91.26.1732213463118; Thu, 21 Nov 2024
 10:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com> <Zz650spUU9SEUE1c@gmail.com>
 <180A08C7C2D5332A.23999@lists.yoctoproject.org> <1321e54d-21cb-46c6-8d03-d9b840063920@amd.com>
In-Reply-To: <1321e54d-21cb-46c6-8d03-d9b840063920@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Nov 2024 13:24:10 -0500
Message-ID: <CADkTA4Ny0zyCTm9PWuXyYbAkhW+bWmeHRFp88CE6fmD+quB2JA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH 1/6] xen-u-boot-scr: Add
 bbclass for xen boot script variables
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
Content-Type: multipart/alternative; boundary="00000000000024fe09062770606c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 18:24:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9001

--00000000000024fe09062770606c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 12:40=E2=80=AFPM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

>
> On 11/21/2024 9:30 AM, Sandeep Gundlupet Raju via lists.yoctoproject.org
> wrote:
> >
> > On 11/20/2024 9:40 PM, Bruce Ashfield wrote:
> >> In message: [meta-virtualization][master][PATCH 1/6]  xen-u-boot-scr:
> >> Add bbclass for xen boot script variables
> >> on 18/11/2024 Sandeep Gundlupet Raju wrote:
> >>
> >>> Add a new bbclass for xen boot script variables. This bbclass provide=
s
> >>> common xen u-boot boot script variables which can be inherited by any
> >>> vendor specific u-boot boot script recipes. Also these variable are
> >>> configurable from recipes, global and machine configuration files.
> >> This is this just for configuration, I'd prefer if the
> >> class was called: xen-uboot-scr-variables or xen-uboot-scr-configurati=
on
> >>
> >> That way when I see it inherited from the recipes is it very clear
> >> what it will be providing.
> > [Sandeep]: Sounds good I will send a v2 patch with bbclass rename.
> [Sandeep]: Bruce, One more clarification we do recommend
> xen-uboot-scr-configuration or xen-u-boot-scr-configuration? Most of the
> Yocto u-boot recipes/bbclass has u-boot nomenclature and not uboot(no
> dash).
>

Either is ok with me. I find it reads better without the dash, and the
other similar classes in core have no dash:

./classes-recipe/uboot-config.bbclass
./classes-recipe/uboot-sign.bbclass

but u-boot itself uses the dash! So keep it with the dash if you like, I
won't fuss about it.

Bruce


> >>
> >> Bruce
> >>
> >>> Variable nomenclature is aligned with xen documentation.
> >>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> >>>
> >>> Currently it supports Xen Dom0 boot and can be extended for DomU
> >>> or Dom0less boot.
> >>>
> >>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com=
>
> >>> ---
> >>>   classes-recipe/xen-u-boot-scr.bbclass | 43
> >>> +++++++++++++++++++++++++++
> >>>   1 file changed, 43 insertions(+)
> >>>   create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
> >>>
> >>> diff --git a/classes-recipe/xen-u-boot-scr.bbclass
> >>> b/classes-recipe/xen-u-boot-scr.bbclass
> >>> new file mode 100644
> >>> index 00000000..df8287e1
> >>> --- /dev/null
> >>> +++ b/classes-recipe/xen-u-boot-scr.bbclass
> >>> @@ -0,0 +1,43 @@
> >>> +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights
> >>> reserved.
> >>> +#
> >>> +# SPDX-License-Identifier: MIT
> >>> +#
> >>> +# This bbclass defines u-boot script variables required for xen
> >>> boot which can be
> >>> +# inherited u-boot boot scripts recipes and also allows to
> >>> configure these variables
> >>> +# from recipes, global and machine configurations files.
> >>> +
> >>> +# Variable nomenclature is aligned with
> >>> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> >>> +
> >>> +# Image Load Address for Xen Dom0 boot
> >>> +KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
> >>> +XEN_LOAD_ADDRESS ??=3D "0x00200000"
> >>> +DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
> >>> +RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
> >>> +
> >>> +# Xen boot image types.
> >>> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded
> >>> by u-boot.
> >>> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by
> >>> u-boot.
> >>> +#                Example: xen or xen.efi or xen.gz
> >>> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used,
> >>> Example: cpio.gz
> >>> +XEN_IMAGETYPE ??=3D "xen"
> >>> +DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
> >>> +
> >>> +# Set the amount of memory for dom0 depending on total available
> >>> memory size(DDR).
> >>> +DOM0_MEM ??=3D "256M"
> >>> +
> >>> +# Specify which UART console Xen should use. You can sepecify the
> >>> devicetree
> >>> +# alias or full path to a node in the devicetree
> >>> +# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
> >>> +# XEN_SERIAL_CONSOLES =3D "serial0" or
> >>> +# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
> >>> +XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
> >>> +
> >>> +# Specify additional command line arguments used for Xen and this
> >>> will be appended
> >>> +# to xen-bootargs cariable. This can also be used for passing debug
> >>> cmd line arguments.
> >>> +# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall
> >>> guest_loglvl=3Ddebug"
> >>> +XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
> >>> +
> >>> +# Specify the max number of vcpus for dom0
> >>> +# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
> >>> +DOM0_MAX_VCPUS ??=3D "1"
> >>> --
> >>> 2.34.1
> >>>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8997):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8997
> > Mute This Topic: https://lists.yoctoproject.org/mt/109660017/3619217
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [sandeep.gundlupet-raju@amd.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000024fe09062770606c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 21, 2024 at 12:40=E2=80=AFPM Gundlupet =
Raju, Sandeep &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com">sandeep=
.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
On 11/21/2024 9:30 AM, Sandeep Gundlupet Raju via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> <br>
wrote:<br>
&gt;<br>
&gt; On 11/20/2024 9:40 PM, Bruce Ashfield wrote:<br>
&gt;&gt; In message: [meta-virtualization][master][PATCH 1/6]=C2=A0 xen-u-b=
oot-scr: <br>
&gt;&gt; Add bbclass for xen boot script variables<br>
&gt;&gt; on 18/11/2024 Sandeep Gundlupet Raju wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Add a new bbclass for xen boot script variables. This bbclass =
provides<br>
&gt;&gt;&gt; common xen u-boot boot script variables which can be inherited=
 by any<br>
&gt;&gt;&gt; vendor specific u-boot boot script recipes. Also these variabl=
e are<br>
&gt;&gt;&gt; configurable from recipes, global and machine configuration fi=
les.<br>
&gt;&gt; This is this just for configuration, I&#39;d prefer if the<br>
&gt;&gt; class was called: xen-uboot-scr-variables or xen-uboot-scr-configu=
ration<br>
&gt;&gt;<br>
&gt;&gt; That way when I see it inherited from the recipes is it very clear=
<br>
&gt;&gt; what it will be providing.<br>
&gt; [Sandeep]: Sounds good I will send a v2 patch with bbclass rename.<br>
[Sandeep]: Bruce, One more clarification we do recommend <br>
xen-uboot-scr-configuration or xen-u-boot-scr-configuration? Most of the <b=
r>
Yocto u-boot recipes/bbclass has u-boot nomenclature and not uboot(no dash)=
.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Either is ok with me. I find it reads better without the =
dash, and the other similar classes in core have no dash:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">./classes-recipe/uboot-config.bbclass<br=
></div><div class=3D"gmail_default" style=3D"font-size:small">./classes-rec=
ipe/uboot-sign.bbclass<br></div></div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">but u-boot itself uses the dash! So keep it with the dash if you li=
ke, I won&#39;t fuss about it.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;&gt; Variable nomenclature is aligned with xen documentation.<br>
&gt;&gt;&gt; <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-comm=
and-line.html" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org=
/docs/unstable/misc/xen-command-line.html</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Currently it supports Xen Dom0 boot and can be extended for Do=
mU<br>
&gt;&gt;&gt; or Dom0less boot.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sa=
ndeep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.=
com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 classes-recipe/xen-u-boot-scr.bbclass | 43 <br>
&gt;&gt;&gt; +++++++++++++++++++++++++++<br>
&gt;&gt;&gt; =C2=A0 1 file changed, 43 insertions(+)<br>
&gt;&gt;&gt; =C2=A0 create mode 100644 classes-recipe/xen-u-boot-scr.bbclas=
s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/classes-recipe/xen-u-boot-scr.bbclass <br>
&gt;&gt;&gt; b/classes-recipe/xen-u-boot-scr.bbclass<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 00000000..df8287e1<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/classes-recipe/xen-u-boot-scr.bbclass<br>
&gt;&gt;&gt; @@ -0,0 +1,43 @@<br>
&gt;&gt;&gt; +# Copyright (C) 2024, Advanced Micro Devices, Inc.=C2=A0 All =
rights <br>
&gt;&gt;&gt; reserved.<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# SPDX-License-Identifier: MIT<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# This bbclass defines u-boot script variables required for x=
en <br>
&gt;&gt;&gt; boot which can be<br>
&gt;&gt;&gt; +# inherited u-boot boot scripts recipes and also allows to <b=
r>
&gt;&gt;&gt; configure these variables<br>
&gt;&gt;&gt; +# from recipes, global and machine configurations files.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Variable nomenclature is aligned with<br>
&gt;&gt;&gt; +# <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-c=
ommand-line.html" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.=
org/docs/unstable/misc/xen-command-line.html</a><br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Image Load Address for Xen Dom0 boot<br>
&gt;&gt;&gt; +KERNEL_LOAD_ADDRESS ??=3D &quot;0x00400000&quot;<br>
&gt;&gt;&gt; +XEN_LOAD_ADDRESS ??=3D &quot;0x00200000&quot;<br>
&gt;&gt;&gt; +DEVICETREE_LOAD_ADDRESS ??=3D &quot;0xC000000&quot;<br>
&gt;&gt;&gt; +RAMDISK_LOAD_ADDRESS ??=3D &quot;0x2600000&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Xen boot image types.<br>
&gt;&gt;&gt; +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be lo=
aded <br>
&gt;&gt;&gt; by u-boot.<br>
&gt;&gt;&gt; +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded=
 by <br>
&gt;&gt;&gt; u-boot.<br>
&gt;&gt;&gt; +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Example: xen or xen.efi or xen.gz<br>
&gt;&gt;&gt; +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, =
<br>
&gt;&gt;&gt; Example: cpio.gz<br>
&gt;&gt;&gt; +XEN_IMAGETYPE ??=3D &quot;xen&quot;<br>
&gt;&gt;&gt; +DOM0_RAMDISK_IMAGETYPE ??=3D &quot;rootfs.cpio.gz&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Set the amount of memory for dom0 depending on total availa=
ble <br>
&gt;&gt;&gt; memory size(DDR).<br>
&gt;&gt;&gt; +DOM0_MEM ??=3D &quot;256M&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Specify which UART console Xen should use. You can sepecify=
 the <br>
&gt;&gt;&gt; devicetree<br>
&gt;&gt;&gt; +# alias or full path to a node in the devicetree<br>
&gt;&gt;&gt; +# XEN_SERIAL_CONSOLES =3D &quot;/soc/serial@7e215040&quot; or=
<br>
&gt;&gt;&gt; +# XEN_SERIAL_CONSOLES =3D &quot;serial0&quot; or<br>
&gt;&gt;&gt; +# XEN_SERIAL_CONSOLES =3D &quot;/axi/serial@ff000000&quot;<br=
>
&gt;&gt;&gt; +XEN_SERIAL_CONSOLES ??=3D &quot;/soc/serial@7e215040&quot;<br=
>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Specify additional command line arguments used for Xen and =
this <br>
&gt;&gt;&gt; will be appended<br>
&gt;&gt;&gt; +# to xen-bootargs cariable. This can also be used for passing=
 debug <br>
&gt;&gt;&gt; cmd line arguments.<br>
&gt;&gt;&gt; +# Examples: XEN_CMDLINE_APPEND ?=3D &quot;sched=3Dcredit logl=
vl=3Dall <br>
&gt;&gt;&gt; guest_loglvl=3Ddebug&quot;<br>
&gt;&gt;&gt; +XEN_CMDLINE_APPEND ??=3D &quot;sync_console bootscrub=3D0&quo=
t;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# Specify the max number of vcpus for dom0<br>
&gt;&gt;&gt; +# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or DOM0_MAX=
_VCPUS =3D &quot;2-4&quot;<br>
&gt;&gt;&gt; +DOM0_MAX_VCPUS ??=3D &quot;1&quot;<br>
&gt;&gt;&gt; -- <br>
&gt;&gt;&gt; 2.34.1<br>
&gt;&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8997): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8997" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8997</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10966001=
7/3619217" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/109660017/3619217</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:sandeep.gundlupet=
-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000024fe09062770606c--

