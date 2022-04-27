Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244E6C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 02:22:32 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web12.3514.1651026151100301223
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 19:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=abzjL/bm;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id y27so297122vkl.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 19:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qxtvi5cHaEa8TdMt8eDn/rpJ1gDZgjwIVCrk9nAiQO8=;
        b=abzjL/bmQKrmznsf4jAAsxkRyiCf01NgcUVNtznf1/dAOoVhM6OmTuEAP4AYPHEj1w
         smYm9zTNZT0JVaIqo6o4xgdO0/jOZIPgKJ9co7Ig93sm2RiqmIeoSSLS8yDBaxcXcvPX
         u3L60wbbQY9B9yA2kY9kKbGr7E9ch8wJB/eTe4CclhUoJDd9cBdSrwSNqPMZxxvU+bFZ
         7TglLcqC3CIJVbGguhxhM2lx6ABXGHLckE3wphDg7ftFXbYqehern/QswNN5h5IX64lm
         iuZE2hZsfBgtMY8HAK2fproTMtwyWjwAn3nVm6DDd5NKNTI/Q5er4vU/6sLXYxgSUr1G
         5Qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qxtvi5cHaEa8TdMt8eDn/rpJ1gDZgjwIVCrk9nAiQO8=;
        b=ZIlsconVK2qx3oDJdojwtLFi2lTP3RXH+XD5XChJvSZWdru4wDGwJVhIHD3ptItTO2
         IsEjCkqc/BHx8IB4rwyiX9gjBCoOArKh2Mr3NhLNcKGgQG+vBpufSnMyh4kwTKUyX5Xg
         olpXMclJsmh9eht6PuyIXQ0ajrmnTDlhgkS/+BPwgQ5FYwDqsWoAKzAat5iD0HYYLtZU
         kcciBFfazUm8iA8LRWZ3FZZZZEaDTAbj3QeiOhy+vkv+u2ZglV2tumeJ0+LTwcbJVeng
         CxGjpPjD0QIKLrkvfa2FsKFIq4cn9NN6yWQ9EHcHZBrefiLOprXeEtm5wA37q4M8Yh9I
         CJvg==
X-Gm-Message-State: AOAM531Y0Wyn6GGlG1/1IvG/gDys8ytWChMJ2JRA0eKQzm0Ytk0sM3aX
	LWbp3ruEM8px9i7SG/MpqdptQttxxeODVC9kpN8=
X-Google-Smtp-Source: 
 ABdhPJyrCyyvI3GfQX2UnvrqsApOsWNzrUKeJ1klP41+d6AN2sfSIAX2LT/PYPQ0vosyJl2LdlO3jdYmZxd8WHzf1QQ=
X-Received: by 2002:a1f:ad12:0:b0:349:55c7:66ae with SMTP id
 w18-20020a1fad12000000b0034955c766aemr8608649vke.36.1651026150057; Tue, 26
 Apr 2022 19:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220422174610.58059-1-christopher.w.clark@gmail.com>
 <07D7CC41-F661-4A59-B4DF-7E63B31465A3@arm.com>
In-Reply-To: <07D7CC41-F661-4A59-B4DF-7E63B31465A3@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 26 Apr 2022 19:22:18 -0700
Message-ID: 
 <CACMJ4GYqdx4+=ogag80wHhbodf10+ghC9+TdySgPXu7SJsrZag@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] qemuboot, xen-image-minimal: enable
 runqemu for qemuarm Xen images
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Christopher Clark <christopher.clark@starlab.io>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
 "cardoe@cardoe.com" <cardoe@cardoe.com>,
	Diego Sueiro <Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Apr 2022 02:22:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7222

On Tue, Apr 26, 2022 at 3:03 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 22 Apr 2022, at 18:46, Christopher Clark via lists.yoctoproject.org =
<christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > From: Christopher Clark <christopher.clark@starlab.io>
> >
> > The Xen hypervisor built for Arm 32-bit targets can be launched with
> > runqemu by providing a u-boot script and configuration for Qemu,
> > which enables interactive testing of Xen images.
> >
> > Add qemuboot-xen-u-boot.bbclass to add a new bitbake task for generatin=
g
> > the u-boot script.
> >
> > Update qemuboot-xen-defaults.bbclass to supply working default paramete=
rs
> > for the qemuarm machine needed to boot successfully in testing.
>
> The changes are very nice but I see 2 problems here:
> - all variables are using the architecture (arm or aarch64) instead of us=
ing the platform (qemuarm, etc) which would prevent an other platform to be=
 added (for example Xilinx board emulated by qemu).
