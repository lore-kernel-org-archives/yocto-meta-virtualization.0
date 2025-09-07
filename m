Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514B0CA1013
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 10:59:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.web10.16878.1757242784076140789
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Sep 2025 03:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Wcq2YFgu;
 spf=pass (domain: axis.com, ip: 52.101.66.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfLwtUSXtPycxhiB/kB9cyrQqdY0Qe923RxDQXosaa6oG79Uh5AxnK7pdN+H+yrXOWizxigfBGyl6N2cT4b5BuqVlcey68YRQUaMxtpbvTilxS0hXkZuqAPnKpa92n8QQ3ZJeINRCXxnJOwi+nid5cc8I/LUilie9AM9ljwW6SXazgXDiW5nWBQdUj20MqUO1SzBVJbNzlGA7wYqJdX0/EHySDomS5OabMXKLPWOYIxDMay4U/ok4KAFhnkxyUN1D50Q1XDLvMT0mDI7XtYb4aSNTMQZGaKqDFgclM3bYcZmjDRhbWSDN2DuG+4qhobYvgJfVgqAKYKrUPbFwzhUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSwhsNwlvxx7OcmDINVbfSyJZQnzXjWJYj0h6rmqKy4=;
 b=e4R28xJbpqkX+UGDwWiIpHbgXlzy87jiwJv42M+xklBJLxogfwRrTtSnMMSUBmAJ0sdO9wOwLiAmOEHvOWMEoWlk94sPDcJBEOv3FCQPOEWfn8Bh4RMa7TISyUMMEEFJ7pjywaE8Y3vfOMJqRoQr7gPLi1ySh+HpajzC2WeF9+ehzSTwRP/Ov/CYLzllc4RFQvGF6PsKIlM614Kg+UzV6BZB8IAWxQeiEw9sMsRqT0VXHffGW/TjQzft/9JpvThK0RATZpxu0ra/bWqIrH0PpKHyTh+HFL0kpVPNr+/Q1OecUtrmyea1/o7TKnlDIkRwcnMZ9BzEhusMscAGgpcFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSwhsNwlvxx7OcmDINVbfSyJZQnzXjWJYj0h6rmqKy4=;
 b=Wcq2YFguyhIzXgJcVTuChaiBn9lITHokjFLpQEyxx3zwZ0ZsqSWz4bZp030UryiP8p+YQ/E5rMAk9eZPhjbQuX6ihI8Bf69LQ0eTG37NNIhGJ4Wrp7XPUcVoH3LUelz/Kp/svuJTD2TvY/t14KY+URE0wu8D+Ff/woPrmNdinXw=
Received: from DB8P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::35)
 by PAVPR02MB9985.eurprd02.prod.outlook.com (2603:10a6:102:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Sun, 7 Sep
 2025 10:59:40 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::49) by DB8P191CA0025.outlook.office365.com
 (2603:10a6:10:130::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Sun,
 7 Sep 2025 10:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Sun, 7 Sep 2025 10:59:39 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sun, 7 Sep
 2025 12:59:39 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Sun, 7 Sep
 2025 12:59:39 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 7 Sep 2025 12:59:39 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F0C8B18A2
	for <meta-virtualization@lists.yoctoproject.org>; Sun,  7 Sep 2025 12:59:38 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id A9E2F121A2E; Sun,  7 Sep 2025 12:59:38 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] containerd: Remove leading "v" from PV
