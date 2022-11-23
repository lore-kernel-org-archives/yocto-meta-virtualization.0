Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21F1C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 08:55:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15892.1669193739221146667
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 00:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8326628f65=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN8sHvo023244;
	Wed, 23 Nov 2022 00:55:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6b5b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Nov 2022 00:55:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 23 Nov 2022 00:55:35 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 23 Nov 2022 00:55:34 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-realtime][PATCH] README: Update the maintainer part
Date: Wed, 23 Nov 2022 16:55:34 +0800
Message-ID: <20221123085534.3335479-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vLX37npa6jfPseg4M0Jnj_govdPuVA29
X-Proofpoint-GUID: vLX37npa6jfPseg4M0Jnj_govdPuVA29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 mlxlogscore=984
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230067
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 08:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7693

From: Mingli Yu <mingli.yu@windriver.com>

Update the maintainer part to fix the yocto compliance.
  INFO: test_readme (common.CommonCheckLayer)
  INFO:  ... FAIL
  INFO: Traceback (most recent call last):
    File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 38, in test_readme
     self.assertTrue(email_regex.match(data))
  AssertionError: None is not true

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index 4fbc118..5ccbaf8 100644
--- a/README
+++ b/README
@@ -30,5 +30,6 @@ revision: HEAD
 Maintenance
 -----------
 
+Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>
 Please see the MAINTAINERS file for information on contacting the
 maintainers of this layer, as well as instructions for submitting patches. 
-- 
2.25.1


