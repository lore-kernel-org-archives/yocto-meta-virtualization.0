Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC5FC44501
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155198.1783358034905220253
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SCeUNsD/;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847a483e344so56465b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358034; x=1783962834; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuetDJpvPL6JJcz2BGcC5IWZ3o1+L2Um1M8SDS95hLE=;
        b=SCeUNsD/BSUpy5kW8lR4G6TXdO6f3xrRWdCrdFql1G9StLgz8CfmGNjWf7euBB9ZDt
         X60S36q+3IhTMbueQIS5dEvZKXgvrFqHQB9i4TLzJmE7r75ohuvoQJoupyzxyOWDWkcY
         5kAlOqW3ysVdiTYqbWuQgfyS2CN0C038bS1Qhn5X8V+9Gqo4DXos3YbcCeLHpN8F9KfY
         n1rJGsJ2rR7+T0Hvh9j/oicN0cDXUaAH8P7jyzpSDV9yKGQ88GA4RSHYbbhxx62oy3Aj
         QofDRsapYDtk1KExBNUTCu2YuBkzhSFMMl7Xf9wElYTCDvcYVjwpTHFnsO/qQC7BNDxP
         2p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358034; x=1783962834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuetDJpvPL6JJcz2BGcC5IWZ3o1+L2Um1M8SDS95hLE=;
        b=i0oqcA6BKYXrVPvat/RxWhCFW0o4MbDJaUT9/F1MVHBX/nXM1V2FxkCeg5BpoUTFeL
         aoTa2YfL61xpKwcv1S5N/BETWZFLc4UVLhwp8R1OCahxDBl0VgS+RbSwwE13FSRkwIL0
         8hspg/x+IhdHXVX0bAV20sHzhRlTkeKn1HTy2iHSc6BDaS4/uuHeiQG4SwU10g+W48j8
         I35qbgsOeHpi+ZTm1cCU+gUNK/NRr966dzC81HRZvObwo5INkMCX1Km26+++8lew3QDY
         zRd6FFY1onqSBoUMCdqnqlosznlq9eUiPY/bI3vi6Cix/gGYTutfmjHVFN5gMetsTrBd
         afow==
X-Gm-Message-State: AOJu0Yx24RbO4wQeeFD361PbHp4Pr6QHMygunYgZ+RvoJyxEQvOIIdv9
	1AivYsET+A0qrQq/asGvh8yDEZQmT55A+0QjF5vy1eD0uU2wU5ofallLV+Ejgw==
X-Gm-Gg: AfdE7clDBEWlNwiydGUrVwhVbOUwSRVjvwhYTGDC//S9H+vzLdZPNhdcs9pWmnGytIk
	F3YiUwKQE+eciP0Ts1OGyFoYv+kk3QDPIj42a1FyrzCsYcXg8YDPa75U/VovEECHTKonjrfWDxo
	HDnriAau5m+sB7ejdK2Hf99SSqyd8T4QEYB6xo9BTK9Mzp4hvTwCp3qBXOhjrn4STgVdEHMVX+3
	st+FM27hnneqsIRtP2yntjpwnlsfYuiYLdImHlEQx0SGJsidnbkNnNJHqnGgp9OdN+KOHU5MsJW
	/0QOJpKxANU8RKIB73auNyzWIkf00aFQ2UgwnaXY3ec36TZ7M1QrtTCBI3sBAd8xvMYZSXvuv8d
	lvldCx/EE6RsFPBWBuVBW61yq9fjTn+h5UKZZ4ZMmG6vL7euOL91e/2HXvOJjP9VwwEskDnstNe
	/vUa5kpAYZ37ciDr1PtmQeTJ3QSH/loZ6/M49sTnrW3wLjD0IatIIUGfw/WLywlnn4WfpxZ7ObO
	+nWiIsYRXn45zwTqZy3zZk=
X-Received: by 2002:a05:6a00:1708:b0:845:cf86:947e with SMTP id d2e1a72fcca58-847e18f5069mr13070985b3a.27.1783358034149;
        Mon, 06 Jul 2026 10:13:54 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.52
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:52 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 05/13] recipes-containers/images: add app-container-python
Date: Mon,  6 Jul 2026 10:12:40 -0700
Message-ID: <43d049a0aa53687d96887df265d6e2ec0a2021fe.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9929

From: Tim Orling <ticotimo@gmail.com>

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

Inherit container-volatile-fixup to ensure /var/volatile/{tmp,log}
are available, if needed.

Inherit container-dev-mode to optionally run as UID '0' root user
and provide a shell.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-python.bb            | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 recipes-containers/images/app-container-python.bb

diff --git a/recipes-containers/images/app-container-python.bb b/recipes-containers/images/app-container-python.bb
new file mode 100644
index 00000000..19a64814
--- /dev/null
+++ b/recipes-containers/images/app-container-python.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Base python3 container image"
+DESCRIPTION = "OCI container image running Python with non-root user. \
+\
+In 'dev' mode, can optionally run as 'root' and add 'pip' to allow \
+developers to simply run 'pip install' on top of this container (Not \
+advised for production/hardened use)."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - adds a shell to the container
+#   - adds python3-pip to the python layer (enables `pip install` at runtime)
+#   - runs the container as root (UID 0) so pip can write to site-packages
+# Enable with: PACKAGECONFIG:pn-app-container-python = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+inherit container-dev-mode
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
+    terminal:packages:ncurses-terminfo-base \
+    python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG', 'dev', '+python3-pip', '', d)} \
+"
+
+# Use CMD so `docker run image /bin/sh` works as expected
+OCI_IMAGE_CMD = "python3"
+
+IMAGE_FSTYPES = "container oci"
+inherit image
+inherit image-oci
+inherit container-nonroot-user
+inherit container-volatile-fixup
+
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+NO_RECOMMENDATIONS = "1"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
-- 
2.54.0


