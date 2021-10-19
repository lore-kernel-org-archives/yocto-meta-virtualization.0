Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.73])
 by mx.groups.io with SMTP id smtpd.web12.11181.1634656417802443637
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 08:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sfrtULyA;
 spf=pass (domain: arm.com, ip: 40.107.13.73, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/N799k0DRs1PmUU6dhQ2ZONpAODmTb12vIxH3NsxtE=;
 b=sfrtULyAB77bsxhaSck58+W3yqRpm/ZgnBrOVK53bdvKqorWCG3LoDbphhU9oE20kzKY2hqCd/BSvEft2U5LVUp5AsdlF6kwayEty5QHSgTjlGsxT0P9R2hE9QC81aLudWVeCnT2lY2KlLYAgRYuschf0hZGoAmB1/dJGz3YJiI=
Received: from DB6PR0802CA0027.eurprd08.prod.outlook.com (2603:10a6:4:a3::13)
 by PAXPR08MB7381.eurprd08.prod.outlook.com (2603:10a6:102:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 15:13:34 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::2a) by DB6PR0802CA0027.outlook.office365.com
 (2603:10a6:4:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 15:13:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 15:13:34 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Tue, 19 Oct 2021 15:13:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b442a73eef7b180b
X-CR-MTA-TID: 64aa7808
Received: from c1fee4eb3bad.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B0099DB-7125-4288-8F78-7D20BFF4F84F.1;
	Tue, 19 Oct 2021 15:13:27 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1fee4eb3bad.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Oct 2021 15:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGUR9qd9MULFSNoUkxLLB68ncCRZnEB7vLedbjKtPr4LjJINknwbbOlHFS8sVwzDoHBPKSI+CwuBJfS04e5ncetmctZdXSgnn/9sj2IiG8dwrt7vpT4KCmbX4eeoUzTQCLS7Q4NCfAxyYUC56oXFMhis1fdHSWQawb9tI6ZvuCYRwK9kDde+SPUg8LDGwriNzinLJJqqb0TP+vZiJq8FIs3AOnZSvRzArendBZ4UPqJsDIPb06uvafdRQhHjCpX87yZiA2jlNXFEgGowTui7UOqBGEzG4lVGlKZT2q66v6PDufzVjem3EG9xmX52NtiNR4Af4G24vE6hSjcUl5LrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/N799k0DRs1PmUU6dhQ2ZONpAODmTb12vIxH3NsxtE=;
 b=Tqje6tLIFUwErn5m6225xqriLANstXsz10wRJe0mNouDyQpB+9EMiOYM15zawJQDwKs4n7p9qTYUFQ44soIjzsUyoIZkJRW6OqlYihGAqLzVP04Bw48GjU4b6BXKTy/UhLEuaEDXBtjjJjfEBHEbZtG2Gh6vUYOlM0ipLUY7M09OLP+bR5GQKTYulM7c7wNY21Kt/fyyG1zvRo22fLaIrGeMLAmKRPpjKyb6dvtIPnfIcmTfdZFsTnkzCv8wONPy//jkg6wE1vhHCgnlzYofnukv+02AM3I5H6HDPdzUFl3x8OvDgawModZhlq9dog+tA7TXQ3QpCMsIR3QAISGxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/N799k0DRs1PmUU6dhQ2ZONpAODmTb12vIxH3NsxtE=;
 b=sfrtULyAB77bsxhaSck58+W3yqRpm/ZgnBrOVK53bdvKqorWCG3LoDbphhU9oE20kzKY2hqCd/BSvEft2U5LVUp5AsdlF6kwayEty5QHSgTjlGsxT0P9R2hE9QC81aLudWVeCnT2lY2KlLYAgRYuschf0hZGoAmB1/dJGz3YJiI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5916.eurprd08.prod.outlook.com (2603:10a6:10:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 15:13:26 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::985a:674:337f:5b70]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::985a:674:337f:5b70%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:13:26 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 2/2] k3s: Add xt-statistic kernel module to rrecommends
Date: Tue, 19 Oct 2021 17:12:12 +0200
Message-Id: <20211019151212.23410-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211019151212.23410-1-kamil.dziezyk@arm.com>
References: <20211019151212.23410-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 15:13:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27eed1b-2ab0-4105-375a-08d9931304e1
X-MS-TrafficTypeDiagnostic: DBBPR08MB5916:|PAXPR08MB7381:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB73815CD9869ED603165D1776FDBD9@PAXPR08MB7381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mCCCT6wtmJ1AYD1Njqa3B8hb+LdRQxAZsWAkYLap2dpzzytmZMbYjI0UDUG04ARuyLJHBMtNa31g7puNvOglp8GGt12KHDC6W7Wpb2m1BFKvOwnj2+IMhr9J179x6iC+sF7bacxJZTSM8Nn+NhFlzXTBOYHGLvCzMkVWfLsB09cRdnFktq96/znMTWVEXlRsix+oHXs1mE9g1BikjgrM4M6oNeJCjDLGowccqrVcl9eiosvCu4sfwjcl3XANFk+PKowbyJE8etRcxJWkqj/KDA8HJy687nAZ9YJcsDQ4zgO6qYOa9nLdoaYVg2XEpT73QAATvKjcYF5kyY3uFJ6NRuWS9/l3iuaJKX5ORCzCTiEpZF6Ev3AgG9/99R64FQ71aDxOTLGvue7oMFtS++7rYyNMlFt4po0rmiSS3JWMRswCnVrEj+ehzMq+dFBY7Iz2y8S32sey5X28u78eHszTGo+DXV9kgx0YZ9a+kbpo0x+QHOsq3gm+rCz5ku7f8w9gKNHlttSNHJngm1kT65F+xM1/KSEswpCFpTr7YwGSrD081I3ZhygsC4taUKuhznaVhkTpjv+INOVp9oYwb0OG/rr8UGfDHowoUYMKhOsyQIk+iqQEEwqZbYjVxITS3NLJwhJowiWPf1w4o+W7IH8ZzSdKQQr0QzYIRe9bTnwEEKJsbBAzBAUU/3sHxOYNPhaMgZk88Hr9fwKD9RcxEPb1MA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(36756003)(316002)(44832011)(6916009)(956004)(7696005)(38100700002)(26005)(4326008)(38350700002)(2616005)(66476007)(6666004)(6486002)(2906002)(8936002)(5660300002)(4744005)(66946007)(66556008)(186003)(8676002)(1076003)(52116002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5916
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a98017c5-2837-401c-fb68-08d99312ffe8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FA5cg0o8r8cks/obFxiSJ8SI3xx8AZc0EJm5bv6d1Hhe2RovZN5kVSr6CAgRrF05sgfEVuLncAf7LwP6fi9B67n8V/GVTY9OJf/ueEghfDmJTQx+RhmQrUGDCK19nANbjPL2/EtugOVzBRa81CeVo4Bd60jmnECkSvM7+wsszYJwepSVhtizoe07hLtYBnZhTY22u1GsUFkkAi83lbVlExsqMJpkR/mRDkPeBHc445Hp6O2q0khrUeOtPnCNBqNFi0JyCug6xQe31PGXa1Rc/vKwltjZTHNV2xeG9VKUIKgTVxfh2DDL6lrtmGfa8ZDxpCGO0Kikgl9PJfO72QWK0bA4y9fH9Au5TS/ymNqYVTVc/O5oJe9L+XkMgfsgOJfnsNR9LQeEteN4nnHLJ64gtBuDrJR53AfOenFl/h9molIPxjnec5swUwC3BmUJHSoiCL+Dd/ZCMTwt5XOe6OHtP3pRP5Up926hMddiSlgQhc9q6OwLK5dxIzZRQ+7ck/7nxvP5fweTvLaiJnE/33Hr+bI+A1f+1xqIjFe09MD3lOgFJxCGkupqyUDOlaRpk/FxrC/Qv8unvs2grvDI1uMYJmNuhXTk3Ev5v0DpUIZPCuN5pYdA4AhQDxvjmsaETUCv6DIJiOPTncz5LEuPR3q8roJj48/awxPvQxzNrZ2+U82eEl50ruBVMQesHK8Dis0pgwoIEFcSU+BBK/8DH3LOLw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(70206006)(2616005)(316002)(186003)(6486002)(47076005)(82310400003)(6916009)(8936002)(4326008)(5660300002)(1076003)(26005)(86362001)(36756003)(6666004)(336012)(36860700001)(44832011)(81166007)(508600001)(356005)(2906002)(70586007)(956004)(7696005)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 15:13:34.5076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a27eed1b-2ab0-4105-375a-08d9931304e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7381
Content-Type: text/plain

Include the xt-statistic kernel module required by K3S for iptables
configuration.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I7592261c65c7c0831ce553ee907fba9e3e458b6f
---
 recipes-containers/k3s/k3s_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index 0300fc3..e341ad7 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -95,6 +95,7 @@ RRECOMMENDS:${PN} = "\
                      kernel-module-xt-connmark \
                      kernel-module-vxlan \
                      kernel-module-xt-masquerade \
+                     kernel-module-xt-statistic \
                      "
 
 RCONFLICTS:${PN} = "kubectl"
-- 
2.17.1

