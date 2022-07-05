Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7BEC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 20:26:51 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.88969.1657052807276989838
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 13:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Negh7StP;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id b125so9601033qkg.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YIbkEYl9woQo1XwiUko77ooZovXrolVSqkqhxKWHxX8=;
        b=Negh7StPC2ZEUYrPQLM/7z+Sup5F7gVUNOz+UgxjZg8Wehn75UjfAuZNRP0ITwlZqE
         Wwoy/Mo42kA//B6nq/AhK1Mfonlsq1NVBcu8sArLm1TbRWkP3dR5KaOL7ef3YGcxzon3
         gi+Fd9TD+Ufj+XV1BL9IdOU2CF0ql/PxrijpP55UJNBgWt4Lj8SDKJ5Kit7s+qI+KwCD
         yuXNz/zOhVb8H9qksUOsaYEDtn7XAtGrNAZSWBVSzo7GlfoPEKP780//4v7e2yN5+zu8
         oPIwG12PyHSEI98R/9WMLefFpG6LK9/Km+zmuDr+2pH/mkF1axrGeIw7b+xDIcmW8Ay/
         DfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YIbkEYl9woQo1XwiUko77ooZovXrolVSqkqhxKWHxX8=;
        b=TyMlPLw0tQU2WN9SBnf82Wq4S2IRxiulJiR5ysXND+qJmflBgRusqxu/ZKCZTaHaWf
         oHL1UogSlIkwOujNRptodWz/BXzPoEvvZvYA2kD4msv7W7c+q/V7bIMC9gzFWuFlksLa
         9EA0B8sLB8oHedD7wBu8zPyoVY4cBrW7JpY/NKlxBNIKOXr2eRvqcj29bULQFEQ3m1OJ
         2fgwVXwwshGmXkS4cFxKLigZCOga6x1YVVate7CGdCxo7irgjKKC79iYPYFxwJqqyaVc
         NzZX71fDape9PS9WMuTtd6oZymK8NWDJPPzRrk0gocWwJk7QJXITgv0tR8oIOusJDYdK
         Rc5A==
X-Gm-Message-State: AJIora/ktcW9qqmWOhu1FQDxf2TKnaANsis+06oy6XLW/Thd+KRTlQnC
	JOfNmfbz0oDOslDXyBP0er0=
X-Google-Smtp-Source: 
 AGRyM1ss9orDVpmvlu3QZQP20J1A7+kSk6wCSKJDuzrs1FdORZdUp7of2y/JkYOZjdUBRs4sDhcPNw==
X-Received: by 2002:a05:620a:3712:b0:6af:4a37:1a11 with SMTP id
 de18-20020a05620a371200b006af4a371a11mr25305331qkb.418.1657052806201;
        Tue, 05 Jul 2022 13:26:46 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 194-20020a370acb000000b006a8b6848556sm27639080qkk.7.2022.07.05.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:26:45 -0700 (PDT)
Date: Tue, 5 Jul 2022 16:26:43 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/3] podman: Fix host
 contamination
Message-ID: <20220705202642.GB24762@gmail.com>
References: <20220705101830.1729681-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705101830.1729681-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 20:26:51 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7408

