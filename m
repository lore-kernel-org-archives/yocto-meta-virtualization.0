Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE14C5AE59
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 03:51:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13140.1748490692803046396
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 May 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82441521c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3i6Za014232
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b14xv4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juk65Lg6GEFhMc40QePJne8jKnFd579U3GNb6GjL1fU0GvNDkZzhHjYZ8UGh2RpP4fP+FX7gFS5XWd3Orx5Ljspu3ysJd1NQQoB1cDdUNjOfY0sSmU8AHDTaNd5ZT8jrc4dY29cCyZlSokdJdIsQDGu9x/07UemC+uo7Ciwm1n1Lqt5l54p6jloLyg4+3Wwolis1EuuJhoc62FOZjorOKKnBDqoaBEDTUdbdoHofc9lGAC6hlePNf1lHoeErFAXe8bzFeLjuMfGgCdS5yfMaxXx/nyKlicbrZTOB5PXmJXSy3OuXrImQ4M13B6ajajP+SUQw1e4Fvof+4SyapIGIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjy+QEB4QNahxztIwgFCnw0Pl6hqMey9I0Fey2K9axk=;
 b=vOv1u3VMBkbbbZysram/oytDKhVCXbSul6P9cwR6GiMXo+Zc+/7qZT+FV6E5bd9g+nWrdKC2++zDxxgSMiauw50KdLRTIUr452vkkLURti2iRX7nyKp0TpGTcis1HuWj3/u6+h0PP4gVoGhyqAb92HPCliO8Ga+w3raFEnHOOLhObhLIZmJZ3/1MesfL76iNd4yHA/h0DNO9auMuZXF4LSUAFnzFrKQtZJ+KZbZbUxVJVzLKcKSSggWbYyGU54nVgv9ITrGc+UznT+yE4wWbvgA2iid/ZLJNRp2qUeiWyA/2jsQ6ihnLPftw1bDrDCp9yTWLbGEjFOpyRi51lxL4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 03:51:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 03:51:29 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][walnascar][PATCH 3/3]  docker-distribution: fix build for 386
