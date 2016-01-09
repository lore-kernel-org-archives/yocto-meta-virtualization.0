Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C7DDE00911; Sat,  9 Jan 2016 11:27:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54C56E00911
	for <meta-virtualization@yoctoproject.org>;
	Sat,  9 Jan 2016 11:27:25 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u09JROnJ012846
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 9 Jan 2016 11:27:24 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 9 Jan 2016 11:27:24 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 9 Jan 2016 14:27:22 -0500
Message-ID: <1452367642-26161-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452367642-26161-1-git-send-email-mark.asselstine@windriver.com>
References: <1452367642-26161-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 2/2] python-oslo.service: add new recipe to fulfil dependencies
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
X-List-Received-Date: Sat, 09 Jan 2016 19:27:29 -0000
Content-Type: text/plain

This python module is required for the uprev of nova, trove, neutron,
heat... so we are making it available in order to support the pending
uprev of these packages as we move to openstack liberty.

This python module provides a library for running openstack services.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-oslo.service_git.bb              | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.service_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
new file mode 100644
index 0000000..56384bc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.service_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "oslo.service library"
+HOMEPAGE = "https://wiki.openstack.org/wiki/Oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PV = "0.11.0"
+SRCREV = "3336127916edcd1d94f9bb2df978facb434efa5e"
+
+SRCNAME = "oslo.service"
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
+        "
-- 
2.1.4


