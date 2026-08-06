Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC5C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:54:04 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13143.1785995639947662939
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 22:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BZ0hHovc;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1324; q=dns/txt;
  s=iport01; t=1785995639; x=1787205239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7j2wq3arfwnen5KaSZv0NInOoVMVbfMVR7CIw2hL+qM=;
  b=BZ0hHovclXKaV3I4NfwFsIFjw64QUiA5a6p40BkWXEXd/aMO+f98qX8U
   idYKAKJ/h0kBy5mifPXOYetWuTh/8JZcbEHe/KGZwU9uubAeNST33osIB
   DytPKb0Hwqe7mMJPdgvHmChSezvy7/mGkA/n07hZITOAS77rItYK34uyC
   FNUvMJNzvygrWiMZm/QJgVGlz6ALFjONoO3BVvHEQFNnEz2NYKJZtEkT+
   O6VxE5Hltz6hrqNKdhIGU7oCHxMcunQd2D2FLd6Nb9B7/WQ+jbRs/pPMP
   DicajBSnq/o8/Rw2ydp3MDOck5IYRZtzLfR9GU293HSLhHZpjZyBFYsGU
   w==;
X-CSE-ConnectionGUID: iqkd6VsQTIaQY7dqD9Vn8g==
X-CSE-MsgGUID: WYcFSMHxRpqnO6ZwpYpOFg==
X-IPAS-Result: =?us-ascii?q?A0DEAgC5IHRq/4sQJK1aHgEBCxIMggULgld0XkNJk1kBg?=
 =?us-ascii?q?gSMU5I3gX4PAQEBDzcaBAEBhQWNaAImNQgOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4Zchl0rCwEYAS0wUQtEgwIBgjoDNwO9BYF5M4EBgygB2?=
 =?us-ascii?q?h0NglgBCxQBBYEzhT+CfoUjbQgBhHwnGxuBcoR+gh+Ba4EGhXgEgiJ6EpJwS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRoIxk2eoEJX?=
 =?us-ascii?q?oEtKmQBEheBCYJvAoJ6gSkLGA1IESw3FBkEPm4HjX8ggkFhLZk6jxSgHnEKK?=
 =?us-ascii?q?IN1jCGPPoV8GjOEBKZomQiCWY86kkeEaYFqAjiBWXAVgyIJShkPji4V0BknM?=
 =?us-ascii?q?gI7AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:9TdDwaMx6z5fQH7vrR3PlsFynXyQoLVcMsEvi/4bfWQNrUon1WMHn
 2BNXTiCPfbbYDH1L9h+aYri8BsEsZPczd8yTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1g2MsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/R3D01oA5Yhxsd+OFAR+
 eU0eQ4LPh/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGE+BPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FwpiOCzaYCJI7RmQ+1qr022n
 Ufm717hGxc9au6A0Qud1Vyj07qncSTTHdh6+KeD3vRwnVaegGUICBMXWF+3ifa8g0+6HdlYL
 iQ8/ycypO0s9Va3U9D5Xg+xvH+DuDYYWsFMCKsr7wqRzbLO5ASUDXRCSSROAOHKr+c/QTgsk
 1vMlNTzCHk36vueSGmW8fGfqjba1TUpEFLurBQsFWMti+QPaqlq5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:BNixBqknoD3mPiRW7w+BwjPEFb7pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:JVlkoW7PMfs6NBvbp9ss9VcXFp4baUTh7X7pEhC0EEo4drvFRgrF
X-Talos-MUID: 9a23:zAOFpwg9ljBOq9EfR+4lYcMpC/ZjzZ+LKFA3iYwAnJe2KjRBIxCzg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,207,1779148800"; 
   d="scan'208";a="800061241"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Aug 2026 05:53:59 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id F39CD180001A5;
	Thu,  6 Aug 2026 05:53:58 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 64E70CD02BC; Wed,  5 Aug 2026 22:53:58 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-virtualization][wrynose][PATCH] python3-webob: update to 1.8.10
Date: Wed,  5 Aug 2026 22:53:55 -0700
Message-Id: <20260806055355.3112059-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Aug 2026 05:54:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bump 1.8.9 -> 1.8.10 (latest on PyPI). New sdist sha256sum:

  1c963a11f307bc3f624fbab9dde737701eae255f32981b7a5486a88db1767c2b

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 88ad007e53c213e649cc5ecec30101430c9b4965)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/{python3-webob_1.8.9.bb => python3-webob_1.8.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-devtools/python/{python3-webob_1.8.9.bb => python3-webob_1.8.10.bb} (77%)

diff --git a/recipes-devtools/python/python3-webob_1.8.9.bb b/recipes-devtools/python/python3-webob_1.8.10.bb
similarity index 77%
rename from recipes-devtools/python/python3-webob_1.8.9.bb
rename to recipes-devtools/python/python3-webob_1.8.10.bb
index 4a3ed90e..6d895103 100644
--- a/recipes-devtools/python/python3-webob_1.8.9.bb
+++ b/recipes-devtools/python/python3-webob_1.8.10.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 
 PYPI_PACKAGE = "webob"
 
-SRC_URI[sha256sum] = "ad6078e2edb6766d1334ec3dee072ac6a7f95b1e32ce10def8ff7f0f02d56589"
+SRC_URI[sha256sum] = "1c963a11f307bc3f624fbab9dde737701eae255f32981b7a5486a88db1767c2b"
 
 inherit setuptools3 pypi
 
-- 
2.35.6


