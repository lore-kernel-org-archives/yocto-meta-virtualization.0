Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C651CEFC55
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:14:14 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.59])
 by mx.groups.io with SMTP id smtpd.web10.5610.1728418449602859494
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=LRtV+4ld;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.59, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/34B1D8KBJ0/ANOYaz+6GQgKujZA1ZSD+qFWDlNs2vjtGtjYZw21XRPc/c47Q2l8t0rP3S4C/X7nkOhLKqeI5+WX37M8FapKe8y0ItR4uDbCllls9F0aRwx0I0swiptsDzNuPFa/YzvyzeCLel36EqXU0UqvpijKIWu4aDxKuq5xYNfFqZkHXNbxjqWVUowEjKstRpk6J7+YTI/WPl3y9I5FUiwt6QoKC+vq6pxqjgeIW745C19xFmnnRtBNxhRvPEVNsM0OZVx0XB/zLqal4wsQsJ8T3KZHK+a3CFQ/thUR3sHZj1wWz/QHBhDtY+YSbAEVHSLv/u9judoLNe6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3G1ol1xvw6zzK4VAgoirQWSlTw08v0KzJNHq8gvBLs=;
 b=KUQaImWVYYMrBJIHQsQ8n0DcmayV4kf0NDOQx0CP1jwn6qFNWayE7pQUsQgzIK73oMCm6UuOU64g1kfvcdjFubnAt2GtuyHBZa195tJaDZBfqHig8lfTyNn0jBr+MxADkEnQQi3dbGnwjUgxhRNp16rTkNpFndbWjYm2Flv09Y5mGfL28jVmjHFuBIUzqMb+VgAJBalaHggFA36b0vG/bdczTKmDiyh2qx8p4RIGOLtpQqI+K4zOct4QE60HYrreWG99HIZ9yQ5Cyko+qKR0Xu7yfx82ijUyBIEBY2hsO8RawbR5GbfFeiGR+nCLYAPYqXIBUEhvd5K9Krkfsqxo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3G1ol1xvw6zzK4VAgoirQWSlTw08v0KzJNHq8gvBLs=;
 b=LRtV+4ldcBApw3D2+ltzFtq4A/cCuCir2qu5szPkFXonj0WtCGoiVOPhCqScpEO+AzzgybhzJ2MhLVFGF6tM14lI6haDs+R93RvgBrWQTNAia0S/djeNtf8jtkZ+0l4BIpewlRlxzWQsNXIWCHzLqN+FsUAUBwLZP5Fzqu8KFsY=
Received: from BN8PR07CA0031.namprd07.prod.outlook.com (2603:10b6:408:ac::44)
 by SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 20:14:04 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:ac:cafe::1e) by BN8PR07CA0031.outlook.office365.com
 (2603:10b6:408:ac::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 20:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 20:14:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 15:14:03 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 15:14:03 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scarthgap][PATCH v3] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
