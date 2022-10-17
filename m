Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0284C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:12:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web08.39567.1666005169311074971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 04:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=tXmEhUH/;
 spf=pass (domain: siemens.com, ip: 40.107.8.80, mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdVNCzuKIYEJsUEhPsv38/249vGZDqBiugN6OhDKVGoL48aFgCrQ7Tarf7IMWG6Cccw8PTgzIAfjoCrEtC8eAPCYiEIENaXx+sj+b+eEuVEqugGaK4RBWdQMnj6OxRV2PJ4u2ETAXjcDajbUMomwGJI5LQ2tClSP9Me0LacXOtL+GRbPbTKFLMI2nVQrF4i79BsqBUrF5SSWT1OwWHnflfuz9DQMOve3pSMisfkaDEm134QELxtgyVTC8p5lMaC1kXwdSk/5hnSCX+kAqrT9Hs7zLNTSZGPZmWkDub/PP/YSukEvty0jEWkhWRFv03uXtPO3HllScX+JsdH0AfRS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPveWDbFCJqpOZ1aA8v09CxSILIa64x1pYcu5FLEx68=;
 b=kkM/izD3cGg84aZ4sRfXAbcbMLpHkYu3YXLYVSJ+JtvCM+fke+Y7dSehiTzAQ4ub87S3noxmqDZMG0Bl7mflXbuFRzaaewM3NNUzD9NrOyVoiaqueNQaMeePbixb5/QFI/mYCnZYyjoAczF3Iiks2YqtnNa6QljUJy/Kv2zrTfe7a9tOYPa5Xl2TV27f8ZWo9FbMrspWMo2UbNo9wJHwU/p0jHzQcgJsC60AZBunMKOw8HrSWObLWHRDPy2TtFhhcJ1LZ2+wpCv9tK7qgVuZ5kVc+A+Fqvu0G8VAndDySW6wKGHR26LsiQfW3NAdujX6XOTHrEQvVvFfJYhF/Ay5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPveWDbFCJqpOZ1aA8v09CxSILIa64x1pYcu5FLEx68=;
 b=tXmEhUH/HzOIXEbrXOqp6buv9KXDoEtEgekB8yMu0wV/wnJEqNutmM5WpYVEHEaasyVvPIqCz42szJrgamhuhfSADKPW0tIMpNwWdl4nvpk8B3gMaZScZIUt7UbnplgY630x+WOUT3gRIGYyAS2oCLm19Are7QCuXIxzD6/9ZGE6vQK84fkFLxnqLT1dTsTcrNy9etyzkbmh97lIxRb40nBbY4P9Mn3iRdMjXAD/K3TEKk92JMj1g0RWI74YGjd7WMgThVWv0rAtsX8UACjoHOId2fTylnc+8q6jSJf/rb+7CiQV0pYrGb4SGXLsr+UwKbsBoDMRBuwFWE86ysWYrQ==
Received: from DB6PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:6:2a::17) by
 DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 11:12:46 +0000
