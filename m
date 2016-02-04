Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2050E00CAA; Wed,  3 Feb 2016 17:42:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABC38E00C7E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141fvlD019723
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:57 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:56 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:06 -0500
Message-ID: <1454550104-7065-12-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 11/49] python-*: uprev to versions required for liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:10 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This is a collection of recipe uprevs that bring various packages up
to the version required to support the liberty release.

These uprevs are mostly trivial with the expected SRC_URI and CHECKSUM
updates along with updates to the list of dependencies. Where possible
recipes have been updated to use git to facilitate future uprevs.

For python-futures we need to add a PREFERRED_VERSION to ensure the
git version will take precedence over a versioned recipe found in
another layer.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 meta-openstack/conf/layer.conf                     |  1 +
 ...mbic_0.7.5.post2.bb => python-alembic_0.8.3.bb} |  9 +++++---
 ...thon-cliff_1.13.0.bb => python-cliff_1.15.0.bb} | 15 ++++++++++----
 ...thon-futures_2.2.0.bb => python-futures_git.bb} | 12 +++++------
 ...n-memcached_1.53.bb => python-memcached_git.bb} | 13 ++++++++----
 .../{python-pbr_1.4.0.bb => python-pbr_1.8.1.bb}   |  5 ++---
 ...python-pycadf_0.9.0.bb => python-pycadf_git.bb} |  9 ++++----
 .../python/python-pysaml2_2.4.0.bb                 | 23 ---------------------
 .../recipes-devtools/python/python-pysaml2_git.bb  | 24 ++++++++++++++++++++++
 .../recipes-devtools/python/python-routes_2.1.bb   | 18 ----------------
 .../recipes-devtools/python/python-routes_git.bb   | 17 +++++++++++++++
 ...tevedore_1.6.0.bb => python-stevedore_1.9.0.bb} |  7 ++++---
 .../recipes-devtools/python/python-taskflow_git.bb | 17 +++++++++++----
 ...python-tooz_0.15.0.bb => python-tooz_1.25.0.bb} | 15 ++++++++++++--
 14 files changed, 110 insertions(+), 75 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-alembic_0.7.5.post2.bb => python-alembic_0.8.3.bb} (63%)
 rename meta-openstack/recipes-devtools/python/{python-cliff_1.13.0.bb => python-cliff_1.15.0.bb} (57%)
 rename meta-openstack/recipes-devtools/python/{python-futures_2.2.0.bb => python-futures_git.bb} (53%)
 rename meta-openstack/recipes-devtools/python/{python-memcached_1.53.bb => python-memcached_git.bb} (68%)
 rename meta-openstack/recipes-devtools/python/{python-pbr_1.4.0.bb => python-pbr_1.8.1.bb} (80%)
 rename meta-openstack/recipes-devtools/python/{python-pycadf_0.9.0.bb => python-pycadf_git.bb} (67%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-pysaml2_git.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-routes_2.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-routes_git.bb
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.6.0.bb => python-stevedore_1.9.0.bb} (72%)
 rename meta-openstack/recipes-devtools/python/{python-tooz_0.15.0.bb => python-tooz_1.25.0.bb} (60%)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index f0d42b8..06ed511 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -14,4 +14,5 @@ BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 PREFERRED_VERSION_python-greenlet = "0.4.1"
 PREFERRED_VERSION_python-sqlalchemy = "0.9.7"
 PREFERRED_VERSION_python-pexpect = "3.3"
+PREFERRED_VERSION_python-futures = "3.0.3"
 PREFERRED_VERSION_python-django = "1.8.6"
diff --git a/meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb b/meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb
rename to meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb
index 51b0934..01214e4 100644
--- a/meta-openstack/recipes-devtools/python/python-alembic_0.7.5.post2.bb
+++ b/meta-openstack/recipes-devtools/python/python-alembic_0.8.3.bb
@@ -8,12 +8,15 @@ SRCNAME = "alembic"
 
 SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1814563f5042b28c5c452f2faa895d8e"
-SRC_URI[sha256sum] = "f998184b8cd6d522249e88bb0e7f6ccd80cdd73df50189e85c7c35740b17e7d4"
+SRC_URI[md5sum] = "2e4ef17675316af9f09d749b0aee390e"
+SRC_URI[sha256sum] = "eeac36589c1bf393e2040de01514a0d101ef17039957300209b0b44f3ddffce9"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools 
 
-RDEPENDS_${PN} += "python-sqlalchemy"
+RDEPENDS_${PN} += " \
+    python-sqlalchemy \
+    python-python-editor \
+    "
 
diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
similarity index 57%
rename from meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
index 49d4186..c241ab4 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
@@ -8,12 +8,12 @@ SRCNAME = "cliff"
 
 SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "188212b80ee152ee65b2018975193418"
