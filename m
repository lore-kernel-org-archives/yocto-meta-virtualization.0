Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14649.1618413287263553886
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE5-00017J-UJ; Wed, 14 Apr 2021 18:14:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 5/6] python3-sphinx: Upgrade 3.4.3 -> 3.5.4
Date: Wed, 14 Apr 2021 18:14:34 +0300
Message-Id: <20210414151435.9049-5-leon.anavi@konsulko.com>
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

Upgrade to release 3.5.4:

- Restrict docutils to 0.16
- autodoc: Async staticmethods and classmethods are considered as
  non async coroutine-functions with Python3.10
- html theme: The style are not applied with docutils-0.17

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-sphinx_3.4.3.bb => python3-sphinx_3.5.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-sphinx_3.4.3.bb => python3-sphinx_3.5.4.bb} (63%)

diff --git a/recipes-devtools/python/python3-sphinx_3.4.3.bb b/recipes-devtools/python/python3-sphinx_3.5.4.bb
similarity index 63%
rename from recipes-devtools/python/python3-sphinx_3.4.3.bb
rename to recipes-devtools/python/python3-sphinx_3.5.4.bb
index 76b0cdb..3f541c7 100644
--- a/recipes-devtools/python/python3-sphinx_3.4.3.bb
+++ b/recipes-devtools/python/python3-sphinx_3.5.4.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=82cc7d23060a75a07b820eaaf75abecf"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[md5sum] = "80c5176104fe0cfbd1a8430b6da308b4"
-SRC_URI[sha256sum] = "41cad293f954f7d37f803d97eb184158cfd90f51195131e94875bc07cd08b93c"
+SRC_URI[sha256sum] = "19010b7b9fa0dc7756a6e105b2aacd3a80f798af3c25c273be64d7beeb482cb1"
+
 inherit setuptools3 pypi
-- 
2.17.1

