Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EB3C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 00:14:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.780.1785284042209365768
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 17:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XWXyD5Ks;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670e792ce=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SLtRDv4185139
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:14:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=oXrqPi9kT
	E59k516Jb49XMNo8WQPfOoYDm1LYzVhM2Q=; b=XWXyD5Ks2s8Y58dOlsR48KuJC
	Sh6nQRkVvRo9OGyqKMmZqWzqb+cuWWlOHxISuuIIEELr1aI3vgDgCNGcv5yvgxNJ
	F/DsmPmcogdqHok0K8OK6wzPAujMarWhBOfOxncP0/g6GktfGBGx5v8sz9oMuyWi
	6Jkd71uphR6SnRPPrcqmOcdqUH2Ol5NhWU6Gm6j2Zd4QLSbkpp35wJe2/H/TGkDH
	TjiayLt5L2NaLP/LSwjcaPzahMrB6NXl0PRHHTKH+e29puliF3FQHUCaEi6/WHUc
	7nJfaCcpc8RG7o31wylWChQoeCx5tj/JGzvyNBqBKhf7O+VC6TajP2V7A1Y8w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf4txg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBTRiy9G8b+sJsks2kRi/SLd54yPA0ZM4r+JjnMp3ZMNXDgL8mvf3u1uMEI5m1F6hKDYZqcZYJ5fL0wy+eKQp81a3muC9yXT0Gftz13FhydWwgU6p9nhJHdB2lNtkH0V38kNl7DSrVWUKpbM5qWx86GaW8x0lLGTh7IN+FylTmV8Ob0izEl8qtL/N6lZhNE7IB4g2iMm19iMcwPT66+ru0n9huz15RN82/BKQ9iZ5aOaU3sjVu5lrF3m52sIPvLR+6p3MHVwk+9UT7wUcgiZLJs/NP1Voe3DzENR8G2hi8Slifg80wZF24goNxEK7oxyz7QMz27bO58NJ72oe1fNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXrqPi9kTE59k516Jb49XMNo8WQPfOoYDm1LYzVhM2Q=;
 b=r88tgcrIZ3MgkzlF8nEl998YDlkl7uXieltACHB3BGMRdkFHS/HOE+L/cuuZeqm1EjW9t/o98cazCBJmEvXq0i008gPpM7n9zuskvRDJAbG46Gogiyu2NbOdDzWeWVx42KowAAMlarRoAuIK3vFCUPD7RMgFyFbA2jZanGGj+ZITLp0fvoyVtOLdaQu0Uk6+AXmXSb/A2AqbumIbtPzKHo2VopbpvsBqpBJWJxZfU5vMfXVYY/3WObrcfLLYsHOuNO7Rf6ZkKQiWVtTFu/OMyDvZxHLn27pJf2hj6xk/tQCB9fLtDQwplA032fAgyedPC9B0NlvNr0nlfoLvwufAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 SA1PR11MB185510.namprd11.prod.outlook.com (2603:10b6:806:51e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 00:13:58 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 00:13:58 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: kris.gavvala@windriver.com
Subject: [meta-virtualization][PATCH] libvirt: remove unused 0001-messon.build-remove-build-path-information-to-avoid-.patch
Date: Tue, 28 Jul 2026 19:13:42 -0500
Message-ID: <20260729001342.1708438-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|SA1PR11MB185510:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b844f2d-c3c2-4974-78f5-08deed0648f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|376014|366016|1800799024|56012099006|6133799003|11063799006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	NeCeW5EV+Sq2LK26XL6AstjANw3d4hP2CbjeXLOOoY51Bk7GZBS/5dGO2J43chN7K7AnwH/9t79jcg1SO0dyTq7yxcNxw6rvruA7j4TCr7zvpr0oZCNdhnVxz7PtxNfCzR6Qo8Yb1cHAiV2omrdoCzOh/B0iB9JsGUhvJgrC3zifBCDbrGV/fHMOeHBII+Mr56NDnae8oHPKu2j7GXi7c4p5kn39fIyBxTID5D4SS4hJK2i1856qIwcGmFmNH4Iar+4gEQkkEVFE1PknhnyYSfjpXZKnSF3+Fz0yVTphi9ZGKy0iHdAumUwbsFJJN5nDL6nvHPzirvA9CzDn8lWiKdlE7UEyoD/67kf5sy/2mKrxpmpqb8lrkyrRIrC8K6WF/MszZ42qZCjRlCORhbxRC9mqc4hxi8XCpvkmVG3w47cW+cp3m/5d9D7n1wC7yP+nAvxyNALIb0bfzngBfiFb2dlHt/1sH72WvDfKD2PE2VtCy5b5JVxZcznsdnNR0BResmL3AuK4gFS7xAVCW8L8TKfmQK7BCwXU73IgcSHzpyi1ElEZj6h/mWdQ2QTIwQ2HZXvnh6ubsMAQcmIgHaEVn+Wcc2CBbt1VVZ+AWktMLYjeQFSTl9llNs+6HnkS9/83rnoU+GdD7W31grXMvBK2ZCGguEAtVF/P03IW3JsIR6w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(366016)(1800799024)(56012099006)(6133799003)(11063799006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DJCa3OSceR4T87DUxAxXRPqVCNbEabkjKOhmdabgWqI7/BB2zjYQWOA0iMWZ?=
 =?us-ascii?Q?5/0Cq+7ihKKg4/drWONmvqDaGuHALyvo/ir6/IICys4gsWNbZYWpyp7lm6Dk?=
 =?us-ascii?Q?FoWaZyyk1wfet/ZuESoKCR1dOskstCs9WSC/1SO2n6iB+QvuXcYej6JbbGL0?=
 =?us-ascii?Q?nShoNaeNssw50HNqG2zmoGfg6ZbuFgpuKe22ETnJxtDh77nRwbkfhZgWATcY?=
 =?us-ascii?Q?w61JKz1TFQjK74zWuNveFwJy/J2SaIHc1EqKgxZYfBPBs5U2HaUWIqpexbsK?=
 =?us-ascii?Q?lOTAEKPJVAV76L3UwGT6McL26ZzvrQ/ADFMymWajMoGq2sQSlLqstZg6Pcf9?=
 =?us-ascii?Q?6Dvx5AFnNco2EPjHJYxCvdQP3hc9u0E9p7SnMWUJyyz3TlPTeNCAsKcsxYcO?=
 =?us-ascii?Q?WYrmWgdoet80VlbnbZC5wYMFj3/iUby7JQeWYvjftRheYHX+9NEMwCBaLudr?=
 =?us-ascii?Q?gGYUbmHXyqtj4BT5fteuMiXZ2hZLHyXyk0koYaarkM4sdO5l4Va/qQDy7GEQ?=
 =?us-ascii?Q?mBvXUwspajMLEM1ecyCLUDUjpBmf9mMD2AcmPiHANz276YdSsot9piWT+7rs?=
 =?us-ascii?Q?jZth8FfrWbCpJnslWWgCEb+xV5fKdsYOsCzJogcAbXvIe7mvQbE6y/abx9f3?=
 =?us-ascii?Q?4rKrNjYfuD0ibiW5QpEF82ri5FcJb/KCpPiJAY45DlApHUz2isuKtUAvRPac?=
 =?us-ascii?Q?S0hagR6Ozlxk13hNlX7D87LFtsADocXXXeF0rdvv2xMzJsjCMoEJBZ/Lspo0?=
 =?us-ascii?Q?ZMB4qHaD+yMonIDTl/EG+CA5/E+DP61PyxJMBLGEmNtUvJb/fMch3bGldpgm?=
 =?us-ascii?Q?wDpZWeJsZxAiVBMh8lSMqHuSio+GhhhfwQDBnKXgdivq2aol2/zws4PVrOdp?=
 =?us-ascii?Q?mUEFtatLQLxLAwM360qrTGsNLWXzu9Ozuf1RjD07F99tR3qpWynXe288lZMr?=
 =?us-ascii?Q?j/oY61QJuiwXGHg3fe0mj23oEptKnzSdFbEEyTToTGgAANKMllQBne+8kuAC?=
 =?us-ascii?Q?wsCCyIyMlFXpebzK7HfwJ2K6o9wNQ5s8KYBkOyB8M0JIyYwpVf1NuEJ/qzHv?=
 =?us-ascii?Q?lqolZgIznduNLOS5kzNb/ZiVKGi22wMVQPHJ3gHwurymnKX6D08Sp2HsTJhr?=
 =?us-ascii?Q?lntDEEncppUmRVvVWccLpBkxqfyJYdqugdW7Rp2IX6AmKjuJ0QGf8TlxVC/V?=
 =?us-ascii?Q?67k9fBsQnYMpMk7pFWmqXnhJUvnuRJjggnVW1yKyArHLrmTFZKCMr3+HytCZ?=
 =?us-ascii?Q?XwvsV1WWZF7ACi78/EBwxKSnnkMoB71B0vitqJJnn3ywALd3Qjc5K3jrieqJ?=
 =?us-ascii?Q?UatPMBO/ULnWEcbDkBcWqT2qD/C1nrpAS2srCc5xGHlJ0YZtUQ5GH3dq3+jd?=
 =?us-ascii?Q?wOPl+c7wWEpghgWkRxFtGEa7YYLnXkvTO7piMwVQqPQOdEvBNi+n/AUHDUam?=
 =?us-ascii?Q?iF5s4rmZRrWNX6eZv1JmzVDXf7e0jsrwiuEORXRWxZlZP3jhfOs32GhTl9Ti?=
 =?us-ascii?Q?wV3QLzQYuREfL+EMwQyg3ypBQeMGzFRxPjS7BTINw5wGMhcbSs7QJCm+7KSG?=
 =?us-ascii?Q?uNWIdBT+MkEXtqnaUv1EoXQ1JshLyf0T36TMH6nYrlNjzeSnT2hI+wEQg4u+?=
 =?us-ascii?Q?rVmmlBNBBDBU/F3wg1MsrqCw3wiT4kMxtdJ4WY5p+taUzBefan4vKLef06P+?=
 =?us-ascii?Q?TbuOr1xugLhG9fXHHZiikPQ+eTTjIUC8GXgNUo3I5iTCbKMupQwRL3zWKnBk?=
 =?us-ascii?Q?jTq+OJ9IdWaJ0m0dK/2XxriAUxdo9+0=3D?=
X-Exchange-RoutingPolicyChecked: 
	Yvx5qxpJQkC162IXGQj8xNhYrvY0Hl7lDbxpTUxQvvmh3DKIhGBwFv6RzcZvk3xHUPFrEEhp1ORGsUOrNsGj2wbfzkP/ByeTXHuidDkUQH16iyub2CymFAt+RNGrgXEHjqUsIUObri3sJ9ztumvgDG1fDUlpAD2vTSL4sF4dtzUd5bxmAmKhuLdp9iqfiSPR0lgIlPhMFgW2B8/Pyr9uiwA/NtKZIgH4wEMdDwLxJNz1Oh2XyWYAdoc0nPrlOLjqGd03C2thHC9ZnJdio5+Bmm1stkYGChlYYvgl14V+baiqD0pNH4f4L9sxYUjB9hp+4TWBX7Wz64Pd/3W87rnhcg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b844f2d-c3c2-4974-78f5-08deed0648f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 00:13:58.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Psf84BIuHBopiGwf6dUbQm4Gv81nclhF+ga7frd8ju53C+os7lpCxuANd9t+qA+1UIsoHi9CCSLqrAS97PSE8ms/9M91DQLJR3Us24iCWDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB185510
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDIwNiBTYWx0ZWRfX22isDuPvA0ol
 Hd0AC4j5zB6FHrC8yN3fzU7ss9c7hGo+FQRzmBWnAssc2gSzevWTGGGjcJKzCpkT53NBITp8E5q
 48mc7UI9E1krYAt6QJJRHeIDwvzTDo1q227wT1d2FHf6D68txEZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDIwNiBTYWx0ZWRfX4P7zzO5Ob3gc
 opeA+/N6s3y80E5wSp5pxHtLJ1IFnu76aoyhuCvCpFj821v7dDpUgoE5SA2js0PF9H2I8Dv+lYG
 SiOFKB6aLrwZLbVOgo3OrKi+DbffZ/2DCBCW4ZgpI7JRuGMR6majLIkrXeTMJXa/Vb3HSZnU7l+
 PvdWyc1wtAqEga3pLvbASjs+nP+/rCtAZQTk6FQ6UxCmfp0EEe0laVJ0gawnyU/mIjw27DxOgfP
 4YOVVKZb3W5zsmLwaAZaOTbZFIe/qCB5zEjKqwU9EXFJOXogjNclv/N0FOzEAH31zHy3v+Ok0az
 GKSCuJI4tjNiGBEPAjmgx0joh1R+fqHr7EKlNV6b2jFzzuJxRxMwDnFy2JMw36Hvrnz88vb5iKU
 t6l/Et5hpE0ZziRiRi2v2ZGjSWcTKK50eu/Z2pxDBOpucKWHRkzhFSPZ6srYY4WupTjwHZWd6Kc
 HwDxG62eGsor30lzzow==
X-Proofpoint-GUID: R20xCT3biIHd3MYHEdgktvYMc5bOd8tZ
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a6945c9 cx=c_pps
 a=QL/sESuk+SKO76CEZ3+3jA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=RRaGzlvAGVtbgJE9VtoA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: R20xCT3biIHd3MYHEdgktvYMc5bOd8tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280206
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 00:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10012

The patch 0001-messon.build-remove-build-path-information was added in
https://git.yoctoproject.org/meta-virtualization/commit/?id=9e30cf30
to remove buildpath info and address Yocto's QA warning.
This patch later was replaced with a different method in
https://git.yoctoproject.org/meta-virtualization/commit/?id=3ed3d6b3.
The unused patch was left behind so remove it to avoid confusion.

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 ...ove-build-path-information-to-avoid-.patch | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch b/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
deleted file mode 100644
index 1f0cbad8..00000000
--- a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9660b76325c841a5f5c7d5b2fb439a1fd64105c9 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Thu, 19 Jan 2023 17:07:37 +0800
-Subject: [PATCH] messon.build: remove build path information to avoid yocto QA
- buildpath check warnings
-
-libvirt debug trace contains source path, and some utils was located to
-yocto sysroot folder, those full source path cause yocto QA buildpath check failed and report warnings as below:
-
-WARNING: libvirt-8.1.0-r0 do_package_qa: QA Issue: File /usr/libexec/libvirt_lxc in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt.so.0.8001.0 in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/lock-driver/lockd.so in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/connection-driver/libvirt_driver_lxc.so in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/connection-driver/libvirt_driver_storage.so in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/connection-driver/libvirt_driver_network.so in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_fs.so in package libvirt contains reference to TMPDIR
-File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_disk.so in package libvirt contains reference to TMPDIR
-File /usr/bin/virt-ssh-helper in package libvirt contains reference to TMPDIR [buildpaths]
-
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- meson.build | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-Index: libvirt-v11.4.0+git/meson.build
-===================================================================
---- libvirt-v11.4.0+git.orig/meson.build
-+++ libvirt-v11.4.0+git/meson.build
-@@ -38,8 +38,8 @@
- conf = configuration_data()
- 
- conf.set('_GNU_SOURCE', 1)
--conf.set_quoted('abs_top_builddir', meson.project_build_root())
--conf.set_quoted('abs_top_srcdir', meson.project_source_root())
-+conf.set_quoted('abs_top_builddir', ' ')
-+conf.set_quoted('abs_top_srcdir', ' ')
- conf.set_quoted('PACKAGE', meson.project_name())
- conf.set_quoted('PACKAGE_NAME', meson.project_name())
- conf.set_quoted('PACKAGE_VERSION', meson.project_version())
-- 
2.43.0


