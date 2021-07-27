Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.6065.1627352182327457613
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 19:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rTaHB1vP;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id nb11so19653077ejc.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jul 2021 19:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DiEi1HjuMuj2DPTRsiJzdcNKQzAklzQXrxDrpNvbqls=;
        b=rTaHB1vPa8cwzyRZlbOk8Jg/8xFPyDgkcB3pLIjnh+1w6qNTTxGjHOHkacBCRrqAhY
         z7IoEC7cFk/wwbLmXQ5+Pd6aqAVYcfN2aKw/6kDo/XN+VXgb8Y/MQq/8KMJuXR0sIDWa
         B1p/2bejOHGvJdK0jgGHsjUsQ+ZSvB73GtzdfTI6YuaTiVZbeLjJzXXT4lvQBrP1P+9o
         wCwU+o6yng7G5aJc/L729WjR9ucrzF/pkllOuAPnz7GqGxgZvgsG8EhULGJ0eMUotDDV
         aJYlDT/YwaMoTlPTT8gq+bh00bqVuO9aHIMFgTiDURvrWvOgrXCLkQSVyRjsTDwALWgV
         GU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DiEi1HjuMuj2DPTRsiJzdcNKQzAklzQXrxDrpNvbqls=;
        b=hT6DNhVNGQMUybudHgGt/hFQfIFkAnAw8yDvrMXFoexiKf09KF2gmn4SnST0SvCy+R
         MuJ/Rx3GSBjEsa2V2e1Zth5m9u0LXSfaoMRnVpvMzy0YwFmwPFBld7iaw7hvs5TnpTow
         LdSRwsvehV2oJnQkvvlgu1aqPRH2QHeKF5V9zHIdIbxvc2wQy21KQckdcw3QlBzRpk8B
         Dhl++CmfNG8oom00dRxkvG14GfjuOWW/H/UUqaHESCAW18CZawFjgKlJiQcrRYckQMj1
         X7zCvteBgzksNCHyI68dH8xYw5t82ZOII19RP7UXylkaYuMO6qBELyIq5z90nu87krzC
         XR7A==
X-Gm-Message-State: AOAM531W4Hr1F3h4JSgZD+7gqX7ze+JsJoIbOMjjRwRRz3IB8RLDC7Uu
	lMx/cCc/TacGZ7uqZkU0Ydn3XedQifEykULXKtg=
X-Google-Smtp-Source: ABdhPJyyh5/XlOtT4vLMctpZQIn9TSbNWpXkXw8LcQhgvjF4f8a//cv91czS5Xqr9kH9zTYs5+IdsjPnzI97yDqCx40=
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr15623438ejn.22.1627352180408;
 Mon, 26 Jul 2021 19:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com>
 <20210708044300.127016-3-christopher.w.clark@gmail.com> <CADkTA4PTt0KJGFd3rpBSyET4+SmqrEO=0HDxe79_Uv40CbUEhw@mail.gmail.com>
 <CACMJ4GZVd=2O8J9-EW4=scS9-35K9O0UMTD8gNa=9Ev5U2to1A@mail.gmail.com>
In-Reply-To: <CACMJ4GZVd=2O8J9-EW4=scS9-35K9O0UMTD8gNa=9Ev5U2to1A@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 26 Jul 2021 22:16:09 -0400
Message-ID: <CADkTA4OAZXuBXUfDTbyVT4nmPP6izi5z4EHXP=_N_7K+zJ8QPA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark@starlab.io>, Doug Goldstein <cardoe@gentoo.org>, 
	Diego Sueiro <diego.sueiro@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, Scott Davis <scott.davis@starlab.io>, 
	Adam Schwalm <adam.schwalm@starlab.io>
Content-Type: multipart/alternative; boundary="000000000000a3448205c81174f0"

