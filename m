Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE1C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7039.1675150152236940748
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 23:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395d7d770=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V6scEM017631;
	Mon, 30 Jan 2023 23:29:11 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rjjfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Jan 2023 23:29:10 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 30 Jan 2023 23:29:10 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 30 Jan 2023 23:29:09 -0800
From: <mingli.yu@eng.windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 2/3] yq: Upgrade to 4.30.8
Date: Tue, 31 Jan 2023 15:29:07 +0800
Message-ID: <20230131072907.193332-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230131072907.193332-1-mingli.yu@eng.windriver.com>
References: <20230131072907.193332-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XWxpzlP6mpGVeliP6nkxLJguMkek8kTZ
X-Proofpoint-GUID: XWxpzlP6mpGVeliP6nkxLJguMkek8kTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Jan 2023 07:29:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7839

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade yq to 4.30.8 [1].

[1] https://github.com/mikefarah/yq/releases/tag/v4.30.8

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 50 +++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index daa9ab8f..867bfccf 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -2,33 +2,49 @@ SUMMARY = "a lightweight and portable command-line YAML processor "
 HOMEPAGE = "https://github.com/mikefarah/yq"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=090d381b4b3eb93194e8cbff4aaae2de"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=e40a0dcd62f8269b9bff37fe9aa7dcc2"
 
-SRCREV_yq = "e0f5cb3c5958e57c7f250a7030e92c768c1b2b19"
+SRCREV_yq = "dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1"
 SRCREV_color = "daf2830f2741ebb735b21709a520c5f37d642d85"
-SRCREV_lexer = "81f720df2c51e9f1e1d387b17a0af386ed2b257d"
-SRCREV_debug = "fa7b53cdfc9105c70f134574002f406232921437"
-SRCREV_errors = "614d223910a179a466c1767a985424175c39b465"
-SRCREV_cobra = "b97b5ead31f7d34f764ac8666e40c214bb8e06dc"
-SRCREV_pflag = "6971c29c4a22981adeaee7f4b437c0cffe08c031"
+SRCREV_lexer = "6cdefc42e112ac71cbe316e1eed264ea62f58e25"
+SRCREV_cobra = "b43be995ebb4bee335a787bd44498b91aef7619c"
+SRCREV_pflag = "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
 SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
-SRCREV_yaml = "eeeca48fe7764f320e4870d231902bf9c1be2c08"
-SRCREV_xerrors="5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
+SRCREV_yaml = "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
+SRCREV_xerrors="65e65417b02f28de84b55f16b46a1e789149973a"
+SRCREV_envsubst = "16035fe3571ad42c7796bf554f978bb2df64231b"
+SRCREV_participle = "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
+SRCREV_utfbom = "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
+SRCREV_orderedmap = "1e43e194ff533a346bab5f9b66b738256f199c8a"
+SRCREV_go-json = "5efc7d07eeeba186df630d9ab4ac78c761938c27"
+SRCREV_copier = "d132b069fe1a77d09e4c260852b389a730bbe9ba"
+SRCREV_properties = "c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264"
+SRCREV_net = "f3363e06e74cdc304618bf31d898b78590103527"
+SRCREV_text = "434eadcdbc3b0256971992e8c70027278364c72c"
+SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
 
 SRCREV_FORMAT = "yq_color"
 SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
            git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
            git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
-           git://github.com/kylelemons/godebug;name=debug;destsuffix=build/vendor/src/github.com/kylelemons/godebug/;branch=master;protocol=https \
-	   git://github.com/pkg/errors;name=errors;destsuffix=build/vendor/src/github.com/pkg/errors/;branch=master;protocol=https \
-	   git://github.com/spf13/cobra;name=cobra;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
-	   git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
-	   git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
-	   git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
+	       git://github.com/spf13/cobra.git;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
+	       git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
+	       git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
+	       git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
            git://github.com/golang/xerrors;name=xerrors;protocol=https;nobranch=1;destsuffix=build/vendor/src/golang.org/x/xerrors \
+           git://github.com/a8m/envsubst;name=envsubst;destsuffix=build/vendor/src/github.com/a8m/envsubst;branch=master;protocol=https \
+           git://github.com/alecthomas/participle;name=participle;destsuffix=build/vendor/src/github.com/alecthomas/participle;branch=master;protocol=https \
+           git://github.com/dimchansky/utfbom;name=utfbom;destsuffix=build/vendor/src/github.com/dimchansky/utfbom;branch=master;protocol=https \
+           git://github.com/elliotchance/orderedmap;name=orderedmap;destsuffix=build/vendor/src/github.com/elliotchance/orderedmap;branch=master;protocol=https \
+           git://github.com/goccy/go-json;name=go-json;destsuffix=build/vendor/src/github.com/goccy/go-json;branch=master;protocol=https \
+           git://github.com/jinzhu/copier;name=copier;destsuffix=build/vendor/src/github.com/jinzhu/copier;branch=master;protocol=https \
+           git://github.com/magiconair/properties;name=properties;destsuffix=build/vendor/src/github.com/magiconair/properties;branch=main;protocol=https \
+           git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
+           git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
+           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
            "
 
-PV = "1.13.1+git${SRCREV_yq}"
+PV = "4.30.8+git${SRCREV_yq}"
 GO_IMPORT = "github.com/mikefarah/yq"
 
 inherit go
@@ -45,12 +61,12 @@ do_compile:prepend() {
     export GO111MODULE=off
 }
 
-
 do_install:append() {
     # these bring in dependencies for the -dev package on bash, and we don't
     # need them .. so we remove them to avoid needing that rdepends
     rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
     rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
 }
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


