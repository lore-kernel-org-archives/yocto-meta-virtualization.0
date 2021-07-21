Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web08.12.1626899405103132461
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 13:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=XPvgllZD;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=659; q=dns/txt; s=iport;
  t=1626899405; x=1628109005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FhViQ+UfRcjkVoMisBWLEk90bXb/FHQ6yIUR/IrCS0A=;
  b=XPvgllZDj95Tf1clz2LJ6Qr7X5OJgkrtQ7pB0FyyO3ZNvAxSWmEU8z59
   1YO3HJP75JVpYfQKwc1m24mQLRXlxQAxsAG9+/fjKQsGUlmtoFGO3MFp4
   k1qgeuCYkgi+cx9ob9T33CZv9Fwc7Tm95zk5kAtxS7/gf70TQSCoKjFEf
   U=;
X-IronPort-AV: E=Sophos;i="5.84,258,1620691200"; 
   d="scan'208";a="820387782"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jul 2021 20:30:04 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 16LKU3v7030047
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 21 Jul 2021 20:30:03 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id B881DCC128E; Wed, 21 Jul 2021 13:30:02 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Ruslan Babayev <fib@cisco.com>
Subject: [meta-virtualization][PATCH] python3: unbreak python3-native when virtualization is in DISTRO_FEATURES
Date: Wed, 21 Jul 2021 13:29:55 -0700
Message-Id: <20210721202955.137761-1-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

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

