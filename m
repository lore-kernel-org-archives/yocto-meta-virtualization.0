Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9619C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:28:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15963.1679048925414694588
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 03:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2440e5e2f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HARucZ002341
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm79j0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE6cbBzMoxu9N/VstMfFaMlU3J6kZN84Y/fYXv6RkwVEXn771tzWk0Rn2R/XM73SPAgb+1TsuR1o2z5qAcxi4nsiVl3tBDJsc/9o62QsTH1W21nN5sPFoUWOtEnNsefZ3AXA8JTsVwVhlY5G6hgZIyi7F5czC2/FJKH2M2KfN6D9+rgXRhMItjFRkFg3EoBX15Z6AQulQNzjyKrqB5KaDV0uAYxsy/5tAEUkBw7kshMF9+l+A0zhHNBrjcjk3FwgaDbIihks2bIbsyo/0u8UREGQcDUtHe8YBao9xZpvvFQfm7YnFL2JGAiddezl4SQlwHQGgJL8LRrEiIlui6CVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGP0+KEY+76V1PP3a2kqnNa7kFbgPht1vIGk8UCdcoQ=;
 b=EIunMjTJGg4O/TTQ8JD7NHSRUh1p1n8pxW+UoC7aKur8CU7p2JSQbAKr01ngSsPLugGCrDga1QD3eTWaIaD6GQ514RJtqda8nRX5fqiSp4OtfxBcVlOwUGGnnGynMiGk9uDYVbusjP18ZAWxS9xyEAhSvoLj26YPI643NBLMr5oJvx1IzEpOKimSmP/wCND8b7qGz0JUKRbgJhuvv38A9YTeUz8lHKZdQTdyh+pboAcifQUMBu2y3RHEpgnExNZaxpGiwXA3xaPMgFtgMsamqwgLWd5Q3m4+XhsomNttm1ela7apEAzFsHbb5qqsAMUsL3lri2j13hpYY+1SKk69UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 10:28:42 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 10:28:42 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 0/2] fix the template of lxc download failure on kirkstone
