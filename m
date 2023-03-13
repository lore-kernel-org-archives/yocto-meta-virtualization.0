Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04138C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 07:19:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13992.1678691933055302331
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Mar 2023 00:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2436e46f61=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D6cPHi014191;
	Mon, 13 Mar 2023 00:18:51 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8t1r16vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 00:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPs7bFnjXXxuQQ/Cb27+QdmT97D/UQdPwAcxYEh/vIVTTWwakg6lP8vicaL5LTSEdI13RnDygAHUL+MGIJftUC2i2nENlVpL9FRiO9DHugTyj8tx+gPPAMDnLQGCCLXyJb4EHgow++csAnnU7Z8ib1hrJ8MlmIkPwLI9EWefwKUM/tTIhRHEb3sRvwlG1tgI0k1nHgWSFD87a0Os9Czg8zPCaEq/Yi2ZwU2MdVUgJ6wQbF3j++D4p+i5/uukbiwiDQ4Bfex/vKQnECJXrawMrorfpbW1qNxdm1V3FrMisHQC8UOxZJvC7lIWNZo6ApT+fhJJFSTW6wAZfS+HXtU/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnrcHhbvZrSKCP7uWXMNX2J3h1XcL0nqwmdAiDx4GH4=;
 b=dCIu6rKOCtCY10/wSwfc+5hPxo7kKmT0QnsUGJFHtllCmzKKcXkPNAqiaBWAJJlx4jEaiF2/YSZ4DxJDG0ZMdyZyZtXup03K07pJm95SkQzCN9JPbQ2c7FvPAPqluLcIErAmhWkb6zs/hZL75ZMkzW/+XJ6QgEGx0y+GgJtl5pCv4X7tErFpqALsdpaTgElToO9HswVsxb5Tmn8uFxnPcvtj+mMEyYj0bZfgCbGmAUv68IPlRBs9yCp1Y3lePGr+sXIPdBV8LJ3Yk8e92GtZZG5UoYQRQpwd0o0tUEhiN4AtlW5Dacjjk2HjJPYvOsJ7/KjY0fy3ZqVk0VUnWT5i4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:18:48 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:18:48 +0000
