Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FACC47080
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.3772.1650595123963086542
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 19:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aoPZwc2X;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1111ff293f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23M2bDOa004184;
	Thu, 21 Apr 2022 19:38:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=pHUwVxnv+fFj7m5VmLot8DWYMY3Gm79n+ONna1XlSpM=;
 b=aoPZwc2XhKclk7k3F6LuazMFGFooOyxEEyJgq9LJLmZanY6sPnO5KuTPEyYeiM5+wjz0
 ghsGM/lssj0zI7XsmhVei/1XLIxZ2ipR9MzjZDHc/9M44Q7NcY+ePQW7wm9puP/dmdWJ
 msAcSyjnAJdQhqbk9/tosv3RJAdRIKygmS6+CkCFnBkMh4w5FBJdIijQ7NEsCCPd/7XV
 eEP3sshu/DFAkgitrYVf91bdmQQ7SaAY4aNKrMloHul87MbiSa61XVBN2cJhtRUOzS8j
 sKqUENIzmhutniD/Fj9Oz8rwlBhI+K08+4aqWK9mj+odTUAg03XUO4MTHN+QY0JcRgEJ mA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs31491a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Apr 2022 19:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuJolO0ljhJw8hkOCsKQ/qD/tbqglUXF7PC5EHw9v4gjXyslNzxd5JshFyrP9nMMaiDTGhg2EyRnng1hVx56faFBuCCp+yWlxVtHwwHsK6E4QsiIfp3h1drfFkoLvH1yQ/hxBiQoJtO5uYAKfRju0H1DiizJ2jLG/1EMj87uayBrklRmMszT8BfGqxkLptGr4R6D8dJ/03QhBf9H6J4Xs1eNj+9k6dsnquSVe5c3BEJuMkrp/R1ShIpNUoY1jMwUxoTg9qLHTJbI2kd/aZso1P1cGqi9TKH+Qi0MLBJISLnTu8acXrJ/VDXInprftndnl8JfuCm2jgJu3CkB/tsoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHUwVxnv+fFj7m5VmLot8DWYMY3Gm79n+ONna1XlSpM=;
 b=Fo/GVXZ1m/J3VBBcqOPRBYsADVmvsmKcJQvFY+HHmGlGUKoiw3W8XfvMjHqsSQ3EPZozJ4Hwy858Jqsr7+nJZdlOUq27RFvn4HfkB3OGT7+BF2lHdwYyLn0gpL3qygwLw0lqDZN0DDyxYt4XOFWslmWBrAryUGxytsw9iKK4Jli+E9UG2P6T+8quH9sD+9YGJvy6pTfGWuAcfUTvJIFRgMCYc247OxPbFxOQ2nHwX/VxpFWAVSSlySrCfMG9O+06P4h/wM4jGXDtJIUQIa0fG3jHlcPIzM56f8Owho880gGGAaOvxLcwNUfV/YHUdVW6aCo7COHBSak9mmc8OFDs8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB3209.namprd11.prod.outlook.com (2603:10b6:5:55::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Fri, 22 Apr
 2022 02:38:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5186.013; Fri, 22 Apr 2022
 02:38:24 +0000
Message-ID: <b441020b-fb1c-4c18-0439-2c408f577f4d@windriver.com>
Date: Fri, 22 Apr 2022 10:38:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-virtualization] nerdctl
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>,
        "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
 <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
 <167DCA8D5023C45A.28983@lists.yoctoproject.org>
 <CADkTA4PMFz8wa-huojDvsOOYCTPFt3sEXqLYmTTMMtkcNs3Scg@mail.gmail.com>
 <8cd4d50a-4e1f-6f67-727c-e2ca6fbcf5c6@axis.com>
 <5763bac9-78cf-97eb-1dc6-7db16ab22b34@windriver.com>
 <CADkTA4PY8ktGzH_0zGxzEwn+zRMy6RbbTBXr5mZ+NyEY3p88Sw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: 
 <CADkTA4PY8ktGzH_0zGxzEwn+zRMy6RbbTBXr5mZ+NyEY3p88Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7933d68a-0c9e-45a3-2d40-08da24092c66
