Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027F5C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 09:26:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14506.1751966780875587882
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 02:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928421b5da=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568734Px015689
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 8 Jul 2025 02:26:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5jmcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 02:26:19 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 02:26:04 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 02:26:02 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][walnascar][PATCH 1/1] podman: fix CVE-2025-6032
Date: Tue, 8 Jul 2025 14:56:10 +0530
Message-ID: <20250708092610.613429-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA3NiBTYWx0ZWRfX+wuTZngE/WnI 2+DcW0AMfJCzXqu9vU18rg0lGTidtBsNoCxbzxNfBwmge9oCpoN8hFNX5hi5bnJJexCveBBDgUI 3+uUvSIrsa4FXnQ/5HYCgHDlUqpjfBV5YGIZziAOgjpEe3bArt3s4hy6G3AbIIzo0lydwVlfsUs
 G64qzB1SyaI0RGcNdZTb0jforYGQt9qfYGjeV9ykExtAnQhpnPvhQI3fG80rtlm+7MRQVfm4LqC Df7pTknrn3NblQPgtjUZAQC6D4dYTQ55EvttcwsFIJG90/UPR4N643LszzX5xK+WfseWcz3cInx VaGw0Cu6KqGWRtngYJrcL+7ohei08AhFKjS1JKmkwQATqudAKR1jLmBz6RyND33dXl/ubUDbJ3D
 1vTap4d/K/8IX2Ic4BVALJdnL5UVi91NArr1wxKDqyVuP33DCRIaBy09up77qaSj2lATJjRD
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686ce43b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=MkUnBrgfyNUA:10 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=WuHwPCKnDGjVgVGj2TcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KxobPxbX_UPaifsnvAIMII9Q2kj464RM
X-Proofpoint-GUID: KxobPxbX_UPaifsnvAIMII9Q2kj464RM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080076
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 09:26:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9299

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
index 00000000..c1272266
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
+index e144689ffe..75154437e9 100644
+--- a/pkg/machine/ocipull/ociartifact.go
++++ b/pkg/machine/ocipull/ociartifact.go
+@@ -224,7 +224,7 @@ func (o *OCIArtifactDisk) getDestArtifact() (types.ImageReference, digest.Digest
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
index 46c6c969..d98521ba 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
     file://run-ptest \
+    file://CVE-2025-6032.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.40.0


