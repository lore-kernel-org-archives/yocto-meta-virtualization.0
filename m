Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.11555.1603164580843232764
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 20:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 198.145.29.25, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4C56138C0699
	for <meta-virtualization@yoctoproject.org>; Mon, 19 Oct 2020 20:29:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.77,395,1596470400"; 
   d="scan'208";a="100316560"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Oct 2020 11:29:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B327486A854
	for <meta-virtualization@yoctoproject.org>; Tue, 20 Oct 2020 11:29:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Oct 2020 11:29:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python3-xstatic-qunit: change to python3
Date: Tue, 20 Oct 2020 11:29:35 +0800
Message-ID: <1603164575-37740-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3B327486A854.AF511
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Because python2 is no longer maintained, bb file is changed to python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...atic-qunit_1.14.0.2.bb => python3-xstatic-qunit_1.14.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-qunit_1.14.0.2.bb => python3-xstatic-qunit_1.14.0.2.bb} (96%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-qunit_1.14.0.2.bb
similarity index 96%
rename from meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-qunit_1.14.0.2.bb
index 014b004..36ce92b 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-qunit_1.14.0.2.bb
+++ b/meta-openstack/recipes-devtools/python/python3-xstatic-qunit_1.14.0.2.bb
@@ -14,7 +14,7 @@ inherit setuptools3 pypi
 # DEPENDS_default: python-pip
 
 DEPENDS += " \
-        python-pip \
+        python3-pip \
         "
 
 # RDEPENDS_default: 
-- 
2.25.1



