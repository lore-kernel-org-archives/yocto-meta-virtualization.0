Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93EF7E00EAD; Tue, 16 Jan 2018 22:22:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EDD87E008A4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jan 2018 22:22:35 -0800 (PST)
Received: by mail-pl0-f66.google.com with SMTP id b96so8072132pli.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jan 2018 22:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xVdIMOFPYXsQP6SytrufCS6t92HwAaz4U4og0raoQMk=;
	b=pcsY0R/fltYWxxTl8vs0WY840RcQ7AnuvWuOxDjn6gHEsURHGcmpyA1cHanS5Bgblu
	UXfTb4bErEbA4jUhziUEqce8oSWRZeAvnJEcN0UJ85J5ozMFdGt9aBkSnpB4ja2z3bHq
	YWls6vVAI0G/miFtL1w6l/0UdJ9ybugWXkwmbV8pYY0k+Cq6sKn6xepGbbCnRWnmja1H
	en2Q/ZKcQGYLxt19acEQNLcqUf7jUvkEEYBao0NATxJveUAMUSGXiUAL2dILK90+6ALd
	i4vMDNE7zidtYm0bZ0ZqzJcyXRpMn3HI0/6l+5W1lP+YKXe3nMZ3JZrPthxhJxq8nTwN
	bLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVdIMOFPYXsQP6SytrufCS6t92HwAaz4U4og0raoQMk=;
	b=AZbbI3y59YHIoEqWjbTe3WgWkXB145k/Q/ChSdM+nBz3TStHlHq0VJkUO/EJK3gbie
	9P8r5ziZterwd4A0O/JVe5CSvgqHritlTNz+pwgnspNnct4R04IwC2m33mzVV+k6ltg1
	BmMVviiVje67bbNQguId7DhmuohchKaQei0He0/8njOR0dTZBr/eElKE03Lylv0/C3T8
	jWAVne/eTbQEJt0p1w1tRpfVKsAXoIw42UoFvI4r+8mjqfW8X2rz7c94dslANdvnyVTz
	sMwYjDzrh+IjVB12BBFVV8JnQBJ2/fLpVk/1u83JsW97Izy8c+Cxjrk5KrtQjb0vxslM
	eXzg==
X-Gm-Message-State: AKGB3mJ89UUciNn6hr3LuE7L9l5D0xQPuLkM9+x8ty1FX7rFNxxSKhec
	vVuarasmJ2vP5Z2dANAdqy9EyQvi
X-Google-Smtp-Source: ACJfBosVpoFRRlSgbmDKjFZ2fq6/6j/7PIPlh0VNbA3SDv7V1bloZmuVdUbFttst+5ijAtPIEAdJFw==
X-Received: by 10.84.130.78 with SMTP id 72mr41282159plc.278.1516170155150;
	Tue, 16 Jan 2018 22:22:35 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com ([157.49.245.89])
	by smtp.gmail.com with ESMTPSA id
	f188sm7025524pfc.22.2018.01.16.22.22.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jan 2018 22:22:34 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 17 Jan 2018 11:50:15 +0530
Message-Id: <1516170016-9438-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][rocko][PATCH] kubernetes: fix build error for arm64
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
X-List-Received-Date: Wed, 17 Jan 2018 06:22:36 -0000

The changes include:

1. Compiling go-bindata for host architecture, as it needs to be run at host
   machine; which solves below error:

-- snip --
Log data follows:
| DEBUG: Executing shell function do_compile
| +++ [0117 05:06:39] Building the toolchain targets:
|     k8s.io/kubernetes/hack/cmd/teststale
|     k8s.io/kubernetes/vendor/github.com/jteeuwen/go-bindata/go-bindata
| +++ [0117 05:06:39] Generating bindata:
|     test/e2e/generated/gobindata_util.go
| Cannot find go-bindata.
| ../../../../../../test/e2e/generated/gobindata_util.go:19: running "../../../hack/generate-bindata.sh": exit status 5
| !!! [0117 05:06:39] Call tree:
| !!! [0117 05:06:39]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| !!! [0117 05:06:39] Call tree:
| !!! [0117 05:06:39]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| make[1]: *** [Makefile.generated_files:322: _output/bin/deepcopy-gen] Error 1
| make: *** [Makefile:478: generated_files] Error 2
-- snip --

2. Compiling toolchain targets such as deepcopy-gen, defaulter-gen, openapi-gen
   for host architecture, to solve below error:
