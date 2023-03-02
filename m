Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD18C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 05:45:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8571.1677735912201242940
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 21:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2425655d64=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3225ZovK027309;
	Wed, 1 Mar 2023 21:45:11 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrcu02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 01 Mar 2023 21:45:10 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 1 Mar 2023 21:45:10 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 1 Mar 2023 21:45:09 -0800
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [PATCH] yq: remove .git suffix for cobra component
Date: Thu, 2 Mar 2023 13:45:08 +0800
Message-ID: <20230302054508.2416982-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SBEordrvjdgOJ0cjqqBOfeyBPw_pflJU
X-Proofpoint-ORIG-GUID: SBEordrvjdgOJ0cjqqBOfeyBPw_pflJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_02,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020046
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 05:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7922

From: Mingli Yu <mingli.yu@windriver.com>

Remove the '.git' suffix of the cobra in SRC_URI to make the cobra
SRC_URI exactly the same among the recipes which define cobra to
make sure two local git repos (Yocto supports fetching locally)
which are the same.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 755a6982..45f2f970 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -27,7 +27,7 @@ SRCREV_FORMAT = "yq_color"
 SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
            git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
            git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
-	       git://github.com/spf13/cobra.git;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
+	       git://github.com/spf13/cobra;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
 	       git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
 	       git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
 	       git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
-- 
2.25.1


