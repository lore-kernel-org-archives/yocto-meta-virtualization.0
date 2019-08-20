Return-Path: <liu.ming50@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1F6EE00C87; Tue, 20 Aug 2019 01:54:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (liu.ming50[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 958C0E00D8A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Aug 2019 01:54:24 -0700 (PDT)
Received: by mail-ed1-f67.google.com with SMTP id s15so5441544edx.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Aug 2019 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y+tFnciQrHJtBPHRMMsy36zQabCCeg+3903nqZ09B0M=;
	b=QAV7XWZUzDCIDFnT+hTrMBWh2ZHJ8kWePtlF8/xiwDWyUFAJ7zf0rdjTRc66FQPppp
	YLiwCMtsYFaQL0pOEBRPDaHPYuNvMy1NJoJAc/F96lK7oJlKFjw7OtEdBCiFKReL2E/X
	eBOOYLGBu7HgQb5ZYMU2GteiqzAxOCQx8WW8HBEOuu3jGAn2reGpxlsj6sndyFDHkWAu
	3b0v9oevY70fLABu6/3tjQfmMA19N703AldYA/ieo8C0T+Xd9QhuCJRa9jvYFIQeVrZW
	RvtuYA/e9efWj0kNeSMMOgZzwdo4EnbE4+9TjUMsw154HRwScgx4QzrYRk8qhVoMWauI
	IieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y+tFnciQrHJtBPHRMMsy36zQabCCeg+3903nqZ09B0M=;
	b=DvtJHgzD+rMOagJaVt+bE3pKZQj+XwHg8VSLqF7bduQVccSOTPjPdTXGl3wGaw+4Hz
	HK8wu+r7Ij6VXboqLtKsS6RcCXt4E0hKtOFrqsBDXX11xb6PUTsH7KPojYlzVcQIRV8w
	rjBYgSHs9l1YqFXVQTKtrAv/faQrgdr68OzJOBCacpOz4VzYPDresUVzAxTVkEHIpcp6
	Y3MqVA7d0KzPQdJwVRkuB6t+duU/CaKYxEgCgSJ4fafXeAIz/P0OYif1cbU/rtcKosFC
	PIFoHTul77WNCFnEgAjk1I08Dnve/zQ+wgY010PDLLnrGSzFKxpZAq6qrhZM9svc0nJQ
	nlOw==
X-Gm-Message-State: APjAAAVgFFkjwWtGIVVgIuViEbHrFGOEIQN2ZdG/inQh4XRE0Vp/uM2o
	Ukx5/IBjxtPQN7EoFW+eqNhw7+2wwqo=
X-Google-Smtp-Source: APXvYqxtpmNXHqgfbn0bPaxhKrskQjulhr/9lWkdGxR4Mi4g5xFogpIR/lbNQYa4jLpjSNg9dCi9mA==
X-Received: by 2002:a50:900f:: with SMTP id b15mr29180220eda.229.1566291262787;
	Tue, 20 Aug 2019 01:54:22 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.201.72])
	by smtp.gmail.com with ESMTPSA id
	sa25sm2484476ejb.37.2019.08.20.01.54.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Aug 2019 01:54:21 -0700 (PDT)
From: liu.ming50@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 20 Aug 2019 16:54:12 +0800
Message-Id: <1566291252-30059-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] docker: add docker-app support
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
X-List-Received-Date: Tue, 20 Aug 2019 08:54:39 -0000

From: Ming Liu <liu.ming50@gmail.com>

A docker-cpp binary would be generated after this change.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/docker/docker_git.bb            |  9 +++++++
 .../0001-Makefile-do-not-override-LDFLAGS.patch    | 31 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index e45f87e..bf9cdc7 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -38,13 +38,16 @@ DESCRIPTION = "Linux container runtime \
 SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
 SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
 SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
+SRCREV_app = "ad4481ea1a063659f15cac38048883b54f0820e2"
 SRC_URI = "\
 	git://github.com/moby/moby.git;nobranch=1;name=moby \
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
 	git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
+	git://github.com/docker/app;branch=master;name=app;destsuffix=git/app \
 	file://docker.init \
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
 	file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
+	file://0001-Makefile-do-not-override-LDFLAGS.patch \
 	"
 
 require docker.inc
@@ -83,6 +86,7 @@ do_compile() {
 	mkdir -p .gopath/src/github.com/docker
 	ln -sf ${WORKDIR}/git/libnetwork .gopath/src/github.com/docker/libnetwork
 	ln -sf ${WORKDIR}/git/cli .gopath/src/github.com/docker/cli
+	ln -sf ${WORKDIR}/git/app .gopath/src/github.com/docker/app
 
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
@@ -111,6 +115,10 @@ do_compile() {
 	export DOCKER_VERSION=${DOCKER_VERSION}
 	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_docker}" make dynbinary
 
+	# build the app
+	cd ${S}/src/import/.gopath/src/github.com/docker/app
+	make dynamic
+
 	# build the proxy
 	cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
 	oe_runmake cross-local
@@ -119,6 +127,7 @@ do_compile() {
 do_install() {
 	mkdir -p ${D}/${bindir}
 	cp ${WORKDIR}/git/cli/build/docker ${D}/${bindir}/docker
+	cp ${WORKDIR}/git/app/bin/docker-app ${D}/${bindir}/docker-app
 	cp ${S}/src/import/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
 	cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
 
diff --git a/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch b/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch
new file mode 100644
index 0000000..c987a51
--- /dev/null
+++ b/recipes-containers/docker/files/0001-Makefile-do-not-override-LDFLAGS.patch
@@ -0,0 +1,31 @@
+From 494b5f6982a35e285d3ef15e67d2fe27873909e4 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sun, 18 Aug 2019 11:52:14 +0800
+Subject: [PATCH] Makefile: do not override LDFLAGS
+
+Replace a ":=" by "+=" when setting LDFLAGS, this ensures it would not
+override the linking flags from OE environment.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ app/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/app/Makefile b/app/Makefile
+index 77f18b4..d311726 100644
+--- a/app/Makefile
++++ b/app/Makefile
+@@ -13,7 +13,7 @@ ifeq ($(EXPERIMENTAL),on)
+   BUILDTAGS="experimental"
+ endif
+ 
+-LDFLAGS := "-s -w \
++LDFLAGS := " \
+   -X $(PKG_NAME)/internal.GitCommit=$(COMMIT) \
+   -X $(PKG_NAME)/internal.Version=$(TAG)      \
+   -X $(PKG_NAME)/internal.Experimental=$(EXPERIMENTAL) \
+-- 
+2.7.4
+
-- 
2.7.4


