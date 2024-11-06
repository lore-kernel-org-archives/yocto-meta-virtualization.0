Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016ECD3176A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 01:11:52 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.59])
 by mx.groups.io with SMTP id smtpd.web10.36182.1730855503276056800
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 17:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=r1f+bOk9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGk4DhGo6zfVj/znv1mBMw5QqAnekdcbeVVWm77iM0yQ0tr6aegZdBlqe6PNxxKICXm5C3+eNm5Gzqy9Oi3wxnNTHaAx7cGnvvvBoONtpzZOxv+oNfXMEfxbrcHkaO6M7li/f9AWo/C1LCb+xEh2RaEAFSh5HwMGpt5w5UFC15OAsVDyUo3Doc0VSWqgKnsbv6QOJTeW0nupQophXzgGBezljUyWE1g4r1vgZa1JoYIMd8RPwqJS2bXA/0mNw2nGIoRfdwfVfqE+DC0Gy64VnUU0DTb5cMuAs/Dm3Rehb6xUoAOI27CzG4zy0GFozux+rdlxQzvkHikkos+NRCnMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dasauHssokluOcwgcsGQFe2scSRj/YR32LLVn3zN/vw=;
 b=tFoUSRpziBPfYXX1zkJ9dAk0kyazLDsi2dbrwMfj2Nn5pKN+wxuzwRF7QQnD2DwyEND9ELVGNhYCcM6tRv1pfCpeJzPttInFPD3r8GOZXFbHuk9CIMInSlmhzamMtaQ4FSRBr3gplk6jJXe9I2nyCWHVQsplCdgvKpV8DeDhRS2wgq05lIU8GRSRRoorfeZsD+ZTuwjshn8/ooPwC8SFpdg4BXq3nDVdj+LrADfcylp3FKTU407HDJqVdHOMIow93tsUgZLyyIh9LYeXiXDom8NaoOcFviAbff6o8RMmZ1NEke0LrpAcl+M4fWov7nyLOhwxnmES1+07F/ZZn5oEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dasauHssokluOcwgcsGQFe2scSRj/YR32LLVn3zN/vw=;
 b=r1f+bOk9+6jqZ1PkNQJKwPBxgLXjFX0YgWkYKXMQUhGRAO1ZoyoTNZ398Ey3vPe2Ee1vBmuKeod8PqjC3LSVwuh7Hi6XMmGGfv/1uLMRc9BWOZU7APv7o/2jCHBCO8/+viLVBZipxjU7eqGa+f5WcX0A7oG5fAjPDBpOd8ChagOdNs2MYPsTfaWqIcL5hwoKT/PkYvkJpJOhHpuupqlUzySJG7fbu03Hk5RW+7laIN1DtshHkhet5EczE/8miItals2yVgmejhtlpToNDM7zhkC4DwdbnwjtcOJT6gQsH2wp+XvSa9NP2LETyQnXgmDtCPL7GzxtQg0POTm3QfQtyA==
