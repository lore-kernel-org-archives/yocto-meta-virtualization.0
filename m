Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17608C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 10:06:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7401.1692871567587341506
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 03:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ay5wJunt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=760001ddf9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37O6qWoI017826
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 03:06:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=MYkgg
	q2WAVur222DD93fU+/oLPywogQD5//jBiuwr2Y=; b=Ay5wJuntQk15AbXlI64ul
	oXvMdPmf6zX3yaO8xz3E2ulVoBH/iZ+eYrrODz5gqUrlcXvU7vTtOzSQRKwIh+yR
	K6K/H5LQ/fOQMmimpr6ZoVJSvxHsT3V+8TIf50F1OzVkRaifpIm1djQWSF0GMsak
	60KhmErWw4TpsygJntGw4hxxwjwNY5CjDhR928zMfKu4pbayCbdlIUlmtKdjU1d/
	Jnt3T8S03HQGHZVb4UbcnJ9cfQeyMuCYf8iZFI0SOF3G/hoo2qOjm0fYVXpiZyVQ
	1fQRkPTNQMj1iRzbBv0BSQ8hFHNllmSKYgVekYFUEZlWiFJXtRqKdZP0ptmrngAH
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e1nf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 03:06:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 03:06:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 03:06:05 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] go-mux: Switch to main branch
Date: Thu, 24 Aug 2023 18:06:04 +0800
Message-ID: <20230824100604.3935542-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9PdlmknNYRJ9Ure0WV6WcNIfqRaMkbVY
X-Proofpoint-ORIG-GUID: 9PdlmknNYRJ9Ure0WV6WcNIfqRaMkbVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_06,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=621 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308240082
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Aug 2023 10:06:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8228

From: Mingli Yu <mingli.yu@windriver.com>

The project has renamed the master branch to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/go/go-mux_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index 3f939f45..fb4502b6 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "mux"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
 
-- 
2.35.5


