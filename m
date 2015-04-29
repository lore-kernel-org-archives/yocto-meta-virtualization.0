Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0125E00A7D; Tue, 28 Apr 2015 20:09:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C93EE009D2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:33 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39WUO000046
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:32 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:32 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:43 +0800
Message-ID: <9044057d4e90f0d3106a9a8777dbccef138e1541.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 33/55] python-pyscss: upgrade to 1.3.4
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb
rename to meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
index d52fe05..f26352a 100644
--- a/meta-openstack/recipes-devtools/python/python-pyscss_1.2.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-pyscss_1.3.4.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=28155276e8df3f75bbd327335f66f2fa"
 
-PR = "r0"
 
 SRCNAME = "pyScss"
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "9a5c24922643f6e90ea03d520700521b"
-SRC_URI[sha256sum] = "6f486363f5fac20d218dc5d11b8af4e5b52242a59e5067f42ca227152a7df3cc"
+SRC_URI[md5sum] = "9527b4864cd6023f77a8277e6fb773d7"
+SRC_URI[sha256sum] = "d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


