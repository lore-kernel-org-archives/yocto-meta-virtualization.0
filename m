Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07B20E00CD0; Wed,  3 Feb 2016 17:42:43 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3B12E00C8F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:42:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141gIwV011621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:42:18 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:42:18 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:41:26 -0500
Message-ID: <1454550104-7065-32-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 31/49] python-designateclient: initial version
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
X-List-Received-Date: Thu, 04 Feb 2016 01:42:43 -0000
Content-Type: text/plain

From: Mark Asselstine <asselsm@gmail.com>

This package provides Python bindings to the Designate API.

This package is required by heat.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-designateclient_git.bb           | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-designateclient_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
new file mode 100644
index 0000000..d8477d5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Python bindings to the Designate API"
+HOMEPAGE = "https://github.com/openstack/python-designateclient"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} +=" \
+        python-cliff \
+        python-jsonschema \
+        python-oslo.utils \
+        python-pbr \
+        python-keystoneclient \
+        python-requests \
+        python-six \
+        python-stevedore \
+        python-debtcollector \
+	"
+
+SRCNAME = "designateclient"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
+
+PV = "1.5.0+git${SRCPV}"
+SRCREV = "b97ae05612522180cc6f64485212811329da9645"
+S = "${WORKDIR}/git"
+
+inherit setuptools
-- 
2.1.4


