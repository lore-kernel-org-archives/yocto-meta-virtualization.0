Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CF45E00CC4; Mon, 20 Nov 2017 08:17:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60096E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 08:17:15 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAKGHFO9007975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 08:17:15 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 20 Nov 2017 08:17:14 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 20 Nov 2017 11:17:09 -0500
Message-ID: <1511194629-31245-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] python-enum-compat: initial version v0.0.2
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
X-List-Received-Date: Mon, 20 Nov 2017 16:17:16 -0000
Content-Type: text/plain

This will allow packages with 'enum-compat' in their requirements.txt
to not complain/error, even though the real dependency is on 'enum34'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-enum-compat_0.0.2.bb        | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
new file mode 100644
index 0000000..3ae7bb4
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "Python enum/enum34 compatibility package"
+HOMEPAGE = "https://github.com/jstasiak/enum-compat"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
+SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"
+
+inherit setuptools pypi
-- 
2.7.4


