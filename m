Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ADEC369B6
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 10:04:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46277.1744625049738411103
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 03:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5nrES026886
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58htsu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1S4xwvfY6ZDRt8VJiPLjOvYNtELLUrB85WOCs5gWG5ton0Z+FUBRjXVVA7Ej9IQRfKpzAtT7y+vBI+v6flgrQn6M4t9RursbpyIYHaaAGQBKAuufe0r2xjpP8iIbvAbphn5ffXjQHpcFeyQU6AcQom1wXiaphIQDgbd8hLd5usBKnyKQdvoc7b5i3INYGSQVjQZVqfvGtrFqK8Ty1Rs+BUS54Ob9GkIZbX5VQF3FntQ86t8i4Gg6s4qCfHiE3GFR/A3FEdhv2LvRHkyQxcZMJth995CqE7vgXxAIUWIUWdEFT/3wVxa255OMP5qJRdD5YAEtBxrFsj7v/5/Xyha9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS8+oxZEGr11vFAxDw00uBTDTK2f0mO23eHuheivdqY=;
 b=ACAMaLOMGeMHYXvMaFLB4QLGO8qewzYgVSk6YSNIlKsN05r4dO8VTE1dJILMMZmsppqUKtmNVyAL7zcp3muXWHZqxrCSSA9qI4X58XiEB6n/ZCfqwmOxoQqhiWaOLMOEAEHbiPR2hrNPeuFJHTc9VUMWKFA/wz+yE2ysQuGxEVhsTXTtUp4PnB3Xwkl0SqC/djCjlaPqb48LinFfS30CGdqAICxPnoWlsoeBgPo80GHAcS9lElgyBkY9RCYyTV3HfHzGxoE29HLvDmzFn5IrhPKzVPl9We371uxwvy6ONUsNrC937UXS5sPNFm71Y1K0/mSsGE3bQznF+dpP3kd3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 10:04:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:04:05 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/3] podman: update to 5.4.2
