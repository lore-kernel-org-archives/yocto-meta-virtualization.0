Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AA6C433FE
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 11:20:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5903.1643368816178592354
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 03:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eM4Uri6X;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9027b8002c=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SBIvud020618;
	Fri, 28 Jan 2022 03:20:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=wttiGinyaRxlB+ip1WLyQwgjsa0QZFDrUWmjk4qV3kc=;
 b=eM4Uri6XJxB7LysrrACgxxjfx+EQkJ2VVxqX0Qagd6nBn7IA+Ocx6a5n1mwmFd9aw74Q
 hw/T6+4FLcJTPvWyY9v5Fj6M++n4DQdLC9fxaLKFppjrsjqJgM9XRxYIorlkR5NeG9SC
 MiqireoC++8enZDRskllf0Z7rbhqvgzJZXoQ+fJL54ocbpEGOpKv/RHARICBsunGWgnX
 j96ktiY+OhxxJy9P43mnlYA+qxvjfDumM42J8M5Hd/XfCpmynzjntx/dOp4h+CoXcTMX
 YKmSnA14tck+1cZ35+XATtteiXvk0Z5dt05DgTs4CIDQx4LKkEGB4XiTUnlxTL7+dFyw Qw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3duamg1egb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 03:20:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ifr1PqEsHrhhQNAEHn2K8ZAe0TsCLn0j0nv2f3qLUN5udfxRcmjk10CysBhL4zJHAGor6qSpzia+xVlzdKuXRld7dZy4SBGm7OfcyNCt2jlDDsNl0eyD1kkY8BVi95itnAskHAf/Qk5lFvj0Mr2bl6S4t0k0GCy+0/9Doa2njfYVIWrUzVWBJoKLYxdI60ne9Yc2C0BeAGFQ5c8lPjLSDS34d/wfP7yk7K+cLKsIP6Rb2WTX9JZ+C/X5L31BATPK6ESpvd1bPYrcxl+DKrJiyy3OqdqTvWO+AmOMoJaBN4KoHkbtveCIFQzewwrZzdYsb+QCXggzt/sdDiwi0WtIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wttiGinyaRxlB+ip1WLyQwgjsa0QZFDrUWmjk4qV3kc=;
 b=lIMCqgYeOhNPvZ2v8R7TSVUdHKfvqDOiSDZ4Wqtohcf4sfCquojDQXNb4YbRX7Tmof6LxyWfcZilhpN7IsG+kJ/I9hBV9U1mJYVdER8st6oQuKZw3LWYrjLrlxihdrz9rrRlw7oxcnRd0pGjodv7dcpW8H0Sz9/QoBd/iiOflivRDpxEbi+RgLtN5EP9JBELC2JStLGdpxfOjMHVNVC8O/FDUGx4gssWMGaaE8j4HaJuo68T78uY2wtPnXLazNp6MrmDetG4c/ytzqe44PA4cxeYnqd9aT4HN9we2di/y0D9T/7O4bsJIn+ZyjEuDuN77hR1vW3Oqp1SsN4A4WVPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM5PR1101MB2300.namprd11.prod.outlook.com (2603:10b6:4:50::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 11:20:12 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 11:20:12 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH v2] openvswitch: uprev from v2.15.1 to
 v2.15.3
