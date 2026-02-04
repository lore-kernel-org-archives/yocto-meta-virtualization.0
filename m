Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E84E83045
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 06:35:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14134.1770186930522563594
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 22:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hfs6SSwZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6495392723=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6146QgUi3146330
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 4 Feb 2026 06:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qS07FsJ6el1S1clGY4cW
	46FpIPFGrr9MqzIf8eilEpg=; b=Hfs6SSwZfZDXmvxk4KYQcM1viQ5jE1j47kbq
	XCxtVxpbMdZVUjddpkn0VtF56uAdgj/Qo5iwsiz3F0IdKUyaQeJI1vu+5sAPyGp7
	s5suKjkiWLtGpVzjExu7WEIGgfq9VnN01cekhLl7HqrW1Xfw5v8jkG/51r6KxfH7
	3u0ZCL82XRk0KLGsjTcSp7W7C7MRy+tK1s5tKBYNSq0ESt136Zd6UV3YMqlVEV5S
	fpGrlG/cz9j4tRKA7fZwqsRUvYkkHbimGCRd1U7mjONNJ24rxB7vKhem7ORC9KUQ
	5Vx5PttQneloT5KkBx6nK1a8pg+tVpelUS599pII0Jkwa9ByjA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vcj06ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 06:35:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMkzCkkbQk3IUjibgcDTAYWviXbyxY6GAjaF0XwHAJWynUpU5LeXRD9aobMI1a0mcKnUdKi8kGt44hrHWLBes5zaaTatkb4QkG8l1lViKViGnK5qfSTmNWeZVNXNdm5fJouRiKT7YMlOHFy87lWZFaON7KLqotAd8TofAcYF/hmNT/Fh+NrKsCgL3/Wx/Dt+pFfucD5mjzjWis9WbpfdgrgkY5vb5pKcGdUn7QZoqqFV/0yiiMQipv8OCIO2nCEnqn7bjPPnLVzPfcrkxEgYdvHbphJUqPdVedcxn5g5R2K5YWkQ7UR5eL5V9bnDFzdfUeVctzC2l4hTzJ1K2+txAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS07FsJ6el1S1clGY4cW46FpIPFGrr9MqzIf8eilEpg=;
 b=pxPJEOJ1p363LvE8dkpG7GXkA0iN/AVH6Ie/Z7AN8hw2YZPPfjVoWNfsVBwcj8aOaBf85lTRixbYxOIrnMdP3NI/xsaPL0qDiNwPFC8t76XUBCQyBhF2X+//00ggsR5HLxzDUBSltBRReawLaQXn0CR+FROQe3BxvcgfB+ckhlFCkMbMUoNRVv9ztDHkiJMBPw+3ypkOsb3dF8yMZMEv1Zf/k/Q+S3ZrHQ6zlbWg1CDXMnGB4nZbm8yEiv17bO40USjQQQFhkneNC+XHH/UwTvCLkO9o9Vvli72c55TeVEpGH+kpUZlxSLTBGg1DYNS4f+lvOipLOJ0ObO6VlHJwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 06:35:27 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 06:35:27 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: add -buildmode=pie to avoid textrel QA error
