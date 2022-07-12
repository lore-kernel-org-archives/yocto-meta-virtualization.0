Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A35CCA482
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:20:29 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.9686.1657635623439176717
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=Mq43VL13;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id AAC443200972;
	Tue, 12 Jul 2022 10:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jul 2022 10:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657635622; x=1657722022; bh=i+
	uOE9/+aKrA4c1ol8SU+dzXUh/L4mKMkEwGsjEnamA=; b=Mq43VL13voRVnVs2J7
	iXHLwncW82k0QWAdhGQ8nBfB1+RvtNoqvAOo0UaIgFoJGq1ctpStkENJFcoQFWAR
	lUkc8udeG369dNnfyE+aXUdw8SNOEGEnOAxGT8+zVxzuiKsRBT87140zZWXxOZ1f
	OBHrdVp2dEWVjQIKAEwAmrtd3H61AVs5th8UDMEDMkYBN3qyKEo4O/J4riNOKJWr
	Qusy0MztOMr3SpYzAO4ANX79VJN5kxta+fQ2kshuKrjLibSvBHPN3G8s6AVatB7Q
	kfF1cGroMNJvCtRlT+hZN4/FJlIFnCJtHHTnqU8R3IPOIYgaYpex/QBAFAgZ/5Hj
	rF+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657635622; x=1657722022; bh=i+uOE9/+aKrA4
	c1ol8SU+dzXUh/L4mKMkEwGsjEnamA=; b=b53txI9pss7qlZOD4tW0E1eOVaxmM
	rDiE+tWTavp8EZuZv09AoDP+aCBJ7Wm8WCeMAWzptbDPHsMIwgf5ApZWtOS95y+X
	NuYmgtprkwjhHSRnmVNDE1lH8HespxTeuAx88RCgyrwJ/YKnZbBs8isYixU0aRPM
	KN2LyKU/3NvZpo3My2j3TZpVpAaN6m1TF4INy2LWwm58bO9yf5M7UWkYvIH6RQBp
	1f6IVn0yq31ng1EgfFb5i6bgjiWT/bHWQc6OWAxd3itMGDfUf9Sosfs3iyH3ga/Q
	+PBilCW1lcbHqLhCwXRWvZOvCUYCA35vj0nS1RBadhDgEyRG20ra2sAfA==
X-ME-Sender: <xms:JoPNYkjiSmtMJpfwg5jMcoEil-nvfCDbanEFseBwjDjDOD2r30yhHQ>
    <xme:JoPNYtAkhUgZ-8wWZj__TdphXoyewV-Q2NUw4-XNVxY1DeZ8B0myMMXLXSt4HKluO
    T-eRj8eNch2iJr2Kek>
X-ME-Received: 
 <xmr:JoPNYsHk48Zn00KP0dVHFjo4JZej8RRVRWKHY9ZN_3iE6jBP0EXcKL5UCvzaCm-VIivGhEpI94Cp4LxJLjom9EtVx0hI7aPEcs4o7jY9dIyoHhigqKC3AZf2>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:JoPNYlQ4XfPwTUKvba95kQuC6PM8wXXnPirE2N6qHi6it3AGo-x-dQ>
    <xmx:JoPNYhw4AGFb75BhxQb-YJ625UMatdRkgHlb1syU4Kd5EaqBr4kcNA>
    <xmx:JoPNYj6oNwLXDaz0uv5t5RrudBopPrqerssAl1YfHPi2zHZFAEvPLA>
    <xmx:JoPNYip6e7BFmZWviI2X74J6bJDWBd1g57ku5HGzHX2vEGGCFep0UA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 10:20:21 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH v2 4/4] fuse-overlayfs: Fix
 buffer overflow bug on workdir path
Date: Tue, 12 Jul 2022 16:20:01 +0200
Message-Id: <20220712142001.881461-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712142001.881461-1-andrei@gherzan.com>
References: <20220712142001.881461-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:20:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7448

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