Date: Thu, 29 May 2025 11:51:10 +0800
Message-Id: <20250529035110.1881797-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529035110.1881797-1-Qi.Chen@windriver.com>
References: <20250529035110.1881797-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 7682257f-993a-4677-ba49-08dd9e6417ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wt6+/FpakAq8aOTsuirTysAyB+9MyLWjMHr2/s4ckrqKJ4JEc5DArGOovH0L?=
 =?us-ascii?Q?0F+WGy6lRisLBgJgdRgunveqnyd9hJJuGwhmM49FeKPJ4qpH4mPgmfJOydA8?=
 =?us-ascii?Q?M+7oxupyhTblHCxbioMCM2yLwtgws+rH/eN9ZRR/hC/4btw4ZyY8WUoGKaNr?=
 =?us-ascii?Q?TKHFNxanXKVVyyIUZ0yKE08ryX7pmP7j84TJoi8lAmucZ4UIAOcuPV7i8l+z?=
 =?us-ascii?Q?BZ8lT1K2CWEl9KYckVH1j1Jo1uQOSiw4xEHi3IFie/kJOTckbiotBjUwzPur?=
 =?us-ascii?Q?vfVVp8mi07bR2AWuNhBahO0iTgfHkM2lP1eZyNHJeaH8RNiz3DbTGAwBDb3l?=
 =?us-ascii?Q?T1AmQxVWc62lP75rSY7iCva/ecG5FNgTep6e/XYKkdgVxzuSibLcplGvQ5pd?=
 =?us-ascii?Q?Dwi/J9+lM4R4EllmKpMWJ2SuB2/5V8rAMjbQdeu4dNnZefS8/0QbFdyMi5YY?=
 =?us-ascii?Q?QIyRts8IwUJg6QKEgYTBYXpTNGURu52HBKBOH94v3siTKegNy6rXEk3TgoZq?=
 =?us-ascii?Q?xms6Pqomg+xQy+2bZ4596lfSBi0VmGNZepYvku6Jo6TqmBXtf5O280wMn4on?=
 =?us-ascii?Q?dVlA8DtYdBB0xOc7eoP/mNxaf2nT3+hFBXgY0CBQU+lsTm0qKqqT1GBDfGvY?=
 =?us-ascii?Q?QYGdZluQuWLGx0RxRdUhgMYeIZ+N0M4UBrTkayTudFgU+W2dUvX47K227uSG?=
 =?us-ascii?Q?SybSDPztsLLaLAVGM41DvSbTDVx38ARIgwyt8LHnpCEooCaaSf3rL1qjZdEq?=
 =?us-ascii?Q?woJiID4h+nLFOVeaq3vzDfjOxqDxSyjcbNsoIYULK+Bs0v5gEknX85pkpnZW?=
 =?us-ascii?Q?f8O1BCp0GuM8zOL8KnAykNH/eYgQez4Xx8tV3gAeV+pLlFqg24bCkZWVegni?=
 =?us-ascii?Q?2VaORqxzS90OQaXz8PCb12qa5/7QzIznoS0aH/PEW8oy4maMKxRmnYNEJtVw?=
 =?us-ascii?Q?dbGgY07PfKf7hKQFaU7iU3Vsi8bKasY4O4emEp7jcUEwk+222bX8rb4HS1jd?=
 =?us-ascii?Q?keqi4TvYEYb8RHxdMlnBZ8SwEzjW4Db06ONICL001JBJs82p1WTTmQZ8Gl0M?=
 =?us-ascii?Q?aHgv7DgotxzBLyNtS6dG+VwgTHU3N7ZYFU3XCMEWFv4r9s29jxogOq56vJQq?=
 =?us-ascii?Q?6WEOpMZhYBcXwIENq5W24fWkSjgeYr0Yx4F22VPssywoapiRkdjk3M80qN0l?=
 =?us-ascii?Q?1ZydzxpNRuAkyRUuki89YOkpQ87Tdl7tGdoiksSYOPUjo4iaPzcJafaUoDkW?=
 =?us-ascii?Q?4MsoQYHvbpwTkdxp2jRTmRyD6Cd1aLHY5ZAbxb2CmHrcdPIXVYkH4Zwn3Ct8?=
 =?us-ascii?Q?43RdC2nRqtmwv6duXmbaHjIFp1zHnLuREBGNpBqNUUjt0eBjM081jodmnTrQ?=
 =?us-ascii?Q?5D/CdQB+DkDSEAVJX38j6YQILTZj+6pgDl2WeKQBgG4JR6WZ67gev9o3qw1Z?=
 =?us-ascii?Q?3PX/O1dgJ2WrjKgCUcd4ZXzCQc/iacDJz02b9psODOnQgu/7l9anfJeC/M7P?=
 =?us-ascii?Q?12HIeEqXq/4Mml8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Vkw6aFvN9qUOsYzwHNfhzQXxpLGc7uuK+ZzioETn54XonN9zaf57oRbGBk/?=
 =?us-ascii?Q?Rcjll/fZBMy5ZzjP/Sh62SgNRvpRPhSBKFyUJbBVEi4hCqbVbpvCcuWKYnYh?=
 =?us-ascii?Q?vWrxwQ+EdJM0O93EKZE4tcPBSsaf5kjZWhwYvKzV9d7dKJ6bs73rhKMZiLEr?=
 =?us-ascii?Q?MeBpRlnl3Ou18c2LEHZMx3yIoaznYMwaD9bucBCq/V4Jvq4gRWFlAYxy6d9H?=
 =?us-ascii?Q?9EzliKLJsWj7rXdy+S8/WJ2YV9hveuFjLvDcDchmmiAB762sp8MMYJt0LGbO?=
 =?us-ascii?Q?YqE+xDD3pT0RhrCXOGrvPZh7rvAeXxobN8AkVvl6IvW2/hkqnfvwBM5Cd/Cp?=
 =?us-ascii?Q?EQ/QyK4IIh+ioumhktnsVZnDy/JVE1916cZ1vWNN5O9Tiyd2vR3fBP8Pp0xf?=
 =?us-ascii?Q?flFVA9tzAtiZ8roPQg5Y5iNm8rNsKbwQiQwW9lzWbpAod+kR8O5Dj1dHwC9/?=
 =?us-ascii?Q?WaClCwd1QUzeWCSOuKhQjpBDQVVa1DFvXNGRmcM/xaQxa2+jDmmZxLYgRmKL?=
 =?us-ascii?Q?Rvefbb/KlIfKqH+AXmY7z5ZpXoWGhejuq7N98EmWz7LrQ0petWigd+1awZTG?=
 =?us-ascii?Q?dBjg/GC9VV+A6hQmNbYwi/F+kGSjSnXwXmgL0cZfSnyl+QGO6Md15Gt4ynFe?=
 =?us-ascii?Q?OwTF0MWmClV5FJ6BiOmULR1lxz7b91fJUVC7galPZS9zuuwJcVvfe0hLBbN9?=
 =?us-ascii?Q?Ryx83DsGArhr4TD//1l9zH0QK92pQ2saOMaQmUtnxXTJlXRnx8S49vzqKOAw?=
 =?us-ascii?Q?PvL3JwFXJnK5BZ/S0ytk89V3qxeO7qrp5J0zbYl3lwxqSJtzw9b4EaD0PiJM?=
 =?us-ascii?Q?Tk+v2aQm0N7i3RoELJEYrVC4EcYY10vtrIZfQdR5VPKubUJG7FlxvedJiE2Y?=
 =?us-ascii?Q?t8GsoBWaxIK+6pjNmXSPFTXhSNlfITm05EKOTun6eNylDFsXw2r3bEY0P9TS?=
 =?us-ascii?Q?FG5X0MhECQhINVXb/cnEsG0CzJ2Cur0jkY1jikBYaAZO5ISq//EbrOtf1BHN?=
 =?us-ascii?Q?XC3J5Jk/Q4dlWbN59HmFAkBXmc90yuUFqmhdOkep589Ieanq0IUNhQVom6Ka?=
 =?us-ascii?Q?1yC/EdeOEM2DbDXymCUODyT8ohlPr5eWT7Z3h8BiGlC0yP6x8z4V68Sj6/Zi?=
 =?us-ascii?Q?UHwnHK+H1WDybs5AH0z1Xq37XZQRk8is3AWtJCVYmvfUM6wR7I1MWdG/UL4b?=
 =?us-ascii?Q?Q4MUTIajJJaRM7E8P5p+J8uA+SnNKmVOtlqY1xgnBIlJCDjB8+TuD8f0f3i2?=
 =?us-ascii?Q?V31Lg4bY3qLdMHPxIQFCDNv76amVppvPKOCehQk3CbqHIOatxlvyibOCV61s?=
 =?us-ascii?Q?4S9IiRUX4sS/HiFbNj7td9UUIhDUTZE+Fobe3VrEw1k9CvGXpomWARTBqap/?=
 =?us-ascii?Q?kY2xAdNEMnFhEnZrLesIn8yxWNTtawm2kd2ZUfGflYG0hr8Ib8vzE8KMG5AC?=
 =?us-ascii?Q?3a4RKO8J9UfJqsPCVtyo8hZzgItiCmBYk9iII2YRiTm0Bot42fwQtfY4RUTX?=
 =?us-ascii?Q?9NXQfy4cYTEUltkq5pxtRNdSf7FABMV/z0/9s3KVOi2H2f8Q7Nz19NkjAOUh?=
 =?us-ascii?Q?bL+OHVlLlF6LEpzko9jPw/90S7fVVgVaQ4ih+lah?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7682257f-993a-4677-ba49-08dd9e6417ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:51:29.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aan45R+t0G3Iob21z6JRRRoHAmVlJpKrxJ87R03/nWPnh8jg2Io6gMqphaKhmHPPNnzZ508ZrP4mnfJdbkOmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-ORIG-GUID: wAhqxYwSOoGAO3u6No9uYYl-imnapGvV
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=6837d9c4 cx=c_pps a=EAmgx7X/BcpSCz1KBN8fIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=uLPss6bM1OIA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=DLUD8nuh05Bh33DR9gYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wAhqxYwSOoGAO3u6No9uYYl-imnapGvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAzNCBTYWx0ZWRfX8YyJ2y96dhTh fWCW1//GirN7FJc9pC/V5E4iVoR783ee+JRqL3KBXOk78XTro1q30O9uvYZPm7c/6OlcxaIkwK7 YuzB6xMihpo0QueLpcaHow7OAkZUA80iAFbN9dVGWOqobIdhf8m7o1DPaViY7Y+urfDBk8PRQzk
 Wh2wwMockkoQDhcyN6DrRmnqOjnULzsf3y+MG5aVfW0i54o3Y1vWAq1+B/JNaEtXbGjHMpV1fOA kXYeey04vvMTSBeM+6bbPjmWzsPQye49WC29FIv18RylXapk+0uwRsTjHzcGfSwQrrJMgLw+X8W mEfgUwME2jgmV12P+sY3ytWy3dPoah81BmsPAo2BksTrnlIIfMb79U4B1LY8NoSEGSNr/NWtjdY
 texgFr0yrOmUZe5fXVNbRPBdXxsLFKeVsNFSmJDs1vrLQgj7+KdDsjEhB9SgQQs2YC2A9A75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290034
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9264

