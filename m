Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9D3CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 09:03:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2146.1693558992467429601
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 02:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=myHypmtd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7608b16c9a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3818l7jG028556
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 1 Sep 2023 09:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=qHMTb
	hxFpPsmBaoGqiASkoY1WaX8L0LXC3+TEpEWB2M=; b=myHypmtdfxllCuzSCspMz
	i1erhAcGUirkxOCdhHGhl/FvmZKTOsA8VQ2bDUvHNgZRBTrGUpp8FUSrObJlSa6B
	Tj5LgThYNLVFva/rZa3zEEpZgMQi7N+5jO+PWeup35XasH5lbAFp6k4+e1iAP/3R
	bdVVOgjExghizsOi/IEf4LC4r3XSzfFrPaOQIwiw6sBi5olfNDnmrQaa6x0x89Fm
	W8klOzFDANHzwnzb0cuAVcGpi2aRxlwrr9WYKdaozC66oysKreZ+7UPxM9JGGqwa
	aFNz2lRbY0ksm/8w/Uyq0dWHY/yWLgdtm/D8gPwz2NKoQM6mhpNIWPjfmHU0FDJD
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c65r1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Sep 2023 09:03:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:03:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 02:03:09 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] oci-image-tools: don't build for riscv64
Date: Fri, 1 Sep 2023 17:03:08 +0800
Message-ID: <20230901090308.3242531-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SbLm0YfEENvJw9yFHDcgr7uXUmpTYy6x
X-Proofpoint-GUID: SbLm0YfEENvJw9yFHDcgr7uXUmpTYy6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=435 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309010084
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Sep 2023 09:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8263

From: Changqing Li <changqing.li@windriver.com>

Currently oci-image-tools has a do_compile error for riscv64. The
problem could be reproduced by:
    MACHINE=qemuriscv64 bitbake oci-image-tools

So explicitly set COMPATIBLE_HOST here to avoid it building for riscv64.
When someone interested in using this recipe for riscv64 fixes the
compile issue, this setting could be removed.

Also don't build packagegroup-container/packagegroup-kubernetes since
they depends on oci-image-tools

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
 recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
 recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 4beb3a63..8c5020b3 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -29,6 +29,8 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 
 S = "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
 
+COMPATIBLE_HOST:riscv64 = "null"
+
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR}/go"
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index 8d418e95..c41576a3 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
+COMPATIBLE_HOST:riscv64 = "null"
+
 PACKAGES = "\
     packagegroup-container \
     packagegroup-lxc \
diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
index 70dc9713..7e6937b1 100644
--- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
+++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
+COMPATIBLE_HOST:riscv64 = "null"
+
 # k3s has this restriction
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
-- 
2.25.1


