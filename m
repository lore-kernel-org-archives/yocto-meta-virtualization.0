Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2E81E00D5E; Tue,  7 Nov 2017 12:40:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E109E00D4E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KcwNx014652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:58 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:38 -0500
Message-ID: <1510087118-28132-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 10/10] python-oslo*: uprev to latest stable/pike
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
X-List-Received-Date: Tue, 07 Nov 2017 20:40:38 -0000
Content-Type: text/plain

Uprev all of the existing 'oslo' packages to the latest commit on the
stable/pike branch. This will allow us to prepare for the uprev of the
main openstack components to stable/pike.

Dependencies are been validated and uprev'd/added as needed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-os-client-config_git.bb   |  6 +++---
 .../recipes-devtools/python/python-oslo.cache_git.bb         |  4 ++--
 .../recipes-devtools/python/python-oslo.concurrency_git.bb   |  8 +++-----
 .../recipes-devtools/python/python-oslo.config_git.bb        |  8 +++++---
 .../recipes-devtools/python/python-oslo.context_git.bb       |  7 ++++---
 meta-openstack/recipes-devtools/python/python-oslo.db_git.bb | 10 +++-------
 .../recipes-devtools/python/python-oslo.i18n_git.bb          |  6 +++---
 .../recipes-devtools/python/python-oslo.log_git.bb           |  7 ++++---
 .../recipes-devtools/python/python-oslo.messaging_git.bb     | 12 ++++--------
 .../recipes-devtools/python/python-oslo.middleware_git.bb    |  7 ++++---
 .../recipes-devtools/python/python-oslo.policy_git.bb        |  6 +++---
 .../recipes-devtools/python/python-oslo.reports_git.bb       |  6 +++---
 .../recipes-devtools/python/python-oslo.rootwrap_git.bb      |  6 +++---
 .../recipes-devtools/python/python-oslo.serialization_git.bb |  6 +++---
 .../recipes-devtools/python/python-oslo.service_git.bb       |  7 ++++---
 .../recipes-devtools/python/python-oslo.utils_git.bb         |  6 +++---
 .../python/python-oslo.versionedobjects_git.bb               |  6 +++---
 .../recipes-devtools/python/python-oslo.vmware_git.bb        |  6 +++---
 .../recipes-devtools/python/python-oslotest_git.bb           |  9 ++++-----
 19 files changed, 64 insertions(+), 69 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
index 5393bb7..e57abbb 100644
--- a/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "1.21.1"
-SRCREV = "c4742ec391151e918046efa5a550e012fe9d5081"
+PV = "1.28.0"
+SRCREV = "261c05f0057d556a8910457f1e22ca4d81801081"
 
 SRCNAME = "os-client-config"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
index a20dfd7..209728e 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.cache_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 PV = "1.14.0+git${SRCPV}"
-SRCREV = "ff5bbb96d73a83c1e25759c42a30f01608de5b8a"
+SRCREV = "f5b6ddf7d18a7e06e19712ca7a2509d658a08c4d"
 
 SRCNAME = "oslo.cache"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
index 7b1fe68..16ebc89 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.14.0+git${SRCPV}"
-SRCREV = "9ac99b675eae255b660b03d3a1e61599d09f8316"
+PV = "3.21.1+git${SRCPV}"
+SRCREV = "8adf9b1f0d69dca7372b967ef4f894487f1a9d64"
 
 SRCNAME = "oslo.concurrency"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -25,11 +25,9 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python-pbr \
         python-fasteners \
-        python-iso8601 \
         python-oslo.config \
         python-oslo.i18n \
         python-oslo.utils \
         python-six \
-        python-retrying \
         python-enum34 \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
index ade23ba..0ccc66e 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PV = "3.17.0+git${SRCPV}"
-SRCREV = "2f2c1839b7423185a6a48e7b3ca3c3274d5ba8f3"
+PV = "4.11.1+git${SRCPV}"
+SRCREV = "fb0738974824af6e1bc7d9fdf32a7c1d3ebf65fb"
 
 SRCNAME = "oslo.config"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -32,4 +32,6 @@ RDEPENDS_${PN} += " \
     python-debtcollector \
     python-oslo.i18n \
     python-rfc3986 \
+    python-pyyaml \
     "
