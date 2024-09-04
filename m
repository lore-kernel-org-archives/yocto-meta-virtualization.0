Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A2CD37BC
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 01:31:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40230.1725413464759519860
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 18:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99779d1118=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4841BT7p003072
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 4 Sep 2024 01:31:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1bquw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Sep 2024 01:31:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW8ZfrGGt1sktQPsthStQ6olHKAgqtRoc5O09sQnXcp1tbXDZp12HeiC3gCYn3wHH66CBNB5vKsGuB/gRpkeuaiQri6Zel496AZHoE8GmxQ8MClg1lU8HCe/tpPnsmq7No4caCeLqUKySmQImo2EB2FyY2J75GLoYOyd2HX+J/HrH+cLgJm7XnB7SqbmV8XQOmtiri9sKR5fEV+sLLRMANCjOcdubsZ6u3B9kq+Aow4McnTq7U6drIQi3Xd11jBPhplX5c6Q384LzMqgZihkZvUMJ4bh7RrnYx/fxs+RJS2SJ3VhsIplrHsUpz2P9R853A5bi+3LzQk6X6aeL6hlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a9blBmIvhUXXvTYAIpA9EdctZFmBB+xFRM6MtZPzns=;
 b=bDRJ1cXwROeBfSsWFM4l3daeRKgTiKKZ4PRYsj2mLwulJ135QOgZQrXzjM0cVdRqcTRribOqgsjAOFlvhep5H0rKfdptf+Ks+oRwjl/en7kyaGYaLY+XAzqYMeR9eZGU7IWWD2CrLj6e5UXWmFs9YT1qhXP2lWlS+O876nopkdYweb5ZN9Ayau50z9DQWhryJOl9y4FdA3tflNdU2vCNnB8E87PpSVlSg0nfd/KFRV+QxDD7gDPfn/z7Bk6wUo424gMwuo6ZUEuCoZmXlURIYGfOEJBBKGS2A9lK1PTRpJdytbIzdUV7Skholl5XeZyXrzcCrfSWyPeiRzr5y1ZGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 01:31:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 01:31:01 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix build on qemuarm
