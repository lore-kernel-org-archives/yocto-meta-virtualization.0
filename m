Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A21C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 18:30:24 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1988.1676658619348319798
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 10:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QVACMyNy;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id er25so7373683edb.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiZuNTZHwRfEZD46DyfK8OvTr3/C3h5Huf46fjhy03U=;
        b=QVACMyNyY7+oWAeeJOWJzHa1hQog2BoIJ0tGeRygSHqP2x+gv/4PMzZjhh6674O5iq
         5JO7jAxh6PottH3IMd9ex+ohS/GahWsGsUH4uQvMzFn+suas5KVhTMshPiqeORdOiVY+
         Z80k+AennZQHXP5+ZNRxBpFxOrtep7rSaH45YE+YnJh3IickrRoyLn9wJ10D8MTkA9dv
         Hrre8fLy99Pg1+cZRZJX5MzAtm0MRI68fiEfhN4Temf2Z+YCAhcdXBjey4OM2nCt7cOY
         61uG1NGkh1IDsoqOCQXoRX1geQnuXHOXrVipFbfgtY4VPcWrkT+xiTP89ceqFNA+nBmJ
         /HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiZuNTZHwRfEZD46DyfK8OvTr3/C3h5Huf46fjhy03U=;
        b=fenMUawTirzAamMzVvdwOWQAn+BuMVqVf/0dHHLaKckNAuqpnR3AQFEpcWDMcLoCoO
         Bw5oeuWb0+mJj+CAjnd3cXLTHhhGrHFsjmle99DyLAMwHvriGvZKESxAcfuSVHyfuJ3E
         tIsz72KTlkP0ChZRJKJ8+Orc60o6cq5NVH+vZD7V45pybYbPTN1kAjlo4pCtP2bYVYPx
         vsulyAbxf4bnuxbM4mAzJGkWkKw5b5ANB8swf3iHaUP5L1u6LDC8egcYu1J0eImanfgA
         TyqHfQh3PdH7yuHH4pKpbaRHiJ9V/ywI3QmNjavOVPab4n6XK9gLJmYNVRbPUdy9j0Aw
         aIxw==
X-Gm-Message-State: AO0yUKXNiN8+oi6Q9j60Jp2hcbr5eC5815xAbzGdbPxJSUH2b1r/+Gms
	WcZZgYUzZ/+18WkCne7DNblUzfsdh+4=
X-Google-Smtp-Source: AK7set99LqJyXOg+0c1urmDuo4fomOkVawa+DnD48fByx6iSfElLzkXBw6Ga9g3SCNDfsBsV5FDfWA==
X-Received: by 2002:a17:907:8d14:b0:8aa:c5d9:cabf with SMTP id tc20-20020a1709078d1400b008aac5d9cabfmr6450846ejc.3.1676658617488;
        Fri, 17 Feb 2023 10:30:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709060d8800b0084d381d0528sm2412817eji.180.2023.02.17.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:30:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] docker-*: prevent -march being exported in arm builds
Date: Fri, 17 Feb 2023 19:30:10 +0100
Message-Id: <20230217183010.3427667-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 18:30:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7878

* don't export CGO_CFLAGS/CGO_CXXFLAGS like the previous version
  didn't before:
  https://git.yoctoproject.org/meta-virtualization/commit/?id=aceed7bf95cc8a42c8f470d8edf3c6f03d49da00

* both docker-moby and docker-ce have the same issue as shown with
  qemuarm build:
  docker-moby: http://errors.yoctoproject.org/Errors/Details/690021/
  docker-ce: http://errors.yoctoproject.org/Errors/Details/690020/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb    |   2 +-
 recipes-containers/docker/docker-moby_git.bb  |   2 +-
 ...0001-dynbinary-use-go-cross-compiler.patch | 104 ++++++++++++++++--
 3 files changed, 97 insertions(+), 11 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 0f43da6..b9888d2 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -41,7 +41,7 @@ SRC_URI = "\
 	git://github.com/docker/cli;branch=23.0;name=cli;destsuffix=git/cli;protocol=https \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
 	file://docker.init \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
+        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
 	"
 
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 19f4763..17cd316 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -45,7 +45,7 @@ SRC_URI = "\
 	file://docker.init \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-        file://0001-dynbinary-use-go-cross-compiler.patch \
+        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
index c10e69d..ea8f4c5 100644
--- a/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
+++ b/recipes-containers/docker/files/0001-dynbinary-use-go-cross-compiler.patch
@@ -1,20 +1,106 @@
-From bbf600cc4d46c3f7ec0c1b486790a2402d41f550 Mon Sep 17 00:00:00 2001
+From 3ce6089417b8c6c4e8279e6ef60213436ebf8793 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Tue, 30 Jun 2020 22:23:33 -0400
 Subject: [PATCH] dynbinary: use go cross compiler
 
