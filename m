Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1DDA4E00DE6; Wed, 12 Jun 2019 01:22:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42710E00B8F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 01:22:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67063179"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 16:21:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5AFE24CDD458
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Jun 2019 16:21:59 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 16:22:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 12 Jun 2019 16:23:12 +0800
Message-ID: <20190612082312.29223-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: 5AFE24CDD458.ACB56
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] remove python-m2crypto
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
X-List-Received-Date: Wed, 12 Jun 2019 08:22:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove python-m2crypto because there is a higher version in meta-oe.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../m2crypto-Fix-build-with-SWIG-3.0.5.patch  | 158 ------------------
 .../python/python-m2crypto_0.22.3.bb          |  63 -------
 2 files changed, 221 deletions(-)
 delete mode 100644 recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch
 delete mode 100644 recipes-devtools/python/python-m2crypto_0.22.3.bb

diff --git a/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch b/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch
deleted file mode 100644
index c408595..0000000
--- a/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 8430e7202407fb1a0a104b0decdcc9da9e41a52b Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 4 Apr 2016 23:28:15 -0400
-Subject: [PATCH] Fix build with SWIG 3.0.5
-
-See analysis and previous patches in
-https://github.com/martinpaljak/M2Crypto/issues/60 and
-https://github.com/swig/swig/issues/344, in particular this adds the
-build machinery to patch
-https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489
-
-Fixes #47
-
-Author: Miloslav Trmac <mitr@redhat.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- M2Crypto/__init__.py |  4 ++--
- M2Crypto/m2.py       |  2 +-
- SWIG/_lib.i          |  4 ++++
- SWIG/_pkcs7.i        |  1 +
- setup.py             | 24 ++++++++++++++++++++++++
- 5 files changed, 32 insertions(+), 3 deletions(-)
-
-diff --git a/M2Crypto/__init__.py b/M2Crypto/__init__.py
-index 647e057..280af94 100644
---- a/M2Crypto/__init__.py
-+++ b/M2Crypto/__init__.py
-@@ -19,7 +19,7 @@ Copyright 2008-2011 Heikki Toivonen. All rights reserved.
- version_info = (0, 22)
- version = '.'.join([str(_v) for _v in version_info])
- 
--import __m2crypto
-+import _m2crypto
- import m2
- import ASN1
- import AuthCookie
-@@ -47,4 +47,4 @@ import m2xmlrpclib
- import threading
- import util
- 
--__m2crypto.lib_init()
-+_m2crypto.lib_init()
-diff --git a/M2Crypto/m2.py b/M2Crypto/m2.py
-index e4bb695..822143f 100644
---- a/M2Crypto/m2.py
-+++ b/M2Crypto/m2.py
-@@ -25,7 +25,7 @@ Portions created by Open Source Applications Foundation (OSAF) are
- Copyright (C) 2004 OSAF. All Rights Reserved.
- """
- 
--from __m2crypto import *
-+from _m2crypto import *
- lib_init()
- 
- 
-diff --git a/SWIG/_lib.i b/SWIG/_lib.i
-index 0d40698..6cc1a44 100644
---- a/SWIG/_lib.i
-+++ b/SWIG/_lib.i
-@@ -66,6 +66,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
-     int cret;
-     int new_style_callback = 0, warning_raised_exception=0;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     ssl = (SSL *)X509_STORE_CTX_get_app_data(ctx);
- 
-@@ -151,6 +152,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
- void ssl_info_callback(const SSL *s, int where, int ret) {
-     PyObject *argv, *retval, *_SSL;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-@@ -170,6 +172,7 @@ DH *ssl_set_tmp_dh_callback(SSL *ssl, int is_export, int keylength) {
-     PyObject *argv, *ret, *_ssl;
-     DH *dh;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-@@ -193,6 +196,7 @@ RSA *ssl_set_tmp_rsa_callback(SSL *ssl, int is_export, int keylength) {
-     PyObject *argv, *ret, *_ssl;
-     RSA *rsa;
-     PyGILState_STATE gilstate;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     gilstate = PyGILState_Ensure();
- 
-diff --git a/SWIG/_pkcs7.i b/SWIG/_pkcs7.i
-index 22d791a..20dfbaf 100644
---- a/SWIG/_pkcs7.i
-+++ b/SWIG/_pkcs7.i
-@@ -157,6 +157,7 @@ PyObject *smime_read_pkcs7(BIO *bio) {
-     BIO *bcont = NULL;
-     PKCS7 *p7;
-     PyObject *tuple, *_p7, *_BIO;
-+    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
- 
-     if (BIO_method_type(bio) == BIO_TYPE_MEM) {
-         /* OpenSSL FAQ explains that this is needed for mem BIO to return EOF,
-diff --git a/setup.py b/setup.py
-index bac6f9f..f59dc18 100644
---- a/setup.py
-+++ b/setup.py
-@@ -19,6 +19,7 @@ from setuptools.command import build_ext
- 
- from distutils.core import Extension
- from distutils.spawn import find_executable
-+from distutils.file_util import copy_file
- 
- 
- class _M2CryptoBuildExt(build_ext.build_ext):
-@@ -77,6 +78,15 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-                           [opensslIncludeDir, os.path.join(opensslIncludeDir, "openssl")]]
-         self.swig_opts.append('-includeall')
-         self.swig_opts.append('-modern')
-+        self.swig_opts.append('-builtin')
-+
-+        # These two lines are a workaround for
-+        # http://bugs.python.org/issue2624 , hard-coding that we are only
-+        # building a single extension with a known path; a proper patch to
-+        # distutils would be in the run phase, when extension name and path are
-+        # known.
-+        self.swig_opts.append('-outdir')
-+        self.swig_opts.append(os.path.join(self.build_lib, 'M2Crypto'))
- 
-         # Fedora does hat tricks.
-         if platform.linux_distribution()[0] in ['Fedora', 'CentOS']:
-@@ -98,6 +108,20 @@ class _M2CryptoBuildExt(build_ext.build_ext):
- 
-         self.library_dirs += [os.path.join(self.openssl, opensslLibraryDir)]
- 
-+    def run(self):
-+        '''Overloaded build_ext implementation to allow inplace=1 to work,
-+        which is needed for (python setup.py test).'''
-+        # This is another workaround for http://bugs.python.org/issue2624 + the
-+        # corresponding lack of support in setuptools' test command. Note that
-+        # just using self.inplace in finalize_options() above does not work
-+        # because swig is not rerun if the __m2crypto.so extension exists.
-+        # Again, hard-coding our extension name and location.
-+        build_ext.build_ext.run(self)
-+        if self.inplace:
-+            copy_file(os.path.join(self.build_lib, 'M2Crypto', '_m2crypto.py'),
-+                      os.path.join('M2Crypto', '_m2crypto.py'),
-+                      verbose=self.verbose, dry_run=self.dry_run)
-+
- if sys.platform == 'darwin':
-    my_extra_compile_args = ["-Wno-deprecated-declarations"]
- else:
--- 
-1.9.1
-
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
deleted file mode 100644
index e151dcc..0000000
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
-SUMMARY = "A Python crypto and SSL toolkit"
-DESCRIPTION = "\
-  M2Crypto is the most complete Python wrapper for OpenSSL featuring RSA, \
-  DSA, DH, EC, HMACs, message digests, symmetric ciphers (including \
-  AES); SSL functionality to implement clients and servers; HTTPS \
-  extensions to Python's httplib, urllib, and xmlrpclib; unforgeable \
-  HMAC'ing AuthCookies for web session management; FTP/TLS client and \
-  server; S/MIME; ZServerSSL: A HTTPS server for Zope and ZSmime: An \
-  S/MIME messenger for Zope. M2Crypto can also be used to provide SSL \
-  for Twisted. \
-  "
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
-
-PYPI_PACKAGE = "M2Crypto"
-
-SRC_URI += " \
-           file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
-"
-
-SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
-SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
-
-DEFAULT_PREFERENCE = "-1"
-
-inherit setuptools pypi
-
-DEPENDS += "openssl swig-native"
-
-DISTUTILS_BUILD_ARGS += "build_ext -I${STAGING_INCDIR}"
-
-inherit setuptools pypi
-
-SWIG_FEATURES_x86-64 = "-D__x86_64__"
-SWIG_FEATURES ?= ""
-export SWIG_FEATURES
-
-# Get around a problem with swig, but only if the
-# multilib header file exists.
-#
-do_compile_prepend() {
-	sed -i -e 's/self.add_multiarch_paths.*$/# &/;'  ${S}/setup.py
-	sed -i -e 's/opensslIncludeDir = .*$/opensslIncludeDir = os.getenv("STAGING_INCDIR")/;'  ${S}/setup.py
-	sed -i -e 's/opensslLibraryDir = .*$/opensslLibraryDir = os.getenv("STAGING_LIBDIR")/;'  ${S}/setup.py
-
-	if [ "${SITEINFO_BITS}" = "64" ];then
-		bit="64"
-	else
-		bit="32"
-	fi
-
-	if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ]; then
-		for i in SWIG/_ec.i SWIG/_evp.i; do
-			sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
-		done
-	elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
-		for i in SWIG/_ec.i SWIG/_evp.i; do
-			sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
-		done
-	fi
-}
-
-- 
2.20.1




