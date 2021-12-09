Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.72])
 by mx.groups.io with SMTP id smtpd.web10.11703.1639058372262046422
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tPKW1pQg;
 spf=pass (domain: arm.com, ip: 40.107.15.72, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=tPKW1pQgHnS9HAt/HCVdOtcP141+C+oyVAKxMgBn+CaSSfXZYCnYbSvZi1P7NcwcUAgo5sPIuNcGsUud1M2RYYNKiEcOI5XRZbxaJdpN36jGI7ba1B9T4XaHiTYQpW9CgaqpAxZA8zy/1jqv6DFaYG89dzpnW6ftWjnZftAcWqk=
Received: from DB6PR0501CA0046.eurprd05.prod.outlook.com (2603:10a6:4:67::32)
 by VI1PR0801MB1920.eurprd08.prod.outlook.com (2603:10a6:800:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 13:59:28 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::5e) by DB6PR0501CA0046.outlook.office365.com
 (2603:10a6:4:67::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11 via Frontend
 Transport; Thu, 9 Dec 2021 13:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 13:59:28 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Thu, 09 Dec 2021 13:59:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0a387bd54307a7b
X-CR-MTA-TID: 64aa7808
Received: from d06e150e186a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3BC28587-37F5-49BD-8586-CCDFA2D44743.1;
	Thu, 09 Dec 2021 13:59:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d06e150e186a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Dec 2021 13:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY3qkruWe2/266Z23A1nY+16qJ1aQWlMgmBttowVQBUdNKSb2E08uq5CjJOHArZMx9uR/0uRyLasK/ESqTxBtevhTxuZ/+jH9ba/yZgdJx9lAJEC0DebEgqDrMZU/NOvrLET2+Mo6KQRokBdyqtvqlTzu7FdZk4B+GWFolxgyHsXiVMaNSFDkAPkg6hSvutnhnnX861TCzo1GJSLYVMnNgPjOOlK1ygWpf7afRyQbiHPF5A/x/exY/8bDJkKelVYai8fRZfa6BVJEI1pNgOiRwS2mqrP2/fcZo2iUK5tHxp91x3ukj0AH+6WgHQ3SD4K7TB2IXGXVUO6om9ToO5d2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=jXzVlqR+c120horWSND9eTG35sIDp4lx3k5bYiK9ufTgNs8MR0YQ4cmavpFO2lO0chTyl3oDue9sUFTgKzPHrKTNRQ/ejIaJC12+BjQaviD1zaCig6GEKTVpsStqoLHvzs748wP4Vc+PJ0RowpQXiMK02THgzzO/8TDd5HV30jA0A2L395aT260Rhfqi/TST+07X0H+TrZmeg2V9XbD1KOhAYkatOm6ZQIAMXuxelVjjMKPAWr6cv9P5Qu4aPzokSNVnK5inRqiX200NKEaQyl2C0mzXxrru1LF11ux1mPDniTfHrTsffc9umvmMnax412baYHFPd/qvY3awlkW4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=tPKW1pQgHnS9HAt/HCVdOtcP141+C+oyVAKxMgBn+CaSSfXZYCnYbSvZi1P7NcwcUAgo5sPIuNcGsUud1M2RYYNKiEcOI5XRZbxaJdpN36jGI7ba1B9T4XaHiTYQpW9CgaqpAxZA8zy/1jqv6DFaYG89dzpnW6ftWjnZftAcWqk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 13:59:19 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::74ce:3927:b1f1:10a1%7]) with mapi id 15.20.4778.012; Thu, 9 Dec 2021
 13:59:19 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH v2 3/3] grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES for aarch64
