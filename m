Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6776.1594198477558416245
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 01:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; 
   d="scan'208";a="95925634"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jul 2020 16:54:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AFC324CE4BD9
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  8 Jul 2020 16:54:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Jul 2020 16:54:27 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] python3-xstatic-bootstrap-datepicker: upgrade 1.3.1.0 -> 1.4.0.0
Date: Wed, 8 Jul 2020 16:54:21 +0800
Message-ID: <1594198463-42395-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594198463-42395-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: AFC324CE4BD9.A82E3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

PKG-INFO-Update: Version updated to 1.4.0.0.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python-xstatic-bootstrap-datepicker.inc          | 6 +++---
 ...0.bb => python3-xstatic-bootstrap-datepicker_1.4.0.0.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python3-xstatic-bootstrap-datepicker_1.3.1.0.bb => python3-xstatic-bootstrap-datepicker_1.4.0.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
index 4988539..f1d19f3 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for setuptools (
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=97d9c60d3a8c5fccccb317f944688479"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=717661446a83183e303f3f8e0a1ea277"
 
 PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
 
-SRC_URI[md5sum] = "c2f5c58a7b41162923eca5a36b29b8b2"
-SRC_URI[sha256sum] = "9edc9b77501001fcee9fbf4bf0a722c263efd928ef928b40081a8269fdd9a944"
+SRC_URI[md5sum] = "68375e81274159874ab5fd6d85ea405c"
+SRC_URI[sha256sum] = "df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e"
 
 inherit pypi
 
diff --git a/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.3.1.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.3.1.0.bb
rename to meta-openstack/recipes-devtools/python/python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
-- 
2.17.1



