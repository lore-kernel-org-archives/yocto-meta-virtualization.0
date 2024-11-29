Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4277D729FC
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 19:02:26 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.87])
 by mx.groups.io with SMTP id smtpd.web10.121056.1732906942636166500
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 11:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=a3YobxbH;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.87, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0w9XOMJ12WSfRqUPVTCp22MHcJeEufSNHE962UsDnEQ3WWetELsndYP1/+jmHTRYBCWYE1xqaTr/8ZeRTuI6dN8Vf5GnHvFkvaycvGOpRtwFzIl6WdGlMbfZwIrHlIdHAAecwd0C8osi/scWaZWThHni4BJV6tKMImScFXWn3hGXHuFEe5/6IJ2L1N/DP++x0GNPkMqjcyIeSIXz/Yz28esnKPN/SZKxFLF04t/mnWfx17oyRZ5S9LLwHpnsgr4iEsAC3k6JBGHddcczqCcdqx0D822VfI3o7RMVgJLD31fWRDliqfzeagspDWo8yhdis3yx+sRAl0y2NxcW2k6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fz1zrpw9dzDL9lXTkb5k4nHI7eWmrigz2YxjcQjBaY=;
 b=HmuSHuvmZ/g1erYXfrHWYaYKUpKLLMDJN1gm9AH8ra277oP/FsNHbf3os16IzSIaEhrVv3Ds/aLreSYXfSspIzKl94S0ejoTDpSeHP0n8p97fKsdKRfovAiX0/e8LD95V9HvdIn290q1TIDgd7lw/S9KQmoZTiee4L83SznJOATTsxQwNJ/+z2MmnVDxKrHSA9cFWhjmzpU76Bi2lVPYeO+6kB3IhzFIpVf5sfSZ/VR3nAAuaAIBeo99eMY8yg8JLxWy++A8zSSoFbfOemz64ggG+Tpq4qYLsurHzVfrnlDIwQcShcfm9DJ1ujQGEf2kDZLGTxOzg4jHKjBRkCVkTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fz1zrpw9dzDL9lXTkb5k4nHI7eWmrigz2YxjcQjBaY=;
 b=a3YobxbH70kzAbtsvDS0jsBlh5W55xHSaniKL6AdWEnhSwK2+6o7vbPcQY1dqktQDU5sir9+ABVtl8FQY33wo2c0kgPR78RBt0B99N/4tIXPVQRx3tOiS0LnThFRgHIBjxQjGSjxTncZJyyY5LVwaMpwz6yj59pB+gEPsyycKlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 19:02:18 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 19:02:18 +0000
Content-Type: multipart/alternative;
 boundary="------------HEpWTzykvCmGnO7e67WWh6rQ"
Message-ID: <ecc500e0-52b1-4fb8-9d30-5fed6d0bb03e@amd.com>
Date: Fri, 29 Nov 2024 12:02:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][PATCH v2 1/6]
 xen-u-boot-scr-configuration: Add bbclass for xen boot script variables
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
 <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com>
 <6952bcbe-548b-4bf7-b994-6a28bcd4d314@amd.com>
 <CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com>
