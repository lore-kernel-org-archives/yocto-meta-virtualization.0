Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1360.1582228709994855698
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJwSAA013616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:28 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 864F69011FE;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 5/8] Initial msgpack ruby recipe
Date: Thu, 20 Feb 2020 11:58:03 -0800
Message-ID: <20200220195806.173460-5-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/msgpack_1.3.3.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb

diff --git a/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
new file mode 100644
index 0000000..063a852
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
@@ -0,0 +1,12 @@
+SUMMARY = "MessagePack implementation for Ruby"
+HOMEPAGE = "http://msgpack.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI = "git://github.com/msgpack/msgpack-ruby.git;protocol=https;tag=v${PV}"
+
+S = "${WORKDIR}/git"
+
+inherit ruby
+
-- 
2.17.1

