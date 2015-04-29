Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2EB4EE00A97; Tue, 28 Apr 2015 20:10:15 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11367E009A6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:42 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39fpw009421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:41 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:41 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:51 +0800
Message-ID: <132dd0a59b0b63c01a235456da4734914fc140d2.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 41/55] python-subunit: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb
rename to meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
index df3ceee..b775dff 100644
--- a/meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb
+++ b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=a6d86940a8393cf77ecc299eff036a1c"
+LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
 
-PR = "r0"
 SRCNAME = "python-subunit"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "65e43979f1156911a468fa76cc192c0a"
-SRC_URI[sha256sum] = "3be52e3754e6033292851ea28745706fb5941d2f4f347833af46c0a895dba46d"
+SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
+SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


