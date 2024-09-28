Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE68FCF6492
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 00:06:40 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.56])
 by mx.groups.io with SMTP id smtpd.web10.4715.1727481995422783643
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 17:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=DXlCuI1P;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.56, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtptxJ0HCuHZebmOsF1ClL5wAMpnTGHmcu4qQkp3cATYSPTFw/AVoTWNGpIMSfmDrJLsRRe8exIV5n4JKAycw7Jqwa/PoZsSE9TEUA4HWnOnUeQ8Z0gyAUUQIFXmJd3Tj2nIZPadZdEfSlez0eyWOjIwo+bi2IjL/dwZ9RTgYJEszqtAzNVHQVzKc+gsITrdgZExHL1PbqBgXrkicmY8AvPeut4tpL8Mk2ApsHru/43jbIzOttP96dvA7IdSZ+pJz7qe2AQkkHWv+btZ2PJAcoydd/ftmXxWejtbo7bwnoElk1cqjCYt6Q/DiYbeG0LjZTJzM45EDF7KcQazpm6XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgzPUzJCQdqIofMO0pBfWdS3aJx3HkwBnriViGHLIuY=;
 b=X5cw70SmuYlhLlTS2E/BV1pwJwO0c7BvKFlK4WR+1d5xWoTlKQ2kQBsQ0X7iYrgU0mAtbgKB7BahdPhUjn5nMsZpQ1fDNDHvsYFHzR34RP6Kf6blvTEs3UlLHc/fTLi0M/3LkRNONvGIi43YMIqYTRrUmb5vL6cz0xZSJYdNsKG0+fKfkPphaitb1v+cPuQDIdpD+9u2aMUSA/9L3iulFT4TNYY3BoOEmYNDHeel1ptEAcicOD8Cj9bOOFr2Xk3U5IZmCKSEJRMGw1lDKglRByqqpMRYKWjKMqp7CG8AG/i6TNCWj7QUrLzsv8Q38ieyQYRieZHkm5XMo0GuB2UQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgzPUzJCQdqIofMO0pBfWdS3aJx3HkwBnriViGHLIuY=;
 b=DXlCuI1PIaAVNFJB6wXcoEt0DvoNHBMXe8pgSUiQLIsdkm4mdd2UsSo5RZzScza1JsZyoxNhEq5YJ6viZftpz4wtHCI3uacNlAKbsx+KxAMcXdvF7ClyW5LhOdyKwpNXZ+7I6ylZK0JKulCEdRSz0vw2nsOYLJWbqc6mNZUC+dw=
Received: from BYAPR06CA0023.namprd06.prod.outlook.com (2603:10b6:a03:d4::36)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Sat, 28 Sep
 2024 00:06:31 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::47) by BYAPR06CA0023.outlook.office365.com
 (2603:10b6:a03:d4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Sat, 28 Sep 2024 00:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Sat, 28 Sep 2024 00:06:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 19:06:28 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 27 Sep 2024 19:06:27 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>
Subject: [meta-virtualization][master][scathgap][PATCH] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
Date: Fri, 27 Sep 2024 18:06:22 -0600
Message-ID: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: sandeep.gundlupet-raju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: f1983550-731c-4689-dc24-08dcdf516799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dDthNewmmlChxMse5girs9MrVvBcJxKvyYC9CT7f2OLiZtNowlNxNoholqCh?=
 =?us-ascii?Q?5N55Db7McCfn4maxBBD0+BnpvQRbp4lRHe9/L2vfSSSYHsf2AVu8ADonzXo9?=
 =?us-ascii?Q?KnAcVW+S5wzkRTjW0uQXDZTVDRF+ilktf5SE0pA7mGp+NEz0TfL+kzb95gxS?=
 =?us-ascii?Q?T1XIehhsxAnsLesLsZylFI0TLKVjOxCsutzYBYdv5wEVgZ6WDfJCnVvwUvjj?=
 =?us-ascii?Q?10IRmoF6xXLCeBOaGV/h7SB7RQ8bKlyXIHj9V3T02pVlTl1QQQsLKeO/biiX?=
 =?us-ascii?Q?bxDcv2e3cWYmkU373VehquDmZWObpxKVXaYyQebmYBvTUi4U/+OsFX+yevkn?=
 =?us-ascii?Q?XsdwG7l+iltXKmfoUOmKeb5WPjrzpsvQuVp0HDdlll8aoOcG1c3ZrU17YB9j?=
 =?us-ascii?Q?uVDzPISBAte1HCN63qWCCPszymJwTfalaUKyXzLF/PUVs6Ohu4xinQgdKsUU?=
 =?us-ascii?Q?xf+b79EJ2zbR4xEQoiQTsYtXlFjBiFG5UDgb/gh7WmS1Zk74w491eCSvZzKU?=
 =?us-ascii?Q?eHxc5hk0TJ9R1ZrFzvdqUysd2cgW868oKg5AvcRVMT+xTP14+yJuhynjbfq7?=
 =?us-ascii?Q?haI0SHacfcDOKVTyy6ghfqHgO6gdgMHpJa2AVT7DGe2CZgzy1ih3FdEMDOuD?=
 =?us-ascii?Q?3PnbzVlp++L/JzpEgvP0nKryWHSgYvruWA6v5GJWMaIw/dwGLD3ulGudguv0?=
 =?us-ascii?Q?kCOglhIU6t1e0pJ2rZnGGbSrHEFUN4R/We/sXPBUTih6H8iZWJRJuURwIq8p?=
 =?us-ascii?Q?JmNWP6ieFKYc0I8pwJZF8GHDFSITsC2u7NuOhtKXoRafvHpP5xs8uIDmtQvm?=
 =?us-ascii?Q?a9g8nJJ0lITXwbvVx2qhrt9MvGaPcXu2exzjkm1CKlTtWIWBw8ASvibAmBxF?=
 =?us-ascii?Q?YImQOEHwPWMJKbYJ7p+sbkkaxXuO3EdGw5X+WivoakGUFfZYnqSHmA5eZYMq?=
 =?us-ascii?Q?ZutRacbPf4GqZ9I7ID3pUns26Qh8QwZ5Uibviljswwk79k1b8v5+3bmgt5Ec?=
 =?us-ascii?Q?31fcfmiHGYyRoD5NDxGu/XCk2C0zSz2TVJ6u9sZsZjuSD6D2qous79CE8IDz?=
 =?us-ascii?Q?lz+2DPiwFdpJ8ny5pbPuVsM5nsfu/qtBsx7KnreThpiIA+LG70R/0ayVNZpB?=
 =?us-ascii?Q?6Ta/vCVEiQTlDk3ogCjt0OZ24NRkX/pkE/le8vjGFQXW8DMvl6vGTg0UbdpM?=
 =?us-ascii?Q?QN7KEvxGMXfHYkuJteebpQyE6Kw/eUaF9qufjCEkW5XZDiuS537vIY/I8YWi?=
 =?us-ascii?Q?kyLlG3YEok4kwTADGz4/poBPUGS3YFnIOzZ9Rm5c9eNs3YJgtSfKugzuY9tb?=
 =?us-ascii?Q?1NuvAmOxQukqNYqorVY8uq6zZALQEd6puWSrd6ST450KyyKxL/bALFs7/ro0?=
 =?us-ascii?Q?g1Ts3dpksdxKgb08MoueqBsn2DHE?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 00:06:30.2311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1983550-731c-4689-dc24-08dcdf516799
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Sep 2024 00:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8901

Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
are renamed in device-tree recipe.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
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


