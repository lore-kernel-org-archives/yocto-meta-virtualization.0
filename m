Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67149C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 03:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16692.1719372279717586112
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Jun 2024 20:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6907085cc7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q0ONYq016608
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jun 2024 20:24:39 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fu7f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jun 2024 20:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFKWmeofmAONb4Arj1KhrKYsZMl/cGSnCGIdhG5au+Bo2bhNjZUeL5pq9CuMBCsg14j/FBuWwebjgSjkJCQ5y2zAAec/rMjEiXFLdvw7ZAXChlsHgndtmQ+tEMt96FZfIG26pYWGkbi3FX8TupFIL1RE03XwCa0Wqf+77s/w8R8AzL2g8OluNDqX9qBudGrTsQHh1xMzIBFHEgYf9z813rdLSOS/UwAQTxpY8gOMK/63Xmsrqy5Kb2x5/p/ez6oPfzQZDqbOCpqfRb142CUk/BpOaC0JKROxMPxSVKWgyxnMPFQzp8il2xMfGcYKt2EFGvtZ9kd34FtMXz/utsNQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7GNPmV3gh4ijno8Dh72UsYuH4obWbU84vyXws+cb2M=;
 b=QyDGIYmIl6/PKlyeQno6nYReQDXq9mnplwS89w/vxe2T6jvBRm3RtrthFQtTsDlDAqUw8+yFmsKZUCwIsrDQH9PkPhGigrVwPR+7sWirFIImcQRge9kEJW+Ocx47wTZrr9tRV1IC+5SQK4NJevkzyY0mPeiTvATxkJMGrbN7Fv/tj1ZMm00N2s9vdBacRuMiwofA9gVHKxrDA+KKwm3T7S70a15Fjggnr14uUKhN2dL4mZ8uiT68UTcG8xyZ7RsMBTo9BFfa6GIXyaemuqbv5BMQULhF7ym+i4uczZ1v6S5IW+ifNcQAO529jXgfYqZbL7o97sEW8Ohls5FsjO9vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 03:24:35 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 03:24:34 +0000
