Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27B50E00CA1; Tue,  5 Jan 2016 09:09:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5F61E0033E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 09:09:09 -0800 (PST)
Received: by mail-io0-f174.google.com with SMTP id 1so146148412ion.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jan 2016 09:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nf3o1D2GeUObM5m8K9kCDoc99qNEq73y9RoLIfUMxnk=;
	b=kth+g05sY0p8KGxhTxEnauiA46mSXBDFI8g/WF3Cxfljt4wlPj1Uj8+FZAxMdf6J1k
	vrXYc0nFCS91F8Tlf9U/ihz5hBxjZsU+LKZ4sU/C71e/W8EgC9Fs3szSn/A4NZt2CLzU
	m44wWdrUbBv1LZyg6tlntLG77UUZeGz7qncFmtRF5O/QFsMRaTz93Mf6EuFr66+6M8GS
	LHw/Hi6LwFwCKnGTrMn8pB4InPuZ9EAg1Py1+JtG0cyk13VHdEL65adF1ChEX98mBJFO
	CA9gjUh5oCcFqdkzKXIm61Tj2ixdKTNywcSU4rr5AMSyUdPQJoLOgVHpZdzeDQUpA6Fz
	05Iw==
MIME-Version: 1.0
X-Received: by 10.107.33.12 with SMTP id h12mr30960443ioh.108.1452013748864;
	Tue, 05 Jan 2016 09:09:08 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Tue, 5 Jan 2016 09:09:08 -0800 (PST)
In-Reply-To: <CADkTA4P6UAoigNf9qdYVkCt7GarmzAJPYaz-tuhy3FqOV0cgfA@mail.gmail.com>
References: <1451663640-25038-1-git-send-email-cjp256@gmail.com>
	<CADkTA4P6UAoigNf9qdYVkCt7GarmzAJPYaz-tuhy3FqOV0cgfA@mail.gmail.com>
Date: Tue, 5 Jan 2016 12:09:08 -0500
Message-ID: <CABZSBQcqr+Fx2KfJShM-AQRb1CbFnEZ0DO33pniWr4VVYhNqHQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Tue, 05 Jan 2016 17:09:13 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Bruce! :)

