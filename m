Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B68C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 02:50:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4824.1709088629930256791
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 18:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ZgRrbmo9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2788efe6f1=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S2U3sM002057;
	Tue, 27 Feb 2024 18:50:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=0JoRzdHcX/wpm3vXi7d3br74sd/CFeQmbcCuboldsa4=; b=
	ZgRrbmo94F7QLm4lvsoYJYgbp8yce82zv1PhG8AdfG0S/xoALR76Xa++tkIaWfcP
	3Q7awy8+hSkkMWR9FjLB8YaKt69iACBDbaEfMKPyLP6K4nnBFMpC77KU/SGyebKv
	d+j2u+/USev5pYfBbRkgeOOq6v7SFKGZDIQknNRhePtgoljEly4aTIxF+QpFNOjt
	PfH/mUUCYCbO27mlJSV65INMAV4n7cUf9KIJ2ysE74U3sYB07O0xV9S0W3ICTuMv
	Zy50VOR3++f5AOBqdoRV5yzRPcILgWgWXQQxsIQ64b+w6KdCDKC0NugR6/7SUuBB
	em+j4NYgbunQ/aJx82sXxw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumkh1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 18:50:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8FO41xpy5cYFZuFwGjg158D2Fdk9H0vOALQlTXRqQ+VxeqDhOd9+lOwub2Vu/YKHXU5mDqTsWd243WXSjsPilg/PhXXoRZmhx8IsI1tQ9aWZw/wxx9Zkh+JkODMw5M10Ws48N6/j15kY+IIc+kdLs61rl/bMB5b2yFHu+GmiOFpwZ2LmZNGnS30+TadwTd8kWuuxtSESQMlWQU3120jqbaqZjXn+/TmU2h4VLLEK6X5/mHXaFl5n6scpM1k1mf+4cMSlpezjhbd9tpGUnlbopAqCog4VSsNrMBMuwMu8GuuIOCJlvZaaGGUvKQcCosvGubwsZULwsMM8IE5ycGi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JoRzdHcX/wpm3vXi7d3br74sd/CFeQmbcCuboldsa4=;
 b=k72IM7tC48/YGPOW0AZxKYNGx00D8uROTu0EYaMy9nd1woQeEHvAL7gwjnEWsZqqdSi/GoqsjK/sQLq3jkdbjOhbFAYGASQQGUdG8x4Ek7TEl51VQNTYS0RVS4TPpPnO3UTQ2OOYF5NvKQDv6E+jmgv21dwEbe7ycRcqwdXO3kkc8GrUw/zNZ89NB1JP7tHlseiVqZjt1nWyJJ5cxcdIqjttEe+aRQnCo+nyMpd4Xbf4S8YnxT82WTZi47/cI2CIsjM1fdnqoHLXQa4/qdW4esPwZHE69i2XuJR+boLqYt1zWyytkViAVqJ4B0eCVvdYVyftlVDraTwZXGxrHSceZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 02:50:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 02:50:24 +0000
