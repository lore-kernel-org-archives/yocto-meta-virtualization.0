Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.21317.1633409270354980831
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 21:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YoJL2FQH;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id a3so24584368oid.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Oct 2021 21:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7wxQ8zE7VMntuwBs9ECLafMKdLWGBMVY62nLGq40prE=;
        b=YoJL2FQHjzXobm1b+HNG7fHK/fbcdMHiA1mp+pq8zQKgLrf2wRmsmSvfWwQEpOJAbv
         ib4KQmdhA7tb2DBRTJVfSC2J7XTsA5h0jR0GKWEAQcrAOxCFu/aBt9eVK/E56j0cf4L1
         pK2Pj2XsNKaSCf23elymMDtIawcHiwfMWQxymzLSQUd8RhbRIP/GMRpyRuOJGec7vYai
         WYamdTziroQjCGcuFIrebhy754mW+u8T+WX+y5VmL15qbwZtdv+n4j7/gTKDb2uMGeZ/
         SyxGOHNpyd44HI60vuCl47rfxLoALA+BUaKx+wM34EtL+Rh8Ur9PM5Fyv6hNK0JJK9HZ
         iV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7wxQ8zE7VMntuwBs9ECLafMKdLWGBMVY62nLGq40prE=;
        b=qVhh8dnXYn6B912rWaODrTMo3c1+8xpkMhQcxWLjzybbDmc8M1H/aYur2oqmgMakUG
         f1s07K6+Snp4YWWxcVnVkAH/B4VDleJ1kmBYgpG/y9o2h2M+DenFOala9QdQUAkvRlkV
         57eaDwnMmwzx70DKhIjLv8oQoqb9rbOVINUqX1oPP1DMx0OT6X1BuTsC96XOlH6oa63X
         bA+hJ/DaBeBobhqv6BmnBwy+rTHlU/0m/pGmPoZ3eFalqV+rwgcANK06xG40Al72aLFW
         2NgMAx6i1m7yi3QhGNIETcoHtZIC+0QBCCKTVXzrK/O5UBThqESU0kJdDlfXEwo2jrnn
         kZLA==
X-Gm-Message-State: AOAM533cDe4bnq5/AAvGuVxuZHN2iVyHVsNsf4A542WFLIv2Y+14Tutz
	a4oHQbn7ciiV6k9T/dOAhCTqzZDobPKyIpyVjbI=
X-Google-Smtp-Source: ABdhPJwtq3XbIP6Z3U/uqqLe5f/groDzgAZY+/edFom+BG16m/jX5j9OrEf8aI+8RYsohWk/rHzu675TRpukKD0yyms=
X-Received: by 2002:a05:6808:10d5:: with SMTP id s21mr876527ois.152.1633409269614;
 Mon, 04 Oct 2021 21:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930145423.17162-1-luca.fancellu@arm.com> <20210930145423.17162-2-luca.fancellu@arm.com>
 <CBE9B37C-92EA-4FB6-B55D-59A4DC0C8849@arm.com>
In-Reply-To: <CBE9B37C-92EA-4FB6-B55D-59A4DC0C8849@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 4 Oct 2021 21:47:38 -0700
Message-ID: <CACMJ4GbBgbwOxELyB2GCT5g51ALoZQU_4MOGUsyRY=2u+O0K+g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen, rpi4: Use PARTUUID for rootfs discovery
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000049ccb905cd93bb0f"

--00000000000049ccb905cd93bb0f
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 8:03 AM Bertrand Marquis <bertrand.marquis@arm.com>
wrote:

> Hi Luca,
>
> > On 30 Sep 2021, at 15:54, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> >
> > The mmc probing order has become unpredictable
> > due to recent linux kernel changes, therefore devices
> > like the raspberry pi that have two mmc interface most
> > of the time can't boot from the hard-coded root path.
> >
> > Modify the u-boot script to fetch the PARTUUID of the
> > second partition of the sd card and use it to put
> > root=PARTUUID=<xxx> in the command line passed to
> > the dom0 kernel.
>

Thanks for posting a way of handling this. I've encountered the same
unpredictable device enumeration and had been looking into whether
switching the sdhci_iproc driver to PROBE_FORCE_SYNCHRONOUS instead of
PROBE_PREFER_ASYNCHRONOUS would resolve it but I can't report that it does.
I would prefer to have a way to get stable enumeration but without it, this
is an improvement.


> >
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
Tested-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher



>
> Cheers
> Bertrand
>
> > ---
> > .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in          | 11 +++++++----
> > 1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git
> a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> > index 0367e36..9874220 100644
> > --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> > +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/
> boot.cmd.xen.in
> > @@ -13,10 +13,6 @@ fdt resize 0x1000
> > echo Add boot arguments for Xen
> > fdt set /chosen xen,xen-bootargs "console=dtuart
> dtuart=/soc/serial@7e215040 dom0_mem='@@RPI_DOM0_MEM@@'
> @@RPI_DEBUG_XEN_ARGS@@"
> >
> > -echo Add boot arguments for dom0
> > -setenv dom0_bootargs "console=hvc0 earlycon=xenboot debug
> root=/dev/mmcblk0p2 rootwait"
> > -fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
> > -
> > echo Add a dom0 node to chosen to put Linux boot information in
> > fdt mknode /chosen dom0
> >
> > @@ -32,6 +28,13 @@ fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0
> > echo Delay to allow the MMC card to be ready
> > sleep 1
> >
> > +# Retrieve PARTUUID for the rootfs partition of the sdcard
> > +part uuid mmc 1:2 rootfs_partuuid
> > +
> > +echo Add boot arguments for dom0
> > +setenv dom0_bootargs "console=hvc0 earlycon=xenboot debug
> root=PARTUUID=${rootfs_partuuid} rootwait"
> > +fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
> > +
> > echo Load Xen into memory
> > fatload mmc 1:1 ${xen_loadaddr} xen
> > echo Xen loaded, size: 0x$filesize
> > --
> > 2.17.1
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>
> 
>
>

