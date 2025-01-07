Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2F7E77188
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 00:46:23 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10432.1736210775402988374
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 16:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FG7j27XV;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b229so157517301fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jan 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736210773; x=1736815573; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4jwBl/15VTmZqPmfFBZbM9tPlVY2v3DAXItUUW6afGU=;
        b=FG7j27XVCGVqZ/XOxrhyBYcwd21hxg6x6Cos+eF1N4TqgR41STNyCdruqxID5NGSxa
         GAsc2alEuBJyrpQJa9MuqT4vrwQoWG+L0AfjYleGW0C0ZBlDSL1xUoRdwD+RIQfKghDi
         gYhDRNNwVgveng5OF/X8IyKeK/diYq/aNRCHjgegRwNizC4kOsPm2oDVGFFy4fjL2SPe
         Ccoum3SokfnHUtRki6w21mvNjLjd53GP7Skv2ASorXbf4KPiNdWlCFPMxEtH3zI0qOVi
         0ieNEWorFr85qx2GgoJOc3mLQrlutIEPML12hV2IdHj9fIr1b+ILaSfZBnfAwtSN91Q4
         a28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736210773; x=1736815573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jwBl/15VTmZqPmfFBZbM9tPlVY2v3DAXItUUW6afGU=;
        b=xFDqCyjnzCMrpPy/5qvAbRqjCUvGLynJ/csC2ivHBYMDRH+HbYuabo4fL2F2WZpyJ/
         OHKJ6rxLLqc0DFxZ9kN/oHoryK+3FVU0lKExmDVfL3q2mHhGuM9kJnA0NsrX0YzcIcu/
         eCd28oKy956kbh0360pOUXS+nwcIfm7vmO5OYik6+t5VymfWLKo+KQ/4+EstzhoHYSAk
         BM+ZnG8qYkd/JVeHiTYG1GONQjscVSHe8KXnNJ20nW4DZJOLD5ybdACId7qtha9nJhI0
         EsY3vazaNgGy0KGXK9jvSAycv3YFWq41bqwS9tKAHYLwkmVtngtSezAyi30kw68wAap8
         aeqw==
X-Gm-Message-State: AOJu0YzNgDrUr3ZHsLVh6/K7KB9V04EvEEqVlZ8DYeQSeHey2UfNQu4n
	rT9E2Y6Ev2v7vctS3WAkz3Vc03olK0AiA8caeMmygS0D+7yv8/9fZsc4ozVrZzbvdxjYPd9xy6V
	vpAUtl2bnAaw9zOOEPQbh5bOOaOY=
X-Gm-Gg: ASbGncvRzYAstjnYNtKjAUtYMHxAg/ERoP2JjbsiXZWsNccLU1c9EHPt/L72Ygob51K
	Eu+7mmrBzxw1NN5G2CUQOk/zv307sq1w1hdxG
X-Google-Smtp-Source: AGHT+IHbR1kb/NNPoMl4q6H6fsRl4Q8KugcnSdyRS098/Zm8Qzkrrzbx6uORrn20olj/mXMaJBrRXIARbxqWouTZ/aQ=
X-Received: by 2002:a2e:bc0d:0:b0:2fe:e44d:6162 with SMTP id
 38308e7fff4ca-304685c1f1bmr233840401fa.26.1736210773020; Mon, 06 Jan 2025
 16:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com> <20241209145442.3291634-2-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20241209145442.3291634-2-sandeep.gundlupet-raju@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 7 Jan 2025 00:46:01 +0000
X-Gm-Features: AbW1kvZy9DvM_UgtOO1yZwnwOGCehJPC1Iq_SnNMHNsyhGk6OO6KQAeR891U3AM
Message-ID: <CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 1/5]
 xen-launch-config: Add bbclass for xen launch config variables
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="000000000000619c4a062b131249"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 00:46:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9071

--000000000000619c4a062b131249
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello

Happy New Year! and thanks for your patience waiting for the review of this
series.

