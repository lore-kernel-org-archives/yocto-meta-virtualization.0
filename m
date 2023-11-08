Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50F0C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:38:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web11.10632.1699439901754939467
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 02:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=2ebs+yaH;
 spf=pass (domain: navimatix.de, ip: 40.107.21.56, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdVupGiHuhGc0ByXCnUHHHIhmE+bzb1EsG/1v8BTAxhsc1vgEtHu19g8nr95VQ9fEsjVN0vwcsZ7vPZ2f2HxEAbNtqn1vYufpPZeJcjEMyCPuPwq5RfxHihMF5lBH2/YNU4Rtv4aSU/uU/YnBtUyB/cCKulJ5WYaYAylt5NF94Ldvp2bSl8L0llHyjIvvo0TR9uQlXcyJGrjBnX7qE5RJm+knUtQ+cM47dhBUFJnif3yZeXTv7FwhkoulOfojigpDWbD5SbaQLbLsppECQ+8feUyHpAmDQcUskBpbG0R14hmeVhBfGgdykTxD1bFiHJWCLz3gXy6YR/vtD6aR3iQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC763HFPCZi+y7zVPvG5oJ2yaHut/2buVdx1ilCfobQ=;
 b=GZmP3P2wIpV6A+OM2b2zrOADUO2oXJFGzSSWPmZdo/i9G638QBzSjgjWKB7oaAMjaeKs80ey0IdnGe/s8zQAihS3zIN2dmE0EniM9sPiw0urD5cYcL4LepcAYMCAz7djbLm8gD1TlDaZAaxIKpNH4AoorbSw2wBQKIdUyO3cCEnseMKx5WnL6lHOAkc/C7yN3EIrFG7+CWYmVHupQBegVcaaF1MRrv4KUKXWJEvtV/tDwgKFG+EMOeaMoRGGC8jV/CZKVNFCiWvvRzvvVY7Avu+yYHtXD6MW2EkzsKdEGuzuqA9FL+dxdHMl8TzgcP/P0zat2wqKKjs1/w/evp/eig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC763HFPCZi+y7zVPvG5oJ2yaHut/2buVdx1ilCfobQ=;
 b=2ebs+yaHYzvQcUrcl7NZuHsBkYtKyx0Bml/ef5JGFAxW+6kKVNgKDJN7ivoQtXjAjnYI5pnRrQfxdbEf/al2lSgV7RFYW+MaB+sYsm028N212lMFAHa0j6aLDC6B4zaNRxbvdo5t0k/hUcBi8RYUihuxXoyROBoMu1f6EDt/Ox0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DB9PR01MB9440.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:360::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Wed, 8 Nov
 2023 10:38:17 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 10:38:17 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: meta-virtualization@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-virtualization][kirkstone] packagegroup-container: require ipv6 for podman
