Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0720EECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:50:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3405.1662519041673839121
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cvnNtJuH;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=624959785e=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2872IvCk023547;
	Wed, 7 Sep 2022 02:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0mmkW/A6YNeZM0KxnCnL9K3Cio/ibvJep+NnPw2AbFc=;
 b=cvnNtJuHkRDukDfhAV84LIJOnlUpCWX0jJWAwTMKS6OSY7wEYGIhYS5iykXw83Jt7M+9
 AjMXsk7myYQSQFAJC0PN/Am3tR2HisBmqTDhFnyNxCOjSmoRa6X1Gg0IAl51w5Cw6E1s
 dLPAd1a01pX8W6NA9fM+Krb62GuAEec8H9gAcHztL6lk92/k3NnPGYiYFuLacRdYwS4Y
 bwWVxmAPW6Z+M89n8HkcUlyFdlHHe3avfAIWpXbkfQVQMER3KjMP1r1i8Ye9a9sGXg9i
 Sj/kI7lNbsXlL5MN+JUkT0FKA/34bngtkuTosTNEBF73XKjsOeHhH2jr543P282LJJiv IA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv03c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 02:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm9VSzhHqI0u611pzofRQJ+vpuzscu7FDy0IGzTraVCY3J4sGwX3dnDNKkRRbnFKjgElIl52OxcutrBF4yFFaqoYirL+IvCH8A1OgWxejqcnPySsQQo695VQnSuD5Hf7vpmEmffQSv6FWuTCGv2bUkCKs44n7UXHvCFjF9CCLVXhFqdTa8/oeS0buab/5P9xdtrn76C0UaJfDlPV4YQo4rCqf1kzwNb2lBK8g0aMjqv4p8vW3ryqxu6TJGipoNhGtXZ4D1dA+AC9OQZQlwdWw6TEVvsyfkbLZJXkE9NoBS9CalVAc88B3aJVMzWJKNbtLufEzdcrFy6fFT0H7GVhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mmkW/A6YNeZM0KxnCnL9K3Cio/ibvJep+NnPw2AbFc=;
 b=ID/87eipam4a1y0cWiGt1JIc8PrgnElZInYFmEoq0F82Nx6r6KIQEct9gzFxVQIydi/3QZlJXYPp8qCmx2671SL8TeGnOzsJEot5le/pLW8n846CpIlLVmTNIgwgffILgVtT2hTSpFttHFlcWeanxZABxv+O5RBdo+jTjOet/SdRsh6hbPhpDj8DoCD2uFd5hWqnk8v346qnyWcy6Bh+BKP9hK6f2/+ciwq3EWmCsvscjE3Bs0BIIypr1dVsJuDbLRUcPCIMb55XznBLSsvQ8DancDqHNiBh3E/zdjPqksvJU38e65XFRChQeMG7aOG0qSyKr5xtrEnihZLvvfyRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SN6PR11MB3280.namprd11.prod.outlook.com (2603:10b6:805:bb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Wed, 7 Sep 2022 02:50:36 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::404a:5eeb:bbdc:603e]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::404a:5eeb:bbdc:603e%6]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 02:50:36 +0000
Message-ID: <bd8e66aa-ba46-1e91-26ef-7e4e4614aefa@windriver.com>
Date: Wed, 7 Sep 2022 10:50:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-virtualization] [PATCH] criu: fix build errors with glibc
 2.36
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220902033119.1463-1-kai.kang@windriver.com>
 <CADkTA4N8sau9QLn2g6nGtCd0jGAVrrjWoX=WGD6yrQ87p6-OSQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CADkTA4N8sau9QLn2g6nGtCd0jGAVrrjWoX=WGD6yrQ87p6-OSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0229.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::21) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8e907d2-859a-4b89-80f1-08da907bbd64
