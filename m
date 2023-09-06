Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B60EB8FAE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:41:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.297.1693968070118973592
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 19:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HWap6D7e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761359f4ae=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3862e02F029853;
	Tue, 5 Sep 2023 19:41:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ErG7NQwSNNVFDbaiuG+Xd/R2pQCqHGverYWHKYlDikE=; b=
	HWap6D7e1VZYLh0l4vS013f0YX/M4HXoYANPN0pxPU8dAqAl1iEnzhx1X26KeJap
	hwKFnaE4DKBgILsDlhuf2F5s6FdSHeMXOnU3FBA2U00i63EyFtokaXe/pmXGzDCF
	Fky95AuORa9d1Abq1p3Cb3VN7nYAw6Qpo0UtYiXAsczvm2ASXVNaNTDXi0z8ylMF
	iM2rqkKLdOlN6Tez9xRSCPRKYLx9ke4t3545S62oEKJPtqkRanyUHlIUdzAomxwG
	fc8FFDoXbY+mICqR5JZXuvdgDCpPIaTRXZxWZlEswPSYsrennj02tiu1G7bw4gT1
	5Zgu7sOGdawqMkG56fqWpQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg2thf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 19:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO3J1AaxagW9gncg9rErAZCGm7lRn7WoIGG1lIffZ5G9uCB9PHsFnvg6Yaw4qSGnLYAzxIVzSTW6zZ8lgpl3dbb7JNlu5qV2CpQzmvNqhPUoHP6NeEvUAE1tFIFU/AmTaHNUl6O03uzDMYxZGFqk8tnqv3IM7ebnWCeViFhvd+7rQs622KfK0I3fTR4wzKdeYXJcHLs29cbkMnQeTe42w+m8nMUMjRZj85++3XE1A3sgF3PbPXqGYzySNq5Dgpwg8nIcjOJvB2ZOjMPdz17P3mFOsejkzKhlMIlaF1DNgwLjdSYVODoTQEmiH83U4G6vkWIZjpOQ1r9UY3j8rvQC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErG7NQwSNNVFDbaiuG+Xd/R2pQCqHGverYWHKYlDikE=;
 b=fZBIOt0vJHJaBjyZpELacbj+kOtjAjj0yRm6YLasbGmbqewZfuz3yWHAGK1Ua27eGfqZyRFervjD/FBD1fPvrui9AKLrFbqgYT4rjFAORew05GNt7IpAIf2ffLiiN6yspCjuSitwuiV1Wk/qmyrnxeEWneUE40VwL9z0I/vyOOxnTV9xRQ3mUTBuv9ed2H7QJbnY1fdoU33w8hdDk2+w/kZIZODRCbhHwOv6Y5wQgk3A9As5r8z4YCXj2sYRTioujMNd4mli8vYL6mjsustrb5b/pll+1zMpwJWWblfervQ8A8Eqcv3OZHN6wtnlZti3R7Rcbf6Ow2Z8bAt0Wu9b4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 02:40:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 02:40:59 +0000
