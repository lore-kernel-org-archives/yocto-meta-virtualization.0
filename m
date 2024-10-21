Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBEBD3C927
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 02:24:15 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.65])
 by mx.groups.io with SMTP id smtpd.web10.37713.1729477451182344410
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Oct 2024 19:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=z3A56f/A;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.65, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEq0irhOq2RbFxsSZ7dVQ5fSrSC3FOWk0HJpdAToGhDtxHNkai7m4cmVbxSsyuMohr56UUchkV7QdVSn9fTzV2f6GuLzujoYlZReHBEkE9FEjx8xZXt8bkZnRj1fylkEfaIplxdvxdyMOxH1dnu9zz2rbZW3UbyW+dUogVLDDFgfqYXyQPrMev1bLbFS4XdXD1lc/yJbe9WJsGrNJGytHrT1IPhMU5B31knESzmLWr59dVRDHa3n/CDBCAQg6egfhRBolnpMifhA4upHGwmZcRAimNhwZHvfg3kTvkk+jfl6wvObCMwyTyv5mfpEgg9DG8cLDC0e1PJQ3g45GLi2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmGNwF4CxGHrE/Pid0eGpCmKgGV7I1B0BIRdPAtnNug=;
 b=quYyapKNi+EXnkYv9THZdKv7YCd6v4n75j+iRvsq1eO9rXk7VQzzSJanL40O3PTqqbXR1SRA8jj5qlXm6qEFgfGiAxm0Kpx77CxaJH74mjDhzfvGXOqa+JzT6PcE2ENwJaoEcyMTNzfn+prDfqjcrrNBqlmrEViqbuGoXETBrJAI95TzOkvu9Im1/Bd0DG0zKdn175ka4lvrdr/w2wSGR3doaaBUN9V8j22YKQr0uLNclxQouJrETfI8ViedmIuLDOLXJ7LNvLaBL2VEHF2EHJ8bzegdvAVGheXvl6P6eqeIuKHp0/AaAJ2qFOFomdkyx6fU1nu8D2q2IRGjwXCdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmGNwF4CxGHrE/Pid0eGpCmKgGV7I1B0BIRdPAtnNug=;
 b=z3A56f/AZm7pyh5VwYRlSToDli6lOQF0Cxdh9nMcDmSDwjxw+qFh5hf4ZM4TlLjmMgfKbhRvHapu6LH5kBfGzkn5cD2vNEOTswQRS4sppD86tRR1JuphKGGko0pCKjh/1JewMp4a5yWsLHxv3EEOwItOKoXLHX13aLehO0Mb66k=
