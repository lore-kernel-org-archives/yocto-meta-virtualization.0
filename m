Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F67C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 13:49:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20122.1716299354248785570
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 May 2024 06:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5871faa96d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L5GqNU023051
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 06:49:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y8hueggyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 06:49:13 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 06:49:11 -0700
From: yurade <yogita.urade@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/1] buildah: upgrade to 1.34.3
Date: Tue, 21 May 2024 13:48:53 +0000
Message-ID: <20240521134853.1212387-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: jKk1FN5KfhmjWmw-pafj6KRHydRwrgjQ
X-Proofpoint-GUID: jKk1FN5KfhmjWmw-pafj6KRHydRwrgjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=941 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405210104
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 13:49:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8735

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for: CVE-2024-1753

Changelog:
=========
2db756331 (tag: v1.34.3) [release-1.34] Bump Buildah to v1.34.3
699d1ed51 [release-1.34] CVE-2024-24786 protobuf to 1.33
4ffe07267 Merge pull request #5419 from TomSweeneyRedHat/dev/tsweeney/cve-1.34
968e8ab62 [release-1.34] Bump to Buildah v1.34.3-dev
776a1463d (tag: v1.34.2) [release-1.34] Bump to Buildah v1.34.2
afc086b65 conformance tests: don't break on trailing zeroes in layer blobs
3deda1913 [release-1.34] CVE-2024-1753 container escape fix
14d60c988 Merge pull request #5365 from edsantiago/skip_unshare_on_rhel--1.34
4f775b4a1 tests: skip_if_no_unshare(): check for --setuid
dbeb097c6 Merge pull request #5352 from TomSweeneyRedHat/dev/tsweeney/buildah_1_34_1

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 64ee4f7d..90ffc238 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
 
 S = "${WORKDIR}/git"
 
-BUILDAH_VERSION = "1.34.1"
+BUILDAH_VERSION = "1.34.3"
 
 PV = "${BUILDAH_VERSION}"
 
@@ -28,7 +28,7 @@ GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
 SRCREV_FORMAT = "buildah_storage"
-SRCREV_buildah = "dbeb097c6fbf4bfd643f096992da572a97a8ec12"
+SRCREV_buildah = "2db756331014a4f355507df47d2622d05532da1f"
 SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 
 SRC_URI = " \
-- 
2.40.0


