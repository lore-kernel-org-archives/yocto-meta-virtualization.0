Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.347.1597175991813533882
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 12:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uaCf6NCZ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BEABE01FED; Tue, 11 Aug 2020 12:59:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.68 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA4B5E01FA2
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Aug 2020 12:59:48 -0700 (PDT)
Received: by mail-ed1-f68.google.com with SMTP id i26so10008140edv.4
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Aug 2020 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RY4IsKEm4lSbiTVKP0D6tzAYqi+uTW0W6w6sBzVpURg=;
        b=uaCf6NCZiS0wr9cAK/Rx6A1wK87nAsUuj6fQR+eUh/Cchn0Nf6Jiu4yL0pzrOkRDk4
         dXLdOj1ED03TGoUzF8d3GK26FRy/ZZkPDfD52I9nzYHa/gduaIRIUJSMcB+OOk/6fC50
         Vv5H9ta2Y/oDCBL3Mexn3PcMqYIMI54RpyXDO3T21ixouShu6Nr096+TdclCb1Tyxjeo
         DRI0H7abR00feOiuTTmAhzgPXrAMwubNKdSm67jZhgroiu7I5NfR9naMDjwFhNYp7Uys
         LCrK8zbMa3XBLAUw+VivOJP6FK2ubYTbFVJ0b7HMdmo0eZr/nzlDYQUG3oIGQSJxkjZp
         9DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RY4IsKEm4lSbiTVKP0D6tzAYqi+uTW0W6w6sBzVpURg=;
        b=rPx2S6eToYxgD3O7jq4Y+3GXaKkcZS0jz9w/H+vw59TZ/5k6sdv2U9XIg/apfxFz2A
         iHx2EK7DooMAhto/Z18GS9U1heBdJcqwn3MHx6HZVL7ndmAV/mHb4wsSSx2/g31SmiJS
         2vLj9s3XcrVcl2VdGRanYj3DQeI9IP2TEO8eXOxqvMKQvx1aDUjCe+EGfYiPBbZ/RZwM
         5qxg8yvd4mR6nyhdZ8UsQz/bCk2xrYUhANc0NbAal2eynuHy4O3IN3X9nez/SvmjySXi
         GLqixKjuG81CtZn/kR+Ml7TA5XgjFLgKigQZES9g3yz99Zv6t8ZcjuhC3lkLic5wABvW
         bVsg==
X-Gm-Message-State: AOAM533eBllTbOokzdEoihqynhUuTb2javMjVfGqm5hlbjmnIjWX99Pe
	SHaYsAo4TPM/0EsRM3zPgH86kMT5HCCzlcB5nLg=
X-Google-Smtp-Source: ABdhPJwS8OqZnBTfiZDgzYhqyqNAtiMd/BsUWtjef/2Jv1cqHGQJMV/KmJpfd7iQH+7kT35SLnO9hQqL9H5Cp6eImdg=
X-Received: by 2002:aa7:cd6c:: with SMTP id ca12mr26697401edb.365.1597175987820;
 Tue, 11 Aug 2020 12:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 Aug 2020 15:59:36 -0400
Message-ID: <CADkTA4NpWZ_VV4GG1y1euh8G9-eWepSYJWNAwjPSmjLYsM1NOQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/5] Xen on Raspberry Pi 4 improvements
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: multipart/alternative; boundary="00000000000065dd7105ac9f835f"

--00000000000065dd7105ac9f835f
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 3:05 AM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> Several improvements, the most significant being the kernel change:
>
> * Switch the Linux kernel for Xen on the Raspberry Pi 4 to
>   linux-yocto-dev from the linux-raspberrypi downstream kernel.
>
> This will enable testing and preparation for switching over to the new
> linux-yocto kernel when it is upgraded, and also avoid build breakages
> and other difficulties experienced with the unstable linux-raspberrypi
> kernel.
>
> Testing with linux-yocto-dev has been with the raspberrypi4-64 MACHINE
> from the meta-raspberrypi layer.
>
> This change removes the patch series that was carried in this layer for
> the linux-raspberrypi kernel for Xen support.
>
> Please note: There are currently in-flight dependencies for this series
> awaiting review: linux-yocto series, needed for Xen support:
>
> https://lists.yoctoproject.org/g/linux-yocto/topic/linux_yocto_dev_kernel/76044154
> and a kernel bugfix:
> https://lists.yoctoproject.org/g/linux-yocto/message/8922
>
>
merged

