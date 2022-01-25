Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A529BC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 02:55:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2227.1643079343914268915
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 18:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rPYZkjho;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8024cf347b=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20P2Q49L029393;
	Tue, 25 Jan 2022 02:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=0xaberNm05JVLhnLOqyfOpYz3cqIZD5WtvX1wu73JYs=;
 b=rPYZkjhol+hGjBiGPMv4ioomzlp51+buZm9obF6bPXAdswjDk8yeMnxtTFbyuWXdKIEt
 9GftpdNNsFKVPKQmOSbOybi+Yu5UFaj6GnooxtrSxyajAAwGUTqfCbLOvTe7UmaW3xDo
 B5nVWaKHCsH16yInYX53y3P+D2+ozYpBjAoJr/UzLPFxguandBGL2FP0cNMZMGCkp/Pl
 X4mSZK2q19NRhtcyqVpV3w9sLM8QcVXRKozRAzoQ+RPVgRdQ6NEqAitc+4BKOHPEtbZo
 Bul5x5OnnuUB6+CSt+TtTi2wtL/orRZu6hQRC9hBI2sHZGVFRoD+gz4UgXPu9Ic07aGV qg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsqcvgrdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jan 2022 02:55:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI6//qEcrIA+BNgoqR865Hv5t+PAg1fPOTw9UCVPF41g0EJeO9NqobpazXp7v2+PrZm2lsVjTwQxcdznCNeHxzxANKyZ+D/D2SlN5uLoz3xFCGBpUNDC1eJi70P4mqfpcN2641Le2uye9YzUz+NJ/X68R0sWdLuH6ieiIywkqouVGCSZMHvliM9A4sH6t3mpOFAF8RPO88O2mSNzqPH5aXd2u7x85GsDdsnRj1zGJk3u7XVIJdJz+xABP6QsoWEVC4h8/tZsLgeC/hvNOcKR1yTfSYj4+0TdJp7LKVqglMY5ySf8OVkjGmuAIGgXQHu+9w6LG7avzYyWwVt7lSN28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xaberNm05JVLhnLOqyfOpYz3cqIZD5WtvX1wu73JYs=;
 b=Psfd8U0eEHLdaANLctrWZ6Gsp5z2OPFAD31ZVnBOfa71OIen8bEVvBO+lZgquQGI7TcDmZRz0iwRexcChofO4d2hkUObolO6PHbBhzQFYIt0aAAYvmEPlrp/orX8uzpa5Svz4XWNG131BQdpmrKXPY+ixaPeSrfL3CXRRhY6138e98jJ8hbBf56bnRv4J1UMyj3RDfwTRJAOTv4xgOrc7d0/k97KS34Fz6aAzKW50jj+UiMfJqoLuYU49vl23V1nHxkM/k5f+CZeDMLSZEAdSb9df3zK+SP/e7yh/fCuK0QU8gBCQqLamgQBBgkE63Bspv+/soaPdZe0zYW6/ZvKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM5PR11MB0041.namprd11.prod.outlook.com (2603:10b6:4:61::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 02:55:39 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 02:55:38 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] ovs: update to 2.15.3
