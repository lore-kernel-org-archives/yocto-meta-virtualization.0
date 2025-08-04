Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C982C87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:05:15 +0000 (UTC)
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.web11.17227.1754312709438110917
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 06:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e/vCBfaq;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3536; q=dns/txt;
  s=iport01; t=1754312709; x=1755522309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nx5al+6fFhHOKvuS6EKMwTezzdWXp2ja8+p07sVhPlI=;
  b=e/vCBfaqChFKS8/2pXHPf1Wbq9nOpZfdwIzljAU7/VakTkdjfx6tHEPE
   nlYuajTM68LsYmzhyr3dF+PvrAsG+asMxQkk1tzwEQXWseqx1kmQhECCR
   2rYpmoz+qCD/lTBDHiFyBJTRIGzKA+5G01XR5+yLuibytXiFD3Zlx1rd9
   5aXezVQxRixnW8/c92S+zgM/qJudzFO64g/PZTrDXu6z+jlN9ukER9W8U
   wdLt7nHLaqmyzNBY1GOY8x0M1J4HOIZQMZXrGgDrohi20UmeVG/MROzaR
   9UlkLJIl2CyA5i8z0igM7ZDe8NNWCsTtxw7wlKh9pWSrvtuUwdDxZubec
   A==;
X-CSE-ConnectionGUID: DBR27pLFQLmsq970srNtwg==
X-CSE-MsgGUID: Sn/p0gnTSIKuJHS+4wxzKQ==
X-IPAS-Result: =?us-ascii?q?A0AFAACVr5Bo/81K/pBaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE/BQEBAQELAYJKeVpCSYRUiByJVQOLZJI2gX8PAQEBDz0UB?=
 =?us-ascii?q?AEBhQcCjBkCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThXsNhlsCAQMjDwFGEAsUAQUCJgICIAsrGYMCAYI5AzICARGuCXqBMoEBg?=
 =?us-ascii?q?2gCQ0/YQQ2CW4EbLgGIMh4BhHxvAYR3JxsbgXKCUIFvPoEFgRpCAQGFO4JHI?=
 =?us-ascii?q?gSCIoEWiGGDUYQ2gQV8AQKGbEgKeBwDWSwBVRMNCgsHBYEgQwM1DAsuFSNLB?=
 =?us-ascii?q?S0dgSd9hBuEKCtPgiJ1gXlaP4NTHgZtDwaBFRoeLQICAgUCQ0WBYBkGGkADC?=
 =?us-ascii?q?xgNSBEsNxQbBj0BbgeSX4IsfD0+EwErVCcgKBFYTpJXkk+gHXEKKIN0jB6PP?=
 =?us-ascii?q?YV8GjOFW6UQC5h7izWCU4QJkSuBHIRpgWg8gUcLB3AVgyIJSRkPjjgng0KBf?=
 =?us-ascii?q?7k7IzU8AgcBCgEBAwmTHQEB?=
IronPort-Data: A9a23:kg3B4qCKUNt0ahVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDolg2ADz
 mAZX26DOfrcZDf3Lt4jaYy09kgGuZHWm4JlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gXGthh
 fuo+5eCYA/9gmYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE799UVh4uGaMh3uNsGDARr
 ecCDiwSYUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4kXfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWcHgBfoO3WjPn8MFZ4jme2oj1H0ciZTrxSeoq9fD237ll0hjeKza4G9ltqifsMShh6Xo
 F793kfkIDEhd4CA2Simyyf57gPItWahMG4IL5W9++JjxUOS3HAOARkXR1KnoP6/okq/QM5Eb
 V0T8TYptbI19kGgUp/6RRLQnZKflhcRQZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7NV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:GRdzuaA0b62cBTflHemR55DYdb4zR+YMi2TDGXofdfUzSL3/qy
 nOpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMbC/5vyKmDVR1L0bsaC6zJw=
X-Talos-CUID: 9a23:c6OvXmH/Vp6y6ReCqmJL3nRORdgBXET5yWzJchDgEnxPVKKaHAo=
X-Talos-MUID: 9a23:vh9CTghMG11IUFIyBcVQpMMpD8Ev+/yhDnw2sLYbmem/dnBvKyW+tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,258,1747699200"; 
   d="scan'208";a="29852633"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2025 13:04:53 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id BC5DE180001DE;
	Mon,  4 Aug 2025 13:04:52 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 401E7CBEF79; Mon,  4 Aug 2025 06:04:51 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Mon,  4 Aug 2025 06:04:11 -0700
Message-ID: <20250804130449.324152-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250804125442.317323-1-sudumbha@cisco.com>
References: <20250804125442.317323-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Aug 2025 13:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9343

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


