Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11963.1617985880643343290
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 09:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUu2P-00055o-C8; Fri, 09 Apr 2021 19:31:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 5/5] python3-newrelic: Upgrade 6.0.1.155 -> 6.2.0.156
Date: Fri,  9 Apr 2021 19:31:04 +0300
Message-Id: <20210409163104.26711-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409163104.26711-1-leon.anavi@konsulko.com>
References: <20210409163104.26711-1-leon.anavi@konsulko.com>
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

Upgrade to release 6.2.0.156:

- Improved CPU metric sampling
- Improved memory metric sampling
- Increased custom attribute limit from 64 to 128
- Fixed a TypeError with Uvicorn and unix sockets
- Fixed a crash when using a FIPS compliant system with Cross
  Agent Tracing enabled

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-newrelic_6.0.1.155.bb => python3-newrelic_6.2.0.156.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-newrelic_6.0.1.155.bb => python3-newrelic_6.2.0.156.bb} (83%)

diff --git a/recipes-devtools/python/python3-newrelic_6.0.1.155.bb b/recipes-devtools/python/python3-newrelic_6.2.0.156.bb
similarity index 83%
rename from recipes-devtools/python/python3-newrelic_6.0.1.155.bb
rename to recipes-devtools/python/python3-newrelic_6.2.0.156.bb
index f79c99c..d3bbd9e 100644
--- a/recipes-devtools/python/python3-newrelic_6.0.1.155.bb
+++ b/recipes-devtools/python/python3-newrelic_6.2.0.156.bb
@@ -8,8 +8,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & MIT & Python-2.0 & BSD-2-Clause & NewRelic"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b42edef8fa55315f34f2370b4715ca9"
 
-SRC_URI[md5sum] = "0acf701c37ceb590e2a12d358ced16d7"
-SRC_URI[sha256sum] = "e96689fc75eb2b1591903ad9e74225f5e1da734afcd3151d318c53f6635b5dda"
+SRC_URI[sha256sum] = "3dec4647de67609570c4e305f2b6432a00e0a0940a7ac69660ee92268b49d6e7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