On Tue, Jan 5, 2016 at 11:48 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> merged.
>
> Bruce
>
> On Fri, Jan 1, 2016 at 10:54 AM, Chris Patterson <cjp256@gmail.com> wrote:
>>
>> Upstream Xen opted to simply use 'make defconfig' to get a
>> generic seabios config.  Follow suit and remove old config.
>>
>> Signed-off-by: Chris Patterson <cjp256@gmail.com>
>> ---
>>  recipes-extended/seabios/seabios/defconfig |  102
>> ----------------------------
>>  recipes-extended/seabios/seabios_1.9.0.bb  |    4 +-
>>  2 files changed, 1 insertion(+), 105 deletions(-)
>>  delete mode 100644 recipes-extended/seabios/seabios/defconfig
>>
>> diff --git a/recipes-extended/seabios/seabios/defconfig
>> b/recipes-extended/seabios/seabios/defconfig
>> deleted file mode 100644
>> index d4474ba..0000000
>> --- a/recipes-extended/seabios/seabios/defconfig
>> +++ /dev/null
>> @@ -1,102 +0,0 @@
>> -#
>> -# Automatically generated make config: don't edit
>> -# SeaBIOS Configuration
>> -# Wed Sep 18 14:08:45 2013
>> -#
>> -
>> -#
>> -# General Features
>> -#
>> -# CONFIG_COREBOOT is not set
>> -CONFIG_QEMU=y
>> -# CONFIG_CSM is not set
>> -CONFIG_QEMU_HARDWARE=y
>> -CONFIG_XEN=y
>> -CONFIG_THREADS=y
>> -# CONFIG_THREAD_OPTIONROMS is not set
>> -CONFIG_RELOCATE_INIT=y
>> -CONFIG_BOOTMENU=y
>> -# CONFIG_BOOTSPLASH is not set
>> -CONFIG_BOOTORDER=y
>> -# CONFIG_ENTRY_EXTRASTACK is not set
>> -
>> -#
>> -# Hardware support
>> -#
>> -CONFIG_ATA=y
>> -# CONFIG_ATA_DMA is not set
>> -# CONFIG_ATA_PIO32 is not set
>> -CONFIG_AHCI=y
>> -CONFIG_VIRTIO_BLK=y
>> -CONFIG_VIRTIO_SCSI=y
>> -CONFIG_ESP_SCSI=y
>> -CONFIG_LSI_SCSI=y
>> -CONFIG_MEGASAS=y
>> -CONFIG_FLOPPY=y
>> -CONFIG_PS2PORT=y
>> -CONFIG_USB=y
>> -CONFIG_USB_UHCI=y
>> -CONFIG_USB_OHCI=y
>> -CONFIG_USB_EHCI=y
>> -CONFIG_USB_MSC=y
>> -CONFIG_USB_UAS=y
>> -CONFIG_USB_HUB=y
>> -CONFIG_USB_KEYBOARD=y
>> -CONFIG_USB_MOUSE=y
>> -CONFIG_SERIAL=y
>> -CONFIG_LPT=y
>> -# CONFIG_USE_SMM is not set
>> -CONFIG_MTRR_INIT=y
>> -CONFIG_PMTIMER=y
>> -
>> -#
>> -# BIOS interfaces
>> -#
>> -CONFIG_DRIVES=y
>> -CONFIG_CDROM_BOOT=y
>> -CONFIG_CDROM_EMU=y
>> -CONFIG_PCIBIOS=y
>> -CONFIG_APMBIOS=y
>> -CONFIG_PNPBIOS=y
>> -CONFIG_OPTIONROMS=y
>> -CONFIG_OPTIONROMS_DEPLOYED=y
>> -CONFIG_PMM=y
>> -CONFIG_BOOT=y
>> -CONFIG_KEYBOARD=y
>> -CONFIG_KBD_CALL_INT15_4F=y
>> -CONFIG_MOUSE=y
>> -CONFIG_S3_RESUME=y
>> -CONFIG_VGAHOOKS=y
>> -# CONFIG_DISABLE_A20 is not set
>> -
>> -#
>> -# BIOS Tables
>> -#
>> -# CONFIG_PIRTABLE is not set
>> -# CONFIG_MPTABLE is not set
>> -# CONFIG_SMBIOS is not set
>> -# CONFIG_ACPI is not set
>> -
>> -#
>> -# VGA ROM
>> -#
>> -# CONFIG_NO_VGABIOS is not set
>> -# CONFIG_VGA_STANDARD_VGA is not set
>> -# CONFIG_VGA_CIRRUS is not set
>> -# CONFIG_VGA_BOCHS is not set
>> -# CONFIG_VGA_GEODEGX2 is not set
>> -# CONFIG_VGA_GEODELX is not set
>> -# CONFIG_VGA_XENGFX is not set
>> -# CONFIG_BUILD_VGABIOS is not set
>> -# CONFIG_VGA_VBE is not set
>> -# CONFIG_VGA_PCI is not set
>> -# CONFIG_OVERRIDE_PCI_ID is not set
>> -# CONFIG_VGA_VID=0x5853
>> -# CONFIG_VGA_DID=0xC147
>> -
>> -#
>> -# Debugging
>> -#
>> -CONFIG_DEBUG_LEVEL=2
>> -# CONFIG_DEBUG_SERIAL is not set
>> -CONFIG_DEBUG_IO=y
>> diff --git a/recipes-extended/seabios/seabios_1.9.0.bb
>> b/recipes-extended/seabios/seabios_1.9.0.bb
>> index fcdc0c5..4808a18 100644
>> --- a/recipes-extended/seabios/seabios_1.9.0.bb
>> +++ b/recipes-extended/seabios/seabios_1.9.0.bb
>> @@ -6,7 +6,6 @@ SECTION = "firmware"
>>  SRC_URI = " \
>>      http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
>>      file://hostcc.patch \
>> -    file://defconfig \
>>      "
>>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
>> \
>> @@ -25,8 +24,7 @@ EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
>>  EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
>>
>>  do_configure() {
>> -    install -m 0644 "${WORKDIR}/defconfig" .config
>> -    oe_runmake oldconfig
>> +    oe_runmake defconfig
>>  }
>>
>>  do_compile() {
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

