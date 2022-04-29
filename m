Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D3FC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 18:12:20 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.13762.1651255934807548367
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 11:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ezatP4ZN;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id v139so8373845vsv.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1oeU5/OKQV0whnWdV5bzdnZnYtzKEQzCPG8cWeQtyVs=;
        b=ezatP4ZNBtLhTIsDOLPXRTE051IXKeVcOKz5zgEhbkqIyezLD/tmWyLSXxI2fxC5po
         qf3VKKJP9R+3Jx3jIrM87HPjX+1heMPYn/khK6EYDKNwNoFEN6CivGLwio5NFymohnpZ
         NUz7Nrs1MMjKLyvmF86IMzTWV0gIFRrpie0cFf5cgCC88cYjNlQp45m3JnzzXiMqm/Xf
         ZeSNlMP/QGaYIk6qE3l8gw8oW5gdN5ufhWja5MC8tdTWzKDVYL7q4MZ1BgJ01kBSMKtP
         9Nl+OdfiI/W6tYLg/lh7Rru3AIUktsnmsWwgpFEqE/mNapCelDu+d9bIopvDEGG74bsI
         TRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1oeU5/OKQV0whnWdV5bzdnZnYtzKEQzCPG8cWeQtyVs=;
        b=0wNiO+wzfFbWDjMcTAis9nKalcgR3mCXCb3Wng6k5CYdwCky/8DQgwxXTq2Nfb06V/
         A0fXcAkzLu7hTL7svQdJmGXa1s+6PmuUz8LoDNlt7YW3oePgLvt+SolZrtxBsQgMNefM
         eJKo/Qy4XrHoWdZ7MctLTDT6tIiV3ihjiK5YLhV0Ne07gZ2wIpTzBQwHPPBQGB2RA3yn
         5U1g8lo2CNcxsjeDRpx6p0v60cVCFcqhI22WO/u6e9oh+g7JUlENcDFEXZ/+IxGOOUl/
         K1dkbxG3ZLDUhV6ExpYxvYQMhGxlC76usMah01oln6FruaQjdHhMovVxF3I6CXDneL1q
         l6AA==
X-Gm-Message-State: AOAM531vbNT+4Cswh2e/OOploZRxoxpHl1IcriOLZsG4hhCASthicUpS
	/kUaPbXZqpQ96qoFB2EckyfkEUWJlG7BiRe2lPk=
X-Google-Smtp-Source: 
 ABdhPJyFL4VI87FhISPpmNZFNqNG+VkeDx69LUJnyfXTMz7jQ764DFpRivGGA45xqhQH+anjH0jIPB6/68TTP60Gnl0=
X-Received: by 2002:a67:cb0d:0:b0:32c:cb36:9a04 with SMTP id
 b13-20020a67cb0d000000b0032ccb369a04mr284660vsl.40.1651255933750; Fri, 29 Apr
 2022 11:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-3-christopher.w.clark@gmail.com>
 <2E2EBAC1-A31E-470C-8EF5-B68CF7964ED4@arm.com>
In-Reply-To: <2E2EBAC1-A31E-470C-8EF5-B68CF7964ED4@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 29 Apr 2022 11:12:02 -0700
Message-ID: 
 <CACMJ4Ga-H8Z5Lzj3qxSwCgjgSRF9mEV_jVY9_TCaOWGKh+QqiA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/3] qemuboot, xen-image-minimal:
 enable runqemu for qemuarm Xen images
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
 "cardoe@cardoe.com" <cardoe@cardoe.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>,
 Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 18:12:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7238

On Fri, Apr 29, 2022 at 6:39 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org =
<christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > The Xen hypervisor built for Arm 32-bit targets can be launched with
> > runqemu by providing a u-boot script and configuration for Qemu, which
> > enables interactive testing of Xen images.
> >
> > Add qemuboot-xen-u-boot.bbclass to add a new bitbake task for generatin=
g
> > the u-boot script. Since this increases the number of qemuboot-specific
> > classes that are inherited by the xen-image-minimal recipe, change the
> > inherit of all of these to only apply to qemu machines with the qemuall
> > override.
> >
> > Update qemuboot-xen-defaults.bbclass to supply working default
> > parameters for the qemuarm machine needed to boot successfully in
> > testing. Also change all the arch-specific variable overrides into
> > narrower qemu platform overrides instead to avoid unnecessary
> > interactions with other Arm platform machines.
>
> First: this does not work on my side as u-boot is stuck waiting for a dhc=
p
> server to download something from the deploy directory but I do not quite
> understand how this should work.

