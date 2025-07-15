Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52061C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:14:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2111.1752563642557778635
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 00:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9291446950=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F5q1Be3249306
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:14:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdrxg7a6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:14:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lafCYdHm4kWiJxwXa/Ja9aHV0XdfHkQLzeqJ/lb8Qc1qYDTX4c9UYcYjkzYgAh+NB6XYNFqSMw5Jp4BYg/CRATofxAvlFTwMEMO4yNRkZ7D+MK+lo+dpgX8lB0eIH7fIqYLvyKkOvf6yliBmM3ztrUskZ6Zeo//ywT2TxYTstMVa2pIR+r18TdLOeCCHVvC9mwelvEZLJM+GTb0PldYmsGMCdOR2AN+ztaM9tDcDxPaJN0Lpjnqyp/aLa0z0xPhd7reh/KwKK0l29w4iGfYykXdwN8W+ZJKwHUN887bTwG2Y05Qm8X9MzeVaElLsU0avOMP+H+mjRJYXhu9orzc6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGS9TAfhzDCeXhyWEQni9P4Wxwvg4begu2oXFd+s+ZY=;
 b=x1gZDNDGZ/cQEU3BdR4cDJQBz9EeP41H1u1cMSfoQ1P4n/beCybZVLhRK5cOPzm1hUVl/Fq9yDEF86DThtPas9tU+adcpBnw4GXMemp2Gz5ZsbPszKdq2Avl9BlnQfNzpNoEN35ei3grYbssl87zIvTb+BrT5Jwi5/afvxwRGsxb2xPa3BzPYnErdPM0ynzR8e62j8On+4MqMo+WOaiNfFwz3FvKtfaZ4m1WHur0XrtYi6Q64HJjhk4oVXyDTKuaeT/fjoQLHCEwbzP6eQZgZfmaXuijg6Up+S32h1NQp41InQjCJIZyS8IFTXtiHnKYqT3Q0N1Z6WqUiR8B7/cIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 07:13:59 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%3]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 07:13:59 +0000
