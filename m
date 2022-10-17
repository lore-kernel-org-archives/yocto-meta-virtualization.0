Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABF3C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:13:02 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.76])
 by mx.groups.io with SMTP id smtpd.web08.39569.1666005175856707194
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=Saqr7TRM;
 spf=pass (domain: siemens.com, ip: 40.107.103.76, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJnzjx8wpwfOZwH4aYhUZaLmTMC09QS1HF3EjZT/WUcXDvXu6RziWVlkjinDiV0spPR7JbT03eVaATgbFx/051oO3+CMzfoOooqTrHb17E/+6TUkWrA5qx+gSDXWtDnyFQinsJ1jl49B7768pWVxX6g1RbyBC5I9LMbpS1JEwF7qfZ9dhuHlGfmrpLdsUgw59TQUK7RgrhkO5crlBcR7MDSVjUNbzpzhGfLT6htQBwdiBdYczCZGnJxC9JSkmZAaJkBROzO4oY8Ffdes1a/uLqY578qexe8o/NB18Qfh/Rloi3nQhtx8yvGD34AP8Q7JgL3AKksZIRwRNiyJJRFt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSl87Ot3PU10v2MAJn8YKAWsWoBDeSJRef0g10EeQ3I=;
 b=Cd683d6Kcyr/MEjTocFU5yCh4E+vrf+nLomwhzw5gM4BEpNKU+qZRGLr8qK3egLh845oB+niFuXwiVsVDyLjrqLF210PjmCw/YDI8c4bbrIxfqkpyOQVI3Mdk+hzBg2gNBBBYmdU9Fl2aubAHcTfL/yRfLMQSdRNNQk/0j/Xh9d3MJamtvbxFtxOSaSoIreSYHuBCLLTGjZsJd28PuQrV3BA99bNsbD+WKxnZV+TKY69C1AbO25FbZ6+wZ80vHDcm7ETRLYR6yOVccDfr0hoWQnzJbEkQuTG2pf7SiL9iBHukKKyJAXYmtVQztZ+s45w8jGafLlh2Nlh/XEin5iavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSl87Ot3PU10v2MAJn8YKAWsWoBDeSJRef0g10EeQ3I=;
 b=Saqr7TRMLeQCPozMEMP8jeE8Lhhr0mXcfxMQ7SaT+9fT7rPcBBRhC0iAvTIcsMuYmepW++WZQ2WgYxa1KXIlZYTMROAdawirG5hIM97m3XKTi9oT7vf1BB0WyKOMEaHyqSIPGRk4gRRV8pZxLJ0hQWa9YcZ54CIvb/BtaNuWFG3B4EgA74QLCXsDHsPecsgAtTMoQOJWvFroyWwcs8zmvFXWyzrInXM/spPDQ7XgUx5rTSUevocBdpRWcEUe+yOLBQJfoGBYpRwIT8r+j+E0CGEMIA6SsglPMYVaA2RMEMJGpGLa/hX7LWYt9WPDC0Bw35xOLfhrkUqcLO/pM8vrAw==
Received: from AS9PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:20b:463::9)
 by AS8PR10MB7112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 11:12:53 +0000
