Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE386C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:13:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web11.39587.1666005181846306593
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=XDnzsoru;
 spf=pass (domain: siemens.com, ip: 40.107.8.71, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH1x4GAdNJ/1Jocwy0oYvni3pMi6igmYtWcnNSv1Cl/uWr9Oz3kii6T5Nn9HTwpWel1HwmKhdz86SzXloez1RO2y+2wfAZnCQaeaAyqqzWblLi7adGrz/5SW8ugd8v1jl0pfaRvmO/+DS9Dwijd0Rfw3YeJdMH/NVoxrehBT+DZocHD7gYM37vLJDdw5xHp/LqneZ7N8F1bjvBHwjpdIFiL23nEPPh2YjdWOIg0qsUcrI3hx30RJN/B5J3lcmu1u5ErbVJGmjZfsfgsIS8H5BcHwBgH8vhjZTVW71ntpk8YMFFKRj2G7BWpEi280hM1Y8LZViI4oCKCZVHbVqmYctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiZue6FCPzx/330M9aViQP71aJsQauVuz8xLJvz6Yow=;
 b=IVpz4KC95j7RLmLG0Uk+vYqXbQmf43DaA4RQ2mOXgYa+UTRDmusQt9Wa9Hmso5KoGZQqNTw7aXaP8y/j9bAIx500K0wSJ0e0q6zK2wSzODha5qpMw3SGnAGNZOrnFMKW5PiWqZxjj6btxMLDTXzAwYOlkMDtKve1b+4NOCWB3u2rVQoJ01wonJwkXKwGF+nqWIrCXFRd2dZQjs/av2+/IwUX7FxwtDkRq8SMo7maFSDqUZxOWdZjP2l2Ug+fJ23FLNV1rWVriFbR8mvYB10Z7ghFF+sFuQ50OOYWu9dH87fqcw5nhFbH47V40MABScrxlcCxcfgnhrNPAdb1FQ4uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiZue6FCPzx/330M9aViQP71aJsQauVuz8xLJvz6Yow=;
 b=XDnzsoru1mqOb3VK1dZRJoLsP+1LaAtH1uj/IFzVOFChu9S9Y7GsWYbdW6UAApTQzbU17Y9NcCYsFzQCJxDEeiu3y0ojxHMBrLxJwQHxB5ykbcwl1/qfinAqGBU2E2K2VFhQDwj+0cmF0p502gIKQvON3u5p84nT2JUeCZe+lvsTPx3AlLDJqSwzgwoRekhRDjPv+bq9dDy75Kiz08gBf4OkxbHLSV8Pt13ropXjBOJhxNXJOmioIKBga3UsHjUKlv5dXdt7ZXEmyp+NrhkDbFgeXSYGO9Z3eFahDyC5j4KDfp5FgJv/qD6D8oM5L7wBAfE4Y/wCWZgI3HmA9uJIzA==
Received: from GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7) by
 DB8PR10MB3578.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:131::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Mon, 17 Oct 2022 11:12:58 +0000
