Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD74AECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 06:56:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web08.8628.1661842594510518131
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 23:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=js3yFbdN;
 spf=pass (domain: siemens.com, ip: 40.107.8.71,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0+vxRetC9TFBVg5MHPd9t+STHiFjUpxknXlZOQERFxFsvvFfV3Mya9r61FFXizY+EIpI/DteJVSsUJ4lKL4gBTpe3PQ2fsNbCXGpiFQSWACiKC2IsOoJeqnhplrQbv2P7TWxF0+NehoCF4nBTsMhygROABjgO3u2rVKy51Jl5Z+QLoQ5vB4hQrxltgJIiJY/MAKl9pFVzGQjAAm80tqRf/XCKsYGsvivXZ2058wtz/B0YW30DHOa0bwf3nyiM1gKZ9ymL7mG/vnyZ1sQHkMmvj9sBEm9QlLLFaKdOF7q+sAo7rkJ9wmRaWViRQZ+TC2oGL3HVrkgI5Upt7ljQFLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieI0laksle7EL4kST2pFplujxSoG8X++n8hD3wNEi14=;
 b=TN82TLdhauUqjClUX1gSk8bCgDo4C+Cyv/mWWqJPjZ/5XupgEyQq46LVQmMAYEC+U80xG1uMnu+ncfvuqax7BhBOYWZNe7pUqYNJAJ6KN6NDPojc7f4nqFgfQ3nbNt+97IrD+Pavzg+JW9rcjXXlqSGgH+INoBPedxGy/ie74aO34okaN3En8iEScStDpEUGb3O5N6BS5w/+nv1rz0oDBRkxHw0C509Wo88dJSH/ueBl54B6j/ag6oEYKkQRo66qagWOAr7KeMamtIPORIbSH72GKZLgtYeg6taIRk5Nl35WVOLHpoleurpqXGS9mVALJ/fTq3PMI9+IwWn/vNDg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieI0laksle7EL4kST2pFplujxSoG8X++n8hD3wNEi14=;
 b=js3yFbdN5AK8nlqKfUnbcQccRnYv4JaB5UTGCimyF0EBVKjjZi0fpZ/ufTuBs6IulrJTDWZ4u3V/XqvMYOXDY/zZUohR4P5tLgk53QblEjIVMxkbDb/bKv5eOj95BNM6D+LFBH/gkkSAAT19vHAxYLFftT8WqR4ebKA+hNhZS0HSHie9Z+t6675ULhcPHd18GniiIozZrRlZJQhbkrEGczPPy2mJ8IZQO7dHjrgS0hZVdrwzpwgSpEDMGSRPe0uQN4wSShX4+dhEnYLCRTQWKYlmvNDiEasR8eADIqEMd9LAGHK+TMLaXynbgSTbrKsNSy+Bz67vY2ATEjfGX7SGMQ==
Received: from GVX0EPF000013EC.SWEP280.PROD.OUTLOOK.COM (2603:10a6:144:1::19)
 by AM0PR10MB2433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:56:31 +0000
Received: from HE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
 (2a01:111:f400:7e1f::209) by GVX0EPF000013EC.outlook.office365.com
 (2603:1026:900:2::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 06:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 HE1EUR01FT041.mail.protection.outlook.com (10.152.1.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 06:56:30 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 30 Aug 2022 08:56:29 +0200
Received: from md3itd2c.ad001.siemens.net (144.145.220.66) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 30 Aug 2022 08:56:28 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 2/2] k3s: sync the version with the
 upstream version
Date: Tue, 30 Aug 2022 08:55:30 +0200
Message-ID: <20220830065530.2418-2-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830065530.2418-1-vasileios.anagnostopoulos@siemens.com>
References: <20220830065530.2418-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9a3e3ea-332a-468a-2609-08da8a54c4d4
X-MS-TrafficTypeDiagnostic: AM0PR10MB2433:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	89/6GcmR2fegpUiOw/BzMhd7PN1feMyhhocbVthit0yxVsBNVtyqeSj85F84yr0x3rsbN32PJRaB13OwjJMNTqOxRIbsvQZLuY4j0Ap4CeWeCMI0eNeeWr36nS/cQOHCw6v54AXDxNIaG6GNjBMABoc9BWJS5UcWtgJA2euXbztvhetfCXJN2vZAMfBWIJxQXa0FwwoBoQS6NuPikr3/9vwt5BLwxJkt522o3LOIBxdOP/uuSwedTrnnqCFY4bSywtCY6U8h1BO4EXe4V10lKEe2fAc3mkC97051z/ZWFrIEQbF+ox3flsfPKU50L9G+moVbdM7/5j3KlrkXL6PcU1pgC0GXP6qVMaboY9FfNqBrfo8NNfFYLCncX34YTGraHCPH6tf/CyPJxtH4DuZPmqhZ1hHu4uSgHHcSDwTaJi4qSGrI8fHy+If4srQdfJ+3Fp5fi6RZaRIN5IWzLF3KoTf/n5iZY3YdOsHM590WFi8SqlShey6pWE5c27v1nD1/qhrHsfkyIN81IbmIl7CPmMsM+xFvGGdCMXtgUgQrkDi2oBIE5U6zABCW0O6CVWCpp+Ag0mPFSg/icrox1U2utYINw101ZiRThYWAL1uLKxfOeZWsR0RMrWaJRUowKx1RkVKrGKDfsydBzPOArJHxX5QpPlsrI1c+ze+1o3CtjveIx+nx28VM6a5uPa95xtFuUOc22/DPZ1ykBgRISJcrCQhGx5Uiok3GV+e/1oSktgWhIvl6AmyXeXG2LQycyF554g8kWOomVn5N8YkiATz74E5xqT80sHDb3h8Np0dLkx8=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(82310400005)(82740400003)(26005)(2906002)(6666004)(44832011)(2616005)(956004)(16526019)(83380400001)(336012)(40480700001)(1076003)(186003)(47076005)(36860700001)(4744005)(40460700003)(4326008)(6916009)(8676002)(70206006)(5660300002)(966005)(316002)(70586007)(107886003)(82960400001)(7596003)(7636003)(36756003)(86362001)(356005)(8936002)(41300700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:56:30.9376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9a3e3ea-332a-468a-2609-08da8a54c4d4
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2433
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 06:56:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7580

The k3s project is using as version the git tag:
https://github.com/k3s-io/k3s/blob/master/scripts/version.sh#L58
This patch applies that logic in the build artifacts.

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 recipes-containers/k3s/k3s_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index 66ff523..23bd783 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e94a5=
"
 SRCREV_k3s =3D "24da6adfa98cd05849edf1c42de3862f843a05f4"
=20
 SRCREV_FORMAT =3D "k3s_fuse"
-PV =3D "v1.24.3+k3s1+git${SRCREV_k3s}"
+PV =3D "v1.24.3+k3s1"
=20
 include src_uri.inc
=20
--=20
2.34.1


