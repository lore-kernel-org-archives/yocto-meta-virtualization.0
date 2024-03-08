Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E31C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:28:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10584.1709861278579911884
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 17:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797153437=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4280YGlW023144;
	Fri, 8 Mar 2024 01:27:57 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawwyf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 01:27:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMbra7LIhutDRICfdy1GlsL9jTi0AdCHnweMLxH/ZcZRa//vFhiqU2cr53LBHW58jWLT2Zn6Re47dSWlBzBKzIFqLg4URtYHR5Yg491pR7luWLIYLHTG+jWC6AC5HkkcLiqCZO1w7KWOwtoHuOGSnXPLf/4mqIZ6+lp/Q26UlXy7DMq52BR8XGXyDK10y915xtyOD/ADCFTbdIqGxjU631tUZm8TuRokbz3zPpbf1tIM3g101IU8M1GABFn+Hnbe4MSo9hdO0GKHbiINik4eh9bwud6iF7rJ/j4JXAVfB1xabM1zSCpXJ8pGFvP5xkWE/KxdVavybfoMfeFHJE1qBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCrqTH9oN9pZuaJ3wfCz94rXPC9rllK7Si1khezseF8=;
 b=kOcOJcsmPc4+HACb/9Nzi4IatAC843Hm2K4fGd5oy0gww04x398Zyk0V8i1OfcAAt5bmuV8R0uhhwM8up9QWYZjQ3HPDaTxcDqL2PhpzobWgHbhDfA1S8BxzBi7rJAxU7hFKkwaV4qLa8qlKPrGnC5E+OkWDttvBqAILVxYrmKZYt2UYJRVm58zXlB1nnhKAJtsqqweEmdTnFnRyv43Q9zg/BarS8j1W6f9qPkx3gHhvfSqlmmVmS4GquIhWQVBUIunGwJblNHs6TXqnzL55FhpuHSHCz7AIRDYQcihRbHRVbPsklcASEL8p19u/jDCzlo4gM7Gy3mEZVzJ0T7D1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 01:27:46 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 01:27:46 +0000
