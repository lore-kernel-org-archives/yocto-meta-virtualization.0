Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.73])
 by mx.groups.io with SMTP id smtpd.web08.10526.1638960376425153670
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=43Fofmmr;
 spf=pass (domain: arm.com, ip: 40.107.2.73, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=43Fofmmrbf5K+Av9LRz5GfM7pnsz/+gaBMMW9TPoYHl8bHzrUpoBNHP3L7ZVEw6pXgDdK0JHnnbcr/w6ghUygYYAuYwubmMunpoB/Fn64P7vzc9bahYuRXQ7ubREQQKLJWQcte25hWhk/OAejQcJEmueAQ1zfKBgbYO+H2tJIfU=
Received: from DB7PR05CA0043.eurprd05.prod.outlook.com (2603:10a6:10:2e::20)
 by DB8PR08MB5099.eurprd08.prod.outlook.com (2603:10a6:10:ea::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 10:46:13 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::df) by DB7PR05CA0043.outlook.office365.com
 (2603:10a6:10:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 10:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 10:46:13 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110"); Wed, 08 Dec 2021 10:46:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b5a8c7038d1e480
X-CR-MTA-TID: 64aa7808
Received: from 156eadf5c8fe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9A29FC0-F80D-4D95-8CEC-631673F7F420.1;
	Wed, 08 Dec 2021 10:46:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 156eadf5c8fe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 10:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAWpnKJ39IB7UaicI/WXFKgkGDA2Q+duq8tPBw3DPpX/9ibQXYYyvmTFXQYV66oIri6zUDiIHWlGFDePIJ22kKKmaazWaUsP9I3JNjVi5te+XFN4RAd4YEJi1hACuK3GgdxFBAAcdzF3AjlTuqUtkp2lWUaCubj0udRodXb8u5yUI227lsnNs0huaTPYvBWEGndTDyPpvKSKkJL6aP/uRel+zBylLPingfQDX0nXeO9mpfPG6sv84FA/wq8ZqwSYiCZjs66MzPbm9iztmpnf7ib5ZwMZPzMyvAxJ3zHm0r37I5cFSvQh5r1xJFoKu+Vro4wFsnNvUmG9eeKIS/WMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=CxIC3AKzL15/5KrdVOcLWnO+zoHMe+t3UU0dTQ9gnPsJHrOLW6WEPzDJEMAls5PmaWbO6w+bbJv75G2xmUI2Izlg2E+xYLHAo3semMtZVMVkCjZv/aE7XVL5Ra6dNVmfp7xKQHK989koVfCGISB4m7G0CMO1E44sj1YrWAySBuqqteiZbFj4Kf+kYlW7NA+L+VSJkkbr7ZhX/DGtx1epZuYQJZAb3ysRGeHhvo7gZB8Q+019ul2Llyn3ydU+tpH3Vq4zHkGpL9Peb0l+FfObNEGCHljtfygWkBhgr/WPM9tJnsJV6OQZZlkE1vfbLkyruNbw+g+gtDmYZl1r/iGW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt3F+ik7S6/14cg7rUlPenQX8TUxP9n5vpZZWCoVsJM=;
 b=43Fofmmrbf5K+Av9LRz5GfM7pnsz/+gaBMMW9TPoYHl8bHzrUpoBNHP3L7ZVEw6pXgDdK0JHnnbcr/w6ghUygYYAuYwubmMunpoB/Fn64P7vzc9bahYuRXQ7ubREQQKLJWQcte25hWhk/OAejQcJEmueAQ1zfKBgbYO+H2tJIfU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com (2603:10a6:101:1d::15)
 by PAXPR08MB6670.eurprd08.prod.outlook.com (2603:10a6:102:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 10:46:04 +0000
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678]) by PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678%7]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 10:46:04 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 3/3] grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES for aarch64
Date: Wed,  8 Dec 2021 11:44:58 +0100
Message-Id: <20211208104458.28009-3-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208104458.28009-1-kamil.dziezyk@arm.com>
References: <20211208104458.28009-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To PR2PR08MB4699.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d7cde564-e949-49d4-2aef-08d9ba37f41a
X-MS-TrafficTypeDiagnostic: 
	PAXPR08MB6670:EE_|DB5EUR03FT053:EE_|DB8PR08MB5099:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5099DB5067610C243AA5DF68FD6F9@DB8PR08MB5099.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EP4MlPk1fgMqZoh9mULF3tVrdYc3R7Q45QVPZt22hVRiouMu2WrEfajrDwfODKwhn+vAcA9sNqhiZPVOhRrXiEPMECtqChmGqdbnwTOGvrUNX9neWXWVm2FYYpxnFQPxjxoP+Y9Y0/ILcPKIxgKyA8/nZWxFxsyLJ2At5x2ZBV21GXhehmQeupysFf6NFDucboNcIeEMTkQbrwlhQj6B+54If5xxGJVId0IaDtMDOqIcXuBD5R+1/9moQbHfU0oDw63lbkCG+uO1PP8z0S+lyK/I0BQ7ticyffGmpCX1+PGMYn9OL9K2sJqq/ryjK9VJM/E9yIXWt8HipnIhZyMa0ztnOfVoaZNZw+lrhDg4HNH2B9JgXbaFHUGL99p61Nc1GNgA6DamiAEQDGAX5YDIb38SknyFQ6JXTd3cr4VhfOCrVGci/ULseQUicJmvRXx8wpmWohKx72ag9+ERSQyFKqpabL+QeiUx49WVh8VXsIAx2T7QY9biV+slDZdzor1+lpte9AeOyKPsnyGE+9z6oE/HwV/R2CZrdm3AckmRU5oSH/6eqphE+LU2KsgfyaPZqtcMtEa//5mRFOL6iitSzKrKDHgaq/+n/0eSee2pvbhJSbIXWrCvlX0soKXLjkrYo3C82VyKbAHA8vFehgX7oDztTy88ftDgRkG8Je1J+0sxtSMJM854emQei2LX8PP+E0SfPUTT72qo4fB63arRzw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4699.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(6666004)(2616005)(1076003)(44832011)(316002)(6512007)(52116002)(38100700002)(38350700002)(2906002)(8676002)(5660300002)(186003)(86362001)(6916009)(26005)(4326008)(66476007)(66556008)(8936002)(4744005)(66946007)(36756003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2aef0490-9c66-47a3-0089-08d9ba37ee94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gAeFS9DVg+vQlsgXz/uhujApU1aTkfMKBqMQxQISyBsSklRlu0kvM+bfbw6Bz3K8sGN2U2YKaxfZpQTDaxaiS+Z1LfCj4lopKHyQln92FLIe8qzM8Mw7eNlvfEYdKBd1m9Otya4+qQWUgfbXf8opWvMhXdDBjTpzq5/1i2V7WI/m+r9pq9RDp3CvhhS6tBTe+vRfnYgfITN5CtR2N5niEkhL4msvhR8LLdBlA1Vfv5nl0JcVejbra/GlAeyeDzGiS9roKYrq7QsXpd0mos91aaSxdnaSMv0dd5kdY+rHG9gaAYFp40+0IZEztyqS5Z0B0sm5qEceoRjpOLW9StGHZUjcJrFqFti9CpBDzNNWH9RJM2Z4AqS7pebYFxePKY+NbrNw9jwiRzszbNpk71pXqfd4Hz2E6U7msGr7BJXmWVoSG5SB0m20WK0gOFadQ5+AONSS6kDi84HCTv5bMKJTxIBXI+U0Cspft6VAcp4OALGkgrpkyJf4BZ7tFc2fF+GfYX7q34HR14UYtOJza6vtYBefHk9nBjna1ESIXUO34m9Agsv77vhyo12wI4UicFQzLn2LHog77sHPndyC/TnLhnbAb5eQwFO/zNIKQE5X1a43kzgNHBfDQriswqOPaafDSaLrl184BpvvXseqdHq7k7rA+vUBGYkzwOX42QuxBlSV7jgMvYf9IWcajilvTcZS6vaG81pop96XKj2nfY5iN/XUhL3TrXlddE1k6vQ+4iC+N9+lY7liW0moWQV5NakuZ8sHbMMJvTYSjDlzTMnbkw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(2906002)(6486002)(5660300002)(336012)(6506007)(70206006)(8936002)(86362001)(82310400004)(6666004)(8676002)(40460700001)(186003)(70586007)(36756003)(1076003)(81166007)(316002)(4744005)(356005)(2616005)(6512007)(26005)(36860700001)(47076005)(508600001)(44832011)(4326008)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:46:13.0802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cde564-e949-49d4-2aef-08d9ba37f41a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5099
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

