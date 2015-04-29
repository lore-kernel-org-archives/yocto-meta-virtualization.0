Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3672FE00A16; Tue, 28 Apr 2015 20:10:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93C5FE009CF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:52 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39q7A000091
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:52 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:51 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:09:00 +0800
Message-ID: <245a3823e11b1a0af695ba4c1663e8ae5ad524c4.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 50/55] python-wsme: upgrade to 0.6.4
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-wsme_0.6.bb => python-wsme_0.6.4.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.6.bb => python-wsme_0.6.4.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.6.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.6.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb
index b0c159a..238b67c 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.6.4.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=477dfa54ede28e2f361e7db05941d7a7"
 
-PR = "r0"
 SRCNAME = "WSME"
 
 SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "80a46e564ae0710118ddeded8c5f4412"
-SRC_URI[sha256sum] = "8a37981ebf877d2ca8ae12f6c6fc3d920cb0c9d7be68fef419de252797dfdc15"
+SRC_URI[md5sum] = "0ba96f660c10d41c63d6bb65bfeeed59"
+SRC_URI[sha256sum] = "e4c0012b1a592c3889697259c690447dfc8edcbae5b52307709705377305e953"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


