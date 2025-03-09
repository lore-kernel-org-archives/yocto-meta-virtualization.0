Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37534C28B28
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 23:48:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.26401.1741564104640921787
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Mar 2025 16:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iMuOzl2r;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22548a28d0cso31702255ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Mar 2025 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741564103; x=1742168903; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0WfGW39rRCtxHqUoxRJPkqx7lkVSYJRZEAVbRRWpNg=;
        b=iMuOzl2r+4nvELT6WWBlK7nlrCqq4poLvnoMZERikNyWqA5ZtcdjU3YRt+07HmmWv+
         +XGkbsAGZ1lIwT3lRYTXHYs6CbZ2TMIkt8YBkYRGGwR3csc3ldYDBDSXxsncJpYmCBTc
         DagxqWPVKR9RAt/h0svbmtI+HQbsik/dp1T3LvOFF8Ipwnq11R406ER5vNetw1WiTx62
         2Adn9zhmF+wOmxwrAl9VSrmR9CcuxqwjHcpFOd+P3dM8jYCSF1tjmJMk+9KdnBWVoN1P
         cVg81PI3t01G+V54DomAhdLh6Lt33HJRlAcEPqBQPMkUpFwEz4sCJFS6CbXDDMUimt0m
         23QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741564103; x=1742168903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0WfGW39rRCtxHqUoxRJPkqx7lkVSYJRZEAVbRRWpNg=;
        b=nkIaqObkv0/S5o8JJ4lHXmGEKXjdo9zw4bMvo0s++Se2pbIptrMR6B2RLXN4qmtIGy
         qpZH86IkZAFMOxDVHzd9J307ClXFlYkMUt9J0qLsj2BnCLr+20vlkt88x0I7A0EhziuT
         Owue3776NCS2YC6tEjlFvHwWNvZpyIPeKLA/wDA9KlRAuCORZzwFeOFDqYZXBtagznKw
         odz55pknpvFF2tS51Y3XI7X/UlLJlBDcGWeGLdgxlJ7BqonCDbkFp3IfzNzdZQwBEO7V
         6Lj9DeTy/zj+pakuewjG3lI5/BBhC2mgJBzgm5pmvQDH/JlmIyI1f65vqOjq0CacrDDU
         QY0w==
X-Gm-Message-State: AOJu0Yy1ADu3WwrjVXedW4zuz5ZMkaceDFn8x2bGAJsDxWqM3I+kCPfq
	wghMU7rBrhAuaEHacdoKf+al4iFmLbLUwjCqO/fcijzn1ArJa+2wNjIPgA==
X-Gm-Gg: ASbGncskm1z1JPvsRIvwW/eeTHw6txaTc+vNDuDXz7n/p6ac2ZEDhoF96vAHGJTXBZW
	2495FVNlay5Qoy+VTKVkqac9qYbjYUz4BBzsHUJ/wZMUZmHk7zF6TF5ZDUqH9FeA0C0JdIUCNtn
	W3/5PDQZrYMYdeKBaw9OabgrroqD7iL4nbP8l+An6BX+9ZYg54QqZ1+lQpktCimd0GFi38kg6An
	gOgn5TxoctT1zerllIewoVwI2DL5ZYAJJ1aiS58ui/1OuKa2+4CMP2rs6P0OMpZ5/Pp/lCjOpS2
	7ZiYnPQX3YGTq7+jhOnHr/ryWR3QUevFOw==
X-Google-Smtp-Source: AGHT+IGg2gcOUZLgce1J3rjmZUrwM5AoC/dAJXiDRMa95VAP+2AvatN9MKSoYBwQBBAfPixC9j+tbQ==
X-Received: by 2002:a17:902:f644:b0:224:76f:9e45 with SMTP id d9443c01a7336-22428a8c6femr207817545ad.21.1741564103461;
        Sun, 09 Mar 2025 16:48:23 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddc7esm65074435ad.48.2025.03.09.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 16:48:22 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Kyungjik Min <dp.min@lge.com>,
	Kyungjik Min <dpmin7@gmail.com>
Subject: [meta-virtualization][PATCH] tini: Support posix basename from musl libc
Date: Mon, 10 Mar 2025 08:48:17 +0900
Message-Id: <20250309234817.579683-1-dp.min@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Mar 2025 23:48:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9160

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

