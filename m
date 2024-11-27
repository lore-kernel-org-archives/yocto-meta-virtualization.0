Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D75AD6D248
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 23:13:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.84083.1732749207479573204
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 15:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ON3n5RSP;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffced84ba8so2298601fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Nov 2024 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732749206; x=1733354006; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDZ9mB35J2bKfeIe9lt8A8hv+TRNFFxq6qyOEpVDN3o=;
        b=ON3n5RSP9eW+2z+UQlOa6HbohR/QQfVTYSx1OiHitTWMYQyCMn02mNLeOK5pgzHxNH
         1aqFSmqUiEE4W08FPsKn2GXU3kWyq0NUykTxV0Ft/Jqshc3btaJUFd3sF6jwy87AeA+O
         7NVRiT1mKTUCxTjtzGvxX1uWiUAslaIKnNgG5vumAfIGw/P43wlVkZe2huRbmaJaw4zD
         SlcosFLD/0hBrQi2AR+n5PngIyl2us1xyxA7iC2ssyZmgjhm+zluiKf8AM9b/h3bnRAS
         kXV6+8ghgUQxDmrCbvKiNfuqbj4YqINSt/BHYWg/NVk4hnwCzUJ2ws06HCpu9ZMi6VPW
         Mgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749206; x=1733354006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDZ9mB35J2bKfeIe9lt8A8hv+TRNFFxq6qyOEpVDN3o=;
        b=n74h04C9b/z4Oq4YM3sbWRqpDgKRrhzrkKVSH+ceK7wPogTTAsiaSGv+y3n7m13bNh
         kmHb+IxZz8HDQOLCtdto/j8lFXluoAT/UjzyEjzUU1sIexWpwOxRQ9vT1vunz7NsSJyH
         GGBuYEydXFbkEl//RgovHwGSCcYCoJYYh8hvXsbNbO/fDfaClHwdsL3YGSnwzxcZVMC2
         PCQNkf7oVnJeWD+8PJrPJMF4qT+3xjIQRhEZTpymH3IlxicWenaeW3lRU8jIdNgI6rTi
         w0JfAWH7V9f0KgriIdi7Xoo0u7FCZnE1D+YPHvKqBPRPUuBOEBskvT48kiCrwdZOthBQ
         C++w==
X-Gm-Message-State: AOJu0YyigBGAh5sCMoVDfiW4eBqtAKKrFNPCXBvINL26agyzsu8dSkVk
	A0ZcmWZ5uhb2f1yGi0TfcCLzFJK/x8Ruzgmy/ZuPIBNdzWEEMcC7+N7U1ADvlHSKISBVLufd2l/
	4bGDuKwubyAqnc+U7S/VpDGouXrE=
X-Gm-Gg: ASbGncuxiMLC4RFxbrxnnVKb/UTNWO8L/kP/5YNcKXEi549gM1B6pzXOiA2blr1k6Ab
	mc2uKWw8qbAeIWXSpL3t05uhp5bRztQ==
X-Google-Smtp-Source: AGHT+IFal4gz9xJklQBy1jxkxdc4qOChCACyhBcPjnCNuSBJSFA093UIIZKZftejCGWbcdGFu/0PeBoKYgg39q9xZ3Y=
X-Received: by 2002:a05:651c:19a2:b0:2ff:a7c1:8c2e with SMTP id
 38308e7fff4ca-2ffd60cfa36mr31128621fa.28.1732749205180; Wed, 27 Nov 2024
 15:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
 <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com> <CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com>
 <6952bcbe-548b-4bf7-b994-6a28bcd4d314@amd.com>
In-Reply-To: <6952bcbe-548b-4bf7-b994-6a28bcd4d314@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 27 Nov 2024 23:13:13 +0000
Message-ID: <CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH v2 1/6] xen-u-boot-scr-configuration:
 Add bbclass for xen boot script variables
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dc19cd0627ed1cd3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Nov 2024 23:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9014

