Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAEAC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 13:08:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30212.1698930505203430713
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 06:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m/LwTsjh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=967046b255=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A2BL3E9001003
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 2 Nov 2023 06:08:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Dm0eF
	s+ZT3i253nKIJqFEsDg1t2Gqj3m7irfitPpCPo=; b=m/LwTsjhzKTS8yIRbwRpV
	UlbYEqRgqrodROOknb+BvwSpM9JcSN3vUNAROtlkpSoUyCbQPHpbjxyas91gpE/w
	HseMmZ7SuFhsUBEdoPky0QV1I7LwM4in9da3Vp+pxNeiJCKNM6ftajcrlcO5nAG4
	9OL1I15lldFg3eqH1viZFuZdHSlL7f8taYvfCGDB2Ooa9Z9quwbH8m6TE0gXQAh/
	+bg2ErLJ6B0yqs6oq1gKHZCaC/dXxyxIdlLZECTSdcstgdnjvz55OF3HEgRc4PCO
	ETMd4bIB1hm+0ljQBF5+IeQbo82ofoEndJca8d8YrDVC0tqJdj34INuoDH/PI6+D
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u434agd8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 06:08:24 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 06:08:24 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] kubernetes: Adjust patches to resolve error that occur with devtool
Date: Thu, 2 Nov 2023 13:08:05 +0000
Message-ID: <20231102130805.1285325-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: MP5Jqf1cbklchMGKgQfDThpksQYjFNw_
X-Proofpoint-ORIG-GUID: MP5Jqf1cbklchMGKgQfDThpksQYjFNw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-02_03,2023-11-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020105
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Nov 2023 13:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8410

From: Soumya Sambu <soumya.sambu@windriver.com>

Adjust patches and .bb to fix  below error which occurs with devtool modify command -