Message-ID: <3468b594-13dd-1d98-5336-19b5839449c7@windriver.com>
Date: Wed, 28 Feb 2024 10:50:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH 1/4] oci-image-tools: remove unneeded
 deps
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
 <CADkTA4MKpXktzigN7rzV6t8Zyj=+Fb45DTEdE2cQCxQUBGQ1Ng@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4MKpXktzigN7rzV6t8Zyj=+Fb45DTEdE2cQCxQUBGQ1Ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: a407759c-4376-4692-f11c-08dc38080300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DkEXjzFntJJ8hBRnGF0QqeMHhTEOsU0/JLKUPx8uMEyMzKzRYW6rriYC6y4w2b92YniDU5FyJMY0UUFK5n3YHf7pdsESlL9Rg+GWaJtpRJ4d7wu7ZOqJJYsgJG6meGokWZ6TtZujD7VjTq3O8TNhpYYGimTRatHcBAQja0SXR7TCjcEDmx6kDJKjDEE+mTjHZUBkp/M0F64YmHF7h+AuobYjQtKATBVov7I5RM8q7CqAnLDykxoTWAluiF8C4MLar1Cku1ook8pLzncAu1CHpIExktJdBDi4yV4r/E06QnOMKB2t8HtbYkN5x620gQRNV8m8OcKH2bYzqFlOw5rFqXumtkuirn6mQmB2TWkwvu0mqS01I8thucvVLIEw4KlasRNTgmyNzs44sQCjMrG3/QCm5DYqRtYZrIxJo8XKecluPclALmVxNMAD2KUUDVacNyLNNhlI0wBfuOPmICT/kPVljIqWYoIF+Y8tZZQeGHA75dmQXg6zcrJn+ELX0xpW0CEx9SDQENpv3DHklJaHH1T87eJNDunpB7qx/6PH0D509w/MKmfLEfhPVeIp/c6c9pKgoGk3QDEK9tq6tyftBvqzgTObZbIHExC20DMBJy7N8ScixEd8Mkra2Pt3MVCQVkBhIvdWYkgs8nRKlQKfug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEs1TnZMTTZuUGI4OTFpYWRpR1hOcmxseTY2NlB2L2svV0poRkpKM0IvYkVI?=
 =?utf-8?B?bmZPdzZNaFZxOS9kZ01nMWt1TUxZYkUveEhRUHJheDJ4dVRoZGYwbXpBd1pQ?=
 =?utf-8?B?NWVmMDJLY1cwOHMrWHlyQmlqamV0Tng4MU1zbkdYZDZ3b3YxVW5uMG9oM29W?=
 =?utf-8?B?b2hOY3ZYeWZSQXBCMExNaUlDazZ1Y0NWNUcvYjcrNk1xcjdnUVhlejRmMGhD?=
 =?utf-8?B?OEZwY3RqbGU3dmhXRDM2a1Brd2dCM1kzcWoxQlNTTlFVRDMwN0RzUXl1NVZa?=
 =?utf-8?B?RS9sREFWRzl0cnRZU3BVY05rb0JuUVczdjVLdEpLQmhYWUdFNU1FQ2J2WkhR?=
 =?utf-8?B?SGVKamxNUnJBOTVnUUFFa242RFpZdUpXOXRwcjdtZ1FLMG5ISFRnWDZQRnJv?=
 =?utf-8?B?TEdGNktqcjNveFFTVktHenhvVW5VOVVxVWlTOUlkd05QYmhIWlVlZk1ZOEg5?=
 =?utf-8?B?VVJtQ2ZIUXpqdW5URXYyRmNiNExnck5DajBIc2xIcGh0NUtFOGhIRm9jclc4?=
 =?utf-8?B?WU9IcS9oWVBqbHoza2xONklIZGlHSXd0UDAwU1JPZzZUekVhUmNzSmN5TjFz?=
 =?utf-8?B?S0RNdTA0QkVncGNmVE16NVcrVytWaVU1eWZ4dFJGdVBacjl6OVl3MFIrSmxO?=
 =?utf-8?B?T1lRcmFIcklHSEF3RnhQc0VrRUVUT0lzZFc1NFdnc2ZhQktqZ3MrZVVqZlh5?=
 =?utf-8?B?bEFWbHE0am04NStxYUoyS2dxYmV5eVVjV280ZTVxdm50UWtMOHJPaHNpakQ0?=
 =?utf-8?B?bjRqSDd6cG9OSURxUzY0YjBQU3c1YXVGUitzV3M3NnFMOVIxcTZpdGozcFo4?=
 =?utf-8?B?OUVCcDN2ellFVjU2cFhsYUtPaE5maS9WdUZQWXNjWXdHblN0WlFJRmJwdThr?=
 =?utf-8?B?eHRWZkRLcWNrQUVYeU1MMVQ0eUJ6b1V1aVBjb25tQS9QL1ZFb25BckRITWpR?=
 =?utf-8?B?UVM0SjVubDdXc3IvNmRocGJRb0J3TjFLMWNpNHNhcHRBaVV6c2MzTVN0dlhJ?=
 =?utf-8?B?MkVoNnlLcjRKUzNzTHRkYkVkL3NxT2pMWXpIMGd1aCt1SEEwYXlpWkVMcEdz?=
 =?utf-8?B?djVYMlRlSHA0Z2F0MjZ2dDl3b3dSU09LYlNtTy9XOFdaOXlvcjJpQm4yL3Fu?=
 =?utf-8?B?TXMzcWo4cEJkVXpyKzdiR2NESUVrSFphUmQ4WFdWMUxoM2pxUkFSWDdjdkJR?=
 =?utf-8?B?bU1qRzVkeGQycEZwZy9GQkdxZ2FuU1Y5RnhvYnY0ZG9ia01EK3UzZU82dWhp?=
 =?utf-8?B?R2hZanhPcVlaKzFXWGl1MXRlN2Y5SjBQOUl3Z0FUNnVuSjVsVWJmM2FLclUv?=
 =?utf-8?B?Z09CeVBhL1FaNEtYVTBZVCtDdjB1UjNydE1WdE1MN2RpOWk3YlNQcStka1A4?=
 =?utf-8?B?UG9HekpmMU1IeHNmVDlwRzZSd1BaNUtPK0dRRy8va0d4cjNLY1BzK3pKN3hz?=
 =?utf-8?B?NGhYS0FPUWp1Ti9nS1pxcGFLa3RNYm9TaGtNeE9lQk1nTFRsR2JibGo3S1NK?=
 =?utf-8?B?S203S0JxUTRLcEJwanhXMlpBb3BxSzI0SytUSGtMeXJTcG9hblRqRFFoamJy?=
 =?utf-8?B?WWhPODNmN2hGdUt6VGJ6TEpRNzEyamV0Zldoa00wSU02YXpYVkJuaFI5UUZl?=
 =?utf-8?B?RzRkcW5WcjlxRVFjYnBZbTNwUTB5WXhwZDFJQ1o3NkovWlNYTUFxWVdVRnRy?=
 =?utf-8?B?bnBRdFRkU2hSeTNqTjJXK3lhdE9CNnJpVFpIeUxRWjVyd3VlSlBtL1NOWUJn?=
 =?utf-8?B?Lzh2YnM4aHZLQ0w0KzhkaFJUa3hZcTNCKzFXdjhUMTU5N0h5MTVQY2tBWlZL?=
 =?utf-8?B?Vm9kc253WU9tT3U4MkJUTTUyamVReUl6NHBLM0hqZ3d2YVVtZDQ1WENBTjZB?=
 =?utf-8?B?b1FWQ3N4MkRkUXpuMy85M1dtZlhFRTgxTnhxZ2gwQTBma2pad0lKZVIwdzgx?=
 =?utf-8?B?RE5qTVRyS3MwbFFwK0gxenJQemV6cHo3THRiVGMwcDFQa0RGMXJPUVNYeVls?=
 =?utf-8?B?UUVRcVdubGJ2RWxESC9SNEtQOGZUWTdxTkVhOWNVZW1RWnAzUUZjRzBnRHRH?=
 =?utf-8?B?cFJKWTduRUpqbU12Y2xFWEF4SFl3dGhtcXl6OGthVnFIaUp0ZUpubDB4Y3N3?=
 =?utf-8?Q?xauvVV4xiCi6kiefPbnZtogei?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a407759c-4376-4692-f11c-08dc38080300
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 02:50:24.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArLir6cDJzMpmZH3se1b0hKanVOHv/j8m7BedoYEA2+NnXWHB5Sp2aySztgyjZrUvWW5kzSEBKJcDSZoCL6rLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-ORIG-GUID: _fWLj_rdBhcnZ1onjt677Gqk-RL1MPUy
X-Proofpoint-GUID: _fWLj_rdBhcnZ1onjt677Gqk-RL1MPUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_02,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41S2U3sM002057
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 02:50:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8593

