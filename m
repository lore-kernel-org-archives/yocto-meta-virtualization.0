Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1370.1582228756376125483
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01KJwd9k018511
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:54 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 8AD7D901229;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 6/8] Initial sigdump and serverengine ruby recipes
Date: Thu, 20 Feb 2020 11:58:04 -0800
Message-ID: <20200220195806.173460-6-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/serverengine_2.2.1.bb     | 13 +++++++++++++
 .../recipes-devtools/ruby/sigdump_0.2.4.bb          | 11 +++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
 create mode 100644 meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb

diff --git a/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
new file mode 100644
index 0000000..1ed8f9e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = 'A framework to implement robust multiprocess servers like Unicorn'
+HOMEPAGE = 'https://rubygems.org/gems/serverengine'
+
+LICENSE = 'Apache-2.0'
+LIC_FILES_CHKSUM = 'file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57'
+
+SRC_URI = 'git://github.com/treasure-data/serverengine.git;protocol=https;tag=v2.2.1'
+
+S = '${WORKDIR}/git'
+
+RDEPENDS_${PN} = "sigdump"
+
+inherit ruby
diff --git a/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
new file mode 100644
index 0000000..fbf651e
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Use signal to show stacktrace of a Ruby process without restarting it"
+HOMEPAGE = "https://github.com/frsyuki/sigdump"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07d6218b18fb6826f04fd32b4918f085"
+
+SRC_URI = "git://github.com/frsyuki/sigdump.git;protocol=https;tag=v0.2.4"
+
+S = "${WORKDIR}/git"
+
+inherit ruby
-- 
2.17.1

