Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C72BC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 10:52:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13720.1710327118573648056
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 03:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fqTP5er/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38026f99e1=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D9wtMp023514;
	Wed, 13 Mar 2024 10:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=6nVKoQPzU0mwHE8yGvmFt5nr+wY2JrQEqKuHQBf+3GY=; b=
	fqTP5er/3kN68EnlKtvVTyRbfSozeWTg0Tr4iEcpkmkOdO3Z9FYxwNPNMVA7sCAJ
	QZK2gFMXE81QteePTLNj7gJ299ckzDrkG64DwJYgD+f7RwialzUCfDEOTXiyy4k7
	GhHpy+rx8LbM6aDDUAHqpVW+g5Lt7Ygjyj9IK3a4Qm9rXCHGQ+bqPK+4oNsAAIOI
	H2qxMisWmwE9kLBrF3mFgHH1PRGBk3jeOl1p71Aevi8W/F8zItM+ATfhU7winnfb
	c47lTh0HsSPD4EZMI4sdbQhhJ6fAt4W9QLg3XB9CX4eSvMbaKtUep2CvldGRrilV
	oyhswdcjneLzN5LOvytidw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6bvw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 10:51:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKbjaBUm6ecw3jxMX13wqMcmKaWMUF5FZYOli5t21V5hgNJag9ad0AiKfwv65d6H+wG6i+VtY4v4PcqgAtCpZXFm4sMi8m63sTJB5wrFJ3XnuacFl0yaMPBrelUinx8mYeWXb3OOunoyJVK4vFej8kDiWTqaaoe9bo4FFfcohXz3Hlt5YfBT3Xve8YMOzTsGHb0mEG89jNo0kdCOMop5TOGO2k+CLVdNXw9jwsfb33dEzW1AVlSm6BuP+Aq+AXbvJe40SkFHz9gY+qPVryf7aSe+1C9SqAtOavex/aNelKxKkICzKcdQE88PGOZU7MkhVl0zgOXM87yhnfnAgi+ybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nVKoQPzU0mwHE8yGvmFt5nr+wY2JrQEqKuHQBf+3GY=;
 b=JN9zNzbyuXC5l/jnysUb1iL8fP0NdA5nfgpzeCE+vQnlr7KveYCRgKBDayGzQOZvJPWFLDKiimYorAHMgyG50LVEYKCQmul3ti/ixyKtrCWrRaoLYph5cUyCiqU5NFvdE6mwcvF1YsHPvVZUp6u7VanikmVBo445gdhPN/Uheh78lbxqknMxyUAuTF7TR+cFt3MnwRbsfVcayJg+VzLRQkqTTGUTHWfPmdcWQ0gcP5DfSgmf7Nj8tdrrMDapKJSSnrs9x6AsB301Kifh4h81tL91w/4TmHU4q6aH8a+3czGXs4iyhJCGAvGDJ0G5xIMQWziUyFxvUUaVUrpoEHeiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 10:51:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 10:51:52 +0000
