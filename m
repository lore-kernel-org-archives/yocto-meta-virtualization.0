Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE232C2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 09:11:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.136161.1719220270855018917
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 02:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6905e5654b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O5Qesq005510
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 02:11:10 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fs6vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 02:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn9cFH43kNjl8gWf3nK3UL1gFtM9RS2fvD1j/b7NJ3PRGJFeFLUtVgyOMcgDibImSnz3Dbe/rdj9xPyi68JzkH+Kv1ZK/nScwcYa4QqarLvHpIHYcxZZTSAhpEQ8Qo9djq2vC+kBQ3h/3YCVvtjQnMhmGobqjsiUth+iM1Ycs9K1Wrj6qDJFjCqStxfMN0BDE1Q9iL612qxzCX44QdjmIZY5b7EbuGbZWixqbnrb3+17L7Be7lFHBMJcDpZv7hxcgRHFasRh5kheX4Fn6VnUoTwxjxCN3UorUKeWXJcXifUixptY2YiZZCWuASMUXIh8QHON77HDHpJBexTc2CHjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A/6QjsdUEGKrCpAnV38UZ4P84O1fTqbETSi/13eB98=;
 b=Q2U4byiVQl9foGJlN4Ak2pVht3ua2ojATfo3PG/c3KsgMcLcxiih4FwE4U72ESbdvoujHP67UpT3Sl0WULqyFSyIuXdBqFA5gYeET4giJlCz0P1qPspYytrdluRB1+x20AC8JS6U8ABm5sVJVuRldrCXprPGANLdOl1bmZfgfSgvyeYDDJFAWLxJ7C+R/40yggLl7HDnKmb4fk/7uokc/htuq24dbpEpmNHOQv9xWZTI4p+eYwlvCfM+F6FFnyluFJulLKCB9zupfZOh5IivJcGDLgGt7+pywjjexklybNd37bftZDF5osn+KfVwQQqYZ0UdyAZxu31JTg3AWeb4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 09:11:06 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 09:11:06 +0000
