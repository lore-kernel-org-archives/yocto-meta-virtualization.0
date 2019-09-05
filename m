Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCF2BE00D9F; Wed,  4 Sep 2019 20:28:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F9CBE00BA1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 20:28:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74869682"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 11:28:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 479B44CE14E4
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 11:28:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 11:28:04 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 5 Sep 2019 12:27:40 +0900
Message-ID: <20190905032740.39871-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 479B44CE14E4.AFD8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
Subject: [PATCH] python-futurist: upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Thu, 05 Sep 2019 03:28:08 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../{python-futurist_1.8.1.bb => python-futurist_1.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-futurist_1.8.1.bb => python-futurist_1.9.0.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
rename to meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
index 0f35c96..06624c1 100644
--- a/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "3e5a4b8254ded1624ec807cb7ae04ba5"
-SRC_URI[sha256sum] = "499ee57728a987028725f836ac22aa18899702162fa0a0f1bbe2ecd5c8daf1eb"
+SRC_URI[md5sum] = "cbfa47202a5724215edc83cc91bdf0ac"
+SRC_URI[sha256sum] = "0c58c359d0fa09852841efc587870db4c186c7a9175768176f69013c8acd83a6"
 
 inherit setuptools pypi
 
-- 
2.17.1