Date: Fri, 28 Jan 2022 19:19:57 +0800
Message-Id: <20220128111957.17731-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7a90e4-78c3-4267-097d-08d9e2502681
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2300:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB23009CB34FF463C44AB0A30D8F229@DM5PR1101MB2300.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mtzrH8CytD/USkS+LKb/flt/auq0Z489AAsrCTKB8qLh9385+pv9JeSN59z0QKhsPW0SGSAWN1xJZumaVrOHeeYykg4nsZktbkQq11BGResrotVdg5aN66YrWAMg9jV5E5mGvUjOHUQF87npV7ucImYDDqINXKrmKJPChq0qVAnooM60HlkDuoBXiCzi8kNDSGBhGNoB1wnF/UZcc2Y4mWt8AaTrPul1/GbDl3X7JQKw+2PBVstIe5+MBvPr60iIXeyEbW3Dmw1miNHujYW699SEcT6zYbhEM1cCOrzmrSNQMbDfZXANzJ0fS9w/+Drvlt3zXF7Tir7EyOlWR8SG8kOqXkaDpxCcC1DTnvjFJgYUXCAOY0dbOnhzsKEzmDcwyJV0M828VpG7eYchPhiwQ5Bt3oc+JJZDOH7wr9xh/0xoAf3S1LBmt0GuYtEBF8H2m4BsaLvtCTff2eoRxbGNfDTbuiOOh5rA70tRLX0KEQXvAAsUuGsLMajBlXyunhvh1EmyaMHgttX/t+nZRXqbcb97n5G6KE7bPBr/vUT3V10Vt32XYNL+cM3WYmLK19Cl2C8qQl7DaJUHqy4nfgVlUv7r3707Ea/GnfbqkzCilLsQgCgcMoaOd510N0XO5i7Q6peIoL3u1nOKKn6e09b+E8x52XUQhtPdjjCYFAbh9jOAiHpD9/OmyCLG/K68z0eOCgHyX6DNHIFln0zwhmEWmg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6512007)(38100700002)(38350700002)(66476007)(6486002)(66556008)(508600001)(316002)(52116002)(6506007)(8676002)(8936002)(66946007)(6666004)(83380400001)(5660300002)(186003)(36756003)(1076003)(2906002)(66574015)(26005)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MScJZTV6b0L64Cxozx1AtogxJxz1sIo9ccst4A/lzo7pxlDMsp5g241+ZfYc?=
 =?us-ascii?Q?eQS88G7RTLakZ0egobYHMljRjnZtbdbVZ3z9aIKAeeMKznK8e4vv9iEp2KXV?=
 =?us-ascii?Q?UIh47zk7Al3IDwUbBH4aphXOu42Sj7s6NMDN8RyHTL1cFC0mnoyxlMIJNaEk?=
 =?us-ascii?Q?ahib8Fglb4Sti+yA49GECWpMNWwJGQlfPSfpcUXclZmkIsTGpoygpQsRAgs5?=
 =?us-ascii?Q?uD4Ptj1gowH5pfDzUl2RkwwdltLUOyiQOiVGtkBbn9VvJMRKzcKigtEQdWKZ?=
 =?us-ascii?Q?BnyQ+3wwHM4K5g5Fcl2/uxMh2hpVNAzESUmQloP/hwtX8tZQLyx/ria55uDK?=
 =?us-ascii?Q?nmlQLqXaaT+vTQG1XCinCnEDBMj/FvZUPu2D+1vIx2ScrJnA4Q84C/Thc8yX?=
 =?us-ascii?Q?iHqd1Cv3tuXhbdaIBGpfksj1kti476SoxIoUcjFkmc7VqH022Qc/bB39hDMp?=
 =?us-ascii?Q?A66w8WCuwIn/N1yMDbGdR6rfALP9UTgEL/9Mk1FidsRWczN8a0qLD4Q18YBC?=
 =?us-ascii?Q?ybds0oODku+u6d4CHOry0FS5nrVMXYfX0TaASRfS/XDwJo+W+bTMODK03bP5?=
 =?us-ascii?Q?I68EyYfROyzda1euGQvJzzTd2RNNo5IqoAz8xyd6LlSc9VqLJOJ8O1qAb3ki?=
 =?us-ascii?Q?xUTFSLVZEBSwaKSXWfQMM5FkGNikGhu+GkJhQyB0bulXdxXuJT4lJntMBOAJ?=
 =?us-ascii?Q?HYSsWUBdEnpuQDBNFCaCvNCE9fuM/AHnDlY/PO3ZFdYhiMKWlKn/9YljPiNb?=
 =?us-ascii?Q?qvDHRj8tgizNzOonhjjwps15kYmjM5JoJha7P+Fmlb6nWMMbhoSJRN1oP8Xx?=
 =?us-ascii?Q?cVRYHEt/m1PoZpMCaBksM4n+aqcGsMRBFXx9lLE6EIR7MDIxqvxK+4Cp87k6?=
 =?us-ascii?Q?WXHUCX/6iC42ewAoPleSyQ7UKKSTNKhw9EygUGbUXGAxr1HItBSKq5X1wmEU?=
 =?us-ascii?Q?/L7AzUPbDO9+U6qn/pFYy1YM1O5mGpdsfx3kajXKmRMWVHpyoiBUvmxEy9cq?=
 =?us-ascii?Q?zwV8S+V23Eo+Vcb/KDcamn8PsFjCK8XRhTUaMC1/LUG4lEXEw4Neds347zcc?=
 =?us-ascii?Q?qe5KIwSzE2ZQgQGwG0a51+oLMQTVClZq9Ftx5CvMqDWu6wkyXAov8NfGMfUB?=
 =?us-ascii?Q?Vq81f9lBhKqzZxf1DSQXXga7DXCjq5Msr3OLFoYXsl7e42RR9rhakwkNVQdQ?=
 =?us-ascii?Q?lWLsYPWM4rS0Gl8OLVGKhLxvKlp0geqQtpo0a+tplabhh5AZ3GQANTg2Ngtv?=
 =?us-ascii?Q?zvtMp4lCEW5hnny6TkaiyFpUkVvgN8k8NLdlvSA/tg2H6uhH6BaPolgteV1d?=
 =?us-ascii?Q?J26Z8aEfCA8elnLYKG4cyErMyb8wmzU1mK4kydGnizzfJiNbXEHBW6WVX0BR?=
 =?us-ascii?Q?Ok3m76PXxiqQ/lBak7h5Or8SXWlu/rwydtdt+5sBxeu2+GCaEcz3+2XTUx29?=
 =?us-ascii?Q?ZnAXCuQdLVpi3d+Fo8jNcibAIMo/2Mdmg8gvg3oz5Ve3VTm0+bQ8Zzbwv74x?=
 =?us-ascii?Q?zdoR7cmO2KCvoo5jUEWGXUmCR0x0Bhxg1IGqSL2d9ZX2ERpvgefRL4FTSMqS?=
 =?us-ascii?Q?T7T824suM56GALFZPwXL4JviXYgQWlijsdv4nWv+cdQt/Yeo+/d/3Q6xyyDZ?=
 =?us-ascii?Q?wd5661E0FXQp5/DEbwC18+o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a7a90e4-78c3-4267-097d-08d9e2502681
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:20:12.2293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VUUP1tCSDBt6N0CXKLwwo9q2nNh+dz/0AXqlQso98oTEh3RMgyw+7a65DrEah4lg9BcQp9mOO5PXYnru668g5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2300
X-Proofpoint-GUID: FpvSI2vhgX0yu_9_bLQF0bVyNKmx5s2b
X-Proofpoint-ORIG-GUID: FpvSI2vhgX0yu_9_bLQF0bVyNKmx5s2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=968 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280071
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:20:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7037

