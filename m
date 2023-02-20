Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91295C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 04:56:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6327.1676869006883813286
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 20:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CUXD2BCn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14150b1c1b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K4gIta022233;
	Sun, 19 Feb 2023 20:56:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=J3QOyfBn33bTPRp2Q85/wW27vLqYNgDktwwOHfOuYyU=;
 b=CUXD2BCnk9psc+EVB8gq9+b0TeIox/b+7lSom4JkQZzwzw5eNKUdRTDWcnWQYoeOSDcS
 yHrrAlTrXvKMO4O/HEf6G8vY5iiWeJR9Mf4MZYg7EJMOeYVep4Cd346dPbZqdXCh6eCz
 45M54TYv3DI/Fs6wb/jiSbgdzRkNC0gukabCvHFtGo/ILwyGfhrxbwgq5slEXgcrxDTh
 84w4tGqaudO5+O5Noc0xuxYNQNVk42ha8nFadD4ExyrbFl3NxEGxayz6DrukyQJbNox0
 OMyX+vTTQ/o/6/furOkDYPC5V5rmFedm7ub9twLp/BWRk+dBeoHsDiydT1eTxrR5ISKy pg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2ps45r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Feb 2023 20:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bb7pdRDEL1FRp82PCYL0vlrBrsMclWa1yqq8ks0ju/tetS6uLXxzNk8JflTzPKMuRnxcK8TR5FgxH9mGMXs6JfVuzT/Qk5GKQdkOmSfT3fXXIXxcLLNyNxPO+F/PkBd7VjnBzsKPNKJTncl7KKTBaBBqUPOzDI/ppR2SthYWwbjkf13acScB8X+wd6G1jyP89k4sKwAGZ2eM60KvEaHGVH6ozPHtAOSpZSA55sxxgF+U8SETvqtJs4gx/PBJur7dThCSZyEv+TnEiNYU/mSbecj+AXCn9vUk764D5/SyycB6PY4chW+H0o/oIzImHeD/tbdLJmcBho9mUm8733qDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3QOyfBn33bTPRp2Q85/wW27vLqYNgDktwwOHfOuYyU=;
 b=DfNmkVA7bY/85ZPq3gMLSz7bUd3dw1unAtXtlIg+yQNMI46O81Mxs6Ci+i8yoUtLOkF8h02lluNoSfeAMhz5GzIDibak7jgn8WFEpimNeMQhZPNFwdw91K1h6QzOTzRUPdx6XnZZkbs5IashLsjC0huVaL9hXYf5sA2GWNdVUyM13U8Gy7cLgwDzAa8M1LjPyKmwd8PSran2IGSFPq/2U+lKLNsNtW74xAPz2d4efIVrQkDnT+iEXZGKY8YYBUJfutvZc15oWr0RXBKi0weAhnyUbSkm7/dppcaxWCpHJfgz9G3B/w+lERtLqoap7DzkKs9jqOQADvNFtJGhqiUthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 04:56:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Mon, 20 Feb 2023
 04:56:43 +0000
