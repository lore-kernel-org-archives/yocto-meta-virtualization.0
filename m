Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24421E00C70; Wed,  3 Feb 2016 17:41:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD059E00C6F
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Feb 2016 17:41:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u141fnhK011594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Feb 2016 17:41:49 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:41:49 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 3 Feb 2016 20:40:59 -0500
Message-ID: <1454550104-7065-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
References: <1454550104-7065-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 04/49] python-debtcollector: initial version
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

This package provides a collection of Python deprecation patterns and
strategies that help you collect your technical debt in a
non-destructive manner.

This recipe is required by several python-oslo packages as well as
neutron and nova.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 .../python/python-debtcollector_0.10.0.bb          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-debtcollector_0.10.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_0.10.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_0.10.0.bb
new file mode 100644
index 0000000..3a54eec
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-debtcollector_0.10.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
+HOMEPAGE = "http://docs.openstack.org/developer/debtcollector/"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRCNAME = "debtcollector"
+
+SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "aaf95f5e44af17be4d6421512d4cf6c3"
+SRC_URI[sha256sum] = "8cc22cf2223af7789692ef0b1cb5c0c3a00da7d6e34cbfce125a956cb4d2f21e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+# RDEPENDS_default:
+RDEPENDS_${PN} += " \
+        python-pbr \
+        "
-- 
2.1.4


