Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A9EF5A8DB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:44:14 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5010.1776739447500219465
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PV2WpY9z;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=900; q=dns/txt;
  s=iport01; t=1776739447; x=1777949047;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g7izj8X8H0FHc4XzdoYkyd2d4X1WPmF89IuzqDdOoT4=;
  b=PV2WpY9z+cpdGQznl9h/tTQ8VjZaJ520BWMHzy62mldPvFS/3wltmZ2J
   kdJyjmZkdJloykZQ+HZiymYrkWOHPHG550WZiwfCRFWjAck4wTWqWAxeU
   mS5kv31dno1/okPslw5psD+XRehSSz1wr/xgD4AlvTDRIGRJccrU8/k0b
   9C5aanWhZdyqvbthPIeQ2AjqM5ZPKtVxhwO2CM7cI5RdpXt0f4bSQs6ZE
   cbUdv++2NBK4rpc8vk4d6AWqDXlqzdWyMRyIAZChgzkRszsTg5YKV8srP
   4pTPhUCU1RJaiJmWfwyzGZ5FuTmFlc6cj5Pv/4y7/7WBMQAkPjXtae92n
   g==;
X-CSE-ConnectionGUID: Ic3L7jcSQhqRoGSImpLW9A==
X-CSE-MsgGUID: WGWRdNggQN+LCFrSp+y8+w==
X-IPAS-Result: =?us-ascii?q?A0BBAgCZ4+Zp/5X/Ja1aglmCV4FPQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQeNLgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwKCdAOzNYIsgQHgIgELFAGBOIU+iByFbicbG4Fyh?=
 =?us-ascii?q?H2FEIV3BIIigQ6Bfo0USIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMG?=
 =?us-ascii?q?wcFgUuEYm1qgQuDMYE8AwsYDUgRLDcUGwQ+bgeKMCEQgipgLgGoS6EOCiiDd?=
 =?us-ascii?q?KFYGjOqay6YWKRZhGiBaDyBWXAVgyJSGQ+OX8grJjI/BwIHDgKTcAEB?=
IronPort-Data: A9a23:A1Siz63GVxlzVvI0nvbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzYAy
 2oaUDiEO6mJMzSjKIhzbYqy8UpXuZCHyNQ2Gwdu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2IuajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLUptGdIa8d1OAXh08
 tMjCTUVSi/SrrfjqF67YrEEasULNsLnOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiRC/FMEg9/5JYWnOWhin75WzZZs1mS46Ew5gA/ySQuiem1a4eMK4DiqcN9oWmnn
 G7g8GvAJFI+H/KF8iLG4yLvmbqa9c/8cMdIfFGizdZvjUGag3ISEgELXF+6s/Cli0m4c9ZeM
 FAPvDspprQ17FasTNT2Q1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:fn7mTaOrqCDCZsBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:dTGrzGHbebBfnRRNqmJG/xUwRcIuSUTd1U3XDHSZDH5Nd+y8HAo=
X-Talos-MUID: 9a23:bAY35grweTXtuT4jBl8ezw5NC/1kxauhMWZOtb4oofKcdj0geCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,190,1770595200"; 
   d="scan'208";a="719035194"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Apr 2026 02:44:06 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 811E118000312;
	Tue, 21 Apr 2026 02:44:06 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id F2589CC1288; Mon, 20 Apr 2026 19:44:05 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [master] [PATCH] go-distribution: Add CVE_PRODUCT to align with NVD CPE
Date: Mon, 20 Apr 2026 19:43:58 -0700
Message-Id: <20260421024358.2052076-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9717

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT has been set to docker:registry to align with the NVD CPE
product namespace for the distribution/registry codebase.

Only a single CPE entry exists in the NVD for this product:
 cpe:2.3:a:docker:registry

This ensures CVEs tracked for docker registry are matched for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-devtools/go/go-distribution_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
index 57b87f76..830f20b5 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -37,3 +37,5 @@ go_distribution_digeset_sysroot_preprocess () {
 }
 
 FILES:${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
+
+CVE_PRODUCT = "docker:registry"
-- 
2.35.6


