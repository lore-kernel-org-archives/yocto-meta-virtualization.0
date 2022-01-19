Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48053C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:00:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.5262.1642593606639177335
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 04:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20JBxw1n021675
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 19 Jan 2022 03:59:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20JBxwLU019508
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jan 2022 03:59:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 19 Jan 2022 03:59:57 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 19 Jan 2022 03:59:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] docker: Add kernel-module-xt-nat to
 RRECOMMENDS
Date: Wed, 19 Jan 2022 19:59:56 +0800
Message-ID: <20220119115956.1104692-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 12:00:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7023

Fixed when kernel-module-xt-nat is not installed:
$ docker run --rm -it -p 80:80 alpine

docker: Error response from daemon: driver failed programming external connectivity on endpoint elated_cori
Try `iptables -h' or 'iptables --help' for more information.
 (exit status 2)).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-containers/docker/docker.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 40a3642c..e7bdc388 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -29,7 +29,13 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
                  "
 RDEPENDS:${PN} += "virtual-containerd virtual-runc"
 
-RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
+RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
+    kernel-module-nf-nat \
+    kernel-module-nf-conntrack-netlink \
+    kernel-module-xt-addrtype \
+    kernel-module-xt-masquerade \
+    kernel-module-xt-nat \
+    "
 
 PROVIDES += "virtual/docker"
 
-- 
2.17.1


