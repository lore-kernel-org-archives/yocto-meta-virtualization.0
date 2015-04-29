Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3104E00A90; Tue, 28 Apr 2015 20:10:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A9FBE00A26
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:41 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39eaP000073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:40 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:40 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:50 +0800
Message-ID: <8b53235c789a2d4a4fb441f103026ef9d1233b2b.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 40/55] python-stevedore: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-stevedore_1.2.0.bb => python-stevedore_1.4.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.2.0.bb => python-stevedore_1.4.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb
rename to meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb
index 0f493eb..cf1af85 100644
--- a/meta-openstack/recipes-devtools/python/python-stevedore_1.2.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.4.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PR = "r0"
 
 SRCNAME = "stevedore"
 SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bd82728ab03e62121fbbb077bcd55fdb"
-SRC_URI[sha256sum] = "3f70db9052c26e66dac61cb73d8c6f5211373983d39872addab617c759db4b45"
+SRC_URI[md5sum] = "5d93cb6eaa3abf49e86b8a6cf133eee4"
+SRC_URI[sha256sum] = "4a8d80b0a232746c09e0173bd61d60a18e9864e3dc87e3ebefa3ba3d8a00232f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


