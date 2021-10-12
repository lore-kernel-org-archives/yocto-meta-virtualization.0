Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web09.17624.1634061155195914394
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 10:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CYB8mNmd;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39osF40lhuFqCrp2ZkoA0/ru19qggw5O+6rmWebJXc8=;
 b=CYB8mNmdH/chj+LL3rYPkrBCmqPpTKA7tUxRLxyzYKIHj2zz8Bb+pVhXZVu1CHuYI4Xv8wS1cJPWE7539yLhWQCKygcVzQaCo7kVD5ndNkPaRvLUnNoqwVQtVf3Upmg+D0woTwPvwNSKW3r9YwXIdyR5wW8tvPUviU3qVdg3tCM=
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by PR3PR08MB5834.eurprd08.prod.outlook.com (2603:10a6:102:90::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 17:52:26 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::5f) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 12 Oct 2021 17:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:52:26 +0000
Received: ("Tessian outbound f1898412aff1:v103"); Tue, 12 Oct 2021 17:52:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4d27fcd539d287f
X-CR-MTA-TID: 64aa7808
Received: from ecc7d548285b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C40BB5DF-6723-43D9-93AA-598BC19C9084.1;
	Tue, 12 Oct 2021 17:52:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ecc7d548285b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Oct 2021 17:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKGwSDMOzUShCBFgiWmKudEUaysqhIzZ1LPyHdptdnt0rrPq5WAAAwxlDqpZkDCaJaYN/E40oHY8TLmqPSzVfv2v4AxTWJPHAKU3XCi2e4SEf/gpYeGejTC5cj4BC/URh95TqSm45Vtn2ZSJOgj5+a81WhAXEcEYCo2XVzqkLhGRS5hCMyv5g62ya7Q7tFgRNUvOD/WIc0jKlJzHFWg16jlRDC8lT7gxqso3z48X1NlnpHxsnS04Me4HF7vrdvcwTjCMdVSeQ2fPLvyi1w1ERIQCNNMh2yURmKlEzK1z2yDlbeS6N9kt+RCd1q+ysQALhEp57Vc8Dn2w1wZxp8hFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39osF40lhuFqCrp2ZkoA0/ru19qggw5O+6rmWebJXc8=;
 b=SgFqylEqnDfMI4DnxwFF1/Ktu7dKfxT9WWBHelkLE9TvIVo0HcDewzZStHLNL3MgNclo/VBnQy9TPA/Rl1ARtZQf5ZsoJZgUSed7fEOsOInntmMMv5iPL1dwVmns6hlhn4tOhWbi7ifoxK+9dJgmUfZIaPvk2godJUjc/7UdZVX4YusdGoaTNF1AJj+o0yyVjRbFLu+e31qh66rT+xsFlM4htl5xvmFFmLiwarqpXPrWSL26EwzMG+1aI2mcd1Mp3Xdf715BoNqId9nbl4TL1sqSx9Hmp5KdVX+Vo1COLQg3t9dtttR0Oabp/cJYFwhQHyUl635UZyyzZeiaBTxtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39osF40lhuFqCrp2ZkoA0/ru19qggw5O+6rmWebJXc8=;
 b=CYB8mNmdH/chj+LL3rYPkrBCmqPpTKA7tUxRLxyzYKIHj2zz8Bb+pVhXZVu1CHuYI4Xv8wS1cJPWE7539yLhWQCKygcVzQaCo7kVD5ndNkPaRvLUnNoqwVQtVf3Upmg+D0woTwPvwNSKW3r9YwXIdyR5wW8tvPUviU3qVdg3tCM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB7026.eurprd08.prod.outlook.com (2603:10a6:20b:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Tue, 12 Oct
 2021 17:52:17 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 17:52:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][hardknott][PATCH] k3s: Bump to v1.20.11+k3s2
