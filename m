Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14C9C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:21:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.115165.1738671663594790081
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 04:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413012606e=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514BoKMN014593
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 4 Feb 2025 12:21:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8aur3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Feb 2025 12:21:02 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 4 Feb 2025 04:20:59 -0800
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade 1.1.12 -> 1.1.14
Date: Tue, 4 Feb 2025 12:20:34 +0000
Message-ID: <20250204122034.2182589-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a2062e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Ljcx4Z80PikA:10 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=gGsAYKFfswEWyaoDqdMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0x40JTmA20JbrRU215nrbY4TdgWSq1KC
X-Proofpoint-GUID: 0x40JTmA20JbrRU215nrbY4TdgWSq1KC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040099
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Feb 2025 12:21:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9117

From: Divya Chellam <divya.chellam@windriver.com>

Includes fix for CVE-2024-45310 and other bug fixes

Changelog:
==========
https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index afecac67..72acdecb 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "a9833ff391a71b30069a6c3f816db113379a4346"
+SRCREV_runc-docker = "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch;patchdir=src/import \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;patchdir=src/import \
            file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=src/import \
           "
 
-RUNC_VERSION = "1.1.12"
+RUNC_VERSION = "1.1.14"
 
 CVE_PRODUCT = "runc"
-- 
2.40.0


