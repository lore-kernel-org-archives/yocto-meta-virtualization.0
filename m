Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D020BC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:20:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17260.1709792421746861594
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 22:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=379647fef1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4276InEW016525
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 7 Mar 2024 06:20:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawvu29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Mar 2024 06:20:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvyDdOzyvC9+18VdS1TUMUYHRSSIEiu+bwOf0y6qefQWS5NphBSALG/4H7LQlATiaCLg1OmHp4OJkyp8u3aUzhwW4LWepZuZa0F+vMIRSaPBhRj5eW0T2NC0OYPYgSLiO5t3uz9ZLhMtWBPRRFvo8Em79CNYfF2pqySZs8gF6FrOhIrvyDeqBQP9y21Z4HrH3vuQsDbmIQFGZq4AQwiuy+7a4hJ2IXAseYBgeZ+SXo2+WcNB33BD4ZMFQwdIKELNzP7QPMDophygx/8h0bh+J9JRZAnWw0ZiIE0l1mqvKysufQkw37/UA06hUJ1gb54bHdPEj09KgehlnOJylFjMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt6JOk5DIcUu3qzJIjlFgVKx6wNO29w67bxzd4RA79c=;
 b=e6F0vrAdcIFsWpQuCsViqtXrS0W+npZXnYQOS1EvAsmrV2ipACiQ3t4LHhRB3tGtMN78zF5mvZaR+8gei2Oc6B/HczNovgybdv1l466v+99/uB1xAX6LDLePlTlvZrQsIA4+rKpRjJKqYsQ1U3zq51XeHGRGpg3EZZL0ZLvoSNU+TOGx1USuZuo+rLBoGgt+hFxUiTAMKkLm+tZGuL+CTfE83/9MVKWmSBFtRtYEJHbo9HngcMNLxj+NCVLbjqxFOrLZo7+V+edrsLMKgF9LBmYqW4Xoa3gxjIE/RS2652kMxPmXI1UgMlmP+ZZRDLuM/ZDKGVXilxG4otOoEGzAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Thu, 7 Mar
 2024 06:20:17 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 06:20:16 +0000