Date: Tue, 12 Oct 2021 18:52:00 +0100
Message-Id: <9b56a9db183fd6725e570d16365e627905cdbbdf.1634060903.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
Received: from e120809.cambridge.arm.com (217.140.106.54) by LO2P123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 17:52:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdb6dbec-2ce5-43c4-b6c3-08d98da90d75
X-MS-TrafficTypeDiagnostic: AS8PR08MB7026:|PR3PR08MB5834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB58343DEF9071EA186A7F6FE792B69@PR3PR08MB5834.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:854;OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AsbClDO64zVXU3OvxKQApxrYfd1eiUlps1K1kxlYvO8al8lK3Ki0vEpyW2Abyqt+hPtY7bQrv2r4vn6gEHTepWomW8H8pW1N+29YSwcThKjytY6Uoca/+4Ny4tcZ0m5RVrDLXjOntYOEf0s4XI/6ddoOmXU/c0f//G0EyswU9boTpywG2083FoFtVa5pyu2BHe3LqVNOuN/bfDPzPXt6mwaOe59Pa2yguNAHx4WZPtegpfWJ6OfolcwM+HaSOmbrJT3+UHQjXru6lD5IUTUEdVf2MsQrH6UKM2VTUW9E6xFPHaoBAoe3zY+FDmj5xdUtzB14nDi/PApzB0Ag8hj99nxvgOi7HiKDwP97yAVDu7SbkAKkW3wTJS18lXsDZiXhZs7qIw/nLKQfKXiz171YVmmGgmKemMcdrD6sDWjUWP7M+hOEnp1Avn0xxmLJRCUIe85omO04+YWk/xSolObKrWRXsIGGKFexYHuMmkBPJBKD2JSJMsEAx31xsJCPXzXpOLPBTKKixiR9wBIaOQlBaL7egyDg/Ja4mr8CY+0RgKtbI+an9n21dWnpz8ud4KBmoNpseP25Npdu6dSbKnCCVvcnGhVlfPzY1VRrwwwi5nR1aIUcyMvtbqgTXwhRtRLu7v/LH2fZO9gN1H0fNDkeCYF3YjPyAhoyRATupy9ZWOnOL/tbYKD71ixbQGinqWdCPE+BJBJ8vT2nP0i8fBpt5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(66946007)(4744005)(86362001)(26005)(6666004)(186003)(956004)(2616005)(66556008)(66476007)(44832011)(52116002)(8936002)(7696005)(36756003)(2906002)(5660300002)(6916009)(38100700002)(508600001)(83380400001)(6486002)(4326008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7026
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db33b722-ca5b-4d44-0cfb-08d98da907a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LjUFj4T1n3et3xo1n4ABl2HTO/XVHTpK8lE3qYaVL3ROdiZTUlegv9byqytjG4FZpcdoCxSKUi60VRoFqdlQjj6kdcn7ixn0JxEY3lfaAoD5i14Us9vm04B+PgbVwR3Zk2WclPUS6GfCjaYD7CpWkumDsG3wLwDIA1Qkc7T2wKrRY/p8/CnXTrz9T7uW0Bm+eh1/awqkVxDjDM0531EUcTNz2XXg9EBjSlRlOK1YCdHdL0ocIKx06D58w9gelXpXYBhVGtswnpd8l2hlY7KJKl9qK/SeW8NlnXNwTUIUCwXxgdEyDetMXOsgNTCCX3Rao25x2I0bTMvJdAlvfSCDylNIMKGiHBh/923X4JcX1E5LATCA2Zy+I2CCcvY9jSXMOnvjqxx5MmrIfc1gIcqy015AU3gGvkxpF13tmpI/jOYbjp9AXyAY0m/0ro+B1hV8s5gFemm/2KNHK1/C3TWqZzvdx88u9hEZz5jgzjGsd/ANy5yy8sJNz7lgTWFF9Ne10HS9/BAnIE+gulsY6XWghGMb2PWbFkvQngT/rgXPTUA/s9fQ+d49KecSmLRLtLWSqLIq9qZ99KOQZ/mGOSXAMoM5sOX6qQLE3oVlxTOnZX5NKOMIBvSpTQk3excdngsVdi6EyAesC3mz6mU+Bu8y1URf+z3pkfZfjTh0WXbOKSIY99DYxNzvdrgg0x85pPYyvkJ8gs3Mb80s8l7IZgGEfA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(8676002)(86362001)(70586007)(81166007)(4326008)(36860700001)(6666004)(36756003)(6916009)(186003)(2906002)(356005)(4744005)(82310400003)(6486002)(7696005)(5660300002)(8936002)(44832011)(508600001)(336012)(316002)(26005)(2616005)(956004)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:52:26.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb6dbec-2ce5-43c4-b6c3-08d98da90d75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5834
Content-Type: text/plain

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/k3s/k3s_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index 2811fb8..f51d9d4 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -13,9 +13,9 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.20;name=k3s \
            file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
           "
 SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
-SRCREV_k3s = "bc400f5396a3dd05584c5f45768a5ea6c43971d1"
+SRCREV_k3s = "9cb5fb5716bdfb13e755206aff5688961f5bafb3"
 
-PV = "v1.20.4+k3s1"
+PV = "v1.20.11+k3s2"
 
 CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
 
-- 
2.17.1