--00000000000049ccb905cd93bb0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 30, 2021 at 8:03 AM Bertr=
and Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.com">bertrand.marqui=
s@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Luca,<br>
<br>
&gt; On 30 Sep 2021, at 15:54, Luca Fancellu &lt;<a href=3D"mailto:Luca.Fan=
cellu@arm.com" target=3D"_blank">Luca.Fancellu@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The mmc probing order has become unpredictable<br>
&gt; due to recent linux kernel changes, therefore devices<br>
&gt; like the raspberry pi that have two mmc interface most<br>
&gt; of the time can&#39;t boot from the hard-coded root path.<br>
&gt;<br>
&gt; Modify the u-boot script to fetch the PARTUUID of the<br>
&gt; second partition of the sd card and use it to put<br>
&gt; root=3DPARTUUID=3D&lt;xxx&gt; in the command line passed to<br>
&gt; the dom0 kernel.<br></blockquote><div><br></div><div>Thanks for postin=
g a way of handling this. I&#39;ve encountered the same unpredictable devic=
e enumeration and had been looking into whether switching the sdhci_iproc d=
river to PROBE_FORCE_SYNCHRONOUS instead of PROBE_PREFER_ASYNCHRONOUS would=
 resolve it but I can&#39;t report that it does. I would prefer to have a w=
ay to get stable enumeration but without it, this is an improvement.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Luca Fancellu &lt;<a href=3D"mailto:luca.fancellu@arm.c=
om" target=3D"_blank">luca.fancellu@arm.com</a>&gt;<br></blockquote>&gt; Re=
viewed-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@arm.com" target=
=3D"_blank">diego.sueiro@arm.com</a>&gt;=C2=A0<blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@arm.co=
m" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br></blockquote><div>=
<br></div><div><div>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:ch=
ristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><di=
v>Tested-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gm=
ail.com">christopher.w.clark@gmail.com</a>&gt;</div></div><div><br></div><d=
iv>Christopher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; ---<br>
&gt; .../xen-rpi-u-boot-scr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D=
"noreferrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 11 +++++++----<br>
&gt; 1 file changed, 7 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr=
/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_bla=
nk">boot.cmd.xen.in</a> b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-=
boot-scr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=
=3D"_blank">boot.cmd.xen.in</a><br>
&gt; index 0367e36..9874220 100644<br>
&gt; --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/=
<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boo=
t.cmd.xen.in</a><br>
&gt; +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/=
<a href=3D"http://boot.cmd.xen.in" rel=3D"noreferrer" target=3D"_blank">boo=
t.cmd.xen.in</a><br>
&gt; @@ -13,10 +13,6 @@ fdt resize 0x1000<br>
&gt; echo Add boot arguments for Xen<br>
&gt; fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D/soc/=
serial@7e215040 dom0_mem=3D&#39;@@RPI_DOM0_MEM@@&#39; @@RPI_DEBUG_XEN_ARGS@=
@&quot;<br>
&gt;<br>
&gt; -echo Add boot arguments for dom0<br>
&gt; -setenv dom0_bootargs &quot;console=3Dhvc0 earlycon=3Dxenboot debug ro=
ot=3D/dev/mmcblk0p2 rootwait&quot;<br>
&gt; -fdt set /chosen xen,dom0-bootargs \&quot;${dom0_bootargs}\&quot;<br>
&gt; -<br>
&gt; echo Add a dom0 node to chosen to put Linux boot information in<br>
&gt; fdt mknode /chosen dom0<br>
&gt;<br>
&gt; @@ -32,6 +28,13 @@ fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0<br>
&gt; echo Delay to allow the MMC card to be ready<br>
&gt; sleep 1<br>
&gt;<br>
&gt; +# Retrieve PARTUUID for the rootfs partition of the sdcard<br>
&gt; +part uuid mmc 1:2 rootfs_partuuid<br>
&gt; +<br>
&gt; +echo Add boot arguments for dom0<br>
&gt; +setenv dom0_bootargs &quot;console=3Dhvc0 earlycon=3Dxenboot debug ro=
ot=3DPARTUUID=3D${rootfs_partuuid} rootwait&quot;<br>
&gt; +fdt set /chosen xen,dom0-bootargs \&quot;${dom0_bootargs}\&quot;<br>
&gt; +<br>
&gt; echo Load Xen into memory<br>
&gt; fatload mmc 1:1 ${xen_loadaddr} xen<br>
&gt; echo Xen loaded, size: 0x$filesize<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000049ccb905cd93bb0f--
