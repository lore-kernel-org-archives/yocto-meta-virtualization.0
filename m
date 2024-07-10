Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D050C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 05:39:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7398.1720589977017075524
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 22:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79219ea4b6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A4iJ8u021923;
	Tue, 9 Jul 2024 22:39:35 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170ka49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 22:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOM6kPDunCIk3Bt4cfaJfweole909e8k3bCjSbIqVydM83pGIbxB4jOy0Mh/zgXtoX2aP+7uwkzMCuCmmbJMY9WZdwdSv9Da7trcxsTDnNMsnmFsfRdLPV7CYldUGPVoSMpPWvgcUGwGsl5LlmbJDe7kMpD4GwhljvY8xEsAAZEYVV/e1I9vU7vMzUwpWJJoKrhVnlyerwsYm0659tAe5UQKt6VDR1haq84gWIVHrT964GgVe3o0L1CKn+thcd9zAzZBB+5bvJbKcewrs+3KHl3/DmsX1UzqIpMPor2O/iO8wnzJP7HEy213x3ImWiGU+CM+v0uYl4Gw3IsebzFjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbH9LRl2ScM24hcw9VlFMe5Fy1K044cmssyD9NBlB04=;
 b=AFDvVMozA9ZTGkjpjjzkM/L5+LkQufMTv0/oifmMR61V29rOMmoWp870RBBLZarqrD6JtXjdmISHxGL90T4Li7v9QHQNcdSla04Y2tNsQuEOMC9yFip1FkMgwysRPRLOrxqNrp7ix5kvJKaPW0BGlkPE8yvM35mRDFBfHYISRPdIdJ+MqrR/HkmcxB6PVwA8o8l2AmpaNCqRIJfzkO1jfc7lX+UXx+FQ+Qy/QrcuYL88gb+xtmC6JWUMvTdS/z8alaudyvkEizJCwYs7XYl65jN0J0EKvb0P+vltlPti7QN5t7pq+Dh7SS5Z2xOJ5ArtEM2ErPMSctMeKJWtJojtmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 05:39:32 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::ac1b:a129:7c3a:1f0]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::ac1b:a129:7c3a:1f0%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 05:39:31 +0000
Message-ID: <85009d84-9439-4536-a7b8-4524c227323d@windriver.com>
Date: Wed, 10 Jul 2024 13:39:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] [PATCH 2/2] docker-distribution: Use dup3
 for riscv64
