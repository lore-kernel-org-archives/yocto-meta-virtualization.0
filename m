Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0350AD13595
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 07:36:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46148.1730100981407661428
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 00:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0031103954=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S6KnJI006352
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 00:36:21 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gyxjshvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 00:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxvdvJDyppQre+jhGiqmO+KuF44oPZa/A0xT8MmIPcAdh9AKWYIenomA/Rq9HQg2Pfp4pFXmDxgQLE3ucT6euLUH8sVqKgJFNvplAj/WdzyVDRgUES9uaPE+Og2NLdWw+lNPx5eMLfHeN5Or1TyvThUPUs0Sd0DQiU7dSO4CB3m7eFyYP0w+jszmJoNDi5lerUFSkquhSinBLTI4WDYa77ICXISYx8Y8j3QvshX5PuKcPJ32Na95LAoaiMB+GazXu0MUslyZyoHhKgd+bIs5RNt8VPjzmuh1qx6SxWjz7g0FcdRVEOreYlepnI4S7sXdDzZ8fXH3n922HwxHOGCXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njxOL0Laj2h9hI7xKTyOmyif6JDbdHamgVRCymPW1RY=;
 b=b/sgASBELrSAXROaeqqRbix7LU1UWNRNCMNrzylvqh4Ns/7g72hPtsWpcqnTc62AZJrmMrpDsvKEmu/XlukSwZY8fMcRpMiVGqSoiQRQ95RLWxPZNgCXDML9PuuY2COxRLWOVyN86t9unDsbHTvPdJlyFckvzQKm9KUk2hmPd0rDzFbtI3tdcBtuTqNDsvlZbDfAEnCqTsGBLl1EEHt/enWXZzBSdVL2F3ftJRoCe8O9l529CpXWce2DOuogAQOrQi/lqxIWafZyrfv8NyTGBB7AIxTBa1+1q1fWAtXxpyVJJfMncNkjEJ1WcbkkZUgQMDKfK2xqjgvs3VQxb5XO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 07:36:18 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 07:36:18 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] openvswitch: 3.3.2
