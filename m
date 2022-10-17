Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F12C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:13:52 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.72])
 by mx.groups.io with SMTP id smtpd.web10.39496.1666005224522708055
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=lmWELUBZ;
 spf=pass (domain: siemens.com, ip: 40.107.15.72, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFSx3pfvWgXGQ1ASQePycoEHrh7LU7y5+imUuN5CJus2Ms0+4ny5p1xfLEgCgv4MkkGgsXsZvO0v1GCLjs+6Y0HIXFoz642wYFeASzRr+f7xpToT3EPnGc2/bpoYsqx02rq/K+dqWPZgcsgKIRWzZ/vBpOJ40A3tOflNRHAC8szm8TEF+1wioSFjHqGQAfaIbyU5Me02/TWX7aXdZ9BmeqES2u8F7PO+/WwR0ENGN5vg1oVdqSWr8uPv69DNwEgFnUlgY9EeQNMmFfLHil2Jzya/vCejzVNO8WwzQa6ow19vTyqUXZ45Zervp7DRogsMyI0+dr4sW6q6bOPjZfuWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+wWvlIkvgyyFbZOK7HiQWsP4V19xvkqcf39VtGrK+Q=;
 b=c3CUibH39RIc6qccC4TW9feR7n7LSXhsmr0cnXDGkZS6OcPbOm5tGwWPbtKMghAnC3s41SMewAVYJuUktAGfgHBmrQAQsqOK5PKNIPteG2H6xElLiGCztzZ4f+R4hBSg5h1TfvxwWK+JfD/KKGgxxLnlPa83ZHTEDPkKz2mAmB18GLS+pJPrpnIngIZWwwSnrigjsLzuZDJj2cbX/REnthYj9Xr7sFjv5Y8DosYIKaT4mlTUrByAua6N5BDPJLPS4ebZYN1nbrdf7Tkd4w1TzLD2H6O8cP3vhmP7Xka7hvOEQ2RGbsMoeYfNgQPiVX6sFGC+eVMfUYu2YqMqr1vK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+wWvlIkvgyyFbZOK7HiQWsP4V19xvkqcf39VtGrK+Q=;
 b=lmWELUBZqOIiujNqqpLhj3YRyhf7TYk8tGYphdTeLjJnO1LIjI9whZvsS8njKpAe+REtnIL5mKw3jJmjPgIwqY1P8kwGxDiRZridWE0idAEDkPrClqkIZ8uWyYu+Dzw1pwSTsr0SWsRbiVwYSqVcgiPgZMcqCNEOqN/Jri6kZUU1MPLwtvzs9XvPoYgJjxLlqfEmNlZuTIRCwJYBdHdjIdUf+ftN2sz9WzwRLYW7DiUHYXHfmX8cVp9/qinqJLquOWGHIB3Wwzw2BbwaEj7N2Ee8yDRju3Z0CtGbY8ldRVHFf0r0ocwHIoY4ZTPNnlVAWXVShDidEsX1qrct29Etxw==
Received: from DU2PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:10:3b::11)
 by PAVPR10MB7540.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 11:13:42 +0000
Received: from DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::f0) by DU2PR04CA0006.outlook.office365.com
 (2603:10a6:10:3b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 11:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT015.mail.protection.outlook.com (10.152.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:13:42 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:13:41 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:13:29 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support
Date: Mon, 17 Oct 2022 13:11:22 +0200
Message-ID: <20221017111121.25341-7-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT015:EE_|PAVPR10MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: c276adbf-7e3d-4439-bc8f-08dab030a65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Im/D5xzw0s9/5SCyhnHhUJbLV5MwDd2boI7uhJinj3uSBt66H75HG66f+B+kxZxReid4kcEsq1P7yn4jtRWdBAaqw6EphZudl4fzCs1HkIAGU/zwiM8z/3GCOnkVt1LQihk9b7xj9nS2T4V78mZ9JZ20oyosW+c1l1sMN87ym5VGu+86c7G5JOkDbYP48B3far4C1+iLV3lBptBz/JyVqtMsN8ESS4Ayi2tERNU0crnk7pg8bGZL++uQtkRmFrDcRaF6uPxjh+dPp4pMmGOj0c0joypYIskBCSLDPcUd/82PjtI8bQafWtlXwO3HmeatWEs8cq+/Swi8clO+Bb5pdRon8I7+HhB+B1hwndI+sfIlRLjtH3tOtvMT4RjYP/WRh/WPESBPRUKfABLTDVET5n+sFe8Akh9oZF6j/1V9gRYaRcL8gg0Aa5NeGNOGSlrZMitZasdx+5suZdy5HGzXtp/ypIo1ktxdGxMAh0mBUSp/UcQZq1VH4MPZ/JuFIWPOEeJ6hBz33Wjls2im57SpL+TS1A8wl6iLCzWv4jLeoWDUWCGh3RnQMBFtZFSAQHy9riU7XUDrX+3vjYyrwjgZfbUkfkBrGZr28OqMuZFT5iRE2xQv5kiLDBZkK+Mx9AiPD9NTGY5fokxeFkUTAnW8xkd2DeTH5J62znYf515IKz4cr8upvm7Y4z9W0xDaYYbd1nzjCItFGO/wcCG20ktGJxZmIp0vdfzUbpyT2OLG1HHF6jUPl5rRJwOUUD79Ojc+zI5/KFIJR2FzQfKzxqZs9R/BWKQZs8nj0vJ1GAQq0MW3rch7r7IrJeMapFy01emkQOWgMK26yQx1ITwn2+VrrQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(36860700001)(86362001)(5660300002)(44832011)(2906002)(82960400001)(82740400003)(336012)(956004)(186003)(16526019)(1076003)(2616005)(47076005)(34020700004)(356005)(81166007)(26005)(316002)(478600001)(6916009)(70206006)(70586007)(82310400005)(107886003)(8936002)(40480700001)(41300700001)(4326008)(6666004)(40460700003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:13:42.1670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c276adbf-7e3d-4439-bc8f-08dab030a65b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7540
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:13:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7659

---
 .../aardvark-dns/aardvark-dns.inc             | 24 +++++++++++++++++++
 .../aardvark-dns/files/run-ptest              |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-containers/aardvark-dns/files/run-ptest

diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-con=
tainers/aardvark-dns/aardvark-dns.inc
index 4123a2d..70c94dd 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns.inc
+++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
@@ -1,6 +1,30 @@
+inherit ptest
+
+SRC_URI +=3D " \
+    file://run-ptest \
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
+    slirp4netns \
+    dbus-daemon-proxy \
+    util-linux-unshare \
+    bind-utils \
+    ipcalc \
+"
diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-cont=
ainers/aardvark-dns/files/run-ptest
new file mode 100644
index 0000000..b33d8fd
--- /dev/null
+++ b/recipes-containers/aardvark-dns/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+NETAVARK=3D/usr/libexec/podman/netavark AARDVARK=3D/usr/libexec/podman/aar=
dvark-dns bats ./test/
--=20
2.34.1


