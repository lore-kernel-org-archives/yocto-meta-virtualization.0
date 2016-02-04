Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D46CE00C6F; Wed,  3 Feb 2016 17:41:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96787E00C69
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:48 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u141flhk019708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:47 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:40:57 -0500
Message-ID: <1454550104-7065-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 02/49] python-oslo*: convert to 'git' and uprev
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
X-List-Received-Date: Thu, 04 Feb 2016 01:41:55 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

These python-oslo* recipes did not previously use git so switching
them to make future uprevs simpler. While we are at it uprev to the
version required for the liberty release.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 ...ncy_1.9.0.bb => python-oslo.concurrency_git.bb} | 18 +++++++---
 .../python/python-oslo.config_1.14.0.bb            | 23 -------------
 .../python/python-oslo.config_git.bb               | 27 +++++++++++++++
 ...thon-oslo.db_1.9.0.bb => python-oslo.db_git.bb} | 15 +++++----
 ...-oslo.i18n_1.6.0.bb => python-oslo.i18n_git.bb} | 10 +++---
 .../python/python-oslo.middleware_1.1.0.bb         | 28 ----------------
 .../python/python-oslo.middleware_git.bb           | 38 ++++++++++++++++++++++
 ...o.policy_0.4.0.bb => python-oslo.policy_git.bb} | 15 +++++----
 ...otwrap_1.7.0.bb => python-oslo.rootwrap_git.bb} | 10 +++---
 .../python/python-oslo.vmware_1.19.0.bb            | 25 --------------
 .../python/python-oslo.vmware_git.bb               | 37 +++++++++++++++++++++
 ...on-oslotest_1.6.0.bb => python-oslotest_git.bb} | 14 ++++----
 12 files changed, 148 insertions(+), 112 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.concurrency_1.9.0.bb => python-oslo.concurrency_git.bb} (52%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
 rename meta-openstack/recipes-devtools/python/{python-oslo.db_1.9.0.bb => python-oslo.db_git.bb} (67%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.6.0.bb => python-oslo.i18n_git.bb} (62%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
 rename meta-openstack/recipes-devtools/python/{python-oslo.policy_0.4.0.bb => python-oslo.policy_git.bb} (59%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.rootwrap_1.7.0.bb => python-oslo.rootwrap_git.bb} (60%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
 rename meta-openstack/recipes-devtools/python/{python-oslotest_1.6.0.bb => python-oslotest_git.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
similarity index 52%
rename from meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
index c82f6ba..6956504 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+PV = "2.8.0+git${SRCPV}"
+SRCREV = "28fb7e8bb0dfc39e9f5ed46ade65ea85048efc34"
 
 SRCNAME = "oslo.concurrency"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "32d21336b17086521599f5e15891a2bb"
-SRC_URI[sha256sum] = "6b47dfdc8213226053b95def19ed3c7fc492b3d4c1b3c0a61381cddf8dbbf67c"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
@@ -25,4 +24,13 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-fasteners \
+        python-babel \
+        python-iso8601 \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-six \
+        python-retrying \
+        python-enum34 \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
deleted file mode 100644
index fd4f9fe..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.14.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
-HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/1.1.0"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
-
-SRCNAME = "oslo.config"
-
-SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "1ef0fb7c6ec5c8bdb0e0340a2e404967"
-SRC_URI[sha256sum] = "0f9b5a12dae4f26aa8a82e71523a20ce183269b56722ccf3fd2149b1bba7d46a"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pbr \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += "python-pbr"
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
new file mode 100644
index 0000000..abd3269
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
+HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/2.6.0"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
+
+PV = "2.6.0+git${SRCPV}"
+SRCREV = "ee2bab65e9a2f38bb915f106a4da1520e4b5060c"
+
+SRCNAME = "oslo.config"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools rmargparse
+
+DEPENDS += " \
+        python-pbr \
+        python-pip \
+        "
+
+RDEPENDS_${PN} += " \
+    python-pbr \
+    python-netaddr \
+    python-six \
+    python-stevedore \
+    "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
index 30f98f5..f3f7074 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_1.9.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+PV = "3.1.0+git${SRCPV}"
+SRCREV = "3afd58f6ab0fc2acb1dd92f652cec48e87763cf6"
 
 SRCNAME = "oslo.db"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "1ab1e83d18761b8411f44983ae749da1"
-SRC_URI[sha256sum] = "028ed6a38c1ed6d39d04f3dc2d7b7e2e0aca3cf53e72e145c3c07a5a0fb80eb8"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
@@ -21,13 +20,17 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += " \
+       python-six \
        python-alembic \
        python-babel \
        python-iso8601 \
        python-lockfile \
        python-oslo.config \
+       python-oslo.i18n \
+       python-oslo.context \
+       python-oslo.utils \
        python-sqlalchemy \
        python-sqlalchemy-migrate \
        python-stevedore \
        python-pbr \
-        "
+       "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
index 2b47833..84aab41 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+PV = "2.6.0+git${SRCPV}"
+SRCREV = "4417d33a9fa6f3c414d72d162a4d0d3715ffe256"
 
 SRCNAME = "oslo.i18n"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "c109e20b99bb0ec8d85a583bf503e6a5"
-SRC_URI[sha256sum] = "29be916f3f4c79cca76d57e604a187b3020354a2ca89d486647b79d8a9adbb9e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
@@ -26,4 +25,5 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python-babel \
         python-pbr \
+        python-six \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
deleted file mode 100644
index 5c891f3..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Oslo Middleware library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-
-SRCNAME = "oslo.middleware"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c5ba484ce671a81fa8620bac008796e3"
-SRC_URI[sha256sum] = "0647456ebf1611e2a0efc445673af3583780b0ccf694f61a8830d54fb5d6f63c"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        python-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
new file mode 100644
index 0000000..ef624f3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Oslo Middleware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "2.10.0+git${SRCPV}"
+SRCREV = "8a892308e706b46620e3b73aa16a8e969ee80739"
+
+SRCNAME = "oslo.middleware"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-ordereddict \
+        python-babel \
+        python-jinja2 \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-six \
+        python-stevedore \
+        python-webob \
+        python-debtcollector \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
similarity index 59%
rename from meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
index bfd6953..01a9491 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
@@ -1,18 +1,17 @@
 SUMMARY = "Oslo Policy library"
 DESCRIPTION = "The Oslo Policy library provides support for RBAC policy enforcement across all OpenStack services."
-HOMEPAGE = "https://pypi.python.org/pypi/oslo.policy"
+HOMEPAGE = "https://github.com/openstack/oslo.policy"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
+PV = "0.12.0+git${SRCPV}"
+SRCREV = "dee7171326e138128486f1d2c3f7e639af875198"
 
 SRCNAME = "oslo.policy"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "a0ddfa5782191c218e1e100234550295"
-SRC_URI[sha256sum] = "7e8a82e617516722043f437825ed5ada422632ee432cc64ede7c4854209cd329"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
@@ -25,5 +24,7 @@ RDEPENDS_${PN} += " \
         python-oslo.config \
         python-oslo.i18n \
         python-oslo.serialization \
-        python-pbr \
+        python-oslo.utils \
+        python-six \
+        python-requests \
 "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
index d391ed3..3cae4c9 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.7.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
@@ -4,14 +4,13 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
+PV = "2.5.0+git${SRCPV}"
+SRCREV = "31cfdbd4076bb6556cf9612171ba43fa44475d71"
 
 SRCNAME = "oslo.rootwrap"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-SRC_URI[md5sum] = "ad58d59df829a672d8ab41f47761f6a7"
-SRC_URI[sha256sum] = "d84305c63bfab0e0bc3d120ce686f66468b02d60ecd5985257f1263cd1468d0b"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
@@ -25,4 +24,5 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-six \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
deleted file mode 100644
index f39ff57..0000000
--- a/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "oslo.vmware library"
-HOMEPAGE = "http://launchpad.net/oslo"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-
-SRCNAME = "oslo.vmware"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "3115d6922ed7119cf3737af708a7984d"
-SRC_URI[sha256sum] = "d342420fa272bd80ac9c39e876ee1a518b975d21cff1c179a91da48305c9b3b4"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        python-pbr \
-        "
-
-RDEPENDS_${PN} += " \
-        python-pbr \
-        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
new file mode 100644
index 0000000..8ffe7ee
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "oslo.vmware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+PV = "1.23.0+git${SRCPV}"
+SRCREV = "9fa40986c259d22a3dee8155b4bce793505d53e1"
+
+SRCNAME = "oslo.vmware"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        python-stevedore \
+        python-netaddr \
+        python-iso8601 \
+        python-six \
+        python-oslo.i18n \
+        python-oslo.utils \
+        python-oslo.concurrency \
+        python-babel \
+        python-pyyaml \
+        python-suds-jurko \
+        python-eventlet \
+        python-requests \
+        python-urllib3 \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslotest_git.bb
index 6f4f766..58b79b6 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
@@ -3,18 +3,16 @@ The oslotest package can be cross-tested against its consuming projects to ensur
 that no changes to the library break the tests in those other projects."
 HOMEPAGE = "https://pypi.python.org/pypi/oslotest"
 SECTION = "devel/python"
-LICENSE = "BSD"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRCNAME = "oslotest"
-
-SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
+PV = "1.12.0+git${SRCPV}"
+SRCREV = "b5e355fcecdf7727fe33e355c4f87d1971b5fef5"
 
-SRC_URI[md5sum] = "54ba62e2e13619616ddce772fb267106"
-SRC_URI[sha256sum] = "cb65b53b753375b669dcdb4717c362a205d19e3d16ca26310c0916cfd359354c"
+SRCNAME = "oslotest"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit setuptools
 
-- 
2.1.4


