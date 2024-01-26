Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC32C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:31:56 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.104])
 by mx.groups.io with SMTP id smtpd.web11.99.1706290306783543479
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 09:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=jcQVBpGw;
 spf=pass (domain: ni.com, ip: 40.107.102.104, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHvjb/rTIaxozsjD+jAfFQyGCoCNgRXvbGtJwVrVZSKnM82m0YbUapzikgZZvWCj2T0XGGULDIaJOp+n+hHQdgLQLHOg5u/gqyFcjJiTn+svS6AKfZzxkDIicn+P7kjV2BP295K491pZAYozNq4xLyJou2XAg7hSa7QlzSZ/vRk804X8V24y8byGs7zq77gI1PUp15g3XPfTq/gt27MVlPkrfzRQ0N0DgqsxVfW4ZQYE2iCjICbU59dINPsQm3Y1kFlEq07S85uRXQzNUFsd4E9fcVQRve3/5ccHt5XLwAtHprh3hACIDrJO+g3TG4IykBFhO1SJr0H9Ch6BrgEVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6diH5rVRXOyuSDaff4aagMeOWyxu1cJ1eXI9DcItas4=;
 b=cTR7QXRohlW7v5xaBmZ7os/0+myeMzqiPgNFgi/6zZXTTLA8/1HJkNrAl4zzbPjjiac0KxNlV54bfiRhlrgG2TyFKeAnof8m+Bz7Ndz6HqAVHMWdqadT+rgha+UHNAXQAHd7fsZh3C0DNiCm5bo00/kSS49EeX0tMU0H+r4x9+tXZ1d50MPF6EniAZO/4qPfZ++OvERCdXONfBQwAvKe7Y51zvcJ2NxLGw7cshM/UHfAP2UMU9oBdJ9lUedQxn+qq/decAGGEDTK0cDio/HsaQWDiYQRjz0XP1iarUuvLtwtT1nTt2rJzk/Sv4C3q3GYlLteTdEGc4E3pw7a2diBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6diH5rVRXOyuSDaff4aagMeOWyxu1cJ1eXI9DcItas4=;
 b=jcQVBpGwQBu0yTmiyXeE+SQ/mNx+fLO8LvK5jdCAOSDU7UANlqHdArICKNcd3SA/kqXmnywUFc1JiHSyH3t9+Q9fzdYqu2gLBbhMA9h9U9wLJYNRF4Xx0sJegzxNKCAqt+15ZhOAjHQkHofRTuiSNa2yrlc+C6EXWE/rqwSiyDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5292.namprd04.prod.outlook.com (2603:10b6:5:107::25)
 by MW4PR04MB7313.namprd04.prod.outlook.com (2603:10b6:303:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 17:31:44 +0000
Received: from DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163]) by DM6PR04MB5292.namprd04.prod.outlook.com
 ([fe80::2ca6:7e51:b54d:c163%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 17:31:44 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
CC: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/3] qemu: upgrade bbappend to 8.%
Date: Fri, 26 Jan 2024 12:30:48 -0500
Message-ID: <20240126173050.1137474-2-alex.stewart@ni.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126173050.1137474-1-alex.stewart@ni.com>
References: <20240126173050.1137474-1-alex.stewart@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0131.namprd02.prod.outlook.com
 (2603:10b6:208:35::36) To DM6PR04MB5292.namprd04.prod.outlook.com
 (2603:10b6:5:107::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR04MB5292:EE_|MW4PR04MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bd2f16-a72a-4ad9-ece8-08dc1e94aa8c
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O9N7TS27hDBl+HL3lfjS0nGXq44OGNlWTdXG2b/N73FQjb8IKT9jNWoUO/Tobl+NFpntnVGvBzVAbFQ6W33lCe05yAtZe7SM1AnHW5LNxALW2ruKyfIQ1grp/+3ThxyzX5NaQFJTS1hvml6WPJXtaI9T/laAruG573nPVUmFLODKxTJfLqWBQXvcC7+7eMHJiABxh181vy9e0/fC4rrMSm+ooWvsdTqGtz9WlS7fHSrxAsRkwDEwSTGEV8XLEXRNn0B265Sy/FhEdJ4ICMmmKcBSyRLWOQmEvarUESk95bf5LkMHHF2RTIUP6sZ+J79SGQIm5YcVV8hAr9IZjueQ1yquO5WXwttwWRs3DzwztuSi3o3r7rEpP0frc/OYx87o3T/YgaztBXj4n96oNQ+VTnGnD+w2Am6G5p9hJt0Q3AdV8v5Y7O3zfpXEr9K6MjRb50q5mdZ9Xviz0kzfPRBrNLsPdNLRGNAscweTFOL4G54eEwjFJI8Lv6G+w3sm68kLewcsWcltfUcnyPS2iLoAih7uv64EVnmxKauPh/A8FvkHAJEv6zVQPQ2KYQFEIn3o
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5292.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4744005)(2906002)(38100700002)(5660300002)(44832011)(41300700001)(36756003)(6486002)(478600001)(6512007)(6506007)(1076003)(2616005)(83380400001)(8676002)(4326008)(8936002)(66476007)(66946007)(86362001)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z0VZC/ZXy8/Bn/o9nx6PGmZw3YMFzMbHnXqL+Ut8zOIZFsOEUnFq85RUt7qk?=
 =?us-ascii?Q?1kAUZtzAEKR+cZ7mH/9wkx+sUMMDhiPsWypnbtBdrHQ1Uemcr7dFs5m7xnEj?=
 =?us-ascii?Q?AK9JcHeciFfxwWAcNB1X5q5ixj6tRDdqneYLf1ymhDVansNmByHJOoKHfGMs?=
 =?us-ascii?Q?QVFv/aBnDh+dr6SGaNxXlOt1TNTAVqZWWIIu8aYlJuxCFhvS196+VzC4172E?=
 =?us-ascii?Q?NgvkuTougkyeeSBD1wENXDyHwpRt0z++vnkkIRYpK6DH+lFxgXIrKHbARP72?=
 =?us-ascii?Q?wzOZw1mFRpCATRU9Jh67dfjEuYQ2uDW12EGAfesEQdEs7BjHCzriKeT2vFEO?=
 =?us-ascii?Q?1IdL4stfclioR2cdaNZXcVMYpU7EwYj0aA9/9+i5BIO7LNmsPpOlxt9ptOlc?=
 =?us-ascii?Q?GTXyLlH4jL+7VPoMCSzd+JZ6Q2pHve5bOneAVTCO4u90kfHrOxr6J893KuRA?=
 =?us-ascii?Q?Gb4+9G6TI88AUPZRln9Bxf0WlWnDvGZC55XZhy5KxretqusN6izMUCApLujZ?=
 =?us-ascii?Q?tHKE6V9DuqY/5PSYJK5Vx+T8wSARA6XAo+4wGsvwHzw8gn7hLd7WFQ+JOHfN?=
 =?us-ascii?Q?v5J1WLBKgEpweL7AKyCWv3qk28MrytP/XD03LdnO/GNZd0Wn+JyVZ2PTmbKr?=
 =?us-ascii?Q?ouI1g5Ob2kuuY01zkrS3naksWxdqN4KjiwFMmOeozK4XV/hfnmweoxoNaqh3?=
 =?us-ascii?Q?HvQbWivVKQB9eF9HdpXPgPhCzJ1/A6zWWUbOC07cRf9BoY66CveFeXaLtYtL?=
 =?us-ascii?Q?fNH68ZcPS5I1NSgcar+7566kcuDi8nXE6eQppHzprWeTDvD9Li5Pj4DRfUsO?=
 =?us-ascii?Q?tNsXtrwviYHl2WAlPpHGY1CYPWtYGvGVrnhKlqF/vxEwVyiR5ASeOEspUMC/?=
 =?us-ascii?Q?XZJv4SeQ69ePlI+EeDY6fnWNUjGi8gfwZFDO3+9jNsGlW6WFEFm8KVI+Xfoh?=
 =?us-ascii?Q?8kFTuS/p4u80fmyApbqhmHat9FKc8/K4IbBoZWas0dXhhEdJoL1VF5Zth1Y8?=
 =?us-ascii?Q?lEc5mV7CTEyYCk7q67yo34Ml9ttG4u5r2mDLZFKsXaclfMX9eNymg4sB+uXg?=
 =?us-ascii?Q?iHSli7SW6cvxEv+T+CCNQQKOGuv98cRj+UH+CfLKpdnwacpNHZLkLSmOwJMA?=
 =?us-ascii?Q?DhvtaoCSdUIxPbffQksn8xXuU+maWSKrf+96ZMuBH0v53jtsGe/9Jvt+UHeh?=
 =?us-ascii?Q?AhuoJUsP8p2I6NzfDMSVVe28upuJjSKeoIyBzPDfmpmsJeUKLRKZHuIQgO/C?=
 =?us-ascii?Q?QCk63/Hr+9aaI75emvSK1ubAPZN+JbgKA7TE7Ala6A72c0bxylsSc1c4w764?=
 =?us-ascii?Q?7N9IIB46BA5Bp2tOJSI3dD6KEBB6yf9Jd+Vv6ZFzHMiJKSlxsqtqLxcVgC73?=
 =?us-ascii?Q?jtdROCadDBOKrlebi8zOhWAHSNEwGuqdQ6dcv9MFNAsI6A2ShVJ7ymgnxW51?=
 =?us-ascii?Q?ZHRUffK+oqjZKsnK+KpJY234/Z3PMdacNy4vsBVG3ud7C79I49e9cKm6wBsj?=
 =?us-ascii?Q?dhT6cc1clgoHqVhY52t1Zw/1jSi7qdw1hdZlcWEj7yTn4JaVvFwh0Pfg+VAP?=
 =?us-ascii?Q?/g3F6XN6VM0hGoG/sHfZ7da9tPseEj5RRUfaBSEpTVgy5vv2lrGsKlIz/1Za?=
 =?us-ascii?Q?fbEHPsSWCpGANB3MrP8yhew=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bd2f16-a72a-4ad9-ece8-08dc1e94aa8c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5292.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 17:31:44.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzlalSKyXURC0yyECJcTBJ7i1ggBEC/bDOWIBqRQoHwg/p784YP0ipLZhqICI+4/18HNJmePdK2bkgCyp6gtCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7313
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jan 2024 17:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8553

Compatibility with meta-virtualization nanbield.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 .../qemu/{qemu_7.%.bbappend =3D> qemu_8.%.bbappend}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/qemu/{qemu_7.%.bbappend =3D> qemu_8=
.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_7.%.bbappend b/meta-=
openstack/recipes-devtools/qemu/qemu_8.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-devtools/qemu/qemu_7.%.bbappend
rename to meta-openstack/recipes-devtools/qemu/qemu_8.%.bbappend
--=20
2.40.1


