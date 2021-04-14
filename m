Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14560.1618413287040591868
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE4-00017J-IS; Wed, 14 Apr 2021 18:14:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 3/6] python3-botocore: Upgrade 1.20.36 -> 1.20.51
Date: Wed, 14 Apr 2021 18:14:32 +0300
Message-Id: <20210414151435.9049-3-leon.anavi@konsulko.com>
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

Upgrade to release 1.20.51:

- api-change:lightsail: Documentation updates for Amazon
  Lightsail.
- api-change:sts: This release adds the SourceIdentity parameter
  that can be set when assuming a role.
- api-change:comprehendmedical: The InferICD10CM API now returns
  TIME_EXPRESSION entities that refer to medical conditions.
- api-change:rds: Clarify that enabling or disabling automated
  backups causes a brief downtime, not an outage.
- api-change:redshift: Added support to enable AQUA in Amazon
  Redshift clusters.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-botocore_1.20.36.bb => python3-botocore_1.20.51.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename recipes-devtools/python/{python3-botocore_1.20.36.bb => python3-botocore_1.20.51.bb} (64%)

diff --git a/recipes-devtools/python/python3-botocore_1.20.36.bb b/recipes-devtools/python/python3-botocore_1.20.51.bb
similarity index 64%
rename from recipes-devtools/python/python3-botocore_1.20.36.bb
rename to recipes-devtools/python/python3-botocore_1.20.51.bb
index 4c4a825..93e4eab 100644
--- a/recipes-devtools/python/python3-botocore_1.20.36.bb
+++ b/recipes-devtools/python/python3-botocore_1.20.51.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/boto/botocore"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI = "git://github.com/boto/botocore.git;protocol=https"
-SRCREV = "8c7123bd4683049dcac62bf3e11662e6a72c5eec"
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "c853d6c2321e2f2328282c7d49d7b1a06201826ba0e7049c6975ab5f22927ea8"
 
-inherit setuptools3
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "python3-jmespath python3-dateutil python3-logging"
-- 
2.17.1