Date: Mon, 28 Oct 2024 15:38:45 +0800
Message-Id: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8ed224-5988-48bf-fcd0-08dcf7233608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?02N9c9nCk8vF1nYq7ULshygbx060jkjZPF5W0VhqeCjg4WUFVcRIij+iKVYC?=
 =?us-ascii?Q?MwQp7QJ3BRs48lr/1gRvWdu+Ni/z3anu9PQZKHGRsaVjMO/uNE9+zKCJD8jF?=
 =?us-ascii?Q?1o5bwadzq7RqnxN1/eXm5SwyVJzsOHebqV+j89l/Q721X6eVHchZvvy/cDBR?=
 =?us-ascii?Q?TrKE/guE1SYjifThQDdi/Dpccehc3JqdfN4fqHUu16jJZFQCSNLwQUesn7nc?=
 =?us-ascii?Q?e1Td118ACFjC7j6fDCwHivsZBMavkVayPVjAMb0/LB975wKsEFAj3++BPyuR?=
 =?us-ascii?Q?OJEAxtnS5SIY/gmtMgJHeo9MxDVYnyunBSO3KVA1osyISVG9VltXqyXeesyI?=
 =?us-ascii?Q?JWby+t8jDh01aQdJ1YfEP7r6KTFdYLThP7fyWyZa9Aw9aNWBP1M0a/a1T2a5?=
 =?us-ascii?Q?r6kV8xvjJjtlw0doKjnPzm0SXt/nHlHI+TEbtx7mmmA+48HVIR3Rg01wpau3?=
 =?us-ascii?Q?6DHrcQz3+L2HP23MkFyvyG9HP6JUT98AT9F2i3GvLdRrVVz93kMt0uhIvaZX?=
 =?us-ascii?Q?UbbDC2DJGHKCnMK23rchmZqYdFFWP1opclBwPVPM/ovPK4Q+V2H/UI+JJUId?=
 =?us-ascii?Q?GJUpRqWaEeiGBg2vMUh/4tPH/qIa8kOvwUDUDZBwB2RwjmgJDdt6qIcOWDhX?=
 =?us-ascii?Q?eUB66Il9F7ZdufUfOFvGeSVPLw9yQEHmoE79nto8z1kUzeMwXT3DJefAjSJ7?=
 =?us-ascii?Q?Ars3L7vME73LhQih6NdriHg9v1jRAWWmlmk734vUGpnfBcHr65rKRoUKBwPs?=
 =?us-ascii?Q?vO6OSrHcwU9HclsevsA9X0tElSBQbtHzYMASTatcn4O/yFYq38UmQCHAchj7?=
 =?us-ascii?Q?WaslalZyN7bzrf+QIYfLbbvig/1JyuC1UnJd8uN2xbLW6syBvzirqTdrPKrY?=
 =?us-ascii?Q?wkySPQo0mZgbRoYntTmNDzFg9og6agtPeNzggRgQt+Y7oOCEll+10RXLaxY2?=
 =?us-ascii?Q?lXHCxkfontjFZRToWgNNP4OMJMG2N/bNzIY6VPRqavLhPgpQxf3l9WnsgiVv?=
 =?us-ascii?Q?QPwi/WFIxBqMKKMPex185AB1QZGZJKC3fyWHRm3EAz8P4m34k01ZHbzkVqE3?=
 =?us-ascii?Q?tc5UA6fz0i4eX9YwS2HC+ISDdzRRVNkp5EPh7ldqNaeg/EEGoCm59kerk2J6?=
 =?us-ascii?Q?67hBSPvvLHBsWxbyA40p0wKNbTTEnB+jZPZfDLFYJ3mh2iYy0aeHB7ylMGhT?=
 =?us-ascii?Q?zwuap4MWaY1RJkoBun7cr8QsfV3CbbTqguBNEt1ve7W3NffabPhmvnOeE45I?=
 =?us-ascii?Q?O/44K/mF/P0pboKA+Ehd7vc3x3Cx6VlwsC9AFYhelR2F6mGptq13vB/8gRem?=
 =?us-ascii?Q?o6KaaCq6WXdgWsn6WP4cGqRE3NePmnAeKDSRcsdC4pr1CFmTva3sqjRF18tx?=
 =?us-ascii?Q?dyyY/ig=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ML5CJFyNIZZxr49QW1En0fQkuMLc7pt6Ah0eMVWDNsIKUsJpiOCGl5JM58XX?=
 =?us-ascii?Q?8SaoNNeYdCWznV5yLzMLIAaUsKXn5fVlryMnipsJ727CLH6gExV37bdtT2Yz?=
 =?us-ascii?Q?v1OVKh7foraZgIt7NdrpHre0Gxd/DuLIKEHgugL+DEUoT69Dr0Q7Ej456UKx?=
 =?us-ascii?Q?2oRDCo6EzlWqofzPOgr3EOooUeDy8fIPlIbvntkYkxWLJCeJW1zMezcamnDi?=
 =?us-ascii?Q?WaK9dQyCIVQVLJLcUOeeS/EPGVCDMT/Ju1Dd6/3wRTBXaXsyWvR43TFkZ5wV?=
 =?us-ascii?Q?VKDyEZw+z68sP1om115Sn1uSlcu4iNKQ1iM2wOZEUmV3BOiZNJV+FMyRgjai?=
 =?us-ascii?Q?Zz3JXtAdyXIPm1/vRBww4N9C9af6RQHDYEwrB7j+n6gCfsNJV9NvEulm4nsz?=
 =?us-ascii?Q?tKsReKPa5tPX8aoOb8J/qjgxrf2JLX6Amxy+mOJC5wUq9luqit2igqwNYMPQ?=
 =?us-ascii?Q?Gc9ONoqxlQOWAJgmzWW3FROOIBv8Zdmkp2iOAbS9bYfoM67s+Vw+UfbSa2gN?=
 =?us-ascii?Q?IJ7YUyA6oHJEcrBiB6MrQ9oXWa90I+Q/dZDGVScG/Mvn9Hkz5ZDIgxdI80Mx?=
 =?us-ascii?Q?RgneRoqFXFjVWPUMkGYwnf4ZMJYccImNKWvDvHmv8AM6Hw3pFv+bc269iQhu?=
 =?us-ascii?Q?3ydtTW3mIup05dX9LJomt2FKZP7+IUWFKX2kzMvstN5mLQp4yFINY3cy+TBv?=
 =?us-ascii?Q?JStxngXBbSIsSlijFXBtPKGMCY/fLB9i1frB2n8QgB6IGDxXUSqKifNexJWV?=
 =?us-ascii?Q?nmMxeEMqVPd9N/lgnh98yBOBvWc6DEcoiaehGsd2/WnPTcb2qyVVThrESh2D?=
 =?us-ascii?Q?rn9cpctK8i5R5qxgw75GF5xW90esYQ+NfhyfNuyaUmlTWiYPmJsSGnpyLKdd?=
 =?us-ascii?Q?q4dt8f7cNffsIHatXKp6R8/WWdrGsTCoqe6UhfzwRLu/Y+Yw4NSpd0hffaXO?=
 =?us-ascii?Q?aJ0q60hLhuA4J8Cq4dN9mm4PmnOu6pqcpZVNcpDsfn6rlIV3p0MQwtDPaxn1?=
 =?us-ascii?Q?meOPYA4PcbpXuDKtU0MA+CViXwZ90idpffweDXjBUqmVyZ6/H3bpQ0DCOzD8?=
 =?us-ascii?Q?IK3yJHPbjCVkyknuG5ev8eK0QxH5T/2eaPrwyLOUfqhLw82ndxmOx6tLjUKr?=
 =?us-ascii?Q?D5nT6fi7ZwYq/ATL7y7LRbeC2B7owyjOvvleLSyI9+nxg2ei1fgiNITaPO4n?=
 =?us-ascii?Q?mgO1wB8SwK3pUQtQsldQfcxHXkklmG2vgkUCjBBmaAJTQc2vEDO4I0X3XU14?=
 =?us-ascii?Q?29dgKS19KKVQavDnXRxlZWfUHc5x28Yt+JJUx8VtQEgVyVpW0QZnn0yq06Gd?=
 =?us-ascii?Q?eUaCkHyKR7lzSwbY+GJFcVKVox5il9DgpuuV/nOGVpcXJ72B5+5vdR23EaUU?=
 =?us-ascii?Q?yiINZipZ/1DfOCGAWqFLOCg9buMY2obaFRESDO4ssvncNHPJJXDA0EKfIie3?=
 =?us-ascii?Q?FQDQlfE3Vegsq07RQ5dYp2+NPa8goYLcG3aYWmascEyrJyjdJYvISjTixvHr?=
 =?us-ascii?Q?j1UO2OjwdQ634Cm0Yvw9kx4sGrN/d4qCe/Jr8rKYcagh1B2G/ciUYZm35dK+?=
 =?us-ascii?Q?nsjzUbS8r9ZwHk2/61MIj/V6z3FHqrxXtItqcu8YCsqvmDg6Fb+S/mLCsdMp?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8ed224-5988-48bf-fcd0-08dcf7233608
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:36:18.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3fphe29/WyyQ1TBoUUA3A/im5Jim3eKrvNpou0RHj45jBBBH5ZXlNDhbtgIcKm9DUeR8N7VHrmpvVD8ICwALetZP1fv7S11iRSkSayujtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-Authority-Analysis: v=2.4 cv=eZtvfKEH c=1 sm=1 tr=0 ts=671f3ef4 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=_Eqp4RXO4fwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=if9nhvlABXljdODbkrYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: iojiPZa-IBXmBKlWOaJ70xMocpy_RRsF
X-Proofpoint-ORIG-GUID: iojiPZa-IBXmBKlWOaJ70xMocpy_RRsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410280062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 07:36:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8937

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Bumping ovs to version v3.3.2, which comprises the following commits:
dfe601bbc (tag: v3.3.2) Set release date for 3.3.2.
a097f4a39 docs: Fix argument formatting in ovs-appctl(8) man page.
1e6c69169 dp-packet: Correct IPv4 checksum calculation.
c1c70e083 netdev-linux: Fix unaligned access to rpl_rtnl_link_stats64.
b176cea4f route-table: Fix another UBsan warning about pointer type.
9fac5b970 netdev-linux: Do not offload IP checksum.
73c563efc tunnel, tests: Add test for mirroring over tunnels.
81e64f47d ofproto-dpif-xlate: Add a recursion limit to tunnel address lookup.
742812517 netdev-dpdk: Fix race condition in mempool information dump.
e0c0302d7 ovsdb: transaction: Remove incorrect transaction abort in pre-commit.
59d80787a netlink-notifier: Silence the UBsan's function pointer mismatch error.
bd133fcf6 Documentation: Update QEMU documentation URLs.
6738b680e match: Fix false-positive snprintf size warning.
5bf4c0f09 util: Add non-NULL format assertion to xvasprintf.
9cbd8804d docs: Define Read the Docs configuration for Sphinx HTML parameters.
6eca4d13c flow: Fix unaligned access to the ND target in miniflow_extract.
d2119feb0 dpif-netlink-rtnl: Fix netdev leak in out-of-tree tunnels probe.
9c439c23e dpctl: Fix netdev reference leak in "show" command.
15cbfb19f cirrus: Update to FreeBSD 14.1.
a3722ab1f ovs-monitor-ipsec: LibreSwan v5 support.
bd18a1373 ovs-monitor-ipsec: LibreSwan autodetect version.
504efbe92 netdev-dpdk: Check pending reset when adding device.
2393305d9 odp-execute: Check IPv4 checksum offload flag in AVX.
0aec0c2cc odp-execute: Set IPv6 traffic class in AVX implementation.
dd1aea7f8 ofp-prop: Fix unaligned 128 bit access.
830fd4823 dpdk: Check other_config:dpdk-extra for '--lcores'.
8499e9027 Prepare for 3.3.2.
2b87b844d (tag: v3.3.1) Set release date for 3.3.1.
81d2804fc python: ovs: flow: Fix nested check_pkt_len acts.
8c15b5c0f python: idl: Fix index not being updated on row modification.
80c935dba python: ovsdb-idl: Convert new_uuid insert() arg to UUID.
6b6d7f05d python: ovsdb-idl: Make IndexedRows mirror hmap.
479dd96e1 ci: Restore vhost-user unit tests in check-dpdk.
cc9962248 system-dpdk: Fix socket conflict when starting testpmd.
5bb95ad08 netdev-dpdk: Refactor tunnel checksum offloading.
a9248871a netdev-dpdk: Use guest TSO segmentation size hint.
55d2e6d3d netdev-dpdk: Refactor TSO request code.
2fe3ab83a netdev-dpdk: Fix inner checksum when outer is not supported.
537a6bcda netdev-dpdk: Disable outer UDP checksum for net/iavf.
2e03f5567 netdev-dpdk: Fallback to non tunnel checksum offloading.
7916a2417 nsh: Add support to compose-packet and use it in system tests.
310cf419e tests: Convert ND, MPLS and CT sendpkt tests to compose-packet.
96efed349 tests: sendpkt: Allow different input formats.
2e89ed994 ipf: Handle common case of ipf defragmentation.
69424e53b ipf: Only add fragments to batch of same dl_type.
5cfbc915d python: ovsdb-idl: Use monitor_cond for _Server DB.
84c83589b ovsdb-idl: Add C IDL test for "monitor" fallback.
79608c4fd tests: Fix non-portable plus match in python vlog test.
6688bff49 odp-execute: Fix AVX checksum calculation.
0ec55bbe9 dpdk: Use DPDK 23.11.1 release for OVS 3.3.
a3022b08a netdev-linux: Initialize link speed in error conditions.
216c2c1ff netdev-linux: Return an error if device feature names are empty.
1b78323a2 socket: Fix uninitialized values in inet_parse_ functions.
4ece94d2a dpctl: Fix uninitialized value when deleting flows.
7ee12c5ae netdev-native-tnl: Fix use of uninitialized offset on SRv6 header pop.
258bc1e0c netdev-linux: Fix ethtool_cmd is partly outside array bounds.
ffbce0c42 atlocal: Replace deprecated pkg_resources.
1f0423a4e atlocal: Fix setting HAVE_PYTEST on unexpected errors.
95baf295a srv6: Fix misaligned writes to segment list.
8d4ba3b5a compiler: Fix errors in Clang 17 ubsan checks.
d153eff60 table: Fix freeing global variable.
f02dc3cfe vlog: Destroy async_append first then close log_fd.
bf1b16364 conntrack: Fully initialize conn struct before insertion.
cf461fe28 conntrack: Do not use {0} to initialize unions.
20ed5491c ovsdb-client: Add missing arg to help for 'dump'.
4756bf4ba ofproto-dpif-trace: Fix access to an out-of-scope stack memory.
01eca18be hash, jhash: Fix unaligned access to the hash remainder.
4f61523c0 sparse: Add additional define for sparse on GCC >= 14.
9a5c24d70 sparse: Add immintrin.h header.
3528cc6f4 tc: Fix -Wgnu-variable-sized-type-not-at-end warning with Clang 18.
5814de568 tests: Fix build failure with Clang 18 due to -Wformat-truncation.
a6c3b5202 netdev-dpdk: Fix possible memory leak configuring VF MAC address.
42e685916 ovsdb: raft: Fix probe intervals after install snapshot request.
1c44cb596 ovsdb: raft: Fix inability to join a cluster with a large database.
5966c22b8 rhel/systemd: Set ovsdb-server timeout to 5 minutes.
f19448b86 github: Update python to 3.12.
b705fb8dd ovsdb-dot: Fix flake8 issues.
1ac823cb0 ovsdb-doc: Fix syntax warning with Python 3.12 and flake8 issues.
7e99dbd8a python: Remove hacking dependency and use recent flake8.
41055da76 cirrus: Update to FreeBSD 13.3.
6448c1b69 vlog: Log stack trace on vlog_abort.
a6852319b tests: Fix compatibility issue with Python 3.13 in vlog.at.
775507fe9 ofproto-dpif-upcall: Fix ukey installation failure logs and counters.
b26baf873 conntrack: Do not use icmp reverse helper for icmpv6.
b9f28c586 conntrack: Fix SNAT with exhaustion system test.
43db93787 ovsdb: raft: Fix inability to join after leadership change round trip.
2a2f162b5 ovsdb: raft: Fix assertion when 1-node cluster looses leadership.
a174a5ab8 ovsdb: raft: Fix permanent joining state on a cluster member.
5eac230f2 ovsdb: raft: Fix time intervals for multitasking while joining.
99fe661f0 ovsdb: raft: Avoid transferring leadership to unavailable servers.
c560f6ca3 ofproto-dpif-xlate: Fix continuations with associated metering.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index b7d9b8dd..46b1e773 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "3.3.0"
-CVE_VERSION = "3.3.0"
+PV = "3.3.2"
+CVE_VERSION = "3.3.2"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "1c1f173ce8a8534e262083bc4db3ee15f05231c0"
+SRCREV = "dfe601bbc154c836e6ec3526a1eb331c1c09a06e"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.3 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.35.5