-- snip --
| +++ [0117 05:31:35] Building go targets for linux/arm64:
|     ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
| touch: cannot touch '_output/bin/deepcopy-gen': No such file or directory
| make[1]: *** [Makefile.generated_files:323: _output/bin/deepcopy-gen] Error 1
| make: *** [Makefile:478: generated_files] Error 2
-- snip --

3. Change CC value to use corresponding ${TARGET_PREFIX}gcc.

4. Check for existence of kubernetes binaries, before installing.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../build-kube-toolchain-to-run-on-host.patch      | 38 ++++++++++++++++++++++
 recipes-containers/kubernetes/kubernetes_git.bb    | 14 ++++++--
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/kubernetes/files/build-kube-toolchain-to-run-on-host.patch

diff --git a/recipes-containers/kubernetes/files/build-kube-toolchain-to-run-on-host.patch b/recipes-containers/kubernetes/files/build-kube-toolchain-to-run-on-host.patch
new file mode 100644
index 0000000..2163d4a
--- /dev/null
+++ b/recipes-containers/kubernetes/files/build-kube-toolchain-to-run-on-host.patch
@@ -0,0 +1,38 @@
+Compiling go-bindata for host architecture, as it needs to be run at host
+machine; which solves below error:
+
+-- snip --
+Log data follows:
+| DEBUG: Executing shell function do_compile
+| +++ [0117 05:06:39] Building the toolchain targets:
+|     k8s.io/kubernetes/hack/cmd/teststale
+|     k8s.io/kubernetes/vendor/github.com/jteeuwen/go-bindata/go-bindata
+| +++ [0117 05:06:39] Generating bindata:
+|     test/e2e/generated/gobindata_util.go
+| Cannot find go-bindata.
+| ../../../../../../test/e2e/generated/gobindata_util.go:19: running "../../../hack/generate-bindata.sh": exit status 5
+| !!! [0117 05:06:39] Call tree:
+| !!! [0117 05:06:39]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
+| !!! [0117 05:06:39] Call tree:
+| !!! [0117 05:06:39]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
+| make[1]: *** [Makefile.generated_files:322: _output/bin/deepcopy-gen] Error 1
+| make: *** [Makefile:478: generated_files] Error 2
+-- snip --
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+--- a/src/import/hack/lib/golang.sh	2018-01-10 21:20:47.803156778 +0530
++++ b/src/import/hack/lib/golang.sh	2018-01-10 21:35:04.228444126 +0530
+@@ -682,8 +682,11 @@ kube::golang::build_binaries() {
+       fi
+     fi
+ 
++    local goarch_backup=${GOARCH}
++    export GOARCH=$(go env GOHOSTARCH)
+     # First build the toolchain before building any other targets
+     kube::golang::build_kube_toolchain
++    export GOARCH="$goarch_backup"
+ 
+     kube::log::status "Generating bindata:" "${KUBE_BINDATAS[@]}"
+     for bindata in ${KUBE_BINDATAS[@]}; do
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 4a825ba..f0c5be3 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -7,7 +7,7 @@ maintenance, and scaling of applications. \
 
 SRCREV_kubernetes = "4b839465f84e7faf876c51703aaf49b37fd10d9c"
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;nobranch=1;name=kubernetes \
-          "
+           file://build-kube-toolchain-to-run-on-host.patch"
 
 DEPENDS += "rsync-native \
             coreutils-native \
@@ -42,6 +42,7 @@ inherit go
 inherit goarch
 
 do_compile() {
+	sed -i "s:export CC=.*-gcc$:export CC=${HOST_PREFIX}gcc:g" ${S}/src/import/hack/lib/golang.sh
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
@@ -68,6 +69,11 @@ do_compile() {
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	cd ${S}/src/import
+	export KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
+	export GOARCH="${BUILD_GOARCH}"
+	make generated_files
+	export KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${TARGET_GOARCH}"
+	export GOARCH="${TARGET_GOARCH}"
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
 	make all
 }
@@ -79,7 +85,11 @@ do_install() {
 
     install -d ${D}${sysconfdir}/kubernetes/manifests/
 
-    install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
+    if ls ${S}/src/import/_output/local/bin/*/${TARGET_GOARCH}/kube* > /dev/null 2>&1 ; then
+        install -m 755 -D ${S}/src/import/_output/local/bin/*/${TARGET_GOARCH}/kube* ${D}/${bindir}
+    elif ls ${S}/src/import/_output/bin/kube* > /dev/null 2>&1 ; then
+        install -m 755 -D ${S}/src/import/_output/bin/kube* ${D}/${bindir}
+    fi
 
     install -m 0644 ${S}/src/import/build/debs/kubelet.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/build/debs/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.service.d/
-- 
2.7.4


