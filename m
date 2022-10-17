Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA78FC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:12:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web11.39584.1666005143263494383
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=PBxZoBZI;
 spf=pass (domain: siemens.com, ip: 40.107.7.50, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLF4cXvvtaMEIcuB4/yVVGKAynK2Y/T2MtNOYuy/g38fn5X/HBuwDy35NN4twk3dbfo7B1f9aLydQfYBYNWvysjmH6y+fi6kvBz+yEG4LC/TvmAyfGjA7CBuwbRMy9Aj4VO1+fwmQf6nTWHGmEGrOHuSbU0h5vzuBc3XVR9etHnFPMXlEvLDQlEAbqOCHRa4tDaCVYRVysJEm+crLr8yIcr4BCp/1tXL/GGbqgFn/hCOcJppjcIWKTEgqz+dWu5yuWloK1QjK3jZZ0HUmVtudAbMBgbRAomhwJks5QBwgooBJC/TvstMIllzVYRfSt5WXpGMRJoe04Xyq1WN0M7/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIfi5tMlu5RTOnF8kjrpmxXmmEKbeqya2KLBEsaTjE4=;
 b=bbPn3TeFMfn57qnmPZqAzdm6OI/YqUgaagPgDnrpU2JrcTLbtj+AAkYjfRFqAimLE7VpmTATrugiNu2CVEo6ozOLTW0v98VaWWqr+Ml7iPRMRx6BCLN9L1Efb2sRGQTkpr+oIOZKq9xLUuT5GFD+S+i5VieZHkmm4g4fTRLO4MzfBj6AZnLWO4JgT1aQ3djSGf8aDSyUAIcgfvZJjgB6rATkgmG/bTBu9RLgxLJMfyntp9C8EhPfESi48hoad2kuoMdbKgzndgZ0TQmXrfLlNrIHPxtobNcoryd3kSKeqGg7DoOEfQrjko8vRJ5zsETz/eis9bh3Z6cNAygacoBsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIfi5tMlu5RTOnF8kjrpmxXmmEKbeqya2KLBEsaTjE4=;
 b=PBxZoBZIBCeQn91mqtqvtpUXnkXzH9Ksbg8pI10zNq09NXS9gcpRCgozmh/3b5hBWFb3m2guHEJvMwYlqpDoqvbYg5IeM+jtg9Obs4ewVcsh9zAsWEcvWzQMehnOz74TbA+muMQTIKZuXLQELtMCcjk0fvK5ttl+WGlgqFq+HK1aOLJVpiSOmGQ0npNltjruZmU4O4n0OrWXT8SvHi9etykJ49KlAA6Fd4NJ2ZmuWV1hv9uX2CYTTZHS677TCRqF9ArxdvEhUvyMUrFIrruU5+BKfyPVZ1AXg4NJYMhir57EM5MGgpyFmzbeBSwFLxqppdZ2CtAuH3X9hCHO+g2CNQ==
Received: from GV3P280CA0089.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::13) by
 PAWPR10MB7221.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 11:12:18 +0000
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:a:cafe::dd) by GV3P280CA0089.outlook.office365.com
 (2603:10a6:150:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:18 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:17 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 17 Oct 2022 13:12:16 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 3/7] netavark: update the netavark version