X-ClientProxiedBy: SA9PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:806:a7::17) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c361e6b-5442-44fa-8f38-08dd10a8584e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2h2SlNPUUdWaWszTWF5bW9TZ3BGN0xBd2JwVzVQK1hBWjM2Z3hSVzNoYTBO?=
 =?utf-8?B?aWZoVFFHTDNON1hIazRnT2ZjclJnNnJ0TW9vckhXOTR1dkJqT3JVemFUeHZE?=
 =?utf-8?B?STdPL1l3TGF0bm9WQXpzSUxyVXRMT2VBMVVvWnBYRE43eFRnTmMyT3kvS3c4?=
 =?utf-8?B?REVlS3ZjK1VFd2E5OWFML0RKVlZZSFJmS0tVRVl2a21kS3NydzZLanZxaFRi?=
 =?utf-8?B?b0VvdDhXcmlucGFNTUlRdE1ITGtTMVR0enFocmdJRUk4ejJzbnFsdVRRWkps?=
 =?utf-8?B?dmRmamY4aS9LRFJhdy9SVksrZEhwU1dDMkFYdlVmOVF3QkpZbzBpQngzRU83?=
 =?utf-8?B?TkZraUZ4MTlUVmlsdC8yOVpYSE1ocHliMFptK2RxcXRQT0NuL1I2WVNqb3lN?=
 =?utf-8?B?eG52Y1UxY0pYbnhQYVgzWm0wWVU3bmtvYUtCOGJ5UXpEV3F6ejNsNWNXRDkv?=
 =?utf-8?B?WmxXN0VLOWVITXYrL1Y2VVp6RmVMOXUyZW1sS0xwOHRZRFNsUUhRQ2N1MWI0?=
 =?utf-8?B?SkR0MmZaWENsVlpSQ2FNS2ZPL24rYzQrY1EvTjNuVlpyZWlFUVJQNW85Z043?=
 =?utf-8?B?UDF3RzBycVJzK3hNMlVHcWdUNHdDbCtybXFRci9CWWdBN3kvQkFnZGxxVytF?=
 =?utf-8?B?NitkeERzandGYVlXOGZmK21IUTZPRlJkTk44N1VwYWRmSmo2UW92K3VVdFBq?=
 =?utf-8?B?VXA1VE5iaDNpcGtIU0VacmpyVXpSd2hQRlc5NWljK01VUzlYZFY1a2NubWNB?=
 =?utf-8?B?b1pEWmFnendwWmxmYnhrS0dqUkV4QmhqTEZ0WExYeXVwT3VNMjdadHVLY0dQ?=
 =?utf-8?B?TWp4YVZaVGRmOUNmYkJWWnJrN2ZFZGdwdzlvMTVVNHhVYVllamRkV2U3VUYz?=
 =?utf-8?B?MmdzVjFIQ1BXOXA1cFZOYWZVMjJIRjVLMGZNYWZOQUIwUnp1MzZRVGovbmM3?=
 =?utf-8?B?M09qakdySldWZy84djFUTksxVXBwRTFpZWNSSHRMOHlFZ1dLUjY5dGo4Nko2?=
 =?utf-8?B?TUo0QVg3RFJWdVB6WkhLMU5TTkVMbWQ2L0VaYTZhVXBOQmt3a0pkbFBabGFx?=
 =?utf-8?B?bW1xQnRsdHZ5V0JDQlR0NlVPczVMbzFBZ3ZoN0thQm9ETDhDQkF6MWJrZWcv?=
 =?utf-8?B?bXpJbkQ3emhFQlNDZ2RZeVRqNkwrdWNQQ2lqTDJIaGdvYlpvTEtSV1NYSVB1?=
 =?utf-8?B?Tmp4WEtJcHNic3N5Vkd6bzhKZUxLVnlVejZNdUJIalNiRlYrQUtBQWlZZ2tn?=
 =?utf-8?B?SzE4UVJOaGNxM29aWVBOK0RmaHZrbEdGSkRsVHFEMU8zaGdLd0U0dDFhajhv?=
 =?utf-8?B?VGZkRkZLZDJ4enV0S1NHcENoRk42ZnI3MEdqNVdtWWFGb0xMckM5R3BEVWFL?=
 =?utf-8?B?WTFLcTZFckhGSk9HY0VpV0Jua09VNTlNWFUvTzEvYWYrVEVNcDB4UkQ3WHRN?=
 =?utf-8?B?dU16aDd0WDJITVVxL1M1eHhSU1Eza0RCeGtLMXFNU3V5cndzNjU2dGVydWND?=
 =?utf-8?B?bGdCOU9wSkZGZ0tCYllVdEd6YlRtWFdaRjNnRzUyU2F6YmovNmdueCtqVm8y?=
 =?utf-8?B?eURjVmpmZ29WZEJwN0owL3RkaGlrQi9DOXcxblgrd200bEt0RHlJNlA0d1lL?=
 =?utf-8?B?cVVkbUV2VCtGaFFLdU8rcndLc2pkcWpHVEkyNkUxQUtMTTJJb00yOFFodmFX?=
 =?utf-8?B?MHpGMERuOXZsMGdDQ2RsUkpPTnk2MCtzZHZ5cXVYT05mZXhGSWNPYVRjUDdx?=
 =?utf-8?Q?uOBwMF1dhHIJq2al1s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUZHMU5Pa3ZPUkxjcXFSMzFFMy92RE9rQS9wazZ5UkpPMzVVbFBIN2JqQXJM?=
 =?utf-8?B?bHVacjV4aTBvQ2N4NW9aS3plWENXMDRzZXFwMkVnRXJ6YXp2aER3Y0xuUW1C?=
 =?utf-8?B?UnZ3NjNtR2JMVk9Zd3ovNkczT2lGZEhpV2pJV0JQTkh6Tysyc0ZydWlqZlM3?=
 =?utf-8?B?cm1BZEo1ekx3RTF5eEQ3M2NtaThtcXh1bDRLeGxTOEovbkgzUXQ2ZmsxSzZC?=
 =?utf-8?B?VnBiTmJ6dUZianRJNFhhcjlTMHg2aGlWQzQxbXVMcTUxYUFQbW1INkpndjFL?=
 =?utf-8?B?RFhpSnkzUXY4Ukt2bkZVelV3dnIxVzgxVU1ZT2Z0T0p3R3lHZVFYNjlEU3pK?=
 =?utf-8?B?MGhxbVArOG9UUW9KaGtBRWhCMlY0NGhsbWtERk5YdEovVnFGQXh6enUrWFRH?=
 =?utf-8?B?S01tSG1obGlmMHJ5UXR3Y3NsdWJweE85dHF1R29DLzNsYkxiOXJjN3BIakly?=
 =?utf-8?B?WlBkWG5hR1JpaFBvZ3Q0eWw4YUNzZjhnTHdOYTlmWHlmSnp2OWVTRDZmaThY?=
 =?utf-8?B?TW5BdEwrZHpsazBqdEt2anRJN1J1NWhNY05jTi9JbWI5cWt5UjVWVmtEaVdj?=
 =?utf-8?B?bGNSeFZtdk4xOHptZ1RJZGQxM0RIUDhQNStPVGpTaWNoQW4yVXZ2allvNjlo?=
 =?utf-8?B?WDhKemJlME1SL05tK052NUVvVFpRRStvQ0gxeG5iSlhIMURRSEV2U2ZUWUgv?=
 =?utf-8?B?SklUUm41OVBIY21jTjdONXhCWWpmYnU5SlE1MVJJMXBSbDJBYmtoYTA4eC9h?=
 =?utf-8?B?YmdpK1NxSXlhNmpzUkNidlBLLzBLOG9mMlpBUk05U2hDb2NrVldhUHVoeWg0?=
 =?utf-8?B?Y3FGMkNTVllqNmNHK05Nd1VLTEx4QXM4aHpobHZoNDE1UnZQd2tMUHlIYXND?=
 =?utf-8?B?L0h1M3hVRmUxMmJHZmJ3SCtIUkVPRHg1N21NRjNYcDBsT0ErR2kwajdzZTVL?=
 =?utf-8?B?OFJOV2x5bmRNSC9rb1BFb1dkUHlnQjNjeWNtNzF6Smhtd0EyQytmMFNXZ2Uv?=
 =?utf-8?B?UnNUTzBreG95K1VvU1Bld0E2WGl3ZHA2U2tIRkU5VGNqUWltV3E4UVkySHh0?=
 =?utf-8?B?a0JvdmdhaXM4R2dQeEtaUUhITEJZQmNMeEdDMXNqaTFuZnpFblQwSnR0L1Br?=
 =?utf-8?B?MjUwQU1qNUg2YU8rT3ozUjR3VVBLdi9EanVldFUzMFRsTldlWFdxcjVscW03?=
 =?utf-8?B?OVB5OTYwVlV1NDdBcEU3NTlrc25RNC9nV3BOMVFWMGlHQ1ZVUlM0WVRJViti?=
 =?utf-8?B?ak9MOWFrY0pBR01BWklsQVZQOEJoNmV0NHBqcjkxRmFNbWNWTVhZTk84Skhz?=
 =?utf-8?B?OVFqOThHc01KUWVydjJBZGxSZCswWlAwUG84eXFiOFErMFRvSFNmd1hVU013?=
 =?utf-8?B?bGVyRlVZczRLVWdmM0Q5Q0MzVkxpWWhUdjhBeFZWZ3MvWFZZMytobC83cXZw?=
 =?utf-8?B?OFpJU2Q2aitFNnF5bjdHVUdBQjQ3VEx4MmZjWjVsaEU4ckxldVMyNUJPK0pB?=
 =?utf-8?B?aC90bUowODVMczdKcjA5OE1tcTlCTnRvdzFZQ1FlZVpBeXJYVnhGcUM4Sm1o?=
 =?utf-8?B?RmcrMWIyWWdqMzVwRnJOVFA2ZXVjVGFjU3N2Zk0rM1JyRWkrS1VVMmgxcEFK?=
 =?utf-8?B?ZkY4SDl2L0VOT2pia2ZpVTd5WjlCSkRJZjQvYzFLWW9XM251TkV5NUZZRmVB?=
 =?utf-8?B?L0RmeFdmSHBvb2hzU1VHZExBVkZ6VUxoN3lsRmxpQlhoUmF1S2VOOVgvRXdG?=
 =?utf-8?B?ZnMzVG5NV3cyZ0JjS1NneEVhSHNnUUZYalRiaUs5V3dnempiZ0h4b1BHbE14?=
 =?utf-8?B?YWt0dGJYWTFUaCtrZ3FzNVMxOXdWMzhqdEE3bldwT1YvWUtNQXpjWEZMZXV2?=
 =?utf-8?B?THM1MVpteC9mZ3g5MzZuK0xQbVhxMDR3Y2xUR1lWYmppY3NwVDFmTmtoakVx?=
 =?utf-8?B?d2krcGtRMStwL2ZqREdPSG5rOGFxSStHN2NPSnh4MEtlYUpEWHZaNUk3UDRU?=
 =?utf-8?B?OXBHRGVYTCtGTXR4T2hLd1RNNzdCQjBYZ0pwemZ4VFlVNTdETmlqVHdHbVps?=
 =?utf-8?B?L2taRXZ1SGxmSndhbHpHYVVGOWFwQldqUGpKTkVocG9DcWhCNXgwS3lobzBa?=
 =?utf-8?Q?rGmwf0QUaxWMlLFVOcaRXHScF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c361e6b-5442-44fa-8f38-08dd10a8584e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 19:02:18.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnvauOvNupblGMAaefmMYaGV3aFFsU1nhmfDi9EXhkssa8SwY2WM6OcRA5nVaKHp4qV4vjm8lYaCnhYAPx+B/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Nov 2024 19:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9018

