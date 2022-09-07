Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD80C6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:25:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8256.1662560733332561594
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KgUv6OA5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62493dea70=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 287CR2QU020575
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 7 Sep 2022 14:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6mjyC2U7FFFkerNvHP4GzkMJp+Zl36QhQWn7VsSQeCs=;
 b=KgUv6OA548/cIw/RkBrYhQ5HfmHh5rh6TgY5L7vtIjWxhESASw0HrhyskP/HAdYvoDSZ
 yIs5P3kCv4Vgw1X5yAuTG3Qa2wW2i3zuFx7C8gV4moTxe3EZLVP26n4JXajAooFc/8B9
 rglAUiEEeSJjSA9ZLZ+vLNkxiWqZN4zhJWXsNv+F1drIFeQZVKXpjYqdk+3Iw3Q9phSf
 ZkLGcQEezXdEEmpLxI1zxONvRX0a97loJFYmtchxQ6jGoLjGx5/pwfpysXkyc5kRBuoM
 Q4kX9u9pXzZaG/L5U1mdCkelIgrXcnbjWEWd2s7rUx/Yho+a7VilhdopyQDFY9NEe74n mg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv0m9x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 14:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnwLOReltG4UedFFXOinVe2XDM8SsfRpgnGceotggYG7oIOHnlfP4hI7ZgKsC3tponQK2jhDdAZCVPK3Erv9wzKtlQ8Hr1m/0vfyyttYgacs/EWVFd/+baZTB2PHwV03Jlbg4KkWhvoQ1CFjJRoMJa2/leyXLIFP8dEIWUL6mA2sxHUWtuS4A3XATeXQNrCbm2/vQ1UbWJ0xOkmKgwcu2FgeFW+FVKVnQedJBhxoFN+5fKPaxFVh7vKW1TmhQbxIbMJip2fnHIcuYuGKN+DjK/l/4W9L6tR6xTDPeJXg1RQthxMaQrnE/NsRXztGPhJ9rVtZArq8eHZhfyGKshMzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mjyC2U7FFFkerNvHP4GzkMJp+Zl36QhQWn7VsSQeCs=;
 b=QNfeogfqY43IEAJ/JYDZR3Zr3zW5ApG7nse2msgvE1j9xq+em3RaUhOmykjaHmJINXeCrF+hb6LsUJyg+XBaRt+XWM+2DLCmzUNo71MwJy4KdklpmND4k6xNfXjDnY4BZhQh1BFuP79CdFAdhDyERoiqjaY1iiFFIl3OZdTDvsHq3Vj2rQzJz8Na9FZa1nNzQxp0bUpDKVbPC+fKELZkil2LhN98sWdbyIB9Rs3ZyZ7motrmlWCmw/OWhTZ6RBkWgST+4e1CXxfDRRRJECK62gMYGnvH4ThHraPhprivMIoR2suJ2+veXgszm/BUWuVnOOrkR1vTLJFi36CA6bktOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BY5PR11MB4022.namprd11.prod.outlook.com (2603:10b6:a03:18a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 14:25:29 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:25:29 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [RFC][meta-virtualization][PATCH 1/1] ceph: upgrade v15.2.15 ->
 v17.2.3
Date: Wed,  7 Sep 2022 10:25:14 -0400
Message-Id: <20220907142514.17076-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220907142514.17076-1-sakib.sajal@windriver.com>
References: <20220907142514.17076-1-sakib.sajal@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6309d5e-a161-4e9b-b9ee-08da90dccfbe
X-MS-TrafficTypeDiagnostic: BY5PR11MB4022:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cMbMlZMklvEHPcK8quCHEWxG2m2hRjzJEkmd9bOIlzSZWraLgQkdjZE6v1ev3pVJXjJNS+JfdXH6mumabJrBxVLXPteGLzwX6LFJesvfepkSNuBJ9rLAJPjo4hnfajGQeEKlej+nKISWctDVRl0Gf6yCp7RjDUhslUAtdN+uKbbCMgfRc8aO52pzGEMPyJHLp+3dIMb0UYgsmH71a1Q/VoMlgik+T61hzhUp7H9xGkO1j3AReqSveozEjDY0tInD4KDarNg83oWV2xRyQkEz5jHxiTneO1Xc42xGQK0YMR6477X6PtxyJz/4WdNFfpJsjXq+zOoG3FmokaOcK2edXlh60/X/UhWyXF2JCZSYtb51ilWF9khY5pyg3IiIybc5C5Q9mJXz4bapdBaDZCOkgc2BJBgQylDwKwV7OfcOSpEJX6ZykrKq2cNDvuPf3hHFRBmynZg0J/ikfWwVrUfJ0GYgbVovW275g2A2duBShkceXFVnZOafM055LbgcJbFiKZe9PsFvEjaCD64bapso9FyfNSPD2m7rSNma4MuNrDrWTF/iLOk6dhhMwEd8Z82HeoUULD+le1KOtNJ6rQwxAt59Z+4Lj9yjKHan3yT/NF2Wir2C/Gyc4W0suVTXxtrcwzgdrgxBF4MnQxnjKl6YGFWvopoZcCPbEKvRIjx8IU8kzThr2AEgix/pkSijaJRtY03a3jx3lGQyr3SrzH8/6elHnYjwrkHHbhoJzEQFZ4XZjaWBldEy4biyjzWLGytLVrlgj4uR4f+bc2dmoh+UL6CxWUOWw96P6CZcVQVhcXlA11n4Hmr/hq5ajGeP0z5pjpjIB3Ys29p6kIZT3aHGPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(316002)(66556008)(8676002)(66476007)(66946007)(2616005)(38350700002)(1076003)(6486002)(38100700002)(186003)(966005)(41300700001)(6512007)(6666004)(6506007)(53546011)(83380400001)(6916009)(26005)(44832011)(52116002)(8936002)(478600001)(86362001)(2906002)(5660300002)(30864003)(84970400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SjHzxZ1y3XW6rUJZNV02c8RUglvboz7z06NoLMLREKTJYS4gXCLx7xX0nsbD?=
 =?us-ascii?Q?p3d0P+wi9rMDv0KdAODVVQP0NXgqaQwzd2KHJw+m6hSl7rTLWQ/P9xIjZXwC?=
 =?us-ascii?Q?Jrukc2kE4trgNyHq+36GCJtShgV3ZrsXVzWdUIn4ZAFPBb7Bi8YGUpzbygLF?=
 =?us-ascii?Q?ssAUYVg2Q50HZLmW+q+HMduOXPRgLMQoAkwCoOHkD4tWLBE+qehCuT7edCgY?=
 =?us-ascii?Q?EcXAus3U9Zg2A5QLroy3xnske5929zkH/d6jatRVQYt3IWVT5/bUo3QGHxam?=
 =?us-ascii?Q?EcQb/T1Y7z7yI/zFLudxxxQEotov8TQIzgrKJNBwbpiTbVz/QU9OrSVWgBVz?=
 =?us-ascii?Q?dZQrZQF6wsgF9eEkz0p4VL64ZM9Ac5QQXZWIAb54UrXaEpV9yaCFwAEQYxcv?=
 =?us-ascii?Q?kb0vxw1eusNGU6i/59aYchinqePxq7GLhK4v0rgx581GgysHXLRAks0tlXvX?=
 =?us-ascii?Q?T3pcd7xEi34fYgB7ra/JeMF4T4ePMjd44BkZy5KT3hsD0yrJEECUDlkfBG4E?=
 =?us-ascii?Q?kbGN9zJc3YnYaw6nD7SXSJb5oAk+AYwugsoieDxr/HJpHcOnq0GuXODi2sky?=
 =?us-ascii?Q?IS2P6PEcxPNR62z5VRU3mzEy1M1tMvucuo4y3kJt293kVXgNYIM0yjVTpiC/?=
 =?us-ascii?Q?kwP0nGDVLFiCs3cI6J1Ul1dkQQlRVwGsxQuo+PJO0RqGcekLq2ghANv2j/ba?=
 =?us-ascii?Q?ZgQKV5sdditFu9afmfsD43S0CvMmSVPdU4ckVjKYm5hVWGic7Qc30Z+qibzC?=
 =?us-ascii?Q?XSAeGGllkGUcii8IwhHgWYAM+lTBXLEMTtQfUWoEtoye97IdHhisv3LZnaan?=
 =?us-ascii?Q?yOTzB2hvMDtpG0fvJ8X+B8a0z9ll0NFwpvbBxUsDQrnzZju4gQwRpFKF71Rw?=
 =?us-ascii?Q?5fFLNTaifqrYhKzYxcQ1Ey9ipmQAspZHyzFNCRi1HFoO9ItAz9aIwl8YJavt?=
 =?us-ascii?Q?LoX8Vo7tUx9gTChSih51pQj5KGix1dYxhBfAdXRAudrwc8FwG/IJBhDuhSAu?=
 =?us-ascii?Q?C7tgxY76lIRUE6cQwx0vWu3uR4II2k9sb3B2S/TLqHyjF6VMRa0uTFjm8vxA?=
 =?us-ascii?Q?aEUiqyC+iRyd1AZC5Gv9WhtQjoQrcX41b+J29ZGFaUJXPLqY8RDJgFShbrbk?=
 =?us-ascii?Q?Lh+nVsJh/hwk5UW94NcYimmnHnmWahkG/V6NwfV7f9lMddiqz1ijNjs1cD5W?=
 =?us-ascii?Q?ehdjGzw9PwVjfPS0hHuxwFi7TPHBFgpYNR2J/sHVBjucsmEtElkC5a6KukA8?=
 =?us-ascii?Q?ptKy0oq6geHAFC/fyutj+nsJrZ2K47Zsm4HYZ3/PhVwUQTjDGEaQoQtTXPNI?=
 =?us-ascii?Q?tPzD5Vf6WgxaBuvq7bx7dBxO7SFAoL6MTXYgv1+guNsQRn1cAbjv05PrdE4v?=
 =?us-ascii?Q?HkKFHbm5XuWucBOalFceD9pYzBA9xdfqlgrReRsCmPf399DAyNZSKyHOukzO?=
 =?us-ascii?Q?+cGU3mIQAUOCtt4YcmKuqmOgkQDG8SUQLI5kmChGaezPNBbW4z+dj2M15jLr?=
 =?us-ascii?Q?mK2nt+3VHra0TTUWFQnDhq9jKbFKsqgVgYCdMPVhMLmLOwIXkf5xYt0E8uzh?=
 =?us-ascii?Q?6davh7PrXJObs8srE/RL2nSRw7fCAb8d0ml/XDDM2TCe7ZArmcoqKx/FPmcG?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6309d5e-a161-4e9b-b9ee-08da90dccfbe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:25:28.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sgukBwtsW6FLkzyCw50jdm+hmjO6yApNKICEwcjvJGUhohpxmvRuRVXsk/nvPlnM++VJpAsYJKgq4x0qHbILSR/QEviGDNu3OsbUK6U8Uyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4022
X-Proofpoint-ORIG-GUID: o5mSe30W3W4uf8T9pDx6IfoECNvu3YvV
X-Proofpoint-GUID: o5mSe30W3W4uf8T9pDx6IfoECNvu3YvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 14:25:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7609

Upgrade to latest v17 release.

New runtime dependencies on lua, cryptsetup and thrift.
Refreshed patch context.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...mpressor.h-fix-snappy-compiler-error.patch |  30 ----
 ...h-fix-build-errors-for-cross-compile.patch | 134 ++++++++-------
 ...001-cmake-add-support-for-python3.10.patch |  34 ----
 ...001-fix-host-library-paths-were-used.patch |  30 ++--
 .../ceph/ceph/CVE-2021-3979.patch             | 158 ------------------
 .../ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb}  |  14 +-
 6 files changed, 98 insertions(+), 302 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
 delete mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch
 rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb} (91%)

