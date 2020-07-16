Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.11232.1594887323376213432
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 01:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FE44E01E8A; Thu, 16 Jul 2020 01:15:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B0EEE01E8A
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 01:15:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; 
   d="scan'208";a="96427906"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 16 Jul 2020 16:15:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AEB484CE3F17
	for <meta-virtualization@yoctoproject.org>; Thu, 16 Jul 2020 16:15:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Jul 2020 16:15:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-cliff: upgrade 2.17.0 -> 3.3.0
Date: Fri, 17 Jul 2020 03:42:03 +0800
Message-ID: <1594928524-4453-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AEB484CE3F17.A5842
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-cliff_2.17.0.bb         | 2 --
 .../python/{python-cliff.inc => python3-cliff_3.3.0.bb}     | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb
 rename meta-openstack/recipes-devtools/python/{python-cliff.inc => python3-cliff_3.3.0.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb b/meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb
deleted file mode 100644
index 07923ca..0000000
--- a/meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-cliff.inc
diff --git a/meta-openstack/recipes-devtools/python/python-cliff.inc b/meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-cliff.inc
rename to meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb
index 8a7ec7d..e30bc6b 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff.inc
+++ b/meta-openstack/recipes-devtools/python/python3-cliff_3.3.0.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "d51b9a153c6d9ba597c47bb34cb13366"
-SRC_URI[sha256sum] = "f5a1c6b32047aa0d272398d311fd711d41dd5e1cd5195ebe36ebb47f464416fa"
+SRC_URI[md5sum] = "0e935a090e19358973fdbcc4dfbcdaab"
+SRC_URI[sha256sum] = "611595ad7b4bdf57aa252027796dac3273ab0f4bc1511e839cce230a351cb710"
 
-inherit pypi
+inherit setuptools3 pypi
 
 DEPENDS += "\
     ${PYTHON_PN}-pbr \
-- 
2.25.1



