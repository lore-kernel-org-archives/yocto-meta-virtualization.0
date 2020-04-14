Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12398.1586875076229265361
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 07:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53914 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jOMhD-0003tQ-Vl; Tue, 14 Apr 2020 17:37:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 1/2] python3-websocket-client: Upgrade 0.44.0 to 0.57.0
Date: Tue, 14 Apr 2020 17:37:45 +0300
Message-Id: <1586875066-2971-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade websocket_client from 0.44.0 to 0.57.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-websocket-client.inc                 | 6 +++---
 ...ebsocket-client_0.44.0.bb => python3-websocket-client_0.57.0.bb} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python3-websocket-client_0.44.0.bb => python3-websocket-client_0.57.0.bb} (100%)

diff --git a/recipes-devtools/python/python-websocket-client.inc b/recipes-devtools/python/python-websocket-client.inc
index 31778c6..8604dcb 100644
--- a/recipes-devtools/python/python-websocket-client.inc
+++ b/recipes-devtools/python/python-websocket-client.inc
@@ -1,11 +1,11 @@
 SUMMARY = "WebSocket client for python. hybi13 is supported."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
 LICENSE = "LGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
 
 inherit pypi
 
 PYPI_PACKAGE = "websocket_client"
 
-SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
-SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
+SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
+SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb b/recipes-devtools/python/python3-websocket-client_0.57.0.bb
similarity index 100%
rename from recipes-devtools/python/python3-websocket-client_0.44.0.bb
rename to recipes-devtools/python/python3-websocket-client_0.57.0.bb
-- 
2.7.4

