Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621D8E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:08:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14554.1736327292270144213
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 01:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3103ddbe89=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087rN7O013028
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 8 Jan 2025 01:08:11 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp8bc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jan 2025 01:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXEpoaZyCW0QZiPLiDFCszZdRGf4TdEHaviWzG3fVxIO66Q2xvVb7vJmC+p6FFvedBxf2Nv7UrJkJcc8ZmaVi3InexXAM2LJduCM4+YqRh5X+P+RTalbk/ZzeAIAivaNZThNCOzje15Q3dGGtuHkVLYM5ChY8p4coTFg5QCGaIRMrKOJMb6J88YZ/dwD1K3cg2PNP9Z4Q436JN6B+yxwZVeogFKZ6pat0Een3W/fDL/57RJpNsJc+gq5lOyZUavCOlZzLY4YehbeokdLUIz3ROz0QXCjlPfNcqKLKcchWfl8bigQNTtDUDSU8SJ0uZwWm4rkCbKzArInj2vbpV9xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jHbpT13JWJh9dRWpORGXtKmUnHyJ5gwZrZybFDq3q8=;
 b=mElvZH2PUvuF0A2hnMkaNSRBhfp8XgmMJGTSaSa89+p9MViSzWoMC2V7l6vO7INOzZ2i3Xh4YCmA/YZSlHT02Y2nhM4jWE+iOXN+z3sUBv6NYoZ2MXhs1dJXxWR1htZ/7Xi44k6VW1tfUHBdgsLt3ASPrR12GgfKjgwNU99h3YiUzng5sAEbbFfY5jhlXZONvjZO+IpmxK2TzMSVqBN3KjJb+kUa4+MCSnnZuWr9IU3AgRXBvNEi0Ov46bou3QCO2jQXOHt4MPCDxLqIms7p9VgAvIBcqNcUsAkAs7SEG1ayONvP8/v4H3GOUrrQCaqGbVdTCaEuoAz1gqi4vtbPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 09:08:07 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 09:08:07 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] go-metalinter: deprecate and remove it from podman's DEPENDS
