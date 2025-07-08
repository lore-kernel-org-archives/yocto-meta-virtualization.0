Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB80C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14504.1751966825542738482
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=928421b5da=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5685EUE2008367
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 8 Jul 2025 09:27:04 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19jnp1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:27:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 02:26:49 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 02:26:47 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] podman: fix CVE-2025-6032
Date: Tue, 8 Jul 2025 14:56:57 +0530
Message-ID: <20250708092657.908075-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cnMqLeejW1HdoW4EHZnmJtk_0tsixDNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA3NiBTYWx0ZWRfX0hLTaZVoTWn9 DhcAXtPFRdtKudOOTr/2owjfyGCU/m1hx8ksObZIxoDHRZiH3ZsKsiY08Csbrsa7BX7V0mtqvN/ cROKRTSAjEcgyN26Pu4fzminIvSMpzR/x2aIRdjBIB3Ila7Dx7eLtJbKzkPCMvecCkZHvL1D6d6
 JEzoDflCJe2kYdqEpCEeTPxXJacEpXNY7taHmLn3+vorAz2xlvKBqt9MLPGu1ri61j1WXaeLTRf KqejxCeaMnf01aYJd3icqiNr2akj7/x/4ZtXUeX8PZFyBqsgfId192KHIztMEsKoFPuJt2Fgxwd sxKoNV4ksYlSd9fEXD+knXrufponAMm5UHLleHx3Bp6V2Q1B4qvaULD+jV26D30jYbYCH3miNQE
 LOpTJqsiA5r8WQ9ArcMNBwXHWf1i5KMNSrzliPSjS2Kv0DADZWSurRSQxYUEEhnZLXd2MfXr
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686ce468 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VZzbbjECq-QA:10 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=WuHwPCKnDGjVgVGj2TcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cnMqLeejW1HdoW4EHZnmJtk_0tsixDNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080076
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9300

A flaw was found in Podman. The podman machine init command fails to
verify the TLS certificate when downloading the VM images from an OCI
registry. This issue results in a Man In The Middle attack.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6032

Upstream-patch:
https://github.com/containers/podman/commit/1569c209829530b1f42e8c2fce851de8003ab3fe

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../podman/podman/CVE-2025-6032.patch         | 61 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2025-6032.patch

diff --git a/recipes-containers/podman/podman/CVE-2025-6032.patch b/recipes-containers/podman/podman/CVE-2025-6032.patch
new file mode 100644
index 00000000..b3733e3b
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2025-6032.patch
@@ -0,0 +1,61 @@
+From 1569c209829530b1f42e8c2fce851de8003ab3fe Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Tue, 10 Jun 2025 14:16:46 +0200
+Subject: [PATCH] machine init: fix tls check
+
+Ensure we verify the TLS connection when pulling the OCI image.
+
+Fixes: CVE-2025-6032
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 726b506acc8a00d99f1a3a1357ecf619a1f798c3)
+
+CVE: CVE-2025-6032
+
+Upstream-Status: Backport [https://github.com/containers/podman/commit/1569c209829530b1f42e8c2fce851de8003ab3fe]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ pkg/machine/ocipull/ociartifact.go | 2 +-
+ pkg/machine/ocipull/pull.go        | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pkg/machine/ocipull/ociartifact.go b/pkg/machine/ocipull/ociartifact.go
+index 6c48be1e89..7bc8186caa 100644
+--- a/pkg/machine/ocipull/ociartifact.go
++++ b/pkg/machine/ocipull/ociartifact.go
+@@ -169,7 +169,7 @@ func (o *OCIArtifactDisk) getDestArtifact() (types.ImageReference, digest.Digest
+	}
+	fmt.Printf("Looking up Podman Machine image at %s to create VM\n", imgRef.DockerReference())
+	sysCtx := &types.SystemContext{
+-		DockerInsecureSkipTLSVerify: types.NewOptionalBool(!o.pullOptions.TLSVerify),
++		DockerInsecureSkipTLSVerify: o.pullOptions.SkipTLSVerify,
+	}
+	imgSrc, err := imgRef.NewImageSource(o.ctx, sysCtx)
+	if err != nil {
+diff --git a/pkg/machine/ocipull/pull.go b/pkg/machine/ocipull/pull.go
+index 0822578e8a..85cf5c18ec 100644
+--- a/pkg/machine/ocipull/pull.go
++++ b/pkg/machine/ocipull/pull.go
+@@ -21,8 +21,8 @@ import (
+ // PullOptions includes data to alter certain knobs when pulling a source
+ // image.
+ type PullOptions struct {
+-	// Require HTTPS and verify certificates when accessing the registry.
+-	TLSVerify bool
++	// Skip TLS verification when accessing the registry.
++	SkipTLSVerify types.OptionalBool
+	// [username[:password] to use when connecting to the registry.
+	Credentials string
+	// Quiet the progress bars when pushing.
+@@ -46,7 +46,7 @@ func Pull(ctx context.Context, imageInput types.ImageReference, localDestPath *d
+	}
+
+	sysCtx := &types.SystemContext{
+-		DockerInsecureSkipTLSVerify: types.NewOptionalBool(!options.TLSVerify),
++		DockerInsecureSkipTLSVerify: options.SkipTLSVerify,
+	}
+	if options.Credentials != "" {
+		authConf, err := parse.AuthConfig(options.Credentials)
+--
+2.40.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 8b4f0680..2018c74d 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
     file://run-ptest \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
+    file://CVE-2025-6032.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.40.0


