Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BE66E00D59; Thu, 25 Jul 2019 02:27:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F7A9E00C27
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 02:27:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6P9RqWY003884
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 02:27:52 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 25 Jul 2019 02:27:51 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 17:27:50 +0800
Message-ID: <1564046870-85566-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] libbsd: remove bbappend
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
X-List-Received-Date: Thu, 25 Jul 2019 09:27:54 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

The bbappend only has below logic:
inherit autotools-brokensep

Actually libbsd can build successfully with a
separate build directory which also means B != S,
so no need to switch to inherit autotools-brokensep
from the default autotools class.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend

diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend b/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
deleted file mode 100644
index 7447c56..0000000
--- a/meta-openstack/recipes-support/libbsd/libbsd_0.9.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-inherit autotools-brokensep
-- 
2.7.4


