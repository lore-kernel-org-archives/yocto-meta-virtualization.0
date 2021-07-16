Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8197.1626450116845827842
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 08:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60166 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m4PyM-0003lu-Vt; Fri, 16 Jul 2021 18:41:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 3/3] python3-docker-compose: Upgrade 1.29.1 -> 1.29.2
Date: Fri, 16 Jul 2021 18:41:48 +0300
Message-Id: <20210716154148.18909-3-leon.anavi@konsulko.com>
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

Upgrade to release 1.29.2:

- Remove prompt to use docker compose in the up command
- Bump py to 1.10.0 in requirements-indirect.txt

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cker-compose_1.29.1.bb => python3-docker-compose_1.29.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-containers/docker-compose/{python3-docker-compose_1.29.1.bb => python3-docker-compose_1.29.2.bb} (88%)

diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.29.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.29.2.bb
similarity index 88%
rename from recipes-containers/docker-compose/python3-docker-compose_1.29.1.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.29.2.bb
index d74f742..22b7150 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.29.1.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.29.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "49c202544c7e2eadbbe45da8e838ae02"
-SRC_URI[sha256sum] = "d2064934f5084db8a0c4805e226447bf1fd0c928419be95afb6bd1866838c1f1"
+SRC_URI[sha256sum] = "4c8cd9d21d237412793d18bd33110049ee9af8dab3fe2c213bbd0733959b09b7"
 
 
 SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
-- 
2.17.1

