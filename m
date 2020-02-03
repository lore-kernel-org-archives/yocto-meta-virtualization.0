Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by mx.groups.io with SMTP id smtpd.web11.5304.1580767013852819697
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 13:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=VAK60h4w;
 spf=pass (domain: wdc.com, ip: 216.71.153.141, mailfrom: prvs=295d894e0=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1580767014; x=1612303014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ogbxo3rXeEHQQCzQdCK3tKGhf+Y5cr1GiVEKeoGNO3M=;
  b=VAK60h4wjycfwQgsca/eAph+id1fh20hVmxC8A/z2JubVhwzJLqOb4J/
   zbDijkSOe3wVUxTexlYfEL8YuL4E1IsAsFcsJPDO3dDaatyXTrOsNSimR
   xY8M+gwtkTIZP52HEklLc9Fx++dEEKchykRfsrFDnMUAHPS+iswG9z44H
   IxqD+AXajxVUzquhSMVIsIv/ddY1/T1r35TjqzKAHhMnoXoaXZHB0RXXU
   vzRecFVOi89BOn2MDPFPvI56JK0PV2twfKxX/mqNOlRdLR7ELuhEw9olW
   IWNyqvIAhr7l9tzhUG9DmpLOBm2V7s4zyhxFrMkbyn72iMeiC/zGkYKeZ
   w==;
IronPort-SDR: DO/CVlPRqvba/ZhjTA2i7Djfvj2ebXa+dqvpoADjaAR/7H0cyk6BwSGMewU2mvhDDNK+N6JNCz
 llhKDuUiTIEv1SlddgpaIMMA1Teb5tzYyDD9zPo8ezYsV7/HD1BQtehYoAXbCU3eVBQ1eM0y6q
 L27Q9Aj7ZjiQ8onYuvoksQ6lvwEGwf52WeWbQMQaNIsIqNaVgff5b+eEB4bYHJtOZX93v6747X
 HrQA7mn0MCurK13+RZOpYx7R2rznTbL9NgqMg/h0Z95IUmEH/+/xgGlH+VkxU5gSpHDyQJe8kp
 A9w=
X-IronPort-AV: E=Sophos;i="5.70,398,1574092800"; 
   d="scan'208";a="133365023"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2020 05:56:54 +0800
IronPort-SDR: X6RI5U7bXOFX+vZ+clrWAxaKiWytPSl/mfzZ46CT7DRJCbsmr1JtjswKqI3+hZAjGKMEfH1Iob
 h4aUQ6K7ZAe727leJbflAwvc3Dy1VmtKyTWdfWcuD9meiJ/mVehCQOniW/1Kf7UcWI4N0FlO35
 FIG9J+573ITNiOjrb5wfFwVBUOZXS0chQ4suoWti12tPxY58YQd+qt+qKx9RunGkj/7MQHlibi
 S4VX6ZCjEzS1KnoDtd3lRh1Fq7+VI6Pwc0iGnAUENpR3ghilfck9uH5zLV8eOgNXQCcf6p0QOX
 9g+vkVkbF3aHtZWSEvEKkeeL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2020 13:49:57 -0800
IronPort-SDR: NIcLjAt/ybH7R2m/HBRsVOWmIm8rkh1Y/O+OvaNF3K3L7I61x/klOf8sfC1yUwTmBnfhvd1GY5
 JUHlBu3/Xz1biD9wHQ7NWhmobAxtK839UzbJoVlyBf8ZzcFjwk8xwwyoW7+G6tRhGqExIEqQCh
 B7vfFCFUuT6KFxgbGIpiEjnBL+yqfFKxdoWRRi5NybZgGjnL8BIw3E9fMq/arITPQO/8Hs385N
 EuuOcxJWTgdt/6N6CkZXoyW7KPamzwT45FPhg93k3ZADRYXOSO5zgGbN0G9VUApqGYW7WwAhHT
 s9g=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.158.235])
  by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2020 13:56:53 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-virtualization][PATCH] xvisor: Initial commit of Xvisor Hypervisor
Date: Mon,  3 Feb 2020 13:50:10 -0800
Message-Id: <20200203215011.6642-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds support for building the baremetal Xvisor Hypervisor.

I have only tested this with RISC-V so currently only RISC-V is marked
as a COMPATIBLE_HOST, although Xvisor does support multiple other
architectures.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...n-t-specify-mabi-or-march-for-RISC-V.patch | 34 ++++++++++++++
 recipes-extended/xvisor/xvisor-configs.inc    | 25 +++++++++++
 recipes-extended/xvisor/xvisor_0.3.0.bb       | 44 +++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
 create mode 100644 recipes-extended/xvisor/xvisor-configs.inc
 create mode 100644 recipes-extended/xvisor/xvisor_0.3.0.bb

