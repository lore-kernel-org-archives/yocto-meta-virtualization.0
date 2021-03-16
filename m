Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.85])
 by mx.groups.io with SMTP id smtpd.web12.4749.1615874745577958707
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 23:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p8W2Xaf5;
 spf=pass (domain: windriver.com, ip: 40.107.100.85, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6Lc+k6L47pKvgIYZTgq7acyDHxl0noRcjFXzNFdD542LWVj6qOEu0Gt6F20tF/BpTs4sNEtXqsV/xnM1d6U8qR3u/Ato72y0SktnLrM8od8CINCwsglV3JCp2/Sw1efCTYQfvnVqptgwQFtbN7dVdeKjX/WeUIpQeKmyQQav8tsPr//dgngGlWGLhSi+rbj9QXOnsW0Fz043qUcRrLVtylK2WIlfiICJlLI1mXalrcLYR3qfDup/H5CHlwp+giwJhFfLj2U+PQzxxfKc0wI2YiusluYSJtEbQ1/6Z5bwhuZZfwX3XkiiYj3x/dncu2g4d6pIeamrZV3vRSrHk79mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmeLmEN4WIITawjBqSJWXSeMLc7nwyuovQjdwHTbpjs=;
 b=KraGw4ALodSi8KDkEFyuEZMbLwfEdJMBkVHypYWzVEwv159qFyII+XxBdNoIoNOpNfkhaYdHlzMq//D2CWDWqfzgpw6BAikIfbu9moF++McF9OZk8y1avQ0aku4b+XnT8hyxa2mWi2/ajUljqht12HjP+Eul3oQL9XAsiYqX36MW+sSCMt4AdRAxKbXJYLfKysDS7O3bdUndZQOgSmeMyD7KSnWeYbBX7wnMiu4000hRlGqhvb7UDA6Z9p1jTArsXNZmVS2njIMhxrtG7rvSo9ITe8kxok7T3GHJIfaVue07ir7G7XJd9imNla9EKMSywsMpOifnoWWFQ1wHL9RuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmeLmEN4WIITawjBqSJWXSeMLc7nwyuovQjdwHTbpjs=;
 b=p8W2Xaf5rSSJPPN0iTh7/xtKJeLaiYuZSRIoE71omFKsDefoKEmvmzfpVVw7eoXm6vztbXwlrlOChvwzkkKgHs0j0zK7Hz7Bp/FT7gqL/j4bgmghtLy6krBObWnOKc3YrkCCYC5VfysewiqEyZjBQIEMh6e1xBNxfiP+qNObsco=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 06:05:43 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 06:05:43 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] consul: export GO111MODULE=off
