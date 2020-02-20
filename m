Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1314.1582228710741851391
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJwSA7013616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:28 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 81FFF90100D;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 4/8] Initial http_parser.rb ruby recipe
Date: Thu, 20 Feb 2020 11:58:02 -0800
Message-ID: <20200220195806.173460-4-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../ruby/http-parser.rb_0.6.0.bb              | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb

diff --git a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
new file mode 100644
index 0000000..db52ebd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "simple callback-based HTTP request/response parser"
+HOMEPAGE = "https://rubygems.org/gems/http_parser.rb"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=157efc3766c6d07d3d857ebbab43351a"
+
+SRC_URI = "git://github.com/tmm1/http_parser.rb.git;protocol=https;tag=v0.6.0"
+
+S = "${WORKDIR}/git"
+
+# Bitbake doesn't allow the underscore in file name, hence the dash
+SRCNAME = "http_parser.rb"
+
+DEPENDS = "git"
+
+inherit ruby
+
+# Download the submodules
+do_configure_prepend() {
+	cd ${WORKDIR}/git
+	git submodule update --init --recursive
+}
-- 
2.17.1

