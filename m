Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web12.10516.1638960380656793792
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=X2MfD67u;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=X2MfD67uHbEUTXU6E4k2tjNjgMVQZklL8v/z2tL7fWOoAYe/0JLdp1x0dtKfSnuI2Eyob+m6Uxd+CTFOav4icvMsPiODeRCC6qls8qp92gJrcDtKEKt5zYUCqg+L91p2a+S11pBX0l6b7C4LdOldpgSUf+gIO5kiq5TdJI6ZciM=
Received: from AM9P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::30)
 by AM0PR08MB5188.eurprd08.prod.outlook.com (2603:10a6:208:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 10:46:17 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21d:cafe::3d) by AM9P192CA0025.outlook.office365.com
 (2603:10a6:20b:21d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 8 Dec 2021 10:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 10:46:16 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110"); Wed, 08 Dec 2021 10:46:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0f57117e8fa50af
X-CR-MTA-TID: 64aa7808
Received: from a59fd2eeb9c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ED80F900-02D0-4314-9223-91A690E0F9D8.1;
	Wed, 08 Dec 2021 10:46:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a59fd2eeb9c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 10:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6UaeuJS+RhMb78eMNCklhDiXd5HyU76K3A/Cq5joI0OeutwsPkopSZaUiqIJddVTSxyvdGZgms33pzr2RoTLm++h+WbsAJtk5JFSDxLp+IwsPKiJ1SC+0LxPUnvO3kusczQVf3AzDqCTLRUlCdoe78LqhOh2Pnq4CDxxnEiR/P1jaq8e5YcRpzJLG5fFdFayzsrS5eofA6452RD2/2BT9KduFfE2DIabDyyHn+/R497uzBfSUjTLXmkOdE2M6kIwp5S0nabZsOgKYfM0uaty1Osb6CPbKbedpZ5ftisWFiwILSs5v33dvXtegv+hVurldgoG2bm9+c6oEg4vMZ01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=m/aAvDeZKFy5jRj/gFM5nqiZwzNkGK5XUOufT5dI65v9iTIATPeuBgjdHoUC+jDo7oK8ZqJxaAB5BfZLbMMAl47BLs1/HDRyZejMLYWngeNwsPWC3BOZ4IyCRFVrNZDZKIS6Jqp2xgRHPoUyRi6ieT2EKgdTfzgXkXIbkZ+h+nHvVtU/EnhivTKMkQZM3PAE3FB2Y6EeG8D3k/vD/g8fXvpHzaTxaGe2ABq/gDofw5Wri0353BRXNwWKsu568exVPVmaxuyCvQiTEe/Cgb8IomzqfDGdbAAMdrv3dYwpo6pR17TA0G9iRkBXcTSgt2WiNGVYgOOBxyOFJ7kJW05vSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAv2uzqAKbDZAs9MviADPkSJdXQQg2UOI+aDyuS8qFg=;
 b=X2MfD67uHbEUTXU6E4k2tjNjgMVQZklL8v/z2tL7fWOoAYe/0JLdp1x0dtKfSnuI2Eyob+m6Uxd+CTFOav4icvMsPiODeRCC6qls8qp92gJrcDtKEKt5zYUCqg+L91p2a+S11pBX0l6b7C4LdOldpgSUf+gIO5kiq5TdJI6ZciM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com (2603:10a6:101:1d::15)
 by PAXPR08MB6670.eurprd08.prod.outlook.com (2603:10a6:102:130::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 10:45:59 +0000
Received: from PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678]) by PR2PR08MB4699.eurprd08.prod.outlook.com
 ([fe80::a992:c4e2:a1dd:b678%7]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 10:45:59 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 2/3] xen: Clear TUNE_CCARGS for Xen build for aarch64 machines
