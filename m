Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DFC0E00D6B; Thu,  9 May 2019 18:10:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, DATE_IN_PAST_96_XX, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
	date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D0B6E00CB9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 May 2019 18:10:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,451,1549900800"; d="scan'208";a="62322524"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 May 2019 09:10:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 00D4D4CDB74D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 09:10:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 10 May 2019 09:10:39 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1555713609-10594-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 00D4D4CDB74D.AD3E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [m-c-s][PATCH] python-kombu:Upgrade to 4.5.0.
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
Date: Fri, 10 May 2019 01:10:40 -0000
X-Original-Date: Sat, 20 Apr 2019 06:40:09 +0800
X-List-Received-Date: Fri, 10 May 2019 01:10:40 -0000
Content-Type: text/plain

The kombu 4.2.2 can't be download any more.
Refrence to https://pypi.org/project/kombu/#history, the newest version is 4.5.0.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-kombu_4.2.2.bb => python-kombu_4.5.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.2.2.bb => python-kombu_4.5.0.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
index 3cf1035..6db89cc 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
 
-SRC_URI[md5sum] = "0c98ce669cb7a05c5046ea6009c77cba"
-SRC_URI[sha256sum] = "52763f41077e25fe7e2f17b8319d8a7b7ab953a888c49d9e4e0464fceb716896"
+SRC_URI[md5sum] = "6a9f0d07ec3f8b784e9358d04a4709c3"
+SRC_URI[sha256sum] = "389ba09e03b15b55b1a7371a441c894fd8121d174f5583bbbca032b9ea8c9edd"
 
 inherit setuptools pypi
 
-- 
2.7.4




