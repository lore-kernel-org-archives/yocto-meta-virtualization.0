Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.7137.1598941789727362519
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 23:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0816TmIu012957
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Aug 2020 23:29:49 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 31 Aug 2020
 23:29:48 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nagios-core: fix build failure for gcc-10
Date: Mon, 31 Aug 2020 23:29:47 -0700
Message-ID: <20200901062947.6835-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gcc-10 uses '-fno-common' by default, which results in build
error complaining multiple definition.

Use '-fcommon' to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-core_4.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb b/recipes-extended/nagios/nagios-core_4.4.3.bb
index 7a86653..c78259e 100644
--- a/recipes-extended/nagios/nagios-core_4.4.3.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
@@ -62,6 +62,9 @@ EXTRA_OECONF += "ac_cv_header_ltdl_h=no"
 # Prevent nagios from suffering host contamination if host has /bin/perl
 EXTRA_OECONF += "ac_cv_path_PERL=${bindir}/perl"
 
+# Fix build failure for gcc-10
+CFLAGS_append = " -fcommon"
+
 # Set to "1" to allow nagios-core post-init to modify Apache configuration
 NAGIOS_MODIFY_APACHE ??= "1"
 
-- 
2.21.0

