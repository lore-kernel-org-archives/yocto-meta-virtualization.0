Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.8589.1636625264788149156
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 02:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1ABA7hS6030846
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 02:07:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1ABA7g2Y027497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 02:07:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 02:07:38 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 02:07:37 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit branch
Date: Thu, 11 Nov 2021 18:07:25 +0800
Message-ID: <20211111100725.38963-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add explicit branch master for concurrent-ruby as the same for other
recipes.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
index a328203e..61a2c598 100644
--- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
+++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.concurrent-ruby.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
 
-SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
+SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6;branch=master \
 	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

