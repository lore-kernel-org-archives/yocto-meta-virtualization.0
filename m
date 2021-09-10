Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4178.1631242250778289543
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 19:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JkL4yRnX;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4887064055=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A2C4LD018011;
	Thu, 9 Sep 2021 19:50:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=6+MO+lOzmCKR26KiMZGGucaEQiPn0HqErnJIgkWhjdY=;
 b=JkL4yRnXn3uWsxnJvyEuMNOv4AztHHWjO+32yimy92FauFeyheAB2iWPcExvhdaHL1o4
 ipodWwx/p/zbZAycIOWK7/MVs0nYo5puIC/f+0flNZ4xoRvE4SEdxfy07q2GMbDZKWRG
 oEQsdC0/56N7yN1jUmWwDynENjoscm0XRuvyNXj9xERHL8kVvcllSUSCq0VrU0IHt4n9
 9RTmCDyPo6PoXV4w0j6LX+yGFEepCgZdZ+YAqW7GlyVMhewgNWRcm2z1be+1bFzPpZWE
 jqalsuRuiQVu9IAKaXNQzKmaLmOop+q6ovxoAKFtne/0BvDl3WvZJ02AsWHHyeEihqe9 rw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aytdm85v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Sep 2021 19:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJnXBb5ItgQqD6fmTOnYddqEUR7CQNOybVIpIMpkUwo37cnpTo+R29Prwvt49qEt7aC1V6RiOcddXa/wWTbqLtFwl1G9h6E5aEdTbGP7gZACsOYG9bS9yi2OAXa5o9XnFgyOVGOPYVOLlW6WCHHPt03R/gf4CMZSXUq0dNCzzsETRx4sCutiVANuWhjIStrEQTdRghP66x+w7zPv4xAYha6I0QSpB0ZOXVTxOBlekeWgiUHflSbXKY7wSV8AyDeQ3EjBcxx9ywCDLPmaqdX8U7IgD5JCXY9ponJ8CK+tLRs2b57RFWQMKmQBOwHa2jqE2j9t3ulFigj0X4cG6D0PRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6+MO+lOzmCKR26KiMZGGucaEQiPn0HqErnJIgkWhjdY=;
 b=PgIRPMYIOhzG2x4MId14c/zqBBAD/P33Hra3Jcs8TRjINq/odLyOwOhK0caVga23v3Ih97Y3YTBVtypwmRVKqg24YtO+zsJjQOJfa5HnHFUfGhba1NUdHWba3xN/8zjAIJ4peRzBgIHoQwBALkUw1U2YmiakP6zq1StwnPyLgRCx2hMQ5bnP+hkhtsFzh+adlJw+uDRkJRDi2nGs/YOAUXAQZuQZ0LJfzU1nbkm5m+5m1jqc+hEEhSD/IaN0eAEv/oH3aLpVfuwsoDc3EjhzOOPmtEhArvlmRmlmd25rACYBVntlUhjnSAy7Z6ThgfmZahHhX3LqrPBufnGrm8XIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3250.namprd11.prod.outlook.com (2603:10b6:208:63::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:50:45 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::19db:ee0e:abd0:df6d]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::19db:ee0e:abd0:df6d%8]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 02:50:44 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] openvswitch: fix CVE-2021-36980
