Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87193E00D6B; Thu,  9 May 2019 22:42:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, DATE_IN_PAST_96_XX, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
	date
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA3B5E00D46
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 May 2019 22:42:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,452,1549900800"; d="scan'208";a="62353510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 May 2019 13:42:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EAF3C4CDE93C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:42:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 10 May 2019 13:42:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1555729914-11620-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: EAF3C4CDE93C.A281E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [m-c-s][PATCH] python-croniter:update to 0.3.30.
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
Date: Fri, 10 May 2019 05:42:22 -0000
X-Original-Date: Sat, 20 Apr 2019 11:11:54 +0800
X-List-Received-Date: Fri, 10 May 2019 05:42:22 -0000
Content-Type: text/plain

- 0.3.27 can't be download any more.
- Changed license checksum file to docs/LICENSE which is better than PKG-INFO.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-croniter_0.3.27.bb => python-croniter_0.3.30.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-croniter_0.3.27.bb => python-croniter_0.3.30.bb} (68%)

diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
similarity index 68%
rename from meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
rename to meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
index 97df2a9..2859441 100644
--- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
+++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "croniter provides iteration for datetime object with cron like fo
 HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=21cc5101d5b0c940e3354fb1bd26c7e5"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 # Archived version so we have to overwrite what the pypi class will derive
 PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f5543f9f165fe725b2133b698f520380"
-SRC_URI[sha256sum] = "fbd72189a0ff38c27e953d15175c5fedafb953479559240a1afcf8e8e7523757"
+SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
+SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
 
 inherit setuptools pypi
 
-- 
2.7.4




