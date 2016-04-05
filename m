Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A84A9E00AE4; Mon,  4 Apr 2016 22:45:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DC24E0096D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Apr 2016 22:45:46 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u355jjet004834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 4 Apr 2016 22:45:45 -0700
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Apr 2016 22:45:44 -0700
From: <jackie.huang@windriver.com>
To: <Mark.Asselstine@windriver.com>, <bruce.ashfield@windriver.com>,
	<meta-virtualization@yoctoproject.org>
Date: Tue, 5 Apr 2016 13:45:33 +0800
Message-ID: <1459835133-3952-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] python-m2crypto: Fix issue with swig 3.0.5
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
X-List-Received-Date: Tue, 05 Apr 2016 05:45:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The version 0.22.3 of python-m2crypto fails to work after
swig updated to 3.0.5+:
AttributeError: 'module' object has no attribute 'PKCS5_SALT_LEN'

It's fixed since 0.22.4 and we could update it to latest version,
but docker-registry depends on the version 0.22.3, so backport
the patch to fix the issue with swig 3.0.5.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../m2crypto-Fix-build-with-SWIG-3.0.5.patch       | 158 +++++++++++++++++++++
 recipes-devtools/python/python-m2crypto_0.22.3.bb  |   4 +-
 2 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch

diff --git a/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch b/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch
new file mode 100644
index 0000000..c408595
--- /dev/null
+++ b/recipes-devtools/python/python-m2crypto/m2crypto-Fix-build-with-SWIG-3.0.5.patch
@@ -0,0 +1,158 @@
+From 8430e7202407fb1a0a104b0decdcc9da9e41a52b Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 4 Apr 2016 23:28:15 -0400
+Subject: [PATCH] Fix build with SWIG 3.0.5
+
+See analysis and previous patches in
+https://github.com/martinpaljak/M2Crypto/issues/60 and
+https://github.com/swig/swig/issues/344, in particular this adds the
+build machinery to patch
+https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489
+
+Fixes #47
+
+Author: Miloslav Trmac <mitr@redhat.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ M2Crypto/__init__.py |  4 ++--
+ M2Crypto/m2.py       |  2 +-
+ SWIG/_lib.i          |  4 ++++
+ SWIG/_pkcs7.i        |  1 +
+ setup.py             | 24 ++++++++++++++++++++++++
+ 5 files changed, 32 insertions(+), 3 deletions(-)
+
+diff --git a/M2Crypto/__init__.py b/M2Crypto/__init__.py
+index 647e057..280af94 100644
+--- a/M2Crypto/__init__.py
++++ b/M2Crypto/__init__.py
+@@ -19,7 +19,7 @@ Copyright 2008-2011 Heikki Toivonen. All rights reserved.
+ version_info = (0, 22)
+ version = '.'.join([str(_v) for _v in version_info])
+ 
+-import __m2crypto
++import _m2crypto
+ import m2
+ import ASN1
+ import AuthCookie
+@@ -47,4 +47,4 @@ import m2xmlrpclib
+ import threading
+ import util
+ 
+-__m2crypto.lib_init()
++_m2crypto.lib_init()
+diff --git a/M2Crypto/m2.py b/M2Crypto/m2.py
+index e4bb695..822143f 100644
+--- a/M2Crypto/m2.py
++++ b/M2Crypto/m2.py
+@@ -25,7 +25,7 @@ Portions created by Open Source Applications Foundation (OSAF) are
+ Copyright (C) 2004 OSAF. All Rights Reserved.
+ """
+ 
+-from __m2crypto import *
++from _m2crypto import *
+ lib_init()
+ 
+ 
+diff --git a/SWIG/_lib.i b/SWIG/_lib.i
+index 0d40698..6cc1a44 100644
+--- a/SWIG/_lib.i
++++ b/SWIG/_lib.i
+@@ -66,6 +66,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
+     int cret;
+     int new_style_callback = 0, warning_raised_exception=0;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     ssl = (SSL *)X509_STORE_CTX_get_app_data(ctx);
+ 
+@@ -151,6 +152,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
+ void ssl_info_callback(const SSL *s, int where, int ret) {
+     PyObject *argv, *retval, *_SSL;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+@@ -170,6 +172,7 @@ DH *ssl_set_tmp_dh_callback(SSL *ssl, int is_export, int keylength) {
+     PyObject *argv, *ret, *_ssl;
+     DH *dh;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+@@ -193,6 +196,7 @@ RSA *ssl_set_tmp_rsa_callback(SSL *ssl, int is_export, int keylength) {
+     PyObject *argv, *ret, *_ssl;
+     RSA *rsa;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+diff --git a/SWIG/_pkcs7.i b/SWIG/_pkcs7.i
+index 22d791a..20dfbaf 100644
+--- a/SWIG/_pkcs7.i
++++ b/SWIG/_pkcs7.i
+@@ -157,6 +157,7 @@ PyObject *smime_read_pkcs7(BIO *bio) {
+     BIO *bcont = NULL;
+     PKCS7 *p7;
+     PyObject *tuple, *_p7, *_BIO;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     if (BIO_method_type(bio) == BIO_TYPE_MEM) {
+         /* OpenSSL FAQ explains that this is needed for mem BIO to return EOF,
+diff --git a/setup.py b/setup.py
+index bac6f9f..f59dc18 100644
+--- a/setup.py
++++ b/setup.py
+@@ -19,6 +19,7 @@ from setuptools.command import build_ext
+ 
+ from distutils.core import Extension
+ from distutils.spawn import find_executable
++from distutils.file_util import copy_file
+ 
+ 
+ class _M2CryptoBuildExt(build_ext.build_ext):
+@@ -77,6 +78,15 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+                           [opensslIncludeDir, os.path.join(opensslIncludeDir, "openssl")]]
+         self.swig_opts.append('-includeall')
+         self.swig_opts.append('-modern')
++        self.swig_opts.append('-builtin')
++
++        # These two lines are a workaround for
++        # http://bugs.python.org/issue2624 , hard-coding that we are only
++        # building a single extension with a known path; a proper patch to
++        # distutils would be in the run phase, when extension name and path are
++        # known.
++        self.swig_opts.append('-outdir')
++        self.swig_opts.append(os.path.join(self.build_lib, 'M2Crypto'))
+ 
+         # Fedora does hat tricks.
+         if platform.linux_distribution()[0] in ['Fedora', 'CentOS']:
+@@ -98,6 +108,20 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+ 
+         self.library_dirs += [os.path.join(self.openssl, opensslLibraryDir)]
+ 
++    def run(self):
++        '''Overloaded build_ext implementation to allow inplace=1 to work,
++        which is needed for (python setup.py test).'''
++        # This is another workaround for http://bugs.python.org/issue2624 + the
++        # corresponding lack of support in setuptools' test command. Note that
++        # just using self.inplace in finalize_options() above does not work
++        # because swig is not rerun if the __m2crypto.so extension exists.
++        # Again, hard-coding our extension name and location.
++        build_ext.build_ext.run(self)
++        if self.inplace:
++            copy_file(os.path.join(self.build_lib, 'M2Crypto', '_m2crypto.py'),
++                      os.path.join('M2Crypto', '_m2crypto.py'),
++                      verbose=self.verbose, dry_run=self.dry_run)
++
+ if sys.platform == 'darwin':
+    my_extra_compile_args = ["-Wno-deprecated-declarations"]
+ else:
+-- 
+1.9.1
+
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 3325455..95d6eec 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -14,7 +14,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
 
 SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
+           file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
+"
 
 SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
 SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
-- 
1.9.1


