Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16691C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:08:50 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1070.1787288921073532009
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 22:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gm44BKPV;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1047; q=dns/txt;
  s=iport01; t=1787288921; x=1788498521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MCsC5Z1qt367Ye4Zd1zomXO/NVusmowiB69v8/tKdR0=;
  b=Gm44BKPVp1oaOkjFR4xumIDItfJKioTrc69REEV79ME+XDoUGvUUTFK8
   sZzaX8r/jFLJXgyXax6Bh5Sw7LOa9KEE8KZzxrhOM32Ix+1ZL1/vZlhKO
   Bet77vn5aVgLC7TH/frE2wVuyixj1E46uoFu63yGy4Pi+ZP0S/vX/hvNv
   BML0zZ4kJ7e1IIKQvzrfhZ+GkyqXcm2Q+yochNQRET2PpXxLmFhOT1P08
   4pNXmkBwkAYU3LQWLAt4OVPHu4vuopnzJ3eU6PZwN66zphjE9S9E7dER7
   rVXTWhuqluaFmXQKP5Tn2zr2GJbh/uATTavtEpEKOUz+5wHPnAG/3czaY
   A==;
X-CSE-ConnectionGUID: i+Lgj0mERjePrh8cKmjpaw==
X-CSE-MsgGUID: N6v2LmJsQ5+6QHc/a0CsZg==
X-IPAS-Result: =?us-ascii?q?A0AvAwCz3Idq/5EQJK1RCYJZgleBUkNJk1kBgnCgHA8BA?=
 =?us-ascii?q?QEPUQQBAYUFjW4CJjcGDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgFGMFxEgwKCdQPAXoIsgQGEfdswAQsUAQWBM4U/iCKFcicbG4Fyh?=
 =?us-ascii?q?H6ECg15hXgEgiKBDIF4kV5IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgl+CBQIBSUMOBzoLGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjloggkYBPFGBPZUXkXqhDwoog3ahWxozqmwumFqkWoRpgX4mR?=
 =?us-ascii?q?oETcBWDIlMZD95cJzI/BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:8j+AvqAJnOyG+hVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGkm1mYAy
 GROCDvXO/7fZGv1fthzPNnj/UpXvsSHnIdrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA//g2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwrZKA0NuOKAi+OtPG2Ee/
 t8dKigEcUXW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUsiuGwYIeEEjCMbeMLgBy8o
 0Ddxjm6XCg6P5uWkRGewH3504cjmgu+Aur+DoaQ8/N2iRiNx3YPFRQSVEmyvfi+jGa6WslDM
 AoF/SEyqrAo806mRcW7WAe3yENopTYVX95WVul/4waXx++Ms0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:1fv3u6EH89hca6DrpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AB1GFJmpgwZD+fq58l7Loo1/mUcFmVnLflHL9GU2?=
 =?us-ascii?q?1MXxpGLa2TF2I8bwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Afl6waA44DDXT3KvAKU9E0wlnxoxOvbr0LEUviqx?=
 =?us-ascii?q?b+Je9FSc3Mm+2lwa4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="815215859"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 05:08:40 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 41D8018000443;
	Fri, 21 Aug 2026 05:08:40 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id CB4DFCC12A6; Thu, 20 Aug 2026 22:08:37 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][PATCH] runc: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 22:08:37 -0700
Message-Id: <20260821050837.51540-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Aug 2026 05:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10058

From: Devansh Patel <devanshp@cisco.com>

The current "runc" mapping generates a wildcard-vendor product identity for
the packaged Open Container Initiative runtime.

Use "linuxfoundation:runc", the NVD dictionary CPE and configuration identity
for opencontainers/runc. This changes the generated product identity, but the
pinned sbom-cve-check database has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-containers/runc/runc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index 625ec5d2..c2e004d6 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -12,6 +12,6 @@ RUNC_VERSION = "1.5.1"
 RPROVIDES:${PN} += "runc-docker"
 RPROVIDES:${PN} += "runc-opencontainers"
 
-CVE_PRODUCT = "runc"
+CVE_PRODUCT = "linuxfoundation:runc"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-- 
2.35.6

