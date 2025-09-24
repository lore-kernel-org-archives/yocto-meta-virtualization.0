Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B28CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:56:20 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.20919.1758736574741085385
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DIVLlDUr;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3910; q=dns/txt;
  s=iport01; t=1758736574; x=1759946174;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XmvdHA2dksn0CAwdIK9cIZrAzjSM7mXRVaqwKpgHD3s=;
  b=DIVLlDUrK/kOw9Ll/jCnNHZ///SIE4LaUCLCqvtwIWAQv4MztQwjx7nY
   ZtJh3om/S328hdDvLdXRfTYZ4wbV1Aeff44/iX6CrP1lWi+Zxrrc0Wwbp
   2yqo5hPAQ/S9BaG5WPHT3J8hOpcfJbib4OcxqbIO34JkOB5SmAYYgsmZI
   cXnGUfFAadr1kw12WRv5s+UQ0YeLpxbdKTAn0p4MKg0csnCnBNtxS1Jlj
   wQwDqiUWcDHr9uI6Nx29PUiWv2AZ33Z76JN7ajQq3od24f4M4aZFkUMLC
   A7hjrds7NiR9m0NDAAdogqkCrbBG2oeVONbHlEdV8hg7nOiujT+XRv9cB
   w==;
X-CSE-ConnectionGUID: sm5moCM9S/6vYet9RYBrQw==
X-CSE-MsgGUID: IdhIlThUS9WSGXhDHu+B+A==
X-IPAS-Result: =?us-ascii?q?A0ApAACwL9Ro/4z/Ja1RCRwBAQEBAQEHAQESAQEEBAEBQ?=
 =?us-ascii?q?IE/BwEBCwGCRntaQkmEVIgchzSCIQOLZJI2gX8PAQEBDz0UBAEBhQcCjEMCJ?=
 =?us-ascii?q?jQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBA?=
 =?us-ascii?q?gEDIw8BVhwDAQIDAiYCAiALIwgQCYMCAYI6AzUCARG2E3qBMoEBg2gCQ0/YQ?=
 =?us-ascii?q?g2CW4EbLgGIMR4BhHxvAYR3JxsbgXKBFYE7gi2BBYEaQgEBgTSEB4JHIgSCI?=
 =?us-ascii?q?oEWjACEMH2BfoooSIECHANZLAFVEw0KCwcFgWMDNQwLLhVuMh2BJ4ULhB0rT?=
 =?us-ascii?q?4UCgRiDUyRrDwaBFYNbgTeHAUADCxgNSBEsNxQbBj0BbgeWV4I5fD0+EwErV?=
 =?us-ascii?q?CcgKBFYTpJXkk+gHXEKKIN0jB6PPYV8GjOFW6UQC5h7izWCU4QJkSuBHIRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJSRkPjjgng0KBf8gOIzU8AgcBCgEBAwmTZwEB?=
IronPort-Data: A9a23:L1+Qd6Du3fZFDRVW/3riw5YqxClBgxIJ4kV8jS/XYbTApDkg3zBTx
 2UYWGDUPfrYNGvzL412aNvi801SvpKAzdFmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA7/h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2PAzCUYdGNwjvbhpMGxSp
 MYpAio0cUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/E48ygeKihnDXeDxDo1XTrq0yi4TW5FEvj+G2aoOPI7RmQ+10kka5o
 l7Gwl+oPSo1BNyz6SfG2DGF07qncSTTHdh6+KeD3vtnnFTW2G0JFAAfUVqpqOW4jUiWX9NEN
 1dS6y0lsa8q7kupQ9LhGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:ibU8R6Aev3YukRPlHemr55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHPxOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: 9a23:sF/J8W45dQFpiZjHqdss70tJH8cOVyzmiynOEkKkWFxYYqesVgrF
X-Talos-MUID: 9a23:uuOdZgh2dN58Nml1mCmycsMpFctowqCSCH02wKo9lPmEGQxteB3epWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,291,1751241600"; 
   d="scan'208";a="567132121"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Sep 2025 17:56:13 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id BEE55180001F0
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Sep 2025 17:56:13 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 4F176CE1C40; Wed, 24 Sep 2025 10:56:13 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [scarthgap] [PATCH v4] docker-moby 25.0.3: fix CVE-2024-36623
Date: Wed, 24 Sep 2025 10:53:53 -0700
Message-ID: <20250924175611.3927714-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250904091400.1008346-1-sudumbha@cisco.com>
References: <20250904091400.1008346-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Sep 2025 17:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9409

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

Changes in v4:
        * Fix non-ASCII 

Changes in v3:
	* Fix patch format

Changes in v2:
	* Fix from identity
	* Clean up whitespace

 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36623.patch         | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-36623.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index d274b002..624da11c 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -58,6 +58,7 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://CVE-2024-36620.patch;patchdir=src/import \
         file://CVE-2024-36621.patch;patchdir=src/import \
+		file://CVE-2024-36623.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-36623.patch b/recipes-containers/docker/files/CVE-2024-36623.patch
new file mode 100644
index 00000000..6b2be770
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36623.patch
@@ -0,0 +1,55 @@
+From 3d0828dcdd9fbbd997231013ff2dabb9dd320558 Mon Sep 17 00:00:00 2001
+From: Paweł Gronowski <pawel.gronowski@docker.com>
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
2.44.1


