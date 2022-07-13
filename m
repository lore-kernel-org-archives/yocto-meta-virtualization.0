Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42EFC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 13:54:06 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web09.22282.1657720445692667341
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 06:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=CzTp0B/k;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id F2A745C0208;
	Wed, 13 Jul 2022 09:54:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 13 Jul 2022 09:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657720444; x=1657806844; bh=6wGbf/lJC0QndtnnRTRcTSsSg
	AaBA9nlfAf00Jru/Xc=; b=CzTp0B/kNI6zC/MOBIXr6plI8jwiaaKLeA0GrcJrT
	HZ0cyMBvc/5HEi1Vo4jTHOwvJxpsS8ku+W5MlaAfnIqUb4Bvj9pHwGrxmib/GMAU
	sKWJaWh3CIl9JA/u6rKPEIcI43quxOodcFk2IdfaHE7PwudLKtjTlbW5hSVxn9j5
	Kp3/1dBx3OLuikMfU3derGETed38pe41DUI2/g8LwGwjJX1JjBLTkdiegAqcsANH
	RS7UPjh12zrHdRGEWLzPYiFfXTcYPTQo//ykOpybQYwNqdqzGQQ2bf+AcNX6XSjl
	Tjr+fiIKmRMUq/5ncFSbhLs4v2DFIpN6Q6sFCr/WMcwyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657720444; x=1657806844; bh=6wGbf/lJC0QndtnnRTRcTSsSgAaBA9nlfAf
	00Jru/Xc=; b=tfpNrkxEiPUdEchPgIQl1HmL0/QIwvSQJyS9XzELzMPYEDoyxGu
	7cQpWK7kfSDZhBctJx6rQenqAN54J05iqtUSX37RwumVfCUvEygTCAOvJFG8d4M3
	LIFmvoRmiRr9lNDk2FAXwUIqrabxcmTIrlcBvmJjue5eI52Ad6IV+K8djiY2LA65
	FEWe8IO7WdWndku9R6UMniyyl84/NqWZvBC3uiwtURSnocMGR1EuzS8jORW1yBKu
	SNy4raUqt0RExjhcMC0eC7k1xyxUQEKdS9ma2DLRz2/dlASkFOs74o2j2T5LfnbQ
	Ssf+iS1lpxd4eEjppf+IEC7TY2c7AS5011Q==
X-ME-Sender: <xms:fM7OYtOZOGCLtV17gqn-gK0kamddHWYjxHnmbzJaYdYLsOIdE2XVLQ>
    <xme:fM7OYv8sx-Ig3x1DkAs_TuB5V6VvPZC5X10g1awOg_WR3-ACMB0adsBJBFfBY_341
    Tr5rXaRiL-BDGWbSNw>
X-ME-Received: 
 <xmr:fM7OYsSarxVNl88Q4z1UHS26nQjdHjp_QE4ddo0NqV3CHSmr5Y55bz307iuBggmXi3aop9ziH9LXtCsSdg1rbhgHE84VumubELUfSY_LyFc-th46453BnwKx>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:fM7OYptpZOrGVOE7vu_8hmcf9bNqKRbTS2IaRhRGFiGj8umh0idhrA>
    <xmx:fM7OYlf9yQRD5U3uqa9f8Yug5ySGtRWkGBF12CJIcPQo8Ff-fx0sbA>
    <xmx:fM7OYl2ktwK27MgOheVLlafD8Ppxt2MVh0FJO6kHJU8tDh1kig0sGQ>
    <xmx:fM7OYlHtRjg9e-35mf2vWCmNRWDhoByOutQngewYZPhLnzGYAEVhUA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 09:54:03 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
Date: Wed, 13 Jul 2022 15:53:53 +0200
Message-Id: <20220713135353.1165407-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 13:54:06 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7455

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -----------------
 ...tils-Add-missing-include-on-limits.h.patch | 36 +++++++++++++++++++
 ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  4 +--
 3 files changed, 38 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
 create mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
 rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} (78%)

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
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
new file mode 100644
index 0000000..cd504ce
--- /dev/null
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
@@ -0,0 +1,36 @@
+From b48e958aaecfdfc3bb48db082a548a09d6487181 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei.gherzan@huawei.com>
+Date: Wed, 13 Jul 2022 12:05:07 +0200
+Subject: [PATCH] utils: Add missing include on limits.h
+
+This happens to not be an issue with glibc because it gets indirectly
+included via dirent.h:
+
+.. /usr/include/dirent.h
+[...]
+..... /usr/include/linux/limits.h
+
+When using the musl libc implementation, that is not the case anymore
+and the build fails.
+
+Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
+Upstream-Status: Submitted [https://github.com/containers/fuse-overlayfs/pull/362]
+---
+ utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils.h b/utils.h
+index 13a177e..6fbc328 100644
+--- a/utils.h
++++ b/utils.h
+@@ -32,6 +32,7 @@
+ # include <sys/types.h>
+ # include <fcntl.h>
+ # include "fuse-overlayfs.h"
++# include <limits.h>
+ 
+ # define XATTR_OVERRIDE_STAT "user.fuseoverlayfs.override_stat"
+ # define XATTR_PRIVILEGED_OVERRIDE_STAT "security.fuseoverlayfs.override_stat"
+-- 
+2.25.1
+
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
similarity index 78%
rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
index 4f793bd..3119992 100644
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
@@ -5,10 +5,10 @@ containers."
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
+SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
 SRC_URI = " \
 	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https \
-	file://0001-Fix-buffer-overflow-on-workdir-path.patch \
+	file://0001-utils-Add-missing-include-on-limits.h.patch \
 "
 
 DEPENDS = "fuse3"
-- 
2.25.1


