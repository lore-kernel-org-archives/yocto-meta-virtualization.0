Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420E4C02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 02:26:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.28898.1737339968791429133
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Jan 2025 18:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311541b8a6=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K2MwA8003946
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jan 2025 02:26:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4483981bhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jan 2025 02:26:07 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 19 Jan 2025 18:26:05 -0800
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.4 -> 1.1.12
Date: Mon, 20 Jan 2025 02:25:39 +0000
Message-ID: <20250120022539.3172433-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=XcpzzJ55 c=1 sm=1 tr=0 ts=678db43f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Ljcx4Z80PikA:10 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=_S1dPpowp_e6gfEjkUQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vfO1kCk9Ch-hX5Hv820cbz4mSS4nMmL2
X-Proofpoint-ORIG-GUID: vfO1kCk9Ch-hX5Hv820cbz4mSS4nMmL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501200018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jan 2025 02:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9100

From: Divya Chellam <divya.chellam@windriver.com>

This upgrade fixes a few CVEs:
- CVE-2023-27561
- CVE-2023-25809
- CVE-2023-28642
- CVE-2024-21626 and other bug fixes

Changelog:
==========
https://github.com/opencontainers/runc/blob/v1.1.12/CHANGELOG.md

Adjusted existing patches to align with v1.1.12

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 ...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 26 +++++++++-------
 ...001-runc-Add-console-socket-dev-null.patch | 13 +++++---
 .../0001-runc-docker-SIGUSR1-daemonize.patch  | 31 ++++++++++---------
 recipes-containers/runc/runc-docker_git.bb    | 10 +++---
 4 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
index 4d35e58e..79e63322 100644
--- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
@@ -1,7 +1,7 @@
 From 0fe50d2ca4517f5e3070585040f35ace413acd44 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Tue, 24 Aug 2021 11:38:23 -0400
-Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty 
  from static
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
@@ -11,16 +11,20 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  Makefile | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-Index: git/src/import/Makefile
-===================================================================
---- git.orig/src/import/Makefile
-+++ git/src/import/Makefile
-@@ -20,7 +20,7 @@
- 		endif
+diff --git a/Makefile b/Makefile
+index e3af9bc1..f9d6de96 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,8 +24,7 @@ ifneq (,$(filter $(GOARCH),386 amd64 arm arm64 ppc64le riscv64 s390x))
+ 		GO_BUILDMODE := "-buildmode=pie"
  	endif
  endif
--GO_BUILD := $(GO) build -trimpath $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
+-GO_BUILD := $(GO) build -trimpath $(GO_BUILDMODE) \
+-	$(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
 +GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
- 	-ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
- GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
- 	-ldflags "-extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
+ 	-ldflags "$(LDFLAGS_COMMON) $(EXTRA_LDFLAGS)"
+ 
+ GO_BUILDMODE_STATIC :=
+-- 
+2.40.0
+
diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
index bcf4c103..2a24df90 100644
--- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
+++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-dev-null.patch
@@ -12,11 +12,11 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
  utils_linux.go | 5 +++++
  1 file changed, 5 insertions(+)
 
-Index: git/src/import/utils_linux.go
-===================================================================
---- git.orig/src/import/utils_linux.go
-+++ git/src/import/utils_linux.go
-@@ -267,6 +267,11 @@
+diff --git a/utils_linux.go b/utils_linux.go
+index 60d534e8..ddcab62f 100644
+--- a/utils_linux.go
++++ b/utils_linux.go
+@@ -234,6 +234,11 @@ type runner struct {
  }
  
  func (r *runner) run(config *specs.Process) (int, error) {
@@ -28,3 +28,6 @@ Index: git/src/import/utils_linux.go
  	var err error
  	defer func() {
  		if err != nil {
+-- 
+2.40.0
+
diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
index 4350c40f..1065f23e 100644
--- a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
+++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
@@ -25,15 +25,15 @@ is set.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 ---
- signals.go     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++----
+ signals.go     | 56 ++++++++++++++++++++++++++++++++++++++++++++++----
  utils_linux.go |  2 +-
- 2 files changed, 51 insertions(+), 5 deletions(-)
+ 2 files changed, 53 insertions(+), 5 deletions(-)
 
-Index: git/src/import/signals.go
-===================================================================
---- git.orig/src/import/signals.go
-+++ git/src/import/signals.go
-@@ -5,7 +5,9 @@
+diff --git a/signals.go b/signals.go
+index 2555b765..1266ee66 100644
+--- a/signals.go
++++ b/signals.go
+@@ -3,7 +3,9 @@ package main
  import (
  	"os"
  	"os/signal"
@@ -43,7 +43,7 @@ Index: git/src/import/signals.go
  	"github.com/opencontainers/runc/libcontainer"
  	"github.com/opencontainers/runc/libcontainer/system"
  	"github.com/opencontainers/runc/libcontainer/utils"
-@@ -55,9 +57,6 @@
+@@ -53,9 +55,6 @@ type signalHandler struct {
  func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach bool) (int, error) {
  	// make sure we know the pid of our main process so that we can return
  	// after it dies.
@@ -53,7 +53,7 @@ Index: git/src/import/signals.go
  
  	pid1, err := process.Pid()
  	if err != nil {
-@@ -67,12 +66,61 @@
+@@ -65,12 +64,61 @@ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach
  	if h.notifySocket != nil {
  		if detach {
  			_ = h.notifySocket.run(pid1)
@@ -116,11 +116,11 @@ Index: git/src/import/signals.go
  	// Perform the initial tty resize. Always ignore errors resizing because
  	// stdout might have disappeared (due to races with when SIGHUP is sent).
  	_ = tty.resize()
-Index: git/src/import/utils_linux.go
-===================================================================
---- git.orig/src/import/utils_linux.go
-+++ git/src/import/utils_linux.go
-@@ -345,7 +345,7 @@
+diff --git a/utils_linux.go b/utils_linux.go
+index ddcab62f..280051ea 100644
+--- a/utils_linux.go
++++ b/utils_linux.go
+@@ -315,7 +315,7 @@ func (r *runner) run(config *specs.Process) (int, error) {
  	if err != nil {
  		r.terminate(process)
  	}
@@ -129,3 +129,6 @@ Index: git/src/import/utils_linux.go
  		return 0, nil
  	}
  	if err == nil {
+-- 
+2.40.0
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 97373a72..afecac67 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
+SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
-           file://0001-runc-Add-console-socket-dev-null.patch \
-           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
-           file://0001-runc-docker-SIGUSR1-daemonize.patch \
+           file://0001-runc-Add-console-socket-dev-null.patch;patchdir=src/import \
+           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=src/import \
+           file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=src/import \
           "
 
-RUNC_VERSION = "1.1.4"
+RUNC_VERSION = "1.1.12"
 
 CVE_PRODUCT = "runc"
-- 
2.40.0


