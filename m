Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.62497.1597743673887065926
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 02:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zhengrq.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAD2DE02034; Tue, 18 Aug 2020 02:41:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_MED,TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9EE5E02031
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 02:41:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.76,326,1592841600"; 
   d="scan'208";a="98222492"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Aug 2020 17:41:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EA8834CE34F5
	for <meta-virtualization@yoctoproject.org>; Tue, 18 Aug 2020 17:41:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 18 Aug 2020 17:41:02 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-python-editor: upgrade to 1.0.4
Date: Wed, 19 Aug 2020 02:36:56 +0800
Message-ID: <1597775816-10586-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: EA8834CE34F5.A83A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
---
 .../recipes-devtools/python/python-python-editor_git.bb   | 2 --
 ...n-python-editor.inc => python3-python-editor_1.0.4.bb} | 8 ++------
 .../recipes-devtools/python/python3-python-editor_git.bb  | 2 --
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-python-editor_git.bb
 rename meta-openstack/recipes-devtools/python/{python-python-editor.inc => python3-python-editor_1.0.4.bb} (65%)
 delete mode 100644 meta-openstack/recipes-devtools/python/python3-python-editor_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-python-editor_git.bb b/meta-openstack/recipes-devtools/python/python-python-editor_git.bb
deleted file mode 100644
index 7529398..0000000
--- a/meta-openstack/recipes-devtools/python/python-python-editor_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-python-editor.inc
-inherit setuptools3
diff --git a/meta-openstack/recipes-devtools/python/python-python-editor.inc b/meta-openstack/recipes-devtools/python/python3-python-editor_1.0.4.bb
similarity index 65%
rename from meta-openstack/recipes-devtools/python/python-python-editor.inc
rename to meta-openstack/recipes-devtools/python/python3-python-editor_1.0.4.bb
index 07692a3..fea7093 100644
--- a/meta-openstack/recipes-devtools/python/python-python-editor.inc
+++ b/meta-openstack/recipes-devtools/python/python3-python-editor_1.0.4.bb
@@ -4,13 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-PV = "0.4+git${SRCPV}"
-SRCREV = "d6fa2a6bb3106a1ba00fe40f9af62e4ddc539e1e"
+inherit setuptools3 pypi
 
-SRCNAME = "python-editor"
-SRC_URI = "git://github.com/fmoo/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
 
 DEPENDS += " \
         ${PYTHON_PN}-pip \
diff --git a/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb b/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb
deleted file mode 100644
index 7529398..0000000
--- a/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-python-editor.inc
-inherit setuptools3
-- 
2.25.1



