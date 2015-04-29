Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F909E00A9B; Tue, 28 Apr 2015 20:10:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AE83E00A31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39lir000085
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:47 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:47 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:56 +0800
Message-ID: <c65a614d28c864f413d974b083c444031b20c344.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 46/55] python-tox: upgrade to 1.9.2
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
 .../python/{python-tox_1.7.1.bb => python-tox_1.9.2.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-tox_1.7.1.bb => python-tox_1.9.2.bb} (85%)

diff --git a/meta-openstack/recipes-devtools/python/python-tox_1.7.1.bb b/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
similarity index 85%
rename from meta-openstack/recipes-devtools/python/python-tox_1.7.1.bb
rename to meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
index 7010fa7..81dbd81 100644
--- a/meta-openstack/recipes-devtools/python/python-tox_1.7.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-tox_1.9.2.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d0fc2c2c954dc4d41043e67d4a8d8e7"
 
-PR = "r0"
 
 SRCNAME = "tox"
 SRC_URI = "http://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec85bbfc7bd29600e91aa0e9754645d0"
-SRC_URI[sha256sum] = "869cb9e07847a9f0238f5a5029f3621504a5a3ec05af6d878e879b354c6851c4"
+SRC_URI[md5sum] = "f4db4d6a82d6a651e457ba55ef370258"
+SRC_URI[sha256sum] = "3125a15da7381f59f835a25bd259a84acb7a69858c81e386c50027bd842bb91b"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


