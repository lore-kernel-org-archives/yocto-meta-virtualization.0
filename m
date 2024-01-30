Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35A3C47DDF
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 21:07:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.8153.1706648872322685896
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Jan 2024 13:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=NtnpApMC;
 spf=pass (domain: axis.com, ip: 40.107.21.75, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b28uiU5MS8L2QAQY3Yas2S2sGFZLUGXU7b2GSCQAoXktPklWxeXAx4LAEdcfvEgesaXzhXIxfov0OaLAr7O7tUdz03PAJPl0gy84m43pWxtY1GDcjZfCsDqXR25UH0xZ1diWQviGK+xP55uH+NA6FZn5Ds7q+m9fiqpb6Ku0oaCSBSwFlBHx14aj0fGM9o+EomHvWV3G1FSl/1gXoNjtmrsMCApok+rMTqV65wckAwGEif8xtD5XUpnMeaBJS9b8aNYRliMv7NPkkqLKD4MaxGx5lGWClW/Nrz/c+wMfStB5XztObEce2kmg0bfQxBZK7hQxJlyzES7iCZElhDjwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z4q+VhrQaJgAbjkZIYzJZtIDDLC6UGUW9tzs02VeDg=;
 b=GhuIP9ivYU0XofncEgdEdi3vCQui07kba2tfKhL93WV71RjBtrCXFbFsPPpoxE24XbSXz+3GUzahVUePtQbGBcAin4N7S0EjJ+1TZTg5Uyy+Gn00SSm1KpWP+gRBvn2GYoj58ee5AD7ov627oZ+v4hh7I4AwiDVUZLD/2kAyMhIdt7gO2m33yuVyI+65mfjZeqEz0j9FHgvqSj9BoxshxSOlO1ixwscfk00X2tcHr/uaJXA/w1Czmtdq/MlW6eIYzwc/ZSG/Hj5jZKGdIfv/5z+e0lmnbB7vqCs2Sy5JKvsOChcneBZQX1LW881RPi5lPo2+eI02uHLSahZzMgtj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z4q+VhrQaJgAbjkZIYzJZtIDDLC6UGUW9tzs02VeDg=;
 b=NtnpApMCJpR8wdeZwP6u1I6ANad8BokKfpINyF9K6JtMnZDJ7JY31TteJQEtJu+3VyBr9q0vZPBrlYwSoH8FiGJ6NTKlMIdJCspOlnrLVelLuhw/qnzSeN3KVFpMGr00W84ptKt2VUVsBRzk9FnsY6M6L0P+JX0d9qR62uRJ4GI=
Received: from DU2PR04CA0294.eurprd04.prod.outlook.com (2603:10a6:10:28c::29)
 by AS2PR02MB9534.eurprd02.prod.outlook.com (2603:10a6:20b:599::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 21:07:48 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::2f) by DU2PR04CA0294.outlook.office365.com
 (2603:10a6:10:28c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 21:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Tue, 30 Jan 2024 21:07:47 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 Jan
 2024 22:07:47 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 Jan
 2024 22:07:47 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 30 Jan 2024 22:07:47 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 568F913420
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Jan 2024 22:07:47 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 40UL7l2x3679378
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Jan 2024 22:07:47 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 40UL7kRY3679377
	for meta-virtualization@lists.yoctoproject.org; Tue, 30 Jan 2024 22:07:46 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [nanbield][PATCH] containerd-opencontainers: Use RDEPENDS:${PN} instead of RDEPENDS:${BPN}
Date: Tue, 30 Jan 2024 22:07:38 +0100
Message-ID: <20240130210738.3679348-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|AS2PR02MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: 0acd0a5f-fd18-497b-c847-08dc21d78310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s9DibhXuhCnE8vt4NBRFyfVcobE2g+UMYW9xQIa0poHXwCZTvwqqzkypkpMq+qqK1Gp8UZ4MKzvQ6FnpQ8LuCXbptdydCAJXrwjA+ZLMjjgbDu7rIdqqgjk5E2rRhfBjUMiCO8b79oRjsRjIVi8W+Hwqiv8M7kcBuL6XHTAeCgLrEc12dXczEDpdtaHfMGRfK9IfiDqUJId0cuXGdM5qwsOQEdMfzuw1ic+dS6Ev+XY/vEDLEL+iIeuZGkjG4gXhiSZx8Gqa2p30Hhplw0Gd3AnVYJKhKcDyNTrSCchIB0AwtDz1wdTJLLKntyL9nXdal/oRk5Xc79o2aziay6K7qzC5WSLZ5Y5wwrED/inQNkFm9h67MQOi9t4ZMv33TrWuxPEsK/JztZ7OMgDavBGZWehz4pyM+2nuGDzAs9tSDE22nX0wXilELozS7M5MVaejzwyBdPlfeOnY684AoWH4+E99qXe7XruE41+kGvEQiVJpFl3xSJu7lYkQLQVgZv/7EuZrfHRJ1UvWBd6fcRmHd6rYBZSMCROQRT1yqNAGLPyyOG0ucx5kjuyHpawR/KP9DYab08LGgKgsKZmdiu8twdrj6GKz5B5fU4PG0HI4DYFlF9n0BPn6bVUrHvYrIVJ4L1jvM3j/hsOKneyybwfCiMGaP5+m+FCHF6zH5+t90H5DEVjB378ehQrcJBX13ixq9X6/AWxb4Og+Dr2yEdfPFrmZIGi89lKuKxiv4URn3xq9YwZjotzEYekKa8HRF6vrlxviX/kk45ZSZVzYEouM3/Rotsg5S7I6vhshUVKpgan43rQPnBTAK19Sxb0WED878RxV9wgAX6O7VIt62tHMcA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(426003)(2616005)(26005)(6916009)(2906002)(6666004)(8936002)(336012)(70586007)(8676002)(70206006)(42186006)(1076003)(316002)(5660300002)(47076005)(36860700001)(356005)(81166007)(82740400003)(478600001)(83380400001)(41300700001)(36756003)(36900700001)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 21:07:47.9743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acd0a5f-fd18-497b-c847-08dc21d78310
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9534
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Jan 2024 21:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8557

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The original purpose of using BPN vs PN in the RDEPENDS was due to
32bit multilib issues. Those problems are no longer present, so we
can adjust this recipe to use the standard PN in rdepends.

This change avoids the following warning:

  WARNING: .../containerd-opencontainers_git.bb: Variable key
  RDEPENDS:${PN} (...) replaces original key
  RDEPENDS:containerd-opencontainers
  (  ${VIRTUAL-RUNTIME_container_runtime}).

if, e.g., RDEPENDS:${PN}:append =3D " ..." is used in a bbappend or
bbclass.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb=
 b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 78fe694..d365820 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -98,6 +98,6 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
=20
 COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
=20
-RDEPENDS:${BPN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
+RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_runtime}"
=20
 CVE_PRODUCT =3D "containerd"

