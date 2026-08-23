Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F64EC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 10:04:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11833.1787479439367043756
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Aug 2026 03:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eEL0fKjq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026082310035592d5563ca60002079d-hpwl6n@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026082310035592d5563ca60002079d
        for <meta-virtualization@lists.yoctoproject.org>;
        Sun, 23 Aug 2026 12:03:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tFlqFaFTRUUE6Wi1/IMVHdNEpZHfa7EM/ajPmf7cSng=;
 b=eEL0fKjqsaKtv5xVHsSPXc2id/Riu9yMhpFpXgLntw7aUsBk/pNzVTpLUIVevOY2IilIF5
 vwxHP//1sAZAfp6f5Zb61ZUzIAvlnZwDwwXb58Vih2XWzMu6Fe+mtJoY1OIb9TtGhAweaVvl
 pYJcbga81gd3L6+94pwye6H8gm/ALvWhEVXI9kz/qJTNC6sB4IqX5tl9h25SUSZ0IqSO7Ksn
 peRxnYvofAYKqEyzHCsxC6Od2AJL4dzYgX+dEC1FgVHo8Rw0N2FX6n6zsWMz7ppwo1bvJZ6K
 QgmVElfJVO7fcmkcO0E82TZU1+zxf8wRHFfV91xMbYg9JbqO62k3+VcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][wrynose][PATCH 1/2] crun: patch CVE-2026-30892
Date: Sun, 23 Aug 2026 12:03:28 +0200
Message-ID: <20260823100330.3784951-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Aug 2026 10:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10061

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-30892

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../crun/crun/CVE-2026-30892.patch            | 53 +++++++++++++++++++
 recipes-containers/crun/crun_git.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 recipes-containers/crun/crun/CVE-2026-30892.patch

diff --git a/recipes-containers/crun/crun/CVE-2026-30892.patch b/recipes-containers/crun/crun/CVE-2026-30892.patch
new file mode 100644
index 00000000..3d900cc3
--- /dev/null
+++ b/recipes-containers/crun/crun/CVE-2026-30892.patch
@@ -0,0 +1,53 @@
+From 1bd7f42446999b0e76bc3d575392e05c943b0b01 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Erik=20Sj=C3=B6lund?= <erik.sjolund@gmail.com>
+Date: Sat, 7 Mar 2026 19:19:41 +0100
+Subject: [PATCH] exec: fix CVE-2026-30892
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix parsing of the -u (--user) option for "crun exec".
+
+Before:
+Value "1" is interpreted as UID=0 GID=0
+
+After:
+Value "1" is interpreted as UID=1 GID=0
+
+Commit 85d4db3d8b27c9ca606eea5f007c58a752ae77aa introduced the
+regression.
+
+Reference:
+https://github.com/containers/crun/security/advisories/GHSA-4vg2-xjqj-7chj
+
+Signed-off-by: Erik Sjölund <erik.sjolund@gmail.com>
+
+CVE: CVE-2026-30892
+Upstream-Status: Backport [https://github.com/containers/crun/commit/1bd7f42446999b0e76bc3d575392e05c943b0b01]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/exec.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/exec.c b/src/exec.c
+index 36c6084c..5713bbcf 100644
+--- a/src/exec.c
++++ b/src/exec.c
+@@ -214,14 +214,13 @@ make_oci_process_user (const char *userspec)
+   l = strtoll (userspec, &endptr, 10);
+   if (errno == ERANGE)
+     libcrun_fail_with_error (0, "invalid UID specified");
++  if (l < INT_MIN || l > INT_MAX)
++    libcrun_fail_with_error (0, "invalid UID specified");
++  u->uid = (int) l;
+   if (*endptr == '\0')
+     return u;
+   if (*endptr != ':')
+     libcrun_fail_with_error (0, "invalid USERSPEC specified");
+-  if (l < INT_MIN || l > INT_MAX)
+-    libcrun_fail_with_error (0, "invalid UID specified");
+-
+-  u->uid = (int) l;
+ 
+   errno = 0;
+   l = strtoll (endptr + 1, &endptr, 10);
diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index ea14e8ec..e8d87484 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            git://github.com/containers/yajl.git;branch=main;name=yajl;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/libocispec/yajl;protocol=https \
            file://0001-libocispec-correctly-parse-JSON-schema-references.patch;patchdir=libocispec \
            file://0002-libocispec-fix-array-items-parsing.patch;patchdir=libocispec \
+           file://CVE-2026-30892.patch \
           "
 
 PV = "1.26.0+git"

