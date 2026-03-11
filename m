Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04638FD88D6
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 01:08:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10561.1773191325763591484
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 18:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q6L9BkKi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530872b75=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ANvIcM2372838;
	Tue, 10 Mar 2026 18:08:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cKoq07E4wAVc4JME5AKF
	RF4FvHc+PQOMvzPrGmzYppU=; b=Q6L9BkKiMiE1jKyTH2MeiWtRkPIWk3u6kg9U
	XWaMQ9cIcgQ1SXYHgCTk/WLEaN2hybHK8O59oUUh8Rlhol31Hm39LP4ky8igaTsA
	pnWfpTT0PkyHWt0E6A/Qclk20TNEJhOE5GuW+Zhm8mHQ5l8s0RSolzDbM1zNQ2B8
	DERvdKsknLvQB0X8wRqjkyFG03aJ1Lg4+3Wm4ZHq7kbJLXJh23IV1apAjcqb3HEi
	wmPlx9MH7UR5pGcVIMG/bdvUtOJB8sf7fU8Jb2/XXQj+o3uO8hvxCXNrazUCrPBs
	lOCQPXep/B06g4h6OGTNjtLar8px0HtH3zwRREV+d5cDZpVGcQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm3tp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 18:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQVD5rDeKq3EUwYvPgVpNbhfJf8Te62HryaY+u9Ltgb20IZfoJE+luSXdgkzMx7IzpXNCJf5X0sZ7gtRf7gf9TB6ZmscI3OGQTeOS4B3Fu52P6s7BebkHNNvJGlPRl9phe/7DJ8Pq5nURYQ6iMycpXzYR0fSwM6aLz7UdFg3u3vLLm8gfCUqTKSNIrF6JSGx2Es5Pl50CaA+xZNjvWlUvcrZzbllHuVgTzeyvvyVHXAElC8Gp2ONbQy8BGKtFBzIB6oSWnhILSoeeZ4X1PF+dDBcG/xCGdk2egRg87B0EEsADuwtHgLdHoTRF2ffJaSgugcqfsKmOkG1nMDjhhZfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKoq07E4wAVc4JME5AKFRF4FvHc+PQOMvzPrGmzYppU=;
 b=L3miwxwbj+ih1S/w/LvmvZ68Z3lMyZDO4qR6mcFvncmMlVetHQ7FXj8MNQGfJ96P1FUh26+noFrK94H5NfsnZn2/V4xKaOLIn+NmLVHA832qqw5YQuVDdJ1jV7iZMO2z2lXagt7iK+vNpqDPo359T3/gA2ana1kWam/qC+pfgayMLIMOgxAGjxNf4Rm9oVU3CAyjOJZa/Hu3MAb1q2HOHA/BkhK9upWc0K0VtpHUuJQWFZtEApA356zMV51YsRkfnOMNhn7pzDAo1sdsxqjRB79VNIpF5qjSAbzX3EzgFEkl/5hCiJRjE2oE87A/X8Cyu32yikCZ+I5j0OC54evaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 01:08:41 +0000