From: mingli.yu@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] netavark: Improve the ptest output
Date: Mon, 24 Jun 2024 17:10:10 +0800
Message-Id: <20240624091010.787164-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9167a791-7a9b-474c-e36e-08dc942d9464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTRoMGxzUnFXa2ZhdXpQNk5HdVRHbFFxRXRTMlp2N212NVgzS09aOUJtQVF3?=
 =?utf-8?B?Q2R0cGJYUUpzd2VrbmRNS3A1WUU1Wm1WZU9uWkx0RlBNWUovZUw2bEVOWGVv?=
 =?utf-8?B?eTFldGJ6S0lqT2NhVVkxYU1xY0J4YjlYTko3eXNuREgweUZTZHU3eTI4SVVS?=
 =?utf-8?B?a3VWaTBPNy95WFlEZ3BadFAxYjdzcFM3bUhJZlVnVVZmS3I4dXF3RFY4TzIx?=
 =?utf-8?B?T2toVmlnWnJlZjNtd2VJVjAvZnpIZnVqR3czakp5TWZrTEFxL3ZPa2RxaWFj?=
 =?utf-8?B?dWFsZU5NWnpsQ2ZSSmx3Ky82UEZjU09aMXVvZWhVclAvRGdpVFExVHNJeWw4?=
 =?utf-8?B?SVZLZ1VGUnVyMENUWDFiamRWZEY5ZnNpQUxDaE9pMWJwRTJObXp5OEIydmRS?=
 =?utf-8?B?eEd5L0hPRU9Rck1xWXRuL2pXVVdzSEpiVnJWMVd5a3Y3THhkQWYwbzNRdkU4?=
 =?utf-8?B?TUVMRnFHNjhiaXBjcE5Tc2NPeStOcWZMcHpmaGg0eXVmcjhlUnd4TmtYV1dt?=
 =?utf-8?B?ZWR2TWppcy9QaTQ2c0pRNDRVcUhYY29CazJvRDFFWnNKZGNNVkVDMnd1SHNm?=
 =?utf-8?B?TzUybVNxSXlnVjRZR0RXRndYRlRLRmJCOHlOL21aTjAzZkU2aE9yWTUxbFp3?=
 =?utf-8?B?cmZ6ZU9KdVdnMlZoVkJCV1FBaEhSSGtnYzExelVRemhIWXdNYzVhS3hpK2x5?=
 =?utf-8?B?OFJXNXFlbG1RNlVBWEpPTGVWaGV2cjlrb1lJNDZZaTRpb3NoUjFLK21sRjgy?=
 =?utf-8?B?VmNzNy8rUFRzTFEyTE5XcDczNENob1huN21acVorQzN1N0F0V2FaK0ZqQ3BC?=
 =?utf-8?B?eS9NVnVRTERTOUh1bFNxYUJmd3htMUpKQ2RscW5VOUE2TVJuYkJxQ0JLYXV4?=
 =?utf-8?B?NmZpeGxoR3h5SHB5N2VLUDR6WHk0ODF5akJoZExSOU94Zk1PMjFxR3ZGRGtl?=
 =?utf-8?B?dmFaRmhkajZaSFJ4bkZ4MzB6clJZK2l1SkU4QjdFQ3Y0Zzl3TUMwUmRvcVJM?=
 =?utf-8?B?OENDQ3hxQkJpT0pzKzlpUU9ZNnEwaU5sbEx0T0JrNWF0R2czalV6ZkRpckQ4?=
 =?utf-8?B?bGRqa24xVjdQWUR1ZlMxaEFxVVRNdThSKytzSmdOQ0VXa0RQMHNNcVl6T0J5?=
 =?utf-8?B?TmJGVmlSS1BEQm1jYjI2cTV2WFZvVktKUzJkRU9KV1RqOHNrN2dndjBiaCtu?=
 =?utf-8?B?bm9oRmVXRHRueTYwMkZDVmVlTFVqT1llbXZmT0NoZ3lXblFzYVBYYVk2M2Nt?=
 =?utf-8?B?K2hJYlJhQ3FwVkpObjdUbG9vSnlxVHQxUzBFekdMSXM2VXRGWVFNcU9oVGs0?=
 =?utf-8?B?MHdSZlF5S3ppRldreDN0UjRCR2xWR09vajZPNWhrb1M2WHJBSmpBVXAvVnFZ?=
 =?utf-8?B?Qkg0K2FHMFd5MHA0MzVSQld6dWxieEYwdzdrK1JVdk9ZemNPSk5QelM1QXRS?=
 =?utf-8?B?L0F1MTlCVDB1L3ZLUDJuTnhKMmZxKzRtdFZIVEtyRS95amdJSnRzNEFOYzhy?=
 =?utf-8?B?V09nWC8xTVVaayt1SGVtQTN0VFZVR3U2VTMwZkt6UlJCZG5ETTJqYnl3b1Iv?=
 =?utf-8?B?aHFnLzFTUzU5ZjhPSVMyRFpMUjZLY1lLakQrM05GMklSb0kraFdZaTlyd1JH?=
 =?utf-8?B?NmFZYmpvZlQ3WkNwNWVBTGJTcUwrWjRLUms1Lzd4K2dpNGxndktxM0hRSDJ1?=
 =?utf-8?B?QWY5T0RyYnlHdEh1L0hta2dEbE85ZTBjNzFTZWNJTSsxb0pCYlFnQkk5dGhR?=
 =?utf-8?Q?m9aVywxxUA4AHTluVpGN2rRrOdwTYUk3fcjyLo+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWZkeGZzblVBNkZEVUt4enRGbW43OStaNkpiaXlxZE5DVjgzZnZOcVg2akl1?=
 =?utf-8?B?ZGFyd0M5WHBvM0lvUkcwTTFMQ0Z2SzNRQnhUYnV4SldteFNsZWtFSGE0YkYy?=
 =?utf-8?B?b1doZUdCSzhCeUE3OUovTkxtOWdhUlRrOFM5bkN2RUhGT09yZkpRZ3c1VVYw?=
 =?utf-8?B?TXBxUDBlclF6MDUreVp5dHZrZkM3ZE1pOFRRMzc0bWt1VGsvLzJvWEdLNXZF?=
 =?utf-8?B?aUpMSDJoVzRKUDhpcnE5ZzBHM01BOHBMVnhqYk1laEg2VzI1Vlg5Zm8xak9I?=
 =?utf-8?B?Mnl2NVFSWkxET29aVUwwdFJ3OUNIY0U4SFhRcDI4KzNlQ0tzV3ZHaHZvU0Yy?=
 =?utf-8?B?VTRFRDduVE8rOXQybVU2dE1RYWpsN3lLY3RCaG9QZXlBaWdBSGt6R0haY3Bv?=
 =?utf-8?B?NHBrclVmais0RkVFVXJmMDVrRXErVG5wTmlOVlFMRUJjUTRlNEhrOEZLd1VS?=
 =?utf-8?B?MGk2ZFoyYStENG9OcytGZDFlbzZsS0ppV3R5anFncmlRN2JjYlRwV2g1ek5u?=
 =?utf-8?B?bDRpVm9RLzZtdUJtcXYyRzVTQWM0V2tOK2xXVlNJcGpqNXU5S1NPeWhsZy9F?=
 =?utf-8?B?RjFWcXM5R2FxSDNqbkFzWjIvUkp0U2RwYlY2ZVFDbHFuUTNCRlhHMllCTkFr?=
 =?utf-8?B?WFVXYjZUSmZ0RVdPdENocjQ0YVFxZnFlelV0K1l2bzIrQlo0OExONzducU5l?=
 =?utf-8?B?cWkwYTc3TE1vUVZXWXp5RU1JOHpiMGNTQ0ZCNmVxYWlienpPckdNeW9xRnQz?=
 =?utf-8?B?MkJaZTkvazdXQ3JkQnVzTHhHUldRMmh6Vjh4TzhJMHQ2RGVzc0pzV3lQeWE0?=
 =?utf-8?B?eEpOc2o4QVA1eWNCeTczaVV1NHNWOE9qQmFGVWpYMVBFNkE2RHdEYnllWUpX?=
 =?utf-8?B?MnlVdk5abUxCbGxkdkNwanYybnJsNk1ScCtjZ0VaTC9xeTdGQUZNazN0NndY?=
 =?utf-8?B?R29RMXRlRDlleUdHaW9iRGtmLzBpTEpBUk5zOUN4aC9ubmtKU092ZDcwYW9w?=
 =?utf-8?B?UUVpL00xcjJFVlV1ZGFzVGpvdzlBRlZMbE5hODZhVUtjNC9jRzVEQXJHbVk1?=
 =?utf-8?B?UWFtb1dmcC96U3hHem02SnhuU0tLbzRabWkyVnZPQkQ1L3ZlTENWY0JvRG9O?=
 =?utf-8?B?UmV0blIxeUVpL0psdzlNRHhmMUFOTFZxOUtvejFnNXpZTE5SMysxZm12RVRS?=
 =?utf-8?B?NjJDVWlyNUFqSXp1UWdkM0ROeWpTUmVyc0RVWkxVWldyMkNTSXJLRlAzeS9r?=
 =?utf-8?B?M3ZnVjhSZWdRTjA0Sm9VTGVncVlTa3l4cHNPanJybTVTWWE2WmxQZ1Q4dTJP?=
 =?utf-8?B?dXVuaFhSRUk1TWN2OENpeTdqMm5wMUxzb3RTTTNmYk04L0hKRk4rZHR1Tjlj?=
 =?utf-8?B?WVpOdXI2TzQxUitaM2V4OGQ5SWptVUdvRzBrZjZqTEVzK2svL0owYjhFUXZn?=
 =?utf-8?B?UThvZStYTXZPMThTSUtqeitaOTBjKy9oclNJMEZvOXN3S0RHMzFxQWJVRERS?=
 =?utf-8?B?akJTNnV3czdlS0h6QkN6aUc3YkY4bGR5d3R1YXR3eGF4d0drMCsxN2R2TTMy?=
 =?utf-8?B?aWRDVjlhRndRQjhUV2ZMcnpyamhwNGhUK3UyNjlzblZEOWV5OE1sN1NGTXRP?=
 =?utf-8?B?VXkydUMySHE3dGdVUGo0RTJEQS9xOXVDakJsZm0wL1czaUx0QmM4UFFDbmd3?=
 =?utf-8?B?VUhKTWJqSkVjakUwb2YzM1J5N1BzVnNWVDhOWDVJeExwZXBIQ0VkZHVJa3Ra?=
 =?utf-8?B?NThqZzZSNUZGdGNicjVFSnhMSFMrMXZybm9yN1lIKzF5TmVGT2dUSlU1Ung2?=
 =?utf-8?B?dHZPZmY5SjJ2TUFxU0N0NmcvNUV5ZmJsQUMxWXMxRWVXa2t3RFQyMkU4TEJ5?=
 =?utf-8?B?YTNLRjVzdFVKclZSWkdBUW5OZy83d2lQLzNGZ1JKS1RoOUh0RGZ3RVl5V3hu?=
 =?utf-8?B?L2NQUEk1MHBpYVFiS2o3UmZKbnBQT0dwU1p4YTFwT3U4NnBIUzRYd1pEVWdr?=
 =?utf-8?B?TVNSZ2hVVEZKZ1NMVk91Z1BsdzFWVGM5S1RrOEJPdzVGeGRUdTRLV1FRREpM?=
 =?utf-8?B?NFFjTXNzZm5iL3R3VStHODkxeFp4MmNZMGFpcE4xenYzUHhNSkhLMlcxVGVR?=
 =?utf-8?Q?3+AcIXAn1zm6f2djf5AbKD51x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9167a791-7a9b-474c-e36e-08dc942d9464
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 09:11:06.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RQM7K3zvprR+o/+FogbKcIyhLGuQd8zN0bbl6KoPFJwFjYhUpPqWZhVD8mPC9qEBxuPpbzBEFlL+KnYAdSs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
X-Proofpoint-GUID: K9y8ND7dSEPLCtzBgXBOooJRUYnls3Qu
X-Proofpoint-ORIG-GUID: K9y8ND7dSEPLCtzBgXBOooJRUYnls3Qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406240073
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45O5Qesq005510
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 09:11:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8805

