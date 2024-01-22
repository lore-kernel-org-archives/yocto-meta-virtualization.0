Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6827AC47DDB
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 02:25:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64131.1705890347403233371
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Jan 2024 18:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fv90mHwC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M1BD2c001209;
	Mon, 22 Jan 2024 02:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=/9IOQm/25VRRH0r5OUFXNTXSBGuoXhgqNozIZCr+D50=; b=
	fv90mHwClGn9AqhzrIYKGbZ0sEyg6dvr5vhY0eBSJ2XRoyvgbtWOHiR5D40CtD5y
	EZII0nlS4nkGsYzbq3DYwPyBpvSd4X3XafJuIkqqanLKBg1Ke6t7xS1UGHLcM0VH
	Dc3/Qpa99Gv0VZoPXwGRNnQtRhOMaMVyUD9lkhGN41G1HXV+3/t8+ySlk4VryLN7
	Lz2FLTeJ7/SLIIApwbv/ccMMazhHUMu3FaD9F2kkRsWKbVd6AW6pqtsHErOFbem4
	Xy11pBu+UBCm2NJ82rt290ERmMEjfI4knbMYw1f8v6Zp+xoB7zz8c90XY5I96Vkz
	ZNAdJZ5tG+3pLRALgJ1d6Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571eax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 02:25:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcz2QweF4OqDk0+2YC/tDmnET9xvNdKDqY1n5L9iBgCp1ArbRFSWy6GaRkp7+wmnMe7aOZ2UHWpuh0IlBQK8yPyo6k6VyGI2py0KxytMRxk+rXfqw1JL/iTNkq2CrBbxNznqEzMo/emSFM+nOJKSL11sPYorLDfAv3GFChquGFga8NfUibjlFLMFi0+lJXflYp76rnC2fptAZrlbTbuGTcw+6wQgAiAfiKBqdujQfwSdUs1Ml09jBW0IjpUT0gh90EQmsAl5ols6pekNed8CpWZXWLdz2SYAC1rkuA5STIgTKyChyS/4GZPpkTnhmHQf6gPkSCcai5E2jClmaQKEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9IOQm/25VRRH0r5OUFXNTXSBGuoXhgqNozIZCr+D50=;
 b=PSJQNvzHeBPZub1O3YLars/eHkxH/N/dgFERV4LHCYCP0fcHMNhStt8Xkevk11nh8i9J3mNV7uWEAeJrsx/0id4ngbXbeFyOPdO9BohGVMjSvhB3isXvB2iMu/MqhWZlY/nTluNJhkzC0yq/dntLbBSx7KiJnRXFLEUfB6soX1VHdSrlf/VfJcXpIIDkgZg7uzcN4w5Dx5M/+puLBSbELVSa9MdjdQYjRmsPRAA9jAb9DgLW51KiltjLXQZU9Xkn3ozZL7Y2SOr35188qJHEXkIOq/RIcqyb1WTZz3TLtC1AZHTm93JaHJSSCqEFD685fKnq3lsyHs4rh/TiwM4IFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 02:25:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 02:25:41 +0000
