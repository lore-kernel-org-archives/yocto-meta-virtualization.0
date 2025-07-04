Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3088C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 00:12:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.1891.1751587939765678216
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 17:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KhYk959N;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751587939; x=1783123939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6kLHqLefb52fmRqg2w2sHWjmr4qWpVVWALF7lZqKN/Y=;
  b=KhYk959N+EJ+m7GuFnNsg+nkRQOnHQtSt0PGK46QZ0p4SICnEXCsiLJx
   9A92s+nl+16R/HgOV3nMKaKW46IfFIU2G8ujK2/mEMwgT3KiliBTKVvBA
   BFuHu0MhcJZHZD5itzO/BZmLHNNnebqwVnHEKVPkeLN82eGpdTZn+qy+c
   ewu9bhHiKmueffl+mynkzVQwWSlUNQ8X10qi5PByC0ac/Spl1ov9WuLt1
   bd541a4ZwoAeNxuzhzcNbVyx+UHQCrSNHCKtx7sXclVL6lax5vAJrEnAv
   qLKwFzICaph46U0UsWAQa5J/tOaOJUN2E0+vPxcLfaSkwUZnlfi+Y1h2t
   Q==;
X-CSE-ConnectionGUID: 2PtCFZfYTk6XmEpNk/zY0g==
X-CSE-MsgGUID: DFP8ZhJAQ3+80E4wgPxJOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="193133587"
X-IronPort-AV: E=Sophos;i="6.16,285,1744038000"; 
   d="scan'208";a="193133587"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:12:16 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DBB091002BA2
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:16 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 60C5A18000E1
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:16 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5DDC41E5B8
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 09:12:14 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 56AF91A0071;
	Fri,  4 Jul 2025 08:12:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 4/4] go-md2man: drop unneeded S assignment
Date: Fri,  4 Jul 2025 08:12:07 +0800
Message-ID: <20250704001207.250-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250704001207.250-1-wangmy@fujitsu.com>
References: <20250704001207.250-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 00:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9292

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-devtools/go/go-md2man_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/go-md2man_git.bb
index 73d8d167..720eac63 100644
--- a/recipes-devtools/go/go-md2man_git.bb
+++ b/recipes-devtools/go/go-md2man_git.bb
@@ -14,8 +14,6 @@ SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_S
 SRCREV = "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
 PV = "1.0.10+git"
 
-S = "${WORKDIR}/git"
-
 inherit go
 
 do_compile:prepend() {
-- 
2.43.0


