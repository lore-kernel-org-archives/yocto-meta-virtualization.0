Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0AD7E00D87; Thu,  5 Oct 2017 06:39:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A038E00D75
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 06:39:04 -0700 (PDT)
Received: by mail-wr0-f172.google.com with SMTP id m18so10883586wrm.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Io9s34HHzy8JuA4Xj9rPs1GmUF1LN8lwGJy757H6zZQ=;
	b=YCrEVYUbmxIyaHAyOxO578qpDNBHFtcK/RaGk+xzguXMy2Hob52sD45BnwB0EtuGGR
	VZkC5mhUePrPOxRPXsiE0pz7QF4rzoGyKuu3tvXKxjPap8FEWaul34L0/8xw4KMs58pN
	Tcm79oSLiALUhyKthPGL4qke0SDiha1rh/ebPEjpH9iy32pRJaEvAPtDWqkgvoaUhJxR
	U0e9ZWgqs3il6I8fZLsnx4yf2K9e5wkdBWAgeFYrgoACAzxF/8Byry7xdHP+vkVczTX2
	+p/Pi0HSHtb9wxl+de8Fyn10d7oaxHOP+hP47I0vDkUyJEywNlJWhlSwFyyb8WL1dhi2
	0xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Io9s34HHzy8JuA4Xj9rPs1GmUF1LN8lwGJy757H6zZQ=;
	b=YteXviCN74y0NrqsczAMZeDCgJQW/K5qynwFypHZPb1oiIJMCaMQVDxQ3DEHROPTVw
	8xNxR/3YWHUpjVFRTdRryqW3fZuiVP4PIp9sWnnBbkpuO7Zof540NZvaWKeWqdT8KW22
	rBa+TWixNY1yMbGsq0jggf9O9lECFH4erVs4rk/cRFnHIatT0FQonwKQjyzHUHdlW8qy
	mvYL9p1atJFLfiz5BsefvAiEK0XRD+vDmuBxMm3RUhq4m3eE0AbAqJ8Togsqkg94nj2q
	FuwQRdpNuZeMF8Jii9C6SaNprR0Jm0V70fD/zizh8BBEg17eeiN/ahh0lePtRYL55O+D
	Pp9Q==
X-Gm-Message-State: AHPjjUgvVZGXie92tPVadkWlA8kUEYXxbIFja6V3l4BSfobsAsyG0WST
	e9I/dWQtfj9/1o1iitggZK5YeL4d6Ig=
X-Google-Smtp-Source: AOwi7QBUY8DjXH6poW9cNjHOwPkAldZpQI5WyG/Ge7O2Lu8Q6TJdDVcWDu2tFUpbUqhQ9zvDWi93Hw==
X-Received: by 10.223.156.129 with SMTP id d1mr25665820wre.166.1507210743930; 
	Thu, 05 Oct 2017 06:39:03 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v3sm6749043wra.39.2017.10.05.06.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 06:39:03 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 13:38:18 +0000
Message-Id: <1507210699-13911-4-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
References: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 3/4] runc: Use correct go cross-compiler
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
X-List-Received-Date: Thu, 05 Oct 2017 13:39:05 -0000

The makefiles for both providers of runc need to be patched in similar ways to
ensure that we use the binaries from go-cross and not go-native.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |  3 +
 .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
 recipes-containers/runc/runc-opencontainers_git.bb |  5 +-
 4 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch
 create mode 100644 recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch

diff --git a/recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch b/recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch
new file mode 100644
index 0000000..8f5171a
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch
@@ -0,0 +1,85 @@
+From 037c20b3b3ef5e9ead0282aa64f9b88c0c18934d Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Thu, 5 Oct 2017 13:14:40 +0000
+Subject: [PATCH] Use correct go cross-compiler
+
+We need to use '${GO}' as set by OpenEmbedded instead of just 'go'. Just using
+'go' will invoke go-native.
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Inappropriate
+---
+ Makefile | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8117892..0fcf508 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -27,18 +27,18 @@ SHELL := $(shell command -v bash 2>/dev/null)
+ .DEFAULT: runc
+ 
+ runc: $(SOURCES)
+-	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
++	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
+ 
+ all: runc recvtty
+ 
+ recvtty: contrib/cmd/recvtty/recvtty
+ 
+ contrib/cmd/recvtty/recvtty: $(SOURCES)
+-	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
++	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ static: $(SOURCES)
+-	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
+-	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
++	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
++	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ release:
+ 	@flag_list=(seccomp selinux apparmor static); \
+@@ -62,15 +62,15 @@ release:
+ 			CGO_ENABLED=1; \
+ 		}; \
+ 		echo "Building target: $$output"; \
+-		go build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
++		$(GO) build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
+ 	done
+ 
+ dbuild: runcimage
+ 	docker run --rm -v $(CURDIR):/go/src/$(PROJECT) --privileged $(RUNC_IMAGE) make clean all
+ 
+ lint:
+-	go vet $(allpackages)
+-	go fmt $(allpackages)
++	$(GO) vet $(allpackages)
++	$(GO) fmt $(allpackages)
+ 
+ man:
+ 	man/md2man-all.sh
+@@ -88,7 +88,7 @@ unittest: runcimage
+ 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localunittest
+ 
+ localunittest: all
+-	go test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
++	$(GO) test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
+ 
+ integration: runcimage
+ 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localintegration
+@@ -134,10 +134,10 @@ clean:
+ validate:
+ 	script/validate-gofmt
+ 	script/validate-shfmt
+-	go vet $(allpackages)
++	$(GO) vet $(allpackages)
+ 
+ ci: validate localtest
+ 
+ # memoize allpackages, so that it's executed only once and only if used
+-_allpackages = $(shell go list ./... | grep -v vendor)
++_allpackages = $(shell $(GO) list ./... | grep -v vendor)
+ allpackages = $(if $(__allpackages),,$(eval __allpackages := $$(_allpackages)))$(__allpackages)
+-- 
+2.7.4
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 9735325..0198652 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -8,10 +8,13 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
            file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
            file://0001-runc-Add-console-socket-dev-null.patch \
