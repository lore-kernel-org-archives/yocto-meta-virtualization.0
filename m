Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC38C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:53:37 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.280.1657565610193480234
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=QexeJiDZ;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 862F35C00FC;
	Mon, 11 Jul 2022 14:53:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 14:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657565609; x=1657652009; bh=i+
	uOE9/+aKrA4c1ol8SU+dzXUh/L4mKMkEwGsjEnamA=; b=QexeJiDZSdn/nScKb+
	lGYdqDoK8sCf0MprkQMLhWGW9NcSgxpnIk2SnQtAm0Mp7tQNtQVZp1kehYBxWxuk
	KhMmoM9C3kS4C3uiY0+1X3VZeh3XF2qe0DpTI7ODERGk6P4WO0/uqA45zslZ4by9
	MWWxwSAOklqwjPf3MPqXikpnoQCu3to08ulaLCm+yFNMfAjctpfJHyQkNEE6T9U2
	dJcejWJKnh3k2cty2YVJj7Rttb446igsJbDThutWWMQRieRrr1zWc6VkofulgQh3
	gEnnZ65iRo5oZwwSO4+zUqjZyS+q+LKlcJfSa8M/7e/AYEJBMMVmLgMteSDqT3LW
	mW3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657565609; x=1657652009; bh=i+uOE9/+aKrA4
	c1ol8SU+dzXUh/L4mKMkEwGsjEnamA=; b=yUscIcTnc7o1I2Koqx6jxf+gi5gz2
	BTl2QMaD/4WS7pXhiPAJg07DcN6E6Zocl/9VkwIjMbh2fb1QhUEpbJDmz0I/RnQT
	wvaOV+mBVe0kvFHarjOenNIs0mKdRqt1Rij6bx/2vk+IVovAuEiaP0hjQBUl9mHe
	iH/fzvYf5akVHoCN+P5Uval2xYt/lVqF/ZAax0lynHOmZ16MNr2R5Oc/HO6UGQJW
	umJErATmYTNxh7AFUNm/yUVmSrkhUfMitYoWfXCKheVyKS6AUmYzQnJW+4gl3Tbh
	Qg1ymNOu34+F0U02xgTQyiTvu4nLx//SoFbyQ+rSUf/nBjFtmLU2otCEQ==
X-ME-Sender: <xms:qXHMYqRzxBYXEXA2Bkh1UtAF-KPhpivlxQOEgnKNoAahpgt5AziQEA>
    <xme:qXHMYvywsEws4yoir_o_ekUd5XM7hErJ_fWchoYbpWdU8-1TKGN5rFwCu6Rftq8Q0
    M0maSQrajHXxQUCmsM>
X-ME-Received: 
 <xmr:qXHMYn0b7g0UvMiYb9WIdafkQSuwZEeg-RrMmX5HkTM8vCLStt-qA4y4ZWqZaaj7S-yiBEvnr6DmcFzB8oJH2tlJF_OZoP-bJ2vIs6mM8n4qWfBXIPzjOvk6>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghi
    sehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleehgeejheegfefgud
    eikeeggeefvdeltdeljeetgfelvdekhfffuedvjedugfenucffohhmrghinhepghhithhh
    uhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:qXHMYmBuM91QYEs0SjbtzVosx-UPNbZ4eVZk6iHAZQvZK1Tay1-A1A>
    <xmx:qXHMYjgD1KA-6uhsybcKr2bguc593hiF30TbuJRsvvNRRAjL2WIc_A>
    <xmx:qXHMYipLsP0k7a23xSAsx_dvsw_hCUbePNd63HE368ubXjxDay7ZTQ>
    <xmx:qXHMYrblZSQdXmNMvctQ9jN0jezavIA8DRVvMU-zSPAQvP70-9kW1g>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 14:53:28 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH v2 4/4] fuse-overlayfs: Fix buffer
 overflow bug on workdir path
Date: Mon, 11 Jul 2022 20:53:05 +0200
Message-Id: <20220711185305.705539-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711185305.705539-1-andrei@gherzan.com>
References: <20220711185305.705539-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 18:53:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7439

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...-Fix-buffer-overflow-on-workdir-path.patch | 32 +++++++++++++++++++
 .../fuse-overlayfs/fuse-overlayfs_0.6.4.bb    |  5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch

diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
new file mode 100644
index 0000000..129423d
--- /dev/null
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
@@ -0,0 +1,32 @@
+From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Mon, 11 Jul 2022 20:36:06 +0200
+Subject: [PATCH] Fix buffer overflow on workdir path
+
+We make sure that the path used for workdir is reallocated before
+appending. This was initially included in upstream as part of
+https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+Upstream-Status: Backport
+---
+ main.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/main.c b/main.c
+index e5bdda1..118a6cb 100644
+--- a/main.c
++++ b/main.c
+@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
+       if (path == NULL)
+         goto err_out1;
+       mkdir (path, 0700);
++      path = realloc(path, strlen(path)+strlen("/work")+1);
++      if (!path)
++        error (EXIT_FAILURE, errno, "allocating workdir path");
+       strcat (path, "/work");
+       mkdir (path, 0700);
+       free (lo.workdir);
+-- 
+2.25.1
+
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
index a02c1e6..4f793bd 100644
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
@@ -6,7 +6,10 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
-SRC_URI = "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
+SRC_URI = " \
+	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https \
+	file://0001-Fix-buffer-overflow-on-workdir-path.patch \
+"
 
 DEPENDS = "fuse3"
 
-- 
2.25.1