--000000000000a3448205c81174f0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 6:37 PM Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Tue, Jul 20, 2021 at 7:49 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
> > <christopher.w.clark@gmail.com> wrote:
> > >
> > > From: Christopher Clark <christopher.clark@starlab.io>
> > >
> > > The Xen hypervisor built for Arm 64-bit targets can be launched with
> > > runqemu by providing a Device Tree binary and configuration for Qemu,
> > > which enables interactive testing of Xen images.
> > >
> > > Add qemuboot-xen-dtb.bbclass to add a new bitbake task for generating
> > > the dtb file by using lopper on a device tree produced by Qemu.
> > >
> > > Add qemuboot-xen-defaults.bbclass to supply working default parameters
> > > for the qemuarm64 machine and general support for qemuboot for Xen.
> > >
> > > Add the new qemuboot-xen classes to the xen-image-minimal image, along
> > > with variable settings needed for qemuboot to run the image for
> > > qemuarm64.
> > >
> > > The memory setting for Qemu has been increased to 512M after testing
> > > with successful boots. Default fstype for qemux86-64 was found to need
> a
> > > stronger override in testing. Provide an override for the serial
> console
> > > setting for the qemuarm64 machine when the Xen distro feature is
> > > enabled for the console in qemuboot, following the example of similar
> > > machine settings in meta-arm-bsp.
> > >
> > > Development aided by this script by Stewart Hildebrand of DornerWorks:
> > > https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7e10d8d35e
> > >
> > > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > > ---
> > >  classes/qemuboot-xen-defaults.bbclass        |  29 +++
> > >  classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
> > >  conf/distro/include/meta-virt-xen.inc        |   3 +
> > >  recipes-extended/images/xen-image-minimal.bb |   6 +-
> > >  4 files changed, 245 insertions(+), 2 deletions(-)
> > >  create mode 100644 classes/qemuboot-xen-defaults.bbclass
> > >  create mode 100644 classes/qemuboot-xen-dtb.bbclass
> > >
> > > diff --git a/classes/qemuboot-xen-defaults.bbclass
> b/classes/qemuboot-xen-defaults.bbclass
> > > new file mode 100644
> > > index 0000000..82cad49
> > > --- /dev/null
> > > +++ b/classes/qemuboot-xen-defaults.bbclass
> > > @@ -0,0 +1,29 @@
> > > +# Set defaults for booting Xen images with qemuboot
> > > +
> > > +# Xen and Dom0 command line options
> > > +QB_XEN_CMDLINE_EXTRA ??= "dom0_mem=192M"
> > > +QB_XEN_DOM0_BOOTARGS ??= \
> > > +    "console=hvc0 earlyprintk clk_ignore_unused root=/dev/vda"
> > > +
> > > +# Launch with one initial domain, dom0, with one boot module, the
> kernel
> > > +DOM0_KERNEL="${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
> > > +DOM0_KERNEL_LOAD_ADDR="0x45000000"
> > > +QB_XEN_DOMAIN_MODULES =
> "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,kernel"
> > > +
> > > +# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load
> Xen
> > > +# and the device loader option for the dom0 kernel:
> > > +QB_OPT_APPEND_append_aarch64 = " \
> > > +    -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
> > > +    "
> > > +QB_DEFAULT_KERNEL_aarch64 = "xen-${MACHINE}"
> > > +
> > > +# 64-bit Arm: gic version 3
> > > +QB_MACHINE_aarch64 = "-machine virt,gic-version=3 -machine
> virtualization=true"
> > > +
> > > +# Use overrides for stronger assignment here as default memory set by
> the
> > > +# machines is not high enough
> > > +QB_MEM_qemuarm64 = "-m 512"
> >
> > What about making that memory value a variable (with 512 as the
> > default) ? That allows us to change it without needing to always
> > modify the bbclass.
> >
> > Almost all of my K8S runqemu launches need 512 or 1G of memory, so
> > this is definitely not uncommon!
>
> ack - will do that for v2
>
> >
> > > +
> > > +# 64-bit Arm: qemuboot with a device tree binary
> > > +QB_DTB_aarch64 = "${IMAGE_NAME}.qemuboot.dtb"
> > > +QB_DTB_LINK_aarch64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
> > > diff --git a/classes/qemuboot-xen-dtb.bbclass
> b/classes/qemuboot-xen-dtb.bbclass
> > > new file mode 100644
> > > index 0000000..08f9b02
> > > --- /dev/null
> > > +++ b/classes/qemuboot-xen-dtb.bbclass
> > > @@ -0,0 +1,209 @@
> > > +# Enable booting Xen with qemuboot / runqemu: generate device tree
> > > +#
> > > +# Copyright (c) 2021 Star Lab Corp. All rights reserved.
> > > +#
> > > +# Author: Christopher Clark <christopher.clark@starlab.io>
> > > +
> > > +# Interface variables:
> > > +#
> > > +# QB_DTB : defined in qemuboot.bbclass.
> > > +# If set, this class will generate the specified device tree file.
> > > +#
> > > +# QB_XEN_CMDLINE_EXTRA :
> > > +# A string to be appended to the default Xen hypervisor boot command
> line,
> > > +# for supplying Xen boot options.
> > > +# The device tree that this bbclass generates will contain Xen command
> > > +# line options to connect the Xen console to the Qemu serial port.
> > > +#
> > > +# QB_XEN_DOMAIN_MODULES :
> > > +# A space-separated list of colon-separated entries:
> > > +#   "<file for the module>:<load memory address>:<module
> compatibility string>"
> > > +#
> > > +# QB_XEN_DOM0_BOOTARGS :
> > > +# A string for specifying Dom0 boot options for the Xen section of
> the device
> > > +# tree.
> > > +#
> > > +# QB_XEN_DTB_TASK_DEPENDS :
> > > +# The task dependencies for the DTB generation. A default is provided.
> > > +#
> > > +# See also: Other QB_ variables as defined by the qemuboot.bbclass.
> > > +
> > > +write_lops_xen_section() {
> > > +    cat <<EOF >"$1"
> > > +/dts-v1/;
> > > +/ {
> > > +    compatible = "system-device-tree-v1";
> > > +    lops {
> > > +        /* Connect the Xen console to Qemu dtuart */
> > > +        lop_1 {
> > > +            compatible = "system-device-tree-v1,lop,code-v1";
> > > +            code = "
> > > +                chosen = node.tree['/chosen']
> > > +                stdout_path = str(chosen['stdout-path'].value[0])
> > > +                chosen['xen,xen-bootargs'] = \
> > > +                        'console=dtuart dtuart=%s' % stdout_path
> > > +                return True
> > > +            ";
> > > +        };
> > > +        lop_2 {
> > > +            compatible = "system-device-tree-v1,lop,modify";
> > > +            modify =
> "/chosen:xen,dom0-bootargs:${QB_XEN_DOM0_BOOTARGS}";
> > > +        };
> > > +        lop_3 {
> > > +            compatible = "system-device-tree-v1,lop,modify";
> > > +            modify = "/chosen:#address-cells:<1>";
> > > +        };
> > > +        lop_4 {
> > > +            compatible = "system-device-tree-v1,lop,modify";
> > > +            modify = "/chosen:#size-cells:<1>";
> > > +        };
> > > +     };
> > > +};
> > > +EOF
> > > +}
> > > +
> > > +write_lop_add_to_xen_cmdline() {
> > > +    EXTRA_XEN_BOOTARGS="$2"
> > > +    cat <<EOF >"$1"
> > > +/dts-v1/;
> > > +/ {
> > > +    compatible = "system-device-tree-v1";
> > > +    lops {
> > > +        lop_1 {
> > > +            compatible = "system-device-tree-v1,lop,code-v1";
> > > +            options = "extra_xen_bootargs:${EXTRA_XEN_BOOTARGS}";
> > > +            code = "
> > > +                chosen = node.tree['/chosen']
> > > +                xen_bootargs = str(chosen['xen,xen-bootargs'].value)
> > > +                chosen['xen,xen-bootargs'] = '%s %s' % \
> > > +                     (xen_bootargs, extra_xen_bootargs)
> > > +                return True
> > > +            ";
> > > +        };
> > > +     };
> > > +};
> > > +EOF
> > > +}
> > > +
> > > +write_lop_add_chosen_module() {
> > > +    ADDR="$2"
> > > +    SIZE="$3"
> > > +    MODULE_TYPE="$4"
> > > +    cat <<EOF >"$1"
> > > +/dts-v1/;
> > > +/ {
> > > +    compatible = "system-device-tree-v1";
> > > +    lops {
> > > +        lop_1 {
> > > +            compatible = "system-device-tree-v1,lop,add";
> > > +            node_src = "module@${ADDR}";
> > > +            node_dest = "/chosen/module@${ADDR}";
> > > +
> > > +            module@${ADDR} {
> > > +                compatible = "multiboot,module", "${MODULE_TYPE}";
> > > +                reg = <${ADDR} ${SIZE}>;
> > > +            };
> > > +        };
> > > +     };
> > > +};
> > > +EOF
> > > +}
> > > +
> > > +generate_xen_qemuboot_dtb() {
> > > +    # First: invoke qemu to generate an initial device tree.
> > > +    # Parameters supplied here inspired by inspection of:
> > > +    #   runqemu "${IMAGE_BASENAME}" nographic slirp \
> > > +    #            qemuparams='-dtb "" -machine
> dumpdtb=${B}/qemu-dumped.dtb'
> > > +    ${QB_SYSTEM_NAME} \
> > > +        -device qemu-xhci \
> > > +        -device usb-tablet \
> > > +        -device usb-kbd \
> > > +        -machine virt,gic-version=3 \
> > > +        -machine virtualization=true \
> > > +        ${QB_CPU} \
> > > +        ${QB_SMP} \
> > > +        ${QB_MEM} \
> > > +        -nographic \
> > > +        -serial mon:stdio \
> > > +        -machine "dumpdtb=${B}/qemu-dumped.dtb"
> > > +
> > > +    # Lopper generates temporary files in cwd, so run it within ${B}
> > > +    cd "${B}"
> > > +    write_lops_xen_section "${B}/lop-insert-xen-section.dts"
> > > +
> > > +    write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
> > > +        "${QB_XEN_CMDLINE_EXTRA}"
> > > +
> > > +    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> > > +        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> > > +    fi
> > > +
> > > +    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
> > > +    do
> > > +        MODULE_FILE="$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
> > > +        ADDR="$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
> > > +        MODULE_TYPE="$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
> > > +        RESOLVED_FILE="$(readlink -f ${MODULE_FILE})"
> > > +        SIZE=$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
> > > +        [ "x${SIZE}" != "x0x0" ] || bbfatal No module:
> "${MODULE_FILE}"
> > > +        write_lop_add_chosen_module "${B}/lop-add-module-${ADDR}.dts"
> \
> > > +            "${ADDR}" "${SIZE}" "${MODULE_TYPE}"
> > > +        LOP_MODULE_ARGS="${LOP_MODULE_ARGS} -i
> ${B}/lop-add-module-${ADDR}.dts"
> > > +    done
> > > +
> > > +    QEMUBOOT_DTB="${IMGDEPLOYDIR}/${QB_DTB}"
> > > +    QEMUBOOT_DTB_LINK="${IMGDEPLOYDIR}/${QB_DTB_LINK}"
> > > +
> > > +    lopper.py --werror --verbose \
> > > +        -i "${B}/lop-insert-xen-section.dts" \
> > > +        -i "${B}/lop-xen-cmdline.dts" \
> > > +        ${LOP_MODULE_ARGS} \
> > > +        -f -o "${QEMUBOOT_DTB}" \
> > > +            "${B}/qemu-dumped.dtb"
> > > +
> > > +    # To assist debugging:
> > > +    dtc -I dtb -O dts -o "${B}/output.dts" "${QEMUBOOT_DTB}"
> > > +
> > > +    if [ "${QEMUBOOT_DTB_LINK}" != "${QEMUBOOT_DTB}" ] ; then
> > > +        if [ -e "${QEMUBOOT_DTB_LINK}" ] ; then
> > > +            rm "${QEMUBOOT_DTB_LINK}"
> > > +        fi
> > > +        ln -s "${QB_DTB}" "${QEMUBOOT_DTB_LINK}"
> > > +    fi
> > > +}
> > > +
> > > +do_write_xen_qemuboot_dtb() {
> > > +    # Not all architectures qemuboot with a device tree binary, so
> check
> > > +    # to see if one is needed. This allows this bbclass file to be
> used
> > > +    # in the same image recipe for multiple architectures.
> > > +    if [ -n "${QB_DTB}" ] ; then
> > > +        generate_xen_qemuboot_dtb
> > > +    fi
> > > +}
> > > +
> > > +addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf before
> do_image
> > > +# Task dependency:
> > > +# An expected common case is that the kernel for at least one of the
> initial
> > > +# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
> > > +# add virtual/kernel:do_deploy as a task dependency here since the
> kernel size
> > > +# needs to be known for generating the device tree.
> > > +# Dependencies are only introduced if a device tree will be generated.
> > > +QB_XEN_DTB_TASK_DEPENDS ?= " \
> > > +    ${@[ ' \
> > > +        qemu-helper-native:do_populate_sysroot \
> > > +        lopper-native:do_populate_sysroot \
> > > +        dtc-native:do_populate_sysroot \
> > > +        virtual/kernel:do_deploy \
> > > +    ', ''][d.getVar('QB_DTB') == '' or d.getVar('QB_DTB') is None]} \
> > > +    "
> > > +do_write_xen_qemuboot_dtb[depends] = "${QB_XEN_DTB_TASK_DEPENDS}"
> > > +
> > > +def qemuboot_dtb_vars(d):
> > > +    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> > > +                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> > > +                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> > > +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> > > +    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> > > +
> > > +do_write_qemuboot_dtb[vardeps] += "${@' '.join(qemuboot_dtb_vars(d))}"
> > > +do_write_qemuboot_dtb[vardepsexclude] += "TOPDIR"
> > > diff --git a/conf/distro/include/meta-virt-xen.inc
> b/conf/distro/include/meta-virt-xen.inc
> > > index 02a7810..2becba1 100644
> > > --- a/conf/distro/include/meta-virt-xen.inc
> > > +++ b/conf/distro/include/meta-virt-xen.inc
> > > @@ -10,3 +10,6 @@ XEN_RPI4_64_CONFIG_PATH ??= \
> > >
> 'dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc'
> > >  include ${@bb.utils.contains('MACHINE', 'raspberrypi4-64', \
> > >      '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
> > > +
> > > +# Set serial for working qemuboot console
> > > +SERIAL_CONSOLES_qemuarm64 ?= "115200;ttyAMA0"
> > > diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> > > index 6733801..2175e63 100644
> > > --- a/recipes-extended/images/xen-image-minimal.bb
> > > +++ b/recipes-extended/images/xen-image-minimal.bb
> > > @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 =
> "kernel-module-xen-pciback"
> > >
> > >  LICENSE = "MIT"
> > >
> > > -inherit core-image
> > > +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
> > >
> > >  do_check_xen_state() {
> > >      if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes',
> 'no', d)}" = "no" ]; then
> > > @@ -74,10 +74,12 @@ build_syslinux_cfg () {
> > >
> > >  # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
> > >  WKS_FILE_x86-64 = "directdisk-xen.wks"
> > > -QB_MEM ?= "-m 400"
> > > +QB_MEM ?= "-m 512"
> >
> > Since you are bumping the default to 512 here. Do we even need that
> > qemuarm64 specific override in the bbclass ?
>
> ack, I don't think we do.
> I think the following works OK: put this into the
> qemuboot-xen-defaults.bbclass:
>
> +# Increase the default qemu memory allocation to allow for the hypervisor.
> +# Use a weak assignment to allow for change of default and override
> elsewhere.
> +QB_MEM_VALUE ??= "512"
> +QB_MEM = "-m ${QB_MEM_VALUE}"
>
> and then setting QB_MEM at all can be dropped from the
> xen-image-minimal recipe (since the default is now fine).
>
> If an image does need to update the memory setting, it can set QB_MEM_VALUE
> which has a weak default so is easily overridden. It's also
> MACHINE-agnostic, which is preferable.
>
> Does that sound OK?
>

Yes, sounds good to me!

Bruce



>
> Christopher
>
>
> >
> > Bruce
> >
> > >  QB_DEFAULT_KERNEL ?= "none"
> > >  QB_DEFAULT_FSTYPE ?= "wic"
> > > +QB_DEFAULT_FSTYPE_qemux86-64 = "wic"
> > >  QB_FSINFO ?= "wic:kernel-in-fs"
> > > +QB_SERIAL_OPT = "-serial mon:stdio"
> > >  # qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which
> is needed
> > >  # to boot this image, so add it here:
> > >  IMAGE_FSTYPES_qemux86-64 += "wic"
> > > --
> > > 2.25.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a3448205c81174f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 6:37 PM Christopher Clark &=
lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Jul 20, 2021 at 7:49 PM Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark<br>
&gt; &lt;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank"=
>christopher.w.clark@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Christopher Clark &lt;<a href=3D"mailto:christopher.clark@s=
tarlab.io" target=3D"_blank">christopher.clark@starlab.io</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The Xen hypervisor built for Arm 64-bit targets can be launched w=
ith<br>
&gt; &gt; runqemu by providing a Device Tree binary and configuration for Q=
emu,<br>
&gt; &gt; which enables interactive testing of Xen images.<br>
&gt; &gt;<br>
&gt; &gt; Add qemuboot-xen-dtb.bbclass to add a new bitbake task for genera=
ting<br>
&gt; &gt; the dtb file by using lopper on a device tree produced by Qemu.<b=
r>
&gt; &gt;<br>
&gt; &gt; Add qemuboot-xen-defaults.bbclass to supply working default param=
eters<br>
&gt; &gt; for the qemuarm64 machine and general support for qemuboot for Xe=
n.<br>
&gt; &gt;<br>
&gt; &gt; Add the new qemuboot-xen classes to the xen-image-minimal image, =
along<br>
&gt; &gt; with variable settings needed for qemuboot to run the image for<b=
r>
&gt; &gt; qemuarm64.<br>
&gt; &gt;<br>
&gt; &gt; The memory setting for Qemu has been increased to 512M after test=
ing<br>
&gt; &gt; with successful boots. Default fstype for qemux86-64 was found to=
 need a<br>
&gt; &gt; stronger override in testing. Provide an override for the serial =
console<br>
&gt; &gt; setting for the qemuarm64 machine when the Xen distro feature is<=
br>
&gt; &gt; enabled for the console in qemuboot, following the example of sim=
ilar<br>
&gt; &gt; machine settings in meta-arm-bsp.<br>
&gt; &gt;<br>
&gt; &gt; Development aided by this script by Stewart Hildebrand of DornerW=
orks:<br>
&gt; &gt; <a href=3D"https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7=
e10d8d35e" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/ste=
wdk/110f43e0cc1d905fc6ed4c7e10d8d35e</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christophe=
r.clark@starlab.io" target=3D"_blank">christopher.clark@starlab.io</a>&gt;<=
br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 classes/qemuboot-xen-defaults.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 29 +++<br>
&gt; &gt;=C2=A0 classes/qemuboot-xen-dtb.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 209 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 conf/distro/include/meta-virt-xen.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; &gt;=C2=A0 recipes-extended/images/<a href=3D"http://xen-image-minimal=
.bb" rel=3D"noreferrer" target=3D"_blank">xen-image-minimal.bb</a> |=C2=A0 =
=C2=A06 +-<br>
&gt; &gt;=C2=A0 4 files changed, 245 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 classes/qemuboot-xen-defaults.bbclass<br=
>
&gt; &gt;=C2=A0 create mode 100644 classes/qemuboot-xen-dtb.bbclass<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemu=
boot-xen-defaults.bbclass<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..82cad49<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/classes/qemuboot-xen-defaults.bbclass<br>
&gt; &gt; @@ -0,0 +1,29 @@<br>
&gt; &gt; +# Set defaults for booting Xen images with qemuboot<br>
&gt; &gt; +<br>
&gt; &gt; +# Xen and Dom0 command line options<br>
&gt; &gt; +QB_XEN_CMDLINE_EXTRA ??=3D &quot;dom0_mem=3D192M&quot;<br>
&gt; &gt; +QB_XEN_DOM0_BOOTARGS ??=3D \<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;console=3Dhvc0 earlyprintk clk_ignore_unused=
 root=3D/dev/vda&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Launch with one initial domain, dom0, with one boot module, th=
e kernel<br>
&gt; &gt; +DOM0_KERNEL=3D&quot;${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}&quot=
;<br>
&gt; &gt; +DOM0_KERNEL_LOAD_ADDR=3D&quot;0x45000000&quot;<br>
&gt; &gt; +QB_XEN_DOMAIN_MODULES =3D &quot;${DOM0_KERNEL}:${DOM0_KERNEL_LOA=
D_ADDR}:multiboot,kernel&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to l=
oad Xen<br>
&gt; &gt; +# and the device loader option for the dom0 kernel:<br>
&gt; &gt; +QB_OPT_APPEND_append_aarch64 =3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0=
_KERNEL_LOAD_ADDR} \<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; &gt; +QB_DEFAULT_KERNEL_aarch64 =3D &quot;xen-${MACHINE}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# 64-bit Arm: gic version 3<br>
&gt; &gt; +QB_MACHINE_aarch64 =3D &quot;-machine virt,gic-version=3D3 -mach=
ine virtualization=3Dtrue&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Use overrides for stronger assignment here as default memory s=
et by the<br>
&gt; &gt; +# machines is not high enough<br>
&gt; &gt; +QB_MEM_qemuarm64 =3D &quot;-m 512&quot;<br>
&gt;<br>
&gt; What about making that memory value a variable (with 512 as the<br>
&gt; default) ? That allows us to change it without needing to always<br>
&gt; modify the bbclass.<br>
&gt;<br>
&gt; Almost all of my K8S runqemu launches need 512 or 1G of memory, so<br>
&gt; this is definitely not uncommon!<br>
<br>
ack - will do that for v2<br>
<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +# 64-bit Arm: qemuboot with a device tree binary<br>
&gt; &gt; +QB_DTB_aarch64 =3D &quot;${IMAGE_NAME}.qemuboot.dtb&quot;<br>
&gt; &gt; +QB_DTB_LINK_aarch64 =3D &quot;${IMAGE_LINK_NAME}.qemuboot.dtb&qu=
ot;<br>
&gt; &gt; diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-=
xen-dtb.bbclass<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..08f9b02<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/classes/qemuboot-xen-dtb.bbclass<br>
&gt; &gt; @@ -0,0 +1,209 @@<br>
&gt; &gt; +# Enable booting Xen with qemuboot / runqemu: generate device tr=
ee<br>
&gt; &gt; +#<br>
&gt; &gt; +# Copyright (c) 2021 Star Lab Corp. All rights reserved.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Author: Christopher Clark &lt;<a href=3D"mailto:christopher.cl=
ark@starlab.io" target=3D"_blank">christopher.clark@starlab.io</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +# Interface variables:<br>
&gt; &gt; +#<br>
&gt; &gt; +# QB_DTB : defined in qemuboot.bbclass.<br>
&gt; &gt; +# If set, this class will generate the specified device tree fil=
e.<br>
&gt; &gt; +#<br>
&gt; &gt; +# QB_XEN_CMDLINE_EXTRA :<br>
&gt; &gt; +# A string to be appended to the default Xen hypervisor boot com=
mand line,<br>
&gt; &gt; +# for supplying Xen boot options.<br>
&gt; &gt; +# The device tree that this bbclass generates will contain Xen c=
ommand<br>
&gt; &gt; +# line options to connect the Xen console to the Qemu serial por=
t.<br>
&gt; &gt; +#<br>
&gt; &gt; +# QB_XEN_DOMAIN_MODULES :<br>
&gt; &gt; +# A space-separated list of colon-separated entries:<br>
&gt; &gt; +#=C2=A0 =C2=A0&quot;&lt;file for the module&gt;:&lt;load memory =
address&gt;:&lt;module compatibility string&gt;&quot;<br>
&gt; &gt; +#<br>
&gt; &gt; +# QB_XEN_DOM0_BOOTARGS :<br>
&gt; &gt; +# A string for specifying Dom0 boot options for the Xen section =
of the device<br>
&gt; &gt; +# tree.<br>
&gt; &gt; +#<br>
&gt; &gt; +# QB_XEN_DTB_TASK_DEPENDS :<br>
&gt; &gt; +# The task dependencies for the DTB generation. A default is pro=
vided.<br>
&gt; &gt; +#<br>
&gt; &gt; +# See also: Other QB_ variables as defined by the qemuboot.bbcla=
ss.<br>
&gt; &gt; +<br>
&gt; &gt; +write_lops_xen_section() {<br>
&gt; &gt; +=C2=A0 =C2=A0 cat &lt;&lt;EOF &gt;&quot;$1&quot;<br>
&gt; &gt; +/dts-v1/;<br>
&gt; &gt; +/ {<br>
&gt; &gt; +=C2=A0 =C2=A0 compatible =3D &quot;system-device-tree-v1&quot;;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 lops {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Connect the Xen console to Qemu d=
tuart */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,code-v1&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code =3D &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chosen =
=3D node.tree[&#39;/chosen&#39;]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout_p=
ath =3D str(chosen[&#39;stdout-path&#39;].value[0])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chosen[&=
#39;xen,xen-bootargs&#39;] =3D \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;console=3Ddtuart dtuart=3D%s&#39; % stdout_path<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return T=
rue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_2 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,modify&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modify =3D &quot;/chos=
en:xen,dom0-bootargs:${QB_XEN_DOM0_BOOTARGS}&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_3 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,modify&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modify =3D &quot;/chos=
en:#address-cells:&lt;1&gt;&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_4 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,modify&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modify =3D &quot;/chos=
en:#size-cells:&lt;1&gt;&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +};<br>
&gt; &gt; +EOF<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +write_lop_add_to_xen_cmdline() {<br>
&gt; &gt; +=C2=A0 =C2=A0 EXTRA_XEN_BOOTARGS=3D&quot;$2&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 cat &lt;&lt;EOF &gt;&quot;$1&quot;<br>
&gt; &gt; +/dts-v1/;<br>
&gt; &gt; +/ {<br>
&gt; &gt; +=C2=A0 =C2=A0 compatible =3D &quot;system-device-tree-v1&quot;;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 lops {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,code-v1&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options =3D &quot;extr=
a_xen_bootargs:${EXTRA_XEN_BOOTARGS}&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 code =3D &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chosen =
=3D node.tree[&#39;/chosen&#39;]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_boot=
args =3D str(chosen[&#39;xen,xen-bootargs&#39;].value)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chosen[&=
#39;xen,xen-bootargs&#39;] =3D &#39;%s %s&#39; % \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(xen_bootargs, extra_xen_bootargs)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return T=
rue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +};<br>
&gt; &gt; +EOF<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +write_lop_add_chosen_module() {<br>
&gt; &gt; +=C2=A0 =C2=A0 ADDR=3D&quot;$2&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 SIZE=3D&quot;$3&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 MODULE_TYPE=3D&quot;$4&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 cat &lt;&lt;EOF &gt;&quot;$1&quot;<br>
&gt; &gt; +/dts-v1/;<br>
&gt; &gt; +/ {<br>
&gt; &gt; +=C2=A0 =C2=A0 compatible =3D &quot;system-device-tree-v1&quot;;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 lops {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lop_1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;s=
ystem-device-tree-v1,lop,add&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_src =3D &quot;mod=
ule@${ADDR}&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_dest =3D &quot;/c=
hosen/module@${ADDR}&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module@${ADDR} {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatib=
le =3D &quot;multiboot,module&quot;, &quot;${MODULE_TYPE}&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D =
&lt;${ADDR} ${SIZE}&gt;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt; +};<br>
&gt; &gt; +EOF<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +generate_xen_qemuboot_dtb() {<br>
&gt; &gt; +=C2=A0 =C2=A0 # First: invoke qemu to generate an initial device=
 tree.<br>
&gt; &gt; +=C2=A0 =C2=A0 # Parameters supplied here inspired by inspection =
of:<br>
&gt; &gt; +=C2=A0 =C2=A0 #=C2=A0 =C2=A0runqemu &quot;${IMAGE_BASENAME}&quot=
; nographic slirp \<br>
&gt; &gt; +=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemupar=
ams=3D&#39;-dtb &quot;&quot; -machine dumpdtb=3D${B}/qemu-dumped.dtb&#39;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 ${QB_SYSTEM_NAME} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device qemu-xhci \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-tablet \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device usb-kbd \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virt,gic-version=3D3 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine virtualization=3Dtrue \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${QB_CPU} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${QB_SMP} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${QB_MEM} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -nographic \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial mon:stdio \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -machine &quot;dumpdtb=3D${B}/qemu-d=
umped.dtb&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 # Lopper generates temporary files in cwd, so run =
it within ${B}<br>
&gt; &gt; +=C2=A0 =C2=A0 cd &quot;${B}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 write_lops_xen_section &quot;${B}/lop-insert-xen-s=
ection.dts&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 write_lop_add_to_xen_cmdline &quot;${B}/lop-xen-cm=
dline.dts&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${QB_XEN_CMDLINE_EXTRA}&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ -z &quot;${QB_XEN_DOMAIN_MODULES}&quot; ]; th=
en<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;No domain modules: plea=
se set QB_XEN_DOMAIN_MODULES&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}<br>
&gt; &gt; +=C2=A0 =C2=A0 do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MODULE_FILE=3D&quot;$(echo ${DOMAIN_=
MODULE} | cut -f1 -d:)&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ADDR=3D&quot;$(echo ${DOMAIN_MODULE}=
 | cut -f2 -d:)&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MODULE_TYPE=3D&quot;$(echo ${DOMAIN_=
MODULE} | cut -f3 -d:)&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RESOLVED_FILE=3D&quot;$(readlink -f =
${MODULE_FILE})&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SIZE=3D$(printf &#39;0x%x\n&#39; $(s=
tat -c &#39;%s&#39; &quot;${RESOLVED_FILE}&quot;))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;x${SIZE}&quot; !=3D &quot;x0=
x0&quot; ] || bbfatal No module: &quot;${MODULE_FILE}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_lop_add_chosen_module &quot;${=
B}/lop-add-module-${ADDR}.dts&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${ADDR}&quot; &q=
uot;${SIZE}&quot; &quot;${MODULE_TYPE}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOP_MODULE_ARGS=3D&quot;${LOP_MODULE=
_ARGS} -i ${B}/lop-add-module-${ADDR}.dts&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 QEMUBOOT_DTB=3D&quot;${IMGDEPLOYDIR}/${QB_DTB}&quo=
t;<br>
&gt; &gt; +=C2=A0 =C2=A0 QEMUBOOT_DTB_LINK=3D&quot;${IMGDEPLOYDIR}/${QB_DTB=
_LINK}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 lopper.py --werror --verbose \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i &quot;${B}/lop-insert-xen-section=
.dts&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i &quot;${B}/lop-xen-cmdline.dts&qu=
ot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LOP_MODULE_ARGS} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -f -o &quot;${QEMUBOOT_DTB}&quot; \<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${B}/qemu-dumped=
.dtb&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 # To assist debugging:<br>
&gt; &gt; +=C2=A0 =C2=A0 dtc -I dtb -O dts -o &quot;${B}/output.dts&quot; &=
quot;${QEMUBOOT_DTB}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ &quot;${QEMUBOOT_DTB_LINK}&quot; !=3D &quot;$=
{QEMUBOOT_DTB}&quot; ] ; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e &quot;${QEMUBOOT_DTB_LINK}&q=
uot; ] ; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm &quot;${QEMUBOOT_DT=
B_LINK}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s &quot;${QB_DTB}&quot; &quot;${=
QEMUBOOT_DTB_LINK}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +do_write_xen_qemuboot_dtb() {<br>
&gt; &gt; +=C2=A0 =C2=A0 # Not all architectures qemuboot with a device tre=
e binary, so check<br>
&gt; &gt; +=C2=A0 =C2=A0 # to see if one is needed. This allows this bbclas=
s file to be used<br>
&gt; &gt; +=C2=A0 =C2=A0 # in the same image recipe for multiple architectu=
res.<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ -n &quot;${QB_DTB}&quot; ] ; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_xen_qemuboot_dtb<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf b=
efore do_image<br>
&gt; &gt; +# Task dependency:<br>
&gt; &gt; +# An expected common case is that the kernel for at least one of=
 the initial<br>
&gt; &gt; +# domains (eg. dom0) is deployed from the virtual/kernel recipe,=
 so<br>
&gt; &gt; +# add virtual/kernel:do_deploy as a task dependency here since t=
he kernel size<br>
&gt; &gt; +# needs to be known for generating the device tree.<br>
&gt; &gt; +# Dependencies are only introduced if a device tree will be gene=
rated.<br>
&gt; &gt; +QB_XEN_DTB_TASK_DEPENDS ?=3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${@[ &#39; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu-helper-native:do_populate_sysro=
ot \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lopper-native:do_populate_sysroot \<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtc-native:do_populate_sysroot \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual/kernel:do_deploy \<br>
&gt; &gt; +=C2=A0 =C2=A0 &#39;, &#39;&#39;][d.getVar(&#39;QB_DTB&#39;) =3D=
=3D &#39;&#39; or d.getVar(&#39;QB_DTB&#39;) is None]} \<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; &gt; +do_write_xen_qemuboot_dtb[depends] =3D &quot;${QB_XEN_DTB_TASK_D=
EPENDS}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +def qemuboot_dtb_vars(d):<br>
&gt; &gt; +=C2=A0 =C2=A0 build_vars =3D [&#39;MACHINE&#39;, &#39;TUNE_ARCH&=
#39;, &#39;DEPLOY_DIR_IMAGE&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;KER=
NEL_IMAGETYPE&#39;, &#39;IMAGE_NAME&#39;, &#39;IMAGE_LINK_NAME&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;STA=
GING_DIR_NATIVE&#39;, &#39;STAGING_BINDIR_NATIVE&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;STA=
GING_DIR_HOST&#39;, &#39;SERIAL_CONSOLES&#39;]<br>
&gt; &gt; +=C2=A0 =C2=A0 return build_vars + [k for k in d.keys() if k.star=
tswith(&#39;QB_&#39;)]<br>
&gt; &gt; +<br>
&gt; &gt; +do_write_qemuboot_dtb[vardeps] +=3D &quot;${@&#39; &#39;.join(qe=
muboot_dtb_vars(d))}&quot;<br>
&gt; &gt; +do_write_qemuboot_dtb[vardepsexclude] +=3D &quot;TOPDIR&quot;<br=
>
&gt; &gt; diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/=
include/meta-virt-xen.inc<br>
&gt; &gt; index 02a7810..2becba1 100644<br>
&gt; &gt; --- a/conf/distro/include/meta-virt-xen.inc<br>
&gt; &gt; +++ b/conf/distro/include/meta-virt-xen.inc<br>
&gt; &gt; @@ -10,3 +10,6 @@ XEN_RPI4_64_CONFIG_PATH ??=3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;dynamic-layers/raspberrypi/conf/distro/i=
nclude/xen-raspberrypi4-64.inc&#39;<br>
&gt; &gt;=C2=A0 include ${@bb.utils.contains(&#39;MACHINE&#39;, &#39;raspbe=
rrypi4-64&#39;, \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;${XEN_RPI4_64_CONFIG_PATH}&#39;, &#39;&#=
39;, d)}<br>
&gt; &gt; +<br>
&gt; &gt; +# Set serial for working qemuboot console<br>
&gt; &gt; +SERIAL_CONSOLES_qemuarm64 ?=3D &quot;115200;ttyAMA0&quot;<br>
&gt; &gt; diff --git a/recipes-extended/images/<a href=3D"http://xen-image-=
minimal.bb" rel=3D"noreferrer" target=3D"_blank">xen-image-minimal.bb</a> b=
/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen-image-minimal.bb</a><br>
&gt; &gt; index 6733801..2175e63 100644<br>
&gt; &gt; --- a/recipes-extended/images/<a href=3D"http://xen-image-minimal=
.bb" rel=3D"noreferrer" target=3D"_blank">xen-image-minimal.bb</a><br>
&gt; &gt; +++ b/recipes-extended/images/<a href=3D"http://xen-image-minimal=
.bb" rel=3D"noreferrer" target=3D"_blank">xen-image-minimal.bb</a><br>
&gt; &gt; @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 =3D &quot;kernel-modu=
le-xen-pciback&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt;<br>
&gt; &gt; -inherit core-image<br>
&gt; &gt; +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_check_xen_state() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if [ &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;xen&#39;, &#39; yes&#39;, &#39;no&#39;, d)}&quot; =3D &q=
uot;no&quot; ]; then<br>
&gt; &gt; @@ -74,10 +74,12 @@ build_syslinux_cfg () {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # Enable runqemu. eg: runqemu xen-image-minimal nographic s=
lirp<br>
&gt; &gt;=C2=A0 WKS_FILE_x86-64 =3D &quot;directdisk-xen.wks&quot;<br>
&gt; &gt; -QB_MEM ?=3D &quot;-m 400&quot;<br>
&gt; &gt; +QB_MEM ?=3D &quot;-m 512&quot;<br>
&gt;<br>
&gt; Since you are bumping the default to 512 here. Do we even need that<br=
>
&gt; qemuarm64 specific override in the bbclass ?<br>
<br>
ack, I don&#39;t think we do.<br>
I think the following works OK: put this into the qemuboot-xen-defaults.bbc=
lass:<br>
<br>
+# Increase the default qemu memory allocation to allow for the hypervisor.=
<br>
+# Use a weak assignment to allow for change of default and override elsewh=
ere.<br>
+QB_MEM_VALUE ??=3D &quot;512&quot;<br>
+QB_MEM =3D &quot;-m ${QB_MEM_VALUE}&quot;<br>
<br>
and then setting QB_MEM at all can be dropped from the<br>
xen-image-minimal recipe (since the default is now fine).<br>
<br>
If an image does need to update the memory setting, it can set QB_MEM_VALUE=
<br>
which has a weak default so is easily overridden. It&#39;s also<br>
MACHINE-agnostic, which is preferable.<br>
<br>
Does that sound OK?<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Yes, sounds good to me!</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Christopher<br>
<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;=C2=A0 QB_DEFAULT_KERNEL ?=3D &quot;none&quot;<br>
&gt; &gt;=C2=A0 QB_DEFAULT_FSTYPE ?=3D &quot;wic&quot;<br>
&gt; &gt; +QB_DEFAULT_FSTYPE_qemux86-64 =3D &quot;wic&quot;<br>
&gt; &gt;=C2=A0 QB_FSINFO ?=3D &quot;wic:kernel-in-fs&quot;<br>
&gt; &gt; +QB_SERIAL_OPT =3D &quot;-serial mon:stdio&quot;<br>
&gt; &gt;=C2=A0 # qemux86-64 machine does not include &#39;wic&#39; in IMAG=
E_FSTYPES, which is needed<br>
&gt; &gt;=C2=A0 # to boot this image, so add it here:<br>
&gt; &gt;=C2=A0 IMAGE_FSTYPES_qemux86-64 +=3D &quot;wic&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000a3448205c81174f0--
