Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EA5EE57C6
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 17:21:55 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.27557.1726075311603271211
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 48BHKiZ5008597;
	Wed, 11 Sep 2024 12:20:45 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com, mark.hatle@amd.com
Subject: [meta-virtualization][2024.2][PATCH v2] u-boot-xlnx-scr.bbappend: Enable xen boot script using variable
Date: Wed, 11 Sep 2024 12:20:44 -0500
Message-Id: <20240905122652.793160-1-johnvicky.vykuntapu@amd.com>
X-Mailer: git-send-email 1.8.3.1
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (::1) by PH7PR12MB7018.namprd12.prod.outlook.com with HTTPS; Thu, 5 Sep 2024 12:27:07 +0000
Received: from SN7PR04CA0094.namprd04.prod.outlook.com (2603:10b6:806:122::9) by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 5 Sep 2024 12:27:01 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com (2603:10b6:806:122:cafe::7c) by SN7PR04CA0094.outlook.office365.com (2603:10b6:806:122::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend Transport; Thu, 5 Sep 2024 12:27:01 +0000
Authentication-Results: spf=pass (sender IP is 165.204.84.17) smtp.helo=amd.com; dkim=none (message not signed) header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates 165.204.84.17 as permitted sender) receiver=protection.outlook.com; client-ip=165.204.84.17; helo=amd.com; pr=C
Received: from amd.com (165.204.84.17) by SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.7918.13 via Frontend Transport; Thu, 5 Sep 2024 12:27:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep 2024 07:27:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep 2024 07:26:59 -0500
Received: from xcosswbld25.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 07:26:59 -0500
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: johnvicky.vykuntapu@amd.com does not designate permitted sender hosts)
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-OrganizationHeadersPreserved: SATLEXMB05.amd.com
X-MS-Exchange-Organization-ExpirationStartTime: 05 Sep 2024 12:27:01.3582 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 8d2b6e35-bc77-42cf-41b6-08dccda60b0f
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-PRD: amd.com
X-MS-Exchange-Organization-SenderIdResult: None
X-CrossPremisesHeadersPromoted: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-CrossPremisesHeadersFiltered: SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|CH2PR12MB4262:EE_|PH7PR12MB7018:EE_
X-MS-Exchange-Organization-AuthSource: SATLEXMB03.amd.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: amd.com
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-Organization-SCL: -1
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|12012899012;
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:-1;SRV:;IPV:CAL;SFV:SKN;H:amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(12012899012);DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 12:27:01.2644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b6e35-bc77-42cf-41b6-08dccda60b0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SATLEXMB03.amd.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262
X-MS-Exchange-Transport-EndToEndLatency: 00:00:06.5694891
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7918.023
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097)(140003);
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XU9/av5tJrqPMmW7rnMaJXQoP+TwHPEpdfDaHYeR0FAAIlMDgMhxhPk740?= =?iso-8859-1?Q?PsCnFGTOLriCyZ2J8WahppByXC+yqj+QC5NnFHVQeTCo2jKq9L9xFqne33?= =?iso-8859-1?Q?V+qEvz7DQuK3UxQ6tpr71BOzVRe9WYZ7kdmWX4vZSLAgktHppHdcikVSap?= =?iso-8859-1?Q?SCSKnPWdwZyejWMEC+FXPi1wrkxlazwCxgBuORgBZoCCwUEk0j3MWGOn/s?= =?iso-8859-1?Q?t/K37sK2fb/pTvVmsWsuUY4wwLucW6EPIy/1FaJi9yVnsHxyCAcAMztmaH?= =?iso-8859-1?Q?WJWP1S3YCcsC2IwDd0tAEVKvtNoGEzOajwCINvT0RP0CpjfK9405WXRjcK?= =?iso-8859-1?Q?Px4DD07HfPtKBl/VieOEFLvIRLjiyV81UOw4S/uE/j9BsJiqRGY2WrSL1F?= =?iso-8859-1?Q?6rp12GW1a3hBVJN12ViPvfZoNhwnXdXEBeTm7P05TM3yGeG1HwZ+eRxkxI?= =?iso-8859-1?Q?xdI2WxTZdJI9FFIeTZmvCpxWy+Uq2Jol3GrXr2jijIZdQ4EVPy3n8NetcS?= =?iso-8859-1?Q?0POx/B3aW0WE8w5esfSbdpcuaHEYqBQscGFKauXo7Zyaxtsf0rQ3FeuVPP?= =?iso-8859-1?Q?2YciTzpSuQvPhCCZ1eiDNE7eLNbjVZgOr23AfzLsWwcaez3RG54jT+5/cX?= =?iso-8859-1?Q?afuX3Pa1shzIAkMg7AqYfF0lNvayw3E5UKjbGsAwXO2gZCldT2p3CO2cnf?= =?iso-8859-1?Q?wtzo/xizZ+ZkIWiy4C2CdsKTZ8d!
 Z+AmJRJOt1fjKp/1C+tajDTCfbVxZvo?= =?iso-8859-1?Q?BnRtJfggf5IMnGTD81IVcdZSAsKiP7MkA0LWndijWuM3lSqqBonn+tTvyZ?= =?iso-8859-1?Q?SIoq1sULxYobjplBMN0C61dOTC8U2IGUjiSm/OPfBCr9BitaTNGkaxZ/KO?= =?iso-8859-1?Q?LCU1V8l9X7Apz6cymR7MrkE5eykRMKug7GXnCH6HCeEb2HcVBjA/sqgD6F?= =?iso-8859-1?Q?jiprsEtTvZhOw3e/H23ugEkyLA7dhpmxNokZ8mZOtDXK9RigYjiMF2vg+T?= =?iso-8859-1?Q?xVhoCOSS4GTps/g3eRMTVX/s4/jIocrt0XMw/kMOz4/E86p4ddo+1KEdqx?= =?iso-8859-1?Q?c7pDfzOonKIaULdEq8V7GjsYVJZTBVVegrSomrA07R+G9aSrGxfr2uvxjZ?= =?iso-8859-1?Q?pVNzC+8ZCPI4MsCpWEVbphQ8hYpTd8gOibdm9VMacDQ6v0Heip4RVvOPro?= =?iso-8859-1?Q?w8DGO9W+FXre/vMQVW3/ZHtTh4EGFlg4nNZrQIm8re5ssI6c2atIwycuXD?= =?iso-8859-1?Q?D2cmSP+sptwjUL5Zxep4hLywGd5qVqm8kay8l2C7lHmbhYY4Do++Yms4az?= =?iso-8859-1?Q?S5NEfnIeK49F0JSUcKk+9vwUC21zln4xAfvRRxy/BJpugIyNU8QSq2Q0H6?= =?iso-8859-1?Q?gws7Nszpbsz2gEiemEc1YsI6PE+uLuWzmiUyW1jczEyXWxcvE6s6vAig/r?= =?iso-8859-1?Q?5zfxHXrX7olo94OvEDQqgiG6Dx9iBG44oYDicRMc6bR8A6jQ4unxW1l1ub?= =?iso-8859-1?Q?cq0kFqVSPXwgULSNRlzGRmN+RoR!
 qu2lKlTg/6+iXhxl1Q1WtKgqXEiV/sq?= =?iso-8859-1?Q?VmDYTKWhEtbrxgBTVisa3w4O1EbbJLo9Tqc/XZMlu53i62b+Lt+qGzYH7L?= =?iso-8859-1?Q?LQBr9JE+KhhM0XJelC+/IAewduc/8RHnbLuevpZVsme1p2NIcSRFZ4xZjG?= =?iso-8859-1?Q?xYGMU6G4LGtOJhpIwXviAJFCkcEv6d4UkE3VXoglmN7lbK92aq32qzQ0KI?= =?iso-8859-1?Q?q2YtsDIobfxzpSTDUAMgwhhpCg2aaz3Jr9OvhAI78fIHf//E/
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 17:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8882

From: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com>

Xen related boot script offset was override from
meta-virtualization for non xen builds.

ERROR: RD image overlaps OS image (OS=0xe00000..0x2610000)

Add to include xen boot script only if ENABLE_XEN_UBOOT_SCR variable
set from the configuration file and xen enabled in DISTRO_FEATURES to
avoid override.

Signed-off-by: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
(v1 was directly sent to Bruce)

Update in v2: Added "and" condition between xen distro enable and
the ENABLE_XEN_UBOOT_SCR variable is set from the configuration file
---
 .../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
index ae847cb..819a0c6 100644
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
@@ -1,2 +1,4 @@
-# Include xen-boot-cmd.inc only if xen distro features is enabled.
-include ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen-boot-cmd.inc', '', d)}
+# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
+# file and xen enabled in DISTRO_FEATURES.
+ENABLE_XEN_UBOOT_SCR ?= ""
+include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', true, false, d) else ''}
-- 
2.44.1


