Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.14609.1618413286513490802
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWhE3-00017J-Vq; Wed, 14 Apr 2021 18:14:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 2/6] python3-boto3: Upgrade 1.17.48 -> 1.17.51
Date: Wed, 14 Apr 2021 18:14:31 +0300
Message-Id: <20210414151435.9049-2-leon.anavi@konsulko.com>
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

Upgrade to release 1.17.51:

- api-change:lightsail: [botocore] Documentation updates for
  Amazon Lightsail.
- api-change:sts: [botocore] This release adds the SourceIdentity
  parameter that can be set when assuming a role.
- api-change:comprehendmedical: [botocore] The InferICD10CM API
  now returns TIME_EXPRESSION entities that refer to medical
  conditions.
- api-change:rds: [botocore] Clarify that enabling or disabling
  automated backups causes a brief downtime, not an outage.
- api-change:redshift: [botocore] Added support to enable AQUA
  in Amazon Redshift clusters.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-boto3_1.17.48.bb => python3-boto3_1.17.51.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-devtools/python/{python3-boto3_1.17.48.bb => python3-boto3_1.17.51.bb} (85%)

diff --git a/recipes-devtools/python/python3-boto3_1.17.48.bb b/recipes-devtools/python/python3-boto3_1.17.51.bb
similarity index 85%
rename from recipes-devtools/python/python3-boto3_1.17.48.bb
rename to recipes-devtools/python/python3-boto3_1.17.51.bb
index 56637f4..980b6cd 100644
--- a/recipes-devtools/python/python3-boto3_1.17.48.bb
+++ b/recipes-devtools/python/python3-boto3_1.17.51.bb
@@ -9,7 +9,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "e86c15049dc07cb67e8b466795f004f1f23c1acf078d47283cd5e4a692a5aa37"
+SRC_URI[sha256sum] = "c45e7d3aef8965ae1b42c9855c31ded19fbb38cfad0a34cc37dc880ded3672c2"
 
 inherit pypi setuptools3
 
-- 
2.17.1

