Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6371BC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 07:33:22 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8931.1746775995711400035
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 May 2025 00:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QHfCSasd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746775996; x=1778311996;
  h=from:to:cc:subject:date:message-id;
  bh=HIytfXSLWl0M+cH08AsEJtgan2RG35WN7IJnCG5KFoU=;
  b=QHfCSasdS41KGBIQPd4sHL96XOgzPjIPF8ej0XJfjNUekL6aU77xmRGJ
   02UxgkrVSX+lG1AZKEMtXRrAKhjsNL6pRTtaw5noKo2kUTUCJ1u7U7lGu
   diFC1mvlpElJQLbiXnqkQm37EyWDUF9ZCW8EQQlMRSeWzt5bQfO3+8gOb
   4mJcglod6bX+JuMBrp7Fsk44fn3ZWwIwrz4zCkG3fQIj56ZEXBDBp+D9C
   lrn22LaqNSCcE9shdU8Vr6C2HS61+Fwh+N2vMPptKMIMSzgHdnL0QpXEc
   Fe7FcDyuQaw5UoRqlJI93lnElAfzis4oswHEQL3JYIqY64xWt44yAcvS0
   g==;
X-CSE-ConnectionGUID: JsMuzQRGRRCqpmPLkZ82bg==
X-CSE-MsgGUID: 0+UE+GlIQpeK5k30nsy6XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="187311958"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="187311958"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 16:33:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6454EDC8CB
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 May 2025 16:33:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A4B6D52B7
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  9 May 2025 16:33:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D4621A00A1;
	Fri,  9 May 2025 15:33:10 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services] [PATCH] nss-pam-ldapd: Resolve build failure with GCC15
Date: Fri,  9 May 2025 15:32:53 +0800
Message-Id: <1746775973-14094-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 09 May 2025 07:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9247

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
index 582f7592..08923275 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
@@ -28,6 +28,7 @@ SRC_URI[md5sum] = "cc30ee0ab91d6c94b7a343ae09b5dc69"
 SRC_URI[sha256sum] = "c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14"
 
 DEPENDS += "libpam openldap krb5"
+EXTRA_OEMAKE += "CC='${CC} -std=c99 '"
 
 EXTRA_OECONF = "\
 	--disable-pynslcd \
-- 
2.43.0