commits short logs:
e4d2df62e (tag: v2.15.3) Set release date for 2.15.3.
b8baa1141 python: Add cooperative_yield() API method to Idl.
7834abc66 ofproto-dpif-xlate: Snoop ingress packets and update neigh cache if needed.
833c02daa tnl-neigh-cache: Do not refresh the entry while revalidating.
e2182eca8 tnl-neigh-cache: Include expected array sizes in prototypes.
566fe4372 tnl-neigh-cache: Read/write expires atomically.
d477f6000 compat: handle NF_REPEAT error on nf_conntrack_in.
0590e8838 flow: Consider dataofs when parsing TCP packets.
7266042d8 tests/flowgen: Fix packet data endianness.
d2e0632db ofproto: Fix resource usage explosion due to removal of large number of flows.
0a7e66e37 ofproto: Fix resource usage explosion while processing bundled FLOW_MOD.
68466efed tests/flowgen: Fix length field of 802.2 data link header.
2a2185f9e ovs-lib: Backup and remove existing DB when joining cluster.
fcbc29c6f docs/dpdk: Fix install doc.
a5d97d420 ovs-save: Save igmp flows in ofp_parse syntax.
1cbd1f0f5 faq: Update OVS/DPDK version table for OVS 2.13/2.14.
01bc910e5 ofproto-dpif-xlate: Fix check_pkt_larger incomplete translation.
08a270dda datapath-windows: Reset flow key after Ipv4 fragments are reassembled
eca2d50d4 datapath-windows:Reset PseudoChecksum value only for TX direction offload case
031cf67e0 netdev-offload-tc: Verify the flower rule installed.
952e85150 ci: Make linux-prepare trust system installs.
2cf63851a Prepare for 2.15.3.
63f9a7c5d (tag: v2.15.2) Set release date for 2.15.2.
b7d9c491e datapath-windows: add layers when adding the deferred actions
3f718857e ofproto-dpif-xlate: Fix zone set from non-frozen-metadata fields.
ea2ca0af1 dpif-netdev: Fix use-after-free on PACKET_OUT of IP fragments.
9f964354e tunnel-push-pop.at: Mask source port in tunnel header.
58397f222 dpdk-stub: Change the ERR log to DBG.
2a963fc31 python: idl: Avoid sending transactions when the DB is not synced up.
9efa2ea61 ipf: release unhandled packets from the batch
f8274b78c datapath-windows:adjust Offset when processing packet in POP_VLAN action
a2f860aa2 cirrus: Reduce memory requirements for FreeBSD VMs.
7788f1579 netdev-linux: Fix a null pointer dereference in netdev_linux_notify_sock().
dd32deba6 pcap-file: Fix memory leak in ovs_pcap_open().
9f2f66c8e odp-util: Fix a null pointer dereference in odp_flow_format().
02b0c265c odp-util: Fix a null pointer dereference in odp_nsh_key_from_attr__().
031eff456 netdev-dpdk: Fix RSS configuration for virtio.
09cd9570d ipf: Fix only nat the first fragment in the reass process.
ef8ca3e19 dpif-netdev: Fix crash when PACKET_OUT is metered.
d3ff41d60 tc: Set action flags for tunnel_key release.
079a4de72 netlink-socket: Replace error with txn->error when logging nacked transactions.
f8cc5aa35 dynamic-string: Fix a crash in ds_clone().
64d1bba91 dpif-netdev: fix memory leak in dpcls subtable set command
90b219275 dpif-netdev: Do not flush PMD offloads on reload.
b29b04f85 dpif-netdev: Fix offloads of modified flows.
1d0b89ea7 dpif-netdev: Fix flow modification after failure.
8d84a4b16 netdev-offload-dpdk: Fix IPv6 rewrite cast-align warning.
f3f7849cb daemon-unix: Fix leak of a fork error message.
8aa0f0374 ovsdb-cs: Perform forced reconnects without a backoff.
ee4e034dc datapath-windows:Correct checksum for DNAT action
72132a940 bond: Fix broken rebalancing after link state changes.
aa84cfe25 dpif-netlink: Fix report_loss() message.
aec05f7cd ovsdb-server: Fix memleak when failing to read storage.
05bdf11fc conntrack: Init hash basis first at creation.
94e3b9d9c netdev-linux: Ignore TSO packets when TSO is not enabled for userspace.
842bfb899 conntrack: Handle already natted packets.
ab873c1af conntrack: Document all-zero IP SNAT behavior and add a test case.
86d6a9ee1 python: Fix Idl.run change_seqno update.
1ba0c8365 bridge: Use correct (legacy) role names in database.
7e5293ea5 Prepare for 2.15.2.

