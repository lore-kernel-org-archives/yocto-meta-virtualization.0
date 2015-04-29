Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D31DE009AF; Tue, 28 Apr 2015 20:05:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C896E009A6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:55 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T35sRJ029679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:54 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:54 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:44 +0800
Message-ID: <62d735f77d713fa7bfdac50f011d2a8e38a57beb.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/55] python-amqp: upgrade to 1.4.6
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
X-List-Received-Date: Wed, 29 Apr 2015 03:05:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb} (71%)

diff --git a/meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb b/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
similarity index 71%
rename from meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb
rename to meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
index d10d4e3..273018c 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp_1.3.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-amqp_1.4.6.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
 
-PR = "r0"
 SRCNAME = "amqp"
 
 SRC_URI = "https://pypi.python.org/packages/source/a/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0f15c0cd31bae0563107a22f17cfdf63"
-SRC_URI[sha256sum] = "9d321609f98f6742eeb2f7d22334749936a26047af5563818e175444ad1e2ba4"
+SRC_URI[md5sum] = "a061581b6864f838bffd62b6a3d0fb9f"
+SRC_URI[sha256sum] = "ebcfc867de5a68f9f5ba14d11dbad88e6aff8435a8d39339d5ceb0e5b06de640"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


