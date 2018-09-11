Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 787F5E00B23; Tue, 11 Sep 2018 02:29:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98AD5E00B31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 02:29:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44773843"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2018 17:29:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 888AF4B6EC83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 17:29:36 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 11 Sep 2018 17:29:35 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Sep 2018 17:29:14 +0800
Message-ID: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 888AF4B6EC83.A18D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][patch]:python-eventlet:0.21.0->0.24.0
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
X-List-Received-Date: Tue, 11 Sep 2018 09:29:43 -0000
Content-Type: text/plain

update python-eventlet from 0.21.0 to 0.24.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-eventlet_0.21.0.bb => python-eventlet_0.24.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.21.0.bb => python-eventlet_0.24.0.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
rename to meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb
index 47f69ad..fb9d09d 100644
--- a/meta-openstack/recipes-devtools/python/python-eventlet_0.21.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.24.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[md5sum] = "92aaac4c0abaddff9329f55d8f5bcd76"
-SRC_URI[sha256sum] = "08faffab88c1b08bd53ea28bf084a572c89f7e7648bd9d71e6116ac17a51a15d"
+SRC_URI[md5sum] = "40acca39e1da2a79e983a696b9b390a3"
+SRC_URI[sha256sum] = "4c247db031ea374128e8c75a40fe5402c611e9a4798b9f90f095001192f22364"
 
 inherit setuptools pypi
-- 
2.7.4