Message-ID: <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com>
Date: Wed, 6 Sep 2023 10:40:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
 <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGBP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::13)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d10215-ad57-49d2-f09b-08dbae82b3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+IoUfb05dy/jUoWcwIIkuQFl7k0+YJoPonMwOoeuyITrRtMAu4k9B3X828lgEWg9zgETNk3vVH5WCK61Yg8+2ZXBHcYdWlmVv3fnXSkgF6lHp7fYcIlZok2qhJIwgod7kkKMBUbs4oFbaRAom1ExV7O46J04oV4rHAXPY2dCHxLOhF8CCFzp9l/QmPZ3uW5lhdGRAChxcdomoS+4+yx+xmcEoF62CbIjvOANrMnucVRvZljOPle2NDzMNU58X6ybywON/8wVXJuI++Mm8FwxVH+JqWTYnzzM684fG9OlWYJIQli6Qk+rZQWk3PAASusc9QBByMtNMjd6newGK8pNUY/IKNK0ZMUgCp34M6PIoB8Ra8MNG+SdOv+1jlsL+MMWX3jVx9pv0for1DUYrWIo5RNjLbR5jzrUtytBiGZeInmKEdGgZwNfjVYrGOMe1hmfC2dBrWrrcAUxvEPUiolNArDD+rdqTyt7gDcQ6FNRzFD7hTIl6l8OsHdFUhOX1hge1t+nmJt7IBjRwoo4Tg1enDIhF66I9/cTL4qmwC6U8Fjf9hO7Ksk1rXU/xB+kCw1p3V4ohfQBgfPzK2dd//D4F4NgDZ3TomxI7HamcTaLfePjqRqrk9HV5fKsdKCfjSVHik4KSci+KfmSWkn2YfTk9Jl7dvQlygC1K9jyMQQKhBg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(346002)(376002)(366004)(186009)(451199024)(1800799009)(8936002)(8676002)(31686004)(5660300002)(6916009)(316002)(2906002)(36756003)(30864003)(66556008)(66946007)(66476007)(4326008)(84970400001)(66899024)(6506007)(53546011)(6486002)(6512007)(26005)(38100700002)(6666004)(966005)(478600001)(83380400001)(2616005)(31696002)(41300700001)(86362001)(21314003)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1BSY1RSbUZrTmZKbjlTbkFKMHR5SEhVZjBscFE1NUNtdmxSc0hCNS9EaFlm?=
 =?utf-8?B?UzYzdy9leXBiMjB5QkdiYnNUSWpaNks3RFlXWm5WOUVkZnBPSjVHRnR4TENH?=
 =?utf-8?B?ck91Q3ZnTFlGS1J5d045dXoxcUY4N0tOakh5Z2JLMW9WaG56d2lCd2ZBNkFj?=
 =?utf-8?B?MkNxckxXd2ZKUTBMWitQa0FnWE9BelJraENyQlhTMEJTTlJnOEtqdEFVekFl?=
 =?utf-8?B?UzlzdUQySnVXMjJmMDZhcWYwTTNLVVhnTmU1Zk9BRGZIUkxvYVBrNnc5Qk15?=
 =?utf-8?B?LzRUU0ZyL1ZPTytsL25YWHFRODVhb1NKZlYySTJjUlpIZTcwdmVEcVpzcGZT?=
 =?utf-8?B?QStQTUk2KzZYc1hjZUl3SnJnSzc4azYxWkdXVnFkc09OeTlhWW44Y1RLbitD?=
 =?utf-8?B?ekgwWmhyQXkzQUl0N2dWQUJDRzdOa0thVkp4RUxaakFGaFRqeDl1bWZMeGVR?=
 =?utf-8?B?c3hXVEFieTU4WVUrT3RjTTlZUXpPM2lNcVVsYXk1d1pPeVYreXFTWFlBUDNE?=
 =?utf-8?B?RThxcXBFcXhKTUE5eEJKdGkvS2dYNmw4MmpkUzd2UHEvS0l6dGN5QmZ1ZjMv?=
 =?utf-8?B?VVBObnNNeU1QOXhNNnRsaXA0QlJuTWw0ZEZYOEFZckRWNXlRSzhlM2ZoQzRy?=
 =?utf-8?B?VW9vNGdPbVhEWE5odEJhS1dTd3dUVWJuRU5Mc3lKZURsclN4WGpXSVJBOWR6?=
 =?utf-8?B?RnFjTG50ZENqZVd0SWQwVjVHZ3VJWTVRU2NFOGF3d1BybjZVTGQ4dUxxdUtU?=
 =?utf-8?B?VVF3VlM5TmJkSTJKRFJtdlhkNlMyaGNjMEZqQ2ExaFk3c2J6aS9PbUpNaWNE?=
 =?utf-8?B?Z01lQksxT0VkRGRkRlBBZUNYU0VublUyY2lMYzE3eVJQSTZMem9McGNFemJW?=
 =?utf-8?B?NnVKZVQ5TkR6cUtuZ05NVGh0aHpiZkdEcklDQkdDaHFhSHh6WGpPdVdLaHNw?=
 =?utf-8?B?by9YMTdFOUZGZnhDbGVzWGRlMjVCOHNuOEYvY3RVU2xxaUhTVnErVVRZdFQy?=
 =?utf-8?B?MU9wc2xuVUhseTJrNk9NOVZWZGVsb2pFYXc1clFiMGtlWnhjWnh0TDNQUkxk?=
 =?utf-8?B?VFE1cUYyUWpNZzJudElLbFNzc0VBMER0bzB5Ulp0bzVOQmRnYmpYL244Mkl3?=
 =?utf-8?B?cGVabmw0MTNMU0tmZkVXdTBBTGdRc0dEL3dVUitaOXhaYWFkLys4UU5zVUpR?=
 =?utf-8?B?M1RlZW9NQ0t5Q1BKTnVEV1BVS1NzWWUxcnNMUk1hOW5IcitTZXJ5U09rMVFG?=
 =?utf-8?B?Tm40K0pEeDh6QjdXdDl1c1c4cTJEUHpMQjg0UEFJd2hTZmZncytzYWVOMmlo?=
 =?utf-8?B?cVRCOG1WcFNPNXp0SmU1c09jYWVOOUtvaXNwaHIxU1MyVno3N1kxZUs5NENZ?=
 =?utf-8?B?NGwwN1RVUVNUbG1tZWRZZHAzcmVWbEpyR3FJNkVJYVhJOWdSSVdPYjZSdHhY?=
 =?utf-8?B?MWVVa09ZUFVTWitnejBtaDBCNVJ1WnJKb3AzY0EyajJoNjBPVXlaSG5ZNnZw?=
 =?utf-8?B?Wm0wZEJrZ1ZpNFcxbUZ3MDBYQjRyaTBBeHY0UUpsbFlDVytERkIrT2dNYjJj?=
 =?utf-8?B?SHJ5UjlaVHczUytlYTFYdVF0KzJDUHA2UzltYmJtL0MzRFdvbEM3QytSSjkz?=
 =?utf-8?B?L2Z6dlk5ajhtRVl3ZjQxOE9nUXg5bWNSOWlGOFo0azBOdmFVVm1VWnJHaXgx?=
 =?utf-8?B?bGRQNTg2enhJYXFDZ0tHTVhpWXNTK1JYbVEvVzBzNVFpcGNkSWt2OUhaaVZS?=
 =?utf-8?B?Sm1rQ3V1UUdCb0hnTUxqcE9NYUZQcFhjaEdNZ1NlUDcwdlpWdmFQeTlBTThT?=
 =?utf-8?B?S3RWcitEUVlUMXJtN0ZyNVVSYXllS3d6WGRyTm4rcHpZMHZpR1BzbEJnbVVX?=
 =?utf-8?B?L0poUDhiNDc0UXhEeGs0Wk8wQ0l2bFZIendHLzZtQXZhaHNBRDFTM3ozN2Rq?=
 =?utf-8?B?K1VQQ205RE5IZEVUdThuSGwwN0xMaC85OE1Lc216M3E4ZmYrdW1YR0I2ZThh?=
 =?utf-8?B?RGpUQUlzZmVUTzZ0RE1vdzZoNUJDZ0dwRzFpbjQ3Z1BZeWt6d25wRTl0WER2?=
 =?utf-8?B?UDVZMVRMTFhTOS9hZTY4SGxoZ1d5dTZ5cWptL25nZXFpM3h1TmdEb3hWUndn?=
 =?utf-8?Q?G3/Jfn6Htj4o8452W6tdKa3BK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d10215-ad57-49d2-f09b-08dbae82b3f3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 02:40:59.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeTwyEqzdyvFrJZQlNajW3kmEqJLEqkHJilLamT4oFlzQ6sDYy6x+eU8s4wsun5tN8xys7GfBljrzeGfxziCFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
X-Proofpoint-ORIG-GUID: 23QhVCB129q3Y3N0s3HU35BEIfWqYfPG
X-Proofpoint-GUID: 23QhVCB129q3Y3N0s3HU35BEIfWqYfPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3862e02F029853
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Sep 2023 02:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8278

On 9/5/23 20:26, Bruce Ashfield wrote:
> On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via lists.yoctoproject.=
org
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> oe-go-mod-autogen.py is a helper script for go mod recipes. It follows
>> Bruce's initiative about how to deal with go mod recipes in OE.
>>
> I thought the techniques looked familiar!

Yes, indeed!

With golang's current scheme, your approach is the only way to 1) make=20
these non-vendored go recipes build without network connection at=20
do_compile and 2) conform to OE's download mirroring mechanism. This=20
really helps a lot!

