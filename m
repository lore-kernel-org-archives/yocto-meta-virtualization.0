Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1341.1582228756353584196
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01KJwd9i018511
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:49 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 8ED94901318;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 7/8] Initial strptime ruby recipe
Date: Thu, 20 Feb 2020 11:58:05 -0800
Message-ID: <20200220195806.173460-7-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/strptime_0.2.3.bb         | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb

diff --git a/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb b/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
new file mode 100644
index 0000000..20a1f5b
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "a fast strpitme engine"
+HOMEPAGE = "https://github.com/nurse/strptime"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f19575067ffc5f1ddc02c74eeef9904f"
+
+SRC_URI = "git://github.com/nurse/strptime.git;protocol=https;tag=v0.2.3"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "bash"
+
+inherit ruby
-- 
2.17.1

