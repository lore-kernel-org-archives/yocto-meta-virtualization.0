Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAB1C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:56:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12791.1693227402699290038
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 05:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BjE6SZZU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7604b8b7da=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37SCTO1q024644
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 12:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1LMeM
	XPPLPBmRpC8VsVOWpjrbesebWu8EK1Hx8hw+t0=; b=BjE6SZZUYzuue59UOh1xE
	KvmfV6Kr1at8HzCfwRwEvQ2JfCvWIb5D9/i9ldehOstZNSW8l6l1UGh2a1y3nnA0
	1aoxPAX/O/CyqO6upnPfn5ht8HnachQIM/QQlN794yiDpvVEf0MaFoCkR402IQon
	fi/tym6LjZTISTAe8woEmGScEd4Awi2esKumRFDm9BF70a/Q+HoigqomR0M5gYZ8
	CmvQvbFvYBVL3umAMwkJLeu1t2yHKCmifNBteKAog1tWsijhgpJbHoSYK42L6dFR
	KTBgvYMuOCfMNg0Kfg6m1Nz78oWoQod1Lw4/Eb8WOAxM/mvKFoziEP5HeqAeI7x2
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c61mw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 12:56:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 05:56:38 -0700
From: nmali <narpat.mali@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/1] docker-distribution: upgrade to 2.8.2
Date: Mon, 28 Aug 2023 12:56:19 +0000
Message-ID: <20230828125619.3221366-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: tIae4upkbaGWftGGnhs1FBPsiWzEh2jx
X-Proofpoint-GUID: tIae4upkbaGWftGGnhs1FBPsiWzEh2jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_09,2023-08-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308280113
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 12:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8246

From: Narpat Mali <narpat.mali@windriver.com>

Changelog:
https://github.com/distribution/distribution/releases

- Revert registry/client: set Accept: identity header when getting layers by @ndeloof in #3783
- Parse http forbidden as denied by @vvoland in #3914
- Fix CVE-2022-28391 by bumping alpine from 3.14 to 3.16 by @thaJeztah (#3650)
- Fix CVE-2023-2253 runaway allocation on /v2/_catalog by @josegomezr 521ea3d9
- Fix panic in inmemory driver by @wy65701436 in #3815
- bump up golang version (alternative) by @thaJeztah in #3903
- Dockerfile: update xx to v1.2.1 by @thaJeztah in #3907
- update to go1.19.9 by @thaJeztah in #3908
- Add code to handle pagination of parts. Fixes max layer size of 10GB bug by @DavidSpek in #3893
- Dockerfile: fix filenames of artifacts by @thaJeztah in #3911

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index d05d0131..1aad06dc 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution= "dc5b207fdd294c57dfef59017df60088b27d2668"
+SRCREV_distribution= "7c354a4b40feeea21d7eeae4de91c8ff7951e672"
 SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
 
 PACKAGES =+ "docker-registry"
 
-PV = "v2.8.1+git${SRCPV}"
+PV = "v2.8.2+git${SRCPV}"
 S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
-- 
2.40.0


