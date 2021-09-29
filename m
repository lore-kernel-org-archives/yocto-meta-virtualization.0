Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.4251.1632886636429286379
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 20:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VLBH/CGi;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=590606075d=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T3bF9M006573
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Sep 2021 20:37:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=yyc0kc8WE6Cd6Gr3Vixn3coRqWDsZugWJfR7REavzfI=;
 b=VLBH/CGiW9Ov/+2utBlY2EmrlnKv0Ncaqyru7sERpSxHKyIUtQn2nGTj3fHnoYnvABkw
 HTHzE6Iu5n+3bHTpX35vJR9GZQ9dkei5PR7E7ZU1yGhS6CukYND738fWfXZ6WirVpwg/
 JraBuaVczEiejr+1QInsTx+p1LxsDP2XbckQ6oaxoTvZjpVD8s/a0u1FEp+qRDFPm/S9
 FiPbgxskXBH6QWFyT5Yx4sOFs9AVvjN/5qAmpgPgxeYmT1lolk5tGLjNKKSXBjZ7Wu14
 UGJ4ZCg06TcYnzPnB47sgEiihnoXjUTe0oAkAw+EuRi6MzKJPnNf8yAC4TOr1Sbf5E10 +A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bce8c02q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Sep 2021 20:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuzFU6mO7sKF4wpnCu566ypBWCqDasbyj/pzC2OxTfFkfK1XeZRMJqDQTT4LHI1FVwLd+DDnJIygt2Kdw7mtE3rXPC/LHxXyPf6ooxr6OolHfcaMrVImn2mAgffAshiokFWfIPgJg+OBBwYLiltf5QDI7KIozbDqYlge62+7Or2FR6Uq73wC+SuBX6Cii38psmi+k/4EgwMbq3vvF/saL/dF0fpSj45LWeKVjgOn9PAy9HDOTIK6N74iGL/CPMzmRwv+sZdr2PBxOWtEkGa2jLXU6Yo1NSoyOzV9ez06ArCgMfguS7XGg6r5kkWSAlx2nGDJApS+yMtcsjD1fDLOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yyc0kc8WE6Cd6Gr3Vixn3coRqWDsZugWJfR7REavzfI=;
 b=ofSYDbS4mvcUlpSLCerV4L0+Du9iOoitH9wdy89KsjDXo8cqYEwvUVV39LZh8bR2K015sqniNHTISGSax4GtIrWQ2t6cofIVrnXx4gaKKzBgjyWNQsD9HPcST7CX25LgB6CAJy/jBSqghYY6onWTHpeeJowXUm9KzAOcZpFONkH2UEeHihkpldWIwc514obOSGKs6uBKAfIAltbQUkDxwRC0E0ZCxhhv4wh8hESvgY689lBinxckad1SoCd/A67za+FWkwvRcmQYYQZEaSxuLAJRnjFF+4Ww7/R9av8C9Qq+jd93dEq3NP23ST9UDiK7dXN+FKfYjIP4XmjgOwbOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.21; Wed, 29 Sep 2021 03:37:13 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::51b7:91e3:7c34:57a5]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::51b7:91e3:7c34:57a5%3]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 03:37:13 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] openvswitch: Security fix for CVE-2021-36980