Date: Tue,  3 Sep 2024 18:30:50 -0700
Message-Id: <20240904013050.1629475-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e545727-a9d7-4214-4eaa-08dccc813c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6U1Mit0VjJzQBVn6BXmtnM0rwmXnWEUFlezGlaBNuPnUrxRtLmS4tr1BTbzT?=
 =?us-ascii?Q?s3fWO2Dig7QfYPQQZhMUwf6rUYS3yfFdIjL67wufhSlTWiFfqOIKagnyQ18K?=
 =?us-ascii?Q?7DQecTVTUdEJ8788er8uwAj74I3tkiOsYo5ukjzRt7zrOsbQsND4rQ3+0+Fq?=
 =?us-ascii?Q?+v7WrYfSBPQkNo95wE5Tnhttl7SOW5uHV17SjKxNCX0JMUg4HnU9ZrpJTWxj?=
 =?us-ascii?Q?U/63FhpUrRzKOqzpEULfZr1k1xfqLecZy2WPWlTjjz48H0aMWAJWXHW5mejM?=
 =?us-ascii?Q?Q4LG95d+WVk3k/LNxoJNDUWsjuuBi+YFBv0NGuQ4XE+k3HnGKBgTsN2jT80c?=
 =?us-ascii?Q?NskVJh3MQ/V9UqKm41lFckY7/bWK25B9wBbH7c0nWyzZSr4k+PVvIe2dr3WF?=
 =?us-ascii?Q?J9Q7Lk6omYenb4xLziBSTaaq63pOafN4FgL5pYMRwdpjRXDMvEMLe9FmJrLF?=
 =?us-ascii?Q?YUGV2Y4/hAnXKJY1klzGA136QBd52dQfaySQ/C2Ywn7F1qZ8sjWERQ56L4q6?=
 =?us-ascii?Q?cMrcteXFHDLAvILYn9KHU5pCyNdj5QFD3qcNm1/qTw2veDtEtZk2aERYeGx7?=
 =?us-ascii?Q?KHehUKpPJXYABJ5iC5ALiLbZaNG7ZN8SoV0HbfAtDN7qubd1G0xQJ36hbH6s?=
 =?us-ascii?Q?81L55nTneJz0YbEtW3tpya0yAtAXboIBT8/s5BUvJc00bUXqa7qIIafz3abJ?=
 =?us-ascii?Q?HkDUpXivyQXvRJJaXqiof+AfnzF+Oa6upUT+t/RQm20jiAD9TxM6iel8cXRv?=
 =?us-ascii?Q?ozHx4Emg1dWji+VMFHW9DVd7MI04pFMPpMXGTYQGDJXAIi2U9z5cFZ4ciqH/?=
 =?us-ascii?Q?aVdqDiWAs7XJbGA6MK+C1jy8mZ1IigT8aNtvZAGStFBbLYFj98qP2nl0I/eA?=
 =?us-ascii?Q?dzDUY2kk+AfvaEzD3hG2MURwFwz23cqWtKMFbK7mz59j40OER2dSP+4hFg/e?=
 =?us-ascii?Q?N04R28fQUgerQa6Zvr2imE/ux07/LkZqdph2EtoYo8HskqczED9lNnLkqEwF?=
 =?us-ascii?Q?tDF4C68lgrHY1wWz08+aar9JlTxOMy29lxQQJzVi42UxujeSYRzOqa6VPBYU?=
 =?us-ascii?Q?e+/A+dQf0tYDbY7xYXYQeOmg9USJa+IUgR99tc2lxK8BjdYNE0XIbPkiRu6M?=
 =?us-ascii?Q?Fecc2OCvI7BJfyza5GVE9vJ2OLAcnhU7hQGLXR/+FKfr/Z0mksuURceZZIW+?=
 =?us-ascii?Q?yn04S4vHVsebrmIM/jl+GslqtIQoqr9djw1jjKGKKe0FLwLDIFsL9c9wM5i/?=
 =?us-ascii?Q?SLsM40QR5BITkqPc4biFhYydLxKXGGeNHC7YegmmYxpQ5Sbjf8YIuR4Tzgad?=
 =?us-ascii?Q?33IksWkCkl/YqcB8IaFFn2bX2HyQV9uup/wXUVXb1v0vJjtcFm0UbMbFmAn1?=
 =?us-ascii?Q?ovjD0FA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L/8rrzX7lVTh2UkxdfGR+u3aVSrX8+6mqfxpRkhoPgHScFKkemlNw4xqMNjz?=
 =?us-ascii?Q?d7No9vStfDurCcIhPvz1fJ4UHzthDGFKvaM2i61mGazT4OxMBlR/N3r6xLHI?=
 =?us-ascii?Q?x9FluJ6LtuWPEJMD2qnGZmTkrVtzpeCLR29JWY5868wOvxRHZz4tzGF2sgWX?=
 =?us-ascii?Q?uUWVVb8yhM0tUkiVaJnW1pEtc0JQ5Q3B0TkMpB11nMLQgan2hFrhf53RXC4u?=
 =?us-ascii?Q?dY5oyRrpfAnmBUp3tylsLhxgFYHKl2sqlfsJQtlbipVf/x3bI6GCu11EhH/D?=
 =?us-ascii?Q?FnyskFzkoUFvcYA5477Ab0+hnqI1GlX/CI3jYPZj2kCb+28Kx8lkkvJP1Qg1?=
 =?us-ascii?Q?tdjEfaxpg2g/GQ+J1RWE6nWQNuacNs42kDtDzJdo6BpjUc6tGMzjwo6uM3dt?=
 =?us-ascii?Q?szW0HVUIZWYA/cNdX3EGFxwZWou+IsXQFRq2zPDIm7AnRNoMphQ9utf0xj9+?=
 =?us-ascii?Q?0Hzu1JHIDYYGNNvpoAzNUh1bGryfFt9bOd63+HVylD2tS7MK2hugwuRH0zKw?=
 =?us-ascii?Q?mxwEDDxHDDflu5JaAnltf4vZAqM+kkFopFZPUyPm+b/Z/kVW8nG8gefzKgZi?=
 =?us-ascii?Q?aCsp8BrUp9g+g+JJxSWavxqFAIj5yRBDcy85ZX0NFRKDijiSZfuDtyAxJ5Qt?=
 =?us-ascii?Q?wknwEX+HR1IkjYTlLhFQzs2uhS5qLj7S/0zzMZfrSvSt6uMsGfM9O4sJFN3F?=
 =?us-ascii?Q?sNraGZo2AsFgS3Ye5MhZQExoNF0GmCHs1oavnBtVXLyvNnWhhRuRttsFkp5m?=
 =?us-ascii?Q?DfGmdMct4nsBQABhQfStuMvv3AdnZhxx8pAbdnKV+V8/IVWLPV5S45F/oo+v?=
 =?us-ascii?Q?sU/EUeaR+aosX0hrU3BzB9IxZRN8Nmyfj4LqXApkCtcC8TjUvSmqG9m7S6cx?=
 =?us-ascii?Q?r4aWSM0CD9m1lHMKjsFT27+TM01MF73WUOBmd99Q860BunJG0PHjGncd3x8d?=
 =?us-ascii?Q?m7SxGK/3/lEB8xfm0yjOBtBzWI7jIpJYlsmLrgKRuE0tvM18m2ORA9Goxubr?=
 =?us-ascii?Q?kqF3zBaAKUSXrt5VQglYE+PHFzKPmhtubraH9WkuXLevYqaIy61sWz3meoqX?=
 =?us-ascii?Q?1coqWhFtD6zLPpQHP5cz55JOM9tlWYomsbTYFY5oKKgXsBxXwOwXnTD2SCuN?=
 =?us-ascii?Q?pTjaiGTvdAoworlsbiJ8fK5bzcBfrsIiB8aZ0cQcXtJOK93HBkteZ0AfICJl?=
 =?us-ascii?Q?aP3OGGBJEBFPjTXa4tdAsjkN8hyKXahOD/yg2s6EC3VCSDhZLlJUZkaYHjFX?=
 =?us-ascii?Q?QnP/t2cf6IGsfZrBTHt7bntwUCfsHDRRYaZ43xDzU2/M4BwkIJA/CFK0CttR?=
 =?us-ascii?Q?jjJakCWJlE/7UtujVCqsFLp2Elg7JVyMKQteDm9VsOqv13PyQwCROMymrfhb?=
 =?us-ascii?Q?VEmWc/DWfe74YNoPw8U9j0xu9fvBtTBKgHeOJxXJs7vQlOekriJQr0WR7NGp?=
 =?us-ascii?Q?VCD1V1kXPWWF/yZgUpSVp3STVmunCSqGCZMus4KpLebLbjiPtYdsBFcQtCmn?=
 =?us-ascii?Q?CM+QC8Q8X6aHaN/rmVkEpSTPF3U+O67laJ+xxbmkxMsl0uSvIBiSVjmZEH9G?=
 =?us-ascii?Q?NOmwSNkW509KwiiaQkJceOKJ/gxCaGDE7KkRsErY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e545727-a9d7-4214-4eaa-08dccc813c3e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 01:31:01.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST0R6XiKG2vhICizUcIICiThgqfYFQQKl1awiisbXncP23GErWg3mJKSxyntjpkbmPenAAQwH2iqXAq0uP+fsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
