Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12EEC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 06:25:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.web11.7068.1743661518396866723
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 23:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TpV8VS63;
 spf=pass (domain: axis.com, ip: 52.101.70.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jog7XS7srH1UVCCWHd3W5oq+TAJMWcKJNT3JfabHns/7Smt+11FzYU24KxCeZKxStYCJj+pDanl1WsA8ATuKMtSIj6NmIqXTTpSsayPET4V3DM3Rq5AwJijo0PTLAoWhVpDpL8YqPpvcyDLjTGz+LeBHOKM9in5XLxmq7nFKQNHgufJ9o6p30Tdw9StGawLjh9P+pablYQJlFff14/s0JNhF6GJla3Rl09RFtTpuPmaQuEwqJt6iPZq3xnStpDCzDQgOue2CfEOnuZB9wHTuGkb1SB413gH/e9yeElH6kvfASZZlzysGJZZyVVOELtsnaEcuUlgtA4FKY/mH6igLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED6cLgtM+KCbqTz8DQs6lUVkyT+bXka0HaoaZs1ROlw=;
 b=xXWUNPsr8xn7avF9cegislZU1jQSbjA/ep62GqHu9jUEXj66cxLGpg3NEfHRtGyFnC8MLm8/sc7duiy70+WpJMHYU1ZvRaEx5RJQEiLpdiTOLSDL5P/zA4Klfm40v1wdqz30AmGnj7smrd4DziRqE1g6IUjRnv70e+FPMUKJ+EfKVgpO3pe3/pC+fn+Nbu7AaVT68psOnfby7Hs8Ca4RisdNcaa/mvxd/rey9jrAJpQW6LMvPsEGC8JbV9jkGO5Ba6RsLShzrDOqKiQAiZjG/vfcv+1IweD0bSw9Kp+Qnjk7y9BOgvf73gnByFVh/3uu1TdN8HDYVrI4QJ+VHYmvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED6cLgtM+KCbqTz8DQs6lUVkyT+bXka0HaoaZs1ROlw=;
 b=TpV8VS63w85A225A6qiXSM8zLN3Dofl1zC0Pruw5n/ptm4wOCTHZScvh8QNF0BdHj+G6oDyyY1OmYRmNwtRRGktNIykNbyi6hJSSppKYC2YF9eASjV74mA1GCFDb6IXQFIhsOvDErr3wgXDwiZ6F7IznITZcgjg0uWXRufLVUL8=
Received: from PAZP264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::26)
 by PA4PR02MB6992.eurprd02.prod.outlook.com (2603:10a6:102:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 06:25:14 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:102:237:cafe::6e) by PAZP264CA0217.outlook.office365.com
 (2603:10a6:102:237::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.53 via Frontend Transport; Thu,
 3 Apr 2025 06:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 06:25:14 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 08:25:13 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 3 Apr 2025 08:25:13 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id AAF7AC8
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  3 Apr 2025 08:25:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 5336PDU53088360
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 3 Apr 2025 08:25:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 5336PDBN3088359
	for meta-virtualization@lists.yoctoproject.org; Thu, 3 Apr 2025 08:25:13 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/2] diod: Remove the dependency on tcp-wrappers