Message-ID: <cb140940-68fd-463c-aa73-2c77a758ef65@eng.windriver.com>
Date: Thu, 7 Mar 2024 14:20:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] kernel/cfg: add CONFIG_CGROUP_BPF to
 docker config
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <20240306023958.3779337-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4PtcSfQhx3hUSVVCwnxiT+HBogVfUaiY+GH++vCop6fMA@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4PtcSfQhx3hUSVVCwnxiT+HBogVfUaiY+GH++vCop6fMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fd8fa9-348b-42b2-187f-08dc3e6ea810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PMB+LkRPwH2Kx7xJzAWIwUWMRirDg2VdsmmQSPQcBZz9az9iOcgIWYFOnWv/5IpfP9TsYXvz8oD8fsZkJfu3G9GUaVfQEK3Zy2rQtuKEqtgpuiWePm1GufU0RyXdBJlrmGf0u8Ocny7SilXeBdmF0cNunDDRinv4c1a0t6R5WGcd2IPasNzfChvcnby5G5B1/s+MdpgLuaM4Rocdpnyp5Fbt7JUImmdIEMpbjsVHtCdDq1hJWn2hOq5DU/EI+V4K9HgXF2jhT0GiLSEt0OPjIY4+tZvX5IHLzgi/wL59G9xWN5FmxK03bK86cksBGAvzgJ/P64oewASYAa2ll5NDbq5M19NuR0Q8X0Ya9bBii0ySY0nk/PP8PzHP/EeONFYAQhX0z5jrIgYywTOvQwYqc1ouSmWfDUbnqS2XSkD4dm3JlZqkvVr9VYpLc4qd5IAC8ucEoOC/y5uhBXJcmX703qBn4eoV3dLnh7ccfb3K6+p0EvtVd9/DAbO/W7BBKdxPvqKYzi0qdwFokinsrapHbN4AwOOzKS4Yur+t6++i32feIcahQ9SCp3vA+hgkqe/fd2z14OPIuWb5M/Eo2JbDbnhByPtOD+dASDUWgzrfTgmt4IrtUZbjoPFAqO8D2nbE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0RocExsbTRiYnJXOWx2ejc0a0dtcG9uV0E5b0pJNkk1M2tSd2JxcVBYU25M?=
 =?utf-8?B?UHd6TGdlck1ha1NnV0VhbTE3TmlrK1BSM3NDOVdxOHA2NHI0M2IxVGIzZm9F?=
 =?utf-8?B?V01Mb1RON1phMStlMmRxN3JZTHhmMVFrVlExdXFtbUF5SWlJbk82ZGhSZlpm?=
 =?utf-8?B?M0kwR3lCcHdtckJ3NEtTYjRBNWo4WnNYTVFOS3NnaVZ1dEM0YncyajB1SExG?=
 =?utf-8?B?YTIrbkpoTldScVErTjEra2MrdnBVU1FLTXl1VDN0UVJJZlZoRnBwNEhmRHBI?=
 =?utf-8?B?eldMT3JZaXpjZUhvcGI3QzZhWXErdjJvYUtTcG9SL01vZFc5a2dUYjFMbWJY?=
 =?utf-8?B?TkdpZkhNSjNNbkV6dElnTVhCZ2hmSDQvZlg0RWNDb3k2d0VhYnNjRXAvT1Jl?=
 =?utf-8?B?dVNRV3YzamprdFFRa2RNa2ZuQXMxdjMrVHA1WTAwbWhuZW1BY2c2RkdZK2Vr?=
 =?utf-8?B?VFlxdk1CSGd5QzBhbjRFZm5GdXpiRk0yTEdEdXBCTEZQY3NLaUtYbXhyeUtF?=
 =?utf-8?B?eitqWDlXSlJTc3pqTVZJTzg3a1VsN3o5V0luSWNNTTBhWFRNcmdkVjBwNVdS?=
 =?utf-8?B?eGxGMTBnam9zdlBDRE5FU3hpTWxqQWlLVHBTelh4ajBVUTEyYnJmN3l6RUVV?=
 =?utf-8?B?KytLWHpINGE1ZDRFQ0Rrc3VDMXhGbzhucTlqMGFzUE1EK2NyQ1dMQzVuTkc2?=
 =?utf-8?B?VHZVaUFjSllaOVJuR0tuUXl0TG5yYzFWRGIxVjJNMzFienFZbjlOM2xPR1Nj?=
 =?utf-8?B?RGhibDdsUEVwVXM4Q3hIYWN3WlBYSXJkdzAwZVFXUEl5WlFQbHlLaFBVK2E1?=
 =?utf-8?B?VDVSVlFMQ09Cd01HQVk0TDdPbDNIbWtULy9RcnQ4SXowZ3pzT3g4TUViQzl3?=
 =?utf-8?B?U3l4Uy8xa1krYk5xT3hXT2RZeUZCMTk0a0RDelJaaXUxMndjS3c4bFpyWkJt?=
 =?utf-8?B?NjlZenpOWk1jVFVZWjZJUjVxS2tkTW9rOGdDY21wcFdqNmNwS2tLOEVQT3pq?=
 =?utf-8?B?NXhhSnlldzNxS0FONXNFWVh2ZGVMVkl3d3RNN3Iyb2dCenJyZ29YbFVHRXJj?=
 =?utf-8?B?d1NYU0dLWGE4Qyt5akFKS2hRYmpmTkZBSkZGZFU4aUl5b29jeEJValI4dk9Z?=
 =?utf-8?B?Sk9CSG5LSThQZ0pRbHRsdmlxNys5aTZmT0l4VnNkU3ZKcjJkSE5qVnRrd2FU?=
 =?utf-8?B?aXdzZmJQZ0oxbXpVWmlRYldNSHRRc2lYKzdrUGpBRHhZUnl5bnZ3Q3owNFRT?=
 =?utf-8?B?eVNWVVZ0WHJWbTFseG9HdXBTUGE1NjJrV01NMVRPbjQwMnQrSHl2YWtQTTdr?=
 =?utf-8?B?bnlKMmpOR3ZmVDZNLzVxMWRsNk1UejFEbHdMTkwzQW1UL1RkRnpXUko5Vi9V?=
 =?utf-8?B?ZW95Z2I3R1hzMWVXRVpyY3RMWUc2b0pkZnBSVzZIa2lKTmNiUHBZU2hXbnBy?=
 =?utf-8?B?NjhkUTFodUx3OUxtSWsramJFVDVlK0RudXNxMkpLc0diMW1MbFB0ei9qK2Mv?=
 =?utf-8?B?NE00Rm1jL1lSR2NUREVVTmtRMFdCekp6bFBaZWs3VnlqdDlaY3BxblpheFhI?=
 =?utf-8?B?SytGTFV1ZEFTd0hrMzJUbGZrMGVJY2ExZUZUMEVDdzNGdUdkRis4d0ZwempR?=
 =?utf-8?B?bE9oQlZqR1JrVzRIRzJWWldJUy9sajR4aW5IdzlTYTVUU2ZGck1LQThrZEVV?=
 =?utf-8?B?VWhjOHBGd2EzTENCNGJYY0NpdWNQRWsvNEVUVGdJVUFMaDREb1c4dEgvem5o?=
 =?utf-8?B?VkM1MHRlYi9ubjBDaVFNYzA5YldCWDJKRWU1b1ZhQ1NMbWQvWFVjTFNzcjg1?=
 =?utf-8?B?eS85SHpraFNiQ1NYdGFWUERLRjhLdUhPV0IxeXpQWFhZb3NWNGZTR0h0ZXZq?=
 =?utf-8?B?ajl6MkZ5OU5LNWRadTJlYkg3Uzd4ZzZIRXJnMnRSRkZsVlQyKzcxemJubjBN?=
 =?utf-8?B?c0JUekxDU0R2OW5PbVVURm1aSExwek1yVE1wQ2twaGd5dnFqQWdmNTdSejJl?=
 =?utf-8?B?VHZkSkxLSnJhTFlzZ1B6b05YQUhrcEVhWXdwNno1c1ptWjNiYjRTTC9JMkFK?=
 =?utf-8?B?a2lKS3YxUHkzVzF5T2tLTnF0QVlUOHJPcFVmeXJ0UEhqalF4bDRXWGxlcXVx?=
 =?utf-8?B?VXJrUVVIdzJ1bWxhQ29RYm8rZ1VjWHJGR242TXBqTzBkY0diTzZQSXlSK1lu?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fd8fa9-348b-42b2-187f-08dc3e6ea810
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 06:20:16.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3RbtjLbB9YVl5SQBsA1BSnSNoSwoSI+KqqxDZ9ER8ihdENLAe4MicdslUFMzMUA+op7VHaqFjIBWdY+HfEs35JbVljCUu4S0LwMsKJ+v8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
X-Proofpoint-ORIG-GUID: WwdhhElcHQvvJJOwh8ZcFSgpwgQv-zd-
X-Proofpoint-GUID: WwdhhElcHQvvJJOwh8ZcFSgpwgQv-zd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=926
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4276InEW016525
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Mar 2024 06:20:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8608


