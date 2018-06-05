Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3F84E01680; Tue,  5 Jun 2018 07:01:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC6ACE0167D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jun 2018 07:01:50 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w55E1o0B016253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 Jun 2018 07:01:50 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 5 Jun 2018 07:01:49 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 5 Jun 2018 10:01:48 -0400
Message-ID: <1528207308-23725-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [V2][PATCH] libvirt: uprev to the latest release, v4.3.0
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
X-List-Received-Date: Tue, 05 Jun 2018 14:01:54 -0000
Content-Type: text/plain

We have been using the 1.3.x release series for a long time now which
has been great for stability but is slowly becoming harder and harder
to track and port bug and CVE fixes. This is a big jump to the latest
upstream release which gives us access to a myriad of fixes as well as
puts us in a better position to contribute to the upstream project
when issues are found.

Several patches have been dropped as they are either no longer valid
against this release or have equivalent updates already applied to the
upstream project. Some patches were consolidated which should ease
future uprevs of this recipe. The majority of the updates were related
to ptest patches, which is not a huge surprise given this code has no
upstream equivalent.

The overall runtime behavior remains much the same from v1.3.5 with
the only notable configuration change being for 'seccomp_sandbox'
which has been disabled here but should possibly be revisited in the
near future.

As usual the normal runtime usecases for qemu/kvm and lxc have been
run successfully along with ptest results which are by and large OK:

    ====================================
    Testsuite summary for libvirt 4.3.0
    ====================================
    # TOTAL: 119
    # PASS:  115
    # SKIP:  0
    # XFAIL: 0
    # FAIL:  4
    # XPASS: 0
    # ERROR: 0

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2: Same as V1 but with some new content I had missed while
    squashing my development commits.


 ...gure-variable-for-placing-systemd-untis-l.patch |  55 ------------
 ...pty-default-VNC-password-work-as-document.patch |  81 -----------------
 .../Makefiles-Add-more-XDR_CFLAGS-as-needed.patch  |  62 -------------
 recipes-extended/libvirt/libvirt-python.inc        |   4 +-
 .../0001-nsslinktest-also-build-virAtomic.h.patch  |  40 ---------
 .../0001-ptest-add-missing-test_helper-files.patch |  29 ------
 .../0001-to-fix-build-error.patch                  |  27 +++---
 ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |  70 ---------------
 ...re.ac-search-for-rpc-rpc.h-in-the-sysroot.patch |  10 +--
 .../libvirt/libvirt/install-missing-file.patch     |  35 ++++----
 .../libvirt-use-pkg-config-to-locate-libcap.patch  |  48 +++++-----
 .../libvirt/libvirt/libvirt_api_xml_path.patch     |  26 +++---
 recipes-extended/libvirt/libvirt/runptest.patch    | 100 ++++++++++++---------
 .../tests-allow-separated-src-and-build-dirs.patch |  57 ------------
 ...ibvirt-net-rpc-to-virt-host-validate-when.patch |  34 +++----
 .../libvirt/{libvirt_1.3.5.bb => libvirt_4.3.0.bb} |  29 +++---
 16 files changed, 170 insertions(+), 537 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
 delete mode 100644 recipes-extended/libvirt/libvirt-1.3.5/0001-qemu-Let-empty-default-VNC-password-work-as-document.patch
 delete mode 100644 recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-nsslinktest-also-build-virAtomic.h.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch
 rename recipes-extended/libvirt/{libvirt-1.3.5 => libvirt}/0001-to-fix-build-error.patch (65%)
 delete mode 100644 recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
 rename recipes-extended/libvirt/{libvirt-1.3.5 => libvirt}/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch (85%)
 delete mode 100644 recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
 rename recipes-extended/libvirt/{libvirt_1.3.5.bb => libvirt_4.3.0.bb} (93%)

