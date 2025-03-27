Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3046FC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 07:35:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44762.1743060938509236216
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 00:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5181dd021b=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R68MXd000550
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Mar 2025 07:35:37 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1npxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Mar 2025 07:35:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 27 Mar 2025 00:35:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 27 Mar 2025 00:35:34 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][kirkstone][PATCH  1/1] buildah: upgrade 1.26.8 -> 1.26.9
Date: Thu, 27 Mar 2025 07:35:28 +0000
Message-ID: <20250327073528.3203099-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e4ffc9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Ljcx4Z80PikA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=HHKHgcKQT3EyJd0eD_IA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZywNpthbzwL7mE6xTQEwBhPj2vpP461p
X-Proofpoint-ORIG-GUID: ZywNpthbzwL7mE6xTQEwBhPj2vpP461p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270049
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Mar 2025 07:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9178

This upgrade fixes:
CVE-2024-11218

Changes in this Upgrade:
=========================
This upgrade from Buildah 1.26.8 to 1.26.9 includes important security and stability fixes:
- Fixes CVE-2024-11218
- Resolves TOCTOU error when bind and cache mounts use "src" values
- Fixes cache locks with multiple mounts
- Enhances volume handling and mount label options

For full details, refer to:
https://github.com/containers/buildah/releases/tag/v1.26.9

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 45d7b31d..10597d8a 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
 
 S = "${WORKDIR}/git"
 
-SRCREV_buildah = "e2feca77516568553dc1318019cea90ae000e0f3"
+SRCREV_buildah = "9aaa280f29910a9a0a13b83dd522508f1fa40a91"
 
-PV = "1.26.8"
+PV = "1.26.9"
 
 inherit go
 inherit goarch
-- 
2.40.0


