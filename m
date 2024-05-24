Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409B5C25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:30:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.3921.1716579006731305395
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnUQcQo7;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5785173dfb6so1618304a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716579005; x=1717183805; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGnkNMYPclJFAIzvRIaAunT1WfmXaqAeiOaJWwL1vDc=;
        b=UnUQcQo7YWL0jXoOhDAuLbixlhRO2a/ZxFco79z2hYHc9kQWCqrmhCGI+/cNHzx7Uu
         n2K6cnnWiy0xSA98F0UiUAWnRNbl4bRWwop3f75oiFgQVx80ZsQ5tGuGARpYd+cPhGdR
         /MY/l0BxQVO4q0TosfAhFTviwe6fMTZJHzzoYMqH3dRu8fcymsEpEGR7kSv09+EqmQuN
         LS6okqEajvCqeiaXfi7PFfF2XVZZbMtc+/0A3zVy2vjljTy0aQBpFAJMx5KLTZeSPTQw
         DotALVT4qE8y7jETOlj+/otmCKsQwR2eHvcpy3klmD8AD6MzyXkgtnjRgjNNl/HCx6z9
         YNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579005; x=1717183805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGnkNMYPclJFAIzvRIaAunT1WfmXaqAeiOaJWwL1vDc=;
        b=dtmUifFwohEU1vjnsPO1CkkJqNz2f015NBEw3oZaWnkgUcr0xj+aDuRE2/rDzjryhW
         jJhtzTH0zEy+9KSCrIKEAhHletzSwjjceVTdtfS8RvdpS2AgfUWamJOCnL+c+bu47tIY
         e+yB/WnAyTrz5cAKIgEa35uaWaE1LcK5EfvAuPgXxx/DElqqRvYpWH23DkpIdkzZWleK
         IGH8A/+ePsmXgsc8OaEVov5CNctkRX8Dv6L36n/wWDDqyQFWd4X1YAOQvXt7hYbrH7SW
         6AtR7YXKo+jJNjIYUogyS6rhUBlsx6Oh9++Ewjz8m18HNjDMoUbyLH8Zxfa14RbceIFI
         cMZA==
X-Gm-Message-State: AOJu0YywLzc3d1f1lxv+8APKDK/R3Ag6JqEzUXIEoCzmVUOTXLEeNHh5
	TD4sIar6GVHVynSBzJ5p35O1gcVY4GMkyBbQrCHzDuzO8IiVox+rutYMtw==
X-Google-Smtp-Source: AGHT+IFuE6ekGgCR6I5vS1hhbwYPce7eD35Cqb4T5+ZGFyffG6fcaZ0qUjKMvBbd13xsnay8WjnjWA==
X-Received: by 2002:a50:a45b:0:b0:578:5851:b0da with SMTP id 4fb4d7f45d1cf-5785851b1a5mr1578384a12.36.1716579004731;
        Fri, 24 May 2024 12:30:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57868fbbd8dsm2368a12.8.2024.05.24.12.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:30:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 1/2] neard: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 21:29:54 +0200
Message-ID: <20240524192955.2497200-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8762

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772687/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...w-external-specification-of-build-setti.patch | 16 ++++++++--------
 recipes-containers/nerdctl/nerdctl_git.bb        |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
index ca7b3042..62338d0f 100644
--- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
+++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
@@ -1,4 +1,4 @@
-From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17 00:00:00 2001
+From c624d3aab602242df017f6d4c065ff709e712bab Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Mon, 29 Mar 2021 20:50:47 -0400
 Subject: [PATCH] Makefile: allow external specification of build settings
@@ -7,14 +7,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: nerdctl-v2.0.0-beta.1/src/import/Makefile
-===================================================================
---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile
-+++ nerdctl-v2.0.0-beta.1/src/import/Makefile
-@@ -38,7 +38,7 @@
+diff --git a/Makefile b/Makefile
+index 844ae721..f5b90d84 100644
+--- a/Makefile
++++ b/Makefile
+@@ -38,7 +38,7 @@ REVISION ?= $(shell git rev-parse HEAD)$(shell if ! git diff --no-ext-diff --qui
  
  GO_BUILD_LDFLAGS ?= -s -w
  GO_BUILD_FLAGS ?=
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8868274f..9343309c 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,12 +13,12 @@ DEPENDS = " \
 SRCREV_FORMAT="nerdcli_cgroups"
 SRCREV_nerdcli = "265d6b9cf526ce7d9ed8d34a0e3c3066901cc463"
 
-SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https"
+SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 include src_uri.inc
 
 # patches and config
-SRC_URI += "file://0001-Makefile-allow-external-specification-of-build-setti.patch \
+SRC_URI += "file://0001-Makefile-allow-external-specification-of-build-setti.patch;patchdir=src/${GO_IMPORT} \
             file://modules.txt \
            "
 
-- 
2.45.1


