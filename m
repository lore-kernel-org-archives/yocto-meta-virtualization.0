Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30679.1630982122353300572
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 19:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JHBseeUS;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=488453a348=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1872UcMT001414;
	Tue, 7 Sep 2021 02:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nuSFH3aIEMcXWvX6J4oA7YgfMdMhWUSs12Je9M8I+64=;
 b=JHBseeUSQIqIeQHgxo0F8tMJyTR0Wqnhm1UEjwHBYaTw4tZn1fPtVzsYq+uVZt9m4CA/
 Gta26gLML3K6DA4aIov87BR1m5Mornfk3i/UtRMHWIqoB2Siid12TLmGgoN1Eg6HMsKo
 UyU3zVLxgtA2aiunTfjl86LyxiUZvIdTYsx+V+Z/aLrd5TyG0ze8xqnh44Li8pDLxgWI
 X5UV1AyZbPz+tQaKTQNd4B2V7qB9GEDpGUILtmIWmH3THehflSLeRdNZFZFKsnbkVsTj
 dgSO3Qf206jKkXD0rpAdpKMiHQmac9mQfYV0fZSy4f4ym5s7ERUsfqDaEc9E67Dz2GYM MA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3awjhygcr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Sep 2021 02:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLGfg2JtVMKRuikEH2oE5juY9GY+QXmKfHVZleRPOzjXk+O+h4kYz2fj3fW48j5VNdaODn/IKTkvxAOTNWT1D0f1Ko8I5bPPSLYRbZ7QmIoszXysqgHiUYKH0QvE9Yc7RzyGBDFBs9O96m6SH1Vbt1itKGmHnU/4r+Leufxdt/mkwaqJ2hXJOMXfBfm92kO9eOTlH5sanpK6gqw0rxJIKvPZSoCF8bpFahgLY3Si/gzb78rWSLWN60vUoGORA8Zy76IxWT2Xsj1s8LetKuhsqOruJg2kacvujrGjSpml28814Dkcbmuxi/VviTCAZPq/hA4F+Xe+KJln6Kk1ZafgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nuSFH3aIEMcXWvX6J4oA7YgfMdMhWUSs12Je9M8I+64=;
 b=BkDoULhMejc/IAQF6/UKEPf12Rh0aBbu+alTnIIiffcNRwh+7CrK2vwIm6o74NhPsc77u8vbQDMNUgVYJFpqg8823VbCPIsXC9r8/pNrCM7D7FcJD+tT/9b2muHmRTb0SGisZ6i4k5K8TELau6/T/Pm4/+4+d6z8ReFK9Ei4Xchhao+pE5n6HoIT3cbPoG7xGS76IFWge2tS5MzuI2hQDM92+oLz15J2TZxaCZ3mSpKMQix9ndpQ5eZyCCWVms2pzcc1WB0/Bz1Xz3F2gvEwBjr/7fhTnzogaq30ItGENlAwdUM2WldjFFI6UO3CY/uy1wN5/6M3AyNKBZb+6zWVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 02:35:17 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 02:35:17 +0000
Subject: Re: [meta-virtualization] [PATCH 2/2] skopeo: Upgrade to 1.4.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210906080510.28468-1-mingli.yu@windriver.com>
 <20210906080510.28468-2-mingli.yu@windriver.com>
 <CADkTA4OJ1XKrGkUvbUCW6AyoGwK4rQaPhER4P0hzpb3xg1Fzdg@mail.gmail.com>
 <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <d493a642-ff70-02d5-ff7d-fde98d4abb9d@windriver.com>
