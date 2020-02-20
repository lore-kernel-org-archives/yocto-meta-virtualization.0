Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1358.1582228709754457505
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJwSA9013616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:28 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 75F7D9009BB;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/8] Uprev'd yajl-ruby to 1.4.0
Date: Thu, 20 Feb 2020 11:57:59 -0800
Message-ID: <20200220195806.173460-1-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/yajl-ruby_1.4.0.bb  | 11 ++++++++
 .../recipes-devtools/ruby/yajl-ruby_git.bb    | 26 -------------------
 2 files changed, 11 insertions(+), 26 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb

diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
new file mode 100644
index 0000000..4393476
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A streaming JSON parsing and encoding library for Ruby (C bindings to yajl)"
+HOMEPAGE = "http://rdoc.info/projects/brianmario/yajl-ruby"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7dbd3a9f471247a243db5b62fe091587"
+
+SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;tag=1.4.0"
+
+S = "${WORKDIR}/git"
+
+inherit ruby
diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb b/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
deleted file mode 100644
index 9d8ba54..0000000
--- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-SUMMARY = "C binding to the excellent YAJL JSON parsing and generation library."
-DESCRIPTION = "This gem is a C binding to the excellent YAJL JSON \
-parsing and generation library."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=7edc7ac9885163399dacc69a54b1dc3a"
-
-PR = "r0"
-
-BPV = "1.2.1"
-PV = "${BPV}"
-SRCREV = "d8a0b8d5c879b0810b43eaab241fb87b68c93453"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = " \
-    git://github.com/brianmario/yajl-ruby.git \
-    file://0001-Don-t-compile-extensions.patch \
-    "
-
-inherit ruby
-
-BBCLASSEXTEND = "native"
-- 
2.17.1

