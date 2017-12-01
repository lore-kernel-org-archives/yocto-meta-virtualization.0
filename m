Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11BECE00CF7; Fri,  1 Dec 2017 12:13:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBA7FE00CE8
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:13:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB1KDPgf024865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:13:25 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:13:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:13:09 -0500
Message-ID: <1512159189-4924-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] memcached: uprev to v1.5.3
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
X-List-Received-Date: Fri, 01 Dec 2017 20:13:27 -0000
Content-Type: text/plain

Incorporate updates in the recipe found in meta-networking and add
support for systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../memcached/memcached/configure.patch            | 13 ----
 .../memcached/memcached-add-hugetlbfs-check.patch  | 32 ++++++++++
 .../memcached/memcached/memcached-config.txt       |  5 ++
 .../recipes-support/memcached/memcached_1.4.17.bb  | 44 --------------
 .../recipes-support/memcached/memcached_1.5.3.bb   | 70 ++++++++++++++++++++++
 5 files changed, 107 insertions(+), 57 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/memcached/memcached/configure.patch
 create mode 100644 meta-openstack/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
 create mode 100644 meta-openstack/recipes-support/memcached/memcached/memcached-config.txt
 delete mode 100644 meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
 create mode 100644 meta-openstack/recipes-support/memcached/memcached_1.5.3.bb

diff --git a/meta-openstack/recipes-support/memcached/memcached/configure.patch b/meta-openstack/recipes-support/memcached/memcached/configure.patch
deleted file mode 100644
index 7001a0e..0000000
--- a/meta-openstack/recipes-support/memcached/memcached/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: memcached-1.4.17/configure.ac
-===================================================================
---- memcached-1.4.17.orig/configure.ac	2013-12-20 21:44:49.000000000 +0000
-+++ memcached-1.4.17/configure.ac	2014-07-18 07:17:00.593499483 +0000
-@@ -4,7 +4,7 @@
- AC_INIT(memcached, VERSION_NUMBER, memcached@googlegroups.com)
- AC_CANONICAL_SYSTEM
- AC_CONFIG_SRCDIR(memcached.c)
--AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- 
- AC_PROG_CC
diff --git a/meta-openstack/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch b/meta-openstack/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
new file mode 100644
index 0000000..544b840
--- /dev/null
+++ b/meta-openstack/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
@@ -0,0 +1,32 @@
+memcached: add knob to detect whether hugetlbfs are checked
+
+Add knob to detect whether hugetlbfs are checked or not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7f22f21..21691b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -314,7 +314,12 @@ fi
+ dnl ----------------------------------------------------------------------------
+ 
+ AC_SEARCH_LIBS(umem_cache_create, umem)
+-AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
++AC_ARG_ENABLE(hugetlbfs,
++  [AS_HELP_STRING([--enable-hugetlbfs],[Enable hugetlbfs])])
++
++if test "x$enable_hugetlbfs" = "xyes"; then
++  AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
++fi
+ 
+ AC_HEADER_STDBOOL
+ AH_BOTTOM([#if HAVE_STDBOOL_H
+-- 
+1.8.3.4
+
diff --git a/meta-openstack/recipes-support/memcached/memcached/memcached-config.txt b/meta-openstack/recipes-support/memcached/memcached/memcached-config.txt
new file mode 100644
index 0000000..7e6441e
--- /dev/null
+++ b/meta-openstack/recipes-support/memcached/memcached/memcached-config.txt
@@ -0,0 +1,5 @@
+PORT="11211"
+USER="nobody"
+MAXCONN="1024"
+CACHESIZE="64"
+OPTIONS=""
diff --git a/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb b/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
deleted file mode 100644
index 6097693..0000000
--- a/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "A high-performance memory object caching system"
-DESCRIPTION = "\
- memcached optimizes specific high-load serving applications that are designed \
- to take advantage of its versatile no-locking memory access system. Clients \
- are available in several different programming languages, to suit the needs \
- of the specific application. Traditionally this has been used in mod_perl \
- apps to avoid storing large chunks of data in Apache memory, and to share \
- this burden across several machines."
-
-HOMEPAGE = "http://memcached.org/"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
-
-inherit autotools
-
-DEPENDS += "libevent"
-RDEPENDS_${PN} += "bash perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
-
-SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
-           file://configure.patch"
-
-SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
-SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
-
-python __anonymous () {
-    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
-    if endianness == 'le':
-        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
-    else:
-        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
-}
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "memcached"
-INITSCRIPT_PARAMS = "defaults"
-
-do_install_append() {
-    install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/memcached
-    mkdir -p ${D}/usr/share/memcached/scripts
-    install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scripts
-    install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/scripts
-}
diff --git a/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb b/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb
new file mode 100644
index 0000000..b2d776b
--- /dev/null
+++ b/meta-openstack/recipes-support/memcached/memcached_1.5.3.bb
@@ -0,0 +1,70 @@
+SUMMARY = "A high-performance memory object caching system"
+DESCRIPTION = "\
+ memcached optimizes specific high-load serving applications that are designed \
+ to take advantage of its versatile no-locking memory access system. Clients \
+ are available in several different programming languages, to suit the needs \
+ of the specific application. Traditionally this has been used in mod_perl \
+ apps to avoid storing large chunks of data in Apache memory, and to share \
+ this burden across several machines."
+SECTION = "web"
+HOMEPAGE = "http://memcached.org/"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
+
+inherit autotools systemd
+
+DEPENDS += "libevent"
+RDEPENDS_${PN} += "\
+    bash \
+    perl \
+    perl-module-posix \
+    perl-module-autoloader \
+    perl-module-tie-hash \
+    "
+
+SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
+           file://memcached-add-hugetlbfs-check.patch \
+           file://memcached-config.txt \
+           "
+
+SRC_URI[md5sum] = "263819baf411388b3f72700a3212d4e2"
+SRC_URI[sha256sum] = "258cc3ddb7613685465acfd0215f827220a3bbdd167fd2c080632105b2d2f3ce"
+
+# set the same COMPATIBLE_HOST as libhugetlbfs
+COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
+
+python __anonymous () {
+    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
+    if endianness == 'le':
+        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
+    else:
+        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
+}
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[hugetlbfs] = "--enable-hugetlbfs, --disable-hugetlbfs, libhugetlbfs"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "memcached"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_PACKAGES = "memcached"
+SYSTEMD_SERVICE_${PN} = "memcached.service"
+
+do_install_append() {
+    install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/memcached
+    
+    mkdir -p ${D}/usr/share/memcached/scripts
+    install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scripts
+    install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/scripts
+
+    install -d ${D}/${sysconfdir}/default
+    install -m 600 ${WORKDIR}/memcached-config.txt ${D}/${sysconfdir}/default/memcached
+
+    install -d ${D}/${systemd_system_unitdir}
+    install -m 644 ${S}/scripts/memcached.service ${D}/${systemd_system_unitdir}/.
+    sed -e "s@^EnvironmentFile=.*@EnvironmentFile=${sysconfdir}/default/memcached@" \
+        -i ${D}/${systemd_system_unitdir}/memcached.service
+}
-- 
2.7.4


