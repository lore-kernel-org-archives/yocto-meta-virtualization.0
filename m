Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297D5C64E92
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36738.1650262667231401800
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 17 Apr 2022 23:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SlGbuAKY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1107eb1758=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23I5mIat027789;
	Sun, 17 Apr 2022 23:17:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4uzA/BHsILMC6BM1xMg56Tq6qzmEJvape8XfVEVksic=;
 b=SlGbuAKYFrjznuMtSxFvhmtZrKeIzXAngv6dS3rhQp5Eq/LyAdks3hb2tf6n/3o7nvSE
 cqg86ZAaP6n6nm/WbPOCyhPOU+urIbJGOGN0VmaKJgNG2NEmsjXh6yf8aeilNOT6HFxX
 OVd7ukL60AbhW8gEdu2YLXh6J0J3JGsWcC+46/vErveos87IFnIp/wmM2l7a7fTtlDTJ
 0XFFbGsDqvVy28EMxyvYiX3uI4H7awDs2fYG5lQYugUqM2rscYc7JJYK4lFbN05EPehk
 F+SlumY928J13txYoOs94/LEZodI1pTPirDLBwhDAeFr+9zpz73TIntwJxOUvw3SSeMa 7A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3111tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Apr 2022 23:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQZyn2B+xgj4zGikSXuL4GFdkOybLIHpRSx33ga49HIr7xCzld5GJ6bLqmd6Y0ubLp1jC4RpraWSXpDHaktZjJmIhspfBpd74jD04XpbfPVgZQDjuY2QUQraAqdAicTDMp5BJMEtU2Yx4t6dlGuV/6WdGavW4bcpJOFiOQVeYqm6o2PWQMWEChCTxVP/NEPM9O0Es3KLjthaSG2RX1+OsMBO2yTKjF40BlT/AJsnnbXaWmUmrHTCYheNIJigi/mrBNBDtw5OE13BEiQOjMUjgqRsptswdGqe8KDDQ029Ab0JPQkkDdj5pZKU2iHRwM1iFquXGeZo+dknQ/Ln5+71Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uzA/BHsILMC6BM1xMg56Tq6qzmEJvape8XfVEVksic=;
 b=Irg8cfWD3+MsBVELzpYiT4yhMEvD3qizMNn+SVvjIQg7YrpdemXxspmjOibS/uOYfKovHVpD75VwOVc5iiJTAfoClrELFCk0MX7gbPyvn9RElJy5sgVZRCjzcmhv15kA/tUhFplI+sfetUaX94VFVbC8RnwGY04FBn/cgGkIGmLWqMwgPC4KJ7jqGmGml+KABDQRtEHvorlNrkG3P/gGJ6EC8XbQqVDSlax8yUFuEl1hLe6ghsMu1dWcTCq0gvMgJjjwzFl52fsG2kOommJXrQXr2Qj3Sj/DxDkY9qZdUWlSOBZyN5K4NuQ0L1WMOqIxXZeEMvJlxJVllicCGUCrzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB2898.namprd11.prod.outlook.com (2603:10b6:208:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 06:17:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 06:17:35 +0000
Message-ID: <5763bac9-78cf-97eb-1dc6-7db16ab22b34@windriver.com>
Date: Mon, 18 Apr 2022 14:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-virtualization] nerdctl
Content-Language: en-US
To: Joakim Roubert <joakim.roubert@axis.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
 <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
 <167DCA8D5023C45A.28983@lists.yoctoproject.org>
 <CADkTA4PMFz8wa-huojDvsOOYCTPFt3sEXqLYmTTMMtkcNs3Scg@mail.gmail.com>
 <8cd4d50a-4e1f-6f67-727c-e2ca6fbcf5c6@axis.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <8cd4d50a-4e1f-6f67-727c-e2ca6fbcf5c6@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfac1e2c-3917-47b6-7906-08da21032141
