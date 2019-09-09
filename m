Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2BF4E00DCE; Sun,  8 Sep 2019 23:39:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D905E00782
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2019 23:39:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x896dSY0027117
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 8 Sep 2019 23:39:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 8 Sep 2019 23:39:17 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 14:39:14 +0800
Message-ID: <1568011154-291249-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
References: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-openstack][PATCH 2/2] python-futures: remove this recipe
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
X-List-Received-Date: Mon, 09 Sep 2019 06:39:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

python-futures under meta-openstack has version 3.3.0, and
is same version with python-futures under meta-oe,
so remove this one

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/python/python-futures_git.bb  | 25 ----------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-futures_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-futures_git.bb b/meta-openstack/recipes-devtools/python/python-futures_git.bb
deleted file mode 100644
index 015ae5f..0000000
--- a/meta-openstack/recipes-devtools/python/python-futures_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Backport of the concurrent.futures package from Python 3.2"
-HOMEPAGE = "https://github.com/agronholm/pythonfutures"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd6708d05936d3f6c4e20ed14c87b5e3"
-
-PV = "3.3.0+git${SRCPV}"
-SRCREV = "ec78e222ece60721fc92a6c650df3116cb15d24e"
-
-SRCNAME = "futures"
-SRC_URI = "git://github.com/agronholm/python${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        python-pip \
-        "
-
-# RDEPENDS_default: 
-RDEPENDS_${PN} += " \
-        "
-- 
2.7.4


