Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.395.1626901098441440017
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 13:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=DkJFSrbR;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=785; q=dns/txt; s=iport;
  t=1626901098; x=1628110698;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=McAXCnjkaoTD3vENTQs8/hVEaRLjH3FeuLPtF5ngDmA=;
  b=DkJFSrbRbdRApG/W9kZR/nFsc4CPEoJbEAZw+IEa3xJiEV6nPesw+Gll
   +9t/IyfkzhYCU2/KqICqTTHG0sGqj2xYSktWf0oAmPBnqubxnSs1XA6KW
   m6yZZCrCkSWy/0JtmuG55zRww+ozknmeLGh+ficLu84V0ijvvJ7/obj+a
   I=;
X-IronPort-AV: E=Sophos;i="5.84,258,1620691200"; 
   d="scan'208";a="751703953"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2021 20:58:17 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 16LKwGBT021682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 21 Jul 2021 20:58:17 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 63B1CCC128E; Wed, 21 Jul 2021 13:58:16 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Ruslan Babayev <fib@cisco.com>
Subject: [meta-virtualization][PATCH v2] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
Date: Wed, 21 Jul 2021 13:58:03 -0700
Message-Id: <20210721205803.942034-1-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
Content-Transfer-Encoding: 8bit

For native recipes STAGING_DIR_TARGET = "". This breaks the
python3-native build where LIBRARY_PATH ends up being "/lib".

Signed-off-by: Ruslan Babayev <fib@cisco.com>
---
 recipes-devtools/python/python3_virtualization.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python3_virtualization.inc b/recipes-devtools/python/python3_virtualization.inc
index 55301c7..481db58 100644
--- a/recipes-devtools/python/python3_virtualization.inc
+++ b/recipes-devtools/python/python3_virtualization.inc
@@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 DEPENDS += " ncurses"
 
-do_compile_prepend() {
+do_compile_prepend_class-target() {
 	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
 }
 
-- 
2.26.2.Cisco

