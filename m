Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9EEFE007C2; Fri, 20 Jan 2017 13:59:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D6ABE0033D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:45 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0KLxjEG004645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:45 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 13:59:44 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 16:59:33 -0500
Message-ID: <1484949575-2411-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
References: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 4/6] python-requestsexceptions: add new recipe
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
X-List-Received-Date: Fri, 20 Jan 2017 21:59:46 -0000
Content-Type: text/plain

This is required for the uprev of python-os-client-config to the
latest stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-requestsexceptions_1.1.3.bb      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb
new file mode 100644
index 0000000..4975e52
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.1.3.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Import exceptions from potentially bundled packages in requests."
+HOMEPAGE = "https://www.openstack.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
+
+PR = "r0"
+
+SRCNAME = "requestsexceptions"
+SRC_URI = "http://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "edf208c247261157bf7a97d7c792d914"
+SRC_URI[sha256sum] = "d678b872f51f76d875e00e6667f4ddbf013b3a99490ae5fe07cf3e4f846e283e"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+# conflicting file prevention
+do_install_append() {
+	rm -f ${D}${libdir}/python*/site-packages/tests/*
+}
+
+DEPENDS += " \
+        python-pbr-native \
+        "
+
+RDEPENDS_${PN} += " \
+        python-pbr \
+        "
-- 
2.7.4


