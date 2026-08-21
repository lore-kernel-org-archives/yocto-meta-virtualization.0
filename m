Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD5FC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:08:59 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1071.1787288934386546446
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 22:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aaAiNd7C;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=894; q=dns/txt;
  s=iport01; t=1787288934; x=1788498534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TFP/7BNmL2sEY5Tfe34gkKGndv1qVDoCYwAp8BO0tF8=;
  b=aaAiNd7CCVJhdoX1I99HfOe9T0y1T/0Ny9g4mrJVeViBbE8pg+hWyb+T
   QRjJEhT4qE1XszCmtT2krw6+GDtcrjPjKDgqFMUmv50Koyspb442ix3kM
   hdJuP+C17j6fVLQKLPlp99BS0Mnxm5ufMHLmZveDWovBkBSAFg5z+TTTm
   2zF/vP1ZeY6eIEa/8NQPcLUqj06NQjnYmNgfVSri0Cjyd/jc0OfOdrezt
   r+Or5NyzRJfBwf6FURylb5lnSDUj4QJzZ1tXAmOsfXQePKALXmeSrSl3y
   fegHBm545hLvXnvohLVA7/zyVFS7YUlXQlUyWVqtBOAWeQ/L4mY0n2hTk
   A==;
X-CSE-ConnectionGUID: 13gbFpx4TB+wE25Q/IwMzw==
X-CSE-MsgGUID: h41kQahYRr6MTBbI3rMKZw==
X-IPAS-Result: =?us-ascii?q?A0D2AgA/3Idq/40QJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBY1uAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02AUYwXESDAgGCdAPAWoIsgQGEfdswAQsUAQWBM4U/iCKFcicbG?=
 =?us-ascii?q?4FyhH6CYQKBNHmFeASCIoEMgXiRXkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCX4IFAgFJQw4HO?=
 =?us-ascii?q?gsYDUgRLDcUGQQ+bgeOWiCCRoEOLIFtpjWhDwoog3aMIZU6GjOFW6URLphai?=
 =?us-ascii?q?zeYbDeEaYFvCC2BWXAVgyIJShkPkiPMOScyPwcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:s8XDA6yVIy1JsmVzUwx6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUHn
 GFOXD/TPfyPZGH9f9twPIqyoRsGu5bdz4dlT1Y9/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDpMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBhtMoc24vYrPUsN6
 tFCdQlKTw+mlf3jldpXSsE07igiBMDvOIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiZC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0boOEKoLSHa25mG6Y+
 jvFxm35MysAavmj4zCkqWiJpd3QyHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4Guk+7kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:0w1W564fdaTjIuxQGwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:Cg1ZEG02o9kZonrinexxbLxfQ5sqeFPF3CvsCQynJDw0cfq0VnqC5/Yx
X-Talos-MUID: 9a23:m30gAwpUIs+8pgd4LrAezzE+bcRR6qSfMlpTtKkssejfLwlTCSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="816198600"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 05:08:53 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 7432418000481;
	Fri, 21 Aug 2026 05:08:53 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 1A079CC12A6; Thu, 20 Aug 2026 22:08:53 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com
Subject: [meta-virtualization][PATCH] go-logrus: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 22:08:53 -0700
Message-Id: <20260821050853.52159-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Aug 2026 05:08:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10060

From: Devansh Patel <devanshp@cisco.com>

The default "go-logrus" product does not match the packaged Logrus identity in NVD, so its CVE records are not associated with the recipe.

Use "turbopuffer:logrus", the exact NVD identity for the github.com/sirupsen/logrus source.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 recipes-devtools/go/go-logrus_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 7b9e31a5..4f8a255e 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://${PKG_NAME};branch=master;protocol=https"
 SRCREV = "a29884b9be3dc22c18338c0fe5a51d23e69731e4"
 PV = "1.9.4+git"
 
+CVE_PRODUCT = "turbopuffer:logrus"
+
 inherit meta-virt-depreciated-warning
 
 do_install() {
-- 
2.35.6

