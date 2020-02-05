Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2952.1580880662744135595
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 21:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0155UfV8003500
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 4 Feb 2020 21:30:51 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.468.0; Tue, 4 Feb 2020
 21:30:30 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] openvswitch: backport patch to fix do_compile failure
Date: Tue, 4 Feb 2020 21:30:30 -0800
Message-ID: <20200205053030.32955-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport a patch to fix do_compile error like below.

  RuntimeError: dictionary keys changed during iteration

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ....in-fix-dict-change-during-iteration.patch | 45 +++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch

diff --git a/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
new file mode 100644
index 0000000..ecc2881
--- /dev/null
+++ b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
@@ -0,0 +1,45 @@
+From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
+From: Flavio Leitner <fbl@sysclose.org>
+Date: Sat, 14 Sep 2019 20:17:28 -0300
+Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
+
+Python3 complains if a dict key is changed during the
+iteration.
+
+Use list() to create a copy of it.
+
+Traceback (most recent call last):
+  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
+    func(*args[1:])
+  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
+    replace_cplusplus_keyword(schema)
+  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
+    for columnName in table.columns:
+RuntimeError: dictionary keys changed during iteration
+
+Signed-off-by: Flavio Leitner <fbl@sysclose.org>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+
+Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/d84109f0b60096ce71cd0537b31b69a7f5ea8756]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ ovsdb/ovsdb-idlc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 40fef39ed..22d0a4e22 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
+                 'wchar_t', 'while', 'xor', 'xor_eq'}
+ 
+     for tableName, table in schema.tables.items():
+-        for columnName in table.columns:
++        for columnName in list(table.columns):
+             if columnName in keywords:
+                 table.columns[columnName + '_'] = table.columns.pop(columnName)
+ 
+-- 
+2.21.0
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 072d7f1..fc8777a 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
+           file://0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.21.0

