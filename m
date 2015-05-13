Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F440E009EB; Wed, 13 May 2015 00:25:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AC95E009FD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:45 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7Ojxj008939
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:45 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:44 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:31 +0800
Message-ID: <78d1fd032cf7ef8f4e3f5021d22e8af5efbb7cc0.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431501591.git.jackie.huang@windriver.com>
References: <cover.1431501591.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] python-enum: add new recipe
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
X-List-Received-Date: Wed, 13 May 2015 07:25:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's required by python-pyscss.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-enum_0.4.4.bb   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb

diff --git a/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
new file mode 100644
index 0000000..4671a59
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Robust enumerated type support in Python"
+DESCRIPTION = "This package provides a module for robust enumerations in Python."
+HOMEPAGE = "https://pypi.python.org/pypi/enum"
+SECTION = "devel/python"
+LICENSE = "GPLv2 | PSFv2"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=4325afd396febcb659c36b49533135d4 \
+                    file://LICENSE.PSF;md5=1ad8a43fc3bbfea1585223c99f4c3e6f \
+"
+
+SRCNAME = "enum"
+SRC_URI = "http://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ce75c7c3c86741175a84456cc5bd531e"
+SRC_URI[sha256sum] = "9bdfacf543baf2350df7613eb37f598a802f346985ca0dc1548be6494140fdff"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+"
+
+RDEPENDS_${PN} += " \
+"
-- 
1.9.1


