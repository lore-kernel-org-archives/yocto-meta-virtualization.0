Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23152C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 02:35:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33671.1670812524218211587
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 18:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9345b5b890=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC2ZNWS004696;
	Mon, 12 Dec 2022 02:35:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mchn0s4md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Dec 2022 02:35:22 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 11 Dec 2022 18:35:21 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 11 Dec 2022 18:35:20 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-cloud-services][PATCH] layer.conf: add meta-virtualization to LAYERDEPENDS
Date: Mon, 12 Dec 2022 10:35:20 +0800
Message-ID: <20221212023520.2601170-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FPyIS_3CquUHmshY5788_tmNqLCcq_yG
X-Proofpoint-ORIG-GUID: FPyIS_3CquUHmshY5788_tmNqLCcq_yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120022
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 02:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7752

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below yocto compliance issue, the libibverbs under
meta-virtualization provides virtual/libibverbs.
  ERROR: Nothing PROVIDES 'virtual/libibverbs' (but /build/layers/meta-cloud-services/recipes-extended/glusterfs/glusterfs_6.1.bb DEPENDS on or otherwise requires it). Close matches:
    virtual/libc
    virtual/libiconv
    virtual/librpc
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'glusterfs', 'virtual/libibverbs']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 conf/layer.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index dca6a109..e089b7d1 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,4 +8,8 @@ BBFILE_COLLECTIONS += "cloud-services-layer"
 BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_cloud-services-layer = "5"
 LAYERSERIES_COMPAT_cloud-services-layer = "langdale"
-LAYERDEPENDS_cloud-services-layer = "core filesystems-layer networking-layer"
+LAYERDEPENDS_cloud-services-layer = "core \
+    filesystems-layer \
+    networking-layer \
+    virtualization-layer \
+"
-- 
2.25.1


