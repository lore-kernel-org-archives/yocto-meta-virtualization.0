Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3B33E00C7C; Wed,  3 Feb 2016 17:42:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46538E00C66
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141fuXB011600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:56 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:55 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:05 -0500
Message-ID: <1454550104-7065-11-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 10/49] python-oslo*: uprev to versions required by liberty
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:09 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This set of updates is fairly straightforward, for the most part it is
an update of the git SHA and an update of the dependencies.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-oslo.context_git.bb              |  7 +++---
 .../recipes-devtools/python/python-oslo.log_git.bb | 12 ++++++----
 .../python/python-oslo.messaging_git.bb            | 27 ++++++++++++++++++----
 .../python/python-oslo.serialization_git.bb        | 12 ++++++----
 .../python/python-oslo.utils_git.bb                | 15 ++++++++----
 5 files changed, 52 insertions(+), 21 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
index ec2651e..3543cae 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
-
 SRCNAME = "oslo.context"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "0.1.0"
-SRCREV = "205479f254e2bc90c0c142f1f75df500ae94f916"
+PV = "0.8.0+git${SRCPV}"
+SRCREV = "5e677dc2322618dc9b4ac7683b24f91e4e7f5ce2"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,4 +23,5 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         bash \
         python-pbr \
+        python-babel \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
index bfcbe31..d4f7fe0 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
-
 SRCNAME = "oslo.log"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "0.3.0"
-SRCREV = "5139941a0c8d63ae33421a2082e35fae0f800b67"
+PV = "1.13.0+git${SRCPV}"
+SRCREV = "60d9aa05d45bf948106f79ad7257080a731af6c5"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,10 +23,14 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         bash \
         python-pbr \
+        python-six \
+        python-babel \
         python-iso8601 \
         python-oslo.config \
         python-oslo.context \
         python-oslo.i18n \
         python-oslo.utils \
-        python-oslo.serialization\
+        python-oslo.serialization \
+        python-pyinotify \
+        python-debtcollector \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
index 8841ec0..e6c8bf4 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.messaging_git.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
-
 SRCNAME = "oslo.messaging"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "1.6.0"
-SRCREV = "68cd8cfecc12a40b61a7b8557aad7b5a4e1f1c6d"
+PV = "2.7.0+git${SRCPV}"
+SRCREV = "4f49b7e25373d624ae9146dd46d92b90022c979f"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -26,4 +24,25 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         bash \
         python-pbr \
+        python-cachetools \
+        python-trollius \
+        python-aioeventlet \
+        python-futurist \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.log \
+        python-oslo.utils \
+        python-oslo.serialization \
+        python-oslo.middleware \
+        python-oslo.service \
+        python-oslo.i18n \
+        python-stevedore \
+        python-six \
+        python-eventlet \
+        python-greenlet \
+        python-webob \
+        python-pyyaml \
+        python-amqp \
+        python-kombu \
+        python-aioeventlet \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
index db2869c..32b1cc3 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
-
 SRCNAME = "oslo.serialization"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "1.3.0"
-SRCREV = "c89b3f80393b224e4c93f546bc00a4a36c5fb279"
+PV = "1.11.0+git${SRCPV}"
+SRCREV = "a8626ea9f9e37bf4129096cc2295f63516fb768e"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,4 +23,10 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-six \
+        python-babel \
+        python-iso8601 \
+        python-oslo.utils \
+        python-pytz \
+        python-msgpack \
         "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
index 33c7e53..a833f6c 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
-
 SRCNAME = "oslo.utils"
 SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
 
-PV = "1.3.0"
-SRCREV = "ed4e2d775a56b9d47ed314f96dccd9221a91e241"
+PV = "2.7.0+git${SRCPV}"
+SRCREV = "6aa24675e890e0bb61967a3e4c5e6aa8cf3dedcf"
 S = "${WORKDIR}/git"
 
 inherit setuptools
@@ -25,4 +23,13 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-babel \
+        python-six \
+        python-iso8601 \
+        python-oslo.i18n \
+        python-monotonic \
+        python-pytz \
+        python-netaddr \
+        python-netifaces \
+        python-debtcollector \
         "
-- 
2.1.4