Date: Thu, 3 Apr 2025 08:25:10 +0200
Message-ID: <20250403062511.3088323-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|PA4PR02MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: b587135c-79b8-4d0e-1071-08dd72784b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8YCnsGGvA7f75MGXxIJzYpJ25+fuhiQSKfIPNmnfl5Vb3GQKAGd4JIttsTL5?=
 =?us-ascii?Q?l7bkZFhaUDkv9xlroE2DXa6dmJPMfKDvqGgpKpay6cVpUNsNnZDXEM7Uxwhg?=
 =?us-ascii?Q?3jKSFOJfgUIc03FIfYVabpslh0koYH5UApXVsQ6Yy01/n/6D+IZ2BMUMOwmz?=
 =?us-ascii?Q?6Zfe2REYF81Zo4iDscBoOrRHMg+/qe/UipAU6sc5BP4jnCsrRcy8IfFrxrBg?=
 =?us-ascii?Q?aFPjp6/bQWSilR//q164qtm3YWltCw9azidgA5RMv/hv5nmE6dPMtArDwupR?=
 =?us-ascii?Q?IEn8CUngzAuFLJ9k6JUPB4GwpAflgSazc3vM9GEFuCRTrHHAhx9tKZfZUgHG?=
 =?us-ascii?Q?eN0I0z5zRExuZznKmPPwqgLkJqCeQjbXKIg45edzkgwnF1pzVLtvk3K7k0+/?=
 =?us-ascii?Q?j9VoczzUxY8E2PtaF0HpoSc+f69NPgGKU8IQ7NqYFfwSKb2SO7nOS0Fk9/nm?=
 =?us-ascii?Q?8kaMidgIJue/COs2l/ndXLkE30EMcT810fDxns3rFynREhajm8nuDmvuK4rz?=
 =?us-ascii?Q?9Y+N1tGSZ1mbgcLQ8ppdia9cpWn8CM761+o12bcWWL/KJSkQmrGpvqRP5Zvn?=
 =?us-ascii?Q?/aEog5n/0PaluxzUJ9Haz7fIVneopqHCull7fEWxVjCpGOEYwjcDS328rgPS?=
 =?us-ascii?Q?mH7EEPyi5YoeQagwuZX8P2GEy4NdbZeLAC97VDZpf4nAXywgk+uYSwD2Nggz?=
 =?us-ascii?Q?VN1VWfGzOO6N60k1drH7/BuEzKAv3afJzYDb5OdSv3K2Xc4qgDIwzjFSsPiH?=
 =?us-ascii?Q?wKsQES4lPBfrEaj0GzyrRUWhTMYUwKBCALMVodZj5O0kcrx9OExW/PpQpiQQ?=
 =?us-ascii?Q?iVwMaad/BwDf3uQW0WbvqELcFyYC05Zk1hJJjztWo8G/x4kxPhp8LL1jNPau?=
 =?us-ascii?Q?N6MJ4272bEAiWym7UCZ7Pzmuw1nsF2ESmsZt2B6yfmpogIjPIECH+n5TWDGL?=
 =?us-ascii?Q?mkpZjY2dMJksdFx4GHzABs53VdACth0f1pPtRfjrMwMh2k01E2SFtoplc2If?=
 =?us-ascii?Q?VMoNL/Us/U7Tmum9TljUvCizp5PkI1H5tRHWRCLJRgJns1rHaA+xpvUFNejL?=
 =?us-ascii?Q?qHTPTKbUreFoVrqE+3mKl91Y9BOehuW+kXWsjHRgJue6/dug1sINIyw+lK+P?=
 =?us-ascii?Q?DlKIZrLn48iyuD2mwQ8P2V2aUV4rNAtVDOgIDgfH9iApDWmkgruPmOQBTI3y?=
 =?us-ascii?Q?FkxQu7mgWmHISn2O6CrEfppyBLREGI1Ahrg17gn8zJ8mSK0AzGmVFYBaKW5R?=
 =?us-ascii?Q?VRAtCGuqysdMsX3XR09a3BYCs1IX+7TP7fDsa4WNICgzt+NFwpMLhmoJldYD?=
 =?us-ascii?Q?GkqydPXwh9YII+no6Nck6enXwcO3vcF+hl/4lmsdnN2H/8Y4bbYAfC0khCar?=
 =?us-ascii?Q?7L4+Bf1pN2eSqk6QI5ldFs2tBSCeihgbhXY3Qanzzh3mFaOZeDFK9n9tDMxl?=
 =?us-ascii?Q?3FEPSx6TOwptysUET8P/FIamF04loAQgM5JxNmKL/1kyvlpjKplg+4euQRo3?=
 =?us-ascii?Q?xsbHj9/x3/LO5bI=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:25:14.0862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b587135c-79b8-4d0e-1071-08dd72784b4b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6992
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Apr 2025 06:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9197

Use of tcp-wrappers was removed from the diod repository in commit
59b221f7b5eb24a20fdd886fdd1f8ff9810bdb73.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-extended/diod/diod_1.0.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/d=
iod_1.0.24.bb
index 89e79df9..a33b9a66 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dh=
ttps;branch=3Dmaster \
            file://diod.conf \
            file://0001-build-Find-lua-with-pkg-config.patch \
            "
-DEPENDS =3D "libcap ncurses tcp-wrappers lua"
+DEPENDS =3D "libcap ncurses lua"
=20
 EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
 EXTRA_OECONF =3D "--disable-auth \

