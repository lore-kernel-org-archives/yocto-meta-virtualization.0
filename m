Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398DCC001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 15:14:14 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.110264.1692026045879424432
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 08:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=J6plJmym;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c136ee106so592367066b.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692026044; x=1692630844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJdzhcV40O4vOY+rS68bOABkJfRXvsR1t0+5M8c+I8k=;
        b=J6plJmymu+UdwnsGTUUuRCw1AADXZivoInf2Fc+DqIArkdi4l+7rwv8RqxKOWV7hx4
         uMwB3x7562t82zxjqZwjDE6mZhES7wrk/nG/+O9oi5V4IeC7Gjxd1RqSyilCi4THttav
         bxDvZoy4++A7ovE/vdoGJVH+2rAXTtlsYjB/Rxok5NPvob3b1fsC9hEyiOBCx8ssB0XY
         kDUntqm5ieS+JmyBj3zEvmhYgNpFOO7EIiHTQeStSKtPz+Tc285YzqIAAfdAk+ZV33xn
         RQipjVQ7xt9ZjRjgbXkEJ517GNWR654LuxQ9fsUdS/lCtKKwmF/kfHpzYTGTWQb6U5Y8
         MIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692026044; x=1692630844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJdzhcV40O4vOY+rS68bOABkJfRXvsR1t0+5M8c+I8k=;
        b=LfBfSeQrQgDikeyPCqQiTxfvNtGMxAQWsPz7MLngxUjBkKECqfZ7XsJKC7iQdU6rRO
         mRGgCuEjTljVoWOKlRUj70d9N55+JUo8SpPaU4ljEkv223b3GT6jqaoUh6ZLee7QAskZ
         d+fEnXte8FQQznjPBZDxE/e9zha71xFpvzxG0/QUDPz36MUbSXWEf5iiTPz9+qcjHCDh
         k9/Axw4YtherDlMKLMMaX0uumr5b2sOkEPX4kgCnLlbkx+kC5N6FGwcSyU3l7iCFTjt/
         dofY0UK2MC4wXedK9WimmGlE5HxbFxgkFBMxL1A6OZL1dDMNjxTUKSXkjStuaKWNS/pe
         si7g==
X-Gm-Message-State: AOJu0YxVRTSL69wJhHNN9b3lGzJlk1/vHy/vkxDaTI66LJL29WVGgsso
	qKqstTYDnG7cw5X0MnS0bNxnecSzjII=
X-Google-Smtp-Source: AGHT+IFqIw6svx3TOIJhBvYoarSwEoWzSuWQV8QOrmCD+3xLf9L+Gl+4IuZen6waUP979Sa/38PCwg==
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr8321020ejw.24.1692026043870;
        Mon, 14 Aug 2023 08:14:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00992b7ff3993sm5712023ejz.126.2023.08.14.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:14:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][RFC][PATCHv2] docker: update to v20.10.25 + 58 commits to fix compatibility with go currently in kirkstone
Date: Mon, 14 Aug 2023 17:13:56 +0200
Message-ID: <20230814151356.1001953-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 15:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8188

* since this backport:
  https://lists.openembedded.org/g/openembedded-core/message/185082
  landed in kirkstone:
  https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=5dc74138649ab7a2c0158a43225dc7a8fd732355

  docker cannot access network and fails with:
  "http: invalid Host header"

  update to latest commit in 20.10 branch, because latest tag v20.10.25
  have the fix yet:
  https://github.com/moby/moby/compare/v20.10.21...v20.10.25

  so we need couple more commits from upstream:
  https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c81952bae6d5

  Adjust the go version revert which was here since the upgrade to v20.10.21:
  https://git.yoctoproject.org/meta-virtualization/commit/?h=kirkstone&id=927537108bcf2b98859512ce3eae59a73439994d

  and add another revert for the go upgrades from upstream for this older
  patch to apply.

* update cli to latest in 20.10 branch as well:
  https://github.com/docker/cli/compare/baeda1f82a10204ec5708d5fbba130ad76cfee49..911449ca245308472a3d34a7f1a98b918e65c8c3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb    |  27 ++--
 recipes-containers/docker/docker-moby_git.bb  |  29 ++--
 ...rt-go-updates-from-1.19.12-to-1.18.7.patch | 144 ++++++++++++++++++
 ...t-go-updates-from-1.18.7-to-1.17.13.patch} |  35 ++---
 ...avoid-using-strings.Cut-from-go-1.18.patch |  32 ++++
 5 files changed, 218 insertions(+), 49 deletions(-)
 create mode 100644 recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch
 rename recipes-containers/docker/files/{0001-revert-go-1.8-update.patch => 0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch} (97%)
 create mode 100644 recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index a41e83a..76ac41e 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -33,18 +33,20 @@ DESCRIPTION = "Linux container runtime \
 
 SRCREV_docker = "3056208812eb5e792fa99736c9167d1e10f4ab49"
 SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