Message-ID: <18a3f392-1cd5-36fd-745a-756ee4c29714@windriver.com>
Date: Wed, 13 Mar 2024 18:51:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization] ceph upgrade
To: bruce.ashfield@gmail.com,
        Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
        meta-virtualization <meta-virtualization@lists.yoctoproject.org>
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
 <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
 <CANx9H-B2RS3CP6xg+R3QFCYUO0a6NYTzAgjhaJuoWRjw8dq2jA@mail.gmail.com>
 <CADkTA4Nu=+-2Vj16G=v_tMoL+Z+SKOaMSM9VzfD5jkf0XqcUSw@mail.gmail.com>
 <CACMJ4Ga8A-nkYq6BcyWF9Ar9NTKePaqmmkj7ii0wMkS8g1770A@mail.gmail.com>
 <CADkTA4M1_a+E11jTbFQTuxvUaPR=+TE+rNOo4+46B3f4_ed8Bg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4M1_a+E11jTbFQTuxvUaPR=+TE+rNOo4+46B3f4_ed8Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ce7696-8811-46b6-73ab-08dc434b9777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NCue+ygNI33tAS6FE0R2GY1t/9Bm0EvPkVwOEKCC6o+DOjbS4rbjBtJwrBQYplVHRzZuOdZC3wCGKe3fRNt7b5WP8vu+AmW5Te8J9qf/7ygGHd4lfzc2KrARiSPWX9nmjWJ4jzZVU4uPtnR8dwEo8TN8pRa6abIeZJg1au2kVDdNS7tNLYaoJKOGgR3xXCn+47WNy22iDrv2sd6raliZUnDVk6+WWSMPTz7P7dz0CpuIPYaHpb6E3sDNwZI8pB2ILEabbmndMlhmC4S5pTDFHUTsyQ+pRqDWzcO/kavwZMPijuY3TEx7bxcxtPR35Der1ZgnaXZMxAj5ayEVDdIEwdQQGYerzMJan+xzNy5RUQHyZCjhT6UniVdPhs3UtkQnnnTcHHwhnuosAFCBMRPJnnR+7KUxi3KmL3wDFvoRuvU3M5dnvoNRrffX98Qwu5uywC/Rj+VgA50FDNArIxZpb4PAwOdazqjIj1NAVwhsq5d7cDT21pNb5Q0FobhZ608Jo5OKRFdMuHP8PhebEtEb5L1K4A3ECQ/AErI6uigSVrsDpt1Ti4SsoUNGa9CAGrS82pZyDBq2eIsNAkceFJPqfbo/2Tq1oBpk3vWL8rcjapY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWpqK2RjK25veEQ2RHZpemJNaE1OZ2RYM3FvWloxQU00ZjA4NXNXcUh6bFk2?=
 =?utf-8?B?aWhZdk1FT3JWU2FqYTlDamx3VXZnRmt3RWwvbDZORmp4QUVGWDhpYk54SVVQ?=
 =?utf-8?B?LzRlbGI1WmdYdVZWYmRkekM2dmJJckdpV3A0cTUzekg1UERBZzdJTzg1VlN0?=
 =?utf-8?B?NVczS3NXZnkybG0yYTU1VG5lY3hwNHQyVk5ZdFpFcWJMcldyWmxFZkhuY2dj?=
 =?utf-8?B?b2VqQVdac0l2bkZKeGRuaW1PZEdRbHRBYzN1MEg1ZUZVelZWM0NtWTNzcmRV?=
 =?utf-8?B?NmV4dTFXNG52L2plQVNyZktTUGlYOG9CeDFZaVVXbFBZWDdPZWwwc05VeHlC?=
 =?utf-8?B?VE1Eb0RsMm54ZjZuQkIvOHdhN0FxMG1UQ0FJK2xtUnJ1eEdPWlU0OXQzclcy?=
 =?utf-8?B?eTBNbnBBRFFhQjFaMFVzY0hwTmxld0d4dzcyTStzWEdaa05keFdya3ZQM2Nh?=
 =?utf-8?B?NHhES3VnQVlvQTNHWG1ZcEtRWlk3K3diT2xhZERMbzNIU0UwZ01nVzRQZVow?=
 =?utf-8?B?b045dVdsMTdWMnJ2MzJGOTV4Y1RFbnJIM3k0d2dkQnZEem5nS21seGhINUdS?=
 =?utf-8?B?V3JTRVhSVGZBNVdrY0gxUHF2SklxZUpoakpWMDNpVkNocDhmY1ErSU5WeVJL?=
 =?utf-8?B?YkdzUlhXcExnbHRnWmxHcm5WWlRNUlMzWElEQzFFQ2VFZWFNR01VanhtRTZu?=
 =?utf-8?B?VTJpcmowMEJuTjUwbVBROEtUbW14ZC9BR0x0b3JmcnFyOXdWUkhzdTJ1S1hZ?=
 =?utf-8?B?RTl4QktpYk55Z0IxQU1GVmUyVUVVb2JBenEwcjJmaGZOZUprSlY5QWxqZFdJ?=
 =?utf-8?B?MUxXdlBmdlFyWEgzTjZCZkFqR2RlcEpzb2NUWml0S3VVQUppSUNSKzJOTDdt?=
 =?utf-8?B?Vk4vNmhseHJwTHBReEF1cFRvSVF3K0QvT2VnZkxoTDQ3WnZlUk5JMHBzeWI0?=
 =?utf-8?B?cHdzMmJQUXA1Uk5xeUI2bG1BTExaZm9WMnZsVm4wSnVMWUdNaTNRaERyd0xw?=
 =?utf-8?B?elFCR2o4MTRVY09Oc2hHWGZ3THhIOGhGb3ZMR2E1WHZOZWFTOVF5ajdJYzJF?=
 =?utf-8?B?WGQ0RFdBZ3hTdGdFN0IxUlJseldpNFI1bVhYZHFBV2RXb01xSGFkenVzSkxq?=
 =?utf-8?B?cHlQNS9UcjdRNFlkYUtWL29ScTh2QmRoM2w1WjFKZS9Ga29OV1JycTBhaWl0?=
 =?utf-8?B?a24zL2hwZElSL0pyb3I3djM5ekR2aGxLUENOUkJCV2NjaGQrVm1zcTN5TmdK?=
 =?utf-8?B?dVBkRnhNRExGUkN5WGI2NVNUYmdBdTdxV2xIUnkrdUF3aE13SVpaREIwMjJt?=
 =?utf-8?B?SGxIVmdTTVZRYmtkVDdIZi9sSCtSaVVFS0pTUlRWYy8xWVBBakJiajdkYnhp?=
 =?utf-8?B?T0szdHBydFdZTmd5djMrbVpxQkgyWkJyZXNYTHhERERLS3lEaFBpMkVVQkdi?=
 =?utf-8?B?U3pEMDFaSGpaYlJMLzlLbmZLVW9Jc21IQStLOEE3bWZUWkxoUXFyZW5hazRU?=
 =?utf-8?B?clNudnRyYXg4aE5ieWkvbzZzMVN3Umg2RjdUKzZReEhtZXNhYnFhaTU4WlhE?=
 =?utf-8?B?K2FmcWxXTHBsNnpiYzhBaUNSYXo3T2ZSeDFOTTZHQmVZdjN3SlM5WGR0bDVu?=
 =?utf-8?B?UkJ2WUVMMzNuRnQ5T245eE1OV0FiSDJ2U3doNHdkb2g4eXl0NGt5YjJ5VUFr?=
 =?utf-8?B?ekNFc2tqSVgyNHlTbzZTZTVyR09xdnNBbDFPOU94Y0FJSVVjMFhZQVgxcGcx?=
 =?utf-8?B?eTdYL29nLzhVb0IzRjFIbHViSlNWZVA0NXRPbmVWY2l0Z1NpQ2owRGNqcHIy?=
 =?utf-8?B?ajdiUG5Vb0gxUHk1a1JLRlVkVDA1MHFKZ21BbEZMdTJMYjV5MHUweHNzYTRu?=
 =?utf-8?B?MGprQzVtRFlTOExjc0x1azdqM0JXdTNTeExMckhpa0Jqbjl6cGMwWktSWUZU?=
 =?utf-8?B?UGRubFJHdml5TWNsYTNxTU91VUZlZlpMUnFYT01qampvaEE2Z1p3K0Via3pX?=
 =?utf-8?B?Sk9VaGVHTHFYWkVWMVZwYTZic3kxSFBiZ1ZUU291WEV1eDhrMEhkYU16S29j?=
 =?utf-8?B?UzJVbTNKckVxbXg3eENvVjlMbFl5cUUreHFkSHlMSVYzVXlaNmhOZzEwcVN6?=
 =?utf-8?Q?r4uzFr/5F4N2Py4hoOMVmC8ma?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ce7696-8811-46b6-73ab-08dc434b9777
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 10:51:52.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsPTRp2CYj3JmahEBFUd0gseYEhc4auRvRsH0BUpJpf8D2RGAVLqgHYC+5keXa3Wx3ZCqYWC90xMwxuEbzzQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Proofpoint-ORIG-GUID: gPU17YhIIDXCatSq8T1FGe87FVKEL-qR
X-Proofpoint-GUID: gPU17YhIIDXCatSq8T1FGe87FVKEL-qR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=912 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42D9wtMp023514
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 10:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8632