+	
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
index 571e1c2..bf1ae7a 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "oslo.context"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "2.9.0+git${SRCPV}"
-SRCREV = "b8fe4065ab5ee365526ced5aff12eaa0b8409cb7"
+PV = "2.17.0+git${SRCPV}"
+SRCREV = "f4b6914db02e6bcf0de4a97bbc3dc85dd6e06d91"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -27,5 +27,6 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         bash \
         python-pbr \
+        python-debtcollector \
         python-positional \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
index ca48d78..53df106 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "4.13.5+git${SRCPV}"
-SRCREV = "086be4ac91b17942370980a35d67d48d2e42567a"
+PV = "4.25.0+git${SRCPV}"
+SRCREV = "71607d59ec5c02d7beb5109c500aa9b6a0d9ee2c"
 
 SRCNAME = "oslo.db"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -22,12 +22,8 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
        python-six \
        python-alembic \
-       python-babel \
-       python-iso8601 \
-       python-lockfile \
        python-oslo.config \
        python-oslo.i18n \
-       python-oslo.context \
        python-oslo.utils \
        python-sqlalchemy \
        python-sqlalchemy-migrate \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
index 8b6db29..9f7ddc5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.9.0+git${SRCPV}"
-SRCREV = "351c10af6ad6b6fed197cc4b38d9fddf232d0def"
+PV = "3.17.0+git${SRCPV}"
+SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
 
 SRCNAME = "oslo.i18n"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
index 9a819c6..d6ca0ee 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRCNAME = "oslo.log"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "3.16.0+git${SRCPV}"
-SRCREV = "a6efc0e714171d4f5ec8baef46cc8734fb4139dc"
+PV = "3.30.0+git${SRCPV}"
+SRCREV = "ad776e84b51223b85b7dfa85a7e77bb2f3848f4b"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -37,4 +37,5 @@ RDEPENDS_${PN} += " \
         python-pyinotify \
         python-debtcollector \
         python-dateutil \
+        python-monotonic \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
index a960771..6cd5d76 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
 SRCNAME = "oslo.messaging"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "5.10.1+git${SRCPV}"
-SRCREV = "cc1ec4e7f3b395d5f25e7d4922e6359b58a2206a"
+PV = "5.30.1+git${SRCPV}"
+SRCREV = "a07d852b237d229a0f4dd55fd83379c0581e44e9"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -26,8 +26,6 @@ RDEPENDS_${PN} += " \
         python-pbr \
         python-cachetools \
         python-futurist \
-        python-oslo.config \
-        python-oslo.context \
         python-oslo.log \
         python-oslo.utils \
         python-oslo.serialization \
@@ -38,8 +36,6 @@ RDEPENDS_${PN} += " \
         python-debtcollector \
         python-monotonic \
         python-six \
-        python-eventlet \
-        python-greenlet \
         python-webob \
         python-pyyaml \
         python-amqp \
@@ -47,5 +43,5 @@ RDEPENDS_${PN} += " \
         python-pika \
         python-pika-pool \
         python-futures \
-        python-retrying \
+        python-tenacity \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
index 811068a..b02d653 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.19.0+git${SRCPV}"
-SRCREV = "e3e052a92e9eb3e40af3c653281c944d34f822b4"
+PV = "3.30.1+git${SRCPV}"
+SRCREV = "d9ad4bae1e0d6c43a009d393ac94f7ff50116171"
 
 SRCNAME = "oslo.middleware"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
         python-stevedore \
         python-webob \
         python-debtcollector \
