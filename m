Return-Path: <Michal.Orzel@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D1CC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:38:38 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.72])
 by mx.groups.io with SMTP id smtpd.web11.91865.1701081515878616012
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 02:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=tBuZdfZI;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.72, mailfrom: michal.orzel@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiymCjQ3ecM2dIZWzhJI/Fl3MM0QKbn6AZeYYoDTgFUVQDtciwIvFmqf4HwvhTUm9SoH43kT/dOcxk7/MmheJr5aWINXXC11kZ7OjaolM0t1pCLKXK0X9Lg+5rwg5WNQzAT9UyFz11p477ex9PVpDhkmn71BtkELoPyOG3vKpiFrg6CYxtkmshOMOo3Ry69ri7Ksqx8eGCWmWjH+kkHgFcliCa/WJedBaBUlbNXh6UMHpQTNBDpxdTrYWOEoCORVh4eGkAAalsStTkBQqdNeP/L4V0BwinCEk2LHfD8xIqd+aCtTiBu2e53n+sEtJraTwi8+3AoIA5XZNgzohu1k+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+hgjPE6TcB1xEWGr5MSoMdCPN9RfRPf7ni/xbPJeGo=;
 b=UKAXEbP8VQQvPcvwfc4W5jZVZoChJv7pG1NxfhgYb2bsdOhiUDqUtXEreLs/IALJvMDd71vWWvvgNr0hz8K2Fja6NUIcjMSSox0W8mJAo9DkdrYRRC2qOAIejJDt2U4eMfpviGyuEx6YlDRrP/fTf7INXKK/htTjVSdkxRQPZEdPd44Rw1we+paKRsPWhXoSxRUwK+4VMb86wpMVB67qKR7NGHvHUZKgVF6F72HbPHpQvb7ZKiECSha6mdjSSjXhpLmUfK+r+KZxIjzJtekIMQYlzI3Kg2QHgoXiKYtESoGkxDbUVf95xQmQ57cQGnfNiQH6hz00DZ4tJDwm0XbpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+hgjPE6TcB1xEWGr5MSoMdCPN9RfRPf7ni/xbPJeGo=;
 b=tBuZdfZIoyLoIPXRQ5jUL62oUI18aRfx0r6hzFitAgEgIfGYk0PvIgVuaQSAO+z0EZBcFdzCD/Fm6z+SsT6nbcthpnLPmL281p0UjoWVJHDjGVf/nmCr4Nrvdp7WEnJmv0HyuHPZQjJ17xmIoSQJI4p527meF2qUFUsCkZk5Iiw=
Received: from CH0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:610:74::14)
 by BN9PR12MB5116.namprd12.prod.outlook.com (2603:10b6:408:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:38:32 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::4a) by CH0PR04CA0069.outlook.office365.com
 (2603:10b6:610:74::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 10:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 10:38:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 04:38:26 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 27 Nov 2023 04:38:25 -0600
From: Michal Orzel <michal.orzel@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, <christopher.w.clark@gmail.com>,
	<bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] xen: Bump SRCREV of 4.17 recipes to 4.17.2
