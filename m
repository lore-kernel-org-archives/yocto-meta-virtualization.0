Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 428A7E00BE9; Wed,  4 Apr 2018 13:03:26 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A407AE009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K3IPj004223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:18 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:17 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:54 -0400
Message-ID: <1522872176-22946-10-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 10/12] python-voluptuous: Initial version (v0.10.5)
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:26 -0000
Content-Type: text/plain

Required by uprev of python-tooz to v1.48.0.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-voluptuous_0.10.5.bb     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb

diff --git a/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb b/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb
new file mode 100644
index 0000000..0ad4e05
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-voluptuous_0.10.5.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Voluptuous is a Python data validation library"
+HOMEPAGE = "https://pypi.python.org/pypi/voluptuous/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9855ba150f2edb00d8e7a41554896ffb"
+
+SRC_URI[md5sum] = "e3fc99b75618d384cad63bc71b6507bc"
+SRC_URI[sha256sum] = "7a7466f8dc3666a292d186d1d871a47bf2120836ccb900d5ba904674957a2396"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} = " \
+        "
-- 
2.7.4