+        python-statsd \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
index f586d28..82c3ae0 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
@@ -5,11 +5,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.14.0+git${SRCPV}"
-SRCREV = "018c7475c9dd75da0f902bbe3ec5d01855fa50d6"
+PV = "1.25.1+git${SRCPV}"
+SRCREV = "cb9ab34cd40a7cd9eff0e40ccc2df4ee88edae4e"
 
 SRCNAME = "oslo.policy"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
index 39a1131..fd32326 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.reports_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.14.0+git${SRCPV}"
-SRCREV = "2a9e24502d0960010c00314218ae85a1a04e71b2"
+PV = "1.22.0+git${SRCPV}"
+SRCREV = "a837f40bb0c31958d3ce99e2f9a6eb2fe651f4e6"
 
 SRCNAME = "oslo.reports"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
index 4d62093..2dbbfe8 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PV = "5.1.1+git${SRCPV}"
-SRCREV = "36e9592359f70c720d93b460d33ea136d3945996"
+PV = "5.9.0+git${SRCPV}"
+SRCREV = "b7b63e2ecb50ba66a1f152ae6f71dd208326fbee"
 
 SRCNAME = "oslo.rootwrap"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index 6a747fa..b11957d 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRCNAME = "oslo.serialization"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "2.13.0+git${SRCPV}"
-SRCREV = "be02fdbebc2d9f92a959aa34e0cb5a30934dfa0d"
+PV = "2.20.0+git${SRCPV}"
+SRCREV = "e56d91427c11a3813a0154d47e804018e580086e"
 S = "${WORKDIR}/git"
 
 inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
index f754444..0cea229 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.16.0"
-SRCREV = "e11a2880777249674664ec330004fda5e605ac73"
+PV = "1.25.0"
+SRCREV = "0020bef6a503905aca5cdb70aee54e1c5f2ff472"
 
 SRCNAME = "oslo.service"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -35,3 +35,4 @@ RDEPENDS_${PN} += " \
         python-paste \
         python-routes \
         "
+	
\ No newline at end of file
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index 1ded267..e73bf53 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -5,10 +5,10 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRCNAME = "oslo.utils"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
-PV = "3.16.0+git${SRCPV}"
-SRCREV = "0aae41e0c1d3d965181b22b6fd25fb1bc0442a35"
+PV = "3.28.0+git${SRCPV}"
+SRCREV = "8b3965b9bbe1e31a4939f2f69c5239d6d5c7f72c"
 S = "${WORKDIR}/git"
 
 inherit setuptools
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
index b622736..d62b451 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.17.0+git${SRCPV}"
-SRCREV = "9f33bd4c74949ebe42bffe39c529aa6a1c94e531"
+PV = "1.26.0+git${SRCPV}"
+SRCREV = "78cd10662f20c4ae43e20a2dfa844cfd4e5cae26"
 
 SRCNAME = "oslo.versionedobjects"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
index 8e355d8..f6e7b5e 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.vmware_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "2.14.0+git${SRCPV}"
-SRCREV = "bfd1e0ffd435e637d00ba54ec99aeafe4488eca1"
+PV = "2.23.0+git${SRCPV}"
+SRCREV = "95a30dfa24d259fe16f0fd43eb1b67b9f3fc0397"
 
 SRCNAME = "oslo.vmware"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
index d08e107..20c0b53 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
@@ -6,11 +6,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "2.10.0+git${SRCPV}"
-SRCREV = "a8c5ed4008963a3436f4a4932ac544f5ee4c283b"
+PV = "2.17.0+git${SRCPV}"
+SRCREV = "aea2b5cfd6442195f7ee479e21664631825af924"
 
 SRCNAME = "oslotest"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
@@ -24,12 +24,11 @@ RDEPENDS_${PN} = "python-fixtures \
                   python-subunit \
                   python-six \
                   python-testrepository \
-                  python-testscenarios \
                   python-testtools \
                   python-mock \
                   python-mox3 \
                   python-os-client-config \
                   python-debtcollector \
-                  python-pbr \
                   bash \
 "
+	
\ No newline at end of file
-- 
2.7.4


