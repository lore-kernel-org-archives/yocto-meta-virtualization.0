Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F67ACD5BBF
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:20:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.904.1779499216047917744
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 May 2026 18:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eN8deLJR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=960346ca73=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N1KFkK171806;
	Sat, 23 May 2026 01:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+8KOX+YbUg9TvSW20ac8
	R+OQcgS3eGkcsz4lRfpSmiA=; b=eN8deLJRuhphEccHE9g6vjAdzSgCoVzUlD5o
	pjcEjqL1+yiGo9cz+NDxLFNmxxxFRfhm9YJPG8jT3hRY6OTONzz2eMxY9SFRDSX3
	Jq9vUX2iadir58QjzrkUfSaVw/40kJ7rWKj8fIqck7Ehvh+kF0ar+UeiLXK3Zv3C
	BARGeqiFy8u6FwqpEKvmkPztkQgZZQ8WebK5fBiAvLbtoc7IvHJWFmRLDW7j6Gj6
	CgXCaXD8zaJfuTGC+IuWcvI1xUGkCopbrjr3RXi69ytWc9lg9TttZjLnSHH0ODZZ
	4d0n4ex85ra8xxE9xGgdEqsaizgOIu0+gU76y8NH7BrRKG5WWw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f0026b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 23 May 2026 01:20:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwRg+4za34SipmOW1Qor1P3SDOzMil6DGCbu6lSasvGqoQ2CVkmFozXLFyv0Trb8Up+4wJzUJHGYLCsWTYXs/i5nKj7B9rV44c4E13IzNn1SWihKr/6uAUX0yNuOA3KXy1Jv98F39Not4dBq57RDrnFu11fdfKBQ+kAT2+QKOkhLasHJz8P7insKrW/PuHn3TNNikZXfs0kcizcAoeqPyUNM7bm+ycsg8QHYi15qvJ3MwafnJ586O0B+EcrXi/+gLBSO9MwFRMW1aHqJWLr6xq+B6FzW1jAhyVSAjG8Khw3k1A1A8yMwmGBufXG4MvD8CrufsnrGEuqwyUnrIFD32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8KOX+YbUg9TvSW20ac8R+OQcgS3eGkcsz4lRfpSmiA=;
 b=X6Eo2A7XU1jShtE1ZA7J5Oicg0fuPC5yb/iPq9tjDJ+yhWyGwMS0EgBdGJW7yihuse2kRj67D6+ua5nI+ZKukOTzatD/n3SzRBr+y/S8xew4IJ3e37sSn1tQL5urZbwYHTaI/kkGKXXl0v94wOd32CdKz7mVUYfWxfmFAFy0gsB+2ILvPUE8AAbUU9HFiDAvHDyV6v2sSzLmIUol+rJr5XuEjKRmY3oT2bmBJAgiz3JJYhhiY+xt47ocCFlzZgD1TCfmUF+zHRr1obvfC9A7eeuFBot2zOOtMyYo/W5uM/tzKBQ94j+4WTpNwnTLKbwyuzNZFCzo+sv5dCX143XI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by SA0PR11MB4592.namprd11.prod.outlook.com
 (2603:10b6:806:98::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 01:20:12 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 01:20:11 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: fix PV value
Date: Fri, 22 May 2026 18:20:03 -0700
Message-ID: <20260523012003.793031-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: a57a42a4-6f10-4d97-7e7e-08deb8696f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Byja6N1n23vc9dlU0I7+m3hYBtScy9pLjSjd91GcQcLYIOgOS3NrzgpvWPf6XlvZ/PTuqTIY+8OWbDNyC3Gq7kxme5+4yiIw2WTFHg9Zg+i9+cqR3TYZwMkRriuRnWQDqnsJx1voFmMNo6eBGhJGyTEWpUh6O86Y9CAweEZDbkaie8GJjiwIbfu1qTwxfmKjRVtmKxg6G0es0gbaa4M6lYecmIlY640tmO1sYai/E+qeLWAg5bqPRO8f3bZyPHi3y5zPHGz7bIzUFUp9LQZA2gUhItbQoqRFAYaakU8OxGBhhjENLFxChwdx0N6aZNngYfTTf23i4qzFiMsJW33+wXaOF/hkqz1EnuVu5qXpkdsdEFb3ewakKt5wjTKJbfc1stlJCfTDmDBe0XQXgyjZt9tn+jgoWMjGiespgzOCtQTAfADK/hiUsDCW/3d4IX1UxcP/uu71qBwwljB5h4sWo6KKU71GnfptDsOhMSGrDoIo6ssJxU772AJZ4keWLqXbUZZ2fsjZj/OvjxK4ZkvcOpF62uif7s99n0CP05B3ilq3bpPaDQEvMaer8hzGV33JLYSJGd+idyhUd1KQXUQI/LaNEqGZxJI0y9tluMa4V62kCecDX9sR3c1csaoA8exajlZQwr8hmCl5gxZG5mquL7QkKhhUhfsx4fNJSTOF1kv4jaIJp5NaTW8f8N8C7HYXdzeJtxMGJ4sPRnUjjkO8/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M1KahgyFTGXBkz5l8wrYvNzKonSEyLy2rHSHwbWInytqSwOU7N9v9gSrC0X+?=
 =?us-ascii?Q?8yQVjppn0wdWoLDiTU8CFbfjnThgCz05vzkTQvcfCQkgG8MfYuYqiwjkITMX?=
 =?us-ascii?Q?kW3ODkHtkRBBbiUDSx4PsqvvTWVDZA5CQNF9KHze7yoVXBcgopoM3gmYpusd?=
 =?us-ascii?Q?ds3xP5kPfF0XxS7HPoYZIA73FIkd+Ye5h6Tos2U02tk5fmLJTOh8o1BhTCfF?=
 =?us-ascii?Q?r/H3eXjOMDPNClPORXpKyuY+YOTWkSA+2On9FS0qfBnNFZ5LmF9GDoR0C6J6?=
 =?us-ascii?Q?8qOj76LZ+qBhvoRHNVtqgvIvJhfAtX9dk9yGDUle+3GO4htfCDbmrOXZRJDd?=
 =?us-ascii?Q?ZO+8gD77mD86SoYO6/fUAdmb3nFewBMdkK1VXNambOr/WIetpKNgaDoibs8+?=
 =?us-ascii?Q?3N4ZFhABrJ3tLlGgm6+rhTKkaXDfYq1jX8dvvdLqXWCN6GUgZRqhUceEyrTW?=
 =?us-ascii?Q?jxNsRNulBd80RexFmcq219W09iqMiW7rZOeO79B3i15muBqcs/+NBn9C8oyo?=
 =?us-ascii?Q?g70AInDgmTpbG7RgGNuJ8RGV14CIfkVsdYR59FY75S8QvzJhhKLAbZBxmkXJ?=
 =?us-ascii?Q?hprj8d11Cgz6u6Ssm56wF9ljsA7DKso/YCMu30midAUotc8AAU0S3dYrk+vU?=
 =?us-ascii?Q?//K7iIoZaclrYL2cd3rXOlUaf7nEK86EPeWc4k4xH4CJrgvCdyrETFHuFJxU?=
 =?us-ascii?Q?sdoNvbXteUwNsq1Pxxry2NLWn7cAMjVFuGWEMgAc5G2VOW8Jzc5oZxsCihX4?=
 =?us-ascii?Q?5sWcHbMSLLChyRFdwnS0z7C4Vc1VsYxEzdxK3fvDzAZuyC58S5lQ8zYG9yyv?=
 =?us-ascii?Q?OPW2O/iNrN3AF9v6jUhs8WUiN7SeEYPAWMJtnjX72El07NQAjKk1DSQtBVqG?=
 =?us-ascii?Q?vfASVwrVMJaGqAekYK43BtMo0u9mpw/Uv5KZz91ngn0yNDfjMsx4taLW3bFo?=
 =?us-ascii?Q?pccVZDXrqLz0Hwp1S8WscxD0SJ8rjRMd4ANBg1lyd9ive1NBc4mQNWEp4L4k?=
 =?us-ascii?Q?lbgkq/S75bpgpKu8P9noGwFO6UuIe9KxAZEFBca7v3MThqMgYintiDby4+Qd?=
 =?us-ascii?Q?pf0n+ZKMpGp6x8RnHTV5hBIEEKcyCwm/YSAr+ZQTSNC+4C+svuKiny/qyePS?=
 =?us-ascii?Q?TYkZQrCdX8/GHD+FVO9Ke1IBo2eJqyFm8Vqwa6BLzID3n4V/PKhktY0Qs477?=
 =?us-ascii?Q?2AO9sNTCmW7/FKOHuU0Ipjk1ZMOB3RIAgLn4MurFbrONWbWQ4R/aIgvaKBDH?=
 =?us-ascii?Q?BqsV+ftkL5iR+f/QAXh7IwMMsoN+Vre9rBtQH582OGPeklf3bIU6tlYiCugJ?=
 =?us-ascii?Q?wL5PqsRDv/BZ4ydrFuOzw5Df+vydIaxK5rl2ojFz5qAHwfO2x8puamXZolVt?=
 =?us-ascii?Q?Xh2sELXUENhOuQQjrTiRU9qKZZuFM5q6TL9SaK0vHQ6teV7x4XGrRyMDmO+a?=
 =?us-ascii?Q?AbE1V0N22Vq7ilQaaMl7KQF3phhJBcv0YsoH974xWY7PM2c0XZ7nkHve/nTO?=
 =?us-ascii?Q?j2UP8Hi+LJk6yQiN+L7ijBfSDMiio4kF7rA5sY+kfJI+q4ylL7NNA4jICsbz?=
 =?us-ascii?Q?kYvC2n5R0VQpfO/eldzdVczDQQZgYAIEw2LmItarq7d2mo07yEwT6BApTKAR?=
 =?us-ascii?Q?YAqp+aEZeeCyJX4WAX7DbETv9SbmiQOfFBboztJpPn4DP+Dvj7cb8GHpqYWe?=
 =?us-ascii?Q?uT8M9L6GYcAsVip/AFtjLGkX5iN83+B6Gw3wcipGTJNcIwllAQpGaE2PcF8h?=
 =?us-ascii?Q?L1/7cUHCdSA8MY8iavTyJV8zFaebWAU=3D?=
X-Exchange-RoutingPolicyChecked: 
	WCD0lcMXalbBLjqtPV4UfkgRYpP7q6H2H0vJsEPItxY9Urkz406YFLRJNuWO+oCFNIgDtjc6YaiM7QveNbvhPtm2QUO6sQrWuJYIOtgfKscFVlnWmcm8vP2A2yCk9vtS/AQkvCIjekvunnKzA1qD7s7sM/W4B4HwoeVnQrovVG9hutEmWsnql27y0rfAy4qlOFJQ/N+KH2PAlaL2j5nnXFDSsKLqfQSR9Z3s3xjvVqlO8c+esROmVMolOSTR/iezhIb7c9t7CsCP9Qjdg6rzQN8YGimG/1Je1L0LTtxg73dhLrOnmnsQ6GjlEaW7QVX4mNFqcLNmx0dAkKWvON+CrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57a42a4-6f10-4d97-7e7e-08deb8696f84
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 01:20:11.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYr6IPp1YlXbIqiOTO36xIdeqR2Mgc1WIqeGF5gC6o9V+VlvJXQ/pdFLe9+Ctx1OO5qo7LKlcbqWESqzVDysLB78AEUwESbGUYAz/P5fwsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-Proofpoint-ORIG-GUID: JNQhY0SEdQU7LdnvMIlyODhfkMjmPUSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAxMCBTYWx0ZWRfX3OkniioODT0c
 ZJcHRF1CWqIbPewZDVKU7TX5dyffaTzxS4kJ6iTTOlrVYT6pXSjRQ5hyanRJcWi2jLVDxxGVv6l
 wt7OEClEax8h5dCEPOe5GWpGD52JY8i9XQnAUzV8Sak31GSRGKt1hzNGbE/JVelm0hHKWI6iguj
 c18QQ1cdfvdOEpzJXbqhtNNX28Xhw7Zr1gZaUhTa/xDIiRwzfA02dyJfilwHIL0S9RA2hymqb7f
 nUKMiBAD/BdS7gCRkY/LW1coi6OG6vq96CamqwsJbA2zxZ/23UI/P08ttRL+NGrxsnLitl22N5d
 /Q9ULk2HAbHqE7EYss17y0Y7ALlrMH84qBSqgImVClt4h+36pi3L7oabXCcfwyGEbftyYVEBPDB
 Djt6JZtXL/cP5oLLSJUP1q4nBjaqNz7dzkTNTBsPkhSIJvo5B6TJ9vqz0DkjTZkY5iKZV9P7jJP
 yHy2JI2WO+1y+0optmA==
X-Proofpoint-GUID: JNQhY0SEdQU7LdnvMIlyODhfkMjmPUSy
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a1100ce cx=c_pps
 a=5LsHMtEjVXEroYtotTqlkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=w-b7ijB_SMik58dZssMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605230010
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 23 May 2026 01:20:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9801

During the last upgradeing, the source has been upgraded to v2.2.1,
but the PV is not. So make it be accurate.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index f73667a4..143673f2 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -40,7 +40,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd
 
 GO_IMPORT = "import"
 
-PV = "v2.2.0"
+PV = "v2.2.1"
 
 NERDCTL_PKG = "github.com/containerd/nerdctl"
 
-- 
2.49.0


