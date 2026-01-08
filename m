Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0315D148AE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.938.1767853595217837525
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s/XCy+0i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084ugnR485994
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=/wrXVLqgVmpGkFztKyjly7ywlR8hVLvqWtpy7FeXVyY=; b=s/XCy+0iwZB+
	7QZ/eo7ftdp83tdCITMJ5gfuqCPhAI8B3ze/EK1+ObSzZcbOHrQ8LdJP23STAbn6
	anpd25JZkEq+LFz/lOAJrRdX0JvEcQEgu60wca1SxGmRTnV5RimniH97ocjKyYU4
	KFTr6d221zPL8CH4IuECjXsm5Q9uV89BiGF+HXw1IIz84an1hl74May7MfIORbBe
	CFx/gX3suesKMBsrizUSVAMOAr1b14r9azmCYNJSJFbdK0x/nxEjWoumxy4DkARR
	66n+kFxV6u1dyB7si9Q600FieGpekMnP6GncZeRhtRzuUC4aBCb/H2sqrhgldwmc
	Xyea7NEopA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0g0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:33 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:32 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 03/15] kubernetes: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:16 +0800
Message-ID: <20260108062628.3636344-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e1a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=880Hzrme4pSuv9t6iRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ufagWnOFBA1teS5N3HtESLsd1YlzLRQJ
X-Proofpoint-ORIG-GUID: ufagWnOFBA1teS5N3HtESLsd1YlzLRQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfXzp+0DY0ewbr/
 LHiC8SmV1nnfR+DiLtEcyr03vp0TCd2i3UIPtahtFfCeBwvKntkq+ZwlnO4/CQPsfNpBgDpfIzp
 LUfbuaV36vXwKe1H8ZemrNjhbSn43p4zrKBTbNvTy99enCnELsBdkEn72uUldt5qYJpCQkeaNXZ
 L8nS+81vxQ+ILHSZKip0yaC+ss1eweWD5uS/eHsqaFPR1s+MYVGC16XM8m5dsVxSZhhWiBxscDt
 3umxW4S3RX0RFuVa2DIhftF6sgGobF8FZgLzP8npQwRzeju0/eEqHlvHkfQxWjZprmAK7CY1rkj
 gGQ9WbacadJaBp0ker9MnSf4Vx9U8dC7sb254/nXv1GuW2red1ZxNhewo9bKgNOQaThxA0/xZ4t
 UDqGD+5+KLsiCmzoE6EoVrcmUJqpL17dh+UOsy8cBHo77RSTbjipXYyExqCLN1MeSpKQMANSU4G
 l203UgHolTGQo1etHOA==
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9534

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index f7b6940a..527be7e0 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -95,7 +95,7 @@ do_compile() {
 	export GOFLAGS="-trimpath"
 
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
-	make cross CGO_FLAGS=${CGO_FLAGS} GO=${GO} KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS="" DBG=1
+	make cross CGO_FLAGS=${CGO_FLAGS} GO=${GO} KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS="-buildid=" DBG=1
 }
 
 do_install() {
-- 
2.34.1