X-MS-TrafficTypeDiagnostic: DM6PR11MB3209:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32099905C0820CC71E959A9EEDF79@DM6PR11MB3209.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	muqAEBPMOJEXIi2Rgbt1baAmBoqh0yEJUtiE0aLnSV6fC4X2Ckl3MZ6c50TQandSvaM8flAUwMFnZ6vvdAc7sE24NmxORjAkfb29w2ZCfj5mVXuT9ImApPJeX2qi0m3XJVTEk8553G2bPYuBjqA5L8i3cwVi8U5uFLA6AUBU7Jcxmhq4ADWEAg80lxLQJn/Z+K/2DCenTTtj37sxr+Wb33L1cC5qAIRTZE6fIOREkFUCZJAWxMQ+jTNiTK/fuctLqM50/Zj02WUdcptJBoaqoJUZyqgIX3Y+EBN9URlEspaaSAW30DkTV+hQdeyCFTgknrMpWWpyMKxWKVsSIh1QkSIerU9HqXkvQIBvA6QQHBHdN3YftNS/JRbBFe913g949AZyS2a2wz0Mkq305QxBi7cG3LSrD7bapkNgU+gTIKvRO/fD/lGoqYDpTjxRK11d9OEG42zBYc3XfCblnlMNSeB9Naon81Zu7/shhh3eBw0I73LN1fDtW75Iknn1QS/xBIx9Plktt+g9Jb/Hl3Tf6sy2jSbK+Z1bzla+VxRKesx768UMSKYK8bGdyLLh8TYLvJeassDkLV4v5okpWLxP8+M5Ca4eFuO442dIqs6C5SJxE8bTDnCelOKt6u527g9MJn8o2/JuSZK1c9XSw2LixUIjG/IyC6OggxbyU455gS8pwD65puS/+7pOy8QzIKvEPx+/owudKj3KddWcbY+ErrqhyqzfwY+Ok2Gs13xQ5lyhYfX6D/nGe+Z15ZzkY4wIfs7BcF4Isxf5PmhAh2ktNlT8VhN9atrcDS6UStJ5Tg/0m/s11exEoMyrbiVAW7qj2fB9h5yKEpWuyscFDr5HXMUgRm6AIAi5rXpw+tE5VOmKWrujNmTLlUmkruYzBk2YOjqPBuDSI50wKauOk5evLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(26005)(86362001)(2906002)(5660300002)(8936002)(31696002)(31686004)(66476007)(53546011)(52116002)(66946007)(66556008)(4326008)(8676002)(36756003)(508600001)(83380400001)(6512007)(6486002)(966005)(6666004)(6916009)(38350700002)(316002)(6506007)(38100700002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXYyWmFNZERmbmcyUC82dEFHMnlXcFlyZ2ZzaU8yY1BxRGxGd0ZEZ1NVeEJ2?=
 =?utf-8?B?Z3IzdmFXb2ZmOWxrajZQWWcvU3V5Q1ErNm5yd05tektxZ1k2U0JGT1JCUXdk?=
 =?utf-8?B?QkRtVHZRL3VOVzJjeFlTUThpTG1BSEs3aytxU0psWXIrV3Z5Qjk2U1pDVERr?=
 =?utf-8?B?a3B3U2ZTNGQyN3FFZFdJSjVXTStxUmsxaC95TnlOV0pHSkF1MXVkblNoYmVE?=
 =?utf-8?B?bmV3TDNkbnAvOGpGSmdiMzUxdkV2cGExQ0JHcXJOWU9qTndGYk1QeVMya3RB?=
 =?utf-8?B?QXp1UHUvdDljdFlxdUpXa0lERnNLSlcwVUVEWFkvN3BXaFlMMDBjY3lyTVdV?=
 =?utf-8?B?NkNPbm95bW5iRTZxR1QzSEE3N1lVSzFsYWN5RGhtVDBmZ3RsVEJtZnpaMWJN?=
 =?utf-8?B?ZjlOR24yaWtzL1Nxb0VISi9Pd1RuWE93TU13MitXTU1sWXE3SFpvMFZWNkVi?=
 =?utf-8?B?UDZtUTFNWFNvRXFGWU1VM2pNNnZJL2ltU2NhNEJhZGFWTGQ2RUdkYS9pWVpw?=
 =?utf-8?B?WDVRczNDVkdzb3VvTGZwcmE0TTJjWTE0eWV2ZnVsUTRwK3hDRTdDNjB2UDJZ?=
 =?utf-8?B?VEl5Ukx0TDYzaWVoNEFlWW5jbVUvcTM1QllyMmQ5a3V4bHpTaWw3Z0ZDT1VX?=
 =?utf-8?B?RFpRcHlWYzdtdzlYdUhtSTdNRHBwYXpjdkZUL0I5VTM2cHRPRVNibW1ocmc0?=
 =?utf-8?B?SzZSYitIc00wdVJTYUplTmFxc3psK1hORWUvbWM0Sk5BUWFITEhVU3BibnpR?=
 =?utf-8?B?MDl3WTJSR09yNXhXR0NCVkNwNktGVWVNaE0xQUJzTXk1clRrSHNDRldpTkNr?=
 =?utf-8?B?eFg3UGhvSEVQT2NRVVEzdS9SaTVJcXZlNTBCMytndlhzOG5UMnV5Um5zNDNY?=
 =?utf-8?B?Y3VrWDIrYkgxUHJad3JETG92c1NmWnJTaUJMRkxLN1d2bWlLYmJSRG4yWTNE?=
 =?utf-8?B?RFgzVjJPaXFqcEErM1g4d0NVdmZRaGJBUGRYZ3VIek9Ya3orbFU3RzhyQlZa?=
 =?utf-8?B?MTZ5Z2NpUDV0bU5QWWdMYm9aMld2MXhSRy9mcUFKemRNRVJqVFVoSVlSRWVO?=
 =?utf-8?B?SzdFM2pQR29tNUkxUkJZNVBFYnRKWVJRMzdLTDQ2eVVRVnpqZ3d2ZVZwaitK?=
 =?utf-8?B?QkxpU3BUQUxqem1IM2hBSEtFMmx1clU3KzdmTlY2aXJIMHdyQ2Rua1lvYThm?=
 =?utf-8?B?NVZ2ekJNL21RdnhucUJJQlRGbFNIdHFwUHVuTGxlcFJZM3loOVRiWmdtZ1Y2?=
 =?utf-8?B?NjJkRUdBN0xlQjlqSkt1eEZLVjZvenVEMVZ6RjJoM3RXaXNWWUFMMHpqWjhE?=
 =?utf-8?B?NWNxWlpsWWxqNjNyblFmWFlWOG1nSUZNRmpIckY5RWVYOHpSenlNa1FyREdK?=
 =?utf-8?B?aWlsbTJvMi90ZSt1MVhtWS9qV25XOW5TNFZEK01aem9EcFZpUnhZd0JtSUJq?=
 =?utf-8?B?ci9sMUliZDZaY21JRlB5UFFjeFVxd0hXQVgzRjFvdXRYS0dTb1pMdVYyTEFq?=
 =?utf-8?B?WWZpYzZzMUZJd2ZsRVBySHIxazROK2x4SVN6MXJIaDJJUkg0Z2RiZ2Fib2RQ?=
 =?utf-8?B?OHlhQUh0bG51UzZ1bVpUdVk3NFRSVlZWcVFPa1dsS2hGWEtMVXRkSDJqQXZ5?=
 =?utf-8?B?KzJJbnlqeXV0ZkYwVkpSeTBnUWtmcGJQb2hSdTdFZzFZNHNqVTFIUFNnakFq?=
 =?utf-8?B?NFI5TUJFOHJPUHZTcmQ3dkdGTjJEa1MxS25ZWTk1bTVlK1hPTjlTRXV6U094?=
 =?utf-8?B?QkZIc29VcGFkNEJpU2ZBWHdLWDR3Z2ZGRWRIb0xSb1BDemJpbExad0IrMDNq?=
 =?utf-8?B?ZGtQUHIrbXF6SXJLK0dmZnlNK3hrZWxzMXQ2NmlCdnhDY3FlR2syRitOV1p3?=
 =?utf-8?B?cldsMGpYOWZ2SWRncXhoUHJDdVB3RG1tQytXYU5Wb29GNUxWRUl5ZDZUZFl2?=
 =?utf-8?B?TXBhR2tLUzQwRWd0WFEwYTk3UTA4amEvVG9Venk0UmlCdlFpcTlxV2RManFC?=
 =?utf-8?B?S3NqTUdEalhQSXJnWi9oaktydXV5REFXNCtxTENLVjlBUnJ6TVV0azdtRlBY?=
 =?utf-8?B?SUR6Wmw1T25YSFpLVUg4L2poVW9hSi9QVjlPMmFkUTU4QkRxdzlDZnNmb3Bw?=
 =?utf-8?B?ZWdZNVgzNUdmREpDSkt5V1ZGSkdId3Zjd2NTL2pGenl1b0tTNXBBNVR1OE9m?=
 =?utf-8?B?TEVzeUkrNXB6SDczMnJ1RWxZOWo1dnhOTzM3OUlmb21QQmxEVUN2RkJycHda?=
 =?utf-8?B?MW14MlRCc0pQa0dTK2lJQXozUkF6QytQTCtENDB1NjB5dHZTUE80dDIvU2dS?=
 =?utf-8?B?N1hKU2prWDl0R2Z3NSsrbjhYSm5GMC9YZFkxcjd3aXg1MERlWUpPQ2t4OWJ5?=
 =?utf-8?Q?cYjcegXHRGYdRL3Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7933d68a-0c9e-45a3-2d40-08da24092c66
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:38:24.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P8Rr9O84d86zHByMUCaMSHiMnR6Uoqx9DUWrcxgcVNYe+Z5cmawlx66lQEWE8O9SCrAS3OzxCPhcJ3YPS1UvgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3209
X-Proofpoint-ORIG-GUID: rJjS2tcpzrfu2FyvXENh9UTGYbq8YJlx
X-Proofpoint-GUID: rJjS2tcpzrfu2FyvXENh9UTGYbq8YJlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_06,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=759 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204220008
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7207

Hi Bruce,

I found that the nerdctl does not work on qemuarm. After tracking down 
the problem, I found that it's caused by CONFIG_OABI_COMPAT being 
enabled for qemuarm. It needs to be disabled for SECCOMP_FILTER to work, 
which is needed by nerdctl.

Looking at the help message of 'CONFIG_OABI_COMPAT', it seems that it's 
pretty safe for us to disable it as we build things from scratch. And it 
suggests that "If in doubt say N.".

Do you think this option should be disabled by default in yocto's kernel 
config?

Regards,
Qi

On 4/18/22 21:42, Bruce Ashfield wrote:
> On Mon, Apr 18, 2022 at 2:17 AM ChenQi <Qi.Chen@windriver.com> wrote:
>> Hi Bruce and Joakim,
>>
>> I'm recently looking into this nerdctl recipe. I'm kind of shocked by
>> the SRC_URI number in this recipe.
> k3s is much, much worse.
>
>> Looking at the discussion on the mailing list (go.bbclass: Allow network
> Right, we need this for licensing, SBOM, reproducibility, etc. As you
> say, there's a shocking amount of code/dependencies that are fetched
> for a lot of these recipes. The version management and scaling of them
> to individual recipes would be nearly impossible .. so this is my
> current effort :)
>
>> in do_compile), it seems that they are needed for offline build for this
>> recipe.
>>
> Yes, they are (almost) all required (indirect dependency generation
> isn't exact at times, so there may be a few extras that aren't used in
> some build configurations).
>
>> Bruce, how do you get all these contents? Also, how do you generate the
>> modules.txt file? You mentioned some helping script in the discussion,
>> what's the status of that script?
> The tool is still a WIP, once we get past the current release, I'm
> going to complete the cleanup and make it more widely available. It
> currently isn't really usable.
>
> The script generates the SRC_URI, the modules.txt and the vendor/
> relocation parts of the recipe.
>
>> Joakim, maybe I misunderstood it, but are you still working on an
>> upgrade of this recipe? If not, I'm going to try to do it.
> I have an in progress update here.
>
> I'm using it to test the script in that mode, I should have the update
> available in the next little while, and then the script that generates
> it will follow.
>
> Cheers,
>
> Bruce
>
>> Last but not least, Bruce, thank you again for making this recipe work.
>>
>> Regards,
>> Qi
>>
>> On 3/7/22 15:30, Joakim Roubert wrote:
>>> On 2022-03-04 16:48, Bruce Ashfield wrote:
>>>> It took several months, but:
>>>>
>>>> root@qemux86-64:~# uname -a
>>>> Linux qemux86-64 5.17.0-rc6-yoctodev-standard #1 SMP PREEMPT Sun Feb
>>>> 27 22:36:33 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
>>>> root@qemux86-64:~# nerdctl --version
>>>> nerdctl version 0.17.0-10-gf2427ff.m
>>>> root@qemux86-64:~#
>>> Really cool!!!
>>>
>>>> The recipe isn't available yet, since this is using a huge amount of
>>>> fetched go dependencies, using some new scripts/tooling that I created
>>>> .. but at least I know the approach is feasible!
>>> Excellent news!
>>>
>>> BR,
>>>
>>> /Joakim
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#7078): https://lists.yoctoproject.org/g/meta-virtualization/message/7078
>>> Mute This Topic: https://lists.yoctoproject.org/mt/82714461/3618072
>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>


