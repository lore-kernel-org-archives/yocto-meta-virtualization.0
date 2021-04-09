Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11962.1617985876497209316
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 09:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUu2K-00055o-0U; Fri, 09 Apr 2021 19:31:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 2/5] python3-dotenv: Upgrade 0.13.0 -> 0.17.0
Date: Fri,  9 Apr 2021 19:31:01 +0300
Message-Id: <20210409163104.26711-2-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.0:

- Make dotenv get <key> only show the value, not key=value
- Add --override/--no-override option to dotenv run

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dotenv_0.13.0.bb => python3-dotenv_0.17.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-dotenv_0.13.0.bb => python3-dotenv_0.17.0.bb} (70%)

diff --git a/recipes-devtools/python/python3-dotenv_0.13.0.bb b/recipes-devtools/python/python3-dotenv_0.17.0.bb
similarity index 70%
rename from recipes-devtools/python/python3-dotenv_0.13.0.bb
rename to recipes-devtools/python/python3-dotenv_0.17.0.bb
index e7644cb..1fd13b7 100644
--- a/recipes-devtools/python/python3-dotenv_0.13.0.bb
+++ b/recipes-devtools/python/python3-dotenv_0.17.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55ee2c3471d386636a719c8ccac40b31"
 
 PYPI_PACKAGE = "python-dotenv"
 
-SRC_URI[md5sum] = "3dfde58c6a5fbd41292c4039a68f70f4"
-SRC_URI[sha256sum] = "3b9909bc96b0edc6b01586e1eed05e71174ef4e04c71da5786370cebea53ad74"
+SRC_URI[sha256sum] = "471b782da0af10da1a80341e8438fca5fadeba2881c54360d5fd8d03d03a4f4a"
 
 inherit pypi setuptools3
-- 
2.17.1