Message-ID: <d77c56cf-72c6-5615-cf57-968a885fa323@windriver.com>
Date: Mon, 20 Feb 2023 12:56:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to
 handle selinux
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
 <20230217053224.3870-2-Qi.Chen@windriver.com>
 <CADkTA4MNO3rffZvtO6X+kTfKdpjO40c24wL6KzNUxEiePjbU0Q@mail.gmail.com>
 <CO6PR11MB5602600230D9DFFC40C23A48EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4N0kJZUwgjXVwz4SZGtiQD=fB3j6mgNCPyqt-qLJwXjCw@mail.gmail.com>
 <CO6PR11MB560205CE9C63402E627E57F6EDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4MV=sLbOzdqLDaB48MDQt33=He48VcQp=AsN5E7jX=HOg@mail.gmail.com>
 <CO6PR11MB5602576602D503298F05997AEDA19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4PXwj9gmOnLSyGYx7thbFdy6nZqpz9ucEYjY7q=69YzqQ@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4PXwj9gmOnLSyGYx7thbFdy6nZqpz9ucEYjY7q=69YzqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 00eb80e0-d156-4a65-5c64-08db12fedc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6iBNVd8ST8e291zTPkXcxC517A7gH+puepgsAcfo4+hi8SVYsQzRleYbOyPeWt15mliV9BZeHF0QU8Xy0Xy/m94irulcjMY/0h8ZlfuYsMkP2c37Di71s1QT4G9i2OujKkUoRDT8E0l/jTAEZ40LuMB+8/N4lOnw8jRNy8NbxjHOEzIzw1iSBJtaWgyHhIng5CtTFvsgj4Ayga5uujxzluBN7GPWUaCgrzO7UvvJ5iQmztceovhs8oaDH/ISAZa0kOJOMoPBm3CJPjqzfi4Fbd/bbEkfoJfjsSP4d7zbjVfZjNmM0fHgt8gcolUudtCvH+eBO7NSwhwhuj9LJBlqGCiX+dxnUuOnIFwOqDF9QZa/T89+jXMbNL33kvS9JUjjoexGN4ejP/8c5a8MBEpnkOCVOMQTMTLQk83s6lRJEl5ou5Wh6sDMWThcmIYN2i5DMDhNVZECXOSv0xbYeY0THP57J9gigz81vKMYct1HGuLopUwySyf7j6zzO3Kv/7AMcaPXamWR6bBUAsT3MRJoUMChUJKfzBD6SlTppwnYakhd2V9f+snpuDHzxo7kpv3EVJwo6FOFQfy+amTSEHWB1hTtiLnVv77g/0HZkP467qpchQGid0wao/zls9a9UG5FwttzB+J1WqQsEJCgYsa8txh03JQhFuFTObgLzsWzwQrfoyVK8m6bYmoAqHUVftVB4hWIePyVSgfTDNM359VTn2vAB6eCsW6f33Fv68utxNW/aaO4vQ0N8UJ1Dv2q9lkH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199018)(66899018)(31686004)(8676002)(4326008)(6916009)(66946007)(66556008)(66476007)(6486002)(316002)(966005)(8936002)(5660300002)(41300700001)(31696002)(86362001)(36756003)(478600001)(6666004)(38100700002)(6512007)(6506007)(26005)(53546011)(186003)(2616005)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDkzb1JOQUFNcTE5NzBDU3JKbHYyUE5iVkJpQm0yYjRDMXFDRnlxVERzOFI4?=
 =?utf-8?B?cWV6NER1MWNqZFNKSytIcmh1RnprUzFMUGFiUWY0c1dLZHAxSzVUU1FJVHdh?=
 =?utf-8?B?Q0NZQUxKdG84WW5OOUdKQmdDUHlUL0x4NkloOWZjdDhEMVJzdXE4bUZSYTFy?=
 =?utf-8?B?TFpvUzVPRFpaSmxKTjZuVTdwZzJMWEJMdXdqZVVWL1M1R1RiVTgwc1VGQ1pr?=
 =?utf-8?B?enBDRzhFTDlJM0ZDSTRkMVJtTmUwWGFNYU9NNUxrZ3NpRzdUWVQ5UGJPQVpE?=
 =?utf-8?B?UGN3UWpaYytlenBPNDVyUkRQT1hvcnNZbzI4aGoycFhaQXRhd1lFR2hOSEl0?=
 =?utf-8?B?cG1YQ1htTUtyOHNRUEdQZXVqNzFWNzd0ZjVNcFNkSGxRbkxidGJtQS8rODlH?=
 =?utf-8?B?eG9Jd3RzYzl2TGNVb2ViRkxpNVc3WUpLR1RRMld2YzFHcjlNa0JmdUVHVEZi?=
 =?utf-8?B?RzFGSUxKencvdTQ5N1J3Ym1rMjdHRUVLSnBxOUdmcnVsOVhFd3F3cCtVOE1F?=
 =?utf-8?B?bDNuRllwRUpZRGs3cTRYT2hFTUlOUmJ6c29jKzVXVVNBTEdrcS94K0JpZGg2?=
 =?utf-8?B?bFRyUE4yOFExYnZTYjlPREhUQzNwbllMQ3NQZ1BaRzhOOUxjOU9TRUJ6T3lI?=
 =?utf-8?B?TExUd2RTaWhGZ25qRWJrTzd1cUZDVG1DRC9jVHJ6WWowQVNELzd3Y3pPTmk1?=
 =?utf-8?B?ZTdwSW9mY0FvZW1DOWVrL0dZMVZLNVM3UE9TdGNqZ2VLaWo0OWFtTzlueUlV?=
 =?utf-8?B?Vk9XbE9zbHRkZTloQjk4VjNYYVMyMzF6elhSc3BnUGt4bzF1WUdZcXkrMFQw?=
 =?utf-8?B?MTNEZGE3YWZMV0JWNzkyVytvL1RISFFKZ1MvVVlFeFpGVDNuZ3ludlFyclVp?=
 =?utf-8?B?TktYaFVmS1RncUJaeHVoYTgrK1FpbW9mSGxPZEJydndHM3Z5YjdpS0hWNURs?=
 =?utf-8?B?Rno0Y25lT0M0aFI0dkJGYXJ3VjA3QWsxTzZIcmg4cEpiVVIxZDhsNHplTXph?=
 =?utf-8?B?SlFad1JpUjdNSmtCSWE4WHdMaEVsNWs4S3ZJclFaekN2bDJ3ZHNXQTJPUldR?=
 =?utf-8?B?NmZPbW5WTXlYMUt6bTFaTXE3MU1KTWVYWkhnTlc1ZFVYQUVOTFR0VXE5RUc2?=
 =?utf-8?B?WnRSbEZlcWxVUkFhM2I0dDZ4dm1vbDcrcmJ3a2RIQUJqOHpqTlV1WXJHNW1D?=
 =?utf-8?B?bFJvQ0cxeXo0N2U5TVpsRGhIeXVUcVN1M0xKOUpEQ0I2WjllUThBZm1rYnF0?=
 =?utf-8?B?MjRNc29NN2VQZUlhblZuZDF5RmtuaGJOUUNzMzJMZEtOaU5yQXhnV2luNVhM?=
 =?utf-8?B?OXRzWW01NHdNYm9CM29DVlFiSDN1N3ZpZnpjdlN4VXZlSUgwYlVmMUdxMlZk?=
 =?utf-8?B?TVNuVnZpa21mU3drUGhuSFZ2SGFBZ3lISFJpM2ZKUEVocko3ZFkvWFBLRzA2?=
 =?utf-8?B?NWM2MjN2RnVqRUFlb21XWDh3UCt1b25uOFVWZ01MVUhabUlSYWptZTZERjNs?=
 =?utf-8?B?V0NKMWc3a21lY1E3eXhtVlZhOXhVVXhTZE9NaC9DaERZYThldzlhcGpjTUYv?=
 =?utf-8?B?MWhzRTFPb1ZHdlRscm1Qa3oreER1ZGZWOUFSZEFENHRMWVdlNnlqZFNXVmFV?=
 =?utf-8?B?cTY3MG5oTkVJNHNoQjNRVGR2V2Y5K2NTWUN2MVJBcXA5cHJiQ1JZRE9iUVQ1?=
 =?utf-8?B?dlp1THdQWVBiODg0UWFBamV6NGdGbkI3c2xnZWxvMXNHeTREaUFaTE5taGVT?=
 =?utf-8?B?Ums5OU1ERmwxcDk1RXlqY21QZ2ZyM0hGclFGL2tRSmpkVnpHWmk2T042TzRp?=
 =?utf-8?B?dk1KM29yYVoxZTJoZ2dVOGlqVWdMNzd6RS9veXE5WGt5TkxkVzI0T2JZNkxh?=
 =?utf-8?B?WkQzOERlTzNMZmpjM0c0c3dIeE9vaDJ0bnFFN1I2WSt6UVY2Z3J3ZU1nV1Uy?=
 =?utf-8?B?SkdlK3VUd05NY0R1amdDaWVWSkhMVHR2RmZuVXMwZWk3ZFFVZjJNSkR1ZFg4?=
 =?utf-8?B?TzZERjUydC9HdVZ1TnBFbjk3ZWVsWi9vRjRiSm8veUs3bXQ2TzREanYrZWRE?=
 =?utf-8?B?aGw5NFc4T0gweSs0amxEMmF6ZzZNUnJGZ3N6UXZTYytRUHc2YXN4aXRYYjN4?=
 =?utf-8?Q?EZzNiDKAMqXJvHKBePmS2nPQM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00eb80e0-d156-4a65-5c64-08db12fedc5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 04:56:43.2224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPh4p9KQYhHutKKMtTbXUhU82jeEfb9LLVOCbfN/7u8bNKh6fCDksPSGtiPIaROObdPaC+OWAZdvHKki5TGkfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-ORIG-GUID: JZIBfobk0cfeUH_-l-PnDWhwXMXa62UA