On 3/7/24 04:22, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Mar 5, 2024 at 9:00=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Add CONFIG_CGROUP_BPF to ensure docker can be started under cgroup v2,
>> otherwise it would report the following error:
>>
>>       Error: for ... error setting cgroup config for procHooks process=
:
>>       bpf_prog_query(BPF_CGROUP_DEVICE) failed: invalid argument: unkn=
own
>>
>> Cgroup v2 device controller has no interface files and is implemented =
on top
>> of cgroup BPF. To control access to device files, a user may create bp=
f programs
>> of type BPF_PROG_TYPE_CGROUP_DEVICE and attach them to cgroups with
>> BPF_CGROUP_DEVICE flag.
> related to this, check out my latest push to master-next. I've not take=
n tweaks
> to the fragments in meta-virt lately, as I really want to get rid of
> the duplicate
> fragments between the main kernel-cache and the layer.
>
> So I finally took the time to do the sync and removal in meta-virt.
>
> See what you get when building against meta-virt with that change, and
> then we can do this same change in the kernel-cache and bump the
> yocto-cfg-fragments SRCREV in meta-virt.

Hi Bruce,


I have synced the meta-virt on master-next branch, tested with the=20
docker package.

No error happens during building and running(with cgroup1).

For cgroup2, docker needs CONFIG_CGROUP_BPF option, it has already=20
exists in features/bpf/bpf.cfg, but we might not

need to turn on all BPF features, so can we move CONFIG_CGROUP_BPF to=20
feature features/cgroup/cgroup.cfg or duplicate it

in to cfg/docker.cfg?


Thanks


Br,

Xiangyu

>
> Bruce
>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   recipes-kernel/linux/linux-yocto/docker.cfg | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-ker=
nel/linux/linux-yocto/docker.cfg
>> index eeeaa242..4d8d7e04 100644
>> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
>> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
>> @@ -11,3 +11,5 @@ CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>>   CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>>
>>   CONFIG_OVERLAY_FS=3Dy
>> +
>> +CONFIG_CGROUP_BPF=3Dy
>> --
>> 2.25.1
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8607): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8607
> Mute This Topic: https://lists.yoctoproject.org/mt/104758931/7175143
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

