Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DDBC28D13
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 03:22:05 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.3531.1661052121494055280
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=htBhLxtW;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id y18so5848003qtv.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=f6/zhSdCXnSCGibyABcIzid6/gGa9P5O6hvI6gKULHI=;
        b=htBhLxtW4DgtVhRCpFyLlzcADiLT9hkQKwRVFnIiobeJBywFpY0NpgEG97J6bfjSG7
         AVLHQMt6jgQJrrcM+0QP2nKPO4GeVB3qmlxGBHFrCeiOykzTpJrdbR/C1A/XxI0RV/FD
         YbDWfgPjPtYnWc5ATlVoIoi5zgyWZWgCuSO9B0K1fugS1jFth7YibBEzr/iyEHG4RH1w
         DG0N+DrS14GgRKpI8UHx/hTbx+AvNQMsdu3EL8R+DJFvTpK3XAhERcI2RBtCx6I/zsbD
         0fLfaJ7Jx4VQuRDR+3U/BxLHZPfyYISAPJHNVhje5DkbiIwqU1cS1rPPtdK8UOSrV6pR
         milw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=f6/zhSdCXnSCGibyABcIzid6/gGa9P5O6hvI6gKULHI=;
        b=Rjsed5DXIdBNzWf9uQkOlprmuGu8pRFB6yPnkOdYr1EyipFjxjmQipHOQiKNsBkM1g
         Ze+j3SHEZj0Bcl+BS7e40Xy98UGHYE09HzrrN7AYi+HUePK9TLS9dSkvZvYOHQfs3exd
         PfQE0oPHYUzL3VdCz71tGv4JNpbJvXdfeRH6qtmhbmeUQPfyE5B7T6vuEE6W2wCOxWuX
         cwvSFynHSJR7Wv+kZ65UpJDaCgt0KhQBMqhJgGhmxthFAYO65lefwk6fdTTr1itx0w0N
         hi3+MwlA3PLnIn1hgJw2+f4RTUB3etihqGWaKa2M6p8/YywIY6ijhKmOFFXjZsZWBHOH
         R9KQ==
X-Gm-Message-State: ACgBeo3cT3pNTqps7t6QEEQ64pJPiRVGdaBQwYu41Xvfo7KxGqDjrGwj
	94F+fXjOL18t5s8wfLvIDpy1hEQfanE=
X-Google-Smtp-Source: 
 AA6agR4dt6EsWbXpzA/g43hcP8KMxCiAp83iOeoZisy1r7ZzkRSLvR7MpmWqZIZPhUrthLtc6XxFEQ==
X-Received: by 2002:ac8:5bc9:0:b0:343:7c69:4a0e with SMTP id
 b9-20020ac85bc9000000b003437c694a0emr11481174qtb.487.1661052120497;
        Sat, 20 Aug 2022 20:22:00 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a05620a0a4400b006b905e003a4sm7300584qka.135.2022.08.20.20.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 20:22:00 -0700 (PDT)
Date: Sat, 20 Aug 2022 23:21:58 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: replace GOBUILDFLAGS patch
Message-ID: <20220821032158.GB57389@gmail.com>
References: <20220818094026.1772745-1-pascal.bach@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818094026.1772745-1-pascal.bach@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Aug 2022 03:22:05 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7549

Thanks!

This is now queued on master-next.

Bruce

In message: [meta-virtualization][PATCH] podman: replace GOBUILDFLAGS patch
on 18/08/2022 Pascal Bach wrote:

