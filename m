Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A159AC677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2033.1749626641239186447
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 00:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8257a4bb2a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B7HLCD023230
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 00:24:00 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm3u76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 00:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJvtv+n5eH+sHwp68BRcqzIkVLMHAcrtcFDpqowH/zFWlDaiH4fChhTbiNJmaDOKYMPGRq3d+9jT0aH5eGaXkz3zgDvZb/DUzrbIa786ZnV9qnxljMd5F8YktkLW0CZR3BqbuNu0KvNIX7EcrP5qgU6t/OUNFr7p913vguqRnhdFQks1rNIHjT+E2J6b7JJfcxoWQQg6LEqYNH9w0yoK0U/dx6FgR7XLVl+PxYlxALznZYKN09vknL4AwF0kv0+jZ0Z/3kFVgFaXEGlgsQgms5OKyAjP6hhS/oBJGIMWVl82s1W4n3WxuNHMsgRpRvxSTTrlg+bIazoXQX+4V4oftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IT46ahVCh2BYjY893r5HHnj/8cf47lthPXorrxgldM=;
 b=qS86XMrblPPQG6EfQbuWMRBXKR3L3Xg1uZtdZ0Y9pon3NGDk0zP5f0/SQeJY+ORj513WRV3N1bBKdUzRSKnNl6jqrY24JidJ6SvpwsxtUyQBpBZf6SmH9G5+h1AVhe4uKexFhpiDuNPCyNryLFEWNeQo1rryJlko83A2g38Jg+Sn/wafYyP+MuPUKs+RmUtWiNb8O7AuMstcBDgWwDTzc32wxhdZ9l7Xu/rhRukIvxxW66ztKXyGn6gQUv5fq00lfxhSVaMuF2MMkObkRVfejSvR4fUwiE9XQZjIVbKp6p/rTYgUIQq+9ZWCNo3BkUH8b30nPR6/8xLpqyPmisXQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Wed, 11 Jun
 2025 07:23:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 07:23:57 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] podman: remove ptest
