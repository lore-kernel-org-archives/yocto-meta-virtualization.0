Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9420C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 18:56:25 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.2104.1738263384417910089
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 10:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1MPusPQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7bcf32a6582so108610985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738263383; x=1738868183; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RyqhQLSjL/p/j63cWVVuAiQnV1+81FbGzqcfwRjR1Oc=;
        b=m1MPusPQGMSqnHlTLKrazXpr+zz873R2YbYQL1uN5fQSZle8XKhNnGtZj3TYxAY9LD
         Nh8bXwqRJ9PKt3291Zm+0BD6GwGQ+cHiP3lfsGPqyoK/kTTUSlJ3+OZn+fPosjLi1i89
         d5D0xhMv/e7hX+gVW72L6mrEGrWty+RDc0Jfu9xPlOpqO6Yb3tO6DscFl3Lah6EfCuEr
         6Zgb5L2DkLoBXd8c8W3IoqFdnvUSBJK0PDpK9JZO46fY2Sw6KoKEFwZKWgBroYPL1nCy
         UyYQ5PsfOtBfYH/7uXMTt5WzETq73Bxrbef0n+iVbVk68sFcvb2JK1WEMBPBX2f1WoKI
         zTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738263383; x=1738868183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyqhQLSjL/p/j63cWVVuAiQnV1+81FbGzqcfwRjR1Oc=;
        b=lDPaQsYXA+BirKaAuYCoavEKg3Bo000Quji45+BjEElNgG2Uvy+mzp1/A3s51x9bLp
         oizEfP2zgCsJ+ZjzpsqglJSeUDyRKVxmnqDhOVOt0nDykBeNQD73GzOX8kAAx9c4ugX0
         /APHTE8Te9oXMGyvpuH18yq+gmkULf+CAYpRZB1bWw5gBdID+4HQmuQqthRho3dW6ulF
         2hLDadEEwe+VXOucymrfSQ/FNPnsGcRRWeKj4KkhjOhDlbmw2Ls7zWSOqzcZyKGRCAA8
         djFdkLiyxZdr+OhN4WhQJ4jKNY2iPUTYPVE9JJXmJm00k1+wqtBuADN7S9Pr3unL9TNs
         +GZA==
X-Gm-Message-State: AOJu0YxZH31G04kVs9melZ85k/u0Vl7JD9SkFDmisWEaYQSPGZveT2fU
	N4/GyZt5ZErI8dCZ4qqzA+zwx2xrPdCu4uRSZG8wIFutK6JL2Hj5d/1xkEu/k/w=
X-Gm-Gg: ASbGnctDtVhoG10IfJELE0lxuvG4JsYUgH4IRK52ZVvA05bQA124VO4Ov3T2uwpHeFq
	LygvjW/L7U6CwQy0BbULUC600QNeJlOhLNfp/Nlzev898uL9GzvEkc8q/oVkAWlyQgOzUYeNWn+
	WCisxcgHtNxxvzACXUrFnT4dLqCLxte6XhcI3oaQBjsICjVdx1rFwPdVs6r4lJfb5j1bLVSFKzT
	qA9J51ooAKkyWDhb6e7IcmvmO4LMCWdZPYuu70MSGBDhC+SQwTnpXU1FcE85zqfLMnjyFP8HsdZ
	wA+XZlYsMEdCxvw6eyhkvH79RnB4xhcfd6IIrJqj5Iv04w7kMEYCbjZ+FTmoZreDx/NXKQ==
X-Google-Smtp-Source: AGHT+IHNfqNjduTNkGRufxEIJ3ySuOvgMkjAIW8ra0L3tw5Oz1iAYGaGzzxr6+RXmx4q0beDiN2DFQ==
X-Received: by 2002:a05:620a:3706:b0:7b6:6e7c:8efc with SMTP id af79cd13be357-7bffcd95828mr1365667385a.44.1738263383282;
        Thu, 30 Jan 2025 10:56:23 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90ce08sm100143885a.97.2025.01.30.10.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:56:22 -0800 (PST)
Date: Thu, 30 Jan 2025 18:56:20 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade
 1.1.4 -> 1.1.12