And the kernel elements are in place as well.

I have pending SRCREV updates for the kernel, but if you build with the tip
of the branch by setting your own SRCREVs, it is functional.

Bruce



> * Retire the sdcard image recipe now that the meta-raspberrypi recipe
>   is extensible.
>
> * Recipe bug fixes and improvements.
>
> Christopher
>
>
> Christopher Clark (5):
>   xen: retire the Raspberry Pi sdcard class
>   xen, raspberrypi: bugfix early boot messages: use earlycon=xenboot
>   xen, rpi4: use RPI_EXTRA_CONFIG and drop the rpi-config_git.bbappend
>   xen, linux-raspberrypi4: remove linux-raspberrypi bbappends and
>     patches
>   xen, raspi4, linux-yocto-dev: Enable Xen on Raspberry Pi 4
>
>  classes/sdcard_image-rpi-xen.bbclass          | 120 ------------------
>  conf/distro/include/meta-virt-xen.inc         |  21 ++-
>  .../bootfiles/rpi-config_git.bbappend         |   6 -
>  .../rpi-u-boot-scr/files/boot.cmd.xen.in      |   2 +-
>  ...vmalloc_to_page-on-vmalloc-virt-addr.patch |  44 -------
>  ...02-swiotlb-xen-remove-start_dma_addr.patch |  47 -------
>  ...struct-device-parameter-to-xen_phys_.patch |  78 ------------
>  ...struct-device-parameter-to-xen_bus_t.patch |  66 ----------
>  ...struct-device-parameter-to-is_xen_sw.patch |  57 ---------
>  ...oduce-phys_to_dma-dma_to_phys-transl.patch |  88 -------------
>  ...translations-in-xen_dma_s_kernel_5.4.patch |  68 ----------
>  ..._to_phys-on-the-dma_addr_t-parameter.patch |  75 -----------
>  .../0011-adding-page-coherent-patch.patch     |  39 ------
>  .../linux/linux-raspberrypi_%.bbappend        |   5 -
>  .../linux/linux-raspberrypi_5.4.bbappend      |  19 ---
>  .../linux/linux-yocto-dev.bbappend            |  10 ++
>  16 files changed, 25 insertions(+), 720 deletions(-)
>  delete mode 100644 classes/sdcard_image-rpi-xen.bbclass
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0002-swiotlb-xen-remove-start_dma_addr.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/files/0011-adding-page-coherent-patch.patch
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_%.bbappend
>  delete mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bbappend
>  create mode 100644
> dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bbappend
>
> --
> 2.17.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000065dd7105ac9f835f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 7, 2020 at 3:05 AM Christopher Clark &l=
t;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Several improvements, the most significant being the kernel change:<br=
>
<br>
* Switch the Linux kernel for Xen on the Raspberry Pi 4 to<br>
=C2=A0 linux-yocto-dev from the linux-raspberrypi downstream kernel.<br>
<br>
This will enable testing and preparation for switching over to the new<br>
linux-yocto kernel when it is upgraded, and also avoid build breakages<br>
and other difficulties experienced with the unstable linux-raspberrypi<br>
kernel.<br>
<br>
Testing with linux-yocto-dev has been with the raspberrypi4-64 MACHINE<br>
from the meta-raspberrypi layer.<br>
<br>
This change removes the patch series that was carried in this layer for<br>
the linux-raspberrypi kernel for Xen support.<br>
<br>
Please note: There are currently in-flight dependencies for this series<br>
awaiting review: linux-yocto series, needed for Xen support:<br>
<a href=3D"https://lists.yoctoproject.org/g/linux-yocto/topic/linux_yocto_d=
ev_kernel/76044154" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/linux-yocto/topic/linux_yocto_dev_kernel/76044154</a><br>
and a kernel bugfix:<br>
<a href=3D"https://lists.yoctoproject.org/g/linux-yocto/message/8922" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/linux-yo=
cto/message/8922</a><br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">merged</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">A=
nd the kernel elements are in place as well.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I have pending SRCREV updates for the kernel, but if y=
ou build with the tip of the branch by setting your own SRCREVs, it is func=
tional.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
* Retire the sdcard image recipe now that the meta-raspberrypi recipe<br>
=C2=A0 is extensible.<br>
<br>
* Recipe bug fixes and improvements.<br>
<br>
Christopher<br>
<br>
<br>
Christopher Clark (5):<br>
=C2=A0 xen: retire the Raspberry Pi sdcard class<br>
=C2=A0 xen, raspberrypi: bugfix early boot messages: use earlycon=3Dxenboot=
<br>
=C2=A0 xen, rpi4: use RPI_EXTRA_CONFIG and drop the rpi-config_git.bbappend=
<br>
=C2=A0 xen, linux-raspberrypi4: remove linux-raspberrypi bbappends and<br>
=C2=A0 =C2=A0 patches<br>
=C2=A0 xen, raspi4, linux-yocto-dev: Enable Xen on Raspberry Pi 4<br>
<br>
=C2=A0classes/sdcard_image-rpi-xen.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 120 ------------------<br>
=C2=A0conf/distro/include/meta-virt-xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 21 ++-<br>
=C2=A0.../bootfiles/rpi-config_git.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 -<br>
=C2=A0.../rpi-u-boot-scr/files/<a href=3D"http://boot.cmd.xen.in" rel=3D"no=
referrer" target=3D"_blank">boot.cmd.xen.in</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +-<br>
=C2=A0...vmalloc_to_page-on-vmalloc-virt-addr.patch |=C2=A0 44 -------<br>
=C2=A0...02-swiotlb-xen-remove-start_dma_addr.patch |=C2=A0 47 -------<br>
=C2=A0...struct-device-parameter-to-xen_phys_.patch |=C2=A0 78 ------------=
<br>
=C2=A0...struct-device-parameter-to-xen_bus_t.patch |=C2=A0 66 ----------<b=
r>
=C2=A0...struct-device-parameter-to-is_xen_sw.patch |=C2=A0 57 ---------<br=
>
=C2=A0...oduce-phys_to_dma-dma_to_phys-transl.patch |=C2=A0 88 ------------=
-<br>
=C2=A0...translations-in-xen_dma_s_kernel_5.4.patch |=C2=A0 68 ----------<b=
r>
=C2=A0..._to_phys-on-the-dma_addr_t-parameter.patch |=C2=A0 75 -----------<=
br>
=C2=A0.../0011-adding-page-coherent-patch.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
39 ------<br>
=C2=A0.../linux/linux-raspberrypi_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 -<br>
=C2=A0.../linux/linux-raspberrypi_5.4.bbappend=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
19 ---<br>
=C2=A0.../linux/linux-yocto-dev.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 10 ++<br>
=C2=A016 files changed, 25 insertions(+), 720 deletions(-)<br>
=C2=A0delete mode 100644 classes/sdcard_image-rpi-xen.bbclass<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/r=
pi-config_git.bbappend<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0002-swiotlb-xen-remove-start_dma_addr.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.pa=
tch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/fi=
les/0011-adding-page-coherent-patch.patch<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/li=
nux-raspberrypi_%.bbappend<br>
=C2=A0delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/li=
nux-raspberrypi_5.4.bbappend<br>
=C2=A0create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/li=
nux-yocto-dev.bbappend<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000065dd7105ac9f835f--
