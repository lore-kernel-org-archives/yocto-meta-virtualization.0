Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA07C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 12:27:29 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.41])
 by mx.groups.io with SMTP id smtpd.web12.8448.1657628842747091764
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 05:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=kE+iFo1g;
 spf=pass (domain: siemens.com, ip: 40.107.6.41,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZu2N6rFRpxmH1Aim2JL+wxke7EkiuPKSIZHvxn3ZND17f/yFiH0fDR2X/r8warv/Gh6eUeYSDTba+CyCsnJuIuhgQS6XnpioR0kx59jKdy+jbRyp8wKZz/wmkwQS2UlEvoX3e6uiZKyDM6jMWAi9qQZrwrTNHWti5XyJ5sGP3r1bjuHhHBUJVfLiAmWEBLPDImzXBJLz8aB7aO84I1clixRfdHiZ1T/BbgXH7/nfJ4YBHeJk1+BojvWWe7+341UvNVO7lpZ/c5eOxHWMnWyR9tuUkWVlhj07D30FPXqSMhEFMAGjR8GMAQIq2AlJySOu7N5+35pei6PO19BEUBunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73NVmVgOT1341tLHYso4gpEG3+nbLr8msnVaXfAYttk=;
 b=HpzreT3L5acyANxwSBe7GligNiZdcSLe37MjCymswXF4H5c36UvCpnMFvXX3nXDSCC17a08dSUkE9LJH+hOQ6fxLJi8UtbJwLf/gv3P0BrU8cbwH6Au+RLMtzv24ZpUGjpyf5jK/8N/teutzc1a14q+sm2AyBhKCSCNbOVY47Ini+IkWWFOIg9lxN8TFTAxH5TwH5y484EMYxpB++G4txvxCoxDwbuEI8Ei1+zfhNv3bMBs2J/0+0l0W10vakeRzB1gWAwStcrojKDc9pjGbfuzWJzMczepA09CUSJm95QEszCUbqJM3mDyjPcFJZpIxGnHo3UROXcgV0eMYlHRKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73NVmVgOT1341tLHYso4gpEG3+nbLr8msnVaXfAYttk=;
 b=kE+iFo1gwhW7TI/P6ZXUJb1he2Ca4b5AsK1IWK/JChy2bYasyTpVYM2Rrti9ezmHMtVtFxbgZHRUfinrv6ULbOwSmX4tkAwWgUJ3PszkcXtLoGOCWjr0S+3de0apJ35KJWtIVmnXjiZTNKS+KV5YyO9i+0g2u4HYpc8F1oGFGirvFSiSDVLYdmoBtJlx+suDpsdXGlc1HabD36wUPP9nFBNIGzbCbUBHiGDIdOcrT1pc6fQBh02tdGxPQbI3y4jQfDSrtFnOSGnDueTO6Wm2FZO3CjGgwmco8c6Rv1nRm9hN3kyq/F62nQFRZldjKiuT1mUc145QfQNb4JA1LvhS2Q==
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by AM9PR10MB4372.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:26f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 12:27:20 +0000
Received: from VE1EUR01FT090.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::ee) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Tue, 12 Jul 2022 12:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT090.mail.protection.outlook.com (10.152.3.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16 via Frontend Transport; Tue, 12 Jul 2022 12:27:19 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:18 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.185) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 12 Jul 2022 14:27:18 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-virtualization][PATCH 1/3] image-oci-umoci: properly handle
 tags other than latest
Date: Tue, 12 Jul 2022 14:26:45 +0200
Message-ID: <20220712122647.12746-1-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.21.146.185]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.360300-8.000000
X-TMASE-MatchedRID: lXGXXqp5Qrd8GGsxukiVDnh9tuathCaxM6FDnBEzjXfKXbIv3mQNY0KJ
	5iyNYGPpB2QWi8BF5SiArqoIZrVn1wqaHbqkh0uxPXQMn4FsKNqGGmVvUJ/5UqMY62qeQBkLk/u
	oObpYZa4PScaecyX9gWuowxHx/YorbCKAy62dvVibKItl61J/yZ+inTK0bC9eKrauXd3MZDWXf5
	sC39gVVLl8fNLqqpH6IvheuPcN/WiO5f3LLYB8Tgf5aBaY8HqXlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.360300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 01348500EDA7301B5322A061F745C9759D90F72394BEA8BEEB9CA8B97336F23D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd0f9ec5-fdd7-4a81-91a7-08da6401dd06
