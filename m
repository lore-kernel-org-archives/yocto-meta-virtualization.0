Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676DEC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:01:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.18460.1661176889757829459
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 07:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f0zVojK6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5233a6570f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27MDkJKl005916;
	Mon, 22 Aug 2022 07:01:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=UvaJivfbXPBeCpLhvjWAJyr03VU8Xu9M4nXK6WEwfcU=;
 b=f0zVojK66U3hisnaxemLkyQMZw26fGTGf1/jf4EL+JA/hL3vwce+24BTVgMRAiANoxFg
 9PM8WFF33t6+KlgFkNnu4kklMMKXYmrpMLNsySFxQBG357Hap40RI6s0/Ik5jMneo1ng
 tfXE0VWSGZB62BbaOGg4KCyxm9Dgjk8qj0u3XxV7CePF39tBYfCVT6z9cp3k9YjK1xpA
 z/zzjPbYfptPLL3OPvJWhZQGuvNfI6vAhrdxIAR7DgGXaLvZ7/kA6TYL6aKEnTG2ZXGz
 vrfdLNh1T/wQuLD8CslH46paivTFxs1wSNUTJqBvDRjo4tH85pGWbtcAXVn+3dsfH1go KQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2w11sxhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 07:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0bSYfY/WnUWC+USBlwPLBt5h1GTJG8jbbknhqMDdzDE4WjGEqgNW2KcnKsUZR/5isLmrJHEJ+a/75son48ZwnHdp5uxYDq4to/a1l9mzUsOQH8zrUTf4rYXpvuJDut/Xf5gBocy/GuS485j8DjrF2YLZ3zlKSRbswiPf6AFM19Q2Kj8Qs30AU0bnuh4MUIDZgdsxXIr00yC41j/hLivIiNGX/+0g9JiWOPOme8aK2Xrwl4NnRja2vlvps9sSFq5NWWkqfuUdn8aJHgHjWFl9PZgMNPsk/0OTyJdwpZGvTlFKfquoEUm2K2e5Cjbiva7eQLT9ZEru5SyKmbY0iDVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvaJivfbXPBeCpLhvjWAJyr03VU8Xu9M4nXK6WEwfcU=;
 b=HDIsCqCEU3RSwutJNFQmtVs9Ky0U0bx8Y/5NeDND4djI0KSTX/oavkut+KbY+E8QBMDeOSqLaCSMZLRYivnv7Q+P7H6BQX+E8UkJCA+BmyZwQVTJnGatVWPvH8yyKkwXywxK5/FZxxONB0IShskZqCqiP9ibmhWn9nzmIKT25nZuZuLaAn+/ngkQ7auwNJm7dg3ebkwk91tfeSR9TO+aUtp54puWRLU9GhWeD618p3QY5cHjJWkFlU2ZyTYLRvSL4E1TLuU9YvxO5HFXRUFmHAsydmWORhsyWPO1WI4CEOa11ZDF0HTSOzcaEEZALNI/KbREON6CYYsjJSDhcdq+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN8PR11MB3569.namprd11.prod.outlook.com (2603:10b6:408:85::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Mon, 22 Aug 2022 14:01:22 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 14:01:22 +0000
Message-ID: <cd066dfc-0410-06e2-1fa9-7816fc0737f7@windriver.com>
Date: Mon, 22 Aug 2022 10:01:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
 v15.2.17
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Slater, Joseph" <joe.slater@windriver.com>,
        "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20220815210243.25546-1-sakib.sajal@windriver.com>
 <CADkTA4MX053i=kVX2xDjKVNS-6tELBoopEYLABxFPazzyTULdA@mail.gmail.com>
 <BY5PR11MB39922BCF8D81159B0F0179E5886A9@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CADkTA4Mrst2j8A5RJNYiV_QhrFQY7X-wdjsNXqFBHboR4GXfKg@mail.gmail.com>
 <a4e9265c-0a69-b5c8-6304-876a05c52bb1@windriver.com>
 <CADkTA4N_Kmf0a1S=TmN5t87oyyX6N7qt5jgjeRa46EnwO3+apA@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4N_Kmf0a1S=TmN5t87oyyX6N7qt5jgjeRa46EnwO3+apA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0290.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::26) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6624ff93-ffb5-40d8-2c06-08da8446cba1
