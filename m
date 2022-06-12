Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817ACCCA47C
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13687.1655020845837718938
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YTPiKmQU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTr006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=MzEK8J8ZvOlZcywhI8YX7qGn/KY1nqyeVuMLtF8xjOs=;
 b=YTPiKmQUCj+KdgLwKJrtDyOnqeACZA47WuOY7O2nDu+5W5L0g5rDzaV/n9iA9woV6cHY
 DcpkS/tFwgBpz8wTr0QmTq4nArkAhCywb7jfAZsKDXUrv84rYNsPnhJ5wns5ikfOKp/w
 SNbGrk8jPhjGq7vX5e1OTJELuapRLp7h3bQrq0jbld4LWkrqJa+mbNV9oRwPsnGPlSw5
 NQDqIglOuuRVVdUjeAype1yk0IqEztbLMDTHRnzO9Oaq1MwTiCvTeZ5Fco3Y9m0grdLU
 ZRvDYlG3LXqY+edIJmFpCmoMc1UUKVYvKoBmJPdphhX4Jaldoz4L1ZJrwUr4hMxAVqZV 3g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVZmJ54vzz6ojezni9jAZZJs8BzpBA63Yng/H+svkBZs/qKhDjT/jsAvVav02wPD/i5bq9Tehlmn1BEg+MtfWLujiUTrnayHGBRz0F0UmXi+oi7cH5RfrEHb2qUlnJLvuNnVOChPv4E25w8BMFcCkK7hrMTzNub3530IePQOrbpagZUVTcmDJzP078KCRPkVeNMoMbAt801EINHRjMQfMJO+pOkkwf1q3QP3IpD+RwIP/R7ry+Eh+ODGfGtns/x+FLvg7aqWEYrah7LEE1Xudnc6sdxUV5tvoWk99e6vISTleyIXYaMXQw81XiaUbb36d84Uf6mdp/MCR5zBLyR3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzEK8J8ZvOlZcywhI8YX7qGn/KY1nqyeVuMLtF8xjOs=;
 b=Oh3PFKZcNGeSK5jReop7UAQ3QC49Z73F7V3zqmBAl8fE/aCRiA+9TkGyOVfDNIY3g6RwdnYwUlzIwmqxwFs+YgObBy1Mp5IMwVptLLnS8yBYWVHU0M2NR13ul7j1oEco+enbQSZ0LGar+Ap8AnySq7IvUrpPS1iHPBdid8eO3cTJ25JNJRra7/CzmBi8x5eoc22JWFlp7orQd2ToSUVN/Kmbpb3XZwDJJ2eMUHARupmYEp107jgRnTDm6BLQWuXpaqNVbTg1R1T5ueIsxUY5HZQqKjs/eidtXNFWFNgpM1Us5ICjBfd/XAo+lfXLNA3Uz22CGAfyEgFXIjm15ER06Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 9/9] netns: adjust GOROOT,
 CGO_CFLAGS and CGO_LDFALGS
