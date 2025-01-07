Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F903E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 15:33:49 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.23369.1736264024930141685
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 07:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KpWRNo+b;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so182951151fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 07:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736264023; x=1736868823; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lnRnFag+Pr1sTrRErqNN4L658MClC7Wm5WnFNnv9ESk=;
        b=KpWRNo+bX7VyoU480NM3FOiQg1rocT3oEc10IWBnYs/AwiGQFXt1N8vXrsH4YXpc93
         iRrRPhxo7zI8PXZz2bAPYhcJHmqFnhcTCdhIVt6InGftXMbHlLpo9c2IBSKtYj6NSBQM
         WPkw8mHrrxXgJAENBbVtDVK2zb1KqKGSZ1mG/2cY3sTTZE6ZIUh6zEHMUty71r44hbX1
         us0NVwrJaa48GQDQLEvGGkl5EdbU1PGq2uzS4HLhYG4EvflPBTeayA9YgqadRS0EuMtI
         zSR+96U3AH2JKxlmdmNu2mcff6AGXcoQKbrKYfklVEyvIyizNRSfrMcPI9KA89XhpAVD
         Hc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264023; x=1736868823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnRnFag+Pr1sTrRErqNN4L658MClC7Wm5WnFNnv9ESk=;
        b=kaHUz2sJIs0N7qD6KAfetWs3VYwZ+rFvU1d4wfptn3bjDRfhVCyGSuxWXnS7I6iBD0
         mIisBHuCI1uJJ1wNcHMB+t6GcNpa88c8nQwcvGjWcb5TQwq48sP/F+GsO+eHieI2Y1GC
         0Ab5gWLGKZ5J2Cb9Yx/3jXzOu506a6HgWfiaRH5TR8sPB9PWvWXGMg0UaLwvSR3TEbU1
         1Jeci2TY06kkS4Ompi/nsMp0NJjrFvqsyJ8NZ54jVEDImAgHdyS5TTUwfs6dD+Hw8ait
         fQYI2mqBGeL/5fypV6y55MS3DGklo8J1RKXNpjLdGRPL68VeukY2WHei0vuF+jipSVFy
         iAKA==
X-Gm-Message-State: AOJu0Yx0rT0KkZTA3sx/K+rcREKCblp14RqCa2WRwPIrdlK5flHJ+0bB
	iOfn8U3+ZuOXSUOSKrrgoNdz/emx38a6gWXtGbnzJd5x42deEFuEi7gOvJHK6uHjEmmFVOn94kC
	CFeDCEQy2YdGLdvBECz8T1TDcSpE=
X-Gm-Gg: ASbGncsK+3u8vuAoj0CgVAgV9vCpB4YaTnPcmfieerYFEXAr+96zoaT2AJw9BLXhZkM
	BMlxTTRQCH5MxJq1rCs7kb5CUQGkgA1QC3rsT
X-Google-Smtp-Source: AGHT+IH/0NaYue2OZu2bxzA0LADMK+JeFAPHTvlKHXVwCmMbRh+22zNW7LWyePQ0dG9GH1yucEvmnT1++6/TXYAErls=
X-Received: by 2002:a2e:bc07:0:b0:302:3356:7ce2 with SMTP id
 38308e7fff4ca-30468543b9amr208670521fa.11.1736264022645; Tue, 07 Jan 2025
 07:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com> <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20241209145442.3291634-3-sandeep.gundlupet-raju@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 7 Jan 2025 15:33:31 +0000
X-Gm-Features: AbW1kvYzBTvQ22GiN0cxxM9w2t5ToB35qV5VIkRhubEtPR3gvqOFgs6D8Hcakvk
Message-ID: <CACMJ4GZRusBUrxF-zRywgQhMfT+U_1-FR4yENn7bkZu27zfzgA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 2/5]
 xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
To: sandeep.gundlupet-raju@amd.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com, 
	mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000004e6229062b1f787e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 15:33:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9074

--0000000000004e6229062b1f787e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sandeep Gundlupet Raju via
lists.yoctoproject.org <sandeep.gundlupet-raju=3D
amd.com@lists.yoctoproject.org> wrote:

> Inherit xen-launch-config bbclass to use common xen launch config
> variables for xen-rpi-u-boot-scr recipe.
>

There is a functional change in this commit that would be appropriate to
mention in the commit message:
it introduces the use of KERNEL_IMAGETYPE to identify the dom0 linux kernel
file whereas it was previously assumed to be 'Image'.

I think this is an improvement, though I'm not able to test it at the
moment.


