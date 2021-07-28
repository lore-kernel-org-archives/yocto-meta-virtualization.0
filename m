Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.59.1627430874708789167
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 17:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XMc3pwem;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id b20so577837qkj.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Jul 2021 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d4NWU3JQsmS3NbpShJhGxaK6D2krX4SZucvT7u3QH7k=;
        b=XMc3pwemqpWjYIUb9CiompGJUMIFa4D84rueMOQeOxbjk5IyyFt9K6MnrMnXmndADN
         BqUqo78WvjUg/eq/3YxHQmNxskKYa23GrjlpsILqdvoQ5X1B4Tg8DhUEMwkMr/yw35Da
         dS7jLFtSTxTBA/Q4ixz4ppuTitdoGAq6o5fM+vzJ8F3mWSxSiyiEDk6auR+y2aOkEtlR
         E8CdAh16SSMrdmBs6yPMPiY1rf9+Lz5irFZppp+NRIFVLiOTWBPBGS+Y3dpDJpag8M7t
         Qy1DBvr/AIX8O2A54xR1NWCoErUUi25htiUZ5MkVwclV53h2nBGrkZD8SfOy3z8anQB/
         AvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d4NWU3JQsmS3NbpShJhGxaK6D2krX4SZucvT7u3QH7k=;
        b=ML+mrNtyOJZJTAJwxrfpJZGH6yNRtDl4XPHJGfPzrhjaiYKhpOgvCutSFswwXA9TH7
         ZuD4CsKN3udWR4tgg7bOHps/0c4OtEKlI2d4etU40q1Au+FiXez5ko+B8PPuJoqH19Md
         n6vSFOgrrEnTwqTNjQ4yMzWZ9b1L26Z6hbZChTQftRk8OpuL3tMqby381EsC6zjIw1/0
         EKJxBsHrGiK7dzoo5Qq19bKy5yZ4lABItNIIdb/uKT374JlEJTHBmZpvGsnhYKkVL38q
         PiBJe6x/gxF2lm2YYCTzhSVwfzxgPk1PcBLqptRTrJSv/yKZ2IlPRkVpmaSRnEi50/zl
         3aBg==
X-Gm-Message-State: AOAM533jJ2cMuT0Qe+bj+2+phYCvFI+gn3ho9DJ7/KhjNtIiPwNrhZjE
	+VDJXZb79rOXRt80eg2whU4hpbomFKKOwEMy
X-Google-Smtp-Source: ABdhPJwV/2gZWGwUYfmpWejBRGOE3qERi6TUhO57uiSy31XU5pU8xRGCMJKZ/spdjyBp6Q/JZ6NZrw==
X-Received: by 2002:a05:620a:28c5:: with SMTP id l5mr25444685qkp.130.1627430873704;
        Tue, 27 Jul 2021 17:07:53 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-171-249-110.mycingular.net. [166.171.249.110])
        by smtp.gmail.com with ESMTPSA id j3sm2409559qka.96.2021.07.27.17.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 17:07:53 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Christopher Clark <christopher.clark@starlab.io>,
	bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com,
	scott.davis@starlab.io,
	adam.schwalm@starlab.io
Subject: [meta-virtualization][PATCH v2 2/2] qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
Date: Tue, 27 Jul 2021 17:07:40 -0700
Message-Id: <20210728000740.11070-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728000740.11070-1-christopher.w.clark@gmail.com>
References: <20210728000740.11070-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Clark <christopher.clark@starlab.io>

The Xen hypervisor built for Arm 64-bit targets can be launched with
runqemu by providing a Device Tree binary and configuration for Qemu,
which enables interactive testing of Xen images.

Add qemuboot-xen-dtb.bbclass to add a new bitbake task for generating
the dtb file by using lopper on a device tree produced by Qemu.

Add qemuboot-xen-defaults.bbclass to supply working default parameters
for the qemuarm64 machine and general support for qemuboot for Xen,
and adjust the defaults as needed to boot successfully in testing.

