Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.31389.1630986080368785507
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 20:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NGl1YEXE;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=488453a348=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1873fHmZ020082;
	Mon, 6 Sep 2021 20:41:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=b6kuDjZXxZ4XSHAYsmuVuYdOl68xLtTvLJKxAdP6lWA=;
 b=NGl1YEXEnglEtfoqgOpDvlbXdUL9RwWOiMDUaBcARCcKHtQG04YEdfvo/EtcVKAlhlLi
 nJjJyfIC/yEAJlOegMXi2F7T0RIgXAWhPP+QBqAFHIcaQkMs4TZ5PxxozllMoAvBOiF0
 ykr2ipiM5k9vuBHNzs7fcn7587nEBpEm6cxXBN/LasANw1GCMfzK30QbbJlpggXt7F1w
 Lyr83hPmI6Mvwxdvx+56nLcFjmlag3XguObHnZke+gv4urAMxOQzE57pJR0JJY+7fQu4
 9pdh1nGh0KL6OByQua3Nly6UCB86fFOHIfHzPVC3D+W2GM3u3u53jxfYIRNNUcPDeeA9 rA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3awuxd849a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Sep 2021 20:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkX6xo11dlLVcfH5inSyjiRqr24toTYUL/woZmbauwZt/U6efSOucXPcT7eyCtG+dKXrynXLtJJdYS3qRps7oXqxuGN2z/HqdSiHkp8/5fT3WZxeF3nF+DTrxtA2FpEgFnxFxQpwLXwUZDUuP9NAWhXIDiy3GBERn7jEsZSLdOJOOv3Rj/XHJ8nsGemDJUBs1kZnWBWudy7NP1BZ1SOg78R2++JrDtTRSMDQswzwK1+JaxRqEs+x/+ly1CJ0tSNRf/HdfXXmYXeV1WkmNxV0aF51yQHEVroDvUTmxa1hZxlKhge6WGIak8Aw3tIEcU7nwE9YjN1J03BwXfd9dGVFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=b6kuDjZXxZ4XSHAYsmuVuYdOl68xLtTvLJKxAdP6lWA=;
 b=fxOLsbdTRsqmYDSAD8O10QNd9Tkbs3QYXZQsyBuUSFTXd217y+J7ac6xuCPsT5D2WJa8/DaQDrGGnBqRjGG+RkotBtUZYtiDpdSDsD/zc/eDzPC3tSh+4u4Jj/Hr2s9cxlAaV37oMatoeexFDgr5bJelE02k5HUbgK8VZENw2n6OyfpJWYGSCP7BQFu6PZRAIQMhVT6iN+TrFs6unWcGCKGwqBu7rX5XqGNg/gmKmxpuxUMXp0fBnggN7Y2NE7PwK83mtuka8cIJKZRaDI3LmN8cJ4BidQVqKfmoODHBNJKJk/58OVVLTzYbJKDHiYyBOufgBPkpDIwtcbVGtRRRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 03:41:15 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 03:41:15 +0000
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210906080510.28468-1-mingli.yu@windriver.com>
 <20210906080510.28468-2-mingli.yu@windriver.com>
 <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
 <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com>
 <d493a642-ff70-02d5-ff7d-fde98d4abb9d@windriver.com>
 <CADkTA4NcKhhJ_ULEdoFhSWyhcd6NcUDcmr1VDqTWrSwuqKCzUQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <1245214a-6dd9-eaf1-9969-34e12c68eb91@windriver.com>
