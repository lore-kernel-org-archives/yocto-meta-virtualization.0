Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AB1C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 07:08:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.62580.1722496124458450145
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 00:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8943f0cda4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714oBo6000459
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 1 Aug 2024 07:08:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mp3xcysp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 07:08:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV612euIDbrCZkJw56x0IB5OKgCfbm8M3ZUcZR1q1UUmxfjIQBl6gzr89Gieu6XOVfVUxohe00AA0we9yYvOjmM3dVVkBcfYp/+hFPse13vu1m1HpOqlHPzPu49DWDqb42pnxLMg6XXgCge7J5g4Y8A14+SSeJufoksFPqGgNmhGem3PE/YYR9JFae2ypo6zKo0Fq/D8s7dDvz4jrXgvTQFgRrj58K2iQyANCoL6THvdmJgCeXFj01RX8/Yc2A/fjU39AtcepD4t1YMFpBMThlHJzPNFx20v3gGfk3bE3nTtuPpC2UznlpBngY1wtLjLJg3nCyITwKqSTDaWYA7pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaK4Hm8/TnOHiTrpjUGTUQfdQHbj2MQ7Pjmq/5FJSG0=;
 b=qtr5PF+iDiP+IQio77QmA84Ym0Ip3JVBYCAdMVzT9k4KncaVpzHUQk4ESYyBtYZla4OGVPiJvV/2NvlLVndfthxBrIC9pKLPaq+7g7/DEaYsEsPGgaFeE/N5JNRC3Q9CY/6FvhtMv3/7U0co3vCiHQLRBSv7mhgsP2l7fYkKdR/cTvgWhT2WyuE4QP3oT5ZU0p5OWXLJX8SloPp1X7P7WFSGijLKe2nEKPjP7ZpGBdJ0TgQQRPmz/Q43a3A0TZEV5dtKrMvGxLdUzAKnFjvDUK9d76g7/fyg5A1v3UXfC40MQkPgef62sG79oy6zfD0kvu/NuFsfpQS06lXbHUgWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Thu, 1 Aug
 2024 07:08:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 07:08:39 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][scarthgap][PATCH] kubernetes: fix runtime init error caused by git shallow tarball
