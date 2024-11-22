Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E46E6916C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 15:12:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.26751.1732288327515649703
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 07:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OQlpeXQk;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so24855771fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Nov 2024 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732288326; x=1732893126; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcURiUcfIW3FJ5FCsxa8E+5bX+5+m5VeXfHfcM7dR7g=;
        b=OQlpeXQkTwIpb1dWMg2hkHju9KFu3MX1dvbXxfvUh556yY74WZ+Mi3aXavGQxzeBFD
         K2vcxJB0KCJvDktNjHeCxMA6BRyPyX37qxb8AWfCZLrE4zgrKcwX5TCd/o3mJ51VQUpZ
         WXXF95nSssr1y87kUrMhi9v1lgdglwCCjY6i/EMk+AFh7v6OrF0c8dq9UmqaT6rRzbnG
         o8UlXAgEsYwISdmisMXbaAIDOnFWYiHi7prSmuui0BrSPSuQ9x+eS2CYt2gdECdLd+gN
         KnAlvTN3YDeJjsJLACkbtdQuqauFUFZ5kmO2x2FjKb629X54uOFjyAwvpCp9USDBHenI
         oMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288326; x=1732893126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcURiUcfIW3FJ5FCsxa8E+5bX+5+m5VeXfHfcM7dR7g=;
        b=vcOmBKZ6k7gQUSsYY29RV4pbrg3bdjTroPXNzBXFQAiJChLzBQpyPHTw45PsIUZmgB
         bDO6zJFNDOsNs6NDn6tBzMTiBqDTUg7F0tOK3q09H7CRcLjXEcTxdWWaFQd4L0lgZ09C
         4Z6z/ps21EUimG7KabKvXtd3gSiLRhtcJHcf1Sw/yGil1fSApZOBdJbM0pK0BId1qgnS
         sJ0V76SF+4QpuMltZn2xQqh2RrcJMMFz8Vg3jGsZhbSNAuHdVrLkcGNUkSAnTMVdjEEg
         LbDlhxjAxUiysdNQ4JKQPMwD3ZcK5yzZduMsC48RVJqw4z/ETprKHG0qDEzz2dlp+Fel
         Sz+Q==
X-Gm-Message-State: AOJu0YxvCohqsNLpQ/GOQkkHaGSNDttmcz28aZzx9sVI1NVtmJKtpmcb
	9pLa7OstXIJ6lQeuzJueQYpM15CDkJGFAQJu+g2u0bvzO6vhCeUiWKFOIugG5kxY5rMl5qCqn/y
	aYDXIX6MguMj2ErFN/J5DsQNiYl0=
X-Gm-Gg: ASbGncv6+tMJyxY4QL1O8V2Ds+Ojf1PnfHrCGBH9wKG/Xql1dmRyg4ks1ZMYw+1cqAw
	TfrTcogou8RVDtY3e+Cqn0VE0vBnzbA==
X-Google-Smtp-Source: AGHT+IG1u70CrRcaGoa9A4QTDeuRLJfbjWhONQIRdDJpQ5AI8aZNAldi71x+Yz+5zmH0RgWEdxGbdJhmwjxmWnOdQDQ=
X-Received: by 2002:a05:651c:1147:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2ffa719667dmr20308861fa.37.1732288324430; Fri, 22 Nov 2024
 07:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com> <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 22 Nov 2024 15:11:53 +0000
Message-ID: <CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH v2 1/6] xen-u-boot-scr-configuration:
 Add bbclass for xen boot script variables
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000039f144062781ceb7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Nov 2024 15:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9009

--00000000000039f144062781ceb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sandeep,

This series is promoting some of the Xen hypervisor launch configuration
from the hardware-specific dynamic layers into the common layer, and
introducing a class that defines interfaces to the hypervisor and its guest
virtual machines that should be applicable across all architectures, hence
my comments from a non-architecture-specific perspective.

There's a lot of opportunity for development in this layer to extend and
improve this area of configuration -- thanks for your contribution.

On Thu, Nov 21, 2024 at 10:49=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Add a new bbclass for xen boot script variables. This bbclass provides
> common xen u-boot boot script variables which can be inherited by any
> vendor specific u-boot boot script recipes. Also these variable are
> configurable from recipes, global and machine configuration files.
>
> Variable nomenclature is aligned with xen documentation.
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
> Currently it supports Xen Dom0 boot and can be extended for DomU
> or Dom0less boot.
>


I think that none of the variables in the file are specific to the u-boot
bootloader, so: could this class be given a non-u-boot-specific name, with
a view to this configuration being plumbed into all Xen system
configurations?

Some of the values defined are specific to Arm64 platforms: could those
default values be moved into an Arm64-specific class? If the variables
themselves are also arch-specific, they could be moved too.

Declaring the Dom0-specific variables as an interface is a bit unfortunate,
given dom0less (and hyperlaunch) systems where there needs to be a method
for providing the same configuration memory and vcpu values for multiple
guest VMs, rather than just dom0. Do you have a design in mind for the
extension to DomU or Dom0less that you mention?

Christopher