--000000000000dc19cd0627ed1cd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 9:55=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Hi Christopher,
> On 11/22/2024 8:11 AM, Christopher Clark via lists.yoctoproject.org wrote=
:
>
> Hi Sandeep,
>
> This series is promoting some of the Xen hypervisor launch configuration
> from the hardware-specific dynamic layers into the common layer, and
> introducing a class that defines interfaces to the hypervisor and its gue=
st
> virtual machines that should be applicable across all architectures, henc=
e
> my comments from a non-architecture-specific perspective.
>
> There's a lot of opportunity for development in this layer to extend and
> improve this area of configuration -- thanks for your contribution.
>
> [Sandeep]: Yes that's the main goal and I've already discussed with Bruce
> on this topic.
>
>
> On Thu, Nov 21, 2024 at 10:49=E2=80=AFPM Sandeep Gundlupet Raju via
> lists.yoctoproject.org <sandeep.gundlupet-raju=3D
> amd.com@lists.yoctoproject.org> wrote:
>
>> Add a new bbclass for xen boot script variables. This bbclass provides
>> common xen u-boot boot script variables which can be inherited by any
>> vendor specific u-boot boot script recipes. Also these variable are
>> configurable from recipes, global and machine configuration files.
>>
>> Variable nomenclature is aligned with xen documentation.
>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>
>> Currently it supports Xen Dom0 boot and can be extended for DomU
>> or Dom0less boot.
>>
>
>
> I think that none of the variables in the file are specific to the u-boot
> bootloader, so: could this class be given a non-u-boot-specific name, wit=
h
> a view to this configuration being plumbed into all Xen system
> configurations?
>
> [Sandeep]: Good catch these variables are not specific to u-boot, I will
> rename and send a v3 patch. Does xen-configuration.bbclass name works?
>

Sorry, I think not because it would cause confusion: it doesn't configure
the build (Kconfig), and doesn't set runtime configuration, like the
toolstack, storage system, any stubdomains, etc.

It could be xen-launch-config.bbclass though, since it sets the hypervisor
boot parameters and also those for the initial domain (dom0), and would be
appropriate if it is planned to be extended for more domains later.


>
> Some of the values defined are specific to Arm64 platforms: could those
> default values be moved into an Arm64-specific class? If the variables
> themselves are also arch-specific, they could be moved too.
>
> [Sandeep]: Can you specify which variables are arm65 specific?
>

Having looked at it since, there's two categories of variables: hypervisor
settings and dom0 - could that be clearer if all of the variables for dom0
have a DOM0_ prefix?

Christopher


>
> Declaring the Dom0-specific variables as an interface is a bit
> unfortunate, given dom0less (and hyperlaunch) systems where there needs t=
o
> be a method for providing the same configuration memory and vcpu values f=
or
> multiple guest VMs, rather than just dom0. Do you have a design in mind f=
or
> the extension to DomU or Dom0less that you mention?
>
> [Sandeep]: I assume dom0 and dom0less variables are same, to enable
> dom0less boot all we need is to enable CONFIG_DOM0LESS_BOOT from xen
> configuration. As per Stefano, dom0less is supported for ARM64 today and
> Stefano is working to implement dom0less for x86 and will be upstream
> soon(not sure on timeline.)
>
>
> Christopher
>
>
>
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>  .../xen-u-boot-scr-configuration.bbclass      | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 classes-recipe/xen-u-boot-scr-configuration.bbclass
>>
>> diff --git a/classes-recipe/xen-u-boot-scr-configuration.bbclass
>> b/classes-recipe/xen-u-boot-scr-configuration.bbclass
>> new file mode 100644
>> index 00000000..df8287e1
>> --- /dev/null
>> +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass
>> @@ -0,0 +1,43 @@
>> +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved=
.
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +# This bbclass defines u-boot script variables required for xen boot
>> which can be
>> +# inherited u-boot boot scripts recipes and also allows to configure
>> these variables
>> +# from recipes, global and machine configurations files.
>> +
>> +# Variable nomenclature is aligned with
>> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>> +
>> +# Image Load Address for Xen Dom0 boot
>> +KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
>> +XEN_LOAD_ADDRESS ??=3D "0x00200000"
>> +DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
>> +RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
>> +
>> +# Xen boot image types.
>> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by
>> u-boot.
>> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot=
.
>> +#                Example: xen or xen.efi or xen.gz
>> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example:
>> cpio.gz
>> +XEN_IMAGETYPE ??=3D "xen"
>> +DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
>> +
>> +# Set the amount of memory for dom0 depending on total available memory
>> size(DDR).
>> +DOM0_MEM ??=3D "256M"
>> +
>> +# Specify which UART console Xen should use. You can sepecify the
>> devicetree
>> +# alias or full path to a node in the devicetree
>> +# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
>> +# XEN_SERIAL_CONSOLES =3D "serial0" or
>> +# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
>> +XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
>> +
>> +# Specify additional command line arguments used for Xen and this will
>> be appended
>> +# to xen-bootargs cariable. This can also be used for passing debug cmd
>> line arguments.
>> +# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall
>> guest_loglvl=3Ddebug"
>> +XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
>> +
>> +# Specify the max number of vcpus for dom0
>> +# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
>> +DOM0_MAX_VCPUS ??=3D "1"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9010):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9010
> Mute This Topic: https://lists.yoctoproject.org/mt/109713423/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark+meta-virt@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dc19cd0627ed1cd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 22, 2024 at 9:55=E2=80=AFPM S=
andeep Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org">lists.y=
octoproject.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@=
lists.yoctoproject.org">amd.com@lists.yoctoproject.org</a>&gt; wrote:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><u></u>

 =20
  <div>
    <p>Hi Christopher,<br>
    </p>
    <div>On 11/22/2024 8:11 AM, Christopher
      Clark via <a href=3D"http://lists.yoctoproject.org" target=3D"_blank"=
