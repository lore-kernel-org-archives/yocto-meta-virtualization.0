Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA7CC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:29:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7233.1675150151791904748
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 23:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395d7d770=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V6ekhE000672;
	Tue, 31 Jan 2023 07:29:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpau1gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2023 07:29:10 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 30 Jan 2023 23:29:09 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 30 Jan 2023 23:29:08 -0800
From: <mingli.yu@eng.windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/3] yq: fix QA issues
Date: Tue, 31 Jan 2023 15:29:06 +0800
Message-ID: <20230131072907.193332-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WuIIEo0ro0oR-mbWQk-_PADUweGsnMV_
X-Proofpoint-ORIG-GUID: WuIIEo0ro0oR-mbWQk-_PADUweGsnMV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=816 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Jan 2023 07:29:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7838

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: yq-1.13.1+gite0f5cb3c5958e57c7f250a7030e92c768c1b2b19-r0 do_package_qa: QA Issue: /usr/lib64/go/src/github.com/mikefarah/yq/debian/rules contained in package yq-dev requires /usr/bin/make, but no providers found in RDEPENDS:yq-dev? [file-rdeps]
  ERROR: yq-1.13.1+gite0f5cb3c5958e57c7f250a7030e92c768c1b2b19-r0 do_package_qa: QA Issue: /usr/lib64/go/src/github.com/mikefarah/yq/scripts/xcompile.sh contained in package yq-dev requires /bin/bash, but no providers found in RDEPENDS:yq-dev? [file-rdeps]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 0f73362c..daa9ab8f 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -49,8 +49,8 @@ do_compile:prepend() {
 do_install:append() {
     # these bring in dependencies for the -dev package on bash, and we don't
     # need them .. so we remove them to avoid needing that rdepends
-    rm -rf ${D}/${prefix}/lib/go/src/${GO_IMPORT}/debian/rules
-    rm -rf ${D}/${prefix}/lib/go/src/${GO_IMPORT}/scripts
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
 }
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


