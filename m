Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9882D148B5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.946.1767853605406208933
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LGgQI3aq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6080cVAG070362
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XbJAL6BQbotWsdKQ+rRqhLaSl8nvuzegEf/yUIqkvHU=; b=LGgQI3aqKPA5
	7/cGT3K8X2cfEr+YwAuj/q+2A/CmsQ11M0NsDXQ+UKeYTfkPomglZQoLngaVz+d5
	WnYGLo8u8s8qGkOOxq/b4/VeywEhUJB3EwKE9xIakIN4Pq/rcZSnjdd1GwlAFJRt
	XW4DfU8uInH8nRmsrsEAItgzr2weFHuNSTz4YfKGAwjH1gBL4G1KD46b/2J30C7t
	Qhanhg6U/7B+QVh6l89gSUJaPraS9c0Ea/OHrEG6bwSt9qz1Nn2sET4LlBSPX4vS
	vEttpnKDGfAfcq66bOgglBjlNm9duodcrZn5Js370kPYX8OPNBw9zNc17lNoKcbj
	z9zYTbL5vg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:44 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:43 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:42 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 12/15] cri-o: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:25 +0800
Message-ID: <20260108062628.3636344-13-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e24 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=880Hzrme4pSuv9t6iRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oFLIzwRYRkRZXUcjimOMCJqHoDDMLNyU
X-Proofpoint-ORIG-GUID: oFLIzwRYRkRZXUcjimOMCJqHoDDMLNyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfXxZ3/5EzfD7cj
 xEGxli05ZeLb2X287i5APl6D85Gcft+RnTI5RK/U4eS8Ts1l679tm61rrvTkCf4W3/IvqQaMQXp
 iTnjEND6RaVaZjc4c5Vn7TdIMDc0KCCglcwDnIiXYxTgMc9G3Vska2eGIoU5CXx6a/0raJ8suQP
 O7XWTH98oN9L2N99QqR4GpMJgqw3aV/OreiWBrv9zPnbihV6A+Je1fNIVbDiEF/LKrvDKsy27lT
 fipZnb5mNVPORpN6eMlNntWIZHlPSZMGDojRD5kSUeflLxbO38F/vl4r429DE8BLpN29GBWE5ZB
 +xlzcbN0jVEfQzMdyE7dx/qLxizw5vsNpSsIlxpILybmdX1EPmjHf2+sAzrdEPmlHt1TVmHosBt
 udVqvJ21WWQ+2Q5rhArU4ItengXHuyl5Tv1EjqbCyoeXVzqbHtH2pdX6+7TEt6V2ysMp/tKkl/4
 +E5m7gK/q981vk7mA5Q==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9543

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 0932658c..49662ebc 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -67,6 +67,7 @@ EXTRA_OEMAKE += "GO_TEST='${GO} test -trimpath -buildmode=pie'"
 do_compile() {
 	set +e
 
+	export EXTRA_LDFLAGS="-buildid="
 	cd ${S}/src/import
 
 	oe_runmake local-cross
-- 
2.34.1