Date: Tue, 7 Sep 2021 11:47:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4NcKhhJ_ULEdoFhSWyhcd6NcUDcmr1VDqTWrSwuqKCzUQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
Received: from [128.224.162.173] (60.247.85.82) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 03:41:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a13ce0f-1c54-4df6-f1e6-08d971b15806
X-MS-TrafficTypeDiagnostic: MW3PR11MB4618:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4618260FFA84D99B3E95C506F1D39@MW3PR11MB4618.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g8kn/MFhXc9VKS1Na/tIRjn4N5OqFTfG2RGSzpVrcJueWZIXFMCbQ7x+QN7urYzRBkgno7IPnwrPFzQje4lIzeNzjwSFvFgOJ+bqm1fZJ6r52uBapGHVmbc73mb/4IYNBDaew2RshoqTxQrIdJdg0mojbZuSYnWcZG8JXdDWuXftyMrlgi4a+vu6f1euNzEZd+A2e+wsYHl67K4x58fSbHuFb/jt/MwALmkoq7vrP2pkQj8QdgduqnnAO2Qzqum94aobVtcvRYjJr4YfiUCPQEG7DAWRu/J23hm6655qgGN3Q4r3WhhJ4fOCQrMAaLLvfxryfRzeFyGNdHWzhPmFG2jOcsE5u55/ch+HA+1NvJFOCiEz6TVzGeTlns7O3g2shNLC3GoV9iob9iDEA7u6xUIopP0y7mnrRAWmdR4XZZVVAO/u68V7eymPTF+JkjtbND/sPkEin0Wpb6Zl+oyKGx+7CejsvRtJCJ6XCNhjE6lZtNI35yeqJb6xmPe9tGZpqWzazfXndqkd0OWDwmK1XD8qu8QeAsHuqfmyyWEOzW0gGtvBMtzM5Sv5u+Xnf3FRyjfffHqPj9dHmzpnB3UD1ooXEigLRL1W8IKZaV9AlkS9jwyw6+K9U9mrBkmC6jOYhVqQdBc9ka07uEIlvu+v5LtOCNWZ6YfSNIwCG2n0m/z6OXarhL7QQ/MhjPcMslDmvR2+lON0EfT3K+Tui3A2waK24thna7092Gd0ffoSd2R32dvZxfxCquMMgMY4Nf3QHqLLkttynlnwIyYg2IGhdR+3HTs6UTLDTB0uG4YSarcyKaICTzf9+znOxFjYP/VKocu8fDOphMXATIDe6Pvgkc4vtG21Ix4R6oKIflgGe6pJw9DaZ/7SvlBPVHjYIo20U1EJzPUN62K+KoW/6+mbQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(186003)(956004)(31686004)(38350700002)(38100700002)(316002)(478600001)(6666004)(966005)(31696002)(6486002)(2616005)(86362001)(8936002)(83380400001)(66556008)(66476007)(66946007)(26005)(2906002)(6706004)(36756003)(6916009)(53546011)(4326008)(8676002)(52116002)(5660300002)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3JwczFRTUlYZW5GVUs2MFUrRmNWbzZycldDRTR6Nms5Z0JsRG1KUjRVWS9K?=
 =?utf-8?B?VFNaRmg5TmZXb3czQTA1N0RZeTV3YkNtU3ZjNnhIdmZHYndrQ0FIUDBqekt2?=
 =?utf-8?B?OVVFQUtZSlRQSC9nV3JOYXFwbExRMzRrY3pQK0ZFaENQN1dFZkh2cTZkaFhn?=
 =?utf-8?B?cXRpd2d0ZFpLZ01sMVB0TFdna1lyeFg0a2tEM0VTWUJtTHp2TVBHQkVyVmhE?=
 =?utf-8?B?Q3FzWlVCMUcveTBPMjlaK2g3M3RWZTNTcG9IYk1EbHFPcXRSZEpjM05oMVhV?=
 =?utf-8?B?NmtsM1IxQjdaa2xCUzZpVUFSbUtWaWJFMWVrUnZ5c2s3KzBSUDliZWxjSXVq?=
 =?utf-8?B?YXZSaXhMcjg4Z3pnUk9nazZrdUJ6ZlF4djBKbWVzdGZ6OG1DeHBUeWJ3Rm4r?=
 =?utf-8?B?OThIRzUzZkJ6enRTcU5nb1FHd3NUaWdYaXNzUkUrWmp3WWpaYk95VmxwRTFQ?=
 =?utf-8?B?ME5HazNTZy91ZmEyazk3Y3psSnRYMkxOcmRTOEJHQlVQRFBXdlM1TTVrZWpr?=
 =?utf-8?B?WWZoNUxySk5vaUExMkYwdThQcTRQbzNIK1AvVW1QOERYTVFJbGNTK2wwelUx?=
 =?utf-8?B?SFdkaXVLS3UyR2FBL1ZnZElNZWtuMlZ1Z0xvcTNFUm05S1N2M3R2eFdBdFRl?=
 =?utf-8?B?b3NqNFEyQjdna2gvQnpPVHBIc1VPbEFNZkZBT1ZCeS9KVUhMVitzSHlJT3RX?=
 =?utf-8?B?ZE82QkdQenluamw5bjhla21PSWVGcmQzQUd3UWlwL0dTVnpVQW9mOHJJZFFO?=
 =?utf-8?B?VFVrYkkwbDFIL2tINU1kSzIrOXZWWVNVTzFQcW8vaGNJOExLSmNVei9RZ3hu?=
 =?utf-8?B?QzM5VTVOdFNINUhvNCtHOFdyakdvamR1QTNJbGdnT2RualJIYmxZbFpxaUlQ?=
 =?utf-8?B?VkNXdTFCQkxrUVFPbFBBeEUvVkE0QlpmcWpmUE5wVU9yVnJEYUJEZ0FVYzZy?=
 =?utf-8?B?bkhyNG4yQ2JYeCtCWVprOUlDK0FkK09EcmNCOElrUWQ3eG1wS0lIR0ZwZ0Rr?=
 =?utf-8?B?SDFtZkFlTHk5dm1ad1NVWUo0NGN5cU1PNC9RUjBwUnBZQ2dzb1FObTFGUzl3?=
 =?utf-8?B?VW0zTXZvT0FBMW5mS0JVUUNoN2VpS1M1bGVsUm8xeXlEd3ZSUFowNC95QkRx?=
 =?utf-8?B?NzJ4MGFsSHc2YnBmNTNvcDlvOHU4RkJMTTlzKzJwVFMvRlBVcFBFcXgxaEgx?=
 =?utf-8?B?dUZndGZRdkpnNFppaU1KaUpYendSSWlxVzVmL3NOV2ZISHFjTHh4TVhuZUpi?=
 =?utf-8?B?Ni8zVXl1RWlzMlltdkIwa2dWQXFseldubVJVVmcvNjB6K0FZSmZyMXhRNXlj?=
 =?utf-8?B?WTF3L1ZaeTd4VEQwZE0yYmtmQm1neEFBUkhFMXNBWXljcjlRTU1WdG9LK0pG?=
 =?utf-8?B?V1VLWmNiUWZaZENZM0kxL3ZlNmZIUEhGTklpU3U1bmpGemNhWlRtTGU3MzlJ?=
 =?utf-8?B?S29kUkZNK21JaE4zV1orUEpwVWZhQjRNUnY2VTVQaDdxaFpyemp0M0QyUXdn?=
 =?utf-8?B?YVdKd2J6U2lBZlZ3Y21CcWg4ZFlKbXoyQkxSYkx6U2dRdVNGbmx6Y2lNWTBV?=
 =?utf-8?B?YjE5NUtJdERnQ21xN3NabURoMzJSdW1FcWxTMnhISEM3QkU1WVZqYmRycGs4?=
 =?utf-8?B?ZmVvTzFGYU9qY0F0OGtaS2pwNUg1cWVSK0lNdm5ReUM1eThNUlBFc0lvd1Np?=
 =?utf-8?B?b0ZuTFR2S0tWZ2NuVnorMTZJZGFGUWVUaVZsN055eUwzeGRJejY4aDdjYm41?=
 =?utf-8?Q?FTrLV49SjzqOml9uB5KbJL9re0BtMyknPGUVOzK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a13ce0f-1c54-4df6-f1e6-08d971b15806
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 03:41:15.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guqWOzosL/JF4qgawTGiH97XmcGEHeKwZQcvUmB2yaU7ORRtMvkMAGJQA0+nix5BglJ0XR3YdwOVJSQ5KtsJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
X-Proofpoint-GUID: DXqpYzSB51qu-8YtxKsC4jMaAIjNf3aA
X-Proofpoint-ORIG-GUID: DXqpYzSB51qu-8YtxKsC4jMaAIjNf3aA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070022
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/7/21 11:05 AM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Mon, Sep 6, 2021 at 10:35 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>>
>>
>> On 9/6/21 10:08 PM, Bruce Ashfield wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Mon, Sep 6, 2021 at 9:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>>
>>>> I also already have this version bump queued locally.
>>>
>>> Actually cancel that. I have more -dev versions under test (I got my
>>> uprev's confused for a moment).
>>>
>>> But we don't want this SRCREV change. I put it to the tip of the
>>> release branch on purpose, this rewinds the SRCREV, and it isn't
>>> something I'd merge.
>>>
>>> But the packageconfig change can be valid, and is something I'd take.
>>
>> Okay, I will send the packageconfig part then. BTW, why is there dev
>> version, I think the latest release version should satisfy most of our
>> needs.
> 
> In this case, it is just a commit that bumps the version in
> preparation for more changes (for 3.3.2), if you look at the
> historical SRCREV bumps, I always take those changes.  There's no
> reason to exclude them, since they are part of the release development
> cycle. 3.3.2 will be out before the next release, and by taking those
> commits, it shows the intention to track the tip for anything we may
> need.

If so, could we put two recipes here? one is for dev version such as 
podman-dev.bb and one such as podman_git.bb to track the latest release?

Thanks,

> 
> Bruce
> 
>>
>> Thanks,
>>
>>>
>>> Bruce
>>>
>>>>
>>>>
>>>> On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>>
>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>
>>>>> Remove the unvalid keys to silence the below warning:
>>>>>    # podman --version
>>>>>    WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
>>>>>    podman version 3.3.1
>>>>>
>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>> ---
>>>>>    recipes-containers/skopeo/files/storage.conf | 6 +++---
>>>>>    recipes-containers/skopeo/skopeo_git.bb      | 2 +-
>>>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
>>>>> index 818cfe8..c0d512f 100644
>>>>> --- a/recipes-containers/skopeo/files/storage.conf
>>>>> +++ b/recipes-containers/skopeo/files/storage.conf
>>>>> @@ -30,7 +30,7 @@ size = ""
>>>>>    #mount_program = "/usr/bin/fuse-overlayfs"
>>>>>
>>>>>    # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
>>>>> -override_kernel_check = "true"
>>>>> +#override_kernel_check = "true"
>>>>
>>>> But there's no reason to drop this.
>>>>
>>>>>
>>>>>    # mountopt specifies comma separated list of extra mount options
>>>>>    mountopt = "nodev"
>>>>> @@ -126,8 +126,8 @@ mountopt = "nodev"
>>>>>    # xfs_nospace_max_retries = "0"
>>>>>
>>>>>    # If specified, use OSTree to deduplicate files with the overlay backend
>>>>> -ostree_repo = ""
>>>>> +#ostree_repo = ""
>>>>>
>>>>>    # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
>>>>>    # certain container storage drivers
>>>>> -skip_mount_home = "false"
>>>>> +#skip_mount_home = "false"
>>>>
>>>> or any of these .. the skopeo configuration serves many different use
>>>> cases, if these are causing warnings in your setup, you need to carry
>>>> your own storage.conf
>>>>
>>>> Bruce
>>>>
>>>>> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
>>>>> index 39ee8ca..adb7de1 100644
>>>>> --- a/recipes-containers/skopeo/skopeo_git.bb
>>>>> +++ b/recipes-containers/skopeo/skopeo_git.bb
>>>>> @@ -27,7 +27,7 @@ SRC_URI = " \
>>>>>        file://registries.conf \
>>>>>    "
>>>>>
>>>>> -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
>>>>> +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
>>>>>    PV = "v1.4.1+git${SRCPV}"
>>>>>    GO_IMPORT = "import"
>>>>>
>>>>> --
>>>>> 2.17.1
>>>>>
>>>>>
>>>>> 
>>>>>
>>>>
>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