Message-ID: <Z5vLVAx4FJPTNmZU@gmail.com>
References: <20250120022539.3172433-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120022539.3172433-1-divya.chellam@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Jan 2025 18:56:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9115

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.4 -> 1.1.12
on 20/01/2025 dchellam via lists.yoctoproject.org wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
> 
> This upgrade fixes a few CVEs:
> - CVE-2023-27561
> - CVE-2023-25809
> - CVE-2023-28642
> - CVE-2024-21626 and other bug fixes
> 
> Changelog:
> ==========
> https://github.com/opencontainers/runc/blob/v1.1.12/CHANGELOG.md
> 
> Adjusted existing patches to align with v1.1.12
> 
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  ...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 26 +++++++++-------
>  ...001-runc-Add-console-socket-dev-null.patch | 13 +++++---
>  .../0001-runc-docker-SIGUSR1-daemonize.patch  | 31 ++++++++++---------
>  recipes-containers/runc/runc-docker_git.bb    | 10 +++---
>  4 files changed, 45 insertions(+), 35 deletions(-)
> 
> diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> index 4d35e58e..79e63322 100644
> --- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> +++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> @@ -1,7 +1,7 @@
>  From 0fe50d2ca4517f5e3070585040f35ace413acd44 Mon Sep 17 00:00:00 2001
>  From: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Date: Tue, 24 Aug 2021 11:38:23 -0400
> -Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty 
>   from static
>  
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> @@ -11,16 +11,20 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>  
> -Index: git/src/import/Makefile
> -===================================================================
> ---- git.orig/src/import/Makefile
> -+++ git/src/import/Makefile
> -@@ -20,7 +20,7 @@
> - 		endif
> +diff --git a/Makefile b/Makefile
> +index e3af9bc1..f9d6de96 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -24,8 +24,7 @@ ifneq (,$(filter $(GOARCH),386 amd64 arm arm64 ppc64le riscv64 s390x))
> + 		GO_BUILDMODE := "-buildmode=pie"
>   	endif
>   endif
> --GO_BUILD := $(GO) build -trimpath $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
> +-GO_BUILD := $(GO) build -trimpath $(GO_BUILDMODE) \
> +-	$(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
>  +GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
> - 	-ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
> - GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
> - 	-ldflags "-extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
> + 	-ldflags "$(LDFLAGS_COMMON) $(EXTRA_LDFLAGS)"
> + 
> + GO_BUILDMODE_STATIC :=
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
> index bcf4c103..2a24df90 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
> @@ -12,11 +12,11 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>   utils_linux.go | 5 +++++
>   1 file changed, 5 insertions(+)
>  
> -Index: git/src/import/utils_linux.go
> -===================================================================
> ---- git.orig/src/import/utils_linux.go
> -+++ git/src/import/utils_linux.go
> -@@ -267,6 +267,11 @@
> +diff --git a/utils_linux.go b/utils_linux.go
> +index 60d534e8..ddcab62f 100644
> +--- a/utils_linux.go
> ++++ b/utils_linux.go
> +@@ -234,6 +234,11 @@ type runner struct {
>   }
>   
>   func (r *runner) run(config *specs.Process) (int, error) {
> @@ -28,3 +28,6 @@ Index: git/src/import/utils_linux.go
>   	var err error
>   	defer func() {
>   		if err != nil {
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
> index 4350c40f..1065f23e 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
> @@ -25,15 +25,15 @@ is set.
>  
>  Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>  ---
> - signals.go     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++----
> + signals.go     | 56 ++++++++++++++++++++++++++++++++++++++++++++++----
>   utils_linux.go |  2 +-
> - 2 files changed, 51 insertions(+), 5 deletions(-)
> + 2 files changed, 53 insertions(+), 5 deletions(-)
>  
> -Index: git/src/import/signals.go
> -===================================================================
> ---- git.orig/src/import/signals.go
> -+++ git/src/import/signals.go
> -@@ -5,7 +5,9 @@
> +diff --git a/signals.go b/signals.go
> +index 2555b765..1266ee66 100644
> +--- a/signals.go
> ++++ b/signals.go
> +@@ -3,7 +3,9 @@ package main
>   import (
>   	"os"
>   	"os/signal"
> @@ -43,7 +43,7 @@ Index: git/src/import/signals.go
>   	"github.com/opencontainers/runc/libcontainer"
>   	"github.com/opencontainers/runc/libcontainer/system"
>   	"github.com/opencontainers/runc/libcontainer/utils"
> -@@ -55,9 +57,6 @@
> +@@ -53,9 +55,6 @@ type signalHandler struct {
>   func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach bool) (int, error) {
>   	// make sure we know the pid of our main process so that we can return
>   	// after it dies.
> @@ -53,7 +53,7 @@ Index: git/src/import/signals.go
>   
>   	pid1, err := process.Pid()
>   	if err != nil {
> -@@ -67,12 +66,61 @@
> +@@ -65,12 +64,61 @@ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach
>   	if h.notifySocket != nil {
>   		if detach {
>   			_ = h.notifySocket.run(pid1)
> @@ -116,11 +116,11 @@ Index: git/src/import/signals.go
>   	// Perform the initial tty resize. Always ignore errors resizing because
>   	// stdout might have disappeared (due to races with when SIGHUP is sent).
>   	_ = tty.resize()
> -Index: git/src/import/utils_linux.go
> -===================================================================
> ---- git.orig/src/import/utils_linux.go
> -+++ git/src/import/utils_linux.go
> -@@ -345,7 +345,7 @@
> +diff --git a/utils_linux.go b/utils_linux.go
> +index ddcab62f..280051ea 100644
> +--- a/utils_linux.go
> ++++ b/utils_linux.go
> +@@ -315,7 +315,7 @@ func (r *runner) run(config *specs.Process) (int, error) {
>   	if err != nil {
>   		r.terminate(process)
>   	}
> @@ -129,3 +129,6 @@ Index: git/src/import/utils_linux.go
>   		return 0, nil
>   	}
>   	if err == nil {
> +-- 
> +2.40.0
> +
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 97373a72..afecac67 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>  
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
> +SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
>  SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
> -           file://0001-runc-Add-console-socket-dev-null.patch \
> -           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
> -           file://0001-runc-docker-SIGUSR1-daemonize.patch \
> +           file://0001-runc-Add-console-socket-dev-null.patch;patchdir=src/import \
> +           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=src/import \
> +           file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=src/import \
>            "
>  
> -RUNC_VERSION = "1.1.4"
> +RUNC_VERSION = "1.1.12"
>  
>  CVE_PRODUCT = "runc"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9100): https://lists.yoctoproject.org/g/meta-virtualization/message/9100
> Mute This Topic: https://lists.yoctoproject.org/mt/110709071/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