diff --git a/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
new file mode 100644
index 0000000..2e53943
--- /dev/null
+++ b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
@@ -0,0 +1,34 @@
+From 022c885d077dce6fad3eca5fd2f54b2070c375d2 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 17 May 2019 14:21:44 -0700
+Subject: [PATCH] TESTS: Don't specify mabi or march for RISC-V
+
+To avoid
+    can't link double-float modules with soft-float modules
+errors when building 32-bit baremetal guests don't specify mabi
+or march.
+
+Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ tests/riscv/common/basic/Makefile.inc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/riscv/common/basic/Makefile.inc b/tests/riscv/common/basic/Makefile.inc
+index 9fa5abed..f3ff1864 100644
+--- a/tests/riscv/common/basic/Makefile.inc
++++ b/tests/riscv/common/basic/Makefile.inc
+@@ -24,8 +24,8 @@
+ ARCH_CPPFLAGS=$(board_cppflags) -DFIRMWARE_BOOT
+ ARCH_CPPFLAGS+=-DTEXT_START=$(board_text_start)
+ ifeq ($(board_32bit),y)
+-ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=ilp32 -march=rv32imafdc -mcmodel=medany
+-ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=ilp32 -march=rv32imafdc -mcmodel=medany
++ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mcmodel=medany
++ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mcmodel=medany
+ else
+ ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=lp64 -march=rv64imafdc -mcmodel=medany
+ ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=lp64 -march=rv64imafdc -mcmodel=medany
+-- 
+2.21.0
+
diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
new file mode 100644
index 0000000..099128d
--- /dev/null
+++ b/recipes-extended/xvisor/xvisor-configs.inc
@@ -0,0 +1,25 @@
+def get_oemake_config(d):
+    plat = d.getVar('XVISOR_PLAT')
+
+    if plat is None:
+        return ""
+
+    if 'riscv/virt32' in plat:
+        return "generic-32b-defconfig"
+    if 'riscv/virt64' in plat:
+        return "generic-64b-defconfig"
+
+    return ""
+
+def map_xvisor_arch(a, d):
+    import re
+
+    if   re.match('(i.86|x86.64)$', a):  return 'x86'
+    elif re.match('armeb$', a):                 return 'arm'
+    elif re.match('aarch64$', a):               return 'arm'
+    elif re.match('aarch64_be$', a):            return 'arm'
+    elif re.match('aarch64_ilp32$', a):         return 'arm'
+    elif re.match('aarch64_be_ilp32$', a):      return 'arm'
+    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
+    else:
+        bb.error("cannot map '%s' to a Xvisor architecture" % a)
diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extended/xvisor/xvisor_0.3.0.bb
new file mode 100644
index 0000000..66ad618
--- /dev/null
+++ b/recipes-extended/xvisor/xvisor_0.3.0.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Xvisor is an open-source type-1 hypervisor, which aims at providing a monolithic, light-weight, portable, and flexible virtualization solution."
+DESCRIPTION = "Xvisor primarily supports Full virtualization hence, supports a wide range of unmodified guest operating systems. Paravirtualization is optional for Xvisor and will be supported in an architecture independent manner (such as VirtIO PCI/MMIO devices) to ensure no-change in guest OS for using paravirtualization."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS += "dtc-native dosfstools-native mtools-native"
+
+require xvisor-configs.inc
+
+inherit autotools-brokensep
+
+SRCREV = "58592ef18c71526a0045935d1e8eed5e8553b7d6"
+SRC_URI = "git://github.com/xvisor/xvisor.git \
+           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += "ARCH=\"${@map_xvisor_arch(d.getVar('TARGET_ARCH'), d)}\" I=${D}"
+
+CONFIG = "${@get_oemake_config(d)}"
+
+do_configure() {
+    oe_runmake ${CONFIG}
+}
+
+do_install_append() {
+    install -d ${D}
+    install -m 755 ${B}/build/vmm.* ${D}/
+
+    # We don't need this
+    rm ${D}/system.map
+}
+
+do_deploy () {
+    install -d ${DEPLOY_DIR_IMAGE}
+    install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
+}
+
+addtask deploy after do_install
+
+FILES_${PN} += "/vmm.*"
+
+COMPATIBLE_HOST = "(riscv64|riscv32).*"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
2.25.0

