Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web12.827.1624561216438348655
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 12:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dS4Vhubc;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1lztFidcrSq5z4OYr77NFwuiCSICcWm7ojJMeuIZ84=;
 b=dS4Vhubc47xgIP4MIBsq26YDJ+Jyity2JymC0lF/BRfoitEXjrL2nOYlRphpAYZHw+iJjcX7hiafpeK94dMRUiPPDtrmnYHXciO8hwsvGv29yt2aDlGV5EYJcnRcEPlxfh3S6DmY3+3cwH9qhPXi3iheWi4ym5B4RbUMPqypfTM=
Received: from DB6PR0601CA0023.eurprd06.prod.outlook.com (2603:10a6:4:7b::33)
 by VI1PR0802MB2477.eurprd08.prod.outlook.com (2603:10a6:800:ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 19:00:13 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::bd) by DB6PR0601CA0023.outlook.office365.com
 (2603:10a6:4:7b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 19:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 19:00:12 +0000
Received: ("Tessian outbound 7f55dcc5b33a:v96"); Thu, 24 Jun 2021 19:00:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f54b616f444d812f
X-CR-MTA-TID: 64aa7808
Received: from afdce8577871.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5823D8E-5F6B-4B0D-B3BB-066EB7F2A423.1;
	Thu, 24 Jun 2021 19:00:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afdce8577871.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Jun 2021 19:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kxv3XCUbjwcSA06D2v4spe5h7Cq+gevCI2jzfv866Sifs0jQzgmxLjci58yrfTf0OKk9kOWTJTGUCwAf2vnHCSXgp0EwU7Lz/yxG34yV4nSlA2Wk27U0hBhV0ZccuPdGC8XVMISD2noOz0S+xIcxl0STXw4Y5pt15YvUux9t/wF6rHoF6MWFhFt/S0b/mpqt4DlzTxjIlob3ktyKi2xeXscuvZdL4S42V8DPmKMU+qC2PgA0QsdNh9EcFSqD4c7rn+ObBGYvenITVFERHEqIN6ZIWImN+i5kxR3XiEP0Ew9BeXYm8SDrxh8FZX/bojJ113U9fzSHSyX24tJj3zIE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1lztFidcrSq5z4OYr77NFwuiCSICcWm7ojJMeuIZ84=;
 b=DOfs1xd94CTnQ4om+M/rsEdaeWGMIXBPP15Wv35AOd4wHBZVVKudlH14lMLHKt30a6/q0nRFxRmIxwOxF/h+alPTfbMULXyzDCIWIAsKQ2DwR99TYjGckA+2mtm/eKZa8KaIemRFo5SqMC5aGwzfbXW3PYmtCEfobOTPgAIO38vFqjvdAoHoMTXjxhOKgNdnAA9d6omyaAQuSZ0qEt+0orX+r1gfi+yk3Fg9q4s6HwYUF8EVm2R2U3Gt22zQ8jqcmo78i85QZgUgOjjq4E6ycXb60h49vGQ8BhT7xQDOMG/OYtcgGOR9wC+D3Pcb22TrOHzSEjyRTO49D+yGT07SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1lztFidcrSq5z4OYr77NFwuiCSICcWm7ojJMeuIZ84=;
 b=dS4Vhubc47xgIP4MIBsq26YDJ+Jyity2JymC0lF/BRfoitEXjrL2nOYlRphpAYZHw+iJjcX7hiafpeK94dMRUiPPDtrmnYHXciO8hwsvGv29yt2aDlGV5EYJcnRcEPlxfh3S6DmY3+3cwH9qhPXi3iheWi4ym5B4RbUMPqypfTM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3462.eurprd08.prod.outlook.com (2603:10a6:20b:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 19:00:04 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 19:00:04 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH 3/3] slirp4netns: Add seccomp as REQUIRED_DISTRO_FEATURES
Date: Thu, 24 Jun 2021 19:59:34 +0100
Message-Id: <323df2816a6e7e1d597d1d076b12211a827b3840.1624561041.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 19:00:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b23c2fc0-acda-42ac-cd32-08d937424b90
X-MS-TrafficTypeDiagnostic: AM6PR08MB3462:|VI1PR0802MB2477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2477B9F0D7BFA8650485EE1592079@VI1PR0802MB2477.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yWpowKl28k++AzhRwxsl/sF1mp76E/6nOxUUy7SZ0WV15j6lChTtBYv0OGYuJ6VEBOLI2Gfus8L633pBPYztLCQWYBThIkigTVlKLE4MY2WxH/zHoARrBu1SHmkIbEZ1nOZA9l+5WIOpxnDTBoJ3QBwPZdF7meZ7b9bAIXaCcn5LBvJlWwqU4khvLdDeE9zBe2mil9xKdqARZTrkFVvxT28aX/wT8gVkq1thnqiMN6ecDFAkUxGGY+CjH85pqTo/bP3az0In56W/+rASuyJaPaYGrqctqXqqQnQlZNGX20HKPzCQiFRebz79ML60+LBdnYIS97z2t7d14OAJHrvXgAF2iNjuwOgLRJqpA/dtFdfGMOuYiJ6NmRpN6T059++r2fiCw8dqpkBs+rrF3UGMKAHsEYr0D27st3ereGcLHT9xsxHz19BCsRhbPlxawen3uXUep/8g6Xhx7nxiKvLGe+2MyX6hNMlFAp+I0s8qD8ad2c/fgdaev6t/TVyygMPCbgfFJLLUdFce8DEMsflbsY7UlL/6es9QMh1zh8mtMIjAPB/ZAT2POCJ6pk0woCMXmDwUzga+9xIDnKZIibhJ+cPyEYnnECRcfx7/Vze/WEfrKMVSwrg7VnjbQqhEe6cCoWT5otckPJKLH3OSndalNyecpXpCd7aLyR98KIhkOHjNH0zjUDPAVRFgtBpcPCpCwcvP8Sslp8i/sfMIPpxJ+kJLCv1tfEKkwX8n4qgpmAM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(478600001)(66476007)(66556008)(44832011)(38100700002)(7696005)(8936002)(6916009)(38350700002)(86362001)(52116002)(36756003)(2616005)(5660300002)(316002)(6666004)(956004)(4326008)(26005)(16526019)(6486002)(4744005)(66946007)(186003)(2906002)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?n8jCk7/O3rx0S9OxuI1mcfd9gyIQlhj0FuQGxdF/kYy92+3JqHXl/OHfIGKl?=
 =?us-ascii?Q?azaOUH6wkaLaY10BLjDUVqgOE4OTjw+k5OIY0kQ1u5CkoaaTLR7fUl5uStXf?=
 =?us-ascii?Q?efQxvNWGPjq4XjHDuY3VtRptHRaa+YgksRUQqgUqvDoDafRc+wkKG9fUMvNr?=
 =?us-ascii?Q?vfTXwj5QvCY9g03AxTvbgISK+HvGYOAOG9P1Tp1fuePoD4xNVPXR8SCwctCX?=
 =?us-ascii?Q?cozWvti/VyROCHa5pArtGoPjLTS3u2wXzFatCOHwFUC9WDKppkyBmiWJz4JQ?=
 =?us-ascii?Q?ZSMq4y8TSubo7jZaBOtsxuWXWhmckQjFp/Z8FOrk4VMpOd6bSOzvkyDpKBQf?=
 =?us-ascii?Q?C1HVy7L8ar0xmZA+j57GrXXOkYNUV5BIlOaH3+JSBg76f3iUl4bk3Z8eb0ZZ?=
 =?us-ascii?Q?q9+GPE8c1LgwvYb1WmAMEBNWhovgt5ZFwUIdxK5TGAQd0wK+tiwvXT1ctMzv?=
 =?us-ascii?Q?0icsEszetH7hnwA0mixtsUWANgFa7TwQGlwHFpT+RWOPS+IJFTTUIs9gHCvD?=
 =?us-ascii?Q?dOY2LtvW/a3sN7+Lkv8KG4bjuWplZYzysQwL4/xk/Dip3szZspB4nIXGovgk?=
 =?us-ascii?Q?XB1aDKG0graiXCCF51xX2Bcb529ggXj9TqWnWokhxp/gz2YUEamm0rqrRUmU?=
 =?us-ascii?Q?VJRHQunNWGJ4JSLy987v1se/n35HVklCHEv7M15BSJ2YRMNEaUjtaUyNGcKy?=
 =?us-ascii?Q?WXQNI/BLzcPOQ++hngJhjgZjqpC7tDLYruauA+GNsUsY8gNqlWg/FJB+z5Eh?=
 =?us-ascii?Q?gRlhDOCo5kWeeeQWWjjbP9/SxUO6aa4dSafo3Pp9/eC2ct0WAXa1tFcT8Mq+?=
 =?us-ascii?Q?vVdlZ8llhgl+79FUztkWcuw2tyVgKtUs0KftE0xEbwNfsa3/OZj6B6YL8nvG?=
 =?us-ascii?Q?She+t40sjDFvhW2vSRCtCjhuXoTBUnKAvBpiGbdZlLdd9sE3IlJtshbFUG3r?=
 =?us-ascii?Q?ZKQnpqsn2i/1aN/sRq+wH8Fj6kkx43k1lFtIfo6Iat0trFNCC2jnbeWOZZZK?=
 =?us-ascii?Q?AfSCvprfUGvqNbEvD04ONRHGgvkJVbes9wvRZKA4ozb3mDV02WPIayQ/JtY/?=
 =?us-ascii?Q?FKMfJWA4KRRn3xWtEo7p50s2/sI3nMaZrCaIRSUhIMVikSpnFm1c1WJITw8u?=
 =?us-ascii?Q?pO4UpjzbeDqdZL9Z1b9x1r+39kM4D9wedp71MXKmIwRkD+qMtKffMnBNaIKf?=
 =?us-ascii?Q?+Au8TkOUMSET5EaqxidebkJ5SWF3GSEO7yxOtnpCORD3FS6B3UfA+moVP9g0?=
 =?us-ascii?Q?ItEAmsCG6EoQUm4mlGW1x6oHTaANRSv0hMdl7WnbzQ7sP6AKA7qhR3aQJR5X?=
 =?us-ascii?Q?29Y7UKWq87+nk12EtlNZ1HFG?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3462
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00eed0c0-78fb-4eaa-9a7d-08d93742467b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ambIGY85xkyN3+WpFiyS7Q1q5caZM2gos7TIRceL1k7eV7owRt/wMqB8yDPZilDphP+794A0imI4dz+Q4WjOSz7cPJYQpoH+r9Zv4HBXMrjOIFlgnykZuFV8xegS9vvfh/qqWYeXlzVaM6FOx0PVV9NNjDjRaBy9MNeVIBfn+CqexzSG+drVj8GVOnsr6XRmSGh7GfQVIDxsXrhe7vo75FYFVlyIslwq8s1XToxh28Lr3dYc1t5ts2Gm/T1LcnEMifjns+Y86PQDbCWjTuie/eKlKOZ5dTWMX95NicEaHeUBTEGOD/sebO8FugDVbNl8qHIddkHQWDBzhH8JLNVbBQBfoIlz6hh0OesR8UvOIJr8KQpGJuow5zwGC0O9l635tGqSABKI+lvjy7w/7OerG1aUTU0ZvnDR0mgdRGumx7nEX86IChpIFVRrvoDjRywztwwk2JBvl7fUFq+6Y0QgfvVzhv0sV5TzSmDcScteelbkFztgDhlbHe/vtdogbLRUtUaz2PoCELDPZokGIwFAbYK5exG0xMH8SGSCBrNJ9FETiedXZoqzTXAGlZiOkjCnGc3sxDCY3IPzF4nGGidiBj4VDnMcF4DqXMuKc8rUS8aPW/iYLd4WMMfL3xXuCL1vULg6ejqQyLmqTYV9BcZA6AfR/JLYyhGw7DZB9vI5zq9F4kAXnJQPn2w7YjxH36xHa71Ok97BKRMqOUeP1LvpMHogQqqvulYxOmQJf+N0PD0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(36840700001)(82740400003)(6666004)(6486002)(86362001)(36860700001)(36756003)(70586007)(2906002)(478600001)(8676002)(2616005)(956004)(44832011)(336012)(70206006)(82310400003)(8936002)(47076005)(356005)(26005)(5660300002)(16526019)(81166007)(186003)(4744005)(6916009)(316002)(7696005)(4326008)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 19:00:12.4706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b23c2fc0-acda-42ac-cd32-08d937424b90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2477
Content-Type: text/plain

The libseccomp package is only available if seccomp is in DISTRO_FEATURES.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb b/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
index b47df96..6349aac 100644
--- a/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
+++ b/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1e2efd29c201480c6be2744d9edade26"
 SRCREV = "4d38845e2e311b684fc8d1c775c725bfcd5ddc27"
 SRC_URI = "git://github.com/rootless-containers/slirp4netns.git;nobranch=1"
 
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
+
 DEPENDS = "glib-2.0 libcap libseccomp"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