Development aided by this script by Stewart Hildebrand of DornerWorks:
https://gist.github.com/stewdk/110f43e0cc1d905fc6ed4c7e10d8d35e

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
Changes since v1:
* Use the weak default assignment operator on more of the settings
* Set QB_MEM via a new QB_MEM_VALUE variable in the defaults class,
  using the weaker default assignment operator, to enable easier change
  of default and override in an image recipe.
* Drop setting QB_MEM in the xen-image-minimal recipe; use default.

 classes/qemuboot-xen-defaults.bbclass        |  30 +++
 classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc        |   3 +
 recipes-extended/images/xen-image-minimal.bb |   5 +-
 4 files changed, 245 insertions(+), 2 deletions(-)
 create mode 100644 classes/qemuboot-xen-defaults.bbclass
 create mode 100644 classes/qemuboot-xen-dtb.bbclass

diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
new file mode 100644
index 0000000..67751d3
--- /dev/null
+++ b/classes/qemuboot-xen-defaults.bbclass
@@ -0,0 +1,30 @@
+# Set defaults for booting Xen images with qemuboot
+
+# Xen and Dom0 command line options
+QB_XEN_CMDLINE_EXTRA ??= "dom0_mem=192M"
+QB_XEN_DOM0_BOOTARGS ??= \
+    "console=hvc0 earlyprintk clk_ignore_unused root=/dev/vda"
+
+# Launch with one initial domain, dom0, with one boot module, the kernel
+DOM0_KERNEL ??= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
+DOM0_KERNEL_LOAD_ADDR ??= "0x45000000"
+QB_XEN_DOMAIN_MODULES ??= "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,kernel"
+
+# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
+# and the device loader option for the dom0 kernel:
+QB_OPT_APPEND_append_aarch64 = " \
+    -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
+    "
+QB_DEFAULT_KERNEL_aarch64 = "xen-${MACHINE}"
+
+# 64-bit Arm: gic version 3
+QB_MACHINE_aarch64 = "-machine virt,gic-version=3 -machine virtualization=true"
+
+# Increase the default qemu memory allocation to allow for the hypervisor.
+# Use a weak assignment to allow for change of default and override elsewhere.
+QB_MEM_VALUE ??= "512"
+QB_MEM = "-m ${QB_MEM_VALUE}"
+
+# 64-bit Arm: qemuboot with a device tree binary
+QB_DTB_aarch64 = "${IMAGE_NAME}.qemuboot.dtb"
+QB_DTB_LINK_aarch64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
new file mode 100644
index 0000000..08f9b02
--- /dev/null
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -0,0 +1,209 @@
+# Enable booting Xen with qemuboot / runqemu: generate device tree
+#
+# Copyright (c) 2021 Star Lab Corp. All rights reserved.
+#
+# Author: Christopher Clark <christopher.clark@starlab.io>
+
+# Interface variables:
+#
+# QB_DTB : defined in qemuboot.bbclass.
+# If set, this class will generate the specified device tree file.
+#
+# QB_XEN_CMDLINE_EXTRA :
+# A string to be appended to the default Xen hypervisor boot command line,
+# for supplying Xen boot options.
+# The device tree that this bbclass generates will contain Xen command
+# line options to connect the Xen console to the Qemu serial port.
+#
+# QB_XEN_DOMAIN_MODULES :
+# A space-separated list of colon-separated entries:
+#   "<file for the module>:<load memory address>:<module compatibility string>"
+#
+# QB_XEN_DOM0_BOOTARGS :
+# A string for specifying Dom0 boot options for the Xen section of the device
+# tree.
+#
+# QB_XEN_DTB_TASK_DEPENDS :
+# The task dependencies for the DTB generation. A default is provided.
+#
+# See also: Other QB_ variables as defined by the qemuboot.bbclass.
+
+write_lops_xen_section() {
+    cat <<EOF >"$1"
+/dts-v1/;
+/ {
+    compatible = "system-device-tree-v1";
+    lops {
+        /* Connect the Xen console to Qemu dtuart */
+        lop_1 {
+            compatible = "system-device-tree-v1,lop,code-v1";
+            code = "
+                chosen = node.tree['/chosen']
+                stdout_path = str(chosen['stdout-path'].value[0])
+                chosen['xen,xen-bootargs'] = \
+                        'console=dtuart dtuart=%s' % stdout_path
+                return True
+            ";
+        };
+        lop_2 {
+            compatible = "system-device-tree-v1,lop,modify";
+            modify = "/chosen:xen,dom0-bootargs:${QB_XEN_DOM0_BOOTARGS}";
+        };
+        lop_3 {
+            compatible = "system-device-tree-v1,lop,modify";
+            modify = "/chosen:#address-cells:<1>";
+        };
+        lop_4 {
+            compatible = "system-device-tree-v1,lop,modify";
+            modify = "/chosen:#size-cells:<1>";
+        };
+     };
+};
+EOF
+}
+
+write_lop_add_to_xen_cmdline() {
+    EXTRA_XEN_BOOTARGS="$2"
+    cat <<EOF >"$1"
+/dts-v1/;
+/ {
+    compatible = "system-device-tree-v1";
+    lops {
+        lop_1 {
+            compatible = "system-device-tree-v1,lop,code-v1";
+            options = "extra_xen_bootargs:${EXTRA_XEN_BOOTARGS}";
+            code = "
+                chosen = node.tree['/chosen']
+                xen_bootargs = str(chosen['xen,xen-bootargs'].value)
+                chosen['xen,xen-bootargs'] = '%s %s' % \
+                     (xen_bootargs, extra_xen_bootargs)
+                return True
+            ";
+        };
+     };
+};
+EOF
+}
+
+write_lop_add_chosen_module() {
+    ADDR="$2"
+    SIZE="$3"
+    MODULE_TYPE="$4"
+    cat <<EOF >"$1"
+/dts-v1/;
+/ {
+    compatible = "system-device-tree-v1";
+    lops {
+        lop_1 {
+            compatible = "system-device-tree-v1,lop,add";
+            node_src = "module@${ADDR}";
+            node_dest = "/chosen/module@${ADDR}";
+
+            module@${ADDR} {
+                compatible = "multiboot,module", "${MODULE_TYPE}";
+                reg = <${ADDR} ${SIZE}>;
+            };
+        };
+     };
+};
+EOF
+}
+
+generate_xen_qemuboot_dtb() {
+    # First: invoke qemu to generate an initial device tree.
+    # Parameters supplied here inspired by inspection of:
+    #   runqemu "${IMAGE_BASENAME}" nographic slirp \
+    #            qemuparams='-dtb "" -machine dumpdtb=${B}/qemu-dumped.dtb'
+    ${QB_SYSTEM_NAME} \
+        -device qemu-xhci \
+        -device usb-tablet \
+        -device usb-kbd \
+        -machine virt,gic-version=3 \
+        -machine virtualization=true \
+        ${QB_CPU} \
+        ${QB_SMP} \
+        ${QB_MEM} \
+        -nographic \
+        -serial mon:stdio \
+        -machine "dumpdtb=${B}/qemu-dumped.dtb"
+
+    # Lopper generates temporary files in cwd, so run it within ${B}
+    cd "${B}"
+    write_lops_xen_section "${B}/lop-insert-xen-section.dts"
+
+    write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
+        "${QB_XEN_CMDLINE_EXTRA}"
+
+    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
+        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
+    fi
+
+    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
+    do
+        MODULE_FILE="$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
+        ADDR="$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
+        MODULE_TYPE="$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
+        RESOLVED_FILE="$(readlink -f ${MODULE_FILE})"
+        SIZE=$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
+        [ "x${SIZE}" != "x0x0" ] || bbfatal No module: "${MODULE_FILE}"
+        write_lop_add_chosen_module "${B}/lop-add-module-${ADDR}.dts" \
+            "${ADDR}" "${SIZE}" "${MODULE_TYPE}"
+        LOP_MODULE_ARGS="${LOP_MODULE_ARGS} -i ${B}/lop-add-module-${ADDR}.dts"
+    done
+
+    QEMUBOOT_DTB="${IMGDEPLOYDIR}/${QB_DTB}"
+    QEMUBOOT_DTB_LINK="${IMGDEPLOYDIR}/${QB_DTB_LINK}"
+
+    lopper.py --werror --verbose \
+        -i "${B}/lop-insert-xen-section.dts" \
+        -i "${B}/lop-xen-cmdline.dts" \
+        ${LOP_MODULE_ARGS} \
+        -f -o "${QEMUBOOT_DTB}" \
+            "${B}/qemu-dumped.dtb"
+
+    # To assist debugging:
+    dtc -I dtb -O dts -o "${B}/output.dts" "${QEMUBOOT_DTB}"
+
+    if [ "${QEMUBOOT_DTB_LINK}" != "${QEMUBOOT_DTB}" ] ; then
+        if [ -e "${QEMUBOOT_DTB_LINK}" ] ; then
+            rm "${QEMUBOOT_DTB_LINK}"
+        fi
+        ln -s "${QB_DTB}" "${QEMUBOOT_DTB_LINK}"
+    fi
+}
+
+do_write_xen_qemuboot_dtb() {
+    # Not all architectures qemuboot with a device tree binary, so check
+    # to see if one is needed. This allows this bbclass file to be used
+    # in the same image recipe for multiple architectures.
+    if [ -n "${QB_DTB}" ] ; then
+        generate_xen_qemuboot_dtb
+    fi
+}
+
+addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf before do_image
+# Task dependency:
+# An expected common case is that the kernel for at least one of the initial
+# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
+# add virtual/kernel:do_deploy as a task dependency here since the kernel size
+# needs to be known for generating the device tree.
+# Dependencies are only introduced if a device tree will be generated.
+QB_XEN_DTB_TASK_DEPENDS ?= " \
+    ${@[ ' \
+        qemu-helper-native:do_populate_sysroot \
+        lopper-native:do_populate_sysroot \
+        dtc-native:do_populate_sysroot \
+        virtual/kernel:do_deploy \
+    ', ''][d.getVar('QB_DTB') == '' or d.getVar('QB_DTB') is None]} \
+    "
+do_write_xen_qemuboot_dtb[depends] = "${QB_XEN_DTB_TASK_DEPENDS}"
+
+def qemuboot_dtb_vars(d):
+    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
+                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
+                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
+    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
+
+do_write_qemuboot_dtb[vardeps] += "${@' '.join(qemuboot_dtb_vars(d))}"
+do_write_qemuboot_dtb[vardepsexclude] += "TOPDIR"
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 02a7810..2becba1 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -10,3 +10,6 @@ XEN_RPI4_64_CONFIG_PATH ??= \
     'dynamic-layers/raspberrypi/conf/distro/include/xen-raspberrypi4-64.inc'
 include ${@bb.utils.contains('MACHINE', 'raspberrypi4-64', \
     '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
+
+# Set serial for working qemuboot console
+SERIAL_CONSOLES_qemuarm64 ?= "115200;ttyAMA0"
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 6733801..ca6d268 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
 
 do_check_xen_state() {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)}" = "no" ]; then
@@ -74,10 +74,11 @@ build_syslinux_cfg () {
 
 # Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
 WKS_FILE_x86-64 = "directdisk-xen.wks"
-QB_MEM ?= "-m 400"
 QB_DEFAULT_KERNEL ?= "none"
 QB_DEFAULT_FSTYPE ?= "wic"
+QB_DEFAULT_FSTYPE_qemux86-64 = "wic"
 QB_FSINFO ?= "wic:kernel-in-fs"
+QB_SERIAL_OPT = "-serial mon:stdio"
 # qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
 # to boot this image, so add it here:
 IMAGE_FSTYPES_qemux86-64 += "wic"
-- 
2.25.1

