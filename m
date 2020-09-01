Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6448.1598938014556195836
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 22:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0815QX2o015356
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Aug 2020 22:26:43 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 31 Aug 2020
 22:26:22 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] glusterfs: backport patch to fix failure for gcc-10
Date: Mon, 31 Aug 2020 22:26:22 -0700
Message-ID: <20200901052622.98891-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...fns-of-cli_default_conn_timeout-and-.patch | 106 ++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch

diff --git a/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch b/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch
new file mode 100644
index 00000000..79a55b33
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch
@@ -0,0 +1,106 @@
+From f66bd85af09397300ad434655fc68861f48c2e3c Mon Sep 17 00:00:00 2001
+From: "Kaleb S. KEITHLEY" <kkeithle@redhat.com>
+Date: Thu, 2 Jan 2020 07:46:23 -0500
+Subject: [PATCH] cli: duplicate defns of cli_default_conn_timeout and
+ cli_ten_minutes_timeout
+
+Winter is coming. So is gcc-10.
+
+Compiling with gcc-10-20191219 snapshot reveals dupe defns of
+cli_default_conn_timeout and cli_ten_minutes_timeout in
+.../cli/src/cli.[ch] due to missing extern decl.
+
+There are many changes coming in gcc-10 described in
+https://gcc.gnu.org/gcc-10/changes.html
+
+compiling cli.c with gcc-9 we see:
+   ...
+        .quad   .LC88
+        .comm   cli_ten_minutes_timeout,4,4
+        .comm   cli_default_conn_timeout,4,4
+        .text
+   .Letext0:
+   ...
+
+and with gcc-10:
+   ...
+        .quad   .LC88
+        .globl  cli_ten_minutes_timeout
+        .bss
+        .align 4
+        .type   cli_ten_minutes_timeout, @object
+        .size   cli_ten_minutes_timeout, 4
+   cli_ten_minutes_timeout:
+        .zero   4
+        .globl  cli_default_conn_timeout
+        .align 4
+        .type   cli_default_conn_timeout, @object
+        .size   cli_default_conn_timeout, 4
+   cli_default_conn_timeout:
+        .zero   4
+        .text
+   .Letext0:
+   ...
+
+which is reflected in the .o file as (gcc-9):
+...
+0000000000000004 C cli_ten_minutes_timeout
+0000000000000004 C cli_default_conn_timeout
+...
+
+and (gcc-10):
+...
+0000000000000020 B cli_ten_minutes_timeout
+0000000000000024 B cli_default_conn_timeout
+...
+
+See nm(1) and ld(1) for a description C (common) and B (BSS) and how
+they are treated by the linker.
+
+Note: there is still a small chance that gcc-10 will land in Fedora-32,
+despite 31 Dec. 2019 having been the deadline for that to happen.
+
+Change-Id: I54ea485736a4910254eeb21222ad263721cdef3c
+Fixes: bz#1193929
+Signed-off-by: Kaleb S. KEITHLEY <kkeithle@redhat.com>
+
+Upstream-Status: Backport [https://review.gluster.org/#/c/glusterfs/+/23956/]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ cli/src/cli.c | 3 +++
+ cli/src/cli.h | 4 ++--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/cli/src/cli.c b/cli/src/cli.c
+index cb425c84b..2c96b7ae6 100644
+--- a/cli/src/cli.c
++++ b/cli/src/cli.c
+@@ -84,6 +84,9 @@ rpc_clnt_prog_t *cli_rpc_prog;
+ 
+ extern struct rpc_clnt_program cli_prog;
+ 
++int cli_default_conn_timeout = 120;
++int cli_ten_minutes_timeout = 600;
++
+ static int
+ glusterfs_ctx_defaults_init(glusterfs_ctx_t *ctx)
+ {
+diff --git a/cli/src/cli.h b/cli/src/cli.h
+index 81f75a0b4..cd4db3dac 100644
+--- a/cli/src/cli.h
++++ b/cli/src/cli.h
+@@ -40,8 +40,8 @@ enum argp_option_keys {
+     ARGP_PORT_KEY = 'p',
+ };
+ 
+-int cli_default_conn_timeout;
+-int cli_ten_minutes_timeout;
++extern int cli_default_conn_timeout;
++extern int cli_ten_minutes_timeout;
+ 
+ typedef enum {
+     COLD_BRICK_COUNT,
+-- 
+2.21.0
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index c209baa6..91fc1c61 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -19,6 +19,7 @@ SRC_URI += "file://glusterd.init \
             file://libglusterfs-Don-t-link-against-libfl.patch \
             file://glusterd-change-port-range.patch \
             file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
+            file://0001-cli-duplicate-defns-of-cli_default_conn_timeout-and-.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.21.0

