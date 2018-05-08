Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 054B4E00C5B; Tue,  8 May 2018 13:14:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5CE8E0084D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 May 2018 13:14:37 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id j4so20852856wme.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 May 2018 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YYlfkCClQET2e8B6EPcxeByBw3AGOm3dwVKM89TR/RA=;
	b=0x5lRgz4+2BUrpdkNWuotPrE5TfePYAcCqj09YY350jIU/bokLmdu/ZNkqFhfxxgKv
	xpH/BO68jPLRTW7PZMhfjArM5dHgSlJZJv05YfZsqCvD2B4iq8+3T/jHTRCWyyXNB7wP
	s+JqZaNQvxwt5zdQ719nHVtgtqO2Mw0Q6d6rbCj2llaO+XqXKEAiVsSqVYPO4WqiggNw
	Fgr6RqPJpyzm46pVAfeq+/JHRj/H6E9qWHNxC46DidobggzcfO8hXmyCBUCwS3mrU5ZE
	zojaR5ZPOW4nwPzguV7g/JYPiJbihBJv9OykdPJgYc9YG+Li62uO+PfBiLLQROHxoZ6p
	ANYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YYlfkCClQET2e8B6EPcxeByBw3AGOm3dwVKM89TR/RA=;
	b=cw2WIDPl+RwaLRS1ZURQVbA7o7Az0ONhwI7xW+RN6ynmPVMB8BLzgSUMLg0zN+7Szk
	+i+agfZsWrDZWcf+4YcqkDuwrdX/hQVE7XBgnXuUSyfHkdlqN+F+dM1QblJtzLASmZvy
	O8z0UXek89Cyd87eRy8zzNH7anRaBkMIJLNDAML+cin1ai8tcIdU3q4wT3Msx7VYMiyH
	K7sxVigf1PaHx8ZyhwG+HKWNFzNbvuvuatMSJmPbeUDsfxxi8qLNDewUGlxe+18rIvQC
	aBSp7yE+8OoD0IWv25It47Mb21PW83m/qvAeb5XE1qVEitz/cQhxs0pxffrHA/WdPIZ8
	MIug==
X-Gm-Message-State: ALKqPwdDK9lmJC1mNWT7dtTK2uVJ/jijyyYvqWu4FUKx2I86c+vl8Sa9
	l5/iMLKIYte8vpRW3Eq963MKA9Z8
X-Google-Smtp-Source: AB8JxZpcqksZfS5PK7FTEOvHoxs1UuTAW1EydHW46ETplhA8/IAe6W4TdqY1jILE8ddRLRq7VL6OHw==
X-Received: by 2002:a1c:e384:: with SMTP id
	a126-v6mr4538391wmh.93.1525810476354; 
	Tue, 08 May 2018 13:14:36 -0700 (PDT)
Received: from eng01.lxd (h02.s01.b5net.uk. [88.99.27.92])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm42708231wrt.20.2018.05.08.13.14.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 May 2018 13:14:35 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 May 2018 20:14:11 +0000
Message-Id: <1525810452-7637-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] runc-opencontainers: Drop obsolete patch
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 20:14:41 -0000

The upstream Makefile now calls `$(GO)` instead of just `go` so this patch isn't
needed anymore.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../0001-Use-correct-go-cross-compiler.patch       | 85 ----------------------
 recipes-containers/runc/runc-opencontainers_git.bb |  1 -
 2 files changed, 86 deletions(-)
 delete mode 100644 recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch

diff --git a/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch b/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
deleted file mode 100644
index 67d7014..0000000
--- a/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 621e5e9a196daaaf5eb430a413fe51218cf42c89 Mon Sep 17 00:00:00 2001
-From: Paul Barker <pbarker@toganlabs.com>
-Date: Wed, 4 Oct 2017 15:45:27 +0000
-Subject: [PATCH] Use correct go cross-compiler
-
-We need to use '${GO}' as set by OpenEmbedded instead of just 'go'. Just using
-'go' will invoke go-native.
-
-Signed-off-by: Paul Barker <pbarker@toganlabs.com>
-Upstream-status: Inappropriate
----
- Makefile | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 6781ac7..74e551d 100644
---- a/src/import/Makefile
-+++ b/src/import/Makefile
-@@ -27,18 +27,18 @@ SHELL := $(shell command -v bash 2>/dev/null)
- .DEFAULT: runc
- 
- runc: $(SOURCES)
--	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
-+	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
- 
- all: runc recvtty
- 
- recvtty: contrib/cmd/recvtty/recvtty
- 
- contrib/cmd/recvtty/recvtty: $(SOURCES)
--	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
-+	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
- 
- static: $(SOURCES)
--	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
--	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
-+	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
-+	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
- 
- release:
- 	@flag_list=(seccomp selinux apparmor static); \
-@@ -62,15 +62,15 @@ release:
- 			CGO_ENABLED=1; \
- 		}; \
- 		echo "Building target: $$output"; \
--		go build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
-+		$(GO) build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
- 	done
- 
- dbuild: runcimage
- 	docker run --rm -v $(CURDIR):/go/src/$(PROJECT) --privileged $(RUNC_IMAGE) make clean all
- 
- lint:
--	go vet $(allpackages)
--	go fmt $(allpackages)
-+	$(GO) vet $(allpackages)
-+	$(GO) fmt $(allpackages)
- 
- man:
- 	man/md2man-all.sh
-@@ -88,7 +88,7 @@ unittest: runcimage
- 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localunittest
- 
- localunittest: all
--	go test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
-+	$(GO) test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
- 
- integration: runcimage
- 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localintegration
-@@ -133,10 +133,10 @@ clean:
- 
- validate:
- 	script/validate-gofmt
--	go vet $(allpackages)
-+	$(GO) vet $(allpackages)
- 
- ci: validate localtest
- 
- # memoize allpackages, so that it's executed only once and only if used
--_allpackages = $(shell go list ./... | grep -v vendor)
-+_allpackages = $(shell $(GO) list ./... | grep -v vendor)
- allpackages = $(if $(__allpackages),,$(eval __allpackages := $$(_allpackages)))$(__allpackages)
--- 
-2.7.4
-
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 73ef4f0..ed48abf 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -3,6 +3,5 @@ include runc.inc
 SRCREV = "58415b4b12650291f435db8770cea48207b78afe"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=master \
-    file://0001-Use-correct-go-cross-compiler.patch \
     "
 RUNC_VERSION = "1.0.0-rc5"
-- 
2.7.4


