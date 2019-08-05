Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E68CBE00D4E; Sun,  4 Aug 2019 23:02:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FF13E00BA1
	for <meta-virtualization@yoctoproject.org>;
	Sun,  4 Aug 2019 23:02:17 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7562HZE015047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 4 Aug 2019 23:02:17 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 4 Aug 2019 23:02:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 5 Aug 2019 14:01:42 +0800
Message-ID: <20190805060143.24108-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805060143.24108-1-Qi.Chen@windriver.com>
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] runc-docker: respect GOBUILDFLAGS and do not compile recvtty
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
X-List-Received-Date: Mon, 05 Aug 2019 06:02:17 -0000
Content-Type: text/plain

Previsously, runc uses 'make static' to compile things out, and
the 0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch removes the
recvtty target, although that patch does not respect GOBUILDFLAGS
as its name suggests.

Now we have changed to remove 'static' because we want to have
systemd support. So we explicitly only compile 'runc' and make
this target respect 'GOBUILDFLAGS'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Makefile-respect-GOBUILDFLAGS.patch  | 28 +++++++++++++++++++
 ...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ---------------
 recipes-containers/runc/runc-docker_git.bb    |  2 +-
 recipes-containers/runc/runc.inc              |  2 +-
 4 files changed, 30 insertions(+), 24 deletions(-)
 create mode 100644 recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
 delete mode 100644 recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch

diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
new file mode 100644
index 0000000..ac9aa3d
--- /dev/null
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
@@ -0,0 +1,28 @@
+From 7d6f130ebe427412c41cd11148be6db7711e32c1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 5 Aug 2019 13:29:50 +0800
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Inappropriate [OE Specific]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 0f26a1c8..45c6c221 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -30,7 +30,7 @@ SHELL := $(shell command -v bash 2>/dev/null)
+ .DEFAULT: runc
+ 
+ runc: $(SOURCES)
+-	$(GO) build -buildmode=pie $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
++	$(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
+ 
+ all: runc recvtty
+ 
+-- 
+2.17.1
+
diff --git a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
deleted file mode 100644
index 9ba9957..0000000
--- a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From a9a2b9e72027d0b2357f6dfe8b154762aaa8dd02 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Thu, 19 Apr 2018 16:39:41 -0400
-Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- Makefile | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: git/src/import/Makefile
-===================================================================
---- git.orig/src/import/Makefile
-+++ git/src/import/Makefile
-@@ -41,7 +41,6 @@
- 
- static: $(SOURCES)
- 	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
--	CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
- 
- release:
- 	script/release.sh -r release/$(VERSION) -v $(VERSION)
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 2bf6222..d4e4d24 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -5,8 +5,8 @@ include runc.inc
 SRCREV_runc-docker = "425e105d5a03fabd737a126ad93d62a9eeede87f"
 SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
-           file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
+           file://0001-Makefile-respect-GOBUILDFLAGS.patch \
           "
 
 RUNC_VERSION = "1.0.0-rc8"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 1f2f944..fe997f1 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -54,7 +54,7 @@ do_compile() {
 	export CFLAGS=""
 	export LDFLAGS=""
 
-	oe_runmake
+	oe_runmake runc
 }
 
 do_install() {
-- 
2.17.1