On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Add a new bbclass for xen launch config variables. This bbclass provides
> common xen launch config variables which can be inherited by any
> vendor specific u-boot boot script and non-u-boot recipes. Also these
> variable are configurable from recipes, global and machine configuration
> files.
>

Once this series has completed all reviews and is acceptable for this
layer, do you think it would make sense to send corresponding patches to
meta-raspberrypi and meta-xilinx to set default values for these new
variables in the appropriate machine configuration files? (Raspberry Pi 4
64-bit, zynqmp and versal machines)


> Variable nomenclature is aligned with xen documentation.
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
> Currently it supports Xen Dom0 boot and can be extended for DomU
> or Dom0less boot.
>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  classes-recipe/xen-launch-config.bbclass | 43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 classes-recipe/xen-launch-config.bbclass
>
> diff --git a/classes-recipe/xen-launch-config.bbclass
> b/classes-recipe/xen-launch-config.bbclass
> new file mode 100644
> index 00000000..df8287e1
> --- /dev/null
> +++ b/classes-recipe/xen-launch-config.bbclass
> @@ -0,0 +1,43 @@
> +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved.
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# This bbclass defines u-boot script variables required for xen boot
> which can be
> +# inherited u-boot boot scripts recipes and also allows to configure
> these variables
> +# from recipes, global and machine configurations files.
> +

+# Variable nomenclature is aligned with
> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> +
>

Suggest: just retain the SPDX line from above?



> +# Image Load Address for Xen Dom0 boot
> +KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
> +XEN_LOAD_ADDRESS ??=3D "0x00200000"
> +DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
> +RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"

+
> +# Xen boot image types.
> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by
> u-boot.
> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
>

Please could the u-boot references be removed from the above comment lines?

Next, in the Yocto documentation, KERNEL_IMAGETYPE is defined to set the
type of kernel binary that is _built_ by the kernel recipe, and then
KERNEL_IMAGETYPE is also used elsewhere to identify the kernel file to be
installed and to load at boot.

Accordingly, a new XEN_IMAGETYPE variable should behave predictably for
anyone familiar with using KERNEL_IMAGETYPE.

However, it is not being defined here to determine any output of the Xen
kernel build process -- it doesn't affect the Xen build at all. It is being
defined to determine the name of the binary loaded by the boot process. I
think it's important to consider this carefully, as there genuinely are
multiple Xen image types built in x86 builds. That said, I don't think
there is a problem, because it doesn't prevent the Xen build being adjusted
to use it if necessary, and if there is a need to add a XEN_IMAGETYPES
(plural) variable later, I still think this looks fine.

In patch 3, there is a variable: XEN_IMAGE_NAME
- what is the function of the XEN_IMAGE_NAME variable? ie. What is it used
for?
- is there a reason that XEN_IMAGETYPE is not being used wherever
XEN_IMAGE_NAME is used?



> +#                Example: xen or xen.efi or xen.gz
> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example:
> cpio.gz
> +XEN_IMAGETYPE ??=3D "xen"
> +DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
> +
> +# Set the amount of memory for dom0 depending on total available memory
> size(DDR).
>

It could be helpful if the comment indicated what behaviour to expect if
this variable is empty/unset.


> +DOM0_MEM ??=3D "256M"


Could passing the dom0_mem=3D command line argument be skipped if the
variable does not have a value set? (in patch 2)
If so, could the default value of this variable be set to empty here and
then set it differently elsewhere in machine configurations.


> +
> +# Specify which UART console Xen should use. You can sepecify the
> devicetree
> +# alias or full path to a node in the devicetree
> +# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
> +# XEN_SERIAL_CONSOLES =3D "serial0" or
> +# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
> +XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
>

It would also be a useful improvement to make the boot script avoid passing
any dtuart=3D command line argument (in patch 2) when the value for this is
empty or unset.

Is there a way to enable configuring multiple consoles if there are
multiple values passed in the variable?