Date: Wed, 11 Jun 2025 15:23:42 +0800
Message-Id: <20250611072342.1850153-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 26076402-132b-40c5-375d-08dda8b8ed98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yDfmE75qiNNNKYRMpO6YvYhnPHvnk5nTQRBXBO1ZxG9umRnUQEZ3NHbk/nSa?=
 =?us-ascii?Q?yt0JH4M6+X6WjetpC/v1TCln7xwAOkz5ah1VzI87i+3xx+20Zs9wR4HNU4id?=
 =?us-ascii?Q?JWhdq5qugyJHnLTiGONjLGNB4CKXSYYsDHhd5JlWUBE+br7xOrzE+WBXKKw3?=
 =?us-ascii?Q?71ZZfvDpNjVeHUWMNr/t5JsqpEYgvqug+IXB36avdTp5ha4tkgTcXZw6ZE4D?=
 =?us-ascii?Q?DYx22fOHHz9ipDuezDNCKQR6QbFma82NfILdm3Boes8i1wwfmMjHs3OamF02?=
 =?us-ascii?Q?qPr79+UefArFzWVO2r+hYKXyT71hoGFnnk9rl1c/pKD3CpcYvrxxvZfQvKFq?=
 =?us-ascii?Q?CyeP51Zj/Bl7PeJu3I/W4pHis2vsKm1NoC84KsyYbyfMNrC91qXK3P6IGWZG?=
 =?us-ascii?Q?MKZBanf3vCrJ2Tnhx62cG+CWKaMvuHNIqO+HwyACSfBzkMEExrUPSFmMF0jL?=
 =?us-ascii?Q?+A+zeWwadWGXxl+Qq5hO1TQmIa8urmi6OzDdVQ6G0M5cB5JvFZzW6jYXfuhb?=
 =?us-ascii?Q?4udfQz+8vT15hGUZ+mA0OWU35dCTFq6WxmkvKZ2QBuCNoC7JluFvtVmXDTgo?=
 =?us-ascii?Q?xfYxMxDzEIQLY+MQIrZyacaBFHnlWcFLRInknocwbqBS4zHGdhJuoZIqfdSq?=
 =?us-ascii?Q?UTgPwM/ozamYnxXuiEPLK7bEK+MA/MB3PKaCqwxOqgUzZYZk/QPciy+D2zX7?=
 =?us-ascii?Q?ARjrCB75BSi+v9TKT8CRI5VCr+7VoyYWyFvXF6oaYwNrqbl5W4pfwTVOaugM?=
 =?us-ascii?Q?E/K4UKb18ZiUSjA4uqQSK22DJ4WuTaFjfIRv7oXsS6YjYqvaCcIBQPY+IGx+?=
 =?us-ascii?Q?/NgdYJLb+SWKJa2gqz+b6vEOjVG4xyLa/1ihW5gHOqyzB/sBhSoUTaQuJOdR?=
 =?us-ascii?Q?AJahaopi1h+17SuI/nVur+oyIuSDEY47jNzbtUek/KuiAslvkTWAccgUGlz8?=
 =?us-ascii?Q?/JboWs54KglXlJ4d6K3QiwhJpEci0OQUHYlCMy9saLEWgNDpE30lEMTfsUsk?=
 =?us-ascii?Q?FUJcCcfZm4Rh9Wgr1F1cM94VEaMe8Iu89Z12T8WSKBMLmJ1O+YvFi36ZN69y?=
 =?us-ascii?Q?b+t5tlIQ5WCLUVn8N0KIiNy/ETY/GBrZ5rFhshNqYeusPAuzQ5g+Ke63/eyp?=
 =?us-ascii?Q?ebVKDLgxwguVioGtkMMpvGNo4qPHM9kfmk6R07tYD537Lj2mc+h0vfV3S871?=
 =?us-ascii?Q?ZOJQifw3Lc8aCyvO7l4X5uzHJ/5gRxspLspkAXEjkZFi5mENTnXuFA0ETWiY?=
 =?us-ascii?Q?v3636fnhrlPunfGXJMPhifYSU0BTykKvZ5grDWZioXUCKKhX3aoV+cboYqKg?=
 =?us-ascii?Q?0D1/fCtCMI2SJ3OM/ZHpGQKAwJ3+bts3cNxjSNaY6y3e6/+C9T++vt+HFCQY?=
 =?us-ascii?Q?uOQ2KNie96viMwWnM7UZW8GvQxRqn9ktvqWtoOfnbIYM6iydzqRvXtJdS585?=
 =?us-ascii?Q?cb9GGi7usAfdD4QPDIcSeeJ+LN0lG/cKzBYQgTexjdR9GYEu6i22vg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qjCbpzLtQiTF9wqVVDDrjcUz9ikpW3IA9SCZ+3bhaGklU1iVDawxkHl2ITGI?=
 =?us-ascii?Q?tv6a4UuGS51QeKbLWmf6ctjQfanQ7+/JPdxgmrEeJHHBClkRS4inEMh21nzS?=
 =?us-ascii?Q?KlcMUi4HfYRnbqQ6t1t756Yx6S7DUuIgKdDh6JQ8P39Ouvg3ybw1BKqDywG8?=
 =?us-ascii?Q?2W2geUH2LpDUC1dy+gdMKQAyBS5ndXi0MCbOkmjoeHdEJU1DbSpVUvP4HDW5?=
 =?us-ascii?Q?vxorapnRPPRhajnCyaF2hGviAE7RzNnUSuSYePDnq4wsPjPxvVT672G2FlCf?=
 =?us-ascii?Q?JtwW1R1H4ggATO3ItrKR74i5qnpTF3u0y/i91Xp9cJwJ5doulQIMf3wuCj7P?=
 =?us-ascii?Q?jLf72TcuHQWKwOa+1lfBdkoOyD+FWQlk5AOdvypzZQxoBFliX56yBBJn5x83?=
 =?us-ascii?Q?ebtw8ZSjwz87q1aS6WjbOc4vEiwcS8VNZreqzG2Z5Qjezt1WmsXKo8Rjsmuv?=
 =?us-ascii?Q?2NMBrPmCPqqAXHdi+47MHVnPvHwtYwO+18GSZNGrv/ac26wgTrD8CIvg+N9x?=
 =?us-ascii?Q?BocJPNlWj06iumo8wIf/ou4EmwjQeTUlqmtj+3+2WkqXOfZrL3+TSFb5fm5a?=
 =?us-ascii?Q?Wp0S5VnLxF7IDMHiKxNdlHgw5rzt/fvGaPMnxZW77bqHUcfEU894YE8mI/ga?=
 =?us-ascii?Q?ruJY7Ticr/sNxlRsYT01FsZZFToJ4BVU7VRtAzFo9guijEIocHDiDEQFc4ni?=
 =?us-ascii?Q?VBTpYOMu73QZNemS9oD2vZpdHn1Hw3lE8vjPVGaCIqHZjlNUMs5NesLZB44I?=
 =?us-ascii?Q?yHyuRkKCXcjbZACzuZrEATrCXu3+zI76MlrJK8ehYaJvfeMOZoGaj5iIGvIC?=
 =?us-ascii?Q?e53rjRx9mI9NqwfzB8ljBPZZZHlUqJW1xR+wSmKGq3UtrbZveVP4ICdP2iex?=
 =?us-ascii?Q?Hv9HKQ+J08U6Y/tQQSGCnuhfsDhiKuHJXKxQYXjJn4HldaeUyWD5IS3G+rxP?=
 =?us-ascii?Q?t6SkqQIxihgbhM5oduqftPcaxVulCYl+zCIwkHjESRrUhij8qNxknCOzyvWn?=
 =?us-ascii?Q?ZqM4IcMEonJguR72ZhteIa4M9RO2TxybkPDkTcX7yZfY4zkgPDx/cH96Nezu?=
 =?us-ascii?Q?KcviFLMTvG+dGqcXQ6d0z52TU4oZUw6WLV0DuPkbBILbdbLpvAd5FoARKD1w?=
 =?us-ascii?Q?ootBnKHLTTuBpxNd0P/T0RVKZDCimCqHmaIq8EM+hbBz959pa/RQSgO6CDTT?=
 =?us-ascii?Q?zGrLLTku81o0cAk5zUBbruPuO14b6RnYRyPuOFUDhvNVpk+Lu+8Ul2B5/K2C?=
 =?us-ascii?Q?NvPf/FGYHa72I4pQ0UX9xx3DvjLcI/La4K2E9/s9No/OKTKbogeG/NsDJT2Z?=
 =?us-ascii?Q?1ZeSW/rsHN/cHcYFfDiTDRu+H3j6xj8RzFJgOPZqbTP9ZaANrdRG5ztTPpcY?=
 =?us-ascii?Q?AhJnsWfFbYDIE4CQUvetvGeVu/00FBzGHxKdPYg3WMHbhN8byIIpnMug2BZV?=
 =?us-ascii?Q?CtN0gKGDC9tnJknhgbklTxnBLTtvJBRGKAKLXF0tr8EEhufvQvbBPxrme6qT?=
 =?us-ascii?Q?w+TXr19CWwullU2UCxmZ1ZH4/SZprG3qKOM54/pKOGT6VQBmarnkFEBWRIue?=
 =?us-ascii?Q?y0cxPw3STlNy60UuW6gEJ3XhjA8ykTU6LUQfwr4f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26076402-132b-40c5-375d-08dda8b8ed98
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:23:57.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJilBXp+kX9p6TvqG8T8JpvMokBWN1LLPVh9+Nuw1+b3gV4tH3vy2D+lQft9OCcYTIE4LJ3F1wfL18RT5/gLUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
X-Proofpoint-GUID: 67AfXvkLmBfnfqkaMCNIBZlBTtbUBVZx
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68492f10 cx=c_pps a=Yhwmj+jW27PGnLXsYKQ0lg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=CJP1Jb7SsX1NIeAk8AIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA2NCBTYWx0ZWRfX3RBbPHV1fQxw 6Rtw6VdSR+8467STUUOUFghHBdiDoYgvB2GvmsJDHuu/4tbbBebGe4fIDCsFoecVU8G30s9a68J +giKDLTAH9YwCyX6mKyCi5bJqT7wGWAZDHCeN/kcKCWLYF6uH1fK6paxlEIPWMgcU6A3l5Zj/vo
 2MjUeKfKZDgxUOBTjRICmLutbpRg5WqY7FqVxV7a3ZYP/dPsvJL16rtNHKyYQuIjjx/wQdEb6Gd fMYIYfnGADhrLLWmeLNrBF8h4amzXDSC6Urdiap4k+jRohYUu774ADqtaUnAlZCgLUXs8sQ3ORM yuYR8PNhUIhRcyuLh+yEXFrt2N9HwF4ZplzQX4t5Arf92zydAxoXY/ohPy52LYvh4pl+LrO4cOZ
 e43WXaiiDaVjTzSOWpBvD8MlcaaQe0A5zbwgT8/lkWSiTcSGFUlJ+MmJJTbnEp2Ry2DlKKci
