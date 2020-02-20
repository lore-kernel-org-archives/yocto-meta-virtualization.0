Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1313.1582228709984634346
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJwSAB013616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:29 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 7E0D2900FD5;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 3/8] Initial cool.io ruby recipe
Date: Thu, 20 Feb 2020 11:58:01 -0800
Message-ID: <20200220195806.173460-3-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/cool.io_1.6.0.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb

diff --git a/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb b/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
new file mode 100644
index 0000000..baa6340
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = 'Simple evented I/O for Ruby (but please check out Celluloid::IO instead)'
+HOMEPAGE = 'http://coolio.github.com'
+
+LICENSE = 'MIT'
+LIC_FILES_CHKSUM = 'file://LICENSE;md5=a5e7701a63eb0a961f98cd10475129b9'
+
+SRC_URI = 'git://github.com/tarcieri/cool.io.git;protocol=https;tag=v1.6.0'
+
+S = '${WORKDIR}/git'
+
+inherit ruby
+
-- 
2.17.1

