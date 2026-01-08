Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9246FD148A8
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.940.1767853597117239015
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FzDe+J5/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60850xiU2264063
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5vLeXz7HjRkTpxUosywdaA/dfpmoxrH6nnIDaVu7o6Y=; b=FzDe+J5/gWoc
	XupA2+xjjHw3vyF7UTK8Sm0EtlLODNfkIn5zhM7ppHomfbP8XI5s8ge9gA91Ebzh
	p5406xKgulmweG9dMIvOQQWNDTMH/VUy4fcWVW3EtYFPPTpTbZW16bM1ju6p59/y
	oy0yfAaoLOGNxGJeURNj/PH1UFwP64Sv8SAmz0qT+l6TeyKUgxjDiAl5mXxV234j
	4Y6ZuFQvQd9h2N8+/gQXT/X2YOsIGZB6kvZWcKJMQQGttGjENhhqnyFfZOeiiByD
	hi2QXngmuuY+fCSH6eIn20MfUsI0tm5TJBxoxTsQigk/ggmJn6kqKE+anqVrO7d0
	Q4nxvQtIXA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:36 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:35 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:34 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 05/15] runc: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:18 +0800
Message-ID: <20260108062628.3636344-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX7Drpg2jPfKh6
 0V4EJy/K3acSS3Z+M9G50rQd/RMfhvPAxcWJNYGyCqkqNOjaKzh5075pINNwQxyzY54DxBqokDE
 h85dkp6vZVA1NppCfbKkbxWGPdPuVT5QD0fM7zpUY8fxUT92m7SMrvuh0fr4Qsr+sPhS68eyp4s
 85cssHWoYBkFr42oEBIVED6maigsG0R+V2soPDvSFqoCRYsDxS9m2/cDKMY/U4mgglYNj8v9TID
 b8NdzcCXYB95HPOIr23ksXknjJED6HiEB4zc8RQJ3ZguhBi+uwlhZf7+iuWfbro8EOBQL5BWfCk
 dSua+hcdESV6PuXtD6pL+X5wcvogzFxcimzKxjegShyTY18OlyGKJPsA/I+NgRLAtjMsmCfUd1m
 w5wRu6OFy/Ff/UbSJPnfpAdi1qa6Jg3H1ABmRi0+76M/f6X4NYwsizip9CFpVZVuUMIW4ixsoa9
 Z8sS0jhuO2PQPCxDeLw==
X-Proofpoint-GUID: 9nFSYq9MZWuWSigXTGDFUCvc5lrh3sEW
X-Proofpoint-ORIG-GUID: 9nFSYq9MZWuWSigXTGDFUCvc5lrh3sEW
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e1c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=cOh_YXTtctxUkYfZOzcA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9536

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/runc/runc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index b834ab14..193701eb 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -61,6 +61,7 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO=${GO}
+	export EXTRA_LDFLAGS="-buildid="
 
 	export CFLAGS=""
 	export LDFLAGS=""
-- 
2.34.1


