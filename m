Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59F54E009CE; Tue, 28 Apr 2015 20:09:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77105E009AA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:08 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T398Ng009374
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:08 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:07 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:22 +0800
Message-ID: <546b8812fb12312cef25919f256771bb9633a861.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/55] python-httplib2: upgrade to 0.9.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-httplib2_0.9.bb => python-httplib2_0.9.1.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httplib2_0.9.bb => python-httplib2_0.9.1.bb} (67%)

diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-httplib2_0.9.bb
rename to meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb
index 5c89ca9..d49361b 100644
--- a/meta-openstack/recipes-devtools/python/python-httplib2_0.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.9.1.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A comprehensive HTTP client library"
 HOMEPAGE = "https://code.google.com/p/httplib2/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=baf943a2e2e7f980951b3c56e0c38421"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6010ef08fe55505a5e11ad1f1fb90fb8"
 
-PR = "r0"
 SRCNAME = "httplib2"
 
 SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "09d8e8016911fc40e2e4c58f1aa3ec24"
-SRC_URI[sha256sum] = "39ea8c6a6d9f595c177a16134fc49a990ad8d382758cbf469c8659662f2f51ab"
+SRC_URI[md5sum] = "c49590437e4c5729505d034cd34a8528"
+SRC_URI[sha256sum] = "bc6339919a5235b9d1aaee011ca5464184098f0c47c9098001f91c97176583f5"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


