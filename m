Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCDFCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:14:08 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.34947.1756977243807466812
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 02:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FGEyMSse;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3775; q=dns/txt;
  s=iport01; t=1756977243; x=1758186843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hhuIW4p12oUZI5fzT0F9XGRJTXPk+KK7wDKNIRl18vU=;
  b=FGEyMSseNezgpU409EgpYK5iMXGTNoq+LLRGfu4Z7YbhpoCtS4bjuaDn
   W7funQIjqmpQOkVgcxKB7wb2sVhujEMMiS6q9uoQ5glbhXyh5aB8R0TcX
   KK5jjgqH7bmDH1W55we+V+dTImoOvHmsF3sTW/fpa+NFHmyPsqmeLeYUV
   6vtGGIoTo9spQbR57kLEqL8bAJty3zByZkroF5fYqoLGg/esE7/P5uxL2
   Rh2ePEzK91T3vSoXILvuPjfHPpj2Ww2zDuaSgJy1bymkkbzQGHv843SrP
   G9j2p9fVrWx5X4dychm+xbQaTWF7vQO12nh7fxExpec8QFZnYHL2QRYU3
   A==;
X-CSE-ConnectionGUID: 6tuiOOz5TSe6WgoYHpMNsQ==
X-CSE-MsgGUID: PThdh9t3QpuKVrBijF0Wog==
X-IPAS-Result: =?us-ascii?q?A0AFAACmV7lo/4//Ja1RCRoBAQEBAQEBAQEBAwEBAQESA?=
 =?us-ascii?q?QEBAQICAQEBAUCBPwUBAQEBCwGCRnpaQkmEVIgciVUDi2SSNoF/DwEBAQ89F?=
 =?us-ascii?q?AQBAYUHAownAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAyMPAUYQHAMBAgMCJgICIAsjCBmDAgGCOgM1AgERsyd6g?=
 =?us-ascii?q?TKBAYNoAkNP2EENgluBGy4BiDEeAYR8bwGEdycbG4FyglCCLYEFgRpCAQGBN?=
 =?us-ascii?q?IQHgkciBIIigRaMA4QwfYF/iC1IgQIcA1ksAVUTDQoLBwWBYwM1DAsuFW4yH?=
 =?us-ascii?q?YEnhQ2EHitPhQKBF4NTJGsPBoEVg10GgTGDB0ADCxgNSBEsNxQbBj0BbgeUc?=
 =?us-ascii?q?IIzfD0+EwErVCcgKBFYTpJXkk+gHXEKKIN0jB6PPYV8GjOFW6UQC5h7izWCU?=
 =?us-ascii?q?4QJkSuBHIRpgWg8gUcLB3AVgyIJSRkPjjgng0KBf7d/IzU8AgcBCgEBAwmTZ?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:8KbQGaLhJqk0cfcRFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS1zIOz
 DBJCz/VP/rbY2PwctFzYYS08BsAv8PUzYRiTQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL9imYoajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0wEFw3GqoKp9pMDD9x+
 vspCCgoSAu60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLolgeu1g3P/ehVTqUmeouw85G27IAlZjeS0aICLJYTVLSlTtn6kp
 m7GrniiOwkHF+KF4zuH3CqTgeCayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:tqIcH6l6aLQ4tnASgTUJWE0kI3XpDfIR3DAbv31ZSRFFG/FwWf
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsNFZuEYY2IXsS+D2njaLz7lq+P3iJxBQozlvg5QcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AsO2fm2p1FlbQC3xWtTeJZ5fmUZ45b3z662WNH3S?=
 =?us-ascii?q?1V1lmT4y1UXq245oxxg=3D=3D?=
X-Talos-MUID: 9a23:JodnIwqNdlfch95+oHQezwleNMtosrj1MVgQsqsckciGG3RPPDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,237,1751241600"; 
   d="scan'208";a="541026707"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2025 09:14:02 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 3122E1800027E;
	Thu,  4 Sep 2025 09:14:02 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id C4F6BCBEF79; Thu,  4 Sep 2025 02:14:01 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH v3] docker-moby 25.0.3: fix CVE-2024-36623
Date: Thu,  4 Sep 2025 02:13:36 -0700
Message-ID: <20250904091400.1008346-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <aLjXOPctYXCxdpeP@gmail.com>
References: <aLjXOPctYXCxdpeP@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 09:14:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9374

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

Changes in v3:
	* Fix patch format

Changes in v2:
	* Fix from identity
	* Clean up whitespace

 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2024-36623.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
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
index 00000000..e2a26479
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-36623.patch
@@ -0,0 +1,51 @@
+From a04fb7404d9b12a8357891f1e4d709faf029b695 Mon Sep 17 00:00:00 2001
+From: Paweł Gronowski <pawel.gronowski@docker.com>
+Date: Thu, 22 Feb 2024 18:01:40 +0100
+Subject: [PATCH] pkg/streamformatter: Make `progressOutput` concurrency safe
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
+	"encoding/json"
+	"fmt"
+	"io"
++	"sync"
+
+	"github.com/docker/docker/pkg/jsonmessage"
+	"github.com/docker/docker/pkg/progress"
+@@ -109,6 +110,7 @@ type progressOutput struct {
+	sf       formatProgress
+	out      io.Writer
+	newLines bool
++	mu       sync.Mutex
+ }
+
+ // WriteProgress formats progress information from a ProgressReader.
+@@ -120,6 +122,9 @@ func (out *progressOutput) WriteProgress(prog progress.Progress) error {
+		jsonProgress := jsonmessage.JSONProgress{Current: prog.Current, Total: prog.Total, HideCounts: prog.HideCounts, Units: prog.Units}
+		formatted = out.sf.formatProgress(prog.ID, prog.Action, &jsonProgress, prog.Aux)
+	}
++
++	out.mu.Lock()
++	defer out.mu.Unlock()
+	_, err := out.out.Write(formatted)
+	if err != nil {
+		return err
+--
+2.44.1
-- 
2.44.1


