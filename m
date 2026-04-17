Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D745EF8E499
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 03:37:11 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34367.1776397028387829087
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 20:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cbpKR2tj;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1168; q=dns/txt;
  s=iport01; t=1776397028; x=1777606628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dtOEUM/VV00dhT6gx4ctsSZ+wrTVQhQbIgSBBiHcCWc=;
  b=cbpKR2tjqUKlwahV30GcqP671qBn9YYdP6sLM+51yYF7R7losrDMpJ/N
   4P7gO/0+5oB+qkDHmRs7EnTZqXMuUaE3exBt7mwO4KiwFTuF+rXfjhShW
   gHSrQL9Vj9Aa6M6hMFTdgq/icAY3BxzEtcCS2C0Op9xEV68l2j2hI9vaV
   SGz4RlwZi4DWvJJ9kfn5J26Rmzev+5TncC8y+wBVUmx2Y0UhSWKSeq4UD
   2IYlPxXdj3iUbq8Go+koXE8+qgpR5Vf9fN6pq5n7g34aBRQpc4cXlpnEy
   R0nQxQ7dDNpVSoDe7upVgq+rvHZf9uY4/nRNhd81CA5V0PYZfILLnxSos
   g==;
X-CSE-ConnectionGUID: 69Rc7GORQIqFbrOKCu1YHQ==
X-CSE-MsgGUID: lt3BI9DiSh+Xs0WoH6IxBg==
X-IPAS-Result: =?us-ascii?q?A0BBAgC1qeFp/5H/Ja1aglmCV4FPQ0mTWgGhDYF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQeNLgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgFGMFxEgwKCdAO2MoIsgQGEfNsmAQsUAYE4hT6IHIVuJxsbg?=
 =?us-ascii?q?XKEfYUQhXcEgiKBDoF+hTCCJ4VLSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EMGwcFgUuEfXRtgRODWoEJAwsYDUgRLDcUGwQ+bgeKQSKCOYEOqEyhD?=
 =?us-ascii?q?goog3ShWBozqmsumFikWYRogWg8RoETcBWDIlIZD45fxDEmMj8HAgcOApNwA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:qHPplKwS1jwVQSNKNXt6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 2MfW2rXPfqIZ2LyLot/YN61/UsPsMKGn9BjTVdqrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYoazxMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJB9nB4ZH1cFNOEBX2
 /YCDxMmc0myp9vjldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tOeqj3X4dRVTqUmeouw85G27IAlZj+G9aouMJ4HXLSlTtkKE/
 Ujnrkj4ORFZBMfH9j2lrFO8rOCayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:XbJO4q/cKwlWgRMfaJ5uk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:EkJKQGFxpiKDfKAbqmI5pXQfRe8CSET81VnaOWibInsweZ2sHAo=
X-Talos-MUID: 9a23:OHy2WArVosCZZFJ6VF0ezzV+b+1JsoivM0BOoY5ehM6kaw1gETjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,183,1770595200"; 
   d="scan'208";a="718291555"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Apr 2026 03:37:07 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 545EE180005AB;
	Fri, 17 Apr 2026 03:37:07 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id EDC44CC1288; Thu, 16 Apr 2026 20:37:06 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [master] [PATCH] cni: Add CVE_PRODUCT to align with NVD CPE
Date: Thu, 16 Apr 2026 20:37:00 -0700
Message-Id: <20260417033700.2011573-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Apr 2026 03:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9707

From: Himanshu Jadon <hjadon@cisco.com>

`CVE_PRODUCT` has been set to `linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins`
to align with the product naming defined in the NVD CPE database for `cni`.

The NVD CPE database contains product variants for this project under:
 `cpe:2.3:a:linuxfoundation:container_network_interface`
 `cpe:2.3:a:linuxfoundation:cni_network_plugins`

The NVD references for these CPEs confirm that they correspond to the
source code used in our recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-networking/cni/cni_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index f6617c1f..727a9799 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -139,3 +139,6 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
 RRECOMMENDS:${PN} += "iptables iproute2"
+
+# Add CVE_PRODUCT to match the NVD CPE product names
+CVE_PRODUCT = "linuxfoundation:container_network_interface linuxfoundation:cni_network_plugins"
-- 
2.35.6