Message-ID: <22a0afa6-b2ef-419e-91a6-a5ef87e9100e@eng.windriver.com>
Date: Fri, 8 Mar 2024 09:27:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] kernel/cfg: add CONFIG_CGROUP_BPF to
 docker config
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4PtcSfQhx3hUSVVCwnxiT+HBogVfUaiY+GH++vCop6fMA@mail.gmail.com>
 <cb140940-68fd-463c-aa73-2c77a758ef65@eng.windriver.com>
 <CADkTA4OZYw1zX-nSnsyn98zOQiOQSd=yDZcAb2et_6PGkSfM8g@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4OZYw1zX-nSnsyn98zOQiOQSd=yDZcAb2et_6PGkSfM8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d40eb95-8272-4586-1fe9-08dc3f0ef56b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nIIDkQt9WgY0KeHFPpD94Utv39ct76weoMD2/gG4opY5mKgxynYnlwvppI7/a3+1YcnrpaSmP4zVqWmmpk2+wFIu7THq57JOeR0xmR3olqA2qT5Yh5PeDyhKlf6eaiBRPZYxMUE/kvwnfVQVOghOPy1U7UgQCPeOPn+yFkyzcCBHUnWbiynfx97MYBs1tQMsN9ehVrNroe3a7UtSHtzHLGJQ1+KEAFw2wAvg6exwYQTgF/MPtJTfOe+oh1TWY8uEV93rvtpSU0ws9Bgk369Ak+/ZdkSeXwKgeTqv7LlbukiS7WrCuMBb/5BJdOXvnP0L3upHMHJqEbFEv2lF7Ss5EJkSKDWDjYuQLvNpGOgFU/3idgcCk429y8++HbT+ZHn7uzuD21pV7UfbVF6xvT95Usf613MwU7sYuUi0QciCs/wS7picSy1q4zqLzcuXHV7SLiLTFePtSPLJb5l6QFQPjPToOVZD1g4ov9uts2x+WLayepWHxqaWz5B6I5PDroSsYATCtcumwkHbSKCAPhLG5pHaeJs6bEjrU6CShgaQu65pGpO26v+h0/JJYU6KMNl+sBja9Ndxc8tXzkOm0EQI6C8GRDzZ8ES6eVeVeNoFxdSbH0qqv8zwYigtT7YzmnTP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2VFek43ckxsSmxCZ09jTHpQWUVEY3FvU2ZpcWFZVUZKS3RYMmcraHZGVHhC?=
 =?utf-8?B?VnJCRG12MmRFcjE3U282N1hEYlhVSnVmbEZnTld5NllJaDI3ZHA3dnJaS2FF?=
 =?utf-8?B?azhxQ0FaT2ZCZXB3K3dSVWJpc1BSb0dEa1plTldoa0ZNeWxCSVpZN0ZMTzlT?=
 =?utf-8?B?WXhzcEVqb1QzRWJOL2Uxbkh5RlR0aGFnYkIvYWMzVzFQYmFiM1lCZnF5YnBk?=
 =?utf-8?B?TW9WbDU0SW1QNlQ3OU40MHRBVWpYQWpzUUgrV3E1REdET29aNmd0UWhtMVQ1?=
 =?utf-8?B?Qldheis4MVBQMHRmSi95SkoyMk9LSGpodFh5YlJLUUoxMFNUd2RlTTlPbFVi?=
 =?utf-8?B?aW81TFRJc3RvdlpNZTNBVGE5MHQxdnhvTjMxcFFLK3dBTXQvMVJaNGpjZ2I4?=
 =?utf-8?B?LzZEN05JZ2tmZDRwT3lJR2VWU3VEWEdlaUJIY3lqMmg4U2xENEhTQkpQSXVM?=
 =?utf-8?B?YnY5dG40ZkxyNUIwZXR4MUhhSkM2RDdUbzBFYjhEQXAxeFlWNG5tbE5GaGpp?=
 =?utf-8?B?K29VdkYwajlIcGdRK2EvVnlsZk95emwwVXJmejdVWDZkNnlZT2RtT0l0dDZ5?=
 =?utf-8?B?aEZQdnBJeWI0V05zSWZVVTg2V2JneXZOL08zcmZ3ZmlFalBvd214QVpVando?=
 =?utf-8?B?WGMram1ldFNvbk1JUG9ITWNYY2FYNUo5NE1neEVab1NhaFZuWUlqWlRteWsy?=
 =?utf-8?B?YTJvcnQ4eFY3SDM3N25rZ0FJRnB3eVdoR1QyMEdOL3FtVGxDRUw2cGwrUVgz?=
 =?utf-8?B?cFRHNDJhRTdETk9xOG52YTZwYnpXMVk3WnlDeEVHNldrenU4WUJVaGw5ZlRk?=
 =?utf-8?B?R1JKWFBqVm1LYXNhb2lTaW1nSGJtRCs2UXk2bjkvWGtxbXNpVlRhaVdWMmFk?=
 =?utf-8?B?NUsrZW9hM3dZcGN6QTg4QXdZSHVDdDVTM2VtTmxySEQyQU80amtxeTNicURK?=
 =?utf-8?B?dHlVWDVmSUprNWJXMC9aTnBTU0NCckRDaUx3ekpqM3F1K2d4WU94a0o5UGJm?=
 =?utf-8?B?T2pjM1NxbTZZZzdkdkRIVThFVUVsTGZ1c0loYjJyOW9QeVgvTlNVU0RocUdo?=
 =?utf-8?B?dGdBQ1p3c0hvR0tzQ21SRHJ6cHlETVZuSys4ek5rNHgxa3FlS1pXT0VrTUF2?=
 =?utf-8?B?Q1NTa01aZWx6RGViYklzanNnY1ZMRGhQbVJNZWtWOGVEcVdCbXJidlVadWFF?=
 =?utf-8?B?TGlPenR5WEp6MWlndGlRRWpiajMwVWIvaUlyNW1UUXZobzdRWUcrQmRVMkZB?=
 =?utf-8?B?OURLVFUzN2dnd2xJckdlMVppcFpMZlZNWWptclhqelNsdHNmUFZHakFZaXVk?=
 =?utf-8?B?TUZjSW1pZmVYK3JCNHhXeVZIcmcxV2lYdnh6UFhuUlo5OWhwbHJuN2d5ZHBz?=
 =?utf-8?B?SUNvYWhQT1hFbFFJdHJqL3FyYi9ZbFBvS2lDNjhqV2M2UDJEUTArRWgvVXpv?=
 =?utf-8?B?Y3NYQTAyWkJaQ1Q4cll0T1RRZHZMOThyRnJHWGxqNWRUaFAyUk1rZkJ5VmlU?=
 =?utf-8?B?REJsbDROMjNCVUNMZU41ZzJyQzVzWnRLVEdoTGxKRUpqeDgxMTd0ZkxKeXRa?=
 =?utf-8?B?MjFQM0NjRTl5clY2cS9VT2VIN2JlNHBHWExiUHRvVTdtNUVieFVTaktxd0JZ?=
 =?utf-8?B?VE1IN2poR25oMlNRRUZzaE1lWTJMQWppbHp2K1VTbmVnWURDSG93c2JLSjky?=
 =?utf-8?B?dXNydUwvOWIzQ25jMGZWa2VWMDZWRTNzK1ZtWFp2M3ZtMHZMWjMwOFp5SGJq?=
 =?utf-8?B?QTlrbXlMSjZvaUhzK2g3VXFsd0ZqeStUY0UzMDhyN0F1aVlZOWdJbmdkMEYx?=
 =?utf-8?B?dENubEdMY2JZdG5rNnMrdHdUdUVQN3JxQjFGdk5jWU5hMzhWclBWSU5YZHBU?=
 =?utf-8?B?QlFqUFlwUTUzR3MyQnFsVVlGS2pka3NnSnBKM0JxeHoyRmVwcTEvdFgvaEF0?=
 =?utf-8?B?K0M4MFlNQW5aVlIrWFJnM2ZGdUNNdlZlVmV4bnpoRVNpUitxNE14bVBuU3Ix?=
 =?utf-8?B?N3NtcnV4VW9SeGRxSjVwRk1Sc1UrVXpGUW9QUEJjcy83NUxLaTBJZTRlb1FU?=
 =?utf-8?B?OUY0TWRIazdyZy8wSUQ0L0QvNjZ1NWRBMlpxSVNwY011elcvVHQwWStyakw4?=
 =?utf-8?B?VkZ0OW1RVnh3VFZSWWVENXlZN0Rnc0dobEI2eGtuQVgrN3ljK0Ywbmo1QkV3?=
 =?utf-8?B?SjZIWlFWZXgxQ21ndXowZysvQkJWOGlHKzc2aHdwU0FRL2JPdHRNdXJjcUZI?=
 =?utf-8?B?VlJ5VlAzSURkekpydWxOVGhGTGh3PT0=?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d40eb95-8272-4586-1fe9-08dc3f0ef56b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:27:46.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OQI0rULCjDofjW67sAF7fIQMkEZUF//FCF4T1dIdNTvr+DzlCcNm4eXKm860cSPIiUXMywwFCYzqenykA+w3s3oslkHzpB7yzvOPry+F4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
