Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.41])
 by mx.groups.io with SMTP id smtpd.web11.11883.1639058316670835458
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=O/BI/vBY;
 spf=pass (domain: arm.com, ip: 40.107.1.41, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqehqVN8QdVh7vB0jhbozCoqgwG/XZWp+2S1pX79zLo=;
 b=O/BI/vBYkQ4ZB1C1sRxZD+py8RwUCRZ2sADBD2ulsivDMjYjy5qeyA8gEIZ2YfGfV/kx0W2w8+qxXew2ZadtXRXmS1FP0Gfy9V6rhkNU5VJij8ydZDzw/q7ffNS9g1L1lxAVVBrG6U5BHsksDbgbleV6dDV7RYFhBLaFkZmzq6c=
Received: from AS8PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:313::6)
 by AS8PR08MB6006.eurprd08.prod.outlook.com (2603:10a6:20b:29a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 13:58:30 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::34) by AS8PR04CA0061.outlook.office365.com
 (2603:10a6:20b:313::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 13:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 9 Dec 2021 13:58:30 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110"); Thu, 09 Dec 2021 13:58:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 890819c6730580ca
X-CR-MTA-TID: 64aa7808
Received: from 7e04c979f202.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0ABAB70D-843C-43B3-B07C-C6F1CE20C2C3.1;
	Thu, 09 Dec 2021 13:58:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e04c979f202.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Dec 2021 13:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF6fCF/1EGfENOsCAdMvda8nTSS7+d8XoUyeq5VhhjyWkhIYRqaF5BKI6Z4cEn0/3mw5hCRqheOl6AWfP2WlBHxfogLs8L6icWBIDCX3VvIvnKCozyJ3fii7jWYD/3RkD6xeLlfW7bx2Gn9uiuDicXHSxuuQv4ni6KQ4lBhSLaOu9pdhcYQSetSf2D2LVr5HX6T+lq7hTJ56CinJGJG6S0w/32l+9zV/As3YE/X2lUrWiVPdNdijeW9k9cuxX6qXHikpB5+xHE4r7IBl12HeJFztUz0359SlbNG5zcKQouLQXlWUCLPQyz2tQAXTNyBV3DHESAT+HyGF92N2Zw15Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqehqVN8QdVh7vB0jhbozCoqgwG/XZWp+2S1pX79zLo=;
 b=XJA4N/9ZBDllmiE/MXhHjKlvsX9JHcK2t2qt1kpYTmK0vmASAbBD+iyJudyfL+I2aG4bbPNNeEFiErXHYLwZkPxQ1ZXzCvURJlZ6wtiReaCrUkhKPkJLR81DM6+oXWjn2S4RBujKWBUrx7LHVUCOMA79KPnLmRtkrvZMyLOAKEjSOfySTJA3cfti4V3Ll49EENzH4xgRNSKXBITfz/kGNq3lrvtRABf6aaQMOzXfKC67NQPuxjyvB+Yln2IrwHBHnT4zcWiGBLSlSBgAkEmDiOjlAnEx+5U+XLKFmBIyNkrKxLQHQ55jvV9dCcXKtouueoDUGKk+HQtwneg2HkGbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqehqVN8QdVh7vB0jhbozCoqgwG/XZWp+2S1pX79zLo=;
 b=O/BI/vBYkQ4ZB1C1sRxZD+py8RwUCRZ2sADBD2ulsivDMjYjy5qeyA8gEIZ2YfGfV/kx0W2w8+qxXew2ZadtXRXmS1FP0Gfy9V6rhkNU5VJij8ydZDzw/q7ffNS9g1L1lxAVVBrG6U5BHsksDbgbleV6dDV7RYFhBLaFkZmzq6c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB7PR08MB3577.eurprd08.prod.outlook.com (2603:10a6:10:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 13:58:13 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1%7]) with mapi id 15.20.4778.012; Thu, 9 Dec 2021
 13:58:11 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH v2 1/3] xen-tools: Load xen related kernel modules during system boot