merged to kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/3] podman: Fix host contamination
on 05/07/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> The project's internal Makefile uses BUILDFLAGS variable to pass
> arguments to `go build` while Yocto/OE defines it as GOBUILDFLAGS. Add a
> patch to align this and avoid using host headers in which case, a musl
> build will fail similarly to:
> 
> | [...]ld: /tmp/go-link-3172010154/000015.o: in function `vfprintf':
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:130: undefined reference to `__vfprintf_chk'
> | [...]ld: /tmp/go-link-3172010154/000016.o: in function `fprintf':
> | /usr/include/x86_64-linux-gnu/bits/stdio2.h:100: undefined reference to `__fprintf_chk'
> | collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 125 ++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |   1 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> 
> diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> new file mode 100644
> index 0000000..13a736e
> --- /dev/null
> +++ b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> @@ -0,0 +1,125 @@
> +From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
> +Date: Tue, 5 Jul 2022 11:51:56 +0200
> +Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
> +
> +Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefile
> +uses BUILDFLAGS. Align them accordingly.
> +
> +See go.bbclass for more information.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + Makefile | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index cb230d8e9..538b28d41 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -69,7 +69,7 @@ PRE_COMMIT = $(shell command -v bin/venv/bin/pre-commit ~/.local/bin/pre-commit
> + # triggered.
> + SOURCES = $(shell find . -path './.*' -prune -o \( \( -name '*.go' -o -name '*.c' \) -a ! -name '*_test.go' \) -print)
> + 
> +-BUILDFLAGS := -mod=vendor $(BUILDFLAGS)
> ++GOBUILDFLAGS := -mod=vendor $(GOBUILDFLAGS)
> + 
> + BUILDTAGS_CROSS ?= containers_image_openpgp exclude_graphdriver_btrfs exclude_graphdriver_devicemapper exclude_graphdriver_overlay
> + CONTAINER_RUNTIME := $(shell command -v podman 2> /dev/null || echo docker)
> +@@ -264,11 +264,11 @@ gofmt: ## Verify the source code gofmt
> + 
> + .PHONY: test/checkseccomp/checkseccomp
> + test/checkseccomp/checkseccomp: .gopathok $(wildcard test/checkseccomp/*.go)
> +-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> ++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> + 
> + .PHONY: test/testvol/testvol
> + test/testvol/testvol: .gopathok $(wildcard test/testvol/*.go)
> +-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/testvol
> ++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/testvol
> + 
> + .PHONY: volume-plugin-test-image
> + volume-plugin-test-img:
> +@@ -276,7 +276,7 @@ volume-plugin-test-img:
> + 
> + .PHONY: test/goecho/goecho
> + test/goecho/goecho: .gopathok $(wildcard test/goecho/*.go)
> +-	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
> ++	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
> + 
> + test/version/version: .gopathok version/version.go
> + 	$(GO) build -o $@ ./test/version/
> +@@ -318,7 +318,7 @@ ifeq (,$(findstring systemd,$(BUILDTAGS)))
> + 		distro for journald support."
> + endif
> + 	$(GOCMD) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> + 		-tags "$(BUILDTAGS)" \
> + 		-o $@ ./cmd/podman
> +@@ -329,14 +329,14 @@ $(SRCBINDIR):
> + 
> + $(SRCBINDIR)/podman$(BINSFX): $(SRCBINDIR) .gopathok $(SOURCES) go.mod go.sum
> + 	$(GOCMD) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> + 		-tags "${REMOTETAGS}" \
> + 		-o $@ ./cmd/podman
> + 
> + $(SRCBINDIR)/podman-remote-static: $(SRCBINDIR) .gopathok $(SOURCES) go.mod go.sum
> + 	$(GOCMD) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
> + 		-tags "${REMOTETAGS}" \
> + 		-o $@ ./cmd/podman
> +@@ -371,7 +371,7 @@ podman-winpath: .gopathok $(SOURCES) go.mod go.sum
> + 	CGO_ENABLED=0 \
> + 		GOOS=windows \
> + 		$(GO) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		-ldflags -H=windowsgui \
> + 		-o bin/windows/winpath.exe \
> + 		./cmd/winpath
> +@@ -390,14 +390,14 @@ podman-mac-helper: ## Build podman-mac-helper for macOS
> + 		GOOS=darwin \
> + 		GOARCH=$(GOARCH) \
> + 		$(GO) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		-o bin/darwin/podman-mac-helper \
> + 		./cmd/podman-mac-helper
> + 
> + bin/rootlessport: .gopathok $(SOURCES) go.mod go.sum
> + 	CGO_ENABLED=$(CGO_ENABLED) \
> + 		$(GO) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		-o $@ ./cmd/rootlessport
> + 
> + .PHONY: rootlessport
> +@@ -420,7 +420,7 @@ bin/podman.cross.%: .gopathok
> + 	GOARCH="$${TARGET##*.}"; \
> + 	CGO_ENABLED=0 \
> + 		$(GO) build \
> +-		$(BUILDFLAGS) \
> ++		$(GOBUILDFLAGS) \
> + 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> + 		-tags '$(BUILDTAGS_CROSS)' \
> + 		-o "$@" ./cmd/podman
> +@@ -864,7 +864,7 @@ install.tools: .install.goimports .install.gitvalidation .install.md2man .instal
> + .PHONY: .install.ginkgo
> + .install.ginkgo: .gopathok
> + 	if [ ! -x "$(GOBIN)/ginkgo" ]; then \
> +-		$(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo ; \
> ++		$(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo ; \
> + 	fi
> + 
> + .PHONY: .install.gitvalidation
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f805cb6..727a298 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,6 +20,7 @@ DEPENDS = " \
>  SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
> +    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>  "
>  
>  LICENSE = "Apache-2.0"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7404): https://lists.yoctoproject.org/g/meta-virtualization/message/7404
> Mute This Topic: https://lists.yoctoproject.org/mt/92181869/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