From: Mingli Yu <mingli.yu@windriver.com>

* The previous ptest result show as =E2=9C=93 or =E2=9C=97 , improve the =
result to
PASS or FAIL.

* Skip some cases related to sit0 device(sit kernel module) and
firewalld.

* Add nftables to RDEPENDS for netavark-ptest as 250-bridge-nftables.bats
needs it.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...rewalld-and-sit-module-related-cases.patch | 105 ++++++++++++++++++
 recipes-containers/netavark/files/run-ptest   |   2 +-
 .../netavark/netavark_1.10.3.bb               |   5 +
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/netavark/files/0001-test-skip-fire=
walld-and-sit-module-related-cases.patch

diff --git a/recipes-containers/netavark/files/0001-test-skip-firewalld-a=
nd-sit-module-related-cases.patch b/recipes-containers/netavark/files/000=
1-test-skip-firewalld-and-sit-module-related-cases.patch
new file mode 100644
index 00000000..7fb58a63
--- /dev/null
+++ b/recipes-containers/netavark/files/0001-test-skip-firewalld-and-sit-=
module-related-cases.patch
@@ -0,0 +1,105 @@
+From d527af68458f071215e70d6e5f952017f882a626 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 24 Jun 2024 15:40:57 +0800
+Subject: [PATCH] test: skip firewalld and sit module related cases
+
+* Skip firewalld related cases as don't enable firewalld by default.
+
+* Skip some other cases as the sit0 device is automatically added to all
+network namespaces then this will break many test assumptions [1].
+
+[1] https://github.com/containers/netavark/issues/984
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/100-bridge-iptables.bats | 4 ++++
+ test/250-bridge-nftables.bats | 2 ++
+ test/300-macvlan.bats         | 1 +
+ test/600-bridge-vrf.bats      | 1 +
+ 4 files changed, 8 insertions(+)
+
+diff --git a/test/100-bridge-iptables.bats b/test/100-bridge-iptables.ba=
ts
+index 420547b..3ff5d04 100644
+--- a/test/100-bridge-iptables.bats
++++ b/test/100-bridge-iptables.bats
+@@ -496,6 +496,7 @@ fw_driver=3Diptables
+ }
+=20
+ @test "$fw_driver - port range forwarding dual - udp" {
++    skip
+     test_port_fw ip=3Ddual proto=3Dudp range=3D3
+ }
+=20
+@@ -858,6 +859,7 @@ EOF
+=20
+=20
+ @test "$fw_driver - bridge teardown" {
++    skip
+     create_container_ns
+     configs=3D()
+     for i in 1 2; do
+@@ -991,6 +993,7 @@ EOF
+ }
+=20
+ @test "$fw_driver - test firewalld reload" {
++    skip
+     setup_firewalld
+=20
+     run_netavark --file ${TESTSDIR}/testfiles/simplebridge.json setup $=
(get_container_netns_path)
+@@ -1024,6 +1027,7 @@ EOF
+ }
+=20
+ @test "$fw_driver - port forwarding ipv4 - tcp with firewalld reload" {
++    skip
+     test_port_fw firewalld_reload=3Dtrue
+ }
+=20
+diff --git a/test/250-bridge-nftables.bats b/test/250-bridge-nftables.ba=
ts
+index 77bc12c..7876f53 100644
+--- a/test/250-bridge-nftables.bats
++++ b/test/250-bridge-nftables.bats
+@@ -913,6 +913,7 @@ EOF
+ }
+=20
+ @test "$fw_driver - test firewalld reload" {
++    skip
+     setup_firewalld
+=20
+     run_netavark --file ${TESTSDIR}/testfiles/simplebridge.json setup $=
(get_container_netns_path)
+@@ -944,6 +945,7 @@ EOF
+ }
+=20
+ @test "$fw_driver - port forwarding ipv4 - tcp with firewalld reload" {
++    skip
+     test_port_fw firewalld_reload=3Dtrue
+ }
+=20
+diff --git a/test/300-macvlan.bats b/test/300-macvlan.bats
+index c062a7f..e646faf 100644
+--- a/test/300-macvlan.bats
++++ b/test/300-macvlan.bats
+@@ -329,6 +329,7 @@ EOF
+=20
+ @test "macvlan same interface name on container" {
+=20
++   skip
+    read -r -d '\0' config <<EOF
+ {
+    "container_id": "someID",
+diff --git a/test/600-bridge-vrf.bats b/test/600-bridge-vrf.bats
+index 4b95f93..dc90e92 100644
+--- a/test/600-bridge-vrf.bats
++++ b/test/600-bridge-vrf.bats
+@@ -6,6 +6,7 @@
+ load helpers
+=20
+ @test vrf - bridge with vrf {
++    skip
+     run_in_host_netns ip link add test-vrf type vrf table 10
+     run_in_host_netns ip link set dev test-vrf up
+=20
+--=20
+2.34.1
+
diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-contai=
ners/netavark/files/run-ptest
index f6f90b15..59238d37 100644
--- a/recipes-containers/netavark/files/run-ptest
+++ b/recipes-containers/netavark/files/run-ptest
@@ -9,6 +9,6 @@ for i in `ls test`; do
      if [ $i =3D=3D "200-bridge-firewalld.bats" ] || [ $i =3D=3D "500-pl=
ugin.bats" ] ; then
          continue
      fi
-     [ ${i: -4 -1} =3D=3D ".bats" ] && NETAVARK=3D/usr/libexec/podman/ne=
tavark bats test/$i
+     [ ${i: -4 -1} =3D=3D ".bats" ] && NETAVARK=3D/usr/libexec/podman/ne=
tavark bats -t test/$i | sed -e '/^ok/ s/^ok/PASS: /g' | sed -e '/^not ok=
/ s/^not ok/FAIL: /g'
 done
=20
diff --git a/recipes-containers/netavark/netavark_1.10.3.bb b/recipes-con=
tainers/netavark/netavark_1.10.3.bb
index b65b73e8..30c26f0b 100644
--- a/recipes-containers/netavark/netavark_1.10.3.bb
+++ b/recipes-containers/netavark/netavark_1.10.3.bb
@@ -10,6 +10,7 @@ SRCREV =3D "d9f9fdc116ea3ed72a6eb4e59da33bf5d7c60b38"
 #SRC_URI =3D "crate://crates.io/${BPN}/${PV}"
 SRC_URI =3D "git://github.com/containers/netavark.git;protocol=3Dhttps;b=
ranch=3Dv1.10 \
            file://tests.patch \
+           file://0001-test-skip-firewalld-and-sit-module-related-cases.=
patch \
            file://run-ptest"
 require ${BPN}-crates.inc
=20
@@ -33,6 +34,9 @@ do_install:append() {
=20
 do_install_ptest() {
 	cp -r ${S}/test ${D}${PTEST_PATH}
+	for i in 200-bridge-firewalld.bats 400-ipvlan.bats 500-plugin.bats; do
+		[ -f ${D}${PTEST_PATH}/test/${i} ] && mv ${D}${PTEST_PATH}/test/${i} $=
{D}${PTEST_PATH}/test/${i}.bak;
+	done
 }
=20
 # rdepends on aardvark-dns which rdepends on slirp4netns
@@ -54,6 +58,7 @@ RDEPENDS:${PN}-ptest +=3D " \
     iproute2 \
     iputils \
     jq \
+    nftables \
     nmap \
     procps-ps \
     util-linux-nsenter \
--=20
2.34.1