--------------HEpWTzykvCmGnO7e67WWh6rQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/2024 4:13 PM, Christopher Clark wrote:
> On Fri, Nov 22, 2024 at 9:55 PM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>     Hi Christopher,
>
>     On 11/22/2024 8:11 AM, Christopher Clark via
>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>>     Hi Sandeep,
>>
>>     This series is promoting some of the Xen hypervisor launch
>>     configuration from the hardware-specific dynamic layers into the
>>     common layer, and introducing a class that defines interfaces to
>>     the hypervisor and its guest virtual machines that should be
>>     applicable across all architectures, hence my comments from a
>>     non-architecture-specific perspective.
>>
>>     There's a lot of opportunity for development in this layer to
>>     extend and improve this area of configuration -- thanks for your
>>     contribution.
>     [Sandeep]: Yes that's the main goal and I've already discussed
>     with Bruce on this topic.
>>
>>     On Thu, Nov 21, 2024 at 10:49 PM Sandeep Gundlupet Raju via
>>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>>     <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>>
>>         Add a new bbclass for xen boot script variables. This bbclass
>>         provides
>>         common xen u-boot boot script variables which can be
>>         inherited by any
>>         vendor specific u-boot boot script recipes. Also these
>>         variable are
>>         configurable from recipes, global and machine configuration
>>         files.
>>
>>         Variable nomenclature is aligned with xen documentation.
>>         https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>
>>         Currently it supports Xen Dom0 boot and can be extended for DomU
>>         or Dom0less boot.
>>
>>
>>
>>     I think that none of the variables in the file are specific to
>>     the u-boot bootloader, so: could this class be given a
>>     non-u-boot-specific name, with a view to this configuration being
>>     plumbed into all Xen system configurations?
>     [Sandeep]: Good catch these variables are not specific to u-boot,
>     I will rename and send a v3 patch. Does xen-configuration.bbclass
>     name works?
>
>
> Sorry, I think not because it would cause confusion: it doesn't 
> configure the build (Kconfig), and doesn't set runtime configuration, 
> like the toolstack, storage system, any stubdomains, etc.
>
> It could be xen-launch-config.bbclass though, since it sets the 
> hypervisor boot parameters and also those for the initial domain 
> (dom0), and would be appropriate if it is planned to be extended for 
> more domains later.
[Sandeep]: Sounds good will send a v3 patch. Yes we will extend for more 
domains later.
>
>>
>>     Some of the values defined are specific to Arm64 platforms: could
>>     those default values be moved into an Arm64-specific class? If
>>     the variables themselves are also arch-specific, they could be
>>     moved too.
>     [Sandeep]: Can you specify which variables are arm65 specific?
>
>
> Having looked at it since, there's two categories of variables: 
> hypervisor settings and dom0 - could that be clearer if all of the 
> variables for dom0 have a DOM0_ prefix?
[Sandeep]: Yes we will have DOM0_ prefix for all dom0 variables and 
DOMU_ prefix for domU variables.
>
> Christopher
>
>>
>>     Declaring the Dom0-specific variables as an interface is a bit
>>     unfortunate, given dom0less (and hyperlaunch) systems where there
>>     needs to be a method for providing the same configuration memory
>>     and vcpu values for multiple guest VMs, rather than just dom0. Do
>>     you have a design in mind for the extension to DomU or
>>     Dom0less that you mention?
>     [Sandeep]: I assume dom0 and dom0less variables are same, to
>     enable dom0less boot all we need is to enable CONFIG_DOM0LESS_BOOT
>     from xen configuration. As per Stefano, dom0less is supported for
>     ARM64 today and Stefano is working to implement dom0less for x86
>     and will be upstream soon(not sure on timeline.)
>>
>>     Christopher
>>
>>
>>         Signed-off-by: Sandeep Gundlupet Raju
>>         <sandeep.gundlupet-raju@amd.com>
>>         ---
>>          .../xen-u-boot-scr-configuration.bbclass      | 43
>>         +++++++++++++++++++
>>          1 file changed, 43 insertions(+)
>>          create mode 100644
>>         classes-recipe/xen-u-boot-scr-configuration.bbclass
>>
>>         diff --git
>>         a/classes-recipe/xen-u-boot-scr-configuration.bbclass
>>         b/classes-recipe/xen-u-boot-scr-configuration.bbclass
>>         new file mode 100644
>>         index 00000000..df8287e1
>>         --- /dev/null
>>         +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass
>>         @@ -0,0 +1,43 @@
>>         +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All
>>         rights reserved.
>>         +#
>>         +# SPDX-License-Identifier: MIT
>>         +#
>>         +# This bbclass defines u-boot script variables required for
>>         xen boot which can be
>>         +# inherited u-boot boot scripts recipes and also allows to
>>         configure these variables
>>         +# from recipes, global and machine configurations files.
>>         +
>>         +# Variable nomenclature is aligned with
>>         +#
>>         https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>         +
>>         +# Image Load Address for Xen Dom0 boot
>>         +KERNEL_LOAD_ADDRESS ??= "0x00400000"
>>         +XEN_LOAD_ADDRESS ??= "0x00200000"
>>         +DEVICETREE_LOAD_ADDRESS ??= "0xC000000"
>>         +RAMDISK_LOAD_ADDRESS ??= "0x2600000"
>>         +
>>         +# Xen boot image types.
>>         +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be
>>         loaded by u-boot.
>>         +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be
>>         loaded by u-boot.
>>         +#                Example: xen or xen.efi or xen.gz
>>         +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used,
>>         Example: cpio.gz
>>         +XEN_IMAGETYPE ??= "xen"
>>         +DOM0_RAMDISK_IMAGETYPE ??= "rootfs.cpio.gz"
>>         +
>>         +# Set the amount of memory for dom0 depending on total
>>         available memory size(DDR).
>>         +DOM0_MEM ??= "256M"
>>         +
>>         +# Specify which UART console Xen should use. You can
>>         sepecify the devicetree
>>         +# alias or full path to a node in the devicetree
>>         +# XEN_SERIAL_CONSOLES = "/soc/serial@7e215040" or
>>         +# XEN_SERIAL_CONSOLES = "serial0" or
>>         +# XEN_SERIAL_CONSOLES = "/axi/serial@ff000000"
>>         +XEN_SERIAL_CONSOLES ??= "/soc/serial@7e215040"
>>         +
>>         +# Specify additional command line arguments used for Xen and
>>         this will be appended
>>         +# to xen-bootargs cariable. This can also be used for
>>         passing debug cmd line arguments.
>>         +# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all
>>         guest_loglvl=debug"
>>         +XEN_CMDLINE_APPEND ??= "sync_console bootscrub=0"
>>         +
>>         +# Specify the max number of vcpus for dom0
>>         +# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>>         +DOM0_MAX_VCPUS ??= "1"
>>         -- 
>>         2.34.1
>>
>>
>>
>>
>>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9010):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9010
>     Mute This Topic: https://lists.yoctoproject.org/mt/109713423/3619036
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [christopher.w.clark+meta-virt@gmail.com
>     <mailto:christopher.w.clark%2Bmeta-virt@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------HEpWTzykvCmGnO7e67WWh6rQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/27/2024 4:13 PM, Christopher
      Clark wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">On Fri, Nov 22, 2024 at 9:55 PM Sandeep Gundlupet
          Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
          &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p>Hi Christopher,<br>
              </p>
              <div>On 11/22/2024 8:11 AM, Christopher Clark via <a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
                wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div>Hi Sandeep,</div>
                    <div><br>
                    </div>
                    <div>This series is promoting some of the Xen
                      hypervisor launch configuration from the
                      hardware-specific dynamic layers into the common
                      layer, and introducing a class that defines
                      interfaces to the hypervisor and its guest virtual
                      machines that should be applicable across all
                      architectures, hence my comments from a
                      non-architecture-specific perspective.</div>
                    <div><br>
                      There's a lot of opportunity for development in
                      this layer to extend and improve this area of
                      configuration -- thanks for your contribution.<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              [Sandeep]: Yes that's the main goal and I've already
              discussed with Bruce on this topic.<br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr"><br>
                  </div>
                  <div dir="ltr">On Thu, Nov 21, 2024 at 10:49 PM
                    Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
                    &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
                    wrote:<br>
                  </div>
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
                      a new bbclass for xen boot script variables. This
                      bbclass provides<br>
                      common xen u-boot boot script variables which can
                      be inherited by any<br>
                      vendor specific u-boot boot script recipes. Also
                      these variable are<br>
                      configurable from recipes, global and machine
                      configuration files.<br>
                      <br>
                      Variable nomenclature is aligned with xen
                      documentation.<br>
                      <a href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html</a><br>
                      <br>
                      Currently it supports Xen Dom0 boot and can be
                      extended for DomU<br>
                      or Dom0less boot.<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div><br>
                    </div>
                    <div>I think that none of the variables in the file
                      are specific to the u-boot bootloader, so: could
                      this class be given a non-u-boot-specific name,
                      with a view to this configuration being plumbed
                      into all Xen system configurations?<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              [Sandeep]: Good catch these variables are not specific to
              u-boot, I will rename and send a v3 patch. Does
              xen-configuration.bbclass name works?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Sorry, I think not because it would cause confusion: it
            doesn't configure the build (Kconfig), and doesn't set
            runtime configuration, like the toolstack, storage system,
            any stubdomains, etc.</div>
          <div><br>
          </div>
          <div>It could be xen-launch-config.bbclass though, since it
            sets the hypervisor boot parameters and also those for the
            initial domain (dom0), and would be appropriate if it is
            planned to be extended for more domains later.</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Sounds good will send a v3 patch. Yes we will extend for
    more domains later.<br>
    <blockquote type="cite" cite="mid:CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div><br>
                      Some of the values defined are specific to Arm64
                      platforms: could those default values be moved
                      into an Arm64-specific class? If the variables
                      themselves are also arch-specific, they could be
                      moved too.<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              [Sandeep]: Can you specify which variables are arm65
              specific?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Having looked at it since, there's two categories of
            variables: hypervisor settings and dom0 - could that be
            clearer if all of the variables for dom0 have a DOM0_
            prefix?</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Yes we will have DOM0_ prefix for all dom0 variables and
    DOMU_ prefix for domU variables.<br>
    <blockquote type="cite" cite="mid:CACMJ4GZ7E4Vmuy82HPzh=H+84MxZhvW+nF3mMjVWikTC+ug2EA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Christopher</div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div><br>
                      Declaring the Dom0-specific variables as an
                      interface is a bit unfortunate, given dom0less
                      (and hyperlaunch) systems where there needs to be
                      a method for providing the same configuration
                      memory and vcpu values for multiple guest VMs,
                      rather than just dom0. Do you have a design in
                      mind for the extension to DomU or Dom0less&nbsp;that
                      you mention?</div>
                  </div>
                </div>
              </blockquote>
              [Sandeep]: I assume dom0 and dom0less variables are same,
              to enable dom0less boot all we need is to enable
              CONFIG_DOM0LESS_BOOT from xen configuration. As per
              Stefano, dom0less is supported for ARM64 today and Stefano
              is working to implement dom0less for x86 and will be
              upstream soon(not sure on timeline.)<br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div><br>
                    </div>
                    <div>Christopher</div>
                    <div><br>
                    </div>
                    <div>&nbsp;</div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <br>
                      Signed-off-by: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
                      ---<br>
                      &nbsp;.../xen-u-boot-scr-configuration.bbclass&nbsp; &nbsp; &nbsp; |
                      43 +++++++++++++++++++<br>
                      &nbsp;1 file changed, 43 insertions(+)<br>
                      &nbsp;create mode 100644
                      classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
                      <br>
                      diff --git
                      a/classes-recipe/xen-u-boot-scr-configuration.bbclass
b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
                      new file mode 100644<br>
                      index 00000000..df8287e1<br>
                      --- /dev/null<br>
                      +++
                      b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
                      @@ -0,0 +1,43 @@<br>
                      +# Copyright (C) 2024, Advanced Micro Devices,
                      Inc.&nbsp; All rights reserved.<br>
                      +#<br>
                      +# SPDX-License-Identifier: MIT<br>
                      +#<br>
                      +# This bbclass defines u-boot script variables
                      required for xen boot which can be<br>
                      +# inherited u-boot boot scripts recipes and also
                      allows to configure these variables<br>
                      +# from recipes, global and machine configurations
                      files.<br>
                      +<br>
                      +# Variable nomenclature is aligned with<br>
                      +# <a href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html</a><br>
                      +<br>
                      +# Image Load Address for Xen Dom0 boot<br>
                      +KERNEL_LOAD_ADDRESS ??= &quot;0x00400000&quot;<br>
                      +XEN_LOAD_ADDRESS ??= &quot;0x00200000&quot;<br>
                      +DEVICETREE_LOAD_ADDRESS ??= &quot;0xC000000&quot;<br>
                      +RAMDISK_LOAD_ADDRESS ??= &quot;0x2600000&quot;<br>
                      +<br>
                      +# Xen boot image types.<br>
                      +# KERNEL_IMAGETYPE: Specifies DomU kernel image
                      file to be loaded by u-boot.<br>
                      +# XEN_IMAGETYPE: Specifies xen hypervisor binary
                      to be loaded by u-boot.<br>
                      +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: xen or xen.efi or
                      xen.gz<br>
                      +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk
                      to be used, Example: cpio.gz<br>
                      +XEN_IMAGETYPE ??= &quot;xen&quot;<br>
                      +DOM0_RAMDISK_IMAGETYPE ??= &quot;rootfs.cpio.gz&quot;<br>
                      +<br>
                      +# Set the amount of memory for dom0 depending on
                      total available memory size(DDR).<br>
                      +DOM0_MEM ??= &quot;256M&quot;<br>
                      +<br>
                      +# Specify which UART console Xen should use. You
                      can sepecify the devicetree<br>
                      +# alias or full path to a node in the devicetree<br>
                      +# XEN_SERIAL_CONSOLES = &quot;/soc/serial@7e215040&quot; or<br>
                      +# XEN_SERIAL_CONSOLES = &quot;serial0&quot; or<br>
                      +# XEN_SERIAL_CONSOLES = &quot;/axi/serial@ff000000&quot;<br>
                      +XEN_SERIAL_CONSOLES ??= &quot;/soc/serial@7e215040&quot;<br>
                      +<br>
                      +# Specify additional command line arguments used
                      for Xen and this will be appended<br>
                      +# to xen-bootargs cariable. This can also be used
                      for passing debug cmd line arguments.<br>
                      +# Examples: XEN_CMDLINE_APPEND ?= &quot;sched=credit
                      loglvl=all guest_loglvl=debug&quot;<br>
                      +XEN_CMDLINE_APPEND ??= &quot;sync_console bootscrub=0&quot;<br>
                      +<br>
                      +# Specify the max number of vcpus for dom0<br>
                      +# Example usage: DOM0_MAX_VCPUS = &quot;2&quot; or
                      DOM0_MAX_VCPUS = &quot;2-4&quot;<br>
                      +DOM0_MAX_VCPUS ??= &quot;1&quot;<br>
                      -- <br>
                      2.34.1<br>
                      <br>
                      <br>
                      <br>
                      <br>
                    </blockquote>
                  </div>
                </div>
                <br>
                <fieldset></fieldset>
              </blockquote>
            </div>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#9010): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/9010" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/message/9010</a><br>
            Mute This Topic: <a href="https://lists.yoctoproject.org/mt/109713423/3619036" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/mt/109713423/3619036</a><br>
            Group Owner: <a href="mailto:meta-virtualization%2Bowner@lists.yoctoproject.org" target="_blank" moz-do-not-send="true">meta-virtualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
            [<a href="mailto:christopher.w.clark%2Bmeta-virt@gmail.com" target="_blank" moz-do-not-send="true">christopher.w.clark+meta-virt@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------HEpWTzykvCmGnO7e67WWh6rQ--