Date: Thu,  9 Dec 2021 14:57:50 +0100
Message-Id: <20211209135752.6872-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f1f78574-1ff7-4199-eb69-08d9bb1bfb3d
X-MS-TrafficTypeDiagnostic: 
	DB7PR08MB3577:EE_|AM5EUR03FT028:EE_|AS8PR08MB6006:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB60065376E24060DF22050F00FD709@AS8PR08MB6006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2iAOawTuoaNdFVbqXLvGeeYy9QeoShBJuWSk2/gkyoXeO/1sjfL9DOg4JhRhPKm7tTBHBqFaw+ObCA7pwEykUUgcvpd/7L7CNdFofY1/rLYvj968Sx5sMkfS4eK/nX5yDwsNL2dtIsexJw3BGB9Mvq9BLdrTNN31RhzWK8tQGiq5o2tlsj2O+C5evLkAP5cPKDwpRb50dwpF+DQVVdx9jMYFTGW4UdMj+gMcWZWNlAe3MeAA719vvh80JXMDQOP+l8m5TRXDBmVHB3bP6EIn+gV/Qqd9IlsON5y9JmwWsPyTuoBxpdAvPET8/2KndKrMPs5CxLoBkQqimyauJeiBkrFG7NqB+7y6QdmeIAhIwbMuOXtvG1WHKkwlL1qX2ZSlq1QuaBku1S25XP94IGUr3XufY/KunENsfbmbRUNfiOSmrFYkROhco8isKljR5fjEapYhUHzgaZOAJYlMQCkOMrs3BIG6gz1iTzrMxGp0qddmtb1Y68R1WNify2Bjcxd7+2KEdEQ4eW0CNOg6p2C8ncVYau0eZq4q76Kcbs+/rI/qMLFATQxHvCOD9PXU0a198D+fCQy7VFP0E1FbB31dum/1auX2JrY8IlHXEWexxapV2rGXdj3VAdSeqGlzrOIYmF2B7bmLrVR6RhtUOs+phSlmj0ijhCcDR5VVTTgPaeuzLlUOg1dTzATVxtrwG5wAIOgi+zuFcJXhxonNubIQWg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(66476007)(44832011)(8936002)(186003)(6666004)(26005)(66946007)(4326008)(2616005)(6506007)(66556008)(6916009)(52116002)(8676002)(508600001)(6486002)(36756003)(1076003)(6512007)(316002)(83380400001)(2906002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3577
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	322f3570-c996-464a-3545-08d9bb1bef5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WkPBm0iVQLU+dYW30XOG9Z+rOf7CqOgD0pO5Brm0NBwvBVy+fYoYI8yGd3leZT0h6HuTaFwhuYShf/Jn/4kz+DUZYrV4dkyGV1H169sYtdeuQi0ffGsVvKmhWpzgnA16TWFw/Zmk8xpcuKdAfnP0G5q7BxwYP3vz/MTMYg5Rf9yW5cCXtN0VVwgsAS7D4US0eVMQAkDkRPzksHeCYzKhG9yV7qclRF0sTuHHfYwSEkPxn6ursIS+Upne7Z8zAQrS1wKms2HaCMTzPEMreAK35dYId3p/Cw/J8W7bNoc5ZoEnoAkFt0y1npstU3ZIjndnjX+4q9Ux4SiD5hQMDrRY8KfTVck+t6rA3GQXr1uAN472zq2Z5hPqORnHpcmgJqs3nzx4PVPKX+7WExAqH+tzUOho06FslbYysWCrdmrvc0J5qCsV3P6ITJ3+5WZkk7882wyvDy+wWpwbCHhRABTyMJjplls0aljGEQ5x17x+ERX8cje3GpJfRSTuTF7KhiN/pzvU/OMDTo5yTopR+ysL/1CngBOgPDdn2pQv4AuAV0qIbvknbnBMMFgQyaszNNPVy9rfNStjyXYK5Pcsv2MVOhqSpEcX91pXKWC75Zn1UjiPCSfRzDyuV2grc6LNOcar0k5DfzuUpheFOZB/3+vVoA9YUuVtNrFZfqtcOtlZ6LfAWwXpS6t+a5IA+oYowxxb3Dev6OufW/8ZPwdNzZiv89vyi0Y9Qhlusg993+UdkW3lZyui0CGwanxpTFt+yDCiV+6TKEf548x9QcVRUYm0Bw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(6486002)(44832011)(6506007)(316002)(70586007)(26005)(5660300002)(2616005)(83380400001)(356005)(336012)(8936002)(40460700001)(82310400004)(47076005)(186003)(8676002)(6916009)(1076003)(36860700001)(4326008)(2906002)(86362001)(70206006)(6666004)(6512007)(36756003)(508600001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:58:30.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f78574-1ff7-4199-eb69-08d9bb1bfb3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6006
Content-Type: text/plain

This patch changes the location of xen.conf file, that contains list of kernel
modules to be loaded during system boot, to "${nonarch_libdir}".

Previous path based on "${systemd_unitdir}" was not considered by default by
systemd-modules-load.service.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen-tools.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index d831941..17ef0f7 100644
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
@@ -744,7 +744,7 @@ SYSTEMD_SERVICE:${PN}-xendomains = "xendomains.service"
 
 EXTRA_OECONF += " \
     --with-systemd=${systemd_unitdir}/system \
-    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
+    --with-systemd-modules-load=${nonarch_libdir}/modules-load.d \
     --with-initddir=${INIT_D_DIR} \
     --with-sysconfig-leaf-dir=default \
     --with-system-qemu=${bindir}/qemu-system-i386 \
-- 
2.17.1

