Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.71])
 by mx.groups.io with SMTP id smtpd.web12.10515.1638960372475456776
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BUtYOjlx;
 spf=pass (domain: arm.com, ip: 40.107.2.71, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70px296OCv3Y4UwkIRbSKvXxnP8RxjZOmVOT9g+DAhE=;
 b=BUtYOjlxHT2C2BEffKkIEcu2Ggi+DovzZZqW9pO3JWIQkI8HkaJYudRxABp39++IdCs38OrA7s6Ug0d7subsobT/7Ulkw8FwtrYnG8l6qEGpbOJWk35v6/72YSKDX3CjbvVn74S7FtRcxS1Ba9zjtG/nVfhe0fFc/IUDGpRESfI=
Received: from AM5PR0701CA0071.eurprd07.prod.outlook.com (2603:10a6:203:2::33)
 by PR2PR08MB4842.eurprd08.prod.outlook.com (2603:10a6:101:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 10:46:09 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::bd) by AM5PR0701CA0071.outlook.office365.com
 (2603:10a6:203:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11 via Frontend
 Transport; Wed, 8 Dec 2021 10:46:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 10:46:08 +0000
Received: ("Tessian outbound de6049708a0a:v110"); Wed, 08 Dec 2021 10:46:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcfbd77f00170686
X-CR-MTA-TID: 64aa7808
Received: from 3de75a43ef13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AAB088C6-3EE2-4E85-A8A5-7DD758F30B85.1;
	Wed, 08 Dec 2021 10:45:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3de75a43ef13.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 10:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD7T0vlEHbNipM4RNbfwufzvrBak9hrbVfYQgxrXThrEmeel6OjUtrnHQS/xfwJiMbpHQTHayfJ+LF9rZ+UkjrxaI9RvzjdUUrXsHhVCmjsHqJEWzgroD9z/9t1QPVL+yrpQ/LzGNaO4z5RXdg13qZAZ01toKapUOQ3ixfFeVM3CMudRpXpm/YqHqW/xc3pcsQeagt+edWoTCvYhKVQI2A+ndJD6DPRjbtP0OQ7aKmd/rLEnLQIcx7R57RDmU5NgxPhilcKz7kRPvYSeFo1e7fuMigWZ9EhhX1s5Bt19FX7gJWr7bvHL/5NNq/f5ldRQ0+Cp6b6DIEU3K8RAtgEGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70px296OCv3Y4UwkIRbSKvXxnP8RxjZOmVOT9g+DAhE=;
 b=nXIRHfZCLkMlrhkbWNoHY97eGvUKKaQKOxqQ4FDRnRghNnWSEpQq6sNpRjfscg6+T0YqW99Pn2TXk3Qqa7+QLfWRwQa9l5vSjEESOAsLf5FP+Yx/oA/RZ+68TDFyfWxz/qYoul1aDboRZUuB/mfzLWtujEhaHstQP76NaYLmb3VAkp6sSHRKl/VywjheogBbb+6+fPB4yRHMueZgvLxZ1U4HEiMMvcrUPzcJDCwmjAUXq2TBZtmmAfWQwM9xRSl+UzFb2URcX005JxfYISEyDdqJZpBgvUwpnAMU7QXFhy9sacEuiOykzXc9wfeI+cn0neSev1kXz41kxagl5ELTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70px296OCv3Y4UwkIRbSKvXxnP8RxjZOmVOT9g+DAhE=;
 b=BUtYOjlxHT2C2BEffKkIEcu2Ggi+DovzZZqW9pO3JWIQkI8HkaJYudRxABp39++IdCs38OrA7s6Ug0d7subsobT/7Ulkw8FwtrYnG8l6qEGpbOJWk35v6/72YSKDX3CjbvVn74S7FtRcxS1Ba9zjtG/nVfhe0fFc/IUDGpRESfI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com (2603:10a6:101:1d::15)
 by PAXPR08MB6670.eurprd08.prod.outlook.com (2603:10a6:102:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 10:45:48 +0000
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678]) by PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678%7]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 10:45:47 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 1/3] xen-tools: Load xen related kernel modules during system boot
Date: Wed,  8 Dec 2021 11:44:56 +0100
Message-Id: <20211208104458.28009-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To PR2PR08MB4699.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8bce6c54-d948-4803-a0b9-08d9ba37f12d
X-MS-TrafficTypeDiagnostic: 
	PAXPR08MB6670:EE_|VE1EUR03FT012:EE_|PR2PR08MB4842:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB48426B7C645700CCE4D94D60FD6F9@PR2PR08MB4842.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tm2byetuCNaXxUIBhePBKpGumOBSbN8wOy58mh5Tiv6LY7HTufsAMfzLGC7a3J/cM0xYYCqcYLQDD6qJcrYcR4OU5Bvgo6F/ZA5hSG0fVZ02wO16echbhsU07VCUEhqMyY0s9k/hi9pR8lJR+hfHr6y67KYm8lzkyYr/+1Y8rv91QPg0O09FUOM2+KiTu2sDCQCzhMc9Dug9UmQYYexKJm+EjUt7wanaxAFOSIuiOhX9ZJvwU3uiZvRZWg2vlj/PKb9/xbBokPa/nCWnM/9pfZMopnoDVXY+r95QI7y2JW7DxVi2smfco3sbXCeQMp9J2Vr5pLlzp0aIhjLkoxom9SBRRLbX9DNkFU7kbRg/4oygvfxOYe3uCrhWzTV0GVUK2iLp2DnfvmpEpQ2Ikm7k1F2p/J+CSfZZIrAbnba2caxiLvKRl9I1Aei8Sbgp2HKbWtPOhTP/h0NlkxRCRlhqSpd5VglzDEoFxuNA1EIiSbXmxdlgpnrsUPwASTodnUNCvR5SwXoFpyC638jxoqexziJ31ZtHRxypHd+U5AYlvDy3LSjW92Eo38nGfCK32pD/yItnF0lrMQb6a84+aAUPEdm97RxDGMXE2ZhmcD5MZ2WIW5n4MpKXpv/jPZFzz5sZlGB/n4R8ho1zo62rGFWv79Zz0v0hiuLdntSLeSrJPGaUeA6mpmyuKXQpiD/VcndstOCjU55LDJ7asqsEOkwgdA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4699.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(6666004)(2616005)(1076003)(44832011)(316002)(6512007)(52116002)(38100700002)(38350700002)(2906002)(8676002)(5660300002)(186003)(86362001)(6916009)(26005)(4326008)(66476007)(66556008)(8936002)(66946007)(83380400001)(36756003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f610aa53-71a9-49c0-7f2a-08d9ba37e4ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sBbJlpw0ZhHiX5rhNmAePsdbkpaa3SVfww+idrS5N96c3ZjuHpMHZDkXM0dfogijiYC+6vEdIOhkqQeEmKdCsZ9Yck3iLaCMK2qSugeD/I7qzvTvBXPGXfJdKz711e3BtmzT9u0QZTH9LSOukKRaEzY+rV8/7XeoYTV/dAGrOkm3CxgizUzsW6u4uILcvwb2RPar7OJMR6gLBueY2XmjRe/Zl/veAONBc/Vs/TkiE+Qcj33Jv2oytLW8CG54L/DLgMHqFQIdlwlAoAlU7AZRcXObeeBRgyG2tHmCkle3a6IKGbnhd4ck6gARU+3pNVKaB2VK6QBMNiia5Yx5ix6FF+8AZp2AnzZfQBW8tC0zN8zOCIAgVC+aaQXKOX+WbGWFeQpajtHwWmXRVS5MlSOZYdd6h5ufb6WaCvw9/deasYO7BAFhc2Kwzv2O7/vKz6Xs37sgw6VNiabx1EUsdWfGDiZlOKQiTsrft6hlHX+p2iZ1VbDb4wPLi2U2aHk8d/KXy76RcvA38lObriMa0076S8Wv/WKxSSlvlAjWPHnOjNLD3soG9bPPwCJCW1dOhxm00RTVE1bU8IpBfF+ma8sZ0NvZ+NqV9bjC2x8MfZrWP8hIqRkJYJnL/MXAQBn88PdmwQGVpzUVNxxfH9A0nCaPtgLtg17NJ18+e4m0fdwplkLvrBp/TWgmU9sUXpLFV3+H+SLfj35QIUH1JOAMDrYQXPYM8dVLPljf3vSJJgojee5G9ABWMSt3SjqpGf4/4byzAdA/atYu1JOvZsaBSVbthA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(6506007)(6486002)(36860700001)(26005)(70586007)(70206006)(6512007)(6666004)(4326008)(186003)(508600001)(6916009)(5660300002)(47076005)(8936002)(81166007)(36756003)(356005)(2906002)(8676002)(1076003)(316002)(82310400004)(86362001)(44832011)(83380400001)(2616005)(336012)(40460700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:46:08.0809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bce6c54-d948-4803-a0b9-08d9ba37f12d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4842
Content-Type: text/plain

This patch changes the location of xen.conf file, that contains list of kernel
modules to be loaded during system boot, to "${nonarch_libdir}". This is done
by removing '--with-systemd-modules-load=' flag from EXTRA_OECONF variable.

Previous path based on "${systemd_unitdir}" was not considered by default by
systemd-modules-load.service.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen-tools.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index d831941..6b99040 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
     "
 
 FILES:${PN}-xencommons += "\
+    ${nonarch_libdir}/modules-load.d/xen.conf \
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
     ${sysconfdir}/xen/scripts/launch-xenstore \
-    ${systemd_unitdir}/modules-load.d/xen.conf \
     ${systemd_unitdir}/system/proc-xen.mount \
     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
     ${systemd_unitdir}/system/xenconsoled.service \
@@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains = "xendomains.service"
 
 EXTRA_OECONF += " \
     --with-systemd=${systemd_unitdir}/system \
-    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
     --with-initddir=${INIT_D_DIR} \
     --with-sysconfig-leaf-dir=default \
     --with-system-qemu=${bindir}/qemu-system-i386 \
-- 
2.17.1

