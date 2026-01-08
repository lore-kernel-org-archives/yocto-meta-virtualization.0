Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF52D148B1
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.936.1767853593260840248
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OVBuD/5K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084viFK2258636
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=T4twpRYkcrQ45zKtjM+FwFxVimPPvyJWRp03LufH9a0=; b=OVBuD/5KOqdk
	8e2qY4yRwd20Jz0IVVaQgwZuwrIVwTF0ZRIlLlIkvcLwNbI/eE14bhOkKHoVGn1b
	EvuxgR7A4H/nGlGuaPoglG1ZX8FGvEtUYE0AohKeuYH29+vZDrSFtGdWKuPIiMDr
	lgXCBWe8pK2j+lt7MuSS7qO6AQ6GSKr9ZErvwlzOJN/e80jI9LGG8X1c/wbn9A+a
	YcpwN98K3ug2OHRucIWFjFjWqT3Q6dAMhko3XynVFxYsTB+py94D+qwqkVyCEmcs
	xxtP1a7LyxaUCa0NHTc4VgZY1JGQ0UOTsnE7O0saJ7GfeIQYnyhiWGM0SffVUmOi
	U2Suy8GdpA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:31 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:30 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 01/15] docker-compose: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:14 +0800
Message-ID: <20260108062628.3636344-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX4mswSesz1how
 Cl7/qjjCEzmzmZLxKnduV4HyW0CEX1B+3N3f8NQbeCmUqAaNzqHHbWbF2MPXI7I+3x9oIQwcpfO
 BoAeobo5n635Grabke1IJKpsRMOH3vYxS/5JJqfgeqVHkc7BG9pnrBEdQP3SLGEZi2JUAb468XB
 szoPXWffhFFdJ4Q2VXEorp11uzdt0Un8YBTIIikRnfWnaJVUVW1uZfSpCF54y01y+m5MTF4S223
 CKDm1tqxCHDwp9yGK6vdnG9jp1+vTgnvgcbU3K9v6JNcWuF1Ft+UvCHh7wYRRvflRfw0wRVML6f
 Cb2vMcr1MWPzgozJDClgt7547/T8HPC52sUBUWFDg54DHQctmN8w/o1E35pa1rDM+WjD9GgwNtc
 QK/LaHsKZMlFpmaPUc7NW4qmBDuBwRcan3dpZFneycvhSsaotT7cS68Iqoda8a9Rvmh1S5XeXH/
 pniOP6SER1DKkUxcbxA==
X-Proofpoint-GUID: 68EOObhA8Att8ZM6toJlxfezLsY1wflU
X-Proofpoint-ORIG-GUID: 68EOObhA8Att8ZM6toJlxfezLsY1wflU
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e18 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=N5_ppcHcDyRgGlnZ7zMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9532

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index ccb36a16..443184c0 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -61,7 +61,7 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
-	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
+	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV} -buildid="
 	GO_BUILDTAGS=""
 	mkdir -p ./bin
 	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
@@ -85,4 +85,4 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 # the AWS dependency is 8GB, try and control the
 # size of the clones
-BB_GIT_SHALLOW = "1"
\ No newline at end of file
+BB_GIT_SHALLOW = "1"
-- 
2.34.1