X-Proofpoint-GUID: JZIBfobk0cfeUH_-l-PnDWhwXMXa62UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_02,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200045
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Feb 2023 04:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7884

Hi Bruce,

I've tested master-next and sent out three patches against it.
The first one is a revert, which only means 'please drop the original 
patch from master-next'.

With these three patches on master-next, the following two tests pass:
1. skopeo copy
2. k8s + cri-o + flannel

Regards,
Qi

On 2/18/23 04:36, Bruce Ashfield wrote:
> On Fri, Feb 17, 2023 at 10:30 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>> Hi Bruce,
>>
>> I've sent out V2.
>> I also noticed there's a cri-o upgrade in master-next, so I cherry-picked it onto my branch and tested 'k8s + cri-o + flannel' for qemux86-64. Things are working.
> I've grabbed parts of the original series and the v2 patches and
> staged them onto master-next.
>
> I also have my container-host bbclass and configuration work on master-next.
>
> My tests passed, but it would be good to get your results with it as
> well .. as I may have missed part of your series. If I did miss
> something, resend it against master-next and I'll add them to the
> queue.
>
> Bruce
>
>> Regards,
>> Qi
>>
>> -----Original Message-----
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Sent: Friday, February 17, 2023 10:27 PM
>> To: Chen, Qi <Qi.Chen@windriver.com>
>> Cc: meta-virtualization@lists.yoctoproject.org
>> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to handle selinux
>>
>> On Fri, Feb 17, 2023 at 9:24 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>>> OK, I see. Let's just drop this patch so that libselinux is still a dependency and the layer check is still there.
>>> I'll send out V2 of the README change to match the current situation.
>> It would be nice to have the ability to disable the selinux support, for those that don't need it.
>>
>> So triggering everything off the distro feature is fine, if you want to do that with the v2. No need to modify the crio.conf for now, as we don't have selinux policies to fully test it regardless.
>>
>> Bruce
>>
>>> Regards,
>>> Qi
>>>
>>> -----Original Message-----
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Sent: Friday, February 17, 2023 10:11 PM
>>> To: Chen, Qi <Qi.Chen@windriver.com>
>>> Cc: meta-virtualization@lists.yoctoproject.org
>>> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG
>>> to handle selinux
>>>
>>> On Fri, Feb 17, 2023 at 8:56 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>>>> I disable it by default to align with oe-core/meta-openembedded practice, although some of the recipes there are using DISTRO_FEATURES to determine the default value.
>>>> Also, selinux is set to 'false' by default in crio.conf, both in the old crio.conf and the new one.
>>>>
>>> There's no such policy in meta-virt.
>>>
>>> My point is that libselinux was previously a DEPENDS. Which means that it would always be available to be discovered/probed by the cri-o build. Which means that it is (at least theoretically) enabled by default when cri-o is used.
>>>
>>> By making this a packageconfig, and then not enabling it by default, means that we are changing the default behaviour.  Which we won't do unless something is broken.
>>>
>>>> Do you think the default value should be set according to DISTRO_FEATURES? Or we should just make selinux enabled by default?
>>>>
>>> Doing it by distro feature check is acceptable, and in theory, we should take it a step further and do a sed operation to change the crio.conf at the same time.
>>>
>>> Bruce
>>>
>>>> Regards,
>>>> Qi
>>>>
>>>> -----Original Message-----
>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>> Sent: Friday, February 17, 2023 9:48 PM
>>>> To: Chen, Qi <Qi.Chen@windriver.com>
>>>> Cc: meta-virtualization@lists.yoctoproject.org
>>>> Subject: Re: [meta-virtualization][PATCH 2/5] cri-o: use
>>>> PACKAGECONFIG to handle selinux
>>>>
>>>> This still needs to be enabled by default in the packageconfig, unless you can show that the existing builds were not detecting libselinux and using it.
>>>>
>>>> Bruce
>>>>
>>>> On Fri, Feb 17, 2023 at 12:32 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>> For cri-o, libselinux is optional, this can be seen from its Makefile.
>>>>> So let's make selinux optional by using PACKAGECONFIG.
>>>>> In this way, meta-selinux dependency could be removed.
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>> ---
>>>>>   recipes-containers/cri-o/cri-o_git.bb | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/recipes-containers/cri-o/cri-o_git.bb
>>>>> b/recipes-containers/cri-o/cri-o_git.bb
>>>>> index 66d1116..7af698f 100644
>>>>> --- a/recipes-containers/cri-o/cri-o_git.bb
>>>>> +++ b/recipes-containers/cri-o/cri-o_git.bb
>>>>> @@ -39,14 +39,14 @@ DEPENDS = " \
>>>>>       ostree \
>>>>>       libdevmapper \
>>>>>       libseccomp \
>>>>> -    libselinux \
>>>>>       "
>>>>>   RDEPENDS:${PN} = " \
>>>>>       cni \
>>>>>       libdevmapper \
>>>>>       "
>>>>>
>>>>> -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
>>>>> +PACKAGECONFIG ?= ""
>>>>> +PACKAGECONFIG[selinux] = ",,libselinux"
>>>>>
>>>>>   PACKAGES =+ "${PN}-config"
>>>>>
>>>>> --
>>>>> 2.37.1
>>>>>
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#7861):
>>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/7861
>>>>> Mute This Topic:
>>>>> https://lists.yoctoproject.org/mt/97023221/1050810
>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>> Unsubscribe:
>>>>> https://lists.yoctoproject.org/g/meta-virtualization/unsub
>>>>> [bruce.ashfield@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
>>>> await thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>