Date: Sun, 12 Jun 2022 01:00:09 -0700
Message-Id: <20220612080009.130993-9-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79227141-3236-4294-467d-08da4c49a560
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB33964F2D2F9B0B0C1B60C858EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nDt2d9UiX8uhELbJ3OncmZW1XFP0SHnQHGoB15aJ8vEOQ5D9UAOglKjgOKRoyIREqixGqXvmLZbgFsyuZa6dg0KydQeQuqj7bvXcCNxnQe8H1/5AMF31QdVhcpIfuv82VQbRUoXcM4m+3+cevxfobTJklnIrXktQttWweNZiOml8GbqjrM0Wgf+4YmIB+yfcT66UjcTg9Wo7Y8r/9TtvBy8ApwoBi3f0W93c40mG4UjWOwUTJ0yWIW9yJcTWb35z+MhVovg1dYJz8XtCskhupllIPpt0ZXhmGmGuVhCtSpjffxV6UJGVAODpVi4gO68maxT6luDoe+qQXg+LxAZmQBVqAnC3wpPSrno8+PIdA2qV7MPFF3iYTDUfxSHSj7yaBBC+UeyoMnSv0FP6PRtwoPc9GNrwqgL0V/MPKbUVNeftSAIosJzbKc35GGm8rSK6d97My/AD0E+GbS1JVZ0q8h9a4k5K3x8LLw7P0kf3T8bU6AqNOct1HYNCYmHGmHvTBguKfJ67cuR6WPZk0vp9QVtaca1NbFvggjvvRgsji2dR8O/PCTw5+IZR9eEmiBcOtddKgnoi3kdrEynnvIjqUlBIJkZoazH/NmStmPAhEREcjHRrQA4ntk1GWJ9daSiJGMoHev40vMi+n58CiCPgsNZqFMrVFmj9qaI50Y+KVKUlZ6sZiSqcEtpvevwEl/fagiNEzMM4s4yzzL6Wx69qiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JNc89kZFTU2yPxsRXSEclKB0g6RnCFpz98koqvcmQEr/9Kc0ngtzmOr4Fs36?=
 =?us-ascii?Q?Ibx7q2PZg7UdOz4HE6e1ILXxr7C0u7RO7eVqF10KHE7zrRFAebfcO7X5111R?=
 =?us-ascii?Q?bCTs+D6a3FwMZyAFm4rJZ1qv01OEiQzWWmPFMgApl8h3V0/eWz+HwFqCHw9+?=
 =?us-ascii?Q?PFTsCBjr3LvG6Z8UnUddEj6LuYEJM2qbj6NgTL97q3QFJR4vwDrkAOijHSo/?=
 =?us-ascii?Q?YrBpn1MrfvhrWGDalUAZqVVwwSxr0nZli4PNqRs9TQoDxcGPMvNCqCWeGflr?=
 =?us-ascii?Q?8/H0JKol/VMtX8tms3FE7N7Tg9wrAtLSC0B0Dij/OAaX40RJi3+jFswgUtjB?=
 =?us-ascii?Q?LyfnC77855sPcUVZ+qtQg2qxfgeWErEAbJlT5eqekPsgajoh8jqqvYlekSPf?=
 =?us-ascii?Q?4F07e1iwlw4OxAsMkpdXZcUV4MCqiSZQr7oH22Xz0pTy2I372pcUnQih4Jp+?=
 =?us-ascii?Q?jC2aMH91k5NUNCrybw6GhgMnYRkOrrf/7eJGzCDnIERr05uCAIytJwNuMbnA?=
 =?us-ascii?Q?CRoUpTgcHwr0+4Ku4wT2SIhYyFlaD5oXotxPpFW/N1ufQgQtb+Zw0sMmR5di?=
 =?us-ascii?Q?Ses21g9VLasbhtPCCs8UCutT0Ml+f+3W9F1fuXgnp0kHF9bxd0tbvsybKUg0?=
 =?us-ascii?Q?0YKX5tX2gYch/veshO5PBpiFqFvj9tRqo1PMQ+enc9qGrlvcUBava5LWBIYx?=
 =?us-ascii?Q?q3VqaaepF0KkgoGfbqKPmXTvTcS2KXh+NWgFOkcCzdkMHP4XKb7cxTtp+b3v?=
 =?us-ascii?Q?5lxDDdOT15sRTtwNSxcN9e6H9datXwFdpVUJ/LS+DvbXM00cUU0wihvlWEjl?=
 =?us-ascii?Q?rAgbxhNt8s3XN20vP8WMGMd+B34DpqgKdEZMWiJSVUyfHS7vAmuXCkGvh7b9?=
 =?us-ascii?Q?sBWeBIpQbpz+zgDBE3yFARNKa2/KJ/qQw/PnQWqd9eFsmvk+3RivvDpP0dwg?=
 =?us-ascii?Q?oliUYvYBhQ0s7vwtbXOyxYsExl13mNz41ZtFl50r4BSGsdtnljDjRseQGnF/?=
 =?us-ascii?Q?1g1vv4CReN63ZIQ9Oghtc8jcOdzLuZc3xJwQponGEZ/EejT5i5KlUmh6l5FT?=
 =?us-ascii?Q?N8FxLD17riiXN9KUtcqraHUCePvaOKUmKe6lmuhR/eslSXHUnfhoKoXDvlnL?=
 =?us-ascii?Q?zhe/R2PsSKSh5oU5IA1TT3po6rYq+mXOzxjquEbfRQzdNBZYFHhJuA990a5/?=
 =?us-ascii?Q?UQHJxRVMuzV4yZ5K83y95pkufgfdwCRAmg8XceBZ2Qx0dllvBHxqggfxKjuG?=
 =?us-ascii?Q?3jSPh8RYa/9koz8l6nv6n/yNiZn+ez4LQTNae+9MZcmPs3uC6OucPD/3tG7q?=
 =?us-ascii?Q?gOrRG1ZHtbeVb0WCzg7cnVJAUa7szmXN9P9R4DNWXW/kQBf3seF2EE3y7QoJ?=
 =?us-ascii?Q?g3t/K8qs/d/U9gOXzTmqSNWs50d96P9xFKWGCcb3ky4Yyr+L1dmPG6NvCoFW?=
 =?us-ascii?Q?4Rphx6Tcjlm+mIwoSISMSIHPhZFNdkG5xmzuZFSHu3Qvz+6emq2JTaRRy0jn?=
 =?us-ascii?Q?ztfLarAF64jnC/yQWN/TVyx3PqCJobWmZq3PqitCBwSjUVrW15Yi7fPyzCZv?=
 =?us-ascii?Q?tJzbHOtcjoeBP9cSpMvkPFgUAXKX+rClByRp6ggQ6A+O5LVgQBITBwkLR7Ci?=
 =?us-ascii?Q?Vr+b83aZTWDkL15O0OZQ4BJUyql4PBwPIzOpjB6wsObHaJuq7lhsmeK4xNwp?=
 =?us-ascii?Q?FtjPOceW4tL1ePY505sgESFJ3680Rz5TLVdH9FnP0ywApgz2jqSFhw7sftyZ?=
 =?us-ascii?Q?Sc6Tn/0tgcyzikjkYk9PjQftiiLIXcs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79227141-3236-4294-467d-08da4c49a560
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:42.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2ik7MKH9SFzK1CR76pk5TNkZGmVL6dpFa+sSIe4EQQoo0OQjhIqfbCvREMp2TyxkapmaGc/+4nqX0Y+XplMXiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: 79sA8zznBGu3fGJ6E9mzRR4FqjQSDPQV
X-Proofpoint-ORIG-GUID: 79sA8zznBGu3fGJ6E9mzRR4FqjQSDPQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=610 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7378

Adjust the GOROOT setting as directory specified by the original
one does not exist.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags instead
of the nativesdk ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/netns/netns_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index cd17e1a..a4dcb42 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -19,7 +19,7 @@ EXTRA_OEMAKE = "GO='${GO}'"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+	export GOROOT="${STAGING_LIBDIR}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but netns
@@ -37,8 +37,8 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GOFLAGS="-mod=vendor"
 
 	cd ${S}/src/import
-- 
2.36.0


