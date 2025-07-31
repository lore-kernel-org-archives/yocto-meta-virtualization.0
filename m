Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED8DC87FD2
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 21:32:43 +0000 (UTC)
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.web11.73526.1753997555454469849
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 14:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=c6xNAU2L;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3490; q=dns/txt;
  s=iport01; t=1753997555; x=1755207155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mHOwEUywd1Jd/FUulxAEcu4pSdQp9nS4xcy7OgNdR2M=;
  b=c6xNAU2L5bBbc5ctNu8SaHICVpkxg2wchc0c3NTfhs9GFFn7ZMQKHXK3
   DJe5cSMOxXW8kxOP5M6WpsHQg2qREuYUoUE+LgCVBJyzbylUrRs6cgWMd
   qj7mkN3lGwERKlFMxRMHiyl4BRuHqE40UuHT7tK8dxo7amwpnEkI3he73
   h54jWFBNES80SSh15U/VFbBhit3y6MM33aDmIajC5HVhCIvsyRekLs9jm
   ngljO2aNX13jdl0g616WxziPX36V9z9f+rjGrhE1xv85Jd8pEIAHm6fHO
   v2zzk0VJqEuG00unJN1uJv7DgmPpcUsZYnrKMRLYOjWC38igri8PHepNT
   A==;
X-CSE-ConnectionGUID: hCkFAm2fTueNsN2oYNMSAA==
X-CSE-MsgGUID: EILr+EW9Sj6QpRyPnnK64w==
X-IPAS-Result: =?us-ascii?q?A0AGAACI4Ito/9NK/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE/BQEBAQELAYJKeVpCSYRUiByJVQOLZBCSJoF/DwEBAQ89F?=
 =?us-ascii?q?AQBAYUHAowaAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4V7DYZbAgEDIw8BRhALFAYCJgICIAsrGYMCAYI5AzICARGwLHqBMoEBg?=
 =?us-ascii?q?2gCQ0/YQQ1ugW2BGy4BiDIeAYR8bwGEdycbgUlEglCBbz6BBYEaQgEBhTuCR?=
 =?us-ascii?q?yIEgziIYYNRhDaBBXwBAoZpSAp4HANZLAFVEw0KCwcFgSBDAzUMCy4VI0sFL?=
 =?us-ascii?q?R2BJ32EG4QoK0+CInWBeVo/g1MeBm0PBoEVGh4tAgICBQJDRYFgHQYYQAMLG?=
 =?us-ascii?q?A1IESw3FBsGPQFuB5Jcgix8PT4TAStUJyAoEVhOkleST6AdcYQmjB6PPIV8G?=
 =?us-ascii?q?jOFW6UQC5h7izWCU4QJkSuBHIRpgWg8gUcLB00jFYMiCUkZD444J4NCgX+9N?=
 =?us-ascii?q?yM1PAIHAQoBAQMJkxoBAQ?=
IronPort-Data: A9a23:ISnC8a6csp8nAg8T8YakYwxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mcXUW3SbquMNGqhftAlaN6y9UhQuZfRn4cwSlNu/C5hZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH3dOG49xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr/KUzBHf/g2Qpaj1PsvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePaYb1M9yW29y6
 PE+MxZXaSGlotmf6efuIgVsrpxLwMjDNY4F/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkQn1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3FaoqNJ4HRGZU9ckCwi
 0Pi5SfUPUAhNoKm0QCUynSqpbGTgnauMG4VPPjinhJwu3WWy3AaTQMXT0emqP24mEeiWtVZA
 0gV4TY167k1/1CsVsP6XRCzvDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:dm5KSqDrQHbngvPlHemR55DYdb4zR+YMi2TDGXofdfUzSL3/qy
 nOpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMbC/5vyKmDVR1L0bsaC6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3AyaVQTWrS2e8WNBEFrSrg84DmUcAOcVP0yS3eH1K?=
 =?us-ascii?q?1L31PErqkb3qr0Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:qDPoCwnSnwemROYwsSrPdnpPFeNyoImRWXsPz6wegdi8MypTZWuC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,255,1747699200"; 
   d="scan'208";a="28055348"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2025 21:32:33 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 1C02E1800032D;
	Thu, 31 Jul 2025 21:32:33 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id BE7ABCCD994; Thu, 31 Jul 2025 14:32:30 -0700 (PDT)
From: Sudhir Dumbhare <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Thu, 31 Jul 2025 14:31:58 -0700
Message-ID: <20250731213229.3438094-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <CADkTA4OB4YTqY9_TZjX0YiHsXjaFezoKO1W5x7M1H_PeQ8hV-A@@cisco.com>
References: <CADkTA4OB4YTqY9_TZjX0YiHsXjaFezoKO1W5x7M1H_PeQ8hV-A@@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 21:32:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9341

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


