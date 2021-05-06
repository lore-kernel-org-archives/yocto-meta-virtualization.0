Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.74])
 by mx.groups.io with SMTP id smtpd.web09.1106.1620315500259601698
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ss79T4z3;
 spf=pass (domain: arm.com, ip: 40.107.14.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChwiBvNbz+ltWiErU5GGsFYgzu2v/Pm+8maBKPiVF0c=;
 b=ss79T4z3hNGEhXBs3YG2ud7gZKkvaEUkoophUYcKvXCqE5ivoEMcBbGvHJ4cJ46TlD9v5GIAJjAXFgcRscenCpsImY5S34ArwdMgKd5M9k7htGtxb4VPiBltQ6F1AO8wkCk4gB5JqskAgTLhAB/jgu/NPNqIFQOS74VaIu9iXQQ=
Received: from AM6P195CA0055.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::32)
 by AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 15:38:17 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::85) by AM6P195CA0055.outlook.office365.com
 (2603:10a6:209:87::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 15:38:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:38:17 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91"); Thu, 06 May 2021 15:38:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e26c01c073fb6e04
X-CR-MTA-TID: 64aa7808
Received: from 5e42d76b16a5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 10D1EF0A-9654-4EB5-9365-BFB36CD2CBA9.1;
	Thu, 06 May 2021 15:38:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e42d76b16a5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 May 2021 15:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAUk9XF69cXyEPgSsw629SMO6ZePShQXR52xxyzvOPzv7pf87T8Dv1hYT1Iqki9cLMnZwaofdN6JbYN/oZP+nwFYOThtyG4Kfia9V6+H631SZiCP3RAngvnUaBLTr1ylE/j09XCV9pKS/txLlN01ni6FAgz9u7MJP4aeRyDL5FSgihE4T4vX+PX4d6QKmJcf4Tdt8UjE7JrZfIllHLv9mIHN5vDOEW4Vtg3PLhg2AYfwJA4hPUMeuzfODusF+gT3uPgbyRUpV+J35xeOjHR40vwswhh3l9Gw9xYdvtkzyiXdiN3HKoy2nDVZwVMzUbejH4jt9n7ioQ46ApqNPDCSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChwiBvNbz+ltWiErU5GGsFYgzu2v/Pm+8maBKPiVF0c=;
 b=B3Fb9m2eFeo+fKDiLRIMlZLW3IV5xs8+GQpSQAdIBbfxC2YTGxuI1KHpteGPwXQ3MsLqttboMp4G5I+kxdRo1vLyQStTntfemNpuQVl4wASnLDhx7otLTdQGMq6qk3C6pw3zK0hB85cRmWBvOoA28zB5FU6SUGu+/1woKRsyuRW5jlcac21RZf+l+LQQwRH9MlXxtLybH/FTlHCvPZVc2BSGureckSergTAiI9QMOImP2Mt84FfNeRoL5zo71DytbFj2rdgc2v1Q7MwLKEqP/wTjwwiODRlHW10i2UfCaGntXt9e84gjzooEz4yummYc81TRZL6ypG0vETV2J7J/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChwiBvNbz+ltWiErU5GGsFYgzu2v/Pm+8maBKPiVF0c=;
 b=ss79T4z3hNGEhXBs3YG2ud7gZKkvaEUkoophUYcKvXCqE5ivoEMcBbGvHJ4cJ46TlD9v5GIAJjAXFgcRscenCpsImY5S34ArwdMgKd5M9k7htGtxb4VPiBltQ6F1AO8wkCk4gB5JqskAgTLhAB/jgu/NPNqIFQOS74VaIu9iXQQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 15:38:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 15:38:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH] xen-tools: Pass -Wno-vla-parameter to workaround when compiling with gcc-11
