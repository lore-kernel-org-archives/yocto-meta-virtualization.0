Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6A2C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 19:54:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.35])
 by mx.groups.io with SMTP id smtpd.web11.4022.1744660490178969869
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 12:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MnDGdGg4;
 spf=pass (domain: axis.com, ip: 52.101.72.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffbFMw6FL+GlT4E5gNuk39rsGI5huWWgyF8iPpsL+rfvWBxGc3SvDs4rCHZFmZAvMEd0eJW9dd5KrFBAc36Z2AZoD69X8CeYDqN0OYZ2Z9RZlplSZcqqd077r8rqN9sqp7CL/ofQqPVixVMGVGeKLTEDpqoBn8SAsaP8kyNCXavpHC1LbixrDhYL/tvcp86XjggKxle2zO8GF9Geuk9CEseh93J0BPDzkckWAzoYWN2Qb8r/Ihgp1GGp1G9rEa82eNTlBgOmUi2VBRQ0DbBBOnn1hkb6e56EZQzTrXkMQf1yF1elBHwit6LlcHRU/i/nxplRANMUA9zNmiPJaHs4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwlI1Z/PFvbx3Hm/kFl4l9hVIPl5QR4//JcB/6D/94Y=;
 b=OyWYYFi+LcTr6YG5JQ3VQJD4H/boy/kNSsYPlqAJU86uwdX0l5UIzqKwC4KLQxzVGdObT+4ng9aJvL8vlBx5RfWwTMO3L1u3jBfs7HS8Ughb3SKwLesAxMaMGnERRXcXyx7vgC4tXyuA7dn/EuFLjqfQsxgjScKswTJS4xpPgGhOQvB45loqss/vGst5Q+IU4WiFcA3/PNReOKVZUjV1ZMwhGAhcyssgvIdeYypf92JjqF0ZFFCEMQPwl0rDsHWSwOaqrif+Nt47NJsNtY5qyo56M0EL7DGo37dl7000J0HM80IlMzJcgGsHe7cTONli+lodDHFxKdBCj2bO6Mq3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwlI1Z/PFvbx3Hm/kFl4l9hVIPl5QR4//JcB/6D/94Y=;
 b=MnDGdGg4kxFuChbPLrEdWi9lbla9KAeMNg4L3w2K3RVEpOTYL2RaQNuNIk0SKzf8KIEops22IPKoAJQcHKwgwqTe4xXBOnx4tfLV1b+WQ2jR9CSA7J7/AwURyYn96OW/GXMmaEqAFqgBnoZ65hR6WRqerEKnCrOGRDsMoq7O4s4=
Received: from AS9PR06CA0586.eurprd06.prod.outlook.com (2603:10a6:20b:486::26)
 by DB9PR02MB10019.eurprd02.prod.outlook.com (2603:10a6:10:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:54:43 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:486:cafe::1a) by AS9PR06CA0586.outlook.office365.com
 (2603:10a6:20b:486::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 19:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 19:54:42 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 14 Apr
 2025 21:54:41 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 14 Apr 2025 21:54:41 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9EBBC274
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 21:54:41 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53EJsf8L487595
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 21:54:41 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53EJseqC487594
	for meta-virtualization@lists.yoctoproject.org; Mon, 14 Apr 2025 21:54:40 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] yq: Update to 4.45.1
Date: Mon, 14 Apr 2025 21:54:31 +0200
Message-ID: <20250414195431.487573-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DB9PR02MB10019:EE_
X-MS-Office365-Filtering-Correlation-Id: cc043f86-163c-4a1b-d454-08dd7b8e3294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|30052699003|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2/3qmnvAoD9cHEbZkDqNXYELB2t6W4BPUeV8P50vymeZmcKvmBlx034w79sj?=
 =?us-ascii?Q?Ly6i93SalXonp1rxxxk/C3xc3rCMbEIEnpm16FVJfrGD56WLKjStX23KfBRB?=
 =?us-ascii?Q?GUJb0HOznYILLKcZfNi/FrwUOAzMbJfjelbhFX0rQsktuCdUXbroZWix0eiY?=
 =?us-ascii?Q?4ULrJmHwTOet+VLg801ErJtdgZc9LIvrGwqlycMYwvYdBp/Z7v48TUbYyHsV?=
 =?us-ascii?Q?zZ9RUSv8DjeqgR9PX2Q+sxeqxu44AbC2RIZfqjByKjd5QoK/z3e1w16kqIVP?=
 =?us-ascii?Q?3yqtk/IBsj18keT5zY1DRmdkXW+XleXfCcj1tfG9ACZ4hCY4DSlF89C1b6a1?=
 =?us-ascii?Q?qDwl5WG2MJmrq0A+IGwdmiBa8Dt947v1IxCiwx63kpJX9tESkAgkjtHiCw3g?=
 =?us-ascii?Q?k5fJEib7wtdv433+zo+xl8bhBjrqtpTtSZzon5OFViu4SEPPUHYC1A25MiAH?=
 =?us-ascii?Q?qW8exoDjF/JvF18EqfgFuNcfMG+TQkied0QNBge7F0OzQ8zkUWKmeBPIz5mM?=
 =?us-ascii?Q?xy0DT+Fp6N8RxZvf40kFcJiWYNCjJTR9kVORIyRJfIS25eJHspqfvZ6HH2oq?=
 =?us-ascii?Q?ra5Cy3PVRPChR9IphYe3gXNbChJd9zfQjrwQQEBQc+eyQ3B8OstERiz5OiC3?=
 =?us-ascii?Q?eYmbHpEinLfN+ne6VoEw53owDxAku0rLyi1GB4p/W4aupf1mYZfEyZ6eImTs?=
 =?us-ascii?Q?e1BvCYsmUG8VNaKD8Se8aYehyx7inu3mtsEvoagX52kZ21VwWgKWk1qQtxGL?=
 =?us-ascii?Q?z28kuccaB/gE3AiaBUR1mv6bks19VuDL9n4I7cwmT4wQFbAHNj2hKWW8aJ+/?=
 =?us-ascii?Q?YWi3buuKotqpqw4bMqvLUkSiS7BD5thUM+ju8ZW8+nQYqiHLHK4XlXZbAxZs?=
 =?us-ascii?Q?P3MWWFHVFmy/E+DARRH/gk2jQVxK+lsLxgx0vfUaGNJjNh9KbSs6ckfoXqiM?=
 =?us-ascii?Q?EfG7qkLTD7gNUbjJsV2asLbJeofCf67gFeuQ1DCxnDp8cWrrd/799zAZTs+q?=
 =?us-ascii?Q?F3i1Y257+1sUL3jYjDTsIX35sq532pt5LSrdQmoCiR+qTysfmyt+E0FVqPAx?=
 =?us-ascii?Q?NfPJpKDDQobLnRT6GrOgTncMYEkkWe1fUUpIMQM2Iguifwm0dcaGaHU9afYV?=
 =?us-ascii?Q?HqxXW5lCb1nzNZepcTuD6apIjs+3zACZLceWjxEjiQuLpcAnu/dYA3b6hW0w?=
 =?us-ascii?Q?p8JCnllkB2J9NLmXpqeU1hMXEZJbvxaY/2vYzH1CXEoBkrZsEv0GqB3vwwfj?=
 =?us-ascii?Q?8oam94ptq3VNbfAnWM1JumURTuyfkIbKFDa1nywO+C9aWssTFumKD/wllBvB?=
 =?us-ascii?Q?SdwTUj9eibA4Om6TP5qtm6DNSvF/2Y/NOgQeVZd9/yZgj/iDlxcvJWCHCYyh?=
 =?us-ascii?Q?Q4/WE9KJ7w0+SKeabJqRVLoFo3pb8mDYx8pZwJEuu7trAtgw4TDrT89+jZmY?=
 =?us-ascii?Q?wUkZa4CeOhPoIQe70vikuS2r3qXWke3l6N46xHzTLYk0QJdRv/YXig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:54:42.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc043f86-163c-4a1b-d454-08dd7b8e3294
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB10019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 19:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9223

Refactor the recipe to use the gomod fetcher.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Bruce, I know you prefer to do things your own way, so feel free to
ignore this. However, the current version of yq does not build with go
1.24 that comes with Walnascar so the yq recipe needs to be updated one
way or the other. Since I have no idea how you update the dependencies
in the current version of the recipe, it was easiest for me to generate
a new recipe using one of our tools.

 recipes-devtools/yq/yq-go-mods.inc  | 37 ++++++++++++
 recipes-devtools/yq/yq-licenses.inc | 24 ++++++++
 recipes-devtools/yq/yq_4.45.1.bb    | 40 +++++++++++++
 recipes-devtools/yq/yq_git.bb       | 87 -----------------------------
 4 files changed, 101 insertions(+), 87 deletions(-)
 create mode 100644 recipes-devtools/yq/yq-go-mods.inc
 create mode 100644 recipes-devtools/yq/yq-licenses.inc
 create mode 100644 recipes-devtools/yq/yq_4.45.1.bb
 delete mode 100644 recipes-devtools/yq/yq_git.bb

diff --git a/recipes-devtools/yq/yq-go-mods.inc b/recipes-devtools/yq/yq-go=
-mods.inc
new file mode 100644
index 00000000..0ba399f3
--- /dev/null
+++ b/recipes-devtools/yq/yq-go-mods.inc
@@ -0,0 +1,37 @@
+SRC_URI +=3D "\
+    gomod://github.com/a8m/envsubst;version=3Dv1.4.2;sha256sum=3D231eedf3a=
12c110a43c95f1658b26fba66f24ab289cbd249605b48c5544897ad \
+    gomod://github.com/alecthomas/participle/v2;version=3Dv2.1.1;sha256sum=
=3Dbea6113340aa301c0cc73d0a12cbd3453853ecad9bcec0eefae78eff15d67441 \
+    gomod://github.com/alecthomas/repr;version=3Dv0.4.0;sha256sum=3De4d4ec=
046c3ad7425c8e78352dc114ab34b1dd7f3a42c640e19cb51c94484c36 \
+    gomod://github.com/cpuguy83/go-md2man/v2;version=3Dv2.0.4;mod=3D1;sha2=
56sum=3D14c3afa2ef623555c1b4834d1f88b14df77549afee85e5750c19102465b78aba \
+    gomod://github.com/davecgh/go-spew;version=3Dv1.1.0;mod=3D1;sha256sum=
=3Dbcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc \
+    gomod://github.com/dimchansky/utfbom;version=3Dv1.1.1;sha256sum=3D0c1a=
11101602d5f57ac3e790c0b72e09ff87d8d535535f43fbee9e6a42327350 \
+    gomod://github.com/elliotchance/orderedmap;version=3Dv1.7.1;sha256sum=
=3D86680515eff3f3d3944149ef3e054dfdd8e6b9bad8fe00ee0a862893754c6a39 \
+    gomod://github.com/fatih/color;version=3Dv1.18.0;sha256sum=3D4dc6907b7=
f6807b37c21ad527d966437d398f03472115f471eaa8fe5875363d3 \
+    gomod://github.com/goccy/go-json;version=3Dv0.10.4;sha256sum=3Dd89fa52=
15f5c2e0077b67dbc6e043db1b6427e93bdf5faacb7c536afca95e454 \
+    gomod://github.com/goccy/go-yaml;version=3Dv1.13.3;sha256sum=3D0d2c0c5=
16c9aa022bc448ed4b8056340c4ccfb3ba70e3f873c319d4b66e75f59 \
+    gomod://github.com/inconshreveable/mousetrap;version=3Dv1.1.0;mod=3D1;=
sha256sum=3D1c1b15911aa8a0bd5cd0f6670ec23d1086496f3615fdf53306aff2b476ce9be=
1 \
+    gomod://github.com/jinzhu/copier;version=3Dv0.4.0;sha256sum=3D45a9bad0=
9e85195732f408f9d505dc2b7f8868f9ddc3a1a7188999e5ca2d0775 \
+    gomod://github.com/magiconair/properties;version=3Dv1.8.9;sha256sum=3D=
8361b76b967090e33192173d91fb3de5f5ea43f6b8d23e927bf6d698fc8a0250 \
+    gomod://github.com/mattn/go-colorable;version=3Dv0.1.13;sha256sum=3D08=
be322dcc584a9fcfde5caf0cf878b4e11cd98f252e32bc704e92c5a4ba9d15 \
+    gomod://github.com/mattn/go-isatty;version=3Dv0.0.16;mod=3D1;sha256sum=
=3D714766ec82d67db895ade8af6b8054ad430c3cea5e15b3a888f23ed2f3e1b863 \
+    gomod://github.com/mattn/go-isatty;version=3Dv0.0.20;sha256sum=3Df2d5f=
89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc \
+    gomod://github.com/pelletier/go-toml/v2;version=3Dv2.2.3;sha256sum=3Da=
51f4dc7b62bd7c26b387d912dfae87ca1449082f26574c9f614ae640318b092 \
+    gomod://github.com/pkg/diff;version=3Dv0.0.0-20210226163009-20ebb0f2a0=
9e;sha256sum=3Df35b23fdd2b9522ddd46cc5c0161b4f0765c514475d5d4ca2a86aca31388=
c8bd \
+    gomod://github.com/pmezard/go-difflib;version=3Dv1.0.0;mod=3D1;sha256s=
um=3D74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2 \
+    gomod://github.com/russross/blackfriday/v2;version=3Dv2.1.0;mod=3D1;sh=
a256sum=3Dc39547cce6e866e8cfa395d2937bce30801cd07f0b901c2133248f1fba12f58d =
\
+    gomod://github.com/spf13/cobra;version=3Dv1.8.1;sha256sum=3Dbf27a276f8=
7257c93bc057309df30265a19beefc3d5fc887cbd8fc99ad35466a \
+    gomod://github.com/spf13/pflag;version=3Dv1.0.5;sha256sum=3Dfc6e704f2f=
6a84ddcdce6de0404e5340fa20c8676181bf5d381b17888107ba84 \
+    gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
+    gomod://github.com/stretchr/testify;version=3Dv1.7.0;mod=3D1;sha256sum=
=3Dfff8168d98e6a07156c454a1b6e925509f3177e96c155516d7f96b4079cca3bf \
+    gomod://github.com/yuin/gopher-lua;version=3Dv1.1.1;sha256sum=3Dac45a1=
524a39049167f1bb2334b67f728559cb1e60c535c54b3a09f1fc772b45 \
+    gomod://golang.org/toolchain;version=3Dv0.0.1-go1.22.5.linux-amd64;sha=
256sum=3D0eb73889fac3ef46a759ca3f8079a7ff656158ee6aedfe127221101824001a77 \
+    gomod://golang.org/x/net;version=3Dv0.33.0;sha256sum=3Da85014e77369f99=
c3f9eebe1289b4d0757d58248ca12337642923818ae22ca19 \
+    gomod://golang.org/x/sys;version=3Dv0.0.0-20220811171246-fbc7d0a398ab;=
mod=3D1;sha256sum=3Df033333096fe198f3151deed93f2deba74e50bbfe7739134045bc3b=
7ce4a5024 \
+    gomod://golang.org/x/sys;version=3Dv0.28.0;sha256sum=3D0ed47a83fe7d7a7=
e743e815172bc10c1ac0ed0d31ebb095e75717428e09aa895 \
+    gomod://golang.org/x/sys;version=3Dv0.6.0;mod=3D1;sha256sum=3Df0333330=
96fe198f3151deed93f2deba74e50bbfe7739134045bc3b7ce4a5024 \
+    gomod://golang.org/x/text;version=3Dv0.21.0;sha256sum=3Dbe3db791651af6=
f2cb0225aa5d5578c23149b2017246ba8e59586080baadd612 \
+    gomod://gopkg.in/check.v1;version=3Dv0.0.0-20161208181325-20d25e280405=
;mod=3D1;sha256sum=3D5c306e0d633cd66a11b40e2e5fbbc6da42110db7d72ea3c1524ceb=
45ee40c33f \
+    gomod://gopkg.in/op/go-logging.v1;version=3Dv1.0.0-20160211212156-b2cb=
9fa56473;sha256sum=3D028f2b859f2d7800d07a6fb36ef1562a95219941f3b1421cdad5e9=
5c44986ab3 \
+    gomod://gopkg.in/yaml.v3;version=3Dv3.0.0-20200313102051-9f266ea9e77c;=
mod=3D1;sha256sum=3D21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3b=
a90dab939 \
+    gomod://gopkg.in/yaml.v3;version=3Dv3.0.1;sha256sum=3Daab8fbc4e6300ea0=
8e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015 \
+"
diff --git a/recipes-devtools/yq/yq-licenses.inc b/recipes-devtools/yq/yq-l=
icenses.inc
new file mode 100644
index 00000000..80ddb5e7
--- /dev/null
+++ b/recipes-devtools/yq/yq-licenses.inc
@@ -0,0 +1,24 @@
+GO_MOD_LICENSES =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & MIT"
+
+LIC_FILES_CHKSUM +=3D "\
+    file://pkg/mod/github.com/a8m/envsubst@v1.4.2/LICENSE;md5=3D20cbf74752=
fb062bc260b078d71d7e30 \
+    file://pkg/mod/github.com/alecthomas/participle/v2@v2.1.1/COPYING;md5=
=3Dc9b197062ffa2eb27eed3d8ef59c1a56 \
+    file://pkg/mod/github.com/dimchansky/utfbom@v1.1.1/LICENSE;md5=3Dd5b81=
a403268b5ea485b4a2579630c17 \
+    file://pkg/mod/github.com/elliotchance/orderedmap@v1.7.1/LICENSE;md5=
=3D47a0bd50edb1474747d074fc0ba1ead5 \
+    file://pkg/mod/github.com/fatih/color@v1.18.0/LICENSE.md;md5=3D316e6d5=
90bdcde7993fb175662c0dd5a \
+    file://pkg/mod/github.com/goccy/go-json@v0.10.4/LICENSE;md5=3D33a07164=
132d795872805bfc53f6097d \
+    file://pkg/mod/github.com/goccy/go-yaml@v1.13.3/LICENSE;md5=3D346470d8=
ac0a6ffe1eb8635a452cec2b \
+    file://pkg/mod/github.com/magiconair/properties@v1.8.9/LICENSE.md;md5=
=3D714beb7325ffa89d5a68d936a3bb04e5 \
+    file://pkg/mod/github.com/mattn/go-colorable@v0.1.13/LICENSE;md5=3D24c=
e168f90aec2456a73de1839037245 \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.20/LICENSE;md5=3Df509be=
add5a11227c27b5d2ad6c9f2c6 \
+    file://pkg/mod/github.com/pelletier/go-toml/v2@v2.2.3/LICENSE;md5=3D39=
0892c6562af0d807e527b06d635f94 \
+    file://pkg/mod/github.com/pkg/diff@v0.0.0-20210226163009-20ebb0f2a09e/=
LICENSE;md5=3Dd0250703509998b3201f5dd7f26e8c35 \
+    file://pkg/mod/github.com/spf13/cobra@v1.8.1/LICENSE.txt;md5=3D920d761=
14a32b0fb75b3f2718c5a91be \
+    file://pkg/mod/github.com/spf13/pflag@v1.0.5/LICENSE;md5=3D1e8b7dc8b90=
6737639131047a590f21d \
+    file://pkg/mod/github.com/yuin/gopher-lua@v1.1.1/LICENSE;md5=3D5ea59bf=
62229a35ae7b2c7208524163e \
+    file://pkg/mod/golang.org/x/net@v0.33.0/LICENSE;md5=3D7998cb338f82d15c=
0eff93b7004d272a \
+    file://pkg/mod/golang.org/x/sys@v0.28.0/LICENSE;md5=3D7998cb338f82d15c=
0eff93b7004d272a \
+    file://pkg/mod/golang.org/x/text@v0.21.0/LICENSE;md5=3D7998cb338f82d15=
c0eff93b7004d272a \
+    file://pkg/mod/gopkg.in/op/go-logging.v1@v1.0.0-20160211212156-b2cb9fa=
56473/LICENSE;md5=3Dd01d49c2816e0112c83b3a9f77029b8a \
+    file://pkg/mod/gopkg.in/yaml.v3@v3.0.1/LICENSE;md5=3D3c91c17266710e16a=
fdbb2b6d15c761c \
+"
diff --git a/recipes-devtools/yq/yq_4.45.1.bb b/recipes-devtools/yq/yq_4.45=
.1.bb
new file mode 100644
index 00000000..b942ca0b
--- /dev/null
+++ b/recipes-devtools/yq/yq_4.45.1.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "A lightweight and portable command-line YAML processor"
+HOMEPAGE =3D "https://github.com/mikefarah/yq"
+
+LICENSE =3D "MIT & ${GO_MOD_LICENSES}"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd62f826=
9b9bff37fe9aa7dcc2"
+require ${BPN}-licenses.inc
+
+SRCREV =3D "8bf425b4d1344db7cd469a8d10a390876e0c77fd"
+SRCREV_FORMAT =3D "default"
+
+SRC_URI =3D "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;dests=
uffix=3D${GO_SRCURI_DESTSUFFIX}"
+SRC_URI +=3D "file://run-ptest"
+require ${BPN}-go-mods.inc
+
+S =3D "${WORKDIR}/git"
+
+GO_IMPORT =3D "github.com/mikefarah/yq"
+
+inherit go-mod ptest
+
+do_install:append() {
+    # these bring in dependencies for the -dev package on bash, and we don=
't
+    # need them .. so we remove them to avoid needing that rdepends
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
+    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/${GO_IMPORT}/scripts/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/${GO_IMPORT}/acceptance_tests/* ${D}${PTEST_PATH}/tests
+    cp -r ${S}/src/${GO_IMPORT}/examples ${D}${PTEST_PATH}/tests
+}
+
+RDEPENDS:${PN}-ptest +=3D " \
+    bash \
+"
+
+BBCLASSEXTEND =3D "native"
diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
deleted file mode 100644
index 3d0714c7..00000000
--- a/recipes-devtools/yq/yq_git.bb
+++ /dev/null
@@ -1,87 +0,0 @@
-SUMMARY =3D "a lightweight and portable command-line YAML processor "
-HOMEPAGE =3D "https://github.com/mikefarah/yq"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3De40a0dcd62f826=
9b9bff37fe9aa7dcc2"
-
-SRCREV_yq =3D "dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1"
-SRCREV_color =3D "daf2830f2741ebb735b21709a520c5f37d642d85"
-SRCREV_lexer =3D "6cdefc42e112ac71cbe316e1eed264ea62f58e25"
-SRCREV_cobra =3D "b43be995ebb4bee335a787bd44498b91aef7619c"
-SRCREV_pflag =3D "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
-SRCREV_logging =3D "b2cb9fa56473e98db8caba80237377e83fe44db5"
-SRCREV_yaml =3D "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRCREV_xerrors =3D "65e65417b02f28de84b55f16b46a1e789149973a"
-SRCREV_envsubst =3D "16035fe3571ad42c7796bf554f978bb2df64231b"
-SRCREV_participle =3D "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
-SRCREV_utfbom =3D "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
-SRCREV_orderedmap =3D "1e43e194ff533a346bab5f9b66b738256f199c8a"
-SRCREV_go-json =3D "5efc7d07eeeba186df630d9ab4ac78c761938c27"
-SRCREV_copier =3D "d132b069fe1a77d09e4c260852b389a730bbe9ba"
-SRCREV_properties =3D "c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264"
-SRCREV_net =3D "f3363e06e74cdc304618bf31d898b78590103527"
-SRCREV_text =3D "434eadcdbc3b0256971992e8c70027278364c72c"
-SRCREV_diff =3D "20ebb0f2a09e612109b224b32f79370409108bcc"
-
-SRCREV_FORMAT =3D "yq_color"
-SRC_URI =3D "git://${GO_IMPORT};name=3Dyq;branch=3Dmaster;protocol=3Dhttps=
;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
-           git://github.com/fatih/color;name=3Dcolor;destsuffix=3Dbuild/ve=
ndor/src/github.com/fatih/color;branch=3Dmain;protocol=3Dhttps \
-           git://github.com/goccy/go-yaml;name=3Dlexer;destsuffix=3Dbuild/=
vendor/src/github.com/goccy/go-yaml/;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/spf13/cobra;name=3Dcobra;nobranch=3D1;destsuff=
ix=3Dbuild/vendor/src/github.com/spf13/cobra;branch=3Dmain;protocol=3Dhttps=
 \
-           git://github.com/spf13/pflag;name=3Dpflag;destsuffix=3Dbuild/ve=
ndor/src/github.com/spf13/pflag;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/op/go-logging.git;name=3Dlogging;destsuffix=3D=
build/vendor/src/gopkg.in/op/go-logging.v1;branch=3Dmaster;protocol=3Dhttps=
 \
-           git://github.com/go-yaml/yaml.git;name=3Dyaml;branch=3Dv3;dests=
uffix=3Dbuild/vendor/src/gopkg.in/yaml.v3;protocol=3Dhttps \
-           git://github.com/golang/xerrors;name=3Dxerrors;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3Dbuild/vendor/src/golang.org/x/xerrors \
-           git://github.com/a8m/envsubst;name=3Denvsubst;destsuffix=3Dbuil=
d/vendor/src/github.com/a8m/envsubst;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/alecthomas/participle;name=3Dparticiple;destsu=
ffix=3Dbuild/vendor/src/github.com/alecthomas/participle;branch=3Dmaster;pr=
otocol=3Dhttps \
-           git://github.com/dimchansky/utfbom;name=3Dutfbom;destsuffix=3Db=
uild/vendor/src/github.com/dimchansky/utfbom;branch=3Dmaster;protocol=3Dhtt=
ps \
-           git://github.com/elliotchance/orderedmap;name=3Dorderedmap;dest=
suffix=3Dbuild/vendor/src/github.com/elliotchance/orderedmap;branch=3Dmaste=
r;protocol=3Dhttps \
-           git://github.com/goccy/go-json;name=3Dgo-json;destsuffix=3Dbuil=
d/vendor/src/github.com/goccy/go-json;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/jinzhu/copier;name=3Dcopier;destsuffix=3Dbuild=
/vendor/src/github.com/jinzhu/copier;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/magiconair/properties;name=3Dproperties;destsu=
ffix=3Dbuild/vendor/src/github.com/magiconair/properties;branch=3Dmain;prot=
ocol=3Dhttps \
-           git://github.com/golang/net;name=3Dnet;destsuffix=3Dbuild/vendo=
r/src/golang.org/x/net;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/golang/text;name=3Dtext;destsuffix=3Dbuild/ven=
dor/src/golang.org/x/text;branch=3Dmaster;protocol=3Dhttps \
-           git://github.com/pkg/diff;name=3Ddiff;destsuffix=3Dbuild/vendor=
/src/github.com/pkg/diff;branch=3Dmain;protocol=3Dhttps;apply=3Dno \
-           file://run-ptest \
-           "
-
-PV =3D "4.30.8+git${SRCREV_yq}"
-GO_IMPORT =3D "github.com/mikefarah/yq"
-
-inherit go ptest
-
-do_compile:prepend() {
-    # arrange for some of the golang built ins to be found
-    (
-	cd ${WORKDIR}/build/src/
-	ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/golang.org .
-
-	cd ${WORKDIR}/build/
-	ln -sf ${UNPACKDIR}/build/vendor .
-    )
-
-    # arrange for the fetched dependencies to be found
-    export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
-    export GO111MODULE=3Doff
-}
-
-do_install:append() {
-    # these bring in dependencies for the -dev package on bash, and we don=
't
-    # need them .. so we remove them to avoid needing that rdepends
-    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
-    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
-    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -r ${S}/src/github.com/mikefarah/yq/scripts/* ${D}${PTEST_PATH}/tes=
ts
-    cp -r ${S}/src/github.com/mikefarah/yq/acceptance_tests/* ${D}${PTEST_=
PATH}/tests
-    cp -r ${S}/src/github.com/mikefarah/yq/examples ${D}${PTEST_PATH}/test=
s
-}
-
-RDEPENDS:${PN}-ptest +=3D " \
-    bash \
-"
-
-BBCLASSEXTEND =3D "native"

