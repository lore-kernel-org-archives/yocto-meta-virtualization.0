Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0262ED35E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 01:11:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.68])
 by mx.groups.io with SMTP id smtpd.web11.35959.1730855501611393739
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 17:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=n6ag6JA9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.68, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxKQEhP+vOmnB3mL5sRhXIEGSPmNiLZwWvqTB2/Paxx7SNK4R7lHjWjyFrzcGe3iU7UADDHUVb0eR0IHOfYSo6RxWE5JSHDMAvA4e/qW+/+9ZcQafc1GlFeQfyYEEPYY+Ie2DXsRqfAcM+SRvlr2AuDQN1SU0vU4UTLUdU+awfnmVewuk1WfLGvPsRJIP0xhqt6HNST+/O7L7wPeQR8jqn3dEj4/MznNgt2QE/TcFFLx+ZXdBUT4YYlFZNaWO2R2iFaw4LMyP1LyWYY6XPPlK6TXX/yLnjFN+TbC/H4KlKDviPkUsPFS7MuegCOk+yhOdUk22NLl9mp0fFzBnP+4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuNwiuD4No0oIF47GcZ5cgW+TJby7yYZCdfKvnrGtUw=;
 b=gJi3vFSLNaO2BTDhro8OPQAW+Axsz18AlYftnlDvuChjXyc/kbD9eH17vHzHowrerJw59dyo6cAMJW0QmptotXSY4GY+tKLJ/O+dHyajR8k8sgYynKBDhI2bSa2Cf2pUhdfc+OuihLKoxKILHx4tsGG0lgEb0uNvapLo6LnFscTQQWfH8yx/x5bU2O/PxSqtXOvGKw6SEF69S/ZkE/ImIPxzj8EVoeItSdpNcnEuicNbNG5Bhu//Ggcc5xQbaA5lcz8C4kZXJu1AEMf5aR/Z2FVZX+uvcZLpblnFKF0HEGIlwenKnjoQpRej1dIQameGYvBol//0CVX2+eVdpfexvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuNwiuD4No0oIF47GcZ5cgW+TJby7yYZCdfKvnrGtUw=;
 b=n6ag6JA9VE5EXclI04ZdIYwH95ucqcNIraUii163n2RNYbG7UGulENhH8I59fm6O5YAklmc503mNr/qrB8JSHzp9QyywYY69Ch3BMK8pog+dfmwmx3kv4JjVNt39EIzNPZ2iZEuUPv1dLG/0bawVx3wOFuGv+kqzoQqmq4mwDZ31xFObxv57tOd32sPWlDrNW3+r2zDm7wD8nxOBEVdkc0virPmBe4PH3sZ9OkV/uJeXPmuq0YXZJtiK8kpza8r/UEMfwkezARKMIdNmP9KnSb6oEDN8BrUxR6QCbIQuvB0ehKLSCe67AdnoxrRdljHfoCJvJNSJMbg15xbSX1hkXA==
