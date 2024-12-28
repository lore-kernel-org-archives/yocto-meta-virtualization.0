Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD28AE7718F
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 09:02:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26562.1735376533858858371
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=209293c779=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BS92DCe018254;
	Sat, 28 Dec 2024 09:02:13 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0g7nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 09:02:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 28 Dec 2024 01:02:11 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 28 Dec 2024 01:02:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/3] packagegroup-container: inherit goarch.bbclass
Date: Sat, 28 Dec 2024 17:02:08 +0800
Message-ID: <20241228090210.695265-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=676fbe94 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=Tob4_VV8tZ5vfzhA1AoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: s6J8F7pO4zLgQXiV2vT3hfLwgBIHbmxr
X-Proofpoint-GUID: s6J8F7pO4zLgQXiV2vT3hfLwgBIHbmxr
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9063

The go related recipe (such as docker-moby, podman) inherited
goarch.bbclass in which centralize definition of COMPATIBLE_HOST

Due to the packagegroup runtime depends on these go related recipes,
inherits goarch.bbclass to apply the same COMPATIBLE_HOST

$ echo "MACHINE = 'qemuppc'" >> conf/local.conf
$ bitbake world
ERROR: Nothing RPROVIDES 'podman' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
podman was skipped: incompatible with host powerpc-wrs-linux (not in COMPATIBLE_HOST)
NOTE: Runtime target 'podman' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['podman']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'packagegroup-container', 'podman']

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index 21402d65..3e2d2a25 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -2,7 +2,7 @@ SUMMARY = "All packages for container host"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-inherit packagegroup
+inherit packagegroup goarch
 
 COMPATIBLE_HOST = "^(?!(mips|riscv)).*"
 
-- 
2.34.1