Date: Sun, 7 Sep 2025 12:59:26 +0200
Message-ID: <20250907105926.1650992-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|PAVPR02MB9985:EE_
X-MS-Office365-Filtering-Correlation-Id: f95af1fe-f06e-4e59-0135-08ddedfda456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RV4UHFjFWhQyeHLHvja8cXaAjoMzQ8Cwes8jKcnSIprZKaftBrhFH/Ikek4Z?=
 =?us-ascii?Q?z104IN/vHEmfYHXyMPjRX3l7kTQd314drf4CaeAiiaYd9TKQ6c8VXO5a/xJP?=
 =?us-ascii?Q?I3s57LlrDNeSFUkb/jHJdkYHiSobpnOkFwcHSW9S2k1XNJQczxDmo53eXETt?=
 =?us-ascii?Q?isCAUFTqFeuBidBo1DeUTun6Xxk8KoZauIGnQwoGroQKidHrczGwP5M6K86C?=
 =?us-ascii?Q?bdurEkViB8DmyGUjPgVn9uPoaYQtu/4fc7LgKI+6S1unnDsSzBdrF8FIaYGD?=
 =?us-ascii?Q?TlQ6tP0sUwUDOk3ZgZ6m7tYP2F7qtM2/pKbfCUwyUnna4jZE1PiDoz959R8Z?=
 =?us-ascii?Q?7oTna4uGwJ/m/dcLAIN1x12NJKRx6DNgR8M6CqqlSdZE15RNwnGcLyje+uau?=
 =?us-ascii?Q?is7AJ7Tfd608Ncm+D9aluprFItJTM5EGNfIP5rABuO9Xqxas9UQ60DxHF8X9?=
 =?us-ascii?Q?3kIDSW3KEn8b0CI9eRDpaepZKFOrxFEhfDbFNnxNCNyXPVpGdV4X99pSkx/u?=
 =?us-ascii?Q?Op0inj3iFiAqjQDedkKnMtrGXqwPKSGYibwMKIdcK8ltnfLTWlnqCpwR248T?=
 =?us-ascii?Q?bS3rc8S9HXUzf5j0s8gbt+92rLgXbzmvntLLgcQ/t4udv9MTbjlZo7I/gqDY?=
 =?us-ascii?Q?yqK9XOfxBSyIhKkhdLt7+gm/IurDdevI40HtM0iIak/M5I+zy5PfUJWPF5c+?=
 =?us-ascii?Q?sqH9vO0y0ZvXykBdW8b3vr1cP9IJnCZTKaUfbR3qP+MntVkwi/NSqS4gCJAj?=
 =?us-ascii?Q?XdZPloBCkA0pEg8wgI8gLfZYy5OsvIeXq1Nw2CX4XOQo7+7Cj2iIgyyoY74l?=
 =?us-ascii?Q?jwNghrd7ODSXMgDKxImd7BHLD00OI3Pb3J/ctBbcFFaklLyCsspdFEM25Zw8?=
 =?us-ascii?Q?dzrH4nbYB2SQewXMIXurOWDPu3eZzvqjjLLwTsuJuSews6hdaXdFZ5VTQbXo?=
 =?us-ascii?Q?UZZKCOLai4B6jpiWvxaXH7X+nA972vPN6YQ1ZbwaGERQGQNjuKbE0/1KP0GI?=
 =?us-ascii?Q?XobRymZDThW/N3toH1eXEy2rT35cOUHcCHr1Hv5oBi2O7Y6Gx4pqpSulx8cI?=
 =?us-ascii?Q?GEWh3aVpHdtpxLPhi9adX5YAp0MrbZCx9JaeH+zPoCAxelCU3pvAF5q+xTEv?=
 =?us-ascii?Q?97H2L4l9Ujall4/eYlmrYj5N0PTBb7XXr12KaicRc3/mZbhGPtPAfvcmpUjd?=
 =?us-ascii?Q?hpU8WqGiKHJPwo47FDEju3qj5ESch6Vy8rqjsPN9Gzn11coBvOHfvdbOSva3?=
 =?us-ascii?Q?h5rFeEZocvZ+YGv8zO+L7xmdRDY3dzhmj3VVVkeLrajHPxJTQ7G2c3n8hFHi?=
 =?us-ascii?Q?AjBGrFID76yFdQp+lHBcJFQK/yqBtuat8yIZkDAPC+4EoBbHEZMF+thIySVB?=
 =?us-ascii?Q?PqvlRw1RcX5J3fQAnSz5+Dkev20v5JOvlxbckECPRbowJDX4K8S6FSJxvfJS?=
 =?us-ascii?Q?9SbrbdNNfw+RQykXk0rdq9MP4ykGasNEpiL5joDoESRO8aYIPFyYmT25tJDW?=
 =?us-ascii?Q?hTOgPJ/AmFI+P4X74kUV7Ee0r4EPsLF4w3zW?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2025 10:59:39.5541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f95af1fe-f06e-4e59-0135-08ddedfda456
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9985
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Sep 2025 10:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9377

The leading "v" in the version otherwise makes its way into, e.g., the
SBOM.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

There are another 30 recipes in meta-virtualization that have a leading
"v" in their versions, but this is the only one of them that we use.
I can send patches for the others as well if you want.

 recipes-containers/containerd/containerd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-cont=
ainers/containerd/containerd_git.bb
index bae86146..c46d1673 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "git://github.com/containerd/containerd;branc=
h=3Drelease/2.1;protocol=3Dht
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1269f40c0d099c21a871163984590d8=
9"
=20
-CONTAINERD_VERSION =3D "v2.1.4"
+CONTAINERD_VERSION =3D "2.1.4"
=20
 # EXTRA_OEMAKE +=3D "GODEBUG=3D1"
=20

