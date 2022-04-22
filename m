Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA97DC43219
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.752.1650649579064416146
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 10:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NvBdERTB;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id k4so854368plk.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXWiagl5oqrTjZF4s6/Llv7qqXevY30qVrM/LLlDKsU=;
        b=NvBdERTBgpJa8xjPLxGIjBoJGXGS0ZRL3FAo9V1eF6jyp9NuGbmSQN9RbcQ7c4BCl4
         vS74EPkmtxTHbxtx+V84T1xgBn3x0d/twUUl6+kjIdsN9xfZG/gvMosoTuFOlqrX5eeR
         BXx6uWDHt2F2Tpp9woj9BTtrhkM8pVq7rYOQG0n/8KxYGYTSV7ttX5XLvBlkOKVywtqQ
         1MdlAi+yRwhUTKC8hPBHvP9PbAamCACN9gcCCqz+iCwhrznpR447QuQiMc8pYFU6GNSU
         tkFOF8dSk8tf8Ga9cKi2HZQGpC7J9uMnYLOnjWY4pTy/o9kKZNh192uMaOZ0xh4lS2Kf
         VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=YXWiagl5oqrTjZF4s6/Llv7qqXevY30qVrM/LLlDKsU=;
        b=c0JAYB49XYGBinD460ln56ZP800TBjKsG26lPyyL2NEGiDBFuIfmqCg7xYKMjYg8Jm
         tUHsMCoG/FJrDijTasWgs/yexquYl0XiRYsOvjPr1iXQt41fHw9axbysCwRcGzjfBh63
         ul074B5tNiUGkL8U37OaUhqHQ1Oj17dBLZnEphFjo/TmtOXmm2RwDWkT0GDIRaIeOz5n
         r47wCC0oWgLneWi3xq91xeOFlESeUjtNbUVOpg65uyIxaWkmazdBKme94VRBrl27Q8JS
         ZaQ8uKfzo9cUIHnQP517GSrifiWot2AAYdFAu3pWTGZm+lOZFUICdSig38ngnV8HGAu7
         Wslg==
X-Gm-Message-State: AOAM530AUzZFlDh5gKOEo57x02bRArgxbB5h8cg/5fMqSzwWK2vT7ned
	p0YIHEiTAqROq05LtHXErZfI3jtCR5diBA==
X-Google-Smtp-Source: 
 ABdhPJwQDWzUuZgBJ3MJLUgsnA1hRWiSl/p6/OKaWGwYvZ/JFm9f0ea32SV9JuDGxIUx6Fnz1zU3rQ==
X-Received: by 2002:a17:90b:1b52:b0:1d2:fe86:aabd with SMTP id
 nv18-20020a17090b1b5200b001d2fe86aabdmr17437602pjb.76.1650649578311;
        Fri, 22 Apr 2022 10:46:18 -0700 (PDT)
Received: from cog-dev.ice.pyrology.org ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm2708107pgl.45.2022.04.22.10.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 10:46:17 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Christopher Clark <christopher.clark@starlab.io>,
	bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	Bertrand.Marquis@arm.com,
	diego.sueiro@arm.com,
	jdmason@kudzu.us,
	dpsmith@apertussolutions.com,
	scott.davis@starlab.io
Subject: [meta-virtualization][PATCH] qemuboot,
 xen-image-minimal: enable runqemu for qemuarm Xen images
Date: Fri, 22 Apr 2022 10:46:10 -0700
Message-Id: <20220422174610.58059-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 19:12:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7213

From: Christopher Clark <christopher.clark@starlab.io>

The Xen hypervisor built for Arm 32-bit targets can be launched with
runqemu by providing a u-boot script and configuration for Qemu,
which enables interactive testing of Xen images.

Add qemuboot-xen-u-boot.bbclass to add a new bitbake task for generating
the u-boot script.

Update qemuboot-xen-defaults.bbclass to supply working default parameters
for the qemuarm machine needed to boot successfully in testing.

Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
---
 classes/qemuboot-xen-defaults.bbclass        |  16 +++
 classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc        |   1 +
 recipes-extended/images/xen-image-minimal.bb |   2 +-
 4 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 classes/qemuboot-xen-u-boot.bbclass

diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
index c7e74c3..1190f29 100644
--- a/classes/qemuboot-xen-defaults.bbclass
+++ b/classes/qemuboot-xen-defaults.bbclass
@@ -10,6 +10,17 @@ DOM0_KERNEL ??= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
 DOM0_KERNEL_LOAD_ADDR ??= "0x45000000"
 QB_XEN_DOMAIN_MODULES ??= "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,kernel"
 
+# Qemuboot for 32-bit Arm loads Xen via device loader parameter rather than
+# kernel and boots using u-boot as bios
+XEN_BINARY ??= "${DEPLOY_DIR_IMAGE}/xen-${MACHINE}"
+QB_XEN_LOAD_ADDR ??= "0x46000000"
+QB_OPT_APPEND:append:arm = " \
+    -device loader,file=${XEN_BINARY},addr=${QB_XEN_LOAD_ADDR},force-raw=on \
+    -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
+    -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin \
+    "
+QB_DEFAULT_KERNEL:arm = "none"
+
 # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
 # and the device loader option for the dom0 kernel:
 QB_OPT_APPEND:append:aarch64 = " \
@@ -17,6 +28,8 @@ QB_OPT_APPEND:append:aarch64 = " \
     "
 QB_DEFAULT_KERNEL:aarch64 = "xen-${MACHINE}"
 
+# 32-bit Arm: gic version 2
+QB_MACHINE:arm = "-machine virt -machine virtualization=true"
 # 64-bit Arm: gic version 3
 QB_MACHINE:aarch64 = "-machine virt,gic-version=3 -machine virtualization=true"
 
@@ -25,6 +38,9 @@ QB_MACHINE:aarch64 = "-machine virt,gic-version=3 -machine virtualization=true"
 QB_MEM_VALUE ??= "512"
 QB_MEM = "-m ${QB_MEM_VALUE}"
 
+# 32-bit Arm: qemuboot with a u-boot script image
+QB_XEN_U_BOOT_SCR:arm = "boot.scr.uimg"
+
 # 64-bit Arm: qemuboot with a device tree binary
 QB_DTB:aarch64 = "${IMAGE_NAME}.qemuboot.dtb"
 QB_DTB_LINK:aarch64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
