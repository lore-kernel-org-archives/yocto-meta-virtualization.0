Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21865C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 18:05:26 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.2296.1752775524863391778
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 11:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NuX2Pr9G;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3725; q=dns/txt;
  s=iport01; t=1752775524; x=1753985124;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OfzmOK8fg2Xrsx1FH1zJ+YOvW8aDVt/2SFPrEXsl69o=;
  b=NuX2Pr9GW5aJMAUOc+ZYc8c5r1wsi1yeCbn2PnOPEgbJ71cC2C6QKiYa
   xK7JN4CQ6cm3LvWD/FY2YDGzfiyvUvZcrISedxkSzrUKivy7mIOwb57Wh
   Y2JhDridN0gOsXtKtSKnSW/MnONlM7xQ0TmkbdaGUC0G5kRgJECBH9LhK
   GMWtcoMIHJ2bD173e5BvMZP3n7ccBfG+CbAWDeZ3egvxuaM6RCGsRSZE5
   N4MYUBvVZLa/0T6JeE6X57HpmQ2ariuwyoL2V2H9vRaXnLcYVSQpNmojm
   jDOXZnsxHyK/ekZeINZrM+JBTvIeEnRhnG8W/26UyRPc7lMsrEqxERJ7r
   Q==;
X-CSE-ConnectionGUID: 9VGw0AgITWWVbbJwl3NDdw==
X-CSE-MsgGUID: Risy6CZTSoWYkqzuo70G9g==
X-IPAS-Result: =?us-ascii?q?A0APAAC5Onlo/5EQJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF/BgEBAQsBgkp5WkJJjHCJVYtnEJIkgX8PAQEBDz0UBAEBhQeMDwImN?=
 =?us-ascii?q?AkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOFew2GWgECA?=
 =?us-ascii?q?TUBRiwDAQJPCyMYCYMCAYI5AzICARGwPYIsgQGDaAJDT9hBDW6BbYFJAYgyH?=
 =?us-ascii?q?gGEfG8BhHcnG4FJRIEVgTuCLYEFgRpCAQGIAiIEgziMM4Q5gQWGbEiBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFjAzUMCy4VbjIdgSeFFoQoK0+FEIEZg1QkbQ8GgRiCZ0ADC?=
 =?us-ascii?q?xgNSBEsNxQbBj5uB5Fqgip8PT4TAStUJyAoEVhOkleST6AbcYQmjB6PPIV8G?=
 =?us-ascii?q?jOFW6UOC5h7izWCU4QIkSqBHIRpgWg8gUcLB00jFYMiCUkZD444g2mBf7xRI?=
 =?us-ascii?q?zU8AgcBCgEBAwmPQwEB?=
IronPort-Data: A9a23:avsQcK4sWWrq6s6KAN1urQxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mQdXGqFPauIZ2Xzed52bd/i/EtSu8PVz9ZhSVY5ry4xZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH3dOG49xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr/aUzBHf/g2Qpaj1NtPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebLM35b5eDkByy
 sMmIjovcRTYoc663+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FbYKEJ4TRGZkO9qqej
 ljH5HWnKSMmD9ug+Dmc4G+r2bfgzCyuDer+E5X9rJaGmma7w2EPAVgIVEGnvPC9i1y3R9NYL
 WQQ+zEytu4j80e3ScHnWB+1q2LCuQQTM+e8CMUz7AWLj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:eQ/JBa5vo0kTrTyG2gPXwMnXdLJyesId70hD6qm+c3Nom6uj5q
 STdZUgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41gPW
 MKSdkZNDU2ZmIK6vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3Avzj8rmkbano5Un2Ltuc9opkrNejXOSzj42iICkC?=
 =?us-ascii?q?ZNVlWdrefa0CUo4VIn9U7zg=3D=3D?=
X-Talos-MUID: 9a23:xlDsswRtlfxsYoizRXTWhSpzauxa35+pN3EOiIcbvJbcGn1/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.16,319,1744070400"; 
   d="scan'208";a="509503443"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2025 18:05:24 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id E618A1800021C;
	Thu, 17 Jul 2025 18:05:23 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 7B6D8CBEF79; Thu, 17 Jul 2025 11:05:23 -0700 (PDT)
From: Sudhir Dumbhare <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	sudumbha@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Thu, 17 Jul 2025 11:05:22 -0700
Message-Id: <20250717180522.498240-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Jul 2025 18:05:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9318

Upstream Repository: https://github.com/moby/moby.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36623
Type: Security Fix
CVE: CVE-2024-36623
Score: 8.1
Patch: https://github.com/moby/moby/commit/8e3bcf197488

Analysis:
- Moby through v25.0.3 has a race condition vulnerability in the
  streamformatter package. It can trigger multiple concurrent write
  operations resulting in data corruption. [1]
- The fix adds a mutex to prevent concurrent writes and protect against
  data corruption. [2]

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-36623
[2] https://github.com/moby/moby/commit/8e3bcf197488

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36623.patch         | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index aa239f68..d40e3e17 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -60,6 +60,7 @@ SRC_URI = "\
         file://CVE-2024-36621.patch;patchdir=src/import \
         file://CVE-2024-29018_p1.patch;patchdir=src/import \
         file://CVE-2024-29018_p2.patch;patchdir=src/import \
+        file://CVE-2024-36623.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch b/recipes-containers/docker/files/CVE-2024-36623.patch
new file mode 100644
index 00000000..811a37d7
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36623.patch
@@ -0,0 +1,55 @@
+From 595fb34dbb46105379b469abfb70f7f9228c9361 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Thu, 22 Feb 2024 18:01:40 +0100
+Subject: [PATCH] pkg/streamformatter: Make `progressOutput` concurrency safe
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Sync access to the underlying `io.Writer` with a mutex.
+
+Upstream-Status: Backport [https://github.com/moby/moby/commit/8e3bcf197488]
+CVE: CVE-2024-36623
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 5689dabfb357b673abdb4391eef426f297d7d1bb)
+Signed-off-by: Albin Kerouanton <albinker@gmail.com>
+(cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d90363b8)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ pkg/streamformatter/streamformatter.go | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/pkg/streamformatter/streamformatter.go b/pkg/streamformatter/streamformatter.go
+index b0456e580d..098df6b523 100644
+--- a/pkg/streamformatter/streamformatter.go
++++ b/pkg/streamformatter/streamformatter.go
+@@ -5,6 +5,7 @@ import (
+ 	"encoding/json"
+ 	"fmt"
+ 	"io"
++	"sync"
+ 
+ 	"github.com/docker/docker/pkg/jsonmessage"
+ 	"github.com/docker/docker/pkg/progress"
+@@ -109,6 +110,7 @@ type progressOutput struct {
+ 	sf       formatProgress
+ 	out      io.Writer
+ 	newLines bool
++	mu       sync.Mutex
+ }
+ 
+ // WriteProgress formats progress information from a ProgressReader.
+@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog progress.Progress) error {
+ 		jsonProgress := jsonmessage.JSONProgress{Current: prog.Current, Total: prog.Total, HideCounts: prog.HideCounts, Units: prog.Units}
+ 		formatted = out.sf.formatProgress(prog.ID, prog.Action, &jsonProgress, prog.Aux)
+ 	}
++
++	out.mu.Lock()
++	defer out.mu.Unlock()
+ 	_, err := out.out.Write(formatted)
+ 	if err != nil {
+ 		return err
+-- 
+2.44.1
+
-- 
2.35.6


