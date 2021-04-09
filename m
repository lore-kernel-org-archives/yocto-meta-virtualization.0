Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11980.1617985876117821099
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 09:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUu2K-00055o-Gk; Fri, 09 Apr 2021 19:31:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 3/5] python3-webob: Upgrade 1.8.5 -> 1.8.7
Date: Fri,  9 Apr 2021 19:31:02 +0300
Message-Id: <20210409163104.26711-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409163104.26711-1-leon.anavi@konsulko.com>
References: <20210409163104.26711-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 1.8.7:

- Decoding deflate-encoded responses now supports data which is
  packed in a zlib container as it is supposed to be. The old,
  non-standard behaviour is still supported.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-webob_1.8.5.bb => python3-webob_1.8.7.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-webob_1.8.5.bb => python3-webob_1.8.7.bb} (67%)

diff --git a/recipes-devtools/python/python3-webob_1.8.5.bb b/recipes-devtools/python/python3-webob_1.8.7.bb
similarity index 67%
rename from recipes-devtools/python/python3-webob_1.8.5.bb
rename to recipes-devtools/python/python3-webob_1.8.7.bb
index 74a36e3..a51f8dd 100644
--- a/recipes-devtools/python/python3-webob_1.8.5.bb
+++ b/recipes-devtools/python/python3-webob_1.8.7.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 
 PYPI_PACKAGE = "WebOb"
 
-SRC_URI[md5sum] = "1761f416e8cf53f6fb674149cc223bd1"
-SRC_URI[sha256sum] = "05aaab7975e0ee8af2026325d656e5ce14a71f1883c52276181821d6d5bf7086"
+SRC_URI[sha256sum] = "b64ef5141be559cfade448f044fa45c2260351edcb6a8ef6b7e00c7dcef0c323"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