Hi Bertrand - thanks for testing this. It's supposed to be utilizing
the existing u-boot integration but I am also not very familiar with
all the moving pieces of that.

> But more than that I think there are 2 issues here:
> - qemuboot-xen-dtb is already doing exactly what you do in your uboot
>   script. Why not use it ?

I just hadn't had success in being able to boot Xen on arm32 in qemu
without u-boot, unfortunately, so when I had managed to get it to boot
successfully with u-boot, this is the implementation that followed
from that configuration.

> - qemu arm32 can perfectly boot xen using -kernel and -dtb in the exact
>   same way than what is done on arm64. Why do you want to use uboot ?

I actually don't if it's not necessary - I just hadn't had luck
without it, but if we don't need the extra complexity in this layer
then we shouldn't add it. I don't know if using a current Xen and qemu
combination (ie. newer then when I started trying with it) has made a
difference but I'm happy to hear that it is working.

> I will push a patch to the mailing to show how I did this.

Thanks - appreciated!

> All the changes to cleanup the existing code are quite nice and it would =
be
> good to push them in a separate patch.

Ack

Christopher

> Cheers
> Bertrand
>
> >
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > ---
> > Changes since v1:
> > - replace all qemuboot arch overrides with qemu machine platform overri=
des
> > - only include the qemu classes in the image for qemu build targets
> >
> >
> > classes/qemuboot-xen-defaults.bbclass        |  26 +++-
> > classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
> > conf/distro/include/meta-virt-xen.inc        |   1 +
> > recipes-extended/images/xen-image-minimal.bb |   6 +-
> > 4 files changed, 155 insertions(+), 6 deletions(-)
> > create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> >
> > diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-x=
en-defaults.bbclass
> > index c7e74c3..62bbf8f 100644
> > --- a/classes/qemuboot-xen-defaults.bbclass
> > +++ b/classes/qemuboot-xen-defaults.bbclass
> > @@ -10,21 +10,37 @@ DOM0_KERNEL ??=3D "${DEPLOY_DIR_IMAGE}/${KERNEL_IMA=
GETYPE}"
> > DOM0_KERNEL_LOAD_ADDR ??=3D "0x45000000"
> > QB_XEN_DOMAIN_MODULES ??=3D "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:mu=
ltiboot,kernel"
> >
> > +# Qemuboot for 32-bit Arm loads Xen via device loader parameter rather=
 than