X-MS-TrafficTypeDiagnostic: BN8PR11MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nqpVouhENIFWnlJV4o5TaMuxIvMdtsd6J1cJ8F31O6ucFgLA+/u36BOcoswwW3qKkf/7hpAkqu5lne001LoboxavG4cnPaBvc17YR7B3DID6Ds4FfS0AOuZxBkvwdbpbbxY9Msvu86ZAMG3K2t4ARmYZy1Va2IKGi5B2jX7HdcOQpuMofqRCk4NfRA7HRxjZoMiMbhekOKlBT9EZXhNIZt6YGzUpbLZWg5Dek+Nsikh/wDX95/8jutxHmEgnfWhcw/rRfa+V2Fh2wKp9MDWiaQSbMmZx6lQYQboHtJaUNhOUEw1UEpnVmmkTYpuE5aOGvvLBpvtH5ndmgIZXkj7BfBevtXBGqX5UNOJ/t9OCyWBeaQ/GxUAUJKsVZORFn3b227igAkPc5jEjh8ZmP/K6zR2hE4cYd/4abTTPc4+H73qHuRwnKHtbd9mfkFv1+fnwdxDLAt6JUoXnNyUmFpEP5GoDUwahyOVh9DAqzBD1AeC+JGjwRec1+QXi0Ca8tnNPVNbO+kFYoak0Y3oPoObeG7pHDr3n5K5MHy5KWob1qAqu+hIkbhCMyEd/owSoJSkTeQbq+mHYBpyqcnJGUF+g36rQmzl6M2xlKAGzignXtAkFselofEVqP/Grtb9ZplNilrN3WdhlDAR3jJd17LgFQQXetXW/OD+RYO7w0s8qHLEuq3cUO1lrQAXG8veuwzC68H+Ec6/MqH1cFs6fAuKyn5hoIJSLumhA9o6TA8hCFYwDW0mNh1TEZKG23W4SpqVgjU55ZO//fjh0JRsO5N84Z6Wio35zhFfmXwfVVybn+LaVkT6m7w25LSk3reBE+8nXXVKsRkP1JVnG+u2QIhb4i29PyebZR/v+jOtZPMgZlZvbFljvH818vjr5QA1LmaDnoO+7SvFSeK3HY016D94Xug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(376002)(366004)(396003)(136003)(66556008)(66476007)(6486002)(966005)(316002)(5660300002)(66946007)(44832011)(41300700001)(38100700002)(38350700002)(4326008)(31686004)(8676002)(6916009)(36756003)(54906003)(478600001)(6666004)(8936002)(2616005)(6506007)(52116002)(53546011)(26005)(6512007)(2906002)(186003)(83380400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHh2dkRzeWJDc2cwUGpabXFaSWNQQnYxQnZGUXNMeWNveHNaMmRuamZacWhx?=
 =?utf-8?B?cHgzdHVMTVZrVzVVMHprR2JtMG1IOUJ3alVaU0lsTDJCZnFBdHhRQm1jLzdz?=
 =?utf-8?B?V1dvdHJCdDZCQjQraTBnTzBvQkRKcThnbkNZNEgvcHQ5Y2wyQUlHTk16UlNF?=
 =?utf-8?B?V05HWVdsQkV0Ukw1Y29DRHZuZEFWRFM5eUJBbG5LMUV6MFlqSWYzSzI2c3BU?=
 =?utf-8?B?UVhQaWJmRWFIcEtnVVgyUjgrVlhhK0U2Q2diekJyaTBVbHJhOWVQamJzQ01N?=
 =?utf-8?B?bERqVEZiT1gvNFdHdnBDL00vcHF1VUlZbitKS1JBZnRGZWpDK1JNSFN6dllO?=
 =?utf-8?B?dFE0VFRpRndLcHRwQjA2Kys5S1l1TDJZOFFyK3M1NFFTeTROUkx6b0szTzBC?=
 =?utf-8?B?d2k4U2JtRFErR1hIN0FXSHk0TUxYU3JlNTkzNFNSazRvSWRZOGpzWWt2cUxR?=
 =?utf-8?B?V2U1OTNhbFdWZzI1S3d5VERDcVFOSWFMbWVnTU9DVEk3ekpGeURwY05wdHNr?=
 =?utf-8?B?ejJ4VlJ5Rytha0xtSDJXWDVEUGFYK3k1ZG5IZU42anp5eVZmSll6YmtWNlhD?=
 =?utf-8?B?clRhaWtZbE1Uc3dRWllpaFpGY3dGMUVjNlpVdVByU0ExVXBqRmwzMkUxbllP?=
 =?utf-8?B?aHcxWUorYlN5QnE2RC9TcTVXRzVxT1BuM2dEdVl5VkNlcTB0TSswb29RM2ZC?=
 =?utf-8?B?RHRBOGRiM0FWNEo1QlZmc0tkbHVqa3ZlK2hvaWdRaS9vNFFXc3pFcGhPMnJR?=
 =?utf-8?B?ektJanJTclNoM2VMMDUyNUVxUy80RDZXMFFDcHdIV3h6M1dsY3QzTFNIZFVK?=
 =?utf-8?B?VEtvYXZVYVMyZjBIbkU4UTc3WWc3YmZRb1ZzbEpac0MvRXBJWkZKdHJmYnoz?=
 =?utf-8?B?blpoQUFFUmp2Q3VwVlQ4ei9jZHJwbnIvZTU0dHpTM3EyYUM2MWhRaEMxd3JC?=
 =?utf-8?B?Q2MraEExTGwvRmUxd3VqVlZoTTlHcGVKRWJjTmpJdFppcmNLWUxxZkRMc1Ro?=
 =?utf-8?B?OFVkakdMWERFNDBwWERVenRmQ1hhM0ozbjlFaG5xZDBRMGVQeFhJL2N4UjNL?=
 =?utf-8?B?a0phbERhak8reWV5Qmc0WXdZcFZlZmJCNnBGUlNWckpuUjZVakZoWTM2Y1A4?=
 =?utf-8?B?dGJkRWpGTjJTTDFJNjZRY3Y4UWhJY2F4MFg5YmZQZ0JsYi9aZHFpVjBQTXV5?=
 =?utf-8?B?dEUrMmFYWlNkeHZyTUpWaEJFOUEvS3FYRHR5akN2a2tEZkRzSzdPb2FhRzZi?=
 =?utf-8?B?SlNvb2tMZUY2RXBBTDZScTRWVGtyalh2Vm5jOWFnZDN5b2l4MjhMUXk1eGdj?=
 =?utf-8?B?THhZbFBUMTlIWFZOUkZLWjhGVFJ4aVhWeWhjSFo1eGxXR0I2b0tXSEc4L2Qw?=
 =?utf-8?B?QytHMFdGT3k3Z3lHOGdZOTdWZVI2WExwbnNvYTdSU2l3NGg1Y0hjOFl4cE5h?=
 =?utf-8?B?d3dldWNZWEg1Tnk1SWJ2QnR3bmliUStFQVVsUVhhSm1nNElpOGtDbEpJYnMz?=
 =?utf-8?B?bCtSSEJadFdoQk1YZ1UwSlBWeTZGbzZaUDhDL3A3SVRJY1JYTk1rRTlEYmdz?=
 =?utf-8?B?YnJsa3BYZXVzNGlmdEpNeit2Q1pra2YyRVl2cTNoeVFvNkFPUURkZXFBbWY4?=
 =?utf-8?B?ckw4VTJaaGtyN01pSWxDMVFNVVFzVGpuRHR3VXV6WVdpQUtoUHhMQWZmeXBD?=
 =?utf-8?B?MDNpVnRpS1BUdGVveUN0KzRiM29lRDM4b3JqSEE2anJDZTJYYnd4ZHJQUS9k?=
 =?utf-8?B?ekxqTlJ3ZlhtbFhUbVpTOWZhemhmZXFBbG5PcW9hYkVFMkc3V1NPUUhxdmVK?=
 =?utf-8?B?WFMvaTBsZ2VCS2l6dW1qOXVSc3BCbktLanRRMzJQbFNCMUd5Ty9UWHIrbVdS?=
 =?utf-8?B?Um5EZXVZU0dPUDRZd1hOSFUrcjlCaURlZmhJY2VvWGE5K1REOGhtaWFXSjlH?=
 =?utf-8?B?dTB6SnQvYVdqK1ZEM09SalZSTEVrOVNoaWk2eFVMVUIxQmtVZUhkbE11OTE1?=
 =?utf-8?B?M3VCbTVyc1B1TkVRbEVVZEY2NmlzTWoyQzhWVnRnNWN5ZkJ0R0hzVVF1cjhk?=
 =?utf-8?B?eUdKUlBpWUpwcExwQXlJR0h3eU04UXVlU09LL1pBa1c0ajFEU3pueVhCVWZk?=
 =?utf-8?B?ZlNoVHRBa0p1bnBxem5oRk9TRlppZWdWU1M3UFYvaXdkMCtYVjJJT3BhMkF4?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6624ff93-ffb5-40d8-2c06-08da8446cba1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 14:01:22.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bsq/qo6OBp4F4w8os/eaFbIOWsAZPgDtIV+ibR7yCDwOooAVAe1JNm1k0iy8l9zkQjWtCgIU9BGrCzQDo6wfJ5WilBzJiVnZycsDeqxZlOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3569
