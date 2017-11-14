Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7ADFE00D07; Tue, 14 Nov 2017 09:55:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BED6E00C84
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:55:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAEHtFLp001718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:55:15 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 14 Nov 2017 09:55:14 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 14 Nov 2017 12:55:06 -0500
Message-ID: <1510682106-19326-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python-*: switch remaining pypi recipes to use the pypi class
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
X-List-Received-Date: Tue, 14 Nov 2017 17:55:18 -0000
Content-Type: text/plain

Cleanup the various python-* recipes which download from pypi. The
biggest change is to "inherit pypi" which should result in us always
using current pypi best practices. This will for example ensure we are
using https and not http which is apparently going to be disabled
soon.

Where the default behavior in the pypi class wasn't sufficient we make
use of the PYPI_* variables to overwrite the defaults.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-devtools/python/python-gevent_1.0.1.bb    |  7 +------
 recipes-devtools/python/python-m2crypto_0.22.3.bb | 11 +++++------
 recipes-devtools/python/python-sphinx_1.4.1.bb    |  9 ++-------
 3 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 47f1267..7f1d262 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -11,15 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2"
 DEPENDS += "python-greenlet libevent"
 RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
 
-SRCNAME = "gevent"
-
-SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
 SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://libev-conf.patch"
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 95d6eec..2c2625d 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -13,23 +13,22 @@ DESCRIPTION = "\
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
 
-SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
+PYPI_PACKAGE = "M2Crypto"
+
+SRC_URI += " \
            file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
 "
 
 SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
 SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
 
 DEPENDS += "openssl swig-native"
 
 DISTUTILS_BUILD_ARGS += "build_ext -I${STAGING_INCDIR}"
 
-inherit setuptools
+inherit setuptools pypi
 
 SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
index 835b369..476ff97 100644
--- a/recipes-devtools/python/python-sphinx_1.4.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
@@ -4,14 +4,9 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
 
-PR = "r0"
-SRCNAME = "Sphinx"
-
-SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+PYPI_PACKAGE = "Sphinx"
 
 SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
 SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit setuptools pypi
-- 
2.7.4