The ptest results BEFORE uprev:
ERROR: 2231 tests were run,
27 failed unexpectedly.
62 tests were skipped.

Failed tests:
checkpatch - sign-offs
checkpatch - parenthesized constructs
checkpatch - parenthesized constructs - for
checkpatch - comments
checkpatch - whitespace around operator
checkpatch - whitespace around cast
ovs-ofctl snoop
tunnel - table version
tunnel_push_pop - erspan
tunnel_push_pop - action
tunnel_push_pop - packet_out
tunnel_push_pop_ipv6 - ip6gre
tunnel_push_pop_ipv6 - ip6erspan
tunnel_push_pop_ipv6 - action
PMD - non pmd device
ofproto-dpif - recirculation after resubmit
ofproto-dpif - sFlow packet sampling - IPv4 collector
ofproto-dpif - sFlow packet sampling - IPv6 collector
ofproto-dpif - sFlow packet sampling - LACP structures
ofproto-dpif - sFlow packet sampling - tunnel set
ofproto-dpif - sFlow packet sampling - tunnel push
ofproto-dpif - sFlow packet sampling - MPLS
bridge - multiple bridges share a controller
bridge - add port after stopping controller
mcast - check multicasts to trunk ports are not duplicated
ptap - triangle bridge setup with L2 and L3 GRE tunnels
ptap - L3 over patch port

The ptest results AFTER uprev:
ERROR: 2266 tests were run,
27 failed unexpectedly.
65 tests were skipped.

Failed tests:
checkpatch - sign-offs
checkpatch - parenthesized constructs
checkpatch - parenthesized constructs - for
checkpatch - comments
checkpatch - whitespace around operator
checkpatch - whitespace around cast
ovs-ofctl snoop
tunnel - table version
tunnel_push_pop - erspan
tunnel_push_pop - action
tunnel_push_pop - packet_out
tunnel_push_pop - packet_out debug_slow
tunnel_push_pop_ipv6 - ip6gre
tunnel_push_pop_ipv6 - ip6erspan
tunnel_push_pop_ipv6 - action
PMD - non pmd device
ofproto-dpif - sFlow packet sampling - IPv4 collector
ofproto-dpif - sFlow packet sampling - IPv6 collector
ofproto-dpif - sFlow packet sampling - LACP structures
ofproto-dpif - sFlow packet sampling - tunnel set
ofproto-dpif - sFlow packet sampling - tunnel push
ofproto-dpif - sFlow packet sampling - MPLS
bridge - multiple bridges share a controller
bridge - add port after stopping controller
mcast - check multicasts to trunk ports are not duplicated
ptap - triangle bridge setup with L2 and L3 GRE tunnels
ptap - L3 over patch port

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 0fb7c132..4d413170 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.15.1+${SRCPV}"
-CVE_VERSION = "2.13.0"
+PV = "2.15.3+${SRCPV}"
+CVE_VERSION = "2.15.3"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "f8274b78c3403591e84f3c2bbacf8c86920d68ba"
+SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.15 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.17.1


