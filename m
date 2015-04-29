Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5CB7E00A00; Tue, 28 Apr 2015 20:10:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 132ABE00A04
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39mqi009430
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:48 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:48 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:57 +0800
Message-ID: <1c82ba4aefe4982da64d224503a8f15c6041c578.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 47/55] python-waitress: upgrade to 0.8.9
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-waitress_0.8.7.bb => python-waitress_0.8.9.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-waitress_0.8.7.bb => python-waitress_0.8.9.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-waitress_0.8.7.bb b/meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-waitress_0.8.7.bb
rename to meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb
index 6fc319f..548efd1 100644
--- a/meta-openstack/recipes-devtools/python/python-waitress_0.8.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-waitress_0.8.9.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-PR = "r0"
 SRCNAME = "waitress"
 
 SRC_URI = "https://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "714f3d458d82a47f12fb168460de8366"
-SRC_URI[sha256sum] = "e161e27faa12837739294dd8c837541aa66a5b2764eed753f0bf851d8ac81a74"
+SRC_URI[md5sum] = "da3f2e62b3676be5dd630703a68e2a04"
+SRC_URI[sha256sum] = "826527dc9d334ed4ed76cdae672fdcbbccf614186657db71679ab58df869458a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


