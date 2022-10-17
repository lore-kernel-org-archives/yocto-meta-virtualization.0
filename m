Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B10C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:12:22 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web11.39581.1666005134495660948
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=f+E9mGfV;
 spf=pass (domain: siemens.com, ip: 40.107.8.79, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiiFiRQjK809Mp8jqbfZTLm5DEY2O8vQhkxUyPl6NTu8VG6qefn9q1mRf0yp8B2yN641yLGI6HnW7sytRlNa4p97qmetg3Fw+IwbKAxaZDMnaUDeWgZEfPV7ny2kUryfHA8XgW53R/4ME9KOkuvdZu9QP4eKV/oX4o9geyVGJEqn25J6f9xh0vCWk7zNqOJ4AHKJ2rQEGKF4HzSjjteBoAX/81uPQH0GF5xbufEiOGd8oXSIAjx2GhNWl6OywuuPbmC8iygSfxRKS5TYtTcloasA1hxw3YvF8id25ECX7p8QK/hx2jM+jT7r6wRJ8i6RITqIJzumPW6/g9BrUr9yMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67Z41oU8RVBpUcfhV2lLrH6jBS31bqCcoi9NJBj6pDA=;
 b=NXXMK6P8ZuqBUJ3SqkrWD7ERHSxK9jguV9MGZKFUjszh1sjwYtXsRIkogSaKX5iKfDKmmNbi3WOszq2+CoiHgCQWhdymLMjhPWXQ3CZUdTBAaecFRIcVxBzOU+gbk8V6grnPkYBXldUBwqkYjG5Gnb3NKw1fEmd+3+uwajvU+r/eNMX6GkQfvEAjnJ2GG7WLY8wB9sRBAKacf9GHVawVqMqj2ouHKuEBy5l0Veb6y1OxELF7su3Po36jE55WWXzd2xRqQQuj5rl0O+8N9c2zMOO0MgM2JUCqk0gtn2uE4AZguuBA5vb7PlXDW7k4GrCPZNKIVTK3bUMX0GMYntIHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Z41oU8RVBpUcfhV2lLrH6jBS31bqCcoi9NJBj6pDA=;
 b=f+E9mGfV7i+wA+AzcDWwaZQEmMDTVnogGmUzZHyVFg0sLgUjqeB6fGHxWWqim9UxfJSUkqhkYcyfh2qbl+7Y7xOXJuGZ15WIodn2bTdZmySxhwNAecLmE9OzZ22WMAJV9hZATUfKzcWKTujmDJKedMjNQ2/WcZEjrrKjiw8t2KGA4dbJOTsAuQcoJ1afQUWbHVSpUK6byIQLfgb5U67zrdeT8pkVqLj98oiepZ59Ivd53XjiSMJPsSKROrNw2Vc+ZWjz/G0POVMk2IhJ+0epmCPRft8wAXSQui2XiOWIkj1bfTqC7xtj300f5I3pNBDV343VnyKTuKKN+czJCd+LHA==
Received: from AM6P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::27)
 by AS1PR10MB5215.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 11:12:11 +0000
