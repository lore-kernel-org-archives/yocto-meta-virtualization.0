Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.49])
 by mx.groups.io with SMTP id smtpd.web12.8823.1597210062931524278
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 22:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=YFxExkJV;
 spf=pass (domain: xilinx.com, ip: 40.107.94.49, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2hwUL1yKu8Y2sZOLG7kwnj8Xbnre60XPH984fJ1DfVU+Men/PAIHlA8Htng9OtaS39U5Qcz8JxMrRuJnxkrhJ2YVkrbLeXGs1wylZK0tveFSf81IZaMLRsgoFTNAm3+exBAjQfErDrixO0dFWOh6S3ndD+AXXOfJraYgqK37FZS88ds+XEUYVYnWXPuJUAkcpmeDUin3UW23fqycXwkH25GKml7bTuu4nIp9HGBxZMkXqiA9WQ3zPcgBo9OEXcK+fICxa/BbPOe1xEmb5fUZLy/wXK865I30fIT7VA0WCNiv3zXalyP5NdS57nJ1SuQgEJ1DzVWQNZn8E5CwfxY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfc2fJSd8FgzhfcWb8KMpsIdbORDgDHYfa+6gQaUNGQ=;
 b=Djm4677eqfpW53aHuajcW2az2Rs/qnE/ePM18RYRvMCTgfB+eLXRK2l/0O/rgfGJpq5NRuwcKwcOU5816soUrahxre+K7vQYptW79JkUXjxBusLgtYYEIvb7G7fyWUMYDVXVk0j9Ft8X7n5ud6EZwowxR7MjQm6oo/TuAsAlapZe8s3xWIwO8TT0AM6kh+myQxqCg9vpTnRtAw3lbCwN7fMFSxe9kN0rSqESkQAyv1obkTdS3hiHh86nA+bLVjkUrs46fGnkPAxB1ySHZWNKRCGDqeCY+0dKmIEdZm4aJnnWvRRdNIatozII4xpPZCkuDW5mrCbBFkLypUVbAnxyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfc2fJSd8FgzhfcWb8KMpsIdbORDgDHYfa+6gQaUNGQ=;
 b=YFxExkJVGHTSmBu8Lu0nVT1xMvdVvXJdN7u2xj45ueOcdS2uXS1xmWtwEpR/xNeFsPaXqth0C16n2XSWHzOuCW3gCqUiFDMWs937quMgD/3wWJR/cf/3g6/pcxBED/GONp/bH6wlgPNg+6J0I82QqHmF5KklxfArTC4vuYIwQWg=
Received: from SA0PR11CA0069.namprd11.prod.outlook.com (2603:10b6:806:d2::14)
 by BYAPR02MB4901.namprd02.prod.outlook.com (2603:10b6:a03:46::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Wed, 12 Aug
 2020 05:27:41 +0000
Received: from SN1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d2:cafe::dd) by SA0PR11CA0069.outlook.office365.com
 (2603:10b6:806:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Wed, 12 Aug 2020 05:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT040.mail.protection.outlook.com (10.152.72.195) with Microsoft SMTP
 Server id 15.20.3283.16 via Frontend Transport; Wed, 12 Aug 2020 05:27:39
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=51226 helo=smtp.xilinx.com)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5jIR-0000Sj-2t
	for meta-virtualization@lists.yoctoproject.org; Tue, 11 Aug 2020 22:27:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5jIZ-0001g4-6Z
	for meta-virtualization@lists.yoctoproject.org; Tue, 11 Aug 2020 22:27:39 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1k5jIR-0001aN-9v; Tue, 11 Aug 2020 22:27:31 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-virtualization][master][PATCH] runx: Fix linux kernel versions referenced in the recipe
Date: Tue, 11 Aug 2020 22:27:30 -0700
Message-Id: <1597210050-8813-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6df864c9-11d8-4c87-ea48-08d83e806df6
X-MS-TrafficTypeDiagnostic: BYAPR02MB4901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR02MB4901FFFC87F076BC98F03BDEB0420@BYAPR02MB4901.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y18Uw3IgjgVkDZH1QLdjZYHwRPw4gDrLVxRsRWnmAiaMVZh3gio/SgEgGwv5nc1aSuyl3qnOTPz5XPsH0e3953fJ1Z5Lv+4CKhN2ZyGyTmc9W0WMGUacljfp5RC42k3ccmOFmMpMLWuCrbTA7023M85orjvCd2teDvOGVsV+/TCozBk24QiWk2LAjbat7NWXRqrsUOvDujT+fgYwpTmLoyQq1UMFcobk3MqJLie3QsCkDIwmQtY1PlEgkxQ+vN27NnwAeWXMomzziUodvWrMEaOV+2crEWkc9zjv6pwHE/pfnsA7D8trtFZNAt8FyIXfOg6Nbe3YzXXDOhICwNlInw+wfOO+/bxhKzeFfh7RB/KU1jmpTux9admRgIDKRtyLUYqCEjNO3dgis9f2EMOFpC63qG8edpnK+X338sBpkpmLvnLYSiPHEXL3FN3XwcgNZQJEzyDdIjZVXz+hwriJgqqdTN73SlxQyYDSiAckDAE=
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(396003)(136003)(346002)(376002)(39850400004)(46966005)(70586007)(9786002)(36756003)(81166007)(82740400003)(356005)(47076004)(426003)(70206006)(6916009)(2906002)(5660300002)(107886003)(186003)(8936002)(83380400001)(316002)(336012)(2616005)(966005)(26005)(7696005)(82310400002)(4326008)(478600001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 05:27:39.4539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df864c9-11d8-4c87-ea48-08d83e806df6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4901
Content-Type: text/plain

Fix the linux kernel versions referenced in the recipe. For ease of use, add
variables KERNEL_SRC_VER and KERNEL_URL_VER that can be used to udpate the
linux versions.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-core/runx/runx_git.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index 991e6e1..a260071 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -3,9 +3,13 @@ SUMMARY = "runx stuff"
 DESCRIPTION = "Xen Runtime for OCI"
 
 SRCREV_runx = "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
+
+KERNEL_SRC_VER="linux-5.4"
+KERNEL_URL_VER="v5.x"
+
 SRC_URI = "\
 	  git://github.com/lf-edge/runx;nobranch=1;name=runx \
-          https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.xz;destsuffix=git/kernel/build \
+          https://www.kernel.org/pub/linux/kernel/${KERNEL_URL_VER}/${KERNEL_SRC_VER}.tar.xz;destsuffix=git/kernel/build \
           file://0001-make-kernel-cross-compilation-tweaks.patch \
           file://0001-make-initrd-cross-install-tweaks.patch \
 	  "
@@ -45,12 +49,12 @@ do_compile() {
     # building.
     mkdir -p ${S}/kernel/build
     mkdir -p ${S}/kernel/src
-    cp ${DL_DIR}/linux-4.15.tar.xz ${S}/kernel/build/
+    cp ${DL_DIR}/${KERNEL_SRC_VER}.tar.xz ${S}/kernel/build/
 
     # In the future, we might want to link the extracted kernel source (if
     # we move patches to recipe space, but for now, we need make-kernel to
     # extract a copy and possibly patch it.
-    # ln -sf ${WORKDIR}/linux-4.15 ${S}/kernel/src/
+    # ln -sf ${WORKDIR}/${KERNEL_SRC_VER} ${S}/kernel/src/
 
     # build the kernel
     echo "[INFO]: runx: building the kernel"
-- 
2.7.4

