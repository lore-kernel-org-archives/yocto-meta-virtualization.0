Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4273.1585639049551310209
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 00:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02V7H8Aj013149
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Mar 2020 00:17:18 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:16:57 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <hongxu.jia@windriver.com>
Subject: [meta-virtualization][PATCH] libvirt: Workaround mips assembler crash on target
Date: Tue, 31 Mar 2020 15:16:55 +0800
Message-ID: <1585639015-39281-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

While enabling multilib on qemumips64, lib32 assembler ends up
crashing on target sometimes due to branch out of range,
therefore using -O2 for now

[snip]
|../../libvirt-6.1.0/tests/qemuxml2argvtest.c: In function 'mymain':
|../../libvirt-6.1.0/tests/qemuxml2argvtest.c:608:1: note: variable
tracking size limit exceeded with '-fvar-tracking-assignments', retrying without
|  608 | mymain(void)
|      | ^~~~~~
|/tmp/ccXJSwZR.s: Assembler messages:
|/tmp/ccXJSwZR.s:43943: Error: branch out of range
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/libvirt/libvirt_6.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index 0ad3d8b..44354a4 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -375,6 +375,11 @@ EXTRA_OECONF += " \
     --with-test-suite \
     "
 
+# gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
+# crashes on target, so remove -Og and use -O2 as workaround
+SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch = "-Og"
+SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch = " -O2"
+
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
 
 PRIVATE_LIBS_${PN}-ptest_append = "libvirt-admin.so.0"
-- 
2.7.4

