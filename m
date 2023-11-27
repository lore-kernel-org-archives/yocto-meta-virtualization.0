Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5669C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:32:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.104325.1701113568491741692
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 11:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j8FjKewE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b27726369so32361205e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 11:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701113566; x=1701718366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TJdxQOsL/f3ya5KUg3Tm76AivMeIorfrmrVz0r6LX4=;
        b=j8FjKewElCJ+W7s9UZypJNft6Ke0elqUBE2ywJWgX1Hogzy2fQBOlP1a84iMAGJZDv
         T/q66nsRttW/sVERmQVOIQReWClZHe7af7JCWTkfEGIIbXIuiopA/D1VBcN/w+Q2DUA0
         yXb+yxmkXmqd5ZlBiut0d8uV9J5p2OHqVUOdUfETvlWOxT2qnDlTrZmo1H+z4F3rCo1M
         bnEdlR9dGtFJZu462bW4H0FIFKlg51vzWY41Rif3vaP4jwObyO+5u9wGPgDw6zU7lkqh
         WBKjDxUYGx7P1k4sZKy7T5T0oCiDwclxRogvdZuaaspOC9rTLTcYAMIrb2G9vzcV3F+B
         l47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113566; x=1701718366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TJdxQOsL/f3ya5KUg3Tm76AivMeIorfrmrVz0r6LX4=;
        b=qSr9T1iQkoR5z/NBwdnZChMQhLYMG6l/VZ9Jr4jN5tIK3gLBapns19kzmw+BQrvv5e
         8REV2ah1zvPuLpjdtE/+uuFNFb/w02edZsINucKDS/fbckf+1vG+PjYac0/J7kXCjSEV
         lCgdCxtCyVtq5LMbNhbXtZo/Q9+KO+03qE1RIu3o9s8dGZAGk8NZviyBQhReubVYA+8+
         NrRHlE1CMipy0gXsGiNUbebL+2bEeRRm/QlAfeium0JfWs6JJ6zYosEc/nbJ6ifOH4EP
         M+K1ThX1F7tC4tNcSwXpVbt5glVhy79SKVsRplEcLI4mRl5GqVL5ZENLF85xdnxjeNAj
         XgWw==
X-Gm-Message-State: AOJu0YyS69yRy+eDvoY8VtN9DdvKF2Ocu0jiZM/W/3QkhoDMhi/6+gnN
	uRneV7RxahadEu/LQ98N3uzWL791+Ew=
X-Google-Smtp-Source: AGHT+IGiwczoPEjhOiu53r22qd5JdjWxqkcUaksQQ7vZYugrq44tZeHd11Zgmc1Y0g8qKh+VsBGsag==
X-Received: by 2002:a05:600c:35d5:b0:401:bcd9:4871 with SMTP id r21-20020a05600c35d500b00401bcd94871mr6043740wmq.21.1701113566302;
        Mon, 27 Nov 2023 11:32:46 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id n14-20020adffe0e000000b00332f0e6d1b4sm7866522wrr.77.2023.11.27.11.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 11:32:45 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH] docker-compose: v2.20.3 -> v2.21.0
Date: Mon, 27 Nov 2023 19:32:36 +0000
Message-ID: <20231127193236.2038055-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 19:32:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8471

