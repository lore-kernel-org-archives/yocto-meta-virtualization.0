Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6921.1598940510231455593
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 23:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08167hCg017156
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Aug 2020 23:08:19 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 31 Aug 2020
 23:08:05 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] criu: backport patch to fix build failure for gcc-10
Date: Mon, 31 Aug 2020 23:08:05 -0700
Message-ID: <20200901060805.43055-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08167hCg017156
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Backport patch to fix build failure for gcc-10.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb           |  1 +
 ...riu-fix-build-failure-against-gcc-10.patch | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 recipes-containers/criu/files/0001-criu-fix-build-fai=
lure-against-gcc-10.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/cri=
u/criu_git.bb
index 704a0f9..24aa301 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/checkpoint-restore/criu.g=
it \
            file://0002-criu-Skip-documentation-install.patch \
            file://0001-criu-Change-libraries-install-directory.patch \
            file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.p=
atch \
+           file://0001-criu-fix-build-failure-against-gcc-10.patch \
           "
=20
 COMPATIBLE_HOST =3D "(x86_64|arm|aarch64).*-linux"
diff --git a/recipes-containers/criu/files/0001-criu-fix-build-failure-ag=
ainst-gcc-10.patch b/recipes-containers/criu/files/0001-criu-fix-build-fa=
ilure-against-gcc-10.patch
new file mode 100644
index 0000000..f1a2561
--- /dev/null
+++ b/recipes-containers/criu/files/0001-criu-fix-build-failure-against-g=
cc-10.patch
@@ -0,0 +1,87 @@
+From c6b9c083ecbd2060c7dc77a9264ef10aafa19063 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 2 Feb 2020 18:45:59 +0000
+Subject: [PATCH] criu: fix build failure against gcc-10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+ld: criu/arch/x86/crtools.o:criu/include/cr_options.h:159:
+  multiple definition of `rpc_cfg_file'; criu/arch/x86/cpu.o:criu/includ=
e/cr_options.h:159: first defined here
+make[2]: *** [scripts/nmk/scripts/build.mk:164: criu/arch/x86/crtools.bu=
ilt-in.o] Error 1
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=3D-fno-common passed explicitly.
+
+Reported-by: Toralf F=C3=B6rster
+Bug: https://bugs.gentoo.org/707942
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+
+Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/pu=
ll/936]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ criu/config.c             | 1 +
+ criu/include/cr_options.h | 2 +-
+ criu/include/pstree.h     | 2 +-
+ criu/include/tun.h        | 2 +-
+ 4 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/criu/config.c b/criu/config.c
+index 39aa071c..009a48a6 100644
+--- a/criu/config.c
++++ b/criu/config.c
+@@ -30,6 +30,7 @@
+ #include "common/xmalloc.h"
+=20
+ struct cr_options opts;
++char *rpc_cfg_file;
+=20
+ static int count_elements(char **to_count)
+ {
+diff --git a/criu/include/cr_options.h b/criu/include/cr_options.h
+index 82f76ad9..9c20aaea 100644
+--- a/criu/include/cr_options.h
++++ b/criu/include/cr_options.h
+@@ -147,7 +147,7 @@ struct cr_options {
+ };
+=20
+ extern struct cr_options opts;
+-char *rpc_cfg_file;
++extern char *rpc_cfg_file;
+=20
+ extern int parse_options(int argc, char **argv, bool *usage_error, bool=
 *has_exec_cmd, int state);
+ extern int check_options();
+diff --git a/criu/include/pstree.h b/criu/include/pstree.h
+index 7303c1fe..61ab0ce0 100644
+--- a/criu/include/pstree.h
++++ b/criu/include/pstree.h
+@@ -42,7 +42,7 @@ enum {
+ };
+ #define FDS_EVENT (1 << FDS_EVENT_BIT)
+=20
+-struct pstree_item *current;
++extern struct pstree_item *current;
+=20
+ struct rst_info;
+ /* See alloc_pstree_item() for details */
+diff --git a/criu/include/tun.h b/criu/include/tun.h
+index ce0b266a..b82c445a 100644
+--- a/criu/include/tun.h
++++ b/criu/include/tun.h
+@@ -5,7 +5,7 @@
+ #define TUN_MINOR	200
+ #endif
+=20
+-struct ns_id *ns;
++extern struct ns_id *ns;
+=20
+ #include <linux/netlink.h>
+=20
--=20
2.21.0