+MJ: use ${GO} also in "go env" calls, because native go:
+  $ go env GOARM
+  5
+while go cross compiler for my target:
+  $ ${GO} env GOARM
+  7
+this can lead to:
+  error: switch '-mcpu=cortex-a9' conflicts with switch '-march=armv5t' [-Werror]
+
+but even after fixing it to use "better" -march it still doesn't match with -mcpu
+set in our GOBUILDFLAGS, causing e.g.:
+  error: switch '-mcpu=cortex-a9' conflicts with switch '-march=armv7-a+simd' [-Werror]
+
+so drop CGO_CFLAGS/CGO_CXXFLAGS as in OE builds we don't need them
+as long as ${GO} and GOBUILDFLAGS are respected
+
+it was added in:
+https://github.com/moby/moby/commit/12558c8d6ea9f388b54eb94ba6b9eb4a9fc5c9f2
+
+and it wasn't an issue before:
+https://github.com/moby/moby/commit/8c12a6648b368cc2acaea0339d6c57c920ed265c
+
+because it was using 'case "${GOARM}" in' and ${GOARM} was empty in our builds
+
 Upstream-Status: Inappropriate [embedded specific]
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- hack/make/.binary | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: git/src/import/hack/make/.binary
-===================================================================
---- git.orig/src/import/hack/make/.binary
-+++ git/src/import/hack/make/.binary
-@@ -66,7 +66,7 @@
+ hack/make/.binary | 37 ++++++++-----------------------------
+ 1 file changed, 8 insertions(+), 29 deletions(-)
+
+diff --git a/hack/make/.binary b/hack/make/.binary
+index 39c00cd50c..de32ad1cc7 100644
+--- a/hack/make/.binary
++++ b/hack/make/.binary
+@@ -3,7 +3,7 @@ set -e
+ 
+ # a helper to provide ".exe" when it's appropriate
+ binary_extension() {
+-	if [ "$(go env GOOS)" = 'windows' ]; then
++	if [ "$(${GO} env GOOS)" = 'windows' ]; then
+ 		echo -n '.exe'
+ 	fi
+ }
+@@ -16,33 +16,12 @@ source "${MAKEDIR}/.go-autogen"
+ (
+ 	export GOGC=${DOCKER_BUILD_GOGC:-1000}
+ 
+-	if [ "$(go env GOOS)/$(go env GOARCH)" != "$(go env GOHOSTOS)/$(go env GOHOSTARCH)" ]; then
+-		# must be cross-compiling!
+-		if [ "$(go env GOOS)/$(go env GOARCH)" = "linux/arm" ]; then
+-			# specify name of the target ARM architecture
+-			case "$(go env GOARM)" in
+-				5)
+-					export CGO_CFLAGS="-march=armv5t"
+-					export CGO_CXXFLAGS="-march=armv5t"
+-					;;
+-				6)
+-					export CGO_CFLAGS="-march=armv6"
+-					export CGO_CXXFLAGS="-march=armv6"
+-					;;
+-				7)
+-					export CGO_CFLAGS="-march=armv7-a"
+-					export CGO_CXXFLAGS="-march=armv7-a"
+-					;;
+-			esac
+-		fi
+-	fi
+-
+ 	# -buildmode=pie is not supported on Windows arm64 and Linux mips*, ppc64be
+ 	# https://github.com/golang/go/blob/go1.19.4/src/cmd/internal/sys/supported.go#L125-L132
+ 	if ! [ "$DOCKER_STATIC" = "1" ]; then
+ 		# -buildmode=pie not supported when -race is enabled
+ 		if [[ " $BUILDFLAGS " != *" -race "* ]]; then
+-			case "$(go env GOOS)/$(go env GOARCH)" in
++			case "$(${GO} env GOOS)/$(${GO} env GOARCH)" in
+ 				windows/arm64 | linux/mips* | linux/ppc64) ;;
+ 				*)
+ 					BUILDFLAGS+=("-buildmode=pie")
+@@ -54,11 +33,11 @@ source "${MAKEDIR}/.go-autogen"
+ 	# only necessary for non-sandboxed invocation where TARGETPLATFORM is empty
+ 	PLATFORM_NAME=$TARGETPLATFORM
+ 	if [ -z "$PLATFORM_NAME" ]; then
+-		PLATFORM_NAME="$(go env GOOS)/$(go env GOARCH)"
+-		if [ -n "$(go env GOARM)" ]; then
+-			PLATFORM_NAME+="/v$(go env GOARM)"
+-		elif [ -n "$(go env GOAMD64)" ] && [ "$(go env GOAMD64)" != "v1" ]; then
+-			PLATFORM_NAME+="/$(go env GOAMD64)"
++		PLATFORM_NAME="$(${GO} env GOOS)/$(${GO} env GOARCH)"
++		if [ -n "$(${GO} env GOARM)" ]; then
++			PLATFORM_NAME+="/v$(${GO} env GOARM)"
++		elif [ -n "$(${GO} env GOAMD64)" ] && [ "$(${GO} env GOAMD64)" != "v1" ]; then
++			PLATFORM_NAME+="/$(${GO} env GOAMD64)"
+ 		fi
+ 	fi
+ 
+@@ -66,7 +45,7 @@ source "${MAKEDIR}/.go-autogen"
  	if [ -n "$DOCKER_DEBUG" ]; then
  		set -x
  	fi
-- 
2.39.2