> +
> +# Specify additional command line arguments used for Xen and this will b=
e
> appended
> +# to xen-bootargs cariable. This can also be used for passing debug cmd
> line arguments.
> +# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall
> guest_loglvl=3Ddebug"
> +XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
> +
> +# Specify the max number of vcpus for dom0
> +# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
> +DOM0_MAX_VCPUS ??=3D "1"
>

Another variable where having good behaviour, ie. avoiding passing a
command line argument, when it is empty would be useful and then empty
would then also be a sensible default.

thanks,

Christopher



> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9043):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9043
> Mute This Topic: https://lists.yoctoproject.org/mt/110006796/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000619c4a062b131249
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br></div><div>Happy New Year! and th=
anks for your patience waiting for the review of this series.</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sandeep Gundlupet Raju via <=
a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;san=
deep.gundlupet-raju=3D<a href=3D"mailto:amd.com@lists.yoctoproject.org">amd=
.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Add a new bbclass for xen launch config variable=
s. This bbclass provides<br>
common xen launch config variables which can be inherited by any<br>
vendor specific u-boot boot script and non-u-boot recipes. Also these<br>
variable are configurable from recipes, global and machine configuration<br=
>
files.<br></blockquote><div><br></div><div>Once this series has completed a=
ll reviews and=C2=A0is acceptable for this layer, do you think it would mak=
e sense to send corresponding patches to meta-raspberrypi and meta-xilinx t=
o set default values for these new variables in the appropriate machine con=
figuration files? (Raspberry Pi 4 64-bit,=C2=A0zynqmp and versal machines)<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Variable nomenclature is aligned with xen documentation.<br>
<a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html=
" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/unstabl=
e/misc/xen-command-line.html</a><br>
<br>
Currently it supports Xen Dom0 boot and can be extended for DomU<br>
or Dom0less boot.<br>
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0classes-recipe/xen-launch-config.bbclass | 43 +++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100644 classes-recipe/xen-launch-config.bbclass<br>
<br>
diff --git a/classes-recipe/xen-launch-config.bbclass b/classes-recipe/xen-=
launch-config.bbclass<br>
new file mode 100644<br>
index 00000000..df8287e1<br>
--- /dev/null<br>
+++ b/classes-recipe/xen-launch-config.bbclass<br>
@@ -0,0 +1,43 @@<br>
+# Copyright (C) 2024, Advanced Micro Devices, Inc.=C2=A0 All rights reserv=
ed.<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+# This bbclass defines u-boot script variables required for xen boot which=
 can be<br>
+# inherited u-boot boot scripts recipes and also allows to configure these=
 variables<br>
+# from recipes, global and machine configurations files.<br>
+</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+# Variable=
 nomenclature is aligned with<br>
+# <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-command-line.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/unst=
able/misc/xen-command-line.html</a><br>
+<br>
</blockquote><div><div><br class=3D"gmail-Apple-interchange-newline">Sugges=
t: just retain the SPDX line from above?</div><div>=C2=A0</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+# Image Load=
 Address for Xen Dom0 boot<br>
+KERNEL_LOAD_ADDRESS ??=3D &quot;0x00400000&quot;<br>
+XEN_LOAD_ADDRESS ??=3D &quot;0x00200000&quot;<br>
+DEVICETREE_LOAD_ADDRESS ??=3D &quot;0xC000000&quot;<br>
+RAMDISK_LOAD_ADDRESS ??=3D &quot;0x2600000&quot;=C2=A0</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+<br>
+# Xen boot image types.<br>
+# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boo=
t.<br>
+# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.<b=
r></blockquote><div><br></div><div>Please could the u-boot references be re=
moved from the above comment lines?</div><div><br></div><div>Next, in the Y=
octo documentation, KERNEL_IMAGETYPE is defined to set the type of kernel b=
inary that is _built_ by the kernel recipe, and then KERNEL_IMAGETYPE is al=
so used elsewhere to identify the kernel file to be installed and to load a=
t boot.</div><div><br>Accordingly, a=C2=A0new XEN_IMAGETYPE variable should=
 behave predictably for anyone familiar with using KERNEL_IMAGETYPE.<br><br=