X-MS-TrafficTypeDiagnostic: SN6PR11MB3280:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qZ1tRdoZsVudOwW4FT9q30Sd+GtuTBkRDpRV4JtHQfRkASzJCGfkGUrqiyr83fmH0su+awdYxHpxeQEO1qy2BJW/s4V/XDLaaih6OXN3y64RivClmMUHR2HOeNMHBycGqp1/r0rNBwUzC+rUJxq4xBP33Jf0sr7izTbH2mKniJvrhVLb2bF/c6SPR781GFIt4YwCSDH25hUEgJskNZ0pOnFh0MdAlj2DtZNRgoCorNxdZa2lhSgCDk5XEbv/dhCmTi+pVNgo8Dii7tk3bLsNjgfRnjh5OQFF9V4sntP8CNoWwbCjWoQUttWkQ7wfP0pRIiO6w27mwKs7mi4jfDl8uLdYN8Xyho/i+3TmvMmOd6ULuLkzYq+7W2NjYM5tak7emBrBP7khG1tFtOohqndC/mnccLXmKcBq+HAq3PoRwPfURN6lrXVvFIYigdQK24aoqfkBGzXD/CAokdBaoICstFdljkE8MlbHpEjfiSejD4S9iRZ0nUPqdaRwBV1QoMYKHLMQ0D6jQ+QQoJe3uk92NOUORDccQj2XMX5fNI+KFnceLvnsxCqby7nGsv5TWYFf004sOohgA3M+P+KzAvgYmKg9e6PCpsdcmuth822CnUF6GM0ILM+N+pA17pyhb+IUWg/I8taAyYOWBe/E2WzcgBKhE31x9BJEXwqAxscuQ7W7lYR0cfSgXjc+3cIGy74xUcRjzWobN5wl01YUZnoHd8UADV63pCm454RiEVXq4iq9tiEST3KJHJVaiapoygLUcEziMBHl1oRR6rf0hzYNyLzhAmzlcDXijfuhbJS4TZZgW+3nKIDmJcNkKSnBjYY44ux3LhglVcE/4aDjKCHibgHf9gjhSZN78oz6wlibU4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39850400004)(396003)(136003)(376002)(83380400001)(8936002)(36756003)(4326008)(38100700002)(8676002)(66946007)(66556008)(66476007)(6916009)(316002)(31696002)(86362001)(2906002)(30864003)(53546011)(5660300002)(6506007)(186003)(26005)(6666004)(6512007)(2616005)(478600001)(966005)(41300700001)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3hPUWpEZmxsS1QrV2RkbXNmOTYzTnA0RlBrWVpkRHdIMWx6UkV3VWdwZW1x?=
 =?utf-8?B?cHQ4S29iWUZPbnV5dG9CbC9MbmZpakdiSW5VVStKUkRPckt2cG5ERHM2UkE0?=
 =?utf-8?B?TU85am9wZlllZTB1UzVJZnVERS9HZTc5OVF2aVJzZUE4cURCWDhDNzNWYVQx?=
 =?utf-8?B?R0w2enFLaER1MzVZK0NPS1B5eTFySlVwNklXM1k3OWFuNm1IUVYxZEhEeHVy?=
 =?utf-8?B?T0dXYjFWVlJBVUp0RTh1TGhCTmdHQ0kwTHBzNkdzelNsOFFTa2lZQkU1L2NU?=
 =?utf-8?B?SFZhTUtxQXpxNWp6UTZLeS9CZzZkMEFIbEJmOW9tZkcxdXpaVWVhNk1raTBU?=
 =?utf-8?B?UmMzaXJ5eXZZYW51R2dwcmlTd01CTW1YcERBMWJNS01CRnJQczJkREN4Qkwx?=
 =?utf-8?B?cmI5d0Q2a29tdnVLNFBWSzc1Rit4ZmY1Q014Z3ZzOEJ0aGVxbndvRkRsYXZr?=
 =?utf-8?B?TjZtc2hYTTQ3TUd3T2Y3Sm1BUzdjZUo0NUVwWjF1UThicTMvYmxnVVBSY3Zu?=
 =?utf-8?B?eWg5UExaZ1dYRDdPRTE4YTh1Y3N3U1dyZHF6WVR4N205RCtYWXdyQ04yemhM?=
 =?utf-8?B?aTRVSDZBWjJRVWE2TE5DNmpLWVN0a1NCQUNCZ2g4bGVrNW9uY2VoaGV5dVd1?=
 =?utf-8?B?N0NJYm9hVlI2YUlsa21kclRTR1k0RjJnZjltcisvamtSTldnbVR0dmFiZktt?=
 =?utf-8?B?cERyenlnQlBMZ1ZhbUhZWXA1anBhN2I2dDBEb2NSYUxSb3o3QU5OQnNNRGpx?=
 =?utf-8?B?R3BITmJjU1QydEcvMCtPSEZnUzRTblJKckllRnpHNnR2eGo3WG5uVU1qRnp3?=
 =?utf-8?B?M2VqcTBwU2k1VjVtV0lEN3FFTkFyQ3Y3Zk84RndEUFBDYWRCSUhTWXluNnF1?=
 =?utf-8?B?YUUxOUFjOUJ3ODZsZEtMUjFQVXI0YmMwajFmWXYxWHByQzdSMkpITHpLdFRu?=
 =?utf-8?B?eTFJYkNFdzU0VzkxR3k3TTJDM01WZitpeXVrczU0V3BWWmhSRGZpcm5nbG9M?=
 =?utf-8?B?TUFucE9JMmdxbEIvRWswMnArb3hUcnZTZVQydkVPMEx2ZUsyOVYxUWI3NnBI?=
 =?utf-8?B?aDBEK2djUXZzaG0rU2I2QXozby9NWEdOblhjTnpzdW16YUNsM1p5SERVSHN0?=
 =?utf-8?B?SFplU1U4UEdxNVJYSzhqVThMb2dCc0h5ZUhRYm1mK3lWaSs3L0VHa2RJUHpF?=
 =?utf-8?B?Q1FRVE1oT0h1azYvOWx1WkhwUGtsYmd5REY1b2JHYkNaU2xmdXVobEJzR2dU?=
 =?utf-8?B?aGhVY281ak12ckhIVC9yZVFBeFZ0NkhBS3lSTUFSelM0N3pUMzRyQlkxb05B?=
 =?utf-8?B?bkszUmwwRVFVeHR0cVU4K2VWYUJ6U2JoZ3ZKWElQUUN1ZytGeDUwSEV0ZUNW?=
 =?utf-8?B?WGhKa0xuTjZjZFY0QURuVnpNd3NYWXYxeGJFdVp5QnN0dk5Zd0E3WmxuNFJR?=
 =?utf-8?B?Z1pjUEpPV0ZaMDBneFg0SzdyU3VwTVZDR0FHd2JvcXAxcGphV2FjMEVubGhD?=
 =?utf-8?B?eFl3ZmdxL3NGY0VDSXdLRlBVS2xYZ3U2UCtXMk9Dd2JvZ0JyZEdaY3BKMC9O?=
 =?utf-8?B?Y0JJV01LY0hSYkRGd05HVmRYVVVadmhrVGtWcHU2UVZDazFmL2JmMlpiZFBo?=
 =?utf-8?B?MHVndGJnU0lqUng5OXlHNlIwbjE5NlkrbWZaZ3E0RnV4WjFnU21iUGl6aFI4?=
 =?utf-8?B?VU5aWE5rZjhPM0VpdUVRaGtFdmpad3A2YU1yZzFkN2V0VEdiZjdHN1FxWXIy?=
 =?utf-8?B?NU9QL0cwVHF3QnM3MEo4Y0Fid0lzOE9wa2dGcmFiaHlxc29EdFdXRjkzTENq?=
 =?utf-8?B?cEk0RXdrdFJLZ2x1Vnp3MmZJc29HVnVYK3BEQmtWNGhUVkFDbWVjakZGZHdV?=
 =?utf-8?B?bmtKbDkxNmRwejF2WU92NTZmaWIycUlkRlZwcnFubWh6SDhidFZQZWRlTzdo?=
 =?utf-8?B?UXE0YzNkRzQvcFFyM0VNUnlId080YUZNc3dCZlc5OTh0QkRCMWVRS1RkbDJi?=
 =?utf-8?B?VkVxUWVFKzhrMmREQkJ6K2pub2wwYkdxMzl5L1V1N0x1cjhQL1JBM0pNeldw?=
 =?utf-8?B?RjA3Rmx2c3YyS3NwWWoxY1FoMXlSK3p1bmJCbHR0bmpsam9saWdKaWM3Y251?=
 =?utf-8?Q?3IWBok8FGvN4E8aS9fb+9xWLU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8e907d2-859a-4b89-80f1-08da907bbd64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 02:50:36.0297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IhX5nBh52HoCZ3FabnXBrhIYg0eQmjlbazuD5SgV8OJx6ymzqYXLV4sIWcLDXuzOAuEjDUB6/AEfvuPPpF5tlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3280
