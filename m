Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E256CC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 08:54:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16413.1718787274669851796
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 01:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69004fd8e1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J5gBd3031850
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 08:54:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdrcfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 08:54:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 01:54:32 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 01:54:32 -0700
From: <liezhi.yang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] yq_git: Set apply=no for SRC_URI diff
Date: Wed, 19 Jun 2024 01:54:32 -0700
Message-ID: <20240619085432.371189-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q0oxrLUYhCwm-y5-GYf-OMz6MRHpY13Z
X-Proofpoint-GUID: Q0oxrLUYhCwm-y5-GYf-OMz6MRHpY13Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=932 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406190065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 08:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8804

From: Robert Yang <liezhi.yang@windriver.com>

Fixed a do_patch error use git shallow tarball (BB_GIT_SHALLOW = "1"):

$ bitbake yp -cpatch

ERROR: do_patch: Importing patch 'github.com.pkg.diff' with striplevel '1'

The github.com.pkg.diff is ud.clonedir of git://github.com/pkg/diff:
* When use regular git repo as source, oe.patch.patch_path() will NOT
  handle it as a patch since the directory github.com.pkg.diff exists,
  and nothing is wrong.

* When use git shallow tarball, the github.com.pkg.diff doesn't exist since
  it is fetched as a tarball, then oe.patch.patch_path() will handle it
  as a patch, then the error happens.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 014101ba..a1adfc96 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -41,7 +41,7 @@ SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https;destsuffix=${
            git://github.com/magiconair/properties;name=properties;destsuffix=build/vendor/src/github.com/magiconair/properties;branch=main;protocol=https \
            git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
            git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
-           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
+           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https;apply=no \
            file://run-ptest \
            "
 
-- 
2.45.1


