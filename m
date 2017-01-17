Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6522AE00938; Tue, 17 Jan 2017 10:50:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF9D0E00826
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:49:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HInvCo016604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:49:57 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 10:49:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 17 Jan 2017 13:49:49 -0500
Message-ID: <1484678992-32129-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/4] python-netaddr: uprev to 0.7.19
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
X-List-Received-Date: Tue, 17 Jan 2017 18:50:01 -0000
Content-Type: text/plain

Required for the uprev of python-oslo.config to stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                           |  1 +
 .../recipes-devtools/python/python-netaddr_0.7.14.bb     | 16 ----------------
 .../recipes-devtools/python/python-netaddr_0.7.19.bb     | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 16 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 19e3cb1..f5288e3 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -16,5 +16,6 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
 PREFERRED_VERSION_python-pexpect = "3.3"
 PREFERRED_VERSION_python-futures = "3.0.3%"
 PREFERRED_VERSION_python-django = "1.8.6"
+PREFERRED_VERSION_python-netaddr = "0.7.19"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
deleted file mode 100644
index 346663f..0000000
--- a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.14.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "A library for network address representation and manipulation"
-HOMEPAGE = "https://github.com/drkjam/netaddr"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b277425f87f3b06d25af45d8b96f9682"
-
-SRCNAME = "netaddr"
-
-SRC_URI = "https://pypi.python.org/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.zip"
-
-SRC_URI[md5sum] = "4aecd1ce80ddf242953f2a196046a14a"
-SRC_URI[sha256sum] = "6d19b06b9bb6c9562b5f67ec36511946cfcfebf024a0c804b6fd5c36d3b11fb6"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
diff --git a/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
new file mode 100644
index 0000000..8284d20
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-netaddr_0.7.19.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A library for network address representation and manipulation"
+HOMEPAGE = "https://github.com/drkjam/netaddr"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
+
+SRCNAME = "netaddr"
+
+SRC_URI = "https://pypi.io/packages/source/n/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
+SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
-- 
2.7.4