>However, it is not being defined here to determine any output of the Xen k=
ernel build process -- it doesn&#39;t affect the Xen build at all. It is be=
ing defined to determine the name of the binary loaded by the boot process.=
 I think it&#39;s important to consider this carefully, as there genuinely =
are multiple Xen image types built in x86 builds. That said, I don&#39;t th=
ink there is a problem, because it doesn&#39;t prevent=C2=A0the Xen build b=
eing adjusted to use it if necessary, and if there is a need to add a XEN_I=
MAGETYPES (plural) variable later, I still think this looks fine.<br><br>In=
 patch 3, there is a variable: XEN_IMAGE_NAME<br>- what is the function of =
the XEN_IMAGE_NAME variable? ie. What is it used for?<br>- is there a reaso=
n that XEN_IMAGETYPE is not being used wherever XEN_IMAGE_NAME is used?<br>=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Example: xen or x=
en.efi or xen.gz<br>
+# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio=
.gz<br>
+XEN_IMAGETYPE ??=3D &quot;xen&quot;<br>
+DOM0_RAMDISK_IMAGETYPE ??=3D &quot;rootfs.cpio.gz&quot;<br>
+<br>
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).<br></blockquote><div><br></div><div>It could be helpful if the com=
ment indicated what behaviour to expect if this variable is empty/unset.</d=
iv><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+DOM0_MEM ??=3D &quot;256M&quot;</blockquote><div><br></div><div><div>Could=
 passing the dom0_mem=3D command line argument be skipped if the variable d=
oes not have a value set? (in patch 2)</div>If so, could the default value =
of this variable be set to empty here and then set it differently elsewhere=
 in machine configurations.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+<br>
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee<br>
+# alias or full path to a node in the devicetree<br>
+# XEN_SERIAL_CONSOLES =3D &quot;/soc/serial@7e215040&quot; or<br>
+# XEN_SERIAL_CONSOLES =3D &quot;serial0&quot; or<br>
+# XEN_SERIAL_CONSOLES =3D &quot;/axi/serial@ff000000&quot;<br>
+XEN_SERIAL_CONSOLES ??=3D &quot;/soc/serial@7e215040&quot;<br></blockquote=
><div><br></div><div>It would also be a useful improvement to make the boot=
 script avoid passing any dtuart=3D command line argument (in patch 2) when=
 the value for this is empty or unset.<br></div><div><br></div><div>Is ther=
e a way to enable configuring multiple consoles if there are multiple value=
s passed in the variable?</div><div>=C2=A0<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+<br>
+# Specify additional command line arguments used for Xen and this will be =
appended<br>
+# to xen-bootargs cariable. This can also be used for passing debug cmd li=
ne arguments.<br>
+# Examples: XEN_CMDLINE_APPEND ?=3D &quot;sched=3Dcredit loglvl=3Dall gues=
t_loglvl=3Ddebug&quot;<br>
+XEN_CMDLINE_APPEND ??=3D &quot;sync_console bootscrub=3D0&quot;<br>
+<br>
+# Specify the max number of vcpus for dom0<br>
+# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or DOM0_MAX_VCPUS =3D &q=
uot;2-4&quot;<br>
+DOM0_MAX_VCPUS ??=3D &quot;1&quot;<br></blockquote><div><br></div><div>Ano=
ther variable where having good behaviour, ie. avoiding passing a command l=
ine argument, when it is empty would be useful and then empty would then al=
so be a sensible default.</div><div><br></div><div>thanks,</div><div><br></=
div><div>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9043): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9043" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9043</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110006796/361=
9037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110006796/3619037</a><br>
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

--000000000000619c4a062b131249--