Message-ID: <ecfec516-81cb-ff72-c431-75613153b3ff@windriver.com>
Date: Mon, 22 Jan 2024 10:25:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH] buildah: fix branch name
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240119070916.1243692-1-Qi.Chen@windriver.com>
 <ZaqKTbejpqge4PCy@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <ZaqKTbejpqge4PCy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: f740118e-9804-4154-b66a-08dc1af16e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/PdsWA07SImVQ+u5Y/YzbNqMpK3n9J1LwQNRaW07oyprinVveKGFgw94b1oZ9lZ2/jA18zYZyjCUZI9mETXSCJOH6HSm5d1MFjScH3Tq3/yjyeweT7XJrmnZQda5yX8kUZqgxCHcK9eRLgdwZjgpduSfDlOpiLDRtkSg9q6vuulWeYad9FIhOmlKHmx30I7cp2YlMAwNVON3qQRDC8sVt8+BagbrizMHMX1vWBNHhT1KTZkpbShkry2BEq6y2qcNJ88Cv+TRfP+1v1cKZzc36PO/swPIrkbQK/htB5WBhLHDCypFxHP7mO/TKaq4rxz/Z2F5yBI3ts5jEKODwBr/q2SlrbIF23On2NhmibIjykVVSrFHDNyzZezxe1Lbl4TTFe3tD4/bvuXpYghTYHhMwrgXhMvpPy6rAx40ioWYHa5LHIVsDN7g/ajT96/dSqitHQG+LIqhIxNX1qVbyDF52Gu9Df0RqscQDOwnqfOMv5qUKSXlqOBBVaQjmABKJZcx/3Qt2EdFbHKwGTXGHNi3xT1WJfk9CGwpC2QaSL0/9ruNn6n+ff+2sY+LKCGrwRAwtDz6eaxThY0G/fs2vpGiY2uFYFKk1PTHtnua2jlx2Oaaw5nzZvNqpVphELBJ0FCL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(396003)(136003)(346002)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(36756003)(66899024)(4326008)(8676002)(8936002)(2906002)(5660300002)(41300700001)(26005)(2616005)(83380400001)(6512007)(6486002)(966005)(53546011)(6506007)(478600001)(6666004)(31686004)(38100700002)(6916009)(66476007)(66556008)(66946007)(86362001)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVJFY2Z1QmJQYlpEbDFMSjBYc01mUkljb3ByNFFEQnZ2TXY5RHIrR1RUK2lH?=
 =?utf-8?B?UkpRVlAxMlRuakdZSkxBa2xPN25kYTBTSWo4THpxbkZsM0lqb0pLZWZjcWxu?=
 =?utf-8?B?dGkzSUk0QXI5dlRkbmNpUHY5T0d2N2hIYUtoSlhZTTlPb2p6VG5kSlBLUVdG?=
 =?utf-8?B?MlV1OUhKVldCcW9QZTVCZTl2TzR0emdydzJRRlk5clIvRkltZ0JOMFFqOHI5?=
 =?utf-8?B?eGFmVTRHZU9WTGVKWTNBRVBHM1QrU09iWlpSVUtFVUlLckFQdjVMOHQzcEpa?=
 =?utf-8?B?ZDJGZkFDZllRV0Uxa2kwaDk1OVFsaEQzRVNLZ2FKQVhYNTMwOEJ6RlRuUlR6?=
 =?utf-8?B?MnM5MjBWbjhLOWtOdWRjSjhJNFVzOEV3amx0QitpS0RxaFc5ZjZkM0NNYkc0?=
 =?utf-8?B?OFVJQXhsU1V3YkxLYlFpeVRPRGZYRk9zMXZISXpWSWoxMEQ1by94ZU53b3Y2?=
 =?utf-8?B?ZUt2VXY1Q2NrQ0RvQWhZRVpiYWwwNGJPT29sTngzR0ZQYitSMm10NHdFbUlM?=
 =?utf-8?B?eXg1QVBmK1B3azdUVVhIRzVMQjRMUitiVlFSNVhTMzRBTkFkRmlRZUwzMjFF?=
 =?utf-8?B?Q2ErQ1pIYVQzR3NZY1BGQW9Cb05zajRUb2ZWdDFkcFRyd2pTS2xJT0dySjhV?=
 =?utf-8?B?NXhraDB6bE42RHBkTmJmd1ZxOFVQNG50RUc0WlFwRkhhbGxYS09wSWw5MitC?=
 =?utf-8?B?M04zUUlNSFFkbnpJM0FmK2FRWjlqSWVBeGVuN0FNZmV3eWlwTjUrVlZmeDRS?=
 =?utf-8?B?OU5mT1A4eFRLSTVGZFdQNmc3aTJ0VmVEeTlYdE1JVHgxRDZpNGl2cUxxNndC?=
 =?utf-8?B?b0NpSlpWWmdrQWtsb0VBZG42ZFNyM0NOWmJkTkE1WjhZQkNDOU50d1lCa0c5?=
 =?utf-8?B?TjVJQ1FWaUkrRXZBSzNjcUh4ejJldW01UStQcE11MXZrTjdIRk5IVDg5aHdm?=
 =?utf-8?B?cmR2d1FhZkR1ZHdlaWdKR0drVWppTFRkSStuWTkzOHpnaVJuT3lZTzhaYlJr?=
 =?utf-8?B?M1ZTcFZkNGJMTS8wR210SEhjWmxDY0pXTCtqajRkdElFWDZLczRYOGExYVRm?=
 =?utf-8?B?ZUtZTkZGTjYvbFhLVEFQVGJvbndlb0F3NkZNZXBEenZDOVFmcmR6Qk92Q2hH?=
 =?utf-8?B?U3RONjF5cEFrQmY4bSsxa1hTaE9rTEc0YlZGZFRJTXZVdGhaZWkxTDNjQ1JB?=
 =?utf-8?B?eW5kY2xkZ1ZIVUZCMlpOem5TQ0FvRW1zaFdGRHRiVUw1cWRxNnd3R1ZFUFFj?=
 =?utf-8?B?SWlSaCtoL2Y3d3JVT1pZbmxlaC9NWVhkdEJZbFN2eThRM1FPU2w4bTF4a2Uy?=
 =?utf-8?B?OG82SHl5UDdpMmZ3Mzc1Si82SC9mbGRiTjU4RFAvNUFDRWlJZW0vREZFdC85?=
 =?utf-8?B?TUpoV2s0YnVxem5oS1NCRm9CdThmVmRXSjcvL1Bqdm9ndkxMSG9ZMVJPSTlm?=
 =?utf-8?B?aDd3aVM4U21zUE5sMklVejVvaG1DWGk2OHZtdmNxeEJtTEEwWXJQMmpLVHBU?=
 =?utf-8?B?OXdja1dyZ2tuMHViV2FyV2JHMFUwVW9GNE00Qi9UYmJSRm9oc2lucFJPY2I5?=
 =?utf-8?B?QU5zV0tNcUxiRUFJcEJnZk5Cdzl1eWFXNDFQaVk2bytCdktBOEdDNG5mVU5T?=
 =?utf-8?B?RXgzN3lYMGptNkFRK2tra3VRaldMditmdWJsSHRMZ3NqbGphMGZ0VmNQd3N6?=
 =?utf-8?B?NE4ySVFYR1dNd2Zpb3JubkdkTU5CNjgyaUkzaW9XZFNSUVZldHM2NUpGMFFx?=
 =?utf-8?B?dXo1TExWNWhzZG5Hc2JnK1NyTDlPZWFIRnFybWJ5NEFzQlQ3THpqREVvVFlx?=
 =?utf-8?B?dUN6a3hWeUU2T3Zsbi9WZ29QaEU4SW1YQllabFJ6Q1R6QjdTNU0vSklPNW11?=
 =?utf-8?B?NE9sUXVZVEU5bGlkeDFBZ3RBSHBZU1ZxM1NhcmdsaXc1WHlaWmhHK0dnbFB3?=
 =?utf-8?B?d1FRQjN0bVc3NlBhL3JaSElYWHRkeXJkL2VIeDRaNmdybnJWdEpBb2E0VXB3?=
 =?utf-8?B?dmd0SnVCZGZJT3ZxYlplcVVjQ2ZPQ2liVEhJSC9qUG5TWXdiWnMzSHNHblF5?=
 =?utf-8?B?TGpCVVFUTnNmVEpraDNBYkRVYjF1b0FJVUNBRkFsQXBybnFjeTNFSkEzbjMv?=
 =?utf-8?Q?YC71Qbc2sXc9UjAW696V7sr8s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f740118e-9804-4154-b66a-08dc1af16e23
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 02:25:41.9176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Noes8JIjHUQ+FetSDkvhgh8l2PBumr+j39L3UWXHspu8cGE14O2YX7QU7Gyk/+fLeWTPZhutCsuNN6hP29ngHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5514
X-Proofpoint-GUID: QgXXnIim_7Y3rcmcjO6ay52cCZJcC500
X-Proofpoint-ORIG-GUID: QgXXnIim_7Y3rcmcjO6ay52cCZJcC500
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jan 2024 02:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8550

