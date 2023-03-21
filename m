Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50DDC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 06:29:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6746.1679380178772248021
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 23:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LMWABy6Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2444beeccd=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L6PWYA022054
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 06:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YlZk8fAXykjoer+htDuf/PBP7t4Zql6hgojHZEgd0CE=;
 b=LMWABy6Ya2cFGQrh6vd0iw8ViXjpx6bQFo0mSWII5P8UuIxx57yQ4q9o0yBjJ0hFfnwu
 978GTfsQuy9wYubQm4dDFVJdZl8jMRCK/cIXacLmQcrDXAMH2FH7UCk2DMMvUyPAhmkO
 /K6gopFLD0U2eG4+YkRtJ2DoiBDr6BfH9qAsPu8UKBXTLZtQGH9anWvrfF5EMINUKRAs
 5eC7XAH6RTdjtbH/T46H2pwjCRlplS5bPnd1+okf/EQQAlmLOjWZAZFDouJzw5oowWs3
 IDKI9yveH5RjvvaZQ3hGPO/KyNKAmGzuCiJ9LOHNnV1Xr+XJbrRh7zu22GCzrsdK3O/J zw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49atp6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 06:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YngYHzugyKzdWjUM4FZt5EeVvP5WGDwJ0JkwztEER3CodO/gi3+bJqkq60TNBjpBE0CL4JlbqygqOgpatEfqF2WpkfxW93rt54tGWfwDKC0W5+DKXjHtc/nzSQ/TOY2s5G430HYfD3CQV30woQ/i2K1rYI6uoO0pzyofOvdrnZNmAR+6bNoXVcnPJVDPnRf7GfJplFXmT5b+eAyWiJgXexE8opCSp/GzewG3h0tLyuuQc7aCDZdfkwkvFF8IqqThYQqid53ZkuHf9GhEd6VA7gAQu5/ohlp13iQsYWoy5rcC2GoMHRLRF9A7f0B4FeqNxEwV/bRkPfjdmbAgw3IuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlZk8fAXykjoer+htDuf/PBP7t4Zql6hgojHZEgd0CE=;
 b=RBEJJTIvMBGQoIk99Gejdi5mjJcBy7llmCaNJj/iQPCBRuFajTf2AZOyzl9OTZC9b4AvwJ88hCwnSIbR2GgQL/L0w5sMQLFtODLHrU96IqKkAYUJje8GrmgG6jdurKdgjMCKyieJSBnMBh6pZ3/xrX8kYK7CQndXTgUhlrWmYv4Rj1dtCcWd7mQIi6JiQWa0sKIbK+MeHCwi0jISTHc1WoS4vWKZLRyxMlgCsyRNBA6GMtflFTHetVJDhBVOWcz8kDdyPNbNb1MHuxVBwbhgUA8uuef2QOG2UTKQqNLKKwH8zivnVO+nXGJmVmXNRGqwVdR6nybAvM1rguUcdIRdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 06:29:34 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 06:29:34 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [[PATCH] botocore: Fix rejecting URLs with unsafe characters in is_valid_endpoint_url()
Date: Tue, 21 Mar 2023 14:28:23 +0800
Message-Id: <20230321062823.2778260-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2acbad-2e28-488b-e87d-08db29d5a32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FkBKHgjc6uUUJcXpa5q/GTxInILUUWRYNHHMSlCukaNsue2kbNCj/Q1/v572mckRcO2qByHjY+oUkGVt1yUARXUHzNtFFnE4Vlf+EoxbTaO+6JwgILqmnySaSSbxpc2DbjL/6LXChMq/yJg0B6rWPhh17ggJbt5+m38wwH5MkUjbsTrU2Zzq2x6VbTAHb7w+YCZyDOq7USpSOdTo2aDliGBh4qfgQVmGgWICUQ9TEEJ/GDYJNzBli0Xwi+i9H6wbYG3/QfGJBjJvkqsyV5zp+UwylxKY5FtM4j3md67icDG0NdN15UX34DkL31kmXEvEw38gRXBMwF9jAf5Ake80ZeUyeBbq+RdDXbaMPTM8TCYx+1nu/zsuFNLKB/kgfhzvpgkUhhS25fRgs/SGmcWowKKW85JAP5NVt95ftuVOsM6QABdCP9DhPoUKa01Co9ICHzQbwUvs1XW4iQo/H0jPYUFrqTUq//MWkf9+jxR3F/kkWSOTDSIau+vqhzaKbgT6nrbqp0C5O1HNuNKI1gN/K9wodWqHTCB/NSAsmWgPfhBqsImaPbeVCBxjWQE8AgXjmgDgxbbWTLtmSgZAdL9J6I4J7LpPkVDQgM5e/aRllwuwcZLP+a/AGqxKGZrKsZj4rW5/dQHXnU4C9McMTwqm3LlQCydPg2TMHtJGQOrhgUsZO9jluy7tY5nKR15+9B1ASuAWupUgOtIopYFMhrU65Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(136003)(366004)(396003)(376002)(451199018)(2616005)(83380400001)(86362001)(38100700002)(38350700002)(8936002)(8676002)(66556008)(36756003)(66476007)(6916009)(66946007)(2906002)(44832011)(41300700001)(5660300002)(186003)(1076003)(26005)(6486002)(6506007)(52116002)(478600001)(6512007)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ohqOoS9RSsItc89hVUwVVjK01tCjzmYsus1uhVA0FS/m6c1ZXYDP1+NSB0Bw?=
 =?us-ascii?Q?4POoDec0Cj35dI8dlz5mBeS0Un2ENvsjRQ14ymrymEB5OboA2eD1tQY2O6A9?=
 =?us-ascii?Q?y3QNAr8uscTmHLFO+BUNiOSRDPSWxG9xWX5b/wWpnFutbKLPyGNO+eVntyDb?=
 =?us-ascii?Q?q2Nx89r5IM72iO7WMpBEg/AMWYyDhBa84IKviTsyUjnjChmpYNR3zYAK6PKh?=
 =?us-ascii?Q?rLmj9ng21eswuZtsPEh2RXUT/CBBeRs2uXByN6gp2ZK3ngWgRQzjAgh99KWS?=
 =?us-ascii?Q?pe3gIzBrMwwtdZPZ46p5wJcfwWmQSF2VRbjAw51JNdw1a5f8wSIdYDcTEXSz?=
 =?us-ascii?Q?sY+YzBBpd8l3psgz4Qp0BDBDwUEm4vCqvL2yQx8oLaU7k3+rqQ9HmUKuQyFx?=
 =?us-ascii?Q?XcdRIlP5tHrOtozIvuwJg106n5x/5M4OHJTOihCO8vGlogeXE+RDINRBjpX2?=
 =?us-ascii?Q?aUI7eI44fnUzujUdyPZB1KrNRPuw20G+7d4q0NTA/pBXNn87HsGTmQGfNl0T?=
 =?us-ascii?Q?w8tl4zNdJO61PLMfp3jSAkDEPDrsqns0DAXW8D9yiHEqOLIFwD5Nl0mPcq3W?=
 =?us-ascii?Q?soMWf/NSZvjELsJ6uWAwZDYEcSX+7OvR1YzJfVBGAhAO6j/r3aqKzvd4WPin?=
 =?us-ascii?Q?wjK90+LRfqkzPgTqwORnb5i+ZuPWVmDUgDnBxPKMiXurS92wLpAC+a4JHh2V?=
 =?us-ascii?Q?gNbTES2AKF1LZ94iuqhoh658L5Rglf6rAQIl0QYVqkfyYpZlCQo4YELBruVj?=
 =?us-ascii?Q?xAch5KNVJyTDq/ix/NMY6+U2EBE71iIsQCn0H7iCeoq+nOKZdHtXRIvB2Krl?=
 =?us-ascii?Q?MlWFbo2FRzkSyQoHF37t4oHVqiIK6uiNYSwm5Xa5qcq05p7yKTawkzCNsi2j?=
 =?us-ascii?Q?AfFZc42RBV3/rJlDD1Y+Vcyvyl2YYSn9m9nQP8EgklhYJ92LzZUvsas45frv?=
 =?us-ascii?Q?r6CptVOiHDnELXwfRatJFw5PJ5/rqIwX+F2S7c8sPkWW27YYX7w+Z9ymiwXI?=
 =?us-ascii?Q?xqNgZcXSQKJk00xHypP8TSDUl1gATObo4HkdSekQSoNgNThU/NJLUm8FqNnH?=
 =?us-ascii?Q?2Dlko08gAqnqOwOlpL/lQd3Jll9emJ2jDOCEs6k37XOZwTuNtBlIfqE2t9Nx?=
 =?us-ascii?Q?1WpQaYCpDVCqsLihCZEntqEOp+T2eup6UnnP/y0EvPT4lA0x/9De281TGTog?=
 =?us-ascii?Q?ivzqGkkX9XzStGGmq6VRfY7vxRSI/KHvYllp5WbBcR7FOkaB2K3IqlzQddQm?=
 =?us-ascii?Q?H/TyCPhvnEEt7Qwj+NVVtFnUXKV0F/iCOUuxoFGkYi9gmvBJGxGDvMZ4Sb+E?=
 =?us-ascii?Q?GXjbz2HsqsAMTom4UCE1rvW7xvw3DnbcXVYDmZvmeww2sLPSDOuk7A+pL6ox?=
 =?us-ascii?Q?ltyzOpwfRzaHp/D/8H9O8auk87Wm1NIBTgK4RNZo54iAoSbMxTCTkHMqLiex?=
 =?us-ascii?Q?zaTbJdlv1rnPxBflVzzv+DvhvLqB8KXk+CPENaSBKajvXHz2mpAMt19V+QW5?=
 =?us-ascii?Q?IFBJZPDXrRxy9ecY+ZvTMOnpCzspUjJnpU9/Subrb6N5OoeToml4gDP2YqzC?=
 =?us-ascii?Q?8IsFjEdEaEooNITToYfB3EbjHp3gZ+0LEHfFP4aZc4kBCRjjSzoX3SyD2xY+?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2acbad-2e28-488b-e87d-08db29d5a32a
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 06:29:34.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfjsTiNwIEf0kIJzP0tFAQiPohPTrNevmqr0gx6DL22pLrjdoIj1x+4quxNnkcc+qSp/SHmzm21HUP/Nn4lPFJvyXYVk1R7+nSekYJ95LiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-Proofpoint-ORIG-GUID: 9U0NrGh8ktPD-4wLCHKrZxubhSYpoq7N
X-Proofpoint-GUID: 9U0NrGh8ktPD-4wLCHKrZxubhSYpoq7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_03,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210049
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Mar 2023 06:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7950

The function is_valid_endpoint_url() in botocore is designed to validate
endpoint URLs, but it fails to detect unsafe characters with Python 3.9.5+
and other versions carrying bpo-43882 fix. The issue is caused by urlsplit()
silently stripping LF, CR, and HT characters while splitting the URL,
which disarms the validator in botocore.

This patch detects unsafe characters in is_valid_endpoint_url() and
is_valid_ipv6_endpoint_url() early, in order to fix rejecting invalid URLs
with unsafe characters.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 ...Ls-with-unsafe-characters-in-is_vali.patch | 58 +++++++++++++++++++
 .../python/python3-botocore_1.20.51.bb        |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch

diff --git a/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
new file mode 100644
index 0000000..6a43608
--- /dev/null
+++ b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
@@ -0,0 +1,58 @@
+From 370cdf7d708c92bf21a42f15392f7be330cf8f80 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Fri, 7 May 2021 19:54:16 +0200
+Subject: [PATCH] Fix rejecting URLs with unsafe characters in
+ is_valid_endpoint_url() (#2381)
+
+Detect unsafe characters in is_valid_endpoint_url()
+and is_valid_ipv6_endpoint_url() early, in order to fix rejecting
+invalid URLs with Python 3.9.5+ and other versions carrying bpo-43882
+fix.  In these versions, urlsplit() silently strips LF, CR and HT
+characters while splitting the URL, effectively disarming the validator
+in botocore.
+
+The solution is based on a similar fix in Django.
+
+Fixes #2377
+---
+ botocore/utils.py | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/botocore/utils.py b/botocore/utils.py
+index 378972248..d35dd64bb 100644
+--- a/botocore/utils.py
++++ b/botocore/utils.py
+@@ -173,6 +173,10 @@ ZONE_ID_PAT = "(?:%25|%)(?:[" + UNRESERVED_PAT + "]|%[a-fA-F0-9]{2})+"
+ IPV6_ADDRZ_PAT = r"\[" + IPV6_PAT + r"(?:" + ZONE_ID_PAT + r")?\]"
+ IPV6_ADDRZ_RE = re.compile("^" + IPV6_ADDRZ_PAT + "$")
+ 
++# These are the characters that are stripped by post-bpo-43882 urlparse().
++UNSAFE_URL_CHARS = frozenset('\t\r\n')
++
++
+ def ensure_boolean(val):
+     """Ensures a boolean value if a string or boolean is provided
+ 
+@@ -977,6 +981,8 @@ class ArgumentGenerator(object):
+ 
+ 
+ def is_valid_ipv6_endpoint_url(endpoint_url):
++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
++        return False
+     netloc = urlparse(endpoint_url).netloc
+     return IPV6_ADDRZ_RE.match(netloc) is not None
+ 
+@@ -990,6 +996,10 @@ def is_valid_endpoint_url(endpoint_url):
+     :return: True if the endpoint url is valid. False otherwise.
+ 
+     """
++    # post-bpo-43882 urlsplit() strips unsafe characters from URL, causing
++    # it to pass hostname validation below.  Detect them early to fix that.
++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
++        return False
+     parts = urlsplit(endpoint_url)
+     hostname = parts.hostname
+     if hostname is None:
+-- 
+2.25.1
+
diff --git a/recipes-devtools/python/python3-botocore_1.20.51.bb b/recipes-devtools/python/python3-botocore_1.20.51.bb
index ca506f6..f71db1f 100644
--- a/recipes-devtools/python/python3-botocore_1.20.51.bb
+++ b/recipes-devtools/python/python3-botocore_1.20.51.bb
@@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "c853d6c2321e2f2328282c7d49d7b1a06201826ba0e7049c6975ab5f22
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-jmespath python3-dateutil python3-logging"
+
+SRC_URI += "file://0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.patch"
-- 
2.25.1