On 2/27/24 21:56, Bruce Ashfield wrote:
> This patch is fine. I'll queue it shortly, once I work through some
> other upgrade issues.
>
> Bruce

Thanks Bruce.

I'm also going to upgrade some go recipes in meta-virt. I will not touch=20
those queued in master-next. Is there any other recipe you're working on=20
or planning to work on?

I found, just two days ago, that the go version in oe-core is 1.20. At=20
the same time, I found oe-core has feature freezed. This would cause=20
some trouble, I guess. So my initial plan was to upgrade the go recipes=20
in meta-virt to the highest version that are compatible with go 1.20.

Now there are patches in mailing list to upgrade go to 1.21. Given the=20
feature freeze fact, I'm not sure if the go 1.21 upgrade will make it=20
into this LTS 5.0 release, especially with the dynlinking issue. I've=20
also replied the email to check.

Regards,

Qi


>
> On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject=
.org
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> These deps no longer have any effect. Remove them.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../oci-image-tools/oci-image-tools_git.bb               | 9 -------=
--
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb=
 b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> index b925a2a7..ade6534d 100644
>> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> @@ -3,15 +3,6 @@ SUMMARY =3D "A collection of tools for working with t=
he OCI image format specifica
>>   LICENSE =3D "Apache-2.0"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
>>
>> -DEPENDS =3D "\
>> -           oci-image-spec \
>> -           oci-runtime-spec \
>> -           go-digest \
>> -           go-errors \
>> -           spf13-cobra \
>> -           spf13-pflag \
>> -          "
>> -
>>   SRC_URI =3D "git://github.com/opencontainers/image-tools.git;branch=3D=
master;protocol=3Dhttps;destsuffix=3Dgit/src/github.com/opencontainers/im=
age-tools \
>>              file://0001-config-make-Config.User-mapping-errors-a-warn=
ing.patch \
>>              file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-buildin=
g.patch"
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8586): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8586
>> Mute This Topic: https://lists.yoctoproject.org/mt/104598180/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


