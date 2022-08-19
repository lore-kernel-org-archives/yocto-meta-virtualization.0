Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9AFC28D13
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 22:48:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1276.1660949311268873278
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Aug 2022 15:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O/ch79sO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5230d6c6ac=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JDSJaD014788;
	Fri, 19 Aug 2022 22:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=8DgwrXxZ3JwabIOCcWH0xr8axsccbj2t44M2WccVIos=;
 b=O/ch79sOvWr+dLp2yNc2t+/+C9l7H0fnwqf5qsm/YiYTfqY1kQ8b0Ua1Cg59wK9Lz2cB
 z9qbAa/C7HHa7iw5aNrVr8cF+Qfnmwy76QzLZDfxcisNvNh6/djpjDlyv+hKQvAkKxS8
 5zHtJiBpGQywexZ87t68jW9SKH49WFMPhm+jh7PVWhExJpeR8xxQNLY0p1hmoQiUSi9w
 D0ImP+bEymRJ+lEXuXSaP+R9ge2mngH7TFETGl4c4HV8g5JWIyTfNBcy2jyrtvBqFG5d
 YhajLYU2ddICSk6chQewoi1gBo8LMONy4OFnDfyQ331p0Iat1D44CQvej9foKh365XeZ bQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160wwgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 22:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQOfQWl5TYMrHrLoh7eQlGf+uLISLc4cjgc5IxFWEBWCz9NN13/GDJ/retteeEIDyhIlkEtZbqQfrOINyLPMB9YpC3OroY1JS8mtXfiHOlNPd8diW+h48l5ycNnKVO0EJFY/Q0ox9KGjB/mSh1NDVmz5GO75U0TxNWIsDkcq7N1TGhWodUcparNW2obHQGkXR4KqgFXmJNNMkhjseYdN2+6voSb9EyygonH7qARfFAZcGk9HINd80L3I7J4x61ihYIOK4nMtFRzrf2de2Zw9snhu4JpnO+8NFOI63iiSPIyttZ3APbnbUM735Uul6PMQGV9rkfwMFVQY+c7kcEd8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DgwrXxZ3JwabIOCcWH0xr8axsccbj2t44M2WccVIos=;
 b=iMCznetEwHKesZj3RY26F0yx7+FDXQUd/RpcTZeu0KZ10j3qEKrJEm9y0513eYQ1e8BngabFU/VBY39dnSUHx4HQTwiAeTQgjL2qIAEbzcm/qTKWEgFbgMFMO7pibkMMMJuTVsH2gyAL+Kkh1U1sMLWchPjEVY5F+w+SricjzAoQu2l2nL4z6JyWy0hXN9RI3BDu7CYmEUHkinLqkoOyqUbMreG4JL4vzXhcxpX/+HbpA//ggOdEE/FC5W1G65pFq39whAFvGM+JWc1FVnBfCrfDp9n32CPo+HWeSRzfv4QDEJdGAxazw77SH1Rc+NlFzEemx2JKqVM/bfpUMC3qYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CH2PR11MB4359.namprd11.prod.outlook.com (2603:10b6:610:41::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.22; Fri, 19 Aug 2022 22:48:27 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.027; Fri, 19 Aug 2022
 22:48:26 +0000