Received: from MN2PR19CA0009.namprd19.prod.outlook.com (2603:10b6:208:178::22)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Wed, 6 Nov
 2024 01:11:38 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::69) by MN2PR19CA0009.outlook.office365.com
 (2603:10b6:208:178::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Wed, 6 Nov 2024 01:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 01:11:37 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 18:11:29 -0700
From: <chris.laplante@agilent.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-virtualization][PATCH 2/2] app-container-curl: add space for IMAGE_INSTALL:append
Date: Tue, 5 Nov 2024 20:11:24 -0500
Message-ID: <20241106011124.3978621-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106011124.3978621-1-chris.laplante@agilent.com>
References: <20241106011124.3978621-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4471b9f0-81d9-47c8-08e1-08dcfdfff6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?72lW/HodTB6wwPlsmwXr71iTx3MU4uBINeRoY00GfGYnRwDw0BxgtR5xu9HM?=
 =?us-ascii?Q?p4LKG9G29+KbQuy+OTxc6yHXQ0nkGqfYaxKDVevi5iUNQmeXDJ+0B2CyfTFe?=
 =?us-ascii?Q?u/vrFXnGfTMxKUsYPY8FoHrtgfh4//vLBlBkWHACYsiQrg0vxj+5QnQFJ4Pe?=
 =?us-ascii?Q?kqfaL08uXJ87zaeUR0zO9Fxb++/ywBILtpcYlFCNWgYxrsnONiBWQ39hA/y7?=
 =?us-ascii?Q?W1tUYhkLC/J3dqo2P05zIpx32sv53D95CHKCLvaqPt58Nx0bspZTIIf3BPXA?=
 =?us-ascii?Q?2FpeAuaMZ5nS3c1m8ZXw20JsZe6KJvRzCt35aw77wnEgq1cxNCweBBp3f8l5?=
 =?us-ascii?Q?dBWtWo836kJJlzSxGlb96HHTXCk0IvaPvH0LxM3gu9w/TbMk41HjAh6cOyzb?=
 =?us-ascii?Q?TYNFnx60pfR7ehpzfPLIGYFCJzhIasKCMHQABD2T0FIBxn0YEvbqX6ECrk/l?=
 =?us-ascii?Q?6l+BJt3yj95J/uKQbXEtx7KzziioDDI1K3s/Be9kxDB2j+cxhMoTjJE0PnJA?=
 =?us-ascii?Q?elc9yHg3wimYh5j3T76dgba/rxWlN+FNNCTVOw5Ky78n0y21Yggxb7oR2VIS?=
 =?us-ascii?Q?eolmlEG+4zzSGhzy2zUqN131P3KNXwotIxTgivr66drhT+VEQ8zWTQi4/o9m?=
 =?us-ascii?Q?f0WjABj4kxg/N2+8FGl0DKIbzXcHdSWYMakx40nMYV8weWXpRU6yLQnBfbSp?=
 =?us-ascii?Q?hEmTMyz9bfXqzY0q9rQokgbq9VPDagsPAngvKt2AQVKKtw6pnLuD3tMP3h5B?=
 =?us-ascii?Q?Koir2qcfyD9W5VZ+j6pMaF2UoJ4KevBHiuv5rCkg7CzHnTJfBSLo38XptOMB?=
 =?us-ascii?Q?f4tpxVggsk0qGsG9CM/yaXNa2zcCNBh7xxLnzTte+lQ/Rn8FfUXnVxg2RgKa?=
 =?us-ascii?Q?63J4qoV6eRC7bV7fDj57clr7yoxH3J/w7dWxgeX0CFNq/S4nd0rNNj+pd+AM?=
 =?us-ascii?Q?2em5gwqRR4gUpdeugclbEec22Kl309zNASLMbuJqgZQr++GpJA4GMcLEoSN0?=
 =?us-ascii?Q?fTyLTULQEmlkSFjKSBHrz5LiCiOfIIf1R26USMF3L1/XdkyOSN3ODoyxi//l?=
 =?us-ascii?Q?s8bqpaH/x8Ew5SvAu/Q10iYIavkv1ubxTu8+gQZA0rG+D2yAaWUZmwL9slqd?=
 =?us-ascii?Q?n7yEogqZXSMUDCt7tUTINUbRydpls0N+vXKJLYjcSadiiHjvnOQI3hKbSfe5?=
 =?us-ascii?Q?ar8BnzhHsE7VJHGz8x3mkz17Utf0Mtxteodf9z4zcnhQkeepI5Aab67rgF0f?=
 =?us-ascii?Q?gQ4tWkJg9ZHs02cKrzIPNBQKj3Y7XaGzrhVAOXeTBzA88EGnXNJVb2S3DjPS?=
 =?us-ascii?Q?RZr1LeVe+AcbBWjob7iDeh5IBEFhDfspAUxMAhieJVU+uejooIqTXHn/I0jq?=
 =?us-ascii?Q?bxvmTuXp4IDUCU+w5KAsyh+MluIaiFUwFY2sP/wMuuCwX2eVxg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:11:37.8399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4471b9f0-81d9-47c8-08e1-08dcfdfff6db
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Nov 2024 01:11:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8959

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 recipes-demo/images/app-container-curl.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-demo/images/app-container-curl.bb b/recipes-demo/image=
s/app-container-curl.bb
index 51451300..ddeb3022 100644
--- a/recipes-demo/images/app-container-curl.bb
+++ b/recipes-demo/images/app-container-curl.bb
@@ -43,4 +43,4 @@ OCI_IMAGE_TAG =3D "easy"
 OCI_IMAGE_ENTRYPOINT_ARGS =3D "http://localhost:80"
 CONTAINER_SHELL =3D "busybox"
=20
-IMAGE_INSTALL:append =3D "curl"
+IMAGE_INSTALL:append =3D " curl"
--=20
2.43.0