To: Bruce Ashfield <bruce.ashfield@gmail.com>, mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240709101657.601908-1-mingli.yu@windriver.com>
 <20240709101657.601908-2-mingli.yu@windriver.com>
 <Zo4Gd0vdkTVYgN5A@gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <Zo4Gd0vdkTVYgN5A@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5014:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: c775232c-7641-4077-717d-08dca0a2a0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b01LZTNMdGF5TXdWQlpybEJjNjRmMnZ3YmMwaEJJa3NBODhBdWE1eXAzeVhB?=
 =?utf-8?B?NStnSkNEVm1qRTF6OTZnbVZpUFZyM202M0VOUHF4dFJDQjU1WUhMbkYrWFdM?=
 =?utf-8?B?OE56YWNvSHFZc3FLOXBJc1kvVTRHQkRvMnc0NllTZlpWbVdkeVFDZ1RnVmYy?=
 =?utf-8?B?bnhhS0h3bzRvSUg0eTJmTjZvMzVUNGdhVTZ4QlMwbnZNU0prZ2EvTlduVHlj?=
 =?utf-8?B?R29FdDRxTURxWUQvSXpCdnFEUGNJZEJSTTVmMkNkOUg1S0g2eHZTUnI2OTFW?=
 =?utf-8?B?dkRUUlBWVWtxeU1yYVRBNzMyQlBnaC91eWh1aUxZNzFnUVQ0NVZvYjNKL0U1?=
 =?utf-8?B?SHFlKzdycUdubEFxZTNlbkh2T0t5RG1ERXpQdHVIQXpiS0ZIYnl6ak9KU3dN?=
 =?utf-8?B?SklXVDRHcmxpQytHbVdJNVZibk9lNlFTRytlVnRGUDBmelhwL1pWb0VZd3pa?=
 =?utf-8?B?Nm9aNHBvZTlHV0NZUW1LaDhZRDVpRzR6WWxmZWdqUklpaXJxeDU1UVMwU3g2?=
 =?utf-8?B?dklFVDBYK2tGalVITVFzUzhoUFBkUDZ1amJuZGxwSEFnNlVGYm1VTFQxeUVZ?=
 =?utf-8?B?RldHYVBNQW1USHFOVUVualcvcTlFMGk2S21nREF4RHNna3AwQU5rMzB0WlZ0?=
 =?utf-8?B?cVhUZS84enMzUS9IVFBGYVNuRS9ldkRHRGRqMFdwZk5DYkRTS0E3Zk9VaFNu?=
 =?utf-8?B?NFRyY1NjcXlaazFveE1TLzVyZ1ZzbUVDSmYrQzFGck5TSHVBSzAzMW0ydmhS?=
 =?utf-8?B?SHRxc1N4Z25ZUEJmMFdGRStUcXRBTkN0YzY4NEZGaTdycWRXQ0svYUY2TXF3?=
 =?utf-8?B?NkxHcFFVbC9pUmVKQW1zcEVhU3ZiTHUycnlJYUREK2c3L1VXd1luRENWWVZy?=
 =?utf-8?B?MXFUMDRlN25PUG5OUmpLNVdlb1lwZXBhdUxzQnREY1UyRU42cWkvdisrNVdB?=
 =?utf-8?B?MHhpZlY2M0tnMWFxZyt2dWJaUjkwZTVhV2VyZ2RqOVBGREVxOHVwditIUWJY?=
 =?utf-8?B?d3ZwTXNzcEt6S2ZaeFRFS3U5WHNnc05OTXhzNVg0cHAzdnBaWG5VSjZDdFlu?=
 =?utf-8?B?TFBKcEVNMWp6YUh0SXdHSGRFb1RPcTVVbWNSd1JrT0c1a0RhdEJReDNEU0pv?=
 =?utf-8?B?WVFpV1ducWhRSzFJL2prQUloTklPeXptYkh3dWNTeDM1S1ZERmF4NDlJWmRz?=
 =?utf-8?B?YjFmSGM5K3M2VGo3L3kwMVFaNStkSGRZenkrY0t6OTdEV0J6OWdvTDZZSEZq?=
 =?utf-8?B?NjY5SHpTajNwdTQrRmFIby9ZTUJaZXR2SUZXS0tnbFl2SjdoUCtHMzBsa3V5?=
 =?utf-8?B?K3BaUXZzZ3owTndhQyt2RktTbHd1cXBGVE5PNmJ5N0ZMblJWdzYwT2llRERl?=
 =?utf-8?B?UmNJRG40L0FEUE1wdUIvcmt4SXRZdG5KMEY0cC9TT2dJLy9Cd3RpYmZuSDRt?=
 =?utf-8?B?WDJ2WkpHeVZFMEFQcHk1Z01lZVJyOGNOK2F5K0ltUXhkNHNxVjYzVlROSHVY?=
 =?utf-8?B?TTVDRUYvbzhYU3ZyMVBqYzM1dUZGc3ZRbVUzTHdhWjlmUDBXdnNFbWhjS0h5?=
 =?utf-8?B?TEpUbm5USStmbmxHaDVxVkdTQk1PNGJ2MSthTmVVZGFOdEVZVVJZQWl0eW9M?=
 =?utf-8?B?cVZMZG9taTVhYzJuNTJwYVRQanpwOWtBYkR3a3JIamkzVlZyUklERHZzQi9z?=
 =?utf-8?B?ZHYvTHJPbVVvcUx2NFQ2eTlWQ0FCeU50RWhiaGRBL213UTZLbHpFZ1NPQVJY?=
 =?utf-8?Q?/pNHwyZGF06HUuEpxc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2gzejZKcE8ySFpuTTlLekdiU2l4RHdnZk1FWlFRTEpJUWRabTlHQ1loeVdL?=
 =?utf-8?B?U2Jpc0FvMVdiR0hRMFJNYmQzVUpoZkM2ZSt2S2djSkZsU0MvUC9RSVpobGdp?=
 =?utf-8?B?SUd1eGhmL08wRlpETCtTVy85eTBycEJQY3cxd1o3SUkvQTBacTFpcFR4NzJx?=
 =?utf-8?B?bCt6ajVvYXdZeEtpSmhKWHRaelJldFdRUlNpcG5scmQ3L01wN2lKVytYUEVx?=
 =?utf-8?B?aFJ2TFhIQkRJbUtPYjkwS2hSSE1Ya3FjVTl3bWVYYkM0Slovd1pSaTVDeGtt?=
 =?utf-8?B?ZVZtSnpJMFV0U2RXMjVRWW9FL0NJMXNPeGJwUGVjTUU1NUNpNHBMVTFMSlRM?=
 =?utf-8?B?NStWQVZodmRybjNEdXV1U2pKQlhoZitZY0xzaEFDQU5vNjNmZjFpT2s1ZnQv?=
 =?utf-8?B?L240QUo2M1hmWVhCcnl2eEVMdlZZTVhoWWlGV3ZUak9YWC9aekZqZGpyR1ZQ?=
 =?utf-8?B?VzZYQkREdVF4d0tSbGZkeDdtbWxRcVZnUlVnTjdOMEdJUW50UU1JaUszc3V6?=
 =?utf-8?B?eE14UnNkUmQ0V3JtbFg4L3JybFhzRmI3NXFrNEh5YkFXcUwySGVROXZPdnEy?=
 =?utf-8?B?VUtLdVE5eFEyNG10N28weWFSRzNUaW1XNDU2Z3R6ajN0QjZicTcwVTNCQkJ3?=
 =?utf-8?B?aG9jaHl5S2p0SnZleXVBZHdmTUNUa29SZHdqS0V5bk1RVjltQlF3ZHUxV0M4?=
 =?utf-8?B?dGVYcGJlQXVEc1VjTWdXTDJHNnAxMzBaTDlBL2ptSGFuMUpJOHgwQ1FXenNq?=
 =?utf-8?B?MXdhMVZkY2pGWTNKSjhaZGp4cmpOZU10dlJoNUJCNUFXWk9DUlExUjhhMHMr?=
 =?utf-8?B?UnZwQ3VacklrbnQrSTJGS1lCNWhzbSsxdjZMM2h1czB4WFluQm4zQ3kyb2pC?=
 =?utf-8?B?RFRhdHFFN2FjRllqMGtGUTF3dHE3dUZ0bitESjZvclRwZ0FHK3U5Q09YKzcv?=
 =?utf-8?B?cXRGQko1MDFacjVBN3FJZFp6RjQxWXFxZlplSnM2SGpvUWJjd0dNeklGa3FU?=
 =?utf-8?B?RzFLejJaS0RMVkRFMjBqSGlCSDlTaVJSb0YxUEdKMEFuNmNZdVBPUzVaWFpO?=
 =?utf-8?B?c0x1c3U5UEgxWU4xVnROODk1NVAvdENxdVRBRVNoQkR1S0VzRXNDWTBwcUFQ?=
 =?utf-8?B?ZXp2RXFXc1RDWWYwbXE1d0lPUTVKL3p5WGQ3QXlSMDJkRkM5V09sdDZ0L24v?=
 =?utf-8?B?amdpZmRLeDFwRmFzMzRETTB3TnM0K1QycmhvM29pZ21aUVdHaHlrbCtRZUpH?=
 =?utf-8?B?V1liaTFUd0pGMFlUNVhwS2dCckZ1eEdvT0UyU2UybFVoRlBVMnRCZFNrZVd6?=
 =?utf-8?B?ZDVRTllLWFZJcGxVdHB3cnhjb3E5dmo3aDkwcHB1d1pyNWlaazdsUmE2KzdF?=
 =?utf-8?B?QUNGMU1iR0xtNm1YbzF2dWVqMVJZM2RDTXFyQkhwWldGb0xjdWFkWVhkZzhP?=
 =?utf-8?B?OEJaRzRkQzFWc2Q5NDVwUE55dG1DTXhoQkFnRURtZlEwdmt3UW9RUk9mOS85?=
 =?utf-8?B?NGhuTGhjNkF6ajhKQ0tpQ0JrSVRWcEtxWVpIZGFNRms2aGl5dXJuMkxLUkIx?=
 =?utf-8?B?azh2UFcyK3RmZlB3UndEMjBLMGV5Rm9DZUpiMkFLYU1DeXhkUjNOZG41THR6?=
 =?utf-8?B?QTEzMGZacmxVT0E5NXc1SVRtZ0x4cTFiUlBXSGh6TWFrSHl0dm1tY1NvU0xF?=
 =?utf-8?B?aTVLdVBDNzQvc3pOZFlkNEhmUUVid0VDT2ppa3MvT0h0LzI4d0JxUkJYWlAz?=
 =?utf-8?B?ZFJyUnhnTHVhQ042elR4S2dQWWJlZ2xkNm1uVlJJZlNmRWNRTlNrZlBrMmhV?=
 =?utf-8?B?SVYrWWZ3M2lWeEtPTUdNazl3azI4TS9YS2xKdVdRcGJoTFNaUDdVay8rS2NW?=
 =?utf-8?B?ZlpmQktSNVAwWUhQWHlWZVQzbDZsdlJzNnBmT01aaTBkVGYwMW81cEhBcThi?=
 =?utf-8?B?cGEyWTFhSHR6dFhQRkhGdi95ZlpXVkovT1o1azd1bjUyb21xOUgzejdUOUNL?=
 =?utf-8?B?L2E4YWNycE8rK2RUcjRObnU3ZWJRcXNmdU5TZkhyWE5qZXprVDgyZ2FzYVVO?=
 =?utf-8?B?KzYyUHBMeUNiMVVseHZsWjdHc1VjRGEwZWxVRXhBelZXaWltRDJsZTc2dUxW?=
 =?utf-8?Q?vCqu+01pPbjATmklTIy4rHL9l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c775232c-7641-4077-717d-08dca0a2a0c5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 05:39:31.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0CrxjF9nJkppA/nJ30VAAcNt+SMlW+9GfR2zCNCya76suL2G7P9AKJx2C/Ab+LlWhaIQLKkU5tV6FQySWCAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