-SRCREV_cli = "baeda1f82a10204ec5708d5fbba130ad76cfee49"
+SRCREV_cli = "911449ca245308472a3d34a7f1a98b918e65c8c3"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
-	git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
-	file://docker.init \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
-        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
-	"
+    git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
+    git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
+    git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
+    file://0001-libnetwork-use-GO-instead-of-go.patch \
+    file://docker.init \
+    file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=src/import \
+    file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=src/import \
+    file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patchdir=src/import \
+"
 
 DOCKER_COMMIT = "${SRCREV_docker}"
 
@@ -54,7 +56,10 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.21-ce"
+# 58 commits after v20.10.25 to include the fixes for go compatibility after
+# https://lists.openembedded.org/g/openembedded-core/message/185082
+# https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c81952bae6d5
+DOCKER_VERSION = "20.10.25-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index b048208..5f8de07 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,20 +34,22 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_moby = "791d8ab87747169b4cbfcdf2fd57c81952bae6d5"
 SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
-SRCREV_cli = "baeda1f82a10204ec5708d5fbba130ad76cfee49"
+SRCREV_cli = "911449ca245308472a3d34a7f1a98b918e65c8c3"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
-	git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
-	file://docker.init \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
-        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
-    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
-	"
+    git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
+    git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
+    git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
+    file://docker.init \
+    file://0001-libnetwork-use-GO-instead-of-go.patch \
+    file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=src/import \
+    file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=src/import \
+    file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patchdir=src/import \
+"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
 
