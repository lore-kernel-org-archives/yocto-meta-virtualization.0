Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F716D1119D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 07:37:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12733.1730792218414562392
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 23:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1039b2a242=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A55s3RF001908
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 4 Nov 2024 23:36:58 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc32h02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Nov 2024 23:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN7mamikJ1ySWArwpuUTRpLA1BLJzymv9SWd6/9qRgWTfawTlkwykCdmiMRr3ZAcogkZ0Ck3RxycDVjt5YYiyo5b4YD5nShJfS1oThegZFIIVP1AfvHy+u8QfH+418qIawzwCTdNQbnjr7lXelHveZrsgXJIrATePG2QWJM87j//2lM7AC3g+InrnkSrKt+H11w4ZqBW9jZG+QiLr1Amt1GE71NkTKUXhMRPrX5uQpWI2p9nyiXWAqiwTNn11VmsiLTRsER6jFpVQV1rlDo/4kgC14DorLMgAvKjC1SZ9RcCTjiNprtjiVnKTdtH5uX9IcAYJMeNK+Zk6j1Rx1HRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3vnWyCJ5dE/a7xeIZvbvBZB0IefJ4prpxOk4SogHSA=;
 b=J7R7iwHb6JYHkUcHNNGH+5G1FfahgdOQkckWkK4Z4irjDZA/EYAhcL55jlJLFSoYk5um8mER5OGOIqfnHt63DerAwYdh7VFieeXSOe2luXGNkPZM0hbgQS+4VFwc/rFJ9huIEIYhqFhRvw3iyjC0312qNivUYMLU9l5n5axGcNKl9WJepnNlav1iz/z9Da/bj6ImXhYrBzg9I2ZnJzzrzxiJ1Gz3p8sjve/wuHbXVq7UZidkrq5ZbxUO6Z1vzPo9c8sBLRAqhbCGopIbVQSLt1ikopft2TLmiKtqAb8MPAxEJrGnaJP6Zfb2VN4j5kLIhfYL8vK+23Ff36o1WhS7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:36:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 07:36:54 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] criu: fix buildpaths QA issue for arm
