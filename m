Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2397ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 06:56:32 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web11.8717.1661842589029180877
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 23:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=rIQUKTqW;
 spf=pass (domain: siemens.com, ip: 40.107.21.87,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKAK2jH6Xk4ZX+TVkg5OZwxiBh/zfOQJ8XZTadnfLcciE+sZ6nfK+FTMfX3jqmeBXCixYpp20cMfrcbR80rYcM8RJzPaaLNyNOr4PAozzXrVkRukVgJCRg0howyHCrtnstvmiuxu4kyapCuWwsUPYA1HDR3g52wbnJtSddQOeJsGOC+y2Hp1W2amvj6x5+p5W+vW7jmwjTq2+gqI50VAmeiSlsuaeERnSHdIjnqW7qdkmpw/Wz6HyKH5SGJCllsZjq3zDv1xrIcJdeqs1eXwgvE9/wTPAn/yyE/AVM5wga8XBgwG+vtu4IJqSsCSxFTVpQ53NWceV0zwv/ZB3y2RDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVyE2dNfxww60otoF+0blrj2tBSsmY1LxLJzakJNkHA=;
 b=f69Fck+z/ZiLrJW3xmYzAqUIHh4SlzrYxmpvn6m3mnxuhG0Ci3gWMzU9l5r+tfytEoyAxEiR+gTtZVb5fQa2sIuRibifUG2ZGtsbWB6zLpoqEgBIa9ICswrKfnnthQwdcgZFEjpDjU+ix95dakwb3SerxxE3WSXltFSqqkwUn5Op8kc1QHSlAeWfF0xfxQ7BjCQQM3Nz4mCUwn4eylZrNV6oapGU/3XNLAgV6MvMq1IoUc2rulg0KQghza3ktWeL+LKli1omyMDyq/WQ6WGrDOepA7vJrSKiHjSDjbx0o0bKgUZJUdRkJKz+Ja5e2EnyUqa7TCaR5flLvKkkLEkVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVyE2dNfxww60otoF+0blrj2tBSsmY1LxLJzakJNkHA=;
 b=rIQUKTqWbAhd78H5A7ud9r4YamwG0WCdHW1yWjBFSnb9HIQivImUmri5uzEJxKjh3hKPaMew3pGEdfIu+sT/kAQEYel9IjQVE46cPX8aWAukhOGj0Ti/wfnS6i9QCCLPqjBDdPkjFsg/HVJQCM2FZpr/nhXfC8wt8Fxe58tG+dlCmJkhNmBKEI3dpN24Cd3nefvCvMvCSiUmWm5MNvcXW+7U3eX9x6v5m3psC7X2D110rCN9J69brTUWgI7Kg4vs7UCPdOcHcpU/ZxzjGuvlkQ8oqPkcFDcUxh/NjeGeJyuumlXEjtjVBqDaTgRp3H9+0k08Hh2RB8JtNsVyEVkdmw==
Received: from GVX0EPF000013D4.SWEP280.PROD.OUTLOOK.COM (2603:10a6:144:1::10)
 by GV1PR10MB6708.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 06:56:25 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
 (2a01:111:f400:7e1f::205) by GVX0EPF000013D4.outlook.office365.com
 (2603:1026:900:2::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19 via Frontend
 Transport; Tue, 30 Aug 2022 06:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT026.mail.protection.outlook.com (10.152.0.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 06:56:24 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Tue, 30 Aug 2022 08:56:22 +0200
Received: from md3itd2c.ad001.siemens.net (144.145.220.66) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 30 Aug 2022 08:56:22 +0200
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Subject: [meta-virtualization][PATCH 1/2] k3s: fix the version of k3s
Date: Tue, 30 Aug 2022 08:55:29 +0200
Message-ID: <20220830065530.2418-1-vasileios.anagnostopoulos@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [144.145.220.66]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be54c547-9401-4445-bc57-08da8a54c126
X-MS-TrafficTypeDiagnostic: GV1PR10MB6708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qAQ/4zaEbUT615t89uOSqkpdJ5uTH7ufpUJgOKDDo3/d0qYZTuZuDx3PiMLfhubYI1vWdsBJ6M+MHccaOOq0UUw1FDwmi6dCoVmhjmdSsDUdyHXzCZPu/1O0UOsrTzfaYVSA373DsiQUgKgS0BEUh0qpMPlp+zFKjjnJHWOFHaeFQaq5I3MzdUygNMiKyNLA/t1ZCcd1U1NjEqSK+Z8vjvFNIZ6XGk9x4OYvbu9SNeiLwE7k20+cGz2ldHTDltxFa5a5thNidr8nsZoXOKh+txaviU48RlmNjrxctkvnua+2yi2Brtz2qAFNi6Dr7+JYnOWNOUDhLRPhBIyBw1YJzaL/WNaeteYaxgmMnn7b8d+4YIgPqI/597dYwkicLwz7Fbc4EIvLzcl6sIHchloRqUnOnFBqDq1Wc1ekh9pSS1BX9dPavx8dKx5RfKpefdMu0A33n9kJVK1osklfejROpE1hniaHHfOWSG6rBB/z5LPVYS6h/iL8yC65RQB3dvmCLzdcfRuXn6nYTrnnHcJV4gXAL6QA6VTdT94XkDsa7pXXxUxwZTqUdIg6hiUXRzBB67xAzG5ZCcmFJm+EV4rjr3ERk9Sfz1ENny05POJAhqK/9T2wP3CcoRFEd/6qXnprc5KMQEgb3vT15gkAvL5LHa13/0Eb+8tKsppSlSbqNKTM7YZ9dlYHBOWDf8NBq9HsuPyRhd30SRSevC9M0wZwQ/nBdk6v0WcxVawj9SKUrto3KGkGtsOik2ZJWXK4ETIN7sOwbIueiCFx+yK6pj5UtzzV6dAxLmBkTC9pRtkPguZpxTcgiRwLR3uNzT45GGoc
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(316002)(8676002)(70586007)(4326008)(478600001)(6916009)(40480700001)(82310400005)(40460700003)(8936002)(5660300002)(44832011)(356005)(70206006)(2906002)(82960400001)(81166007)(26005)(82740400003)(36756003)(86362001)(16526019)(186003)(336012)(47076005)(2616005)(1076003)(956004)(41300700001)(107886003)(83380400001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 06:56:24.7836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be54c547-9401-4445-bc57-08da8a54c126
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6708
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 06:56:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7579

When executing `k3s --version` the mentioned version
`k3s version dev (HEAD)`. The root cause is, that the BUILD_FLAGS
were not the expected ones. After that patch, the k3s is reporting
the correct version.

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens=
.com>
---
 recipes-containers/k3s/k3s_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index 34a19e8..66ff523 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -33,8 +33,8 @@ inherit cni_networking
 PACKAGECONFIG =3D ""
 PACKAGECONFIG[upx] =3D ",,upx-native"
 GO_IMPORT =3D "import"
-GO_BUILD_LDFLAGS =3D "-X github.com/rancher/k3s/pkg/version.Version=3D${PV=
} \
-                    -X github.com/rancher/k3s/pkg/version.GitCommit=3D${@d=
.getVar('SRCREV_k3s', d, 1)[:8]} \
+GO_BUILD_LDFLAGS =3D "-X github.com/k3s-io/k3s/pkg/version.Version=3D${PV}=
 \
+                    -X github.com/k3s-io/k3s/pkg/version.GitCommit=3D${@d.=
getVar('SRCREV_k3s', d, 1)[:8]} \
                     -w -s \
                    "
 BIN_PREFIX ?=3D "${exec_prefix}/local"
--=20
2.34.1


