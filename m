Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F67EFAD408
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:38:37 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12744.1776919109848772189
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 21:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Khuw1xSh;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1134; q=dns/txt;
  s=iport01; t=1776919109; x=1778128709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0zHtuM0NqEQlcIS47Armri5MOVE4VXdyqqFdmXNur+M=;
  b=Khuw1xShgZpU0va9VOzrjHs0SBLU0zvUSw5Gjgp92XxQp/D/psxq3yIc
   9xA76HQtyO2DdfISC6eJJQFKaSI5oiFxWedzL61CT7ZuPuU3iy2bVm3HW
   QuVUiIXnFWKJ3qFmjgol+saHj0ZCAgAROZgCmYMHUPcYQ7RNlL66coboh
   LRXlDZyCKc0sb2SiS9n3hsN/AAdvoEnS9wvuLdL+pXUMbGmsNfwjjyJzB
   lP+1eU4ESYPr8G455fnWXf+f+x80NC1QymVp3BjoQUs7F2j0cMPseUr1R
   x2XmgSjabiN6TY2r3V8FTr8YRzvknvc/ES+Sjz7jCNwBbszjYVrL9B5am
   Q==;
X-CSE-ConnectionGUID: 9eLRiwSWRViPJlcG8WR+Eg==
X-CSE-MsgGUID: Y9q4IvqvQ4iCeRIYcm8NjA==
X-IPAS-Result: =?us-ascii?q?A0DEAgD6oOlp/4r/Ja1aglmCV3FeQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGjS4CJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02AUYwJjZEgwIBgnMDEbJEgiyBAeAjAQUGFAGBOIU/iByFb?=
 =?us-ascii?q?icbG4FyhH2CYQQYgQ2BBoV3BIIigQ6BfoR1iDZIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQwbBwWBS4QZbWqBC4MwgTl1AwsYDUgRLDcUGwQ+bgeKP?=
 =?us-ascii?q?SAQgiuBDiyWKJF4oQ4KKIN0jB6VOhozhASmZy6YWIJYizGWUIRogWkBOoFZc?=
 =?us-ascii?q?BWDIlMZD45fiFbABiYyCzICBwIHDQMLkWiBfQEB?=
IronPort-Data: A9a23:W8BO06lji73F0b1vLAFOJj/o5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJND2GCO/iOY2vzctgjaYSzoEgP7ZWGmNE2T1BsqytjQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIsfnb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdwV3tx2Hlpxz
 8IZEBIJZT/TuNj17b3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3Fb4CJK43WGZwF9qqej
 lOX5jjYHAgEDYCe4je/00Ong7/pnwquDer+E5X9rJaGmma7w2EPAVgIVEGnvPC9i1y3R9NYL
 WQQ+zEytu4j80e3ScHnWB+1q2LCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:LxmgIaCycN5SGrzlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3AAXNdzWrnTVH6dYLy4E8VmxLmUZEoVkfc00zvGXG?=
 =?us-ascii?q?5MURtQ5LFdmXT1awxxg=3D=3D?=
X-Talos-MUID: 9a23:sA6oJAgaRk8eh17bYCme8MMpBZZxv4WwEV40zZQttvOlBCd1axGfpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,194,1770595200"; 
   d="scan'208";a="724994418"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 04:38:29 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D44CD18000299;
	Thu, 23 Apr 2026 04:38:28 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 20A8ACC1288; Wed, 22 Apr 2026 21:38:28 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] containerd-opencontainers: align CVE_PRODUCT with NVD CPE naming
Date: Wed, 22 Apr 2026 21:38:17 -0700
Message-Id: <20260423043817.4194116-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 04:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9722

From: Himanshu Jadon <hjadon@cisco.com>

Update CVE_PRODUCT from containerd to linuxfoundation:containerd in
containerd-opencontainers recipe to match the vendor-qualified
NVD CPE naming.

This aligns with the master update[1] and avoids potential CVE lookup
gaps caused by an unqualified product token.

Reference:
[1] https://git.yoctoproject.org/meta-virtualization/commit/?id=f829fbfda0f14365235d48dbe2055121fbc0718c

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 3144a5a6..4ecc915a 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -96,4 +96,4 @@ COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
 
 RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
 
-CVE_PRODUCT = "containerd"
+CVE_PRODUCT = "linuxfoundation:containerd"
-- 
2.35.6


