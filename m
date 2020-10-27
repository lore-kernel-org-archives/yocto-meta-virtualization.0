Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.9724.1603776538053572985
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 22C2D38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:28:56 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100542285"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:28:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 74ADB4CE3119
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:28:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:28:49 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-repoze.who: upgrade 2.2 -> 2.4
Date: Tue, 27 Oct 2020 13:28:47 +0800
Message-ID: <1603776527-96590-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 74ADB4CE3119.A7046
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-repoze.who_2.2.bb       | 2 --
 .../{python-repoze.who.inc => python3-repoze.who_2.4.bb}    | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
 rename meta-openstack/recipes-devtools/python/{python-repoze.who.inc => python3-repoze.who_2.4.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
deleted file mode 100644
index ee7c23d..0000000
--- a/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-repoze.who.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who.inc b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.4.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-repoze.who.inc
rename to meta-openstack/recipes-devtools/python/python3-repoze.who_2.4.bb
index 1981e03..e75490d 100644
--- a/meta-openstack/recipes-devtools/python/python-repoze.who.inc
+++ b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.4.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-Modification"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
 
-SRC_URI[md5sum] = "c677ac4d4a32b6f6880a8f9cf20adffb"
-SRC_URI[sha256sum] = "322629ec7c779dce4700e8f3ba531002b724d2429178c1cbb0dc169255dc9a8b"
+SRC_URI[md5sum] = "5dc3b549d968a64342f3b7196477c895"
+SRC_URI[sha256sum] = "cf97450de3c8eb5c03b4037be75b018db91befab1094204e452a0b1c0f7a94a6"
 
-inherit pypi
+inherit setuptools3 pypi
 
 # DEPENDS_default: python-pip
 
-- 
2.25.1