Message-ID: <a4e9265c-0a69-b5c8-6304-876a05c52bb1@windriver.com>
Date: Fri, 19 Aug 2022 18:48:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "Slater, Joseph" <joe.slater@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CADkTA4Mrst2j8A5RJNYiV_QhrFQY7X-wdjsNXqFBHboR4GXfKg@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4Mrst2j8A5RJNYiV_QhrFQY7X-wdjsNXqFBHboR4GXfKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0231.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb15ce7-0bcc-47cd-ae97-08da8234eddb
X-MS-TrafficTypeDiagnostic: CH2PR11MB4359:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bn+FIjnhj1LGr6GBymqU7ApkF8Q6NvP0mIlOqpADQHNDMxkWIHsSRjlnp3/YLa3A3OPhwTumfWUwaMSNg8RjrmWBcygCjHBhIWPnYjeIKBboMnxqQb/rgmLZMAiYwEPZI/YPJgJnhIXOWh71itwj3mkw7U78+JqhKge1L8d9pH+5dIsQI6XAA6XwITp1XemRM4hBEEXmBTOr8zWtViyOk8m8qM3Wnjx2tVkMUXP59kUIuaZGRDANO2SmSJcqMSx9KvRaN05cfkSIbfXaO6dI+C49F1KdxJ9bYnyV92cuPFF0usMVU/T+c98V1l7wJaVFylm1TrxReyZaKlwHNVwhyy27Lw8x/ONjIfebR8JGgvc5EKk2ZvpAGhNLBhe4nHMmYuRtTJESoO64ZPjhOnzoLaS0vmHGPG1gfCw/rvJ5x9wqmbGxyo1ltPRFQXJ0EHoneLZmiklUKsiHXv/dQpYk1WN+FtyHazqxrTdhTDuQJoqCy7kRKSOvWVzdq/pIkYKsFWRSGPixC2YDSOPDqcT6gaGDlehGqltQstL4tNNmdB+Yavbf1n3hSVSCeCt5oQx++tse8irim3nXrj+yJbn7oTjBjp1JvzdR6a1vCcE9taOXS0fXmUqWBlrJjDlnn9yXmIdLQ55GzxxKw3bxd1mSFX1ZEXayj0mn401K5lxERAutwc5Rl/ebiFKlX8HhMr6c3n0VXa0N9rsER5WdeE9yfZ9xybxdL2s8JV8rLvCXuK/BWb0o+bGpZY3aI8aIA6SfY+sL7PaZSQq3X9bOV9K18P0z8L0JVWyMsTNt35CwuaRzNfqPtsfQ1xT8oNeUyTl5ccnA3on0XkgHBd8CXKNJfbtZVUK6j4mBCmbp4qH8EMsfcWKuOJrhUBbvc60fFfpL3YE2birFNIaxj0oiPKOdaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39850400004)(376002)(346002)(83380400001)(316002)(53546011)(52116002)(6666004)(6486002)(6506007)(966005)(478600001)(31696002)(86362001)(41300700001)(110136005)(6636002)(26005)(6512007)(2616005)(186003)(5660300002)(44832011)(31686004)(38100700002)(8936002)(2906002)(36756003)(38350700002)(4326008)(66476007)(66946007)(66556008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjJUbXg2S3JEek1qbTFWc1lobGtqV0RYbW8rZzhsSU1BSnRaTUtGVTgxSXJO?=
 =?utf-8?B?dk9jeDNqUUQxclVPZ2lyRkhXK2xHbGpBUDZYM0xWWStOSXcybzRyejVyQVpy?=
 =?utf-8?B?TFVabHpLaDZ0N2RMWGRQRkFyZFNPQ09TdlNNVkMyWWV6ai9HbjZlcmxvakl5?=
 =?utf-8?B?Rk1mYllRQkJNSDJ3OFhRL25rSmpPY0JZdXN5UG82dW1JZFBPYWM4eStLWkgv?=
 =?utf-8?B?M0UwNkozUlhCNEFmSXdxcTBNRHU3c0dkM1RmMVNaTkR3d3FtNlpSTW5QUDhJ?=
 =?utf-8?B?R2JHb2lEMGVpZ21TMm1vY2JtMGs0VTd5b3I5YlU4RldUUW5jZGp0YjU1ck9v?=
 =?utf-8?B?QjVWWUs3SlhnOFE2MTl6em0zZVFXKzU5cStpRnpmRVlWUUJSWmw3RTR1Y1kv?=
 =?utf-8?B?eHVnMUZIajFGK3dtSlNHVDJ3Ny9OMVdpbUd2RkdkZTh3VWVxVnlnNC9pWFZq?=
 =?utf-8?B?Z09nbGtFaHNyaGRXRHZjMTdiUVo3cGhqUndiamJVTUpwRU5yeVF2bi9TN3NH?=
 =?utf-8?B?R3hOc3pUYXJCV0FPU0w4NE1STmgzaUxYVjQwMmVRSmlpUm5TOGpwaEZWcUtY?=
 =?utf-8?B?a3lsK0lnLzdvNEFlS3N1SkNxRVNoQm5ObmdOcTR6TlNxNW1VRC9CQWN4L3ho?=
 =?utf-8?B?ZzcvYVNITkQzNklmdTNidFlyV0pOYlBVNE1jckNjdkVlS0pkU2o5VlRTQnBD?=
 =?utf-8?B?VC9jTWtsdnZ4T0oxUVdxeFpEQnVoM21sNW1GYXExamZQYXRSZE1wdEFkcEJ2?=
 =?utf-8?B?Q2xJcE9UeUlHZmo4djNPV2lpRXBBN2huVmZxK1lUd0wxSjk4cnl4L1AvRDFY?=
 =?utf-8?B?UlpjdnQ1LzdRWDUxeEtBMzk2eHJic3VPYlA1OHdIV1hCc1RNSDlDRnUyRzVh?=
 =?utf-8?B?YjRscFkvUlUydXJEdFFtYWQwTFR4SjlPRVI3WjFIZEtNbmxwRGF1Mm5MeTVP?=
 =?utf-8?B?SzdBVS9iVjQySnRhaHV3Zk4zVXZDZUtyejNBekZGb2hMUHY0NnE2MHRFN2xX?=
 =?utf-8?B?QnFLTFhzSVJxWmVJYWFtWWtmdVcrTm9DdFg2Z3pZNy9iV2VNWUlDUTJTdmRF?=
 =?utf-8?B?MWVsdkpCK0ptT1MvRHR5TjlEWDE5cmJTN3k1cUxGZlErVHUxdzNXZUJIK2hl?=
 =?utf-8?B?dk16MXcwbGtkZVNlakZpSUtVaDRlVnI2bEJaOXpWa3UxN0dySGhHb2lTMTU0?=
 =?utf-8?B?dFJJUWFPTWNFSHVrdVkrZklzNm91RlVtbmpONVp5TE1HMFprRTByYnFUQmtO?=
 =?utf-8?B?V3pHVXYzZFA1OVordFpMcVJGR25sUDlFZmRoSEYzWnJEa01oNFA1NTZhRTlh?=
 =?utf-8?B?RHNYNlYyUmNVbTBPNlBCSVRScXJOZ3ZDT2dQbEgyMkNyY0U4Uk1DQkpDZTJS?=
 =?utf-8?B?eGtJRU1NQTNrajZxcU1EMGNxa0l4b1FaMHVVZjNMT0V2ZVI2cUozV01NZzNR?=
 =?utf-8?B?ckVDcXlBZ1BUOHdYZG5JUW91UDZWWXN5THhLdGp0TU55Yk44cWROZTFYN0hy?=
 =?utf-8?B?ZXJteG5xdS9wcmZJTjFYSWRwOC9Kek5mbXJ0K29yTGV2U0NwZkRhYTVQSUFK?=
 =?utf-8?B?ekhCTUZ5dTFsMzZZVk1ERk43OWN0WWpJOWg5WCtGR0VqTXh6MG80MjdJT2lN?=
 =?utf-8?B?WXVWQ1YzNkpTSEZ5WVNTMTUvbG9ldWFXdkRXSmJSNy84Uit6aUhyNUVPTEhQ?=
 =?utf-8?B?RkRUa0s2d0I4NWsyMWhYNzJIMnBUajArUzVDbm9pNzBZTWlpZndHeU1JVXBM?=
 =?utf-8?B?S05CUy9oWXRuY1N4Wjl1QUkyWWlWbWsyUk5ydllvc2ZtYk5rSjBUWk5NSjFr?=
 =?utf-8?B?dXNNcFk3YWFvemNaUk9LQWJWK0xWd2NMOStSMGdCeHl1bkdOZjlkWTlWTVgv?=
 =?utf-8?B?TlR0WTV6R1dMWXZxR3hxWjA1NEYzckFHUUI4WGVNVFdRNVkyeE1LYjRMUW1p?=
 =?utf-8?B?ZEtCdiswanJ5N0dPNnhhMDN5T3N6UzlJQ0p3SWtndVd5WXBhakJJM2xhWXpT?=
 =?utf-8?B?YVV1dE0vZmcwODZKUnMxeVFsbU5CdU1wVEhIdFFneU5wSDYzMk11YlpDd25S?=
 =?utf-8?B?ZDNjSW9Scndremx2ZHVML1loZXdyTENRL0NaT05xTHJhdTZLbUFNb2RvUk15?=
 =?utf-8?B?N1ZaNWZrdFRkZ09yaWNUSXNycmpqSDJyUlAyZFEvQnBuSVd2bzRqQkFuZFhL?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1eb15ce7-0bcc-47cd-ae97-08da8234eddb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 22:48:26.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wY6QQi9sjfQLhJ8CWdos055bcV/Zn6BFdYGsLKF5QnaZpsfqhYoHvp6zbUT92JwVIk6sHj0+Ts3bQiqShlbOSLeLjMbzIf28D4Xd/pMGldI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4359
X-Proofpoint-ORIG-GUID: a7XEAb6DZUx4Z5ZyB4Ee2QHZza7_3LNx
X-Proofpoint-GUID: a7XEAb6DZUx4Z5ZyB4Ee2QHZza7_3LNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=750 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190085
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Aug 2022 22:48:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7546


On 2022-08-17 12:29, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Thanks Joe!
>
> Bruce
On the same note,

ceph on master branch is also affected by the CVE's mentioned in this 
thread.

Versions of ceph that contain the fix: v15.2.17, v16.2.10, v17.2.2, v17.2.3

I could send and upgrade to the v15.2.17 release like I did for 
kirkstone, however upgrading to more recent releases is more logical.

Is an upgrade for ceph on master under work? If not, I can volunteer.

Sakib

>
> On Wed, Aug 17, 2022 at 12:28 PM Slater, Joseph
> <joe.slater@windriver.com> wrote:
>> The CVE fix I sent you is in the upgraded version of ceph.     Joe
>>
>>> -----Original Message-----
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Sent: Wednesday, August 17, 2022 7:19 AM
>>> To: Sajal, Sakib <Sakib.Sajal@windriver.com>; Slater, Joseph
>>> <joe.slater@windriver.com>
>>> Cc: meta-virtualization@lists.yoctoproject.org
>>> Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
>>> v15.2.17
>>>
>>> I also have a pending patch from Joe Slater that addresses a different CVE on
>>> kirkstone.
>>>
>>> Can someone look and check if it is also covered by this uprev ? Ceph takes an
>>> incredibly long time to build on my servers, so I'd like to avoid as many builds as
>>> possible.
>>>
>>> Bruce
>>>
>>>
>>> On Mon, Aug 15, 2022 at 5:03 PM <sakib.sajal@windriver.com> wrote:
>>>> Upgrade ceph to latest v15.x.
>>>> Minor upgrade containing fix for CVE-2022-0670.
>>>>
>>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> ---
>>>>   recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)  rename
>>>> recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
>>>>
>>>> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
>>>> b/recipes-extended/ceph/ceph_15.2.17.bb
>>>> similarity index 98%
>>>> rename from recipes-extended/ceph/ceph_15.2.15.bb
>>>> rename to recipes-extended/ceph/ceph_15.2.17.bb
>>>> index 17dbcf3..9fb2e72 100644
>>>> --- a/recipes-extended/ceph/ceph_15.2.15.bb
>>>> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
>>>> @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-
>>> ${PV}.tar.gz \
>>>> file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \  "
>>>>
>>>> -SRC_URI[sha256sum] =
>>> "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
>>>> +SRC_URI[sha256sum] =
>>> "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
>>>>   DEPENDS = "boost bzip2 curl expat gperf-native \
>>>>              keyutils libaio libibverbs lz4 \
>>>> --
>>>> 2.33.0
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#7523):
>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/7523
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe:
>>>> https://lists.yoctoproject.org/g/meta-virtualization/unsub
>>>> [bruce.ashfield@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>>> its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

