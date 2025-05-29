Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC90C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 03:51:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13230.1748490692017291965
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 May 2025 20:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82441521c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3i6ZY014232
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b14xv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 03:51:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS8t0lWTY8lHXk6ly6g27XlTML64xK7TmG/MhqIWETHkdCcjg+PH3K9ek4uTh4nGU1aKBU0b4uDFD+QgVQ1AV4bWgc1t62mlTXS2gCOsIvwC9e8HGMX8E9Hi5U1MBaMLVmCDgbIiUqHryEVnnYMH7QYwJc8Mukr39LgdVUKsK8R2vnA80eEvK/z7pVntK1sxWcYBrqXsFhhZWa3H3QxPNvx7OrmvfWczk2ikXI4Iyu3EH9XtEdRdaf9xiMPbTQrP7gPSufLS58TYf/wWQzGqIkMGA2MguRH7CDIAIKi83b5TquehMXpigpziYUg2Cp5Xg92QG2CaKZOZwLszWIJwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZPA6+Pr6FABan7lmdXIF0zRhk20Jgw0wvxF+w2czmc=;
 b=A+9SJMXX+Uj1k4y9mRe12NOglGycoDtrQ/PByOJurgogRoal66+srrt23C8B+SmQgFBZNwJVRCRamcJoAoVbsBj7SW39OiJ3jtLYZH4mZbWB7YGcWcQapbjakTjPENhpwirAf68a9E3T/cdKmLUfqg9pTtBU+SVqhKS+WYJc8ps+UwVdUi0JAqM9zfTrrHppPdNUCRd2wGZIDVkYJyIP5i988nNUKHVaDlJA91ZPIR8FK+5sBqJsG/zJOhvfRcn1tHajsGHnVahxsMaYdrduQt4Agowwh0LGAahZPtY31Wttk6q2GLhqhERaK8YfPIWfeME1iTG6z0YMLw9//6MBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 03:51:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 03:51:27 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][walnascar][PATCH 1/3]  docker-distribution: bump to v3.0.0 stable version