Date: Thu,  9 Dec 2021 14:57:52 +0100
Message-Id: <20211209135752.6872-3-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209135752.6872-1-kamil.dziezyk@arm.com>
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 255b7c7d-23f6-42e2-8fab-08d9bb1c1dd1
X-MS-TrafficTypeDiagnostic: 
	DBBPR08MB5979:EE_|DB5EUR03FT029:EE_|VI1PR0801MB1920:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1920C0E4128488C38F54BFCBFD709@VI1PR0801MB1920.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SN2cmcysShT1WfWKco5a5g/1s8PnBziGjwrYYWxZpXOR5aGa5rQyv8c11w9GhBT6lrC35QTv0XcdY8IY+Or00WkwpZp26a+yVRTw+I2e+mKPt5Z3IvYobcxl1nthIwSlOOjdMDl4+c3/HxzWZor8oP+3VOAEsXIMYEgbuL7lPfrbMMWXb+OuG0HB/AVSoAB6RoGKEXIc4rNrZb7t3+4Bf+cg7EzSbbgsNhF/zLtXiNrOOpv9Fwj5KBjUceapODUSSrYqGsfQoNVupwFRCVqGrgSkD1Rr6tpQie+UMK+fEz/N5QVYfSDAaYoDQUrvICWoE4/Uq/AQCaD4Rmr1CnWB5ax/u+0oONcaIDVenLvSDHt6k3H7XB8aUwXyp25YXVQ8CpqpovwUUikIiXe66szJbqwxfwYj6/+WP2ZYA7iYZRgqXXUbQBqPPClCr4AL+/39xW8vU0IFIVST1hkNc59ceWnqOfpoEORaKmOXnGqT+hqZjtn+G5eC2+jwfcDZ/BbW6b7vEDX7oVYLNClHGtYswUZkNPCcnFonII5hW4Zb4dbFIcRhajlX0swkrM+QPVmzHOzjaKGqxitZ83h/E+smELaEFiGTeTsNSSQb9U0Clm0T1xaXWQo5VxMY5zZR4VOKO3NcD3NQmzXqPNfHG/p0GWoD22c/K9QBZ1y3788ANy1sN7NTIy4L59RZ8h94FVWWF7aeT4uOo3RaU/H+MqOJWg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(1076003)(38350700002)(38100700002)(2906002)(6916009)(36756003)(5660300002)(316002)(8936002)(8676002)(4744005)(26005)(6486002)(6512007)(44832011)(86362001)(52116002)(508600001)(66556008)(6666004)(66946007)(2616005)(66476007)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0886c35e-3add-405f-8be9-08d9bb1c1819
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qmwLbd6P8s4cenJ23ZXWVjwLxaJWp6QDWgRQJzXLSdKLYiYIffSsGZ+m+0kJ/TgznSrBjjfee54h/E4XcR4ejIV8TKmyHQ/Lnj9j9YXQbD9kZZAGaYHAdD2GmSEoL6dRyjBnFe+6fTkAbtbN13ozDhjfNbqEjtxmkfyPQ3w81mgQPrlStCrPSQfXit/MnBL1XErGn6XFffzaAVFPhRQcMWljL8fxxqLvUfxcy1cAezElnVpo0C+VH4jE3jhcEvDu4dkAKK/gkr20YtVUWRyJIce1GUBliqQ9AgpdHyA4dFy8ljrTZgR6mPIloxDSv6vxf1F2KvUc1P5Y6Xrh0BAmn6DeSi0pxj1HSO8Dy4KH8MrqE34rO+lMYmSXQJGCX8ehQZZo/gxUs696wfF+RIJBZpqbEaGe3ZIKNB96ewQp0d5qI6Cd8+Z0xMtR+zkTbsOQc6q4XIIhHtuPqqSxUbvQug3hTnHWkY91zmoY0j4zZQVBIp0GMXEgIAabT8Rt8NNi/CBb5457vEBrDMOjjwiy2/JWnzNX5Mbsfq1f/b5OcNPNBdfBSEWN9uR3RjJ90xRhL7ySu3+eLMRGroJDnULqAxTyWNPeR17iBK3EEQRKUczcFGfUU9PvIpOTXHG41T592oVVi6suURCjUVfita+udNQ/3GQ8pkxX4vco9+UB2EcoKmgEy45JeXWrk5hyeB1UcwvCqySUImj6/tfziVbOiw9QEaXf+yMz4zxSqmHx6wSuHXjW01tki55Y4fkZY+OybfcibjRdzsod+Nmw69stmw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(81166007)(36756003)(4326008)(26005)(6506007)(2616005)(336012)(508600001)(1076003)(40460700001)(6666004)(6512007)(5660300002)(82310400004)(44832011)(70586007)(8676002)(36860700001)(356005)(6486002)(70206006)(6916009)(8936002)(47076005)(4744005)(2906002)(316002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:59:28.3317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255b7c7d-23f6-42e2-8fab-08d9bb1c1dd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1920
Content-Type: text/plain

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-bsp/grub/grub-efi_%.bbappend | 1 +
 recipes-bsp/grub/grub-efi_xen.inc    | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 recipes-bsp/grub/grub-efi_%.bbappend
 create mode 100644 recipes-bsp/grub/grub-efi_xen.inc

diff --git a/recipes-bsp/grub/grub-efi_%.bbappend b/recipes-bsp/grub/grub-efi_%.bbappend
new file mode 100644
index 0000000..df2b688
--- /dev/null
+++ b/recipes-bsp/grub/grub-efi_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${BPN}_xen.inc', '', d)}
diff --git a/recipes-bsp/grub/grub-efi_xen.inc b/recipes-bsp/grub/grub-efi_xen.inc
new file mode 100644
index 0000000..5aa0958
--- /dev/null
+++ b/recipes-bsp/grub/grub-efi_xen.inc
@@ -0,0 +1 @@
+GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen_boot', '', d)}"
-- 
2.17.1

