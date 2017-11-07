Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93C2DE00CCA; Tue,  7 Nov 2017 12:40:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FC45E00D3F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:51 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA7KcpGq017313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:51 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:50 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:33 -0500
Message-ID: <1510087118-28132-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 05/10] python-tenacity: initial version
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
X-List-Received-Date: Tue, 07 Nov 2017 20:40:27 -0000
Content-Type: text/plain

There is a recipe in meta-iot-cloud but it is old and if we can avoid
pulling in yet another layer I think we are better off maintaining our
own copy.

This python package is required by the updated python-oslo.messaging
verison for stable/pike.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-tenacity_4.5.0.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb

diff --git a/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb b/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
new file mode 100644
index 0000000..e48a95b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Retry code until it succeeeds"
+HOMEPAGE = "https://github.com/jd/tenacity"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
+
+inherit pypi
+
+SRC_URI[md5sum] = "7bb60e2bfa59797d415724d7cb770973"
+SRC_URI[sha256sum] = "e5eb0009d7fef345ffd27e43122ec288418b460952aeefde60df8e62c3953d4b"
+
+inherit setuptools
+
+RDEPENDS_${PN} += " \
+        python-six \
+        python-futures \
+        python-monotonic \
+        "
-- 
2.7.4