Date: Tue, 16 Mar 2021 14:05:25 +0800
Message-Id: <20210316060525.27955-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0205.apcprd02.prod.outlook.com (2603:1096:201:20::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 06:05:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d2f6df-4eba-45e3-6073-08d8e841885d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34475EE3F5ACE91E16D56C02ED6B9@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PV1O+3bSuVpnSmtiO5yYO0BigcvwWQm0/BQPec+yBue3+XDjAiDdPtZyvaZdCHTv37T6ZxRUUsvWpUC/0V7FWCS23avgtQIXMmFFb8AdCgA1BFvjpsuzIa/3F0TsdzgnbnKZmgx/2rCiYDSzlKMCYA0pxTt9ZfkP7Lq1gIJrhX3cmdb842WhhCihrHVFEdf4kAGWt8FnCtB2gCmZjllfCxQiWHDWbTLm9uH6w9kqoaH4YbpTOL5PPm+viKctu7aYN7c+h8pnG76f1+b6xqE2wgTOYuJSXbKEt5KkPLmpKgeC3bJeMLyzdaU3csxDOIFFi0v5y8+mNa8oC/XG3j0Mcsp1/51t11BXiginCqgVD5JCTjJKoV/Zx3J2mw6pcgnXRf19EsBYMqxgdEdU9fo9VyfdbXcMmpakUx9k5lNp/mSCaN6At3BnV0Bd+Shlrmf75AiwCqmUYejAhs+EnVsHLTVhvqAlf0h4p7Lbx3nEsqOBA5HsPkaTNdAzOp3HS7d1ELZHngr4xayhFbbpYdLkTCtLB0ccq5j+PhhDK/iQoEcnZ7QGI3oDoPX1WDuThVIc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39850400004)(6486002)(6916009)(186003)(8676002)(956004)(478600001)(36756003)(16526019)(66946007)(66476007)(6666004)(2616005)(66556008)(8936002)(1076003)(6506007)(2906002)(6512007)(86362001)(26005)(52116002)(5660300002)(316002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IWtADBtG3fCkGPOKBSBLNy3zewilEGT8lrbF370WsYfrHTLNF7vEYFyRnRHi?=
 =?us-ascii?Q?LpDCvEicF/4tK2jGBEt7FD/KJoESj8fsqv0P7cKZBDyYafriG0GEhE+sZ0nZ?=
 =?us-ascii?Q?fhrEl6r0UP6YapcN/MfpWpD5SuSYlYNDoXc7YV1BKbsifvNdOUHocrWaGSCg?=
 =?us-ascii?Q?V0GpiepDocX/U3ow/WzPcthKY9MJNaAokAWkxLiZaYX63p5bEFqbG84/qn8q?=
 =?us-ascii?Q?L5QARiBM6GHmdsLhf1PpZlraxr9sHLvEkFOKtfnm96o1pnYyKNGVNGegLMc/?=
 =?us-ascii?Q?4qMgSabILJIXpfvWm3O/CHD79dxU9cJIbqSwhNzg20oE7geA3ZuiQBX3Tico?=
 =?us-ascii?Q?9CHaGh3VzvKdmczp+IzP94+PFQkMbCaW1K8km9Q1YuhgXiAXJNo0gLY8M/nY?=
 =?us-ascii?Q?vC4nRHsTKvZeEqhI2HpB2dk133KyKV6i/OaMtPJh7guI7j3QmHWDjr//RyQV?=
 =?us-ascii?Q?TlQo5yXA/JpreJwGjBF8hB7lX3/y889YzoNeup60eVtzPESOveCfqsfVtbls?=
 =?us-ascii?Q?rwBls2feRwPUmHH1Pt0iCIxqPHMrW5s2hn3EKNd/1d1GRzfQEXxPObRbgGdc?=
 =?us-ascii?Q?1MyztREVIabsXQSOAWoh+imDwAVESMxS0+e2dXeJ4bd8IW4X8cLkbEGGv4Wd?=
 =?us-ascii?Q?+3HrzgZCogi94cmjuEaxYxXDRtnO/LG03ohW1tdCh+bICvJUz6Z025wPr5z1?=
 =?us-ascii?Q?KFsWv1VlKQ6d89sBYKJ9DWp8y6yjR2S89mJOSkIT4QVgLXCxznOcFxretIpV?=
 =?us-ascii?Q?8oz/1la250IzSG7wTIykyBs1tYab4lGFpsD8B7rsiUpglimsT/8QH/r//mrD?=
 =?us-ascii?Q?bN64PqMwbnm80EDCP+/zZ2J4BGk8Q/dI/9qdmEozRhCtyHWKAzIIbkM6g4pG?=
 =?us-ascii?Q?UUev3Fg7P68w82842OEafvytw6r+W4KxIIQsn6pQK+VhuywPH9dI7vBV+zB7?=
 =?us-ascii?Q?QccKwVb36OYf7qqQLrAF/FLAqznWo6G/RBsvXbkAIky/knQpAp5KdDLbNO9t?=
 =?us-ascii?Q?la5r6JpmQw8kuR37LYP4EHd0VgA50AF+mGft5KiEeKcGRbMZ6af3yfLPMFPa?=
 =?us-ascii?Q?qXevkF8RyCbsrl5MkaK/eAhYyF6hAVlXe0qVjE3e6qksHRDoK7CTbBAd5Ts9?=
 =?us-ascii?Q?jEI30brHYxOS4rq0raRhgHQnNyxB58Bb5w6ORR0fZDifkcjRN99JISxdd24W?=
 =?us-ascii?Q?a4+feuRZky3QOfXklpXZRZdPnQjS8g56+AA1nL26fGHPMVKzB4rGJLnNNSTO?=
 =?us-ascii?Q?3QkRTi27yOVL0AtWi8wK+ObL8U4ofHgMCdIK4fWlaXDQOzfaRK4PYCGlqSOO?=
 =?us-ascii?Q?8Cp3u+edPLKZb7ldIg/Z+Mul?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d2f6df-4eba-45e3-6073-08d8e841885d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 06:05:43.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qoP9ig09y0zVuAZJAMVFI99amP5jAsxn1ZRIaFn0WORawN/tGKYNLac4KeE+HUr9F+ul69j4FdzkeTBEaVb6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: text/plain

With the latest go version bump in oe-core export GO111MODULE is
on by default. Our build is not setup to use go modules, so we
disable it and avoid configuration errors.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index b96499c4..f4955e2a 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -28,6 +28,10 @@ COMPATIBLE_HOST_mipsarch = "null"
 SYSTEMD_SERVICE_${PN} = "consul.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
+do_compile_prepend () {
+    export GO111MODULE=off
+}
+
 do_install_append() {
     install -d ${D}/${systemd_unitdir}/system
     cp ${WORKDIR}/consul.service ${D}/${systemd_unitdir}/system
-- 
2.30.2