Date: Tue, 8 Oct 2024 14:14:03 -0600
Message-ID: <20241008201403.2660125-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SA0PR12MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3e55b5-715f-4f34-12e2-08dce7d5c199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1X41SM/LZWjs93jOCRLD+SDphaa4OHtrZ51DoyXzXXF+85x6MQgaB80H6kxO?=
 =?us-ascii?Q?efjgmg4bxtrx4NK69vkK8VzCd43dyfSNhcSJT393/sB85Mr3UWujt6IXjthq?=
 =?us-ascii?Q?gpXGTZY50wVupvNHB1v0hGw0kWF4VTauCMZY5nbGW0fwotB8dFk8WfTa5A49?=
 =?us-ascii?Q?DBhxWmXph6QMEnFkHywkWQKJzYh9r/bz5hvepj60mHpy7vk8YArarYdtBTHk?=
 =?us-ascii?Q?vinH3RfZgVJ7WWfeAknlBu9DWZUqonyLoHUzAMP2gjJUqzM6Lww8jiWlhQUy?=
 =?us-ascii?Q?LSJFJOJX/E69qk0neS9zQ979BJcjltZCtUzr4ZxyMaApsmFsCNkxt6SDbUKk?=
 =?us-ascii?Q?Rkmiy0VgFVm3A2AckbQfffcvPxkgRRHKcRnkOoZUJXduK68Aog1WgNM370fl?=
 =?us-ascii?Q?ldt6KWPNg8HahxWKEj+kTuTvX2u1dUFCtjm4zhE9yjYnhkxWi6K78piJfaI7?=
 =?us-ascii?Q?kTpLHD5gMb6gKhSuQSrGJCT1adkOfpFiPeHXqvv20kusp06QJTKXxOBNYWTs?=
 =?us-ascii?Q?4OTrGSEtE3f88iqlxVn5IpPH7rZMJnUmoY8DretR8FXk9rriP6Y3wR0UxCci?=
 =?us-ascii?Q?gNFPQOfuI72yFwB5+DNn4fkd6bv7qisKezRZjaUajlZv8ZRSUBsR/O86kLhY?=
 =?us-ascii?Q?peWYCyooqIZJQjiuhrf/1NYqtIIBjmd8i/vhGFyhJR9yrnQbBgcPKE90gu6+?=
 =?us-ascii?Q?wNG0ii/cBhPt++vwVPxoFokCcZCM7P4fy2CN/M5NC/KU8q2HIohBhXB2AvUk?=
 =?us-ascii?Q?ZceQq6DYKKvJk8Bwe5DbBjtifBatDnNOyWqvX/uKawVIU+4BEjl70Y2zCL3e?=
 =?us-ascii?Q?n7GTtskX0Hlxb90uz9IzyY8Tks95B/E8Se2OCBklzHsOYfx5Du/A9ID4CUoD?=
 =?us-ascii?Q?5B1EyXnWmpIaxU3g3fat1ncNvVc6RiyBXC7nIqfUGWAI2FtTnNUAqQYNKEQ6?=
 =?us-ascii?Q?DU4n69zaB3b3ByThtTUHNfrL52jTs7awTNvfTPagN3x0yGeGB89mBj1S/pm8?=
 =?us-ascii?Q?7xRJIf2Hpswowlaq9INmi/6yEh0CE7eSe62k4QnbblxfM+3Z0AxFBqvWomVQ?=
 =?us-ascii?Q?2TJsetdAG56rm3XVWMyZMmOGl4bMvjQvk/EFpQGUs3xm4z3SgLggyE+Kx9dB?=
 =?us-ascii?Q?skKugrLvM7tLgu49LYpdQSwPXdnEv4FZsOkIRvfAxP5C3a7r6y9SeKGUU1st?=
 =?us-ascii?Q?llH4ObAovRlY6WzMe/A2A8WOFZ6lEYbd5YZrXVdESc8GSpgDGQfHJ8jwmSZT?=
 =?us-ascii?Q?OM3vk/wPky3r0mUoBHMw+WOUXLEf/XQOWJe4gzSoYv0mGB8Nm+b30xED2Nck?=
 =?us-ascii?Q?BX9lAGoH/ydPXvn3nxELo0gWgoj+s1y7v1dB4+VP6113UKqPIweNBz0FMpS3?=
 =?us-ascii?Q?lVVqcB103G9vyOfZVnNgjc/77HiU?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 20:14:04.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e55b5-715f-4f34-12e2-08dce7d5c199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8919

Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
are renamed in https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilin=
x-core/recipes-bsp/device-tree/device-tree.bb
recipe.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
Changes in 3:
   - Update merge branch.

Changes in v2:
   - As per Bruce comments add link to device-tree recipe so that others
     will known which one we are tracking.
---
 .../device-tree/device-tree.bbappend          | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbap=
pend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
index e235826..813c08f 100644
--- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
@@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 ENABLE_XEN_DTSI ?=3D ""
 ENABLE_XEN_QEMU_DTSI ?=3D ""
=20
-XEN_EXTRA_OVERLAYS =3D ""
-XEN_EXTRA_QEMU_OVERLAYS =3D ""
+XEN_EXTRA_DT_INCLUDE_FILES =3D ""
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
=20
-XEN_EXTRA_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qem=
u.dtsi"
=20
-XEN_EXTRA_OVERLAYS:versal =3D "versal-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:versal =3D "versal-xen.dtsi versal-xen-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi versal-xen-qem=
u.dtsi"
=20
-XEN_EXTRA_OVERLAYS:versal-net =3D "versal-net-xen.dtsi"
-XEN_EXTRA_QEMU_OVERLAYS:versal-net =3D "versal-net-xen.dtsi versal-net-xen=
-qemu.dtsi"
+XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
+XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi versal=
-net-xen-qemu.dtsi"
=20
-EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('ENABLE=
_XEN_DTSI') =3D=3D '1' else ''}"
-EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getVar('E=
NABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
+EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' if =
d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
+EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILES}=
' if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
--=20
2.34.1