X-MS-TrafficTypeDiagnostic: BL0PR11MB2898:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB28985771BE014E327A901A80EDF39@BL0PR11MB2898.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	emtUeDKMOatH+BUQWq7mjZfx2++Z0JSNTlMn2I6U/RhFTMfA99B/+fVVd7S7UTvczXk6oi1NuKnvm0Ug/8EFVnfj8m75tEsoxHajthNs5/h6em8vE1iepICxUXAK/BVILn00dCGU6FzHruAFpjGUocqtsuPKxRJxTgC//JSYZBgcQGJy7/cnB1DOWLdcChA23CZmEEpPHZ8gW1TM7PxBczlQTZ0b8Y0+Ry4JrRoGrlsSajgG9iSAkNvlOphqZZQWWHXvePbiQgHjcaVAkBVFEVOtfrlFL5gktuKl9ngNRluvTGUwsDO/UCCyo0MwRegblcv+e72zNyW74O47RIpfr0LX21xo//wlSavAtkJpKHZKICo2TGd4+ijI+UFpmw2T/IO0HKKLjQi8DazRvG9vAebFOSgx7nYrsUBEig8K5gK254GbBpfRarb2ZOG3QF5zTZ1+Ex+uzktSskqnbrvs9gNCySZXbjCy+LbHh2ne+RY2Rn/Vj3ahZR+SOguVV1iabF3xFEHLmHlnXs4U2q7RqKiiWtKTA3nPm8PXJ8udus0iI5VmYGM8ndzftGyP8xffPNgqLcoS30uKBDTooPcUfZTWSnw+vOHFT/q34baQHRB3uyX2p8kB7oS335ku3cY1mBYk38/4yUzRYApC4z0OdskdU0cbYrOa7GSoxlnjohETz+EySap9EAUgPyV3i2HrNTMU6el1HGhxD1WX+vDwpB21OEJx5iWcxQ1oiu0fecA+QdWCxLwcAfmclAVv5EmHRHVRz7jM4XQdeYlWbJVgs898hlAMNntvpEog/lxzhgYZad9+DeXaFCNiVJo/7n7sBogmZFWEO6SL8iQkUPE8mxyrSVjtajjulM/L/JKHMxzX2FpVdwa9RfAC/g4NDJhngERrdE3a8UR6dxtV7+cGJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(508600001)(66556008)(52116002)(53546011)(31686004)(6506007)(316002)(38100700002)(83380400001)(8676002)(66476007)(4326008)(5660300002)(31696002)(8936002)(966005)(66946007)(36756003)(6666004)(6486002)(86362001)(2906002)(6512007)(26005)(110136005)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0wyWnVDTFU1VUtjMk0zNStXN3krQVhSZmtFTjh1bDJhdTFpRjZORkgrRWRR?=
 =?utf-8?B?b3ZJWFNlZld3VHRUNzF1a2JlVHNzM0dGTk1wcU40akpmS3lKbjAwTTN0UVdt?=
 =?utf-8?B?Z1I3NkRXT05FYVNXU3R5OHRzRllucnh1UWMvckxMQ3BKcHJnbEFaaDRnK1hC?=
 =?utf-8?B?dUZGbXZ4R1RJdmxscVBSMEpIdGxCQkZxaHVBTmQ2bjBKUVEzeVI4RWpVSEg3?=
 =?utf-8?B?amhJNlBmd2w4SVh2K3hJUVFmU1ppQkpUTjcyRThVOEdENmZGYmRjb1dydnov?=
 =?utf-8?B?RUdsYUN2SWhyMzZDR0FOTmU0MDBCT3ZCMFZzSk5zYkpHMU9MajFza0QwaEF3?=
 =?utf-8?B?VGZCSUJSQlJmMjNqSkdFVW5PMDRLdkx3QXVPZFg4d3NNdmFsY3ZlcHVyTURa?=
 =?utf-8?B?SmlueXV6cFNFRVpWTHRRdlFUSHlmcVhCdDhzbjZnZU1jQlBUZ0Q1Qmp5Uk1h?=
 =?utf-8?B?SFNiK25QdHNyTExZODdVdFRURU1EbHE2TFFjYlVOenl4L2dxWTJWRXpqalhz?=
 =?utf-8?B?L25nbXlPb1RjUlYyNGtUNXVlaFZuRHUwcGZMS1BiVEVtV1EyV29VSlRWYkpk?=
 =?utf-8?B?M3ZwbU53UVBxb3ROTFF5QVhTKzgvR1pWVm5YQVcrZlM1VHlSenArNmt4UVE4?=
 =?utf-8?B?UlZvL0hCM0puc2lSSEcrRDVSaXJ5NUM0RTdZdkVFUkxRWXNGTHYxZyt0ZStX?=
 =?utf-8?B?TlJIMEVRUEsxaW4ydTlpTkgwZzlLU2xWR0RFTFBNV2VOOEtGZTlxQXlDTnZ3?=
 =?utf-8?B?U1RJTGoxYjY4MTlKQy9XM0tWdExtTFdZNkFzTW1KZ2tsRDIvZWxURk5yMkJB?=
 =?utf-8?B?YU14VFB1VjE3ZzNUK0FxbmNwZUNNZmpzRlJsZ3d2RmZtRmYvRnZ5Q0U0Kzhw?=
 =?utf-8?B?QkhIbmJFVFhQNXp4TFNoWW1sOTV2YUdVcmp0bTJHYzhKWDRab3FVQko5ZnFT?=
 =?utf-8?B?dUNPQ1hMQ1NNMW1Lc0NwRVFuNnRiMmQrRi9nRlhadm8wbkdxZmVlb3lEcjV4?=
 =?utf-8?B?djUzQTJxNmJ1RzhqdXM0ZXdkY0R5cWpyNmowVUpzdTFuRHlCMXBNOVRNeTBE?=
 =?utf-8?B?cm9nMG1xOUplZEVQVEVwQzJFWUdJWlJlWEtQRC9TZ3ZlMXRzaitIbmRCUExJ?=
 =?utf-8?B?YXloMWhtRno1eE03THU5NEI3cGlUWHBFaHM0OXJiMm5VTnhDU0tkYjlpSXVh?=
 =?utf-8?B?R1NoZzZPV0lZeStYcWN5ZTJNZWdFQnl3QmxvaGYwRk8rcnhBK3E1YnB1THhE?=
 =?utf-8?B?NXJhd3R0aUkyMVJMLy8rWm14bW1FRlIzU25GZVhtVW5TL0JUcStSTzBkSzRG?=
 =?utf-8?B?NWxwVklnSzIrRkNJcll2VVdGWmh4VzdVUlppekRuK2pzTEY5cWVwTllOUnBw?=
 =?utf-8?B?a0diTjdnZjZtVUFEODRoN0RFeGx4VzNVSFowZXJuL0Y0bUdVa0U2dkJWQ0Jy?=
 =?utf-8?B?d2lmMVFlOUJDYXd0ZHZtZWw1YmtXVHQzcnBKWDZ2a2xpODVGUGR6RnhyNlRR?=
 =?utf-8?B?VzZXcEY3a1JialNiMEdvb3lSNVhYakY3bGtQMjlVNzVtVzlPekVDNjZFRVN2?=
 =?utf-8?B?T1VEQ283ek0vOXR2blRGVmE1NG9HL1FjNFRNaU1qblRRN1AxRTlYcFZ1YzBz?=
 =?utf-8?B?SEdFejlzYytrQ2o0eXV0K0pXMlY5RklSUFk4Q09uWkFnajZyMzNjR05lN2dU?=
 =?utf-8?B?WjUzSkc3cWlkczNseDBuam5oRktJdlc1MGZSTERzVG5lQWlhVEkrdVlLUThh?=
 =?utf-8?B?bERLQnAvcVk5b25mbGJJcG0wZW44b1paSHNXNWFKTFJ4UEFCVkZuR1F2Z2w2?=
 =?utf-8?B?TzZqRFZ6VUtFVTBsRG5uZlRveWZ6aUx0bE0xZS9hdTlBYWhUSlBMRnhyWkh5?=
 =?utf-8?B?L0pyWGdpLzJzTmZrbFhHWlNuWWsvWG5FMTQrdi9nTWZKL1czdWo1d1lEQUll?=
 =?utf-8?B?ZWJqeFNtT2FvUXRERlcyS0d5NHMwSWxMcUZyZTVUNHo0UGpwWGZkNXhNNENy?=
 =?utf-8?B?VmlVM3NLa3U1cHZqbFV0eDVtSWorS2VxUktUbEI5eFU0MGJ2Qk5Xd2pidDZR?=
 =?utf-8?B?OVVPbVBhU2xjcWx3UWh1a1BjR09FNWhyUktZbTM1SHhkNHRoVUVQZWh5T0VT?=
 =?utf-8?B?TFUwSjVOdHAyMWlCY21CdEFZbG8ycFNmQ3FuaXJ5MU9Qb0RWeSt1bEhHa0dY?=
 =?utf-8?B?bkd6ZFpkMkxCY1E1Mk1tbW54WnFpSU10WW5GQ0tFdE00K1dMc216SzZvcWZz?=
 =?utf-8?B?SjZQSzVHSHVES255cGU0QnNHbkJsSi9LOVJtMHF1K09jV012ZHZJN0Z6QWhT?=
 =?utf-8?B?WGtBU2h3S3lTemJ4RVV3RGRzTlQ5ZnJjVndsVGh1eUVGTXJ0VFdLeEd5dHM0?=
 =?utf-8?Q?6rKyREgLWau5BsMI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfac1e2c-3917-47b6-7906-08da21032141
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 06:17:35.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nZZeo7jfsfMD7oQGOCiOGIRe7+WWHECI3TGkYLMs04GG4Vgj0y41R5e6knC/DInRD8Gi8xPriyldCJYKNxjyYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2898
X-Proofpoint-ORIG-GUID: RtKDhCruSR7ak49l5uu963LADR4RWNP3
X-Proofpoint-GUID: RtKDhCruSR7ak49l5uu963LADR4RWNP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=872 mlxscore=0
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204180036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7181

