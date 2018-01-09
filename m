Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD8F2E00DFC; Tue,  9 Jan 2018 12:15:22 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A56FDE00C78
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:21 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w09KFKIg010260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:21 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:20 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:14:57 -0500
Message-ID: <1515528906-6892-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 03/12] python-ovsdbapp: initial version
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:22 -0000
Content-Type: text/plain

Needed by the stable/pike version of python-neutron.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-ovsdbapp_git.bb | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb b/meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb
new file mode 100644
index 0000000..cc1f424
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-ovsdbapp_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "OVSDB application library"
+HOMEPAGE = "https://github.com/openstack/ovsdbapp"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRCNAME = "ovsdbapp"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+
+PV = "0.4.1+git${SRCPV}"
+SRCREV = "742754bce3c9453f8c7186455a92e4f6d6b18ace"
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
+RDEPENDS_${PN} += " \
+        python-fixtures \
+        python-ovs \
+        python-pbr \
+        "
-- 
2.7.4