Received: from VE1EUR01FT053.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::ce) by AM6P194CA0014.outlook.office365.com
 (2603:10a6:209:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT053.mail.protection.outlook.com (10.152.3.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:11 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:10 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 17 Oct 2022 13:12:10 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Pascal Bach <pascal.bach@siemens.com>, Vasileios Anagnostopoulos
	<vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 2/7] netavark: add the netavark recipe
Date: Mon, 17 Oct 2022 13:11:17 +0200
Message-ID: <20221017111121.25341-2-vasileios.anagnostopoulos@siemens.com>
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
X-MS-TrafficTypeDiagnostic: VE1EUR01FT053:EE_|AS1PR10MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: e35cee43-6ced-4a7c-a3f5-08dab0307004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4rSRmOsVZf752t67Ff6n1YnKQ3v5E8sM3w+yw3Xz0qV1gT3dcTdoIM46k3oyS0luJ30UL9VcIZGmpu4VjPTZ9Ix/rVmFQp5BeH526FSnVsQ7fuNprSqsKV7UWRHSv2UP5cdWRT1hglm5bkGQeTSAC+DXsz7hGFgvMGLBoX/NHiX/v7ZwhHKtKIgpQqyjz/Djv0T+FCGyDUweJri+ZRqg5m8oCGyhdDLSMZScVwA3xRjM9I1jbMEFhPF1EBqozMj4FWT2or4z8P26jc+vIr7zfmvKO0VWaMhFuoeuaB63pB/g5gw7NloIhSbYmxKh9gT3+E0zTPNXvtQCIuSkjsoaSVj17MK9hXPMfaI7T20LAnOkmoSzdNnfha4ebYLNAMlZFUry2TXDDiRk2X1g+YWmtL5GoM3El1O4pyokToG5XUp7iYZ9QqMBFJMkXv6rPu08eIlD7hBx7vHcNE24D61Say6s0YS7JyzdtTpzcTeHWmD/Xj1Oyd7jjhl/nMLt9i8wjplPer/PwSCRKhfYCnYKcc1Bg4KDjiB6qPWhWp22zR8GdyXD7GgffCoIDvwQMLPdXt42k1fI6fR2rn8Ot1+/tjWubKnLXkUaV7Okw84IzNlXEGYKyvVvgZtwVgS+NZ8NAodPTjGVMYsJzpGp6zAm6HfA+OBxwsSyOcaPvS+h6UfiUk1Qv5GuYo4IwDcQNv7xyHCnAodaTTjvezoL7LP5ujs0pH37gHc8zieSRDZScbbd83H+2kY/MCVgjznWukS58Qp9DvH2AxNgdKayltLdZq5ULuTSQ86i/Ph4JALNcTXEPHwR79IDB6fCMI+64mJ2JlrqO0G/EvPleCRMzBpgLw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(41300700001)(8676002)(36756003)(4326008)(44832011)(316002)(40460700003)(70586007)(16526019)(82310400005)(70206006)(36860700001)(478600001)(6916009)(336012)(54906003)(5660300002)(8936002)(47076005)(86362001)(107886003)(26005)(1076003)(7636003)(186003)(83380400001)(2616005)(956004)(82960400001)(82740400003)(7596003)(34020700004)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:11.0148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e35cee43-6ced-4a7c-a3f5-08dab0307004
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT053.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5215
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:12:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7654

From: Pascal Bach <pascal.bach@siemens.com>

The recipe is generated via cargo-bitbake. Modifications are done
in netavark.inc to allow re-genrating the recipe for future updates.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 recipes-containers/netavark/netavark.inc      |   6 +
 recipes-containers/netavark/netavark_1.1.0.bb | 203 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 recipes-containers/netavark/netavark.inc
 create mode 100644 recipes-containers/netavark/netavark_1.1.0.bb

diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/=
netavark/netavark.inc
new file mode 100644
index 0000000..4123a2d
--- /dev/null
+++ b/recipes-containers/netavark/netavark.inc
@@ -0,0 +1,6 @@
+# Cargo installs the binary to bin so move it to where podman expects it
+do_install:append() {
+    install -d ${D}${libexecdir}/podman/
+    mv ${D}${bindir}/* ${D}${libexecdir}/podman/
+    rm -rf ${D}${bindir}/
+}
diff --git a/recipes-containers/netavark/netavark_1.1.0.bb b/recipes-contai=
ners/netavark/netavark_1.1.0.bb
new file mode 100644
index 0000000..3bbbad5
--- /dev/null
+++ b/recipes-containers/netavark/netavark_1.1.0.bb
@@ -0,0 +1,203 @@
+# Auto-Generated by cargo-bitbake 0.3.16-alpha.0
+#
+inherit cargo
+
+# If this is git based prefer versioned ones if they exist
+# DEFAULT_PREFERENCE =3D "-1"
+
+# how to get netavark could be as easy as but default to a git checkout:
+# SRC_URI +=3D "crate://crates.io/netavark/1.1.0"
+SRC_URI +=3D "git://github.com/containers/netavark.git;protocol=3Dhttps;no=
branch=3D1"
+SRCREV =3D "5d2b799537d080a82ed46725705cfcbcb36417f1"
+S =3D "${WORKDIR}/git"
+CARGO_SRC_DIR =3D ""
+
+
+# please note if you have entries that do not begin with crate://
+# you must change them to how that package can be fetched
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/0.7.18 \
+    crate://crates.io/anyhow/1.0.58 \
+    crate://crates.io/async-broadcast/0.4.0 \
+    crate://crates.io/async-channel/1.6.1 \
+    crate://crates.io/async-executor/1.4.1 \
+    crate://crates.io/async-io/1.7.0 \
+    crate://crates.io/async-lock/2.5.0 \
+    crate://crates.io/async-recursion/0.3.2 \
+    crate://crates.io/async-task/4.3.0 \
+    crate://crates.io/async-trait/0.1.56 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/block-buffer/0.10.2 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/bytes/1.1.0 \
+    crate://crates.io/cache-padded/1.2.0 \
+    crate://crates.io/cc/1.0.73 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.19 \
+    crate://crates.io/clap/3.2.8 \
+    crate://crates.io/clap_derive/3.2.7 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/concurrent-queue/1.2.2 \
+    crate://crates.io/cpufeatures/0.2.2 \
+    crate://crates.io/crypto-common/0.1.5 \
+    crate://crates.io/derivative/2.2.0 \
+    crate://crates.io/digest/0.10.3 \
+    crate://crates.io/dirs-sys/0.3.7 \
+    crate://crates.io/dirs/4.0.0 \
+    crate://crates.io/easy-parallel/3.2.0 \
+    crate://crates.io/enumflags2/0.7.5 \
+    crate://crates.io/enumflags2_derive/0.7.4 \
+    crate://crates.io/env_logger/0.9.0 \
+    crate://crates.io/event-listener/2.5.2 \
+    crate://crates.io/fastrand/1.7.0 \
+    crate://crates.io/form_urlencoded/1.0.1 \
+    crate://crates.io/futures-channel/0.3.21 \
+    crate://crates.io/futures-core/0.3.21 \
+    crate://crates.io/futures-executor/0.3.21 \
+    crate://crates.io/futures-io/0.3.21 \
+    crate://crates.io/futures-lite/1.12.0 \
+    crate://crates.io/futures-macro/0.3.21 \
+    crate://crates.io/futures-sink/0.3.21 \
+    crate://crates.io/futures-task/0.3.21 \
+    crate://crates.io/futures-util/0.3.21 \
+    crate://crates.io/futures/0.3.21 \
+    crate://crates.io/generic-array/0.14.5 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/hashbrown/0.12.2 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/idna/0.2.3 \
+    crate://crates.io/indexmap/1.9.1 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/ipnet/2.5.0 \
+    crate://crates.io/iptables/0.5.0 \
+    crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.126 \
+    crate://crates.io/lock_api/0.4.7 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/matches/0.1.9 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/mio/0.8.4 \
+    crate://crates.io/netlink-packet-core/0.4.2 \
+    crate://crates.io/netlink-packet-route/0.13.0 \
+    crate://crates.io/netlink-packet-utils/0.5.1 \
+    crate://crates.io/netlink-proto/0.10.0 \
+    crate://crates.io/netlink-sys/0.8.3 \
+    crate://crates.io/nix/0.23.1 \
+    crate://crates.io/nix/0.24.2 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/once_cell/1.13.0 \
+    crate://crates.io/ordered-float/2.10.0 \
+    crate://crates.io/ordered-stream/0.0.1 \
+    crate://crates.io/os_str_bytes/6.1.0 \
+    crate://crates.io/parking/2.0.0 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/parking_lot_core/0.9.3 \
+    crate://crates.io/paste/1.0.7 \
+    crate://crates.io/percent-encoding/2.1.0 \
+    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/polling/2.2.0 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/proc-macro-crate/1.1.3 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.40 \
+    crate://crates.io/quote/1.0.20 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/redox_syscall/0.2.13 \
+    crate://crates.io/redox_users/0.4.3 \
+    crate://crates.io/regex-syntax/0.6.27 \
+    crate://crates.io/regex/1.6.0 \
+    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/rtnetlink/0.11.0 \
+    crate://crates.io/ryu/1.0.10 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/serde-value/0.7.0 \
+    crate://crates.io/serde/1.0.140 \
+    crate://crates.io/serde_derive/1.0.140 \
+    crate://crates.io/serde_json/1.0.82 \
+    crate://crates.io/serde_repr/0.1.8 \
+    crate://crates.io/sha1/0.6.1 \
+    crate://crates.io/sha1_smol/1.0.0 \
+    crate://crates.io/sha2/0.10.2 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/slab/0.4.6 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/socket2/0.4.4 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/1.0.98 \
+    crate://crates.io/sysctl/0.4.4 \
+    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/textwrap/0.15.0 \
+    crate://crates.io/thiserror-impl/1.0.31 \
+    crate://crates.io/thiserror/1.0.31 \
+    crate://crates.io/time/0.1.44 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.0 \
+    crate://crates.io/tokio-macros/1.8.0 \
+    crate://crates.io/tokio/1.20.0 \
+    crate://crates.io/toml/0.5.9 \
+    crate://crates.io/tracing-attributes/0.1.22 \
+    crate://crates.io/tracing-core/0.1.28 \
+    crate://crates.io/tracing/0.1.35 \
+    crate://crates.io/typenum/1.15.0 \
+    crate://crates.io/uds_windows/1.0.2 \
+    crate://crates.io/unicode-bidi/0.3.8 \
+    crate://crates.io/unicode-ident/1.0.1 \
+    crate://crates.io/unicode-normalization/0.1.21 \
+    crate://crates.io/url/2.2.2 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/waker-fn/1.1.0 \
+    crate://crates.io/walkdir/2.3.2 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wepoll-ffi/0.1.2 \
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
+    crate://crates.io/zbus/2.3.2 \
+    crate://crates.io/zbus_macros/2.3.2 \
+    crate://crates.io/zbus_names/2.1.0 \
+    crate://crates.io/zvariant/3.4.1 \
+    crate://crates.io/zvariant_derive/3.4.1 \
+"
+
+
+
+# FIXME: update generateme with the real MD5 of the license file
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
+"
+
+SUMMARY =3D "A container network stack"
+HOMEPAGE =3D "https://github.com/containers/netavark"
+LICENSE =3D "Apache-2.0"
+
+# includes this file if it exists but does not fail
+# this is useful for anything you may want to override from
+# what cargo-bitbake generates.
+include netavark-${PV}.inc
+include netavark.inc
--=20
2.34.1