Hi Bruce,

I looked into this ceph issue this afternoon. Now I can make do_compile=20
pass.
There's still some do_install issue, but I really need to head home now.
I'll send out my patch soon.

Regards,
Qi


On 3/13/24 02:43, Bruce Ashfield via lists.yoctoproject.org wrote:
> On Tue, Mar 12, 2024 at 1:58=E2=80=AFPM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>> On Mon, Mar 11, 2024 at 6:56=E2=80=AFPM Bruce Ashfield <bruce.ashfield=
@gmail.com> wrote:
>>> On Mon, Mar 11, 2024 at 8:41=E2=80=AFPM Tim Orling <ticotimo@gmail.co=
m> wrote:
>>>> On Mon, Mar 11, 2024 at 2:11=E2=80=AFPM Bruce Ashfield <bruce.ashfie=
ld@gmail.com> wrote:
>>>>> Hi all,
>>>>>
>>>>> I'm still looking for help with this.
>>>>>
>>>>> It's all fine and well that folks have packages that they are
>>>>> interested in more than others, but it needs to be more than
>>>>> maintainers that step up and fix the niche packages.
>>>>>
>>>>> I'm still holding the meta-virt master-next -> master push until Ce=
ph
>>>>> is upgraded and working.
>>>>>
>>>>> I know absolutely nothing about CMake, so I'm flailing around in th=
e
>>>>> build of Ceph and have gotten no further since I last asked for hel=
p.
>>>> Well I did try, but I am no CMake expert nor ceph expert either. I g=
ot stalled on it detecting =E2=80=9Cthrift=E2=80=9D in one of the vendore=
d libraries.
>>> I ended up with that as well (just a few minutes ago), I tried settin=
g
>>> some Thrift variables, but it refuses to detect those as well.
>>>
>>> The errors seem to rotate .. and it isn't even obvious if some are
>>> really fatal, or not.
>>>
>>> Perhaps it just isn't something that cross builds anymore, and I'll
>>> just blacklist it with the broken
>>> recipe.
>>>
>>> I'll have one more try with it tomorrow before giving up.
>> Hi Bruce, Tim,
>>
>> I had a look at this yesterday, and I (possibly?) made some progress
>> with it but wanted to ask before getting too far with an approach:
>> would it be OK to pull out at least some of those vendored components
>> into some new separate recipes, so that rebuilding that compile stage
>> when it needs it is faster?
>>
> I'm fine with stripping it down to the bare minimum to be buildable.
>
> I'd rather have a building (but small) recipe, and then we can see if t=
here's
> demand for more components.
>
> I was also poking at this today, and I'm still seeing dramatically diff=
erent
> results when I call compile multiple times .. all the way back to cmake
> complaining it can't find the python3 interpreter, which was a problem
> I thought I had solved!
>
> Feel free to grab me on the #meta-virt channel if you have any interact=
ive
> questions.
>
> Bruce
>
>> Christopher
>>
>>
>>> Bruce
>>>
>>>> We can only take so much abuse from upstream ;)
>>>>
>>>>
>>>>> Bruce
>>>>>
>>>>> On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
>>>>> lists.yoctoproject.org
>>>>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> If anyone has experience with Cmake, I could use a hand completing=
 the
>>>>>> ceph upgrade that is marked as WIP in master-next.
>>>>>>
>>>>>> It took me a few hours today, but I managed to get past python3
>>>>>> detection issues, but now I'm running into a compiler test failure
>>>>>> during the build.
>>>>>>
>>>>>> To me, it looks like our sysroot isn't being passed, which could b=
e
>>>>>> related to the toolchain.cmake not being used (since the compiler =
test
>>>>>> is being launched by a sub component).
>>>>>>
>>>>>> I'm inclined to be stubborn about this, and keep working on gettin=
g
>>>>>> the package bumped, as it has missed a few upgrades and is in need=
 of
>>>>>> some love.
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>> --
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
>>>>>> thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>>
>>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8629): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8629
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