Thanks. I've fixed the my email settings.

Regards,
Qi

On 1/19/24 22:42, Bruce Ashfield wrote:
> projects that delete branches are one of the most annoying
> things.
>
> I've taken the commit and also pushed an update that I had
> in progress.
>
> Also, the author in the commit was invalid, but I manually
> fixed it in this push. But you should check your enviroment
> and see if anything changed.
>
> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#troubleshooting-email-issues
>
> Bruce
>
> In message: [meta-virtualization][PATCH] buildah: fix branch name
> on 18/01/2024 Chen Qi via lists.yoctoproject.org wrote:
>
>> The branch 1.33.2 is not there any more. The correct branch for now
>> is 1.33.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   recipes-containers/buildah/buildah_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
>> index d3ccc920..f04adca9 100644
>> --- a/recipes-containers/buildah/buildah_git.bb
>> +++ b/recipes-containers/buildah/buildah_git.bb
>> @@ -32,7 +32,7 @@ SRCREV_buildah = "8be6786d5ed1f07387acdd30d52fc07cd1b4bd0f"
>>   SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
>>   
>>   SRC_URI = " \
>> -    git://github.com/containers/buildah;branch=release-1.33.2;name=buildah;protocol=https \
>> +    git://github.com/containers/buildah;branch=release-1.33;name=buildah;protocol=https \
>>       "
>>   
>>   DEPENDS = "libdevmapper btrfs-tools gpgme"
>> -- 
>> 2.42.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8546): https://lists.yoctoproject.org/g/meta-virtualization/message/8546
>> Mute This Topic: https://lists.yoctoproject.org/mt/103825803/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