>lists.yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div>Hi Sandeep,</div>
          <div><br>
          </div>
          <div>This series is promoting some of the Xen hypervisor
            launch configuration from the hardware-specific dynamic
            layers into the common layer, and introducing a class that
            defines interfaces to the hypervisor and its guest virtual
            machines that should be applicable across all architectures,
            hence my comments from a non-architecture-specific
            perspective.</div>
          <div><br>
            There&#39;s a lot of opportunity for development in this layer
            to extend and improve this area of configuration -- thanks
            for your contribution.<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Yes that&#39;s the main goal and I&#39;ve already discussed =
with
    Bruce on this topic.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <div dir=3D"ltr">On Thu, Nov 21, 2024 at 10:49=E2=80=AFPM Sandeep
          Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org" targ=
et=3D"_blank">lists.yoctoproject.org</a>
          &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@lists.yoct=
oproject.org" target=3D"_blank">amd.com@lists.yoctoproject.org</a>&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            a new bbclass for xen boot script variables. This bbclass
            provides<br>
            common xen u-boot boot script variables which can be
            inherited by any<br>
            vendor specific u-boot boot script recipes. Also these
            variable are<br>
            configurable from recipes, global and machine configuration
            files.<br>
            <br>
            Variable nomenclature is aligned with xen documentation.<br>
            <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-comma=
nd-line.html" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/=
docs/unstable/misc/xen-command-line.html</a><br>
            <br>
            Currently it supports Xen Dom0 boot and can be extended for
            DomU<br>
            or Dom0less boot.<br>
          </blockquote>
          <div><br>
          </div>
          <div><br>
          </div>
          <div>I think that none of the variables in the file are
            specific to the u-boot bootloader, so: could this class be
            given a non-u-boot-specific name, with a view to this
            configuration being plumbed into all Xen system
            configurations?<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Good catch these variables are not specific to u-boot, I
    will rename and send a v3 patch. Does xen-configuration.bbclass name
    works?<br></div></blockquote><div><br></div><div>Sorry, I think not bec=
ause it would cause confusion: it doesn&#39;t configure the build (Kconfig)=
, and doesn&#39;t set runtime configuration, like the toolstack, storage sy=
stem, any stubdomains, etc.</div><div><br></div><div>It could be xen-launch=
-config.bbclass though, since it sets the hypervisor boot parameters and al=
so those for the initial domain (dom0), and would be appropriate if it is p=
lanned to be extended for more domains later.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
            Some of the values defined are specific to Arm64 platforms:
            could those default values be moved into an Arm64-specific
            class? If the variables themselves are also arch-specific,
            they could be moved too.<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Can you specify which variables are arm65 specific?<br></div=
></blockquote><div><br></div><div>Having looked at it since, there&#39;s tw=
o categories of variables: hypervisor settings and dom0 - could that be cle=
arer if all of the variables for dom0 have a DOM0_ prefix?</div><div><br></=
div><div>Christopher</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
            Declaring the Dom0-specific variables as an interface is a
            bit unfortunate, given dom0less (and hyperlaunch) systems
            where there needs to be a method for providing the same
            configuration memory and vcpu values for multiple guest VMs,
            rather than just dom0. Do you have a design in mind for the
            extension to DomU or Dom0less=C2=A0that you mention?</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: I assume dom0 and dom0less variables are same, to enable
    dom0less boot all we need is to enable CONFIG_DOM0LESS_BOOT from xen
    configuration. As per Stefano, dom0less is supported for ARM64 today
    and Stefano is working to implement dom0less for x86 and will be
    upstream soon(not sure on timeline.)<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>Christopher</div>
          <div><br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:san=