Date: Mon, 14 Apr 2025 03:03:56 -0700
Message-ID: <20250414100358.2940529-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3a0cb0-dcd6-44e5-9b3f-08dd7b3bb03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YDwKurp760uMKK26G37hcVFQecFDROycFERfhDYQ5KGhpBtjJE+hmry7wNqH?=
 =?us-ascii?Q?F2aYMVd4W7R4INbx/ZxIxdcS4ZoG0Qz2KuwFlA1SkIdrc3jyWXI2bHHe5D1W?=
 =?us-ascii?Q?YwBOSKsFBlqFFQ3sgwwK3GNSyTN/M67RdrerbkS1d21omO89dytp40tx8atE?=
 =?us-ascii?Q?R4KDBp5qaSEe0PKYnw8iQMGaC5IuMGEs5vUlshuRbpoQwGfaXJH+TqJjHE/o?=
 =?us-ascii?Q?6Jb4jMNAzHeoWxxXMCYTh9IwQCDRRLCC2azgC43PKfBFeykjDbCRtwtuNUkc?=
 =?us-ascii?Q?2OvVgeDXDLS9uTCNN+DaaR0rj7G1Ord3fzKk0bOe51YzaA/o6U0O0haUJpzQ?=
 =?us-ascii?Q?pU961OrTO7BvaPLBm1vqgcL5/ZJvaiyftb671yggT2dtD7i/Nc1O7pwTQR82?=
 =?us-ascii?Q?5LmBxqIrNuLibFMTy8Cnz/Wvt8fVNKS3PbzQgX7Lpf8jONdAHC0x84/aNHld?=
 =?us-ascii?Q?4MzII/wPFFXIX6be8tMKjxvVkJRwRXi00rf8sxHeWb0t2uiNofDA12PisqyP?=
 =?us-ascii?Q?Jif1p4gJLRYTafOm4e/q6dFXVbK1ZuAqvCGM/7AKkUlkeicomqZeZtqsgkaa?=
 =?us-ascii?Q?3zaTWbh8+KlUMv9hqKNlfSYJo85nCO7ISAcEfTqpcqagiXRbPIhiGhOCpVg/?=
 =?us-ascii?Q?rGVBtC9ygQ2w5yqEJVAVCVrg5ly/7HxG4RWFHYKFyisk5iUMF3Dpwl0YBj40?=
 =?us-ascii?Q?Vcdwr3YBEDD+yqD0EQtO3Yynlb3VDYwpUGE10h7/icTx7P5hLsmUKhIV1qO1?=
 =?us-ascii?Q?HmtKYZ1/B9IzssD+4cZxYTZurIyCP7UipTHcdlU6e9v6Fg0NiM9peBtogOhg?=
 =?us-ascii?Q?qxYrTOaYeL2QqT9YgcF8dQY2wyG/ldXjrJxtXV8RUfQqqOb6/R/GLDlAZBUm?=
 =?us-ascii?Q?jekzmgY/fFzxg4jJ9+xWDYgbib7c/og0KWcK6AbWnHGks79z2o1TobGvre4o?=
 =?us-ascii?Q?gh9cvuW4+qzm1TB1jK8knW/tzHKtMh56DIkE9XdBROSoyAw1Jb0bdvFuDKbu?=
 =?us-ascii?Q?CVifgt2U8LDJZknGjLEilzczQcPrdG1DWTob/zPJQDTSGmMFZPm1a6tuFapB?=
 =?us-ascii?Q?scWZz7KrCB9MPMd1VEI053aTCo+dyszodmwLzwltq5pv7P4BlLTZ3yJxaP/F?=
 =?us-ascii?Q?TD6z2PTEytCo/nxK68Jf/7O6GUsL2Ywd9V1hRYnOU0vYK3jHS+jb+UbKWTeq?=
 =?us-ascii?Q?mWkVEOZr8aMj/+GwgQaYdgngH/Uo3HD++G283g0W+jPHtloAbDIjpnNLtPuN?=
 =?us-ascii?Q?o6xZsJ3urxwsLQ8KxT3ztNIra9yLJNuVsOmUX7OFIZyNY74yd/8gkLFzJyyW?=
 =?us-ascii?Q?rtzhZ/i170QpnJF6DQqad055sQEmYgTnOPkaKoIFfDTcLG+3+bKgm+EUmDyc?=
 =?us-ascii?Q?MYFChFuGiryCYjdy6RkurRR2VY3haxCmuPqUyrdrEp2udhC07k1YZfHgTfBF?=
 =?us-ascii?Q?w9bAV14jcBoVuo2tgYCR2orjnpx3yYd5cq04w5WtQFljMCy3Kt7jTg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mop/WfvF9b6mydzAAQgNjgD/ErSSjuT0fISC+3VvT/6hwBLWUslirn5wDfyj?=
 =?us-ascii?Q?B9N5xp/dJdOaEguxJ19p0LSgoldX8sxVpxCEE9lg5HLBR/bLt2PgpNH2rMoT?=
 =?us-ascii?Q?3NIl4NNzhwzsZ5u8oDCEetR86aF/y4POCvXNFZ3+ONaf/eyk+hBsBMg2+VPD?=
 =?us-ascii?Q?yU1ZgAyAX0Bkcn7Hdn6cXmEaslvy423QPCuQzgN0hN/FeyzMi3uqlkEyiS6t?=
 =?us-ascii?Q?JVfrXKOfnKzQT1AthCrBjNn4CtFHAI1244W1H3eVVsM2d6XXWiJyoIGtGhO0?=
 =?us-ascii?Q?ZzyeAq6LweAvlH5zu2qfk4bAuwTVmAAM8nL2yxL0/429sMyUZomZkTb7zMAd?=
 =?us-ascii?Q?yuFmcbwFw1xa8D6t/fRpLvNPnQ4T7Ka8ZHkoSmpw4q/vnK6jaM/U+1TzJE3Q?=
 =?us-ascii?Q?0br9n9ghd3xRSbkyHboVDGgdY7/vBbOWdVBii/aMXxAd28BemXhbPfAgYCZY?=
 =?us-ascii?Q?Hkp4ckEfQFJwQMcL6pA2/YhkvO7CA91cHwjiXpoHkL8pLayKsJtVUpuUhDzR?=
 =?us-ascii?Q?JPZGo8l83233FzLcqdc0l4MFA995ha6qoj+Qg0B8tNW+Hf5HEZsjJaahTGNo?=
 =?us-ascii?Q?UCPwqV8aBLOI4k0CLFxE8Nnh2d+suLEBdeFcmfwjVvi2nAUv5E7VuKBJw+sy?=
 =?us-ascii?Q?8fWqgNBGveRNaeQ6yvGfH5EhpDpCtk8F0dnLOwl8qXmHJ6w7Om0hGv9gGL66?=
 =?us-ascii?Q?nDG4Hh6JdsiuP3pEcvX1K0zwy9O4Iv4o6VlLy20DvR+7ux5L/Svv4ObCTZwK?=
 =?us-ascii?Q?2rdi/PvmhRa8UGNuGeCP4iEStPNAZZjN0tt3Wz9PCnBBISvpRgx1BJHK3ycW?=
 =?us-ascii?Q?LEPhcc5DNdBNUwbWDeGxVr2g4pYG3QUf4bjLGx5ejaBhup3I/ZacybXBV+3z?=
 =?us-ascii?Q?266sU0zDuKsE7cH6okxDX+lA9DgIJ2K5GXnMN1itCsrxwkGU0IQVJ6JV90fS?=
 =?us-ascii?Q?mfJr5iJc0kERHXqD2n43QWE1KI975yDxRBjXjV/AWNoxQQ1Z2sOxghs6+Y8F?=
 =?us-ascii?Q?+UZFQLquQUPDNdbnhKeKnGeY/GKreKofrlLiOySZHymzLoG7WvsvTBKOWJlk?=
 =?us-ascii?Q?tZMygDrQdwJto6EoWRPr2cyKyMS2mHIKiNqCect/FcM67gq78A5nWUEMsC5T?=
 =?us-ascii?Q?EjYq4faEkb0Cm8VbDf9/roFGrqjt4t2l657TOAHOrvZ7cwHqCksXBE6MC278?=
 =?us-ascii?Q?JQbZXPqhUsIkj5dBRsdXd4S5u0G6qXkxSiMS6wMvicpWloRmj07cdlkYpZxk?=
 =?us-ascii?Q?2nrK9yyWpti0QSXWs/nPRZ7F0zM6UEhMF364Q4xPWe4LP0LvvZLvV6Iw+swN?=
 =?us-ascii?Q?wL72ElrIhxk9pRtI/zPBr5ML/TPzASMtbzZl5BXwYAtGRZSCCdkDVUUZ1Ysx?=
 =?us-ascii?Q?szp7nQ5Yx622TTPJw25IrMoNhEu7gkMcnhSNEgf49IOaVxPpQnWzacHK43v/?=
 =?us-ascii?Q?NtI5WDPEfQHb7dAYl4aaL8yRsMwfuPSUoKmeZDTyd+At2B+3WQF+PoBN/WT0?=
 =?us-ascii?Q?vAak3HFdd6nrdy7crvhgsJFldOxgkI78Df7kcVQtUUDINtoWL7on86p1VAzU?=
 =?us-ascii?Q?doOfsPKBIi1vsPWn1PfueGof7JP697TqxGrEYGJCxIgAJe3e+k7I/ritkAbI?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3a0cb0-dcd6-44e5-9b3f-08dd7b3bb03a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:04:04.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qiX/JMdKisSonx9LsKK05g21zYIXeRWKSD30Q9tVS5zwwaPl6E03XrWBPDrz3Wo2OV3k3k05k8oy2JCzMmZew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fcdd98 cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=FtxsoFlTb1KdryurmSoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fH70EZzL3jPdYPV_1sIvN2G80RalytWl
X-Proofpoint-ORIG-GUID: fH70EZzL3jPdYPV_1sIvN2G80RalytWl
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=796 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140072
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9219

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade podman from 5.4.1+ to 5.4.2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 46c6c969..764c0af8 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     gettext-native \
 "
 
-SRCREV = "227df90eb7c021097c9ba5f8000c83648a598028"
+SRCREV = "be85287fcf4590961614ee37be65eeb315e5d9ff"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
@@ -30,7 +30,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "v5.4.1"
+PV = "v5.4.2"
 
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
-- 
2.49.0


