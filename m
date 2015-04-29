Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D037E00A07; Tue, 28 Apr 2015 20:10:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16487E00A68
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39veN009442
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:57 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:57 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:05 +0800
Message-ID: <2e90e9771a1f31287429e969caf469a8b5f6f730.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 55/55] python-setuptools-git: upgrade to 1.1
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:47 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb
rename to meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
index 8c41969..9447744 100644
--- a/meta-openstack/recipes-devtools/python/python-setuptools-git_1.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-setuptools-git_1.1.bb
@@ -4,15 +4,14 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3775480a712fc46a69647678acb234cb"
 
-PR = "r0"
 SRCNAME = "setuptools-git"
 
-SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}b1.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ac67cbaa1336b7de25b1b5ff93b4e90d"
-SRC_URI[sha256sum] = "dccd496b4166315c2b6b842f3dcd417b22e2cb43aaa4a8983b1ea0ceae0fe328"
+SRC_URI[md5sum] = "7b5967e9527c789c3113b07a1f196f6e"
+SRC_URI[sha256sum] = "047d7595546635edebef226bc566579d422ccc48a8a91c7d32d8bd174f68f831"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}b1"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-- 
1.9.1