Date: Thu,  1 Aug 2024 00:08:27 -0700
Message-Id: <20240801070827.2759041-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:180::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 81926381-2e94-46e2-2ac6-08dcb1f8c49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l1D5XcH+hZ+6LPylgwXoOCIvyBA1/Kb4+gA/aVNXhK/G4mECWge0C1E6SVgD?=
 =?us-ascii?Q?2g3D8Fx5wf9jO2P1ovtODPcLa0rTpb3z2xHXOWzT2qCJSYoANbUM3CcCqVLk?=
 =?us-ascii?Q?nBKhecGHEZt8c42UbmgT0UTXb4Mt9kW9Z3NFc6ZoxTRkzSNPpqWTMwDumMuq?=
 =?us-ascii?Q?u+yCghZJLsWMSlwiAmaDkl9Q/vBGR9jZ36VZnSImGRdEft9TEMK+XODD7iea?=
 =?us-ascii?Q?sWFPtNWVfmVd/xmDbYfAfBVm2rrlQp/Xc1QpG4+htN85mwBStl62VswGptqo?=
 =?us-ascii?Q?I+0+FxV22+PeJbfXr3T66JCcX1wogkJStHDY5sYWxvBIKKSvI5olTxsjumoS?=
 =?us-ascii?Q?dMkUNlAYk/UUAQhTgInpCtc5EOl8p/XCePPgrMJX+kbv94cvdbwjep0mZC89?=
 =?us-ascii?Q?KdLkDEPUHEzzMYUcDoWweHLSxLnRf5qsRyuKW36YyHuC3L3W0YSzNCO4yxtO?=
 =?us-ascii?Q?tbWA+cjElGOzkC66enIX6mgxM6052VMYBudqtaC8Suyx5oEv5TXMjkcUD+co?=
 =?us-ascii?Q?SCoUyzrraUebQdv8HEjcm3cIBO88dnj3XDz3TWxNYCI7RVIBWcAP/9gH+JCM?=
 =?us-ascii?Q?giN+2K88FxDwYvJkVULk2U7YKYY10S/OUiDcp34a63L2r6iHQbiT6fHczy0x?=
 =?us-ascii?Q?83v12mz04GVcf4fXc3MFeIsW/YRuMbEpEj1npkNNJb9ja0h7o4ydji7h0iAs?=
 =?us-ascii?Q?C7tmWXn8Gt0+A2VmFx8yc2MHgIrHYma0WyuSmgvEbUNDqiZQJikB9ZWIgc4O?=
 =?us-ascii?Q?YFWmah14tVdM9GW++lqXCH5rx8b8kM+cz12HSK29p+BcyFsoglC19ShRrby1?=
 =?us-ascii?Q?+jmTXXJ6Qs6RqvLYpDjOK5SDq8zcfuHkoRbHkP4nIfY1obU/05vkg/sJGjU3?=
 =?us-ascii?Q?6RiALNTuMW1y5iElX3MyIuG7Es3iV2fokbagou1+5Lo/ypbIJ+HC0Yal58Xz?=
 =?us-ascii?Q?SdDir7S1VbafJ2LPcKH6Ctj6CWaIqYOzf9J8AmG3ATcgCRnjaljAGWCjhDvC?=
 =?us-ascii?Q?rFIaboHXKhUrjmk3ZkbZWZc9zi2rmu2UD4HfUnFpuDHzX0tGWAB9WtwH8ZJN?=
 =?us-ascii?Q?x8nlqn/UNmJmVlY0F3AsiJxWt7CZs9Qzcb5RBjvpwcecrSQI8kavSwNfITLA?=
 =?us-ascii?Q?IDBD7AitRLZkxFqlvraHk8ML6Le8VchZSh6E+j7x6VQ2l9xjR7vbdKGihj2N?=
 =?us-ascii?Q?1BqoVZIDbQmALPHV1sweZKnTOOXNDPsO6DdHviy1ThNrTWcg+YZQAgJzhFvy?=
 =?us-ascii?Q?dlOE5k1u3398E//jim/Fbr2QwArLtDZFLztARs19/6At66wUq4ykYHW8LX50?=
 =?us-ascii?Q?LnX+6I1wSiE+0ZwRJLCrcBoVQBh/0WZmfX1G/xJKQrt0j2ySZ0b0jws0TAPC?=
 =?us-ascii?Q?J0jpQ4fx3g/ZpEEXQcZnHWzEjOLN0poIypd+EOcPaLNsGenGBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mVU1nHmklGelM8wMfJwMxMJi8774HAsBs/5Tnj9vZ8533VB0DROxfHEOhYas?=
 =?us-ascii?Q?kgrwH/klqHebKlX2m9NKFjqjNLOPkQmd7Tn1vvp4Tae5vvlfHpJoCDqNZLfs?=
 =?us-ascii?Q?FOX/1xaeLNvjhtObsAF+BqswzP2IuNzdewQYzM3NPvi4vhLQsU6+oaQSTsYF?=
 =?us-ascii?Q?eUe4Myb5BoUxiepgLS233OhZMPogD2NKhH11ZujXGd48J94z4xZJtiv9UC6v?=
 =?us-ascii?Q?BqFffhvN1hR1ZtYIFOfWjOa7/1pEN26aHy3m3felA0hWU9ZTUQONTeMV3/GC?=
 =?us-ascii?Q?MG21iMmbigzQ6pPoN4E/qv2WcythcVuynI4DBgVdZ0AjHh4u1QCMgzbYeWxZ?=
 =?us-ascii?Q?vsKl3UH1H5RYD8xyLIXEM63pGVHXKsfANGRWX1F3JRxUcwpsKzEU3Pw0FeDe?=
 =?us-ascii?Q?pdbUOgVPpgoiaf97VHEX199Fu4dtWSUS+y+2DAxLv72Z6w77/mZ9wCuJly1n?=
 =?us-ascii?Q?syYSNgXBvkDtjZKmrGLnPULmYbMXLJZWCaxeuVjx+KmyJzVkLMP9TxlzPHTG?=
 =?us-ascii?Q?YIL65X3jzeREtbYvJEn2tMcIycM4wt9FlKBJFrE1HpCGGTU4Zj+1Piwvl2xq?=
 =?us-ascii?Q?/WvJpue6e1TKzQMxLwBd15Oqs0QmGt0tw7jEgRv7cYweRALa3dysWCK38Ill?=
 =?us-ascii?Q?kEgKXbHelxoD7VRRKmi60qi3LnwsdFy3DobNMfbQoKv7ltWIY52o4z5pMvho?=
 =?us-ascii?Q?PMdifPvclEor3ZLmKW6R/bpWkmDdygoHTa2PMsNAyq/eHQAp0Lqk5Kl2jQ1u?=
 =?us-ascii?Q?DtfZB7cNWNeKhwuOG1cFpzkWWsRKPhgIskV07bf02wc7HM4+8GFMpL8AGZrE?=
 =?us-ascii?Q?yT/clH5M+919P88uL24aps5pdpzC+se8NSo0qiDrTnvPK9au+N62xOLXy1Ga?=
 =?us-ascii?Q?FVojeCDiUA319tJpOL+Xs44OKmFZqzooSv1T2mYPdi/e8FralgO9Cir0x4f/?=
 =?us-ascii?Q?mbfNJE4heTxpEz+XgRMHDF4M1o55etZnvjI6joQh2h3VH/8V6xtxl/BPPmsm?=
 =?us-ascii?Q?xYojT97+i+qLvUKIiDYwBmRLIVtGX1P7BTM62k0iWtjyc47ZY8WKl5YSpE1I?=
 =?us-ascii?Q?pDY0llUwwW91EERZy6S61Hq2/fpqD0Epwl2A2CbTEQiXbXeBaVPGydYQoe/h?=
 =?us-ascii?Q?VPNULFSbY62id5/Y/oCrnx3pXUmgOsoTFVZ4mfQeNpkdNUQkv5w6MX+wN6KR?=
 =?us-ascii?Q?rR0z14nf0Qso1EaJdz7o/GhwPYV+mnbIcZLRTjSULgZx7i3y476/tf29Zs4A?=
 =?us-ascii?Q?4p99ZEMXbgGrEPxbnLH9/RM83hyZ6jqfBBNEgk8TuouKmhgShoapdbsYi08d?=
 =?us-ascii?Q?CuKOYZT2FLTYI6uOoy9tnty74JzK2Vjgkl+iopZc7vUISUJ4jZdYf13Txadq?=
 =?us-ascii?Q?klJL/yUd4o5q0m6HYuTwJO2/SMMc3QDUc+0zOWp3yZrXduKBUCHqfneMh2d5?=
 =?us-ascii?Q?NdwXlgmSWvKv4EAdeJax/NwS5LwYP8mQjnG0dKqDs971U6vIF8GyiL1yG1nA?=
 =?us-ascii?Q?jJjucneqvgw2AINkuNEPKMUBEkKukOqCPLbHcmuzbw8B23gaHQLmjLaCtkbU?=
 =?us-ascii?Q?s0APswjXk6fWoNYYjKtVLpEl9N21wycRGqTgYRA6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81926381-2e94-46e2-2ac6-08dcb1f8c49b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 07:08:39.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrjdKtQmCrTfRaGS/cOOcWaCk9DWH5jDdG2UR1NXuVznVMJ+sXiQvsULlOkQixpEzSIpJ2h8FgSNK0U8/Mm/5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