diff --git a/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch b/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
deleted file mode 100644
index a64739c..0000000
--- a/recipes-extended/libvirt/libvirt-1.3.5/0001-Added-configure-variable-for-placing-systemd-untis-l.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 531178d7fbb5d4b3404766cfd0fc999398cccd58 Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Wed, 8 Feb 2017 18:39:48 +0200
-Subject: [PATCH] Added configure variable for placing systemd untis location
-
-Upstream-Status: Pending
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
- configure.ac       | 3 +++
- daemon/Makefile.am | 1 -
- tools/Makefile.am  | 1 -
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0e5b8e3..5a6408c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2687,6 +2687,9 @@ AC_DEFINE_UNQUOTED([isbase64],[libvirt_gl_isbase64],[Hack to avoid symbol clash]
- AC_DEFINE_UNQUOTED([base64_encode],[libvirt_gl_base64_encode],[Hack to avoid symbol clash])
- AC_DEFINE_UNQUOTED([base64_encode_alloc],[libvirt_gl_base64_encode_alloc],[Hack to avoid symbol clash])
- 
-+AC_ARG_VAR(SYSTEMD_UNIT_DIR, 'location for systemd units, defautls to /lib/systemd/system')
-+AS_IF([test "x$SYSTEMD_UNIT_DIR" = "x"], [SYSTEMD_UNIT_DIR="/lib/systemd/system"])
-+
- AC_CONFIG_FILES([run],
-                 [chmod +x,-w run])
- AC_CONFIG_FILES([\
-diff --git a/daemon/Makefile.am b/daemon/Makefile.am
-index edb75e8..2ab42a6 100644
---- a/daemon/Makefile.am
-+++ b/daemon/Makefile.am
-@@ -449,7 +449,6 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
- 
- if LIBVIRT_INIT_SCRIPT_SYSTEMD
- 
--SYSTEMD_UNIT_DIR = /lib/systemd/system
- BUILT_SOURCES += libvirtd.service
- 
- install-init-systemd: install-sysconfig libvirtd.service
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 27ecbf1..8cefe1a 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -380,7 +380,6 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
- 
- 
- EXTRA_DIST += libvirt-guests.service.in
--SYSTEMD_UNIT_DIR = /lib/systemd/system
- 
- if LIBVIRT_INIT_SCRIPT_SYSTEMD
- install-systemd: libvirt-guests.service install-sysconfig libvirt-guests.sh
--- 
-2.7.4
-
diff --git a/recipes-extended/libvirt/libvirt-1.3.5/0001-qemu-Let-empty-default-VNC-password-work-as-document.patch b/recipes-extended/libvirt/libvirt-1.3.5/0001-qemu-Let-empty-default-VNC-password-work-as-document.patch
deleted file mode 100644
index 1d13dd3..0000000
--- a/recipes-extended/libvirt/libvirt-1.3.5/0001-qemu-Let-empty-default-VNC-password-work-as-document.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2016-5008 from:
-
-https://libvirt.org/git/?p=libvirt.git;a=commit;h=f32441c69bf450d6ac593c3acd621c37e120cdaf
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From f32441c69bf450d6ac593c3acd621c37e120cdaf Mon Sep 17 00:00:00 2001
-From: Jiri Denemark <jdenemar@redhat.com>
-Date: Tue, 28 Jun 2016 14:39:58 +0200
-Subject: [PATCH] qemu: Let empty default VNC password work as documented
-
-CVE-2016-5008
-
-Setting an empty graphics password is documented as a way to disable
-VNC/SPICE access, but QEMU does not always behaves like that. VNC would
-happily accept the empty password. Let's enforce the behavior by setting
-password expiration to "now".
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1180092
-
-Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
-(cherry picked from commit bb848feec0f3f10e92dd8e5231ae7aa89b5598f3)
----
- src/qemu/qemu_hotplug.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/qemu/qemu_hotplug.c b/src/qemu/qemu_hotplug.c
-index 5f12d77..fda28b0 100644
---- a/src/qemu/qemu_hotplug.c
-+++ b/src/qemu/qemu_hotplug.c
-@@ -3547,6 +3547,7 @@ qemuDomainChangeGraphicsPasswords(virQEMUDriverPtr driver,
-     time_t now = time(NULL);
-     char expire_time [64];
-     const char *connected = NULL;
-+    const char *password;
-     int ret = -1;
-     virQEMUDriverConfigPtr cfg = virQEMUDriverGetConfig(driver);
- 
-@@ -3554,16 +3555,14 @@ qemuDomainChangeGraphicsPasswords(virQEMUDriverPtr driver,
-         ret = 0;
-         goto cleanup;
-     }
-+    password = auth->passwd ? auth->passwd : defaultPasswd;
- 
-     if (auth->connected)
-         connected = virDomainGraphicsAuthConnectedTypeToString(auth->connected);
- 
-     if (qemuDomainObjEnterMonitorAsync(driver, vm, asyncJob) < 0)
-         goto cleanup;
--    ret = qemuMonitorSetPassword(priv->mon,
--                                 type,
--                                 auth->passwd ? auth->passwd : defaultPasswd,
--                                 connected);
-+    ret = qemuMonitorSetPassword(priv->mon, type, password, connected);
- 
-     if (ret == -2) {
-         if (type != VIR_DOMAIN_GRAPHICS_TYPE_VNC) {
-@@ -3571,14 +3570,15 @@ qemuDomainChangeGraphicsPasswords(virQEMUDriverPtr driver,
-                            _("Graphics password only supported for VNC"));
-             ret = -1;
-         } else {
--            ret = qemuMonitorSetVNCPassword(priv->mon,
--                                            auth->passwd ? auth->passwd : defaultPasswd);
-+            ret = qemuMonitorSetVNCPassword(priv->mon, password);
-         }
-     }
-     if (ret != 0)
-         goto end_job;
- 
--    if (auth->expires) {
-+    if (password[0] == '\0') {
-+        snprintf(expire_time, sizeof(expire_time), "now");
-+    } else if (auth->expires) {
-         time_t lifetime = auth->validTo - now;
-         if (lifetime <= 0)
-             snprintf(expire_time, sizeof(expire_time), "now");
--- 
-2.9.0
-
diff --git a/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch b/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
deleted file mode 100644
index 826cdd0..0000000
--- a/recipes-extended/libvirt/libvirt-1.3.5/Makefiles-Add-more-XDR_CFLAGS-as-needed.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From dcfc263db9e69e5381cb511c51836271dec577a3 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 10 May 2018 13:27:47 -0400
-Subject: [PATCH] Makefiles: Add more $XDR_CFLAGS as needed
-
-When building with libtirpc instead of libc-xdr the include search
-path needs to be used. In several places this was missing and it was
-only looking in /usr/include and failing.
-
-Upstream-Status: Inappropriate [old release]
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- src/Makefile.am   | 5 +++--
- tests/Makefile.am | 1 +
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e9ce941..38114b7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1157,7 +1157,7 @@ libvirt_la_BUILT_LIBADD += libvirt_driver.la
- libvirt_driver_la_SOURCES = $(DRIVER_SOURCES)
- 
- libvirt_driver_la_CFLAGS = \
--		$(GNUTLS_CFLAGS) $(CURL_CFLAGS) \
-+		$(GNUTLS_CFLAGS) $(CURL_CFLAGS) $(XDR_CFLAGS) \
- 		-I$(srcdir)/conf $(AM_CFLAGS)
- libvirt_driver_la_LIBADD = \
- 		$(GNUTLS_LIBS) $(CURL_LIBS) $(DLOPEN_LIBS)
-@@ -1348,6 +1348,7 @@ endif ! WITH_DRIVER_MODULES
- 
- libvirt_driver_qemu_impl_la_CFLAGS = \
- 		$(GNUTLS_CFLAGS) \
-+		$(XDR_CFLAGS) \
- 		$(LIBNL_CFLAGS) \
- 		-I$(srcdir)/access \
- 		-I$(srcdir)/conf \
-@@ -2306,7 +2307,7 @@ libvirt_lxc_la_LDFLAGS = \
- 		$(CYGWIN_EXTRA_LDFLAGS) \
- 		$(MINGW_EXTRA_LDFLAGS) \
- 		$(NULL)
--libvirt_lxc_la_CFLAGS = $(AM_CFLAGS)
-+libvirt_lxc_la_CFLAGS = $(AM_CFLAGS) $(XDR_CFLAGS)
- libvirt_lxc_la_LIBADD = libvirt.la $(CYGWIN_EXTRA_LIBADD)
- 
- # Since virt-login-shell will be setuid, we must do everything
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2f8b9eb..aec9a3e 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -48,6 +48,7 @@ AM_CFLAGS = \
- 	$(APPARMOR_CFLAGS) \
- 	$(YAJL_CFLAGS) \
- 	$(COVERAGE_CFLAGS) \
-+	$(XDR_CFLAGS) \
- 	$(WARN_CFLAGS)
- 
- AM_LDFLAGS = \
--- 
-2.7.4
-
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 15aa804..79beb95 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "4dbd7ef9ee9c4dea5887b5b31eb04529"
-SRC_URI[libvirt_python.sha256sum] = "a0508a57637fd18a3584fb9d2322fb172f65708c9db16e0438a70eb0f36fa5c2"
+SRC_URI[libvirt_python.md5sum] = "2ea5f1871358e6a5788b52c2e1a0b809"
+SRC_URI[libvirt_python.sha256sum] = "efe384479a0bf74b1b83bba208887b263cc0061fd4f87759cf3067a403618ea9"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/0001-nsslinktest-also-build-virAtomic.h.patch b/recipes-extended/libvirt/libvirt/0001-nsslinktest-also-build-virAtomic.h.patch
deleted file mode 100644
index 6ab1c4e..0000000
--- a/recipes-extended/libvirt/libvirt/0001-nsslinktest-also-build-virAtomic.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Submitted [http://www.redhat.com/archives/libvir-list/2016-August/msg00389.html]
-
-When build for architecture that don't use gcc atomic ops but pthread,
-it fails to build for arm:
-
-| ../tools/nss/.libs/libnss_libvirt_impl.a(libvirt_nss_la-virobject.o): In function `virClassNew':
-| /buildarea2/kkang/builds/qemuarm-Aug03/bitbake_build/tmp/work/armv5e-wrs-linux-gnueabi/libvirt/1.3.5-r0/build/src/../../libvirt-1.3.5/src/util/virobject.c:153: undefined reference to `virAtomicLock'
-| ../tools/nss/.libs/libnss_libvirt_impl.a(libvirt_nss_la-virobject.o): In function `virObjectNew':
-| /buildarea2/kkang/builds/qemuarm-Aug03/bitbake_build/tmp/work/armv5e-wrs-linux-gnueabi/libvirt/1.3.5-r0/build/src/../../libvirt-1.3.5/src/util/virobject.c:205: undefined reference to `virAtomicLock'
-| ../tools/nss/.libs/libnss_libvirt_impl.a(libvirt_nss_la-virobject.o): In function `virObjectUnref':
-| /buildarea2/kkang/builds/qemuarm-Aug03/bitbake_build/tmp/work/armv5e-wrs-linux-gnueabi/libvirt/1.3.5-r0/build/src/../../libvirt-1.3.5/src/util/virobject.c:277: undefined reference to `virAtomicLock'
-| ../tools/nss/.libs/libnss_libvirt_impl.a(libvirt_nss_la-virobject.o): In function `virObjectRef':
-| /buildarea2/kkang/builds/qemuarm-Aug03/bitbake_build/tmp/work/armv5e-wrs-linux-gnueabi/libvirt/1.3.5-r0/build/src/../../libvirt-1.3.5/src/util/virobject.c:298: undefined reference to `virAtomicLock'
-| collect2: error: ld returned 1 exit status
-
-It is similar with:
-
-http://libvirt.org/git/?p=libvirt.git;a=commit;h=12dc729
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- src/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 12b66c2..6e55972 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -2989,6 +2989,8 @@ noinst_LTLIBRARIES += libvirt-nss.la
- libvirt_nss_la_SOURCES =		\
- 		util/viralloc.c			\
- 		util/viralloc.h			\
-+		util/viratomic.c		\
-+		util/viratomic.h		\
- 		util/virbitmap.c		\
- 		util/virbitmap.h		\
- 		util/virbuffer.c		\
--- 
-2.9.0
-
diff --git a/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch b/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch
deleted file mode 100644
index b4f1e27..0000000
--- a/recipes-extended/libvirt/libvirt/0001-ptest-add-missing-test_helper-files.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e625a42caca492fe7d52b70bbbf83ae4d99cb15e Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Tue, 23 Aug 2016 02:16:20 -0400
-Subject: [PATCH] ptest: add missing test_helper files
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- tests/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 1c85656..2f8b9eb 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1422,8 +1422,10 @@ install-ptest:
- 	@(for file in $(PTESTS); do \
- 		if [ -f .libs/$$file ]; then \
- 			install .libs/$$file $(DEST_DIR)/tests; \
--		else \
-+		elif [ -f $(srcdir)/$$file ]; then \
- 			install $(srcdir)/$$file $(DEST_DIR)/tests; \
-+		else \
-+			install $(builddir)/$$file $(DEST_DIR)/tests; \
- 		fi; \
- 	done;)
- 	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
--- 
-2.8.1
-
diff --git a/recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.patch b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
similarity index 65%
rename from recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.patch
rename to recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
index 089ee33..c920139 100644
--- a/recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.patch
+++ b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
@@ -15,16 +15,18 @@ The error likes as following
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 [ywei: rebased to libvirt-1.3.2]
 Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+[MA: rebase to v4.3.0]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- docs/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ docs/Makefile.am | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 1b4353b..c199551 100644
+index 9620587..060a82b 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -164,7 +164,7 @@ EXTRA_DIST=					\
-   todo.pl hvsupport.pl todo.cfg-example \
+@@ -183,7 +183,7 @@ EXTRA_DIST= \
+   hvsupport.pl \
    $(schema_DATA)
  
 -acl_generated = aclperms.htmlinc
@@ -32,15 +34,16 @@ index 1b4353b..c199551 100644
  
  $(srcdir)/aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
          $(srcdir)/genaclperms.pl Makefile.am
-@@ -221,7 +221,7 @@ $(srcdir)/hvsupport.html.in: $(srcdir)/hvsupport.pl $(api_DATA) \
+@@ -247,8 +247,7 @@ MAINTAINERCLEANFILES += \
+ %.png: %.fig
  	convert -rotate 90 $< $@
  
- %.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
--		sitemap.html.in $(acl_generated)
-+		sitemap.html.in
- 	@if [ -x $(XSLTPROC) ] ; then \
- 	  echo "Generating $@"; \
- 	  name=`echo $@ | sed -e 's/.tmp//'`; \
+-%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
+-		$(acl_generated)
++%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl
+ 	$(AM_V_GEN)name=`echo $@ | sed -e 's/.tmp//'`; \
+ 	  dir=`dirname $@` ; \
+ 	  if test "$$dir" = "."; \
 -- 
 1.9.1
 
diff --git a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
deleted file mode 100644
index 02ddf68..0000000
--- a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Update context for version 1.3.5.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From dd915e7f70e676aea93f750c75d16ce646e71e4b Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Wed, 9 Sep 2015 11:52:44 -0400
-Subject: [PATCH] Revert "build: add $(prefix) to SYSTEMD_UNIT_DIR"
-
-This reverts upstream commit 00e9d6071b2450659ce01bc984f64ecb5d7ba62d
-with minor context changes to allow it to apply.
-
-Yocto based builds use /lib/systemd/system for systemd unit files and
-since upstream has chosen to use a mechanism for setting
-SYSTEMD_UNIT_DIR which is not flexible we have to resort to reverting
-this upstream commit to avoid having ${prefix} added to the path.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-[ywei: rebased to libvirt-1.3.2]
-Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
----
- daemon/Makefile.am | 2 +-
- src/Makefile.am    | 2 +-
- tools/Makefile.am  | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/daemon/Makefile.am b/daemon/Makefile.am
-index 2dbe81b..41ea2db 100644
---- a/daemon/Makefile.am
-+++ b/daemon/Makefile.am
-@@ -449,7 +449,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
- 
- if LIBVIRT_INIT_SCRIPT_SYSTEMD
- 
--SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
-+SYSTEMD_UNIT_DIR = /lib/systemd/system
- BUILT_SOURCES += libvirtd.service
- 
- install-init-systemd: install-sysconfig libvirtd.service
-diff --git a/src/Makefile.am b/src/Makefile.am
-index a316b4d..d271291 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -2633,7 +2633,7 @@ EXTRA_DIST += \
- if WITH_LIBVIRTD
- if LIBVIRT_INIT_SCRIPT_SYSTEMD
- 
--SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
-+SYSTEMD_UNIT_DIR = /lib/systemd/system
- 
- BUILT_SOURCES += virtlockd.service virtlockd.socket \
- 		 virtlogd.service virtlogd.socket
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index b3227a7..0e58f73 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -380,7 +380,7 @@ libvirt-guests.init: libvirt-guests.init.in libvirt-guests.sh
- 
- 
- EXTRA_DIST += libvirt-guests.service.in
--SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
-+SYSTEMD_UNIT_DIR = /lib/systemd/system
- 
- if LIBVIRT_INIT_SCRIPT_SYSTEMD
- install-systemd: libvirt-guests.service install-sysconfig libvirt-guests.sh
--- 
-1.9.1
-
diff --git a/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch b/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
similarity index 85%
rename from recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
rename to recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
index edbadb6..0a9d5f4 100644
--- a/recipes-extended/libvirt/libvirt-1.3.5/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
+++ b/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [old release]
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- configure.ac | 4 ++--
+ m4/virt-xdr.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
+diff --git a/m4/virt-xdr.m4 b/m4/virt-xdr.m4
 index 5a6408c..6c19f6d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -705,10 +705,10 @@ if test x"$with_remote" = x"yes" || test x"$with_libvirtd" = x"yes"; then
+--- a/m4/virt-xdr.m4
++++ b/m4/virt-xdr.m4
+@@ -33,10 +33,10 @@ if test x"$with_remote" = x"yes" || test x"$with_libvirtd" = x"yes"; then
      dnl check for cygwin's variation in xdr function names
      AC_CHECK_FUNCS([xdr_u_int64_t],[],[],[#include <rpc/xdr.h>])
  
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/recipes-extended/libvirt/libvirt/install-missing-file.patch
index ecd4a87..cb5a20e 100644
--- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
@@ -1,11 +1,3 @@
-Upstream-Status: Inapproriate
-
-This patch is for ptest, so it is inapproriate to send to upstream.
-
-Update context for 1.3.5.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
 From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
 From: Catalin Enache <catalin.enache@windriver.com>
 Date: Mon, 25 Jul 2016 16:38:51 +0300
@@ -13,24 +5,30 @@ Subject: [PATCH] Install missing conf file
 
 openvzutilstest.conf file is needed by openvzutilstest test.
 
+Upstream-Status: Inapproriate
+
 Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+[KK: Update context for 1.3.5.]
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+[MA: Update context for v4.3.0]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  tests/Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 02e0dd8..187fbca 100644
+index 65f776e..8a6fd44 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -170,6 +170,7 @@ EXTRA_DIST =		\
- 	xml2vmxdata
+@@ -173,6 +173,7 @@ EXTRA_DIST = \
+ 	$(NULL)
  
- test_helpers = commandhelper ssh virconftest
+ test_helpers = commandhelper ssh
 +test_misc =
  test_programs = virshtest sockettest \
- 	nodeinfotest virbuftest \
+ 	virhostcputest virbuftest \
  	commandtest seclabeltest \
-@@ -259,6 +260,7 @@ endif WITH_LXC
+@@ -305,6 +306,7 @@ endif WITH_LXC
  
  if WITH_OPENVZ
  test_programs += openvzutilstest
@@ -38,15 +36,16 @@ index 02e0dd8..187fbca 100644
  endif WITH_OPENVZ
  
  if WITH_ESX
-@@ -1293,7 +1295,7 @@ endif ! WITH_CIL
+@@ -1488,7 +1490,7 @@ endif ! WITH_CIL
  
  buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
  
--PTESTS = $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh
-+PTESTS = $(TESTS) $(test_helpers) $(test_misc) test-lib.sh schematestutils.sh
+-PTESTS = $(TESTS) $(test_helpers) test-lib.sh virschematest
++PTESTS = $(TESTS) $(test_helpers) $(test_misc) test-lib.sh virschematest
  
  install-ptest:
- 	list='$(TESTS) $(test_helpers) test-lib.sh schematestutils.sh'
+ 	list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
+
 -- 
 2.7.4
 
diff --git a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
index 65b046e..635d1e8 100644
--- a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-libcap.patch
@@ -12,34 +12,34 @@ To fix this issue, we patch configure to use 'pkg-config libcap' to
 locate the correct libraries.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+[MA: Update to apply agains v4.3.0]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- configure.ac | 6 +++---
+ m4/virt-libpcap.m4 | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index f37047599b76..5f9b84363b96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1553,7 +1553,7 @@ fi
- AM_CONDITIONAL([HAVE_NUMAD], [test "$with_numad" != "no"])
+diff --git a/m4/virt-libpcap.m4 b/m4/virt-libpcap.m4
+index 8fa4889..08b2f53 100644
+--- a/m4/virt-libpcap.m4
++++ b/m4/virt-libpcap.m4
+@@ -23,14 +23,14 @@ AC_DEFUN([LIBVIRT_ARG_LIBPCAP], [
  
- dnl pcap lib
--LIBPCAP_CONFIG="pcap-config"
-+LIBPCAP_CONFIG="pkg-config libpcap"
- LIBPCAP_CFLAGS=""
- LIBPCAP_LIBS=""
- LIBPCAP_FOUND="no"
-@@ -1563,8 +1563,8 @@ AC_ARG_WITH([libpcap], [AS_HELP_STRING([--with-libpcap=@<:@PFX@:>@],
- if test "$with_qemu" = "yes"; then
-   case $with_libpcap in
-     no)     LIBPCAP_CONFIG= ;;
--    ''|yes) LIBPCAP_CONFIG="pcap-config" ;;
--    *)      LIBPCAP_CONFIG="$with_libpcap/bin/pcap-config" ;;
-+    ''|yes) LIBPCAP_CONFIG="pkg-config libpcap" ;;
-+    *)      LIBPCAP_CONFIG="$with_libpcap/bin/pkg-config libpcap" ;;
-   esac
-   AS_IF([test "x$LIBPCAP_CONFIG" != "x"], [
-     AC_MSG_CHECKING(libpcap $LIBPCAP_CONFIG >= $LIBPCAP_REQUIRED )
+ AC_DEFUN([LIBVIRT_CHECK_LIBPCAP], [
+   LIBPCAP_REQUIRED="1.0.0"
+-  LIBPCAP_CONFIG="pcap-config"
++  LIBPCAP_CONFIG="pkg-config libpcap"
+   LIBPCAP_CFLAGS=""
+   LIBPCAP_LIBS=""
+ 
+   if test "x$with_libpcap" != "xno"; then
+     case $with_libpcap in
+-      ''|yes|check) LIBPCAP_CONFIG="pcap-config" ;;
+-      *)      LIBPCAP_CONFIG="$with_libpcap/bin/pcap-config" ;;
++      ''|yes|check) LIBPCAP_CONFIG="pkg-config libpcap" ;;
++      *)      LIBPCAP_CONFIG="$with_libpcap/bin/pkg-config libpcap" ;;
+     esac
+     AS_IF([test "x$LIBPCAP_CONFIG" != "x"], [
+       AC_MSG_CHECKING(libpcap $LIBPCAP_CONFIG >= $LIBPCAP_REQUIRED )
 -- 
 2.1.0
 
diff --git a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
index 3c2622c..30c30e8 100644
--- a/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
+++ b/recipes-extended/libvirt/libvirt/libvirt_api_xml_path.patch
@@ -13,14 +13,14 @@ Signed-off-by: Martin Kletzander <mkletzan redhat com>
 [ywei: rebased to 1.3.2]
 Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
 ---
- setup.py |   25 ++++++++++++++++++++++---
- 1 file changed, 22 insertions(+), 3 deletions(-)
+ setup.py | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
 
-Index: libvirt-python-1.2.4/setup.py
-===================================================================
---- libvirt-python-1.2.4.orig/setup.py
-+++ libvirt-python-1.2.4/setup.py
-@@ -40,13 +40,7 @@
+diff --git a/setup.py b/setup.py
+index eff9d54..48ec4fe 100755
+--- a/setup.py
++++ b/setup.py
+@@ -43,13 +43,7 @@ def check_minimum_libvirt_version():
             "libvirt"])
  
  def have_libvirt_lxc():
@@ -33,9 +33,9 @@ Index: libvirt-python-1.2.4/setup.py
 -        return False
 +    return True
  
- def get_pkgconfig_data(args, mod, required=True):
-     """Run pkg-config to and return content associated with it"""
-@@ -68,7 +62,17 @@
+ def have_libvirtaio():
+     # This depends on asyncio, which in turn depends on "yield from" syntax.
+@@ -77,7 +71,17 @@ def get_api_xml_files():
      """Check with pkg-config that libvirt is present and extract
      the API XML file paths we need from it"""
  
@@ -54,7 +54,7 @@ Index: libvirt-python-1.2.4/setup.py
  
      offset = libvirt_api.index("-api.xml")
      libvirt_qemu_api = libvirt_api[0:offset] + "-qemu-api.xml"
-@@ -88,8 +92,17 @@
+@@ -97,8 +101,17 @@ def get_module_lists():
  
      c_modules = []
      py_modules = []
@@ -74,7 +74,7 @@ Index: libvirt-python-1.2.4/setup.py
  
      module = Extension('libvirtmod',
                         sources = ['libvirt-override.c', 'build/libvirt.c', 'typewrappers.c', 'libvirt-utils.c'],
-@@ -138,7 +151,7 @@
+@@ -144,7 +157,7 @@ def get_module_lists():
  class my_build(build):
  
      def run(self):
@@ -83,3 +83,5 @@ Index: libvirt-python-1.2.4/setup.py
          apis = get_api_xml_files()
  
          self.spawn([sys.executable, "generator.py", "libvirt", apis[0]])
+-- 
+2.17.0
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index b7609a8..b900c01 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -1,20 +1,31 @@
-Update context for 1.3.5.
+From 94478517c4f9950b28be3a348387db6ede3db812 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 4 Jun 2018 11:55:37 -0400
+Subject: [PATCH] Add 'install-ptest' rule.
 
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-Add 'install-ptest' rule.
 Change TESTS_ENVIRONMENT to allow running outside build dir.
 
-Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Upstream-status: Pending
+Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
+[KK: Update context for 1.3.5.]
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+[MA: Allow separate source and build dirs]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[ZH: add missing test_helper files]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+[MA: Update context for v4.3.0]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
+ tests/Makefile.am | 74 +++++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 61 insertions(+), 13 deletions(-)
+
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0c4ad3c..bb4e31a 100644
+index 7b93fbd..edc1eb9 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -33,11 +33,13 @@ INCLUDES = \
- 	-I$(top_srcdir)/src/conf \
- 	$(GETTEXT_CPPFLAGS)
+@@ -35,11 +35,13 @@ INCLUDES = \
+ 
+ WARN_CFLAGS += $(RELAXED_FRAME_LIMIT_CFLAGS)
  
 +PTEST_DIR ?= $(libdir)/libvirt/ptest
 +
@@ -30,77 +41,81 @@ index 0c4ad3c..bb4e31a 100644
  	$(LIBXML_CFLAGS) \
  	$(LIBNL_CFLAGS) \
  	$(GNUTLS_CFLAGS) \
-@@ -62,7 +64,7 @@ QEMULIB_LDFLAGS = \
+@@ -64,7 +66,7 @@ QEMULIB_LDFLAGS = \
+ 	$(MINGW_EXTRA_LDFLAGS)
  
- if WITH_DRIVER_MODULES
  INCLUDES += \
 -	-DTEST_DRIVER_DIR=\"$(top_builddir)/src/.libs\"
 +	-DTEST_DRIVER_DIR=\"$(PTEST_DIR)/src/.libs\"
- endif WITH_DRIVER_MODULES
  
  PROBES_O =
-@@ -483,17 +485,15 @@ TESTS = $(test_programs) \
+ if WITH_DTRACE_PROBES
+@@ -466,17 +468,15 @@ TESTS = $(test_programs) \
  # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
  # intermediate shell variable, but must do all the expansion in make
  
 -lv_abs_top_builddir=$(shell cd '$(top_builddir)' && pwd)
 -
  VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
- TESTS_ENVIRONMENT =				\
--  abs_top_builddir=$(lv_abs_top_builddir)	\
--  abs_top_srcdir=`cd '$(top_srcdir)'; pwd`	\
--  abs_builddir=$(abs_builddir)			\
--  abs_srcdir=$(abs_srcdir)			\
--  CONFIG_HEADER="$(lv_abs_top_builddir)/config.h"	\
-+  abs_top_builddir="$(PTEST_DIR)"             \
-+  abs_top_srcdir="$(PTEST_DIR)"               \
-+  abs_builddir="$(PTEST_DIR)/tests"           \
-+  abs_srcdir="$(PTEST_DIR)/tests"             \
-+  CONFIG_HEADER="$(PTEST_DIR)/config.h"       \
-   SHELL="$(SHELL)"				\
+ TESTS_ENVIRONMENT = \
+-  abs_top_builddir=$(lv_abs_top_builddir) \
+-  abs_top_srcdir=`cd '$(top_srcdir)'; pwd` \
+-  abs_builddir=$(abs_builddir) \
+-  abs_srcdir=$(abs_srcdir) \
+-  CONFIG_HEADER="$(lv_abs_top_builddir)/config.h" \
++  abs_top_builddir="$(PTEST_DIR)" \
++  abs_top_srcdir="$(PTEST_DIR)" \
++  abs_builddir="$(PTEST_DIR)/tests" \
++  abs_srcdir="$(PTEST_DIR)/tests" \
++  CONFIG_HEADER="$(PTEST_DIR)/config.h" \
+   SHELL="$(SHELL)" \
 -  LIBVIRT_DRIVER_DIR="$(lv_abs_top_builddir)/src/.libs" \
 +  LIBVIRT_DRIVER_DIR="$(PTEST_DIR)/src/.libs" \
-   LIBVIRT_AUTOSTART=0				\
-   LC_ALL=C					\
-   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE)	\
-@@ -1388,5 +1388,51 @@ else ! WITH_CIL
+   LIBVIRT_AUTOSTART=0 \
+   LC_ALL=C \
+   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE) \
+@@ -1486,5 +1486,55 @@ else ! WITH_CIL
  EXTRA_DIST += objectlocking.ml
  endif ! WITH_CIL
  
 +buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
 +
-+PTESTS = $(TESTS) $(test_helpers) test-lib.sh schematestutils.sh
++PTESTS = $(TESTS) $(test_helpers) test-lib.sh virschematest
 +
 +install-ptest:
-+	list='$(TESTS) $(test_helpers) test-lib.sh schematestutils.sh'
++	list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
 +	install -d $(DEST_DIR)/tools
 +	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
 +	install * $(DEST_DIR)/tools)
 +	install -d $(DEST_DIR)/src/network
-+	cp ../src/network/*.xml $(DEST_DIR)/src/network
++	cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
 +	install -d $(DEST_DIR)/src/cpu
-+	cp ../src/cpu/*.xml $(DEST_DIR)/src/cpu
++	cp $(top_srcdir)/src/cpu/*.xml $(DEST_DIR)/src/cpu
 +	install ../src/libvirt_iohelper $(DEST_DIR)/src
-+	install -D ../daemon/libvirtd $(DEST_DIR)/daemon/libvirtd
-+	install -D ../daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
-+	@(if [ -d ../daemon/.libs ] ; then cd ../daemon/.libs; fi; \
-+	install * $(DEST_DIR)/daemon)
++	install -D ../src/libvirtd $(DEST_DIR)/src/libvirtd
++	install -d $(DEST_DIR)/src/remote
++	install -D $(top_srcdir)/src/remote/libvirtd.conf $(DEST_DIR)/src/remote/libvirtd.conf
++	install -d $(DEST_DIR)/src/remote/.libs
++	@(if [ -d ../src/remote/.libs ] ; then cd ../src/remote/.libs; fi; \
++	install * $(DEST_DIR)/src/remote/.libs)
 +	install -d $(DEST_DIR)/src/.libs
 +	@(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
 +	install * $(DEST_DIR)/src/.libs)
 +	install -d $(DEST_DIR)/docs/schemas
-+	cp ../docs/schemas/*.rng $(DEST_DIR)/docs/schemas
-+	cp -r ../build-aux $(DEST_DIR)
++	cp $(top_srcdir)/docs/schemas/*.rng $(DEST_DIR)/docs/schemas
++	cp -r $(top_srcdir)/build-aux $(DEST_DIR)
 +	install -d $(DEST_DIR)/examples/xml
-+	cp -r ../examples/xml/test $(DEST_DIR)/examples/xml
++	cp -r $(top_srcdir)/examples/xml/test $(DEST_DIR)/examples/xml
 +	install -d $(DEST_DIR)/tests/.libs
 +	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
 +	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
 +	@(for file in $(PTESTS); do \
 +		if [ -f .libs/$$file ]; then \
 +			install .libs/$$file $(DEST_DIR)/tests; \
++		elif [ -f $(srcdir)/$$file ]; then \
++			install $(srcdir)/$$file $(DEST_DIR)/tests; \
 +		else \
-+			install $$file $(DEST_DIR)/tests; \
++			install $(builddir)/$$file $(DEST_DIR)/tests; \
 +		fi; \
 +	done;)
 +	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
@@ -115,3 +130,6 @@ index 0c4ad3c..bb4e31a 100644
 +
  CLEANFILES = *.cov *.gcov .libs/*.gcda .libs/*.gcno *.gcno *.gcda *.cmi *.cmx \
  	objectlocking-files.txt
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch b/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
deleted file mode 100644
index 3964865..0000000
--- a/recipes-extended/libvirt/libvirt/tests-allow-separated-src-and-build-dirs.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 884b6e3724b75cd92766d5386455983e3557a286 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Fri, 2 May 2014 13:45:05 -0400
-Subject: [PATCH] tests: allow separated src and build dirs
-
-Fixup Makefile.am to search for static files back in srcdir.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- tests/Makefile.am | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0da514b..b8d7c19 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1006,22 +1006,22 @@ install-ptest:
- 	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
- 	install * $(DEST_DIR)/tools)
- 	install -d $(DEST_DIR)/src/network
--	cp ../src/network/*.xml $(DEST_DIR)/src/network
-+	cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
- 	install -d $(DEST_DIR)/src/cpu
--	cp ../src/cpu/*.xml $(DEST_DIR)/src/cpu
-+	cp $(top_srcdir)/src/cpu/*.xml $(DEST_DIR)/src/cpu
- 	install ../src/libvirt_iohelper $(DEST_DIR)/src
- 	install -D ../daemon/libvirtd $(DEST_DIR)/daemon/libvirtd
--	install -D ../daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
-+	install -D $(top_srcdir)/daemon/libvirtd.conf $(DEST_DIR)/daemon/libvirtd.conf
- 	@(if [ -d ../daemon/.libs ] ; then cd ../daemon/.libs; fi; \
- 	install * $(DEST_DIR)/daemon)
- 	install -d $(DEST_DIR)/src/.libs
- 	@(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
- 	install * $(DEST_DIR)/src/.libs)
- 	install -d $(DEST_DIR)/docs/schemas
--	cp ../docs/schemas/*.rng $(DEST_DIR)/docs/schemas
--	cp -r ../build-aux $(DEST_DIR)
-+	cp $(top_srcdir)/docs/schemas/*.rng $(DEST_DIR)/docs/schemas
-+	cp -r $(top_srcdir)/build-aux $(DEST_DIR)
- 	install -d $(DEST_DIR)/examples/xml
--	cp -r ../examples/xml/test $(DEST_DIR)/examples/xml
-+	cp -r $(top_srcdir)/examples/xml/test $(DEST_DIR)/examples/xml
- 	install -d $(DEST_DIR)/tests/.libs
- 	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
- 	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
-@@ -1029,7 +1029,7 @@ install-ptest:
- 		if [ -f .libs/$$file ]; then \
- 			install .libs/$$file $(DEST_DIR)/tests; \
- 		else \
--			install $$file $(DEST_DIR)/tests; \
-+			install $(srcdir)/$$file $(DEST_DIR)/tests; \
- 		fi; \
- 	done;)
- 	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
--- 
-1.8.3.2
-
diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
index a7fc727..5f6f950 100644
--- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
+++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
@@ -1,4 +1,4 @@
-From a790bfe8fa7b24b68cb6f9a1b7205fda2c6d558e Mon Sep 17 00:00:00 2001
+From f73c5c61c921bf773dcba5e4234e23afce5dbe7f Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Fri, 2 Aug 2013 11:38:43 -0400
 Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS is
@@ -11,18 +11,20 @@ link against libvirt-net-rpc which provides the implementation.
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 [ywei: rebased to libvirt-1.3.2]
 Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
+[MA: rebase to v4.3.0]
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  examples/Makefile.am | 19 +++++++++++++++++++
  tools/Makefile.am    | 13 +++++++++++++
  2 files changed, 32 insertions(+)
 
 diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 2adcefb..fff49d4 100644
+index 7069d74..c8893e3 100644
 --- a/examples/Makefile.am
 +++ b/examples/Makefile.am
-@@ -39,6 +39,10 @@ INCLUDES = -I$(top_builddir)/include -I$(top_srcdir)/include -I$(top_srcdir) \
- LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) $(COVERAGE_LDFLAGS) \
- 	$(top_builddir)/src/libvirt.la $(top_builddir)/gnulib/lib/libgnu.la
+@@ -39,6 +39,10 @@ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) $(COVERAGE_LDFLAGS) \
+ 	$(top_builddir)/src/libvirt.la $(top_builddir)/gnulib/lib/libgnu.la \
+ 	$(top_builddir)/src/libvirt-admin.la
  
 +if WITH_GNUTLS
 +LDADD += $(top_builddir)/src/libvirt-net-rpc.la
@@ -30,10 +32,10 @@ index 2adcefb..fff49d4 100644
 +
  noinst_PROGRAMS=dominfo/info1 dommigrate/dommigrate domsuspend/suspend \
  	domtop/domtop hellolibvirt/hellolibvirt object-events/event-test \
- 	openauth/openauth rename/rename
-@@ -52,6 +56,21 @@ object_events_event_test_SOURCES = object-events/event-test.c
- openauth_openauth_SOURCES = openauth/openauth.c
- rename_rename_SOURCES = rename/rename.c
+ 	openauth/openauth rename/rename admin/list_servers admin/list_clients \
+@@ -70,6 +74,21 @@ admin_logging_SOURCES = admin/logging.c
+ INSTALL_DATA_LOCAL =
+ UNINSTALL_LOCAL =
  
 +if WITH_GNUTLS
 +dominfo_info1_LDADD = $(top_builddir)/src/libvirt-net-rpc.la  \
@@ -54,11 +56,11 @@ index 2adcefb..fff49d4 100644
  apparmordir = $(sysconfdir)/apparmor.d/
  apparmor_DATA = \
 diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 0be3567..b3227a7 100644
+index 1452d98..204e772 100644
 --- a/tools/Makefile.am
 +++ b/tools/Makefile.am
-@@ -169,6 +169,13 @@ virt_host_validate_LDADD = \
- 		../gnulib/lib/libgnu.la				\
+@@ -188,6 +188,13 @@ virt_host_validate_LDADD = \
+ 		../gnulib/lib/libgnu.la \
  		$(NULL)
  
 +if WITH_GNUTLS
@@ -69,9 +71,9 @@ index 0be3567..b3227a7 100644
 +
 +
  virt_host_validate_CFLAGS = \
- 		$(LIBXML_CFLAGS)				\
- 		$(WARN_CFLAGS)					\
-@@ -256,6 +263,12 @@ virt_admin_CFLAGS =						\
+ 		$(AM_CFLAGS) \
+ 		$(NULL)
+@@ -268,6 +275,12 @@ virt_admin_CFLAGS = \
  		$(READLINE_CFLAGS)
  BUILT_SOURCES =
  
@@ -85,5 +87,5 @@ index 0be3567..b3227a7 100644
  virsh_LDADD += virsh_win_icon.$(OBJEXT)
  
 -- 
-1.9.1
+2.7.4
 
diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
similarity index 93%
rename from recipes-extended/libvirt/libvirt_1.3.5.bb
rename to recipes-extended/libvirt/libvirt_4.3.0.bb
index 35fd577..a9cc011 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 #
 RDEPENDS_${PN} = "gettext-runtime"
 
-RDEPENDS_${PN}-ptest += "make gawk perl"
+RDEPENDS_${PN}-ptest += "make gawk perl bash"
 
 RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
 RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
@@ -23,29 +23,22 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS_${PN}_libvirtd = "connman"
 
-SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
+SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
            file://libvirtd.sh \
            file://libvirtd.conf \
            file://dnsmasq.conf \
            file://runptest.patch \
            file://run-ptest \
-           file://tests-allow-separated-src-and-build-dirs.patch \
            file://libvirt-use-pkg-config-to-locate-libcap.patch \
            file://0001-to-fix-build-error.patch \
-           file://Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch \
            file://install-missing-file.patch \
-           file://0001-nsslinktest-also-build-virAtomic.h.patch \
-           file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch \
-           file://0001-ptest-add-missing-test_helper-files.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
-	   file://0001-Added-configure-variable-for-placing-systemd-untis-l.patch \
-	   file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
-	   file://Makefiles-Add-more-XDR_CFLAGS-as-needed.patch \
+           file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
-SRC_URI[libvirt.sha256sum] = "93a23c44eb431da46c9458f95a66e29c9b98e37515d44b6be09e75b35ec94ac8"
+SRC_URI[libvirt.md5sum] = "946cfa2558401612c4fcbc934ef9077b"
+SRC_URI[libvirt.sha256sum] = "a531e22c8b985ecb2d1223b913fd6ec0f1800e3ebe02351924274885db20c2b7"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
@@ -119,10 +112,16 @@ FILES_${PN}-libvirtd = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
         "
 
-FILES_${PN}-virsh = "${bindir}/virsh"
+FILES_${PN}-virsh = " \
+    ${bindir}/virsh \
+    ${datadir}/bash-completion/completions/virsh \
+"
+
 FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
 	    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', '${datadir}/polkit-1', '', d)} \
+	    ${datadir}/bash-completion/completions/vsh \
+	    ${datadir}/bash-completion/completions/virt-admin \
 	    "
 
 FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
@@ -267,6 +266,10 @@ do_install_append() {
 		rm -rf ${D}/${datadir}/polkit-1
 	fi
 
+	# disable seccomp_sandbox
+	sed -i '/^#seccomp_sandbox = 1/aseccomp_sandbox = 0' \
+	    ${D}${sysconfdir}/libvirt/qemu.conf
+
 	# Add hook support for libvirt
 	mkdir -p ${D}/etc/libvirt/hooks
 
-- 
2.7.4