Date: Mon,  4 Nov 2024 23:36:44 -0800
Message-Id: <20241105073644.3692715-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d1cc1f-33af-4e52-327b-08dcfd6c9ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DdOma0urhnL0AIg30grLpRW9q2nhB+jPYfK+IP4DlKWe/npd7CYM+FGqdk37?=
 =?us-ascii?Q?35gRws4YmxGqlGdBob6O2Rav/ETWqYos2+j4WhsRsHi7qgJSdEiP0BV7wHqF?=
 =?us-ascii?Q?unzCvAQ4jpdVfXRU7s+IZCMmDxM39EDg6ukbW9MiwnM0X+NFGxwizjTDMSyI?=
 =?us-ascii?Q?7nGxfD14+BvlGauR7RdaQPvXJ+3cy2KM4m9fKIPT7Ch0kVaEK7DO85ATyjMh?=
 =?us-ascii?Q?KrSMAsAuHusXIYFoBS/sNfYdMgaasMr3wnsdnu1WLEVFjbh1MdpaYqpzpmtL?=
 =?us-ascii?Q?TLRbj1AxDh2fTYOea7Ohxml+6atj2RLwOlo5OGSUnsVouKbqtdfzwuEzcA4t?=
 =?us-ascii?Q?hN4tVqq572+AuBqopONNvJEPwDHbzRpAHPlGGkSWypmUyCHU2iHZhRxyKA9G?=
 =?us-ascii?Q?eTTbH9MrVDawWFep6vMchihn6jvSC1zTozT5WuFsupNREzQal+mefef9Jshl?=
 =?us-ascii?Q?I7XKMHdCPyA68X7A4eRzMLa3N6AA03C8iWYZ6nr1gMQOJZkY4/DEdLo0pHrs?=
 =?us-ascii?Q?JizkuOL8uun0/Y2YKNzjorUtnZAb8WmV3yg9wn4i+jYJpOOrW1eGgbJFM7Ph?=
 =?us-ascii?Q?x11cV9hL94krtF1X8hujhbgmJGXWz8EuHiWj6HYa/aJn5Komr96ETAWuWD50?=
 =?us-ascii?Q?bZiFKqmkd9ZxC0kYmhqr3w0U1hnGRy6DwO7FyinAaQ/+/xpc6vR3CXlYvFED?=
 =?us-ascii?Q?UbbQQQS6bl911fT4r1DXEfGsAFLKBiSOG6Uf4zxc9ylckr7Hw2y4a/nKGgKn?=
 =?us-ascii?Q?ERWu8OQl1bmc2nFjYFesrcnWpThTYlpV4fzHhqwLMOWS1t5ab0IynVUi+Uh4?=
 =?us-ascii?Q?lVtFwpi+NMSmeIo4iRcfD0rPO1v1c1jMTcUgnjIcJQtmPhRVaFUXP+RvBXpN?=
 =?us-ascii?Q?2jCneYfgQ8chNdoxl9uw7JY7dEEga7gRVNmCLe1WmucMEMdAqy5kfdzik+3r?=
 =?us-ascii?Q?VY6TeYviz8CcYterWAK6AbnbM4Xo0psNq9mIMgnjDjmoiWe1RvDJDnqD8n65?=
 =?us-ascii?Q?aLQN47OqkvMH34/MelAt6E3lrf9u84dydv4/IAz4CnaOIxJd7BlBSgSIfAPc?=
 =?us-ascii?Q?MiMVAy7Zq9k3kRjWZZSYG8ddYwR8JgElHrJen+evqEgdBeoEtMvxqlYUK4c5?=
 =?us-ascii?Q?nt5tR16j5wYmoCOldRRh/H2uYJo/lLxM1jo+DBGTjIXg9AgaZgaX0F3svXtt?=
 =?us-ascii?Q?kJCW/4FwSXn6K7DVUiHo/cTeqZUBAmDO+vXtOWzNuMhfvQpZTwV9CIQJo2t5?=
 =?us-ascii?Q?UpreXzILqEYm825bvbRHBZ12+vq/dDDEBTu/Czax1xFkAkEyxNfi2mjsDFL8?=
 =?us-ascii?Q?UmG+b2az3hXbILtGYgyK5ZmgfQMO4NegHdNTldg3kn2wOSHIjhOemgtSTYTf?=
 =?us-ascii?Q?rEZddKs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wXhwIl6ErrMN4wrWEIvnDMHApUWiLQ7XlyAp+srAk+8TnRtnzBwXXOjiu/yc?=
 =?us-ascii?Q?fZdcZ05Iq13gYdKs74ulz7Ao+wLps0hZk/2wRkwu0hklV3YnAJPFboH1Z4kx?=
 =?us-ascii?Q?o4Ll1sx8hmoWkP1IS5RBuS8X2+2O3obPV9VVq6pqv5vnj+BfiGDKjwpXha94?=
 =?us-ascii?Q?ZEJkpLlaf5eEXg0/LmJsVMv0jfb9NSWwDiW9ppO09PGdJNHl161GIdbmAto6?=
 =?us-ascii?Q?Zd4TuV5tA/osXj0P+4Bkdgf7cPezcFpzz8MDZmvBv1AcS51KNb/StxnUCNh+?=
 =?us-ascii?Q?SxPThcztz/ZyGMytUrVs0DXbA46khTq2LJ++DHaDLuQyh2ndyV+Jphp50Jo1?=
 =?us-ascii?Q?iJjE4sdn0a0EamSCHXGQS1fb6HMJ1eWQkmAHL32mazEEogu88b2xrFP173ia?=
 =?us-ascii?Q?8ladrLEnHdBVRazP17rscuqoLyGFEeCmTDywQpZ1SrFIpS3ihvfExsvnDKTN?=
 =?us-ascii?Q?NNzVnB1XtvQT8qRR/1GLmA4+CKRL48hS54LeeKOKTsbk5V2Hio5ky00B6+Xq?=
 =?us-ascii?Q?Oh8ODpkuy8EvdbaalFxsTtu3adOTc0L/73K4wq1lUS/mFHMiNruFY9ksQ3Io?=
 =?us-ascii?Q?gCgZJYoYpmdYmJ3AVC3Ew6vDVztfrkyc/XZXDyw2JeDyAugQ4AND+KJ9UiTX?=
 =?us-ascii?Q?81tMQSe/7mjXjftqZo88roQT1+pYMosisuWqq4Lo5kiKWcWjQPBgoKK253Zh?=
 =?us-ascii?Q?cPAt3Zu83Syb5dXh5ITgwIvpWkCf8+TKtfkZM1HqcP2bbJGtbjyYIaWhGWt+?=
 =?us-ascii?Q?eMh9ixiwT9apyJ2dUZ6ayx64aEQU9Le9kP432eHNmsA8tAd+5fow5aGWGa2D?=
 =?us-ascii?Q?lvqYc++jN2JDeLiv3TWAmzgG3oF8cAcoo4O19PjYAnuDDA8hfLooGljhCs9W?=
 =?us-ascii?Q?UPspJAvXXX6JFjBzZtb6peMhtAX4VGyjANOh0YUXjnD4fKTLarxk76igz+G8?=
 =?us-ascii?Q?cJNqAq0Dse3OX8cMCxmOXd6jTx6S2qFJQkJBszq00qggzW0a+2626T1Tq92n?=
 =?us-ascii?Q?iewkilx2CopS9kuWfUHN3vmdtlicPc/LS2DWb4BoDMo2juaZg06Vo2dmqyRD?=
 =?us-ascii?Q?9QvFV9VJoTr2ZHpSaF616CDcWgGO5SXSt6ZoXib6UfbojLtY45ZimrVqObB7?=
 =?us-ascii?Q?PVm32lwnMAY78hRrpOarEtv3Ve0S5D59mmpmvSBhVnRZbeb0TWk0pTA6k2Ft?=
 =?us-ascii?Q?opADolOV73f/0BE2QdboS2aFiRK18lKp2OCFI1GBiLs8lIsa5DDuiCA0X3+h?=
 =?us-ascii?Q?VZpkXnrD6q31hQdbaN/ymEIzh86Fy1zYQnXSo1BeIOEFJIhcigJ/YwgJFUSb?=
 =?us-ascii?Q?BcI81mjtUV/yZxeo0x00XEaxIxXgdfH65OwCYs8eAsBAssGa9b4f4FXgIAVt?=
 =?us-ascii?Q?5FlKuSPG8k0yQ8ddRbvBjLUqo34Bv7xiO9J67asFFRQCGX8s7oVKUSld51zg?=
 =?us-ascii?Q?wIJc6QjmL8muwXDyt1zq6U9LmMcUKyprg2+aHf95PUz1PP+606WlPo19+Xb5?=
 =?us-ascii?Q?X5srQDQeKC/njj6/8SSBd9QunLil3P3H/PvN8y7VLkC0PMhtDOoE0pQ7A4cR?=
 =?us-ascii?Q?H20h62SIAEckfXAsq9WYwQAXkbB51NRkRgQEYsSLiILT3V1iM2c0SsljFR1p?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d1cc1f-33af-4e52-327b-08dcfd6c9ef8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:36:54.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PDwR4+hVTHGEvqbzjxIvWQXBashvtWS3QPXXq1khZf9oWFlwoKLTOr3k4LjrevemQURIujlWFvdruliZz4Vww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-Authority-Analysis: v=2.4 cv=T7feTOKQ c=1 sm=1 tr=0 ts=6729cb19 cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=z1g7iogDX4sjfA9P0y8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WMuACNw7mvzWBhi6eZcGrvFpTAz3175t
X-Proofpoint-ORIG-GUID: WMuACNw7mvzWBhi6eZcGrvFpTAz3175t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_02,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0
 spamscore=0 mlxlogscore=564 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050055
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Nov 2024 07:37:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8957

From: Chen Qi <Qi.Chen@windriver.com>

The settings of CFLAGS:arm overrides the previous CFLAGS settings,
causing buildpaths QA error for arm. Use CFLAGS:append:arm instead
to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 09503624..8ecc1725 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -46,7 +46,7 @@ EXTRA_OEMAKE:append = " LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unit
 CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
 
 CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
-CFLAGS:arm += "-D__WORDSIZE"
+CFLAGS:append:arm = " -D__WORDSIZE"
 
 # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
-- 
2.25.1