From: Chen Qi <Qi.Chen@windriver.com>

The build error could be reproduced by using qemux86 as the MACHINE
or using qemux86-64 as the MACHINE and then running 'bitbake
lib32-docker-distribution'.

The root cause is the wrong file (s3_64bit.go) is imported. Fix the
tag matching to ensure s3_32bit.go is imported in case of 386.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution_git.bb                |  1 +
 .../files/0001-s3-aws-fix-build-for-386.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-s3-aws-fix-build-for-386.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 58308b82..240da797 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -7,6 +7,7 @@ SRCREV_distribution = "9ed95e7365224025ee89365e12cf128e1f1bf965"
 SRC_URI = "git://github.com/docker/distribution.git;branch=main;name=distribution;destsuffix=git/src/github.com/distribution/distribution/v3;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
+           file://0001-s3-aws-fix-build-for-386.patch \
           "
 
 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-s3-aws-fix-build-for-386.patch b/recipes-containers/docker-distribution/files/0001-s3-aws-fix-build-for-386.patch
new file mode 100644
index 00000000..4fbae6e4
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-s3-aws-fix-build-for-386.patch
@@ -0,0 +1,45 @@
+From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 29 May 2025 11:28:38 +0800
+Subject: [PATCH] s3-aws: fix build for 386
+
+When building for 386, we got the following build error:
+
+  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
+  maxChunkSize (untyped int constant 5368709120) as int value
+  in argument to getParameterAsInteger (overflows)
+
+This is because the s3_64bit.go is used. Adjust the build tag matching
+in s3_32bit.go and s3_64bit.go to fix this issue.
+
+Upstream-Status: Submitted [https://github.com/distribution/distribution/pull/4642]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
+ registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
+index 218e3eab..84161fcb 100644
+--- a/registry/storage/driver/s3-aws/s3_32bit.go
++++ b/registry/storage/driver/s3-aws/s3_32bit.go
+@@ -1,4 +1,4 @@
+-//go:build arm
++//go:build arm || 386
+ 
+ package s3
+ 
+diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
+index 55254e49..2ed1f92f 100644
+--- a/registry/storage/driver/s3-aws/s3_64bit.go
++++ b/registry/storage/driver/s3-aws/s3_64bit.go
+@@ -1,4 +1,4 @@
+-//go:build !arm
++//go:build !arm && !386
+ 
+ package s3
+ 
+-- 
+2.34.1
+
-- 
2.34.1


