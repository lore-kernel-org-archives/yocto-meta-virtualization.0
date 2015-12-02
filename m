Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 580F1E00C19; Wed,  2 Dec 2015 08:34:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 79F95E009FC
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:35 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:34 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:36 +0100
Message-ID: <1449073966-29707-31-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 30/40] python-cryptography, -vectors: add 0.8.1
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:15 -0000
Content-Type: text/plain

python-cryptography is required by python-pyopenssl >= 0.14
Keystone requires python-cryptography >=0.8

Includes python-cryptography-vectors package for ptest

Over 75k unit tests (100% coverage):
    * tested on nuc (x86) and beaglebone (arm) hardware.
    ** will overload ram on default qemux86/qemuarm

These commit is taken from meta-openembedded/meta-python
revision c346f605766754c02004478371f22609f15ecd1a

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-cryptography-vectors_0.8.1.bb    | 14 +++++++
 .../python/python-cryptography/run-ptest           |  2 +
 .../python/python-cryptography_0.8.1.bb            | 46 ++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography/run-ptest
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography_0.8.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
new file mode 100644
index 0000000..a9b64ed
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Test vectors for the cryptography package."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+DEPENDS = "python-cryptography"
+SRCNAME = "cryptography_vectors"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "04fcfcc61aee62e3b4beb1740cd120ac"
+SRC_URI[sha256sum] = "4a69e66026bfce4b97f75e72fe262f5e8f71daddc081f6608e5b0db89e552504"
+
+inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-cryptography/run-ptest b/meta-openstack/recipes-devtools/python/python-cryptography/run-ptest
new file mode 100644
index 0000000..0ba239c
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cryptography/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+py.test
diff --git a/meta-openstack/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-openstack/recipes-devtools/python/python-cryptography_0.8.1.bb
new file mode 100644
index 0000000..41e4acd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cryptography_0.8.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Provides cryptographic recipes and primitives to Python developers"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
+SRCNAME = "cryptography"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://run-ptest \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "70dde78a5515abdbfd7a3d58f15689ab"
+SRC_URI[sha256sum] = "f4e041bc83c1be94d87116a7aa201c378b7c6581be4d83994b2da0a84499f73b"
+
+inherit pypi
+
+RDEPENDS_${PN} = "\
+                  python-pyasn1\
+                  python-six\
+                  python-cffi\
+                  python-enum34\
+                  python-setuptools\
+                  python-pycparser\
+                  python-subprocess\
+                  python-threading\
+                  python-numbers\
+                  python-contextlib\
+"
+
+RDEPENDS_${PN}-ptest = "\
+                       ${PN}\
+                       python-pytest\
+                       python-pretend\
+                       python-iso8601\
+                       python-cryptography-vectors\
+"
+
+inherit ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/hazmat
+    cp -rf ${S}/tests/hazmat/* ${D}${PTEST_PATH}/tests/hazmat/
+}
-- 
2.1.0