Received: from VE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::33) by AS9PR06CA0047.outlook.office365.com
 (2603:10a6:20b:463::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT025.mail.protection.outlook.com (10.152.2.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:52 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:52 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:46 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 5/7] aardvark-dns: add the recipe
Date: Mon, 17 Oct 2022 13:11:20 +0200
Message-ID: <20221017111121.25341-5-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT025:EE_|AS8PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 79add71c-fdea-4523-9abd-08dab03088fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ErmQtt7F9ksE42ghka/oJ6566+RhHAVaexreHSg9I6/BF9frDVoAwtFl/7VsvblzKkWuKQUq7GhkigRzh/oOhsffpn1Si1i34x61FLgSjpKRkF3dwKaO39K3QtwFW8EXfDOHnlWEoj8XSHUFH+UNnTxVRIiDGF7KYrJOWi9RGdaFOGybhrsig6lLHxVhc4m23JxfybSKsKIfb7opsBYjS+2vB0StRIpBvGjz5A58eGGby8wfXLVf1QmoEQDC0J8ECDwGByb9Ky4SSGB1fMxc8zOpRSygpA5hu37igWUdwJMkE3JBkvJWtENBBnQSsz6Impt/1PdeuWCSc8tUxjA6HkBMp46CH4SRpDYc3yTxRUO1fcNHr5c2sOg2iL2kwuMowiklCqaL1DRtdEnZz8gP5gfoqqMpgynu3zap50oAOGBuomudPWFlsRcu4usSLkv5J8nyfSmFrLvpJorwzuUkC1aOEIyQ4REeyhl4b/USqT+nA5DFT0AAxxEWrPp2A/ruYWbvqwcubhkPBzrf375EiHwut5hKFdeggHAhNQyK2m2pMEm51Rt1+bwmIlGh1nNH1z6YRCAyv3N/5jfccA2nPAZ6SWs1Il5RmiCLInb9iQUvLho4SLIQ6lzudOtvT+qeOe9k0hK+ZJSRyKilL46+cqpUAeWxXBaawwrWkZnWEnuYBDJshQyECp+/jjo1Fuz7o0t0PCv27XdcZpqilsfGl1y05eMchycvuicARV2QB71uWxM/sK5VA1MlctfYQiDwSXFK/gCUHeJETEFipZkTm/Yb6nKbxzay9jUPRFH8FGCdgOIz14v2q7clGTS/lNM1dPOtvG047JnFvJNR0eYi3OZDNkg2xKB56BDXvI8+MumBNyPIwQggb6IecgDvt8z0
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(86362001)(6666004)(82740400003)(107886003)(82960400001)(26005)(41300700001)(6916009)(82310400005)(316002)(5660300002)(8936002)(40460700003)(40480700001)(7636003)(7596003)(356005)(966005)(4326008)(478600001)(44832011)(36756003)(8676002)(70206006)(70586007)(83380400001)(47076005)(186003)(2616005)(956004)(16526019)(1076003)(2906002)(36860700001)(34020700004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:52.9118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79add71c-fdea-4523-9abd-08dab03088fd
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7112
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7657

The aardvark-dns is an optional runtime dependency of the netavark.
This recipe introduces the aardvark-dns, so it can be integrated
to netavark.

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 .../aardvark-dns/aardvark-dns.inc             |   6 +
 .../aardvark-dns/aardvark-dns_1.2.0.bb        | 159 ++++++++++++++++++
 recipes-containers/netavark/netavark.inc      |   9 +
 3 files changed, 174 insertions(+)
 create mode 100644 recipes-containers/aardvark-dns/aardvark-dns.inc
 create mode 100644 recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb

diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-con=
tainers/aardvark-dns/aardvark-dns.inc
new file mode 100644
index 0000000..4123a2d
--- /dev/null
+++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
@@ -0,0 +1,6 @@
+# Cargo installs the binary to bin so move it to where podman expects it
+do_install:append() {
+    install -d ${D}${libexecdir}/podman/
+    mv ${D}${bindir}/* ${D}${libexecdir}/podman/
+    rm -rf ${D}${bindir}/
+}
diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb b/recipe=
s-containers/aardvark-dns/aardvark-dns_1.2.0.bb
new file mode 100644
index 0000000..6fb4a81
--- /dev/null
+++ b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
@@ -0,0 +1,159 @@
+# Auto-Generated by cargo-bitbake 0.3.16
+#
+inherit cargo
+
+# If this is git based prefer versioned ones if they exist
+# DEFAULT_PREFERENCE =3D "-1"
+
+# how to get aardvark-dns could be as easy as but default to a git checkou=
t:
+# SRC_URI +=3D "crate://crates.io/aardvark-dns/1.2.0"
+SRC_URI +=3D "git://github.com/containers/aardvark-dns;protocol=3Dhttps;no=
branch=3D1"
+SRCREV =3D "cb1a462dd8427e33355f6907394a0646f5a26bf2"
+S =3D "${WORKDIR}/git"
+CARGO_SRC_DIR =3D ""
+
+
+# please note if you have entries that do not begin with crate://
+# you must change them to how that package can be fetched
+SRC_URI +=3D " \
+    crate://crates.io/anyhow/1.0.65 \
+    crate://crates.io/async-broadcast/0.4.1 \
+    crate://crates.io/async-trait/0.1.56 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bumpalo/3.10.0 \
+    crate://crates.io/bytes/1.1.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.20 \
+    crate://crates.io/clap/3.2.22 \
+    crate://crates.io/clap_derive/3.2.18 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/data-encoding/2.3.2 \
+    crate://crates.io/endian-type/0.1.2 \
+    crate://crates.io/enum-as-inner/0.3.4 \
+    crate://crates.io/enum-as-inner/0.5.1 \
+    crate://crates.io/error-chain/0.12.4 \
+    crate://crates.io/event-listener/2.5.2 \
+    crate://crates.io/form_urlencoded/1.0.1 \
+    crate://crates.io/futures-channel/0.3.21 \
+    crate://crates.io/futures-core/0.3.24 \
+    crate://crates.io/futures-executor/0.3.21 \
+    crate://crates.io/futures-io/0.3.21 \
+    crate://crates.io/futures-macro/0.3.24 \
+    crate://crates.io/futures-task/0.3.24 \
+    crate://crates.io/futures-util/0.3.24 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/hashbrown/0.12.2 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hostname/0.3.1 \
+    crate://crates.io/idna/0.2.3 \
+    crate://crates.io/indexmap/1.9.1 \
+    crate://crates.io/ipnet/2.5.0 \
+    crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/js-sys/0.3.59 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.133 \
+    crate://crates.io/lock_api/0.4.7 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/match_cfg/0.1.0 \
+    crate://crates.io/matches/0.1.9 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/mio/0.8.4 \
+    crate://crates.io/nibble_vec/0.1.0 \
+    crate://crates.io/nix/0.25.0 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/once_cell/1.13.0 \
+    crate://crates.io/os_str_bytes/6.1.0 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.3 \
+    crate://crates.io/percent-encoding/2.1.0 \
+    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.40 \
+    crate://crates.io/quick-error/1.2.3 \
+    crate://crates.io/quote/1.0.20 \
+    crate://crates.io/radix_trie/0.2.1 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/redox_syscall/0.2.13 \
+    crate://crates.io/resolv-conf/0.7.0 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/serde/1.0.139 \
+    crate://crates.io/serde_derive/1.0.139 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/signal-hook/0.3.14 \
+    crate://crates.io/slab/0.4.6 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/socket2/0.4.4 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/1.0.98 \
+    crate://crates.io/syslog/6.0.1 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/textwrap/0.15.1 \
+    crate://crates.io/thiserror-impl/1.0.31 \
+    crate://crates.io/thiserror/1.0.31 \
+    crate://crates.io/time/0.1.44 \
+    crate://crates.io/time/0.3.11 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.0 \
+    crate://crates.io/tokio-macros/1.8.0 \
+    crate://crates.io/tokio/1.21.1 \
+    crate://crates.io/toml/0.5.9 \
+    crate://crates.io/tracing-attributes/0.1.22 \
+    crate://crates.io/tracing-core/0.1.29 \
+    crate://crates.io/tracing/0.1.36 \
+    crate://crates.io/trust-dns-client/0.20.4 \
+    crate://crates.io/trust-dns-client/0.22.0 \
+    crate://crates.io/trust-dns-proto/0.20.4 \
+    crate://crates.io/trust-dns-proto/0.22.0 \
+    crate://crates.io/trust-dns-server/0.22.0 \
+    crate://crates.io/unicode-bidi/0.3.8 \
+    crate://crates.io/unicode-ident/1.0.1 \
+    crate://crates.io/unicode-normalization/0.1.21 \
+    crate://crates.io/url/2.2.2 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen-backend/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro/0.2.82 \
+    crate://crates.io/wasm-bindgen-shared/0.2.82 \
+    crate://crates.io/wasm-bindgen/0.2.82 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/windows-sys/0.36.1 \
+    crate://crates.io/windows_aarch64_msvc/0.36.1 \
+    crate://crates.io/windows_i686_gnu/0.36.1 \
+    crate://crates.io/windows_i686_msvc/0.36.1 \
+    crate://crates.io/windows_x86_64_gnu/0.36.1 \
+    crate://crates.io/windows_x86_64_msvc/0.36.1 \
+"
+
+
+
+# FIXME: update generateme with the real MD5 of the license file
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
+"
+
+SUMMARY =3D "A container-focused DNS server"
+HOMEPAGE =3D "https://github.com/containers/aardvark-dns"
+LICENSE =3D "Apache-2.0"
+
+# includes this file if it exists but does not fail
+# this is useful for anything you may want to override from
+# what cargo-bitbake generates.
+include aardvark-dns-${PV}.inc
+include aardvark-dns.inc
diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/=
netavark/netavark.inc
index 4123a2d..ae3e847 100644
--- a/recipes-containers/netavark/netavark.inc
+++ b/recipes-containers/netavark/netavark.inc
@@ -1,3 +1,12 @@
+PACKAGECONFIG ?=3D "aardvark-dns"
+
+# From the documentation of netavark
+# https://github.com/containers/netavark/blob/v1.1.0/DISTRO_PACKAGE.md#dep=
endency-on-aardvark-dns
+# The aardvark-dns will be installed by default with netavark, but
+# netavark will be functional without it.
+PACKAGECONFIG[aardvark-dns]=3D " , , , aardvark-dns"
+
+
 # Cargo installs the binary to bin so move it to where podman expects it
 do_install:append() {
     install -d ${D}${libexecdir}/podman/
--=20
2.34.1