Received: from DB5EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::83) by DB6PR07CA0055.outlook.office365.com
 (2603:10a6:6:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Mon, 17 Oct 2022 11:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT033.mail.protection.outlook.com (10.152.4.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 11:12:46 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:42 +0200
Received: from md3itd2c.ad001.siemens.net (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 17 Oct 2022 13:12:41 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 4/7] netavark: adapt the podman recipe for netavark
Date: Mon, 17 Oct 2022 13:11:19 +0200
Message-ID: <20221017111121.25341-4-vasileios.anagnostopoulos@siemens.com>
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
X-MS-TrafficTypeDiagnostic: DB5EUR01FT033:EE_|DB8PR10MB3766:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bb2650-692c-47d7-7345-08dab0308537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GE3cXC2FnOyVvhj53bPebkVbcFmkb2cWM4V1BFSagLYmKKGiOgAqDILT5wFBYQnYTI7z4V9CrosdyFAAm+yQ0IgOohOromV3ZJY8+OrMaA0s+NpGTK4hxZPrUU6xXvQuuzn30oCKXQuQQMJJe/uF4z7DluIRBkuV5buwfMM0oE3oxe6+EG9c6EYXUnVLIdbGBiMEe6LB8ZtX8pUQ9SLjqVSdwPXUQFTZOFjbXzL7eL8cDkWI5JPQZD/egjlTTzTfSgWeAE4jcSuoGHSKQdyMfY/ZMJk51n68a5Vpo7O1z3wlF8Fk+sgyK1ZdbdjZzQRwgq6C4wv/fd1p2cFAYZC+0m7fGzstbkdtOz+fPcxqRCEOt34gA98nrEW/bYzhdx+MesrTclcD5/bI3YcVwWkrKI2xr8OOr5f1hP6A6C0bC5c6I5cWAEjS94sbdylQV4eV16XlW7jzc4Htd2nHCLrirsNMZCyWBDJ7r0H1ImsSkIrGiGn9OjR3qcy69a5F8U2EZnidQHDVRjd2KPP1+3UrXazlcgdrSntuCQRN+X0wNvxCNtgCqJLbnUpS+V8D0ybfpu3NhIGNboq0+zmnrhxSDxCXNqk/sTa9gDpiOR181Zh8NBp3vEhq563umDNUEnC8QlzDHcaLNwiv1Kk1oq4GJUleUu7/76917WyfpZ6SGedG0hKvAr8eY+2h2CTuzfCgSdwCP0LXu5DPMFfuOrtLDEHURD3r2XrJ++ne1VN5LNhqKrp8Ntvd5VsDwOgDZW0UF7kKs5aDhPNlWMgpYs3iKrWXr2Cxc4r1w9sqsPyLRjUIftqaio78qY1W4aFFkdEmq9bggKNPMAsLX23IOiIhWw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(336012)(83380400001)(356005)(47076005)(81166007)(86362001)(36860700001)(34020700004)(82960400001)(82740400003)(8936002)(44832011)(5660300002)(70206006)(70586007)(8676002)(41300700001)(4326008)(82310400005)(2906002)(107886003)(6666004)(956004)(2616005)(16526019)(1076003)(186003)(26005)(40460700003)(6916009)(40480700001)(316002)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 11:12:46.5555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bb2650-692c-47d7-7345-08dab0308537
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3766
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 11:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7656

---
 recipes-containers/podman/podman_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/p=
odman/podman_git.bb
index dea14ba..9e6e748 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -68,6 +68,9 @@ PACKAGECONFIG ?=3D "docker"
 # Supported are: virtual-runc, crun
 DEFAULT_CONTAINER_RUNTIME ??=3D "virtual-runc"
=20
+# Supported are: cni, netavark
+DEFAULT_NETWORK_STACK ??=3D "cni"
+
 do_compile() {
 	cd ${S}/src
 	rm -rf .gopath
@@ -129,7 +132,7 @@ FILES:${PN} +=3D " \
     ${systemd_unitdir}/system/* \
     ${systemd_unitdir}/user/* \
     ${nonarch_libdir}/tmpfiles.d/* \
-    ${sysconfdir}/cni \
+    ${@bb.utils.contains('DEFAULT_NETWORK_STACK', 'cni', '${sysconfdir}/cn=
i', '', d)} \
 "
=20
 SYSTEMD_SERVICE:${PN} =3D "podman.service podman.socket"
@@ -139,7 +142,7 @@ SYSTEMD_SERVICE:${PN} =3D "podman.service podman.socket=
"
 VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-nsenter"
=20
 RDEPENDS:${PN} +=3D "\
-    conmon ${DEFAULT_CONTAINER_RUNTIME} iptables cni skopeo ${VIRTUAL-RUNT=
IME_base-utils-nsenter} \
+	conmon ${DEFAULT_CONTAINER_RUNTIME} iptables ${DEFAULT_NETWORK_STACK} sko=
peo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4n=
etns', '', d)} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel-mod=
ule-xt-comment"
--=20
2.34.1