+           file://0001-Use-correct-go-cross-compiler.patch \
           "
 
 GO_IMPORT = "import"
 
+EXTRA_FLAGS = "-v -x -work"
+
 RUNC_VERSION = "1.0.0-rc3"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
diff --git a/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch b/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
new file mode 100644
index 0000000..67d7014
--- /dev/null
+++ b/recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
@@ -0,0 +1,85 @@
+From 621e5e9a196daaaf5eb430a413fe51218cf42c89 Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Wed, 4 Oct 2017 15:45:27 +0000
+Subject: [PATCH] Use correct go cross-compiler
+
+We need to use '${GO}' as set by OpenEmbedded instead of just 'go'. Just using
+'go' will invoke go-native.
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Inappropriate
+---
+ Makefile | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6781ac7..74e551d 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -27,18 +27,18 @@ SHELL := $(shell command -v bash 2>/dev/null)
+ .DEFAULT: runc
+ 
+ runc: $(SOURCES)
+-	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
++	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
+ 
+ all: runc recvtty
+ 
+ recvtty: contrib/cmd/recvtty/recvtty
+ 
+ contrib/cmd/recvtty/recvtty: $(SOURCES)
+-	go build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
++	$(GO) build -i $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ static: $(SOURCES)
+-	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
+-	CGO_ENABLED=1 go build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
++	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
++	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ release:
+ 	@flag_list=(seccomp selinux apparmor static); \
+@@ -62,15 +62,15 @@ release:
+ 			CGO_ENABLED=1; \
+ 		}; \
+ 		echo "Building target: $$output"; \
+-		go build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
++		$(GO) build -i $(EXTRA_FLAGS) -ldflags "$$ldflags $(EXTRA_LDFLAGS)" -tags "$$tags" -o "$$output" .; \
+ 	done
+ 
+ dbuild: runcimage
+ 	docker run --rm -v $(CURDIR):/go/src/$(PROJECT) --privileged $(RUNC_IMAGE) make clean all
+ 
+ lint:
+-	go vet $(allpackages)
+-	go fmt $(allpackages)
++	$(GO) vet $(allpackages)
++	$(GO) fmt $(allpackages)
+ 
+ man:
+ 	man/md2man-all.sh
+@@ -88,7 +88,7 @@ unittest: runcimage
+ 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localunittest
+ 
+ localunittest: all
+-	go test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
++	$(GO) test -timeout 3m -tags "$(BUILDTAGS)" ${TESTFLAGS} -v $(allpackages)
+ 
+ integration: runcimage
+ 	docker run -e TESTFLAGS -t --privileged --rm -v $(CURDIR):/go/src/$(PROJECT) $(RUNC_IMAGE) make localintegration
+@@ -133,10 +133,10 @@ clean:
+ 
+ validate:
+ 	script/validate-gofmt
+-	go vet $(allpackages)
++	$(GO) vet $(allpackages)
+ 
+ ci: validate localtest
+ 
+ # memoize allpackages, so that it's executed only once and only if used
+-_allpackages = $(shell go list ./... | grep -v vendor)
++_allpackages = $(shell $(GO) list ./... | grep -v vendor)
+ allpackages = $(if $(__allpackages),,$(eval __allpackages := $$(_allpackages)))$(__allpackages)
+-- 
+2.7.4
+
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 902a93d..2cfceea 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,7 +1,10 @@
 include runc.inc
 
 SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
-SRC_URI = "git://github.com/opencontainers/runc;branch=master"
+SRC_URI = " \
+    git://github.com/opencontainers/runc;branch=master \
+    file://0001-Use-correct-go-cross-compiler.patch \
+    "
 RUNC_VERSION = "1.0.0-rc4"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
-- 
2.7.4


