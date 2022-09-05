Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB12ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:30:32 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.23776.1662377430829614767
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 04:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=F7SCZ0/x;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 577ED5C0101;
	Mon,  5 Sep 2022 07:30:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 05 Sep 2022 07:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1662377428; x=1662463828; bh=XCGyWi3YCIh93M45kggytskqr
	gZI0ZtiqskYXbugndc=; b=F7SCZ0/xHjUmHsW+WQtX74KKwfwVEYymAcg5XaBNB
	B+7DOCkkVS7k9REYtYBIxCh1TiedGIODfd1Lk6O4bjAbGLfi+lO7Th71RUvKiuEz
	iG8HOMYb9UjxYic8B3AqEc+ibrR2Vh+5xx3SC+LIsNG9z+5U6/E2z81x5vtLpF41
	pfDRkrZX35Ecyu64Yjwj7igc8ekY1H+dzWR/7hgw8CIu8nB4+MWUkPXIzoBrGWfe
	UiIL26Wkh9gv+/KAci13WOI78iz1IYGRseJA/yE87kynw4kjn5zHIei/EHt3dca+
	dwBgyJ0yKUXnVYYlPDrmM/WX7dNV7KW2jQTGOmI5ZkWcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1662377428; x=1662463828; bh=XCGyWi3YCIh93M45kggytskqrgZI0Ztiqsk
	YXbugndc=; b=ATDRpow4/wnnP2yIPHKOb7ubrDzCpw/906CNo77eQbsmHuU7Veu
	sqWGR0YYybNoQzJK6M0uQVDFUpSg15FE4MyfAQLikzRWNwkbw/cHOSOpWf6uZwbM
	BMB4jjh9geY5Gz+WvuPfo/sb6GJb7ejObWH3qpvtn0P2WmCn39QjyxmZqU5PhJwA
	wAuuorcB/xISvb6u3z7PHJoVKn87/Ux48MxvKXeqpCYPUhx4sh6ZiKVsB/i+JwlC
	njAcUFuiDcK+i4JwNf86YAhFiipcRr6uppFpK5hC6cod1FPUA9BkvzlYMDMbC98b
	1QHYGK5xTksRd7Ntl8XpVCVPcTLs6veOQmw==
X-ME-Sender: <xms:1N0VY-CPPo_bF5jUc9x5WuuYzv3him6ahZnhaILW5tdHKW-GUc0kyg>
    <xme:1N0VY4ieXF1Kh4UERxr_0I02XVSZz8trO59bJl3rbNyxjfekVayBV36WbIchEKiOQ
    n0mUWACS_sYU9Z9Dvo>
X-ME-Received: 
 <xmr:1N0VYxkIngONW2L3TVNbxmeSAyMN8Uh9GryVE978d-WBSvhuVcdGydxIU90JUUj-0aSuyf00s1qr4zqeJFOw4B5LJBIOzRtQowLsUzhGiVah99vcdxy-3NHC>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:1N0VY8xUf-96MCo1fZBm7e5Wubkn9_ARJf0VaDq9HeoEVirh0Sk9Yg>
    <xmx:1N0VYzQnuq_t8LYgVk5dD7vfwD66VaJMSCSJy9b2HSgX8cHTOZghlw>
    <xmx:1N0VY3YFUs6K9OuTidGgw0F9-GfAOOhSQqgytNAkQoBYUHxPC7PYeA>
    <xmx:1N0VY6Kt5wXp_1QJtRjCJsolCUEhz5zpjCwrImQ12ANL5YsgaK7NAA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 07:30:27 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate version
 0.1.7
Date: Mon,  5 Sep 2022 13:30:02 +0200
Message-Id: <20220905113003.1730364-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Sep 2022 11:30:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7594

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This is useful for podman system tests.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/catatonit/catatonit_0.1.7.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-containers/catatonit/catatonit_0.1.7.bb

diff --git a/recipes-containers/catatonit/catatonit_0.1.7.bb b/recipes-containers/catatonit/catatonit_0.1.7.bb
new file mode 100644
index 0000000..da3973d
--- /dev/null
+++ b/recipes-containers/catatonit/catatonit_0.1.7.bb
@@ -0,0 +1,16 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY = "A container init that is so simple it's effectively brain-dead."
+HOMEPAGE = "https://github.com/openSUSE/catatonit"
+DESCRIPTION = "${SUMMARY}"
+SECTION = "base"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "git://github.com/openSUSE/${BPN};protocol=https;branch=main"
+SRCREV = "d8d72fea155c144ed3bf298a35a1aba5625a5656"
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
2.25.1


