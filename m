Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4975E007A7; Fri, 20 Jan 2017 12:49:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98EC3E003DB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:49:34 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KKnRX4020767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:49:33 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 12:49:30 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 15:49:22 -0500
Message-ID: <1484945365-12675-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/4] python-positional: add new recipe to support python-oslo.context
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
X-List-Received-Date: Fri, 20 Jan 2017 20:49:39 -0000
Content-Type: text/plain

Required to support the uprev to python-oslo.context to stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-positional_git.bb                | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-positional_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-positional_git.bb b/meta-openstack/recipes-devtools/python/python-positional_git.bb
new file mode 100644
index 0000000..821d704
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-positional_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Library to enforce positional or key-word arguments"
+HOMEPAGE = "https://github.com/morganfainberg/positional"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
+
+SRCNAME = "positional"
+SRC_URI = "git://github.com/morganfainberg/positional \
+"
+
+PV = "1.1.1+git${SRCPV}"
+SRCREV = "1f5e9fc0f50e9e774fc4db27f97f9acae5f0c29f"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    python-wrapt \
+"
\ No newline at end of file
-- 
2.7.4


