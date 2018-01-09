Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C22BE00DC2; Tue,  9 Jan 2018 12:15:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3115E00C78
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 12:15:19 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w09KFITA002718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Jan 2018 12:15:19 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 9 Jan 2018 12:15:18 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 9 Jan 2018 15:14:55 -0500
Message-ID: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 01/12] python-weakrefmethod: initial version v1.0.3
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
X-List-Received-Date: Tue, 09 Jan 2018 20:15:21 -0000
Content-Type: text/plain

Needed by the stable/pike version of neutron.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-weakrefmethod_1.0.3.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb

diff --git a/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb
new file mode 100644
index 0000000..f14d3e1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "A WeakMethod class for storing bound methods using weak references."
+HOMEPAGE = "https://github.com/twang817/weakrefmethod"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+
+SRC_URI[md5sum] = "39e7450191dea0b17a646b929784ac6f"
+SRC_URI[sha256sum] = "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c1f8a4574301cda66"
+
+inherit setuptools pypi
-- 
2.7.4


