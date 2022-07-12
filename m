Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F06CCA47F
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:17:39 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.9545.1657635453267450322
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=CPCy6OQB;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 498573200917;
	Tue, 12 Jul 2022 10:17:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jul 2022 10:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657635451; x=1657721851; bh=MXJeJvfZfBlvKPVKJhoMMv8J+
	ImMkJWG1rjyhJy9fKk=; b=CPCy6OQBXsgLlhrnWCIzYBg43r6dRBoXuqa1WnD9r
	BhnMSCSIHDq/iUqvw4hj0rQm5hlxsf+79upQjlcVd+uBCOHeHsvdojpY1HYOdznp
	jr6SGGlD/0Bzi46It+UAMcSNiOYBA93UZmzSLFr7jA7ziuXnOF5IpHxPluZsyTKY
	m61ttTh2VgDTXwyEcB1UBf/xXxJb0RmZIkq07Hi1pi/g4xC6lsjjIN/6K8XMVBY/
	IOqEKFaz3Mcl8hRHq725FJUki9H+9+sNi8kSabVpg3xH/xIJa5xd+ZFQ/AXvjy+A
	IYBLahn93X7C4KnquPsSq3Gc/+2YcnbNkgrJuvmi7OQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657635451; x=1657721851; bh=MXJeJvfZfBlvKPVKJhoMMv8J+ImMkJWG1rj
	yhJy9fKk=; b=hL9zm/DH9kMXiYO0eB5oe2UHYNWIF2hBZT90JASclheWMo8by6+
	//heHqFWTNrJQiT21jpXg+IPmYq8sKoGVSnqjcDxlFpRTIGJoDAbekWV9RKggavd
	NHvsL5H0XIyNO4k5FTKoy8yqW+JP8jMaZL6reJ/xcnsWUxofG6EeJAB/m9ix5Xvn
	ThNceteMMhimFo+SUh7FZixAMx0DzVsMANnhuemLvOGfIOCQwUAFBcSEhtjUd56K
	+RBz7htGdjuoSdrRvhsVq20R0gBtLPqJzokPaRxqba4VvRc4D9/J1zUH1x2d+CMt
	Nhn/gp58AUSeVdQtiQz1DexhbeGI7v9fkng==
X-ME-Sender: <xms:eYLNYrB-GVWG9E0bM8n8wocOjpOPSJRK9J1ZRazqga5DaIVrsxID7Q>
    <xme:eYLNYhgt49VATcT6I1aDIJIjJauuMrdktTrp5b0jAE33QtbUs5P1S2oruxu5Kx-eT
    4xiEOi5CkMU0kZ8KzY>
X-ME-Received: 
 <xmr:eYLNYmkbvoXTdDV-_TtGCDN3dRUDdyfHZ5KTuPlDzbWhZViTS1vjO04BS8fjh9tF_INwViXwYoRHAbsDbJyEZgboC0kqMEwiDJBZAFHmsYsOKehITyRS41ae>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:eoLNYtxtQVZP9FgLTYETGq68TiestBeb1245ymCWGaQhrXOG5FUD_Q>
    <xmx:eoLNYgQzo83O5KKEjhg8HwmneXDRZ2ZVZzgp7VUDqwPcLuzvkHqEug>
    <xmx:eoLNYgbt6C6JggN-ERvc4xL2COZtEMLiz63HKI1t01_av_jQJ0OnMQ>
    <xmx:e4LNYrLYzWGnlX5icg0PmV2_XEryEIRd044rY_RTaknvh68HosYOdA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 10:17:29 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
Date: Tue, 12 Jul 2022 16:17:19 +0200
Message-Id: <20220712141719.879382-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:17:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7444

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -------------------
 ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  7 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
 rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} (60%)

diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
deleted file mode 100644
index 129423d..0000000
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Mon, 11 Jul 2022 20:36:06 +0200
-Subject: [PATCH] Fix buffer overflow on workdir path
-
-We make sure that the path used for workdir is reallocated before
-appending. This was initially included in upstream as part of
-https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
-Upstream-Status: Backport
----
- main.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/main.c b/main.c
-index e5bdda1..118a6cb 100644
---- a/main.c
-+++ b/main.c
-@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
-       if (path == NULL)
-         goto err_out1;
-       mkdir (path, 0700);
-+      path = realloc(path, strlen(path)+strlen("/work")+1);
-+      if (!path)
-+        error (EXIT_FAILURE, errno, "allocating workdir path");
-       strcat (path, "/work");
-       mkdir (path, 0700);
-       free (lo.workdir);
--- 
-2.25.1
-
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
similarity index 60%
rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
index 4f793bd..18e9dfa 100644
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
@@ -5,11 +5,8 @@ containers."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
-SRC_URI = " \
-	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https \
-	file://0001-Fix-buffer-overflow-on-workdir-path.patch \
-"
+SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
+SRC_URI = "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
 
 DEPENDS = "fuse3"
 
-- 
2.25.1


