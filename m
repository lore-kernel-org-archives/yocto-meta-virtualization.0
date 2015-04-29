Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F37D0E00A28; Tue, 28 Apr 2015 20:09:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1A72E009D7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39NMr000013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:23 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:23 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:35 +0800
Message-ID: <5f6a79af00375b540049769c6ff8dc9ed43301a2.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 25/55] python-oslo.middleware: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:09:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...thon-oslo.middleware_0.4.0.bb => python-oslo.middleware_1.1.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.middleware_0.4.0.bb => python-oslo.middleware_1.1.0.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
index 7f18179..b368eca 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.1.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
 
 SRCNAME = "oslo.middleware"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bca65b0372bd1f13eefa4c7205c9df99"
-SRC_URI[sha256sum] = "d300f8342b5faaf712890d58da111789740aebb4b46874e41b45110b704719cb"
+SRC_URI[md5sum] = "c5ba484ce671a81fa8620bac008796e3"
+SRC_URI[sha256sum] = "0647456ebf1611e2a0efc445673af3583780b0ccf694f61a8830d54fb5d6f63c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


