Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B4DC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 11:09:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5829.1643368188870741421
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 03:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L1L51k4L;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9027b8002c=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SB18eu016824;
	Fri, 28 Jan 2022 03:09:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=CxhOIHR5G99JtIi6bIRWkGXZsRf63HGdSfDuMwAmHsI=;
 b=L1L51k4LLlDL6U5NA1d9hMDvo2d2rIlBsWoqg7HeqUBVva+mYx18CU/FMXTMrsoSvcdT
 bYhwGC5RmbDMx965zgpW2QUypcPZBmi63LPPkDsec7wSuIz45MRUwdQcLMERbqIf9uop
 AiFpfjUudVFs4NqB6eD/ftQFeVFrCF4lVkz6Y7WBbVZRTO+5Cv1hgU/ShSZIGDzEI36b
 tlGKGB9QgCYh1iSbfLSbJpf91Pa8ZmKSxblkILJCUXX5tY6b+bTWj2iBEFkSgMwH+mZT
 7Q7j28HBHWZKyHIHpZP9rInRx8sHF/R2/n2jfSFhZFdGAYYFiDXoJ63L6wqRUgYa9ZJN Rw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3duamg1ea6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 03:09:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltG8yn/U23LWJ/lUfEPQhK1iBpqlQENzrklqAGc6TvpfMSVI5XF8HieMmvAGaTotB3XIds6525umw15Cx6dOgnuOvjDl5TQ2aTPn1l77zpTRsZDVIhcqK54XyvolSPFSw7RFMzDwGR7wcKMBO8ViAkdRq8M50chsH0GE6KZFLwPWziYASR82KEx4e5rP7eUnZX54B5H6n3cu23fsFtxdH2hqJxwK3C+VsMmTxAYIE5vR3/t5qCVtAD+Tef+sfqEMBmsXgNCvAS++EkQ9u+2jKnzodxdSLIEoBjjEFDwbTqRIoDYUcMrclEQnJUVxR6/QvL3kHn2jFcKUxNvO1j8Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxhOIHR5G99JtIi6bIRWkGXZsRf63HGdSfDuMwAmHsI=;
 b=B2fGU4F3HkHkOyNnNanvcbe1fr+a9RWvKzlOcbPsRlRj2ewP5T6Aq08G8/8YrkMRuMh96MkYy4BtHmzT5Hv4IS1XAzGw/y7wnosDMJckp/IJlK25hb5/SPnswExrDv1vBrsvyO+2AUzFUK5CheWDNhorpp9cPzDWuOC1+itZGFZGz3Xl55DQJtxHaxZBuzNcUBASKeTSgG+HxeY3DPGz5VNPcoct5HemslPyjUBkwowVajsPhUhISmY+Gz4ybYbtFGr16j8dlr6tTnSTbxgoF7B/L5le8kFoyOfCCysoGVP28W5n57VGSaiHV2aQZXpqMguy5BnGsiYv4ddOq0Yxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MWHPR11MB1951.namprd11.prod.outlook.com (2603:10b6:300:10c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 28 Jan
 2022 11:09:43 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 11:09:43 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH v2] openvswitch: uprev from
 v2.15.0 to v2.15.3
