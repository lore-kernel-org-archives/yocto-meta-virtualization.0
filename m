Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3E3FE009C7; Tue, 28 Apr 2015 20:05:57 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3410EE00932
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:56 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T35uY7009358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:05:56 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:05:55 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:05:45 +0800
Message-ID: <87e350bf504735a9fec5d395ab414c52a5934d30.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/55] python-cliff: upgrade to 1.12.0
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
X-List-Received-Date: Wed, 29 Apr 2015 03:05:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/{python-cliff_1.10.0.bb => python-cliff_1.12.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_1.10.0.bb => python-cliff_1.12.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
index 7a6bb83..e6da930 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_1.12.0.bb
@@ -4,13 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PR = "r0"
 SRCNAME = "cliff"
 
 SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8f3f67d57bf5a2541efeedcea1aa64ab"
-SRC_URI[sha256sum] = "209882e199fdf98aeed0db44b922aa688e5a66d81c45148a5743804f9aa680e1"
+SRC_URI[md5sum] = "feaa48620db2aeb9306ff33e5494fccc"
+SRC_URI[sha256sum] = "7609abc1789522fc4e228ea5567a9fd1db3963850396178adca3332cdd9c929a"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


