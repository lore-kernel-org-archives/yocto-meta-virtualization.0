Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574AAE78D43
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 08:30:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43302.1770625847061787486
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 00:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LT6uM8tF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=650090017b=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6196uc1I3593350
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 9 Feb 2026 00:30:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/ixggt3WYAyne9J41+A5
	h59xet+IPexKMk1gwMCT2V4=; b=LT6uM8tFFNOyk8TEBDE49P7aVAx+Yic1LNFF
	f1BHLVq6FmBmCIJ0TVM0zBTZtzADWBkEhn8LRnYTpwAYt3K64HBRJPckS7bM5BNW
	UqUTdOYVPHMEgjPMtDWau63P0enGxIntHSoIf65fQ5dPfzauI3lyDkChAgoncrUo
	8YhT8C5eXyJlYiLUsjJaYx4v2Lo0GPGt2PrHkwbt/5aTSM35a7Cr9TINuxIqjkvo
	0mIIlqSUXp3Hd6fDHJJNkNABRcgKMTStKLEM2qW7GwQR2btnxw8bQGTKA7vjiQ/P
	zzoGx0nn/QA8ZjXLZ19AKUKAPuSuWmNXEVNjUrE2O8fspCE+vQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4sem3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 00:30:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 00:30:46 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 00:30:45 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2 1/2] improve reproducibility
Date: Mon, 9 Feb 2026 16:30:43 +0800
Message-ID: <20260209083044.394768-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=69899b36 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=vqddSXND65ZkQO179pQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sO8uX8BE2W-2G-fVV21u3fY0s_4tLsug
X-Proofpoint-GUID: sO8uX8BE2W-2G-fVV21u3fY0s_4tLsug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2OCBTYWx0ZWRfX2SbOALyBlNzk
 +h2rxmRvjFeMe7njqXBwcz1ExRDX66dqWoOLD0c+Vker5oHuaS6G1pL7flPk6sbAWCMSGKRdXbi
 cVRomb70fUpU8v6NxHGogN+sZmOoeW1gm55A4YycEsLB9cUPAWLsae/P3c6ZRWDLOpPhgIQT/bU
 euXWaATcGxMKQpjtV/d01dl3W1GtkiRMICmHXdWCap9nhBomkcWjafCOuy6YlP42xP3JBGfiCUL
 56tZEP14KBvCgkMrl5FapuLo2HV3fxC8UXCYZo0S5rCEEeV85IdQcCVnmerfk71gFcfQzvf/Msb
 X989IRoYrQHQ03MDSVUZ17dNU/X+FFXGhgvfwS6qDnl5QqiQjP+1rL/4IrjCwJaJgy3S/jtW00j
 hwzfZt4WLuYGBbPbZG4TXMZsw2+ci2BWAimHIRAmR7hOh1GKQZHczaUL18jIXPwb3osQENFkO7H
 Gut81Vd8wKv6DmPYBMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 08:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9568

From: Changqing Li <changqing.li@windriver.com>

Refer [1], cgo will embeded cgo_ldflags in the intermediary output,
which make content ID will be incfluenced by cgo_ldflags.
'--sysroot=xxx' includes build path, which will make the binary not
reproducible, these recipes can build successfully without --sysroot, so
remove it

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb         | 4 ++--
 recipes-containers/cri-tools/cri-tools_git.bb           | 4 ++--
 recipes-containers/docker-compose/docker-compose_git.bb | 6 +++---
 recipes-containers/docker/docker.inc                    | 4 ++--
 recipes-containers/kubernetes/kubernetes_git.bb         | 7 +++++--
 recipes-containers/nerdctl/nerdctl_git.bb               | 4 ++--
 recipes-containers/podman/podman_git.bb                 | 4 ++--
 recipes-containers/runc/runc.inc                        | 4 ++--
 8 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 081cf354..4a6d26c3 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -48,8 +48,8 @@ do_compile() {
     # Pass the needed cflags/ldflags so that cgo
     # can find the needed headers files and libraries
     export CGO_ENABLED="1"
-    export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-    export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+    export CGO_CFLAGS="${CFLAGS}"
+    export CGO_LDFLAGS="${LDFLAGS}"
     export BUILDTAGS="no_btrfs static_build netgo"
     export CFLAGS="${CFLAGS}"
     export LDFLAGS="${LDFLAGS}"
diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index dad675e8..398c9ab0 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -50,8 +50,8 @@ do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 	export CFLAGS=""
 	export LDFLAGS=""
 	export CC="${CC}"
diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index ccb36a16..1c39c862 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -58,8 +58,8 @@ do_compile() {
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
 	export GOARCH=${TARGET_GOARCH}
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 
 	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 	GO_BUILDTAGS=""
@@ -85,4 +85,4 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 # the AWS dependency is 8GB, try and control the
 # size of the clones
-BB_GIT_SHALLOW = "1"
\ No newline at end of file
+BB_GIT_SHALLOW = "1"
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 99535a77..717874b7 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -82,8 +82,8 @@ do_compile() {
 	# can find the needed headers files and libraries
 	export GOARCH=${TARGET_GOARCH}
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 	export DOCKER_BUILDTAGS='${BUILD_TAGS} ${PACKAGECONFIG_CONFARGS}'
 	export GO111MODULE=off
 
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f7b6940a..092b2475 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -54,6 +54,9 @@ inherit cni_networking
 
 COMPATIBLE_HOST = '(x86_64.*|arm.*|aarch64.*)-linux'
 
+CGO_LDFLAGS ?= "${LDFLAGS}"
+CGO_LDFLAGS:remove = "${DEBUG_PREFIX_MAP}"
+
 do_compile() {
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go:${UNPACKDIR}/git/"
 	cd ${S}
@@ -85,8 +88,8 @@ do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 	export CFLAGS=""
 	export LDFLAGS=""
 	export CC="${CC}"
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8f63b48c..93de77af 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -74,8 +74,8 @@ do_compile() {
         # Pass the needed cflags/ldflags so that cgo
         # can find the needed headers files and libraries
         export GOARCH=${TARGET_GOARCH}
-        export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-        export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+        export CGO_CFLAGS="${CFLAGS}"
+        export CGO_LDFLAGS="${LDFLAGS}"
 
         # -trimpath removes build paths from the binary (required for reproducible builds)
         oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath" binaries
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index f09e01f8..87e694e5 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -88,8 +88,8 @@ do_compile() {
 	# can find the needed headers files and libraries
 	export GOARCH=${TARGET_GOARCH}
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 
 	# podman now builds go-md2man and requires the host/build details
 	export NATIVE_GOOS=${BUILD_GOOS}
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b834ab14..b7e9d72e 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -58,8 +58,8 @@ do_compile() {
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${LDFLAGS}"
 	export GO=${GO}
 
 	export CFLAGS=""
-- 
2.34.1