>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../xen-u-boot-scr-configuration.bbclass      | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 classes-recipe/xen-u-boot-scr-configuration.bbclass
>
> diff --git a/classes-recipe/xen-u-boot-scr-configuration.bbclass
> b/classes-recipe/xen-u-boot-scr-configuration.bbclass
> new file mode 100644
> index 00000000..df8287e1
> --- /dev/null
> +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass
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
> +# Variable nomenclature is aligned with
> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
> +
> +# Image Load Address for Xen Dom0 boot
> +KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
> +XEN_LOAD_ADDRESS ??=3D "0x00200000"
> +DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
> +RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
> +
> +# Xen boot image types.
> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by
> u-boot.
> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
> +#                Example: xen or xen.efi or xen.gz
> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example:
> cpio.gz
> +XEN_IMAGETYPE ??=3D "xen"
> +DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
> +
> +# Set the amount of memory for dom0 depending on total available memory
> size(DDR).
> +DOM0_MEM ??=3D "256M"
> +
> +# Specify which UART console Xen should use. You can sepecify the
> devicetree
> +# alias or full path to a node in the devicetree
> +# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
> +# XEN_SERIAL_CONSOLES =3D "serial0" or
> +# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
> +XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
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
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9007):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9007
> Mute This Topic: https://lists.yoctoproject.org/mt/109713423/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000039f144062781ceb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Sandeep,</div><div><br></div><div=
>This series is promoting some of the Xen hypervisor launch configuration f=
rom the hardware-specific dynamic layers into the common layer, and introdu=
cing a class that defines interfaces to the hypervisor and its guest virtua=
l machines that should be applicable across all architectures, hence my com=
ments from a non-architecture-specific perspective.</div><div><br>There&#39=
;s a lot of opportunity for development in this layer to extend and improve=
 this area of configuration -- thanks for your contribution.<br></div></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr">On Thu, Nov 21, 2024 at 10:49=
=E2=80=AFPM Sandeep Gundlupet Raju via <a href=3D"http://lists.yoctoproject=
.org">lists.yoctoproject.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"ma=
ilto:amd.com@lists.yoctoproject.org">amd.com@lists.yoctoproject.org</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Add a new bbclass for xen boot script variables. This bb=
class provides<br>
common xen u-boot boot script variables which can be inherited by any<br>
vendor specific u-boot boot script recipes. Also these variable are<br>
configurable from recipes, global and machine configuration files.<br>
<br>
Variable nomenclature is aligned with xen documentation.<br>
<a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html=
" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/unstabl=
e/misc/xen-command-line.html</a><br>
<br>
Currently it supports Xen Dom0 boot and can be extended for DomU<br>
or Dom0less boot.<br></blockquote><div><br></div><div><br></div><div>I thin=
k that none of the variables in the file are specific to the u-boot bootloa=
der, so: could this class be given a non-u-boot-specific name, with a view =
to this configuration being plumbed into all Xen system configurations?<br>=
<br>Some of the values defined are specific to Arm64 platforms: could those=
 default values be moved into an Arm64-specific class? If the variables the=
mselves are also arch-specific, they could be moved too.<br><br>Declaring t=
he Dom0-specific variables as an interface is a bit unfortunate, given dom0=
less (and hyperlaunch) systems where there needs to be a method for providi=
ng the same configuration memory and vcpu values for multiple guest VMs, ra=
ther than just dom0. Do you have a design in mind for the extension to DomU=
 or Dom0less=C2=A0that you mention?</div><div><br></div><div>Christopher</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0.../xen-u-boot-scr-configuration.bbclass=C2=A0 =C2=A0 =C2=A0 | 43 +++=
++++++++++++++++<br>
=C2=A01 file changed, 43 insertions(+)<br>
=C2=A0create mode 100644 classes-recipe/xen-u-boot-scr-configuration.bbclas=
s<br>
<br>
diff --git a/classes-recipe/xen-u-boot-scr-configuration.bbclass b/classes-=
recipe/xen-u-boot-scr-configuration.bbclass<br>
new file mode 100644<br>
index 00000000..df8287e1<br>
--- /dev/null<br>
+++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
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
+<br>
+# Variable nomenclature is aligned with<br>
+# <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-command-line.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/unst=
able/misc/xen-command-line.html</a><br>
+<br>
+# Image Load Address for Xen Dom0 boot<br>
+KERNEL_LOAD_ADDRESS ??=3D &quot;0x00400000&quot;<br>
+XEN_LOAD_ADDRESS ??=3D &quot;0x00200000&quot;<br>
+DEVICETREE_LOAD_ADDRESS ??=3D &quot;0xC000000&quot;<br>
+RAMDISK_LOAD_ADDRESS ??=3D &quot;0x2600000&quot;<br>
+<br>
+# Xen boot image types.<br>
+# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boo=
t.<br>
+# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.<b=
r>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Example: xen or x=
en.efi or xen.gz<br>
+# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio=
.gz<br>
+XEN_IMAGETYPE ??=3D &quot;xen&quot;<br>
+DOM0_RAMDISK_IMAGETYPE ??=3D &quot;rootfs.cpio.gz&quot;<br>
+<br>
+# Set the amount of memory for dom0 depending on total available memory si=
ze(DDR).<br>
+DOM0_MEM ??=3D &quot;256M&quot;<br>
+<br>
+# Specify which UART console Xen should use. You can sepecify the devicetr=
ee<br>
+# alias or full path to a node in the devicetree<br>
+# XEN_SERIAL_CONSOLES =3D &quot;/soc/serial@7e215040&quot; or<br>
+# XEN_SERIAL_CONSOLES =3D &quot;serial0&quot; or<br>
+# XEN_SERIAL_CONSOLES =3D &quot;/axi/serial@ff000000&quot;<br>
+XEN_SERIAL_CONSOLES ??=3D &quot;/soc/serial@7e215040&quot;<br>
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
+DOM0_MAX_VCPUS ??=3D &quot;1&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9007): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9007" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9007</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109713423/361=
9037" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109713423/3619037</a><br>
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

--00000000000039f144062781ceb7--