diff --git a/classes/qemuboot-xen-u-boot.bbclass b/classes/qemuboot-xen-u-boot.bbclass
new file mode 100644
index 0000000..3767c09
--- /dev/null
+++ b/classes/qemuboot-xen-u-boot.bbclass
@@ -0,0 +1,128 @@
+# Enable booting Xen with qemuboot / runqemu: u-boot configuration
+#
+# Copyright (c) 2021-2022 Star Lab Corp. All rights reserved.
+#
+# Author: Christopher Clark <christopher.clark@starlab.io>
+
+# Interface variables:
+#
+# QB_XEN_U_BOOT_SCR :
+# If this variable is set, this class will generate the u-boot script image file.
+# It must be set to the name of the compiled command file that u-boot will tftp
+# from the image deploy directory during boot, currently: "boot.scr.uimg"
+#
+# QB_XEN_CMDLINE_EXTRA :
+# A string to be appended to the default Xen hypervisor boot command line,
+# for supplying Xen boot options.
+# The device tree that this bbclass generates will contain Xen command
+# line options to connect the Xen console to the Qemu serial port.
+#
+# QB_XEN_LOAD_ADDR :
+# The hypervisor load address
+#
+# QB_XEN_DOM0_BOOTARGS :
+# A string for specifying Dom0 boot options for the Xen section of the device
+# tree.
+#
+# QB_XEN_UBOOT_SCR_TASK_DEPENDS:
+# The task dependencies for the u-boot script generation. A default is provided.
+#
+# QB_XEN_DOMAIN_MODULES:
+# A space-separated list of colon-separated entries:
+#   "<file for the module>:<load memory address>:<module compatibility string>"
+
+# Set the default value for this variable to empty: no file generated.
+QB_XEN_U_BOOT_SCR ??= ""
+
+write_add_chosen_module() {
+    CMD_FILE="$1"
+    ADDR="$2"
+    SIZE="$3"
+    MODULE_TYPE="$4"
+    cat <<EOF >>"${CMD_FILE}"
+fdt mknod /chosen module@${ADDR}
+fdt set /chosen/module@${ADDR} compatible "multiboot,module" "${MODULE_TYPE}"
+fdt set /chosen/module@${ADDR} reg <${ADDR} ${SIZE}>
+EOF
+}
+
+generate_xen_u_boot_conf() {
+    CMD_FILE="${B}/qemuboot-xen.cmd"
+    cat <<EOF >"${CMD_FILE}"
+echo "Running u-boot launch script"
+fdt addr 0x40000000
+fdt resize
+echo "Device tree resized"
+
+fdt set /chosen \#address-cells <1>
+fdt set /chosen \#size-cells <1>
+
+fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=/pl011@9000000 ${QB_XEN_CMDLINE_EXTRA}"
+fdt set /chosen xen,dom0-bootargs "${QB_XEN_DOM0_BOOTARGS}"
+EOF
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
+        write_add_chosen_module "${CMD_FILE}" "${ADDR}" "${SIZE}" "${MODULE_TYPE}"
+    done
+
+    cat <<EOF >>"${CMD_FILE}"
+fdt print /chosen
+
+echo Boot Xen
+bootz ${QB_XEN_LOAD_ADDR} - 0x40000000
+EOF
+
+    uboot-mkimage -A "${UBOOT_ARCH}" -T script -C none \
+                  -a 0x20000 -e 0x20000 \
+                  -d "${CMD_FILE}" "${CMD_FILE}.uimg"
+
+    # u-boot tftps this filename from DEPLOY_DIR_IMAGE:
+    install -m 0644 "${CMD_FILE}.uimg" "${DEPLOY_DIR_IMAGE}/${QB_XEN_U_BOOT_SCR}"
+}
+
+do_write_qemuboot_xen_u_boot_conf() {
+    # Not all architectures qemuboot with u-boot, so check to see if this
+    # is needed. This allows this bbclass file to be used in the same image
+    # recipe for multiple architectures.
+
+    if [ -n "${QB_XEN_U_BOOT_SCR}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
+        generate_xen_u_boot_conf
+    fi
+}
+
+addtask do_write_qemuboot_xen_u_boot_conf after do_write_qemuboot_conf before do_image
+# Task dependency:
+# An expected common case is that the kernel for at least one of the initial
+# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
+# add that as a task dependency here since the kernel size needs to be known
+# for generating the device tree.
+# Dependencies are only introduced if a device tree will be generated.
+QB_XEN_UBOOT_SCR_TASK_DEPENDS ?= " \
+    ${@[ ' \
+        u-boot-tools-native:do_populate_sysroot \
+        u-boot:do_deploy \
+        virtual/kernel:do_deploy \
+    ', ''][d.getVar('QB_XEN_U_BOOT_SCR') == '']} \
+    "
+do_write_qemuboot_xen_u_boot_conf[depends] = "${QB_XEN_UBOOT_SCR_TASK_DEPENDS}"
+
+def qemuboot_xen_u_boot_vars(d):
+    build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
+                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
+                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
+    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
+
+do_write_qemuboot_xen_u_boot[vardeps] += "${@' '.join(qemuboot_xen_u_boot_vars(d))}"
+do_write_qemuboot_xen_u_boot[vardepsexclude] += "TOPDIR"
diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 5fbb57f..0bfcf59 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -13,3 +13,4 @@ include ${@bb.utils.contains('MACHINE', 'raspberrypi4-64', \
 
 # Set serial for working qemuboot console
 SERIAL_CONSOLES:qemuarm64 ?= "115200;ttyAMA0"
+SERIAL_CONSOLES:qemuarm ?= "115200;ttyAMA0"
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index f6fa5ed..6277614 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -34,7 +34,7 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 = "kernel-module-xen-acpi-processor"
 
 LICENSE = "MIT"
 
-inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network
+inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testimage-network qemuboot-xen-u-boot
 
 do_check_xen_state() {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)}" = "no" ]; then
-- 
2.20.1


