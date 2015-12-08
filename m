Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABB1FE00C16; Tue,  8 Dec 2015 09:34:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C1593E00BA4
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:41 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:40 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:40 +0100
Message-ID: <1449596034-8308-29-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 28/42] keystone: add missing functools32 module
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:59 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

Keystone fails to install due to functools32 missing. Add a new recipe
for functools32 and include the dependency in keystone.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/python-functools32_3.2.3-2.bb           | 29 ++++++++++++++++++++++
 .../recipes-devtools/python/python-keystone_git.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb b/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
new file mode 100644
index 0000000..937e933
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Python higher-order functions and operations on callable objects"
+HOMEPAGE = "https://pypi.python.org/pypi/functools32"
+SECTION = "devel/python"
+LICENSE = "PSFv2"
+
+SRCNAME = "functools32"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
+SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
+SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+DISTUTILS_INSTALL_ARGS = "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
+
+DEPENDS += " \
+	python-pbr \
+	"
+
+RDEPENDS_${PN} += "python-testtools \
+	python-pbr \
+	"
+
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index ed0d7b8..21318d6 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -287,6 +287,7 @@ RDEPENDS_${PN} += " \
         python-fixtures \
         python-oslotest \
         python-cryptography \
+        python-functools32 \
         "
 
 RDEPENDS_${SRCNAME}-tests += " bash"
-- 
2.5.0


