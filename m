Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 247A8E00D4F; Tue, 17 Sep 2019 00:38:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F0E8E00D33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 00:38:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8H7bOL6002062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2019 00:37:39 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 17 Sep 2019 00:37:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Tue, 17 Sep 2019 15:37:23 +0800
Message-ID: <1568705843-26164-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kubernetes: fix compiling failure: execvp: /bin/bash: Argument list too long
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
X-List-Received-Date: Tue, 17 Sep 2019 07:38:08 -0000
Content-Type: text/plain

Use GNU Make 4.2.1(such as fedora-29) to build k8s in a long directory,
it failed with `execvp: /bin/bash: Argument list too long'
[snip]
$ cd /buildarea1/hjia/wrlinux-1019/I_/suspect_/that_/if_/you_/create_/your_/project_/in_/a_/very_/deep_/directory/build_master-wr_qemux86-64_faw_2019090509/build/tmp-glibc/work/core2-64-wrs-linux/kubernetes/v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a-r0/kubernetes-v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a/src/import
$ make cross KUBE_BUILD_PLATFORMS=linux/amd64 GOLDFLAGS=""
|+++ [0804 16:38:32] Building go targets for linux/amd64:
|    ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
|make[1]: execvp: /bin/bash: Argument list too long
|make[1]: *** [Makefile.generated_files:184: pkg/kubectl/cmd/testing/zz_generated.deepcopy.go] Error 127
|make: *** [Makefile:557: generated_files] Error 2
...
[snip]

From make manual [1]
$?
  The names of all the prerequisites that are newer than the target, with spaces between them.

While two `$?' was passed to bash in a line, it caused above failure,
drop a duplicated one could workaround the issue.

[1] https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ng-failure-execvp-bin-bash-Argument-list-.patch | 69 ++++++++++++++++++++++
 recipes-containers/kubernetes/kubernetes_git.bb    |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch

diff --git a/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch b/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch
new file mode 100644
index 0000000..42fd51a
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch
@@ -0,0 +1,69 @@
+From dbca1bfc6ffca8a6536d91a716cb9c5e9bc2f8a0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Sep 2019 14:43:30 +0800
+Subject: [PATCH] fix compiling failure: execvp: /bin/bash: Argument list too
+ long
+
+Use GNU Make 4.2.1(such as fedora-29) to build k8s in a long directory,
+it failed with `execvp: /bin/bash: Argument list too long'
+[snip]
+$ cd /buildarea1/hjia/wrlinux-1019/I_/suspect_/that_/if_/you_/create_/your_/project_/in_/a_/very_/deep_/directory/build_master-wr_qemux86-64_faw_2019090509/build/tmp-glibc/work/core2-64-wrs-linux/kubernetes/v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a-r0/kubernetes-v1.16.0-alpha+git7054e3ead7e1a00ca6ac3ec47ea355b76061a35a/src/import
+$ make cross KUBE_BUILD_PLATFORMS=linux/amd64 GOLDFLAGS=""
+|+++ [0804 16:38:32] Building go targets for linux/amd64:
+|    ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
+|make[1]: execvp: /bin/bash: Argument list too long
+|make[1]: *** [Makefile.generated_files:184: pkg/kubectl/cmd/testing/zz_generated.deepcopy.go] Error 127
+|make: *** [Makefile:557: generated_files] Error 2
+...
+[snip]
+
+From make manual [1]
+$?
+  The names of all the prerequisites that are newer than the target, with spaces between them.
+
+While two `$?' was passed to bash in a line, it caused above failure,
+drop a duplicated one could workaround the issue.
+
+[1] https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
+
+Upstream-Status: Submitted [https://github.com/kubernetes/kubernetes/pull/82777]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/import/build/root/Makefile.generated_files | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/import/build/root/Makefile.generated_files b/src/import/build/root/Makefile.generated_files
+index 4892325..f17f1f3 100644
+--- a/src/import/build/root/Makefile.generated_files
++++ b/src/import/build/root/Makefile.generated_files
+@@ -182,7 +182,7 @@ $(META_DIR)/$(DEEPCOPY_GEN).todo: $(DEEPCOPY_FILES)
+ 
+ $(DEEPCOPY_FILES): $(DEEPCOPY_GEN)
+ 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then        \
+-	    echo "DBG: deepcopy needed $(@D): $?";  \
++	    echo "DBG: deepcopy needed $(@D):";  \
+ 	    ls -lf --full-time $@ $? || true;       \
+ 	fi
+ 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(DEEPCOPY_GEN).todo
+@@ -276,7 +276,7 @@ $(META_DIR)/$(DEFAULTER_GEN).todo: $(DEFAULTER_FILES)
+ 
+ $(DEFAULTER_FILES): $(DEFAULTER_GEN)
+ 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then         \
+-	    echo "DBG: defaulter needed $(@D): $?";  \
++	    echo "DBG: defaulter needed $(@D):";  \
+ 	    ls -lf --full-time $@ $? || true;        \
+ 	fi
+ 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(DEFAULTER_GEN).todo
+@@ -380,7 +380,7 @@ $(META_DIR)/$(CONVERSION_GEN).todo: $(CONVERSION_FILES)
+ 
+ $(CONVERSION_FILES): $(CONVERSION_GEN)
+ 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
+-	    echo "DBG: conversion needed $(@D): $?";  \
++	    echo "DBG: conversion needed $(@D):";  \
+ 	    ls -lf --full-time $@ $? || true;         \
+ 	fi
+ 	echo $(PRJ_SRC_PATH)/$(@D) >> $(META_DIR)/$(CONVERSION_GEN).todo
+-- 
+2.7.4
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index cc37796..a0e0e47 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -11,6 +11,7 @@ SRCREV_kubernetes = "7054e3ead7e1a00ca6ac3ec47ea355b76061a35a"
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=master;name=kubernetes \
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
            file://0001-cross-don-t-build-tests-by-default.patch \
+           file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.7.4


