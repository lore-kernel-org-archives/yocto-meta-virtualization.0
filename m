Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47668F8DFEA
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:33:55 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39992.1776414832349359474
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 01:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fgkN+pHv;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=958; q=dns/txt;
  s=iport01; t=1776414832; x=1777624432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4hTz6WL2Ednj+H9IPSU5RatIsDGV1rROVbKm4jBqdlE=;
  b=fgkN+pHv2CBR/jKBICkEKHNwfEVbuZdfiAIWhlpxfA5qsbvvfzHmeNTt
   pvx2tLg9YzoO+GhJ6Tf89nkrv34eZimKaTA5tWgBKr5l+fAhLqo8eWDJR
   jDIugnuAe/4CaJG6Y5X/hy20aTVkz/8TiNoO5fM0FT3HBYoSuEXS6+/lF
   FaXcNKbOPC8LR120dLsIKqUT35dtXWQ7vtF6FtpfIBg2Y2M0v20JohcC/
   5WnpS8b9G4l+aQAci9jBCx3i7R9a0DxuCDbtkATAejff9PpS3FYGIrzOY
   9RkROvEGoEg1hrUnj0QbYbGRmacfQfF28HtL5wI3Upy7e4DSaZt7UYZl4
   A==;
X-CSE-ConnectionGUID: gJoDNoJMSeiEcxGRq8FjXA==
X-CSE-MsgGUID: AkP3XqDnStGNhPTg9CrIRQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgD77uFp/43/Ja1aglmCV4FPQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQeNLgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwKCdAO2dYIsgQGEfNsmAQsUAYE4hT6IHIVuJxsbg?=
 =?us-ascii?q?XKEfYUQhXcEgiKBDoF+hTCCHYVKSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgUuEfXRtgRODRoEJAwsYDUgRLDcUGwQ+bgeKNyKCOYEOAahLo?=
 =?us-ascii?q?Q4KKIN0oVgaM6prLphYpFmEaIFoPEaBE3AVgyJSGQ+OX8UPJjI/BwIHDgKTc?=
 =?us-ascii?q?AEB?=
IronPort-Data: A9a23:dKrW2aJ8JJFkEAjlFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShGZTm
 GUdXW6FMv2MNjGje90iPImx909UusCGzoVnSFcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9h2cqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1hLkYaG4o63916AExF5
 dMiMWAjbCCq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5FMogOS9a4WFIbRmQ+18nX7Dl
 nvq+V/lLTcaDOCQmBGf00iV07qncSTTHdh6+KeD3vtnnFTW2G0JFAAfUVqpqOW4jUiWX9NEN
 1dS6y0lsa8q7kupQ9LhGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Wd60tKM66yvh9sBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:rPe/cW662lDOxdFFndss+2wTNuYiUFjmwXb9KF+XM385Zr+lYArF
X-Talos-MUID: 9a23:HNIIyAmdwSucNuhN81UUdnpLN/8z072CDnsRvrMGg/WLZAdqGg2k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,183,1770595200"; 
   d="scan'208";a="718483783"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Apr 2026 08:33:51 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 63DF6180001AE;
	Fri, 17 Apr 2026 08:33:51 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 0A730CC1288; Fri, 17 Apr 2026 01:33:51 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [master] [PATCH] criu: Add CVE_PRODUCT to align with NVD CPE
Date: Fri, 17 Apr 2026 01:33:43 -0700
Message-Id: <20260417083343.2343973-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Apr 2026 08:33:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9710

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT has been set to criu:checkpoint/restore_in_userspace to align
with the product naming used in the NVD CPE database for criu.

The slash-containing product token is intentional as NVD references this
project under checkpoint/restore_in_userspace.

Only a single CPE entry exists in the NVD for this product:
 cpe:2.3:a:criu:checkpoint/restore_in_userspace

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-containers/criu/criu_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index c27ca56e..1d36ca18 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -108,3 +108,5 @@ FILES:${PN}-staticdev += " \
             ${libexecdir}/compel/std.lib.a \
             ${libexecdir}/compel/fds.lib.a \
             "
+
+CVE_PRODUCT = "criu:checkpoint\/restore_in_userspace"
-- 
2.35.6


