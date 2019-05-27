Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15559E00C7D; Sun, 26 May 2019 22:29:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D8DEE00C36
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 22:28:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64758641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 13:28:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A49B54CD9588
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 13:29:00 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:29:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 13:30:00 +0800
Message-ID: <20190527053000.29584-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A49B54CD9588.A9A41
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-requestsexceptions:upgrade 1.3.0 -> 1.4.0
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
X-List-Received-Date: Mon, 27 May 2019 05:29:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-requestsexceptions_1.3.0.bb to python-requestsexceptions_1.4.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...exceptions_1.3.0.bb => python-requestsexceptions_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-requestsexceptions_1.3.0.bb => python-requestsexceptions_1.4.0.bb} (77%)

diff --git a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
similarity index 77%
rename from meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
index 17ffa8a..729e3d7 100644
--- a/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-requestsexceptions_1.4.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
-SRC_URI[md5sum] = "85c9a2c5c5ecbd2deb0a491613fbdd12"
-SRC_URI[sha256sum] = "8f141ba636d6748cd29208c1955bde38bf00fcdda1a685bc09d8ed133700353e"
+SRC_URI[md5sum] = "f43b246ccd7d5b618e6f0dc946a6c3f3"
+SRC_URI[sha256sum] = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"
 
 inherit setuptools pypi
 
-- 
2.20.1




