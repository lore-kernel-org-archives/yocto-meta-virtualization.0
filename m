Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AF6EE00D01; Thu,  3 Sep 2015 13:00:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33F6CE00B04
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Sep 2015 13:00:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t83K0D0K002977
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 3 Sep 2015 13:00:14 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 3 Sep 2015 13:00:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 3 Sep 2015 16:00:12 -0400
Message-ID: <1441310412-7383-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] bbappend: switch to use a wildcard beyond major version
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Sep 2015 20:00:17 -0000
Content-Type: text/plain

Using a wildcard will simplify things when using meta-virtualization
against different yocto or oe branches and prevent having to make
future updates to keep in step with package uprevs.

The changes found within these bbappend tend to be generic and
non-version specific, thus safe for 'porting' via wildcard.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-core/base-files/base-files_3.%.bbappend         |  5 +++++
 recipes-core/base-files/base-files_3.0.14.bbappend      |  5 -----
 recipes-core/initscripts/initscripts_1.%.bbappend       | 16 ++++++++++++++++
 recipes-core/initscripts/initscripts_1.0.bbappend       | 16 ----------------
 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend     |  6 ++++++
 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |  6 ------
 recipes-devtools/python/python_2.%.bbappend             |  8 ++++++++
 recipes-devtools/python/python_2.7.9.bbappend           |  8 --------
 recipes-extended/iptables/iptables_1.%.bbappend         |  8 ++++++++
 recipes-extended/iptables/iptables_1.4.21.bbappend      |  8 --------
 10 files changed, 43 insertions(+), 43 deletions(-)
 create mode 100644 recipes-core/base-files/base-files_3.%.bbappend
 delete mode 100644 recipes-core/base-files/base-files_3.0.14.bbappend
 create mode 100644 recipes-core/initscripts/initscripts_1.%.bbappend
 delete mode 100644 recipes-core/initscripts/initscripts_1.0.bbappend
 create mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
 delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
 create mode 100644 recipes-devtools/python/python_2.%.bbappend
 delete mode 100644 recipes-devtools/python/python_2.7.9.bbappend
 create mode 100644 recipes-extended/iptables/iptables_1.%.bbappend
 delete mode 100644 recipes-extended/iptables/iptables_1.4.21.bbappend

diff --git a/recipes-core/base-files/base-files_3.%.bbappend b/recipes-core/base-files/base-files_3.%.bbappend
new file mode 100644
index 0000000..eb973ad
--- /dev/null
+++ b/recipes-core/base-files/base-files_3.%.bbappend
@@ -0,0 +1,5 @@
+do_install_append() {
+	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
+		echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
+	fi
+}
diff --git a/recipes-core/base-files/base-files_3.0.14.bbappend b/recipes-core/base-files/base-files_3.0.14.bbappend
deleted file mode 100644
index eb973ad..0000000
--- a/recipes-core/base-files/base-files_3.0.14.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-do_install_append() {
-	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-		echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
-	fi
-}
diff --git a/recipes-core/initscripts/initscripts_1.%.bbappend b/recipes-core/initscripts/initscripts_1.%.bbappend
new file mode 100644
index 0000000..0600ab2
--- /dev/null
+++ b/recipes-core/initscripts/initscripts_1.%.bbappend
@@ -0,0 +1,16 @@
+do_install_append() {
+
+	echo                  >> ${D}${sysconfdir}/init.d/functions
+	echo success \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \}               >> ${D}${sysconfdir}/init.d/functions
+	echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \}               >> ${D}${sysconfdir}/init.d/functions
+	echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \}               >> ${D}${sysconfdir}/init.d/functions
+	echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \}               >> ${D}${sysconfdir}/init.d/functions
+}
diff --git a/recipes-core/initscripts/initscripts_1.0.bbappend b/recipes-core/initscripts/initscripts_1.0.bbappend
deleted file mode 100644
index 0600ab2..0000000
--- a/recipes-core/initscripts/initscripts_1.0.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-do_install_append() {
-
-	echo                  >> ${D}${sysconfdir}/init.d/functions
-	echo success \(\) \{  >> ${D}${sysconfdir}/init.d/functions
-	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
-	echo \}               >> ${D}${sysconfdir}/init.d/functions
-	echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
-	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
-	echo \}               >> ${D}${sysconfdir}/init.d/functions
-	echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
-	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
-	echo \}               >> ${D}${sysconfdir}/init.d/functions
-	echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions
-	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
-	echo \}               >> ${D}${sysconfdir}/init.d/functions
-}
diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
new file mode 100644
index 0000000..1b89aec
--- /dev/null
+++ b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
@@ -0,0 +1,6 @@
+do_install_append() {
+	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
+		echo "" >> ${D}${sysconfdir}/inittab
+		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
+	fi
+}
diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
deleted file mode 100644
index 1b89aec..0000000
--- a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-do_install_append() {
-	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-		echo "" >> ${D}${sysconfdir}/inittab
-		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
-	fi
-}
diff --git a/recipes-devtools/python/python_2.%.bbappend b/recipes-devtools/python/python_2.%.bbappend
new file mode 100644
index 0000000..55301c7
--- /dev/null
+++ b/recipes-devtools/python/python_2.%.bbappend
@@ -0,0 +1,8 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+DEPENDS += " ncurses"
+
+do_compile_prepend() {
+	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
+}
+
diff --git a/recipes-devtools/python/python_2.7.9.bbappend b/recipes-devtools/python/python_2.7.9.bbappend
deleted file mode 100644
index 55301c7..0000000
--- a/recipes-devtools/python/python_2.7.9.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += " ncurses"
-
-do_compile_prepend() {
-	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
-}
-
diff --git a/recipes-extended/iptables/iptables_1.%.bbappend b/recipes-extended/iptables/iptables_1.%.bbappend
new file mode 100644
index 0000000..52a4c4f
--- /dev/null
+++ b/recipes-extended/iptables/iptables_1.%.bbappend
@@ -0,0 +1,8 @@
+RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
+                      kernel-module-ip6table-filter \
+                      kernel-module-xt-tcpudp \
+                      kernel-module-ipt-reject \
+                      kernel-module-iptable-mangle \
+                      kernel-module-xt-checksum \
+                      kernel-module-xt-state \
+                      "
diff --git a/recipes-extended/iptables/iptables_1.4.21.bbappend b/recipes-extended/iptables/iptables_1.4.21.bbappend
deleted file mode 100644
index 52a4c4f..0000000
--- a/recipes-extended/iptables/iptables_1.4.21.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
-                      kernel-module-ip6table-filter \
-                      kernel-module-xt-tcpudp \
-                      kernel-module-ipt-reject \
-                      kernel-module-iptable-mangle \
-                      kernel-module-xt-checksum \
-                      kernel-module-xt-state \
-                      "
-- 
2.1.4