Received: from DM6PR11MB4611.namprd11.prod.outlook.com
 ([fe80::cef9:1ddc:3569:647b]) by DM6PR11MB4611.namprd11.prod.outlook.com
 ([fe80::cef9:1ddc:3569:647b%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 01:08:40 +0000
From: yongxin.liu@windriver.com
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] yocto-cfg-fragments: update to 6.18.16
Date: Wed, 11 Mar 2026 09:07:58 +0800
Message-ID: <20260311010758.3694874-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0131.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::9) To DM6PR11MB4611.namprd11.prod.outlook.com
 (2603:10b6:5:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4611:EE_|SN7PR11MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 02496e9d-c4ad-4d77-aef6-08de7f0abb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ZoQRfOz/opfT1f/ibZmwFYiiuwimRpLjN541ThZtVRTc59FgLE/q7aIDPFT1xB4UmJzyAfZY9F+gAiPseR67gF74rmIliG1RgxUSQi2iA2b+nYn2wwCdUvDpV6up54w9rBGh4MiLHGcHV9FFeQCYWDDwPrwh2YzjWA2XOO12bYAlsiTCPImeyAYzrygx15XwX2a4Xhrt1dN6gg+ALLn+0H/OYvhogq/VOLFJtht9NwhI3RSLM0Jvz3g/2KGPzC6SkNWOJTkuApHb5lgUbxSYA2ZrtaEZpbbe3Uq6fbMuxseGQ7kLDdQHWPXhnQ/IkZYWQ0Lcfa/D14zYyGQVAHJpeCCNn0Pf+KqIzYFkA9vccpc1O6xvlqjEuBAa4mbSc3MT86Sy0LERPHzkdAN/Kd5ENXq3+gkYE7d0I/6LHOvqGOLTAkSCsfYk5VN2JMbMTuhBjWPle2f6Es28P2SF4/EziLk+sID0q/4ZL2mSCWsj95KBw7Hfzrr7hB2QRobdfWgjG6SGfuTLPK97brMl36XUKH0XycO+js4VJUnZS60uewNZ3m7jO+gq2vi0Sf2pircpT18fdW4R/mKRvmJzIKEDN9QXki4fOHc/8wl/p+XnbQJ0B/KFgr/FRGdNEEqnUeu1eyg5SosezH4uxc99c0vc0XdJIkIg5Nqwq9mdJbrI/cVajrrRlXINeqXmu/Fz+qF3vyRCTP4vOr52qpe4bO8gsgJAtGJ3t4qObMpZ0Pa09vy1d66EWe2tK39ejIv990s0ytr1grhZyn5QfX6yBvR8ZGhx/KkNeMQHn+PgiS8SaQw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oH3BImnxrn0E8BKC4dCDGsNI7xRWLIfeFjeZsptIsSjGeES4FBWseiyUm8Gw?=
 =?us-ascii?Q?AWCFga6t8Sk1OCsR3pmGipgj0xWEmwN/+/NCXQcHJ8Usr/xuLFNKC+uUkofk?=
 =?us-ascii?Q?3J0C8xcMZqJtamzF8JWEYeh3t/miNIW8Yo4kQBfTw1ZQrp8PllCSm5Yyf/6z?=
 =?us-ascii?Q?t/F3XS0EAUIJK1LTvZT2kEz+ihpnzMFdv45najyY7uQrW5ceBSF1QSgUrwXj?=
 =?us-ascii?Q?Xgv9sT71RFH3dpr4mvrNedpcpS6gFlDpA7mq+0dB0cc2Kdtony3/mIXIkw9R?=
 =?us-ascii?Q?g1ZJ+TRE1kCXL7YlkeM00Lr/A8+AWmS1b/aH5qnbbPOrJKi7Su+MFJ+IdMXr?=
 =?us-ascii?Q?GAFlhtVo/uSn+tc/5V34/+nXEYykY0vZ9ARyXhrxIEIlaKEu1Ow28DEX+FW1?=
 =?us-ascii?Q?jMUkHdTTkpUz76wMf1nnVQevPlDhQfkrlWQaTQqdSDSEj4nRmMp+uYumY+SU?=
 =?us-ascii?Q?5f//B792gLHhcpsgSMyxgi4gQw2GSxlgjEhayFYbtJJkph2faHLZS0UK9BWv?=
 =?us-ascii?Q?mGd3RsmCzzWotEpKzqGlp6qPo+QW5BxkfzZQUib1W5Sw3QJ72fUApmiqeO9u?=
 =?us-ascii?Q?EzP00KSq+YNEIA1Nr6V+Kf18v35Teo/8yh2BseSn4HORBi6vvFlXyAU+yxVS?=
 =?us-ascii?Q?6RSq9j1pR9glEXq3Z2rDZniiXmF/NZQ+Nn1feVpDkmXHInRxyVE5prfdnWrq?=
 =?us-ascii?Q?fj4j9hLFjMVRhsM4sFj4Y9801Q0eBuZD093PJi6ynA0oP1YkjRz8GF6lWUrE?=
 =?us-ascii?Q?oK6o23s+q4bTOA+peowvoyPn5RSF3HQ7yLXimIsy29NvJBkgaP0JLyTzXr/2?=
 =?us-ascii?Q?CoMzWD4E4umi0trd6vPUuytvNDPbM13KHwhDKWvLcwkhVZPG1JhM0lk8x1K7?=
 =?us-ascii?Q?w2wMfrqVdlmtcjLtcRm0CKqh11rrIcf/mXy98qNKdQGi4bkV2SoFZKpT9uXX?=
 =?us-ascii?Q?xDZHMk/Yx7jYe8ZGOWabjaOMUJWtMW5A0fkbwvqlmZpBDqIiNxqJu9AuAGqj?=
 =?us-ascii?Q?d8LU/XKZDVcwsfaCoIw02q86FbzNYntXzbCIkIeQEFip9G1evPrpS13SUAJi?=
 =?us-ascii?Q?RufcWSOk/QP5Fm/w6exPrlNWEXm5P8HBeBGEaxV0gcmBB8Xcjal4vnJUunS4?=
 =?us-ascii?Q?jI48HE8NjhY32oEazmzYdXvD2SjRYU4G7ibclSF1K4gplQdubgb5Udq0L06M?=
 =?us-ascii?Q?a+la3IecXJ/EyBww72BIl3F2/PLadhKmMH/BR0MC1+vfRY4J6KXIiMJ2Vc+o?=
 =?us-ascii?Q?hDyCjCuQC0XhfTnmwJa5lk/psBLACrYpmk3qNLQKxGTE5jnDojXAF6XchJAx?=
 =?us-ascii?Q?Y4h6ZqObXclO7VvfOGefq4Z+Yqr0bLsyZx4YeE5uBqq6ei6xldO/mecr01az?=
 =?us-ascii?Q?PXP8A/dWhoIyqckUSj5tRHwezaj1uGRprONT8uXnxiPKxSKsWmQARlLU85cH?=
 =?us-ascii?Q?Nw5gGJceosXsyth2PicJzaRa9DCpeJ6lSHAYcg0hJQqwq7pgkpMu5cRGRybc?=
 =?us-ascii?Q?YW6ROe7GyEIBYHg8WyMEP//6wPSOGeyJEt9ADydeCfljmgmd6XA9Uq0Uc2DC?=
 =?us-ascii?Q?GB3kR/yog6AXEgsufC44AYshcdEMfl9TPj8PS2UMk+/9aFHtirWWbjSx0hhX?=
 =?us-ascii?Q?aWrfMx5wHVP+GXOp7xD5mEnhUgoLRK/NGdhD20xCYQMkn4ny+Yh19LNoQMPg?=
 =?us-ascii?Q?brkqe1AMROu4gctRg5LUkNsdfdROlDCjZhTRnIpS2kypPKd3myU3NRa/LYt8?=
 =?us-ascii?Q?F4dQyWwDFTh/1I0v68zg/qwU0HZmGVs=3D?=
X-Exchange-RoutingPolicyChecked: 
	wbkKJBdk6D2eFP7REjQKB8mxNAw8xA1O5fydjiqEab0Qpu/lXX4cb3qdVqwj8nihHxzia/S995dhBalIHSZJpOfOguVqh30o34IrMTSbHsEkVj14crD2J3bwJ/a2kF6R2SaHovPZPI5DpNOYC0qSwrHr2IIxiyFhhGqI9/sLjZBJ31OANrA9LQt9s6iExWReGkfVVDQlPoPR80hP19BYHxoOoVTEKmVtTwCiegdYVAGLk+Cct+bF5p0kAOJy91vAQBEBqeRlDV345WZ8X+wpXpKfuyIJBOeLRcv6ESxO67MlFKhWUGVOMwXubnmIj2k7wwqVrV2AHzBXljkzjo5m9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02496e9d-c4ad-4d77-aef6-08de7f0abb83
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:08:40.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubvoM+HfrYNz0bA9KQxvGAu7IRaeMO1Dyns8JW+AVGfuYb8SyDO0is+CPf1+arxsbmV4uRzHPKUd2L13v9VdegxrUV/xHLOUREL9rGKW+hA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-Proofpoint-ORIG-GUID: x43HeFXQ7zQQMv8Z0tu67TmoXk2E7A4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwNyBTYWx0ZWRfXxWbZs9qzdK6j
 liV8hXeMnDwt+tqB8ADQ2ZadGQCwZHyodvYhP4EKrlLlx7VwJKHoXU0IMFTAEExKVNEbjyg6EdB
 QnDMkrEGGkJcVQAkKQkj1NkSAtPQuO18teLlYzOSW4hWi55HEuD7MArO+hGmQxIcakGxiNeugQC
 1g3QUf4ileMn5zQB1iKevW+wVMW1twJzYbosQtsXfmsNiuBme/VHgc1h/XvTTG8TZTWmquAGe41
 PeFNabjjVcEIHP5FvT83igcGHl2aWwalUo9dhuxMbu3/rFdyjBhIzJygS4T7Z9k5LTmvEkRJEEj
 JWcYy28zMj1xL6c5TaGjIlKahdrAPwctCZQimJMV0aZel1pxgAVpoN6OkpPYszTbirH7QI6l1zo
 rE8+OcCQDz7g8cltk6SdBS587jbVRy4p125jTtCz31tVBRBzBMDpwljq52W0cSa82A8TQ+ECx9d
 pfq862hIi/v4PdWGOvQ==
X-Proofpoint-GUID: x43HeFXQ7zQQMv8Z0tu67TmoXk2E7A4X
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69b0c09c cx=c_pps
 a=U7vFK3P1qsHFYF4fogjkkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=W67c3xFzrzV2Eovr7L0A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110007
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 01:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9639

From: Yongxin Liu <yongxin.liu@windriver.com>

Due to the introduce of kcfg-sysroot in commit a4625a1fa275
("kernel: inject local search path to fragment processing"), old
yocto-cfg-fragments can overwrite the latest yocto-kernel-cache during
kernel build.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 recipes-kernel/linux/yocto-cfg-fragments-6.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb b/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
index e54c1139..7578cd26 100644
--- a/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
+++ b/recipes-kernel/linux/yocto-cfg-fragments-6.18.bb
@@ -15,7 +15,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 LINUX_VERSION ?= "6.18"
 PV = "v${LINUX_VERSION}+git${SRCREV}"
 
-SRCREV = "6ab6280418f524cda3e9f30ca0ac4367c58abdcf"
+SRCREV = "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
 SRC_URI = "\
         git://git.yoctoproject.org/yocto-kernel-cache;branch=yocto-${LINUX_VERSION} \
         "
-- 
2.46.2