Date: Tue, 25 Jan 2022 10:54:45 +0800
Message-Id: <20220125025445.17931-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8450da-f12a-4f11-711a-08d9dfae2ab9
X-MS-TrafficTypeDiagnostic: DM5PR11MB0041:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0041EBAE73DCE5977D340A3C8F5F9@DM5PR11MB0041.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:129;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AWnhMt0Dv42x0xuandZeoQE9HMoTrUQcD17zBM62eDXfp5MEWv1UZ0wSaKFdRp29GnpO/oKkommc+Fhq+8cfnW2RlQngfXHXKph86AA102VkCYA+5yre6GR9xJAYt6C9a7m5v5OuMDIREvXXR3Pve92Vd5E/3ku6EP45ZeNE2qcv3docwLVGTtSS5O+7pGi+xVQ+kpW4RWDWlNdPei7f/e7361iunrK5WtYpK5ap8FJnpDNgzFdjsVW5cZccKBqGkQ7KZoLk49KWkpyjStfeG8q8iH569rkTyHzzVFkovqUM4/f3lBjZXl3L9+E7jSKLANXzjyLRxVS59u1+1yQt9Y1lXYKSr22zGbn1ja/xYwFLnA5U3VqMEphQFh/OyUvADy4gMHGdcFYc75Zm0M7DrpI9HbNw4nAbV+X4osoptQnJwcVjEZJ1Y3riSz8NbIVRCeGVMch1Cnlo3pyzhEpeJdwR9QaoKcZLftYYf0Bu7HeRLSGWEZUUjrq9mWyT8amQqAIY4u7kKBp6lQpOsUpGvf2Fzr8WqSXX1dHeNHFxa16SEYYEisxEmPcOajB6t3ibZZSyBtO8K0mdH0TWqUm/cyLOXFYnUfSv+T43GwUNoLg92eo9ybQ+MqmROwuP0Pc6MRb9Sys+7ulPAsr5UI9S1OiMcz1uzKqtaZQrmmku7ScPYIzCsq6LqevERKULPQvPbhPhbXVagl5cogn+8M1uDTCLrqTX/6FgHxRht7nZiM4G7lli4bYSABPB0ecF0/qlQV6Xl3TqUWzaMvn3ipjZdYlqR/Bgx0Hjm4A4WrbJKT8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(86362001)(2906002)(6486002)(508600001)(186003)(2616005)(6506007)(36756003)(83380400001)(26005)(5660300002)(15650500001)(8676002)(38100700002)(52116002)(38350700002)(1076003)(6512007)(6666004)(66946007)(66556008)(316002)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xVqrq2R0heiQ0M/OSNDMPXi47o/4XJskx3Qf7C6Uiuhm/UX7nW2EQEj7aKe4?=
 =?us-ascii?Q?I9erczExsjtF9p1X6VzGZ1VawfEvgqqLOEGo7CWXXiooMEeUL8aFkHACcwZJ?=
 =?us-ascii?Q?xgDflmQIDBrYBDXi+H0DaRTvDVil8ai3AubsXrOLgU/uZJUdVfpOuVHE2NMM?=
 =?us-ascii?Q?MesK5AWiB511apFqFTiH6VUOjIYoMsrzzdiBylKf2o4anopNgTTCDUo1+1NI?=
 =?us-ascii?Q?fxsvUVMGH/iZydXnQK8t7hBOviz1wdz9wsGitKwzX1SPOHYRHpzrL+WZnKPS?=
 =?us-ascii?Q?U984T7+MwWK0n28NEY9kfcF+vVPpEPVqmKaSzHAD6vkRQhcEmSpp3c1Xz1tJ?=
 =?us-ascii?Q?1tJW9nruHQm3+HRXuPVrSkSzQBb4rHhcGekQkbge6jhH0BxY7b+LbQ6LR9uZ?=
 =?us-ascii?Q?8oVJE+qSsaVN40ZWAWJz7QveLy5jmklYgQGp1lH/cQ/yJoNi7wVSm3v/arLb?=
 =?us-ascii?Q?1l8ZQAer7iq5GLTrX8Lj++8hg9qnoZt7a4URObJ8XaDRgUSOl7/Qn0dFLabL?=
 =?us-ascii?Q?DfD2ksgw33/E8fNhRmNTNmj0RL5Th/QF2BTGZpmoz8dz0NgcIZuc6zy1K5QG?=
 =?us-ascii?Q?inntcQ+FGPQaASRhGqlgLbxxRGRVEqnI58OKertGspAx0dPjZA75ngWoalT+?=
 =?us-ascii?Q?XiTbqDGA+e45eteP9gtSoJHNFUfeawsqEHQaYry2TUB5WxY7TwFH6GdVyGpS?=
 =?us-ascii?Q?mGGWqqKBxKnjC1YFNQYGpPFiPNKv5KOVrI7h4U637hhDUJcIzrkKRHhi360S?=
 =?us-ascii?Q?Zh5clNpV+k96yB00Uh9RiuHcs62fmNGPcV/PgHYoCXI76CGuIbsn4myw5eHj?=
 =?us-ascii?Q?BOkrpgrazGdtE8aRQRS6gv/m0S6W+8dWcApqrJwfxGYU5Qaz/CL03UfG213Y?=
 =?us-ascii?Q?JG2aAKPr1dJWIffpoF1oCLNniLQGYehLMk3yW4vTsNPSeWsc529PavZzCrUt?=
 =?us-ascii?Q?imFvfU84mFUZyY8k8wsgy1DivWDU5duCEz/+E3HLY8o+IFXEZEMLyfrg7eZc?=
 =?us-ascii?Q?fitc8sPdpVIerJWu6Bounz47i3sDgndrk95e0Y5RPCgyI32icCHcNQ+veUsz?=
 =?us-ascii?Q?vyKDJEnRlc5kR1GQMop6wEv9uxmtjfY8TOM8lyrOhh4KabrqtHZ1zANcYdSe?=
 =?us-ascii?Q?GqAEzTwEclwCiV98CGBmHvNqHE8H76t7OhlmIFXHI+DZVZx6FdglsMXdobo3?=
 =?us-ascii?Q?8e3EB03j9um/Nr9X0iITRn/o57MjtdpLdEMO+mNJI11mlfuyz06MRTtW+DEh?=
 =?us-ascii?Q?9e+G8B2wGMHwl/LGtJZGS5aQ/xJTSk5aDdd7LT59P/5cjaiuD5dVkH+GFBoc?=
 =?us-ascii?Q?GgDaJL+nfb0ZeIunyuiN0zvGhDNR9/Ez3CwjuOr4nIYO6PuRRiH2avCmePRV?=
 =?us-ascii?Q?pzd8YBHHE/r47cBosfASks2SicQRI1/7wqWhHrISE+BaPFtondEOIAsbjITm?=
 =?us-ascii?Q?lw8aHQgLe1OK5Ypn2ihFzw7ow9Vkg9tsDovyEEeU/ZcwyVfaada/7jLlGl4N?=
 =?us-ascii?Q?AzkmPAqD4QO/1zOmUSY1T2HkjjaEWdEsDJ88t+kIKnxgz7MaDje/tlO+LsrT?=
 =?us-ascii?Q?xw/LzHoqT+/tnyyqmVPA3U/LNfFq1a4wmAY3lPwS4yzlfXTjG3SaMWT3/83F?=
 =?us-ascii?Q?j9XsDV89fag44yCZj8Fl5+k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea8450da-f12a-4f11-711a-08d9dfae2ab9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 02:55:38.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7RrNSeiPr8INuOBAXgItwMXgkBKGBnBVqQwrEZSoaLxNe4tI1B6l+YmEZeAYhsbp33OZlWGHPmv6tsq6X0sUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0041
