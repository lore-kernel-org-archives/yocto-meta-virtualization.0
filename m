Return-Path: <haiqing.bai@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E90C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:58:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20659.1780390698731921202
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 01:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BFef/FQy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=061335ca30=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525RwVk761614
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 2 Jun 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NrnqWQCn0klj6rKeYW3S
	exZumbNZk1YKnpCroVC2NXo=; b=BFef/FQydh0/Ee3dDSeMmDl8HCDQKyRZmUFt
	p35UOWp+L7ubW1yI1gfK2EtAiRhaeG5DH7bOa5B/wLU72rm4e1hFea4nmoaWepaN
	rPmqb4tKeGSr/KVLjHAiIb+Z3PQOGOEjTmuxOuSF35IlxsaXAcolVpQjLRd01mkl
	6Wxw3r7z0kXmEnEYk/k17B/oKd5HUZfXts9FMNpTOATxpjKfxjh8opk++gjz+pat
	8ym4iGkirnGxcvBsp92cqBP/Kpvi3lDY4MCK9owJOd3RXobzqF8JNZUM5w/ol19P
	hwI/4hG189ZeBYe/W+v3ImDm6T9hMXptEZdSpetctaXqCBQSRg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8cbnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 08:58:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Jun 2026 01:58:16 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Jun 2026 01:58:16 -0700
From: <haiqing.bai@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [wrynose][PATCH] buildah: upgrade v1.43.0 -> v1.43.1
Date: Tue, 2 Jun 2026 08:58:16 +0000
Message-ID: <20260602085816.1182516-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4MyBTYWx0ZWRfX/wYKY/X8gjcr
 fzgukBRvBJjy+nEskEIDVcExf/mVlduLVxocycJaFD+8ZiWhg0Cw/NmZBIc60hQu/4CoSjCrrow
 gzKNnBfFRVX+UWpS3jgMBLIIW2cqcKqmxy4CMWiz4URGRNGy1d8eOm5qYBJqHvyijWH0guch8Vy
 +Mkxg5xIBJxk+212Sp/7HGWjIZJzr3wv+80zXnw5cYOQbnkqFy6Jf3L3Y2xD0Ga1nHOsdvebrhx
 SQ2gqVYxwbRuJj/g2xET/V7PiY3p7wozHj3olGXqpWB5lbAtastYN7tu7cEIR2gP3/I2zNu2qPw
 Low0zWZ5oAlZLExdx30IWxb2dcOdfpZ4hDZOUctQHEwZpuZFM4DK98oy2mhQqMALgwfywDXQu9Z
 ewG204r4rXuL4o5IAkVnczEl/+TG1WegtLDEjTAn9+bsAxf0R2fzA2dSh3f8bsLX8M5Qr/jZPE+
 YkP8LymZ8YIaiEcbnow==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1e9b29 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=XiIGr2espRQ3g0gg4NgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RXENkDTB0-FCgJsdzd0bPmkgfAuq-he2
X-Proofpoint-ORIG-GUID: RXENkDTB0-FCgJsdzd0bPmkgfAuq-he2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 08:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9841

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Bumping buildah to version v1.43.1, which comprises the following commits:
  310b1c8f5 [release-1.43] Bump Buildah to v1.43.1
  fb349f2d6 [release-1.43] Bump c/common v0.67.1, c/image v5.39.2
  0f4972b35 Merge pull request #6764 from nalind/cache-lookup-race-1.43
  03f12330f Merge pull request #6775 from nalind/go-github.com-go-jose-go-jose-v4-vulnerability-1.43
  44b0820ed Merge pull request #6761 from nalind/fix-chown-1.43
  ccba7c460 update module github.com/go-jose/go-jose/v4 to v4.1.4 [security]
  0d8e18550 ignore ErrLayerUnknown in cache lookup
  8499b1a41 fix setting of gid
  3780f1490 fix call to chown
  bbc4bd12f Merge pull request #6671 from TomSweeneyRedHat/dev/tsweeney/buildah-1.43

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 12b39ec7..3f28fb1c 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "A tool that facilitates building OCI container images."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-BUILDAH_VERSION = "1.43.0"
+BUILDAH_VERSION = "1.43.1"
 
 PV = "${BUILDAH_VERSION}"
 
@@ -25,7 +25,7 @@ GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
-SRCREV = "bbc4bd12f4fc659b7d8f3abb790a2c25b00f33a3"
+SRCREV = "310b1c8f53f3c0a7884f82fe51083577c473490a"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.43;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-- 
2.53.0


