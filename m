Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB28C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:19:12 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.37064.1753093143381940466
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=d601UtJs;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3417; q=dns/txt;
  s=iport01; t=1753093143; x=1754302743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UCYtapDJV+n4YiHRiZeBFzonroGj2QTGnlcOP6va9G8=;
  b=d601UtJsgdOpZHTmoVjBBBbNW5fJD0s/eKkROwyvSTOKUcDs6PYmATXq
   wt54ddHTuI5gwrFarm3lJi4RWgOfvAAW7MVrpV9fibJTKHszlEh+0I4K7
   dWA6bg1nZj/XM+pXZV62LOghXXAAoPJhz6D6MVjAhYWDqp/CpZ0SrQH0R
   jZIDYiqiHYpdyTljBzXuJOKp+HN1zVVkGrwctq7FUwjdFrC1rSkkoxQk7
   nxpjJMNuzdPdLTfD/ujmv0Dwg1bu0R/Flo1jObKbpBemlfIbC65qtOEFF
   rTBOKvw0Mxep5ZAEamS2wuj+JbvxrUAgiOzQHV4Wa/AIzFBNtuORRYobk
   w==;
X-CSE-ConnectionGUID: 5eJvr+jzSQiIktlfzVpSow==
X-CSE-MsgGUID: ws4NcNfzTyagA5PX9hVYVw==
X-IPAS-Result: =?us-ascii?q?A0AIAACMEn5o/4oQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIFABAEBAQELAYJKeVpCSYRUkXEDi2QQkiSBfw8BAQEPPRQEA?=
 =?us-ascii?q?QGFBwKMEgImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOFew2GWwIBAyMPAUYQHwYCJgICIAsrGYMCAYI5AzICARGuSXqBMoEBg2gCQ?=
 =?us-ascii?q?0/YQQ1ugW2BGy4BiDIeAYR8bwGEdycbgUlEglCCLYEFgRpCAQGFO4JHIgSDO?=
 =?us-ascii?q?Ihjg1GEN4EFhndIgQIcA1ksAVUTDQoLBwWBYwM1DAsuFW4yHYEnhRiEKCtPh?=
 =?us-ascii?q?RCBGYNTJG0PBoEYgnBAAwsYDUgRLDcUGwY9AW4HkWyCKnw9PhMBK1QnICgRW?=
 =?us-ascii?q?E6SV5JPoBtxhCaMHo88hXwaM4VbpQ4LmHuLNYJThAiRKoEchGmBaQE6gUcLB?=
 =?us-ascii?q?00jFYMiCUkZD444g2mBf79OIzU8AgcBCgEBAwmRDQEB?=
IronPort-Data: A9a23:U7aafKrOgIapP832FzmNoqSFkLxeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmHO/yPY2HwKt91YIvj/UgCvMLVyYUwQQI+riFkFCMU8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9z8ljPvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQHNNwJcaDpOtvrc8ks34JwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rt6I39Ut
 v4KEwkMTxOfg+yk/qqATfY506zPLOGzVG8eknhkyTecCbMtRorOBv2To9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwxHYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoHSGp4MwhzB/
 Qoq+UzmGU08P/qR2waU+32F29f/zCPFabwNQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBqlw67Q5UOdQ2MDVDMEMIVgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:6YvGjqEQ1GOgln7TpLqE1ceALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmSTSa3BkXGF+xFK+qj/zJyV
X-Talos-CUID: 9a23:VU2uT28yKl8Zii7bCJyVvxMZON4/MX/P907RAkykDWh7dqWuTkDFrQ==
X-Talos-MUID: 9a23:S/e3RQqub4ljMpLP+Dwezy55aOFjxaq8NFEEnrxbg/nVNRJBBSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.16,328,1744070400"; 
   d="scan'208";a="507314213"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2025 10:19:02 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 1EA7D180003D1;
	Mon, 21 Jul 2025 10:19:02 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id ACFC6CCD994; Mon, 21 Jul 2025 03:19:01 -0700 (PDT)
From: Sudhir Dumbhare <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Mon, 21 Jul 2025 03:17:56 -0700
Message-ID: <20250721101900.759952-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <aH2oBWMowUl8f7+U@gmail.com>
References: <aH2oBWMowUl8f7+U@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 10:19:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9327

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36623
Type: Security Fix
CVE: CVE-2024-36623
Score: 8.1
Patch: https://github.com/moby/moby/commit/8e3bcf197488

Analysis:
- Moby through v25.0.3 has a race condition vulnerability in the
  streamformatter package. It can trigger multiple concurrent write
  operations resulting in data corruption. [1]
- The fix adds a mutex to prevent concurrent writes and protect
  against data corruption. [2]

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2024-36623
[2] https://github.com/moby/moby/commit/8e3bcf197488

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36623.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
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
index 00000000..28553c3e
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36623.patch
@@ -0,0 +1,47 @@
+commit 5becb76fa5a5cb9de135b82017dbc7da7d345614
+Author: Paweł Gronowski <pawel.gronowski@docker.com>
+Date:   Thu Feb 22 18:01:40 2024 +0100
+
+    pkg/streamformatter: Make `progressOutput` concurrency safe
+
+    Sync access to the underlying `io.Writer` with a mutex.
+
+    Upstream-Status: Backport [https://github.com/moby/moby/commit/8e3bcf197488]
+    CVE: CVE-2024-36623
+
+    Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+    (cherry picked from commit 5689dabfb357b673abdb4391eef426f297d7d1bb)
+    Signed-off-by: Albin Kerouanton <albinker@gmail.com>
+    (cherry picked from commit 8e3bcf19748838b30e34d612832d1dc9d90363b8)
+    Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
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
-- 
2.23.1