X-Proofpoint-ORIG-GUID: IZ880lhuzMwS6FngaKdFDEx1diRmYlv8
X-Proofpoint-GUID: IZ880lhuzMwS6FngaKdFDEx1diRmYlv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_10,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201250016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jan 2022 02:55:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7033

Drop the following backported patch.
0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...use-after-free-while-decoding-RAW_EN.patch | 101 ------------------
 .../openvswitch/openvswitch_git.bb            |   7 +-
 2 files changed, 3 insertions(+), 105 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch

diff --git a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
deleted file mode 100644
index c88c097d..00000000
--- a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 802a31a7070cea910b95d7e926c9da30a1f9e54f Mon Sep 17 00:00:00 2001
-From: Ilya Maximets <i.maximets@ovn.org>
-Date: Tue, 16 Feb 2021 23:27:30 +0100
-Subject: [PATCH] ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
-
-While decoding RAW_ENCAP action, decode_ed_prop() might re-allocate
-ofpbuf if there is no enough space left.  However, function
-'decode_NXAST_RAW_ENCAP' continues to use old pointer to 'encap'
-structure leading to write-after-free and incorrect decoding.
-
-  ==3549105==ERROR: AddressSanitizer: heap-use-after-free on address
-  0x60600000011a at pc 0x0000005f6cc6 bp 0x7ffc3a2d4410 sp 0x7ffc3a2d4408
-  WRITE of size 2 at 0x60600000011a thread T0
-    #0 0x5f6cc5 in decode_NXAST_RAW_ENCAP lib/ofp-actions.c:4461:20
-    #1 0x5f0551 in ofpact_decode ./lib/ofp-actions.inc2:4777:16
-    #2 0x5ed17c in ofpacts_decode lib/ofp-actions.c:7752:21
-    #3 0x5eba9a in ofpacts_pull_openflow_actions__ lib/ofp-actions.c:7791:13
-    #4 0x5eb9fc in ofpacts_pull_openflow_actions lib/ofp-actions.c:7835:12
-    #5 0x64bb8b in ofputil_decode_packet_out lib/ofp-packet.c:1113:17
-    #6 0x65b6f4 in ofp_print_packet_out lib/ofp-print.c:148:13
-    #7 0x659e3f in ofp_to_string__ lib/ofp-print.c:1029:16
-    #8 0x659b24 in ofp_to_string lib/ofp-print.c:1244:21
-    #9 0x65a28c in ofp_print lib/ofp-print.c:1288:28
-    #10 0x540d11 in ofctl_ofp_parse utilities/ovs-ofctl.c:2814:9
-    #11 0x564228 in ovs_cmdl_run_command__ lib/command-line.c:247:17
-    #12 0x56408a in ovs_cmdl_run_command lib/command-line.c:278:5
-    #13 0x5391ae in main utilities/ovs-ofctl.c:179:9
-    #14 0x7f6911ce9081 in __libc_start_main (/lib64/libc.so.6+0x27081)
-    #15 0x461fed in _start (utilities/ovs-ofctl+0x461fed)
-
-Fix that by getting a new pointer before using.
-
-Credit to OSS-Fuzz.
-
-Fuzzer regression test will fail only with AddressSanitizer enabled.
-
-Reported-at: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27851
-Fixes: f839892a206a ("OF support and translation of generic encap and decap")
-Acked-by: William Tu <u9012063@gmail.com>
-Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
-
-Upstream-Status: Backport
-CVE: CVE-2021-36980
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
----
- lib/ofp-actions.c                                       | 2 ++
- tests/automake.mk                                       | 3 ++-
- tests/fuzz-regression-list.at                           | 1 +
- tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 | 0
- 4 files changed, 5 insertions(+), 1 deletion(-)
- create mode 100644 tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
-
-diff --git a/lib/ofp-actions.c b/lib/ofp-actions.c
-index e2e829772..0342a228b 100644
---- a/lib/ofp-actions.c
-+++ b/lib/ofp-actions.c
-@@ -4431,6 +4431,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
- {
-     struct ofpact_encap *encap;
-     const struct ofp_ed_prop_header *ofp_prop;
-+    const size_t encap_ofs = out->size;
-     size_t props_len;
-     uint16_t n_props = 0;
-     int err;
-@@ -4458,6 +4459,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
-         }
-         n_props++;
-     }
-+    encap = ofpbuf_at_assert(out, encap_ofs, sizeof *encap);
-     encap->n_props = n_props;
-     out->header = &encap->ofpact;
-     ofpact_finish_ENCAP(out, &encap);
-diff --git a/tests/automake.mk b/tests/automake.mk
-index 677b99a6b..fc80e027d 100644
---- a/tests/automake.mk
-+++ b/tests/automake.mk
-@@ -134,7 +134,8 @@ FUZZ_REGRESSION_TESTS = \
- 	tests/fuzz-regression/ofp_print_fuzzer-5722747668791296 \
- 	tests/fuzz-regression/ofp_print_fuzzer-6285128790704128 \
- 	tests/fuzz-regression/ofp_print_fuzzer-6470117922701312 \
--	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448
-+	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448 \
-+	tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
- $(srcdir)/tests/fuzz-regression-list.at: tests/automake.mk
- 	$(AM_V_GEN)for name in $(FUZZ_REGRESSION_TESTS); do \
-             basename=`echo $$name | sed 's,^.*/,,'`; \
-diff --git a/tests/fuzz-regression-list.at b/tests/fuzz-regression-list.at
-index e3173fb88..2347c690e 100644
---- a/tests/fuzz-regression-list.at
-+++ b/tests/fuzz-regression-list.at
-@@ -21,3 +21,4 @@ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-5722747668791296])
- TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6285128790704128])
- TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6470117922701312])
- TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6502620041576448])
-+TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6540965472632832])
-diff --git a/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 b/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
-new file mode 100644
-index 000000000..e69de29bb
--- 
-2.27.0
-
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


