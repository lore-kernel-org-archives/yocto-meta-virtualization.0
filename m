Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B66C3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 06:25:28 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.0])
 by mx.groups.io with SMTP id smtpd.web11.7069.1743661520199880539
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 23:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=btIJDusM;
 spf=pass (domain: axis.com, ip: 52.101.71.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKVaLo54aRf9dfKFhYbZGi0Gh3Y5zhqHVjkYpyQFWCcXNwTgYy053G5U4BZB20pxzfYghhiXWhUd6eixb1trobDuJk/LFnXW7SJYK8YokIr9bSexeSpgEqSz2eZKH/Q8vJv+/YSRmeWzFuK+MHmmdDKJOsiJxaAxDt3BdIesjP9FCdlEP+7Y1Gvp0T5Ddp85p3u5kziASn9A3Yqta6R12vviVHcZrsXuDnKg79Al8N+UK3ao4zHimTWSxAfkUSbl6DpGFzy51h6ObV5lWkVTeHy452geyewAVexOyyhFmt0HE+haRtTpRiQ3Q+s6vQC6BrbvrcLY9xk/J8BSx0qv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=le7BJVJnBSRGFDbpnmy2ThLDRm5Q4CfWWjzs69vFR5A=;
 b=H3Hm+xJuIPZPNpGr+RuJzK/s5OQ21rKt6CpJj053ioOrT5CFPz8RVr2U1APBG+Sv21VrSI+0oQHW367IsKOINhYKTw35kFEIF78dviDvEMT/B73cRbrGhsJ45HJbQ91OfT+TgvpNLAb47ONxeFmO41NZ0llOkoWv6kpbewTI1ROiI5qwk6W6L5tzOQ7vOXvBv8weM905Yjol8ZW0vihwZJoAXh8VzrEkXP43fYO8TulEYaNtBRso+5vNZJIrWPtjeRsmBF+wW8oiQLGyJ6mJrVImu7RPqYz+1NFx70NMEwxts4hIFvWCHLqKdepjSW8TT5gMnSKoY/tdOgsnQydsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le7BJVJnBSRGFDbpnmy2ThLDRm5Q4CfWWjzs69vFR5A=;
 b=btIJDusMvbw05lVZJ45C4U66QesLaGtSz5pNlooZge5/MacA4FXqWiz3O0jDutIkpzpIxxMDzMxFiVjjXqIiebuuoHIqOyZJLf4ou/iRsYK5adK4R28oMsu5xHCNuBCs3NvWZpV7Zw5Fjg/OB20J0AKwgDorM1BMdUE6BYVLwdo=
Received: from PAZP264CA0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::27)
 by AS8PR02MB9696.eurprd02.prod.outlook.com (2603:10a6:20b:5ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 06:25:14 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:102:237:cafe::1f) by PAZP264CA0194.outlook.office365.com
 (2603:10a6:102:237::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.42 via Frontend Transport; Thu,
 3 Apr 2025 06:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 06:25:14 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 08:25:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 3 Apr 2025 08:25:13 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C8E872AB
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  3 Apr 2025 08:25:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 5336PDGZ3088364
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 3 Apr 2025 08:25:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 5336PDnA3088363
	for meta-virtualization@lists.yoctoproject.org; Thu, 3 Apr 2025 08:25:13 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 2/2] diod: No need to pass systemddir via EXTRA_OEMAKE
