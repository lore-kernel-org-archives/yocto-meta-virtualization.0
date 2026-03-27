Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA61310ED659
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 11:06:08 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70306.1774609566829111874
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 04:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JBJva2Bj;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1149; q=dns/txt;
  s=iport01; t=1774609566; x=1775819166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NGvfFx9muShtyXf7zjCtMnLGEvqel/2wFUG+1F3m6UM=;
  b=JBJva2BjkPYTxQ/HxWa29LTpAGMZzykNxsBRUS62CQydHFABEEmm2GqB
   0UowP9K1Q2k/dwKfcBwpmZ0RAamKDRl8bPfjv2HhZ8s1enrZ/+ABqpGbZ
   iTHQFs9Pq/bXsoCylN0iXiq/LdmF3CzEWtQuWdkG3dHMzCRr5TQgIgx7T
   rufSZYvX0ca2bQ1s8CJfVNVJcR5OwNKMNVrDoeKDLI7H94lg4n/n0xZGs
   +UB/WFpPbJrVuLl3PcYTwMdRklZcI7wjH3jsk8/pJjvB2WS1Ql7GgnQ2D
   k8eoxzgyO2Fp3AwCv72HVGj8ABiIhr2nJlmKousaD5k6hkqCy0WwuYsc8
   w==;
X-CSE-ConnectionGUID: bPHqK/waTJ6nAH4Fs1hm4Q==
X-CSE-MsgGUID: caGeIEPhRmy0XsFqp8m2Iw==
X-IPAS-Result: =?us-ascii?q?A0BEFADNVcZp/5T/Ja1agjQQGoJED4FPQ0mTWgGhDYF/D?=
 =?us-ascii?q?wEBAQ9RBAEBhQeNJwImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGXTYBRjBcRIMCgnQDtzCCLIEBhHy1CAELFAGBOIU8iBuFb?=
 =?us-ascii?q?icbG4FyhH2FEIV3BIIigQ6Bf49eSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgWAPiG10bYEThAwuAwsYDUgRLDcUGwQ+bgeMSTGCNIEOpiuCI?=
 =?us-ascii?q?aEOCiiDdKFYGjOqay6YWKRZhGiBagE5RoETcBWDIlIZD45fygImMj8HAgcOA?=
 =?us-ascii?q?pNwAQE?=
IronPort-Data: A9a23:7CUO+qk7U1Rq88gwittmnHLo5gzFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODDzUPqvYYWv3edpzbIvjoUoDsMfdnYNhTQE9+yszEltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav668yMUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsfzb9nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36YWBivkFrt52K2XCukMCdPpETb5LwYW8P49mAcksYJ
 N9l7fRcQi9xVkHAdXh0vxRwS0lD0aN6FLDvK0CfqO/U0ET6USXq6tUyIlpvPYhEw7MiaY1O3
 aRwxDEldBuPgaeyhbm8UOQp351lJ8jwN4RZsXZlpd3bJa95GtaYHOOQuIIehWtg7ixNNa62i
 84xaThmYBPGSxZOIVwQTpk5mY9Eg1GgKm0J8gvO+fJfD277xwVe3ZnACNrvf83Sdd57h17Io
 zjn4DGsav0dHJnFodafyVqpi/PG2D36Qp4PHbm55Pd2gVqV7mgSEwENE0q8quW+klS5Wd9UN
 woT4CVGkEQp3FagQt+4W1izp2SJ+0dFHdFRCOY9rgqKz8I4/jqkO4TNdRYZAPROiSP8bWVCO
 oOh9z8xOQFSjQ==
IronPort-HdrOrdr: A9a23:MNPtQah9jihj1e2JlzmgN+4oIXBQXtEji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41gPW
 MKSdkYNDU2ZmIK6frH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3Asfv3UGlJKznrivCt10hoR+Un1iPXOXfl7G7zZFC?=
 =?us-ascii?q?xNUQ3TpS1FXGLoaNhz/M7zg=3D=3D?=
X-Talos-MUID: 9a23:rrIcFgbtQIBvOuBTvDbDiRBPDMdS5rX2OFsjiI1WvpOlKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,143,1770595200"; 
   d="scan'208";a="718921340"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Mar 2026 11:06:05 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 92BD718000279;
	Fri, 27 Mar 2026 11:06:05 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 507EACC1288; Fri, 27 Mar 2026 04:06:04 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	xe-linux-external@cisco.com
Subject: [meta-virtualization] [master] [PATCH] containerd: Add CVE_PRODUCT to align with NVD CPE
Date: Fri, 27 Mar 2026 04:06:00 -0700
Message-Id: <20260327110600.2686287-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Mar 2026 11:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9676

From: Himanshu Jadon <hjadon@cisco.com>

`CVE_PRODUCT` has been set to `linuxfoundation:containerd` to align
with the product naming defined in the NVD CPE database for
`containerd`.

Only a single CPE entry exists in the NVD for this product:
 `cpe:2.3:a:linuxfoundation:containerd`

The NVD references for this CPE confirm that it corresponds to the
source code used in our recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-containers/containerd/containerd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index d69518d4..51d7c2e2 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -105,3 +105,6 @@ RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
 ## configured in the distro, since we may have collisions.
 CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
 inherit cni_networking
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "linuxfoundation:containerd"
-- 
2.35.6


