Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0290CC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 19:54:52 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.web11.71505.1753991684026308938
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 12:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VsRsOhH9;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3536; q=dns/txt;
  s=iport01; t=1753991684; x=1755201284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nx5al+6fFhHOKvuS6EKMwTezzdWXp2ja8+p07sVhPlI=;
  b=VsRsOhH9sAZILbaHXyc/YGhPLpmeoWBnMyE6x51pZWGlshSPJucuGsfm
   nA08d5WLGBVpLev1KUhTSFgwjMAWrbgTgB1cFA8o+vYDl7+Kqo+XKIkN9
   pwuGjVYy9M4yw2fZTTkKAP9pZerKVnmm61yW3GQw4n+coGpDPYgSzYeUR
   W7vTnUCoKk6sWYMebD9A7/RKKKbxRgBUYxWXF/U9O8igukwxz3pJjGO6j
   cknmQUCOr6bYCd2SItIsBXkYAVgWkW9cGQfCgKY5Eq4P/tVtc5m7lebiF
   GV+qHH7qOk8U+U9z3QF4Hnnzzx2Nbjq51qRX6uF/HSWawXJuISjAuDC8b
   g==;
X-CSE-ConnectionGUID: 7snAeereRfq4uGUTHer5hw==
X-CSE-MsgGUID: yUftL3zoRwCrMfiu3yIvOQ==
X-IPAS-Result: =?us-ascii?q?A0AFAAA3yYto/89K/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE/BQEBAQELAYJKeVpCSYRUiByJVQOLZJI2gX8PAQEBDz0UB?=
 =?us-ascii?q?AEBhQcCjBoCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThXsNhlsCAQMjDwFGEAsUAQUCJgICIAsrGYMCAYI5AzICARGwNXqBMoEBg?=
 =?us-ascii?q?2gCQ9kQDYEFgVaBGy4BiDIeAYR8bwGCSIIvJxuCDYJQgW8+gQWBGkIBAYF9g?=
 =?us-ascii?q?z6CRyIEgiKBFohhg1GENoEFfAEChmJICngcA1ksAVUTDQoLBwWBIEMDNQwLL?=
 =?us-ascii?q?hUjSwUtHYEnfYQbhCgrT4IidYF5Wj+DUx4GbQ8GgRUaHi0CAgIFAkNFgWAdF?=
 =?us-ascii?q?EADCxgNSBEsNxQbBj0BbgeSWIIsfD0+EwErVCcgKBFYTpJXkk+gHXGQRI88h?=
 =?us-ascii?q?XwaM4VbpRALmHuLNYJThAmRK4EchGmBaDyBRwsHcIM3CUkZD444J4NCgX+9B?=
 =?us-ascii?q?yM1PAIHAQoBAQMJkxoBAQ?=
IronPort-Data: A9a23:0rE1haNkNkzsCWPvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUpz1WBSn
 zccXjiOafeCazahKYslPNiy9B4P6sTVytYxTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFDmF/03F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WlzlV
 e/a+ZWFZQf6gGcsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66p1Cmg7MJcVwOhuXXxhy
 MA4JSpQbg/W0opawJrjIgVtrs0uNozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IwBPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FYtjuWza4OEEjCMbdRokFq8/
 XDBxXvSGDQUNcHE2Bub1Uv504cjmgu+Aur+DoaQ8/N2iRiNx3YPFRQSVEmyvfi+jGa6WslDM
 AoF/SEyqrAo806mRcW7WAe3yENopTYVVsAVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:35C8eqsNk129OCRK3vGBaATU7skDS9V00zEX/kB9WHVpmwKj+P
 xG+85rsyMc6QxhP03I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4KScZD4bPLYWSS9fyKgzVR170bsaG6GGfCv5am80tQ
X-Talos-CUID: 9a23:vKH8/G6eF3DkGWMF79ssq1USM80oaHDnwm6MPmCFNUZkUuCVVgrF
X-Talos-MUID: 9a23:KzODcQq3kLCrRZgZ1hYezyBfOttMuLapMl8mi7AIutTfJA1uHA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,255,1747699200"; 
   d="scan'208";a="24656319"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2025 19:54:41 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 9DC6918000495;
	Thu, 31 Jul 2025 19:54:41 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 2C464CCD994; Thu, 31 Jul 2025 12:54:40 -0700 (PDT)
From: sudumbha@cisco.com
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Thu, 31 Jul 2025 12:53:16 -0700
Message-ID: <20250731195438.3206797-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <PH0PR11MB7496292BBD9BF5D6A0225078D127A@cisco.com>
References: <PH0PR11MB7496292BBD9BF5D6A0225078D127A@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 19:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9339

From: Sudhir Dumbhare <sudumbha@cisco.com>

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
 .../docker/files/CVE-2024-36623.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index d274b002..e1ece0fd 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -58,6 +58,7 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://CVE-2024-36620.patch;patchdir=src/import \
         file://CVE-2024-36621.patch;patchdir=src/import \
+	file://CVE-2024-36623.patch;patchdir=src/import \
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
2.35.6


