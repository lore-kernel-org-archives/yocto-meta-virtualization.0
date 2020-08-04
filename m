Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.9280.1596559067592005262
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 09:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 074GbkFS006496
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 4 Aug 2020 09:37:46 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 4 Aug 2020
 09:37:34 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-virt][PATCH 1/1] libvirt: specify location of dmidecode
Date: Tue, 4 Aug 2020 09:37:34 -0700
Message-ID: <20200804163734.26719-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We should tell configure where dmidecode is rather than
have it search the host for it.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/libvirt/libvirt_6.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
index b6a5594..340c372 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -59,6 +59,7 @@ acpaths = "-I ./m4"
 CACHED_CONFIGUREVARS += "\
 ac_cv_path_XMLCATLOG=/usr/bin/xmlcatalog \
 ac_cv_path_AUGPARSE=/usr/bin/augparse \
+ac_cv_path_DMIDECODE=/usr/sbin/dmidecode \
 ac_cv_path_DNSMASQ=/usr/bin/dnsmasq \
 ac_cv_path_BRCTL=/usr/sbin/brctl \
 ac_cv_path_TC=/sbin/tc \
-- 
2.7.4

