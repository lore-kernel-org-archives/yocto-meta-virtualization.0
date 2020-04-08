Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.56])
 by mx.groups.io with SMTP id smtpd.web11.15632.1586364778952802175
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 09:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=L7EEzPVq;
 spf=pass (domain: xilinx.com, ip: 40.107.237.56, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbAxjS7FlgIXo4j2WIhsq0im/0hy0se+6wq/jYp57/kD6p3yLXmLwV9cXChXtAqHsmSL2ECUSMl1iLMe6lLtohVvdIqo7bvJDlaieVSBVGGKInCLLvXJSMsA9F1DSMeZNmS0ljNAzfJIb1e7JarCtDqOQUT8jpAPAyEnI0CnhHXKvDw9pyG1xzJIwi6IfNe5qZZ7bofCL3UbrmFPfdGwQBmCIPSHA8mHeqLc5IdU5ptjakl91WU6jsL/xQmqoNo+J96+Z4fEyN/IHAMl+czLCZ+VHxGeXzbKPyEAWLeocuZR+W2HF2CwcbQ2cREwJwz3uOD11fFuwPXVQdpxP2SybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jlmn2dapZnemcpud1CVzePTvurw1hO+gZtSJ4MM8s4=;
 b=NnkZGRIhtHE4aH/1WLKlTebRz8pDXclrl29uszh175MgHb2U0WJNYaB91TPawfx7D53hGm8NBujjm/acX7JjOhoqNWkVwJR5vl+OsAwcsvJ/88Jats5gdHWs+0M9uZFVwiZ9z8p0RmNMglp9vcL17JplrM7v4vQo/ottRRnpyRZ9OkFvthMSH4bC2Tc+VI7QGJ7RR8ifuxl6F7rM97XB7PRvPNy9+fyIcR3yL5LhqCTY0CwI9ps4M7IQ7lMD4vb/Ytl6k59uOfFjh5OLW0nhK8j8PqUpfJ+KaY9f5zHm8bl5Ve5Rh/bl0e82SFGdwVTzxxFFGs13JEP1d1zPQ+j6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jlmn2dapZnemcpud1CVzePTvurw1hO+gZtSJ4MM8s4=;
 b=L7EEzPVqBXIIYacwUsnbM0rUqa13XcrhDwr27BWGMAdz3lV5b6Oxy/GsvkLCX+EB8m3mxBTlv9FJ256XhqxUujyNb3/kkKHovwTHpanJWiMACvYXCG9rbBlaJdKV4P0MEwBiCUu+IzpNofiU+kdxyjadiOeqQNIievyoxLjm1uQ=
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by SN6PR02MB3997.namprd02.prod.outlook.com (2603:10b6:805:2b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.22; Wed, 8 Apr
 2020 16:52:50 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:235:cafe::ca) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 16:52:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 16:52:50
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=51366 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwA-0006D4-Ks
	for meta-virtualization@lists.yoctoproject.org; Wed, 08 Apr 2020 09:52:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwX-0001Kt-Sy
	for meta-virtualization@lists.yoctoproject.org; Wed, 08 Apr 2020 09:52:49 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwU-0001KA-17; Wed, 08 Apr 2020 09:52:46 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-virtualization][master][PATCH 1/2] go-build: Set up dependencies and GOPATH before do_compile
Date: Wed,  8 Apr 2020 09:52:40 -0700
Message-Id: <1586364761-16281-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(478600001)(6666004)(81156014)(2616005)(47076004)(26005)(186003)(426003)(316002)(7696005)(5660300002)(82740400003)(81166007)(336012)(2906002)(9786002)(36756003)(8676002)(70586007)(8936002)(70206006)(356004)(6916009)(107886003)(4326008);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1f400e-78bd-41ab-c8a4-08d7dbdd45db
X-MS-TrafficTypeDiagnostic: SN6PR02MB3997:
X-Microsoft-Antispam-PRVS: 
	<SN6PR02MB3997F1CC9EBEAB6893C26306B0C00@SN6PR02MB3997.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0367A50BB1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+3UVU4AupC75ws/WlPQ8sXT2pgYAR8aNamnT1FHKCaAYia2x/cjK12/HT51MeAH9t2VRRxt+7Fn0F43XvKp198O4OAaImK83SVw3af8Hq1P4oan4i+k6wjSGay4+PmDaPjE/Ru3PaU9hs3RfuG3rWWWPKpk5w00ThOx4ElxnBgPUAu2gcENO8eHIRrKK3Fm8lZrvcleYJc0ZpGyHIp05jNoRL1PrmQ8gwjEV4hpx7/PC9YaZzXEFY8GomIvob0eLBIdrWk9r9IWErFSytck9luXYXMDGx3uNenFLUI3MeUb5nUtZDwz/DRRlrKdW1yaJDFJ9pGQ4rQ2M/+dtnCX12B2XuSq8tKrwr/cvTH5cuH62K7aVM9atYgrdi7r9LggzgW5sLKvuGWYh3i2FxnnSLxAVzAzNu6rJrf8kuGIYzO3/eqqaoowDh5Qr90aOBYNnHtzeI7jBMNG18bhm8X9T/6JjTuBE3CzozhQRh9bParqRZIo5dfaaYIrAzRFdaX6CpMdJvYQPmIXZX8etS2LFIw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 16:52:50.2471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1f400e-78bd-41ab-c8a4-08d7dbdd45db
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3997
Content-Type: text/plain

go-build recipe depends on runc source and during compilation tries to run the
command: go get github.com/opencontainers/runc.

This is incorrect as a source fetch shouldn't occur during compilation.  Also,
even after a fetch occurs during compilation, the go build path GOPATH points
to the incorrect path hence the runc source is never found.

Fetch the opencontainers/runc source and create links in the correct GOPATH
before compilation for a successful build.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-devtools/go/go-build_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
index c11ad99..f94a722 100644
--- a/recipes-devtools/go/go-build_git.bb
+++ b/recipes-devtools/go/go-build_git.bb
@@ -3,8 +3,11 @@ SUMMARY = "console for runx"
 DESCRIPTION = "Xen Runtime for OCI"
 
 SRCREV_runx = "da0c75c58ae5232d19b1791c33545db3225e1ea9"
+SRCREV_runc = "e4363b038787addfa12e8b0acf5417d4fba01693"
+
 SRC_URI = "\
 	  git://github.com/lf-edge/runx;nobranch=1;name=runx \
+	  git://github.com/opencontainers/runc.git;nobranch=1;destsuffix=runc;name=runc \
 	  "
 SRC_URI[md5sum] = "0d701ac1e2a67d47ce7127432df2c32b"
 SRC_URI[sha256sum] = "5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769"
@@ -29,6 +32,9 @@ do_compile() {
 
     export GOARCH="${TARGET_GOARCH}"
     cd ${S}/src/import/gobuild
+    mkdir -p go/src/github.com/opencontainers
+    ln -s ${WORKDIR}/runc ${S}/src/import/gobuild/go/src/github.com/opencontainers/runc
+    export GOPATH="${S}/src/import/gobuild/go/src/github.com/opencontainers/runc"
     oe_runmake
 }
 
-- 
2.7.4

