Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97C77E00C81; Sat,  2 Jan 2016 12:39:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE997E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Jan 2016 12:39:37 -0800 (PST)
Received: by mail-yk0-f182.google.com with SMTP id x67so216479520ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Jan 2016 12:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=8WcpbXEXV4jbVfBSpRMZV3M1voTL8ofAzELg1TpACKw=;
	b=w7fnX6gmohtrjWLwh4WNz/1VfiytKRF/M4Y6yzCYdHhf+D3Gi2dekGXwStDWzvyUTi
	677Qxch0BNpMGDgPJCARRUu69CejL8a4EBS6ryQIDZ+wjKDBQM7KrBVRFVB67IMW4GZk
	4Vm12KZ9d1MWZFq793zBGK++nbDBQIWNSK/cGVC4J5CIozp/fF/U9TIR4n7Sv9/Tx7lV
	rkmEl3EAjfMElie4Jz+v80HC2b8zoaSLmVz6lEh2FxMwkJRc2VorqKi7+CF/lkylfM3S
	JI+2FXafwRIeA/mlBFTJsaz8fg4klpYiehaDZM5kepyTB8OGxHddHC0EZQtb30RFAnNs
	qRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=8WcpbXEXV4jbVfBSpRMZV3M1voTL8ofAzELg1TpACKw=;
	b=Th4spvEs42Px2XPkgfSFv7FNPNACy3FCRea12i+0Fl6Lj5cQPnHSWh3JFVUHnJ8QL/
	bH5Ccm7I6i5SfNWet6BzZW1btNDcRqGePa5ufLOizgXiq9nInec46yjVW4zhrvtYaEXg
	CHsMqYjnWwOFNZ3ksmILy9QUPPlMtrCf5R9ob9X31XwLbClgtATESu5x3HBYrFChoeRa
	/RZMUer5eGRiVLcVA81h21KCPrN8pEMkSHPr8WT5Qxp6gA2OGwS7kWWnHrsGB6w+JUaL
	zNsCYcZmnN3xXXsAcvM9S3txH3eA0LGOo1bJRjiwabu34+tc7NFEwUwJAgZ+Jnx1AUht
	GKiA==
X-Gm-Message-State: ALoCoQm6U/FXduuiKo9I27rX22yiD2pdBS0l6W8kZ39JrKNuN+dItT+g7yse7/JaZFviFRRRXQjwxD3wmVyseiYbc1QZmSsyug==
X-Received: by 10.129.38.3 with SMTP id m3mr60322516ywm.306.1451767177387;
	Sat, 02 Jan 2016 12:39:37 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:9145:7084:541a:f174])
	by smtp.googlemail.com with ESMTPSA id
	193sm35920171ywe.22.2016.01.02.12.39.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jan 2016 12:39:36 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56883588.4020101@cardoe.com>
Date: Sat, 2 Jan 2016 14:39:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
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
X-List-Received-Date: Sat, 02 Jan 2016 20:39:41 -0000
X-Groupsio-MsgNum: 1631
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Vja9jgoq7HLkFosGrp3beIOLtMq14QdUM"

