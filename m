Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8A91E00932; Wed,  4 Apr 2018 13:03:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DCE4E009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:47 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K3lwH004229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:47 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:46 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:03:39 -0400
Message-ID: <1522872219-23908-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872219-23908-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872219-23908-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 2/2] python-oslo.i18n: was uprev'd incorrectly
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:47 -0000
Content-Type: text/plain

The original commit had a mistake in it giving the impression 3.20.0
was on the stable/pike branch when in fact it was not. We want all
openstack components on stable/pike so this uprev is not valid and we
must bring back the old version and set it as the PREFERRED_VERSION.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                     |  2 ++
 .../python/python-oslo.i18n_3.20.0.bb              | 33 ++++++++++++++++++++++
 .../python/python-oslo.i18n_git.bb                 |  6 ++--
 3 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index c5884c5..2565b92 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -23,4 +23,6 @@ PREFERRED_VERSION_python-eventlet = "0.20.0"
 PREFERRED_VERSION_python-warlock = "1.2.0"
 PREFERRED_VERSION_python-jsonschema = "2.6.0"
 PREFERRED_VERSION_python-networkx = "1.11"
+PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
new file mode 100644
index 0000000..76a8b53
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_3.20.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "oslo.i18n library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+SRCREV = "172e20b10981069c36b0f42377e5b4fbe22a9864"
+
+SRCNAME = "oslo.i18n"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
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
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+        python-pbr-native \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        python-babel \
+        python-pbr \
+        python-six \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
index 9fe3d00..9f7ddc5 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.20.0+git${SRCPV}"
-SRCREV = "172e20b10981069c36b0f42377e5b4fbe22a9864"
+PV = "3.17.0+git${SRCPV}"
+SRCREV = "f2729cd36f8694a6ec53a0e700599ddf4427440d"
 
 SRCNAME = "oslo.i18n"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


