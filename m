Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF35FAD40C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:41:47 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12630.1776919306073797386
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 21:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jKaoO/rv;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1078; q=dns/txt;
  s=iport01; t=1776919306; x=1778128906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WEABbQVNzFda5zLyPwF9c79dO/9BgTCdJRslUzqPtCE=;
  b=jKaoO/rvVbsvZcW6QM2HwxB516MMnPDv9UMiZ2DIOe1v0iYenGPtHaQJ
   ba6a4ouLz6vrbHHDXFOZsbkJHh394jECs03ozfwKAQ7Gs54Au+Jjfbqo8
   K6up49JjLxwrGMf3gkfetIEAowU/F7xmffduVb2Xu3wBBqBjCPXTHCz/Z
   Fo9CWq4oR5RL4epIHkVxrbPB+SFncvNeWfY8qNdWlz0H1q/Luzuk737Fz
   z1XAJ/2CrQdnd22hHTABAKPcNs3sfXJtK+3/2QupuMRUMRBduZ810w24T
   D5yiYG5Cp5Nd1K5Gnt3Al0+/OABQJLQfuT2Lz7lOFY8NIkt2hGpbTzqiC
   g==;
X-CSE-ConnectionGUID: nJkBynIwRKWSR7/l5OwQcg==
X-CSE-MsgGUID: s7ebLoq+T++6KpqDJ4JxMg==
X-IPAS-Result: =?us-ascii?q?A0BLAgARoulp/5X/Ja1aHgEBCxIMgWsQDwuCU4FPQ0mTW?=
 =?us-ascii?q?gGOV5I2gX8PAQEBD1EEAQGFBo0uAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBCgEBBQEBAQIBBwWBDhOGXIZdNgFGMFELRIMCgjsDNgOuYoIsgQG3Jg2CU?=
 =?us-ascii?q?gELFAGBOIU/gnmFI4VuJxsbgXKEfYIfgnGFdwSCIoEOgX6NK0iBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFLhBltaoELgzCBOXUDCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB4o9IBCCK2AuAahLoB1xCiiDdJtchXwaM6prLphYkhKSR4RogWg8g?=
 =?us-ascii?q?VlwFYMiUxkPjl/KAyYyPQIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:MRMNLqB3ZHioehVW/23iw5YqxClBgxIJ4kV8jS/XYbTApDx21TIGn
 GUbXz2OaK7famOhfdkia46z90gG6JXWy9RgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCOM+H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAP/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6nGqE+eYM+CCDV4pZgtwdOtTAZzsA6+v5T2PPx8i67gR3R9zx64
 I0lWZBd1W7FM4WU8NnxXSW0HAl4H65s6bnmPkKcjvepkArCLlzz+v5hWRRe0Y0woo6bAElU/
 vAebTRIZReZiqfvmvSwS/JngYIoK8yD0IE34y47i2qGS6x7HNaaH/SiCdxwhF/cguhOH//SY
 MwxYjt0ZxOGaBpKUrsSIM1ixLn12CmiLlW0rnqO+qc9x2/KjzAyk+bOKMP5WICoVeBayxPwS
 mXuuj6R7gshHNmS1TPA7HO2mvLGmSLpUZ4TE7uQ8v9xnEbV12sYFBoOT1y5rPKlzEmkVLpix
 1c84CEiq+02sUesVNS4Bkf+q3+ftRlaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:u0Em/q0al4JXbHmU0jtjIwqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3A7kNQWWr0smaMlchdYT8i0cjmUcYHcVfMylbPGWy?=
 =?us-ascii?q?HMlw2D7nIbkCp86wxxg=3D=3D?=
X-Talos-MUID: 9a23:xyfZRQYwl8TSzuBTrGDhjhVlLYRUoOfwK1gUvbdamdmhOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,194,1770595200"; 
   d="scan'208";a="740656855"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 04:41:45 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 3A0E018000254;
	Thu, 23 Apr 2026 04:41:45 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id B76F3CC1288; Wed, 22 Apr 2026 21:41:44 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] go-distribution: Add CVE_PRODUCT to align with NVD CPE
Date: Wed, 22 Apr 2026 21:41:41 -0700
Message-Id: <20260423044141.4659-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 04:41:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9725

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT has been set to docker:registry to align with the NVD CPE
product namespace for the distribution/registry codebase.

Only a single CPE entry exists in the NVD for this product:
 cpe:2.3:a:docker:registry

This ensures CVEs tracked for docker registry are matched for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit f8bbbf1f7d7b5c7ef6b2c9c86a93cb44524bc740)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-devtools/go/go-distribution_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
index 598df964..740fdfe4 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -39,3 +39,5 @@ go_distribution_digeset_sysroot_preprocess () {
 }
 
 FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+CVE_PRODUCT = "docker:registry"
-- 
2.35.6