X-Proofpoint-GUID: u7whQlqvKN-iFWUy6XwtO_SNI6zOHj2Q
X-Proofpoint-ORIG-GUID: u7whQlqvKN-iFWUy6XwtO_SNI6zOHj2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 05:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8832



On 7/10/24 11:56, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> I'm currently going through an update cycle for the meta-virtualization
> packages, so once I've uprev'd past this commit, I'll add patch 1/2 and
> test for riscv.
> 

Okay, thanks!

> Bruce
> 
> In message: [meta-virtualization] [PATCH 2/2] docker-distribution: Use dup3 for riscv64
> on 09/07/2024 Yu, Mingli via lists.yoctoproject.org wrote:
> 
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
>> to fix the below build failure:
>>    vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../docker-distribution_git.bb                |  1 +
>>   ...-panicwrap-Use-dup3-on-riscv64-linux.patch | 42 +++++++++++++++++++
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
>>
>> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
>> index 4e64df4f..bb4a7cbf 100644
>> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
>> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
>> @@ -7,6 +7,7 @@ SRCREV_distribution= "d607c6ccb9372e05556624f973119a23d3a42987"
>>   SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
>>              file://docker-registry.service \
>>              file://0001-build-use-to-use-cross-go-compiler.patch \
>> +           file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
>>             "
>>
>>   PACKAGES =+ "docker-registry"
>> diff --git a/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
>> new file mode 100644
>> index 00000000..753afef7
>> --- /dev/null
>> +++ b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
>> @@ -0,0 +1,42 @@
>> +From 21d54c68751760b1f8915807794a432cf01fb733 Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Tue, 9 Jul 2024 16:28:14 +0800
>> +Subject: [PATCH] panicwrap: Use dup3 on riscv64 linux
>> +
>> +Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
>> +to fix the below failure:
>> +  vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2
>> +
>> +Upstream-Status: Inappropriate [The upstream has removed the panicwrap as [1]]
>> +
>> +[1] https://github.com/distribution/distribution/commit/3e4c4ead4c3aa07c27f95f2a5c92c6d5c2f9dcdb
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + vendor/github.com/bugsnag/panicwrap/dup2.go | 2 +-
>> + vendor/github.com/bugsnag/panicwrap/dup3.go | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/vendor/github.com/bugsnag/panicwrap/dup2.go b/vendor/github.com/bugsnag/panicwrap/dup2.go
>> +index de523c83..c68ce5ff 100644
>> +--- a/vendor/github.com/bugsnag/panicwrap/dup2.go
>> ++++ b/vendor/github.com/bugsnag/panicwrap/dup2.go
>> +@@ -1,4 +1,4 @@
>> +-// +build darwin dragonfly freebsd linux,!arm64 netbsd openbsd
>> ++// +build darwin dragonfly freebsd linux,!arm64,!riscv64 netbsd openbsd
>> +
>> + package panicwrap
>> +
>> +diff --git a/vendor/github.com/bugsnag/panicwrap/dup3.go b/vendor/github.com/bugsnag/panicwrap/dup3.go
>> +index 9721b36c..c664da85 100644
>> +--- a/vendor/github.com/bugsnag/panicwrap/dup3.go
>> ++++ b/vendor/github.com/bugsnag/panicwrap/dup3.go
>> +@@ -1,4 +1,4 @@
>> +-// +build linux,arm64
>> ++// +build linux,arm64 linux,riscv64
>> +
>> + package panicwrap
>> +
>> +--
>> +2.34.1
>> +
>> --
>> 2.34.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8821): https://lists.yoctoproject.org/g/meta-virtualization/message/8821
>> Mute This Topic: https://lists.yoctoproject.org/mt/107119845/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