X-Proofpoint-GUID: xvCqmSdaAc3ChSoG_xi5qGKVWvzmcud2
X-Proofpoint-ORIG-GUID: xvCqmSdaAc3ChSoG_xi5qGKVWvzmcud2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_04,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408010040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Aug 2024 07:08:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8850

From: Chen Qi <Qi.Chen@windriver.com>

k8s uses 'git describe' to determine its version and passes it to
go ldflags at build time. This value is actually very important,
because 'kubeadm init' will use it.

In case of shallow tarball, the git history is not complete and
the command 'git describe' not succeed, resulting in a default
version, v0.0.0-master+$Format:%H$. This causes 'kubeadm init'
failure like below:

  [init] Using Kubernetes version: v1.0.0-placeholder-version
  [preflight] Running pre-flight checks
  error execution phase preflight: [preflight] Some fatal errors occurred:
    [ERROR KubeletVersion]: couldn't get kubelet version: Unable to parse
    output from Kubelet: "Kubernetes v0.0.0-master+$Format:%H$"

Fix this by exporting KUBE_GIT_VERSION explicitly. This export
line is deliberately put right under the PV & SRCREV settings
so that when people upgrade k8s, they don't forget to update
this value too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index a742486c..a6fcff90 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -10,6 +10,11 @@ CVE_VERSION = "1.29.1"
 SRCREV_kubernetes = "a02da633101bd7919153dd56412b09221c0139bf"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
+# NOTE: update the following value when upgrading k8s
+# The value is derived from the following command in k8s repo:
+#   git describe --tags --match='v*' --abbrev=14 "a02da633101bd7919153dd56412b09221c0139bf^{commit}"
+# This following setting is needed in case, otherwise there'll be runtime error in case of shallow tarball.
+export KUBE_GIT_VERSION="v1.29.1-1-ga02da633101bd7"
 
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-- 
2.25.1


