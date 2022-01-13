Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF23C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 11:32:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.53])
 by mx.groups.io with SMTP id smtpd.web10.7461.1642073577631745129
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 03:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=dpCB2lK2;
 spf=pass (domain: arm.com, ip: 40.107.8.53, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4VmtAuPITDQ/eI4De4t9yzbjQPvvo83EtrTiFD71Zg=;
 b=dpCB2lK2Gb/I/ODuueuY0ZAohh/EJPuvlK0nHWrnyKH57uvGTkKBU/d80Wi5QaR/6XFyrqpH5SFoXmebmqHvcGrHnl4c0gvX4TReQuGt/ykPpZULYDpxMEz5QMaY0Srl3A5W9pb/V7SuM3U9TMIfzkuNLnJuG1II+zZ7lsaZ2rs=
Received: from AM6P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::36)
 by VI1PR0801MB1966.eurprd08.prod.outlook.com (2603:10a6:800:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 11:32:53 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::f7) by AM6P192CA0023.outlook.office365.com
 (2603:10a6:209:83::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Thu, 13 Jan 2022 11:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 11:32:52 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Thu, 13 Jan 2022 11:32:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ed24a05e2475704
X-CR-MTA-TID: 64aa7808
Received: from cffeaeeb3008.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB25BE69-861C-49E6-9FC8-CF1379B4C075.1;
	Thu, 13 Jan 2022 11:32:45 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cffeaeeb3008.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Jan 2022 11:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVO2oPGbQFpjRdUSao+gsqOag2LHKzNHvsEztHGVpaEayJTFxa8HpWipBbEdWVJVqt1ZIJmiTKvWgHt8OPIcuNel2o/GGWyfns8RGt3hc1w/RqfFBOxro9QPEkS1HZVIFO9dgzDQAb1JYxBmO6Rhfg9IskSyh4dnYynnGtICvETN3mscmuGTRSkaSNSVckflFbrSBjyvDWRtV05noAGxVWksuRSyVhhZu1AR5FW8idfMchC+eBBTa136B3WXX/EPsqHqXY5/hfh6cBEM1wFtlKz+Prtlu5lFR1ecV2zuOA9S7AWZxkRvZAbJWrcsBwlovEgoWFeTMkVnoMpcwAHmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4VmtAuPITDQ/eI4De4t9yzbjQPvvo83EtrTiFD71Zg=;
 b=Ss9nVjC5Zb3wTPgTal/mrZrloOnM1aX2TmxcU62xrI6at4YWzJmQDknlG1HbYX1UbwmmmRJBW+Ix/yAXf7jyYLRS8NpXS8XiRkdJ/HHdYOGy2j8Z1dWJ6BRaUZH+ivfrxVJpAxgjfNHboQdy+KPJrw7bGs3wgYU1m5a4EtY8uH7Cb1ZbwDMg5L592thaNW5C8zqlfy3PYBqOtEC0Yq3EL2EcSgGFV0kM4+L8mj02qsGxP4mvKvwZvdkZSTVr+BUo0ZkT6QigXNtifAOAPxkvDn2h9TwekZR04S2askBdFoKE945ZEC6UZytVvT6NAImy7bUX9NTggDivVR8R2QpbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4VmtAuPITDQ/eI4De4t9yzbjQPvvo83EtrTiFD71Zg=;
 b=dpCB2lK2Gb/I/ODuueuY0ZAohh/EJPuvlK0nHWrnyKH57uvGTkKBU/d80Wi5QaR/6XFyrqpH5SFoXmebmqHvcGrHnl4c0gvX4TReQuGt/ykPpZULYDpxMEz5QMaY0Srl3A5W9pb/V7SuM3U9TMIfzkuNLnJuG1II+zZ7lsaZ2rs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by AM0PR08MB3905.eurprd08.prod.outlook.com (2603:10a6:208:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 11:32:42 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 11:32:42 +0000
From: Kamil Dziezyk <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [PATCH v3 1/2] xen-tools: Load xen related kernel modules during
 system boot
Date: Thu, 13 Jan 2022 12:30:58 +0100
Message-Id: <20220113113059.20489-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1cdf8d89-9fc0-43ca-b452-08d9d6886f5f
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3905:EE_|VE1EUR03FT047:EE_|VI1PR0801MB1966:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1966B876FCFAED1BEF92B622FD539@VI1PR0801MB1966.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
Content-Transfer-Encoding: quoted-printable
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hfFB+fSdQ2M+FC9rq2qhGP8n0f79N9sGm+dY8DNXpL3wZ78Kfti1CKSNi2XHoTY7M/zDJe0gCr5vh8FWvuoSHCqgkyoAmaTZ1cO0y3mW0BekaH4ZaFI8DOpZaDhaWd9065nx8Kwcmv8JdroO1Q3LZjA89+6wK/e9KsnEMBMqRtw5i203noaRizkcHoG6VzeQnjZSWZZypo9wzFq8DFF9QMjcnLXppof6fDx6bL90lDD1o8VdVe1oiE4Um+/IZaMhmTWhK2DzR39yHFf5NmmIttoaZTpAopCvB2IXYSHcmmYO1FSxYVXgylSfU1P2ThzvZywSwHWnKKndycsFcfmPC062MYqJrr6iGtaCRrbGxsHtwJPIjTco1Ji8UPPu0t4cDJfQLGykzQvt/pNJjqjor0pGYEz07wXjHnc+qYYdyUOWek0KI/KdyQKt7f+5Th9rrRsGv6qeE9MAsmaH+Qle0EmOj2yy7LZG5n7I4Sjfs1M8J20ANQ0sbMrd4KQiZ6Wp50qxCm5grnRpugfODSEqzdg5ogfF/pdjtoiTevKQF6G7zURWiwDOTsA+vzS85UQiJhGKS/I7sLrbY5V9ZHNPHdq7aLXBZ67mO4uhJLmErUJNsi3wfxvTOdRcCFpTp0Q0vYbPbeokR8pHLwMv30YwyNpX6brz1tkScqWg3T/p5wl7ud+MYUwcf1owje+8M20yUTt/PIb0PfTCeNmADcZMqg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(508600001)(2906002)(26005)(5660300002)(6506007)(8936002)(52116002)(186003)(8676002)(36756003)(1076003)(6916009)(86362001)(83380400001)(6486002)(316002)(6512007)(66556008)(44832011)(66946007)(38100700002)(38350700002)(66476007)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73c19c39-1dde-470a-12ec-08d9d688691f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9mozKI0ROBJYOLT9fdoVfsy/I+QopPgKs88fisST12LJMdsfWhhR9A/Td3ebJ01ju9HZJ2qZsJzAGuvmgSHpnFHRVStDjFIEWzW7kfL7s6ec5vVJVgi1oJDSGCD+xYtB37WyYaEYgH8IB98cDEArD52+u5hICmGOO8OcU4Ol0TZnDQQkheUdp1hUMBjoFTJXF7aXpV2I7PhKD0MJVtlLEzDPDVl9V9RfoDsnrhlYihSjzq2+Ly/51gLS3GjoJXB3ZWaGdKgRcDkTcCztLugtbdqKf4gdQKLoR5YK1RB62ITbGJEWpsxJ9B0z5gVIecX1XyeUlhLeTWGaIDcjc0+K7/STa5ltzPVyEgN2uWmlIWljMiVGnZ5p+/1c7ERh21ZKYUjzSzo3Xta3yyLTxY9EuykGdOjDExb3ulbEQrod8aZW1UW0I3A/m7FwWTYM/5k+7lBR5PvSx1Z+JlrW0B3m9Lwfr/QLu/fi8vIoPJfZ+rAy0JdKUuhgZpmWDyIp3Zg/10IbYsJXqEivhMmiR5ook3M1JoYg2leksI+SAIefC+5qrfKRsh94LjqYudtifA4ssiWbQ1WXvJBw3VYQpRPno17OJV4dT+4NBvOQLwelbQk2zzhfrd1jYY8W7/zElnH7PvzLEGSEy37SD0GNX5RpbwEv+WBtthM+VhZVwBfHgSdjh/49Pd8h5PgGXVDtuMRtx3VFmYUtktmJPPKPFKP+xsisyb+6eg/ccAt2GQ0wwEK1y7nAbXv0oOkjrNx+wE/shakOuyuDeTkp0E12DyaA7A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(107886003)(70586007)(508600001)(186003)(6506007)(40460700001)(44832011)(2906002)(2616005)(26005)(36756003)(4326008)(336012)(70206006)(5660300002)(82310400004)(8936002)(36860700001)(356005)(81166007)(6512007)(8676002)(316002)(47076005)(83380400001)(1076003)(86362001)(6486002)(6916009)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:32:52.0981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cdf8d89-9fc0-43ca-b452-08d9d6886f5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1966
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Jan 2022 11:32:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6999

This patch changes the location of xen.conf file, that contains list of ker=
nel
modules to be loaded during system boot, to "${nonarch_libdir}". This is do=
ne
by removing '--with-systemd-modules-load=3D' flag from EXTRA_OECONF variabl=
e.

Previous path based on "${systemd_unitdir}" was not considered by default b=
y
systemd-modules-load.service.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 recipes-extended/xen/xen-tools.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index ca924f4..6e25046 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -653,10 +653,10 @@ FILES:${PN}-xm =3D "\
     "

 FILES:${PN}-xencommons +=3D "\
+    ${nonarch_libdir}/modules-load.d/xen.conf \
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
     ${sysconfdir}/xen/scripts/launch-xenstore \
-    ${systemd_unitdir}/modules-load.d/xen.conf \
     ${systemd_unitdir}/system/proc-xen.mount \
     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
     ${systemd_unitdir}/system/xenconsoled.service \
@@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.servic=
e"

 EXTRA_OECONF +=3D " \
     --with-systemd=3D${systemd_unitdir}/system \
-    --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
     --with-initddir=3D${INIT_D_DIR} \
     --with-sysconfig-leaf-dir=3Ddefault \
     --with-system-qemu=3D${bindir}/qemu-system-i386 \
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

