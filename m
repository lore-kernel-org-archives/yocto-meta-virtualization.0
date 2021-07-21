Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.1699.1626835762004918855
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PaBbdVQs;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id qa36so960646ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4XizDLihr8WWKXgolLH1gQV5eRs8Fcxv3VAl5ozM8o=;
        b=PaBbdVQscPCLwDh+NRGfACnGIgvuJ/ramIb2tflfnavKc3qNyDTU7ixU+8j50on+NQ
         fi1u5f8MtfLQODINqoTahMdM6biZOTMSK83Bbu2/ChH8UzMUy2EmHU9iWLTMNRSqe14B
         RCgGQL8YugDjU89l0XPTa/7a1ITMx2lDVzMkoOqbvYbF5Wh+ULbLarlxmfcd6te/psHZ
         BUJxCyojtP3Qp6n7w9Po7Iam30iXjSVV1T61vKnZZ/dKcNEpjHrVvY8cP18EJp4XsLjL
         /+fKAJ9wU+VI0tdexNn+myRMDn6EArG3Gk7nCUYqfyxkFJTwQoWhVY1DZTAwW7Yo6QoS
         A3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4XizDLihr8WWKXgolLH1gQV5eRs8Fcxv3VAl5ozM8o=;
        b=Eue0pk6ou6Z5axA/qewZDf1KHzGTUyeO1a+1voFyBdweenPXZRAziBnP8lTIkgdMm1
         sWD7S9KnELfQXggWUQioM90LdchgnlXTXEd/rVnBPHKztGgt+gVAf6IwgbM1teB/FX3V
         Hawjnp3V++LemBQ4SIlM1rlnFeWpZIlj53RR8qbWALWm0GzF7Lp9pqhZ3HpjQl5xXLy+
         z3vhiQZtj+HcQ6IzNWQOUddGJJpgZhpzTeuAennJlg8RXvsW46TSmTFTk13TWQJ34pmz
         cpIHdPImo7TXoL8mOs7RduwP+9hGA0fU8OycwEvrxaO4fF7lP3tbUdOBHPKepinZeIhn
         HD7A==
X-Gm-Message-State: AOAM530uaLBPxIxzPVKRAq4jcyj0cTX/y48iF/anxqmxoWgI8jPOX4nK
	2h8tzxZiQnfCql/6Zr7NnuNA57S2cEFVvnqhCa8=
X-Google-Smtp-Source: ABdhPJzwM4WysfDZtT0M4Pc6OFKu6ZaK49YI4USYCBUP0OzzZIHg++2gYyYPoXxOnT7FWZgRsZ/Go9KMx4dkLBlAfow=
X-Received: by 2002:a17:907:77ca:: with SMTP id kz10mr35892403ejc.22.1626835760225;
 Tue, 20 Jul 2021 19:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com> <20210708044300.127016-3-christopher.w.clark@gmail.com>