Date: Wed, 29 Sep 2021 11:36:48 +0800
Message-Id: <20210929033648.2372012-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 03:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b729f3af-5891-40c2-9e46-08d982fa6ad1
X-MS-TrafficTypeDiagnostic: DM5PR11MB0028:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB002863408D0F5FB8AC1A8958E4A99@DM5PR11MB0028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u2OMFTiSmvc5Uo7G1/n5O67gE0AIRrolhWeRQL4XDB+urwkeaHPnfNGI+aVA6GRBqtqTGct33JYSchpkT4XkLRBOIH/qcJyK6w2OqWw2t7oSGp4kxmcFyDZWI4D1SuHor/AxmH1A/MFz7JgXAP09BtvcVmBXeNFuRS8xklENbbzoNroQLoGDtOooAPd4l4k6Q+8pZTQNScCvFN/WOOjQ7JtW8t+T4s3MNWA45ATOcQ3uz2H5bPewW7mrlpQ57upRwSKr8V1frLL9D47Qh6uVA8VgsiHe2BIrjvh+s2z7OzQhyLRSivPtlbJpW14aA5fuD86fVdfPK3+Cv+atLUwryktBdArIpcq5ZMapO2SK24yCbs5FHzHCZU1MfEiKPIdHIwe+8R05RMlidbIwWPoz5efd9cI23O3bBbi+UTy0ujqBO/SGqDbWvHm/TPd77StQWjwfLXeemSL3F85j81I+D9WTz20wFpNcYZfWoMqDExmszH45JhxMSeOMBUVUHJnQWSfWcFS9bwu17AS3iJIi88bK/nTLYg24PJ23AObeNr5HWhYihPy2ixmWWOC4ZnqyYBfaBsVASTbb/LzvcGEsj2DGuXggY2zlC45gtEpobbCEB92veiY9Vw9TWC3e83T/g/k54Eo6u1sKhC9ltE0w98gFbxJLZdGFWTVr+L/4UEx0HXN2Osz//VMfY+GQasPcSUT4QQrhM70jYfhgr1oc/bSXWikWL9NXtU1dvq1GjRMy6/2LY0w2+4Nl/6CvUNnz7YG1P6OSf1rWRCzuLB7VGWAF0p6+7SaVKyU37M0Prs/tN0JhLU4u6m+AGmhZo5lR0HJcgAcx89MYNJ+Pfwd/DA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(508600001)(6666004)(36756003)(5660300002)(966005)(2906002)(2616005)(956004)(26005)(83380400001)(6486002)(6916009)(66476007)(38100700002)(38350700002)(66556008)(52116002)(86362001)(8936002)(6512007)(186003)(6506007)(8676002)(44832011)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9jDhWjP2C6K9xnBxL+bxqfxvuHRZCe8a6bItXF/SgpmTdBq7x5gZQbY66rLM?=
 =?us-ascii?Q?d9ONnG0/eQM46nPdk0KK2T+2kzHFuvNTvfUF1pXLNN/Vj5Cp27Hp9wAWyU5o?=
 =?us-ascii?Q?4dJc02OEuYZ4SEBfBJGOQi8jtX3fZawJEmD4T1tOV6pxZC6imRgPTGtEYWCF?=
 =?us-ascii?Q?4PnDeyrTT3FbN63sfZ+2RKCSwmJDMjq/1KYYae6gAa2GuzmGa9YbxSqNYGUZ?=
 =?us-ascii?Q?IxdJlJDv0gl9bUqiFvCy0Yxc+bBrWklIGu1YIKRkug8U9EPLv5I8hrq8ZHQN?=
 =?us-ascii?Q?vjyOsddHPIT27iWKB+cn/h5GBzCuhEANe4gkpAur/zO0416Dupo8pxW1bemr?=
 =?us-ascii?Q?vNil/Nl1BrEP/THJ1hQruDZn0icQpyjC3OTo3RufolNvuFsO2rEHB/ucs52b?=
 =?us-ascii?Q?wEkZFx8ZkgCqWeyKPaT1gdtrrUNisYNJihxItrbuVLUTIfqmuf330CvGu8l+?=
 =?us-ascii?Q?GYGcC2q5oSpCcSaIRSmaf2xRRe40tlGHEUkyN6wZEtIw8PhZGWmSQPXlWm0E?=
 =?us-ascii?Q?i/+YlYNt4W2I5/OZY7zgpR6mNDtFHk0S7s44Ifut0eznztKWjE6nOnSeBUAk?=
 =?us-ascii?Q?QdMZKPeeKSciJUqLfneNG32Hg41CWD2TW/2iWUonTDH99OVVKfC9FMI2Y1Qn?=
 =?us-ascii?Q?oJIi3dsTG9EKhAITuiggwWwmSaZQCl9ws9SqVOcH/jKtctzYkVmOudS3oTKH?=
 =?us-ascii?Q?Ch5c5Ofc0aqkDBGZmM6oiMFUNoA/tRmo9Pf83MgTTJtoBgoolOJzUoRrVaCF?=
 =?us-ascii?Q?dS+WL+ghnLsNCZ9QaSoWY7mMDXwawAjHy7P4m9zv8FI+cOZQMnfIQfFg7C3j?=
 =?us-ascii?Q?E5vYZDCKBmEm0yEY+QYS3K5VH7DAS46l/u1IX7eQDCIfJP4c9YVtwrQqpi3J?=
 =?us-ascii?Q?I6yW09Wc1UKk+Ig8XnXNYnAroeqiyC3psRP/HxLYAArK7BWA+BDQRFjyiMmw?=
 =?us-ascii?Q?lw/yD9Kcff0n4RM0nGQBPnR4NTLPMzWGKFtZMb4U3gh5v4n3ApATBYp5xdpo?=
 =?us-ascii?Q?wfiAhMRqlelHKIYLIsCtmuftjYcd7HfgF99gBmiU52SHzwaR9g3Ia2Qovlhp?=
 =?us-ascii?Q?Y39flN6Mf8zouVkHPabiuzgKfH8ecrGfwiDOFwrjCcqCydZSoRpi4/Pib8Ef?=
 =?us-ascii?Q?PKZ9LfFUZMefAqtmxYA6Aznx8KgUtHPnS2bVyTfmF/n4uHcqW0BixX8JJ1Mr?=
 =?us-ascii?Q?snfUpZ1vIb8zC45YWdGDZUYqUi4yFjO/HJgZ3OOL+Sz9aOR2Eif70TeOIIiE?=
 =?us-ascii?Q?YfnkNcg9TlqXKqZX9VEqOJfujLJrXQAlvFa7Dt23wdmX5OJaTpAT1Zf1w5Xe?=
 =?us-ascii?Q?U8otCS+akaw+GD6K0Tysejf3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b729f3af-5891-40c2-9e46-08d982fa6ad1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 03:37:13.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RO5yM3JvExQPprZWuNL1J1ot5BQ+T5tAjVsuXn9X+yhzO5cH35RPpbyBO3IRI21o+HGK0vNNKQXZu9L/+oLbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0028
X-Proofpoint-GUID: _FbNXaubCPgn0TwH97B8lds-F7MP-uOb
X-Proofpoint-ORIG-GUID: _FbNXaubCPgn0TwH97B8lds-F7MP-uOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_01,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290021
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Open vSwitch (aka openvswitch) 2.11.0 through 2.15.0 has
a use-after-free in decode_NXAST_RAW_ENCAP (called from
ofpact_decode and ofpacts_decode) during the decoding of
a RAW_ENCAP action.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-36980

Patches from:
format-patch from ovs v2.15.1

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...use-after-free-while-decoding-RAW_EN.patch | 101 ++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch

diff --git a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
new file mode 100644
index 00000000..c88c097d
--- /dev/null
+++ b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
@@ -0,0 +1,101 @@
+From 802a31a7070cea910b95d7e926c9da30a1f9e54f Mon Sep 17 00:00:00 2001
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
+
+Upstream-Status: Backport
+CVE: CVE-2021-36980
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
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
+2.27.0
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 16ec4c72..56f1297c 100644
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
2.27.0