Message-ID: <5172dc9e-c30d-6887-e1b8-fe10b4b22d8b@windriver.com>
Date: Mon, 13 Mar 2023 15:18:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com>
 <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
 <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com>
 <fdac15fe-933b-c765-33a1-5973df90f920@windriver.com>
 <CADkTA4M485ucEDAf754n+S6ObwNqjHwmk1H0VdL1nPDhfMc4aw@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4M485ucEDAf754n+S6ObwNqjHwmk1H0VdL1nPDhfMc4aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc04741-847b-4518-209d-08db23933039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	naCWIAubmULtiAX1fzjO827gyyms/2Ow700xKwEXMqU97qr9ix7uBt5JDlT8OOptUJ5KernEU6zy5cnjKBgp5zLmtzBTdVkl3DGyfw14W1rsXb62fFkHuc/m5ml2NX01Vm1svmI4RMNf7aI83XtqomCAMJ7l49YxaJ+r20HZRIovDAmvF54GGVQ4qLoRZqQUv+xVHGk1HLKfgDvFF1Z/7QxWpn8oKuEv117GV2ku/PvIEhYpqWTX1QT7edvd+zluTkruKQ+zFSLFtDCRozBdplWburRuAHgvOBBGZJ3izT7DuSMu8c2Vj7rUOcuUbAifGHu3UUWi6rzRJz2vUyHaQVhRFRLNcKMR0Go9aSIbkVQrxgueHwC+Qx3N1ZOyW3bRimdCl+YXMKQk6VX0bkG8Ll55RCgQML+yf4Ri7fes7j2iJ5P93D4SblKpNsJCdVuu09yUHZCplzdk1lrZBlXWRQVWk54jgpGyGzBjtuAvbOy8XH4OwT+bxf2lIKAlthVQzA3jJ/6kqplJYw9+OMvR33wNHwXbcZE6FNQX0GRJD4dq62u1Es3zvFW9hKacPmY0431kJT/43IGwEMHohEYnXvmSYVo0OGRLDcFAvVXSrBBlECpyDHHozq0u/efFCGJMWjjpEpfP5aJ9xqou8aw7srpWKArmLPQaeHZsvPOjI+2MosOsGBCyRCH6BQZSCBjeWtSahEl5dJFMWosC6ZpepQpa1mp9//7kyVeO41uSk3dmRM+l2dD+WGddwuolTiqh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(451199018)(8936002)(44832011)(30864003)(5660300002)(41300700001)(6916009)(4326008)(83170400001)(31696002)(36756003)(38100700002)(2906002)(31686004)(9686003)(26005)(83380400001)(966005)(478600001)(186003)(6486002)(6666004)(66899018)(8676002)(6506007)(66476007)(66946007)(53546011)(6512007)(18074004)(316002)(66556008)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWxzMHFCUWx3TkdkY2J5R1NjTDY1VHdya3lRRm0vVEtWSTZ0SU9zU2JzNlA3?=
 =?utf-8?B?WWFYSCtmb21wQnhjR29Jby9Zc0tzZ0YvVUtUSmdrQ0Mxb0dWdDZzVU0vODVG?=
 =?utf-8?B?N2p0RDc3cnQ0MVp3QnFNSXVkMHMwUGNmbk1YYVovc1I4TGp6NE1valdlMzFi?=
 =?utf-8?B?MjRicUt5TnMwUUVaUm8yK0VHMDZXaytPWk9FbSs1VFhKU3pOVGRaeHA3MTBG?=
 =?utf-8?B?MnRwZmpySFR3RVNSNWR1cGlXYWhUeFZKZENLWGFkeDEzY1MwU0hxQTRWaEZF?=
 =?utf-8?B?bTExYjBEQnM3RERNanh6QnRBT1VEbHJCdlFoWTRuM0VPUUhTSTMvMGgybGJy?=
 =?utf-8?B?NmVpRTZFNHlFMk9xRzhPM2U2Q1VKRlYvZmpPYzRJS3NHeG5YazNpTExLY3Rp?=
 =?utf-8?B?RVpwNlk3WkdWVm1oUmI3bWRiRFpRNWJSRjcwekUzUCsrL3MrY1J6S293YTJB?=
 =?utf-8?B?YzJob01IVTNrZWRtR0NPZ29wSnpaR3RYT0YrQUFYdWE2MUxBZnlEenRKTkF0?=
 =?utf-8?B?cDNzb3NCK1ZUOUVYOEtmRHBUWTBpaHg4cFVrSmNjNlFOd0JyWWJVSSt0bmRX?=
 =?utf-8?B?ekx6WmdGdEphWGI2ZmNZL2xjK2g3T0xEOW80RWtGdVQ3U0VVT2F6VXFKSkVt?=
 =?utf-8?B?QTFXQ0dGbFVJOXNPckl0ZHZvK2RXZkFJWXpXbGdSa3h3NnUwcWhrN21mQVpH?=
 =?utf-8?B?S1RVS1d3WEJRTEZtMmxsdFVyRXhCWlg3ZU9DNXhVSDJBaGZnaUU5UXIyam4x?=
 =?utf-8?B?VTNqWldZbjA2Q3JFM3BFLzZuRUhucXU4NG5uMk1Ta1liSVYyTU1KQnBZR2dw?=
 =?utf-8?B?SW9kT2N0QVFsa1FmS3ZYTFNZYVUxZW5JZDlTRXV1M2RrVkxlejB1dmFDb0wr?=
 =?utf-8?B?Wjl6bEFsS2xDcWZrZy8wNVdaeGV5eWFZZzB0UVA5ZGxrK2lHeEZPdGh4SU5L?=
 =?utf-8?B?TTVZc3N0bmhKZVhMNGkxUEoxRytCWElUQmZDV1FTRld0M2ZDL0oyVDF5bmRm?=
 =?utf-8?B?NGtod3VZWFg1MG9yM29vMUpMOHdnZzhVRWFQQ1FQQm94R0h6MkdsN1dhdGxp?=
 =?utf-8?B?QWp0TE51MUlGS01INm1qb1d3SVFqN3JCeGpkc081NklTL1A2SXR4RDdicTNj?=
 =?utf-8?B?cjZkckljb1ZoUE0reTNVR2g3YktHMW9Xc3NjakNDZjlDQzFGWGZPZDZoSkxy?=
 =?utf-8?B?c3BlcmsxeGpsZXpOV1lPMFMyYnBZbFhEUUJjcTNGQXdJSUhSVXRIbjBmWk1h?=
 =?utf-8?B?aEdFOG0vZjBMTkFZbC8wSERYOUQwWTVVaDdWOGFWZ3MrUTMzcXRIckx2aHNh?=
 =?utf-8?B?TkQycU9kWjBlaCtYWE42UWpHOTVicCtvRGtIOFgrLzcvNjUwMlR2YWdqcWlk?=
 =?utf-8?B?U1RnbHFidzV1ZlFjQThSTzl4NWt2cnRJTzU1TEZiTU1vMUVNNG83Y1NWeGVP?=
 =?utf-8?B?d3JDbFR4UTFUUUpoWVI3Znp5dy9zMUdqR1ZxTHAzajh2MVhDd0MzbG1VMVVr?=
 =?utf-8?B?MU1mSXBwNSs2NDJmays5a2wvejYrMEZNUkhYUHhKbHhGb3p0V0tkZDQ0bXVC?=
 =?utf-8?B?eHFDRno4T1MybVpQUjY4SEN1NHFrb2dLREY4MWZHYkFBQ3YvNVNPUko2L1pT?=
 =?utf-8?B?bEZ1bnZrOE5COHZlQk0rU1ppK0RmanRsN3dmYmRvTjFYQ1dqU3RtckJDTGRZ?=
 =?utf-8?B?L2EzWGsvbjBwc1VpZlJoYWxHOFNtbHkvVW4rcGZwUVIxWEFhcHlHVk5hSnFU?=
 =?utf-8?B?VTNnbFF6ZWdhMlEya3l3RzRQNHo5ZTNaUkxIbFczK3Nzdi9Kak9oVFhzY3Rp?=
 =?utf-8?B?NHE2TDVRR0xxZTl0eE9waTNXajhTU0NCNnBURjFaQ2JBSHNIaXVMcGlsVnM4?=
 =?utf-8?B?WEQvTzZyN3Z6K1k3cktSMTZVZDRDUVpxNjNYblQvcjA1Rmc5Q0V2dGNDMThj?=
 =?utf-8?B?T0pFUGppblVJaTRRME1VUTZEeGRHbFpLa01YY044dkh0RGFmcWVZOElEd1M2?=
 =?utf-8?B?eWZlOFRoOS8xVCtsa0tCVUVsYzFCem1FZ2ZCOGRmaWJBV29QelBjcHpJdnF1?=
 =?utf-8?B?ckxGUlAwbmNLSTBITHRVQTZUcVFGTUpSeWFqYXUwMkkySGR1aU1lTW15YXpT?=
 =?utf-8?B?cVNBY05UYjZZWVNMbHdwUUpaTUlqQVFUMlFKTGdQbUlvZ2dORTdUd2tYdWFW?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc04741-847b-4518-209d-08db23933039
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:18:48.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBbsUlDRaTzX/qzcwJnwVnvChQCS0W6TvQxa0vFrsmuwQlyzhbigVPfDLMAB2Yx1pathTz+MvUuebgYmFMGLrfgje/sMjRs2q5FVgTS/wi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-Proofpoint-ORIG-GUID: bR8t5jtJq4ZI6Pi7UGpzRcZ20lsdLhO1
X-Proofpoint-GUID: bR8t5jtJq4ZI6Pi7UGpzRcZ20lsdLhO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32D6cPHi014191
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Mar 2023 07:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7941

