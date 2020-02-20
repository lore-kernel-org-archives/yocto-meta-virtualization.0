Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1333.1582228629560917696
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJv8YK023161
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:57:08 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:57:07 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 9FA589009BB;
 Thu, 20 Feb 2020 11:57:07 -0800 (PST)
From: hnathan918@gmail.com
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH] Added SRCNAME variable to allow bitbake recipe unfriendly gem names
Date: Thu, 20 Feb 2020 11:56:51 -0800
Message-ID: <20200220195651.173045-1-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 classes/ruby.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
index dc19166..15ac9f4 100644
--- a/classes/ruby.bbclass
+++ b/classes/ruby.bbclass
@@ -8,6 +8,8 @@ RDEPENDS_${PN} += " \
     ruby \
 "
 
+SRCNAME ?= "${PN}"
+
 #${PN}_do_compile[depends] += "ruby-native:do_populate_sysroot"
 
 def get_rubyversion(p):
@@ -78,8 +80,8 @@ RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
 
 export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
 
-RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
-RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
+RUBY_BUILD_GEMS ?= "${SRCNAME}.gemspec"
+RUBY_INSTALL_GEMS ?= "${SRCNAME}-${PV}.gem"
 
 RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
 
-- 
2.17.1

