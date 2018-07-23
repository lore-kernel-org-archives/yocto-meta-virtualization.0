Return-Path: <koen@dominion.thruhere.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDB7EE00A04; Mon, 23 Jul 2018 07:48:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D10DDE00A04
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:55 -0700 (PDT)
Received: by mail-ed1-f66.google.com with SMTP id o8-v6so1193011edt.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Okn/xOP0fzh2C3DWnYS1x4QSsrmP9sjuw9cSmw3gEI4=;
	b=YQc+fKdb/1cn4lxctHShmeEC18vkw2KC60OFvRzUmYtIJleMRHSoIS9KORKAs7zpN8
	wtUaQ/BZg89MutFkpkQEyJhdOQfFPfsKMU4c55TnXhrmRq+1krVr5fnx+SacNujhBfc2
	ccX6AkGwC2Yu0X5lgH4mjj5AEITiwSNOspQvWoLIcNm8aWT+3xGg8BrTcbR8WaM/GdBB
	G2WMz5CtvUxB2TVsv0yfduOpwmt3A+rFAx3NKhh01jVJxxmWnFXYExz8PtLcbiwUzgp0
	qaK0BDQF2Azg4KxY+8WyEB4mWWTCJt8mf+gPnerjiAcjdX/E/tt/zCgQiHcbEGP0iKjc
	kmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Okn/xOP0fzh2C3DWnYS1x4QSsrmP9sjuw9cSmw3gEI4=;
	b=EUGxEFWKduS6s9oczNM1Z+ufrj6z8AtD8px/4EIzg1A/jsK/Scx4gVnHAL3pflBTE8
	t881pOOcAjtP4T1OGqdlwHJzkN7oyv4RCiOlGlmStdJipcNWcirccPlzjC6zsJmwlg+3
	b17LKekzclueaqtOWbYLeI16hL+tvigG+37IMFv2g2sqSggHY0ncbBACPCvJc2IvQ6+J
	qySLjrzwvECVY3cYpvmuvr5cc8abNCxjOZ3OvNDfqfBIp0lzeJY4NKI9gXJab5msrse6
	cYu2vJm3kM9O0FgLre7t1xsotnw2OySB7d53KqOLNqEQUsHx7PX2IzsLIh7OmT6k/W4p
	Ycfw==
X-Gm-Message-State: AOUpUlFIDNLH/YngPXXNB05Pff2oUWScZpH1j9TqRzkYE4LMcR7eNl+L
	hLNbNQ2xzB6+KC4Zq2S8bSgQJUQeog8=
X-Google-Smtp-Source: AAOMgpeyFLdq4f0eD5qnASuLd6A1cPk8HszarsLGYqvf6CLbmRo8SAl+IcmUCI0FME4JH8+UbZRr6A==
X-Received: by 2002:aa7:d443:: with SMTP id
	q3-v6mr14051261edr.109.1532357334545; 
	Mon, 23 Jul 2018 07:48:54 -0700 (PDT)
Received: from localhost.localdomain ([82.163.40.65])
	by smtp.gmail.com with ESMTPSA id
	w26-v6sm4479189eds.7.2018.07.23.07.48.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 07:48:53 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Mon, 23 Jul 2018 16:48:47 +0200
Message-Id: <20180723144850.17279-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Raymond Danks <ray.danks@se-eng.com>, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/4] kubernetes: explicitly build for $TARGET_ARCH
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
X-List-Received-Date: Mon, 23 Jul 2018 14:48:56 -0000

'make all' uses 'uname' to select the build target, leading to compile failures like this:

| arm-angstrom-linux-gnueabi-gcc: error: unrecognized command line option '-m64'

After providing the proper arch to the makefile it will try to use a hardcoded compiler:

| # runtime/cgo
| exec: "arm-linux-gnueabihf-gcc": executable file not found in $PATH

Fix that up by removing all hardcoded 'CC' entries in golang.sh

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...ack-lib-golang.sh-use-CC-from-environment.patch | 40 ++++++++++++++++++++++
 recipes-containers/kubernetes/kubernetes_git.bb    |  6 ++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch

diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
new file mode 100644
index 0000000..62d0521
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
@@ -0,0 +1,40 @@
+From 9cbb2d523d481053d405ebac830c2074b00d3417 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Mon, 23 Jul 2018 15:28:02 +0200
+Subject: [PATCH] hack/lib/golang.sh: use CC from environment
+
+Toolchain tupples differs, especially when using vendor provides ones.
+
+Upstream-status: Inappropriate [embedded specific]
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+---
+ hack/lib/golang.sh | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
+index c5d4634..563e2b4b 100755
+--- a/src/import/hack/lib/golang.sh
++++ b/src/import/hack/lib/golang.sh
+@@ -278,19 +278,15 @@ kube::golang::set_platform_envs() {
+     case "${platform}" in
+       "linux/arm")
+         export CGO_ENABLED=1
+-        export CC=arm-linux-gnueabihf-gcc
+         ;;
+       "linux/arm64")
+         export CGO_ENABLED=1
+-        export CC=aarch64-linux-gnu-gcc
+         ;;
+       "linux/ppc64le")
+         export CGO_ENABLED=1
+-        export CC=powerpc64le-linux-gnu-gcc
+         ;;
+       "linux/s390x")
+         export CGO_ENABLED=1
+-        export CC=s390x-linux-gnu-gcc
+         ;;
+     esac
+   fi
+-- 
+2.9.5
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 10558ef..33cb933 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -7,6 +7,7 @@ maintenance, and scaling of applications. \
 
 SRCREV_kubernetes = "210c9cd7e1782e9fe46938fe0368556f2166a528"
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.11;name=kubernetes \
+           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
           "
 
 DEPENDS += "rsync-native \
@@ -46,6 +47,7 @@ inherit goarch
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
+	export GOOS="${TARGET_GOOS}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
 
@@ -72,7 +74,7 @@ do_compile() {
 
 	cd ${S}/src/import
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
-	make all
+	make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
 }
 
 do_install() {
@@ -82,7 +84,7 @@ do_install() {
 
     install -d ${D}${sysconfdir}/kubernetes/manifests/
 
-    install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
+    install -m 755 -D ${S}/src/import/_output/local/bin/${TARGET_GOOS}/${TARGET_GOARCH}/* ${D}/${bindir}
 
     install -m 0644 ${S}/src/import/build/debs/kubelet.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/build/debs/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
-- 
2.9.5