Date: Fri, 28 Jan 2022 19:09:27 +0800
Message-Id: <20220128110927.13468-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11875775-3ad8-4fd2-bb40-08d9e24eaf75
X-MS-TrafficTypeDiagnostic: MWHPR11MB1951:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB195107B55A2C491600538A118F229@MWHPR11MB1951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LT5wy4jvl8c+bLQVpyLT5Vko+DBuoTXajnKx52Nc/eLr8RlZ8TQeqcoAnsOintpdPXsNwXAXPql3CCIM8/K1Y0gK3bkjLnVMspli+uANrBtvoBDd1zwHN+eMdZwYJxv96Lwh0wIG8yEyMVjHLzqkS9XDUfRPa74rfFL32nqra/7pkmOjbhZskjGxqy+IVU3IhBjNSxaF7dsiZrFj+6cEtLLkbriDGe+hvGj7HAAxU7ajGAf6AdE364wtFYttq9v+0X1dcqme1a3gXClg0HUtILo0twQtQG3j9QRg9UOlz++mPY0JF0BLldUQyBuvabYFiO3CTyj0TofilclJTmvMSwl6px7n3izB20Nu/pfTmeru3j0vgJ5iWwndsqab1zZ24xEsTLSCGu9mvpf1caYJdovx4AaPOZu8TRPdtxCDXZHrMgSmGTnrnz4TvsrJyPa7C8RJ3FsUGEa3gwcJcd4GGn0rWo4kV29eAseCEUMm075AB6jxVF8gE8cgufwIDrhDh1FAFUZLbTS1wx5Zi4JLeWT82GYcDQ/QM0kGIKmJyO0QrcrdirODpngmSpl/CNWKOlG37ggMyhwyQdW4OQYIJUN68BIwQmx9xmQCxI/hULUXmkBJaMauwlUQG8/Cn22atwF1aIBwlshwvR8/hpJYHAvZSTlUs6GJfOsbwGLD9ohIpK6HMrd3/WHGREj60yScKhyci90u6dc7NWJMc5q9tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(66574015)(86362001)(26005)(508600001)(66946007)(38350700002)(2616005)(5660300002)(36756003)(316002)(186003)(66476007)(52116002)(8936002)(6506007)(6666004)(66556008)(6512007)(30864003)(2906002)(8676002)(6486002)(1076003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NjuvRVyS/f69dhkbhh2OJS9Mwg0UwknSOI6TWiTn+Ah03CSu9eNydjxDXAZo?=
 =?us-ascii?Q?JHR6jtSlWnM2Dp9hH02jaBvzKIgi7TaLSzmSEtij2RLJhOXWLMEzABTY6y55?=
 =?us-ascii?Q?W0A7pZsmdTnnS/e5UXQRI5l035oeVNy8kMpzkbeHEouj89oTi+foY4mA9IBm?=
 =?us-ascii?Q?wEHKZlcpsMuGsA4GHapVICRs9xDEL8w3sSZtcfGjGAh5dp/qmqGQB/FMFmke?=
 =?us-ascii?Q?YqCP94UMqhyZduK5M+Cxi5beqZ5YCXfugsR4O9ffiG5j1/9KfRB4Tx/t5IDr?=
 =?us-ascii?Q?BPLdl4M4omaUYjr7jYC6y6mUCHNtSxlx9frlWTkVGV1GUBsrXhHyZJ8qJXs3?=
 =?us-ascii?Q?OLq/MQ7CGs5RhnPRlxHYOr5la6kXlJJ8n5ptDGSSyNTtEPszzteOso7qIiYm?=
 =?us-ascii?Q?zqEOxCOjMjw9WxDnXKnx442sgz0Zz5juQFf5QDkBblkujhi3TrHpO49oHDo6?=
 =?us-ascii?Q?yMEaHw76+GXh8CRINcuqBPnDtN+920WcwinteaJcqbkC3nd5qUMvTw+2u6zv?=
 =?us-ascii?Q?JNeExLpL1yIG9ZlpWefjohQh4tLi/VZVbVsXpxtCBVGjhM7xDHcucuCGYQ5e?=
 =?us-ascii?Q?A4aWh9aIQF4av3G0urBFO1lQb1JE6Lj95Y4k5PausMXiwSYFgCZRnMSrW/+f?=
 =?us-ascii?Q?yymPDSHa++bYYEHP/1eBny9xSi3DWWG7wj+xLEfGxr2uGmMlHZ5aDOCJlTUo?=
 =?us-ascii?Q?Z13blfXnBQSxrDVu17g450cIwziCfaKiTf5Mrc9C0lXJ34dWC4RyJ/UG1Cxa?=
 =?us-ascii?Q?s1HNvTqgnYiHB+AulT7hbiH5+95+jhNWOOIPe8iSjcdODdym37pT9Popxag9?=
 =?us-ascii?Q?6VB/FfmifV0hELa08HIl0Ed+DpvdI2QRBJkIKNSke5R31lhsfzY3j+c4QWW1?=
 =?us-ascii?Q?NdH4dZe/8tMzHpOWmqsn30ijw0Q23e8q1pvVtot0NEWPNvvFUfo30ACbsuHP?=
 =?us-ascii?Q?86bGwzGUWCboDGGN3UG2A0NmwXbopl0RvyxIc/an6GEYeHBxHU0ICO/7LVYy?=
 =?us-ascii?Q?0SRM+38qi/jXoOf2DuXkVl1cl+m/mejuLc1WPhumkK/xjMQwW9ieIAoNUiTK?=
 =?us-ascii?Q?43lRpEBk0eZ4wSHRYi1wpGsQuBMJ8SfHTk1tzX/NhXBmUr/gyzaIo/mkH77m?=
 =?us-ascii?Q?J4vVRLeCsGGGbEg31GqTUeMlW97KW1Ab2pnMb2wPkPqMByAIaZ+veWYIFQJQ?=
 =?us-ascii?Q?2Ni1pFswao6IDTYHPsnRiU/KSrxbolZuv++7CAvG86ZFTtxU0bbc3XNt1Gbi?=
 =?us-ascii?Q?vUO9SwTnOisqwmlTsV/wZA9aVkqopzszykif9AtoEgtTu2IGQ1OyVHfhDO4v?=
 =?us-ascii?Q?EoAEBmAEjJDOC0TeYTB6+DyQMRRqnWqpYTDG3KieJjC3L6NvPghnWF3wRSzz?=
 =?us-ascii?Q?EbcYY6TJrXHlEKPlXnfEc30Er4IgJS6+UKCbAa+5Mo/fRH4rr2Lc2JZNmmpD?=
 =?us-ascii?Q?t7ognFhFqM6emLQK8EdQFTM6BjDC6vJOzSo743bYOr6zcmJMMvETA/8ZshBz?=
 =?us-ascii?Q?yFbzqNS5GTEbXPkh4ttq+JxW8+mfksf/cjTaRUvbOxsy1NPqFdg3wlMjzMeT?=
 =?us-ascii?Q?F96/jcZiVMNraHjW4ony+7euGeGQY7CxvQS1sW7i7GkIiJMEwCi2d33VL322?=
 =?us-ascii?Q?ria+G49II8grSphfW46eTxQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11875775-3ad8-4fd2-bb40-08d9e24eaf75
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 11:09:43.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HWqZtpXgWKsZg6LQiiG73g/ksqXnBTjJZDCv6pvXmvT1OT+MT2KO9ncQQi8kLMzqz5XnbLx5NOel3qmNnmCJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1951
X-Proofpoint-GUID: gG50qSb0mzQbh0HHQh5Tz7d5mVuhH7Xt
X-Proofpoint-ORIG-GUID: gG50qSb0mzQbh0HHQh5Tz7d5mVuhH7Xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280070
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:09:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7036

Drop the following backported patch.
0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch

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
b855bbc32 (tag: v2.15.1) Set release date for 2.15.1.
007a4f48f dpif-netdev: Apply subtable-lookup-prio-set on any datapath.
c93358a56 netlink: removed incorrect optimization
31626579f ovs-actions.xml: Add missing bracket.
30596ec27 netdev-offload-tc: Use nl_msg_put_flag for OVS_TUNNEL_KEY_ATTR_CSUM.
728980291 conntrack: Increment coverage counter for all bad checksum cases.
881d71ea2 datapath-windows: Specify external include paths
934668c29 Remove Python 2 leftovers.
aaa596705 ipf: Fix a use-after-free error, and remove the 'do_not_steal' flag.
bc0aa785a ovsdb-idl: Fix the database update signaling if it has never been connected.
559426d2b ofproto: Fix potential NULL dereference in ofproto_ct_*_zone_timeout_policy().
f31070e27 ofproto: Fix potential NULL dereference in ofproto_get_datapath_cap().
8995d5311 dpif-netlink: Fix send of uninitialized memory in ct limit requests.
0c056891c ofproto-dpif: Fix use of uninitialized attributes of timeout policy.
121a67cad netdev-linux: Fix use of uninitialized LAG master name.
5f27ff1cf ofp_actions: Fix set_mpls_tc formatting.
e87adce83 dpif-netdev: Remove meter rate from the bucket size calculation.
a3ee3258e ovs-ofctl: Fix coredump when using "add-groups" command.
c5d2a6275 raft: Transfer leadership before creating snapshots.
553d52392 ovsdb-cs: Consider all tables when computing expected cond seqno.
8d0aebcc4 dpdk: Use DPDK 20.11.1 release.
21452722b github: Fix up malformed /etc/hosts.
90d1984b9 doc: automake: Add support for sphinx 4.0.
38a8bed70 cirrus: Look up existing versions of python dependencies.
255c38c74 ofp-group: Use big-enough buffer in ofputil_format_group().
f2c0744d2 ofproto/ofproto-dpif-sflow: Check sflow agent in case of race
ab157ef34 dpif: Fix use of uninitialized execute hash.
b1fded020 odp-util: Fix use of uninitialized erspan metadata.
f473ee568 dpif-netlink: Fix using uninitialized info.tc_modify_flow_deleted in out label.
2721606bd netdev-offload-tc: Probe for support for any of the ct_state flags.
091bc48d9 compat: Add ct_state flags definitions.
1307e90e3 Add test cases for ingress_policing parameters
d184c6ce6 netdev-linux: correct unit of burst parameter
cab998e50 ipsec: Fix IPv6 default route support for Libreswan.
b9ab7827e ovsdb-idl: Mark arc sources as updated when destination is deleted.
c82d2e3fb ovsdb-idl: Preserve references for deleted rows.
9a24ecbc2 ovsdb-idl.at: Make test outputs more predictable.
8d71feb1b ovs-ofctl: Fix segfault due to bad meter n_bands.
3a716b1d9 dpif-netdev: Refactor and fix the buckets calculation.
73ece9c87 dpif-netdev: Fix the meter buckets overflow.
d5dc16670 python: Send notifications after the transaction ends.
556e65e17 ovs-ctl: Allow recording hostname separately.
3982aee45 dpif-netdev: Fix crash when add dp flow without in_port field.
02096f1b3 Documentation: Fix DPDK qos example.
8f1dda316 raft: Report disconnected in cluster/status if candidate retries election.
79e9749da raft: Reintroduce jsonrpc inactivity probes.
2e84a4adb ovsdb-cs: Fix use-after-free for the request id.
d2c311dce connmgr: Check nullptr inside ofmonitor_report().
7307af690 ovsdb-client: Fix needs-conversion when SERVER is explicitly specified.
2a7a63571 windows, tests: Modify service test.
9b48549c6 netdev-linux: Fix indentation.
861a9f3b4 ofproto-dpif-upcall: Fix ukey leak on udpif destroy.
339044c3c ci: Use parallel build for distcheck.
38744b1bc ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
33abe6c05 Prepare for 2.15.1.

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
 recipes-networking/openvswitch/openvswitch_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index d7f8e4b0..a66c9677 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.15+${SRCPV}"
-CVE_VERSION = "2.13.0"
+PV = "2.15.3+${SRCPV}"
+CVE_VERSION = "2.15.3"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
+SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
@@ -28,7 +28,6 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15
             file://systemd-update-tool-paths.patch \
             file://systemd-create-runtime-dirs.patch \
             file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
-            file://0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.17.1