X-Proofpoint-ORIG-GUID: 34ymrXZDvZnWOU0SGxfPr3w_ML2oBN9V
X-Proofpoint-GUID: 34ymrXZDvZnWOU0SGxfPr3w_ML2oBN9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_01,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070011
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 02:50:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7605

On 9/7/22 10:41, Bruce Ashfield wrote:
> criu is a _git recipe, so we don't have to do backports, but can
> instead just bump the SRCREV
Hi Bruce,
> We also have time to bump it to the latest before the upcoming release.
>
> Is there a reason why a version or SRCREV bump won't work here ?
I notice that the SRCREV in the bb file is exact tag of v3.17. And v3.18 
have not release yet.

If it is ok to update to latest git revision, I'll do it.

Regards,
Kai

>
> Bruce
>
> On Thu, Sep 1, 2022 at 11:31 PM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Backport patches to fix build errors with glibc 2.36.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   recipes-containers/criu/criu_git.bb           |   4 +-
>>   .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
>>   ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
>>   3 files changed, 401 insertions(+), 1 deletion(-)
>>   create mode 100644 recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>>   create mode 100644 recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>>
>> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
>> index 46401f9..a218310 100644
>> --- a/recipes-containers/criu/criu_git.bb
>> +++ b/recipes-containers/criu/criu_git.bb
>> @@ -20,7 +20,9 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
>>              file://0001-criu-Skip-documentation-install.patch \
>>              file://0002-criu-Change-libraries-install-directory.patch \
>>              file://0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
>> -          "
>> +           file://0004-criu-fix-conflicting-headers.patch \
>> +           file://0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch \
>> +           "
>>
>>   COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>>
>> diff --git a/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>> new file mode 100644
>> index 0000000..fa4cecd
>> --- /dev/null
>> +++ b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>> @@ -0,0 +1,288 @@
>> +Backport patch to fix criu compile error with glibc 2.36. Update context
>> +for Makefile.config.
>> +
>> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/4c86d6a7]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From 4c86d6a7d54abb64fc5a15131f3351224e8c071b Mon Sep 17 00:00:00 2001
>> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>> +Date: Sun, 31 Jul 2022 16:07:30 +0000
>> +Subject: [PATCH] criu: fix conflicting headers
>> +
>> +There are several changes in glibc 2.36 that make sys/mount.h header
>> +incompatible with kernel headers:
>> +
>> +https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
>> +
>> +This patch removes conflicting includes for `<linux/mount.h>` and
>> +updates the content of `criu/include/linux/mount.h` to match
>> +`/usr/include/sys/mount.h`. In addition, inline definitions sys_*()
>> +functions have been moved from "linux/mount.h" to "syscall.h" to
>> +avoid conflicts with `uapi/compel/plugins/std/syscall.h` and
>> +`<unistd.h>`. The include for `<linux/aio_abi.h>` has been replaced
>> +with local include to avoid conflicts with `<sys/mount.h>`.
>> +
>> +Fixes: #1949
>> +
>> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>> +---
>> + Makefile.config              |  2 +-
>> + criu/cgroup.c                |  1 +
>> + criu/cr-check.c              |  2 +-
>> + criu/cr-restore.c            |  3 ++-
>> + criu/include/aio.h           |  2 +-
>> + criu/include/linux/aio_abi.h | 14 +++++++++++
>> + criu/include/linux/mount.h   | 48 +++++++++++++++++++-----------------
>> + criu/include/syscall.h       | 17 +++++++++++++
>> + criu/pie/parasite.c          |  2 +-
>> + criu/util.c                  |  1 +
>> + scripts/feature-tests.mak    | 13 ----------
>> + 11 files changed, 64 insertions(+), 41 deletions(-)
>> + create mode 100644 criu/include/linux/aio_abi.h
>> + create mode 100644 criu/include/syscall.h
>> +
>> +diff --git a/Makefile.config b/Makefile.config
>> +index d113e2246..270ec61c0 100644
>> +--- a/Makefile.config
>> ++++ b/Makefile.config
>> +@@ -78,7 +78,7 @@ export DEFINES += $(FEATURE_DEFINES)
>> + export CFLAGS += $(FEATURE_DEFINES)
>> +
>> + FEATURES_LIST := TCP_REPAIR STRLCPY STRLCAT PTRACE_PEEKSIGINFO \
>> +-      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW FSCONFIG MEMFD_CREATE OPENAT2
>> ++      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW MEMFD_CREATE OPENAT2
>> +
>> + # $1 - config name
>> + define gen-feature-test
>> +diff --git a/criu/cgroup.c b/criu/cgroup.c
>> +index e05b0832e..325df6a1d 100644
>> +--- a/criu/cgroup.c
>> ++++ b/criu/cgroup.c
>> +@@ -27,6 +27,7 @@
>> + #include "images/cgroup.pb-c.h"
>> + #include "kerndat.h"
>> + #include "linux/mount.h"
>> ++#include "syscall.h"
>> +
>> + /*
>> +  * This structure describes set of controller groups
>> +diff --git a/criu/cr-check.c b/criu/cr-check.c
>> +index f589a91da..0ca80192c 100644
>> +--- a/criu/cr-check.c
>> ++++ b/criu/cr-check.c
>> +@@ -21,7 +21,6 @@
>> + #include <sys/prctl.h>
>> + #include <sched.h>
>> + #include <sys/mount.h>
>> +-#include <linux/aio_abi.h>
>> +
>> + #include "../soccr/soccr.h"
>> +
>> +@@ -52,6 +51,7 @@
>> + #include "net.h"
>> + #include "restorer.h"
>> + #include "uffd.h"
>> ++#include "linux/aio_abi.h"
>> +
>> + #include "images/inventory.pb-c.h"
>> +
>> +diff --git a/criu/cr-restore.c b/criu/cr-restore.c
>> +index 279246c19..d11d28173 100644
>> +--- a/criu/cr-restore.c
>> ++++ b/criu/cr-restore.c
>> +@@ -22,7 +22,6 @@
>> + #include <compel/ptrace.h>
>> + #include "common/compiler.h"
>> +
>> +-#include "linux/mount.h"
>> + #include "linux/rseq.h"
>> +
>> + #include "clone-noasan.h"
>> +@@ -86,6 +85,8 @@
>> + #include <compel/plugins/std/syscall-codes.h>
>> + #include "compel/include/asm/syscall.h"
>> +
>> ++#include "linux/mount.h"
>> ++
>> + #include "protobuf.h"
>> + #include "images/sa.pb-c.h"
>> + #include "images/timer.pb-c.h"
>> +diff --git a/criu/include/aio.h b/criu/include/aio.h
>> +index d1655739d..38e704020 100644
>> +--- a/criu/include/aio.h
>> ++++ b/criu/include/aio.h
>> +@@ -1,7 +1,7 @@
>> + #ifndef __CR_AIO_H__
>> + #define __CR_AIO_H__
>> +
>> +-#include <linux/aio_abi.h>
>> ++#include "linux/aio_abi.h"
>> + #include "images/mm.pb-c.h"
>> + unsigned int aio_estimate_nr_reqs(unsigned int size);
>> + int dump_aio_ring(MmEntry *mme, struct vma_area *vma);
>> +diff --git a/criu/include/linux/aio_abi.h b/criu/include/linux/aio_abi.h
>> +new file mode 100644
>> +index 000000000..d9ce78720
>> +--- /dev/null
>> ++++ b/criu/include/linux/aio_abi.h
>> +@@ -0,0 +1,14 @@
>> ++#ifndef __LINUX__AIO_ABI_H
>> ++#define __LINUX__AIO_ABI_H
>> ++
>> ++typedef __kernel_ulong_t aio_context_t;
>> ++
>> ++/* read() from /dev/aio returns these structures. */
>> ++struct io_event {
>> ++      __u64 data; /* the data field from the iocb */
>> ++      __u64 obj;  /* what iocb this event came from */
>> ++      __s64 res;  /* result code for this event */
>> ++      __s64 res2; /* secondary result */
>> ++};
>> ++
>> ++#endif /* __LINUX__AIO_ABI_H */
>> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
>> +index 9a3a28b10..0d55a588c 100644
>> +--- a/criu/include/linux/mount.h
>> ++++ b/criu/include/linux/mount.h
>> +@@ -4,32 +4,34 @@
>> + #include "common/config.h"
>> + #include "compel/plugins/std/syscall-codes.h"
>> +
>> +-#ifdef CONFIG_HAS_FSCONFIG
>> +-#include <linux/mount.h>
>> +-#else
>> ++/* Copied from /usr/include/sys/mount.h */
>> ++
>> ++#ifndef FSCONFIG_CMD_CREATE
>> ++/* The type of fsconfig call made.   */
>> + enum fsconfig_command {
>> +-      FSCONFIG_SET_FLAG = 0,        /* Set parameter, supplying no value */
>> +-      FSCONFIG_SET_STRING = 1,      /* Set parameter, supplying a string value */
>> +-      FSCONFIG_SET_BINARY = 2,      /* Set parameter, supplying a binary blob value */
>> +-      FSCONFIG_SET_PATH = 3,        /* Set parameter, supplying an object by path */
>> +-      FSCONFIG_SET_PATH_EMPTY = 4,  /* Set parameter, supplying an object by (empty) path */
>> +-      FSCONFIG_SET_FD = 5,          /* Set parameter, supplying an object by fd */
>> +-      FSCONFIG_CMD_CREATE = 6,      /* Invoke superblock creation */
>> ++      FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>> ++#define FSCONFIG_SET_FLAG FSCONFIG_SET_FLAG
>> ++      FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
>> ++#define FSCONFIG_SET_STRING FSCONFIG_SET_STRING
>> ++      FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
>> ++#define FSCONFIG_SET_BINARY FSCONFIG_SET_BINARY
>> ++      FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
>> ++#define FSCONFIG_SET_PATH FSCONFIG_SET_PATH
>> ++      FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
>> ++#define FSCONFIG_SET_PATH_EMPTY FSCONFIG_SET_PATH_EMPTY
>> ++      FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
>> ++#define FSCONFIG_SET_FD FSCONFIG_SET_FD
>> ++      FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
>> ++#define FSCONFIG_CMD_CREATE FSCONFIG_CMD_CREATE
>> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>> ++#define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
>> + };
>> +-#endif
>> ++#endif // FSCONFIG_CMD_CREATE
>> +
>> +-static inline int sys_fsopen(const char *fsname, unsigned int flags)
>> +-{
>> +-      return syscall(__NR_fsopen, fsname, flags);
>> +-}
>> +-static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
>> +-{
>> +-      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
>> +-}
>> +-static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
>> +-{
>> +-      return syscall(__NR_fsmount, fd, flags, attr_flags);
>> +-}
>> ++#ifndef MS_MGC_VAL
>> ++/* Magic mount flag number. Has to be or-ed to the flag values.  */
>> ++#define MS_MGC_VAL 0xc0ed0000 /* Magic flag number to indicate "new" flags */
>> ++#define MS_MGC_MSK 0xffff0000 /* Magic flag number mask */
>> ++#endif
>> +
>> + #endif
>> +diff --git a/criu/include/syscall.h b/criu/include/syscall.h
>> +new file mode 100644
>> +index 000000000..c38d6d971
>> +--- /dev/null
>> ++++ b/criu/include/syscall.h
>> +@@ -0,0 +1,17 @@
>> ++#ifndef __CR_SYSCALL_H__
>> ++#define __CR_SYSCALL_H__
>> ++
>> ++static inline int sys_fsopen(const char *fsname, unsigned int flags)
>> ++{
>> ++      return syscall(__NR_fsopen, fsname, flags);
>> ++}
>> ++static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
>> ++{
>> ++      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
>> ++}
>> ++static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
>> ++{
>> ++      return syscall(__NR_fsmount, fd, flags, attr_flags);
>> ++}
>> ++
>> ++#endif /* __CR_SYSCALL_H__ */
>> +\ No newline at end of file
>> +diff --git a/criu/pie/parasite.c b/criu/pie/parasite.c
>> +index e7eb1fcb6..f75fe13bb 100644
>> +--- a/criu/pie/parasite.c
>> ++++ b/criu/pie/parasite.c
>> +@@ -3,7 +3,6 @@
>> + #include <signal.h>
>> + #include <linux/limits.h>
>> + #include <linux/capability.h>
>> +-#include <sys/mount.h>
>> + #include <stdarg.h>
>> + #include <sys/ioctl.h>
>> + #include <sys/uio.h>
>> +@@ -14,6 +13,7 @@
>> + #include "int.h"
>> + #include "types.h"
>> + #include <compel/plugins/std/syscall.h>
>> ++#include "linux/mount.h"
>> + #include "parasite.h"
>> + #include "fcntl.h"
>> + #include "prctl.h"
>> +diff --git a/criu/util.c b/criu/util.c
>> +index 5f69465b4..060ca3bd4 100644
>> +--- a/criu/util.c
>> ++++ b/criu/util.c
>> +@@ -40,6 +40,7 @@
>> + #include "mem.h"
>> + #include "namespaces.h"
>> + #include "criu-log.h"
>> ++#include "syscall.h"
>> +
>> + #include "clone-noasan.h"
>> + #include "cr_options.h"
>> +diff --git a/scripts/feature-tests.mak b/scripts/feature-tests.mak
>> +index 014e893a8..fb5d2ef7a 100644
>> +--- a/scripts/feature-tests.mak
>> ++++ b/scripts/feature-tests.mak
>> +@@ -137,19 +137,6 @@ ENTRY(main)
>> + END(main)
>> + endef
>> +
>> +-define FEATURE_TEST_FSCONFIG
>> +-
>> +-#include <linux/mount.h>
>> +-
>> +-int main(void)
>> +-{
>> +-      if (FSCONFIG_CMD_CREATE > 0)
>> +-              return 0;
>> +-      return 0;
>> +-}
>> +-
>> +-endef
>> +-
>> + define FEATURE_TEST_NFTABLES_LIB_API_0
>> +
>> + #include <string.h>
>> +--
>> +2.34.1
>> +
>> diff --git a/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>> new file mode 100644
>> index 0000000..dc41d36
>> --- /dev/null
>> +++ b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>> @@ -0,0 +1,110 @@
>> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/517c0947]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From 517c0947050e63aac72f63a3bf373d76264723b9 Mon Sep 17 00:00:00 2001
>> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>> +Date: Wed, 24 Aug 2022 21:20:30 +0200
>> +Subject: [PATCH 2/2] mount: add definition for FSOPEN_CLOEXEC
>> +
>> +A recent change in glibc introduced `enum fsconfig_command` [1] and as a
>> +result the compilation of criu fails with the following errors
>> +
>> +In file included from criu/pie/util.c:3:
>> +/usr/include/sys/mount.h:240:6: error: redeclaration of 'enum fsconfig_command'
>> +  240 | enum fsconfig_command
>> +      |      ^~~~~~~~~~~~~~~~
>> +In file included from /usr/include/sys/mount.h:32:
>> +criu/include/linux/mount.h:11:6: note: originally defined here
>> +   11 | enum fsconfig_command {
>> +      |      ^~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:242:3: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
>> +  242 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>> +      |   ^~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:12:9: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
>> +   12 |         FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>> +      |         ^~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:244:3: error: redeclaration of enumerator 'FSCONFIG_SET_STRING'
>> +  244 |   FSCONFIG_SET_STRING     = 1,    /* Set parameter, supplying a string value */
>> +      |   ^~~~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:14:9: note: previous definition of 'FSCONFIG_SET_STRING' with type 'enum fsconfig_command'
>> +   14 |         FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
>> +      |         ^~~~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:246:3: error: redeclaration of enumerator 'FSCONFIG_SET_BINARY'
>> +  246 |   FSCONFIG_SET_BINARY     = 2,    /* Set parameter, supplying a binary blob value */
>> +      |   ^~~~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:16:9: note: previous definition of 'FSCONFIG_SET_BINARY' with type 'enum fsconfig_command'
>> +   16 |         FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
>> +      |         ^~~~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:248:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH'
>> +  248 |   FSCONFIG_SET_PATH       = 3,    /* Set parameter, supplying an object by path */
>> +      |   ^~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:18:9: note: previous definition of 'FSCONFIG_SET_PATH' with type 'enum fsconfig_command'
>> +   18 |         FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
>> +      |         ^~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:250:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH_EMPTY'
>> +  250 |   FSCONFIG_SET_PATH_EMPTY = 4,    /* Set parameter, supplying an object by (empty) path */
>> +      |   ^~~~~~~~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:20:9: note: previous definition of 'FSCONFIG_SET_PATH_EMPTY' with type 'enum fsconfig_command'
>> +   20 |         FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
>> +      |         ^~~~~~~~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:252:3: error: redeclaration of enumerator 'FSCONFIG_SET_FD'
>> +  252 |   FSCONFIG_SET_FD         = 5,    /* Set parameter, supplying an object by fd */
>> +      |   ^~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:22:9: note: previous definition of 'FSCONFIG_SET_FD' with type 'enum fsconfig_command'
>> +   22 |         FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
>> +      |         ^~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:254:3: error: redeclaration of enumerator 'FSCONFIG_CMD_CREATE'
>> +  254 |   FSCONFIG_CMD_CREATE     = 6,    /* Invoke superblock creation */
>> +      |   ^~~~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:24:9: note: previous definition of 'FSCONFIG_CMD_CREATE' with type 'enum fsconfig_command'
>> +   24 |         FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
>> +      |         ^~~~~~~~~~~~~~~~~~~
>> +/usr/include/sys/mount.h:256:3: error: redeclaration of enumerator 'FSCONFIG_CMD_RECONFIGURE'
>> +  256 |   FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
>> +      |   ^~~~~~~~~~~~~~~~~~~~~~~~
>> +criu/include/linux/mount.h:26:9: note: previous definition of 'FSCONFIG_CMD_RECONFIGURE' with type 'enum fsconfig_command'
>> +   26 |         FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>> +
>> +This patch adds definition for FSOPEN_CLOEXEC to solve this problem. In particular,
>> +sys/mount.h includes ifndef check for FSOPEN_CLOEXEC surrounding `enum fsconfig_command`.
>> +
>> +[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=7eae6a91e9b1670330c9f15730082c91c0b1d570
>> +
>> +Reported-by: Younes Manton (@ymanton)
>> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>> +---
>> + criu/include/linux/mount.h | 10 ++++++++--
>> + 1 file changed, 8 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
>> +index 0d55a588c..fefafa89e 100644
>> +--- a/criu/include/linux/mount.h
>> ++++ b/criu/include/linux/mount.h
>> +@@ -6,7 +6,7 @@
>> +
>> + /* Copied from /usr/include/sys/mount.h */
>> +
>> +-#ifndef FSCONFIG_CMD_CREATE
>> ++#ifndef FSOPEN_CLOEXEC
>> + /* The type of fsconfig call made.   */
>> + enum fsconfig_command {
>> +       FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>> +@@ -26,7 +26,13 @@ enum fsconfig_command {
>> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>> + #define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
>> + };
>> +-#endif // FSCONFIG_CMD_CREATE
>> ++
>> ++#endif // FSOPEN_CLOEXEC
>> ++
>> ++/* fsopen flags. With the redundant definition, we check if the kernel,
>> ++ * glibc value and our value still match.
>> ++ */
>> ++#define FSOPEN_CLOEXEC 0x00000001
>> +
>> + #ifndef MS_MGC_VAL
>> + /* Magic mount flag number. Has to be or-ed to the flag values.  */
>> +--
>> +2.34.1
>> +
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7593): https://lists.yoctoproject.org/g/meta-virtualization/message/7593
>> Mute This Topic: https://lists.yoctoproject.org/mt/93412155/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

-- 
Kai Kang
Wind River Linux


