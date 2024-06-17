Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F450C27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:13:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.51259.1718612022446034774
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oUDP5YfZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718612022; x=1750148022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YxI4BNOYpgDH4RcMP4UcR3uD7yJ9MKzo7ie5pFX4QNo=;
  b=oUDP5YfZZGuawBt32/0sLmDaPFI/MZ+Dm0T3mYiQL96MEuIWyGVFQpus
   tS4RwIFHKsbg6z3b1DIs7XC3fmzebDz0FgLphXZ0/53lioNNdrscSylqe
   xoD16csa47M5ugDPPRb9Y9GZjkXk2mlQniQbwKTvjfIG449MZGIM2r7n+
   vqLKZCovG1rpF7u0oYPtniTBoYE49scdrOKa2gFAwgReV1oRRX2MdNYuJ
   yRaCK5hb7WdaaxizZuI3+x+5UEury7LSDAF3kviG8AcQMnbvP1PBXQd7N
   dwhcYdk98+qyYs37L9ov88t5Eob2sipk/iRN0AdxMs0vQhCsGK49cqMiv
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="151088069"
X-IronPort-AV: E=Sophos;i="6.08,244,1712588400"; 
   d="scan'208";a="151088069"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 17:13:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF4D2D4F54
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03E8CD39ED
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 750BF20076D16
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 17:13:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 25FDF1A0002;
	Mon, 17 Jun 2024 16:13:36 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 1/2] lxc: Start WORKDIR -> UNPACKDIR transition
Date: Mon, 17 Jun 2024 16:13:18 +0800
Message-Id: <1718611999-8852-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
References: <1718611999-8852-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28458.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28458.006
X-TMASE-Result: 10--1.152700-10.000000
X-TMASE-MatchedRID: iv01+ZwXeFJAJjQFQUSfYfLeH1FBnhK0wTlc9CcHMZerwqxtE531VIPc
	XuILVCbax3iFO+XIjduo/56eWHaCU5k8UmqtSvluh5kaQXRvR9f1q+x7zkhJWswHSQ+yXjTDmZq
	m+pL7tVktlgcye8dNbbnX/pa8NQkBr78SC5iivxwURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbXaeVSNIDJr9cslz9UPASbHdBwkZxPG3vtd9TtlVsFMP29Lfl4FoGBWNjT9GVKY72j70z
	n4g/CahRqzLu9BSceqFIvbQ0TIEa/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8799

From: Wang Mingyu <wangmy@fujitsu.com>

Replace references of WORKDIR with UNPACKDIR where it makes sense to do so in preparation for changing the default value of UNPACKDIR.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-containers/lxc/lxc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index ee0e442f..550f910e 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -161,12 +161,12 @@ do_install:append() {
 	# /etc/default/lxc sources lxc-net, this allows lxc bridge when lxc-networking
 	# is not installed this results in no lxcbr0, but when lxc-networking is installed
 	# lxcbr0 will be fully configured.
-	install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
+	install -m 644 ${UNPACKDIR}/lxc-net ${D}${sysconfdir}/default/
 
 	# Force the main dnsmasq instance to bind only to specified interfaces and
 	# to not bind to virbr0. Libvirt will run its own instance on this interface.
 	install -d ${D}/${sysconfdir}/dnsmasq.d
-	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
+	install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
-- 
2.34.1


