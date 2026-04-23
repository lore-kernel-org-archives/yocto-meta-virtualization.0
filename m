Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1533FAD409
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:40:37 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12621.1776919236459101345
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 21:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mi4Z/P8R;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1136; q=dns/txt;
  s=iport01; t=1776919236; x=1778128836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F4cYJo64Zx0FJ5HUBN1MTYcbrSF70KCwL5OefZJsGkE=;
  b=Mi4Z/P8RY6UbpOUXUshd4GXdj+sVaTBHP7EdBQccOok2O6VtOIxaEIQD
   4zrboY4Du3iyLuhFFi2T+5CIkoDS/BkBFryYvXbYjdgktMiFheJ7StH7K
   FIix9cVWtX5qvZukQ5tKPtAs/SMZ1L5FadOGhTxQNE72lYXMrRgIhO3Yw
   eBanTwBVwP9v+prdsXjynZ73yK3dcfeWgAntGWvb6yeBGPjJiWnNnzpEz
   1nII+vaXXKTK+tOp7i6P29QYKtgf/zYFD9jW4XYqtV+NKEv1DCklV4v2H
   cSR5jDFl+WU1QP1h4ueKYgfbJPNCNnFD3+3DgL/mc5OtsC95yIE4Wf55n
   Q==;
X-CSE-ConnectionGUID: bYGkm+LoQGGm5OhFGp/WCA==
X-CSE-MsgGUID: 5+3brQDlS1CW6+/6utoLTw==
X-IPAS-Result: =?us-ascii?q?A0BKAgBToulp/4v/Ja1aglmCV4FPQ0mTWgGOV5I2gX8PA?=
 =?us-ascii?q?QEBD1EEAQGFBo0uAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4Zchl02AUYwUQtEgwKCOwM2A7JPgiyBAYR92EcNglIBCxQBgTiFP?=
 =?us-ascii?q?4J5hSOFbicbG4FyhH2CH4JxhXcEgiKBDoF+hHSCGIYfSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4EMGwcFgUuEGW1qgQuDMIE5dQMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4Hij0gEIIrgQ4BqEugHXEKKIN0m1yFfBozqmsumFiSEpJHhGiBaDxGgRNwF?=
 =?us-ascii?q?YMiUxkPjl/IXCYyPQIHAgcNAwuTZQEB?=
IronPort-Data: A9a23:35grSK9qhHlBk0gFPQz0DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2EbX26BOf6DZjbwL4ggYISw/B9TuMKHndBmGwdu+XpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjhPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k8DKIb/6VTBlhh2
 vlFDzAjQQjEuMmflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+ohHDzdDtwo1OOrq1x6G/WpOB0+Oe3a4SNJIzQH625mG7F5
 TnM5V3VBipDH+PBin3b726rotPQyHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4CeY27kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:W0CKoqBl4CyJsd7lHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:/AhdEG0sot61fY4PfJQwFbxfEPEKcXie6HDpDGC9VEFpZpKNDmC70fYx
X-Talos-MUID: 9a23:RuEiSwT/aT3+jkR8RXSxx2poLv5E55/3I39T0tJYptWDERBvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,194,1770595200"; 
   d="scan'208";a="723606822"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 04:40:35 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 756E818000201;
	Thu, 23 Apr 2026 04:40:35 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 19A0ECC1288; Wed, 22 Apr 2026 21:40:35 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com
Subject: [meta-virtualization] [scarthgap] [PATCH] criu: Add CVE_PRODUCT to align with NVD CPE
Date: Wed, 22 Apr 2026 21:40:30 -0700
Message-Id: <20260423044030.3599-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 04:40:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9724

From: Himanshu Jadon <hjadon@cisco.com>

CVE_PRODUCT has been set to criu:checkpoint/restore_in_userspace to align
with the product naming used in the NVD CPE database for criu.

The slash-containing product token is intentional as NVD references this
project under checkpoint/restore_in_userspace.

Only a single CPE entry exists in the NVD for this product:
 cpe:2.3:a:criu:checkpoint/restore_in_userspace

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 484a57d2df5d02e2cc64a7b7e03be93ffeaff8d4)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 recipes-containers/criu/criu_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index cccd3e3c..a8915d16 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -111,3 +111,5 @@ FILES:${PN}-staticdev += " \
             ${libexecdir}/compel/std.lib.a \
             ${libexecdir}/compel/fds.lib.a \
             "
+
+CVE_PRODUCT = "criu:checkpoint\/restore_in_userspace"
-- 
2.35.6