Date: Fri, 10 Sep 2021 11:21:04 +0800
Message-Id: <20210910032104.38901-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK0PR03CA0097.apcprd03.prod.outlook.com (2603:1096:203:b0::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:50:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4845a68-62ac-4ef6-903d-08d97405c8ed
X-MS-TrafficTypeDiagnostic: BL0PR11MB3250:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3250BC026D59A87D7A5042CEFFD69@BL0PR11MB3250.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:30;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1EVtoDvKc9rm4zFhrxu9xMDh6YiaoAo0V4HuRiQrRqd0SMwrlSVC3x/lLclzq4czzCo8ie/MQbqX8A5FEqmKIekBVBItpFpV+wq8hiOiVmwPiRB+T6A+pQR+0gFFiJDSn24hH4bPttAKvleI4xBD98USIzbWDPr0QvFdlw9Pa9EhQKXKdVXGpmHDL8lBtqcMY62kRWzOx5VV+OJvwf21FHl/pviYqdlya4DJi4kGBn90YmEqiDWkScP0P3OIat7rIdRHVZzzleiTKUQl/KyBSAhHZZlyyVY4erpv3aUZV+crUxBTDYnBmBb9xuP10a7I19NDm7s7r6xGnq64+jt8wpYF1n/rFIa0u6DuzIThTQ9UNxbUjDdouCoeCbenaB5COaA/OQPQ5LvG7+5sqLbOI0dzUy0260DNiZ3rQqw41mTwD3+7wB8WLYBZp8tRoSfmrQ0YEUvd7mX+hQ+ACECegbf6wfgToebzXKe0Ofhh3fR2aC8Jl5Tkt4YwCYdyBx1ADkq5b8m7wqJeizbXGceYAys19lA2K0WT1V+V1de+pGxV1XeHExTWzodJROBg+M6HO3GHCj4DWNJ88STNaJO8/XyvdaJ0/e3V4ma8oDBskiCQGrfS1kIfTj8tVeRKRcA0el4lTOXeJ6NlMtCEOBBEBuRLx/+EcBX+h/XEUCUmv8UabJbk3GKLKaVRt1jeuzsDEl7jm66D3/sX7fPWW+jRojBe+LF8bjVFf7712Kji90/Z5GLi3fw8VI53Qf+xFKwsmCrqIQ67HsmSHyeNQwORQKIJrpdP3QnpMraXkFtzZBOwUslQqlFucAXPLKCgtFF3qLYVncR5KIsrt9CsZCsafQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(6512007)(8936002)(6506007)(9686003)(956004)(1076003)(5660300002)(83380400001)(52116002)(8676002)(26005)(2616005)(2906002)(4326008)(38100700002)(36756003)(316002)(66946007)(38350700002)(6916009)(478600001)(966005)(6486002)(86362001)(186003)(66476007)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HK8Z+VOp5pmucsVAJNeWjVx/u9BIu8xdCmgRd2LXhPd8I5EXz++Dln9E5A+L?=
 =?us-ascii?Q?XV7kFgXePWiOM/x4wQPbt9RX4J4s/aOdE3IljTKaRrjPOiW5rK17eYfDBORm?=
 =?us-ascii?Q?nF3LawJK/ExgZTzd8aDm1MlJ+bpNhJ6pY8SHHTv6d9duByrvl+mjkPCjTgPQ?=
 =?us-ascii?Q?92futxrGlwbdyqPKcwQdyBVDJ3Pckk6NAri/vEb/jHO//HM/3H1VBcq0qKx0?=
 =?us-ascii?Q?GqcSRiQtse8vV7lWAytNGRUCt8knzCaVQxmSGSCkipAGR8/pDxBiZCa6rTYm?=
 =?us-ascii?Q?ZiOPQrV4NpPc6zj6KMRsfgdgtIjPmMrZrHwi4N2Z4exSkPNl4/CC5zFmBMO+?=
 =?us-ascii?Q?7UkxzJvE7EgXZ16fH8xLg/4AOyJjn6VX9Fbg9uRSTAmRuw7P6hg5N9PuU5Bn?=
 =?us-ascii?Q?ZFjq7HQVhemLKt9THCXMuYCzL3hnQ8vsbTMUKi78UyqG91MY4y+KHn7zmAGJ?=
 =?us-ascii?Q?9u9/2rgZ1n0o4Ka8AK9cACux55sNf9wVkARWU1LMlDPLXeIr1O0fzVQqa/Qy?=
 =?us-ascii?Q?QoIGrtYMi2oJ6eefXptgfsxjyt5mhyfB2IPYzPApmyeJiniPrSO52X+jgp75?=
 =?us-ascii?Q?+sB6tXEHOSiSYNnnOZlLAZNFHHrBmXJRqomXkF1m19N1nDWxLiW90J2AUiwr?=
 =?us-ascii?Q?uXp6tPPLR5BlCDaThsK40pJemsvkZpzYtWVxJuGEYbJf+r8mM5cAYVW8Myci?=
 =?us-ascii?Q?tome41EYo3DhPP1tWaeIOkxPOdXkIb3OdRWZK6TYYZ+x4hVrxmUIIY4XCsYf?=
 =?us-ascii?Q?VEFWWBDN8T5Vdi3OAywI5ae1pPgciED4jFHebRf1PAZxDJrj5116aLx5qp05?=
 =?us-ascii?Q?/FLhAp2xlIvY4X6Mwvykb9lNVYh549lwGo0mPvwtfNtSOqEtM7UX054+3O5u?=
 =?us-ascii?Q?N2wYAG8rm2zQjHNVQTURxpno6MloH7MIcKfl+Mwd0C9YNNyBDR1xSOlZupUr?=
 =?us-ascii?Q?jIctRdRl4eCT6z6SUO2+if5H50IMA54rJEdCI+ApHamM9iP7v0CGY/V8BUbj?=
 =?us-ascii?Q?3e0Zvz35BNnwahd55LzWCVM+ZfTVm0rJbUH1kHOVQ/y6EGAZSe/AAnI5YPar?=
 =?us-ascii?Q?hbHR2r8YLQsYQTNAWgct1RNyFbTrZZjTfdiCyg3RTz/D3IYQPe8tbUSbWoOO?=
 =?us-ascii?Q?cXebSETfphYxlF8JOZdHGm5fXL/wr7Ou38IGkcScjOsbxTzayfIrHBVZ3D/8?=
 =?us-ascii?Q?0JlRZ1TegDE5MKGm5TzubFCrET+aYQxrrE6F8viBUxcTaHTJ7a2GdwvFgNCl?=
 =?us-ascii?Q?hvpLT0iMp7CVrmwcMgox7QRFUOzZsYOqL2JyV++xnbZFlnNstGPHBm9H0b9w?=
 =?us-ascii?Q?yTT5Byl+/Ow+Gi0HkvIRYj49?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4845a68-62ac-4ef6-903d-08d97405c8ed
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:50:44.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMEchMgoH7H/AcJSXjkpCjDLJKfy8eB0GOe3a1aXjBO2JSX0CtfKNZw3hOBlQdzV4sNjRfIDKR/dDaNX9yx24KTK1TM18EDVcJzo94uLMD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3250
X-Proofpoint-ORIG-GUID: WCObviduwlRpbF0Hr2CUSBRZVL0Z_xAf
X-Proofpoint-GUID: WCObviduwlRpbF0Hr2CUSBRZVL0Z_xAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_01,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100016
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Open vSwitch (aka openvswitch) 2.11.0 through 2.15.0 has
a use-after-free in decode_NXAST_RAW_ENCAP (called from
ofpact_decode and ofpacts_decode) during the decoding of
a RAW_ENCAP action.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-36980

Patches from:
https://github.com/openvswitch/ovs/commit/65c61b0c23a0d474696d7b1cea522a5016a8aeb3

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 ...use-after-free-while-decoding-RAW_EN.patch | 97 +++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch

diff --git a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
new file mode 100644
index 00000000..3afd1bad
--- /dev/null
+++ b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
@@ -0,0 +1,97 @@
+From 77cccc74deede443e8b9102299efc869a52b65b2 Mon Sep 17 00:00:00 2001
+From: Ilya Maximets <i.maximets@ovn.org>
+Date: Tue, 16 Feb 2021 23:27:30 +0100
+Subject: [PATCH] ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
+
+While decoding RAW_ENCAP action, decode_ed_prop() might re-allocate
+ofpbuf if there is no enough space left.  However, function
+'decode_NXAST_RAW_ENCAP' continues to use old pointer to 'encap'
+structure leading to write-after-free and incorrect decoding.
+
+  ==3549105==ERROR: AddressSanitizer: heap-use-after-free on address
+  0x60600000011a at pc 0x0000005f6cc6 bp 0x7ffc3a2d4410 sp 0x7ffc3a2d4408
+  WRITE of size 2 at 0x60600000011a thread T0
+    #0 0x5f6cc5 in decode_NXAST_RAW_ENCAP lib/ofp-actions.c:4461:20
+    #1 0x5f0551 in ofpact_decode ./lib/ofp-actions.inc2:4777:16
+    #2 0x5ed17c in ofpacts_decode lib/ofp-actions.c:7752:21
+    #3 0x5eba9a in ofpacts_pull_openflow_actions__ lib/ofp-actions.c:7791:13
+    #4 0x5eb9fc in ofpacts_pull_openflow_actions lib/ofp-actions.c:7835:12
+    #5 0x64bb8b in ofputil_decode_packet_out lib/ofp-packet.c:1113:17
+    #6 0x65b6f4 in ofp_print_packet_out lib/ofp-print.c:148:13
+    #7 0x659e3f in ofp_to_string__ lib/ofp-print.c:1029:16
+    #8 0x659b24 in ofp_to_string lib/ofp-print.c:1244:21
+    #9 0x65a28c in ofp_print lib/ofp-print.c:1288:28
+    #10 0x540d11 in ofctl_ofp_parse utilities/ovs-ofctl.c:2814:9
+    #11 0x564228 in ovs_cmdl_run_command__ lib/command-line.c:247:17
+    #12 0x56408a in ovs_cmdl_run_command lib/command-line.c:278:5
+    #13 0x5391ae in main utilities/ovs-ofctl.c:179:9
+    #14 0x7f6911ce9081 in __libc_start_main (/lib64/libc.so.6+0x27081)
+    #15 0x461fed in _start (utilities/ovs-ofctl+0x461fed)
+
+Fix that by getting a new pointer before using.
+
+Credit to OSS-Fuzz.
+
+Fuzzer regression test will fail only with AddressSanitizer enabled.
+
+Reported-at: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27851
+Fixes: f839892a206a ("OF support and translation of generic encap and decap")
+Acked-by: William Tu <u9012063@gmail.com>
+Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
+---
+ lib/ofp-actions.c                                       | 2 ++
+ tests/automake.mk                                       | 3 ++-
+ tests/fuzz-regression-list.at                           | 1 +
+ tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 | 0
+ 4 files changed, 5 insertions(+), 1 deletion(-)
+ create mode 100644 tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
+
+diff --git a/lib/ofp-actions.c b/lib/ofp-actions.c
+index e2e829772..0342a228b 100644
+--- a/lib/ofp-actions.c
++++ b/lib/ofp-actions.c
+@@ -4431,6 +4431,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
+ {
+     struct ofpact_encap *encap;
+     const struct ofp_ed_prop_header *ofp_prop;
++    const size_t encap_ofs = out->size;
+     size_t props_len;
+     uint16_t n_props = 0;
+     int err;
+@@ -4458,6 +4459,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
+         }
+         n_props++;
+     }
++    encap = ofpbuf_at_assert(out, encap_ofs, sizeof *encap);
+     encap->n_props = n_props;
+     out->header = &encap->ofpact;
+     ofpact_finish_ENCAP(out, &encap);
+diff --git a/tests/automake.mk b/tests/automake.mk
+index 677b99a6b..fc80e027d 100644
+--- a/tests/automake.mk
++++ b/tests/automake.mk
+@@ -134,7 +134,8 @@ FUZZ_REGRESSION_TESTS = \
+ 	tests/fuzz-regression/ofp_print_fuzzer-5722747668791296 \
+ 	tests/fuzz-regression/ofp_print_fuzzer-6285128790704128 \
+ 	tests/fuzz-regression/ofp_print_fuzzer-6470117922701312 \
+-	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448
++	tests/fuzz-regression/ofp_print_fuzzer-6502620041576448 \
++	tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
+ $(srcdir)/tests/fuzz-regression-list.at: tests/automake.mk
+ 	$(AM_V_GEN)for name in $(FUZZ_REGRESSION_TESTS); do \
+             basename=`echo $$name | sed 's,^.*/,,'`; \
+diff --git a/tests/fuzz-regression-list.at b/tests/fuzz-regression-list.at
+index e3173fb88..2347c690e 100644
+--- a/tests/fuzz-regression-list.at
++++ b/tests/fuzz-regression-list.at
+@@ -21,3 +21,4 @@ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-5722747668791296])
+ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6285128790704128])
+ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6470117922701312])
+ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6502620041576448])
++TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6540965472632832])
+diff --git a/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 b/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
+new file mode 100644
+index 000000000..e69de29bb
+-- 
+2.17.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 1fa7fb2c..4f5454fe 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -30,6 +30,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15
             file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
             file://0001-openvswitch-fix-do_configure-with-DPDK-19.11-error.patch \
             file://0001-openvswitch-fix-netdev-dpdk-compile-error.patch \
+            file://0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.17.1

