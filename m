Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12300.1601348368043658244
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8F74738C06C2
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:59:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; 
   d="scan'208";a="99697886"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 10:59:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 42B1B48990CC
	for <meta-virtualization@yoctoproject.org>; Tue, 29 Sep 2020 10:59:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 10:59:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-ovs: upgrade 2.7.2 -> 2.13.0
Date: Tue, 29 Sep 2020 22:59:19 +0800
Message-ID: <1601391559-5262-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 42B1B48990CC.A093D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-ovs.inc => python3-ovs_2.13.0.bb}        | 6 +++---
 meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb | 2 --
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-ovs.inc => python3-ovs_2.13.0.bb} (58%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-ovs.inc b/meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
similarity index 58%
rename from meta-openstack/recipes-devtools/python/python-ovs.inc
rename to meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
index d9303f2..4f372bc 100644
--- a/meta-openstack/recipes-devtools/python/python-ovs.inc
+++ b/meta-openstack/recipes-devtools/python/python3-ovs_2.13.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[md5sum] = "8551ed58f4e5878db9a599e2d7792d98"
-SRC_URI[sha256sum] = "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f42200b1674fd60928"
+SRC_URI[md5sum] = "a4a252b3c1c7d3d2d4d622179cff178e"
+SRC_URI[sha256sum] = "c158aaaddbad1f122222f45def50e2bb2f9af4e21a101f5be8488da66d4391f5"
 
-inherit pypi
+inherit setuptools3 pypi
diff --git a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
deleted file mode 100644
index 9c9b82b..0000000
--- a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-ovs.inc
-inherit setuptools3
-- 
2.25.1



