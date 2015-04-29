Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B089E009CE; Tue, 28 Apr 2015 20:09:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9028BE009A6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39AWi009377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:10 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:10 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:24 +0800
Message-ID: <4b95711ec323cfaa5f89bde868d598b1e9f301ec.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/55] python-jsonpath-rw: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{python-jsonpath-rw_1.3.0.bb => python-jsonpath-rw_1.4.0.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonpath-rw_1.3.0.bb => python-jsonpath-rw_1.4.0.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
index daa23a3..61c96d0 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonpath-rw_1.4.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A robust and significantly extended implementation of JSONPath fo
 HOMEPAGE = "https://github.com/kennknowles/python-jsonpath-rw"
 SECTION = "devel/python"
 LICENSE = "BSD+"
-LIC_FILES_CHKSUM = "file://README.rst;md5=e3c17535d150260c7235db4e85145fa1"
+LIC_FILES_CHKSUM = "file://README.rst;md5=02384665f821c394981e0dd1faec9a7d"
 
-PR = "r0"
 SRCNAME = "jsonpath-rw"
 
 SRC_URI = "http://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5d1d8d10a21b38637cbd0a84f4b30843"
-SRC_URI[sha256sum] = "d4869e5c540e797189acca97f1fef2dfaf5dc3560fd25109d44e353e8eacabbc"
+SRC_URI[md5sum] = "3a807e05c2c12158fc6bb0a402fd5778"
+SRC_URI[sha256sum] = "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45edc89b11fac4fbec"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


