Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.8387.1626450116840718851
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 08:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60166 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m4PyM-0003lu-DF; Fri, 16 Jul 2021 18:41:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 2/3] python3-bugsnag: Upgrade 4.0.2 -> 4.1.0
Date: Fri, 16 Jul 2021 18:41:47 +0300
Message-Id: <20210716154148.18909-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716154148.18909-1-leon.anavi@konsulko.com>
References: <20210716154148.18909-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.1.0:

- Add support for breadcrumbs. These are short log statements that
  are attached to error reports to help diagnose what events led
  to the error.
- Apply filtering with params_filters to bytes, not just strings

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bugsnag_4.0.2.bb => python3-bugsnag_4.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-devtools/python/{python3-bugsnag_4.0.2.bb => python3-bugsnag_4.1.0.bb} (87%)

diff --git a/recipes-devtools/python/python3-bugsnag_4.0.2.bb b/recipes-devtools/python/python3-bugsnag_4.1.0.bb
similarity index 87%
rename from recipes-devtools/python/python3-bugsnag_4.0.2.bb
rename to recipes-devtools/python/python3-bugsnag_4.1.0.bb
index 96550bb..595cc8c 100644
--- a/recipes-devtools/python/python3-bugsnag_4.0.2.bb
+++ b/recipes-devtools/python/python3-bugsnag_4.1.0.bb
@@ -10,7 +10,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "7a49dacf055a8c6dda4ce714acd91fabe9546f1ad826276918a26603a8b5489a"
+SRC_URI[sha256sum] = "dcbd59cd9edea26cc92efb6518aed83a2f356f81bfd5acc730bfe202fb27c1c1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

