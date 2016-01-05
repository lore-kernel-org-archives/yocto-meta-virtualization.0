Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A54EDE00C9A; Tue,  5 Jan 2016 08:48:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21BAEE0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 08:48:34 -0800 (PST)
Received: by mail-vk0-f46.google.com with SMTP id i129so4434285vkb.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bcstDw/yecktnKvbDYLNpTX7KZ70Pmgz+0lHTD9FG/I=;
	b=R0CnDiw8WgZDGXPrxTtbYzfPB9okQY4veHqqxkMIis9R2Fv9yyxXT9Ay/1+wTqwYWT
	FdBZPIn3PEeLX2fYmqKvo2oAPZ/yefsYzRZmIPvGtt3v64hSQn5aYYjHRpwYqR/pW5EJ
	Y9/EgNkAv2RmDnq8Mc/QPolUyU4We9u1xblnKsnL7WDXkRepMfq65DOL1Lv62uqcfY+r
	ORufrQRcJGMT1YNBV6cKOMe1tM5VCB5Sip7iF032GmBm4g7TSRJVFaLV1NZs7+zJkQx7
	1Su+A8ZqRg7NUk/TRI/tr0Fp/09Zw/qDRaKkXBXKz2MmEk4LwPNG1EHh3YcYOMTDY5Kg
	CmSA==
MIME-Version: 1.0
X-Received: by 10.31.48.11 with SMTP id w11mr58518112vkw.114.1452012514323;
	Tue, 05 Jan 2016 08:48:34 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 5 Jan 2016 08:48:34 -0800 (PST)
In-Reply-To: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
References: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
Date: Tue, 5 Jan 2016 11:48:34 -0500
Message-ID: <CADkTA4P6UAoigNf9qdYVkCt7GarmzAJPYaz-tuhy3FqOV0cgfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] seabios: drop shipped defconfig and use defaults
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 16:48:37 -0000
Content-Type: multipart/alternative; boundary=001a1143e7282036f005289902ee

--001a1143e7282036f005289902ee
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Jan 1, 2016 at 10:54 AM, Chris Patterson <cjp256@gmail.com> wrote:

