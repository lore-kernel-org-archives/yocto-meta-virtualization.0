Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69E02E00524; Mon, 23 Jan 2017 13:39:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [147.11.146.13 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14A2AE0049D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:39:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NLdvlF023786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:39:57 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:39:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:39:54 -0500
Message-ID: <1485207594-7714-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-rcssmin: initial version
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
X-List-Received-Date: Mon, 23 Jan 2017 21:39:59 -0000
Content-Type: text/plain

This package is required to support the uprev of
python-django-compressor to v2.1.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-rcssmin_1.0.6.bb                 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
new file mode 100644
index 0000000..6d412cc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "RCSSmin is a CSS minifier."
+HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRCNAME = "rcssmin"
+
+SRC_URI = "https://pypi.io/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
+SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools 
+
+RDEPENDS_${PN} += " \
+        "
+
+CLEANBROKEN = "1"
-- 
2.7.4


