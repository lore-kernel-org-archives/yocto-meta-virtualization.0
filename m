Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F03E3E00A85; Tue, 28 Apr 2015 20:10:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CC01E009B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:36 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39aSX000064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:36 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:35 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:46 +0800
Message-ID: <0c31a1790105fe7548e6bc100dfb6ed354124d8a.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 36/55] python-routes: upgrade to 2.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-routes_1.12.3.bb => python-routes_2.1.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-routes_1.12.3.bb => python-routes_2.1.bb} (58%)

diff --git a/meta-openstack/recipes-devtools/python/python-routes_1.12.3.bb b/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-routes_1.12.3.bb
rename to meta-openstack/recipes-devtools/python/python-routes_2.1.bb
index a966fad..dbf6e17 100644
--- a/meta-openstack/recipes-devtools/python/python-routes_1.12.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-routes_2.1.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "A Python re-implementation of the Rails routes system."
 HOMEPAGE = "http://routes.groovie.org"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aa6285dc7b7c93b3905bb2757f33eb62"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=151dabc4f4b91d0ac53e87d5326787fd"
 
-PR = "r0"
 SRCNAME = "Routes"
 
 SRC_URI = "http://pypi.python.org/packages/source/R/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9740ff424ff6b841632c784a38fb2be3"
-SRC_URI[sha256sum] = "eacc0dfb7c883374e698cebaa01a740d8c78d364b6e7f3df0312de042f77aa36"
+SRC_URI[md5sum] = "e6e463318a9dc6ad2f1b3040e998f0b4"
+SRC_URI[sha256sum] = "ebf4126e244cf11414653b5ba5f27ed4abfad38b906a01e5d4c93d3ce5568ea3"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