X-MS-TrafficTypeDiagnostic: AM9PR10MB4372:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h+bRAvNzqYo7LKctso9BKhonnfrgPsq2a1jF+uxqoorMMOErlvzEpt9oUL7zdEnnVSdle4EIrahnYrE6y8WQ8q6im65Qdtzg/ewCt/XiYa9UkOMgQMtmu2GcYTe0rXfjPl0f3wQBGWobf4BoqbnhbkvrbnN9XVvq02EWuoHVrOCU7XkZKm9XZ5YU6hk8wQ2J3kYSWDeTz/l33P3dYIjaOUsCQ9YT6gcXdSqyWi8a+P/0FWX2rO5o1FFdjwUVCv2vRY+XGIjQAycJDnIrs8GOry6sNllccSvXNlINwmvKCtOQgOnhSRH4oQuKM32Ok2/fXuU+ByBaK1D4lSAANDEVdXAhpngZPJRSAhfDnhYruiPJkUkZgzhGaspTRKAjFWd+GIPgw015zzQ2FjP27vIChgxiRfudGeKic1pmNYHxLpSIEQEhcmXvkoySO1biwa7L8ev6O1OsXoIdSRwY+f3aYvHdSerpzlsS0w/gY2/v3YGH+SN+KVrNjpA35squFVjfZWjw0ehXo5/iWedpfr4Yh/V24TgVNRMPf5iJ0lyATrmhMArKQ9wqdQP4jkRYzKMFxIQpfKMK6BtEvZIRCZvlxQ6N5YerOssDT4gh5zrLitS+haeZOKc4ecYsx8MdCNRQTYeVk4JYRvG7AI74G9b/WYPPGMqYY0BtKdnPej4QSPn1ilzIn6WoWqBgh9tohx1wUDFX5QAmI/w2DdUZiglsxpFxHSNE3KNlFEQQ0KKPaHyLI6runLpuW3+DzVVUqNw9Kuv3AFNRbSCvy1VxazpN9Dc7k582ddnAlNOhWYNmcxVBrUtpKeQPoBcW5hUOK1ESLX/JZkzpolo5Ye6VH8kUL2RB4RP58SsXzmjSqaihYC0=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(40470700004)(40480700001)(2906002)(26005)(81166007)(82960400001)(36860700001)(186003)(86362001)(44832011)(41300700001)(107886003)(316002)(70586007)(8676002)(5660300002)(36756003)(1076003)(2616005)(956004)(83380400001)(8936002)(40460700003)(16526019)(70206006)(478600001)(82310400005)(6916009)(356005)(4326008)(336012)(47076005)(6666004)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 12:27:19.1817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cd0f9ec5-fdd7-4a81-91a7-08da6401dd06
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT090.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4372
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 12:27:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7441

From: Pascal Bach <pascal.bach@siemens.com>

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 classes/image-oci-umoci.inc | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 4fe96ea..b159614 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -58,48 +58,48 @@ IMAGE_CMD:oci() {
     bbdebug 1 "OCI: configuring image"
     if [ -n "${OCI_IMAGE_LABELS}" ]; then
 	for l in ${OCI_IMAGE_LABELS}; do
-	    bbdebug 1 "OCI: umoci config --image $image_name  --config.label $l"
-	    umoci config --image $image_name  --config.label $l
+	    bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_TAG} --c=
onfig.label $l"
+	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label $l
 	done
     fi
     if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
 	for l in ${OCI_IMAGE_ENV_VARS}; do
-	    bbdebug 1 "umoci config --image $image_name --config.env $l"
-	    umoci config --image $image_name --config.env $l
+	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config=
.env $l"
+	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env $l
 	done
     fi
     if [ -n "${OCI_IMAGE_PORTS}" ]; then
 	for l in ${OCI_IMAGE_PORTS}; do
-	    bbdebug 1 "umoci config --image $image_name --config.exposedports $l"
-	    umoci config --image $image_name --config.exposedports $l
+	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config=
.exposedports $l"
+	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.exposedpor=
ts $l
 	done
     fi
     if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
-	bbdebug 1 "umoci config --image $image_name  --config.user ${OCI_IMAGE_RU=
NTIME_UID}"
-	umoci config --image $image_name  --config.user ${OCI_IMAGE_RUNTIME_UID}
+	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.us=
er ${OCI_IMAGE_RUNTIME_UID}"
+	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.user ${OCI_IMA=
GE_RUNTIME_UID}
     fi
     if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
-	bbdebug 1 "umoci config --image $image_name  --config.workingdir ${OCI_IM=
AGE_WORKINGDIR}"
-	umoci config --image $image_name  --config.workingdir ${OCI_IMAGE_WORKING=
DIR}
+	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.wo=
rkingdir ${OCI_IMAGE_WORKINGDIR}"
+	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.workingdir ${O=
CI_IMAGE_WORKINGDIR}
     fi
     if [ -n "${OCI_IMAGE_OS}" ]; then
-	bbdebug 1 "umoci config --image $image_name  --os ${OCI_IMAGE_OS}"
-	umoci config --image $image_name  --os ${OCI_IMAGE_OS}
+	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --os ${OCI_=
IMAGE_OS}"
+	umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_IMAGE_OS}
     fi
=20
-    bbdebug 1 "umoci config --image $image_name  --architecture ${OCI_IMAG=
E_ARCH}"
-    umoci config --image $image_name  --architecture ${OCI_IMAGE_ARCH}
+    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --archit=
ecture ${OCI_IMAGE_ARCH}"
+    umoci config --image $image_name:${OCI_IMAGE_TAG} --architecture ${OCI=
_IMAGE_ARCH}
     # NOTE: umoci doesn't currently expose setting the architecture varian=
t,
     #       so if you need it use sloci instead
     if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
 	bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but umoci doe=
s not"
 	bbnote "     expose variants. use sloci instead if this is important"
     fi
-    umoci config --image $image_name  --config.entrypoint ${OCI_IMAGE_ENTR=
YPOINT}
+    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoint =
${OCI_IMAGE_ENTRYPOINT}
     if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
-	umoci config --image $image_name  --config.cmd "${OCI_IMAGE_ENTRYPOINT_AR=
GS}"
+	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "${OCI_IMA=
GE_ENTRYPOINT_ARGS}"
     fi
-    umoci config --image $image_name  --author ${OCI_IMAGE_AUTHOR_EMAIL}
+    umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMAGE=
_AUTHOR_EMAIL}
=20
     # make a tar version of the image direcotry
     if [ -n "${OCI_IMAGE_TAR_OUTPUT}" ]; then
--=20
2.34.1