Date: Thu,  6 May 2021 16:37:47 +0100
Message-Id: <aa94d0e5d2b32687aeb60654ca22ac0d009fb8d7.1620315173.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::28) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.51) by LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:38:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c126981-a9cc-4e06-f06f-08d910a4f84b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6213:|AM9PR08MB7120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB7120510023EFF83314D0256192589@AM9PR08MB7120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ilpeh2yeGa6yopT/8LnSWwyeaUSqZYmbMXlRQXNBAm5Nnqpey2wwN3RqEezDhY+/ZqA6YgAYZ2nodBj88x9zS8qSo9HwUbTSwr8XwYXUUlf3pDnLKgnYtQ+dqbifAmAD7prNypKBiLOmTSpI4RkBjDdDDSgIRBIl06KnG2iuPp64CWMAY/t12jN5fC77nfQVhBto3XfNESBXeC08EhZzz7WhW3gj/B6atR6A9d6RzbX0MW7fpRMmJpIKcH0aXbDvzVzvwOb4dMsFPoyUvZpRfNg+rcNsF3wKgcd2lqFXsYkPwPggQGc31FbxWkZQGo3FJ+POr+fMxk7e6D6yyTaIjM5L6xPjAsVRTqKHfLPzxX/KmsGY1rEe2FDVZz5aA9gxELBcywbr/Oa1sWUKA8s2xUHS3rNG+8TgKWmrU1lR0l4UBZxrv524SkIEvN58WUdApyCDalsT14XSmwaoXkUqH1BcRot8WV9ycpiMDyEwESprIGle91YuP+QDgyah17yzORkD5/KV3ABk5PmbxKxuuwdasO+c1jizOsTAQO7ofTLxsprlRmxQmGCi4snW0vObaGJFLP7XrTKKBSPROcVKqxYaemG/jE7PULpQFSBh1NAJ+13y8nMSLOvfI/GZpc+i8ds/n1uE5PeywFYcp6Iv5Yqb7jx4yL2KwIOLurz9pxQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(26005)(5660300002)(44832011)(52116002)(7696005)(316002)(8936002)(86362001)(478600001)(8676002)(6486002)(2906002)(4326008)(6916009)(66556008)(66946007)(66476007)(16526019)(186003)(2616005)(956004)(36756003)(38350700002)(38100700002)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?1AmyXv4Q9rp8tZED4o5kBZIBe1Bw0tjJNGPMlwDwFIxTAyZcGE7oe67gwX91?=
 =?us-ascii?Q?bn4eDb/DiEmTCo2z04VQ21v1RdQWKskeLP808or270MXPOo8EN2i0zkj1Cdm?=
 =?us-ascii?Q?Ay18+uxeFQr+l5L0LlFURqoBNNzNlDWlfkp/sVOT76YZKHFbBBhQPWxev7dk?=
 =?us-ascii?Q?brE5AV4bQoj1I870yCTEaEgRnDQnNrjww9F4FtsqH9PyquhB3zCggawEP4HB?=
 =?us-ascii?Q?9CGyO85spPEtWdx9uD4j0ZminqOPieZQNT3bwP5NAPj8k0u3dC3wRvV3IKM4?=
 =?us-ascii?Q?/h44zRn9ms176sAqS5fFtamqd7c23vI3BubkS6dH4M667erwdyh+/9r8rLaH?=
 =?us-ascii?Q?BNvdcuCTCXM7R0Hc6pYJpqHgz3ouxYSqVMLPFmSPOdPRRwQuATyEV6LH3VWC?=
 =?us-ascii?Q?OTVgMEWT/CpzoUqtIs7CSmMg75YDqjMaS9FFbzRFMRp0YET8QVjdMMbS5rHI?=
 =?us-ascii?Q?1PwIPIplDwwwJIqxBmxjMnFVGTtfm1ujF0/7mVupTsbDv2INzhcSkOINrdR6?=
 =?us-ascii?Q?Av1jYfQP3ristFPpGDF7orSzhEWqm2XGIXrRa4wRHRDZrphhjMy3FfPMYxCC?=
 =?us-ascii?Q?BRNF7q4ZBdZlHNoTbhw86ImZBeVxhWJ7fzmxzan9EeJO4xvUsFVmPaHGTQcF?=
 =?us-ascii?Q?7gfHdHptDlKRoag1BJNa2jeHPG5X1SxsdhzKaXZTQajgiskIWSZLZdiYLIUX?=
 =?us-ascii?Q?rsgqd92G1VmEcfhc86spdTFnOvstUfy0w1U4pJW6x29EB007W2/cAVv3q3r6?=
 =?us-ascii?Q?94MEEpMee4Dun1d+YpObhBRxOsHvLpsCbH/pcq2xsEs9d+bYJHazT8Txfb7i?=
 =?us-ascii?Q?Qh9+h5BHyzJvR/XF3UfESRKq+piNbuHyOJBRtSztguUPfCEQ8j1pUqgEIwkZ?=
 =?us-ascii?Q?Idp8/p99CimEc9vI9JNLdCOupZF+h1wDYyrVUU5S35ElHkdOpKCAmAkuedLD?=
 =?us-ascii?Q?s0hXzF4p1gNg2/7ONzEXhy9dEa1I0ES9CmnJh6KydzuqjPoQYSVKXo8yevxJ?=
 =?us-ascii?Q?v6wvCzp6vnDV2K6J0INqU+/85tOjTwll0U231PkR5Sxs7vYF6Ev6a4FXfmpx?=
 =?us-ascii?Q?Ess1isTEOEuTncgG6oezaFYL0sMcWrdhHAfxenOgWN9i9BHch6dLy7j1vNgD?=
 =?us-ascii?Q?2OOhHIxsYaN73TSCseEwXSVhdSNh0sWoSuTYlN1R+l2vJ8/zD3HUbEjjx93B?=
 =?us-ascii?Q?ZqgrKoIUQ8tpJ4PBBlEJeuSVwE8CxGxMoWMlF7R640L3utws155paBrmoIJl?=
 =?us-ascii?Q?JYtzu/y/JGP+a4vNp4E1UPIXlCj196FAtWzUD8XVV+mKw8bieg1X0ZF5LiVI?=
 =?us-ascii?Q?Q+OArM9IgQK4dyJrUXyj/9mH?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7d164762-bd82-4aae-03e0-08d910a4ef86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hr7x/Jt/p8/6IEvoU9H+nYfDW+gD2fboTBo2li/WdjMePcv7TEQucc+Mqx/UQ9PAzla6bq7E8binuFAdUazpFcJdyLO504d+7M8f56fojRHCKfbNUY4ArasoZCnBzEI8H4isv7jqyYhkNIm02x4yD0XHIL9dC8fZi7oddmcILiE97p1hpUIUwCQP7js/6NzRawUmE4xGJ80UyhHmP3t9bj/HvsqTlkMtrAAHvgKbkWjEvIQ9qbvwpwA2WsyaWyi5+2YMihXsT+ptP7CSfREWWV6X8gbIx+/ihVKwc9D+7sdCgwoFz4ROblkjtxH0mx8X6dT/uLgAmuDHOt88viOjVDMtXPmSoyrfaGuZIGzpaJ3QRyPyErTDBGlaBX5GWhlwu3g197ZvBA8Tm7m6BcXMAdWyjgQ7XV2ubQk3iwakKVmKQPgzHDs9k/vtNcYe8LQh/FrUXX9LQ0hud61tff5gB7PZqfgqLcF/+7PquykdVh0NHcOtZknymrQIV9pAlrRJdSnsywabi2NMxXAjZOHBCU6njF0dMkPeTEvIfdsoyWeEZES08VONdX+zmgmDXaVcZY2jWkN6KnUGUOvfbYEGlfDIEl+gjsGKYCK+zB/zrHr2HHiJaU/Li97zs/2swGYh4VAfyY/RGTLz7+IPvhEhM82vCCWvUTda5DSovlO5SCA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(4326008)(6666004)(7696005)(8676002)(6486002)(5660300002)(36860700001)(86362001)(8936002)(82740400003)(316002)(2906002)(70206006)(336012)(36756003)(956004)(82310400003)(6916009)(81166007)(83380400001)(186003)(16526019)(44832011)(26005)(2616005)(356005)(478600001)(70586007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:38:17.5483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c126981-a9cc-4e06-f06f-08d910a4f84b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7120
Content-Type: text/plain

When compiling xen-tools (4.14 and 4.15) with gcc-11 the following kind of
errors are produced:

linux.c:164:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
  164 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~

Workaround it by passing -Wno-vla-parameter to the compiler.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/xen-tools.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 3560e79..e939c45 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -725,9 +725,12 @@ do_configure() {
     do_configure_common
 }
 
+# Workaround when compiling with gcc-11
+EXTRA_CFLAGS_XEN_TOOLS_append = " -Wno-vla-parameter"
+
 do_compile() {
     cd ${S}
-    oe_runmake tools PYTHON="${PYTHON}"
+    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}" PYTHON="${PYTHON}"
 }
 
 do_install() {
-- 
2.17.1

