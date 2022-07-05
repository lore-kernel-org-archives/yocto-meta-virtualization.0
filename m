Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F20C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:16:57 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.82662.1657016207966274287
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 03:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=UNNFJ3b4;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 47CB35C009A;
	Tue,  5 Jul 2022 06:16:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 05 Jul 2022 06:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1657016207; x=1657102607; bh=Mx5Kxc23NPUb0UT7nSLSClXue
	H9xLu2q7sgshRkwwRs=; b=UNNFJ3b40jJuoBCSxVFcxT0WMGmDo1qYUZDkAce2g
	TH27X7k+BT8WZWISjwAEbTZBtNWB8mXDrY5hLjreC3Xlc299kknXtTZbgwMfwB1l
	EcLwDBk0O/vt7+APE13LRUM6VxXsvoh6r+vGrZiE8bzKUjrKnz7uNVqwjBZoEKFb
	ZpPyP46aZztUwmN9+Lh5W1V2NHuw8Hjsos16iqDnuwOOxHj0k6ZyX2SHiam90pG1
	GlgaAPAiQr4+8Wc9tel5/zFauflqEnMUMys5VX9nIS6StBu9S2pvxxqbYxpJeZ3P
	qLGtadBNJokJwhJBqJM6AfkO1NAp+6kNc9tS20W6CMDVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1657016207; x=1657102607; bh=Mx5Kxc23NPUb0UT7nSLSClXueH9xLu2q7sg
	shRkwwRs=; b=QDK0KtS0Gkg34DQDfcAV2cb+i0VtlUXJCv7hvyaFT0J3jf7eb5N
	tORY2mwNOktECKDHJX8yjVRkcfQj+NI70eWqLipBaEXGucCYn2rAOWsKJob0SAnA
	pXCxNIBOe/hXTk9uXvg5dvbj4aWma4mx/xzVB/bpGE51A+r0kjiFF1nD8aI4m37Z
	RyGhPK9Jit2sdQQviU/WVfRlFc1+zRJ5x4IXxnXrxg2o2/36Rs8civHM/UBiCufJ
	lxbupQBPKa0LNGfJwJ+wvmkAM5X8Tb9iN2QVs8Sbcot5SKOGWVDW7H7JZUPpSefu
	JxfsuYqh1rOGALvVAjRbNVVzeRdI3u8BF5A==
X-ME-Sender: <xms:jw_EYo_RQfLIfvCwuQn1G-kQgbbeZRhMssiBGGhepvMfVpFzIjhzZw>
    <xme:jw_EYgvQFsJnd-P1Dpe3kCv0l84xPaJ6Gkq5usryED3tHZ4rZRwjBJvPVQZXW6X9P
    i5RbPjowzCqA-es3xI>
X-ME-Received: 
 <xmr:jw_EYuDOJG4Q-hrF7yEmM_zsJCKc9rE-ibNj8CKRgcVd4tHckMWdi4AtnWCgFVF5cLBceUza3jgxbafmZ3ItxiMd6rbSZFKDysDPIRZLvPiX3a-r5uuv9Gz3>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:jw_EYofB7DIhmQC4gHX8GW70DzloVJe27odqtzmFLKxRrBwmcTgVWg>
    <xmx:jw_EYtN0ZRuhe7Ix6i9mnGyP-YtBeHM_SgyqldUE5ex6K34wFMdRqw>
    <xmx:jw_EYinskv4kKvdFbxdDK6Hbmjt_M7wMR0hSvWTHGv2XsCLlRtPA_w>
    <xmx:jw_EYr3WkYn8oL1kYsBkG2jPg9RUM4wsNCrBuqMJ99_35E4T46p9gQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 06:16:46 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] runc: Add Upstream-Status to patch 0001
Date: Tue,  5 Jul 2022 12:16:28 +0200
Message-Id: <20220705101628.1728071-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 10:16:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7401

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