deep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.c=
om</a>&gt;<br>
            ---<br>
            =C2=A0.../xen-u-boot-scr-configuration.bbclass=C2=A0 =C2=A0 =C2=
=A0 | 43
            +++++++++++++++++++<br>
            =C2=A01 file changed, 43 insertions(+)<br>
            =C2=A0create mode 100644
            classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
            <br>
            diff --git
            a/classes-recipe/xen-u-boot-scr-configuration.bbclass
            b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
            new file mode 100644<br>
            index 00000000..df8287e1<br>
            --- /dev/null<br>
            +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
            @@ -0,0 +1,43 @@<br>
            +# Copyright (C) 2024, Advanced Micro Devices, Inc.=C2=A0 All
            rights reserved.<br>
            +#<br>
            +# SPDX-License-Identifier: MIT<br>
            +#<br>
            +# This bbclass defines u-boot script variables required for
            xen boot which can be<br>
            +# inherited u-boot boot scripts recipes and also allows to
            configure these variables<br>
            +# from recipes, global and machine configurations files.<br>
            +<br>
            +# Variable nomenclature is aligned with<br>
            +# <a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-co=
mmand-line.html" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.o=
rg/docs/unstable/misc/xen-command-line.html</a><br>
            +<br>
            +# Image Load Address for Xen Dom0 boot<br>
            +KERNEL_LOAD_ADDRESS ??=3D &quot;0x00400000&quot;<br>
            +XEN_LOAD_ADDRESS ??=3D &quot;0x00200000&quot;<br>
            +DEVICETREE_LOAD_ADDRESS ??=3D &quot;0xC000000&quot;<br>
            +RAMDISK_LOAD_ADDRESS ??=3D &quot;0x2600000&quot;<br>
            +<br>
            +# Xen boot image types.<br>
            +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be
            loaded by u-boot.<br>
            +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be
            loaded by u-boot.<br>
            +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Examp=
le: xen or xen.efi or xen.gz<br>
            +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be
            used, Example: cpio.gz<br>
            +XEN_IMAGETYPE ??=3D &quot;xen&quot;<br>
            +DOM0_RAMDISK_IMAGETYPE ??=3D &quot;rootfs.cpio.gz&quot;<br>
            +<br>
            +# Set the amount of memory for dom0 depending on total
            available memory size(DDR).<br>
            +DOM0_MEM ??=3D &quot;256M&quot;<br>
            +<br>
            +# Specify which UART console Xen should use. You can
            sepecify the devicetree<br>
            +# alias or full path to a node in the devicetree<br>
            +# XEN_SERIAL_CONSOLES =3D &quot;/soc/serial@7e215040&quot; or<=
br>
            +# XEN_SERIAL_CONSOLES =3D &quot;serial0&quot; or<br>
            +# XEN_SERIAL_CONSOLES =3D &quot;/axi/serial@ff000000&quot;<br>
            +XEN_SERIAL_CONSOLES ??=3D &quot;/soc/serial@7e215040&quot;<br>
            +<br>
            +# Specify additional command line arguments used for Xen
            and this will be appended<br>
            +# to xen-bootargs cariable. This can also be used for
            passing debug cmd line arguments.<br>
            +# Examples: XEN_CMDLINE_APPEND ?=3D &quot;sched=3Dcredit loglv=
l=3Dall
            guest_loglvl=3Ddebug&quot;<br>
            +XEN_CMDLINE_APPEND ??=3D &quot;sync_console bootscrub=3D0&quot=
;<br>
            +<br>
            +# Specify the max number of vcpus for dom0<br>
            +# Example usage: DOM0_MAX_VCPUS =3D &quot;2&quot; or DOM0_MAX_=
VCPUS =3D
            &quot;2-4&quot;<br>
            +DOM0_MAX_VCPUS ??=3D &quot;1&quot;<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            <br>
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
View/Reply Online (#9010): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9010" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9010</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109713423/361=
9036" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109713423/3619036</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark%2B=
meta-virt@gmail.com" target=3D"_blank">christopher.w.clark+meta-virt@gmail.=
com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dc19cd0627ed1cd3--