From: mingli.yu@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] aardvark-dns: Improve the ptest output
Date: Wed, 26 Jun 2024 11:24:17 +0800
Message-Id: <20240626032417.1990728-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a41a5af-15dc-47b9-065d-08dc958f803c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230038|1800799022|366014|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0hvZDU5NmcxK2RsTlRzcEZKN0tsRnV3UTJDa3ZCS2VrRm0ra1kzcnQwK3JN?=
 =?utf-8?B?OEFoY0llYnp4RFhzMTJMenJCUEpQWEI1ZWVCbzR4d2lacm1NcWZmdGU3amFE?=
 =?utf-8?B?RkN0Q3NOZjU0V1UzczdpTURKVFc3SE1SVXB2RnYvWTd6dk04TjByRkp2d0Zv?=
 =?utf-8?B?a0hlRjc3SEt6VHhkTkVmUTJSMWhGWXpGZ3o3azFCRXI5bFZUU1RaNWxhV0cx?=
 =?utf-8?B?NU5MWDNQL0hjQ1pQRHFYQ01HeWlqbHdVbXNiM0lMVWxZbWQzYmVTWTRnMU1C?=
 =?utf-8?B?TmE1bTZaN2FoSWcxUTFZUDFwaE4xeFZhbElPY1hmZFQrajU5YjRvOVl2TVdM?=
 =?utf-8?B?V09zWjg3QmNtNDdkQXVzNGFSTXdCQXdCYWVMMG5zUEhTay9BamxITmhSakZo?=
 =?utf-8?B?cHpwNEUrang2eHdINURVRTl3bUpJQ3BKdDdhZ3h6VHpncjFsZ0VnaXJFZzRE?=
 =?utf-8?B?RTdhcVZsdDJzalpSMFZlTS9pd3JHaG1oS25lRk5DaUt1c1o4MDRwRlZTNWVC?=
 =?utf-8?B?UUtsdC84T25QQUhEVmw3bUhFSHMvUVJ2Ym1jOTI2QjdOdTdjRXdIS2J0OUdO?=
 =?utf-8?B?ankzYkZMSHRwZFBvZGttb2psYlJQdTVrWCs0Ymh6MVlaSTZ2ZXFFMEVLSjZa?=
 =?utf-8?B?TGVSdzM3YnhsdThjUVg1OHA0eUNuNzhIL2xHb05PYThUNzAwR2k5V2RrMTVB?=
 =?utf-8?B?NS9SVXVNbDl3VWVxM0RGbUlHZVM5akE5d1FyVXhZUFo0ejlEeUZjR09OeTVO?=
 =?utf-8?B?aEd2alJXNGpnVnUwVGtVMFNKa1B1cG5NQ3czelZ3Y1NhZ0dBZXVLUXRLOHdZ?=
 =?utf-8?B?eStLbVA5REFXVEY5RlRaclI0UjcwUFRjOG95dks4QzJ6TzhaazJERmhYZzR1?=
 =?utf-8?B?NEhpN2VBcDZETVRBbXQvOHVqMS80OW1ISFV6elJZdG83ZUh0NEVBcWc2ZjBt?=
 =?utf-8?B?dTY2OXBGRFRaYnBaSlR0VGtndU0zU1A2QWdncW5NSnJOK1JRZzFjK0FPY2w1?=
 =?utf-8?B?S2dTOXFja0xaMTBiQmRILzIwZ1Q4ZEo0SFMwV3ZtekFUVjVuc3hvWEZOTjFS?=
 =?utf-8?B?bUE5a1puSWVvcDJnU2xVZ3BHalIvVkhUbEE0M2kyMk9pVHFxcWk1RE83NjBr?=
 =?utf-8?B?VFU2dVFhQ2RuK3EwajBYTFRieVBiNHNxdmxqS21JOTdYaXU2bVM2ZWNYU0ZP?=
 =?utf-8?B?azdkNUtYUTVvcHQ3RFdNa2JFaWtsWVUvL2JPeG41SkJvcVQ1akFZajcyM2M3?=
 =?utf-8?B?RTRoUjFBNHRIVENNOU1JUnhTNGlKUWowc3BHMElSNjNjdFl3N1NSc3RxSFJn?=
 =?utf-8?B?ZXNhaEFCTGdqeDZhc3l6RG1qSU82OVk0Wmc2N1BtOWJBQkVIZjIvL00rRzIx?=
 =?utf-8?B?R3NTQ3kwa1RGRWJxc3g3d0U1M0ZoUm1mL3B2TFhCRW4rc3NhckMzT3FseGRv?=
 =?utf-8?B?bkN2NzE0c2M0THR1TDZ3SE5uTzFBL1U2cnFBeVhIYVdUcXBFMDF3UVBqVlN2?=
 =?utf-8?B?MitjY3E4Q3NVdjU5dFRQUi9UUjB0SEpYbG5qSTlOc1RSTHZZTmNDRGVhWVc5?=
 =?utf-8?B?TWFxMnpLWHZYdnc3cm0zeXVxSmJDVHo1K2txNm9RS0QxVEhOQkh2d2RXUU1P?=
 =?utf-8?B?Y2lCQnRZR3MwZVN0MCtxZG94d2ZHUHJjSmhPck1sbHVEU1BESjM3NjBCRkZs?=
 =?utf-8?B?Y21BMkkvSGZHMktET2hjblpTd0p1TW16dUVSUDFXN3ZnaE1RbFd2ZUdCSkxp?=
 =?utf-8?B?SEcxS1o0dE5lR3BNUVU5WGRRaFRpQmlIRTBEUUdud0ZLVmFPTktReTNqOWVk?=
 =?utf-8?Q?vrciRbNHqg5ZAeaX32QwX+AzJZi5IPvz/i7CA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2FOSDdwbzZYdWw1ZUM1MzRZWGkxSURhbFNxQXJoVWI0N1hUWm1WLzF6Rkx4?=
 =?utf-8?B?aHVHTytGMzlqNUl2cFUxMHF5Vndrd2NVYi9WRSs4c1RSZTBHVFJQSXJTOUYy?=
 =?utf-8?B?THVvUTE2cERMQzRpZDErNjYzRW9Ec3dQQThTTzBqMFZLcWZ4K3BnL2RrRFFl?=
 =?utf-8?B?RHlXOGZXNEZEMTUwOCtuelJVTWsrMTR5Q01SL1pkdGw5QnF1aHVaNWFJd3lh?=
 =?utf-8?B?RWlZN1Q3UHhaUFUvOTdkb0t4aDdQU1ZpbkdhWngwZlZLc1BQa3Bia1pFaHVM?=
 =?utf-8?B?M1JBeVNzb0xKMm9ZRW5YZXRHQkRwN2xxcWRYWU1XKzJ4UkJpaEVHaGV1OXlh?=
 =?utf-8?B?TWVCOVhzc2pTd3U0dUEwWTQwSm92T2JEL3krMlJUak95RTcxWE54dWM3ZUQ1?=
 =?utf-8?B?ak5ZcTFnVUQ5bzRqWFdnbFNlWFpzM3FDNkxPeHczVFRhWGpDRkhJQk5RV1BO?=
 =?utf-8?B?OWZTT1JEK2lOWTNYeGxibnNJM3RsSDVWTDdQTUFMSXBZdU13M1RoRFUxOFVK?=
 =?utf-8?B?WGJvU0o5bFhkNXZkN3RGSjB2bnQ4SXkrWXFYWjBVSzVEdUtsSm9XTkR6OVRC?=
 =?utf-8?B?OHJXY1UzWTY1Z3hxcjIrNjZ4enlJT3FjR2NYaHFpVnNtN0RWWUtmTmR5Q0w0?=
 =?utf-8?B?Z1pybWtCTFN5QWZ6SnkvZUs1U0dBT0kvb2MvelFxVFhPNWRjWHNILzBwdUwv?=
 =?utf-8?B?Q0REdlZsejQ1cGtHSkFMSWdZc0NDeUhXWnZPNmNvNjNmejZZbUlDclRpWEp0?=
 =?utf-8?B?My9VdnlPZGRUMlRiU0FKY2Y5clV0amltQSsxZTNXYSs0c2kyZlRoQnVTQUht?=
 =?utf-8?B?N1JkSXFYc3k1WlRtNkFpMmtVY1haQUdSVy90bkFrZkVhMEJrNnBJRW55UkpY?=
 =?utf-8?B?a0lKN0xKMEhybUlKTS9GUlJJdndZaE01c0pmamlOVnlDRGkzUGdKeUFVK0Nx?=
 =?utf-8?B?SXdwSFpzYjYzQ1grcWtDRWxvd1pXNnY3c3hRT3MwdGhBZGR5ZG9rTnZ3RlEx?=
 =?utf-8?B?Q3o0VEF3RlRkcWZFcUFwR0cxQkQvM1JaQW5VQ3lDRWUwckV3WUZycGVMby9M?=
 =?utf-8?B?bEpvSjkrUXlUZ3BKVjVWbFdjd0gzWUUvcG9KdWd5K2FqNDBvc01FSFBvUmZn?=
 =?utf-8?B?aU00NG96bThLWVBTaVlyMGl6VlhVSUp6OTJrdDNibStBR294RmdSaGZFQ3ZR?=
 =?utf-8?B?Vzh2akdNaG1xaXVWOW1oTUhKNEtUUGw0RGJLTHRtRjRlbjFTdis2dGZQM0FT?=
 =?utf-8?B?QTVqTHNYT0VxTWU0MVNidFpmWXM0dndnZHVUWWh6cFUreUpma0JmZEo1NXdG?=
 =?utf-8?B?RFFoS2pZMUVpVmc5SzM2eFZnRVBBQlQvbjZCU0pzMS9pOTUyenZBMHdGNERQ?=
 =?utf-8?B?VlZveWQ1Y21XOUMyMnF2a05CbSsxTmJQOXRlSGtPUGtxK2xkWHMzSmNiZUhX?=
 =?utf-8?B?dzdpaDlOWDNJSVFpMFB3UHBhMWJlaEJEZVE5RXdJVUIwWmVvai9aeFBlMjNi?=
 =?utf-8?B?R09YSnFveHdpNjR6ZnpaSm1tQ1JqSkdWencxR0w3M1FJejdxSDVNYWprRHVJ?=
 =?utf-8?B?V01RTXVkdS9VN01ueGdrd1JQL2tZaU5DeFA3QnRIUllNRDZocHd6S2kvTExk?=
 =?utf-8?B?cmtLcUgrem95bHFoUjNaOERBOE5pbVorVjBRV01VMFRubWQzdFRRak0xM3hJ?=
 =?utf-8?B?SkQ4aGlEd2o4bzA5Z2hTUks4OFk3U0dEK0l2ZXlMcG9jdmkxUFQ4MjRJQ0k1?=
 =?utf-8?B?eXZYN29RZld1ZktmN3d3NHRGRDkvd0d6M3RpWEo2VjNiaENYckFHNjN2NjNh?=
 =?utf-8?B?V2xOK1JZbGVvb2FBejZIaTB4c1QxYjc2aU93cE5ocTNqVlNHY2VlMjduRUNv?=
 =?utf-8?B?QWdNSzNzTkpFd011cFZUdXM4ZDBJQWdzM0JkOWE2SjFaTWRVcWxVVk5hd1Nw?=
 =?utf-8?B?T21LUjBPN2pOUVdhL21Vd2hwUzd6S09UekdaVERHNzRBNGNNeWN5RTFOSDE1?=
 =?utf-8?B?clhXUmxRNlB1VTRPQXRzMnE1ZGtldGg2RWt0NGd3TEx2akdFNDBpMmdIVjhP?=
 =?utf-8?B?Q3A0eWtlMkxaUmduT3c4SkdKQWhHM0tOSW9EWGYveDZGWDI5NUlhNUR0aUxy?=
 =?utf-8?Q?aPkqbS739mGvvYiHQGZSWIIYk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a41a5af-15dc-47b9-065d-08dc958f803c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 03:24:34.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebm0emr95wBFDRn4KR2xUuVcuaNDx/Q3svGPL9VX8ZFHnrGw/TtB3V7iB1zrlartZb0BkZm3vYfsF8V58rK6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