Hi Bruce,

On 3/13/23 08:46, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Mar 8, 2023 at 10:49=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> Hi Bruce,
>>
>>
>> Sorry for being late,
>>
>> On 3/8/23 12:00, Bruce Ashfield wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Thu, Mar 2, 2023 at 8:17=E2=80=AFPM Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>> Hi Bruce,
>>>>
>>>>
>>>> On 3/3/23 05:24, Bruce Ashfield wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-bus=
ybox.in: if busybox contains init then use it
>>>>> on 01/03/2023 Xiangyu Chen wrote:
>>>>>
>>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>>
>>>>>> Hi Bruce,
>>>>>>
>>>>>> Recently we found that the lxc ptest has lots of failure cases as =
below log-1, after checking the
>>>>>> code, some cases failed due to related the init progess. For examp=
le, lxc-test-exit-code need to
>>>>>> start container as daemon, but if using bash as init, the containe=
r cannot start correctly.
>>>>> Is there an indication of what busybox is providing that bash isn't=
 ?
>>>> In my local setup, when using bash as container init, the container
>>>> doesn't support "reboot" and cannot start correctly in a daemon mode=
,
>>>> test step as below:
>>>>
>>>> lxc-create -t busybox -n t
>>>>
>>>> lxc-start -n t -d
>>>>
>>>> lxc-ls -f
>>>>
>>>> the container "t" status still in "STOPPED", but when we use a busyb=
ox
>>>> init instead of bash, the container status is correct in daemon mode.
>>>>
>>> I'm setting up to test this myself, but generally speaking we should
>>> include this detail in the commit log.
>> Thanks, if we find the final root cause, I'll add our discussion
>> information into the commit and send a v2 patch :p
>>
>>
>>>>> I don't like to force this in the ptest, while for actual lxc conta=
iners
>>>>> we still allow bash, which means it may not be functional.
>>>> This is a common template for lxc, but I am not sure whether others
>>>> still need bash as lxc container init, so I based the patch
>>>>
>>>> "template-make-busybox-template-compatible-with-core-.patch" to add =
the
>>>> busybox back.
>>>>
>>> That's the part that concerns me. Why does our bash behave differentl=
y
>>> than in other lxc integrations and other distros ?
>> Currently, the behavior is when using lxc with busybox template in
>> daemon mode, the status still stay in "STOPPED", but it's working well
>> in foreground mode.
>>
>>> Do you have the ability to run the same simple tests you have above o=
n
>>> a desktop distro ?
>> I have setup a virtualbox today and did some test with trace, here is
>> something I was found:
>>
>> As above mentioned,  lxc working well in foreground mode but something
>> wrong with daemon mode, according to manual of lxc-start, the foregrou=
nd
>> mode attach the tty to /dev/console, but daemon mode doesn't.
>>
> And to confirm, this is running on something like ubuntu, using the
> ubuntu bash ?