Date: Thu, 29 May 2025 11:51:08 +0800
Message-Id: <20250529035110.1881797-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8ae930-32ec-4a1f-7c15-08dd9e6416a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p3uJcBkm2kL38VJvnk6MNT1u6tfsegtsDN0/F4aVJno4Rku5wb8BOhmyKvtw?=
 =?us-ascii?Q?BfBexHx6MZbKYPUO/xhbDyBagqhfcAkx6RoIGTJE9sboOUnZ7JAjaA2uOXrZ?=
 =?us-ascii?Q?D9mN+BSyKb/XMoEv3/VDcsjgCzvkQs+0y9GcLiZswoh7ohi6WplLNPm7ma9L?=
 =?us-ascii?Q?HXLZ5Fqw8uiDvDwBlc0IeFDePqnD7mkLC89N75wtQRl8MOWfRMGzKVa/BRH0?=
 =?us-ascii?Q?EGcE8YrsnKEDbR5U6aya6eeQmX5FgrafTnkuny5U78P44JfoUvX4DaOBvSFw?=
 =?us-ascii?Q?r4vSkGXrsDwfMSfrX/hFEdYPQUmDh0z8/lQ2z6Sqw22nIU/PzrF3zOmF1AcA?=
 =?us-ascii?Q?5VdExgSE20hN7xtuUj+/VdwJgEAHb+zLDkPwpW0iXw8X3P21skgufaSdjOfP?=
 =?us-ascii?Q?agJTDEZ+H/emOaENPkOMzB3fEKD9YnEruP1ymEeJ9XIp7L2YjLDx7W92n4Ua?=
 =?us-ascii?Q?WqnZ2gLkx4F4wIv29ev4IdBU3N1xBPYiETCoV9igIjhPcSElkj8oP6j+zlQK?=
 =?us-ascii?Q?Jin697d+LBGZ7LkUNyi3Q8btZrr2HlrtkELl3kmNIWelJffk/Gbp4HskKNfR?=
 =?us-ascii?Q?QTpclRjBNF0xTEIdNGidreN7iJ5VqduRkPYZPb88uYZxuUjXBnwelav5p53i?=
 =?us-ascii?Q?V4AVowjaqWaEtH6WnsPzzyh/Oc3fnDHeYjCD3/eao0rGhNDZnn9lg538c3q3?=
 =?us-ascii?Q?64ETuEqRBcM6IUv4kpKskBGlcz6iJf+d+9joXq25NFiDzikgKzSJMFDAjPvB?=
 =?us-ascii?Q?0glEB70iWGqXtDMvooyfs6WRLngD1I5V8OApJLr3dZQBC72hpNFkBuwAN1CW?=
 =?us-ascii?Q?YScHAeHudhePfeUg+byDSsdXdpzrOcb1k987BNP2wLoxhzdDm1oudZYN17BX?=
 =?us-ascii?Q?zXOot5rs4MrdCxb9F3+ow6x26nFgSmYXhSH6H6VdMNq/yY5rSk2jXB/KYrln?=
 =?us-ascii?Q?j0LMMBjRciCm77rwms99sYltCalwDCBqy1jTJZUhwldkDKkJ7QXPJxNrrU3t?=
 =?us-ascii?Q?IK3xC171PQz3QPSDVfbY0yxoZX10C5e7eNIBfh8BN8S74m66eHbb1pYucH/a?=
 =?us-ascii?Q?ZzdrwSW2E3Tr+TyOwGxdX5ucmGhoAmoHHipRA7jegHbSJ2l7sl8+aW2lCM7N?=
 =?us-ascii?Q?82T7lsaWHi7y4NJOAMLkvW9IkDZRi/VbM2KhfbwuM30n8PMcudKLJ0WZnWDI?=
 =?us-ascii?Q?1daFO/M9sDlwY5upxBTTQDHhW6LMm7Dq74wWFjPzkcopemUPSwXZKOnZZq7z?=
 =?us-ascii?Q?ohn4WPazICnNLvbH+NKg7NxrkpMK9bMMcGFqcLaJuAUAHuAkhEb09bjcbeZT?=
 =?us-ascii?Q?1LboDbuifMNccOeZjM5B1xGjcUHoznmVNbmumGctfGRMHhA0N/lHt4AU51Zd?=
 =?us-ascii?Q?OB5gVvPsmuqSyK3fTRWj6ExZMaMgd404boCM/+ys3RD8kpJUtSS1fC/31sBc?=
 =?us-ascii?Q?nHxoHdvM/ofnt4vhTL5faJDVwkW5MfsTE79aQzJvAqLThRPc7T9Buw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FNffj1e3GlNR3GjxEE3JMxJMlIpVd24KrrqDLRXVlgPCB4hXK467NG8UVVeK?=
 =?us-ascii?Q?M8wn24Bcuij2RzjGVX7/AsUvdz8Jb0grCd8BL+mbMansqjv1com+JNT+iBRW?=
 =?us-ascii?Q?0ZnzTafQmrVFsadYStfBQb7FGWiQk5TNMOVQ2w4GRLpkYOTSoegQLHU6tbgv?=
 =?us-ascii?Q?4G7TIKaNmG/ttWl9+lq5oMAwVVZB53LvepicC58kx+Z8xXbgPA8qfn4wusIF?=
 =?us-ascii?Q?X+qXVJLsy1XNsr1Tit/SEeF+JXls8cCDh2fXoxhWB2Yrz2sWNTBAuB0qotSL?=
 =?us-ascii?Q?zDSaS9FL1SGJtTdZX84QEbp49eEpK6k7nDza5RiEJn+/zXc6lOhI+AUp21Ek?=
 =?us-ascii?Q?giOxs274vgn3GJytHwPuNZMtBZHE8jYPvc1v2/dWa1KjYdaMX6q1Jlq/P4mE?=
 =?us-ascii?Q?ZVTTFXC0OjbL988zn+9Nn3a35hTME5KFUNmt2e6LA8OKNTXPRJh7FGEzmG1H?=
 =?us-ascii?Q?vP17G6u4U0iD/MDt4HebHj+r6QKkBvqkwVYov66TriCBzcIqOA7vK3pEVmov?=
 =?us-ascii?Q?l/l+ksEbH4l0/bavAXLXhq8OHeKo7NmtxaR0XwBi2rQacW+NeCoQ4gRar1ma?=
 =?us-ascii?Q?I8mWhTwV5SBDlpZjz7fr8rNuqlomZGIOQA1B4oZ1vgLEUYYGydaj2P6orZNo?=
 =?us-ascii?Q?o/Dht6chAIVDTl2zZAD/iOW+LN+WDGnqo0QSMRmPWulUGoWQFfSAznC26X5c?=
 =?us-ascii?Q?bqrV08pAty199NwazxROcdUCCS+3xqI2x4ULySeB9w2CiRUujVwbYzd5CIPK?=
 =?us-ascii?Q?vjzJIvW3VmZ70cTZv22vCfUaBz0PBHcsRro5CSp+eFn49hMZj6OuA6yriNNE?=
 =?us-ascii?Q?FWrqx/WceCv8e4n52IebnAIJxR2exquXDCE+7TeNexzNirIs7BRxB592SE3h?=
 =?us-ascii?Q?57MlJbyl1NWrpP+Cel0B88WFZQ0n9pXjVbxJVKlVxpOi0VSKxXDPyorKKeY3?=
 =?us-ascii?Q?nGI2E59NDFHIMMBu9yhW1WQfgWFcAWyPWp1BdNV4VXfyon24ePi9BeHrKHSz?=
 =?us-ascii?Q?rn0HaDAixdozcLvg4ng9LWMx8k3e/N+nryVVd7njnxt+mhjBeMj3vvMgAb2W?=
 =?us-ascii?Q?JmE4a9jmAKqGG+KXrONTIlQ9VL4Ryoq1rA2IemuusKhBtdosyPIYrrMzoeDm?=
 =?us-ascii?Q?qZkHZ9/zFDc9fJhzmKrRjb7GkHBtkWf6R8sz4xchib6e00//OX4VMDOIKrYU?=
 =?us-ascii?Q?TrnA8F+9kRVcc2Q4ycIP4vTrUekWBllPiOHb8/lZU36UJvUTEDiC0wTGyJhA?=
 =?us-ascii?Q?T4Lu6NtNzUpSGU3hijSBJ2Q04RiWDQuXYrYbSaJi1oTJ3WeQs2StPna9kIps?=
 =?us-ascii?Q?NFdsoD+YDy/AXtkBZo4/fDWB3+Ylxl41+GEvgpt2LBLMCpycSbkYoxtqYfth?=
 =?us-ascii?Q?WFIZv6BvO/j6CuUnRW4IgmLYHhIQLyQPE3w5hTlL0oep050D3sS+VPpwsaWU?=
 =?us-ascii?Q?5MYpBQcM+2lULPLXwidD8NgX8Zw9Yzh0/nD0l6w3DzixpPkIPLMkZDHlnQIf?=
 =?us-ascii?Q?Qwxd1Aal7615lDPx/qf21eFTxwwRjxjc9mfSM3gFYQbQU+j6uG3JjisRZ3bO?=
 =?us-ascii?Q?sAYWdLzmJmDyL69ypEg21fAivEtY2X8b+rzcYJGC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8ae930-32ec-4a1f-7c15-08dd9e6416a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:51:27.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+uF/JNjAELOKEUU8SmYA7qnt3Mg1FIDG1VLj2yun5HJ9Z1sPRnCQuA38hwHwDKGy0T0ZP3w5jNhC9x/EQdkRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-ORIG-GUID: 4IMkPwT7eVmNrQV6IWU5RKfzy1ZSX-kJ
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=6837d9c3 cx=c_pps a=EAmgx7X/BcpSCz1KBN8fIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=uLPss6bM1OIA:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=dJUAiDX55uI35IR_8BQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4IMkPwT7eVmNrQV6IWU5RKfzy1ZSX-kJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAzNCBTYWx0ZWRfX/uxHVq3nexF+ n+/yPTatQLaQFy/8NGOI3cFbANVHnPmFkGuGYLornnEpZtUcAn7MWfjvotnmIA2UWW6LlQeD1WS E/Fr7zzSNN5pTlHreFp0NVFyjCm5MVuUYgSZdbDedPdfj/ul3j+YQnWXU480ltSGwXY5hXji8Ja
 +wk6kUikpa06qAJhpWxvmGs1PNaeYBGTCtxtgzGpZqra9LHXFhTlrU7Ws/2xyRYUHCilwq0FqPL kmk3QWO4pq+WuWCOyEnq1w8ANxNfgp99RRvjGROO+KhUCod/SxnAvn8fN485v2gkzZNbA915vH3 ytX1R/LC7qaa/PgCj6kwYDfqYRhEqQ56lKK4KN2BQAMvol7lHyk7URhwGpmDqX+pt5AczczHUp1
 hQfyf9K5/OkWR9/FQwtUmwzkz9Aqz2BLi39NBe17KWNgk6rwyhNANq7gEiXMHmc/+CxNOayG
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9262

From: Chen Qi <Qi.Chen@windriver.com>

Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable
version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 495b0d17..41c4e227 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRCREV_distribution = "f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a"
+SRCREV_distribution = "9ed95e7365224025ee89365e12cf128e1f1bf965"
 SRC_URI = "git://github.com/docker/distribution.git;branch=main;name=distribution;destsuffix=git/src/github.com/distribution/distribution/v3;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=main;name=distributio
 
 PACKAGES =+ "docker-registry"
 
-PV = "v3.0.0-beta.1"
+PV = "v3.0.0"
 S = "${WORKDIR}/git/src/github.com/distribution/distribution/v3"
 
 GO_IMPORT = "import"
-- 
2.34.1