ERROR: Applying patch '0001-hack-lib-golang.sh-use-CC-from-environment.patch' on
target directory
CmdError('sh -c \'PATCHFILE="0001-hack-lib-golang.sh-use-CC-from-environment.patch"
git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmp_ptvioq3
--author="Koen Kooi <koen.kooi@linaro.org>"
--date="Mon, 23 Jul 2018 15:28:02 +0200"\'', 0, 'stdout: On branch devtool
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
\tmodified:   src/import (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

stderr: ')

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...ed_files-Fix-race-issue-for-installi.patch | 20 +++++++++++--------
 ...sh-convert-remaining-go-calls-to-use.patch | 18 +++++++++--------
 ...1-cross-don-t-build-tests-by-default.patch | 12 ++++++-----
 ...ib-golang.sh-use-CC-from-environment.patch | 14 ++++++++-----
 .../kubernetes/kubernetes_git.bb              |  8 ++++----
 5 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
index 02bb5e91..e0ef04dc 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
@@ -1,8 +1,8 @@
 From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 15 Oct 2020 07:27:35 +0000
-Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race issue for installing
- go2make
+Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race
+ issue for installing go2make
 
 The src/import/build/root/Makefile.generated_files are called several times during the build, so the
 following target which installs go2make will also run several times:
@@ -24,15 +24,17 @@ problem.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
- src/import/build/root/Makefile.generated_files | 4 +++-
+ build/root/Makefile.generated_files | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
-===================================================================
---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/build/root/Makefile.generated_files
-+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/build/root/Makefile.generated_files
-@@ -67,7 +67,9 @@
+diff --git a/build/root/Makefile.generated_files b/build/root/Makefile.generated_files
+index d86a90cbb39..19a3d332476 100644
+--- a/build/root/Makefile.generated_files
++++ b/build/root/Makefile.generated_files
+@@ -67,7 +67,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
  	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
  	    echo "DBG: calculating Go dependencies";  \
  	fi
@@ -43,3 +45,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
  	hack/run-in-gopath.sh go2make                       \
  	    k8s.io/kubernetes/...                           \
  	    --prune  k8s.io/kubernetes/staging              \
+--
+2.40.0
diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
index 8adbafb3..39fdac54 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
@@ -4,15 +4,17 @@ Date: Wed, 12 Aug 2020 16:01:49 +0000
 Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  hack/lib/golang.sh | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/src/import/hack/lib/golang.sh b/src/import/hack/lib/golang.sh
-index e9148ec08fa..71d3c987563 100755
---- a/src/import/hack/lib/golang.sh
-+++ b/src/import/hack/lib/golang.sh
-@@ -651,7 +651,7 @@ kube::golang::build_some_binaries() {
+diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
+index d0f4b00dadf..cef0c2075a3 100755
+--- a/hack/lib/golang.sh
++++ b/hack/lib/golang.sh
+@@ -654,7 +654,7 @@ kube::golang::build_some_binaries() {
          kube::golang::create_coverage_dummy_test "${package}"
          kube::util::trap_add "kube::golang::delete_coverage_dummy_test \"${package}\"" EXIT
  
@@ -21,7 +23,7 @@ index e9148ec08fa..71d3c987563 100755
            -covermode count \
            -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
            "${build_args[@]}" \
-@@ -663,13 +663,13 @@ kube::golang::build_some_binaries() {
+@@ -666,13 +666,13 @@ kube::golang::build_some_binaries() {
      done
      if [[ "${#uncovered[@]}" != 0 ]]; then
        V=2 kube::log::info "Building ${uncovered[*]} without coverage..."
@@ -37,7 +39,7 @@ index e9148ec08fa..71d3c987563 100755
     fi
  }
  
-@@ -725,7 +725,7 @@ kube::golang::build_binaries_for_platform() {
+@@ -730,7 +730,7 @@ kube::golang::build_binaries_for_platform() {
      testpkg=$(dirname "${test}")
  
      mkdir -p "$(dirname "${outfile}")"
@@ -47,5 +49,5 @@ index e9148ec08fa..71d3c987563 100755
        -gcflags "${gogcflags:-}" \
        -asmflags "${goasmflags:-}" \
 -- 
-2.19.1
+2.40.0
 
diff --git a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
index 659e3013..26a9b726 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-cross-don-t-build-tests-by-default.patch
@@ -11,14 +11,16 @@ components without error. As such, we patch the targets out of the
 script to allow a successful build.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  hack/make-rules/cross.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/import/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
-index 8e1e938..0898c5c 100755
---- a/src/import/hack/make-rules/cross.sh
-+++ b/src/import/hack/make-rules/cross.sh
+diff --git a/hack/make-rules/cross.sh b/hack/make-rules/cross.sh
+index f8a6d0dbf5e..d22bf52b1cc 100755
+--- a/hack/make-rules/cross.sh
++++ b/hack/make-rules/cross.sh
 @@ -33,6 +33,6 @@ make all WHAT="${KUBE_NODE_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_NODE_PLATFO
  
  make all WHAT="${KUBE_CLIENT_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_CLIENT_PLATFORMS[*]}"
@@ -29,5 +31,5 @@ index 8e1e938..0898c5c 100755
 -make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
 +#make all WHAT="${KUBE_TEST_SERVER_TARGETS[*]}" KUBE_BUILD_PLATFORMS="${KUBE_TEST_SERVER_PLATFORMS[*]}"
 -- 
-2.7.4
+2.40.0
 
diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
index 3a22a2ef..d3b71aef 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
@@ -7,15 +7,17 @@ Toolchain tupples differs, especially when using vendor provides ones.
 
 Upstream-status: Inappropriate [embedded specific]
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  hack/lib/golang.sh | 4 ----
  1 file changed, 4 deletions(-)
 
-Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
-===================================================================
---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/src/import/hack/lib/golang.sh
-+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import/hack/lib/golang.sh
-@@ -414,19 +414,15 @@
+diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
+index e16a60d1867..d0f4b00dadf 100755
+--- a/hack/lib/golang.sh
++++ b/hack/lib/golang.sh
+@@ -420,19 +420,15 @@ kube::golang::set_platform_envs() {
          ;;
        "linux/arm")
          export CGO_ENABLED=1
@@ -35,3 +37,5 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/src/import
          ;;
      esac
    fi
+--
+2.40.0
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f475bd73..59892c92 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -26,10 +26,10 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.23;name=k
            git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https"
 
 SRC_URI:append = " \
-           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
-           file://0001-cross-don-t-build-tests-by-default.patch \
-           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
-           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
+           file://0001-hack-lib-golang.sh-use-CC-from-environment.patch;patchdir=src/import \
+           file://0001-cross-don-t-build-tests-by-default.patch;patchdir=src/import \
+           file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
+           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
-- 
2.40.0


