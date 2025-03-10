Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BB2C28B2F
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 00:29:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.26879.1741566533377564719
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Mar 2025 17:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UI1PfXfs;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22403cbb47fso66395365ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Mar 2025 17:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741566532; x=1742171332; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0WfGW39rRCtxHqUoxRJPkqx7lkVSYJRZEAVbRRWpNg=;
        b=UI1PfXfsgLMO3K54+MjmBkVzMB0DQOtg7xjIFxVNrlawTLDLViODlFN2V04BM71fBZ
         87vGQKOQbUhULkt5xj7/gHKUY/dlBVBwhnbn/EFVvgLrIe64zAaXMIwHJn3wNkMVOVd9
         Qv5XRoQPzEKrlhengxSYgadXnIKJHca//qpawdP1+D8sVHc1nBpqLgki7AlSm1aL+VpI
         2ctAS1hWuGiCi4QhOAPZIkgLcReLeB6dcRTuA9l6Pwhca2QRe6bvuAJMxFbu9yHJ7CCz
         QYK75XRgph/A/Qy1Wn1PmQKiL9YMnIrMLs6nHuQegD4seghF+Sf0nOYsnnrG8wzW+skY
         hcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741566532; x=1742171332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0WfGW39rRCtxHqUoxRJPkqx7lkVSYJRZEAVbRRWpNg=;
        b=WM7eC7L4pX4BK+/w9r/5pDKILZLAlcaMxebVZ/pJj20jPQJsKPBFXsPFiRlS594Hej
         ygI++bmmyTNNa23k4kpC+FLSscOk7BUozMaeEJD7JrrdfxPF+uOdajnBWB1Q1rGOTk+0
         QEWCPLRLJPyqcTwKhAkdy9fE9RFAmO1qSkQQkLHr9szkKg7QOhFNW9sxM44ZakjRcN7U
         LeSX1XDGlC7x3USASXl23hM6XkjTtkOEAfG7oE3PZ8Qsnk68dGUcVqGxPfeYuYqghjPS
         2gG8yjstHqoT6LASqOBMjKnNy8cWS3PxpcgsJMhekkq9H8Iqut59eoAC/VGUE2qPIHR9
         h35w==
X-Gm-Message-State: AOJu0YwZdOwyq7ijRTHncLGxCdvHLOxTURixO/LbtCbeuQEnlD5vh+MP
	NKhoEE/GspZmJGyWo5TAwuM/NAZMHOqRhY/PY/oIL1Few9A9aOrTAhPedg==
X-Gm-Gg: ASbGncs/Q1fBctp55Rixq8QErdSWssT72/LHbN34GaoOi0Af54S38iSrnjd2XfUJpbf
	TfMx1yP8Zq9u9h8zfatRrVwS6PBJLOg3xVdc/Ce1SPMX7/q5HoNIa76VYDNo1BS7gp5K63oSl23
	kiawFKdoBcwyCFHRVWPuID3Q23fRWQlmfKsgOgBRcEv2nYehEm1i8xc0GVqNRp90LSqtmj9BwtX
	joqpKHrsPYQyWdgHg97U1tNFcpk7xkasTL/NFVoSSy5XZV1vc3012Frl0OdYy1fj6wmwSqcXUi8
	SlvDC+r/Zh2We428x9EZ+hVPSSvM0D4zsw==
X-Google-Smtp-Source: AGHT+IE0JlSNshZmK3hCOBZym8XMAVEuSDrvcqkd/gklchUM0KteckD74gXVZlKJGNHZr+HHpepUQA==
X-Received: by 2002:a17:902:e80e:b0:223:669f:ca2d with SMTP id d9443c01a7336-22428bd5819mr193482085ad.35.1741566532182;
        Sun, 09 Mar 2025 17:28:52 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm6654656a91.33.2025.03.09.17.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 17:28:51 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Kyungjik Min <dp.min@lge.com>,
	Kyungjik Min <dpmin7@gmail.com>
Subject: [meta-virtualization][scarthgap][PATCH] tini: Support posix basename from musl libc
Date: Mon, 10 Mar 2025 09:28:45 +0900
Message-Id: <20250310002845.579962-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Mar 2025 00:29:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9161

This fixes building with musl libc.

Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
---
 ...upport-POSIX-basename-from-musl-libc.patch | 76 +++++++++++++++++++
 recipes-containers/tini/tini_0.19.0.bb        |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc.patch

diff --git a/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc.patch b/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc.patch
new file mode 100644
index 00000000..b504c37a
--- /dev/null
+++ b/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc.patch
@@ -0,0 +1,76 @@
+From 10479a6eef32f8e64fd5bf894dee9c7a6f21ce4c Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sun, 14 Apr 2024 15:33:51 +0200
+Subject: [PATCH] Support POSIX basename() from musl libc
+
+Musl libc 1.2.5 removed the definition of the basename() function from
+string.h and only provides it in libgen.h as the POSIX standard
+defines it.
+
+This change fixes compilation with musl libc 1.2.5.
+````
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Werror=format=]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+      |                        ~^          ~~~~~~~~~~~~~~
+      |                         |          |
+      |                         char *     int
+      |                        %d
+
+````
+
+basename() modifies the input string, copy it first with strdup(), If
+strdup() returns NULL the code will handle it.
+
+Upstream-Status: Submitted [https://github.com/krallin/tini/pull/223]
+
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+---
+ src/tini.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/tini.c b/src/tini.c
+index 7914d3a..41d1506 100644
+--- a/src/tini.c
++++ b/src/tini.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <stdbool.h>
++#include <libgen.h>
+ 
+ #include "tiniConfig.h"
+ #include "tiniLicense.h"
+@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const sigconf_ptr, char* const argv[], i
+ }
+ 
+ void print_usage(char* const name, FILE* const file) {
+-	fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
++	char *dirc, *bname;
++
++	dirc = strdup(name);
++	bname = basename(dirc);
++
++	fprintf(file, "%s (%s)\n", bname, TINI_VERSION_STRING);
+ 
+ #if TINI_MINIMAL
+-	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", bname);
+ #else
+-	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", bname);
+ #endif
+-	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", basename(name));
++	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", bname);
+ 
+ 	fprintf(file, "Command line options:\n\n");
+ 
+@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file) {
+ 	fprintf(file, "  %s: Send signals to the child's process group.\n", KILL_PROCESS_GROUP_GROUP_ENV_VAR);
+ 
+ 	fprintf(file, "\n");
++	free(dirc);
+ }
+ 
+ void print_license(FILE* const file) {
diff --git a/recipes-containers/tini/tini_0.19.0.bb b/recipes-containers/tini/tini_0.19.0.bb
index fd90f620..1f3ae8b2 100644
--- a/recipes-containers/tini/tini_0.19.0.bb
+++ b/recipes-containers/tini/tini_0.19.0.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
   git://github.com/krallin/tini.git;branch=master;protocol=https \
   file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
   file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
+  file://0001-Support-POSIX-basename-from-musl-libc.patch \
   "
 
 LICENSE = "MIT"