>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in        | 10 +++++-----
>  .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb        | 13 ++++++++-----
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git
> a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> index 98742200..b0ed0dc8 100644
> --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> @@ -5,13 +5,13 @@ fdt addr ${fdt_addr}
>  fdt get value bootargs /chosen bootargs
>
>  # Set module load addresses
> -setenv xen_loadaddr     "0x00200000"
> -setenv kernel_loadaddr  "0x00400000"
> +setenv xen_loadaddr     "@@XEN_LOAD_ADDRESS@@"
> +setenv kernel_loadaddr  "@@KERNEL_LOAD_ADDRESS@@"
>
>  # Add some space to the fdt so we can edit it
>  fdt resize 0x1000
>  echo Add boot arguments for Xen
> -fdt set /chosen xen,xen-bootargs "console=3Ddtuart
> dtuart=3D/soc/serial@7e215040 dom0_mem=3D'@@RPI_DOM0_MEM@@'
> @@RPI_DEBUG_XEN_ARGS@@"
> +fdt set /chosen xen,xen-bootargs "console=3Ddtuart
> dtuart=3D@@XEN_SERIAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ @@XEN_CMDLINE_AP=
PEND@
> @"
>

Is there a way to ensure that if XEN_SERIAL_CONSOLES is unset that the
dtuart=3D argument is not passed, and likewise for DOM0_MEM and the dom0_me=
m=3D
argument?

Christopher

--0000000000004e6229062b1f787e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Dec 9, 2024 at 2:54=E2=80=AFPM Sa=
ndeep Gundlupet Raju via <a href=3D"http://lists.yoctoproject.org">lists.yo=
ctoproject.org</a> &lt;sandeep.gundlupet-raju=3D<a href=3D"mailto:amd.com@l=
ists.yoctoproject.org">amd.com@lists.yoctoproject.org</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Inherit xen-launch-config bbclass to use common =
xen launch config<br>
variables for xen-rpi-u-boot-scr recipe.<br></blockquote><div><br></div><di=
v>There is a functional change in this commit that would be appropriate to =
mention in the commit message:</div><div>it introduces the use of KERNEL_IM=
AGETYPE to identify the dom0 linux kernel file whereas it was previously as=
sumed to be &#39;Image&#39;.</div><div><br></div><div>I think this is an im=
provement, though I&#39;m not able to test it at the moment.</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0.../xen-rpi-u-boot-scr/files/<a href=3D"http://boot.cmd.xen.in" rel=
=3D"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 10 +++++-----<br>
=C2=A0.../xen-rpi-u-boot-scr/<a href=3D"http://xen-rpi-u-boot-scr.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-rpi-u-boot-scr.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 ++++++++-----<br>
=C2=A02 files changed, 13 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/file=
s/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">b=
oot.cmd.xen.in</a> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-=
scr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_=
blank">boot.cmd.xen.in</a><br>
index 98742200..b0ed0dc8 100644<br>
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a hr=
ef=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd=
.xen.in</a><br>
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/<a hr=
ef=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boot.cmd=
.xen.in</a><br>
@@ -5,13 +5,13 @@ fdt addr ${fdt_addr}<br>
=C2=A0fdt get value bootargs /chosen bootargs<br>
<br>
=C2=A0# Set module load addresses<br>
-setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;0x00200000&quot;<br>
-setenv kernel_loadaddr=C2=A0 &quot;0x00400000&quot;<br>
+setenv xen_loadaddr=C2=A0 =C2=A0 =C2=A0&quot;@@XEN_LOAD_ADDRESS@@&quot;<br=
>
+setenv kernel_loadaddr=C2=A0 &quot;@@KERNEL_LOAD_ADDRESS@@&quot;<br>
<br>
=C2=A0# Add some space to the fdt so we can edit it<br>
=C2=A0fdt resize 0x1000<br>
=C2=A0echo Add boot arguments for Xen<br>
-fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D/soc/seri=
al@7e215040 dom0_mem=3D&#39;@@RPI_DOM0_MEM@@&#39; @@RPI_DEBUG_XEN_ARGS@@&qu=
ot;<br>
+fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D@@XEN_SER=
IAL_CONSOLES@@ dom0_mem=3D@@DOM0_MEM@@ @@XEN_CMDLINE_APPEND@@&quot;<br></bl=
ockquote><div><br></div><div>Is there a way to ensure that if XEN_SERIAL_CO=
NSOLES is unset that the dtuart=3D argument is not passed, and likewise for=
 DOM0_MEM and the dom0_mem=3D argument?</div><div>=C2=A0</div><div>Christop=
her</div></div></div>

--0000000000004e6229062b1f787e--