diff --git a/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch b/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
deleted file mode 100644
index 2ebd32d..0000000
--- a/recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 85bde55627cfbb35d8b4735dec32bf33fa30079f Mon Sep 17 00:00:00 2001
-From: Saul Wold <saul.wold@windriver.com>
-Date: Fri, 28 May 2021 10:16:07 -0700
-Subject: [PATCH] SnappyCompressor.h: fix snappy compiler error
-
-snappy quietly changed public type
-
-Known issue in ceph: https://tracker.ceph.com/issues/50934
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <saul.wold@windriver.com>
-
----
- src/compressor/snappy/SnappyCompressor.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/compressor/snappy/SnappyCompressor.h b/src/compressor/snappy/SnappyCompressor.h
-index 0cfb819c..2fbe35b7 100644
---- a/src/compressor/snappy/SnappyCompressor.h
-+++ b/src/compressor/snappy/SnappyCompressor.h
-@@ -96,7 +96,7 @@ class SnappyCompressor : public Compressor {
-     if (qat_enabled)
-       return qat_accel.decompress(p, compressed_len, dst);
- #endif
--    snappy::uint32 res_len = 0;
-+    uint32_t res_len = 0;
-     BufferlistSource source_1(p, compressed_len);
-     if (!snappy::GetUncompressedLength(&source_1, &res_len)) {
-       return -1;
diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
index 4d54549..0c8883d 100644
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
+++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
@@ -1,4 +1,4 @@
-From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
+From 12b98e9c7e6cb82636a07c3e3e0c1cd5e9db6b37 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Mar 2019 09:14:09 +0800
 Subject: [PATCH] ceph: fix build errors for cross compile
@@ -15,20 +15,33 @@ Adjust context for v14.2.3
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
- cmake/modules/Distutils.cmake      | 25 +++++--------------------
- cmake/modules/FindRocksDB.cmake    |  4 ++--
- src/compressor/zstd/CMakeLists.txt |  2 +-
- src/pybind/cephfs/setup.py         |  8 --------
- src/pybind/rados/setup.py          |  8 --------
- src/pybind/rbd/setup.py            |  8 --------
- src/pybind/rgw/setup.py            |  8 --------
- 7 files changed, 8 insertions(+), 55 deletions(-)
+ cmake/modules/BuildZstd.cmake   |  2 +-
+ cmake/modules/Distutils.cmake   | 25 +++++--------------------
+ cmake/modules/FindRocksDB.cmake |  4 ++--
+ src/pybind/cephfs/setup.py      | 14 --------------
+ src/pybind/rados/setup.py       | 10 ----------
+ src/pybind/rbd/setup.py         | 14 --------------
+ src/pybind/rgw/setup.py         | 14 --------------
+ 7 files changed, 8 insertions(+), 75 deletions(-)
 
+diff --git a/cmake/modules/BuildZstd.cmake b/cmake/modules/BuildZstd.cmake
+index 799b14b281d..79a113160fb 100644
+--- a/cmake/modules/BuildZstd.cmake
++++ b/cmake/modules/BuildZstd.cmake
+@@ -8,7 +8,7 @@ function(build_Zstd)
+     CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+                -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
+                -DCMAKE_C_FLAGS=${ZSTD_C_FLAGS}
+-               -DCMAKE_AR=${CMAKE_AR}
++               -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
+                -DCMAKE_POSITION_INDEPENDENT_CODE=${ENABLE_SHARED}
+     BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
+     BUILD_COMMAND ${CMAKE_COMMAND} --build <BINARY_DIR> --target libzstd_static
 diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
-index 5fe929499d..802eb37e32 100644
+index 1916363382f..b48985d6d4b 100644
 --- a/cmake/modules/Distutils.cmake
 +++ b/cmake/modules/Distutils.cmake
-@@ -18,17 +18,8 @@ function(distutils_install_module name)
+@@ -29,17 +29,8 @@ function(distutils_install_module name)
    cmake_parse_arguments(DU "" "INSTALL_SCRIPT" "" ${ARGN})
    install(CODE "
      set(options --prefix=${CMAKE_INSTALL_PREFIX})
@@ -39,25 +52,25 @@ index 5fe929499d..802eb37e32 100644
 -      list(APPEND options
 -        --root=\$ENV{DESTDIR}
 -        --single-version-externally-managed)
--      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
--        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
--      endif()
+-    endif()
+-    if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
+-      list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
 -    endif()
 +    list(APPEND options --root=${CMAKE_DESTDIR})
 +    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
      execute_process(
      COMMAND ${Python3_EXECUTABLE}
          setup.py install \${options}
-@@ -50,7 +41,7 @@ function(distutils_add_cython_module target name src)
-   # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gcc"
-   # CMake's implicit conversion between strings and lists is wonderful, isn't it?
-   string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
--  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
-+  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
+@@ -65,7 +56,7 @@ function(distutils_add_cython_module target name src)
+   if(DU_DISABLE_VTA AND HAS_VTA)
+     list(APPEND PY_CFLAGS -fno-var-tracking-assignments)
+   endif()
+-  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w)
++  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
    # This little bit of magic wipes out __Pyx_check_single_interpreter()
    # Note: this is reproduced in distutils_install_cython_module
-   list(APPEND cflags -D'void0=dead_function\(void\)')
-@@ -108,14 +99,8 @@ function(distutils_install_cython_module name)
+   list(APPEND PY_CPPFLAGS -D'void0=dead_function\(void\)')
+@@ -136,14 +127,8 @@ function(distutils_install_cython_module name)
      set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
  
      set(options --prefix=${CMAKE_INSTALL_PREFIX})
@@ -75,7 +88,7 @@ index 5fe929499d..802eb37e32 100644
         COMMAND
             ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
 diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
-index c5dd3dfaf6..be38597af2 100644
+index c5dd3dfaf67..be38597af27 100644
 --- a/cmake/modules/FindRocksDB.cmake
 +++ b/cmake/modules/FindRocksDB.cmake
 @@ -9,9 +9,9 @@
@@ -90,32 +103,25 @@ index c5dd3dfaf6..be38597af2 100644
  
  if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
    foreach(ver "MAJOR" "MINOR" "PATCH")
-diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
-index a5ebdaf538..a234068150 100644
---- a/src/compressor/zstd/CMakeLists.txt
-+++ b/src/compressor/zstd/CMakeLists.txt
-@@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
-   CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
-              -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
-              -DCMAKE_C_FLAGS=${ZSTD_C_FLAGS}
--             -DCMAKE_AR=${CMAKE_AR}
-+             -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
-              -DCMAKE_POSITION_INDEPENDENT_CODE=${ENABLE_SHARED}
-              -G${CMAKE_GENERATOR}
-   BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index 19ae6c329a..c9a25ccfff 100755
+index f6c2025f75d..923a7e324b6 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
-@@ -135,14 +135,6 @@ def check_sanity():
+@@ -135,20 +135,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args = {}
+-    cython_constants = dict(BUILD_DOC=True)
+-    cythonize_args = dict(compile_time_env=cython_constants)
 -elif check_sanity():
--    pass
+-    ext_args = get_python_flags(['cephfs'])
+-    cython_constants = dict(BUILD_DOC=False)
+-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
+-    cythonize_args = dict(compile_time_env=cython_constants,
+-                          include_path=include_path)
 -else:
 -    sys.exit(1)
 -
@@ -123,18 +129,20 @@ index 19ae6c329a..c9a25ccfff 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index e2c5696404..4e99d26721 100755
+index 62b54d26b6c..5eb0dce6f94 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -134,14 +134,6 @@ def check_sanity():
+@@ -130,16 +130,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args = {}
+-    cython_constants = dict(BUILD_DOC=True)
 -elif check_sanity():
--    pass
+-    ext_args = get_python_flags(['rados'])
+-    cython_constants = dict(BUILD_DOC=False)
 -else:
 -    sys.exit(1)
 -
@@ -142,18 +150,24 @@ index e2c5696404..4e99d26721 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index 634484f140..f5bbbdab4f 100755
+index 1f20c3ed42f..6437a62815c 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
-@@ -133,14 +133,6 @@ def check_sanity():
+@@ -133,20 +133,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args = {}
+-    cython_constants = dict(BUILD_DOC=True)
+-    cythonize_args = dict(compile_time_env=cython_constants)
 -elif check_sanity():
--    pass
+-    ext_args = get_python_flags(['rados', 'rbd'])
+-    cython_constants = dict(BUILD_DOC=False)
+-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
+-    cythonize_args = dict(compile_time_env=cython_constants,
+-                          include_path=include_path)
 -else:
 -    sys.exit(1)
 -
@@ -161,18 +175,24 @@ index 634484f140..f5bbbdab4f 100755
  try:
      from Cython.Build import cythonize
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index eb1591a460..b9f2428cf9 100755
+index ed45399d394..c8094e000fb 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
-@@ -134,14 +134,6 @@ def check_sanity():
+@@ -134,20 +134,6 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
  
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args = {}
+-    cython_constants = dict(BUILD_DOC=True)
+-    cythonize_args = dict(compile_time_env=cython_constants)
 -elif check_sanity():
--    pass
+-    ext_args = get_python_flags(['rados', 'rgw'])
+-    cython_constants = dict(BUILD_DOC=False)
+-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
+-    cythonize_args = dict(compile_time_env=cython_constants,
+-                          include_path=include_path)
 -else:
 -    sys.exit(1)
 -
@@ -180,5 +200,5 @@ index eb1591a460..b9f2428cf9 100755
  try:
      from Cython.Build import cythonize
 -- 
-2.20.1
+2.25.1
 
diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
deleted file mode 100644
index 94c4b8a..0000000
--- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
-From: Yanfei Xu <yanfei.xu@windriver.com>
-Date: Tue, 10 Nov 2020 17:17:30 +0800
-Subject: [PATCH] cmake: add support for python 3.9 and 3.10
-
-add support for python3.9.
-
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
-
-Add support for python 3.10.
-
-Upstream-Status: Submitted [https://github.com/ceph/ceph/pull/43630]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- cmake/modules/FindPython/Support.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
-index 6584699b79..c05bbe3306 100644
---- a/cmake/modules/FindPython/Support.cmake
-+++ b/cmake/modules/FindPython/Support.cmake
-@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
-   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
- endif()
- if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
--  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
-+  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
- elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
-   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
- else()
--- 
-2.18.2
-
diff --git a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
index 310bfa4..47498a2 100644
--- a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
+++ b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
@@ -1,4 +1,4 @@
-From bbf1cba8feb0e43492a1f6a6b31d024117cad262 Mon Sep 17 00:00:00 2001
+From 35cf12fea8274e85f29723e56f424a17af569907 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 13 Apr 2020 23:35:41 -0700
 Subject: [PATCH] fix host library paths were used
@@ -16,11 +16,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 20 insertions(+), 4 deletions(-)
 
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index c9a25ccf..972f936c 100755
+index 923a7e324b6..a894fb20766 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
 @@ -63,9 +63,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler = new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl = distutils.sysconfig.get_config_var('LIBPL')
@@ -31,15 +31,15 @@ index c9a25ccf..972f936c 100755
          include_dirs=[distutils.sysconfig.get_python_inc()],
 -        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
 +        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
-         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         libraries=libs + py_libs,
          extra_compile_args=filter_unsupported_flags(
              compiler.compiler[0],
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index 4e99d267..de24f766 100755
+index 5eb0dce6f94..877200b1629 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -66,9 +66,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+@@ -62,9 +62,13 @@ def get_python_flags(libs):
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler = new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl = distutils.sysconfig.get_config_var('LIBPL')
@@ -50,15 +50,15 @@ index 4e99d267..de24f766 100755
          include_dirs=[distutils.sysconfig.get_python_inc()],
 -        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
 +        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
-         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         libraries=libs + py_libs,
          extra_compile_args=filter_unsupported_flags(
              compiler.compiler[0],
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index f5bbbdab..a1f70e1d 100755
+index 6437a62815c..d17d85e2b51 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
 @@ -63,9 +63,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler = new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl = distutils.sysconfig.get_config_var('LIBPL')
@@ -69,15 +69,15 @@ index f5bbbdab..a1f70e1d 100755
          include_dirs=[distutils.sysconfig.get_python_inc()],
 -        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
 +        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
-         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         libraries=libs + py_libs,
          extra_compile_args=filter_unsupported_flags(
              compiler.compiler[0],
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index b9f2428c..f5119f73 100755
+index c8094e000fb..22eb6f2b1bc 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
 @@ -64,9 +64,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler = new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl = distutils.sysconfig.get_config_var('LIBPL')
@@ -88,9 +88,9 @@ index b9f2428c..f5119f73 100755
          include_dirs=[distutils.sysconfig.get_python_inc()],
 -        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
 +        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
-         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
+         libraries=libs + py_libs,
          extra_compile_args=filter_unsupported_flags(
              compiler.compiler[0],
 -- 
-2.21.0
+2.25.1
 
diff --git a/recipes-extended/ceph/ceph/CVE-2021-3979.patch b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
deleted file mode 100644
index 081b32b..0000000
--- a/recipes-extended/ceph/ceph/CVE-2021-3979.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 47c33179f9a15ae95cc1579a421be89378602656 Mon Sep 17 00:00:00 2001
-From: Guillaume Abrioux <gabrioux@redhat.com>
-Date: Tue, 25 Jan 2022 10:25:53 +0100
-Subject: [PATCH] ceph-volume: honour osd_dmcrypt_key_size option
-
-ceph-volume doesn't honour osd_dmcrypt_key_size.
-It means the default size is always applied.
-
-It also changes the default value in `get_key_size_from_conf()`
-
-From cryptsetup manpage:
-
-> For XTS mode you can optionally set a key size of 512 bits with the -s option.
-
-Using more than 512bits will end up with the following error message:
-
-```
-Key size in XTS mode must be 256 or 512 bits.
-```
-
-Fixes: https://tracker.ceph.com/issues/54006
-
-Signed-off-by: Guillaume Abrioux <gabrioux@redhat.com>
-
-Upstream-Status: Backport
- github.com/ceph/ceph.git
- equivalent to cherry-pick of commit 47c33179f9a15ae95cc1579a421be89378602656
-
-CVE: CVE-2021-3979
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- .../ceph_volume/tests/util/test_encryption.py | 41 +++++++++++++------
- .../ceph_volume/util/encryption.py            | 34 ++++++++++-----
- 2 files changed, 51 insertions(+), 24 deletions(-)
-
-diff --git a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
-index e1420b440d3..c86dc50b7c7 100644
---- a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
-+++ b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
-@@ -1,5 +1,31 @@
- from ceph_volume.util import encryption
-+import base64
- 
-+class TestGetKeySize(object):
-+    def test_get_size_from_conf_default(self, conf_ceph_stub):
-+        conf_ceph_stub('''
-+        [global]
-+        fsid=asdf
-+        ''')
-+        assert encryption.get_key_size_from_conf() == '512'
-+
-+    def test_get_size_from_conf_custom(self, conf_ceph_stub):
-+        conf_ceph_stub('''
-+        [global]
-+        fsid=asdf
-+        [osd]
-+        osd_dmcrypt_key_size=256
-+        ''')
-+        assert encryption.get_key_size_from_conf() == '256'
-+
-+    def test_get_size_from_conf_custom_invalid(self, conf_ceph_stub):
-+        conf_ceph_stub('''
-+        [global]
-+        fsid=asdf
-+        [osd]
-+        osd_dmcrypt_key_size=1024
-+        ''')
-+        assert encryption.get_key_size_from_conf() == '512'
- 
- class TestStatus(object):
- 
-@@ -37,17 +63,6 @@ class TestDmcryptClose(object):
- 
- class TestDmcryptKey(object):
- 
--    def test_dmcrypt_with_default_size(self, conf_ceph_stub):
--        conf_ceph_stub('[global]\nfsid=asdf-lkjh')
--        result = encryption.create_dmcrypt_key()
--        assert len(result) == 172
--
--    def test_dmcrypt_with_custom_size(self, conf_ceph_stub):
--        conf_ceph_stub('''
--        [global]
--        fsid=asdf
--        [osd]
--        osd_dmcrypt_size=8
--        ''')
-+    def test_dmcrypt(self):
-         result = encryption.create_dmcrypt_key()
--        assert len(result) == 172
-+        assert len(base64.b64decode(result)) == 128
-diff --git a/src/ceph-volume/ceph_volume/util/encryption.py b/src/ceph-volume/ceph_volume/util/encryption.py
-index 72a0ccf121e..2a2c03337b6 100644
---- a/src/ceph-volume/ceph_volume/util/encryption.py
-+++ b/src/ceph-volume/ceph_volume/util/encryption.py
-@@ -9,21 +9,29 @@ from .disk import lsblk, device_family, get_part_entry_type
- 
- logger = logging.getLogger(__name__)
- 
--
--def create_dmcrypt_key():
-+def get_key_size_from_conf():
-     """
--    Create the secret dm-crypt key used to decrypt a device.
-+    Return the osd dmcrypt key size from config file.
-+    Default is 512.
-     """
--    # get the customizable dmcrypt key size (in bits) from ceph.conf fallback
--    # to the default of 1024
--    dmcrypt_key_size = conf.ceph.get_safe(
-+    default_key_size = '512'
-+    key_size = conf.ceph.get_safe(
-         'osd',
-         'osd_dmcrypt_key_size',
--        default=1024,
--    )
--    # The size of the key is defined in bits, so we must transform that
--    # value to bytes (dividing by 8) because we read in bytes, not bits
--    random_string = os.urandom(int(dmcrypt_key_size / 8))
-+        default='512')
-+
-+    if key_size not in ['256', '512']:
-+        logger.warning(("Invalid value set for osd_dmcrypt_key_size ({}). "
-+                        "Falling back to {}bits".format(key_size, default_key_size)))
-+        return default_key_size
-+
-+    return key_size
-+
-+def create_dmcrypt_key():
-+    """
-+    Create the secret dm-crypt key (KEK) used to encrypt/decrypt the Volume Key.
-+    """
-+    random_string = os.urandom(128)
-     key = base64.b64encode(random_string).decode('utf-8')
-     return key
- 
-@@ -38,6 +46,8 @@ def luks_format(key, device):
-     command = [
-         'cryptsetup',
-         '--batch-mode', # do not prompt
-+        '--key-size',
-+        get_key_size_from_conf(),
-         '--key-file', # misnomer, should be key
-         '-',          # because we indicate stdin for the key here
-         'luksFormat',
-@@ -83,6 +93,8 @@ def luks_open(key, device, mapping):
-     """
-     command = [
-         'cryptsetup',
-+        '--key-size',
-+        get_key_size_from_conf(),
-         '--key-file',
-         '-',
-         '--allow-discards',  # allow discards (aka TRIM) requests for device
--- 
-2.35.1
-
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_17.2.3.bb
similarity index 91%
rename from recipes-extended/ceph/ceph_15.2.15.bb
rename to recipes-extended/ceph/ceph_17.2.3.bb
index f2ece8c..6b27a00 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_17.2.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "User space components of the Ceph file system"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
                     file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
+                    file://COPYING;md5=5351120989d78252e65dc1a2a92e3617 \
 "
 inherit cmake pkgconfig python3native python3-dir systemd
 # Disable python pybind support for ceph temporary, when corss compiling pybind,
@@ -12,20 +12,17 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-cmake-add-support-for-python3.10.patch \
-           file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
            file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
            file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
-           file://CVE-2021-3979.patch \
 "
 
-SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
+SRC_URI[sha256sum] = "3dd0c7b3cb740abd38eeb0a44078ca5ae6ad96050a7290ac82883e106592a3fa"
 
-DEPENDS = "boost bzip2 curl expat gperf-native \
-           keyutils libaio libibverbs lz4 \
+DEPENDS = "boost bzip2 cryptsetup curl expat gperf-native \
+           keyutils libaio libibverbs lua lz4 \
            nspr nss \
            oath openldap openssl \
-           python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
+           python3 python3-cython-native rabbitmq-c rocksdb snappy thrift udev \
            valgrind xfsprogs zlib \
 "
 SYSTEMD_SERVICE:${PN} = " \
@@ -67,6 +64,7 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
                  -DPython3_EXECUTABLE=${PYTHON} \
                  -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF \
                  -DWITH_REENTRANT_STRSIGNAL=ON \
+                 -DWITH_RADOSGW_LUA_PACKAGES=OFF \
 "
 
 CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-- 
2.33.0


