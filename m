Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11935.1617985878100673842
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 09:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUu2N-00055o-CG; Fri, 09 Apr 2021 19:31:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-virtualization][PATCH 4/5] python3-boto3: Upgrade 1.14.7 -> 1.17.48
Date: Fri,  9 Apr 2021 19:31:03 +0300
Message-Id: <20210409163104.26711-4-leon.anavi@konsulko.com>
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

Upgrade to release 1.17.48:

- api-change:lookoutequipment: [botocore] This release introduces
  support for Amazon Lookout for Equipment.
- api-change:kinesis-video-archived-media: [botocore]
  Documentation updates for archived.kinesisvideo
- api-change:robomaker: [botocore] This release allows RoboMaker
  customers to specify custom tools to run with their simulation
  job
- api-change:appstream: [botocore] This release provides support
  for image updates
- api-change:ram: [botocore] Documentation updates for AWS RAM
  resource sharing
- api-change:customer-profiles: [botocore] Documentation updates
  for Put-Integration API
- api-change:autoscaling: [botocore] Amazon EC2 Auto Scaling
  announces Warm Pools that help applications to scale out faster
  by pre-initializing EC2 instances and save money by requiring
  fewer continuously running instances

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-boto3_1.14.7.bb => python3-boto3_1.17.48.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-boto3_1.14.7.bb => python3-boto3_1.17.48.bb} (75%)

diff --git a/recipes-devtools/python/python3-boto3_1.14.7.bb b/recipes-devtools/python/python3-boto3_1.17.48.bb
similarity index 75%
rename from recipes-devtools/python/python3-boto3_1.14.7.bb
rename to recipes-devtools/python/python3-boto3_1.17.48.bb
index f9e979e..fd2e479 100644
--- a/recipes-devtools/python/python3-boto3_1.14.7.bb
+++ b/recipes-devtools/python/python3-boto3_1.17.48.bb
@@ -9,7 +9,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "fb8b77d4ac10a971570419dd3613196e"
-SRC_URI[sha256sum] = "4856c8cb4150b900cc7dccbdf16f542fb8c12e97b17639979e58760847f7cf35"
+SRC_URI[sha256sum] = "e86c15049dc07cb67e8b466795f004f1f23c1acf078d47283cd5e4a692a5aa37"
 
 inherit pypi setuptools3
-- 
2.17.1