Received: from HE1EUR01FT051.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:b:cafe::5a) by GV3P280CA0011.outlook.office365.com
 (2603:10a6:150:b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT051.mail.protection.outlook.com (10.152.1.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:57 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:56 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:55 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 6/7] netavark: Add ptest support
Date: Mon, 17 Oct 2022 13:11:21 +0200
Message-ID: <20221017111121.25341-6-vasileios.anagnostopoulos@siemens.com>
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
X-MS-TrafficTypeDiagnostic: HE1EUR01FT051:EE_|DB8PR10MB3578:EE_
X-MS-Office365-Filtering-Correlation-Id: f71a5b0e-3e16-4742-ed3c-08dab0308be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ppk4uGyUkStioq8Ri4axfWcyNazTAEooakpDoxPLQWJWKrpPuxUFVNUl3krvo/id2OGDQtgBMbxVO7haprc1DQo4Qo0jgsJJscf5mh2YRun7o1wXp/iMFMyrVY+oYBWrONM6fJLmaetNVARLAF7l0Jx80FdHHRGr1ZyrfBJXwHwOIPHJU6jvJRn13ApPKL7vwcfQw3l6TY7aKy52XJ6nItnM12uD+FdmDVRsYlm5i+W1CbaDVI511/Zo7QzH6AnTCWgRMc8l5CJxqfGBOMoUX6GPHwADXdbkU1up0RZQAsZ1rJXuJ8Xmfg1SeVPHQe392HUwjyDAMOmQ1zSTk8ufurA0nBTe6unJ7XJ4jXvV/0ogiXf85UaEopxOqqe92FUypemAj9OzSpElCn2WFGUnfkQGVNOlkAC3Byhz929/2fVIKeMCSASfDMh8zrdl8g6gAlA2iiVt8/i4tUbMfMmyZWxxf5en/vOLcftAIjZA9pU6TXTlQDknba32cFIwMIIXqfhLOFhXOW9DasSqEVKluJ+uYd4+sLI6Cmbgw1DI2NX/oua98KKuc+7RgMoAJLi3Ba2h9POqk4IH17/NnJLnAZqTL0Hv9NdIE4opMwH8Q9A8qfcdb/oF3Odbrg8UPKlUX20jZmPgDu83lHliELrvHx+nFiCxUiMHgAImc9C2B+3m4x8XMWn+hGVXQKmRYgCKMfAyQFPxMYksshU+4Z/nxD1QeFNq0Cjvm16RQoz9EslQOW8lfJBOOZXgUSgdNi1oUZj96bbKxgkMWyeoh4EYioCFJnjBHhKTUf4KgF+C6t4+cCQKtY6k6xVlD5kyeaz3WUxWMPeryz/Gifi58/+MGQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(36860700001)(86362001)(5660300002)(44832011)(2906002)(82960400001)(82740400003)(336012)(2616005)(47076005)(16526019)(1076003)(186003)(956004)(34020700004)(81166007)(356005)(316002)(478600001)(70206006)(26005)(6916009)(70586007)(82310400005)(6666004)(8936002)(40480700001)(41300700001)(4326008)(107886003)(40460700003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:57.7298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71a5b0e-3e16-4742-ed3c-08dab0308be3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT051.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3578
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7658

---
 recipes-containers/netavark/files/run-ptest   |  3 ++
 recipes-containers/netavark/files/tests.patch | 17 ++++++++++
 recipes-containers/netavark/netavark.inc      | 31 +++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 recipes-containers/netavark/files/run-ptest
 create mode 100644 recipes-containers/netavark/files/tests.patch

diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containe=
rs/netavark/files/run-ptest
new file mode 100644
index 0000000..41a37dc
--- /dev/null
+++ b/recipes-containers/netavark/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+NETAVARK=3D/usr/libexec/podman/netavark bats ./test/
diff --git a/recipes-containers/netavark/files/tests.patch b/recipes-contai=
ners/netavark/files/tests.patch
new file mode 100644
index 0000000..254e4e9
--- /dev/null
+++ b/recipes-containers/netavark/files/tests.patch
@@ -0,0 +1,17 @@
+diff --git a/test/helpers.bash b/test/helpers.bash
+index 89866ec..017b2b5 100644
+--- a/test/helpers.bash
++++ b/test/helpers.bash
+@@ -552,10 +552,10 @@ function run_nc_test() {
+     fi
+=20
+     nsenter -n -t "${CONTAINER_NS_PIDS[$container_ns]}" timeout --foregro=
und -v --kill=3D10 5 \
+-        nc $nc_common_args -l -p $container_port &>"$NETAVARK_TMPDIR/nc-o=
ut" <$stdin &
++        ncat $nc_common_args -l -p $container_port &>"$NETAVARK_TMPDIR/nc=
-out" <$stdin &
+=20
+     data=3D$(random_string)
+-    run_in_host_netns nc $nc_common_args $connect_ip $host_port <<<"$data=
"
++    run_in_host_netns ncat $nc_common_args $connect_ip $host_port <<<"$da=
ta"
+=20
+     got=3D$(cat "$NETAVARK_TMPDIR/nc-out")
+     assert "$got" =3D=3D "$data" "ncat received data"
diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/=
netavark/netavark.inc
index ae3e847..1127adb 100644
--- a/recipes-containers/netavark/netavark.inc
+++ b/recipes-containers/netavark/netavark.inc
@@ -1,3 +1,5 @@
+inherit ptest
+
 PACKAGECONFIG ?=3D "aardvark-dns"
=20
 # From the documentation of netavark
@@ -7,9 +9,38 @@ PACKAGECONFIG ?=3D "aardvark-dns"
 PACKAGECONFIG[aardvark-dns]=3D " , , , aardvark-dns"
=20
=20
+SRC_URI +=3D " \
+    file://run-ptest \
+    file://tests.patch \
+"
+
 # Cargo installs the binary to bin so move it to where podman expects it
 do_install:append() {
     install -d ${D}${libexecdir}/podman/
     mv ${D}${bindir}/* ${D}${libexecdir}/podman/
     rm -rf ${D}${bindir}/
 }
+
+
+do_install_ptest () {
+	cp -r ${S}/test ${D}${PTEST_PATH}
+}
+
+RDEPENDS:${PN}-ptest +=3D " \
+    bats \
+    bash \
+    coreutils \
+    jq \
+    iproute2 \
+    dbus-daemon-proxy \
+    util-linux-unshare \
+    nmap \
+    procps-ps \
+    util-linux-nsenter \
+    bind-utils \
+"
+
+
+# bind-utils is used to install dig
+# procps is necessary because the ps from busybox is
+# not having the same behavior
--=20
2.34.1


