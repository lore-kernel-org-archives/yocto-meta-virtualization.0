Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224AEC41513
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 10:17:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9727.1720520221014434001
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 03:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7920c6e60c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4694XCW6017879
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 9 Jul 2024 10:17:00 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x2mha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 10:16:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 03:16:58 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 03:16:57 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/2] docker-distribution: Enable support for riscv64
Date: Tue, 9 Jul 2024 18:16:56 +0800
Message-ID: <20240709101657.601908-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lAy6KrUgNR5cw2Bqrn1xCs4aT2c-IWak
X-Proofpoint-GUID: lAy6KrUgNR5cw2Bqrn1xCs4aT2c-IWak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_01,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=814
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 10:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8820

From: Mingli Yu <mingli.yu@windriver.com>

Revert [1] to enable support for riscv64.

[1] https://git.yoctoproject.org/meta-virtualization/commit/?id=3626f2c9ccd56c6a3ee51304a7da7aafb395a588

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb              | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 3ed91f12..4e64df4f 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -73,5 +73,3 @@ SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 CVE_PRODUCT = "docker_registry"
-
-COMPATIBLE_HOST:riscv64 = "null"
-- 
2.34.1


