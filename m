Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.14610.1618413287776942411
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE6-00017J-Ed; Wed, 14 Apr 2021 18:14:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 6/6] python3-cached-property: Upgrade 1.3.0 -> 1.5.2
Date: Wed, 14 Apr 2021 18:14:35 +0300
Message-Id: <20210414151435.9049-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414151435.9049-1-leon.anavi@konsulko.com>
References: <20210414151435.9049-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- Add formal support for Python 3.8
- Remove formal support for Python 3.4
- Switch from Travis to GitHub actions
- Made tests pass flake8 for Python 2.7

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ched-property_1.3.0.bb => python3-cached-property_1.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-cached-property_1.3.0.bb => python3-cached-property_1.5.2.bb} (62%)

diff --git a/recipes-devtools/python/python3-cached-property_1.3.0.bb b/recipes-devtools/python/python3-cached-property_1.5.2.bb
similarity index 62%
rename from recipes-devtools/python/python3-cached-property_1.3.0.bb
rename to recipes-devtools/python/python3-cached-property_1.5.2.bb
index f01aabd..d7905f8 100644
--- a/recipes-devtools/python/python3-cached-property_1.3.0.bb
+++ b/recipes-devtools/python/python3-cached-property_1.5.2.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "4a6039f7418007275505e355359396a8"
-SRC_URI[sha256sum] = "458e78b1c7286ece887d92c9bee829da85717994c5e3ddd253a40467f488bc81"
+SRC_URI[sha256sum] = "9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130"
-- 
2.17.1