X-Proofpoint-ORIG-GUID: x1RJvYCQYKLWjmBT9iMSrXqjG3GJR7dU
X-Proofpoint-GUID: x1RJvYCQYKLWjmBT9iMSrXqjG3GJR7dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_08,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=765 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Aug 2022 14:01:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7554


On 2022-08-19 21:05, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, Aug 19, 2022 at 6:48 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> On 2022-08-17 12:29, Bruce Ashfield wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> Thanks Joe!
>>>
>>> Bruce
>> On the same note,
>>
>> ceph on master branch is also affected by the CVE's mentioned in this
>> thread.
>>
>> Versions of ceph that contain the fix: v15.2.17, v16.2.10, v17.2.2, v17.2.3
>>
>> I could send and upgrade to the v15.2.17 release like I did for
>> kirkstone, however upgrading to more recent releases is more logical.
>>
> I was going to suggest the same thing, an uprev is a good idea for master.
>
>> Is an upgrade for ceph on master under work? If not, I can volunteer.
> I haven't started one yet, so feel free!
I will get started on upgrading to latest 17.x.y release.
>
> Bruce
>
>> Sakib
>>
>>> On Wed, Aug 17, 2022 at 12:28 PM Slater, Joseph
>>> <joe.slater@windriver.com> wrote:
>>>> The CVE fix I sent you is in the upgraded version of ceph.     Joe
>>>>
>>>>> -----Original Message-----
>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>> Sent: Wednesday, August 17, 2022 7:19 AM
>>>>> To: Sajal, Sakib <Sakib.Sajal@windriver.com>; Slater, Joseph
>>>>> <joe.slater@windriver.com>
>>>>> Cc: meta-virtualization@lists.yoctoproject.org
>>>>> Subject: Re: [kirkstone][meta-virtualization][PATCH] ceph: upgrade v15.2.15 ->
>>>>> v15.2.17
>>>>>
>>>>> I also have a pending patch from Joe Slater that addresses a different CVE on
>>>>> kirkstone.
>>>>>
>>>>> Can someone look and check if it is also covered by this uprev ? Ceph takes an
>>>>> incredibly long time to build on my servers, so I'd like to avoid as many builds as
>>>>> possible.
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>> On Mon, Aug 15, 2022 at 5:03 PM <sakib.sajal@windriver.com> wrote:
>>>>>> Upgrade ceph to latest v15.x.
>>>>>> Minor upgrade containing fix for CVE-2022-0670.
>>>>>>
>>>>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>>>> ---
>>>>>>    recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)  rename
>>>>>> recipes-extended/ceph/{ceph_15.2.15.bb => ceph_15.2.17.bb} (98%)
>>>>>>
>>>>>> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
>>>>>> b/recipes-extended/ceph/ceph_15.2.17.bb
>>>>>> similarity index 98%
>>>>>> rename from recipes-extended/ceph/ceph_15.2.15.bb
>>>>>> rename to recipes-extended/ceph/ceph_15.2.17.bb
>>>>>> index 17dbcf3..9fb2e72 100644
>>>>>> --- a/recipes-extended/ceph/ceph_15.2.15.bb
>>>>>> +++ b/recipes-extended/ceph/ceph_15.2.17.bb
>>>>>> @@ -16,7 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-
>>>>> ${PV}.tar.gz \
>>>>>> file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \  "
>>>>>>
>>>>>> -SRC_URI[sha256sum] =
>>>>> "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
>>>>>> +SRC_URI[sha256sum] =
>>>>> "d8efe4996aeb01dd2f1cc939c5e434e5a7e2aeaf3f659c0510ffd550477a32e2"
>>>>>>    DEPENDS = "boost bzip2 curl expat gperf-native \
>>>>>>               keyutils libaio libibverbs lz4 \
>>>>>> --
>>>>>> 2.33.0
>>>>>>
>>>>>>
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#7523):
>>>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/7523
>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/93046468/1050810
>>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>>> Unsubscribe:
>>>>>> https://lists.yoctoproject.org/g/meta-virtualization/unsub
>>>>>> [bruce.ashfield@gmail.com]
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>>>>> its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

