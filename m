Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.9545.1603775054580616682
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 22:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1854C38C1176
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 22:04:13 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; 
   d="scan'208";a="100541497"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 13:04:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B1EC4CE1A08
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 13:04:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 13:04:09 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-oauth2client: upgrade 4.1.2 -> 4.1.3
Date: Tue, 27 Oct 2020 13:04:10 +0800
Message-ID: <1603775050-49324-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7B1EC4CE1A08.A2CFF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Consolidate inc and bb files into a single bb file.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-oauth2client_4.1.2.bb   | 2 --
 ...ython-oauth2client.inc => python3-oauth2client_4.1.3.bb} | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
 rename meta-openstack/recipes-devtools/python/{python-oauth2client.inc => python3-oauth2client_4.1.3.bb} (70%)

diff --git a/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
deleted file mode 100644
index 9650800..0000000
--- a/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-oauth2client.inc
diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client.inc b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.3.bb
similarity index 70%
rename from meta-openstack/recipes-devtools/python/python-oauth2client.inc
rename to meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.3.bb
index d91fc46..0583c97 100644
--- a/meta-openstack/recipes-devtools/python/python-oauth2client.inc
+++ b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.3.bb
@@ -4,10 +4,10 @@ HOMEPAGE = "http://github.com/google/oauth2client/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
 
-inherit pypi
+inherit setuptools3 pypi
 
-SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
-SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
+SRC_URI[md5sum] = "3a9eb781f685949c04946f6c09e4c11d"
+SRC_URI[sha256sum] = "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
 
 RDEPENDS_${PN} += " \
         ${PYTHON_PN}-httplib2 \
-- 
2.25.1