> > +# kernel and boots using u-boot as bios
> > +XEN_BINARY ??=3D "${DEPLOY_DIR_IMAGE}/xen-${MACHINE}"
> > +QB_XEN_LOAD_ADDR ??=3D "0x46000000"
> > +QB_OPT_APPEND:append:qemuarm =3D " \
> > +    -device loader,file=3D${XEN_BINARY},addr=3D${QB_XEN_LOAD_ADDR},for=
ce-raw=3Don \
> > +    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADD=
R} \
> > +    -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin \
> > +    "
> > +QB_DEFAULT_KERNEL:qemuarm =3D "none"
> > +
> > # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> > # and the device loader option for the dom0 kernel:
> > -QB_OPT_APPEND:append:aarch64 =3D " \
> > +QB_OPT_APPEND:append:qemuarm64 =3D " \
> >     -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR=
} \
> >     "
> > -QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
> > +QB_DEFAULT_KERNEL:qemuarm64 =3D "xen-${MACHINE}"
> >
> > +# 32-bit Arm: gic version 2
> > +QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
> > # 64-bit Arm: gic version 3
> > -QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtual=
ization=3Dtrue"
> > +QB_MACHINE:qemuarm64 =3D "-machine virt,gic-version=3D3 -machine virtu=
alization=3Dtrue"
> >
> > # Increase the default qemu memory allocation to allow for the hypervis=
or.
> > # Use a weak assignment to allow for change of default and override els=
ewhere.
> > QB_MEM_VALUE ??=3D "512"
> > QB_MEM =3D "-m ${QB_MEM_VALUE}"
> >
> > +# 32-bit Arm: qemuboot with a u-boot script image
> > +QB_XEN_U_BOOT_SCR:qemuarm =3D "boot.scr.uimg"
> > +
> > # 64-bit Arm: qemuboot with a device tree binary
> > -QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> > -QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> > +QB_DTB:qemuarm64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> > +QB_DTB_LINK:qemuarm64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> > diff --git a/classes/qemuboot-xen-u-boot.bbclass b/classes/qemuboot-xen=
-u-boot.bbclass
> > new file mode 100644
> > index 0000000..4401eba
> > --- /dev/null
> > +++ b/classes/qemuboot-xen-u-boot.bbclass
> > @@ -0,0 +1,128 @@
> > +# Enable booting Xen with qemuboot / runqemu: u-boot configuration
> > +#
> > +# Copyright (c) 2021-2022 Star Lab Corp. All rights reserved.
> > +#
> > +# Author: Christopher Clark <christopher.clark@starlab.io>
> > +
> > +# Interface variables:
> > +#
> > +# QB_XEN_U_BOOT_SCR :
> > +# If this variable is set, this class will generate the u-boot script =
image file
> > +# It must be set to the name of the compiled command file that u-boot =
will tftp
> > +# from the image deploy directory during boot, currently: "boot.scr.ui=
mg"
> > +#
> > +# QB_XEN_CMDLINE_EXTRA :
> > +# A string to be appended to the default Xen hypervisor boot command l=
ine,
> > +# for supplying Xen boot options.
> > +# The device tree that this bbclass generates will contain Xen command
> > +# line options to connect the Xen console to the Qemu serial port.
> > +#
> > +# QB_XEN_LOAD_ADDR :
> > +# The hypervisor load address
> > +#
> > +# QB_XEN_DOM0_BOOTARGS :
> > +# A string for specifying Dom0 boot options for the Xen section of the=
 device
> > +# tree.
> > +#
> > +# QB_XEN_UBOOT_SCR_TASK_DEPENDS:
> > +# The task dependencies for the u-boot script generation. A default is=
 provided.
> > +#
> > +# QB_XEN_DOMAIN_MODULES:
> > +# A space-separated list of colon-separated entries:
> > +#   "<file for the module>:<load memory address>:<module compatibility=
 string>"
