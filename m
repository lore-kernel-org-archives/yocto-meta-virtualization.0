Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3120CECAAD3
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 01:58:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.470.1662602289873791669
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 18:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=szgF9E6J;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=625031ec50=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2881SNWE016752;
	Thu, 8 Sep 2022 01:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rE5Xs6uOiMxIr1QBRT7MrqusWp6dw+MMAH8RH+fJuYc=;
 b=szgF9E6J8Jc0Bcp9L1kJq5zOczkyg1LeCv/8+12n1its8nU8Ij+QZxlYLSrMGBo75erE
 /knzgGEEgeVKp35M9/hMz8tktE6XskWR9pmZ+6COy1ApAENdCLpOEBbXTxDszzX9sfWV
 98hR64W02DuCAgNsSV7vMgTlLOVZ/5u8N/OFFNvBH87uETIlHLFl53Txl/7o0IJnv7AS
 fiFvi4KVR17M/zChS+RygQAGMlNJ2A8RYYV0cvSroaaJLVfyG/rxGd9tix0LFs9fWL+H
 b/mXlXEJBinApHsV1pjeMvl0dO5u3DsX6+ux1QHEC86vy/0P0PUIwvyCe/Ogiz184KEl Xw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv18qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 01:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2FiiawpsE/5PZruMTVQfM6EWdR4W2eWhnQTqd5Q9Ze/1Lw3oEI9nKEO9PZwdWvV2O7OsfaWLvTfUbJ8nxv+NtvPb4xKNRllWCCaAIxo1UGerprmARvbox27avNTLZIy+6YHDvGuFd3xvN6rmrvtHWabZnuBRno31b9AD6nqK0DAG2HznbGbXrNbGe+fHlL2EK5l+hQzqSxTXegRwk4Uwtl2IgEJmU9fJhuMVt9y6PirWIkY7uvQLENlI2UEpsr1lQFOpEBTxzWnkH4SAzGlUIywAQa+tREktuvWnwribPrwRH7mqkiHzyDfxeoAXMYW0nopN5vKEdKzCaHB6cLoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE5Xs6uOiMxIr1QBRT7MrqusWp6dw+MMAH8RH+fJuYc=;
 b=mLhzcRHxLoYiZ58j4IxxDutMJyTTxjCyDvwj9Pbb9RMtHlp202gYE6WUqeu+1bM0f692FAs32y1Z+te8MwM7n/A+SsyoUSgoKmRsUnldeD8i3q4aYP4VwVifro/hT2YYauFymLLbICrWplgtQecEGdKILCJ695ckCUyw1ZggATAyYWVt/X+N20yXKf9sNM5dUrrGDWngt9sYZZmQlLz1CXrDc0INWH9TyFB5LnZYfgzTZ003sgxcNvJy5tEU7wvsDgaDhocZZFqdwQMVwJIiUAGCfBbb8AmEr4fTquOXTefHZugWG/D6Xvwz8PuHizFMHnb8EHEtY0sEdwxfikTWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 8 Sep
 2022 01:58:04 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::404a:5eeb:bbdc:603e]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::404a:5eeb:bbdc:603e%6]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 01:58:03 +0000
