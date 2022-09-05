Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A060EECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:31:42 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.23784.1662377496056453194
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Sep 2022 04:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=OlYPubtj;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B20C5C00FC;
	Mon,  5 Sep 2022 07:31:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 05 Sep 2022 07:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1662377495; x=1662463895; bh=XC
	GyWi3YCIh93M45kggytskqrgZI0ZtiqskYXbugndc=; b=OlYPubtjSzG7zvvcuc
	IfcUAxc7jLUVYMdLV5xz4yd4upXfoN/aYnA717a6qRqlSBL9SASSFKbGskUrXxVg
	U+qW457jasf0G8NcgRS5cvgzdyEioBInAhXkbcQQfGIJjN322BITHiQQlpD8i843
	487mHgdWIczw4r+VS7x/M8metULJudvsQyWE8TbiJ2xRfTtYkci2oCNazO3CIC4h
	+3UttpNz77tGVQXc1ZmMra5DiXegCq52jnwXnCul9K78xHFlQjDpONaG1nVOoYuA
	+huBWGPEFBusjOV0dpujLI5vWbEs01KIL9VXGK2qwreQVdwcBSd0wPlfwRnGisaT
	BfEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1662377495; x=1662463895; bh=XCGyWi3YCIh93
	M45kggytskqrgZI0ZtiqskYXbugndc=; b=ffoiT04mFttYZVVKDejzaZHD+N/6d
	1ZndcfXA3t+7uWLxqKUQCIbpG7geLCio2wKXFunbuzH5Sn3InxkBWxZ86DFiIAPz
	d+nzR3YSidJDt1B9Z+OXMuA5I1nMWYr3NJnaUWc+K2tDLkYeLCv5YwcHyAcjJRsS
	gSlCI3FrNcj9AIdg8wP0OML4NbRes6FEybLIh9EZWGoIuOPHoVLHj3f7bcvVwMyS
	f9IwjclzImxrirCOXYdezW/ioVW5GJEcyUQUzgfm48as1dPz8v9LUD+Cr6cxXUTP
	xalmk8l5VS0TssvF6MgQdW+zexJylFkcP8BFxVtN9IfLPaq8UZc+fEyOQ==
X-ME-Sender: <xms:F94VY3Q5BR0OK8luG-MNmwUrA5rsncmWWNssfe6Q57jEOVE2m86Uwg>
    <xme:F94VY4zKveMMEyDIetjMPKywnHHfrQG-cWcobMctAjZ_z-FtGW2wzFCR3bcdTRkNO
    nayIAjuG1SJCyVorGQ>
X-ME-Received: 
 <xmr:F94VY81dOZTsyU1X9KkdTCoreGY5HCfw0nJzXvYHPqfXc2EvQCNuihVaD7AOwTb-wd_k9jfG_kRT3y745z-7PVE3FEFP9lqv3mqZhcS2yPTnWu2shOOCLSQp>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:F94VY3CKkiqQnyLVnI65Zl6o2Bjkk3VS18xXwSzW-G54XWn8LXD5og>
    <xmx:F94VYwhWScRu81i-wsmqa31P_FmlpeRaQU6vyyDwjBg4l1UJza6jvA>
    <xmx:F94VY7ptyzaqECVmde_DxdQNTMMrnnmhMxcgZ1erJAjIMLX3VHLxDw>
    <xmx:F94VY8ZzZi7t3E0UuQbUZLGDxirGniZ_HSbI5ONNXLaRrPbYF4yDLA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 07:31:34 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 2/3] catatonit: Integrate
 version 0.1.7
Date: Mon,  5 Sep 2022 13:31:15 +0200
Message-Id: <20220905113116.1766939-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905113116.1766939-1-andrei@gherzan.com>
References: <20220905113116.1766939-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Sep 2022 11:31:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7597

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