> From: Pascal Bach <pascal.bach@siemens.com>
> 
> The GOBUILDFLAGS patch is replaced by explicitly setting BUILDFLAGS="${GOBUILDFLAGS}"
> in the recipe.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  ...01-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch | 109 ------------------
>  recipes-containers/podman/podman_git.bb       |   4 +-
>  2 files changed, 3 insertions(+), 110 deletions(-)
>  delete mode 100644 recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> 
> diff --git a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch b/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> deleted file mode 100644
> index 14b2714..0000000
> --- a/recipes-containers/podman/podman/0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From 3e18f3a4db638a3df48f49aa0a539f8bb048afc9 Mon Sep 17 00:00:00 2001
> -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Date: Tue, 5 Jul 2022 11:51:56 +0200
> -Subject: [PATCH] Rename BUILDFLAGS to GOBUILDFLAGS
> -
> -Yocto uses GOBUILDFLAGS to pass the right build flags while the Makefile
> -uses BUILDFLAGS. Align them accordingly.
> -
> -See go.bbclass for more information.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ----
> - Makefile | 24 ++++++++++++------------
> - 1 file changed, 12 insertions(+), 12 deletions(-)
> -
> -Index: import/Makefile
> -===================================================================
> ---- import.orig/Makefile
> -+++ import/Makefile
> -@@ -242,7 +242,7 @@
> - 
> - .PHONY: test/checkseccomp/checkseccomp
> - test/checkseccomp/checkseccomp: $(wildcard test/checkseccomp/*.go)
> --	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> -+	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -tags "$(BUILDTAGS)" -o $@ ./test/checkseccomp
> - 
> - .PHONY: test/testvol/testvol
> - test/testvol/testvol: $(wildcard test/testvol/*.go)
> -@@ -254,7 +254,7 @@
> - 
> - .PHONY: test/goecho/goecho
> - test/goecho/goecho: $(wildcard test/goecho/*.go)
> --	$(GOCMD) build $(BUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
> -+	$(GOCMD) build $(GOBUILDFLAGS) $(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' -o $@ ./test/goecho
> - 
> - test/version/version: version/version.go
> - 	$(GO) build -o $@ ./test/version/
> -@@ -296,7 +296,7 @@
> - 		distro for journald support."
> - endif
> - 	$(GOCMD) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> - 		-tags "$(BUILDTAGS)" \
> - 		-o $@ ./cmd/podman
> -@@ -308,7 +308,7 @@
> - # '|' is to ignore SRCBINDIR mtime; see: info make 'Types of Prerequisites'
> - $(SRCBINDIR)/podman$(BINSFX): $(SOURCES) go.mod go.sum | $(SRCBINDIR)
> - 	$(GOCMD) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> - 		-tags "${REMOTETAGS}" \
> - 		-o $@ ./cmd/podman
> -@@ -318,7 +318,7 @@
> - 	GOOS=linux \
> - 	GOARCH=$(GOARCH) \
> - 	$(GO) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN_STATIC)' \
> - 		-tags "${REMOTETAGS}" \
> - 		-o $@ ./cmd/podman
> -@@ -338,7 +338,7 @@
> - 	CGO_ENABLED=0 \
> - 		GOOS=windows \
> - 		$(GO) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		-ldflags -H=windowsgui \
> - 		-o bin/windows/winpath.exe \
> - 		./cmd/winpath
> -@@ -349,14 +349,14 @@
> - 		GOOS=darwin \
> - 		GOARCH=$(GOARCH) \
> - 		$(GO) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		-o bin/darwin/podman-mac-helper \
> - 		./cmd/podman-mac-helper
> - 
> - bin/rootlessport: $(SOURCES) go.mod go.sum
> - 	CGO_ENABLED=$(CGO_ENABLED) \
> - 		$(GO) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		-o $@ ./cmd/rootlessport
> - 
> - .PHONY: rootlessport
> -@@ -379,7 +379,7 @@
> - 	GOARCH="$${TARGET##*.}"; \
> - 	CGO_ENABLED=0 \
> - 		$(GO) build \
> --		$(BUILDFLAGS) \
> -+		$(GOBUILDFLAGS) \
> - 		$(GO_LDFLAGS) '$(LDFLAGS_PODMAN)' \
> - 		-tags '$(BUILDTAGS_CROSS)' \
> - 		-o "$@" ./cmd/podman
> -@@ -830,7 +830,7 @@
> - 
> - .PHONY: .install.ginkgo
> - .install.ginkgo:
> --	$(GO) install $(BUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo
> -+	$(GO) install $(GOBUILDFLAGS) ./vendor/github.com/onsi/ginkgo/ginkgo
> - 
> - .PHONY: .install.golangci-lint
> - .install.golangci-lint:
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 52ffa6c..f19d092 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,7 +20,6 @@ DEPENDS = " \
>  SRCREV = "754ec89a8a185d308ca5ed08afaf34d6cbda08da"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.2;protocol=https \
> -    file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
>  "
>  
> @@ -46,6 +45,9 @@ export LDFLAGS=""
>  # https://github.com/llvm/llvm-project/issues/53999
>  TOOLCHAIN = "gcc"
>  
> +# podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines them in GOBUILDFLAGS
> +export BUILDFLAGS="${GOBUILDFLAGS}"
> +
>  inherit go goarch
>  inherit systemd pkgconfig
>  
> -- 
> 2.37.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7540): https://lists.yoctoproject.org/g/meta-virtualization/message/7540
> Mute This Topic: https://lists.yoctoproject.org/mt/93100037/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


