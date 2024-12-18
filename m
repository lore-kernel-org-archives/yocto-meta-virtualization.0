Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416F6E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 09:21:54 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.138])
 by mx.groups.io with SMTP id smtpd.web10.101646.1734513710691924485
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 01:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector1 header.b=XUv3+vsL;
 spf=pass (domain: phytec.de, ip: 40.107.249.138, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wn+OmUjjdsIGSRtK7ToYCgybzw/RA/bZYPPSHFse+xqUBg4B+ezFo7XDeMN99ve7dkySXZ9/0kfSy+AtcMwRcWw0DeUU97kuJlO1dHbZv8rcSINWThnBchb56dFlLnYUBT1MvnCI2J+cU65YqbyAa4WuOJ8HZr6GW+1Hm95LCgt3YJdb3ATev/Xt99LR1JZOj3g+xTKtd8D8y6a107rVhoBuo0KZ2S4VWHwY32TTQ+k+ZIIoV8ofbj1OhB9cJpRYh2UVfWICVXYkegsMgLnwZqQpQb5jG5+dP8eqo3oj5EDjljHL6OECGPHPOeBtGklPRl6+oJpHbfAfcA2behWurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5/DxwizfmMHebYAlze1KG8zSHGDAcqvAmhUkXhZLoQ=;
 b=WWYAPZiTW1K3RoJK3hqeHB95epKu65GN8Yp5KinWINYwliZ+VM2TYHPFmD1zWub5srBcVkUHRoPraiRfz7UF6y2KniHdOQxDzXKVXRMKRJ8an+yMZ2FvStjgSs2ynFl+hsmPs0DatxggxpAAPi7qbbc7sJa1LPQhiZR9r5U+MuD5hh1pmNgiKVXdNLFG8Yr3iqfxhSbVVgWDFGdMEACElje2xgGzCjDnPxL3Ko16LqIFDrG4JGmBsUh/KbC0s3HDgX9ccCgKVOezi8SEnCsMe576aUYqahB4igUjp3gQTHPvtaRRtHSdVg4VL3/YC8qaiGiqftwup4N5+Zs08yEqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5/DxwizfmMHebYAlze1KG8zSHGDAcqvAmhUkXhZLoQ=;
 b=XUv3+vsLRL5fJHhw9cH4wiwqPs4SeajmShQJeyJR7Sbqkqoql+PY9g+l82ZgGineUP3TcrjI186iUXqP1RApczKdL5wkqHUK9N9Sg2+RyghSbZxTrtvn9PTQ/GwJNYRI05+3pYoX+ULv50HHNSviA46bKW/3nQxYv/yXJMRIXp3dOYJQzV5Fs/6bNomTjPkvJpHdWcYbUBWkkulY4XH362cR+KLlr67978K3IF7NbH2VZD0qoc/ylHmahTJ8b+zz988IoUXElQsK/G/wUVFU0UNdBTGz7D2l+WLhp+MBjXqc6G5MWmcTe897IHOM0xlTy77OSAlZwTK/Slgg8Lid4Q==
Received: from DUZPR01CA0241.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::24) by AM9P195MB1029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 09:21:46 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::7f) by DUZPR01CA0241.outlook.office365.com
 (2603:10a6:10:4b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 09:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 09:21:45 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 18 Dec
 2024 10:21:45 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 18 Dec
 2024 10:21:45 +0100
From: Leonard Anderweit <l.anderweit@phytec.de>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH][styhead][master] podman-compose: Add runtime dependencies
Date: Wed, 18 Dec 2024 10:21:34 +0100
Message-ID: <20241218092134.2506858-1-l.anderweit@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|AM9P195MB1029:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c11e9d0-d7bb-470e-61bc-08dd1f4564b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n+ehYlAYwpZu5QBu4sS1DKJZpQ5UBitOvDVYO5VssivuXx0A3TUzdB7/4eMO?=
 =?us-ascii?Q?6NknV58dXl8ABu0KY+CccHEJhI9XJKp8G3aYNcijEEmVJVVPlecaCmeKupFI?=
 =?us-ascii?Q?QgOOufQ7HU9K/zuRnka+ln2NXnUUWnBhBOmhN3jnbH5LIavNHutby2FWFerb?=
 =?us-ascii?Q?tQvu9QRdYpwWcRPOqIAnLcPkeDgkUO/NLLobGZZhZemUSKH/xWdnDY/LdXjn?=
 =?us-ascii?Q?z/SoGq8VutXyY7TefPnhlt/mgnr7k0I7bvogfxhvRypiEyVIe2t2WAjFBm/J?=
 =?us-ascii?Q?S6ryJHcuwhBpQK9Zk586vWDXZnIsLrPxpuv6kikvLF5fO+r3d/Jhc+7zXWdx?=
 =?us-ascii?Q?JD/3D8pNB40k9laa/ShQSUyvb9Z/pXumW1laCTv7icRzpwTxx0d0OQ6IImON?=
 =?us-ascii?Q?h6BY70LzKnhztg7SbdqmpWCHyknOHLhQ8orn6jgHbYxnmWdwtgyRbXuSo42B?=
 =?us-ascii?Q?65Rrt75QWdl4vrEw++lDtibimLyd1dAWrK5TmbCKMJ4Tqe8dTIJai+rD7/n2?=
 =?us-ascii?Q?kU7d/Hs9Rr4gJSZ2Lq4Z/lKgnCPyzGnwOnH57UoA7Vi0CS/Y9sC/gG7vdeCL?=
 =?us-ascii?Q?9w1qS7I6HyBfa3SjJZpunnqsTNfA/mhpdOrqYgUitHZZ1cvm1eAJ3u4iv00K?=
 =?us-ascii?Q?PlYv70t2/ygrkcZ0XH6y0iywSxmlyPeszGwNCE6RkHUwDpBZtQgdL5BF5Vh+?=
 =?us-ascii?Q?xY0SPVRlZNQGuSKOeo2jBYzWQOARXExS3g+CNUJJgB8Ah+tg/svj/mFGWqJn?=
 =?us-ascii?Q?Jwd4tKbEgnenxkGN3qv7AsdMNjaQCN2uwji481X9+pByQYxO+onOX6B5aVws?=
 =?us-ascii?Q?QgQb2ML9IlUxnS9Kkl1zdobdoENYBvWf9z9nzjmOS/rzas1bz7x+u9mvgEBh?=
 =?us-ascii?Q?4MMnwrB3n2CeIKt/nNFXyLuSASR6zQxgWWWj4z34mWVGy9JwS+YY5g1uJ1sf?=
 =?us-ascii?Q?lbxDhA+EgWB6NWLVsw/KIHncXRFxTcxqSEYY62kOsAUVd8/ooVBzVX+U+p7f?=
 =?us-ascii?Q?+WYTd6znoqjbrFt5ko4cEm1L8rKrereWKFB2JlrV2xjqOz1QO9JSzPxMCJW1?=
 =?us-ascii?Q?CoXOwf5tIF8PGqiJTUZw1ZyADmTdhy66L1BJ6Z2mTJz6di0DJxrA507P0vfG?=
 =?us-ascii?Q?4Q7M0/Q5NtQweW4XbcO9qI2W7Z9pN1+/B6wwgzmszlqt34sKRAMlyuFEUFEZ?=
 =?us-ascii?Q?A6H7JqCM3nerHxpanDUY+3woWamlVNvAAX/sHg499gzwAvsvSAsy4+Zr3+lu?=
 =?us-ascii?Q?CjyVzkPh4UuNxyXVVXdlFpiY9ow7fYseGo4AtkZ/+x/Drzsa0Ir5nmFk1rc4?=
 =?us-ascii?Q?I9Mf6VDvL5+ftkfSRHaRWfl285+8F7GGJK50u0jZW32PSdF+KqyE9IS/kgkD?=
 =?us-ascii?Q?QUeaRNNedZR2bTVH36bWAGpTXRhVq3VhGNLziamzWXML9iUg0Hj4sesF5FdG?=
 =?us-ascii?Q?I6/0XUxmnR+I66WogaoKE90BAMUCos/iUDvVci0pAwGyuVHrJEaJIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:21:45.8510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c11e9d0-d7bb-470e-61bc-08dd1f4564b5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1029
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Dec 2024 09:21:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9061

Add missing runtime dependencies on python modules asyncio, json and
getpass provided by unixadmin.
Sort the dependencies alphabetically while at it.

Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
---
 recipes-containers/podman-compose/podman-compose_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman-compose/podman-compose_git.bb b/reci=
pes-containers/podman-compose/podman-compose_git.bb
index 0ee171dc88ad..c76bf1c447b8 100644
--- a/recipes-containers/podman-compose/podman-compose_git.bb
+++ b/recipes-containers/podman-compose/podman-compose_git.bb
@@ -14,6 +14,9 @@ S =3D "${WORKDIR}/git"
 DEPENDS +=3D "python3-pyyaml-native"
=20
 RDEPENDS:${PN} +=3D "\
-    python3-pyyaml \
+    python3-asyncio \
     python3-dotenv \
+    python3-json \
+    python3-pyyaml \
+    python3-unixadmin \
 "
--=20
2.25.1