X-Proofpoint-GUID: QmJgcNpSeRU7j3iwv1G9Mt003PT_VJQZ
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d7b857 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=SqMvC5kiAAAA:8 a=NEAV23lmAAAA:8
 a=5Scewlb2tdvGnEom554A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=_o8VnCo6Hb5Oqlm6Mk7M:22
X-Proofpoint-ORIG-GUID: QmJgcNpSeRU7j3iwv1G9Mt003PT_VJQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_13,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409040010
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Sep 2024 01:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8866

From: Chen Qi <Qi.Chen@windriver.com>

On qemuarm, time_t is 'long long int', so using '%lu' to print
it out will give us the following error:

    error: format '%lu' expects argument of type 'long unsigned int',
    but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=format=]

So use %llu to print it out.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...emu_nbdkit.c-use-llu-to-print-time_t.patch | 76 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_git.bb       |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
new file mode 100644
index 00000000..7263666a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
@@ -0,0 +1,76 @@
+From c4636402c06ab5ae436176daf0ef17005346e27d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 2 Sep 2024 22:15:51 -0700
+Subject: [PATCH] qemu_nbdkit.c: use %llu to print time_t
+
+Use %lu to print time_t will give use the following error:
+
+  error: format '%lu' expects argument of type 'long unsigned int',
+  but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+
+So use %llu to print time_t.
+
+Upstream-Status: Submitted [https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/FQSQMML6VWMHNWBYP67OLCUTJY5LJQST/]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/qemu/qemu_nbdkit.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/qemu/qemu_nbdkit.c b/src/qemu/qemu_nbdkit.c
+index f099f35e1e..fe660c78e5 100644
+--- a/src/qemu/qemu_nbdkit.c
++++ b/src/qemu/qemu_nbdkit.c
+@@ -544,18 +544,18 @@ qemuNbdkitCapsFormatCache(qemuNbdkitCaps *nbdkitCaps)
+ 
+     virBufferEscapeString(&buf, "<path>%s</path>\n",
+                           nbdkitCaps->path);
+-    virBufferAsprintf(&buf, "<nbdkitctime>%lu</nbdkitctime>\n",
+-                      nbdkitCaps->ctime);
++    virBufferAsprintf(&buf, "<nbdkitctime>%llu</nbdkitctime>\n",
++                      (long long)nbdkitCaps->ctime);
+     virBufferEscapeString(&buf, "<plugindir>%s</plugindir>\n",
+                           nbdkitCaps->pluginDir);
+-    virBufferAsprintf(&buf, "<plugindirmtime>%lu</plugindirmtime>\n",
+-                      nbdkitCaps->pluginDirMtime);
++    virBufferAsprintf(&buf, "<plugindirmtime>%llu</plugindirmtime>\n",
++                      (long long)nbdkitCaps->pluginDirMtime);
+     virBufferEscapeString(&buf, "<filterdir>%s</filterdir>\n",
+                           nbdkitCaps->filterDir);
+-    virBufferAsprintf(&buf, "<filterdirmtime>%lu</filterdirmtime>\n",
+-                      nbdkitCaps->filterDirMtime);
+-    virBufferAsprintf(&buf, "<selfctime>%lu</selfctime>\n",
+-                      nbdkitCaps->libvirtCtime);
++    virBufferAsprintf(&buf, "<filterdirmtime>%llu</filterdirmtime>\n",
++                      (long long)nbdkitCaps->filterDirMtime);
++    virBufferAsprintf(&buf, "<selfctime>%llu</selfctime>\n",
++                      (long long)nbdkitCaps->libvirtCtime);
+     virBufferAsprintf(&buf, "<selfvers>%u</selfvers>\n",
+                       nbdkitCaps->libvirtVersion);
+ 
+@@ -593,10 +593,10 @@ virNbdkitCapsSaveFile(void *data,
+         return -1;
+     }
+ 
+-    VIR_DEBUG("Saved caps '%s' for '%s' with (%lu, %lu)",
++    VIR_DEBUG("Saved caps '%s' for '%s' with (%llu, %llu)",
+               filename, nbdkitCaps->path,
+-              nbdkitCaps->ctime,
+-              nbdkitCaps->libvirtCtime);
++              (long long)nbdkitCaps->ctime,
++              (long long)nbdkitCaps->libvirtCtime);
+ 
+     return 0;
+ }
+@@ -1054,7 +1054,7 @@ qemuNbdkitProcessBuildCommandCurl(qemuNbdkitProcess *proc,
+     }
+ 
+     if (proc->source->timeout > 0) {
+-        g_autofree char *timeout = g_strdup_printf("%llu", proc->source->timeout);
++        g_autofree char *timeout = g_strdup_printf("%llu", (long long)proc->source->timeout);
+         virCommandAddArgPair(cmd, "timeout", timeout);
+     }
+ 
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 706d4a40..d57bdc11 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -39,6 +39,7 @@ SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;br
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
            file://0001-meson.build-clear-abs_top_builddir-to-avoid-QA-warni.patch \
            file://0001-tests-meson-clear-absolute-directory-paths.patch \
+           file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


