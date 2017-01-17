Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D54BE00935; Tue, 17 Jan 2017 10:05:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08E0FE008D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:05:44 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HI5hJL016317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 10:05:44 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 10:05:42 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 17 Jan 2017 13:05:37 -0500
Message-ID: <1484676338-4704-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/2] python-funcsigs: add new dependency for python-debtcollector
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
X-List-Received-Date: Tue, 17 Jan 2017 18:05:53 -0000
Content-Type: text/plain

The uprev of python-debtcollector to version 1.10.0 requires this
package.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-funcsigs_1.0.2.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
new file mode 100644
index 0000000..07f53da
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
+HOMEPAGE = "http://funcsigs.readthedocs.org"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
+
+SRCNAME = "funcsigs"
+SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
+SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+CLEANBROKEN = "1"
-- 
2.7.4