Date: Wed,  8 Dec 2021 11:44:57 +0100
Message-Id: <20211208104458.28009-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208104458.28009-1-kamil.dziezyk@arm.com>
References: <20211208104458.28009-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To PR2PR08MB4699.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b43ff9c4-8561-42ca-2252-08d9ba37f61f
X-MS-TrafficTypeDiagnostic: 
	PAXPR08MB6670:EE_|VE1EUR03FT050:EE_|AM0PR08MB5188:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB51881E164F3B24FBC1AB4EC4FD6F9@AM0PR08MB5188.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3HhrNZhM+ELz8ycUpdDRrdWgp3wkAeMu3BCHakWaTj9osllQ7n6Qs/W1BjIx9XxETvfUhWQPZCjYAgHwk2mSRuDmleZQJii+CK+xsvGY33+cZt/Z+1Ng/hjQENmYBchct7uKLsplSlWxsnagfCpcwPeSQpcdPCbGT0hEWC7oZ+OZpw0DsbGFjc43P1YL+NkAxsRTTNqR2nKDt1KUhIE/Wko7nr826cS9evMhpSx70QGQz68kKqGBb3Y+aHKFJhAGI3sZkPN06e3Q5IHt2hDIX94X/B9rxUUt89oFaAdgNpQz4TrCHWfjLt6Y153okkrqnJpoi/srew1ZbFqIrLncBIaQXSYjuvo53Fcj/vguonEVFfyKFAfPxcDEhgaUznmBQC0rQuGyzX0WfIDRINytYvbF2zy7I5SSK8IKjas6xnx0VywwFGKNgWW52ZNMDuexq5HeYLM/g8n6pzOuswotWEcJBUTsCzV4LrJctDHVZUj8kcotc1Or+fTvGRAhQIka8Ac+P0bTZkLNZLS24pdcZbzqoxMzmztkU3hwIZvQ7dizDOIjwB7kUN8YnvhQW7PbLSRovtMk4T9Q9NurTOZwzNqMwEiemP8bXDgAVAJL09k6S1f0To3hEyIdLnjaNDAqRzHfymTBVD6ngqC2s2fcadf5nq3HQ8Sn5XE9/Soq+AY27gOPLPHKE5BxCXHHViN5ga14O6dHp6tH5RjxFtFuDQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4699.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(508600001)(2616005)(1076003)(44832011)(316002)(6512007)(52116002)(38100700002)(38350700002)(2906002)(8676002)(5660300002)(186003)(86362001)(6916009)(26005)(4326008)(66476007)(66556008)(8936002)(66946007)(83380400001)(36756003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	435bcd44-f265-4205-e45f-08d9ba37eb98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5SCgkKj4HMwLICM/Cs4yDQ0RxnWC3JSfF/1cO04lN/wqnHqklLAyHhD/8DBZznetr4RMG47NWz/M/t2b9+14gGzAgfvS2IgmISSYs9aBgo/cnP6gKbOJjBUu2dNc7Cc+Kp4sj1wqlPNzKpWhcHQRncwvjQReyZGZ6UY6XcRxzw3YfqDc6FkaTNQdDs7oqHrmaLig9Epo+F4Zut0N/Lzkc/11astUMhcwtmX8zql3Exmzp72qJb+yvNQANwrgDPtucdERVkPsuaiNA2neaVkPVL4WIRd/nBm9dAiGvmS/rpaMU2CVibbkV1SphvqKiHAvZ9ZykU8SLjZEkRs2NX2IUNxadtu9dl/YQigtfTOCxniPuHLlzfzJerSyzd/AT2VaZDYq9NyyPVyA0Ap8ZSztMWx3E5dfjWnE+qgtWD7m22WlIvchIspdjYE70cdEduowQ3nNfAxpMtvVAzFT4OIUzjtG0C5DMxRDkpwywvaKJTgXfc6dG0Hsz3BVf1IdmVBcr7hvK+nQ54w79YQjwXDbBae6iMwDkeDzYrFQj4jflq5Tt9qd2CHSDyER2UFuwjAq5ohEJ/+p31P0MtqMkISr6L80t2XHK1LzzJyjNEjpeFvTx0XMxXBsLQ0jX5ZOZ7feJBtPG4cd5REHgoYWqhMHjPi/KjhhQiZh91G3Z3q59Xfj/gsT9luKgJDVcWNYnHmc3TbiTUuUgZGjvuRibOi/XCUCE3MrCI0ubIoNgDrXFiVMFjgZyEJJYuOgGXeZa89XeQYX5FXWOabwh0VN5bUQHg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(186003)(26005)(70206006)(70586007)(40460700001)(82310400004)(508600001)(4326008)(2616005)(6512007)(36756003)(1076003)(36860700001)(44832011)(6486002)(6506007)(8936002)(2906002)(83380400001)(86362001)(356005)(8676002)(81166007)(316002)(5660300002)(336012)(6916009)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:46:16.3745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b43ff9c4-8561-42ca-2252-08d9ba37f61f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5188
Content-Type: text/plain

Xen build may fail for arm machines that have enabled extra flags,
that can be enabled only for specific architecture version, e.g. armv8-2a.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d3c7a7d..9ac82ef 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -102,6 +102,11 @@ EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
 #   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
 TUNE_CCARGS:x86-64=""
 
+# - The Xen build for aarch64 systems with HVM-mode enabled may include
+#   architecture specific flags '-march=*' which causes build failure, so clear
+#   TUNE_CCARGS on aarch64 to prevent that.
+TUNE_CCARGS:aarch64=""
+
 # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes the
 #   optimization -O via C*FLAGS which is problematic when the CFLAGS are cleared
 #   within the build because compilation fails with the compiler stating
-- 
2.17.1

