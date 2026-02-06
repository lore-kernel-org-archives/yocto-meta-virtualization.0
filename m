Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70397EB28FE
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 09:17:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7760.1770369425761231640
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 01:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BF+DAxjC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64976eadc2=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167tS0J315581
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 6 Feb 2026 09:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WGH2kKnMl3iyIyCGzws3
	eGdewlwXYyZ90VNhY4crIeM=; b=BF+DAxjC9Ufh0N8Hk1wQkJRktMfNCUYESt98
	QoM1rM5qZWo98UVo6c48bobltuTDlHA2mx92p7YWgiyX2bA/ZurWv6gMcAVStg1N
	yiPN4DDYogktaft7WuFdzwXkjB+z/9vIi+7StSX7C1OcW+CzSKei/ZFYG0nnkqlZ
	I9mqSDBZ0UKP0dCaqTODwFQweD5Q5S9hpYXhBDPrpXHWGMuCSiPH7tsM8lJeEizS
	66FNLxJDuva8/N/Q/N72i6n8ApCUtCYILO2XVjhI3BnyWxGmaWfQst2LaiLCNXa9
	5jrll23lKoVhYMRXGW9P1BNy1vMAbJI3+89/y4aJ1ZJOL4gN3A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jbu1uxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 09:17:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 6 Feb 2026 01:17:03 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 6 Feb 2026 01:17:02 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/2] improve reproducibility
Date: Fri, 6 Feb 2026 17:17:00 +0800
Message-ID: <20260206091701.3904742-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IOsPywvG c=1 sm=1 tr=0 ts=6985b190 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=_4mt7eb7LMYJj_G0l_wA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfX26Vn/lwO2OeS
 L0K9qN+EyQBkEXrv06Vwj2/13kRQrnML5NNFiQd7C40d2FDtKaOOKIvsVL8xtdmL2IE7JAKi9wo
 qcusGymnMcS9LdW6Ze4hVBNlAqLEScr8dSvkgeJoev6IJRPJnEQit7DoS3SbkoxSrTUmgAxJJyc
 wiuSR13OmL73LrrHVu4QIho/OjISdb1Y6VUDhUK7wtTZtU0pTQBLFNQ5ZPf/kDTwvDpZP4JgeRk
 Aa5Lcd0fPmGL5YO8Koi4Et+U6P6TYIrApN4xtYfIPXpZRMhOIE354Dchy6cEVKgL6YwVLvIpo60
 rGrdLDZhyaNddvanwFUySWVJdkI3N9pjPVzPMYKZe/FQc3L850a+YhSZw/PeNZN5g/EJVBHrP0p
 ZpeQYeZskYURVrxOQP+1z00KyYXGhhJ7Niab4+ieyRcs9kOkl3jRr3W0Hvfk40uwMb2ojC4dO5Z
 /czUQK81mdv77T6dReQ==
X-Proofpoint-ORIG-GUID: tOcDFvwQYsHXpBmBoQ3F1K_x7eathjls
X-Proofpoint-GUID: tOcDFvwQYsHXpBmBoQ3F1K_x7eathjls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 09:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9562

From: Changqing Li <changqing.li@windriver.com>

* Refer [1], cgo will embeded cgo_ldflags in the intermediary output,
  which make content ID will be incfluenced by cgo_ldflags.
  '--sysroot=xxx' includes build path, which will make the binary not
  reproducible, these recipes can build successfully without --sysroot, so
  remove it

