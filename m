Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBD32E00E9E; Thu, 10 May 2018 10:51:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FAA7E00C25
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 May 2018 10:51:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4AHpHaY031188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 May 2018 10:51:33 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 May 2018 10:51:06 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 10 May 2018 13:51:02 -0400
Message-ID: <1525974662-32260-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: fixups for glibc 2.27 - with Sun RPC Interfaces removed
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
X-List-Received-Date: Thu, 10 May 2018 17:51:46 -0000
Content-Type: text/plain

With Sun RPC Interfaces removed from libc we need to use an external
provider for rpc. Polling other distros there seems to be consensus to
use libtirpc so we follow this trend.

Unfortunately this should only require the DEPENDS addition to the
recipe but the upstream project has a few flaws in their Makefiles and
configure which we need to work around so we add 2 new patches to
address these to allow for the use of a sysroot and to use the
$XDR_CFLAGS in a few more places.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../Makefiles-Add-more-XDR_CFLAGS-as-needed.patch  | 62 ++++++++++++++++++++++
 ...re.ac-search-for-rpc-rpc.h-in-the-sysroot.patch | 36 +++++++++++++
 recipes-extended/libvirt/libvirt_1.3.5.bb          |  4 +-
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
 create mode 100644 recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch

diff --git a/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch b/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
new file mode 100644
index 0000000..826cdd0
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
@@ -0,0 +1,62 @@
+From dcfc263db9e69e5381cb511c51836271dec577a3 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 10 May 2018 13:27:47 -0400
+Subject: [PATCH] Makefiles: Add more $XDR_CFLAGS as needed
+
+When building with libtirpc instead of libc-xdr the include search
+path needs to be used. In several places this was missing and it was
+only looking in /usr/include and failing.
+
+Upstream-Status: Inappropriate [old release]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ src/Makefile.am   | 5 +++--
+ tests/Makefile.am | 1 +
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e9ce941..38114b7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1157,7 +1157,7 @@ libvirt_la_BUILT_LIBADD += libvirt_driver.la
+ libvirt_driver_la_SOURCES = $(DRIVER_SOURCES)
+ 
+ libvirt_driver_la_CFLAGS = \
+-		$(GNUTLS_CFLAGS) $(CURL_CFLAGS) \
++		$(GNUTLS_CFLAGS) $(CURL_CFLAGS) $(XDR_CFLAGS) \
+ 		-I$(srcdir)/conf $(AM_CFLAGS)
+ libvirt_driver_la_LIBADD = \
+ 		$(GNUTLS_LIBS) $(CURL_LIBS) $(DLOPEN_LIBS)
+@@ -1348,6 +1348,7 @@ endif ! WITH_DRIVER_MODULES
+ 
+ libvirt_driver_qemu_impl_la_CFLAGS = \
+ 		$(GNUTLS_CFLAGS) \
++		$(XDR_CFLAGS) \
+ 		$(LIBNL_CFLAGS) \
+ 		-I$(srcdir)/access \
+ 		-I$(srcdir)/conf \
+@@ -2306,7 +2307,7 @@ libvirt_lxc_la_LDFLAGS = \
+ 		$(CYGWIN_EXTRA_LDFLAGS) \
+ 		$(MINGW_EXTRA_LDFLAGS) \
+ 		$(NULL)
+-libvirt_lxc_la_CFLAGS = $(AM_CFLAGS)
++libvirt_lxc_la_CFLAGS = $(AM_CFLAGS) $(XDR_CFLAGS)
+ libvirt_lxc_la_LIBADD = libvirt.la $(CYGWIN_EXTRA_LIBADD)
+ 
+ # Since virt-login-shell will be setuid, we must do everything
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 2f8b9eb..aec9a3e 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -48,6 +48,7 @@ AM_CFLAGS = \
+ 	$(APPARMOR_CFLAGS) \
+ 	$(YAJL_CFLAGS) \
+ 	$(COVERAGE_CFLAGS) \
++	$(XDR_CFLAGS) \
+ 	$(WARN_CFLAGS)
+ 
+ AM_LDFLAGS = \
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch b/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
new file mode 100644
index 0000000..edbadb6
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
@@ -0,0 +1,36 @@
+From f10477f0fe5e4b7487a4a41faa216d10cd2bc7c3 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 10 May 2018 12:05:04 -0400
+Subject: [PATCH] configure.ac: search for rpc/rpc.h in the sysroot
+
+We want to avoid host contamination and use the sysroot as the base
+directory for our search so add the '=' the the '-I' when searching
+for libtirpc's rpc.h header.
+
+Upstream-Status: Inappropriate [old release]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5a6408c..6c19f6d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -705,10 +705,10 @@ if test x"$with_remote" = x"yes" || test x"$with_libvirtd" = x"yes"; then
+     dnl check for cygwin's variation in xdr function names
+     AC_CHECK_FUNCS([xdr_u_int64_t],[],[],[#include <rpc/xdr.h>])
+ 
+-    dnl Cygwin/recent glibc requires -I/usr/include/tirpc for <rpc/rpc.h>
++    dnl Cygwin/recent glibc requires -I=/usr/include/tirpc for <rpc/rpc.h>
+     old_CFLAGS=$CFLAGS
+     AC_CACHE_CHECK([where to find <rpc/rpc.h>], [lv_cv_xdr_cflags], [
+-      for add_CFLAGS in '' '-I/usr/include/tirpc' 'missing'; do
++      for add_CFLAGS in '' '-I=/usr/include/tirpc' 'missing'; do
+         if test x"$add_CFLAGS" = xmissing; then
+           lv_cv_xdr_cflags=missing; break
+         fi
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index e7a2b23..35fd577 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SECTION = "console/tools"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper \
+	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
 	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)}"
 
 # libvirt-guests.sh needs gettext.sh
@@ -40,6 +40,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://0001-ptest-add-missing-test_helper-files.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
 	   file://0001-Added-configure-variable-for-placing-systemd-untis-l.patch \
+	   file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
+	   file://Makefiles-Add-more-XDR_CFLAGS-as-needed.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
-- 
2.7.4


