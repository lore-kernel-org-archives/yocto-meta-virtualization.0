Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.3865.1598925425601467162
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 18:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7338AE020EF; Mon, 31 Aug 2020 18:57:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6E0EE020EE
	for <meta-virtualization@yoctoproject.org>; Mon, 31 Aug 2020 18:57:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,377,1592841600"; 
   d="scan'208";a="98753839"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Sep 2020 09:57:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 05F8E48990DC
	for <meta-virtualization@yoctoproject.org>; Tue,  1 Sep 2020 09:56:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Sep 2020 09:56:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-amqp: upgrade 2.4.1 -> 2.6.1
Date: Tue, 1 Sep 2020 09:56:51 +0800
Message-ID: <1598925412-77883-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598925412-77883-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 05F8E48990DC.A45D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-amqp_2.4.1.bb           | 2 --
 .../python/{python-amqp.inc => python3-amqp_2.6.1.bb}       | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
 rename meta-openstack/recipes-devtools/python/{python-amqp.inc => python3-amqp_2.6.1.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb b/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
deleted file mode 100644
index c2710da..0000000
--- a/meta-openstack/recipes-devtools/python/python3-amqp_2.4.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-amqp.inc
diff --git a/meta-openstack/recipes-devtools/python/python-amqp.inc b/meta-openstack/recipes-devtools/python/python3-amqp_2.6.1.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-amqp.inc
rename to meta-openstack/recipes-devtools/python/python3-amqp_2.6.1.bb
index 8863ac2..e2f8282 100644
--- a/meta-openstack/recipes-devtools/python/python-amqp.inc
+++ b/meta-openstack/recipes-devtools/python/python3-amqp_2.6.1.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d6ba772ac59c08a25a12ce15bd5f27b"
 
-SRC_URI[md5sum] = "9e3d5f1f69d2106c2b3f77d275a79924"
-SRC_URI[sha256sum] = "6816eed27521293ee03aa9ace300a07215b11fee4e845588a9b863a7ba30addb"
+SRC_URI[md5sum] = "c8cf9c75d7cd2e747fa49f3e3c47b3b1"
+SRC_URI[sha256sum] = "70cdb10628468ff14e57ec2f751c7aa9e48e7e3651cfd62d431213c0c4e58f21"
 
-inherit pypi
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
         ${PYTHON_PN}-vine \
-- 
2.25.1



