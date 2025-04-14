Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62936C369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 13:30:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.49659.1744637406414632464
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 06:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61996c1522=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E8GHUa031353
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 13:30:05 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1j3dr-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 13:30:05 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 14 Apr 2025 06:30:05 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 14 Apr 2025 06:30:03 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] buildah: Fix CVE-2024-9675
Date: Mon, 14 Apr 2025 13:29:56 +0000
Message-ID: <20250414132956.770831-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XVFExkuv3rB2y6iyMmZXfYwe1nkFbxyA
X-Proofpoint-GUID: XVFExkuv3rB2y6iyMmZXfYwe1nkFbxyA
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fd0ddd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VZzbbjECq-QA:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=42iFlUiUFBbd0MXcAigA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140097
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 13:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9221

A vulnerability was found in Buildah. Cache mounts do not properly
validate that user-specified paths for the cache are within our cache
directory, allowing a `RUN` instruction in a Container file to mount an
arbitrary directory from the host (read/write) into the container as long
as those files can be accessed by the user running Buildah.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-9675
https://security-tracker.debian.org/tracker/CVE-2024-9675

Upstream-patch:
https://github.com/containers/buildah/commit/cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../buildah/buildah/CVE-2024-9675.patch       | 113 ++++++++++++++++++
 recipes-containers/buildah/buildah_git.bb     |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 recipes-containers/buildah/buildah/CVE-2024-9675.patch

diff --git a/recipes-containers/buildah/buildah/CVE-2024-9675.patch b/recipes-containers/buildah/buildah/CVE-2024-9675.patch
new file mode 100644
index 00000000..6a655366
--- /dev/null
+++ b/recipes-containers/buildah/buildah/CVE-2024-9675.patch
@@ -0,0 +1,113 @@
+From cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93 Mon Sep 17 00:00:00 2001
+From: Matt Heon <mheon@redhat.com>
+Date: Wed, 9 Oct 2024 15:23:03 -0400
+Subject: [PATCH] Properly validate cache IDs and sources
+
+The `--mount type=cache` argument to the `RUN` instruction in
+Dockerfiles was using `filepath.Join` on user input, allowing
+crafted paths to be used to gain access to paths on the host,
+when the command should normally be limited only to Buildah;s own
+cache and context directories. Switch to `filepath.SecureJoin` to
+resolve the issue.
+
+Fixes CVE-2024-9675
+
+CVE: CVE-2024-9675
+
+Upstream-Status: Backport [https://github.com/containers/buildah/commit/cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ internal/volumes/volumes.go | 19 ++++++++++++++-----
+ tests/bud.bats              | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 48 insertions(+), 5 deletions(-)
+
+diff --git a/internal/volumes/volumes.go b/internal/volumes/volumes.go
+index c07c67ebe..c6d6e3545 100644
+--- a/internal/volumes/volumes.go
++++ b/internal/volumes/volumes.go
+@@ -23,6 +23,7 @@ import (
+	"github.com/containers/storage/pkg/idtools"
+	"github.com/containers/storage/pkg/lockfile"
+	"github.com/containers/storage/pkg/unshare"
++	digest "github.com/opencontainers/go-digest"
+	specs "github.com/opencontainers/runtime-spec/specs-go"
+	selinux "github.com/opencontainers/selinux/go-selinux"
+ )
+@@ -362,7 +363,11 @@ func GetCacheMount(args []string, store storage.Store, imageMountLabel string, a
+			return newMount, nil, fmt.Errorf("no stage found with name %s", fromStage)
+		}
+		// path should be /contextDir/specified path
+-		newMount.Source = filepath.Join(mountPoint, filepath.Clean(string(filepath.Separator)+newMount.Source))
++		evaluated, err := copier.Eval(mountPoint, string(filepath.Separator)+newMount.Source, copier.EvalOptions{})
++		if err != nil {
++			return newMount, nil, err
++		}
++		newMount.Source = evaluated
+	} else {
+		// we need to create cache on host if no image is being used
+
+@@ -379,11 +384,15 @@ func GetCacheMount(args []string, store storage.Store, imageMountLabel string, a
+		}
+
+		if id != "" {
+-			newMount.Source = filepath.Join(cacheParent, filepath.Clean(id))
+-			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, filepath.Clean(id))
++			// Don't let the user control where we place the directory.
++			dirID := digest.FromString(id).Encoded()[:16]
++			newMount.Source = filepath.Join(cacheParent, dirID)
++			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, dirID)
+		} else {
+-			newMount.Source = filepath.Join(cacheParent, filepath.Clean(newMount.Destination))
+-			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, filepath.Clean(newMount.Destination))
++			// Don't let the user control where we place the directory.
++			dirID := digest.FromString(newMount.Destination).Encoded()[:16]
++			newMount.Source = filepath.Join(cacheParent, dirID)
++			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, dirID)
+		}
+		idPair := idtools.IDPair{
+			UID: uid,
+diff --git a/tests/bud.bats b/tests/bud.bats
+index 3a1dbd63a..9e3930f52 100644
+--- a/tests/bud.bats
++++ b/tests/bud.bats
+@@ -6648,3 +6648,37 @@ _EOF
+   assert "$status" -eq 2 "exit code from ls"
+   expect_output --substring "No such file or directory"
+ }
++
++@test "build-check-cve-2024-9675" {
++  _prefetch alpine
++
++  touch ${TEST_SCRATCH_DIR}/file.txt
++
++  cat > ${TEST_SCRATCH_DIR}/Containerfile <<EOF
++FROM alpine
++RUN --mount=type=cache,id=../../../../../../../../../../../$TEST_SCRATCH_DIR,target=/var/tmp \
++ls -l /var/tmp && cat /var/tmp/file.txt
++EOF
++
++  run_buildah 1 build --no-cache ${TEST_SCRATCH_DIR}
++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
++
++  cat > ${TEST_SCRATCH_DIR}/Containerfile <<EOF
++FROM alpine
++RUN --mount=type=cache,source=../../../../../../../../../../../$TEST_SCRATCH_DIR,target=/var/tmp \
++ls -l /var/tmp && cat /var/tmp/file.txt
++EOF
++
++  run_buildah 1 build --no-cache ${TEST_SCRATCH_DIR}
++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
++
++  mkdir ${TEST_SCRATCH_DIR}/cve20249675
++  cat > ${TEST_SCRATCH_DIR}/cve20249675/Containerfile <<EOF
++FROM alpine
++RUN --mount=type=cache,from=testbuild,source=../,target=/var/tmp \
++ls -l /var/tmp && cat /var/tmp/file.txt
++EOF
++
++  run_buildah 1 build --security-opt label=disable --build-context testbuild=${TEST_SCRATCH_DIR}/cve20249675/ --no-cache ${TEST_SCRATCH_DIR}/cve20249675/
++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
++}
+--
+2.40.0
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 288a1cb0..83d861cb 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -34,6 +34,7 @@ SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
+    file://CVE-2024-9675.patch;patchdir=src/github.com/containers/buildah \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.40.0