-SRC_URI[sha256sum] = "2b92d12cf1aa59c0cf1914b4b6b02b78daadac890a53d0e6b71b5220661ab9e0"
+SRC_URI[md5sum] = "23f9187d6d7ffa70d8f725381bb1094f"
+SRC_URI[sha256sum] = "f5ba6fe0940547549947d5a24ca3354145a603d3a9ba054f209d20b66dc02be7"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools rmargparse
 
 DEPENDS += "\
     python-pbr \
@@ -22,6 +22,13 @@ DEPENDS += "\
 RDEPENDS_${PN} += "python-prettytable \
             python-cmd2 \
             python-pbr \
-            python-pyparsing"
+            python-pyparsing \
+            python-prettytable \
+            python-pyparsing \
+            python-six \
+            python-stevedore \
+            python-unicodecsv \
+            python-pyyaml \
+"
 
 CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-futures_2.2.0.bb b/meta-openstack/recipes-devtools/python/python-futures_git.bb
similarity index 53%
rename from meta-openstack/recipes-devtools/python/python-futures_2.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-futures_git.bb
index 7369231..f26be9a 100644
--- a/meta-openstack/recipes-devtools/python/python-futures_2.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-futures_git.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Backport of the concurrent.futures package from Python 3.2"
-HOMEPAGE = "http://code.google.com/p/pythonfutures"
+HOMEPAGE = "https://github.com/agronholm/pythonfutures"
 SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd6708d05936d3f6c4e20ed14c87b5e3"
 
-SRCNAME = "futures"
-SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+PV = "3.0.3+git${SRCPV}"
+SRCREV = "6532a7449d8102c172ea5011f1552fcc163c09f1"
 
-SRC_URI[md5sum] = "310e446de8609ddb59d0886e35edb534"
-SRC_URI[sha256sum] = "151c057173474a3a40f897165951c0e33ad04f37de65b6de547ddef107fd0ed3"
+SRCNAME = "futures"
+SRC_URI = "git://github.com/agronholm/python${SRCNAME}.git"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
diff --git a/meta-openstack/recipes-devtools/python/python-memcached_1.53.bb b/meta-openstack/recipes-devtools/python/python-memcached_git.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-memcached_1.53.bb
rename to meta-openstack/recipes-devtools/python/python-memcached_git.bb
index 20be545..9237af3 100644
--- a/meta-openstack/recipes-devtools/python/python-memcached_1.53.bb
+++ b/meta-openstack/recipes-devtools/python/python-memcached_git.bb
@@ -8,11 +8,16 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PSF.LICENSE;md5=7dd786e8594f1e787da94a946557b40e"
 
-PR = "r0"
+PV = "1.57+git${SRCPV}"
+SRCREV = "664bd3e23fe500fbde4c70636e2d24c8fd2f35af"
 
-SRC_URI = "http://ftp.tummy.com/pub/python-memcached/old-releases/${PN}-${PV}.tar.gz"
+SRC_URI = "git://github.com/linsomniac/${BPN}.git"
 
-SRC_URI[md5sum] = "e0e2b44613bb5443e3411b20f16664e0"
-SRC_URI[sha256sum] = "af04ea031b271a54f085166773e028fe053fc1d9a58cd8b3c3a57945990bfb48"
+S = "${WORKDIR}/git"
 
 inherit setuptools