Message-ID: <52d4ce1b-0c2e-6180-e634-cf686db93f4b@windriver.com>
Date: Thu, 8 Sep 2022 09:57:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-virtualization] [PATCH] criu: fix build errors with glibc
 2.36
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220902033119.1463-1-kai.kang@windriver.com>
 <CADkTA4N8sau9QLn2g6nGtCd0jGAVrrjWoX=WGD6yrQ87p6-OSQ@mail.gmail.com>
 <bd8e66aa-ba46-1e91-26ef-7e4e4614aefa@windriver.com>
 <CADkTA4Psq=vPxun7BtniZ+91_iGzxnyid-L6c1uHE9ck6c5QPw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: 
 <CADkTA4Psq=vPxun7BtniZ+91_iGzxnyid-L6c1uHE9ck6c5QPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dfded40-a4f2-47bb-b362-08da913d90d3
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6274:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	75v5tXb2La82gKJojtAo+CYN24R5Ic5pegAFW8llifhiuMDME9x1cV7yIQUbzQX4kSAaYWs0Fv5fjI5SqOnfSE2SecPYqV+XJ1SUHw7hYOzvWKsKOcxFggtrx7No4o/p+ZoQAPtfZooIISOiVN6pwIApMSNOYud7quZcb7COPe2eXVvQfqN6WOOeqATlQ0PCupwxsyporhd/x6fAmCcwd7xVjG8ISgnf6SMj0hDR1uQl6AjpsPdDt8eF5K3LVyaN0vndBKYs8KkLrIZQ+L9KkgIhnDRmDabUUrSxFyriebeDhzyIaec33eGeRVbsMdBnM2aKYebVzQd3arIzKTxjXoFpQW+enDYSRJGCHYjGJ1B+g1MahZO/zjmbXS9Z6slSUmc63h481nxojZY3GvV2391oJb+am5k9aVu9oAXiYqNkjDD3x6p6Q55h1MRB7OnWBIzfmXZdT1fcUvlrSHrBVFvvLDgbpBbCDEPEsBrIyNPg2KqI9VexXDY1zNdsVJVSyEotMc1JU/qJuycg4dxULwV0UCMwhyh7G9G0O3PUSFZNvuazqBGNCjjTBLkK9Pbs6q2nJyLpvxK76QfFnFEGNtKS5SK19RjbX3Z6uEJnrvcKqdtKV/lBMaxWDNE3+3lJloTJDlJAMgIBCw0lj2nNM2c9ywbHnTdoL2oq2rzRW3on5T0RineWGH7xmeKfVkYojEV4B/ApaXdLxkEd9aaoekJaRpRGeOGL09X+X7eytjZ8VdFF9x+/WQswO7OWG52eEdGS10k8QDbpLVLlReSS8aaAps6CU1nOFD3kzjbxltVkmaa2wandGI7ZFR3v2U8LA6A6IrLwHGz9jjhb+xuWbuwRh7NZ61icsCsGO9Iu37Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(2906002)(186003)(6666004)(38100700002)(26005)(30864003)(53546011)(2616005)(6506007)(83380400001)(6512007)(4326008)(31696002)(966005)(8676002)(86362001)(66556008)(316002)(66476007)(66946007)(6916009)(8936002)(6486002)(478600001)(36756003)(41300700001)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXN3U2NzaEpXbTRseDBvdEZaaHArT0NVQzVzdWdvQnBmeHRwRDFxRXpPT1Ey?=
 =?utf-8?B?SXlTbTRUS3hQYUJxUU9BL3JNakxDY2F3NUhkeENzOE5CS1AzWXBYK1B3UHA1?=
 =?utf-8?B?Z3A1UXkvZ0dRTmdKMVZabFJYSXVQS0dzV0pqNnpwWWwvcHd0NUYvK0NMbmZw?=
 =?utf-8?B?dDhDQzVoNVZaelhsQ01mMDFrL216REcvNW9KQ214Vkw3djlIakE4WFlGQUNU?=
 =?utf-8?B?U2ZCbjRDZTliN3JlaVZMMm92OVRaUjk0WUwzR1pyTnlIN1FFcW1KRmZZK0d0?=
 =?utf-8?B?bk92cDNOU09OZWZJeit0MWpFZ09HNG1yK200Q2M0bkljYUpoeDhkWGw2QURB?=
 =?utf-8?B?TUk4Z1BvNDBKRWxHZW1TRnFySE9nby8va1pCcmhXV2ErcWNZVGV2N2lKcVlE?=
 =?utf-8?B?S2FXNS9iWEtyVjRPN3JscENLVEUyN3lrSGNaZTYxS1hjU1dMZ21scFRDVHlp?=
 =?utf-8?B?NUZXZU5MUGxCM3JDcCtNVlBzSThBV1VzQ3ZXY01yb0JCc0ZTYWVWYmZnZjcr?=
 =?utf-8?B?bnQ1eUM2TmhsaDBUbGpHSDNGa1A2N3BWVDE1SmNrRU1ub2VNcjE4QjkyK1R2?=
 =?utf-8?B?V09CbitGREovbzNzVHo4RFZkdXpFVmxVYmJOdzg0ZFJ4RkJUTit1TzN4ZW1W?=
 =?utf-8?B?UGZPbTd6eS9YWFo2Q2NzcmdRT2lPNDBzbUJvaUc1ZzJDaElnS0c3VjRnUXNp?=
 =?utf-8?B?WU04dUU3NHFrWWpqUnR4ZFFSd2s5WmNkeGpUNFFDcVlwZnlmQWhZTC9aOVFn?=
 =?utf-8?B?cDVnU2g2a1Zmdi9uTmlXcmFwYTNkTnUzNFZBeDNvc095U045VVk5UTdEZDdO?=
 =?utf-8?B?OXVXRFpvMnBtUlc1c2lWQUxlUVA3K2pXU1MyUE9yZTl3cW1CVGhZQ1JSRW8y?=
 =?utf-8?B?c0gwcDU3Z3YyOXJhMHlFYVh3dk1sbG5yakJabkswTnVlYm5oMW5FRnkxM2Zi?=
 =?utf-8?B?dm1TUjZOanhaakloY1RaT3hURGU0bEhiZDZiOVJ1Q1l4U1JyZGF4bWtxcW9l?=
 =?utf-8?B?c3k0RU1zTFVkeXZERFVnMXhEWGNCR2Z0RWc0ak9XM083NU1BWU9KZERreHdq?=
 =?utf-8?B?YUpRcytPMHlkRjRDRE9GZkRldGVjU0VhOWUrQkdnVlZCOFlHOWY1Z1dUcHBp?=
 =?utf-8?B?dUxKWFZ5a0w4K21uR2x4Njd0OERsR3hlV1pGRjVndHB5RDc2VUpyTUJNRUY3?=
 =?utf-8?B?UkxaeEhzeFpFa0JMZ0tHdm04d204QWlzQm1ua21UY0pDb2M3eEZHeFZNWUFO?=
 =?utf-8?B?RUJWQ0RUN2UySjMwekdkZmtjRHFvTFNJNUoySXBpMXJ6WjVuVldoUkRldWNS?=
 =?utf-8?B?dlNHTk1ZbUVjeG5aNVJ6d1BNVWtFK1JXcFlFVU56VlJET1BYWHNTSmkvejRZ?=
 =?utf-8?B?QWwwOUc2RU01c0tvcmFZTFB5TTNNMitpTlpwQmI1ZnFZMGp4czlEbHJWaW1k?=
 =?utf-8?B?N3RMZXlTUDdVQzBYbXFoN1QzL0VRamdvKzhYditzaFNpOUFnUDBoOWp3UWdx?=
 =?utf-8?B?cHV6TkNyMk1Ha1dVbTdRYklQck5jNXFFZmxHVS9idGNMTmRUMEk3cDY1c2R0?=
 =?utf-8?B?Q1Qra3VPVDZEQVI3Nlp5VGlkOFRhUHp6K3R3RktiV3hOc0tYcTU1ZjBUTjU4?=
 =?utf-8?B?WEY2aElRSlpLUDlGSGFmMnpJRmcvYkdINFFacUZXYjV2eS83K1pnSnM4aHlY?=
 =?utf-8?B?VXZIZ0tRUTk2aVdEYmlHNXJUMkQzUVdwZzhLcWhoMXhWRjVrNFJtWnBFVGRZ?=
 =?utf-8?B?c21KSjBib2habXhZeVpqZ1pPQ2lFVlRZd3dIV1AycmxDaVBtMkNtRno0SklE?=
 =?utf-8?B?bmdEL0g3YVBqSjM4NGkxN2VpS3hnU0xHbSthRk1xZEIxcjNoSytFb2dtVzlD?=
 =?utf-8?B?cnFxQnloYWs1M1VsWXVLQlVjUTJvWm85N1B4TEtKbzM1ck13SUJJMTB1dXhR?=
 =?utf-8?B?RDh5RmdDbTBPMHZGNUcxWTBIU1FFd2JnS2FYbnBQZFg3WGNEdEN2WnZmTU5T?=
 =?utf-8?B?SXpKZDBQdTdKWXJPRWxDTExMSzNiazUwbklIOXhpUncrbVV1eEw4RWF3dngr?=
 =?utf-8?B?MjhIRDRxWk9mWW5yUFZYSytUTm5wOXg3UmwzOThlSW42dXQrVEZEUVc3dnQ5?=
 =?utf-8?Q?RWsC04PK5Tk5nBDl3DueEio81?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8dfded40-a4f2-47bb-b362-08da913d90d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 01:58:03.8765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BWNH9fZH+7TslG8Q7/WFWNKo9OGrWabeHew1+9Qye5Q2IuJU72gVtOEdbNaz7y1hi77otBbva0a7GJpUBRTJTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-Proofpoint-ORIG-GUID: h7fV5D67gw3qVOn4C6h4kJ7OPUPYssNp
