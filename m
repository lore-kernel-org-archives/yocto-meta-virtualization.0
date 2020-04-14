Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12219.1586875076229624608
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 07:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53914 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jOMhE-0003tQ-QU; Tue, 14 Apr 2020 17:37:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 2/2] python3-docker: Upgrade 4.1.0 to 4.2.0
Date: Tue, 14 Apr 2020 17:37:46 +0300
Message-Id: <1586875066-2971-2-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586875066-2971-1-git-send-email-leon.anavi@konsulko.com>
References: <1586875066-2971-1-git-send-email-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade python3-docker to version 4.2.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-docker.inc                             | 4 ++--
 .../python/{python3-docker_4.1.0.bb => python3-docker_4.2.0.bb}       | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-docker_4.1.0.bb => python3-docker_4.2.0.bb} (100%)

diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
index cb7c523..884fb64 100644
--- a/recipes-devtools/python/python-docker.inc
+++ b/recipes-devtools/python/python-docker.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/docker/docker-py"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
-SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"
-SRC_URI[sha256sum] = "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"
+SRC_URI[md5sum] = "19f803f6a7113301daa5d82a2d1d0c30"
+SRC_URI[sha256sum] = "ddae66620ab5f4bce769f64bcd7934f880c8abe6aa50986298db56735d0f722e"
 
 RDEPENDS_${PN} += " \
 	${PYTHON_PN}-misc \
diff --git a/recipes-devtools/python/python3-docker_4.1.0.bb b/recipes-devtools/python/python3-docker_4.2.0.bb
similarity index 100%
rename from recipes-devtools/python/python3-docker_4.1.0.bb
rename to recipes-devtools/python/python3-docker_4.2.0.bb
-- 
2.7.4