>
> I was just working on my script before my holidays as my uprev cycle ha=
d
> taken me to the non-vendored go recipes and I was running into a few
> corner cases.
>
> I've got a K3S upgrade already done locally with my tweaked script, but
> I'll take this for a test run and see if I get the same results with th=
is.

I did use this script to upgrade k3s to 'v1.27.4+k3s1', only for the=20
purpose of verifying this script. Those three files were correctly=20
generated and the build succeeded. Hope you'll get the same result.

Regards,

Qi

> I just didn't have the time to clean mine up to make it presentable, so
> I'm hopeful that this will work and I can take that off my TODO list!
>
> Bruce
>
>> Example:
>> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
>>       --repo https://github.com/docker/compose --rev v2.20.3
>> output: src_uri.inc, relocation.inc, modules.txt
>>
>> Copy these three generated files to replace the original ones,
>> then we only need update PV and SRCREV, and docker-compose is upgraded.
>>
>> Below are some technical details.
>>
>> * get module's repo from module name
>>
>>    This script checks the following two URLs to determine the module's=
 repo.
>>    1. https://<module_name_tweaked>?=3Dgo-get=3D1
>>    2. https://pkg.go.dev/<module_name_tweaked>
>>
>>    The module_name_tweaked is derived from module_name, with the last =
components
>>    removed one by one. Let me use two examples to explain this.
>>
>>    For module_name sigs.k8s.io/json, the sigs.k8s.io/json is first use=
d as
>>    module_name_tweaked for searching. And we can correctly get the rep=
o URL, so
>>    the search stops.
>>
>>    For module_name github.com/k3s-io/etcd/api/v3, the following ones a=
re used
>>    as module_name_tweaked:
>>    github.com/k3s-io/etcd/api/v3
>>    github.com/k3s-io/etcd/api
>>    github.com/k3s-io/etcd
>>    And when searching 'github.com/k3s-io/etcd', we get the repo URL, s=
o the search
>>    stops.
>>
>> * determine the srcdir:destdir mapping in 'vendor' creation
>>
>>    To correctly form the 'vendor' directory, the mapping is critical.
>>    This script makes use of tag matching and path matching to determin=
e
>>    the subpath in the repo for the module.
>>
>> * avoid subpath being overriden by parent path
>>
>>    We need to avoid subpath being overriden by parent path. This is ne=
eded
>>    for both SRC_URI ordering in src_uri.inc and the sites mapping orde=
ring
>>    in relocation.inc. This script simply uses the length as the orderi=
ng key,
>>    simply for the reason that if a path is a subpath of another path, =
it must
>>    be longer.
>>
>> * the .git suffix is removed to sync with each other
>>
>>    Unlike normal recipes, go mod recipe usually have many SRC_URIs. Th=
is script
>>    remove the '.git' suffix from repo URL so that the repo URLs are in=
 sync
