Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7BCD148B0
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.947.1767853606612950448
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g5gMxLgt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608402Ro394420
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qMzZKWETVQ/k0AvsOVNOJ9KIafErr9zcxiDGnrCaVPc=; b=g5gMxLgtvAgW
	4ZP5E1FSQUkJnu5HaAdESO4ks3YGNndCc4iHiVPl8Q++EvXzcADs5tbZnOWmM/Qq
	JdV7+2fNAPfcie6SruuicKMhX5RdairKXgg4vyLU1MvWQi5tG99U+gIeBarQgbkg
	vw7Xee48x0fKz451ml6/b5QLMDQ5iQ2TpbwWnT+iWxxr01sYhyYRzbQBdjdFyVQ5
	g4AwI2yYv5qCk1KIINCQu8o30YZ0c9YMV9V9JODA5sf8ayCkw/io2MezJiuHELVx
	XK9yHoGQy4etRowSlNbTvMFJ1pB8gX+HJ0H0T4berMnvylOn/E8bItkGQ8xxH7Dw
	TYYzzgQ8NA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:45 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:44 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:43 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 13/15] cri-tools: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:26 +0800
Message-ID: <20260108062628.3636344-14-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e25 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=880Hzrme4pSuv9t6iRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sBa80GStCwFhTGAhB8-RRQHHGqe5jKlF
X-Proofpoint-ORIG-GUID: sBa80GStCwFhTGAhB8-RRQHHGqe5jKlF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX2PYVnLV2KAzQ
 t5PgcrM18PW95Ub3jv4RGifRoVJybIR9e41Bh6Ba8y1fBz1KsCzPev8ZoODxrNj8jz4ivsg7tYI
 b0NhEmo6qV/bhTRVdyM8S7h7PpCwK8pzCZj1BfxtkrvIjKl5he/0sJzVrkN2+zyVsKRuRHh7wmR
 N0C+wSdkM1VZthQeT59MAvp59JU3nf5iSpHSMxiIjflQF3UzJoQ0fhwv33+w9yLbpWmmDSdst+k
 DjwJdCq5yXH8rBxkKbOe3jWDx3BmlaK0A3lR0EjRaX17zkTJbXXrnc34k5BDYr/ABqmduUOFMIX
 BiPTndw6Nv3rIbzMNoPpSbjYzb+PM5DWJp4sKF8I40Y4cFWowH9QltZzT9WkFCqGaTG+nHaqpWH
 FyfxpJO8PrrN8mz0G4ElyjnnhsvtPsJ5HPxJo08o2ZKoARwnViBnNuSucmUaHlqdhEMrulKFmJ6
 XSTH2WdXi1DiaN3GiCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9544

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/cri-tools/cri-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index dad675e8..4710c679 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -57,7 +57,7 @@ do_compile() {
 	export CC="${CC}"
 	export LD="${LD}"
 	export GOBIN=""
-
+	export GO_LDFLAGS="-buildid="
 	oe_runmake crictl
 }
 
-- 
2.34.1