X-Proofpoint-ORIG-GUID: HDVAVDofL_5TcuVH5aVIm8QcHg5c8GcF
X-Proofpoint-GUID: HDVAVDofL_5TcuVH5aVIm8QcHg5c8GcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_18,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4280YGlW023144
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 01:28:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8610


On 3/7/24 22:18, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 7, 2024 at 1:20=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>>
>> On 3/7/24 04:22, Bruce Ashfield wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Tue, Mar 5, 2024 at 9:00=E2=80=AFPM Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>
>>>> Add CONFIG_CGROUP_BPF to ensure docker can be started under cgroup v=
2,
>>>> otherwise it would report the following error:
>>>>
>>>>        Error: for ... error setting cgroup config for procHooks proc=
ess:
>>>>        bpf_prog_query(BPF_CGROUP_DEVICE) failed: invalid argument: u=
nknown
>>>>
>>>> Cgroup v2 device controller has no interface files and is implemente=
d on top
>>>> of cgroup BPF. To control access to device files, a user may create =
bpf programs
>>>> of type BPF_PROG_TYPE_CGROUP_DEVICE and attach them to cgroups with
>>>> BPF_CGROUP_DEVICE flag.
>>> related to this, check out my latest push to master-next. I've not ta=
ken tweaks
>>> to the fragments in meta-virt lately, as I really want to get rid of
>>> the duplicate
>>> fragments between the main kernel-cache and the layer.
>>>
>>> So I finally took the time to do the sync and removal in meta-virt.
>>>
>>> See what you get when building against meta-virt with that change, an=
d
>>> then we can do this same change in the kernel-cache and bump the
>>> yocto-cfg-fragments SRCREV in meta-virt.
>> Hi Bruce,
>>
>>
>> I have synced the meta-virt on master-next branch, tested with the
>> docker package.
>>
>> No error happens during building and running(with cgroup1).
>>
>> For cgroup2, docker needs CONFIG_CGROUP_BPF option, it has already
>> exists in features/bpf/bpf.cfg, but we might not
>>
>> need to turn on all BPF features, so can we move CONFIG_CGROUP_BPF to
>> feature features/cgroup/cgroup.cfg or duplicate it
>>
>> in to cfg/docker.cfg?
> This is exactly the feedback I was looking for! Thanks for running the =
tests.
>
> I agree that we don't want all those BPF options on every time that doc=
ker
> support is required.
>
> I'd suggest that duplicating it in the docker.cfg is the right thing to=
 do.

Hi Bruce,

Thanks for your suggestion, a patch has been sent to linux-yocto.


Br,

Xiangyu

>
> If you want to send a patch for that to the kernel-cache, I'll merge it=
 and
> bump the SRCREVs.
>
> If nothing breaks in the next three weeks of testing of that change, I =
intend
> to go to the single source of fragments for the LTS release. If somethi=
ng
> does break, I'll make sure to get the options into the fragments in the=
 layer.
>
> Bruce
>
>>
>> Thanks
>>
>>
>> Br,
>>
>> Xiangyu
>>
>>> Bruce
>>>
>>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>> ---
>>>>    recipes-kernel/linux/linux-yocto/docker.cfg | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-k=
ernel/linux/linux-yocto/docker.cfg
>>>> index eeeaa242..4d8d7e04 100644
>>>> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
>>>> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
>>>> @@ -11,3 +11,5 @@ CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>>>>    CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>>>>
>>>>    CONFIG_OVERLAY_FS=3Dy
>>>> +
>>>> +CONFIG_CGROUP_BPF=3Dy
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8608): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8608
>> Mute This Topic: https://lists.yoctoproject.org/mt/104758931/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