Date: Wed,  4 Feb 2026 14:34:45 +0800
Message-Id: <20260204063445.4066475-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 11227813-8439-4faa-2d75-08de63b78d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NP0zp9fvefKxXqiKwYTzt1uGt9bCAiTYq/UFrnr0VpRYuB7G6Cz1oovyW1YT?=
 =?us-ascii?Q?47yd/FzvdUhNyN2dlupr0JlzF29hA9vIQKzS/nLh4l4qJ2XbaX0Gc7wi9WBR?=
 =?us-ascii?Q?nAzoakIdxMkMgJ5S6eoBN+dKfFGxNgePZUJf7nUCSFcvih7nRrCF9lYkNJny?=
 =?us-ascii?Q?lUq5eJLouFbFcQMMrlkrC/KK3mnSwkxBmappaabA7PDMI1JtVk6QKDrOwPpD?=
 =?us-ascii?Q?CEp5PeQNKUa5ROFuQqyseqkfiKB8sH5VC0mIn77K7kDz1ZutPfwxt6INNqWj?=
 =?us-ascii?Q?EpACoRG9wzM+GHTnuXQxq6XJ811aLv5b4swT2aDQPAoa2R9LH+n2PCQHsW6m?=
 =?us-ascii?Q?kr2+BGi3tXqAVMoBQP6nUdFOw+3e043Ug+1dpXi1sRk5nEqNFtGFuzTdZmEr?=
 =?us-ascii?Q?IXHanD4nE7uKwhJO+kpS4NoVw0Lef0njJMIRTZKqHMrW0uooOZAH9zbKPmxG?=
 =?us-ascii?Q?gajVMA34pHG1vOpll3kfOrQZT+bBX7fEnFDhLHl4+jPTfianqPmnxOIModFw?=
 =?us-ascii?Q?ZCTK/obzww8rir3mlkXsDkpUMFzs/R2r76LWGtBpTxMEyCPVa6tY/6wCQmIM?=
 =?us-ascii?Q?lWmDu1l7oJtv4+25GYTycGkLXsYw3u5+nsmaAIeTgS06u4i6xFuiTGDS+rsg?=
 =?us-ascii?Q?pvI+c/c+R+1BPgVFAqMl+MRWiDDE/Yr64jISgTEbRvyUYXbvnTUDOjT03Own?=
 =?us-ascii?Q?z7pmJ+yChJhYL8PzFuO3+xfA44ylNNAgsTPLS3V+wcUY4E2ArBbb9bewbkMu?=
 =?us-ascii?Q?qwiwJkREUo8Qwu2uBPrc4ZJJr+OTA4eE6lFm5SxoIr5MFMvkRC0Pu1z8uOQO?=
 =?us-ascii?Q?ZZE2Mp2duWXwHQ/Ax/EJ5XHRMkgIEwlBipfBJlLiNqChD0knFtph5xXrM2qz?=
 =?us-ascii?Q?2N99uPb0INMwKyvqJh4sagKyBcw1sgoiEg+tB4pslYsklcSeF7SWN62vX3RY?=
 =?us-ascii?Q?AL7OCjFnHNxyOPmw6esgLHu7A9TMG09ygsyZ1IiHE3i9VQKX9MOjPH0NXhsW?=
 =?us-ascii?Q?VjMXebbvhZG3eakDdhQTrm7xiQK4C4ta/LFFQ5l09Kl23/WU1kQhmP45UU5+?=
 =?us-ascii?Q?+JYiLUImpGsHVtGa7KxZsKwQlYh+PrQfHONDFu44j4irM3mgLktYvHe8Xfls?=
 =?us-ascii?Q?IFZqE/bQgecn44r0jDlcsLBRfLIsCuZpTVM78g+BDQv/4FAfYDaHHWM9bqhB?=
 =?us-ascii?Q?PQGSaNnR9kBvEhVjDxaovIAWGNixMbACzACdOb3maKdaZyztI4Q/3422ux0n?=
 =?us-ascii?Q?A9OgF5O8I6lwyrhaVuZWGLK1r2tLDgeqhkddEZhB8RPrbMxjO00DFmE4KlX4?=
 =?us-ascii?Q?sWn/RDBmzJ94jUyroJDY5nTwHZ6saDiyYVj2IN4oLhfDaJb9kON0eIb18CMO?=
 =?us-ascii?Q?YGOX6j+qFUUguQgiznCSc6e7mwB6oocvuQ2f/J8+ewhWATUnMSWTJQnm6vER?=
 =?us-ascii?Q?cUN4qo3v+laYweq6q01HLIpjOc5kcCVnmoT15lfWeXgsSFwvSpFDHKstSs4j?=
 =?us-ascii?Q?Uw/bI1b13O1gLOEgw0nDWhj/WYTg66ZqVWu8PIaFkmp1EhFLXVo41t6HvAOB?=
 =?us-ascii?Q?k+Fi2dxSWaXAbNUhsOl2+Nt9cQB9M4vNJXSiL2RB+a9wIUEJMmDLIUSoIFtT?=
 =?us-ascii?Q?ot7qfCnOZ5O0P7bCopu8PT0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JIy2Wb3IICR2oG8EiWIFLgu6nIuPxjGcdKABcghgMu2Yi8PEe/12/Dx2i0JY?=
 =?us-ascii?Q?OT0u87jWeHTIG1nIxYTzsSyEBzycjApr5zGAPcbBtRYiEBtnYlcRaPDRhWfe?=
 =?us-ascii?Q?R7p+GoBSJUnNsuFu1EKPXav5QtzcQ6WEG1r/1BrMCIA09aahrw3c5VYEAACA?=
 =?us-ascii?Q?fUv4Ppbkgbmnto68iNMLR5anaEZ4NU6cjB1tdZMOB5l7AGvLW6cGQlMKHi3v?=
 =?us-ascii?Q?ovpUJzioMa/xhFzSiVTXk7Bfe1bDqWa1b3jfOcxL/EP6Ajusjf6r1S4YMNcP?=
 =?us-ascii?Q?l1XndGwvhbr0ToXdhvUbTnpVnmEBhbTz++X8vfxAc1UOwy0naSvnSDAnZl9O?=
 =?us-ascii?Q?lfZfCR4+/5ZgQUlzEud1Z4pL01WDiYJUIeilcVgEr6KYjIGX3pbg7NZMFLJz?=
 =?us-ascii?Q?J8JaCheaco/E05pSkdg/dJuSgSMPwNnQ6faCRBWenklp4SNjZjmeNTUrfRhP?=
 =?us-ascii?Q?pmYlzVj5MECldxkF0c4BTdGmxEE2PjXzG+2E7QaC0yQIpPKO4z1W1Bs9Es8P?=
 =?us-ascii?Q?C65PNEn9PZ9qEoXBvKFCoqli1Okb3meAI+ahyDpdVqlFv81OcOW6yPyIdtnK?=
 =?us-ascii?Q?UZ5c1gLipOTz5ni9oOIVs2Q1v6G+Fi0wRmwpgp42spbGp2xBZ6piiAXWedrc?=
 =?us-ascii?Q?VBO6HGzoamMl4q9jYgM6R5dkQyJ+65fxQmR9BHu8qxN0EI2L5Y51XcD2Ofgi?=
 =?us-ascii?Q?WR8HTuv/Nm+hm/Ey8dgvJATXJrtqVCB1UlMRkVpQIi1C13HedczBfhyuvKb/?=
 =?us-ascii?Q?VUd4tYElBkGtQxSbjh3dc5IwqHdwQgMtcCx+7TZILdGtbzHOnQ42V4I4WsNL?=
 =?us-ascii?Q?B2nEjx7mtQCzRLgf47y6PfqPepMd6bJoBCquMA/FIvT6bSvzCs3K1tKl3jaV?=
 =?us-ascii?Q?82ZdsB1WEIdmvuxooF/76lfHM2uQxSlHAwvGCxVXA2TGIxvpvOADJigpzIld?=
 =?us-ascii?Q?OVuNTXA4wXRJnfL6NoUy3UDB/RxeLAzeveQ0P+vW7q2b/a8W4wF4gkiCn4t/?=
 =?us-ascii?Q?2wvKMVMClfatBL8dlmz6+u4FP5ztC9Z9thejsNPTKDnB8JQ7MvYAsPippI9o?=
 =?us-ascii?Q?nqGIpVD+v7KwBPtSL9MQVWmgj3N2WE4avBGABcGzuPZuRVWB0JOPsez9j5yy?=
 =?us-ascii?Q?kU9D8bNy/qHjymIu45Zi5Js35KVL/CZNkAxqUwqeMr5agZcUVJIEegAU6UnI?=
 =?us-ascii?Q?PX2yTFOjgh/XwK9foDRnwmGyuAW5A7+dDFOZdrYNqHRz9tPFX3zKFAL6F8VS?=
 =?us-ascii?Q?oiwHHS81AhpZwPHeUY38IqCD6Z3WhF1+a64014sja8pXGXK5am9Yppqp1K9X?=
 =?us-ascii?Q?3GRRVBTfSFhUla3PTdcvnSN4f7+pSyWX5UH/tmJbR79cxmZBowVd+v2aTRdT?=
 =?us-ascii?Q?FC8bnRb62aNwo/6UkTwHF7IaQsMm80DnsGM7eEFiTgguHUxZIL1KHIfG/WER?=
 =?us-ascii?Q?IbE0O7e1YvMtQLJDyJRQDzwX8IFHiQsenvGjkBfk3+aJL7iCW1bO16kR3jvu?=
 =?us-ascii?Q?SAClRULjb52rTYZGBrFhP+F6an6xpv7KsAWqY5JwZWDRanPKlhEyd8222RH/?=
 =?us-ascii?Q?iAUgbr8Vx3vmiRxfwfHHtRftQA/qpKVo1mjmTqbstR5oVb8F/YUEh/aNbcl7?=
 =?us-ascii?Q?ATPXSCOLmyU8wC23QalHGj9VfVIPDlwTpNmS+zElby+R4BYQxPLex2dFoWbz?=
 =?us-ascii?Q?KtsYOFZEm8rLsRYGtdUUUsTkcvi8etC6AuwIpF66G0iGajZK1E5rzmsAwe4X?=
 =?us-ascii?Q?mpFsRduIPg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11227813-8439-4faa-2d75-08de63b78d7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:35:27.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2McROa9H0Mbf2Cc/ZrkvMWaoCQPblP/4+kiqnqSifioP/a18s99YV/emgBJRA2b8r63XKB6f/kh96in68wqQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0NyBTYWx0ZWRfX5PKKNtF3gIJm
 VSKqsweOvaHsk8fgDJcoG5h0ExgA6d3ax+KDweTVVQcsK8048gMnAuPNsm4pzQQ4pUeHEDAtQ8/
 n4/UNHJd8X51Gd8IpnGgMgZSkcif1Q4soWNBKEjuAigFT6mqIwQNOlEU1rJqOiJmmfko1XWJIG7
 FUPzkfEFf9cXmVc6rIDC4gZ9Pn2rnH8MwapnCkLGMhD92564WudknJbzMrAKgGWHUYoTvGwuyOa
 m7pPljtSa9qkLX0ti2yINWm0Cx01BvIOcCGLt1YaiOUZC8HM81AKkM6xR4z9gvTVI5/jNJL3TfZ
 QbhSDJXZnOPZmZfWdsTWDbgeFeW+CqjTur/KydQcuLgAxe/k/o/dloMKG/wUih91ujmRx41CtKY
 WpAke3q252AGP95pLu94u7SUnbYUxMcbF8WWUUyCGvHrg2lHXGTy1H3KZQdx4z4XKLEpCD3i9sB
 JCw/fY3g6HtM+Ls6aNg==
X-Authority-Analysis: v=2.4 cv=VaH6/Vp9 c=1 sm=1 tr=0 ts=6982e8b1 cx=c_pps
 a=zwUidnFXtIpczQ2t7519XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=IjdlmtEjJxZ--4mNFGUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -0ExYOLIKlU6nFiFvo_fIVsJeG8TIfoj
X-Proofpoint-ORIG-GUID: -0ExYOLIKlU6nFiFvo_fIVsJeG8TIfoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040047
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 06:35:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9555

From: Chen Qi <Qi.Chen@windriver.com>

On qemuarm, building nerdctl fails with QA error about textrel.
Add '-buildmode=pie' to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 1c37bcf8..5429e6e6 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -78,7 +78,7 @@ do_compile() {
         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
         # -trimpath removes build paths from the binary (required for reproducible builds)
-        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
+        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw -buildmode=pie" binaries
 }
 
 do_install() {
-- 
2.34.1