X-Proofpoint-ORIG-GUID: 67AfXvkLmBfnfqkaMCNIBZlBTtbUBVZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 07:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9278

From: Chen Qi <Qi.Chen@windriver.com>

The ptest was added almost three years ago and since then nobody
ever fixed anything. It's almost impossible that the ptest never
failed. As an evidence, for the current version, the test cases
cannot even run.

Remove this ptest. People who care about podman ptest should be
maintaining it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/podman/podman/run-ptest | 13 -----------
 recipes-containers/podman/podman_git.bb    | 27 +---------------------
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 recipes-containers/podman/podman/run-ptest

diff --git a/recipes-containers/podman/podman/run-ptest b/recipes-containers/podman/podman/run-ptest
deleted file mode 100644
index 108ff451..00000000
--- a/recipes-containers/podman/podman/run-ptest
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-#
-# Podman system tests
-#
-
-# The system tests don't need any go related variables. Dummy-define them to
-# avoid useless warnings/errors.
-GOOS=undefined GO=true BUILDTAGS= make localsystem
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 46c6c969..8d8e0f05 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,7 +20,6 @@ SRCREV = "227df90eb7c021097c9ba5f8000c83648a598028"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
-    file://run-ptest \
 "
 
 LICENSE = "Apache-2.0"