X-Proofpoint-GUID: h7fV5D67gw3qVOn4C6h4kJ7OPUPYssNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_01,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080006
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Sep 2022 01:58:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7612

On 9/7/22 20:25, Bruce Ashfield wrote:
> On Tue, Sep 6, 2022 at 10:50 PM Kai <kai.kang@windriver.com> wrote:
>> On 9/7/22 10:41, Bruce Ashfield wrote:
>>> criu is a _git recipe, so we don't have to do backports, but can
>>> instead just bump the SRCREV
>> Hi Bruce,
>>> We also have time to bump it to the latest before the upcoming release.
>>>
>>> Is there a reason why a version or SRCREV bump won't work here ?
>> I notice that the SRCREV in the bb file is exact tag of v3.17. And v3.18
>> have not release yet.
>>
>> If it is ok to update to latest git revision, I'll do it.
> It is not only ok, it is preferred!
>
> We don't stick only to the release tags for any of the recipes in meta-virt

Got it.

Thanks,
Kai

>
> Bruce
>
>> Regards,
>> Kai
>>
>>> Bruce
>>>
>>> On Thu, Sep 1, 2022 at 11:31 PM kai <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Backport patches to fix build errors with glibc 2.36.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    recipes-containers/criu/criu_git.bb           |   4 +-
>>>>    .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
>>>>    ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
>>>>    3 files changed, 401 insertions(+), 1 deletion(-)
>>>>    create mode 100644 recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>>>>    create mode 100644 recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>>>>
>>>> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
>>>> index 46401f9..a218310 100644
>>>> --- a/recipes-containers/criu/criu_git.bb
>>>> +++ b/recipes-containers/criu/criu_git.bb
>>>> @@ -20,7 +20,9 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
>>>>               file://0001-criu-Skip-documentation-install.patch \
>>>>               file://0002-criu-Change-libraries-install-directory.patch \
>>>>               file://0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
>>>> -          "
>>>> +           file://0004-criu-fix-conflicting-headers.patch \
>>>> +           file://0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch \
>>>> +           "
>>>>
>>>>    COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
>>>>
>>>> diff --git a/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>>>> new file mode 100644
>>>> index 0000000..fa4cecd
>>>> --- /dev/null
>>>> +++ b/recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>>>> @@ -0,0 +1,288 @@
>>>> +Backport patch to fix criu compile error with glibc 2.36. Update context
>>>> +for Makefile.config.
>>>> +
>>>> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/4c86d6a7]
>>>> +
>>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> +
>>>> +From 4c86d6a7d54abb64fc5a15131f3351224e8c071b Mon Sep 17 00:00:00 2001
>>>> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>>>> +Date: Sun, 31 Jul 2022 16:07:30 +0000
>>>> +Subject: [PATCH] criu: fix conflicting headers
>>>> +
>>>> +There are several changes in glibc 2.36 that make sys/mount.h header
>>>> +incompatible with kernel headers:
>>>> +
>>>> +https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
>>>> +
>>>> +This patch removes conflicting includes for `<linux/mount.h>` and
>>>> +updates the content of `criu/include/linux/mount.h` to match
>>>> +`/usr/include/sys/mount.h`. In addition, inline definitions sys_*()
>>>> +functions have been moved from "linux/mount.h" to "syscall.h" to
>>>> +avoid conflicts with `uapi/compel/plugins/std/syscall.h` and
>>>> +`<unistd.h>`. The include for `<linux/aio_abi.h>` has been replaced
>>>> +with local include to avoid conflicts with `<sys/mount.h>`.
>>>> +
>>>> +Fixes: #1949
>>>> +
>>>> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>>>> +---
>>>> + Makefile.config              |  2 +-
>>>> + criu/cgroup.c                |  1 +
>>>> + criu/cr-check.c              |  2 +-
>>>> + criu/cr-restore.c            |  3 ++-
>>>> + criu/include/aio.h           |  2 +-
>>>> + criu/include/linux/aio_abi.h | 14 +++++++++++
>>>> + criu/include/linux/mount.h   | 48 +++++++++++++++++++-----------------
>>>> + criu/include/syscall.h       | 17 +++++++++++++
>>>> + criu/pie/parasite.c          |  2 +-
>>>> + criu/util.c                  |  1 +
>>>> + scripts/feature-tests.mak    | 13 ----------
>>>> + 11 files changed, 64 insertions(+), 41 deletions(-)
>>>> + create mode 100644 criu/include/linux/aio_abi.h
>>>> + create mode 100644 criu/include/syscall.h
>>>> +
>>>> +diff --git a/Makefile.config b/Makefile.config
>>>> +index d113e2246..270ec61c0 100644
>>>> +--- a/Makefile.config
>>>> ++++ b/Makefile.config
>>>> +@@ -78,7 +78,7 @@ export DEFINES += $(FEATURE_DEFINES)
>>>> + export CFLAGS += $(FEATURE_DEFINES)
>>>> +
>>>> + FEATURES_LIST := TCP_REPAIR STRLCPY STRLCAT PTRACE_PEEKSIGINFO \
>>>> +-      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW FSCONFIG MEMFD_CREATE OPENAT2
>>>> ++      SETPROCTITLE_INIT MEMFD TCP_REPAIR_WINDOW MEMFD_CREATE OPENAT2
>>>> +
>>>> + # $1 - config name
>>>> + define gen-feature-test
>>>> +diff --git a/criu/cgroup.c b/criu/cgroup.c
>>>> +index e05b0832e..325df6a1d 100644
>>>> +--- a/criu/cgroup.c
>>>> ++++ b/criu/cgroup.c
>>>> +@@ -27,6 +27,7 @@
>>>> + #include "images/cgroup.pb-c.h"
>>>> + #include "kerndat.h"
>>>> + #include "linux/mount.h"
>>>> ++#include "syscall.h"
>>>> +
>>>> + /*
>>>> +  * This structure describes set of controller groups
>>>> +diff --git a/criu/cr-check.c b/criu/cr-check.c
>>>> +index f589a91da..0ca80192c 100644
>>>> +--- a/criu/cr-check.c
>>>> ++++ b/criu/cr-check.c
>>>> +@@ -21,7 +21,6 @@
>>>> + #include <sys/prctl.h>
>>>> + #include <sched.h>
>>>> + #include <sys/mount.h>
>>>> +-#include <linux/aio_abi.h>
>>>> +
>>>> + #include "../soccr/soccr.h"
>>>> +
>>>> +@@ -52,6 +51,7 @@
>>>> + #include "net.h"
>>>> + #include "restorer.h"
>>>> + #include "uffd.h"
>>>> ++#include "linux/aio_abi.h"
>>>> +
>>>> + #include "images/inventory.pb-c.h"
>>>> +
>>>> +diff --git a/criu/cr-restore.c b/criu/cr-restore.c
>>>> +index 279246c19..d11d28173 100644
>>>> +--- a/criu/cr-restore.c
>>>> ++++ b/criu/cr-restore.c
>>>> +@@ -22,7 +22,6 @@
>>>> + #include <compel/ptrace.h>
>>>> + #include "common/compiler.h"
>>>> +
>>>> +-#include "linux/mount.h"
>>>> + #include "linux/rseq.h"
>>>> +
>>>> + #include "clone-noasan.h"
>>>> +@@ -86,6 +85,8 @@
>>>> + #include <compel/plugins/std/syscall-codes.h>
>>>> + #include "compel/include/asm/syscall.h"
>>>> +
>>>> ++#include "linux/mount.h"
>>>> ++
>>>> + #include "protobuf.h"
>>>> + #include "images/sa.pb-c.h"
>>>> + #include "images/timer.pb-c.h"
>>>> +diff --git a/criu/include/aio.h b/criu/include/aio.h
>>>> +index d1655739d..38e704020 100644
>>>> +--- a/criu/include/aio.h
>>>> ++++ b/criu/include/aio.h
>>>> +@@ -1,7 +1,7 @@
>>>> + #ifndef __CR_AIO_H__
>>>> + #define __CR_AIO_H__
>>>> +
>>>> +-#include <linux/aio_abi.h>
>>>> ++#include "linux/aio_abi.h"
>>>> + #include "images/mm.pb-c.h"
>>>> + unsigned int aio_estimate_nr_reqs(unsigned int size);
>>>> + int dump_aio_ring(MmEntry *mme, struct vma_area *vma);
>>>> +diff --git a/criu/include/linux/aio_abi.h b/criu/include/linux/aio_abi.h
>>>> +new file mode 100644
>>>> +index 000000000..d9ce78720
>>>> +--- /dev/null
>>>> ++++ b/criu/include/linux/aio_abi.h
>>>> +@@ -0,0 +1,14 @@
>>>> ++#ifndef __LINUX__AIO_ABI_H
>>>> ++#define __LINUX__AIO_ABI_H
>>>> ++
>>>> ++typedef __kernel_ulong_t aio_context_t;
>>>> ++
>>>> ++/* read() from /dev/aio returns these structures. */
>>>> ++struct io_event {
>>>> ++      __u64 data; /* the data field from the iocb */
>>>> ++      __u64 obj;  /* what iocb this event came from */
>>>> ++      __s64 res;  /* result code for this event */
>>>> ++      __s64 res2; /* secondary result */
>>>> ++};
>>>> ++
>>>> ++#endif /* __LINUX__AIO_ABI_H */
>>>> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
>>>> +index 9a3a28b10..0d55a588c 100644
>>>> +--- a/criu/include/linux/mount.h
>>>> ++++ b/criu/include/linux/mount.h
>>>> +@@ -4,32 +4,34 @@
>>>> + #include "common/config.h"
>>>> + #include "compel/plugins/std/syscall-codes.h"
>>>> +
>>>> +-#ifdef CONFIG_HAS_FSCONFIG
>>>> +-#include <linux/mount.h>
>>>> +-#else
>>>> ++/* Copied from /usr/include/sys/mount.h */
>>>> ++
>>>> ++#ifndef FSCONFIG_CMD_CREATE
>>>> ++/* The type of fsconfig call made.   */
>>>> + enum fsconfig_command {
>>>> +-      FSCONFIG_SET_FLAG = 0,        /* Set parameter, supplying no value */
>>>> +-      FSCONFIG_SET_STRING = 1,      /* Set parameter, supplying a string value */
>>>> +-      FSCONFIG_SET_BINARY = 2,      /* Set parameter, supplying a binary blob value */
>>>> +-      FSCONFIG_SET_PATH = 3,        /* Set parameter, supplying an object by path */
>>>> +-      FSCONFIG_SET_PATH_EMPTY = 4,  /* Set parameter, supplying an object by (empty) path */
>>>> +-      FSCONFIG_SET_FD = 5,          /* Set parameter, supplying an object by fd */
>>>> +-      FSCONFIG_CMD_CREATE = 6,      /* Invoke superblock creation */
>>>> ++      FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>>>> ++#define FSCONFIG_SET_FLAG FSCONFIG_SET_FLAG
>>>> ++      FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
>>>> ++#define FSCONFIG_SET_STRING FSCONFIG_SET_STRING
>>>> ++      FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
>>>> ++#define FSCONFIG_SET_BINARY FSCONFIG_SET_BINARY
>>>> ++      FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
>>>> ++#define FSCONFIG_SET_PATH FSCONFIG_SET_PATH
>>>> ++      FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
>>>> ++#define FSCONFIG_SET_PATH_EMPTY FSCONFIG_SET_PATH_EMPTY
>>>> ++      FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
>>>> ++#define FSCONFIG_SET_FD FSCONFIG_SET_FD
>>>> ++      FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
>>>> ++#define FSCONFIG_CMD_CREATE FSCONFIG_CMD_CREATE
>>>> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>>>> ++#define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
>>>> + };
>>>> +-#endif
>>>> ++#endif // FSCONFIG_CMD_CREATE
>>>> +
>>>> +-static inline int sys_fsopen(const char *fsname, unsigned int flags)
>>>> +-{
>>>> +-      return syscall(__NR_fsopen, fsname, flags);
>>>> +-}
>>>> +-static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
>>>> +-{
>>>> +-      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
>>>> +-}
>>>> +-static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
>>>> +-{
>>>> +-      return syscall(__NR_fsmount, fd, flags, attr_flags);
>>>> +-}
>>>> ++#ifndef MS_MGC_VAL
>>>> ++/* Magic mount flag number. Has to be or-ed to the flag values.  */
>>>> ++#define MS_MGC_VAL 0xc0ed0000 /* Magic flag number to indicate "new" flags */
>>>> ++#define MS_MGC_MSK 0xffff0000 /* Magic flag number mask */
>>>> ++#endif
>>>> +
>>>> + #endif
>>>> +diff --git a/criu/include/syscall.h b/criu/include/syscall.h
>>>> +new file mode 100644
>>>> +index 000000000..c38d6d971
>>>> +--- /dev/null
>>>> ++++ b/criu/include/syscall.h
>>>> +@@ -0,0 +1,17 @@
>>>> ++#ifndef __CR_SYSCALL_H__
>>>> ++#define __CR_SYSCALL_H__
>>>> ++
>>>> ++static inline int sys_fsopen(const char *fsname, unsigned int flags)
>>>> ++{
>>>> ++      return syscall(__NR_fsopen, fsname, flags);
>>>> ++}
>>>> ++static inline int sys_fsconfig(int fd, unsigned int cmd, const char *key, const char *value, int aux)
>>>> ++{
>>>> ++      return syscall(__NR_fsconfig, fd, cmd, key, value, aux);
>>>> ++}
>>>> ++static inline int sys_fsmount(int fd, unsigned int flags, unsigned int attr_flags)
>>>> ++{
>>>> ++      return syscall(__NR_fsmount, fd, flags, attr_flags);
>>>> ++}
>>>> ++
>>>> ++#endif /* __CR_SYSCALL_H__ */
>>>> +\ No newline at end of file
>>>> +diff --git a/criu/pie/parasite.c b/criu/pie/parasite.c
>>>> +index e7eb1fcb6..f75fe13bb 100644
>>>> +--- a/criu/pie/parasite.c
>>>> ++++ b/criu/pie/parasite.c
>>>> +@@ -3,7 +3,6 @@
>>>> + #include <signal.h>
>>>> + #include <linux/limits.h>
>>>> + #include <linux/capability.h>
>>>> +-#include <sys/mount.h>
>>>> + #include <stdarg.h>
>>>> + #include <sys/ioctl.h>
>>>> + #include <sys/uio.h>
>>>> +@@ -14,6 +13,7 @@
>>>> + #include "int.h"
>>>> + #include "types.h"
>>>> + #include <compel/plugins/std/syscall.h>
>>>> ++#include "linux/mount.h"
>>>> + #include "parasite.h"
>>>> + #include "fcntl.h"
>>>> + #include "prctl.h"
>>>> +diff --git a/criu/util.c b/criu/util.c
>>>> +index 5f69465b4..060ca3bd4 100644
>>>> +--- a/criu/util.c
>>>> ++++ b/criu/util.c
>>>> +@@ -40,6 +40,7 @@
>>>> + #include "mem.h"
>>>> + #include "namespaces.h"
>>>> + #include "criu-log.h"
>>>> ++#include "syscall.h"
>>>> +
>>>> + #include "clone-noasan.h"
>>>> + #include "cr_options.h"
>>>> +diff --git a/scripts/feature-tests.mak b/scripts/feature-tests.mak
>>>> +index 014e893a8..fb5d2ef7a 100644
>>>> +--- a/scripts/feature-tests.mak
>>>> ++++ b/scripts/feature-tests.mak
>>>> +@@ -137,19 +137,6 @@ ENTRY(main)
>>>> + END(main)
>>>> + endef
>>>> +
>>>> +-define FEATURE_TEST_FSCONFIG
>>>> +-
>>>> +-#include <linux/mount.h>
>>>> +-
>>>> +-int main(void)
>>>> +-{
>>>> +-      if (FSCONFIG_CMD_CREATE > 0)
>>>> +-              return 0;
>>>> +-      return 0;
>>>> +-}
>>>> +-
>>>> +-endef
>>>> +-
>>>> + define FEATURE_TEST_NFTABLES_LIB_API_0
>>>> +
>>>> + #include <string.h>
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>>>> new file mode 100644
>>>> index 0000000..dc41d36
>>>> --- /dev/null
>>>> +++ b/recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>>>> @@ -0,0 +1,110 @@
>>>> +Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/517c0947]
>>>> +
>>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> +
>>>> +From 517c0947050e63aac72f63a3bf373d76264723b9 Mon Sep 17 00:00:00 2001
>>>> +From: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>>>> +Date: Wed, 24 Aug 2022 21:20:30 +0200
>>>> +Subject: [PATCH 2/2] mount: add definition for FSOPEN_CLOEXEC
>>>> +
>>>> +A recent change in glibc introduced `enum fsconfig_command` [1] and as a
>>>> +result the compilation of criu fails with the following errors
>>>> +
>>>> +In file included from criu/pie/util.c:3:
>>>> +/usr/include/sys/mount.h:240:6: error: redeclaration of 'enum fsconfig_command'
>>>> +  240 | enum fsconfig_command
>>>> +      |      ^~~~~~~~~~~~~~~~
>>>> +In file included from /usr/include/sys/mount.h:32:
>>>> +criu/include/linux/mount.h:11:6: note: originally defined here
>>>> +   11 | enum fsconfig_command {
>>>> +      |      ^~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:242:3: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
>>>> +  242 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
>>>> +      |   ^~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:12:9: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
>>>> +   12 |         FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>>>> +      |         ^~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:244:3: error: redeclaration of enumerator 'FSCONFIG_SET_STRING'
>>>> +  244 |   FSCONFIG_SET_STRING     = 1,    /* Set parameter, supplying a string value */
>>>> +      |   ^~~~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:14:9: note: previous definition of 'FSCONFIG_SET_STRING' with type 'enum fsconfig_command'
>>>> +   14 |         FSCONFIG_SET_STRING = 1, /* Set parameter, supplying a string value */
>>>> +      |         ^~~~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:246:3: error: redeclaration of enumerator 'FSCONFIG_SET_BINARY'
>>>> +  246 |   FSCONFIG_SET_BINARY     = 2,    /* Set parameter, supplying a binary blob value */
>>>> +      |   ^~~~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:16:9: note: previous definition of 'FSCONFIG_SET_BINARY' with type 'enum fsconfig_command'
>>>> +   16 |         FSCONFIG_SET_BINARY = 2, /* Set parameter, supplying a binary blob value */
>>>> +      |         ^~~~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:248:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH'
>>>> +  248 |   FSCONFIG_SET_PATH       = 3,    /* Set parameter, supplying an object by path */
>>>> +      |   ^~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:18:9: note: previous definition of 'FSCONFIG_SET_PATH' with type 'enum fsconfig_command'
>>>> +   18 |         FSCONFIG_SET_PATH = 3, /* Set parameter, supplying an object by path */
>>>> +      |         ^~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:250:3: error: redeclaration of enumerator 'FSCONFIG_SET_PATH_EMPTY'
>>>> +  250 |   FSCONFIG_SET_PATH_EMPTY = 4,    /* Set parameter, supplying an object by (empty) path */
>>>> +      |   ^~~~~~~~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:20:9: note: previous definition of 'FSCONFIG_SET_PATH_EMPTY' with type 'enum fsconfig_command'
>>>> +   20 |         FSCONFIG_SET_PATH_EMPTY = 4, /* Set parameter, supplying an object by (empty) path */
>>>> +      |         ^~~~~~~~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:252:3: error: redeclaration of enumerator 'FSCONFIG_SET_FD'
>>>> +  252 |   FSCONFIG_SET_FD         = 5,    /* Set parameter, supplying an object by fd */
>>>> +      |   ^~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:22:9: note: previous definition of 'FSCONFIG_SET_FD' with type 'enum fsconfig_command'
>>>> +   22 |         FSCONFIG_SET_FD = 5, /* Set parameter, supplying an object by fd */
>>>> +      |         ^~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:254:3: error: redeclaration of enumerator 'FSCONFIG_CMD_CREATE'
>>>> +  254 |   FSCONFIG_CMD_CREATE     = 6,    /* Invoke superblock creation */
>>>> +      |   ^~~~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:24:9: note: previous definition of 'FSCONFIG_CMD_CREATE' with type 'enum fsconfig_command'
>>>> +   24 |         FSCONFIG_CMD_CREATE = 6, /* Invoke superblock creation */
>>>> +      |         ^~~~~~~~~~~~~~~~~~~
>>>> +/usr/include/sys/mount.h:256:3: error: redeclaration of enumerator 'FSCONFIG_CMD_RECONFIGURE'
>>>> +  256 |   FSCONFIG_CMD_RECONFIGURE = 7,   /* Invoke superblock reconfiguration */
>>>> +      |   ^~~~~~~~~~~~~~~~~~~~~~~~
>>>> +criu/include/linux/mount.h:26:9: note: previous definition of 'FSCONFIG_CMD_RECONFIGURE' with type 'enum fsconfig_command'
>>>> +   26 |         FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>>>> +
>>>> +This patch adds definition for FSOPEN_CLOEXEC to solve this problem. In particular,
>>>> +sys/mount.h includes ifndef check for FSOPEN_CLOEXEC surrounding `enum fsconfig_command`.
>>>> +
>>>> +[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=7eae6a91e9b1670330c9f15730082c91c0b1d570
>>>> +
>>>> +Reported-by: Younes Manton (@ymanton)
>>>> +Signed-off-by: Radostin Stoyanov <rstoyanov@fedoraproject.org>
>>>> +---
>>>> + criu/include/linux/mount.h | 10 ++++++++--
>>>> + 1 file changed, 8 insertions(+), 2 deletions(-)
>>>> +
>>>> +diff --git a/criu/include/linux/mount.h b/criu/include/linux/mount.h
>>>> +index 0d55a588c..fefafa89e 100644
>>>> +--- a/criu/include/linux/mount.h
>>>> ++++ b/criu/include/linux/mount.h
>>>> +@@ -6,7 +6,7 @@
>>>> +
>>>> + /* Copied from /usr/include/sys/mount.h */
>>>> +
>>>> +-#ifndef FSCONFIG_CMD_CREATE
>>>> ++#ifndef FSOPEN_CLOEXEC
>>>> + /* The type of fsconfig call made.   */
>>>> + enum fsconfig_command {
>>>> +       FSCONFIG_SET_FLAG = 0, /* Set parameter, supplying no value */
>>>> +@@ -26,7 +26,13 @@ enum fsconfig_command {
>>>> +       FSCONFIG_CMD_RECONFIGURE = 7, /* Invoke superblock reconfiguration */
>>>> + #define FSCONFIG_CMD_RECONFIGURE FSCONFIG_CMD_RECONFIGURE
>>>> + };
>>>> +-#endif // FSCONFIG_CMD_CREATE
>>>> ++
>>>> ++#endif // FSOPEN_CLOEXEC
>>>> ++
>>>> ++/* fsopen flags. With the redundant definition, we check if the kernel,
>>>> ++ * glibc value and our value still match.
>>>> ++ */
>>>> ++#define FSOPEN_CLOEXEC 0x00000001
>>>> +
>>>> + #ifndef MS_MGC_VAL
>>>> + /* Magic mount flag number. Has to be or-ed to the flag values.  */
>>>> +--
>>>> +2.34.1
>>>> +
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#7593): https://lists.yoctoproject.org/g/meta-virtualization/message/7593
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/93412155/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>
>

-- 
Kai Kang
Wind River Linux