From: peng.zhang1.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][walnascar][PATCH]  packagegroup-container: fix do_package_wrte_rpm issue in multilib build
Date: Tue, 15 Jul 2025 15:13:49 +0800
Message-ID: <20250715071349.2948270-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 072f956c-8f9a-4ef2-9257-08ddc36f2b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H9HIpKd0vgww+PYCQeIlocDfvDPv/KYiyISM1GvdmTv1mXVPlZs3dLS5g3Lo?=
 =?us-ascii?Q?znJynyg67UKw2znWRfaytJYJMHHUDvT8cyp+tFHUDQytu/OKoNn/nDlAZ6B9?=
 =?us-ascii?Q?AHf13ZEJ7TY/bHWc0xkCfvhnKc4WvslbJO3CqUpZ+40ybHXDDPWlM88Bhw+F?=
 =?us-ascii?Q?ZZOC2rkBqTn742+Fn0GDgw0FbtxIoQKb8tt/KDIvXG2qWtQHHlT/66gpVLxt?=
 =?us-ascii?Q?svjG6WKHs7LlrCucMXRHLNrJZt/BO5xi0lwbjCYgcH2hyJ6l8ofX8yYVHhjs?=
 =?us-ascii?Q?fQJpmPOyZRPeOcb3DlPV6xEdSPrjj6AqKix4hDl+e1IKdyYEqxXZFzD8kxgF?=
 =?us-ascii?Q?Uu/tBjdWO5NqHZ/HZjYfY+s6oPiapJTkQzPOvOnmBQdTKW9C7C7vuqKgagt7?=
 =?us-ascii?Q?rRpaWsGYQl4IsLB5VO+CuEnN08a0PizJEGYujf/P1BIH+V+jSDeJ3Klsf/Iy?=
 =?us-ascii?Q?p51CipXZqBi9slkU4wAONipAHBGy+UTDpp6oTbrH8Q81F3FIpVW531DtfHAe?=
 =?us-ascii?Q?P1iNCmXivc4K4r09P3vWYprn3gMkc/cDpU1V5FP+wfOJYdd9ZOQuRrZBjwM/?=
 =?us-ascii?Q?IKueUqVqy1SqNdp4WDgoMEMQgzYPvn6dZJaUvEN1AQcF2ZfRw1M3CNu4E9Ce?=
 =?us-ascii?Q?Uy0ipWWBUX1O7ZP/XIACbvabDe10Y0jImD3vny4nmzYPOmyrkdz9AFUpoNv/?=
 =?us-ascii?Q?4OiiMHCpbvcnzePZU6aNsn4KgDhKN+80xs7AiSum+19EzB4Ar3xcN/RN56rz?=
 =?us-ascii?Q?clSYA6osC64DQp4K+l/DxR+xEtLsa/RPgESO8ilATpKVRkFBYPosizgXRwGm?=
 =?us-ascii?Q?N1q4zufeNS8d39pte8PKlTPZF7ua7waq76dN6hVLmucvvyv4+Yq+LO9spCph?=
 =?us-ascii?Q?iEOkF/s8XhqENQr1pVgDMMwskcolEOim4fiRix+dZPhKEW+hEVmm58ci9nFE?=
 =?us-ascii?Q?hvdmMekeWOicOqcZ8PgGu1+ZW8hFWlM3tg/zbfBWacS3QvkkiEU1nwOvZmn+?=
 =?us-ascii?Q?N1BCLmKWCzOBFrQcmcaYhFIMBTJTu5mhxeAMM1tNZj/Hwsa9RwgIfxbAoRgo?=
 =?us-ascii?Q?G8GfteiLLOXM/M7bKi9HvYOXlDxJM5ssspbq2wL0EYY7QUUZmTAYzuJspnbs?=
 =?us-ascii?Q?6zP9ZfXGFzrNGhHp5kd7xwlTsAZT9/DcnGIuM7J59Uq+mzvOHL8Albj0Zx06?=
 =?us-ascii?Q?JSU4hRVaJA7uzz9duZr08TutG5MUO144GQ/hMgHo4CMFF9GYT1NES9nQUAiL?=
 =?us-ascii?Q?PvnhGpTGwtQnjA5q9FbCxS+WPaHDzdUC7lHMBT2sndT7kdCTsMSpNui4EtpI?=
 =?us-ascii?Q?sPzXRIjBiX8yZF8hn1hRT119nGZ68KhXlUUJpxB4D8eXXGsZV9zbk09UbS29?=
 =?us-ascii?Q?CLDNsUow4cCt7469Mr2YBPDl0hTtn+k3Hj9zNOSGtw85GswJ40I/MXM92WE3?=
 =?us-ascii?Q?GpzV2dIRlN67nNZ7cMkzm79uxBfZIhzGn7FcubqNJE8RZYjN32NWYw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QrOgDCN57EUUYCxcKyEZ7tloBAqeL6NAdLY4co7K/WpXC3howiL3PB2EdGT8?=
 =?us-ascii?Q?eIHUqtIElU0Q2s8uUJU+goWZB103coaqBK1eSYrYoiCmK2J8XUnP9bW3kiVn?=
 =?us-ascii?Q?qLQY18YMSGteN778pcg6GPAkDq0PEfZstpOGvVyK3/JMtjGAv7HtqexWMiG9?=
 =?us-ascii?Q?c7XPMNSnczbNAOuV6gGur6s/cWATgcdHj/gmfHjQplS1DU46FFhd3LeG9yM+?=
 =?us-ascii?Q?aL0q/dcxdYwd4+8a7GmARCGabNPoljXVAPz/aWAakuDNfDDoL/btV2Hxe/lg?=
 =?us-ascii?Q?JV/f4aZUOZcD0+7T35W5VBBWV/13EvlEmQF0uegXKeCLCddNTE+LgpXiEKnj?=
 =?us-ascii?Q?JIR75QGoSliGtzR1/asV83zBRLmiYp8dHsVYOkfErs9PjVdCS76TM4mhzBiY?=
 =?us-ascii?Q?V6wmsmh1fJjyyHL00mLRNLY2df+wGwoHhBSooCTlavhgXY9XOQDPw8W0zGpd?=
 =?us-ascii?Q?+7CcEnnJM2pA3fWNFMUkV1U1n9CvOGV0kN/VElC45cJhVUJCGnpcQsk0sWZE?=
 =?us-ascii?Q?i3/VTN0Lrp6LfwslB9tggxW105w80dpnl6tFew8glBXJbcjRVA/YaVV0ZDEN?=
 =?us-ascii?Q?wnlw6ViBL2QwXpXdVfrf4sEx8/OGiCmVal96jDVD8f79Z01DNGwhiO1sDgjA?=
 =?us-ascii?Q?VGfZ1FclhCWaFXjJkk7lYz6LnJMW72PB2n1CySiw2bTWHkcp/my4z5CJtXcy?=
 =?us-ascii?Q?HfmsHuhHrTyagPLAYuBRB8JwKDVor8S2Vf/ifbwxdOWHYhv7RcZ+6YLWeioG?=
 =?us-ascii?Q?1cy6sKXtHCdU3n28xlv18PgPIEJSll+UevOIFlztrb28Q1llfuH5IU/2Wi7G?=
 =?us-ascii?Q?o3qdhTVw0uQPdChVrMZbDprsMdRlxuguUZ41Sq+KLLNn9+tgyA6Q88GBdC+L?=
 =?us-ascii?Q?WatACW/NJerok6CzMjlQWqu5Bp0/2bJu0eQ2qqan5Xwx05g5BDsOW5kIJ8Wo?=
 =?us-ascii?Q?fU9OBrSWS0YoCjRUpRxCJNTSi8i1JeOgf95lm/3m+6c34tYvNKphfPxUyims?=
 =?us-ascii?Q?juKuuHOGTZ/o6RNw/96koAJZgvLPtgzXchLv9jWoVDGVQBjxowfLX0D/WSI8?=
 =?us-ascii?Q?nWXJ+PVJ59IcO+7Y1D9XNEwvEh4/ougkiR/VZCfw4TVZz02Cmi9swlqFn3UT?=
 =?us-ascii?Q?E8YCpwco45GZEM4lVdY6ugBaut/XyhJUdOe3umF074Q7cO1PliYxErgDvv8e?=
 =?us-ascii?Q?tKJRH3F50NGinw938XHBfOr5gKYckk9tJc6WZP87ado/Ss7KiUNmXa8PseMP?=
 =?us-ascii?Q?5Xy162YLF3y69oIlM9IBunqR5uAmROr1Y816S0LhDiimykDjDN0WaAVRI7Xw?=
 =?us-ascii?Q?MRUSfXHctZx4pTc0p7GVj087gQvhhGOUX7k2KYvuIfs/ewS8FRd1ztlz0uLZ?=
 =?us-ascii?Q?GZJsHUUakLjWTrBAnuQx13Gat1eoevTrRwgMQ0D6+ia0O5xVBIsuLUF2SV14?=
 =?us-ascii?Q?wgeF4R0+a3ir9Ksleb5Mw1xNtN81Mpjlffjn5ZNMo036CmXUgpaDXET30Sds?=
 =?us-ascii?Q?foQhmnRSN2wU1CmKbJ21fM6kYaizNopPAsNCjfcS8nbEI10DxXvvfeUEV1xM?=
 =?us-ascii?Q?7IQ/sn6t8kVniTv78BnJbwQJ3IPuSwtWnJCYwhGNCSFT4TjpWmYjgMvofK0E?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072f956c-8f9a-4ef2-9257-08ddc36f2b79
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:13:59.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxo016LF783PbaIVp8C4nf4i823bTzH+/qgkx3qtGmyWFXGes+n9JpVC4Js+BGH4hWAnF31l7KXne5sLtHtgixARFQDF7EY7KP9GWQPdWCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
X-Proofpoint-ORIG-GUID: 0ecEgztX_QIxGjtszBfIPi9lX1Ga3uZD
X-Authority-Analysis: v=2.4 cv=L8odQ/T8 c=1 sm=1 tr=0 ts=6875ffb9 cx=c_pps
 a=CHUU9Waq/q7g59rgN7aXOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=uLPss6bM1OIA:10
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=4ADz7scsjLnKZ40IG9EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0ecEgztX_QIxGjtszBfIPi9lX1Ga3uZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfXwLFC54KdOb5l
 3Df5jP4KwT9aQnxlwreH4GLhm/gDVoJx3hclsQJJYVNsIMZ15iBw0FJc9/d4M5467ezh1z0P1iM
 yRPV0lazmBsbqBIrzseZnNmz0ypKkOWO8FfAGBAaE3SwV1O2YAGg+v7W1R1uDGwazCI30uzXt3h
 Y0Y8eg6RTxRGTcu4mx88IYMv4p3IEx/T0lHeJ+bNimR0zpmUuDT7CQ0ULJlWndDV2YoJJv2Qkom
 KVvTK2FRiaCq3uMqqnr2Z/mlN/N+WL7Wq546bNpShXfv6LaWoEw2y0Je49VHLS5eEetwwRdQlPo
 Z0TyWNwJPKCWBY/1nQKWziPLqCJzhePNHYZI3E3AOQM4NNCnzFg7bXotFn0BNKN2L9YAI4hdGbK
 gtxPfF6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:14:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9308

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When build lib32-packagegroup-container, the follwing error occurred:

ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
depend on packages which are dynamically renamed (lib32-ipset-dbg to ipset-dbg)
ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
depend on packages which are dynamically renamed (lib32-ipset to ipset)
ERROR: lib32-packagegroup-container-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't
depend on packages which are dynamically renamed (lib32-ipset-dev to ipset-dev)

To resolve this issue in a multilib build, set PACKAGE_ARCH appropriately to avoid using allarch.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index f5e20344..b94e6799 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -2,6 +2,8 @@ SUMMARY = "All packages for container host"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 COMPATIBLE_HOST = "^(?!(mips|riscv)).*"
-- 
2.50.0