+
+RDEPENDS_${PN} += " \
+    python-six \
+    "
+
diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
similarity index 80%
rename from meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
index 273fdd4..fdf80b3 100644
--- a/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "pbr"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "21f847dd9d3f9bd37db402067024be98"
-SRC_URI[sha256sum] = "f080232fb6b208615b4c1854bf4277bb097d19c9ef89f94f203c1436fe600e92"
+SRC_URI[md5sum] = "c8f9285e1a4ca6f9654c529b158baa3a"
+SRC_URI[sha256sum] = "e2127626a91e6c885db89668976db31020f0af2da728924b56480fc7ccf09649"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-pycadf_git.bb
index afdc99b..44b4498 100644
--- a/meta-openstack/recipes-devtools/python/python-pycadf_0.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
+PV = "1.1.0+git${SRCPV}"
+SRCREV = "c5dc0d9577e455f149edb5331a6e493def6928d5"
 
 SRCNAME = "pycadf"
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "cadda6f685a31abf18a0efe40541fec8"
-SRC_URI[sha256sum] = "3bda0f95b6defd0d0c6afc827617002ddd0688bed5ccc93a25965aa1d6b40094"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
diff --git a/meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
deleted file mode 100644
index d4cb7fa..0000000
--- a/meta-openstack/recipes-devtools/python/python-pysaml2_2.4.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Python implementation of SAML Version 2 to be used in a WSGI environment"
-HOMEPAGE = "https://github.com/rohe/pysaml2"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=64573b44c7c80d328f0c1a830b44df84"
-
-
-SRCNAME = "pysaml2"
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "9045eb4bd58f6f647de3dd33fe6dfa29"
-SRC_URI[sha256sum] = "a26804150ddc5da803d0df4b7026b613a3571c387fd6d107f6263aabf2c84ec6"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-pysaml2_git.bb b/meta-openstack/recipes-devtools/python/python-pysaml2_git.bb
new file mode 100644
index 0000000..08bb0d6
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pysaml2_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Python implementation of SAML Version 2 to be used in a WSGI environment"
+HOMEPAGE = "https://github.com/rohe/pysaml2"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e53b335c47f863b1e324a1c9f2e8e3f3"
+
+PV = "3.0.2+git${SRCPV}"
+SRCREV = "248c629aa570b16fdc79c5a5eb2b3c4c0ee52916"
+
+SRCNAME = "pysaml2"
+SRC_URI = "git://github.com/rohe/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+	python-zopeinterface \
+	python-repoze.who \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-routes_2.1.bb b/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
deleted file mode 100644
index ad459c7..0000000
--- a/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "A Python re-implementation of the Rails routes system."
-HOMEPAGE = "http://routes.groovie.org"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=151dabc4f4b91d0ac53e87d5326787fd"
-
-SRCNAME = "Routes"
-
-SRC_URI = "http://pypi.python.org/packages/source/R/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e6e463318a9dc6ad2f1b3040e998f0b4"
-SRC_URI[sha256sum] = "ebf4126e244cf11414653b5ba5f27ed4abfad38b906a01e5d4c93d3ce5568ea3"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-repoze.lru"
diff --git a/meta-openstack/recipes-devtools/python/python-routes_git.bb b/meta-openstack/recipes-devtools/python/python-routes_git.bb
new file mode 100644
index 0000000..814339b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-routes_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A Python re-implementation of the Rails routes system."
+HOMEPAGE = "http://routes.groovie.org"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa6285dc7b7c93b3905bb2757f33eb62"
+
+PV = "1.13+git${SRCPV}"
+SRCREV = "467501d5fcfa265b3dfae615e7f0dcda8ce79d4e"
+
+SRCNAME = "Routes"
+SRC_URI = "git://github.com/bbangert/routes.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-repoze.lru"
diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
index de04105..bdacb14 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCNAME = "stevedore"
 SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c53fc7d4408f715339e7fd3e8189ca4e"
-SRC_URI[sha256sum] = "dab2aa31ec742f651e6a2fe0429560aebbbe0fb7fc462fa0ff565c8f5ff2ec25"
+SRC_URI[md5sum] = "53e2bc3b49dd9c920cfce7f63822b1a5"
+SRC_URI[sha256sum] = "cc19908840498ed5f7cb5cf59bbe47b41aa9d65821548e2b3c8a99a571cbec06"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools rmargparse
 
 DEPENDS += " \
         python-pip \
@@ -22,4 +22,5 @@ DEPENDS += " \
 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-argparse \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
index 287a311..088d4d1 100644
--- a/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-taskflow_git.bb
@@ -4,14 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-PR = "r0"
-
 SRC_URI = "\
 	git://git.openstack.org/openstack/taskflow.git;branch=master \
 	"
 
-PV="0.2+git${SRCPV}"
-SRCREV="8800572da240b1f1856898952ce804936dafe49f"
+PV="1.21.0+git${SRCPV}"
+SRCREV="52bd5e89fdddec49907a45e83a7a4b1abd1d1291"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -30,4 +28,15 @@ RDEPENDS_${PN} += " \
         python-babel \
         python-stevedore \
         python-futures \
+        python-futurist \
+        python-fasteners \
+        python-contextlib2 \
+        python-monotonic \
+        python-jsonschema \
+        python-automaton \
+        python-oslo.utils \
+        python-oslo.serialization \
+        python-cachetools \
+        python-debtcollector \
+        python-enum34 \
 	"
diff --git a/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb b/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
rename to meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
index 75e921e..a2c4f52 100644
--- a/meta-openstack/recipes-devtools/python/python-tooz_0.15.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-tooz_1.25.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRCNAME = "tooz"
 SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "741a416818c47b26a6017152daad22ce"
-SRC_URI[sha256sum] = "3a6ae76d8eae96092db0ed340c6ab4bf4d1418eaa19d659a7a56a92227134eb3"
+SRC_URI[md5sum] = "939eaf6c5e49d3a41e8c9f2e92126cfc"
+SRC_URI[sha256sum] = "d61639640b8e4fc64195306f8fae92cf271a002c690bf693ee51f9790cf8141e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -29,4 +29,15 @@ RDEPENDS_${PN} += " \
         python-sysv-ipc \
         python-memcache \
         python-pbr \
+        python-babel \
+        python-stevedore \
+        python-six \
+        python-iso8601 \
+        python-msgpack \
+        python-fasteners \
+        python-retrying \
+        python-futurist \
+        python-oslo.utils \
+        python-oslo.serialization \
+        python-futures \
         "
-- 
2.1.4


