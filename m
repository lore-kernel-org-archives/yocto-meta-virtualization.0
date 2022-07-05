Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F70DCCA47C
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:18:47 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.82295.1657016322332261500
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 03:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=fyVflVLy;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A8FF55C011B;
	Tue,  5 Jul 2022 06:18:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 05 Jul 2022 06:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1657016321; x=1657102721; bh=Mx
	5Kxc23NPUb0UT7nSLSClXueH9xLu2q7sgshRkwwRs=; b=fyVflVLyq9d1EAlK0s
	yuH1GcTXChEAdt4t5OgB/e1tNZZhXqkxUesKQW7yHWj0B5ePHgussaB/O9w3bkJx
	olTBQOf6eFme7WjzofaXUPQgtLdsj5OJw7OCldcdZt0BuH+OeN+llvU6Jj//79zy
	r9Cf3QPPsoZFWvt3f3ZGU/VAFheJ+Epmyt606hhDyOGEulnsLRpyiDfjpSjWqWFh
	w2DDEkOdKWPCmzTKT2kcLiT41KJM06MLXqnDQ9oZ8TOjSOnfYdmU98RQwyQZ/wca
	5L+mm1iw0H9SolMGkTVkDy1DaV2hT1bMm5Tt/e+aUf1X0dZaogLIRjxQahqxOfLt
	t/9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1657016321; x=1657102721; bh=Mx5Kxc23NPUb0
	UT7nSLSClXueH9xLu2q7sgshRkwwRs=; b=aIYoq3ttej5fqJQQUt2hnzXC4C843
	VyW2D76QgW0RywPR0cRcm2K/l4sdvRCRzXHfUgjDAAKJWhgSAeLSXWt5BL2Hnqli
	NjHwElyASguegHXkHbINkwkN60+uckxaGFLN/KsRmAX7QkSndort4MX6z8XQS93S
	TG5o2lYSBd15e1zS/btEH21W7N4PbofOD2XoenzLNvKVwhaHU1hiIvlLtbQAWfvV
	qMglKJ+MMfz1u6qL0EorI6/H/xk9Ii/rW7g6bFPhFTuHSC1sKm2L15pp4mpJIw0I
	g4XvMJT3KPpdbe1H9DOXy9DDXNo0kITczRw5NjCBLV6HFJzKHcNadOfSw==
X-ME-Sender: <xms:ARDEYm5oUooHZpA0tRGZur4Sl_cGhDBn91Lnqr_6rvN-qTB7g49nSg>
    <xme:ARDEYv5mR-D_QLmIPK4NNXcpF0vr11gmwen0aBSZsM_DXEa8onywAGaqL8UPGz4qp
    q5TBRJphpxPa10gDx0>
X-ME-Received: 
 <xmr:ARDEYldmd9Ih5d1NF68qlVDVUzPaB7Gh9646KbjTk1WSCxSMv2qUaZO9ceKwUpGbMpLlIdLitQ3xk2DF9g4A_BAK93FgxPqtTUzzJ7NdofVM4Tx59Bn3go-x>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:ARDEYjIp4PGzpBhPDEGlNZi4tsfF0RAwMNm4F59-7iysJUERjFtQuA>
    <xmx:ARDEYqI60PNXUBKlVdiMu04BrSIKZalgbfTxIBuYPJeICkYoj0fNQw>
    <xmx:ARDEYkwfle74MU-Z6_BUV-X4BZ1mQ3iIFZeX7_ijCq3D13YI8g87_A>
    <xmx:ARDEYshoDIXU_zSes7CQ3BL29sZHjN7_VK4D0O9pQdMUSuuG9KFWJw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 06:18:40 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 3/3] runc: Add Upstream-Status
 to patch 0001
Date: Tue,  5 Jul 2022 12:18:30 +0200
Message-Id: <20220705101830.1729681-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705101830.1729681-1-andrei@gherzan.com>
References: <20220705101830.1729681-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 10:18:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7406

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...01-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
index 4d35e58..1186330 100644
--- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
@@ -4,6 +4,7 @@ Date: Tue, 24 Aug 2021 11:38:23 -0400
 Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
  from static
 
+Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [bva: refreshed for release 1.0.2]
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-- 
2.25.1


