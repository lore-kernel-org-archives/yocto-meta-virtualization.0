Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14559.1618413286748763494
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE5-00017J-Cu; Wed, 14 Apr 2021 18:14:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 4/6] python3-flask-cors: Upgrade 3.0.8 -> 3.0.10
Date: Wed, 14 Apr 2021 18:14:33 +0300
Message-Id: <20210414151435.9049-4-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.10:

- Adds support for PPC64 and ARM64 builds for distribution

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-flask-cors_3.0.8.bb => python3-flask-cors_3.0.10.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-flask-cors_3.0.8.bb => python3-flask-cors_3.0.10.bb} (76%)

diff --git a/recipes-devtools/python/python3-flask-cors_3.0.8.bb b/recipes-devtools/python/python3-flask-cors_3.0.10.bb
similarity index 76%
rename from recipes-devtools/python/python3-flask-cors_3.0.8.bb
rename to recipes-devtools/python/python3-flask-cors_3.0.10.bb
index aac7152..2b2e2ce 100644
--- a/recipes-devtools/python/python3-flask-cors_3.0.8.bb
+++ b/recipes-devtools/python/python3-flask-cors_3.0.10.bb
@@ -11,7 +11,6 @@ DEPENDS += "python3-six python3-flask"
 
 PYPI_PACKAGE = "Flask-Cors"
 
-SRC_URI[md5sum] = "551cc4c0305a171d28caa2b3bc838867"
-SRC_URI[sha256sum] = "72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16"
+SRC_URI[sha256sum] = "b60839393f3b84a0f3746f6cdca56c1ad7426aa738b70d6c61375857823181de"
 
 inherit pypi setuptools3
-- 
2.17.1

