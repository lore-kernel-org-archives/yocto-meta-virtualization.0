Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2686.1609984344562946651
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jan 2021 17:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ADIqIJ3o;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: daniel.dragomir@windriver.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 22E2038C0895
	for <meta-virtualization@yoctoproject.org>; Thu,  7 Jan 2021 01:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9kzWMjr5BPyblwONgkO0tzS0xbrWmeiRGylXxKV/seje/nctL5+UFpiP5Ga/mgJgcauduTfny4mLU92kCsYeW+TRgvOZ7Psrs7ZZPZM8PLQfMn1fBY7K7nHvCNn52xnjtWEmQWJ65K4t7OTsM+a2klOURfcIfl2D9nwKTn0u44/QuePrKrXMmv1fzKjh48MXc0doAoiJJm8c8XzvsovPz+zjPZlNGmDSgN/03tFIprMRqp8+rbsPmdBsbTIyI9/86bP6kf6FqyaH1hcW9jcNC7drN5YbsHGuomvEYctrV07rzFghRxn6swtwFSLS9nIqb8PYwQgLajbbVMcu3KBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx/u+3nofihlQj4DKnr9h3rLn9sV9fpWf4GjlPQlV3E=;
 b=Al0dYvpOS3fpuIP7ZtBbKAy8I9SEgpssRMt7T5GLv9SAIiKtkyMoE+PM70yL+Mv0eC4/bft8d/09vyWhIsz1Y6xe5xog6mNpYxJtRGIwoWuf6aFAFIvc8NwFtZc0LDw+YSAqx1x+FAWF51UlVzZE383uaTSo6YDFUhhZ+cl9FmMfwQDiruP3GBhgjDVlAsy5Q4hnCTQQ2gINlXTIndn0pE1eQdN2E6tpTIv5odz1B2GghhhAxGSog/qP5b9dOlPpUiFXgwAfyYx7kYK/nu7zFpLapbJblXGAd9YpcBa4zmT6j/oZjovh9mh4WIDAyxNZfTzmw6ZWQMyDaIYJU5MuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx/u+3nofihlQj4DKnr9h3rLn9sV9fpWf4GjlPQlV3E=;
 b=ADIqIJ3o7Dbv/PcjzKsK//nr4pUqWpFc/hqpNV22k9RIlEgJEqMiB9fhkEivjloVwOvwLOo3dlLvyawdLVU9PzeuzyESc1iSWwzTYO7Sk8On2s0odZFdgy9KCfJhkZXpyuveyiNAC4Iu3f3AkoZ2C3K5WVmbpuTmymIJSVzwgWQ=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
 by CY4PR11MB1813.namprd11.prod.outlook.com (2603:10b6:903:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Thu, 7 Jan
 2021 01:52:23 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b]) by CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b%12]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 01:52:23 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] [dunfell] [PATCH] lxc: Fix postinstall script for read-only rootfs
