Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4F8C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 09:02:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26667.1735376534245324678
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=209293c779=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BS92DCf018254
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 09:02:13 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0g7nf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 09:02:13 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 28 Dec 2024 01:02:12 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 28 Dec 2024 01:02:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 2/3] packagegroup-container: support target arch override
Date: Sat, 28 Dec 2024 17:02:09 +0800
Message-ID: <20241228090210.695265-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228090210.695265-1-hongxu.jia@windriver.com>
References: <20241228090210.695265-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=676fbe95 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ftif8peUkJZ7mmCVmJIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BS7YYrCeXeUleyFBZ7sPfSu57gVUxTxV
X-Proofpoint-GUID: BS7YYrCeXeUleyFBZ7sPfSu57gVUxTxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-28_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412280074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 09:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9064

In packagegroup-container, it runtime depends on conmon if DISTRO_FEATURES contains seccomp
but oe-core uses target override loongarch64 to disable seccomp from default feature [1]

$ echo "MACHINE = 'qemuloongarch64'" >> conf/local.conf
$ bitbake world
ERROR: Nothing RPROVIDES 'conmon' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
conmon was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'conmon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['conmon']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-container', 'conmon']

Set 'PACKAGE_ARCH = "${MACHINE_ARCH}"' to make target arch override loongarch64 work

[1] https://github.com/openembedded/openembedded-core/commit/e9177bfc647ffd8d0346154c2673562e3585c7ef

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index 3e2d2a25..ab4cbb6c 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -2,6 +2,8 @@ SUMMARY = "All packages for container host"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup goarch
 
 COMPATIBLE_HOST = "^(?!(mips|riscv)).*"
-- 
2.34.1


