Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA679C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 19:45:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.3300.1740771910541410790
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 11:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ize/sWe1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025022819450786da9211befa7234b1-be1mvc@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025022819450786da9211befa7234b1
        for <meta-virtualization@lists.yoctoproject.org>;
        Fri, 28 Feb 2025 20:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gadpjx+++DWtzaTiyVlBNVI9WyUem2xm3P2EGUTeF6A=;
 b=ize/sWe1ui9+JonC+ts555oi6VWqi/IAnroqfFa5Jlg/w2LBk/bGAUAyswGrv6Fab/BG90
 8iPVrTCr+4vcuztgV48bZYMzffB3+QmH06AhVj4tBgrre3hm0wpI4UswNG2Z93axjtXeMIE2
 5QzWkL0orHLuV/6fZGfnM+IHxmkSYIffK0b4H8ishCqUNYxJlQtozpiQoK2J2i+v0184wCuJ
 BAGLkjbvOjcgbKmrsJK+0kgmLWpClOXXAUfOTt2CgChtn+Cc5uPDp+AN6AitN32HYXkf7+zp
 X6KGHZuDHibJ926kXH8UA3WF4A/vVfZ59WdIaSFS9pJ0lHHTLEUDUd0g==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2025-24965
Date: Fri, 28 Feb 2025 20:44:21 +0100
Message-Id: <20250228194421.54366-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Feb 2025 19:45:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9152

From: Peter Marko <peter.marko@siemens.com>

Pick commit https://github.com/containers/crun/commit/0aec82c2b686f0b1793deed43b46524fe2e8b5a7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../crun/crun/CVE-2025-24965.patch            | 45 +++++++++++++++++++
 recipes-containers/crun/crun_git.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/crun/crun/CVE-2025-24965.patch

diff --git a/recipes-containers/crun/crun/CVE-2025-24965.patch b/recipes-containers/crun/crun/CVE-2025-24965.patch
new file mode 100644
index 00000000..8a8a8f64
--- /dev/null
+++ b/recipes-containers/crun/crun/CVE-2025-24965.patch
@@ -0,0 +1,45 @@
+From 0aec82c2b686f0b1793deed43b46524fe2e8b5a7 Mon Sep 17 00:00:00 2001
+From: Giuseppe Scrivano <gscrivan@redhat.com>
+Date: Tue, 4 Feb 2025 10:19:07 +0100
+Subject: [PATCH] krun: fix CVE-2025-24965
+
+make sure the opened .krun_config.json is below the rootfs directory
+and we don't follow any symlink.
+
+Signed-off-by: Giuseppe Scrivano <gscrivan@redhat.com>
+
+CVE: CVE-2025-24965
+Upstream-Status: Backport [https://github.com/containers/crun/commit/0aec82c2b686f0b1793deed43b46524fe2e8b5a7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/libcrun/handlers/krun.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/libcrun/handlers/krun.c b/src/libcrun/handlers/krun.c
+index 804a17cb..3c7766ba 100644
+--- a/src/libcrun/handlers/krun.c
++++ b/src/libcrun/handlers/krun.c
+@@ -43,6 +43,8 @@
+ /* libkrun has a hard-limit of 8 vCPUs per microVM. */
+ #define LIBKRUN_MAX_VCPUS 8
+ 
++#define KRUN_CONFIG_FILE ".krun_config.json"
++
+ struct krun_config
+ {
+   void *handle;
+@@ -207,7 +209,13 @@ libkrun_configure_container (void *cookie, enum handler_configure_phase phase,
+       if (UNLIKELY (ret < 0))
+         return ret;
+ 
+-      ret = write_file_at (rootfsfd, ".krun_config.json", config, config_size, err);
++      /* CVE-2025-24965: the content below rootfs cannot be trusted because it is controlled by the user.  We
++         must ensure the file is opened below the rootfs directory.  */
++      fd = safe_openat (rootfsfd, rootfs, KRUN_CONFIG_FILE, WRITE_FILE_DEFAULT_FLAGS | O_NOFOLLOW, 0700, err);
++      if (UNLIKELY (fd < 0))
++        return fd;
++
++      ret = safe_write (fd, KRUN_CONFIG_FILE, config, config_size, err);
+       if (UNLIKELY (ret < 0))
+         return ret;
+     }
diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 89ba21b4..8d72e5f6 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            git://github.com/opencontainers/runtime-spec.git;branch=main;name=rspec;destsuffix=git/libocispec/runtime-spec;protocol=https \
            git://github.com/opencontainers/image-spec.git;branch=main;name=ispec;destsuffix=git/libocispec/image-spec;protocol=https \
            git://github.com/containers/yajl.git;branch=main;name=yajl;destsuffix=git/libocispec/yajl;protocol=https \
+           file://CVE-2025-24965.patch \
           "
 
 PV = "v1.14.3+git${SRCREV_crun}"

