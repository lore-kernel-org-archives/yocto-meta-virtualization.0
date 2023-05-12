Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE73AC77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 05:04:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17134.1683867846629958028
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 May 2023 22:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4496248e76=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C4eFRx004075
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 May 2023 22:04:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf81judej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 May 2023 22:04:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:04:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 22:04:04 -0700
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] yq: Redefine do_compile
Date: Fri, 12 May 2023 13:04:04 +0800
Message-ID: <20230512050404.1105546-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5U_ebPO7utb2BE_YEW0XxayYdElFpLTk
X-Proofpoint-GUID: 5U_ebPO7utb2BE_YEW0XxayYdElFpLTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_02,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 mlxlogscore=995 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305120043
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 May 2023 05:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8049

From: Mingli Yu <mingli.yu@windriver.com>

This reverts commit 9b87b12885243c8cbba933e218c325416ec4d19d
which states the linkshared issue is resolved. Actually the
issue still exists as build fails on qemuarm64 and we still
need the fix [1]. So add the fix [1] back and it's also better
define its own do_compile and not let the do_compile logic
in go.bbclass affect the build.

[1] https://git.yoctoproject.org/meta-virtualization/commit/?id=d2a630ce6cf67a145f218012fbf02e4d0d9648df
---
 recipes-devtools/yq/yq_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 45f2f970..bd474a79 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
 
 inherit go ptest
 
-do_compile:prepend() {
+do_compile() {
     # arrange for some of the golang built ins to be found
     (
 	cd ${WORKDIR}/build/src/
@@ -60,6 +60,7 @@ do_compile:prepend() {
     # arrange for the fetched dependencies to be found
     export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
     export GO111MODULE=off
+    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
 }
 
 do_install:append() {
-- 
2.25.1