Date: Wed,  8 Jan 2025 01:07:54 -0800
Message-Id: <20250108090754.1858999-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b537e8d-219d-4b63-9a4e-08dd2fc3f773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2GTkI8ASd3LBtNP64kpIt56GvF9bxoCr81LOeOuiNBbgQFDj+0/JujqVqM3y?=
 =?us-ascii?Q?l8NiBccBa+UCOKSQ8K/X3lB1nDh2MnwgNGV4c0OtYAv2dhcpVWVJNw7VjoAt?=
 =?us-ascii?Q?fOl3tMK8v66YeEUgo/WzhPSbJ6WqR0V4d4evtXYWJmnvcOtKIaniZfD5vehv?=
 =?us-ascii?Q?PJs0QVcq4ywR43hoPnndblN5q+mburFpfOA1Rt4R4sVmPGCB6/Ylt+/OXtbm?=
 =?us-ascii?Q?wF8TWITtCZhS/mGAnVAZlr0RdEM+S72WKEMtwGp5OnMwE+JHfV8QBta++THP?=
 =?us-ascii?Q?ELn9Bk+v0mpELxCf9SVsPQpwL2/ZdgULWG4JUb888ZHuJvKtjW68j0/qT2qJ?=
 =?us-ascii?Q?xraOcLxr7o0YAkt+HnfsKsiULudwpax/zULDViCmeCobPNAnxsTBIJquvJUS?=
 =?us-ascii?Q?irBzvh8y0+wQIr7oL4CjQJgfb4gsrN0Nnr6quwbELj1VGpbGBARp85ESu6UL?=
 =?us-ascii?Q?yjsV57a5e49ArjfyEQ5wtDwPxX+HMmVfbRrCPALJKTT2UDYOsgziAKUFiRwo?=
 =?us-ascii?Q?nhTRP6iavUUiGJ66fY1YgxVA67Wr6Rsmg/qdfPUe4I7Whudz7PQ8QaDQasJN?=
 =?us-ascii?Q?mNiv4vrY8jLaDxOEAhWOgDd39uA33zpgTNKqCYnWOvaJwhURvEDwEgdim2pl?=
 =?us-ascii?Q?y6p7UOEz265JZKcwOnpfpQl6LnTyqkMGjqDnUr1ePQgzP1u5oaXLSx6t66QZ?=
 =?us-ascii?Q?gGbbk2DwSTPE8ziwZj1kqD0dQiDt9Ofa0tMiy9dSs16G87d0pDh+zo/jzkio?=
 =?us-ascii?Q?UNIKKRRU3XusMC9+e1w0FGcxUTtfB8mw1zUCV79XgeELwbpXmUU2BOsJLd8P?=
 =?us-ascii?Q?fJwIupIynxENqzteT8AAuwQ9kk9eRpb94NJ+6EGbrxQHvb8wBf3dIQTbxZzP?=
 =?us-ascii?Q?/vb+kcYlCDi4tLPKZGK8RFfBHbwowZ5u7xDDJ6x3Z16V3afMXNZGY2Kjd1cH?=
 =?us-ascii?Q?HAU8cahzLEXaSCLfQi79QTGQEKLggbBQl1Rv0nX6sG88nmgWYLyaGbqObbQi?=
 =?us-ascii?Q?ra+ASVmtRNpdwcvJXjW/30t3gN2RAstclnKsHOxp1//snujXfcCbhQowHopu?=
 =?us-ascii?Q?I0KLpd1SInLu5Z7jfebJvNGzbpN/lh6USL2ZOvoLOu1RnhadlmwIOeDvirMf?=
 =?us-ascii?Q?AMlmV6cuMYKZzXzxmxcIDO10FvYSjeQc1HnVAVeeSjQl6p72QAgxBZ6AI1Zo?=
 =?us-ascii?Q?vljVhCqpj5hEplbvF/yEjRJLCJgXFIrm/nw10qkSvCQn2FhPf52YMPmVzwj9?=
 =?us-ascii?Q?CEARnCilAt4UleTxERWbHvyYwqX+YHDNpz/0/fzdZdZAVECheGWZ37SUz//J?=
 =?us-ascii?Q?E5kfDBT1/rZLMjn4nehWvfrQCvsK1pgy98VYrHkOmuSYVfzpEEKIHe0w7YEE?=
 =?us-ascii?Q?jLhu2ggOsreONDPwG0WpRsHFoNnOMYew7mCsmQRBWAxJ2cLNyDo3QnKKrvLH?=
 =?us-ascii?Q?ixOtVgm93mwbdg6HB6dXVy3ge8pnmTJz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0gmiIy9jGrztc0fLdtufxJLJBEHxRJi2YVZzcQyy1IwQ9xTMORlxh+7Cvkii?=
 =?us-ascii?Q?/iVgl9wfgPK03YuLWoSCjSWjmAKKwUL1uas6bFviTTHcjNpb10m50fBnwzLe?=
 =?us-ascii?Q?LUIB17KzyxWXytGBZwxURAC+vBwqJsxgMcjsILQiU6mtHXR3G2xenAArNHKS?=
 =?us-ascii?Q?pw5kT6cDzNX9/Y/ZvVvFUkBweSpbCVpGS/0qszwpCQBUg/pcpp+8iGw71Tkh?=
 =?us-ascii?Q?S2eoOgrq01Qz99SkMQX3gnTMOE+DrQWtLcXwGqKuRaJ/KItaRIjPVqHUUsup?=
 =?us-ascii?Q?VmO7TCKAWG5wqBu5zmPVtG0yUh/cXyDpojzpXfST4k/2Ec91HuyjX8nKlXe5?=
 =?us-ascii?Q?UQ6C2ZTABxu8ygC5Wt9WZLu7mZolb73ylgK+P48Pj+awT52b4oe/xn0xGXMF?=
 =?us-ascii?Q?X1TtE+eh4M29JsWqZV23j1puMuLo4OTHVl7bYEkdqrHvZ6+Dng6tKEiRL3es?=
 =?us-ascii?Q?KHBANn1bXsOcCQjinTJrsWLbn0rhYo4MEXRVd1+ZIkeMT5ZFU8uQQQOjKL9n?=
 =?us-ascii?Q?NXDUvZpjli5Ur5U9imJ7hu6pzKDZTxTQ8hsXZc1pFwIztG/MgAR9Zj/yie+1?=
 =?us-ascii?Q?9em4XY6wszDCYUaTsB2lRCAH93MglLUVigpuiQtARiWzYUvAFt/AoR391Nht?=
 =?us-ascii?Q?4M4rvJ8YNEePF8ti4GT5Am+P0FXSMQHQOd2OfybQbBFSzEIqhCYpi51/FEtQ?=
 =?us-ascii?Q?Lmu4xqqL2NnKfDtwCvG90LC/GLbPhBgK4FE1+BUy1f/LaOVHARFX9gif/k4W?=
 =?us-ascii?Q?lV56kd4GX5rcw/baYWkZN2tZ2ysiKRTnxiePRPzZe2RqQWGdbc2cka1h3Jcq?=
 =?us-ascii?Q?Bg28mSeAYEQrPriZKT98fe2KMBl7vRsKyveBxOBOx8YzXHIBTr7jLVxhAdYw?=
 =?us-ascii?Q?viEH5V5Osau0DjbVXc78iPQbSEH4oQzU5GvLjh+4UUAXRUP3/p/Od+wG250p?=
 =?us-ascii?Q?9uPobJJYVJKFP6uoQKPYP3Mn/qQIK6w6gFq83mywcTapMQxSYkkTP6aLAy1X?=
 =?us-ascii?Q?ohnqJuhwYHKXIQA8uCCvCIaoDp35hKn9bfKDHap3NMGLPZ39vu22SnV8ph/s?=
 =?us-ascii?Q?tsuVTaAMwznZrcHpiqeh8amQFeB96IFCSSBFIy2ToM+pa+8LRC/CkI85wSAU?=
 =?us-ascii?Q?dUb2mqfzQkXtYjK7fopBV2uev0KEJMATsmvjhhsWHdEjyXZLxOyvrT2cRP8K?=
 =?us-ascii?Q?QwnU4bbvBs3kBiQDH7BZHRpv3ARSGgwDK5H4t4JxvFWSCaPEyJDW9eoiyUjo?=
 =?us-ascii?Q?7j6R00xR89ZQZ0JFAse1hkBE+2TawdY1w1txCirlXiCCi/BlLfrg13YhMuZy?=
 =?us-ascii?Q?Z5afPf8/5f7gZ8EpKE6udDENZRWsFF3NV8zH/PVVEfL6pQNdYA5BHbXhnTY9?=
 =?us-ascii?Q?xkTXuOpuLDVVfSqrZG1lSJ+zxrhO+SDFSXOtJUZ6l84ZkAGSsfogEbD64cn4?=
 =?us-ascii?Q?/3EKPXu461Skjiju1sS6QSZqSNaTj9Wz8zvkSr5vdlk9qn8OKxZo56t5XIMr?=
 =?us-ascii?Q?GNt8CgD9TWhOXBJaor0fA3hK62OEKpIMHktsAd9RKyb+rvD6aN5RTRKHpMMz?=
 =?us-ascii?Q?flVX810ppdx/FJeaclob06yWmpQKETbvEO+i6wi7+VmzeJMUh3G3T1yWGdLP?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b537e8d-219d-4b63-9a4e-08dd2fc3f773
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 09:08:07.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sr/ih/fs5PigFH6L/Rk3GRryc05d29jDnUNa8VwrGahQ3VbxAFUVL1ZC7KtwTraDrn8p8qA2yiTQo+SO8ErX/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677e407b cx=c_pps a=tpf30LWoD3GURU9dwhXxZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=xoc_Ag7IIGQGsiuXhdgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -LoJcZJ1iL5M0T5ddROXTHXo3u7ITjYW
X-Proofpoint-GUID: -LoJcZJ1iL5M0T5ddROXTHXo3u7ITjYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_01,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=627 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501080074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jan 2025 09:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9079

From: Chen Qi <Qi.Chen@windriver.com>

This package is pure source package and its only user is podman's
DEPENDS. The current podman does not need it to be built successfully.
So let's remove it from podman's DEPENDS and make it deprecated.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/podman/podman_git.bb  | 1 -
 recipes-devtools/go/go-metalinter_git.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 41bb419a..01644163 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -10,7 +10,6 @@ inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
 
 DEPENDS = " \
-    go-metalinter-native \
     gpgme \
     libseccomp \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-devtools/go/go-metalinter_git.bb
index def3d063..5adab2d6 100644
--- a/recipes-devtools/go/go-metalinter_git.bb
+++ b/recipes-devtools/go/go-metalinter_git.bb
@@ -16,6 +16,8 @@ PV = "0.0+git"
 
 S = "${WORKDIR}/git"
 
+inherit meta-virt-depreciated-warning
+
 do_install() {
 	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
 	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
-- 
2.25.1