In-Reply-To: <20210708044300.127016-3-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Jul 2021 22:49:09 -0400
Message-ID: <CADkTA4PTt0KJGFd3rpBSyET4+SmqrEO=0HDxe79_Uv40CbUEhw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark@starlab.io>, Doug Goldstein <cardoe@gentoo.org>, 
	Diego Sueiro <diego.sueiro@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	andrew.cooper3@citrix.com, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, scott.davis@starlab.io, adam.schwalm@starlab.io
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.clark@starlab.io>
>
> The Xen hypervisor built for Arm 64-bit targets can be launched with
> runqemu by providing a Device Tree binary and configuration for Qemu,
> which enables interactive testing of Xen images.
>
> Add qemuboot-xen-dtb.bbclass to add a new bitbake task for generating
> the dtb file by using lopper on a device tree produced by Qemu.
>
> Add qemuboot-xen-defaults.bbclass to supply working default parameters
> for the qemuarm64 machine and general support for qemuboot for Xen.
>
> Add the new qemuboot-xen classes to the xen-image-minimal image, along
> with variable settings needed for qemuboot to run the image for
> qemuarm64.
>
> The memory setting for Qemu has been increased to 512M after testing
> with successful boots. Default fstype for qemux86-64 was found to need a
> stronger override in testing. Provide an override for the serial console
> setting for the qemuarm64 machine when the Xen distro feature is
> enabled for the console in qemuboot, following the example of similar
> machine settings in meta-arm-bsp.
>
> Development aided by this script by Stewart Hildebrand of DornerWorks:
> https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7e10d8d35e
>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  classes/qemuboot-xen-defaults.bbclass        |  29 +++
>  classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
>  conf/distro/include/meta-virt-xen.inc        |   3 +
>  recipes-extended/images/xen-image-minimal.bb |   6 +-
>  4 files changed, 245 insertions(+), 2 deletions(-)
>  create mode 100644 classes/qemuboot-xen-defaults.bbclass
>  create mode 100644 classes/qemuboot-xen-dtb.bbclass
>
> diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
> new file mode 100644
> index 0000000..82cad49
> --- /dev/null
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -0,0 +1,29 @@
> +# Set defaults for booting Xen images with qemuboot
> +
> +# Xen and Dom0 command line options
> +QB_XEN_CMDLINE_EXTRA ??= "dom0_mem=192M"
> +QB_XEN_DOM0_BOOTARGS ??= \
> +    "console=hvc0 earlyprintk clk_ignore_unused root=/dev/vda"
> +
> +# Launch with one initial domain, dom0, with one boot module, the kernel
> +DOM0_KERNEL="${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
> +DOM0_KERNEL_LOAD_ADDR="0x45000000"
> +QB_XEN_DOMAIN_MODULES = "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,kernel"
> +
> +# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> +# and the device loader option for the dom0 kernel:
> +QB_OPT_APPEND_append_aarch64 = " \
> +    -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
> +    "
> +QB_DEFAULT_KERNEL_aarch64 = "xen-${MACHINE}"
> +
> +# 64-bit Arm: gic version 3
> +QB_MACHINE_aarch64 = "-machine virt,gic-version=3 -machine virtualization=true"
> +
> +# Use overrides for stronger assignment here as default memory set by the
> +# machines is not high enough
> +QB_MEM_qemuarm64 = "-m 512"

What about making that memory value a variable (with 512 as the
default) ? That allows us to change it without needing to always
modify the bbclass.

Almost all of my K8S runqemu launches need 512 or 1G of memory, so
this is definitely not uncommon!

