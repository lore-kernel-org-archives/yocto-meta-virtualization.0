Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB50C25B6F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 15:29:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21116.1698161387206413575
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 08:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=deWS3/yG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86611b9e41=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39OBSaiB021294
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 15:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EmYQ+
	B9ZstLimDCqFM5aCJG8cCnUOLcbF+/aPm9e6MI=; b=deWS3/yG9FVChu07CF83x
	tSG3QroJ3A+5WFcyZnEBJ7iZwsk+i1IV8+1mKVvEUJv7mdlw0UZoMDQBEDDdDXLX
	rh8gfAZFYUSPu4scvomMOipQqB2OOfnIt36RQBO+c42wX8kDHw5b1peACR2XPNyD
	6EHE/AJKsOaCVdsy9T4AcNgcRqc08E+GZKg5b9OCS3ePB5xWPffnKzJYfiQ8qNnd
	vS4TupjKIMN7BeUnbmrKfFWs+h4zJwh10RtFBP8nVdT3Z3SOMBFfHFTpHj03AOA4
	AneFXzYOxRupDzrPkqHG1wiqH3PC5KCxNFt7utml+dAnM/zejtU8w8G5/ZZkZJgR
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv5m5ug07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 15:29:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 24 Oct 2023 08:29:45 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Tue, 24 Oct 2023 08:29:44 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/2] podman & umoci: mark incompatible with mips
Date: Tue, 24 Oct 2023 23:24:14 +0800
Message-ID: <20231024152415.1259420-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9lqrpyRP0U1cWzhl9I7Ala6HYldebG7D
X-Proofpoint-ORIG-GUID: 9lqrpyRP0U1cWzhl9I7Ala6HYldebG7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_16,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=747 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310240133
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 15:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8386

From: Kai Kang <kai.kang@windriver.com>

Since runtime dependency skopeo has been marked incompatible with mips,
set for podman and umoci accordingly.

buildah and podman-tui rdepends on podman, so mark for them too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb       | 2 ++
 recipes-containers/podman-tui/podman-tui_git.bb | 2 ++
 recipes-containers/podman/podman_git.bb         | 2 ++
 recipes-containers/umoci/umoci_git.bb           | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 5155cbb1..ef1feead 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -20,6 +20,8 @@ inherit pkgconfig
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "seccomp ipv6"
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 GO_IMPORT = "github.com/containers/buildah"
 GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes-containers/podman-tui/podman-tui_git.bb
index 1a40d0ec..0b1924f9 100644
--- a/recipes-containers/podman-tui/podman-tui_git.bb
+++ b/recipes-containers/podman-tui/podman-tui_git.bb
@@ -41,6 +41,8 @@ PODMAN_PKG = "github.com/containers/podman-tui"
 inherit go goarch
 inherit pkgconfig
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 do_configure[noexec] = "1"
 
 BUILD_TAGS ?= "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index dc80eb6c..3e9fec33 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -9,6 +9,8 @@ DESCRIPTION = "Podman is a daemonless container engine for developing, \
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 DEPENDS = " \
     go-metalinter-native \
     go-md2man-native \
diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index feaf6dff..62b42b8e 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -17,6 +17,8 @@ GO_IMPORT = "github.com/opencontainers/umoci"
 inherit goarch
 inherit go
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
 EXTRA_OEMAKE="BUILDTAGS=''"
-- 
2.34.1