> > +
> > +# Set the default value for this variable to empty: no file generated.
> > +QB_XEN_U_BOOT_SCR ??=3D ""
> > +
> > +write_add_chosen_module() {
> > +    CMD_FILE=3D"$1"
> > +    ADDR=3D"$2"
> > +    SIZE=3D"$3"
> > +    MODULE_TYPE=3D"$4"
> > +    cat <<EOF >>"${CMD_FILE}"
> > +fdt mknod /chosen module@${ADDR}
> > +fdt set /chosen/module@${ADDR} compatible "multiboot,module" "${MODULE=
_TYPE}"
> > +fdt set /chosen/module@${ADDR} reg <${ADDR} ${SIZE}>
> > +EOF
> > +}
> > +
> > +generate_xen_u_boot_conf() {
> > +    CMD_FILE=3D"${B}/qemuboot-xen.cmd"
> > +    cat <<EOF >"${CMD_FILE}"
> > +echo "Running u-boot launch script"
> > +fdt addr 0x40000000
> > +fdt resize
> > +echo "Device tree resized"
> > +
> > +fdt set /chosen \#address-cells <1>
> > +fdt set /chosen \#size-cells <1>
> > +
> > +fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/pl011@900=
0000 ${QB_XEN_CMDLINE_EXTRA}"
> > +fdt set /chosen xen,dom0-bootargs "${QB_XEN_DOM0_BOOTARGS}"
> > +EOF
> > +
> > +    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> > +        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> > +    fi
> > +
> > +    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
> > +    do
> > +        MODULE_FILE=3D"$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
> > +        ADDR=3D"$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
> > +        MODULE_TYPE=3D"$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
> > +        RESOLVED_FILE=3D"$(readlink -f ${MODULE_FILE})"
> > +        SIZE=3D$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
> > +        [ "x${SIZE}" !=3D "x0x0" ] || bbfatal No module: "${MODULE_FIL=
E}"
> > +        write_add_chosen_module "${CMD_FILE}" "${ADDR}" "${SIZE}" "${M=
ODULE_TYPE}"
> > +    done
> > +
> > +    cat <<EOF >>"${CMD_FILE}"
> > +fdt print /chosen
> > +
> > +echo Boot Xen
> > +bootz ${QB_XEN_LOAD_ADDR} - 0x40000000
> > +EOF
> > +
> > +    uboot-mkimage -A "${UBOOT_ARCH}" -T script -C none \
> > +                  -a 0x20000 -e 0x20000 \
> > +                  -d "${CMD_FILE}" "${CMD_FILE}.uimg"
> > +
> > +    # u-boot tftps this filename from DEPLOY_DIR_IMAGE:
> > +    install -m 0644 "${CMD_FILE}.uimg" "${DEPLOY_DIR_IMAGE}/${QB_XEN_U=
_BOOT_SCR}"
> > +}
> > +
> > +do_write_qemuboot_xen_u_boot_conf() {
> > +    # Not all architectures qemuboot with u-boot, so check to see if t=
his
> > +    # is needed. This allows this bbclass file to be used in the same =
image
> > +    # recipe for multiple architectures.
> > +
> > +    if [ -n "${QB_XEN_U_BOOT_SCR}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; t=
hen
> > +        generate_xen_u_boot_conf
> > +    fi
> > +}
> > +
> > +addtask do_write_qemuboot_xen_u_boot_conf after do_write_qemuboot_conf=
 before do_image
> > +# Task dependency:
> > +# An expected common case is that the kernel for at least one of the i=
nitial
> > +# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
> > +# add that as a task dependency here since the kernel size needs to be=
 known
> > +# for generating the device tree.
> > +# Dependencies are only introduced if a device tree will be generated.
> > +QB_XEN_UBOOT_SCR_TASK_DEPENDS ?=3D " \
> > +    ${@[ ' \
> > +        u-boot-tools-native:do_populate_sysroot \
> > +        u-boot:do_deploy \
> > +        virtual/kernel:do_deploy \
> > +    ', ''][d.getVar('QB_XEN_U_BOOT_SCR') =3D=3D '']} \
> > +    "
> > +do_write_qemuboot_xen_u_boot_conf[depends] =3D "${QB_XEN_UBOOT_SCR_TAS=
K_DEPENDS}"
> > +
> > +def qemuboot_xen_u_boot_vars(d):
> > +    build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> > +                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> > +                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > +    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> > +
> > +do_write_qemuboot_xen_u_boot[vardeps] +=3D "${@' '.join(qemuboot_xen_u=
_boot_vars(d))}"
> > +do_write_qemuboot_xen_u_boot[vardepsexclude] +=3D "TOPDIR"
> > diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/includ=
e/meta-virt-xen.inc
> > index 5fbb57f..89f98f2 100644
> > --- a/conf/distro/include/meta-virt-xen.inc
> > +++ b/conf/distro/include/meta-virt-xen.inc
> > @@ -12,4 +12,5 @@ include ${@bb.utils.contains('MACHINE', 'raspberrypi4=
-64', \
> >     '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
> >
> > # Set serial for working qemuboot console
> > +SERIAL_CONSOLES:qemuarm ?=3D "115200;ttyAMA0"
> > SERIAL_CONSOLES:qemuarm64 ?=3D "115200;ttyAMA0"
> > diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-ext=
ended/images/xen-image-minimal.bb
> > index f6fa5ed..c17c153 100644
> > --- a/recipes-extended/images/xen-image-minimal.bb
> > +++ b/recipes-extended/images/xen-image-minimal.bb
> > @@ -34,7 +34,11 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-=
xen-acpi-processor"
> >
> > LICENSE =3D "MIT"
> >
> > -inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-tes=
timage-network
> > +inherit core-image
> > +# Only inherit the qemuboot classes when building for a qemu machine
> > +QB_QEMU_CLASSES =3D ""
> > +QB_QEMU_CLASSES:qemuall =3D "qemuboot-xen-defaults qemuboot-xen-dtb qe=
muboot-xen-u-boot qemuboot-testimage-network"
> > +inherit ${QB_QEMU_CLASSES}
> >
> > do_check_xen_state() {
> >     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', =
d)}" =3D "no" ]; then
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7227): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7227
> > Mute This Topic: https://lists.yoctoproject.org/mt/90743683/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bertrand.marquis@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