d6f842b0 test: e2e test reliability improvements (#10950)
4fbbf201 build(deps): upgrade to compose-go v1.18.3 (#10947)
935d72f4 added the dot at the end of the sentence
41682acc add support for attributes exposed by `docker ps`
1054792b align docker compose ps with docker CLI to support --format
19f66918 watch: only allow a single instance per-project
186744e0 ci: bump golangci-lint to v1.54.2
bc9d696f Merge pull request #10922 from thaJeztah/replace_dockerignore
6204fb1c logs: fix for missing output on container exit (#10925)
5d732010 replace dockerfile/dockerignore with patternmatcher/ignorefile
2006f3fe go.mod: github.com/moby/patternmatcher v0.6.0
192718c0 go.mod: remove some outdated comments
c79f67fe otel: add `include` to project up span
3b294bfd build(deps): bump github.com/compose-spec/compose-go from 1.18.1 to 1.18.2 (#10915)
dd34f7a2 include: add experimental support for Git resources (#10811)
caad7271 up: handle various attach use cases better
792afb8d build: use correct values for proxy variables (#10908)
150449bb warn user secret uid/gid/mode is not supported

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
--

There are more recent updates but they require go 1.21
| cmd/compose/create.go:22:2: package slices is not in GOROOT (/lmp/build-lmp-intel-corei7-64-main-next-container/tmp-lmp/work/corei7-64-lmp-linux/docker-compose/v2.23.0/recipe-sysroot/usr/lib/go/src/slices)
| note: imported by a module that requires go 1.21

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../docker-compose/docker-compose_git.bb        |  4 ++--
 .../docker-compose/files/modules.txt            |  6 ++++--
 .../docker-compose/relocation.inc               |  7 ++++---
 recipes-containers/docker-compose/src_uri.inc   | 17 +++++++++++------
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index f6a2502..092ce3d 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -9,7 +9,7 @@ DEPENDS = " \
 
 # Specify the first two important SRCREVs as the format
 SRCREV_FORMAT="compose_survey"
-SRCREV_compose = "8d0df1876296bc639614653ba5de38a377da5356"
+SRCREV_compose = "d6f842b042d2f2926901305336527b3eaadf067a"
 
 SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https"
 
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=175792518e4ac015ab6696d16c4f60
 
 GO_IMPORT = "import"
 
-PV = "v2.20.3"
+PV = "v2.21.0"
 
 COMPOSE_PKG = "github.com/docker/compose/v2"
 
diff --git a/recipes-containers/docker-compose/files/modules.txt b/recipes-containers/docker-compose/files/modules.txt
index 0ba3cd1..d287d12 100644
--- a/recipes-containers/docker-compose/files/modules.txt
+++ b/recipes-containers/docker-compose/files/modules.txt
@@ -2,9 +2,11 @@
 ## explicit
 # github.com/Microsoft/go-winio v0.6.1
 ## explicit
+# github.com/adrg/xdg v0.4.0
+## explicit
 # github.com/buger/goterm v1.0.4
 ## explicit
-# github.com/compose-spec/compose-go v1.18.1
+# github.com/compose-spec/compose-go v1.18.3
 ## explicit
 # github.com/containerd/console v1.0.3
 ## explicit
@@ -42,7 +44,7 @@
 ## explicit
 # github.com/moby/buildkit v0.12.1
 ## explicit
-# github.com/moby/patternmatcher v0.5.0
+# github.com/moby/patternmatcher v0.6.0
 ## explicit
 # github.com/moby/term v0.5.0
 ## explicit
diff --git a/recipes-containers/docker-compose/relocation.inc b/recipes-containers/docker-compose/relocation.inc
index a1a12c8..9e6eacf 100644
--- a/recipes-containers/docker-compose/relocation.inc
+++ b/recipes-containers/docker-compose/relocation.inc
@@ -19,6 +19,7 @@ export sites="k8s.io/api:k8s.io/api:force \
            golang.org/x/time:golang.org/x/time:force \
            go.uber.org/goleak:go.uber.org/goleak:force \
            golang.org/x/tools:golang.org/x/tools:force \
+           github.com/adrg/xdg:github.com/adrg/xdg:force \
            golang.org/x/crypto:golang.org/x/crypto:force \
            golang.org/x/oauth2:golang.org/x/oauth2:force \
            k8s.io/apimachinery:k8s.io/apimachinery:force \
@@ -189,9 +190,9 @@ do_compile:prepend() {
         force_flag=$(echo $s | cut -d: -f3)
         mkdir -p vendor.copy/$site_dest
         if [ -n "$force_flag" ]; then
-	    echo "[INFO] $site_dest: force copying .go files"
-	    rm -rf vendor.copy/$site_dest
-	    rsync -a --exclude='vendor/' --exclude='.git/' vendor.fetch/$site_source/ vendor.copy/$site_dest
+            echo "[INFO] $site_dest: force copying .go files"
+            rm -rf vendor.copy/$site_dest
+            rsync -a --exclude='vendor/' --exclude='.git/' vendor.fetch/$site_source/ vendor.copy/$site_dest
         else
             [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go files" ; rsync -a --exclude='vendor/' --exclude='.git/' vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
         fi
diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-containers/docker-compose/src_uri.inc
index 1194804..8897c9c 100644
--- a/recipes-containers/docker-compose/src_uri.inc
+++ b/recipes-containers/docker-compose/src_uri.inc
@@ -103,6 +103,11 @@ SRC_URI += "git://github.com/uber-go/goleak;name=goleak;protocol=https;nobranch=
 SRCREV_tools="031fc75960d487b0b15db12fb328676236a3a39c"
 SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
 
+#       github.com/adrg/xdg v0.4.0
+# [1] git ls-remote https://github.com/adrg/xdg 4ec40e24f0cf1039f93c773f2984decdea9719b5
+SRCREV_xdg="4ec40e24f0cf1039f93c773f2984decdea9719b5"
+SRC_URI += "git://github.com/adrg/xdg;name=xdg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/adrg/xdg"
+
 #       golang.org/x/crypto v0.7.0
 # [1] git ls-remote https://go.googlesource.com/crypto 776e461a4e6d8b372a43c72122c5c28cfc40dca2
 SRCREV_crypto="776e461a4e6d8b372a43c72122c5c28cfc40dca2"
@@ -558,9 +563,9 @@ SRC_URI += "git://github.com/jonboulle/clockwork;name=clockwork;protocol=https;n
 SRCREV_go-shellwords="973b9d5391598d4ee601db46fa32f6e186a356ac"
 SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-shellwords"
 
-#       github.com/moby/patternmatcher v0.5.0
-# [1] git ls-remote https://github.com/moby/patternmatcher c5e4b22c8cb290f9439a339c08bba6cb13aa296d
-SRCREV_patternmatcher="c5e4b22c8cb290f9439a339c08bba6cb13aa296d"
+#       github.com/moby/patternmatcher v0.6.0
+# [1] git ls-remote https://github.com/moby/patternmatcher 347bb8d8d557f90d1b75cd8bca3c0177f380a979
+SRCREV_patternmatcher="347bb8d8d557f90d1b75cd8bca3c0177f380a979"
 SRC_URI += "git://github.com/moby/patternmatcher;name=patternmatcher;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/patternmatcher"
 
 #       go.opentelemetry.io/otel/trace v1.14.0
@@ -698,9 +703,9 @@ SRC_URI += "git://github.com/in-toto/in-toto-golang;name=in-toto-golang;protocol
 SRCREV_go-shellquote="95032a82bc518f77982ea72343cc1ade730072f0"
 SRC_URI += "git://github.com/kballard/go-shellquote;name=go-shellquote;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kballard/go-shellquote"
 
-#       github.com/compose-spec/compose-go v1.18.1
-# [1] git ls-remote https://github.com/compose-spec/compose-go 45494a8f6b0176d040c82577f82c84377426a9e6
-SRCREV_compose-go="45494a8f6b0176d040c82577f82c84377426a9e6"
+#       github.com/compose-spec/compose-go v1.18.3
+# [1] git ls-remote https://github.com/compose-spec/compose-go c6eecc55b95f952b6d6406adcd297499d11a300b
+SRCREV_compose-go="c6eecc55b95f952b6d6406adcd297499d11a300b"
 SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go"
 
 #       github.com/hashicorp/go-multierror v1.1.1
-- 
2.43.0


