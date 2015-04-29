Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9681E00AB7; Tue, 28 Apr 2015 20:10:29 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64BD6E00A4F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39pDb009433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:51 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:50 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:59 +0800
Message-ID: <2c6c16faa8b538c3b398a19360ddf5cf1df42c0d.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 49/55] python-webtest: upgrade to 2.0.18
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-webtest_2.0.9.bb => python-webtest_2.0.18.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.9.bb => python-webtest_2.0.18.bb} (74%)

diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.9.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb
similarity index 74%
rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.9.bb
rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb
index 724607e..314cf4c 100644
--- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.18.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=7ddcdd3b8e69edc8c5ae7e6bb64f0bc5"
 
-PR = "r0"
 SRCNAME = "WebTest"
 
 RDEPENDS_${PN} += "python-beautifulsoup4"
 
 SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "bf0a04fcf8b2cdcaa13b04324cefb53d"
-SRC_URI[sha256sum] = "749f527b39893b1757abd0e6814bde811eb25a6cf42538585c971afdb9030dad"
+SRC_URI[md5sum] = "444a4160408670a50d7cb149a4035cf5"
+SRC_URI[sha256sum] = "beb569e6d707cb4cd82c226c97b7e1f41cd62bae656d89e687107eef8376c7fd"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