> +
> +# 64-bit Arm: qemuboot with a device tree binary
> +QB_DTB_aarch64 = "${IMAGE_NAME}.qemuboot.dtb"
> +QB_DTB_LINK_aarch64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> new file mode 100644
> index 0000000..08f9b02
> --- /dev/null
> +++ b/classes/qemuboot-xen-dtb.bbclass
> @@ -0,0 +1,209 @@
> +# Enable booting Xen with qemuboot / runqemu: generate device tree
> +#
> +# Copyright (c) 2021 Star Lab Corp. All rights reserved.
> +#
> +# Author: Christopher Clark <christopher.clark@starlab.io>
> +
> +# Interface variables:
> +#
> +# QB_DTB : defined in qemuboot.bbclass.
> +# If set, this class will generate the specified device tree file.
> +#
> +# QB_XEN_CMDLINE_EXTRA :
> +# A string to be appended to the default Xen hypervisor boot command line,
> +# for supplying Xen boot options.
> +# The device tree that this bbclass generates will contain Xen command
> +# line options to connect the Xen console to the Qemu serial port.
> +#
> +# QB_XEN_DOMAIN_MODULES :
> +# A space-separated list of colon-separated entries:
> +#   "<file for the module>:<load memory address>:<module compatibility string>"
> +#
> +# QB_XEN_DOM0_BOOTARGS :
> +# A string for specifying Dom0 boot options for the Xen section of the device
> +# tree.
> +#
> +# QB_XEN_DTB_TASK_DEPENDS :
> +# The task dependencies for the DTB generation. A default is provided.
> +#
> +# See also: Other QB_ variables as defined by the qemuboot.bbclass.
> +
> +write_lops_xen_section() {
> +    cat <<EOF >"$1"
> +/dts-v1/;
> +/ {
> +    compatible = "system-device-tree-v1";
> +    lops {
> +        /* Connect the Xen console to Qemu dtuart */
> +        lop_1 {
> +            compatible = "system-device-tree-v1,lop,code-v1";
> +            code = "
> +                chosen = node.tree['/chosen']
> +                stdout_path = str(chosen['stdout-path'].value[0])
> +                chosen['xen,xen-bootargs'] = \
> +                        'console=dtuart dtuart=%s' % stdout_path
> +                return True
> +            ";
> +        };
> +        lop_2 {
> +            compatible = "system-device-tree-v1,lop,modify";
> +            modify = "/chosen:xen,dom0-bootargs:${QB_XEN_DOM0_BOOTARGS}";
> +        };
> +        lop_3 {
> +            compatible = "system-device-tree-v1,lop,modify";
> +            modify = "/chosen:#address-cells:<1>";
> +        };
> +        lop_4 {
> +            compatible = "system-device-tree-v1,lop,modify";
> +            modify = "/chosen:#size-cells:<1>";
> +        };
> +     };
> +};
> +EOF
> +}
> +
> +write_lop_add_to_xen_cmdline() {
> +    EXTRA_XEN_BOOTARGS="$2"
> +    cat <<EOF >"$1"
> +/dts-v1/;
> +/ {
> +    compatible = "system-device-tree-v1";
> +    lops {
> +        lop_1 {
> +            compatible = "system-device-tree-v1,lop,code-v1";
> +            options = "extra_xen_bootargs:${EXTRA_XEN_BOOTARGS}";
> +            code = "
> +                chosen = node.tree['/chosen']
> +                xen_bootargs = str(chosen['xen,xen-bootargs'].value)
> +                chosen['xen,xen-bootargs'] = '%s %s' % \
> +                     (xen_bootargs, extra_xen_bootargs)
> +                return True
> +            ";
> +        };
> +     };
> +};
> +EOF
> +}
> +
> +write_lop_add_chosen_module() {
> +    ADDR="$2"
> +    SIZE="$3"
> +    MODULE_TYPE="$4"
> +    cat <<EOF >"$1"
> +/dts-v1/;
> +/ {
> +    compatible = "system-device-tree-v1";
> +    lops {
> +        lop_1 {
> +            compatible = "system-device-tree-v1,lop,add";
> +            node_src = "module@${ADDR}";
> +            node_dest = "/chosen/module@${ADDR}";
> +
> +            module@${ADDR} {
> +                compatible = "multiboot,module", "${MODULE_TYPE}";
> +                reg = <${ADDR} ${SIZE}>;
> +            };
> +        };
> +     };
> +};
> +EOF
> +}
> +
> +generate_xen_qemuboot_dtb() {
> +    # First: invoke qemu to generate an initial device tree.
> +    # Parameters supplied here inspired by inspection of:
> +    #   runqemu "${IMAGE_BASENAME}" nographic slirp \
> +    #            qemuparams='-dtb "" -machine dumpdtb=${B}/qemu-dumped.dtb'
> +    ${QB_SYSTEM_NAME} \
> +        -device qemu-xhci \
> +        -device usb-tablet \
> +        -device usb-kbd \
> +        -machine virt,gic-version=3 \
> +        -machine virtualization=true \
> +        ${QB_CPU} \
> +        ${QB_SMP} \
> +        ${QB_MEM} \
> +        -nographic \
> +        -serial mon:stdio \
> +        -machine "dumpdtb=${B}/qemu-dumped.dtb"
> +
> +    # Lopper generates temporary files in cwd, so run it within ${B}
> +    cd "${B}"
> +    write_lops_xen_section "${B}/lop-insert-xen-section.dts"
> +
> +    write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
> +        "${QB_XEN_CMDLINE_EXTRA}"
> +
> +    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> +        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> +    fi
> +
> +    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
> +    do
> +        MODULE_FILE="$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
> +        ADDR="$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
> +        MODULE_TYPE="$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
> +        RESOLVED_FILE="$(readlink -f ${MODULE_FILE})"
> +        SIZE=$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
> +        [ "x${SIZE}" != "x0x0" ] || bbfatal No module: "${MODULE_FILE}"
> +        write_lop_add_chosen_module "${B}/lop-add-module-${ADDR}.dts" \
> +            "${ADDR}" "${SIZE}" "${MODULE_TYPE}"
> +        LOP_MODULE_ARGS="${LOP_MODULE_ARGS} -i ${B}/lop-add-module-${ADDR}.dts"
> +    done
> +
> +    QEMUBOOT_DTB="${IMGDEPLOYDIR}/${QB_DTB}"
> +    QEMUBOOT_DTB_LINK="${IMGDEPLOYDIR}/${QB_DTB_LINK}"
> +
> +    lopper.py --werror --verbose \
> +        -i "${B}/lop-insert-xen-section.dts" \
> +        -i "${B}/lop-xen-cmdline.dts" \
> +        ${LOP_MODULE_ARGS} \
> +        -f -o "${QEMUBOOT_DTB}" \
> +            "${B}/qemu-dumped.dtb"
> +
> +    # To assist debugging:
> +    dtc -I dtb -O dts -o "${B}/output.dts" "${QEMUBOOT_DTB}"
> +
> +    if [ "${QEMUBOOT_DTB_LINK}" != "${QEMUBOOT_DTB}" ] ; then
> +        if [ -e "${QEMUBOOT_DTB_LINK}" ] ; then
> +            rm "${QEMUBOOT_DTB_LINK}"
> +        fi
> +        ln -s "${QB_DTB}" "${QEMUBOOT_DTB_LINK}"
> +    fi
> +}
> +
> +do_write_xen_qemuboot_dtb() {
> +    # Not all architectures qemuboot with a device tree binary, so check
> +    # to see if one is needed. This allows this bbclass file to be used
> +    # in the same image recipe for multiple architectures.
> +    if [ -n "${QB_DTB}" ] ; then
> +        generate_xen_qemuboot_dtb
> +    fi
> +}
> +
> +addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf before do_image
> +# Task dependency:
> +# An expected common case is that the kernel for at least one of the initial
> +# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
> +# add virtual/kernel:do_deploy as a task dependency here since the kernel size
> +# needs to be known for generating the device tree.
> +# Dependencies are only introduced if a device tree will be generated.
> +QB_XEN_DTB_TASK_DEPENDS ?= " \
> +    ${@[ ' \
> +        qemu-helper-native:do_populate_sysroot \
> +        lopper-native:do_populate_sysroot \
> +        dtc-native:do_populate_sysroot \
> +        virtual/kernel:do_deploy \
> +    ', ''][d.getVar('QB_DTB') == '' or d.getVar('QB_DTB') is None]} \
> +    "
> +do_write_xen_qemuboot_dtb[depends] = "${QB_XEN_DTB_TASK_DEPENDS}"
> +
> +def qemuboot_dtb_vars(d):
> +    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> +                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> +                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> +
> +do_write_qemuboot_dtb[vardeps] += "${@' '.join(qemuboot_dtb_vars(d))}"
> +do_write_qemuboot_dtb[vardepsexclude] += "TOPDIR"
> diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
> index 02a7810..2becba1 100644
> --- a/conf/distro/include/meta-virt-xen.inc
> +++ b/conf/distro/include/meta-virt-xen.inc
> @@ -10,3 +10,6 @@ XEN_RPI4_64_CONFIG_PATH ??= \
>      'dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc'
>  include ${@bb.utils.contains('MACHINE', 'raspberrypi4-64', \
>      '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
> +
> +# Set serial for working qemuboot console
> +SERIAL_CONSOLES_qemuarm64 ?= "115200;ttyAMA0"
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 6733801..2175e63 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
>
>  LICENSE = "MIT"
>
> -inherit core-image
> +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
>
>  do_check_xen_state() {
>      if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)}" = "no" ]; then
> @@ -74,10 +74,12 @@ build_syslinux_cfg () {
>
>  # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
>  WKS_FILE_x86-64 = "directdisk-xen.wks"
> -QB_MEM ?= "-m 400"
> +QB_MEM ?= "-m 512"

Since you are bumping the default to 512 here. Do we even need that
qemuarm64 specific override in the bbclass ?

Bruce

>  QB_DEFAULT_KERNEL ?= "none"
>  QB_DEFAULT_FSTYPE ?= "wic"
> +QB_DEFAULT_FSTYPE_qemux86-64 = "wic"
>  QB_FSINFO ?= "wic:kernel-in-fs"
> +QB_SERIAL_OPT = "-serial mon:stdio"
>  # qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
>  # to boot this image, so add it here:
>  IMAGE_FSTYPES_qemux86-64 += "wic"
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