>>    with each.
>>
>> * basic directory hierarchy and caching mechanism
>>
>>    <cwd>/repos: hold the repos downloaded and checked
>>    <cwd>/wget-contents: hold the contents to determine the module's re=
po
>>    <cwd>/wget-contents/<module_name>.repo_url.cache: the repo value ca=
che
>>    This is to avoid unnecessary URL fetching and repo cloning.
>>
>> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
>>
>>    The script must get the correct repo_url, fullsrc_rev and subpath f=
or
>>    each required module in go.mod to correctly generate the src_uri.in=
c and
>>    relocation.inc files. If this process fails for any required module=
, this
>>    script stop immediately, as I deliberately set ERROR_OUT_ON_FETCH_A=
ND_CHECKOUT_FAILURE
>>    to True in this script. The purpose is to encourage people to repor=
t
>>    problems to meta-virt so that we can improve this script according =
to
>>    these feedbacks. But this variable can set to False, then the scrip=
t
>>    only records the failed modules in self.modules_unhandled with reas=
ons
>>    added, people can modify the generated src_uri.inc and relocation.i=
nc
>>    to manually handle these unhandled modules if they are urgent to
>>    add/upgrade some go mod recipes.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/oe-go-mod-autogen.py | 663 +++++++++++++++++++++++++++++++++=
++
>>   1 file changed, 663 insertions(+)
>>   create mode 100755 scripts/oe-go-mod-autogen.py
>>
>> diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autogen.=
py
>> new file mode 100755
>> index 00000000..09d6133b
>> --- /dev/null
>> +++ b/scripts/oe-go-mod-autogen.py
>> @@ -0,0 +1,663 @@
>> +#!/usr/bin/env python3
>> +
>> +import os
>> +import sys
>> +import logging
>> +import argparse
>> +from collections import OrderedDict
>> +import subprocess
>> +
>> +# This switch is used to make this script error out ASAP, mainly for =
debugging purpose
>> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
>> +
>> +logger =3D logging.getLogger('oe-go-mod-autogen')
>> +loggerhandler =3D logging.StreamHandler()
>> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(messag=
e)s"))
>> +logger.addHandler(loggerhandler)
>> +logger.setLevel(logging.INFO)
>> +
>> +class GoModTool(object):
>> +    def __init__(self, repo, rev, workdir):
>> +        self.repo =3D repo
>> +        self.rev =3D rev
>> +        self.workdir =3D workdir
>> +
>> +        # Stores the actual module name and its related information
>> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
>> +        self.modules_repoinfo =3D {}
>> +
>> +        # {module_name: (url, version, destdir, fullsrcrev)}
>> +        #
>> +        # url: place to get the source codes, we only support git rep=
o
>> +        # version: module version, git tag or git rev
>> +        # destdir: place to put the fetched source codes
>> +        # fullsrcrev: full src rev which is the value of SRC_REV
>> +        #
>> +        # e.g.
>> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in go.mod:
>> +        # module_name =3D github.com/Masterminds/semver/v3
>> +        # url =3D https://github.com/Masterminds/semver
>> +        # version =3D v3.1.1
>> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/github=
.com/Masterminds/semver/v3
>> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b0
>> +        self.modules_require =3D OrderedDict()
>> +
>> +        # {orig_module: (actual_module, actual_version)}
>> +        self.modules_replace =3D OrderedDict()
>> +
>> +        # Unhandled modules
>> +        self.modules_unhandled =3D OrderedDict()
>> +
>> +        # store subpaths used to form srcpath
>> +        # {actual_module_name: subpath}
>> +        self.modules_subpaths =3D OrderedDict()
>> +
>> +        # modules's actual source paths, record those that are not th=
e same with the module itself
>> +        self.modules_srcpaths =3D OrderedDict()
>> +
>> +        # store lines, comment removed
>> +        self.require_lines =3D []
>> +        self.replace_lines =3D []
>> +
>> +        # fetch repo
>> +        self.fetch_and_checkout_repo(self.repo.split('://')[1], self.=
repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
>> +
>> +    def show_go_mod_info(self):
>> +        # Print modules_require, modules_replace and modules_unhandle=
d
>> +        print("modules required:")
>> +        for m in self.modules_require:
>> +            url, version, destdir, fullrev =3D self.modules_require[m=
]
>> +            print("%s %s %s %s" % (m, version, url, fullrev))
>> +
>> +        print("modules replace:")
>> +        for m in self.modules_replace:
>> +            actual_module, actual_version =3D self.modules_replace[m]
>> +            print("%s =3D> %s %s" % (m, actual_module, actual_version=
))
>> +
>> +        print("modules unhandled:")
>> +        for m in self.modules_unhandled:
>> +            reason =3D self.modules_unhandled[m]
>> +            print("%s unhandled: %s" % (m, reason))
>> +
>> +    def parse(self):
>> +        # check if this repo needs autogen
>> +        repo_url, repo_dest_dir, repo_fullrev =3D self.modules_repoin=
fo[self.repo.split('://')[1]]
>> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
>> +            logger.info("vendor direcotry has already existed for %s,=
 no need to add other repos" % self.repo)
>> +            return
>> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
>> +        if not os.path.exists(go_mod_file):
>> +            logger.info("go.mod file does not exist for %s, no need t=
o add otehr repos" % self.repo)
>> +            return
>> +        self.parse_go_mod(go_mod_file)
>> +        self.show_go_mod_info()
>> +
>> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev, def=
ault_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
>> +        """
>> +        Fetch repo_url to <workdir>/repos/repo_base_name
>> +        """
>> +        protocol =3D default_protocol
>> +        if '://' in repo_url:
>> +            repo_url_final =3D repo_url
>> +        else:
>> +            repo_url_final =3D default_protocol + repo_url
>> +        logger.debug("fetch and checkout %s %s" % (repo_url_final, re=
v))
>> +        repos_dir =3D os.path.join(self.workdir, 'repos')
>> +        if not os.path.exists(repos_dir):
>> +            os.makedirs(repos_dir)
>> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[0]
>> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
>> +        module_last_name =3D module_name.split('/')[-1]
>> +        git_action =3D "fetch"
>> +        if os.path.exists(repo_dest_dir):
>> +            if checkout:
>> +                # check if current HEAD is rev
>> +                try:
>> +                    headrev =3D subprocess.check_output('git rev-list=
 -1 HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
>> +                    requiredrev =3D subprocess.check_output('git rev-=
list -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev, module_last_name=
, rev), shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
>> +                    if headrev =3D=3D requiredrev:
>> +                        logger.info("%s has already been fetched and =
checked out as required, skipping" % repo_url)
>> +                        self.modules_repoinfo[module_name] =3D (repo_=
url, repo_dest_dir, requiredrev)
>> +                        return
>> +                    else:
>> +                        logger.info("HEAD of %s is not %s, will do a =
clean clone" % (repo_dest_dir, requiredrev))
>> +                        git_action =3D "clone"
>> +                except:
>> +                    logger.info("'git rev-list' in %s failed, will do=
 a clean clone" % repo_dest_dir)
>> +                    git_action =3D "clone"
>> +            else:
>> +                # determine if the current repo points to the desired=
 remote repo
>> +                try:
>> +                    remote_origin_url =3D subprocess.check_output('gi=
t config --get remote.origin.url', shell=3DTrue, cwd=3Drepo_dest_dir).dec=
ode('utf-8').strip()
>> +                    if remote_origin_url.endswith('.git'):
>> +                        if not repo_url_final.endswith('.git'):
>> +                            remote_origin_url =3D remote_origin_url[:=
-4]
>> +                    else:
>> +                        if repo_url_final.endswith('.git'):
>> +                            remote_origin_url =3D remote_origin_url +=
 '.git'
>> +                    if remote_origin_url !=3D repo_url_final:
>> +                        logger.info("remote.origin.url for %s is not =
%s, will do a clean clone" % (repo_dest_dir, repo_url_final))
>> +                        git_action =3D "clone"
>> +                except:
>> +                    logger.info("'git config --get remote.origin.url'=
 in %s failed, will do a clean clone" % repo_dest_dir)
>> +                    git_action =3D "clone"
>> +        else:
>> +            # No local repo, clone it.
>> +            git_action =3D "clone"
>> +
>> +        if git_action =3D=3D "clone":
>> +            logger.info("Removing %s" % repo_dest_dir)
>> +            subprocess.check_call('rm -rf %s' % repo_dest_dir, shell=3D=
True)
>> +
>> +        # clone/fetch repo
>> +        try:
>> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" else r=
epo_dest_dir
>> +            logger.info("git %s %s in %s" % (git_action, repo_url_fin=
al, git_cwd))
>> +            subprocess.check_call('git %s %s >/dev/null 2>&1' % (git_=
action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
>> +        except:
>> +            logger.warning("Failed to %s %s in %s" % (git_action, rep=
o_url_final, git_cwd))
>> +            return
>> +
>> +        def get_requiredrev(get_subpath):
>> +            import re
>> +            # check if rev is a revision or a version
>> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev):
>> +                rev_is_version =3D False
>> +            else:
>> +                rev_is_version =3D True
>> +
>> +            # if rev is not a version, 'git rev-list -1 <rev>' should=
 just succeed!
>> +            if not rev_is_version:
>> +                try:
>> +                    rev_return =3D subprocess.check_output('git rev-l=
ist -1 %s 2>/dev/null' % rev, shell=3DTrue, cwd=3Drepo_dest_dir).decode('=
utf-8').strip()
>> +                    if get_subpath:
>> +                        cmd =3D 'git branch -M toremove && git checko=
ut -b check_subpath %s && git branch -D toremove' % rev_return
>> +                        subprocess.check_call(cmd, shell=3DTrue, cwd=3D=
repo_dest_dir)
>> +                        # try to get the subpath for this module
>> +                        module_name_parts =3D module_name.split('/')
>> +                        while (len(module_name_parts) > 0):
>> +                            subpath =3D '/'.join(module_name_parts)
>> +                            dir_to_check =3D repo_dest_dir + '/' + '/=
'.join(module_name_parts)
>> +                            if os.path.isdir(dir_to_check):
>> +                                self.modules_subpaths[module_name] =3D=
 subpath
>> +                                break
>> +                            else:
>> +                                module_name_parts.pop(0)
>> +                    return rev_return
>> +                except:
>> +                    logger.warning("Revision (%s) not in repo(%s)" % =
(rev, repo_dest_dir))
>> +                    return None
>> +
>> +            # the following codes deals with case where rev is a vers=
ion
>> +            # determine the longest match tag, in this way, we can ge=
t the current srcpath to be used in relocation.inc
>> +            # we first get the initial tag, which is formed from modu=
le_name and rev
>> +            module_parts =3D module_name.split('/')
>> +            if rev.startswith(module_parts[-1] + '.'):
>> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
>> +                last_module_part_replaced =3D True
>> +            else:
>> +                tag =3D '/'.join(module_parts) + '/' + rev
>> +                last_module_part_replaced =3D False
>> +            logger.debug("use %s as the initial tag for %s" % (tag, m=
odule_name))
>> +            tag_parts =3D tag.split('/')
>> +            while(len(tag_parts) > 0):
>> +                try:
>> +                    rev_return =3D subprocess.check_output('git rev-l=
ist -1 %s 2>/dev/null' % tag, shell=3DTrue, cwd=3Drepo_dest_dir).decode('=
utf-8').strip()
>> +                    if len(tag_parts) > 1:
>> +                        # ensure that the subpath exists
>> +                        if get_subpath:
>> +                            cmd =3D 'git branch -M toremove && git ch=
eckout -b check_subpath %s && git branch -D toremove' % rev_return
>> +                            subprocess.check_call(cmd, shell=3DTrue, =
cwd=3Drepo_dest_dir)
>> +                            # get subpath for the actual_module_name
>> +                            if last_module_part_replaced:
>> +                                subpath =3D '/'.join(tag_parts[:-1]) =
+ '/' + module_parts[-1]
>> +                                if not os.path.isdir(repo_dest_dir + =
'/' + subpath):
>> +                                    subpath =3D '/'.join(tag_parts[:-=
1])
>> +                            else:
>> +                                subpath =3D '/'.join(tag_parts[:-1])
>> +                            if not os.path.isdir(repo_dest_dir + '/' =
+ subpath):
>> +                                logger.warning("subpath (%s) derived =
from tag matching does not exist in %s" % (subpath, repo_dest_dir))
>> +                                return None
>> +                            self.modules_subpaths[module_name] =3D su=
bpath
>> +                            logger.info("modules_subpath[%s] =3D %s" =
% (module_name, subpath))
>> +                    return rev_return
>> +                except:
>> +                    tag_parts.pop(0)
>> +                    tag =3D '/'.join(tag_parts)
>> +            logger.warning("No tag matching %s" % rev)
>> +            return None
>> +
>> +        requiredrev =3D get_requiredrev(get_subpath)
>> +        if requiredrev:
>> +            logger.info("Got module(%s) requiredrev: %s" % (module_na=
me, requiredrev))
>> +            if checkout:
>> +                subprocess.check_call('git checkout -b gomodautogen %=
s' % requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
>> +            self.modules_repoinfo[module_name] =3D (repo_url, repo_de=
st_dir, requiredrev)
>> +        else:
>> +            logger.warning("Failed to get requiredrev, repo_url =3D %=
s, rev =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
>> +
>> +    def parse_go_mod(self, go_mod_path):
>> +        """
>> +        Parse go.mod file to get the modules info
>> +        """
>> +        # First we get the require and replace lines
>> +        # The parsing logic assumes the replace lines come *after* th=
e require lines
>> +        inrequire =3D False
>> +        inreplace =3D False
>> +        with open(go_mod_path, 'r') as f:
>> +            lines =3D f.readlines()
>> +            for line in lines:
>> +                if line.startswith('require ('):
>> +                    inrequire =3D True
>> +                    continue
>> +                if line.startswith(')'):
>> +                    inrequire =3D False
>> +                    continue
>> +                if line.startswith('require ') or inrequire:
>> +                    # we have one line require
>> +                    require_line =3D line.lstrip('require ').split('/=
/')[0].strip()
>> +                    if require_line:
>> +                        self.require_lines.append(require_line)
>> +                    continue
>> +                # we can deal with requires and replaces separately b=
ecause go.mod always writes requires before replaces
>> +                if line.startswith('replace ('):
>> +                    inreplace =3D True
>> +                    continue
>> +                if line.startswith(')'):
>> +                    inreplace =3D False
>> +                    continue
>> +                if line.startswith('replace ') or inreplace:
>> +                    replace_line =3D line.lstrip('replace ').split('/=
/')[0].strip()
>> +                    if replace_line:
>> +                        self.replace_lines.append(replace_line)
>> +                    continue
>> +        #
>> +        # parse the require_lines and replace_lines to form self.modu=
les_require and self.modules_replace
>> +        #
>> +        logger.debug("Parsing require_lines and replace_lines ...")
>> +        # A typical replace line is as below:
>> +        #   github.com/hashicorp/golang-lru =3D> github.com/ktock/gol=
ang-lru v0.5.5-0.20211029085301-ec551be6f75c
>> +        # It means that the github.com/hashicorp/golang-lru module is=
 replaced by github.com/ktock/golang-lru
>> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c'.
>> +        # So the destdir is vendor/github.com/hashicorp/golang-lru wh=
ile the contents are from github.com/ktock/golang-lru
>> +        for line in self.replace_lines:
>> +            orig_module, actual =3D line.split('=3D>')
>> +            actual_module, actual_version =3D actual.split()
>> +            orig_module =3D orig_module.strip()
>> +            actual_module =3D actual_module.strip()
>> +            actual_version =3D actual_version.strip()
>> +            self.modules_replace[orig_module] =3D (actual_module, act=
ual_version)
>> +        #
>> +        # Typical require lines are as below:
>> +        #   github.com/Masterminds/semver/v3 v3.1.1
>> +        #   golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
>> +        #
>> +        # We need to first try https://<module_name>?=3Dgo-get=3D1 to=
 see it contains
>> +        # line starting with '<meta name=3D"go-import" content=3D'.
>> +        #
>> +        # If so, get root-path vcs repo-url from content. See https:/=
/go.dev/ref/mod#vcs-find
>> +        # For example, the above 'wget https://golang.org/x/crypto?go=
-get=3D1' gives you
>> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypto git=
 https://go.googlesource.com/crypto">
>> +        # In such case, the self.modules_require has the following co=
ntents:
>> +        # module_name: golang.org/x/crypto
>> +        # url: https://go.googlesource.com/crypto
>> +        # version: v0.0.0-20220321153916-2c7772ba3064
>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/golang.or=
g/x/crypto
>> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (git r=
ev-list -1 2c7772ba3064)
>> +        #
>> +        # If not, try https://pkg.go.dev/<module_name>, and find the =
'Repository'.
>> +        # For example, 'wget https://pkg.go.dev/github.com/Mastermind=
s/semver/v3' gives:
>> +        # github.com/Masterminds/semver
>> +        # In such case, the self.modules has the following contents:
>> +        # module_name: github.com/Masterminds/semver/v3
>> +        # url: https://github.com/Masterminds/semver
>> +        # version: v3.1.1
>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/Masterminds/semver/v3
>> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (git r=
ev-list -1 v3.1.1)
>> +        #
>> +        # As a last resort, if the last component of <module_name> ma=
tches 'v[0-9]+',
>> +        # remove the last component and try wget https://<module_name=
_with_last_component_removed>?go-get=3D1,
>> +        # then try using the above matching method.
>> +        #
>> +        for line in self.require_lines:
>> +            module_name, version =3D line.strip().split()
>> +            logger.debug("require line: %s" % line)
>> +            logger.debug("module_name =3D %s; version =3D %s" % (modu=
le_name, version))
>> +            # take the modules_replace into consideration to get the =
actual version and actual module name
>> +            # note that the module_name is used in destdir, and the a=
ctual_module_name and actual_version
>> +            # are used to determine the url and fullsrcrev
>> +            destdir =3D '${WORKDIR}/${BP}/src/import/vendor.fetch/%s'=
 % module_name
>> +            actual_module_name =3D module_name
>> +            actual_version =3D version
>> +            if module_name in self.modules_replace:
>> +                actual_module_name, actual_version =3D self.modules_r=
eplace[module_name]
>> +            logger.debug("actual_module_name =3D %s; actual_version =3D=
 %s" % (actual_module_name, actual_version))
>> +            url, fullsrcrev =3D self.get_url_srcrev(actual_module_nam=
e, actual_version)
>> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url, full=
srcrev))
>> +            if url and fullsrcrev:
>> +                self.modules_require[module_name] =3D (url, version, =
destdir, fullsrcrev)
>> +                # form srcpath, actual_module_name/<subpath>
>> +                if actual_module_name in self.modules_subpaths:
>> +                    subpath =3D self.modules_subpaths[actual_module_n=
ame]
>> +                    srcpath =3D '%s/%s' % (actual_module_name, subpat=
h)
>> +                    self.modules_srcpaths[module_name] =3D srcpath
>> +                    logger.info("self.modules_srcpaths[%s] =3D %s" % =
(module_name, srcpath))
>> +                else:
>> +                    self.modules_srcpaths[module_name] =3D actual_mod=
ule_name
>> +            else:
>> +                logger.warning("get_url_srcrev(%s, %s) failed" % (act=
ual_module_name, actual_version))
>> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
>> +                    sys.exit(1)
>> +
>> +    def use_wget_to_get_repo_url(self, wget_content_file, url_cache_f=
ile, module_name):
>> +        """
>> +        Use wget to get repo_url for module_name, return None if not =
found
>> +        """
>> +        try:
>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" % (wget=
_content_file, module_name))
>> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-get=3D=
1' % (wget_content_file, module_name), shell=3DTrue)
>> +            with open(wget_content_file, 'r') as f:
>> +                for line in f.readlines():
>> +                    if '<meta name=3D"go-import" content=3D' in line:
>> +                        logger.info("Succeed to find go-import conten=
t for %s" % module_name)
>> +                        logger.debug("The line is %s" % line)
>> +                        root_path, vcs, repo_url =3D line.split('cont=
ent=3D')[1].split('"')[1].split()
>> +                        logger.info("%s: %s %s %s" % (module_name, ro=
ot_path, vcs, repo_url))
>> +                        if vcs !=3D 'git':
>> +                            logger.warning('%s unhandled as its vcs i=
s %s which is not supported by this script.' % (module_name, vcs))
>> +                            unhandled_reason =3D 'vcs %s is not suppo=
rted by this script' % vcs
>> +                            self.modules_unhandled[module_name] =3D u=
nhandled_reason
>> +                            return None
>> +                        with open(url_cache_file, 'w') as f:
>> +                            f.write(repo_url)
>> +                        return repo_url
>> +        except:
>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 failed" =
% (wget_content_file, module_name))
>> +        # if we cannot find repo url from https://<module_name>?=3Dgo=
-get=3D1, try https://pkg.go/dev/<module_name>
>> +        try:
>> +            logger.info("wget -O %s https://pkg.go.dev/%s" % (wget_co=
ntent_file, module_name))
>> +            subprocess.check_call("wget -O %s https://pkg.go.dev/%s" =
% (wget_content_file, module_name), shell=3DTrue)
>> +            repo_url_found =3D False
>> +            with open(wget_content_file, 'r') as f:
>> +                in_repo_section =3D False
>> +                for line in f.readlines():
>> +                    if '>Repository<' in line:
>> +                        in_repo_section =3D True
>> +                        continue
>> +                    if in_repo_section:
>> +                        newline =3D line.strip()
>> +                        if newline !=3D '' and not newline.startswith=
('<'):
>> +                            repo_url =3D newline
>> +                            repo_url_found =3D True
>> +                            break
>> +            if repo_url_found:
>> +                logger.info("repo url for %s: %s" % (module_name, rep=
o_url))
>> +                with open(url_cache_file, 'w') as f:
>> +                    f.write(repo_url)
>> +                return repo_url
>> +            else:
>> +                unhandled_reason =3D 'cannot determine repo_url for %=
s' % module_name
>> +                self.modules_unhandled[module_name] =3D unhandled_rea=
son
>> +                return None
>> +        except:
>> +            logger.info("wget -O %s https://pkg.go.dev/%s failed" % (=
wget_content_file, module_name))
>> +            return None
>> +
>> +
>> +    def get_repo_url_rev(self, module_name, version):
>> +        """
>> +        Return (repo_url, rev)
>> +        """
>> +        import re
>> +        # First get rev from version
>> +        v =3D version.split('+incompatible')[0]
>> +        version_components =3D v.split('-')
>> +        if len(version_components) =3D=3D 1:
>> +            rev =3D v
>> +        elif len(version_components) =3D=3D 3:
>> +            if len(version_components[2]) =3D=3D 12:
>> +                rev =3D version_components[2]
>> +            else:
>> +                rev =3D v
>> +        else:
>> +            rev =3D v
>> +
>> +        #
>> +        # Get repo_url
>> +        # We put a cache mechanism here, <wget_content_file>.repo_url=
.cache is used to store the repo url fetch before
>> +        #
>> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
>> +        if not os.path.exists(wget_dir):
>> +            os.makedirs(wget_dir)
>> +        wget_content_file =3D os.path.join(wget_dir, module_name.repl=
ace('/', '_'))
>> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_file
>> +        if os.path.exists(url_cache_file):
>> +            with open(url_cache_file, 'r') as f:
>> +                repo_url =3D f.readline().strip()
>> +                return (repo_url, rev)
>> +        module_name_parts =3D module_name.split('/')
>> +        while (len(module_name_parts) > 0):
>> +            module_name_to_check =3D '/'.join(module_name_parts)
>> +            logger.info("module_name_to_check: %s" % module_name_to_c=
heck)
>> +            repo_url =3D self.use_wget_to_get_repo_url(wget_content_f=
ile, url_cache_file, module_name_to_check)
>> +            if repo_url:
>> +                return (repo_url, rev)
>> +            else:
>> +                if module_name in self.modules_unhandled:
>> +                    return (None, rev)
>> +                else:
>> +                    module_name_parts.pop(-1)
>> +
>> +        unhandled_reason =3D 'cannot determine the repo for %s' % mod=
ule_name
>> +        self.modules_unhandled[module_name] =3D unhandled_reason
>> +        return (None, rev)
>> +
>> +    def get_url_srcrev(self, module_name, version):
>> +        """
>> +        Return url and fullsrcrev according to module_name and versio=
n
>> +        """
>> +        repo_url, rev =3D self.get_repo_url_rev(module_name, version)
>> +        if not repo_url or not rev:
>> +            return (None, None)
>> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
>> +        if module_name in self.modules_repoinfo:
>> +            repo_url, repo_dest_dir, repo_fullrev =3D self.modules_re=
poinfo[module_name]
>> +            # remove the .git suffix to sync repos across modules wit=
h different versions and across recipes
>> +            if repo_url.endswith('.git'):
>> +                repo_url =3D repo_url[:-len('.git')]
>> +            return (repo_url, repo_fullrev)
>> +        else:
>> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s, %s)=
 failed' % (module_name, repo_url, rev)
>> +            self.modules_unhandled[module_name] =3D unhandled_reason
>> +            return (None, None)
>> +
>> +    def gen_src_uri_inc(self):
>> +        """
>> +        Generate src_uri.inc file containing SRC_URIs
>> +        """
>> +        src_uri_inc_file =3D os.path.join(self.workdir, 'src_uri.inc'=
)
>> +        # record the <name> after writting SRCREV_<name>, this is to =
avoid modules having the same basename resulting in same SRCREV_xxx
>> +        srcrev_name_recorded =3D []
>> +        template =3D """#       %s %s
>> +# [1] git ls-remote %s %s
>> +SRCREV_%s=3D"%s"
>> +SRC_URI +=3D "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/%s"
>> +
>> +"""
>> +        # We can't simply write SRC_URIs one by one in the order that=
 go.mod specify them.
>> +        # Because the latter one might clean things up for the former=
 one if the former one is a subpath of the latter one.
>> +        def take_first_len(elem):
>> +            return len(elem[0])
>> +
>> +        src_uri_contents =3D []
>> +        with open(src_uri_inc_file, 'w') as f:
>> +            for module in self.modules_require:
>> +                # {module_name: (url, version, destdir, fullsrcrev)}
>> +                repo_url, version, destdir, fullrev =3D self.modules_=
require[module]
>> +                if module in self.modules_replace:
>> +                    actual_module_name, actual_version =3D self.modul=
es_replace[module]
>> +                else:
>> +                    actual_module_name, actual_version =3D (module, v=
ersion)
>> +                if '://' in repo_url:
>> +                    repo_url_noprotocol =3D repo_url.split('://')[1]
>> +                else:
>> +                    repo_url_noprotocol =3D repo_url
>> +                if not repo_url.startswith('https://'):
>> +                    repo_url =3D 'https://' + repo_url
>> +                name =3D module.split('/')[-1]
>> +                if name in srcrev_name_recorded:
>> +                    name =3D '-'.join(module.split('/')[-2:])
>> +                src_uri_contents.append((actual_module_name, actual_v=
ersion, repo_url, fullrev, name, fullrev, repo_url_noprotocol, name, actu=
al_module_name))
>> +                srcrev_name_recorded.append(name)
>> +            # sort the src_uri_contents and then write it
>> +            src_uri_contents.sort(key=3Dtake_first_len)
>> +            for content in src_uri_contents:
>> +                f.write(template % content)
>> +        logger.info("%s generated" % src_uri_inc_file)
>> +
>> +    def gen_relocation_inc(self):
>> +        """
>> +        Generate relocation.inc file
>> +        """
>> +        relocation_inc_file =3D os.path.join(self.workdir, 'relocatio=
n.inc')
>> +        template =3D """export sites=3D"%s"
>> +
>> +do_compile:prepend() {
>> +    cd ${S}/src/import
>> +    for s in $sites; do
>> +        site_dest=3D$(echo $s | cut -d: -f1)
>> +        site_source=3D$(echo $s | cut -d: -f2)
>> +        force_flag=3D$(echo $s | cut -d: -f3)
>> +        mkdir -p vendor.copy/$site_dest
>> +        if [ -n "$force_flag" ]; then
>> +           echo "[INFO] $site_dest: force copying .go files"
>> +           rm -rf vendor.copy/$site_dest
>> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.=
fetch/$site_source/ vendor.copy/$site_dest
>> +        else
>> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" =
] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skip=
ped (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go=
 files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fetch=
/$site_source/ vendor.copy/$site_dest ; }
>> +        fi
>> +    done
>> +}
>> +"""
>> +        sites =3D []
>> +        for module in self.modules_require:
>> +            # <dest>:<source>[:force]
>> +            if module in self.modules_srcpaths:
>> +                srcpath =3D self.modules_srcpaths[module]
>> +                logger.debug("Using %s as srcpath of module (%s)" % (=
srcpath, module))
>> +            else:
>> +                srcpath =3D module
>> +            sites.append("%s:%s:force" % (module, srcpath))
>> +        # To avoid the former one being overriden by the latter one w=
hen the former one is a subpath of the latter one, sort sites
>> +        sites.sort(key=3Dlen)
>> +        with open(relocation_inc_file, 'w') as f:
>> +            sites_str =3D ' \\\n           '.join(sites)
>> +            f.write(template % sites_str)
>> +        logger.info("%s generated" % relocation_inc_file)
>> +
>> +    def gen_modules_txt(self):
>> +        """
>> +        Generate modules.txt file
>> +        """
>> +        modules_txt_file =3D os.path.join(self.workdir, 'modules.txt'=
)
>> +        with open(modules_txt_file, 'w') as f:
>> +            for l in self.require_lines:
>> +                f.write('# %s\n' % l)
>> +                f.write('## explicit\n')
>> +            for l in self.replace_lines:
>> +                f.write('# %s\n' %l)
>> +        logger.info("%s generated" % modules_txt_file)
>> +
>> +    def sanity_check(self):
>> +        """
>> +        Various anity checks
>> +        """
>> +        sanity_check_ok =3D True
>> +        #
>> +        # Sanity Check 1:
>> +        #     For modules having the same repo, at most one is allowe=
d to not have subpath.
>> +        #     This check operates on self.modules_repoinfo and self.m=
odules_subpaths
>> +        #
>> +        repo_modules =3D {}
>> +        for module in self.modules_repoinfo:
>> +            # first form {repo: [module1, module2, ...]}
>> +            repo_url, repo_dest_dir, fullsrcrev =3D self.modules_repo=
info[module]
>> +            if repo_url not in repo_modules:
>> +                repo_modules[repo_url] =3D [module]
>> +            else:
>> +                repo_modules[repo_url].append(module)
>> +        for repo in repo_modules:
>> +            modules =3D repo_modules[repo]
>> +            if len(modules) =3D=3D 1:
>> +                continue
>> +            # for modules sharing the same repo, at most one is allow=
ed to not have subpath
>> +            nosubpath_modules =3D []
>> +            for m in modules:
>> +                if m not in self.modules_subpaths:
>> +                    nosubpath_modules.append(m)
>> +            if len(nosubpath_modules) =3D=3D 0:
>> +                continue
>> +            if len(nosubpath_modules) > 1:
>> +                logger.warning("Multiple modules sharing %s, but they=
 don't have subpath: %s. Please double check." % (repo, nosubpath_modules=
))
>> +            if len(nosubpath_modules) =3D=3D 1:
>> +                # do further check, OK if the module is the prefix fo=
r other modules sharing the same repo
>> +                module_to_check =3D nosubpath_modules[0]
>> +                for m in modules:
>> +                    if module_to_check =3D=3D m:
>> +                        continue
>> +                    if not m.startswith('%s/' % module_to_check):
>> +                        logger.warning("%s is sharing repo (%s) with =
other modules, and it might need a subpath. Please double check" % (modul=
e_to_check, repo))
>> +                        continue
>> +
>> +        #
>> +        # End of Sanity Check
>> +        #
>> +        if not sanity_check_ok:
>> +            sys.exit(1)
>> +        return
>> +
>> +def main():
>> +    parser =3D argparse.ArgumentParser(
>> +        description=3D"oe-go-mod-autogen.py is used to generate src_u=
ri.inc, relocation.inc and modules.txt to be used by go mod recipes",
>> +        epilog=3D"Use %(prog)s --help to get help")
>> +    parser.add_argument("--repo", help =3D "Repo for the recipe.", re=
quired=3DTrue)
>> +    parser.add_argument("--rev", help =3D "Revision for the recipe.",=
 required=3DTrue)
>> +    parser.add_argument("--module", help =3D "Go module name. To be u=
sed with '--test'")
>> +    parser.add_argument("--version", help =3D "Go module version. To =
be used with '--test'")
>> +    parser.add_argument("--test", help =3D "Test to get repo url and =
fullsrcrev, used together with --module and --version.", action=3D"store_=
true")
>> +    parser.add_argument("--workdir", help =3D "Working directory to h=
old intermediate results and output.", default=3Dos.getcwd())
>> +    parser.add_argument("-d", "--debug",
>> +                        help =3D "Enable debug output",
>> +                        action=3D"store_const", const=3Dlogging.DEBUG=
, dest=3D"loglevel", default=3Dlogging.INFO)
>> +    parser.add_argument("-q", "--quiet",
>> +                        help =3D "Hide all output except error messag=
es",
>> +                        action=3D"store_const", const=3Dlogging.ERROR=
, dest=3D"loglevel")
>> +    args =3D parser.parse_args()
>> +
>> +    logger.setLevel(args.loglevel)
>> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" % (ar=
gs.repo, args.rev, args.workdir))
>> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
>> +    if args.test:
>> +        if not args.module or not args.version:
>> +            print("Please specify --module and --version")
>> +            sys.exit(1)
>> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module, args.ve=
rsion)
>> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
>> +        if not url or not srcrev:
>> +            print("Failed to get url & srcrev for %s:%s" % (args.modu=
le, args.version))
>> +    else:
>> +        gomodtool.parse()
>> +        gomodtool.sanity_check()
>> +        gomodtool.gen_src_uri_inc()
>> +        gomodtool.gen_relocation_inc()
>> +        gomodtool.gen_modules_txt()
>> +
>> +
>> +if __name__ =3D=3D "__main__":
>> +    try:
>> +        ret =3D main()
>> +    except Exception as esc:
>> +        ret =3D 1
>> +        import traceback
>> +        traceback.print_exc()
>> +    sys.exit(ret)
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8272): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8272
>> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


