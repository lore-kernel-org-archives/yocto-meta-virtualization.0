Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1325.1582228756334672135
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01KJwd9j018511
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:54 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 9279790137D;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 8/8] Initial fluentd recipe
Date: Thu, 20 Feb 2020 11:58:06 -0800
Message-ID: <20200220195806.173460-8-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../recipes-devtools/ruby/fluentd_1.9.2.bb    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb

diff --git a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
new file mode 100644
index 0000000..768bc21
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Fluentdu Open-Source Log Collector"
+HOMEPAGE = "https://www.fluentd.org/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ffc336af228834e68e0a4d38da165f7"
+
+SRC_URI = "git://github.com/fluent/fluentd.git;protocol=https;tag=v${PV}"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "cool.io http-parser.rb msgpack serverengine sigdump strptime tzinfo tzinfo-data yajl-ruby"
+
+inherit ruby
+
+do_install_append() {
+	install -d ${D}/etc/fluent/
+	install ${S}/fluent.conf ${D}/etc/fluent/fluent.conf
+}
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
-- 
2.17.1

