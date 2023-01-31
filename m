Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC0BC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:29:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7235.1675150168063557327
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 23:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395d7d770=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V736r3006035;
	Mon, 30 Jan 2023 23:29:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rjjgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Jan 2023 23:29:27 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 30 Jan 2023 23:29:26 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 30 Jan 2023 23:29:25 -0800
From: <mingli.yu@eng.windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 3/3] yq: add ptest support
Date: Tue, 31 Jan 2023 15:29:25 +0800
Message-ID: <20230131072925.206428-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3RYt-UcTvDIrelG5-hprEZ_2n8gbqPAt
X-Proofpoint-GUID: 3RYt-UcTvDIrelG5-hprEZ_2n8gbqPAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=933
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Jan 2023 07:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7840

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
 PASS: acceptance.sh
 PASS: bad_args.sh
 PASS: basic.sh
 PASS: bump-version.sh
 PASS: check.sh
 PASS: completion.sh
 PASS: copy-docs.sh
 PASS: coverage.sh
 PASS: devtools.sh
 PASS: empty.sh
 PASS: extract-checksum.sh
 PASS: format.sh
 PASS: front-matter.sh
 PASS: generate-man-page-md.sh
 PASS: generate-man-page.sh
 PASS: header-processing-off.sh
 PASS: inputs-format.sh
 PASS: install-man-page.sh
 PASS: leading-seperator.sh
 PASS: load-file.sh
 PASS: output-format.sh
 PASS: pipe.sh
 PASS: pretty-print.sh
 PASS: release-deb.sh
 PASS: secure.sh
 PASS: setup.sh
 PASS: split-printer.sh
 PASS: test-docker.sh
 PASS: test.sh
 PASS: xcompile.sh

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/yq/files/run-ptest | 10 ++++++++++
 recipes-devtools/yq/yq_git.bb       | 14 +++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100755 recipes-devtools/yq/files/run-ptest

diff --git a/recipes-devtools/yq/files/run-ptest b/recipes-devtools/yq/files/run-ptest
new file mode 100755
index 00000000..3a6876b3
--- /dev/null
+++ b/recipes-devtools/yq/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *.sh`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 867bfccf..755a6982 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -42,12 +42,13 @@ SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
            git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
            git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
            git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
+           file://run-ptest \
            "
 
 PV = "4.30.8+git${SRCREV_yq}"
 GO_IMPORT = "github.com/mikefarah/yq"
 
-inherit go
+inherit go ptest
 
 do_compile:prepend() {
     # arrange for some of the golang built ins to be found
@@ -69,4 +70,15 @@ do_install:append() {
     rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/github.com/mikefarah/yq/scripts/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/github.com/mikefarah/yq/examples ${D}${PTEST_PATH}/tests
+}
+
+RDEPENDS:${PN}-ptest += " \
+    bash \
+"
+
 BBCLASSEXTEND = "native"
-- 
2.25.1