@@ -55,7 +54,7 @@ export BUILDFLAGS = "${GOBUILDFLAGS}"
 
 inherit go goarch
 inherit container-host
-inherit systemd pkgconfig ptest
+inherit systemd pkgconfig
 
 do_configure[noexec] = "1"
 
@@ -128,17 +127,6 @@ do_install() {
 	fi
 }
 
-do_install_ptest () {
-	cp ${S}/src/import/Makefile ${D}${PTEST_PATH}
-	install -d ${D}${PTEST_PATH}/test
-	cp -r ${S}/src/import/test/system ${D}${PTEST_PATH}/test
-
-	# Some compatibility links for the Makefile assumptions.
-	install -d ${D}${PTEST_PATH}/bin
-	ln -s ${bindir}/podman ${D}${PTEST_PATH}/bin/podman
-	ln -s ${bindir}/podman-remote ${D}${PTEST_PATH}/bin/podman-remote
-}
-
 FILES:${PN} += " \
     ${systemd_unitdir}/system/* \
     ${nonarch_libdir}/systemd/* \
@@ -169,16 +157,3 @@ RRECOMMENDS:${PN} += "slirp4netns \
                       kernel-module-xt-tcpudp \
                       "
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-
-RDEPENDS:${PN}-ptest += " \
-	bash \
-	bats \
-	buildah \
-	coreutils \
-	file \
-	gnupg \
-	jq \
-	make \
-	skopeo \
-	tar \
-"
-- 
2.34.1