Received: from BN0PR02CA0059.namprd02.prod.outlook.com (2603:10b6:408:e5::34)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Wed, 6 Nov 2024 01:11:38 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::36) by BN0PR02CA0059.outlook.office365.com
 (2603:10b6:408:e5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 01:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 01:11:37 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 18:11:29 -0700
From: <chris.laplante@agilent.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-virtualization][PATCH 1/2] app-container: add space for IMAGE_INSTALL:append
Date: Tue, 5 Nov 2024 20:11:23 -0500
Message-ID: <20241106011124.3978621-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: d2caa44a-7933-4313-91b4-08dcfdfff68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ug6IqrdRP8xo5ozyuAyGH/1XxIaf4y9LJ0T0KEk3l/bR2o0JURGoCfQgS0lV?=
 =?us-ascii?Q?c45DwZVyG7K4jCcZjXRZIoY6kW/cvJCL0fxqs/YMie++1iVOjBJSdenGHL09?=
 =?us-ascii?Q?aNqzuet2QVcLCAME0f06Kex27F3C/vNSW3dUYg+Q/Q6qZmuhc0UuY8onr5dH?=
 =?us-ascii?Q?zc7D0ndaamTUXozrusHK2Nv9s6nBrkZ8kMauYU7SlgUnvtuR2nY0dIHOyB6S?=
 =?us-ascii?Q?GehqFInV+UeL8UJQ3ptOa/asCpjogWMjoD/ZA1emk8oVijbefA1D7XladSzs?=
 =?us-ascii?Q?wTvvK/v+G3iBDRU4rSY1o0U57Sg9w/Nuf3oaXJBx5PCvs2Ox4ipB9HaSNQ09?=
 =?us-ascii?Q?tqUHc7acCl6DImCn+MV52/rmErOgbvKRLlRUc5E0m8j9/yZ7jdB0EU+qUE05?=
 =?us-ascii?Q?MCNiXgEHGIrVK7zIdrZZjQWnQ5WBa+4UQupOYPKDpXgO+ihUS5XycNraZw9N?=
 =?us-ascii?Q?k9icHJpUAdwidpVSLVnToFTa0va0KS97JolTkPwpNqMI3eGI0NcUAi3kB3Vt?=
 =?us-ascii?Q?eVpHtqLjxPIDAHgMP6W/Vdn5mfIa6/rLvdqr8Iw80XycP2smsPD9F/zGRPAQ?=
 =?us-ascii?Q?9nqyMhmNnPu5dQPrLAmr2TLByAwVYfxWda88lgGQDLjuUxIOKfg3wlmg0p5c?=
 =?us-ascii?Q?EzY2fZqpRzg5DtguU3Tt/bbcZBGRdcdVuWaDjHoYi42Q8ZFVp4K3UY13wiE2?=
 =?us-ascii?Q?WepKMWFOLs9yyq3NBerGXymZ/K5zLkoVgoiefaMRKsxdTLPYBC7Oe/+6JPvc?=
 =?us-ascii?Q?RD3/DIjlGPaIKdpj9SP/74jiXxD2COySgkWGeGWIXQ3QWWefGwh+HchNGOFM?=
 =?us-ascii?Q?rggQpEQpAHK4VWRs+fmmajS4pd8ZM9TrgYp0zzyGUQB9prG8djhXrvPsnvjw?=
 =?us-ascii?Q?D+0MaIOVn7N7uSk8lgreRGm66u7EAaUuYU7G4lxnncPPpsJhMrRzgAx5+X4K?=
 =?us-ascii?Q?oK8A55871jT1dD5qNgYMU+pdV5roGGxX+Q4DqwjGloZ+B6IJpTckuq5STsJL?=
 =?us-ascii?Q?hf75T1rSx1gOBnPSAY+6Pnh0RqVFAFpXVf40+ZkY6ICKKFEJ/8/9IAAxJboI?=
 =?us-ascii?Q?CCwhZ4SFyBV1+Da2YLwMYTKcDHL6MIQfcfB+Uagun5kTMV/9ZlkmowQ99Sm/?=
 =?us-ascii?Q?DZ6QJn96z2RuCPNORFnzT+/03r7L6axLJla6zheFgsXA2ZNH7lzXQ0F47oJP?=
 =?us-ascii?Q?RdW5NwZ97olw12jMYEHq3ZOf5p5Iv8mwEWLbPZdfE1vTBwRASYgtOUHSwoXx?=
 =?us-ascii?Q?ZjHmIF1P/8CngY7qFfupZCGXFiS1LLIoquVb8ZPaQsF6+zvmlBVDk0Mc2JpT?=
 =?us-ascii?Q?UPd37leWOzRc695dPShzx9/C+Lurg/2Z1yOGrJ+mGf69vknVyhkFO+TxP9VG?=
 =?us-ascii?Q?09FvzvVbcseW9Jw5Kr/OqjQLuVT0SWdmfEGyhT0j/GnrPcZmig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:11:37.3125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2caa44a-7933-4313-91b4-08dcfdfff68a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Nov 2024 01:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8958

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 recipes-demo/images/app-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-demo/images/app-container.bb b/recipes-demo/images/app=
-container.bb
index 22d2ab9f..8188d57a 100644
--- a/recipes-demo/images/app-container.bb
+++ b/recipes-demo/images/app-container.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;m=
d5=3D3da9cfbcb788c80a0384
 OCI_IMAGE_ENTRYPOINT =3D "/usr/bin/flask-app"
 CONTAINER_SHELL =3D "busybox"
=20
-IMAGE_INSTALL:append =3D "helloworld-flask"
+IMAGE_INSTALL:append =3D " helloworld-flask"
=20
 IMAGE_FSTYPES =3D "container oci"
 inherit image
--=20
2.43.0