--Vja9jgoq7HLkFosGrp3beIOLtMq14QdUM
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/1/16 9:54 AM, Chris Patterson wrote:
> Upstream Xen opted to simply use 'make defconfig' to get a
> generic seabios config.  Follow suit and remove old config.
>=20
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/seabios/seabios/defconfig |  102 --------------------=
--------
>  recipes-extended/seabios/seabios_1.9.0.bb  |    4 +-
>  2 files changed, 1 insertion(+), 105 deletions(-)
>  delete mode 100644 recipes-extended/seabios/seabios/defconfig
>=20
> diff --git a/recipes-extended/seabios/seabios/defconfig b/recipes-exten=
ded/seabios/seabios/defconfig
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
> -CONFIG_QEMU=3Dy
> -# CONFIG_CSM is not set
> -CONFIG_QEMU_HARDWARE=3Dy
> -CONFIG_XEN=3Dy
> -CONFIG_THREADS=3Dy
> -# CONFIG_THREAD_OPTIONROMS is not set
> -CONFIG_RELOCATE_INIT=3Dy
> -CONFIG_BOOTMENU=3Dy
> -# CONFIG_BOOTSPLASH is not set
> -CONFIG_BOOTORDER=3Dy
> -# CONFIG_ENTRY_EXTRASTACK is not set
> -
> -#
> -# Hardware support
> -#
> -CONFIG_ATA=3Dy
> -# CONFIG_ATA_DMA is not set
> -# CONFIG_ATA_PIO32 is not set
> -CONFIG_AHCI=3Dy
> -CONFIG_VIRTIO_BLK=3Dy
> -CONFIG_VIRTIO_SCSI=3Dy
> -CONFIG_ESP_SCSI=3Dy
> -CONFIG_LSI_SCSI=3Dy
> -CONFIG_MEGASAS=3Dy
> -CONFIG_FLOPPY=3Dy
> -CONFIG_PS2PORT=3Dy
> -CONFIG_USB=3Dy
> -CONFIG_USB_UHCI=3Dy
> -CONFIG_USB_OHCI=3Dy
> -CONFIG_USB_EHCI=3Dy
> -CONFIG_USB_MSC=3Dy
> -CONFIG_USB_UAS=3Dy
> -CONFIG_USB_HUB=3Dy
> -CONFIG_USB_KEYBOARD=3Dy
> -CONFIG_USB_MOUSE=3Dy
> -CONFIG_SERIAL=3Dy
> -CONFIG_LPT=3Dy
> -# CONFIG_USE_SMM is not set
> -CONFIG_MTRR_INIT=3Dy
> -CONFIG_PMTIMER=3Dy
> -
> -#
> -# BIOS interfaces
> -#
> -CONFIG_DRIVES=3Dy
> -CONFIG_CDROM_BOOT=3Dy
> -CONFIG_CDROM_EMU=3Dy
> -CONFIG_PCIBIOS=3Dy
> -CONFIG_APMBIOS=3Dy
> -CONFIG_PNPBIOS=3Dy
> -CONFIG_OPTIONROMS=3Dy
> -CONFIG_OPTIONROMS_DEPLOYED=3Dy
> -CONFIG_PMM=3Dy
> -CONFIG_BOOT=3Dy
> -CONFIG_KEYBOARD=3Dy
> -CONFIG_KBD_CALL_INT15_4F=3Dy
> -CONFIG_MOUSE=3Dy
> -CONFIG_S3_RESUME=3Dy
> -CONFIG_VGAHOOKS=3Dy
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
> -# CONFIG_VGA_VID=3D0x5853
> -# CONFIG_VGA_DID=3D0xC147
> -
> -#
> -# Debugging
> -#
> -CONFIG_DEBUG_LEVEL=3D2
> -# CONFIG_DEBUG_SERIAL is not set
> -CONFIG_DEBUG_IO=3Dy
> diff --git a/recipes-extended/seabios/seabios_1.9.0.bb b/recipes-extend=
ed/seabios/seabios_1.9.0.bb
> index fcdc0c5..4808a18 100644
> --- a/recipes-extended/seabios/seabios_1.9.0.bb
> +++ b/recipes-extended/seabios/seabios_1.9.0.bb
> @@ -6,7 +6,6 @@ SECTION =3D "firmware"
>  SRC_URI =3D " \
>      http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.g=
z \
>      file://hostcc.patch \
> -    file://defconfig \
>      "
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504         \
> @@ -25,8 +24,7 @@ EXTRA_OEMAKE +=3D "HOSTCC=3D'${BUILD_CC}'"
>  EXTRA_OEMAKE +=3D "CROSS_PREFIX=3D${TARGET_PREFIX}"
> =20
>  do_configure() {
> -    install -m 0644 "${WORKDIR}/defconfig" .config
> -    oe_runmake oldconfig
> +    oe_runmake defconfig
>  }
> =20
>  do_compile() {
>=20

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--Vja9jgoq7HLkFosGrp3beIOLtMq14QdUM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWiDWMXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUvWUP/jXSHaKBkEz4RPYiN9yoCCVu
hPeXaGA1IwKbebCjtkJ8OJKDUK0JlBq+oAJnq7/CYehCjPlyg+Q4EtSX2bBVTTFC
ylDidSyCrLYuWOo9zdSJ3gIiy8Xk4lHyD82/4OyMgw244X3sdUDfHloBFK0s4FH3
JPUiEkhJt0aRjSyCJzaCFpNynBdcKb9Ln/fT5iYlDBW7mJIxtJg967LJa4bf9YWM
/aHsELwFShwSvDcO5BwMpJ2C9ej9sVE14tDHMzo+oX5BmxlGctKiyROFjBJKDkes
1RNEVrkbnMVZYQ1BRGILcdj/q2t4Vrs0Q1g8HOHnMT7VnwdZxEwbpgBOkEW1DiTH
v77DDTWY+wDiaEVJNX0yHTqjZRcbIo+INPi0dqsxySPitGDeJa9QXvdEANJ7WW+n
jtckRF0iWdF0eZl9JpN3DDmiB7xejV3KDY0MI5UfnujOY6TKA3WWk09ZcZsy6y6v
mqnj1btKaF2FS/EPA7UeFmwcF6gTQ5Ue1Co7yjVHLW3unhBzQ6YQKNrnFYB80ge7
PUw2gtv9ODGZbnpJtZitXMiHcDanaptSACd04S1obVfW8c5DgNSrBVR6it4HpdKp
dk7u4gVKaU99Sb4GpOb6MbOP1g/9FUN87QrunhxlAx4svPSi1HeHxZ3QwEKgJqXM
wyEyUNY/eWfz7WnL3U/P
=7OuC
-----END PGP SIGNATURE-----

--Vja9jgoq7HLkFosGrp3beIOLtMq14QdUM--
