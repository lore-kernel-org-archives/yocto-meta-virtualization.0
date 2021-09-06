Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.19289.1630915756980127044
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 01:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18689F2j005486
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Sep 2021 01:09:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18689Fbc009930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Sep 2021 01:09:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 6 Sep 2021 01:09:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 6 Sep 2021 01:09:14 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 2/2] skopeo: Upgrade to 1.4.1
Date: Mon, 6 Sep 2021 16:05:10 +0800
Message-ID: <20210906080510.28468-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210906080510.28468-1-mingli.yu@windriver.com>
References: <20210906080510.28468-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the unvalid keys to silence the below warning:
 # podman --version
 WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
 podman version 3.3.1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/skopeo/files/storage.conf | 6 +++---
 recipes-containers/skopeo/skopeo_git.bb      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
index 818cfe8..c0d512f 100644
--- a/recipes-containers/skopeo/files/storage.conf
+++ b/recipes-containers/skopeo/files/storage.conf
@@ -30,7 +30,7 @@ size = ""
 #mount_program = "/usr/bin/fuse-overlayfs"
 
 # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
-override_kernel_check = "true"
+#override_kernel_check = "true"
 
 # mountopt specifies comma separated list of extra mount options
 mountopt = "nodev"
@@ -126,8 +126,8 @@ mountopt = "nodev"
 # xfs_nospace_max_retries = "0"
 
 # If specified, use OSTree to deduplicate files with the overlay backend
-ostree_repo = ""
+#ostree_repo = ""
 
 # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
 # certain container storage drivers
-skip_mount_home = "false"
+#skip_mount_home = "false"
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 39ee8ca..adb7de1 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://registries.conf \
 "
 
-SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
+SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
 PV = "v1.4.1+git${SRCPV}"
 GO_IMPORT = "import"
 
-- 
2.17.1