> - xen-image-minimal is now inheriting a lot of classes doing stuff for qe=
mu even when you are building xen-image-minimal for an other board.
>
> Could we switch to platform name in the classes instead of using the arch=
itecture ?
> Could we find a way to only include the qemu classes when building for qe=
mu ?

Thanks for the review - this is helpful and I think that these can be
addressed in a v2.

> We are working on making a generic class to be build a Xen device tree an=
d this adding more and more things conflicting with our attempt.

OK - that sounds promising and I certainly do not want to be making it
more difficult.

best,
Christopher

>
> Cheers
> Bertrand
>
> >
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > ---
> > classes/qemuboot-xen-defaults.bbclass        |  16 +++
> > classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
> > conf/distro/include/meta-virt-xen.inc        |   1 +
> > recipes-extended/images/xen-image-minimal.bb |   2 +-
> > 4 files changed, 146 insertions(+), 1 deletion(-)
> > create mode 100644 classes/qemuboot-xen-u-boot.bbclass
> >
> > diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-x=
en-defaults.bbclass
> > index c7e74c3..1190f29 100644
> > --- a/classes/qemuboot-xen-defaults.bbclass
> > +++ b/classes/qemuboot-xen-defaults.bbclass
> > @@ -10,6 +10,17 @@ DOM0_KERNEL ??=3D "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAG=
ETYPE}"
> > DOM0_KERNEL_LOAD_ADDR ??=3D "0x45000000"
> > QB_XEN_DOMAIN_MODULES ??=3D "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:mu=
ltiboot,kernel"
> >
> > +# Qemuboot for 32-bit Arm loads Xen via device loader parameter rather=
 than
> > +# kernel and boots using u-boot as bios
> > +XEN_BINARY ??=3D "${DEPLOY_DIR_IMAGE}/xen-${MACHINE}"
> > +QB_XEN_LOAD_ADDR ??=3D "0x46000000"
> > +QB_OPT_APPEND:append:arm =3D " \
> > +    -device loader,file=3D${XEN_BINARY},addr=3D${QB_XEN_LOAD_ADDR},for=
ce-raw=3Don \
> > +    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADD=
R} \
> > +    -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin \
> > +    "
> > +QB_DEFAULT_KERNEL:arm =3D "none"
> > +
> > # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> > # and the device loader option for the dom0 kernel:
> > QB_OPT_APPEND:append:aarch64 =3D " \
> > @@ -17,6 +28,8 @@ QB_OPT_APPEND:append:aarch64 =3D " \
> >     "
> > QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
> >
> > +# 32-bit Arm: gic version 2
> > +QB_MACHINE:arm =3D "-machine virt -machine virtualization=3Dtrue"
> > # 64-bit Arm: gic version 3
> > QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtuali=
zation=3Dtrue"
> >
> > @@ -25,6 +38,9 @@ QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3=
 -machine virtualization=3Dtrue"
> > QB_MEM_VALUE ??=3D "512"
> > QB_MEM =3D "-m ${QB_MEM_VALUE}"
> >
> > +# 32-bit Arm: qemuboot with a u-boot script image
> > +QB_XEN_U_BOOT_SCR:arm =3D "boot.scr.uimg"
> > +
> > # 64-bit Arm: qemuboot with a device tree binary
> > QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> > QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> > diff --git a/classes/qemuboot-xen-u-boot.bbclass b/classes/qemuboot-xen=
-u-boot.bbclass
> > new file mode 100644
> > index 0000000..3767c09
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
image file.
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
> > index 5fbb57f..0bfcf59 100644
> > --- a/conf/distro/include/meta-virt-xen.inc
> > +++ b/conf/distro/include/meta-virt-xen.inc
> > @@ -13,3 +13,4 @@ include ${@bb.utils.contains('MACHINE', 'raspberrypi4=
-64', \
> >
> > # Set serial for working qemuboot console
> > SERIAL_CONSOLES:qemuarm64 ?=3D "115200;ttyAMA0"
> > +SERIAL_CONSOLES:qemuarm ?=3D "115200;ttyAMA0"
> > diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-ext=
ended/images/xen-image-minimal.bb
> > index f6fa5ed..6277614 100644
> > --- a/recipes-extended/images/xen-image-minimal.bb
> > +++ b/recipes-extended/images/xen-image-minimal.bb
> > @@ -34,7 +34,7 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-x=
en-acpi-processor"
> >
> > LICENSE =3D "MIT"
> >
> > -inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-tes=
timage-network
> > +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-tes=
timage-network qemuboot-xen-u-boot
> >
> > do_check_xen_state() {
> >     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', =
d)}" =3D "no" ]; then
> > --
> > 2.20.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7213): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/7213
> > Mute This Topic: https://lists.yoctoproject.org/mt/90633655/3619089
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