Date: Tue, 7 Sep 2021 10:41:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4PujyTHtFxOt0DodPQQGBS=bwAC-4FC7pVG4jLrQfVaRQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:202:16::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
Received: from [128.224.162.173] (60.247.85.82) by HK2PR02CA0131.apcprd02.prod.outlook.com (2603:1096:202:16::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 02:35:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1f71d9-9179-475b-b44e-08d971a82106
X-MS-TrafficTypeDiagnostic: CO1PR11MB4817:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4817FBC0E6B76B0EB9C01E79F1D39@CO1PR11MB4817.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8lLU+mZ+Gdh5IQpH8LMk1apg6rMI64fmvj0jmC/QftAYOu5REZBepfbd5SD9S7SJhQ6brWURhHh2XeUolp8CpJI8Ta6CYuUN3lUM10yupYEv6h/sbNBoX9MhbMqwH7CdbbRNAm6hfjFi10k0oao71UU0D0doY47ktRY17P/BesS3gqTbkDgWb/ul0gSIuUy1HYpEvetA0BKLd80s3TsLEWsKm9YRdaHH/eXoYUFZrA7B2lXHOBGDgaASk5uaVraT5io6hCugP1Rbt2wzQ02b/s9Bhl4eyS5oP/Xo2wAUnOwnbWreEozjcnwXehQxnJiBzBjW7umFoUxWkkJap2NLUYSvFsTry2U98R1PN+LrL06bL4g0RoKMrf0mSeZUPywGRCeMcqTCkRP4iUURzi/PpYTSgqEW0tsWBbcfLB166P7jjx/lHjj/lh5m8yGQ4uKVECQd7QubaMo12C8PjVpBrPJSWFIdwkw1He2MgOu854zNv9LP2cOKRgJwxOmFNLtT9uYPfpXAaZfZRt0IYRkcofOP++vSmfaaWTAO11NlW8jFB+PcDdSFm3ZD0pN2/Bo2IerZsijIdgxn3TxpoXYwSX7xEEdnC6zzfNfiEN5ULOZhY5rROVqeeaWYMZUp7RiKliTleGGYnTQlaMv7xHQ3O9/LcOkCHZHeCGlCbHVfLufN9qr8noT8GahKMjqztFT6wC5GicA5T++9y1CSmVY6o8YfKNfXeMLjMVUkk9uxN7kpnLVVi4rGtlDb+u7JSZS0/fI3Zkym4+9cUHQwvCDRIokDIunOYCEGD0O35q2VEUgsivOfOyypeVzelpqKJMXSIQifpL5AFB6OfJNBB63kCa7NYgoRe+TktK8B2U4hoCpbgcyZZ68Z3rgiaOr/LgHORaN+lRaDMr+mHyLKOJbROg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39850400004)(376002)(52116002)(2906002)(83380400001)(966005)(26005)(6666004)(956004)(66946007)(8936002)(8676002)(186003)(86362001)(2616005)(66476007)(66556008)(31686004)(4326008)(31696002)(53546011)(5660300002)(16576012)(6706004)(6486002)(6916009)(38350700002)(478600001)(38100700002)(36756003)(316002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGNqRStLWkFJMUJZMWZuWnlMMEJlYkNYZkswR215T3FPSkdtK0taTTZnV0Nj?=
 =?utf-8?B?TUdyUmd2aGNMTHRPY3ExZDZjSUxTaEFIRnUxVk5Tb0s2bVBZUnhBbVBEaU04?=
 =?utf-8?B?RWJ2NjRkZEVuaUtjTXNVNmdSZmYwb2ZxQjlNbHo5RDk2N210UkFNQmJpWmVh?=
 =?utf-8?B?alg2SWF3YnhGa0ZXeVozSkpCZkxySGJRb0N0T0hFaGpKYmJ6QmlhdHBKUGZu?=
 =?utf-8?B?ZEZkSnVpcGhnMGQ2Nkl1V3JySi90VlZ1UFFaM0M2UWhyN1FxbDlha1BkMysx?=
 =?utf-8?B?c010b1BvU2hNQllic2NCYXNBMjNSUGlZSHNWaTlBZ0FlNUFGMkF2eEM3dzh1?=
 =?utf-8?B?L09yWldrY1ROV3N2SGNNV282WlA5OWc1emEzaWhWZXgvaDJpSDJaN1d2YmVK?=
 =?utf-8?B?OWZtRXhycTVWT1BqWHdTYzVSVmJwU25KSFk5ZE1lTXkrWUltZ0FleHpiZHNT?=
 =?utf-8?B?ZHc1MzNrVnVCZWROZmZobEhFejMyWDM1SHh1cHp0RlEyc1JGcUpnT2c0K0dw?=
 =?utf-8?B?M2JFVFpuR1VwelVIL0QwTS80VUdGWWIxWEtmYm9mZTdGRVh6UDJJSThWK2gr?=
 =?utf-8?B?VFBVNGYvWC8wd2U0ZXpGUyt2aGJoTFJMWHVGaCtjZmNyV2MvVGhPR05IbURJ?=
 =?utf-8?B?Z3hnVHVRQ3Y2TkFtc1Y2SmRkZUhUOFRjV213bVJLSmRxQkZKbXgvMFlDekdm?=
 =?utf-8?B?cW5VUHJvWGtPeUd1STVOdEV4L0ZTT1V0dVVyMHlVV0c0azh5UUxXYnFUbkRk?=
 =?utf-8?B?WGtUc1l6dElFYjNwdUYwYnFwUmEzRUgxYUtxeE9rUFREZkc2RGRaZW5wTW9F?=
 =?utf-8?B?a1FUdjRWM08zMUZMTi9VYnRjMXdEUXRRT2E1Z3FtM1M1NzhNakVpTkZjYldn?=
 =?utf-8?B?bGcrSGtSSkxjczJZazR1cm5yMCs4T3h5ZDhweGxnWWc1bWVIbXpsZXcxcThr?=
 =?utf-8?B?SG9sc2dVUytTWWprZkR3bUdZQ09lZE5xRllBQ0pTRUZ1VlBtbXRycUh5WDhS?=
 =?utf-8?B?YlU3VE1WU09VWUdYOEhiUVhHVk90YUVjZkpDWUNaQUpsZ1I3TjRKOUxXMzh6?=
 =?utf-8?B?OWdGelNMVnljUnlNTWdmTGFTQUlQeDRvL3IwYjAxVkNESVArekh3ZUNtWVU5?=
 =?utf-8?B?K3RFVnN1QUNSalIyMHZhMW0wNm5MNnFlbUFkdnFEZDhuODAvRFBKUVdPbnlp?=
 =?utf-8?B?ZldITjQxakdzdFNRTTBmQW9JMUhBcXVIQjltK3dIeFM3WGVjZ3VnRCtlRG42?=
 =?utf-8?B?Z1hhayt3Y2o5c0dQeHV2NEVwcytDSlp6dGpoUDBKY2ZKcUx5WlpzeEYrY2xS?=
 =?utf-8?B?MlducHZPUUJMSVhzQmhCVWw3Rlg4L0hJdXVNa3lsZW9MUmo5WVR3cUcrMlYy?=
 =?utf-8?B?Wkd4cktGYkJobzFmazlOWGtlSG5GRHJsTGluK3l4Q2JnNUUvaHlRTGNNV2l3?=
 =?utf-8?B?eVNjUjhPMitQS1NLUHNJT2kxT3k3eWtZQWN3NUhOSEo0TnIrSkpFbzJDRkNO?=
 =?utf-8?B?MXREVHdlNGN4WTM1Vkw0N1VrMTBiQWtGRGE5bm1kZzZKNXNvWWRzak4zOXNM?=
 =?utf-8?B?SmlMV0RqTTRkME5UR01YZnY5djNVT2QrNHN3VWJzcE5QcVc4eGFzbXptdGV4?=
 =?utf-8?B?amZEa3A2dXlLbUpqaDVtRDFoNDFjejNvdlV2MC9ZWDdPdkRZVmE3ZEI2ZWtJ?=
 =?utf-8?B?Q2tsOU91SHNXYjFHVFA3YTBQWDJrcGdyYjhxZmx6SzYzUmUvclptNzZpMHVD?=
 =?utf-8?Q?XkzGDaGDEot+krxUOSjwlgjdw0KU9AxVpuMIHtP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1f71d9-9179-475b-b44e-08d971a82106
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 02:35:17.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDNEKw0BUr2+kmya85xhIvgL/BRTbCG9EN0QetJzAEvjCdBSbgMYxnIkI6Hn3vrNpRXZLN9UeqTEVmNx6H6GFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
X-Proofpoint-GUID: VEmSTOjgQdFxU3NPSBP1n5nqDtWdPXpr
X-Proofpoint-ORIG-GUID: VEmSTOjgQdFxU3NPSBP1n5nqDtWdPXpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_10,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070014
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/6/21 10:08 PM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Mon, Sep 6, 2021 at 9:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> I also already have this version bump queued locally.
> 
> Actually cancel that. I have more -dev versions under test (I got my
> uprev's confused for a moment).
> 
> But we don't want this SRCREV change. I put it to the tip of the
> release branch on purpose, this rewinds the SRCREV, and it isn't
> something I'd merge.
> 
> But the packageconfig change can be valid, and is something I'd take.

Okay, I will send the packageconfig part then. BTW, why is there dev 
version, I think the latest release version should satisfy most of our 
needs.

Thanks,

> 
> Bruce
> 
>>
>>
>> On Mon, Sep 6, 2021 at 4:09 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> Remove the unvalid keys to silence the below warning:
>>>   # podman --version
>>>   WARN[0000] Failed to decode the keys ["storage.options.override_kernel_check" "storage.options.overlay.ostree_repo"] from "/etc/containers/storage.conf"
>>>   podman version 3.3.1
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>   recipes-containers/skopeo/files/storage.conf | 6 +++---
>>>   recipes-containers/skopeo/skopeo_git.bb      | 2 +-
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
>>> index 818cfe8..c0d512f 100644
>>> --- a/recipes-containers/skopeo/files/storage.conf
>>> +++ b/recipes-containers/skopeo/files/storage.conf
>>> @@ -30,7 +30,7 @@ size = ""
>>>   #mount_program = "/usr/bin/fuse-overlayfs"
>>>
>>>   # OverrideKernelCheck tells the driver to ignore kernel checks based on kernel version
>>> -override_kernel_check = "true"
>>> +#override_kernel_check = "true"
>>
>> But there's no reason to drop this.
>>
>>>
>>>   # mountopt specifies comma separated list of extra mount options
>>>   mountopt = "nodev"
>>> @@ -126,8 +126,8 @@ mountopt = "nodev"
>>>   # xfs_nospace_max_retries = "0"
>>>
>>>   # If specified, use OSTree to deduplicate files with the overlay backend
>>> -ostree_repo = ""
>>> +#ostree_repo = ""
>>>
>>>   # Set to skip a PRIVATE bind mount on the storage home directory.  Only supported by
>>>   # certain container storage drivers
>>> -skip_mount_home = "false"
>>> +#skip_mount_home = "false"
>>
>> or any of these .. the skopeo configuration serves many different use
>> cases, if these are causing warnings in your setup, you need to carry
>> your own storage.conf
>>
>> Bruce
>>
>>> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
>>> index 39ee8ca..adb7de1 100644
>>> --- a/recipes-containers/skopeo/skopeo_git.bb
>>> +++ b/recipes-containers/skopeo/skopeo_git.bb
>>> @@ -27,7 +27,7 @@ SRC_URI = " \
>>>       file://registries.conf \
>>>   "
>>>
>>> -SRCREV = "01e51ce610e3cfe1230a10af982e962c4ad1c990"
>>> +SRCREV = "130f32f047b7bf9b1fb4f95c4c5b1da6255e4829"
>>>   PV = "v1.4.1+git${SRCPV}"
>>>   GO_IMPORT = "import"
>>>
>>> --
>>> 2.17.1
>>>
>>>
>>> 
>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
