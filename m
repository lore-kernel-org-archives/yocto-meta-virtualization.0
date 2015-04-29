Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A9C1E009E3; Tue, 28 Apr 2015 20:06:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4773CE009B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:57 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T35uik029682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:57 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:56 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:46 +0800
Message-ID: <87398eaaf664209074fdab43bf838a6b76e242e4.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/55] python-coverage: upgrade to 4.0a5
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
X-List-Received-Date: Wed, 29 Apr 2015 03:06:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-coverage_3.7.1.bb => python-coverage_4.0a5.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-coverage_3.7.1.bb => python-coverage_4.0a5.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-coverage_3.7.1.bb b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-coverage_3.7.1.bb
rename to meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
index 037f4f7..4e8e17f 100644
--- a/meta-openstack/recipes-devtools/python/python-coverage_3.7.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-coverage_4.0a5.bb
@@ -7,14 +7,13 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
 
-PR = "r0"
 SRCNAME = "coverage"
 
 SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "c47b36ceb17eaff3ecfab3bcd347d0df"
-SRC_URI[sha256sum] = "d1aea1c4aa61b8366d6a42dd3650622fbf9c634ed24eaf7f379c8b970e5ed44e"
+SRC_URI[md5sum] = "37f4d8ae679b2c43a87da8d519817a3b"
+SRC_URI[sha256sum] = "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a5b04dc8597a07e0e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