Date: Thu, 3 Apr 2025 08:25:11 +0200
Message-ID: <20250403062511.3088323-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250403062511.3088323-1-pkj@axis.com>
References: <20250403062511.3088323-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|AS8PR02MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: a716a719-a2cb-47f5-82c1-08dd72784b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OEz97aulets1/TXg6r+D+TuQG+uDowu0VpWWTcvbVs0kRN+PjjKZ970Nfq4J?=
 =?us-ascii?Q?Dekix464wdOu6sUJ90hUapjXLwqSK3bqx1PKG6/noPJ8R8ydjDTTNhz2qfUG?=
 =?us-ascii?Q?Gs4xJixU/FZrZS8AgaKtDF/sGT1YCw9cshAcAj5lT3bwwNXOEKgXzRUCT8tV?=
 =?us-ascii?Q?PIgkBQAtwEWQIW8xG26SrxmmwTUwdLh8K4sMPNpj+mWMqaiEhdGKj9C/37vQ?=
 =?us-ascii?Q?3FBSkyZA06n+e4GINFytBTGJH2/qpYJn+Xj3y2vaYjr9xLHamTl2o8YHvzt0?=
 =?us-ascii?Q?dJks6rstg6C8e02VpWs2m9vu1RfqfGm5ZxGHkUzkMc31WbtVKbJiUa7JoXNm?=
 =?us-ascii?Q?PdpYMDHt1xxE4DJNJLi91O2cTVIUBAEEDViM3nxU6eo/07C91UGbJdkQBW4l?=
 =?us-ascii?Q?kff1L2Z2P/EJlQsgxSDdUPjvMC2S1SeYL8MgPbQuIDS/5n8gU9tq13oMm0fk?=
 =?us-ascii?Q?J1bNwCwlficvVbhog+ygNK8eWcAUdmeOZrgZ8jAUVkHyHTKC9zWdQeUpxdLE?=
 =?us-ascii?Q?tuAIOUs9SeBSRXTp/1IQ3U4Ffzl53LiHAtwKfwtf860aczKeqygY0vhYjbqb?=
 =?us-ascii?Q?M6YVYM2/nSSN2gDW6D5XFmN1hcX1Fhxqk5A8GctMJTQN7LVZW/FKkoco6iVo?=
 =?us-ascii?Q?tVsVvtAWBOYivR8zaOmUT05Uc5oH5nInKuPs9C8HfHNZqYxaYVVAo12Yee87?=
 =?us-ascii?Q?mnMNDmeStBp/FGnUiYtCvVqHMGLhNsSkleU09/lj8sgILjGFxdh0FTsMLBxA?=
 =?us-ascii?Q?wParM0Vh5ivrPt6oqSIBU1Y4U1CNjlCQGPYvFtuRkjlck5NmAvDQjDVkP9MO?=
 =?us-ascii?Q?jgsqg+gcrQFjofCbRydQfdwpVm/rBkmHqhLv4pV0b7ufX4h//eAtFcjPQBLB?=
 =?us-ascii?Q?gPKpZLvx7qxtT9j8xvu0VY8BwSQ/NEgkuRHDd3TLrEQjwKKzqM6FSAjS0lIZ?=
 =?us-ascii?Q?txe/U6Tt1EAsoC6sG/639k5Ia7jOqRSRIMdVieIeJZzZhU30PW3Vd02vP/UR?=
 =?us-ascii?Q?W/mfSeF3YBRVCBlc+lCzYv0fpZkgWHuW6wBqC2eoZG2EqHFqMoiY2ZEvA+E6?=
 =?us-ascii?Q?olq6JuzRBQ3I0Xq/qDVNf3tl0z2b3lg+EJL4edymJ7UtwSFQMTXRgH9Q32HJ?=
 =?us-ascii?Q?obbA8Cs6KhRRF4XASFCvgYFyN8IvdqrwIU6FPIavXMIVQb1spL6gbcOOFXgH?=
 =?us-ascii?Q?6qlksNMzx+fcyoVWxtdamK62GR0ksRK47Rh1kjhRjssthOJKamsO3JtkUbeE?=
 =?us-ascii?Q?JAuBIO97yaI5l3J2CmpZCIPykREmGV6o8QYGaaDl7qBxR31pLQVRV2NV9Jt1?=
 =?us-ascii?Q?dLV5zR0STJYBf8podDgYs+CfsMaGaf0cMFYW7IKsC5FaTYaQKkA9LU+OpsyH?=
 =?us-ascii?Q?+Hw8vwBsUW116JF6MjESUbc7PKvVI3+0nvTTpptqeqeLH8w6S9wBGOozF21H?=
 =?us-ascii?Q?EDQ5f9NwzyS8+IqeydCdJnTythe0MX9I0XpGA3znYdqiQL6lVrln34u1xmT9?=
 =?us-ascii?Q?xcrkYlHCRjwP5ENlSYy9KYOkgqCAUUg6sdR3?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:25:14.6331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a716a719-a2cb-47f5-82c1-08dd72784b9e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9696
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Apr 2025 06:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9198

Use of the systemddir variable was removed from the diod repository in
commit c081e851744d33025ff2626029a9ac2a5f9ccf8d.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-extended/diod/diod_1.0.24.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/d=
iod_1.0.24.bb
index a33b9a66..72a31a68 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -17,7 +17,6 @@ SRC_URI =3D "git://github.com/chaos/diod.git;protocol=3Dh=
ttps;branch=3Dmaster \
            "
 DEPENDS =3D "libcap ncurses lua"
=20
-EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
 EXTRA_OECONF =3D "--disable-auth \
                 --with-systemdsystemunitdir=3D${systemd_unitdir}/system"
=20