> Upstream Xen opted to simply use 'make defconfig' to get a
> generic seabios config.  Follow suit and remove old config.
>
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/seabios/seabios/defconfig |  102
> ----------------------------
>  recipes-extended/seabios/seabios_1.9.0.bb  |    4 +-
>  2 files changed, 1 insertion(+), 105 deletions(-)
>  delete mode 100644 recipes-extended/seabios/seabios/defconfig
>
> diff --git a/recipes-extended/seabios/seabios/defconfig
> b/recipes-extended/seabios/seabios/defconfig
> deleted file mode 100644
> index d4474ba..0000000
> --- a/recipes-extended/seabios/seabios/defconfig
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# SeaBIOS Configuration
> -# Wed Sep 18 14:08:45 2013
> -#
> -
> -#
> -# General Features
> -#
> -# CONFIG_COREBOOT is not set
> -CONFIG_QEMU=y
> -# CONFIG_CSM is not set
> -CONFIG_QEMU_HARDWARE=y
> -CONFIG_XEN=y
> -CONFIG_THREADS=y
> -# CONFIG_THREAD_OPTIONROMS is not set
> -CONFIG_RELOCATE_INIT=y
> -CONFIG_BOOTMENU=y
> -# CONFIG_BOOTSPLASH is not set
> -CONFIG_BOOTORDER=y
> -# CONFIG_ENTRY_EXTRASTACK is not set
> -
> -#
> -# Hardware support
> -#
> -CONFIG_ATA=y
> -# CONFIG_ATA_DMA is not set
> -# CONFIG_ATA_PIO32 is not set
> -CONFIG_AHCI=y
> -CONFIG_VIRTIO_BLK=y
> -CONFIG_VIRTIO_SCSI=y
> -CONFIG_ESP_SCSI=y
> -CONFIG_LSI_SCSI=y
> -CONFIG_MEGASAS=y
> -CONFIG_FLOPPY=y
> -CONFIG_PS2PORT=y
> -CONFIG_USB=y
> -CONFIG_USB_UHCI=y
> -CONFIG_USB_OHCI=y
> -CONFIG_USB_EHCI=y
> -CONFIG_USB_MSC=y
> -CONFIG_USB_UAS=y
> -CONFIG_USB_HUB=y
> -CONFIG_USB_KEYBOARD=y
> -CONFIG_USB_MOUSE=y
> -CONFIG_SERIAL=y
> -CONFIG_LPT=y
> -# CONFIG_USE_SMM is not set
> -CONFIG_MTRR_INIT=y
> -CONFIG_PMTIMER=y
> -
> -#
> -# BIOS interfaces
> -#
> -CONFIG_DRIVES=y
> -CONFIG_CDROM_BOOT=y
> -CONFIG_CDROM_EMU=y
> -CONFIG_PCIBIOS=y
> -CONFIG_APMBIOS=y
> -CONFIG_PNPBIOS=y
> -CONFIG_OPTIONROMS=y
> -CONFIG_OPTIONROMS_DEPLOYED=y
> -CONFIG_PMM=y
> -CONFIG_BOOT=y
> -CONFIG_KEYBOARD=y
> -CONFIG_KBD_CALL_INT15_4F=y
> -CONFIG_MOUSE=y
> -CONFIG_S3_RESUME=y
> -CONFIG_VGAHOOKS=y
> -# CONFIG_DISABLE_A20 is not set
> -
> -#
> -# BIOS Tables
> -#
> -# CONFIG_PIRTABLE is not set
> -# CONFIG_MPTABLE is not set
> -# CONFIG_SMBIOS is not set
> -# CONFIG_ACPI is not set
> -
> -#
> -# VGA ROM
> -#
> -# CONFIG_NO_VGABIOS is not set
> -# CONFIG_VGA_STANDARD_VGA is not set
> -# CONFIG_VGA_CIRRUS is not set
> -# CONFIG_VGA_BOCHS is not set
> -# CONFIG_VGA_GEODEGX2 is not set
> -# CONFIG_VGA_GEODELX is not set
> -# CONFIG_VGA_XENGFX is not set
> -# CONFIG_BUILD_VGABIOS is not set
> -# CONFIG_VGA_VBE is not set
> -# CONFIG_VGA_PCI is not set
> -# CONFIG_OVERRIDE_PCI_ID is not set
> -# CONFIG_VGA_VID=0x5853
> -# CONFIG_VGA_DID=0xC147
> -
> -#
> -# Debugging
> -#
> -CONFIG_DEBUG_LEVEL=2
> -# CONFIG_DEBUG_SERIAL is not set
> -CONFIG_DEBUG_IO=y
> diff --git a/recipes-extended/seabios/seabios_1.9.0.bb
> b/recipes-extended/seabios/seabios_1.9.0.bb
> index fcdc0c5..4808a18 100644
> --- a/recipes-extended/seabios/seabios_1.9.0.bb
> +++ b/recipes-extended/seabios/seabios_1.9.0.bb
> @@ -6,7 +6,6 @@ SECTION = "firmware"
>  SRC_URI = " \
>      http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
>      file://hostcc.patch \
> -    file://defconfig \
>      "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
>        \
> @@ -25,8 +24,7 @@ EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
>  EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
>
>  do_configure() {
> -    install -m 0644 "${WORKDIR}/defconfig" .config
> -    oe_runmake oldconfig
> +    oe_runmake defconfig
>  }
>
>  do_compile() {
> --
> 1.7.10.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143e7282036f005289902ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Fri, Jan 1, 2016 at 10:54 AM, C=
hris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" ta=
rget=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Upstream Xen opted to simply use &#39;make defconfig&#39; to =
get a<br>
generic seabios config.=C2=A0 Follow suit and remove old config.<br>
<br>
Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com">cjp2=
56@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/seabios/seabios/defconfig |=C2=A0 102 --------------=
--------------<br>
=C2=A0recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabios_1.9.0.bb</a>=C2=A0 |=C2=A0 =C2=A0 4 +-=
<br>
=C2=A02 files changed, 1 insertion(+), 105 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/seabios/seabios/defconfig<br>
<br>
diff --git a/recipes-extended/seabios/seabios/defconfig b/recipes-extended/=
seabios/seabios/defconfig<br>
deleted file mode 100644<br>
index d4474ba..0000000<br>
--- a/recipes-extended/seabios/seabios/defconfig<br>
+++ /dev/null<br>
@@ -1,102 +0,0 @@<br>
-#<br>
-# Automatically generated make config: don&#39;t edit<br>
-# SeaBIOS Configuration<br>
-# Wed Sep 18 14:08:45 2013<br>
-#<br>
-<br>
-#<br>
-# General Features<br>
-#<br>
-# CONFIG_COREBOOT is not set<br>
-CONFIG_QEMU=3Dy<br>
-# CONFIG_CSM is not set<br>
-CONFIG_QEMU_HARDWARE=3Dy<br>
-CONFIG_XEN=3Dy<br>
-CONFIG_THREADS=3Dy<br>
-# CONFIG_THREAD_OPTIONROMS is not set<br>
-CONFIG_RELOCATE_INIT=3Dy<br>
-CONFIG_BOOTMENU=3Dy<br>
-# CONFIG_BOOTSPLASH is not set<br>
-CONFIG_BOOTORDER=3Dy<br>
-# CONFIG_ENTRY_EXTRASTACK is not set<br>
-<br>
-#<br>
-# Hardware support<br>
-#<br>
-CONFIG_ATA=3Dy<br>
-# CONFIG_ATA_DMA is not set<br>
-# CONFIG_ATA_PIO32 is not set<br>
-CONFIG_AHCI=3Dy<br>
-CONFIG_VIRTIO_BLK=3Dy<br>
-CONFIG_VIRTIO_SCSI=3Dy<br>
-CONFIG_ESP_SCSI=3Dy<br>
-CONFIG_LSI_SCSI=3Dy<br>
-CONFIG_MEGASAS=3Dy<br>
-CONFIG_FLOPPY=3Dy<br>
-CONFIG_PS2PORT=3Dy<br>
-CONFIG_USB=3Dy<br>
-CONFIG_USB_UHCI=3Dy<br>
-CONFIG_USB_OHCI=3Dy<br>
-CONFIG_USB_EHCI=3Dy<br>
-CONFIG_USB_MSC=3Dy<br>
-CONFIG_USB_UAS=3Dy<br>
-CONFIG_USB_HUB=3Dy<br>
-CONFIG_USB_KEYBOARD=3Dy<br>
-CONFIG_USB_MOUSE=3Dy<br>
-CONFIG_SERIAL=3Dy<br>
-CONFIG_LPT=3Dy<br>
-# CONFIG_USE_SMM is not set<br>
-CONFIG_MTRR_INIT=3Dy<br>
-CONFIG_PMTIMER=3Dy<br>
-<br>
-#<br>
-# BIOS interfaces<br>
-#<br>
-CONFIG_DRIVES=3Dy<br>
-CONFIG_CDROM_BOOT=3Dy<br>
-CONFIG_CDROM_EMU=3Dy<br>
-CONFIG_PCIBIOS=3Dy<br>
-CONFIG_APMBIOS=3Dy<br>
-CONFIG_PNPBIOS=3Dy<br>
-CONFIG_OPTIONROMS=3Dy<br>
-CONFIG_OPTIONROMS_DEPLOYED=3Dy<br>
-CONFIG_PMM=3Dy<br>
-CONFIG_BOOT=3Dy<br>
-CONFIG_KEYBOARD=3Dy<br>
-CONFIG_KBD_CALL_INT15_4F=3Dy<br>
-CONFIG_MOUSE=3Dy<br>
-CONFIG_S3_RESUME=3Dy<br>
-CONFIG_VGAHOOKS=3Dy<br>
-# CONFIG_DISABLE_A20 is not set<br>
-<br>
-#<br>
-# BIOS Tables<br>
-#<br>
-# CONFIG_PIRTABLE is not set<br>
-# CONFIG_MPTABLE is not set<br>
-# CONFIG_SMBIOS is not set<br>
-# CONFIG_ACPI is not set<br>
-<br>
-#<br>
-# VGA ROM<br>
-#<br>
-# CONFIG_NO_VGABIOS is not set<br>
-# CONFIG_VGA_STANDARD_VGA is not set<br>
-# CONFIG_VGA_CIRRUS is not set<br>
-# CONFIG_VGA_BOCHS is not set<br>
-# CONFIG_VGA_GEODEGX2 is not set<br>
-# CONFIG_VGA_GEODELX is not set<br>
-# CONFIG_VGA_XENGFX is not set<br>
-# CONFIG_BUILD_VGABIOS is not set<br>
-# CONFIG_VGA_VBE is not set<br>
-# CONFIG_VGA_PCI is not set<br>
-# CONFIG_OVERRIDE_PCI_ID is not set<br>
-# CONFIG_VGA_VID=3D0x5853<br>
-# CONFIG_VGA_DID=3D0xC147<br>
-<br>
-#<br>
-# Debugging<br>
-#<br>
-CONFIG_DEBUG_LEVEL=3D2<br>
-# CONFIG_DEBUG_SERIAL is not set<br>
-CONFIG_DEBUG_IO=3Dy<br>
diff --git a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">seabios_1.9.0.bb</a> b/recipes-extended=
/seabios/<a href=3D"http://seabios_1.9.0.bb" rel=3D"noreferrer" target=3D"_=
blank">seabios_1.9.0.bb</a><br>
index fcdc0c5..4808a18 100644<br>
--- a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabios_1.9.0.bb</a><br>
+++ b/recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabios_1.9.0.bb</a><br>
@@ -6,7 +6,6 @@ SECTION =3D &quot;firmware&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.coreboot.org/p/seabios/downloads=
/get/${PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://code.c=
oreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://hostcc.patch \<br>
-=C2=A0 =C2=A0 file://defconfig \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -25,8 +24,7 @@ EXTRA_OEMAKE +=3D &quot;HOSTCC=3D&#39;${BUILD_CC}&#39;&qu=
ot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;CROSS_PREFIX=3D${TARGET_PREFIX}&quot;<br>
<br>
=C2=A0do_configure() {<br>
-=C2=A0 =C2=A0 install -m 0644 &quot;${WORKDIR}/defconfig&quot; .config<br>
-=C2=A0 =C2=A0 oe_runmake oldconfig<br>
+=C2=A0 =C2=A0 oe_runmake defconfig<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div>

--001a1143e7282036f005289902ee--