Date: Thu,  7 Jan 2021 03:53:36 +0000
Message-Id: <20210107035337.33793-2-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
References: <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VE1PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:803:104::33) To CY4PR11MB1814.namprd11.prod.outlook.com
 (2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-ps-s1.wrs.com (46.97.150.20) by VE1PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:803:104::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 01:52:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1fd130d-6761-4ca7-e585-08d8b2aee09c
X-MS-TrafficTypeDiagnostic: CY4PR11MB1813:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB18131A53C09150DD566F1A66F7AF0@CY4PR11MB1813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HMpnB2bxusLmuEicPFJ1nGtyUTBIljRm8ljNM0MePLCcFkIiZanTdJBlHZeac2ivhLOXcYSP6IGO9ueSSlK/T/6fCy/lfJ8x1Z6JsZC9qwStn1ggpq0NE3zS3KqiEpBrAkHW+0TjBU/TOn6HkWMbWmtRrOp+sNqe5ri1rcA4AcOyxE6B97kcYBr3j2NplPDYQ/9S8D3gdXb9a+KjAdQLMR+heew0JkzC/ZYmKBN08tdlvo/tfgdIVGegyfboEw/Q95pxMoMDqgVkaVwOMuwz7HP6MJIFjQWEZcwXzLF+xi19QO4OMvKvM/g/19vQCfi86o3qzfV0R5ivptI6ytpkecP1ohrr/JlXpvEYzt3CuDnRvVCU45Yj/+A5VpiqHWgVZFeW7PxtmQnz3saNS9uM1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1814.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(956004)(6506007)(2616005)(26005)(478600001)(8676002)(5660300002)(83380400001)(1076003)(2906002)(8936002)(6512007)(86362001)(52116002)(6916009)(66476007)(6666004)(66556008)(66946007)(16526019)(6486002)(316002)(186003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?jV7j9QxQ9XG+RBzAAy/Tlig+JvlwWXiZRv4MjeFbkESpJVqRs/q3EY6rbNNM?=
 =?us-ascii?Q?X0jqHVZwCSp8CTLn0iTqIugSpcAj8rTfXr+aSqco/kyYUSCSBtwkzxZzR5Vv?=
 =?us-ascii?Q?8B/dVbNpgPxa/QnkhTcwlHIxklz7x6+6+Plhyu2lFYwe/u0LUZkqNpQLFbcO?=
 =?us-ascii?Q?am0hIuo5B+ttXiftfem4o0J3Hvb0Ubq5RkW+CYDMj2ARVPxpLECZfrTw4dQ2?=
 =?us-ascii?Q?2oIJ3HmnktWF2hRjOtFgAkzUoMex5n+LDUnz69XtiRWxM5GKqSZvI0e88Yk9?=
 =?us-ascii?Q?tOTDJi3ikofdb+hFqcneMBvHMlJ5iANpl9hIfGtmYD69OoQw86LewcLyPoF/?=
 =?us-ascii?Q?3WWBufNIfE+l9UR5odt4BJ7PMmEu1HDpzJKLe7FfjYgP24gmpCLfPar6lT71?=
 =?us-ascii?Q?JkskmBI7s+qxJgaF73++mcJ8MSzqoPa75fM2JYInsQCR2OD6HOLmRwO9PrKq?=
 =?us-ascii?Q?7p3FJOSC5ruM+c3Hexfk+czHMDpBZiresiV4d0o5F3SsPIvEk7QoMpWZot5F?=
 =?us-ascii?Q?4miBjoSjPnNmrGWNWHE6EHUU+gKGpaMbM0oG4q7tVmaR/Rh/qWEe7IYve+h9?=
 =?us-ascii?Q?aErNDj0fv2K+BKnVxy+k9QcF7jHHFJWG9qB7qKTCWanqKwPajuwH8KA7T01r?=
 =?us-ascii?Q?khrm8iA2kZgc10yY/4Y9UF2IwO+rmZ8sPcI6vuJDVu76sD4AcdioJsLQ2tay?=
 =?us-ascii?Q?qM/P2JJulpUDCpDD4DtluyldnEU9WLJiv4Tz5lix/D5JLqFZzFlW/x3O9kZy?=
 =?us-ascii?Q?4k1CqLxogH+BnNDuF9Jm0TgAR8YsJNsJdbHqjiC7QAX0aufrMCH3gwAe+EPk?=
 =?us-ascii?Q?h7PuanRnAYFOHii41A36gbQEoQgw0RuUkcJ6rg6U8E0UkD5iFDOdI6qF93Bo?=
 =?us-ascii?Q?5ey+X/suEsaenFrPV54iT3FF8FEq+JPvIhw26kCxfUM1T2OJ+AlbHwQGlOQN?=
 =?us-ascii?Q?/6317vW5yxWRBHgwJn+2KRze01s+kJpXuhw+UstVpuerqWcGGmwsQBMfk+bh?=
 =?us-ascii?Q?LlKc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 01:52:23.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fd130d-6761-4ca7-e585-08d8b2aee09c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sRGwbx9Ucx9UPQOqAbc/9F+avftZMCQvCVhZjhaAKYDbSzGO56TT2v6A5BP3fENjWASLbHxC5d1fu3VZDREFnDSSBvEiJuwQVNeMJBbhPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1813
Content-Type: text/plain

Ensure postinstall script for lxc-networking package can run at
build time for a read-only rootfs (with sysvinit).

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/lxc/lxc_4.0.1.bb b/recipes-containers/lxc/lxc_4.0.1.bb
index bfe003c..807232e 100644
--- a/recipes-containers/lxc/lxc_4.0.1.bb
+++ b/recipes-containers/lxc/lxc_4.0.1.bb
@@ -171,9 +171,9 @@ pkg_postinst_${PN}() {
 	fi
 }
 
-pkg_postinst_ontarget_${PN}-networking() {
+pkg_postinst_${PN}-networking() {
 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-cat >> /etc/network/interfaces << EOF
+cat >> $D/etc/network/interfaces << EOF
 
 auto lxcbr0
 iface lxcbr0 inet dhcp
@@ -182,7 +182,7 @@ iface lxcbr0 inet dhcp
 	bridge_maxwait 0
 EOF
 
-cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
+cat<<EOF>$D/etc/network/if-pre-up.d/lxcbr0
 #! /bin/sh
 
 if test "x\$IFACE" = xlxcbr0 ; then
@@ -195,6 +195,6 @@ if test "x\$IFACE" = xlxcbr0 ; then
         fi
 fi
 EOF
-chmod 755 /etc/network/if-pre-up.d/lxcbr0
+chmod 755 $D/etc/network/if-pre-up.d/lxcbr0
 fi
 }
-- 
2.17.1