@@ -57,7 +59,10 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.21"
+# 58 commits after v20.10.25 to include the fixes for go compatibility after
+# https://lists.openembedded.org/g/openembedded-core/message/185082
+# https://github.com/moby/moby/compare/v20.10.25...791d8ab87747169b4cbfcdf2fd57c81952bae6d5
+DOCKER_VERSION = "20.10.25"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch b/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch
new file mode 100644
index 0000000..2a3f3b9
--- /dev/null
+++ b/recipes-containers/docker/files/0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch
@@ -0,0 +1,144 @@
+From 2cc349a336cd3cb4fa33554216a99dbce3879d29 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 14 Aug 2023 16:02:30 +0200
+Subject: [PATCH] Revert go updates from 1.19.12 to 1.18.7
+
+To continue using 1.17 version as implemented for some reason in:
+https://git.yoctoproject.org/meta-virtualization/commit/?h=kirkstone&id=927537108bcf2b98859512ce3eae59a73439994d
+with 0001-revert-go-1.8-update.patch
+
+Revert "update to go1.19.12"
+This reverts commit c42d7c7f6d0dccfe5d85f0126da2c8ec77573616.
+Revert "[20.10] update go to go1.19.11"
+This reverts commit 43fe787c232c54b53bda21301bbf3a463c4e4056.
+Revert "[20.10] update go to go1.19.10"
+This reverts commit 99f10dec91409c4f6ed2c4867638f4e5ea678f0a.
+Revert "Dockerfile: temporarily skip CRIU stage"
+This reverts commit af0477880cc8c0197517c0bc8de0cbd6cb9bd9a9.
+Revert "[20.10] update go to go1.19.9"
+This reverts commit 7f91a52b8969f5604fdca36ee30475cc9600be5b.
+Revert "[20.10] update go to go1.19.8"
+This reverts commit a09b3e9cf9de906438a6300760754fcb087f166a.
+Revert "update to go1.19.7"
+This reverts commit 9aa5d55a8ba8725133a6fbb5ac98d1fab341fdc7.
+Revert "update to go1.19.6"
+This reverts commit 98c9e3f43833bf87c21e02aca77c75c7a475ecd6.
+Revert "update to go1.19.5"
+This reverts commit 5b48f300dd0c6a2bbfc942408bc7e3fbc39609f0.
+Revert "update to go1.19.4"
+This reverts commit 82b0ac1166cc553e2757c5d490ce69078064ef6e.
+Revert "Update to Go 1.19.3 to address CVE-2022-41716"
+This reverts commit 4701ca9f719f5386d2ca2417b566b5950aa8a929.
+Revert "Update to go 1.19.2 to address CVE-2022-2879, CVE-2022-2880, CVE-2022-41715"
+This reverts commit 1c8c16524f94ae69eb33c5c9000e87615ce973a6.
+Revert "Update to go 1.19.1 to address CVE-2022-27664, CVE-2022-32190"
+This reverts commit 6cc1ef32a28e7e6e74383d4775bd178d36495181.
+Revert "update to golang 1.19"
+This reverts commit 5091f13a5d027b785084028aedb03beb5b0bd9a6.
+Revert "Dockerfile: configure code dir as "safe" directory"
+This reverts commit 0312e468da5c99267654d5c6b62785e29ffe6e0d.
+Revert "[20.10] update to go1.18.10"
+This reverts commit 625903f3fda862c69492256016b386628954b3a4.
+Revert "[20.10] update gotestsum to v1.8.2"
+This reverts commit edca413033cea5252f69bfc740e9450e5d0a0ef9.
+Revert "[20.10] update to go1.18.9"
+This reverts commit f8b0d77bfe109c5248ba6eb6c6db7f32e99a2e75.
+Revert "[20.10] update to Go 1.18.8 to address CVE-2022-41716"
+This reverts commit 0211f9e44dba888fa62dc2ba59ea573ad70e9708.
+
+Upstream-Status: Inapropriate
+---
+ Dockerfile                                  | 12 ++----------
+ Dockerfile.e2e                              |  2 +-
+ Dockerfile.simple                           |  2 +-
+ Dockerfile.windows                          |  4 ++--
+ hack/dockerfile/install/gotestsum.installer |  2 +-
+ 5 files changed, 7 insertions(+), 15 deletions(-)
+
+diff --git a/Dockerfile b/Dockerfile
+index 4ee4d8dd2c..9472c512a6 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -3,7 +3,7 @@
+ ARG CROSS="false"
+ ARG SYSTEMD="false"
+ # IMPORTANT: When updating this please note that stdlib archive/tar pkg is vendored
+-ARG GO_VERSION=1.19.12
++ARG GO_VERSION=1.18.7
+ ARG DEBIAN_FRONTEND=noninteractive
+ ARG VPNKIT_VERSION=0.5.0
+ ARG DOCKER_BUILDTAGS="apparmor seccomp"
+@@ -267,9 +267,6 @@ RUN ln -sfv /go/src/github.com/docker/docker/.bashrc ~/.bashrc
+ RUN echo "source /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc
+ RUN ln -s /usr/local/completion/bash/docker /etc/bash_completion.d/docker
+ RUN ldconfig
+-# Set dev environment as safe git directory to prevent "dubious ownership" errors
+-# when bind-mounting the source into the dev-container. See https://github.com/moby/moby/pull/44930
+-RUN git config --global --add safe.directory $GOPATH/src/github.com/docker/docker
+ # This should only install packages that are specifically needed for the dev environment and nothing else
+ # Do you really need to add another package here? Can it be done in a different build stage?
+ RUN --mount=type=cache,sharing=locked,id=moby-dev-aptlib,target=/var/lib/apt \
+@@ -316,12 +313,7 @@ COPY --from=swagger       /build/ /usr/local/bin/
+ COPY --from=tomlv         /build/ /usr/local/bin/
+ COPY --from=tini          /build/ /usr/local/bin/
+ COPY --from=registry      /build/ /usr/local/bin/
+-
+-# Skip the CRIU stage for now, as the opensuse package repository is sometimes
+-# unstable, and we're currently not using it in CI.
+-#
+-# FIXME(thaJeztah): re-enable this stage when https://github.com/moby/moby/issues/38963 is resolved (see https://github.com/moby/moby/pull/38984)
+-# COPY --from=criu          /build/ /usr/local/
++COPY --from=criu          /build/ /usr/local/
+ COPY --from=vndr          /build/ /usr/local/bin/
+ COPY --from=gotestsum     /build/ /usr/local/bin/
+ COPY --from=golangci_lint /build/ /usr/local/bin/
+diff --git a/Dockerfile.e2e b/Dockerfile.e2e
+index 31f836fc16..f92bec85b0 100644
+--- a/Dockerfile.e2e
++++ b/Dockerfile.e2e
+@@ -1,4 +1,4 @@
+-ARG GO_VERSION=1.19.12
++ARG GO_VERSION=1.18.7
+ 
+ FROM golang:${GO_VERSION}-alpine AS base
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.simple b/Dockerfile.simple
+index af5fc13c25..8aa6d7ff94 100644
+--- a/Dockerfile.simple
++++ b/Dockerfile.simple
+@@ -5,7 +5,7 @@
+ 
+ # This represents the bare minimum required to build and test Docker.
+ 
+-ARG GO_VERSION=1.19.12
++ARG GO_VERSION=1.18.7
+ 
+ FROM golang:${GO_VERSION}-buster
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.windows b/Dockerfile.windows
+index 7c2fe66389..6f8242decc 100644
+--- a/Dockerfile.windows
++++ b/Dockerfile.windows
+@@ -165,8 +165,8 @@ FROM microsoft/windowsservercore
+ # Use PowerShell as the default shell
+ SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
+ 
+-ARG GO_VERSION=1.19.12
+-ARG GOTESTSUM_VERSION=v1.8.2
++ARG GO_VERSION=1.18.7
++ARG GOTESTSUM_VERSION=v1.7.0
+ 
+ # Environment variable notes:
+ #  - GO_VERSION must be consistent with 'Dockerfile' used by Linux.
+diff --git a/hack/dockerfile/install/gotestsum.installer b/hack/dockerfile/install/gotestsum.installer
+index 8e88fec77b..5024179958 100755
+--- a/hack/dockerfile/install/gotestsum.installer
++++ b/hack/dockerfile/install/gotestsum.installer
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ 
+-: ${GOTESTSUM_VERSION:=v1.8.2}
++: ${GOTESTSUM_VERSION:=v1.7.0}
+ 
+ install_gotestsum() (
+ 	set -e
diff --git a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch
similarity index 97%
rename from recipes-containers/docker/files/0001-revert-go-1.8-update.patch
rename to recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch
index 0298c31..7cacccb 100644
--- a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
+++ b/recipes-containers/docker/files/0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch
@@ -1,8 +1,7 @@
 From 575302e9c6567b8547b308b2b0c6a07b27e3be3b Mon Sep 17 00:00:00 2001
 From: Adrian Freihofer <adrian.freihofer@siemens.com>
 Date: Sun, 4 Dec 2022 18:02:54 +0100
-Subject: [PATCH] Revert "Merge pull request #43976 from
- thaJeztah/20.10_backport_bump_golang_1.18"
+Subject: [PATCH] Revert go updates from 1.18.7 to 1.17.13
 
 Upstream-Status: Inapropriate
 
@@ -25,12 +24,11 @@ changes made to 32debe0986f4516bfe17bf9122447f0c735e61b4.
  vendor/archive/tar/reader_test.go     |  30 +++---
  vendor/archive/tar/stat_actime1.go    |   1 +
  vendor/archive/tar/stat_actime2.go    |   1 +
- vendor/archive/tar/stat_unix.go       |   1 +
  vendor/archive/tar/strconv.go         |  43 +++++---
  vendor/archive/tar/tar_test.go        |   2 +-
  vendor/archive/tar/writer.go          |  89 ++++++++---------
  vendor/archive/tar/writer_test.go     |  24 +++--
- 18 files changed, 251 insertions(+), 312 deletions(-)
+ 17 files changed, 250 insertions(+), 312 deletions(-)
  delete mode 100644 vendor/archive/tar/fuzz_test.go
 
 diff --git a/Dockerfile b/Dockerfile
@@ -109,10 +107,10 @@ index c34a5add11..50ed9293c1 100644
  
  var generatedTempl = template.Must(template.New("rpc_cient").Funcs(templFuncs).Parse(`
 diff --git a/vendor/archive/tar/common.go b/vendor/archive/tar/common.go
-index c99b5c1920..c667cfc872 100644
+index f6d701d925..8706ede431 100644
 --- a/vendor/archive/tar/common.go
 +++ b/vendor/archive/tar/common.go
-@@ -316,10 +316,10 @@ func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry {
+@@ -319,10 +319,10 @@ func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry {
  // fileState tracks the number of logical (includes sparse holes) and physical
  // (actual in tar archive) bytes remaining for the current file.
  //
@@ -126,7 +124,7 @@ index c99b5c1920..c667cfc872 100644
  }
  
  // allowedFormats determines which formats can be used.
-@@ -413,22 +413,22 @@ func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err
+@@ -416,22 +416,22 @@ func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err
  
  	// Check basic fields.
  	var blk block
@@ -165,7 +163,7 @@ index c99b5c1920..c667cfc872 100644
  
  	// Check for header-only types.
  	var whyOnlyPAX, whyOnlyGNU string
-@@ -538,7 +538,7 @@ type headerFileInfo struct {
+@@ -541,7 +541,7 @@ type headerFileInfo struct {
  func (fi headerFileInfo) Size() int64        { return fi.h.Size }
  func (fi headerFileInfo) IsDir() bool        { return fi.Mode().IsDir() }
  func (fi headerFileInfo) ModTime() time.Time { return fi.h.ModTime }
@@ -474,7 +472,7 @@ index e73e0d2609..0000000000
 -	})
 -}
 diff --git a/vendor/archive/tar/reader.go b/vendor/archive/tar/reader.go
-index e609c15f27..f645af8016 100644
+index 45848304ed..ca32bdea1f 100644
 --- a/vendor/archive/tar/reader.go
 +++ b/vendor/archive/tar/reader.go
 @@ -65,7 +65,7 @@ func (tr *Reader) next() (*Header, error) {
@@ -821,20 +819,8 @@ index f76d6be220..5a9a35cbb4 100644
  
  package tar
  
-diff --git a/vendor/archive/tar/stat_unix.go b/vendor/archive/tar/stat_unix.go
-index b743c76b8c..4a5bca0312 100644
---- a/vendor/archive/tar/stat_unix.go
-+++ b/vendor/archive/tar/stat_unix.go
-@@ -3,6 +3,7 @@
- // license that can be found in the LICENSE file.
- 
- //go:build aix || linux || darwin || dragonfly || freebsd || openbsd || netbsd || solaris
-+// +build aix linux darwin dragonfly freebsd openbsd netbsd solaris
- 
- package tar
- 
 diff --git a/vendor/archive/tar/strconv.go b/vendor/archive/tar/strconv.go
-index 275db6f026..f0b61e6dba 100644
+index ac3196370e..fde45c9dbf 100644
 --- a/vendor/archive/tar/strconv.go
 +++ b/vendor/archive/tar/strconv.go
 @@ -14,7 +14,7 @@ import (
@@ -916,7 +902,7 @@ index 275db6f026..f0b61e6dba 100644
  
  	if !validPAXRecord(k, v) {
  		return "", "", s, ErrHeader
-@@ -314,7 +333,7 @@ func formatPAXRecord(k, v string) (string, error) {
+@@ -315,7 +334,7 @@ func formatPAXRecord(k, v string) (string, error) {
  // for the PAX version of the USTAR string fields.
  // The key must not contain an '=' character.
  func validPAXRecord(k, v string) bool {
@@ -1213,6 +1199,3 @@ index 640264984a..4e709e5cac 100644
  				}
  			default:
  				t.Fatalf("test %d.%d, unknown test operation: %T", i, j, tf)
--- 
-2.38.1
-
diff --git a/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch b/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch
new file mode 100644
index 0000000..0574d9e
--- /dev/null
+++ b/recipes-containers/docker/files/0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch
@@ -0,0 +1,32 @@
+From 6867fc1f6bd01596c2d3dc7bc07e26fa98965185 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 14 Aug 2023 16:41:42 +0200
+Subject: [PATCH] builder.go: avoid using strings.Cut from go-1.18
+
+* we're still using go-1.17
+
+Upstream-Status: Inapropriate
+---
+ builder/builder-next/builder.go | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/builder/builder-next/builder.go b/builder/builder-next/builder.go
+index ee6b9f0fb1..a9bda8c370 100644
+--- a/builder/builder-next/builder.go
++++ b/builder/builder-next/builder.go
+@@ -555,10 +555,13 @@ func toBuildkitExtraHosts(inp []string, hostGatewayIP net.IP) (string, error) {
+ 	}
+ 	hosts := make([]string, 0, len(inp))
+ 	for _, h := range inp {
+-		host, ip, ok := strings.Cut(h, ":")
+-		if !ok || host == "" || ip == "" {
++		parts := strings.Split(h, ":")
++
++		if len(parts) != 2 || parts[0] == "" || parts[1] == "" {
+ 			return "", errors.Errorf("invalid host %s", h)
+ 		}
++		host := parts[0]
++		ip := parts[1]
+ 		// If the IP Address is a "host-gateway", replace this value with the
+ 		// IP address stored in the daemon level HostGatewayIP config variable.
+ 		if ip == opts.HostGatewayName {
-- 
2.41.0


