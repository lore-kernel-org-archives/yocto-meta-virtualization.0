Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369CECD6E52
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2244.1780104700158418188
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LxMLszOq;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf20f6be6bso7353925ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104699; x=1780709499; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB7EiE+JaVcxfGz8V/LeWOc94EdxJF5zdE0Goo6BlS8=;
        b=LxMLszOqqrEUzwGe2sYuEVQH4YYXk81qnsPWlNIsLN7Op3VTvuixu5lZnVdSlKgG3V
         E4QBZ89PEx8IxOXbJSX4IAiG5WHhHCGiO20tefxSpCY8aq0vzzkr69BleS8IY1BqaLGk
         +YHINm6pA3qrVVkDwTQs/8sdcxBGe5xWmhKkq8Hoop4h1xaZE9p4YrHRuF4/vqc1MRb+
         2M993kXXOcAeCHp4YSvmkXMULFJS2IPqRZ0TsX4wVfuxzYMDIgpQZx//s+A7HnTWafqm
         E3l+9l4rD/54k/YqCn8ussldQyp0QJLbgnvzZgNxirjKYX14YorvgpgzefuVPes7AGSi
         gOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104699; x=1780709499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RB7EiE+JaVcxfGz8V/LeWOc94EdxJF5zdE0Goo6BlS8=;
        b=CsMr2jz9jCytszvtYjGJIaKIg6+8KNnwOnrfv0Dx30tZSRKBhuTBfQKqBT5Fd++9W+
         BlXf4AmtfM7pvUHTs0h5DkR900tmstPhPomUyeIx18CzNEb1wGjiz6t2KRXMMOTvI/6J
         8x6hh9wKCpyDFLELZ4HgG3exWNHBA1Zw+7bPMT2dymQUn3pz6kw9XzVnXhZzHVXodhtR
         gT0m1s347MqEaQJQV9LvVRIjLbnosCHWRVv9OrZ7oGTdw3fhs+8fdX6gz0vrQe+racHl
         YVodwrwBY147fXz+9NouHCDnjU8G0YSzpmS/o/w/9qlJpVzCBOp4XEUh9uMZc9k1WIxS
         wsiA==
X-Gm-Message-State: AOJu0Yx7vsDqltQVGmJv1AxMENdj/xZ9C5XB0vaKcz4BVNatMP48esfR
	cFuKeOUlGnpTB4JNSNFkIpq2W9MRqu32NzJkO47xndqZJOQd8Bq9GSnP5W3ijg==
X-Gm-Gg: Acq92OGAjaS1C09B2MeDtWJr+bWK04t2kqipt+t3OgEjw6qU0FBxRpZRWrZAdfWhB3H
	2n9pRB45p3VsZHeQ+d4NIiaub/o59GRuF3X5NUx9z9Y0BSlO5/Nee5rGIkNU/sIrS2B1KAgnyNc
	oqqb+GJDEBoVJ+8XIOIiyOZEHCMOWbHYMmpkSdF1wQzJ6py6aYN6Kr0M8wZBMmIp1NlAiPVQZsA
	nzASvRx6tbJzaUSrSJ3v+a680GlbqG/3I9JyEQQTgjv1Yez0XKtBuC58pDu9Utb/87SMz1go7Q4
	jJiRRqt10boiby9RE5gCfBUJ5Lrk8JjCV1dQxJRyQK3ttv20v0+A75ldlSKddHTK019n9BqwP3v
	XNrcDq9/oaBCMSwNY/IlSFfLiRsLU1Z2o/2IuaUxRen/xxoxDhqZgcCzyYOAC47wCoXHV+wSRrU
	FSdsDH3D2FgFerIKfccSc5VsR4eutZQ2jNv+ZCPzSkLZ26KwNF5O02MNHxM3zwef1ceM2RtDJHd
	1inIR4eVgbMgP1c5NVL84H6YdPd6Be26g==
X-Received: by 2002:a17:903:986:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2bf3682a21bmr23537695ad.25.1780104699555;
        Fri, 29 May 2026 18:31:39 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.38
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:38 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/7] recipes-containers/images: add app-container-python
Date: Fri, 29 May 2026 18:31:03 -0700
Message-ID: <2c612245431bf2ebcfe9c4f188be1e27117cc0db.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9828

Add OCI container image recipe for Python to use as a base for
other Python app containers. The image uses multi-layer mode with
separate base, terminal and python layers.

Add ncurses-terminfo-base to a "terminal" layer to avoid warnings in the
REPL:
  "Cannot read termcap database;
  using dumb terminal settings."

Add coreutils to "python" layer to provide /usr/bin/env needed by
python3-idle in python3-modules.

Inherit container-nonroot-user and run a `nonroot` user by default.
Set PACKAGECONFIG:pn-app-container-python = "dev" in local.conf or
distro/image config to run as 'root' and include 'pip'.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-python.bb            | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 recipes-containers/images/app-container-python.bb

diff --git a/recipes-containers/images/app-container-python.bb b/recipes-containers/images/app-container-python.bb
new file mode 100644
index 00000000..a93f1b0f
--- /dev/null
+++ b/recipes-containers/images/app-container-python.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Base python3 container image"
+DESCRIPTION = "OCI container image running Python with non-root user. \
+\
+In "dev" mode, can optionally run as 'root' and add 'pip' to allow \
+developers to simply run 'pip install' on top of this container (Not \
+advised for production/hardened use)."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - adds python3-pip to the python layer (enables `pip install` at runtime)
+#   - runs the container as root (UID 0) so pip can write to site-packages
+# Enable with: PACKAGECONFIG:pn-app-container-python = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    terminal:packages:ncurses-terminfo-base \
+    python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG', 'dev', '+python3-pip', '', d)} \
+"
+
+# In 'dev' mode, override the nonroot UID inherited from container-nonroot-user
+# so the container runs as root (required for `pip install`).
+OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0', '${NONROOT_UID}', d)}"
+
+# Use CMD so `docker run image /bin/sh` works as expected
+OCI_IMAGE_CMD = "python3"
+
+IMAGE_FSTYPES = "container oci"
+inherit image
+inherit image-oci
+inherit container-nonroot-user
+
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+NO_RECOMMENDATIONS = "1"
+
+# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.
+# Even for multi-layer mode, list packages here to ensure they're built.
+# The PM will install them directly to layers from DEPLOY_DIR_IPK.
+# Note: IMAGE_ROOTFS is still created but ignored for packages layers.
+IMAGE_INSTALL = "base-files base-passwd netbase"
+IMAGE_INSTALL += "ncurses-terminfo-base"
+IMAGE_INSTALL += "python3 coreutils"
+IMAGE_INSTALL += "${@bb.utils.contains('PACKAGECONFIG', 'dev', 'python3-pip', '', d)}"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
+# Note: No ROOTFS_POSTPROCESS_COMMAND needed - IMAGE_ROOTFS is empty
+# and PM handles installation directly to OCI layers
-- 
2.54.0