Date: Fri, 17 Mar 2023 18:28:27 +0800
Message-Id: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dd2569-1b0f-4cd2-b010-08db26d2615d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sOCl/3Su6v0gPAakrxFNYL1FAfhOBMgyTRLxRz8oQkPyDmMbYmwqqlIh+IHx+9AItDx+sSbfM6NObJiaFsbkhysXH8C1/X20Z7roAUo/86QYZCrFWp1Dpy//6jLJIrSJO8xLT9NkhZJCmtOyw+1QR5o3EHtOgQDW5mUG5tBjhKdd5TxTdnQbemDpLj2tMVM22cAKPVI55bhvyTQ6tycLdkYeRxbt58C/7W45FCa73BFS3sWOpDJPjuyscoyQYlcYA1uxXtarP69Ovyl9IgyrtbFBMCGAM42wyIdv5WfYmEt566qkq8MTJ28xM4g5wOL3D4bsGv0mcShVuBJ0NFPPshQEHoujrH+v1dJjJASxfK2Dbm4mjI8Ueasf/fNRhNw5DMIj6IKKNN/X9r3EU9DkHWzy22ZlcgXo5nM0Id7if3DJbveBIsF45NEoHpvBF10OLWbR67ViMKKnMGB5Us82OjEeSrkNhpZexwi7OhNlXdBEcK6j/Go+S3Un54PpuzuC/sUBAiCA9KjBT3SHGdGuMUOehtcrMDrM0iqZ6BibuK+J8cVtuE90+PSuFGBZC8CqHN5G2+0o5f+0Hu974v30BHGd9zNI5w8ENTT6SLKj9bE9AOk011k01NnDEgvmSPGPgB0oXUXUJtDmKoMH8YcF5catBaXWd+6B6CAS6moLdzBVFil7lrTKAJQrO6WFdYWDjXxDpia2P+qNnQbc96EJ3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199018)(478600001)(8936002)(5660300002)(41300700001)(38350700002)(2906002)(83170400001)(38100700002)(6916009)(66946007)(8676002)(44832011)(6486002)(6666004)(66556008)(66476007)(186003)(52116002)(83380400001)(1076003)(6512007)(316002)(2616005)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3ACCYUo3Fl8UNm0V6ktUdrP7u9GV6iSHZYhv1M4j4BDJaYl37Qkrr69cqWfe?=
 =?us-ascii?Q?CyzDi6wQDT6dG80qSkJoCp9HK/rrApOAMuYUn4jKA1TJ0AITDIZySSp/kxsf?=
 =?us-ascii?Q?GI25i6yBkfdJHDhBkz4bDoJtHlgq8BZ7kGHT5gfL3ZSdE74LuB/VtrglYIV7?=
 =?us-ascii?Q?qHJ+S8Pi1+4x1LvJXUaaEeegRpUoMoNLn3ovmUF7YNS0syVaJjkIH0ib1RBz?=
 =?us-ascii?Q?BxLDpce/5f7ldykT38PZ/9P2Uenfh3BfaMg0VHDYLxAjN9yNWmfd01CLSII3?=
 =?us-ascii?Q?HH9wleq/xhF0jH8Gjyl8oI3JS53K3JvYjQOLJECHSuvq/WmbEub0ykloYLgV?=
 =?us-ascii?Q?b3l/ltbZKwCGsehRvpj3sLn02Az+mhJ30LPWpMKLebEWbvOXgPlkyXfkwUhB?=
 =?us-ascii?Q?U+/obL/LZrjgwuqz0sUfdzDn9184w1u9QBLtHy1f9Un/ghfMcyy+cx2/7Wrw?=
 =?us-ascii?Q?x0GieC9DWJlLyflUzSY5I6yzizYZf7VuuyycBL801NwIgwbm7dkCTZ/gyXQM?=
 =?us-ascii?Q?op1bKStXXcSdOaqHv7HVutyw+j5QSWmcLHq0LNS5kCzQ2MyMWPgxQiywYIbI?=
 =?us-ascii?Q?+9ugcdMxYF99SOHpHwBLxwf6UAAaTtGh4mq23WzFIMMbxpKUJxkzymUPQjvy?=
 =?us-ascii?Q?BEMO28zEEYgXD+ILV4n++6JiW43HyoeW7mPZ0r3033HeKviuhk8z1fvRdwnf?=
 =?us-ascii?Q?TC8LghwXXO1sBKG3b2U0uh4UFGu3fUIm51rxhR8rc6b4hqTaqLwyfe3ooKTV?=
 =?us-ascii?Q?9D+qo7OP8lDhKL2MhlamTxuZWIT8uKyMy7aAF8lwL6K2n/BjlIevXzgxosev?=
 =?us-ascii?Q?9FfzYnvRhL04pKcJkyaUHiKjH+LVH3p5HVqaj/KwzmZ7rdkI2nVQg6vD9p2G?=
 =?us-ascii?Q?28m6P1+q71IO13JhS2eaBi08FxMB9bNFyTubSBYEJrMMK0e4w/arN0u7n115?=
 =?us-ascii?Q?kmM1VSDVYa+2IgOKC33smuMqWUmS5kHBeBVy9K+G4hoyj6zrbI7mqDCCAJNp?=
 =?us-ascii?Q?QkUjA51I3Vt1rBm9niGNy75cdapKKGRH9EufxL9BnaJ+r4g5pwQLBsvSFt1c?=
 =?us-ascii?Q?FbTuPGdmtybSHQcRxdmiBAwjF6EyA6N6Vdcjv4S4VtMmf+KkM0BthFQi1QJ5?=
 =?us-ascii?Q?bcORZeg0nIWtKERQ5+jwaSMv5DvzoDqYwJnOEsQqhWCG+FzESWwk1yy7sVGM?=
 =?us-ascii?Q?taWQZIBSATl1GqZRbPsBc5zsqXOugL8qaeHkcD/r6h1u8Jovq8JBHHebco+Q?=
 =?us-ascii?Q?fUlRhDKUQDus+zGEEw7/W5aIMy+ae0l3XfBRXX61FeZWzMC0REjv6tKTHl9O?=
 =?us-ascii?Q?Cwa0JDA6/HtnJdVIwaiU9iXloZ9isB7YZpkXOrOPQ2RTh3Vkzb7p8bhcO3h7?=
 =?us-ascii?Q?a14m1IiieBBA+WsBa6TSj2wXMbuaXZGuq8mw/qco192iPUBq9Pb2SXXPW86V?=
 =?us-ascii?Q?/fFIU+8xHTbIzN+MYX7bQ6jK4wtOftlVB9d8MK6myjpNHNnaB3VyJKAr+9sl?=
 =?us-ascii?Q?Glz/c86upPQktli+WWPjtpRmXgv2Wp1bvbi3bky2e+Ixyy1Ru0ogip8zwrdy?=
 =?us-ascii?Q?3OgMbw+DAMSS271d/xlgmuts2KIK66CJBnH/q/zapHjBSQt/Uv1bL0M8UGs8?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dd2569-1b0f-4cd2-b010-08db26d2615d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:28:42.4557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdOoRcv36vrlOzjcrwyOHdpuo0/tSeRa4oM9pm2kUCEUl7tBhuB3rnlCqWg0IxQD2imzkQZ+5J0D0fBGpNerGojAxWDHgLWHX1+9Y0IE0Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
X-Proofpoint-GUID: 9i1aMOjyprKnyo9N9A0xdB11cPhLPbJd
X-Proofpoint-ORIG-GUID: 9i1aMOjyprKnyo9N9A0xdB11cPhLPbJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_05,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7943

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Hi Bruce,

This series of patch to fix the template of lxc-download on kirkstone.

When we using a download container command[1], the lxc-create would report missing 
"fi" error, this has been already fixed on master, so backport those changes in 
templates-use-curl-instead-of-wget.patch to kirkstone.

05f316f70a4d : lxc: update to 5.x and meson
211918936180 : treewide: bulk update patches with status field

After backport those changes, the lxc-create with download template still has 
failure, after checking the image website url, it was redirected to a mirror
site, so curl need to add a -L option to support url redirect, the version of 
curl in kirkstone also need to add an option -f to use return an error code to 
tell the caller when http/https has errors.


[1] lxc-create -t download -n test -- --dist archlinux --release current --arch arm64


Xiangyu Chen (2):
  lxc: backport changes from master for
    templates-use-curl-instead-of-wget.patch
  lxc: add -L and -f for curl in
    templates-use-curl-instead-of-wget.patch

 .../templates-use-curl-instead-of-wget.patch  | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

-- 
2.34.1