Date: Mon, 27 Nov 2023 11:38:10 +0100
Message-ID: <20231127103811.319149-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127103811.319149-1-michal.orzel@amd.com>
References: <20231127103811.319149-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|BN9PR12MB5116:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ed8a8b-af2f-4b1b-ef0e-08dbef35001b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uZah3DeRR/2V7wqIc4lzyypInZvB36sfZ2eW0wYNFIubQ/PQp3wTliXrVIr+6PfeJ6SkcbfptTJkNFHm5+H5tFfdA1iqd9IjXFiUzR4g639OYuASGiw+eP1lmy71Kzx9K5rQ7G71EYPxgJ7DZ8SJ+iTaYF4YadO7wbRoB8fYRozVAwUX0G4JSWdNwL6MOGbahZTQleeGMBOg68V14oNyVeKuCTtwXc5XU/GAUTQnW66Qlwhhq7tnGqWCLfiTsSOgN3i/Gk2pKJ6qir0lZx34ZtjVgGeOR/uQGHa+e/Izk1MBE0tMYTxhKavZ+CrMyFBn2C2YJ0yaJduWJvskcGYcH/EpQieNUI7nRWoShmwfQUO48lkMjjUN4eEvki/k98JsUt/Qoe6X6aw1gl9JczgQdznPKzgE5YRySYDt4wPTZD9wqGuV2GP6fPSDcb60sC2Wlh33c8/ZxaC/Y44y3wKqIczsZr1/tMouoM13V2Y6MSiDELggxF9qsO77Wlj5rSKF2gUZg8OaiBfJAeCb7bk8YdY9VWt+nPAvDPqykbQ7VGIHUBun9CgIrus1nmPdtLzjTMGopwnIFTR02fSJ7xjqdvE1sdqLU64bVkEU/sz6PlR9A31dPGAB3fyoozPe83bnsS33ouM3pvycu9tqoUkd90YBuW5nwaPx0/66lf77duLlshri8EyU9m0qd6tuWqvQB0Vj3w++TJ1svIQkh6wbTP354CczXk0vegyuXLDA0DuiWzfOFyoqi1AY663JSQPN44ZoIi6LNCgLdOtJxW1xnYn0AF4b+sPEvffus07YPgw=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(5660300002)(40460700003)(2906002)(6666004)(86362001)(478600001)(2616005)(1076003)(26005)(316002)(54906003)(6916009)(70206006)(70586007)(8676002)(4326008)(36756003)(8936002)(966005)(47076005)(82740400003)(336012)(426003)(81166007)(83380400001)(356005)(44832011)(36860700001)(40480700001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:38:31.6255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ed8a8b-af2f-4b1b-ef0e-08dbef35001b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5116
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 10:38:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8467

Update Xen and tools 4.17 recipes to use the latest 4.17.2 release.
Remove no longer needed solaris syntax patch.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 ...g-solaris-syntax-for-.section-direct.patch | 70 -------------------
 recipes-extended/xen/xen-tools_4.17.bb        |  4 +-
 recipes-extended/xen/xen_4.17.bb              |  5 +-
 3 files changed, 4 insertions(+), 75 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-solar=
is-syntax-for-.section-direct.patch

diff --git a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-synt=
ax-for-.section-direct.patch b/recipes-extended/xen/files/0001-arm32-Avoid-=
using-solaris-syntax-for-.section-direct.patch
deleted file mode 100644
index a4038dda0826..000000000000
--- a/recipes-extended/xen/files/0001-arm32-Avoid-using-solaris-syntax-for-=
.section-direct.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From dfc490a3740bb7d6889939934afadcb58891fbce Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Aug 2023 10:49:30 -0700
-Subject: [PATCH] arm: Avoid using solaris syntax for .section directive
-
-Assembler from binutils 2.41 will rejects ([1], [2]) the following
-syntax
-
-.section "name", #alloc
-
-for any other any target other than ELF SPARC. This means we can't use
-it in the Arm code.
-
-So switch to the GNU syntax
-
-.section name [, "flags"[, @type]]
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D11601
-[2] https://sourceware.org/binutils/docs-2.41/as.html#Section
-
-Upstream-Status: Backport [https://github.com/xen-project/xen/commit/dfc49=
0a3740bb7d6889939934afadcb58891fbce]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Michal Orzel <michal.orzel@amd.com>
-[jgrall: Reword commit message]
-Acked-by: Julien Grall <jgrall@amazon.com>
----
- xen/arch/arm/arm32/proc-v7.S | 6 +++---
- xen/arch/arm/dtb.S           | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
-index c90a31d80fc5..6d3d19b87354 100644
---- a/xen/arch/arm/arm32/proc-v7.S
-+++ b/xen/arch/arm/arm32/proc-v7.S
-@@ -29,7 +29,7 @@ brahma15mp_init:
-         mcr   CP32(r0, ACTLR)
-         mov   pc, lr
-=20
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_ca15mp_proc_info, #object
- __v7_ca15mp_proc_info:
-         .long 0x410FC0F0             /* Cortex-A15 */
-@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
-=20
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_ca7mp_proc_info, #object
- __v7_ca7mp_proc_info:
-         .long 0x410FC070             /* Cortex-A7 */
-@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
-         .long caxx_processor
-         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
-=20
--        .section ".proc.info", #alloc
-+        .section .proc.info, "a"
-         .type __v7_brahma15mp_proc_info, #object
- __v7_brahma15mp_proc_info:
-         .long 0x420F00F0             /* Broadcom Brahma-B15 */
-diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
-index c39f3a095c58..386f83ba649e 100644
---- a/xen/arch/arm/dtb.S
-+++ b/xen/arch/arm/dtb.S
-@@ -1,3 +1,3 @@
--        .section .dtb,#alloc
-+        .section .dtb, "a"
-         GLOBAL(_sdtb)
-         .incbin CONFIG_DTB_FILE
diff --git a/recipes-extended/xen/xen-tools_4.17.bb b/recipes-extended/xen/=
xen-tools_4.17.bb
index 8309342542ea..c6a3052cd8e1 100644
--- a/recipes-extended/xen/xen-tools_4.17.bb
+++ b/recipes-extended/xen/xen-tools_4.17.bb
@@ -1,5 +1,5 @@
-# stable-4.17 status on 5/26/2023
-SRCREV ?=3D "47eb94123035a2987dd1e328e9adec6db36e7fb3"
+# xen 4.17.2 release sha
+SRCREV ?=3D "322a20add00a4687cd46d9183616fa6fecbef81f"
=20
 XEN_REL ?=3D "4.17"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/xen_4.=
17.bb
index 54da7baf9cc6..8fae2c378933 100644
--- a/recipes-extended/xen/xen_4.17.bb
+++ b/recipes-extended/xen/xen_4.17.bb
@@ -1,5 +1,5 @@
-# stable-4.17 status on 5/26/2023
-SRCREV ?=3D "47eb94123035a2987dd1e328e9adec6db36e7fb3"
+# xen 4.17.2 release sha
+SRCREV ?=3D "322a20add00a4687cd46d9183616fa6fecbef81f"
=20
 XEN_REL ?=3D "4.17"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -7,7 +7,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
-    file://0001-arm32-Avoid-using-solaris-syntax-for-.section-direct.patch=
 \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897d0dbe=
c9"
--=20
2.25.1