Hi Bruce and Joakim,

I'm recently looking into this nerdctl recipe. I'm kind of shocked by 
the SRC_URI number in this recipe.
Looking at the discussion on the mailing list (go.bbclass: Allow network 
in do_compile), it seems that they are needed for offline build for this 
recipe.

Bruce, how do you get all these contents? Also, how do you generate the 
modules.txt file? You mentioned some helping script in the discussion, 
what's the status of that script?

Joakim, maybe I misunderstood it, but are you still working on an 
upgrade of this recipe? If not, I'm going to try to do it.

Last but not least, Bruce, thank you again for making this recipe work.

Regards,
Qi

On 3/7/22 15:30, Joakim Roubert wrote:
> On 2022-03-04 16:48, Bruce Ashfield wrote:
>>
>> It took several months, but:
>>
>> root@qemux86-64:~# uname -a
>> Linux qemux86-64 5.17.0-rc6-yoctodev-standard #1 SMP PREEMPT Sun Feb
>> 27 22:36:33 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
>> root@qemux86-64:~# nerdctl --version
>> nerdctl version 0.17.0-10-gf2427ff.m
>> root@qemux86-64:~#
>
> Really cool!!!
>
>> The recipe isn't available yet, since this is using a huge amount of
>> fetched go dependencies, using some new scripts/tooling that I created
>> .. but at least I know the approach is feasible!
>
> Excellent news!
>
> BR,
>
> /Joakim
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7078): https://lists.yoctoproject.org/g/meta-virtualization/message/7078
> Mute This Topic: https://lists.yoctoproject.org/mt/82714461/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