Received: from CH5P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::25)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Mon, 21 Oct
 2024 02:24:07 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::44) by CH5P223CA0018.outlook.office365.com
 (2603:10b6:610:1f3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 02:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 02:24:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 20 Oct
 2024 21:24:01 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 20 Oct 2024 21:24:01 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<edgar.iglesias@amd.com>
CC: <stefano.stabellini@amd.com>, <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][scarthgap][PATCH] xen-tools.inc: Make qemu-system* as configurable
Date: Sun, 20 Oct 2024 20:23:56 -0600
Message-ID: <20241021022356.3836822-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9aeac7-cb83-4d33-955e-08dcf17770bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?njguJZ8RxeIbgCqKVIjisdK33Ana21QR33kofPwRIDtpL9EbYGRTJpz4qzg8?=
 =?us-ascii?Q?3fCyr65l1T5Sc8FF1H3Ktn2YNExMIZcaZW8bOoqxaqNNHJxx/FhiTIKEWIhD?=
 =?us-ascii?Q?r4QLNuFqecHeMeo8HLddwufrxil4WvrB9z178ojCdlvjU+DbYB9oB+pZaahd?=
 =?us-ascii?Q?MKhQbaBBzNLoN9EqHylwqoXEk46zj7fcKMxb8tTqnZm+7kmdtwb70JK+D1Zx?=
 =?us-ascii?Q?Hd4UMdiRdLkWZbZH0FWzIve5sZo1PJ4AFH9dXaQs/efg7DLaOso0FM+hoHeO?=
 =?us-ascii?Q?0EOa3XxGR/4OF7w1APOHtLcMtvXNygeZ3fsivW9G0nJsClqnR1gDM1fG/WUq?=
 =?us-ascii?Q?ygtMEBnZ3X+iEsN2a5qPymCvpylJVru8h5E9J9+HoFgtcBoBBPQAYK266Hl8?=
 =?us-ascii?Q?si1MWtUrBMeLwsTYt6a9wW+DTlKdHEdEARKsX53eWF6rs1nqbWpRppQTeheR?=
 =?us-ascii?Q?XpkPoUA98iKtiLh5dYbiR3Oh6WCUV7UFQcbkEYPFwfqfCDPGemTvOiTvJbbU?=
 =?us-ascii?Q?COH8LrKVUp1yyKuim744ykfxfqWp0Z7LUFEPkLUjqc1E+tGT43IPRFQS2z/k?=
 =?us-ascii?Q?deETF8Rba8H7PXb39ty1KGaJWjzjQjXcDJkQxCZAgFUdqMwzGr0s6YGJVC4P?=
 =?us-ascii?Q?m37texTWG5ZfI7AMYW+qmPKYZ4mSaXspIKDIAr6rpMsm9OuqcSZoRVQ4Djy5?=
 =?us-ascii?Q?GmE/JKjw75XAB+g4LxACmezu0FC+AwOS5ZvNxL8hsqPy2GIehejNRyQthMl6?=
 =?us-ascii?Q?t8Hd9/UvIaY6JHH3AOeLqrQ6VgSkWXMlP7M9lXnRh4jIVRwthuKCi+V6bOqp?=
 =?us-ascii?Q?FrXkrp8gzyK5dpSaopwkXUdlUCuWfM9AuRDDoGrYlsh+bFnjN0KzM2QgF8oz?=
 =?us-ascii?Q?JTKOGq0nLNDZaKZTnUyp9I0d7nTXH08Hy9nCXdAcmurs++yFtRzVpoNniHPj?=
 =?us-ascii?Q?OvkpKxtV9DtcaH6QNLqsqMV2i4keswWTc03I7ITz55WwWID3ZdZ1nurrU1Y4?=
 =?us-ascii?Q?yT/fizRYhD/9MR+a2fIWfjFke4ZzFCxS/Ijgokc2Akqrbt4XCoSIlWXNS9dU?=
 =?us-ascii?Q?S9S5Vj/q52zjccBL02AD4I5Cgg4HnfjAkj0Ac9/PCyjrGIHlmy91Vt3s+Ivs?=
 =?us-ascii?Q?U4ySwLJTO8+5iMFp194utfWDMzDys2JVLbZASeKC0hDD8JB0sDPBI7VUsoEI?=
 =?us-ascii?Q?xZjS7r8AhAYjh74tUFus241wjep8Z3llIypvJWKABDxT78GQWONSFPmTIn8j?=
 =?us-ascii?Q?Nn4hnOdvEiubjOkEmchzJ7YEUDsbfGmiuRLGCVxuBRhD1M5hMEPd61CePUF7?=
 =?us-ascii?Q?davdQB9ETYnULNjBavz6S6NlI9IzNlfgzv8UOSRWruQD6mAiprcRYu90Re3M?=
 =?us-ascii?Q?pSvEi4PeGj4TkPX3aSo0A5ZC4RGVlKehjbeihgE3Np5pNPmMNQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 02:24:07.3639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9aeac7-cb83-4d33-955e-08dcf17770bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 02:24:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8931

Make qemu-system* as configurable in xen-tools so that it allows
user to switch to qemu-system-aarch64 or other if it is supported by
qemu.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 recipes-extended/xen/xen-tools.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index 72d0b37..7099289 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -748,11 +748,13 @@ SYSTEMD_SERVICE:${PN}-xencommons =3D " \
     "
 SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.service"
=20
+QEMU_SYSTEM ?=3D "qemu-system-i386"
+
 EXTRA_OECONF +=3D " \
     --with-systemd=3D${systemd_unitdir}/system \
     --with-initddir=3D${INIT_D_DIR} \
     --with-sysconfig-leaf-dir=3Ddefault \
-    --with-system-qemu=3D${bindir}/qemu-system-i386 \
+    --with-system-qemu=3D${bindir}/${QEMU_SYSTEM} \
     "
=20
 do_configure() {
--=20
2.34.1


