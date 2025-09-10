Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD47CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 19:16:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.48])
 by mx.groups.io with SMTP id smtpd.web10.27926.1757531781402949714
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 12:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ib6Scpf4;
 spf=pass (domain: axis.com, ip: 52.101.72.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaCQXTom6joB6GdM0V9gJqm/KCjXXdyCzSGS+1MjuAp/SWFZp4gaexLn4GTWWaCqJqL3e/7SKOvkWBTowzgPETpwT506dMHSPcKFyMICYbPAYPPOE7hlWyHAi63SdpNE0/8dtsJoOQyo9Tl9gn+aHsNzcHKxEKZjHsq06FHcF8YOGzTHtEfHFt/Ic8qnNeJfEsrSCtJwGdlV959QC/JPbCkMSM4p5wugY8YpPDnwpMtj+NroJQf0RZt+skrSKJZoVxPqwnWugI/MhzYHKZChk1tDl7GCeVXzYTqhQaQkyzJK+S9A31jI0j40Thkr/JFpYshRMiSR3nlmpyhO8ZymQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jvkgBvm+2YA8Jike/t1XR4s1DOKNQ8Q0j99pt5C2kE=;
 b=C/MO3BlR1aAqSEYWTyHDg0RYd2KIE+Pb1hYgwixRYAh9kK0M9OEvvMT/nSlXGgQACGuFcjugb1mRt2tdOI9kQXgfKtbHqLaTby+Oil+JfsBjB6KsJBqFNOjEO2BktQVUljQmzuYfkpaz9byxEVlN3ackSYuFnQkvmmp+DkFW9RlsE6jVC9KHbNz/LyzPCiPKoCgu4JbmPM5J1L/l0Vp45LtvGnXviuRa3nSqdXhCp00m2Tj4ZYU6TrQfevhDa2IMR4mm2Wd0Azur1s6EFDr53A/4ABEHN7WRb8gbOOMy/qhqdkAjInSNoJvLnc4j/escHI601St6dagxBBBJBQQKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jvkgBvm+2YA8Jike/t1XR4s1DOKNQ8Q0j99pt5C2kE=;
 b=ib6Scpf4wkII2pqnU4VdcEYmGRTxL0tACdhxM1JjGQiVxo5Mn6Av0R18kFPMMzyPEwHyKiAZNW/Wl2IsFI1GIQ7cZfWmAS2pturofdKq0CVkMXF5M1wD8B9iVGXkQDOXtw+V/ON438c3uxKTVdDolFY6Z26cFDvu7xbX/jrpc1c=
Received: from DU2P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::7) by
 VI1PR02MB6381.eurprd02.prod.outlook.com (2603:10a6:800:19f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 19:16:15 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::75) by DU2P251CA0006.outlook.office365.com
 (2603:10a6:10:230::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 19:16:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 19:16:15 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 21:16:15 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 10 Sep 2025 21:16:15 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 41E901E8F
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Sep 2025 21:16:15 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id D185212038E; Wed, 10 Sep 2025 21:16:14 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] Revert "coreutils-native: don't install groups"
Date: Wed, 10 Sep 2025 21:16:12 +0200
Message-ID: <20250910191612.3559298-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|VI1PR02MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d9ce62-a398-42f5-3ed1-08ddf09e835b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZVbGz7kfHpXYDLo/5XSG8QabaKZu0lP92oO436M67ICqbt9ve3Buz3kSUfEi?=
 =?us-ascii?Q?2hUJ5chU1VowIb12li6R+rEG9aEyAi4X2mc/i+0RFrBpu1KTp2lgvhwoo1F9?=
 =?us-ascii?Q?1yXLX/uiIlv7/nJCGY/MYQfAa1foF55Tr3ivsXxajsUGq2ZdzRDo1VTUCwu0?=
 =?us-ascii?Q?88o3dhnRvA5/oD91AyKJ41qUBuqE68UwkYNGCQKSDYONJob/PVK+4Fd/uxQA?=
 =?us-ascii?Q?Zwtuw9vuh7mrlc6mjUMSKUWNeyL8dCKjJwcR61k+okYI30hbmHHYUvtpkELn?=
 =?us-ascii?Q?TUIbEfJehnQhz3G+iA8vJBtnuG1cNvGzj9mHMZhwV3N7hwtBuqQq/m2K4lNu?=
 =?us-ascii?Q?WuGqkYYXlqzPPwxAHKzaA40nbQsUaWrDCfmZZZKZe79jiAumpIPvAmMFRAOE?=
 =?us-ascii?Q?kYMO1dwPnItVX9E3XO82irTIKNiRFJdYmGadmadSpb34mza6969nKBAc3QdE?=
 =?us-ascii?Q?LBY0y3j/WEGKLnyaFfXiY13Iyu3Yhj2XFJqTdp9pE64VPVGMdT1ppprH9FS8?=
 =?us-ascii?Q?3AbhHcR2wBhCmEkBN0YMKqWliJMpRADQ00o77y7VFVmK+PEODhGo2qhXQs1k?=
 =?us-ascii?Q?dvGtfTeJsxEKSI8gBPVuX73ujIKl/9MBQyHjHjQOqryNrIGxepCAlUnvsFNd?=
 =?us-ascii?Q?CvcRW4nvQ01eowyHt4lrgIrEinUcPpisxRns8Licv6gjwNqScNqxRFOoY1Jk?=
 =?us-ascii?Q?NuCxfH6IaKnJ5mtykK8QcOy/tbtbrvPz7RnfwtYV+z93mLMaaMZvhew9GPoo?=
 =?us-ascii?Q?kz0lG39jv9dRJVWytr0bbloI/NWYC3PVfCoc/EE1mULJ4TShG0PWR3zLCxGs?=
 =?us-ascii?Q?sGCYB5uok5ifS0x8g0jMVXeUlpgsb9qitLh/4V7rGxTSL0VMutf+K9TqxW7N?=
 =?us-ascii?Q?WUQZ9XNhZAJv6VGLjGskb8uqLkUvo36PBvvlmFxUwX26Xhup9pj5/vhUDhST?=
 =?us-ascii?Q?jMNWP3MzrjA2TzeiNRLFv7ndQtfykNPJK8S2HK6kVYlLgfu0Nka+jVPCREpc?=
 =?us-ascii?Q?eOIWA94DwH6sxqitSf8ZU+ziLitGGykX3XcZuNJV1kzR5e7OIA8z41hqyaP+?=
 =?us-ascii?Q?W2tUdw15Ac0EMTpRPpNnCfHCxnWjbkrYXBz1ddMU5qjq2v2EVHJx6Hx7+LK6?=
 =?us-ascii?Q?CZLQA8wM5SJCIV0RGcrtdLKe+Rm8wdaU9KUL5tmXMnJQRenHn40t3e++pEGM?=
 =?us-ascii?Q?Fjhdx6gkmX1Vp9GhXj4p8NBXiYv5KBkXqS/QyA1ay49AiugHmt6a1zsqKl49?=
 =?us-ascii?Q?UDX45P/c4s2y7iM7xUgf7ctjL4vJKJbd5f+WORy3tlcjNv3BiEWA54BPojjp?=
 =?us-ascii?Q?SnWtkiJ+F2rONqHiDBkfZ7G4bIRwxyIaJ+VO+vsfIzDcYnWfiWiMhZZjoGM/?=
 =?us-ascii?Q?msIhPDUAxC3SDisn/xV/4hChi0EM8ybHYGVTv/OM0Ue+CN/Bvked32tDu0Au?=
 =?us-ascii?Q?qV6ci1CVqx3amGDUiurptTZ1prdXTlNndp/CwaLa34vw8f2ouBo2cKl3ZguU?=
 =?us-ascii?Q?+0vEhJu7Q4VH5eM6yad3dhQhAZE+qtsXYicX?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:16:15.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d9ce62-a398-42f5-3ed1-08ddf09e835b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6381
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Sep 2025 19:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9391

This reverts commit 113225b93c55d55a330fcca7d9f996ec039fb953.

The groups command was previously installed by shadow. Therefore the
one provided by coreutils was removed for native to avoid a conflict.
However, since version 4.17.0, shadow no longer installs a groups
command and thus there is no conflict anymore.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/coreutils/coreutils_9.7.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-co=
re/coreutils/coreutils_9.7.bb
index 3658f7100c..201be4144c 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -82,10 +82,8 @@ do_compile:prepend () {
=20
 do_install:class-native() {
 	autotools_do_install
-	# remove groups to fix conflict with shadow-native
-	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
 	# The return is a must since native doesn't need the
-	# do_install:append() in the below.
+	# do_install:append() below.
 	return
 }
=20