It was a virtualbox VM with openSUSE Leap 15.5, lxc version is 4.0.12,=20
bash version is 4.4.23, busybox using master branch and was built by myse=
lf.


When using busybox as init, the container run as daemon is normal:

localhost:~ # lxc-create --version
4.0.12
localhost:~ # lxc-create -t busybox -n t-bb
localhost:~ # lxc-start -n t-bb -d
localhost:~ # lxc-ls -f
NAME STATE=C2=A0=C2=A0 AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGED
t-bb RUNNING 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 false
localhost:~ # lxc-stop -n t-bb
localhost:~ # lxc-ls -f
NAME STATE=C2=A0=C2=A0 AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGED
t-bb STOPPED 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 false
localhost:~ #
localhost:~ #


The strace log:

#####log of "strace -f=C2=A0 lxc-start -n t-bb -d" #######

execve("/usr/bin/lxc-start", ["lxc-start", "-n", "t-bb", "-d"],=20
0x7ffe0ef0e300 /* 57 vars */) =3D 0
... loading and mapping libraries for lxc ...

[pid 23053] execve("/sbin/init", ["/sbin/init"], 0x563be8d3fae0 /* 2=20
vars */ <unfinished ...>

... loading and mapping libraries for /sbin/init in container...

[pid 23053] reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,=20
LINUX_REBOOT_CMD_CAD_OFF) =3D -1 EINVAL (Invalid argument)
[pid 23053] openat(AT_FDCWD, "/dev/null", O_RDWR) =3D 3
[pid 23053] close(3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 23053] ioctl(0, VT_OPENQRY, 0x7ffd8e2e5b28) =3D -1 ENOTTY=20
(Inappropriate ioctl for device)
[pid 23053] brk(NULL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x19ea000
[pid 23053] brk(0x1a0b000)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x1a0b000
[pid 23053] ioctl(0, TCGETS, 0x7ffd8e2e5a90) =3D -1 ENOTTY (Inappropriate=
=20
ioctl for device)
[pid 23053] chdir("/")=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 23053] setsid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1 EPERM=
 (Operation not permitted)