Date: Mon, 17 Oct 2022 13:11:18 +0200
Message-ID: <20221017111121.25341-3-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT057:EE_|PAWPR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 7080c1a8-a748-4daa-abe5-08dab030743e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tXZGNc9mUQnLSD1tA/n/No+pGEP5jAff/N/IQR7S9Lo/1DCNyKClbJLBZzGrtsi4SnxKldRd5mDQ6HdleQ0QQKSFnpuJf1AjRpdTPHp70e5s7hBm27631U0AgEsBZEHyDuzIq7V2ALKvSMKOErkXwMMurGh9ikO9FxjiI+aD80n+/eHvcLPXcngtLwESR2t+3tt3n03eYz22irrgF7Oaseb20ZYC8+yYX6VDqXWp28FVruYJF5DxvF372WQcin54fb752wwPI+lK6FqVVE0jlKAmKkRA0paa9pKBPSRJKqoEqAGrfo6gn9FJPactxfj03gC6f6dWesQrLym2jdUz0nebiPBiAUgdUOBW8UjgUuc52YAwiqsGXOfm2NWOo1jK7zE3Uayf++IUMVo3zcQQfwjmYcCcNteVC7SZnVMVCxO1mHlspOXPMNrze65Xg99Lc7zXV/Sp/P0/Ab3tZPfSOq6AUAEFgFV4YA95bd2a1Tl3pDV455LaUx/8iBsyPGGrVjAgzy03w0mgfvuBf4trUeXvd1fl9iyji/0UeVtfhfGDo8+pfmjqyoqog20I7S+XNyrWuyvJX32zhJ9HewLX8VAvnUmCohy7/FetVw7rs99WtD6wBj+KAW4pltd0K79YKvYuT7U97MXkxXpJ8MS3JJkYwgkswoXreDcplgXdcF6sJbtcOBL2RQyBJ+6x0ZLJ2WeQe6JhROoK08LyMlsiyYEAUDNmltewmQioqyF1ylM35r74EwTQ6jNu+fxI/oKaP1AKYC/EYqr+khULhfzVB6MhSTbI+HzSdU6C/VOPMODkgyjYuuoZq6LB5rvezF0t1jUQiRsQyCOQXLXnFegDFA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(316002)(36860700001)(6916009)(41300700001)(83380400001)(5660300002)(26005)(47076005)(8936002)(40480700001)(86362001)(107886003)(34020700004)(36756003)(44832011)(956004)(336012)(70586007)(70206006)(8676002)(4326008)(2906002)(82740400003)(82960400001)(2616005)(356005)(81166007)(478600001)(82310400005)(40460700003)(16526019)(1076003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:18.0592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7080c1a8-a748-4daa-abe5-08dab030743e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7221
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7655

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 .../{netavark_1.1.0.bb =3D> netavark_1.2.0.bb}  | 71 +++++++++++--------
 1 file changed, 41 insertions(+), 30 deletions(-)
 rename recipes-containers/netavark/{netavark_1.1.0.bb =3D> netavark_1.2.0.=
bb} (79%)

diff --git a/recipes-containers/netavark/netavark_1.1.0.bb b/recipes-contai=
ners/netavark/netavark_1.2.0.bb
similarity index 79%
rename from recipes-containers/netavark/netavark_1.1.0.bb
rename to recipes-containers/netavark/netavark_1.2.0.bb
index 3bbbad5..851bf73 100644
--- a/recipes-containers/netavark/netavark_1.1.0.bb
+++ b/recipes-containers/netavark/netavark_1.2.0.bb
@@ -1,4 +1,4 @@
-# Auto-Generated by cargo-bitbake 0.3.16-alpha.0
+# Auto-Generated by cargo-bitbake 0.3.16
 #
 inherit cargo
=20
@@ -6,9 +6,9 @@ inherit cargo
 # DEFAULT_PREFERENCE =3D "-1"
=20
 # how to get netavark could be as easy as but default to a git checkout:
-# SRC_URI +=3D "crate://crates.io/netavark/1.1.0"
+# SRC_URI +=3D "crate://crates.io/netavark/1.2.0"
 SRC_URI +=3D "git://github.com/containers/netavark.git;protocol=3Dhttps;no=
branch=3D1"
-SRCREV =3D "5d2b799537d080a82ed46725705cfcbcb36417f1"
+SRCREV =3D "90cccc1c21f26fbc473a201ce3b30d77667c7635"
 S =3D "${WORKDIR}/git"
 CARGO_SRC_DIR =3D ""
=20
@@ -17,7 +17,8 @@ CARGO_SRC_DIR =3D ""
 # you must change them to how that package can be fetched
 SRC_URI +=3D " \
     crate://crates.io/aho-corasick/0.7.18 \
-    crate://crates.io/anyhow/1.0.58 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anyhow/1.0.65 \
     crate://crates.io/async-broadcast/0.4.0 \
     crate://crates.io/async-channel/1.6.1 \
     crate://crates.io/async-executor/1.4.1 \
@@ -30,39 +31,42 @@ SRC_URI +=3D " \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/block-buffer/0.10.2 \
+    crate://crates.io/bumpalo/3.10.0 \
     crate://crates.io/byteorder/1.4.3 \
     crate://crates.io/bytes/1.1.0 \
     crate://crates.io/cache-padded/1.2.0 \
     crate://crates.io/cc/1.0.73 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.19 \
+    crate://crates.io/chrono/0.4.22 \
     crate://crates.io/clap/3.2.8 \
     crate://crates.io/clap_derive/3.2.7 \
     crate://crates.io/clap_lex/0.2.4 \
     crate://crates.io/concurrent-queue/1.2.2 \
+    crate://crates.io/core-foundation-sys/0.8.3 \
     crate://crates.io/cpufeatures/0.2.2 \
     crate://crates.io/crypto-common/0.1.5 \
     crate://crates.io/derivative/2.2.0 \
-    crate://crates.io/digest/0.10.3 \
+    crate://crates.io/digest/0.10.5 \
     crate://crates.io/dirs-sys/0.3.7 \
     crate://crates.io/dirs/4.0.0 \
     crate://crates.io/easy-parallel/3.2.0 \
     crate://crates.io/enumflags2/0.7.5 \
     crate://crates.io/enumflags2_derive/0.7.4 \
-    crate://crates.io/env_logger/0.9.0 \
+    crate://crates.io/env_logger/0.9.1 \
     crate://crates.io/event-listener/2.5.2 \
     crate://crates.io/fastrand/1.7.0 \
-    crate://crates.io/form_urlencoded/1.0.1 \
-    crate://crates.io/futures-channel/0.3.21 \
-    crate://crates.io/futures-core/0.3.21 \
-    crate://crates.io/futures-executor/0.3.21 \
-    crate://crates.io/futures-io/0.3.21 \
+    crate://crates.io/form_urlencoded/1.1.0 \
+    crate://crates.io/fs2/0.4.3 \
+    crate://crates.io/futures-channel/0.3.24 \
+    crate://crates.io/futures-core/0.3.24 \
+    crate://crates.io/futures-executor/0.3.24 \
+    crate://crates.io/futures-io/0.3.24 \
     crate://crates.io/futures-lite/1.12.0 \
-    crate://crates.io/futures-macro/0.3.21 \
-    crate://crates.io/futures-sink/0.3.21 \
-    crate://crates.io/futures-task/0.3.21 \
-    crate://crates.io/futures-util/0.3.21 \
-    crate://crates.io/futures/0.3.21 \
+    crate://crates.io/futures-macro/0.3.24 \
+    crate://crates.io/futures-sink/0.3.24 \
+    crate://crates.io/futures-task/0.3.24 \
+    crate://crates.io/futures-util/0.3.24 \
+    crate://crates.io/futures/0.3.24 \
     crate://crates.io/generic-array/0.14.5 \
     crate://crates.io/getrandom/0.2.7 \
     crate://crates.io/hashbrown/0.12.2 \
@@ -70,17 +74,18 @@ SRC_URI +=3D " \
     crate://crates.io/hermit-abi/0.1.19 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/idna/0.2.3 \
+    crate://crates.io/iana-time-zone/0.1.46 \
+    crate://crates.io/idna/0.3.0 \
     crate://crates.io/indexmap/1.9.1 \
     crate://crates.io/instant/0.1.12 \
     crate://crates.io/ipnet/2.5.0 \
     crate://crates.io/iptables/0.5.0 \
     crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/js-sys/0.3.59 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.126 \
+    crate://crates.io/libc/0.2.133 \
     crate://crates.io/lock_api/0.4.7 \
     crate://crates.io/log/0.4.17 \
-    crate://crates.io/matches/0.1.9 \
     crate://crates.io/memchr/2.5.0 \
     crate://crates.io/memoffset/0.6.5 \
     crate://crates.io/mio/0.8.4 \
@@ -91,6 +96,7 @@ SRC_URI +=3D " \
     crate://crates.io/netlink-sys/0.8.3 \
     crate://crates.io/nix/0.23.1 \
     crate://crates.io/nix/0.24.2 \
+    crate://crates.io/nix/0.25.0 \
     crate://crates.io/num-integer/0.1.45 \
     crate://crates.io/num-traits/0.2.15 \
     crate://crates.io/num_cpus/1.13.1 \
@@ -104,7 +110,7 @@ SRC_URI +=3D " \
     crate://crates.io/parking_lot_core/0.8.5 \
     crate://crates.io/parking_lot_core/0.9.3 \
     crate://crates.io/paste/1.0.7 \
-    crate://crates.io/percent-encoding/2.1.0 \
+    crate://crates.io/percent-encoding/2.2.0 \
     crate://crates.io/pin-project-lite/0.2.9 \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/polling/2.2.0 \
@@ -127,13 +133,13 @@ SRC_URI +=3D " \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.1.0 \
     crate://crates.io/serde-value/0.7.0 \
-    crate://crates.io/serde/1.0.140 \
-    crate://crates.io/serde_derive/1.0.140 \
-    crate://crates.io/serde_json/1.0.82 \
+    crate://crates.io/serde/1.0.144 \
+    crate://crates.io/serde_derive/1.0.144 \
+    crate://crates.io/serde_json/1.0.85 \
     crate://crates.io/serde_repr/0.1.8 \
     crate://crates.io/sha1/0.6.1 \
     crate://crates.io/sha1_smol/1.0.0 \
-    crate://crates.io/sha2/0.10.2 \
+    crate://crates.io/sha2/0.10.6 \
     crate://crates.io/signal-hook-registry/1.4.0 \
     crate://crates.io/slab/0.4.6 \
     crate://crates.io/smallvec/1.9.0 \
@@ -141,17 +147,17 @@ SRC_URI +=3D " \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.98 \
-    crate://crates.io/sysctl/0.4.4 \
+    crate://crates.io/sysctl/0.5.2 \
     crate://crates.io/tempfile/3.3.0 \
     crate://crates.io/termcolor/1.1.3 \
     crate://crates.io/textwrap/0.15.0 \
-    crate://crates.io/thiserror-impl/1.0.31 \
-    crate://crates.io/thiserror/1.0.31 \
+    crate://crates.io/thiserror-impl/1.0.34 \
+    crate://crates.io/thiserror/1.0.34 \
     crate://crates.io/time/0.1.44 \
     crate://crates.io/tinyvec/1.6.0 \
     crate://crates.io/tinyvec_macros/0.1.0 \
     crate://crates.io/tokio-macros/1.8.0 \
-    crate://crates.io/tokio/1.20.0 \
+    crate://crates.io/tokio/1.21.1 \
     crate://crates.io/toml/0.5.9 \
     crate://crates.io/tracing-attributes/0.1.22 \
     crate://crates.io/tracing-core/0.1.28 \
@@ -161,12 +167,17 @@ SRC_URI +=3D " \
     crate://crates.io/unicode-bidi/0.3.8 \
     crate://crates.io/unicode-ident/1.0.1 \
     crate://crates.io/unicode-normalization/0.1.21 \
-    crate://crates.io/url/2.2.2 \
+    crate://crates.io/url/2.3.1 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/waker-fn/1.1.0 \
     crate://crates.io/walkdir/2.3.2 \
     crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen-backend/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro/0.2.82 \
+    crate://crates.io/wasm-bindgen-shared/0.2.82 \
+    crate://crates.io/wasm-bindgen/0.2.82 \
     crate://crates.io/wepoll-ffi/0.1.2 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.5 \
--=20
2.34.1


