Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CA6CA1011
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 17:09:03 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.18287.1756919339032844760
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 10:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BkQ04lQx;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3602; q=dns/txt;
  s=iport01; t=1756919339; x=1758128939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BANmit3+XdMvhGKc6XGS3wYuMejZV75TgddSvuj4jzQ=;
  b=BkQ04lQxwRT0X2sd9dKfsAr/Etp8610Z0ImNG0T4CoKuHreKFCRZsNYh
   AhfpjDWpydwWevrTpMToU0JmOSyGL9UNxKJvygvN4R1BuEsdDs/yeR+yS
   ySDNRaCAw9qWveyAg6fjafGDYTISn9ldSs4Pegw8Sf6ZjHpcOt/1QYLqI
   3t3d7w0EKD4Mf2QGSaZaIC4Xkubc64PcIAWqf6NGE/NExFHMAJSn84+8t
   SjKWVrXA0QKr+xybgv1SU9H/Zgqew77OZ/DmkdHRNwXQIXLb0F2BFRNT1
   +u9aeTWczHF7r0Q21YpTOlvyeVT7dwyavvzKemiCi9RIenCZXNg8PiSNU
   g==;
X-CSE-ConnectionGUID: 3fVPkNDdRoWDu4kALtXh5Q==
X-CSE-MsgGUID: kSoPK9PMSlu6sL4z57wRXQ==
X-IPAS-Result: =?us-ascii?q?A0ADAADldbho/5T/Ja1RCRkBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QESAQEBAQEBAQEBAQEBQIE/BAEBAQEBCwGCRnpaQkmEVIgciVUDi2SSNoF/D?=
 =?us-ascii?q?wEBAQ89FAQBAYUHAowmAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDIw8BRhALFAEFAiYCAiALKxmDAgGCOgM1AgERs?=
 =?us-ascii?q?XJ6gTKBAYNoAkNP2EENgluBGy4BiDEeAYR8bwGEdycbG4FyglCBbz6BBYEaQ?=
 =?us-ascii?q?gEBgTSEB4JHIgSCIoEWiECDQ4QwfYF/iCFICngcA1ksAVUTDQoLBwWBIEMDN?=
 =?us-ascii?q?QwLLhUjSwUtHYEneYQUhB4rT4IbcoF1V0CDUx4Gaw8GgRUZSQICAgUCQz6Bb?=
 =?us-ascii?q?QYcBh8SAgMBAgI6Gj0QgX0CAgQwQAMLGA1IESw3FBsGPQFuB5RpgjN8PT4TA?=
 =?us-ascii?q?StUJyAoEVhOkleybHEKKIN0jB6PPYV8GjOFW6UQC5h7izWCU4QJkSuBHIRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJSRkPjjgng0KBf7YFQzU8AgcBCgEBAwmTZwEB?=
IronPort-Data: A9a23:uSBCP6y6SDjTBTQgCrF6t+dkxyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 zQaXD+DbvmLM2v2c9F3atznoxkCv8XSzNVqQAU4q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/FH0a+KJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 IOaT/H3Ygf/hmYlajlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBo4A7Ub3Mp7O2Zx2
 eFEKxkpciCD2tvjldpXSsE07igiBNPgMIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cM3WjOX9PYH46tPy1imT6eT1RgFmUvqEwpWPUyWSd1ZCwa4WNJ4PaFJ09ckCwp
 VnBx0eoOjQhMMHB0h7Z4C/zmdX/pHauMG4VPPjinhJwu3WWy3AaTQMXT0emqP24mEeiWtVZA
 0gV4TY167k1/1CsVsP6XRCzvDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:pkBR26upKJpFYvNAgI1Ln72j7skDS9V00zEX/kB9WHVpmwKj+P
 xG+85rsyMc6QxhP03I9urgBEDtex7hHNtOkOss1NSZLW3bURWTTL2KhLGKq1aLJ8S9zJ856U
 4KScZD4bPLYWSS9fyKgzVR170bsaG6GGfCv5am80tQ
X-Talos-CUID: 9a23:PSo2e2Nuttm2L+5DAydZzE0yNswfdULx0SvTCmukOWY0cejA
X-Talos-MUID: =?us-ascii?q?9a23=3AwavdFQy/uXKMCn1pv7qmGVRwbmKaqKeVD3guwK0?=
 =?us-ascii?q?jgM2ZazdUZyXA0yuNcrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,236,1751241600"; 
   d="scan'208";a="537057890"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2025 17:08:51 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D094418000152;
	Wed,  3 Sep 2025 17:08:50 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 773C0CCD994; Wed,  3 Sep 2025 10:08:50 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH v2] docker-moby 25.0.3: fix CVE-2024-36623
Date: Wed,  3 Sep 2025 17:08:50 +0000
Message-Id: <20250903170850.1888472-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <CADkTA4P0tazAxhxkWU-yQjb5PufzgwC32MwN7+meSFOZSvqMoQ@mail.gmail.com>
References: <CADkTA4P0tazAxhxkWU-yQjb5PufzgwC32MwN7+meSFOZSvqMoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 17:09:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9365

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

Changes in v2:
	* Fix from identity
	* Clean up whitespace

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
index 00000000..3878a8b1
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
-- 
2.23.1