[pid 23053] openat(AT_FDCWD, "/etc/inittab", O_RDONLY) =3D 3
[pid 23053] fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D97, ...}) =3D 0
[pid 23053] read(3, "::sysinit:/etc/init.d/rcS\ntty1::"..., 4096) =3D 97
[pid 23053] read(3, "", 4096)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 0
[pid 23053] close(3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0

.... add signal process callback ....

[pid 23054] execve("/etc/init.d/rcS", ["/etc/init.d/rcS"], 0x19ea2a0 /*=20
6 vars */ <unfinished ...>

.... loading and mapping libraries for running /etc/init.d/rcS .....

[pid 23055] execve("/bin/syslogd", ["/bin/syslogd"], 0x1308670 /* 8 vars=20
*/) =3D 0

.....

[pid 23056] execve("/bin/mount", ["/bin/mount", "-a"], 0x13086b8 /* 8=20
vars */ <unfinished ...>

...

[pid 23057] execve("/bin/udhcpc", ["/bin/udhcpc"], 0x1308670 /* 8 vars=20
*/) =3D 0

...

[pid 23058] execve("/bin/getty", ["/bin/getty", "-L", "tty1", "115200",=20
"vt100"], 0x19ea2a0 /* 6 vars */ <unfinished ...>

...

[pid 23061] execve("/bin/sh", ["/bin/sh"], 0x13d02a0 /* 6 vars */=20
<unfinished ...>

[pid 23061] ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
...
[pid 23061] ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0

[pid 23061] openat(AT_FDCWD, "/dev/tty", O_RDWR) =3D 3
[pid 23061] fcntl(3, F_DUPFD_CLOEXEC, 10) =3D 10
[pid 23061] close(3 <unfinished ...>
[pid 23061] <... close resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 0
[pid 23061] ioctl(10, TIOCGPGRP <unfinished ...>
[pid 23061] <... ioctl resumed>, [8])=C2=A0=C2=A0 =3D 0
[pid 23061] getpgrp()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 8
...
[pid 23061] setpgid(0, 8 <unfinished ...>
[pid 23061] <... setpgid resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1 E=
PERM (Operation not permitted)
[pid 23061] ioctl(10, TIOCSPGRP, [8] <unfinished ...>
[pid 23061] <... ioctl resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 0
[pid 23061] ioctl(0, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
[pid 23061] ioctl(0, SNDCTL_TMR_START or TCSETS, {B38400 opost -isig=20
-icanon -echo ...} <unfinished ...>
[pid 23061] <... ioctl resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 0
[pid 23061] ioctl(0, TIOCGWINSZ, {ws_row=3D0, ws_col=3D0, ws_xpixel=3D0,=20
ws_ypixel=3D0}) =3D 0
[pid 23061] geteuid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 23061] openat(AT_FDCWD, "/etc/passwd", O_RDONLY) =3D 3
[pid 23061] fstat(3,=C2=A0 <unfinished ...>
[pid 23061] <... fstat resumed>{st_mode=3DS_IFREG|0644, st_size=3D30, ...=
}) =3D 0
[pid 23061] read(3,=C2=A0 <unfinished ...>
[pid 23061] <... read resumed>"root:x:0:0:root:/root:/bin/sh\n", 4096) =3D=
 30
[pid 23061] close(3 <unfinished ...>
[pid 23061] <... close resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 0
[pid 23061] geteuid( <unfinished ...>
[pid 23061] <... geteuid resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 23061] fstat(1,=C2=A0 <unfinished ...>
[pid 23061] <... fstat resumed>{st_mode=3DS_IFCHR|0620,=20
st_rdev=3Dmakedev(0x88, 0x2), ...}) =3D 0
[pid 23061] rt_sigaction(SIGWINCH, {sa_handler=3D0x4b9ce8, sa_mask=3D[],=20
sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fc7eecdcd50},=C2=A0=20
<unfinished ...>
[pid 23061] <... rt_sigaction resumed>{sa_handler=3DSIG_DFL, sa_mask=3D[]=
,=20
sa_flags=3D0}, 8) =3D 0
[pid 23061] write(1, "/ # ", 4 <unfinished ...>
[pid 23061] <... write resumed>)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 4
[pid 23061] poll([{fd=3D0, events=3DPOLLIN}], 1, -1 <unfinished ...>
############end of "strace -f=C2=A0 lxc-start -n t-bb -d" ###############



When using bash as init, the container can run in foreground mode:

localhost:~ # lxc-create -t busybox -n t-bash
localhost:~ # lxc-start -n t-bash -d
localhost:~ # lxc-ls -f
NAME=C2=A0=C2=A0 STATE=C2=A0=C2=A0 AUTOSTART GROUPS IPV4 IPV6 UNPRIVILEGE=
D
t-bash STOPPED 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 false
t-bb=C2=A0=C2=A0 STOPPED 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 =
false
localhost:~ # lxc-start -n t-bash -F
init-4.4#
init-4.4#
init-4.4# /sbin/init --version
GNU bash, version 4.4.23(1)-release (x86_64-suse-linux-gnu)
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later=20
<http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
init-4.4# exit
exit
localhost:~ #

The strace log:

#####log of "strace -f=C2=A0 lxc-start -n bash -d" #######

[pid 22977] execve("/sbin/init", ["/sbin/init"], 0x562a9b3d80f0 /* 2=20
vars */ <unfinished ...>
.... loading and mapping libraries .......
[pid 22977] openat(AT_FDCWD, "/dev/tty", O_RDWR|O_NONBLOCK) =3D -1 ENXIO=20
(No such device or address)
[pid 22977] ioctl(0, TCGETS, 0x7ffc1d039fa0) =3D -1 ENOTTY (Inappropriate=
=20
ioctl for device)
[pid 22977] stat("/usr/lib/locale/locale-archive", 0x7ffc1d03a110) =3D -1=
=20
ENOENT (No such file or directory)
[pid 22977] brk(NULL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x562bad4cf000
[pid 22977] brk(0x562bad4f0000)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D 0x562bad4f0000
[pid 22977] getuid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] getgid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] geteuid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] getegid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
[pid 22977] ioctl(0, TCGETS, 0x7ffc1d03a120) =3D -1 ENOTTY (Inappropriate=
=20
ioctl for device)
[pid 22977] ioctl(-1, TIOCGPGRP, 0x7ffc1d03a194) =3D -1 EBADF (Bad file=20
descriptor)
[pid 22977] sysinfo({uptime=3D5034, loads=3D[13568, 5344, 992],=20
totalram=3D4115214336, freeram=3D1067577344, sharedram=3D30674944,=20
bufferram=3D1994752, totalswap=3D2148507648, freeswap=3D2148507648, procs=
=3D381,=20
totalhigh=3D0, freehigh=3D0, mem_unit=3D1}) =3D 0
.... add signal process callback and start process network=20
configurations in /etc ....

[pid 22977] openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) =3D 3
[pid 22977] lseek(3, 0, SEEK_CUR)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 0
[pid 22977] fstat(3, {st_mode=3DS_IFREG|0644, st_size=3D30, ...}) =3D 0
[pid 22977] read(3, "root:x:0:0:root:/root:/bin/sh\n", 4096) =3D 30
[pid 22977] close(3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] getppid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] getpid()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1
[pid 22977] getpgrp()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1
[pid 22977] ioctl(2, TIOCGPGRP, 0x7ffc1d03a064) =3D -1 ENOTTY=20
(Inappropriate ioctl for device)
[pid 22977] rt_sigaction(SIGCHLD, {sa_handler=3D0x562bacebdb50,=20
sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,=20
sa_restorer=3D0x7fdb74971d50}, {sa_handler=3DSIG_DFL, sa_mask=3D[],=20
sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fdb74971d50}, 8) =3D =
0
[pid 22977] ioctl(2, TIOCGPGRP, 0x7ffc1d03a044) =3D -1 ENOTTY=20
(Inappropriate ioctl for device)
[pid 22977] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D15574,=20
rlim_max=3D15574}) =3D 0
[pid 22977] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
[pid 22977] fcntl(0, F_GETFL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 0x8002 (flags O_RDWR|O_LARGEFILE)
[pid 22977] fstat(0, {st_mode=3DS_IFCHR|0666, st_rdev=3Dmakedev(0x1, 0x3)=
,=20
...}) =3D 0
[pid 22977] lseek(0, 0, SEEK_CUR)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 0
[pid 22977] read(0, "", 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid 22977] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
[pid 22977] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
[pid 22977] exit_group(0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D ?
[pid 22977] +++ exited with 0 +++
#####end of "strace -f=C2=A0 lxc-start -n bash -d" #######



Br,

Xiangyu

>
>> I was enable the lxc debug trace as below when start a container with
>> daemon mode (part of init related log and remove timestamp and full
>> source code path)
>>
>> ##### lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
>>
>> start - /src/lxc/start.c:post_start:2205 - Started "/sbin/init" with p=
id
>> "871"
>> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
>> state to RUNNING
>>
>> <<<<<<<<< we can see the bash as init was starting, and lxc update mod=
e
>>
>> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state client=
s
>> registered
>> mainloop - /src/lxc/mainloop.c:__epoll_open:493 - Created epoll instan=
ce
>> mainloop - /mainloop.c:__epoll_open:493 - Created epoll instance
>> start - /src/lxc/start.c:lxc_poll:626 - Mainloop is ready
>> start - /src/lxc/start.c:signal_handler:396 - Received signal
>> ssi_signo(17) for ssi_pid(871), si_signo(17), si_pid(871)
>> start - /src/lxc/start.c:signal_handler:464 - Container init process 8=
71
>> exited
>>
>> <<<<<<<<<< seems something wrong with the init, it exited and lxc got
>> the exit signal.
>>
>> start - /src/lxc/start.c:lxc_poll:643 - Closed console mainloop
>> start - /src/lxc/start.c:lxc_poll:648 - Closed mainloop
>> start - /src/lxc/start.c:lxc_poll:651 - Closed signal file descriptor =
7
>> ..... removed some networking teminating related trace .....
>> start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container
>> state to STOPPING
>>
>> <<<<<<<<<<< now the lxc set container mode back to stop mode.
>>
>> start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state client=
s
>> registered
>> ##### end of lxc-start -n t -o /tmp/log.txt -l TRACE  -d #####
>>
>>
>> Let's use strace to see what happens in container(part of init related=
 log):
>>
>> #####strace -s 1024 -f lxc-start -n t -d #####
>>
>> [pid  1211] execve("/sbin/init", ["/sbin/init"], 0x55a07c90eb30 /* 1 v=
ar
>> */ <unfinished ...>
>> ......
>>
>> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe212610c) =3D -1 ENOTTY
>> (Inappropriate ioctl for device)
>> [pid  1211] rt_sigaction(SIGCHLD, {sa_handler=3D0x5632e07dcec0,
>> sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,
>> sa_restorer=3D0x7f1237db3190}, {sa_handler=3DSIG_DFL, sa_mask=3D[],
>> sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7f1237db3190}, 8) =3D=
 0
>> [pid  1211] ioctl(2, TIOCGPGRP, 0x7fffe21260ec) =3D -1 ENOTTY
>> (Inappropriate ioctl for device)
>> [pid  1211] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D3818,
>> rlim_max=3D3818}) =3D 0
>> [pid  1211] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
>> [pid  1211] fcntl(0, F_GETFL)           =3D 0x8002 (flags O_RDWR|O_LAR=
GEFILE)
>> [pid  1211] newfstatat(0, "", {st_mode=3DS_IFCHR|0666,
>> st_rdev=3Dmakedev(0x1, 0x3), ...}, AT_EMPTY_PATH) =3D 0
>> [pid  1211] lseek(0, 0, SEEK_CUR)       =3D 0
>> [pid  1211] read(0, "", 1)              =3D 0
>> [pid  1211] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
>> [pid  1211] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
>> [pid  1211] exit_group(0)               =3D ?
>> [pid  1211] +++ exited with 0 +++
>> #####end of strace -s 1024 -f lxc-start -n t -d #####
>>
>> it looks that seems bash stdi/o/err cannot attach the available caused
>> this issue, right?
> It does look like that. When busybox is used as init, do you have a
> similar strace ? I'd like to do that comparison.
>
> Bruce
>
>>
>>> I don't want to force this switch to busybox, without understanding i=
f
>>> we are the only ones seeing this issue .. since that means we are
>>> simply hiding an issue, versus fixing it.
>> Yes indeed, if someone is using systemd as init, they need to add extr=
a
>> configurations to setup busybox and keep default systemd init cannot b=
e
>> replaced by busybox in local.conf .
>>
>>
>> Thanks,
>>
>> Xiangyu
>>
>>> Bruce
>>>>> There are other init options in meta-virt, like the docker tini, if=
 we
>>>>> had to enforce something, I'd rather that than busybox.
>>>> Good to hear the tini :)
>>>>
>>>> Indeed, enable the busybox-init might need lots of additional effort=
 to
>>>> take care of system which using systemd, otherwise, /sbin/init alway=
s to
>>>> be covered by busybox.
>>>>
>>>>> Bruce
>>>> Br,
>>>>
>>>> Xiangyu
>>>>
>>>>
>>>>>> So added a busybox init utils checking in lxc-busybox template, if=
 current system busybox contains
>>>>>> init then use it, after applying this patch, the ptest result as l=
og-2.
>>>>>>
>>>>>>
>>>>>> ######## 1og-1: ptest without patch #######
>>>>>>
>>>>>> Starting LXC ptest ###
>>>>>> FAIL: lxc-test-api-reboot
>>>>>> SKIPPED: lxc-test-apparmor
>>>>>> PASS: lxc-test-apparmor-generated
>>>>>> FAIL: lxc-test-apparmor-mount
>>>>>> PASS: lxc-test-arch-parse
>>>>>> FAIL: lxc-test-attach
>>>>>> PASS: lxc-test-automount
>>>>>> FAIL: lxc-test-autostart
>>>>>> PASS: lxc-test-basic
>>>>>> FAIL: lxc-test-capabilities
>>>>>> FAIL: lxc-test-cgpath
>>>>>> PASS: lxc-test-checkpoint-restore
>>>>>> FAIL: lxc-test-cloneconfig
>>>>>> FAIL: lxc-test-clonetest
>>>>>> FAIL: lxc-test-concurrent
>>>>>> PASS: lxc-test-config-jump-table
>>>>>> FAIL: lxc-test-console
>>>>>> FAIL: lxc-test-console-log
>>>>>> FAIL: lxc-test-containertests
>>>>>> FAIL: lxc-test-createconfig
>>>>>> FAIL: lxc-test-createtest
>>>>>> PASS: lxc-test-criu-check-feature
>>>>>> FAIL: lxc-test-cve-2019-5736
>>>>>> FAIL: lxc-test-destroytest
>>>>>> FAIL: lxc-test-device-add-remove
>>>>>> FAIL: lxc-test-exit-code
>>>>>> FAIL: lxc-test-get_item
>>>>>> PASS: lxc-test-getkeys
>>>>>> PASS: lxc-test-list
>>>>>> PASS: lxc-test-locktests
>>>>>> FAIL: lxc-test-lxc-attach
>>>>>> PASS: lxc-test-lxcpath
>>>>>> PASS: lxc-test-may-control
>>>>>> FAIL: lxc-test-mount-injection
>>>>>> FAIL: lxc-test-no-new-privs
>>>>>> PASS: lxc-test-parse-config-file
>>>>>> FAIL: lxc-test-proc-pid
>>>>>> FAIL: lxc-test-procsys
>>>>>> PASS: lxc-test-raw-clone
>>>>>> PASS: lxc-test-reboot
>>>>>> FAIL: lxc-test-rootfs
>>>>>> FAIL: lxc-test-rootfs-options
>>>>>> FAIL: lxc-test-saveconfig
>>>>>> FAIL: lxc-test-share-ns
>>>>>> FAIL: lxc-test-shortlived
>>>>>> SKIPPED: lxc-test-shutdowntest
>>>>>> FAIL: lxc-test-snapdeps
>>>>>> FAIL: lxc-test-snapshot
>>>>>> FAIL: lxc-test-startone
>>>>>> SKIPPED: lxc-test-state-server
>>>>>> FAIL: lxc-test-symlink
>>>>>> FAIL: lxc-test-sys-mixed
>>>>>> FAIL: lxc-test-sysctls
>>>>>> FAIL: lxc-test-unpriv
>>>>>> FAIL: lxc-test-usernic
>>>>>> PASS: lxc-test-usernsexec
>>>>>> PASS: lxc-test-utils
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Results:
>>>>>>        PASSED =3D 17
>>>>>>        FAILED =3D 37
>>>>>>        SKIPPED =3D 3
>>>>>> (for details check individual test log in ./logs directory)
>>>>>>
>>>>>>
>>>>>> ###########log-2: ptest with patch ###################
>>>>>> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
>>>>>> ### Starting LXC ptest ###
>>>>>> PASS: lxc-test-api-reboot
>>>>>> SKIPPED: lxc-test-apparmor
>>>>>> PASS: lxc-test-apparmor-generated
>>>>>> FAIL: lxc-test-apparmor-mount
>>>>>> PASS: lxc-test-arch-parse
>>>>>> PASS: lxc-test-attach
>>>>>> PASS: lxc-test-automount
>>>>>> PASS: lxc-test-autostart
>>>>>> PASS: lxc-test-basic
>>>>>> PASS: lxc-test-capabilities
>>>>>> PASS: lxc-test-cgpath
>>>>>> PASS: lxc-test-checkpoint-restore
>>>>>> FAIL: lxc-test-cloneconfig
>>>>>> PASS: lxc-test-clonetest
>>>>>> PASS: lxc-test-concurrent
>>>>>> PASS: lxc-test-config-jump-table
>>>>>> PASS: lxc-test-console
>>>>>> PASS: lxc-test-console-log
>>>>>> PASS: lxc-test-containertests
>>>>>> PASS: lxc-test-createconfig
>>>>>> PASS: lxc-test-createtest
>>>>>> PASS: lxc-test-criu-check-feature
>>>>>> PASS: lxc-test-cve-2019-5736
>>>>>> PASS: lxc-test-destroytest
>>>>>> PASS: lxc-test-device-add-remove
>>>>>> PASS: lxc-test-exit-code
>>>>>> FAIL: lxc-test-get_item
>>>>>> PASS: lxc-test-getkeys
>>>>>> PASS: lxc-test-list
>>>>>> PASS: lxc-test-locktests
>>>>>> PASS: lxc-test-lxc-attach
>>>>>> PASS: lxc-test-lxcpath
>>>>>> PASS: lxc-test-may-control
>>>>>> PASS: lxc-test-mount-injection
>>>>>> FAIL: lxc-test-no-new-privs
>>>>>> PASS: lxc-test-parse-config-file
>>>>>> PASS: lxc-test-proc-pid
>>>>>> PASS: lxc-test-procsys
>>>>>> PASS: lxc-test-raw-clone
>>>>>> PASS: lxc-test-reboot
>>>>>> PASS: lxc-test-rootfs
>>>>>> PASS: lxc-test-rootfs-options
>>>>>> PASS: lxc-test-saveconfig
>>>>>> PASS: lxc-test-share-ns
>>>>>> PASS: lxc-test-shortlived
>>>>>> SKIPPED: lxc-test-shutdowntest
>>>>>> FAIL: lxc-test-snapdeps
>>>>>> PASS: lxc-test-snapshot
>>>>>> PASS: lxc-test-startone
>>>>>> SKIPPED: lxc-test-state-server
>>>>>> PASS: lxc-test-symlink
>>>>>> PASS: lxc-test-sys-mixed
>>>>>> PASS: lxc-test-sysctls
>>>>>> FAIL: lxc-test-unpriv
>>>>>> FAIL: lxc-test-usernic
>>>>>> PASS: lxc-test-usernsexec
>>>>>> PASS: lxc-test-utils
>>>>>>
>>>>>> Results:
>>>>>>        PASSED =3D 47
>>>>>>        FAILED =3D 7
>>>>>>        SKIPPED =3D 3
>>>>>> (for details check individual test log in ./logs directory)
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Xiangyu Chen (1):
>>>>>>      lxc: templates/lxc-busybox.in: if busybox contains init then =
use it
>>>>>>
>>>>>>     ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++=
++++++++
>>>>>>     recipes-containers/lxc/lxc_git.bb             |  1 +
>>>>>>     2 files changed, 46 insertions(+)
>>>>>>     create mode 100644 recipes-containers/lxc/files/0001-template-=
if-busybox-contains-init-use-it-in-containe.patch
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-v=
irtualization/message/7908
>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/105081=
0
>>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/=
unsub [bruce.ashfield@gmail.com]
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>
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

