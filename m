Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7684.1637593897755927586
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 07:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AMFBatb031877
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 07:11:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AMFBZk9026934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 07:11:36 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 22 Nov 2021 07:11:35 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 22 Nov 2021 07:11:35 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 22 Nov 2021 07:11:34 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: 1.1.6 -> 1.1.9
Date: Mon, 22 Nov 2021 23:10:51 +0800
Message-ID: <20211122151051.9683-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade concurrent-ruby from 1.1.6 to 1.1.9:

* it changed license file to txt, so the license file name and checksum changed
* remove 'tag=' from SRC_URI and use SRCREV instead

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...urrent-ruby_1.1.6.bb => concurrent-ruby_1.1.9.bb} | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/ruby/{concurrent-ruby_1.1.6.bb => concurrent-ruby_1.1.9.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
rename to meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
index a328203e..e2c99d7d 100644
--- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
+++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
@@ -2,11 +2,17 @@ SUMMARY = "Modern concurrency tools including agents, futures, promises, thread
 HOMEPAGE = "http://www.concurrent-ruby.com"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319104fe1435b64fc0a67032db44f02"
 
-SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
-	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
+SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;branch=master \
+           file://0001-Removed-check-for-concurrent_ruby.jar.patch \
+           "
+SRCREV = "52c08fca13cc3811673ea2f6fdb244a0e42e0ebe"
 
 S = "${WORKDIR}/git"
 
+do_install:append () {
+    rmdir --ignore-fail-on-non-empty ${D}${libdir}/ruby/gems/${RUBY_GEM_VERSION}/plugins
+}
+
 inherit ruby
-- 
2.17.1