* CGO_ENABLED/CGO_CFLAGS/CGO_LDFLAGS already exported in go.bbclass with
  the same value, remove the not needed settings

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb           | 3 ---
 recipes-containers/cri-tools/cri-tools_git.bb             | 5 -----
 recipes-containers/docker-compose/docker-compose_git.bb   | 6 +-----
 .../docker-distribution/docker-distribution_git.bb        | 3 ---
 recipes-containers/docker/docker.inc                      | 4 ----
 recipes-containers/kubernetes/kubernetes_git.bb           | 8 +++++---
 recipes-containers/nerdctl/nerdctl_git.bb                 | 6 ------
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 3 ---
 .../oci-runtime-tools/oci-runtime-tools_git.bb            | 3 ---
 recipes-containers/podman/podman_git.bb                   | 8 --------
 recipes-containers/runc/runc.inc                          | 3 ---
 recipes-containers/skopeo/skopeo_git.bb                   | 3 ---
 recipes-containers/umoci/umoci_git.bb                     | 3 ---
 13 files changed, 6 insertions(+), 52 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 081cf354..3d66e06e 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -47,9 +47,6 @@ do_compile() {
 
     # Pass the needed cflags/ldflags so that cgo
     # can find the needed headers files and libraries
-    export CGO_ENABLED="1"
-    export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-    export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
     export BUILDTAGS="no_btrfs static_build netgo"
     export CFLAGS="${CFLAGS}"
     export LDFLAGS="${LDFLAGS}"
diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index dad675e8..98c43b6b 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -46,12 +46,7 @@ do_compile() {
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	cd ${S}/src/import
 
-	# Build the target binaries
-	export GOARCH="${TARGET_GOARCH}"
 	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CFLAGS=""
 	export LDFLAGS=""
 	export CC="${CC}"
diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index ccb36a16..de9427ae 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -53,13 +53,9 @@ do_compile() {
 
 	# GOMODCACHE, GOPROXY, GOSUMDB, GOTOOLCHAIN are set by go-mod-vcs.bbclass
 	export GOPATH="${S}/src/import/.gopath:${STAGING_DIR_TARGET}/${prefix}/local/go"
-	export CGO_ENABLED="1"
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export GOARCH=${TARGET_GOARCH}
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 	GO_BUILDTAGS=""
@@ -85,4 +81,4 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 # the AWS dependency is 8GB, try and control the
 # size of the clones
-BB_GIT_SHALLOW = "1"
\ No newline at end of file
+BB_GIT_SHALLOW = "1"
diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 5e37fe74..63001331 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -28,12 +28,9 @@ do_compile() {
 	export GOROOT="${STAGING_LIBDIR}/go"
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${TARGET_CFLAGS}"
 	export GO_GCFLAGS=""
-	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 	export GO_BUILD_FLAGS="-trimpath"
 
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 99535a77..b0f52d77 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -80,10 +80,6 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export GOARCH=${TARGET_GOARCH}
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export DOCKER_BUILDTAGS='${BUILD_TAGS} ${PACKAGECONFIG_CONFARGS}'
 	export GO111MODULE=off
 
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f7b6940a..89c53930 100644
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
@@ -70,7 +73,6 @@ do_compile() {
 	export CGO_LDFLAGS="$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?\( \|$\)//g')"
 	export CC="${BUILD_CC}"
 	export LD="${BUILD_LD}"
-
 	# set the toolchain to local to avoid an attempted fetch of
 	# valiation by the build
 	# https://github.com/actions/setup-go/issues/420
@@ -85,8 +87,8 @@ do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	# Pass the needed cflags/ldflags so that cgo can find the needed headers files and libraries
 	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${CFLAGS}"
+	export CGO_LDFLAGS="${CGO_LDFLAGS}"
 	export CFLAGS=""
 	export LDFLAGS=""
 	export CC="${CC}"
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8f63b48c..eb873e23 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -71,12 +71,6 @@ do_compile() {
 
         cd ${S}/src/import
 
-        # Pass the needed cflags/ldflags so that cgo
-        # can find the needed headers files and libraries
-        export GOARCH=${TARGET_GOARCH}
-        export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-        export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
         # -trimpath removes build paths from the binary (required for reproducible builds)
         oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath" binaries
 }
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 36026214..6c355377 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -29,11 +29,8 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${TARGET_CFLAGS}"
-	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 
 	export GOBUILDFLAGS="-trimpath"
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 81f51f9c..0ba69756 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -25,11 +25,8 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${TARGET_CFLAGS}"
-	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 	export GOFLAGS="-mod=vendor"
 
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index f09e01f8..5e5f1f9b 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -78,19 +78,11 @@ do_compile() {
 
 	ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/github.com/varlink"
 
-	export GOARCH="${BUILD_GOARCH}"
 	export GOPATH="${S}/src/.gopath"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 
 	cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
 
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export GOARCH=${TARGET_GOARCH}
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-
 	# podman now builds go-md2man and requires the host/build details
 	export NATIVE_GOOS=${BUILD_GOOS}
 	export NATIVE_GOARCH=${BUILD_GOARCH}
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b834ab14..ebff354f 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -57,9 +57,6 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO=${GO}
 
 	export CFLAGS=""
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 936d2c3d..1542f2a6 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -53,11 +53,8 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${TARGET_CFLAGS}"
-	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
 	export GO111MODULE=off
 	export EXTRA_LDFLAGS="-s -w"
diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index f148b7fa..32868594 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -62,11 +62,8 @@ do_compile() {
 
     # Pass the needed cflags/ldflags so that cgo
     # can find the needed headers files and libraries
-    export CGO_ENABLED="1"
     export CFLAGS=""
     export LDFLAGS=""
-    export CGO_CFLAGS="${TARGET_CFLAGS}"
-    export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
     export GO111MODULE=off
 
-- 
2.34.1