Date: Wed,  8 Nov 2023 11:36:29 +0100
Message-ID: <9ca767079c48373a2d3117217376b0ab5b2a3143.1699439788.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::18) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DB9PR01MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cb90eb-cc4f-412f-8a23-08dbe046d185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iReM1apQaHvdzoVJooQB2SeeBlkh9TUCVO/CMW0IjWqlOCkYPSlo70AxbqnNRhigYKWXgkLUxpTuCuV+udG4f0tKRlNQB99T+5KjDtbatWJsg+17Rdb6N+MaKcsTWUpWEFoTD+E4Dy6RP3sCBGger/Pyhu9ReBPXMQHU6p00GGm6pG614n+/ufLMwHz3llYLVlycezNvl5Y7uLHXUCEh/IESymHmb0fIJof9gnWlT+FVJNMQC5zLFql49bGIAuE8aWaegijFZD5yMYdNdZt8W4VKkp603TpMfT5AK63TDai9VfED4lkJRAsDuf11cMjvySibYcGfMZBl3Tym09FZCePwUAZIKA1pAsoeP9ZvCIaH4Pfd2Imny4fi3n6ed226+LEuHfIj8O+J+XeZzXLVzIx2KlNZ3RvaiU4FLfihWD8O7rK7WLkUsC01GGohIrE7fOXgf4UGc92xk/RHjAq1e6I0vj8U6do5FXtk2Di4kjrWui7Yf+25a1smlyY2iqe4qhN0wliFv+xY4zZulkx4FRilpo7+lOOV8t0gcN7rKxoBnYAHuEo/OpSgIEtu+AglBMes2ErKcIP6BmV2xTsO5NCit9lbnEMCJbHB1HZjnT+2Ewkwz71WQI1GXmvvSwTX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39840400004)(376002)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38350700005)(66946007)(66556008)(36756003)(38100700002)(6916009)(86362001)(316002)(66476007)(6506007)(52116002)(83380400001)(2906002)(26005)(6512007)(6666004)(66574015)(2616005)(107886003)(478600001)(5660300002)(4326008)(8936002)(41300700001)(6486002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?azaOv4J1URf9QSiVqyY+p6iYQDXyaRlxZjxieSrLVddRxfgFU/OaT4MfqKso?=
 =?us-ascii?Q?/evewDRiknNc3++72F6myV7L9Fej6bsm89lMAtPhMdiBm0JZLuYIEVDzwxJf?=
 =?us-ascii?Q?NC2kW6TWKEFBW5jhDdoTzMdw7UeAM1+kQZEq0ofu06w66T+j/eqWOBTz/Ivv?=
 =?us-ascii?Q?nNXsAs4UVy9lenbn0pRdTImGbQv1++bTkdyIIGFb4X+f928Mn0sPyb3WOSgx?=
 =?us-ascii?Q?LDwwJPGvXcIWv8l1wnpSWUYmuKYzA9A+l45YKNtEEbgm3W4LEss7kPskhPI2?=
 =?us-ascii?Q?LHd8psep9AmwzKOufdmWFKNkxGS9+yZ01MeTgtoVzltm2dxpWZ+OgqB7gXcr?=
 =?us-ascii?Q?3W+yRfpnF+CE1hS1DxT09IArFNAmNln81ay9WTuXkEQktf/dECqrqHVnevEu?=
 =?us-ascii?Q?7CF8tzyGVFCHqOLkiT7fSig1OuIRlkhdgaXRiNo7dO26DjyGsBbYDbUYjuFn?=
 =?us-ascii?Q?1091QHEOWLFHtw3jl/rbBW4Kppdh9M0dQGJ0tl9o104TA6kcWzXX1zBmeemS?=
 =?us-ascii?Q?6Jb6j4xPmm/5NdK8rTqG0ALQuKZZCS4/Mge0T5SlLFAeMAFjm/yP10iA5wxO?=
 =?us-ascii?Q?dvYysWps00ttzl85AFOIZQ+Ggsq+ISW+IGmiMXNILAtffOunfmbNp0wYQiKj?=
 =?us-ascii?Q?NoWtlSfrlDw3Swxfie0/ysySnTYhDGJhSNV/gvrCFkHaE4hN5JBhEifrLC8z?=
 =?us-ascii?Q?pTpq1nCcnNO7rSNjq0QnAAey2nq8Cc6Kgz30dQiG927OtGNj0jflaxfv5LeJ?=
 =?us-ascii?Q?Hzkueg7XVWAyFbGBGek+UUOIxJMVqnGJrElBrr8hc+A+FCMiC6zvX8BzwrTI?=
 =?us-ascii?Q?Vjxi4qJR+nH9JUGRUTQYxe5Wy9iCw3kvY8crGkBY2bD5MTguOvbovaTH33wR?=
 =?us-ascii?Q?LZBfanKu3NQEj9zoMC9rPtdi6VQ+rLMigWfO8FoOrT+24U9RVY2rXKi1oQ0j?=
 =?us-ascii?Q?AbrVFte/PoVVSvXwFalkoSDJGyNx5Hq2fwGAyiiu4QxFgssi+j5k3rnK3YJr?=
 =?us-ascii?Q?iugBhbYdu87ku0Ov3RZzoKVm0J8MSSlpkmrXv9CTWwXs/2E95jbX4TP3UP9w?=
 =?us-ascii?Q?Kn+fZAdRoWfnIdFaciRuMWlqg/82NqivMXeOp7tFkswimiOHKax1LwHZU0UK?=
 =?us-ascii?Q?f0j44e++4B/St3NN/H8z1OAUvJ6mRuW+nwjZtGgqGCVySes1SzsdkTMO6K2i?=
 =?us-ascii?Q?9Uec3J7U+Ris6x/bsoQmBPr3gWDdrTYkgQYfACe4Rfhy0Sl5aehWn7yaGIZ9?=
 =?us-ascii?Q?Bk7hMWX22GWXUu2bIHS/qg7EGSwd/mAGVGb157RTbzLT440mGSwFUGcyAhM3?=
 =?us-ascii?Q?qrvKxzubyTRrvZ7RtcLnT1wJvpHNKoL/dPY/Hun7tQv07ndFymCA6JPXbe/g?=
 =?us-ascii?Q?5u4TkeSQWlfyt7bsa1g33vi+QahscUS9ErdTVdanXqpFgopWZ8HChF6X85m8?=
 =?us-ascii?Q?LTbB4Hhvwaq/Wwge2pbuYJtY9Os6uv7bDAOmc7u31XEgaGyUXlpjwQPSYYlY?=
 =?us-ascii?Q?B1zsLSo93R7YUQDAHqzm8SeGK2AweQEoxn/OvtK7zi2MyoAxIKKwq9NfumVJ?=
 =?us-ascii?Q?1obr3HE8bcIZywQUrDhSITBZYccUMs0gFJ+CfOdMeJf+XgIS986lk7H3Hg/e?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cb90eb-cc4f-412f-8a23-08dbe046d185
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 10:38:17.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gn4L/T71A09hYiADVjWAv2vO4MS4OqANg82AV8sr/mlL/caz/YII31G3jcBF7IFb4EpNx72TXADxdw1gxBmZqlKU4a7Pkccpf/Xvu7d9yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9440
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Nov 2023 10:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8447

The recipe *podman* requires the distro feature *ipv6*. Using a distro
without it causes the build of *packagegroup-container* fails, even if
*packagegroup-podman* is not used:

    ERROR: Nothing RPROVIDES 'podman' (but /build/../work/layers-3rdparty/m=
eta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDE=
PENDS on or otherwise requires it)
    podman was skipped: missing required distro feature 'ipv6' (not in DIST=
RO_FEATURES)
    NOTE: Runtime target 'podman' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['podman']
    NOTE: Runtime target 'packagegroup-docker' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['packagegroup-docker', 'p=
odman']

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
Cherry-pick-of: 002aaf7029b8002acc69c9d4beea89039410d7cd
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes=
-core/packagegroups/packagegroup-container.bb
index 8d418e95..8309a086 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -9,7 +9,7 @@ PACKAGES =3D "\
     packagegroup-lxc \
     packagegroup-docker \
     packagegroup-oci \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp ipv6', \
                          'packagegroup-podman', '', d)} \
     packagegroup-containerd \
     "
--=20
2.34.1