X-Proofpoint-GUID: HiKSQcbEd9wjw7ckVJk-QisZLi3IxFbQ
X-Proofpoint-ORIG-GUID: HiKSQcbEd9wjw7ckVJk-QisZLi3IxFbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_01,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=741 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45Q0ONYq016608
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Jun 2024 03:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8812

From: Mingli Yu <mingli.yu@windriver.com>

The previous ptest result show as =E2=9C=93 or =E2=9C=97 , improve the re=
sult to
PASS or FAIL.
 # ./run-ptest
 [snip]
 PASS: 6 basic container - dns itself with long network name
 PASS: 7 two containers on the same network
 PASS: 8 two containers on different networks
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/aardvark-dns/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-co=
ntainers/aardvark-dns/files/run-ptest
index b33d8fd4..d7abbb34 100644
--- a/recipes-containers/aardvark-dns/files/run-ptest
+++ b/recipes-containers/aardvark-dns/files/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/bash
=20
-NETAVARK=3D/usr/libexec/podman/netavark AARDVARK=3D/usr/libexec/podman/a=
ardvark-dns bats ./test/
+NETAVARK=3D/usr/libexec/podman/netavark AARDVARK=3D/usr/libexec/podman/a=
ardvark-dns bats -t ./test/ | sed -e '/^ok/ s/^ok/PASS:/g' | sed -e '/^no=
t ok/ s/^not ok/FAIL:/g'
--=20
2.34.1


