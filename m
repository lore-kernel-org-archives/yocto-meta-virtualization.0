Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF94D7878E
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:31:09 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.50])
 by mx.groups.io with SMTP id smtpd.web11.2699.1732206660283531240
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 08:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=EWEcbyla;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.93.50, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Alo0QACHNm0b46pO4uSSv9H0uedJe6G/x0bweJRqzEwR0e8vM9ibSphXUdMCV1Mq81n3GBspveFGORVHDthKtFWqbQ8fTe2f9uvjOLFmasmkex1UQE+Y0Kawk0gWh49r5fUW6c62O+UjKaLLKQXZvsjvXuIQX6Fh+sS6AYC8kduirsD1+PANhD6ymBzFbGSQg30CLeVzSbHS9R2LqoJ0Ihqm3XwtIhbBb1/gExafWbpEjWmrNA+AaHzHudVaPLAGP+eTD0IMhRFViSDrjWGK/8XdctO+wv/y1n5J5X/ESisHw49lrUmmoxnOqeBQ5xD063D4Qkgqu2Vvb6DukLuE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBGo0o2RXIizz3eYYfCv5PnO1OO9Uwqp0AK/19X/Qy8=;
 b=KXZ1Oh7qs6N/x8dKjye1Nxa3c17zaLEibgfJdGE3yamdbZIW4SgywGa8WPtN4leQ/EqXqBaaqfKAYBGrd4gz61waE0Lzgl1x6CQoVVEEiT8uA9q1yU0tgLoRpW+mT9Miq3iwHaQVY419ogMlmI+cj5iKH/crySD5LxdBs5RkCGs9JZGwZ70wG0MgvPaYeD9nHECJXEtST7RtQT8FwpL8JFS5PaHvRosV5MhNTjHoM/gKrAzB4eLR5VIbNj9wVwf6UbR7zgdS115wkJjsu2+nlpdJAw2bG+VFmoTCK217rnaaO2DSNYOpx63A8SQxmop8HsTy1kOFLOqNOAliRUaJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBGo0o2RXIizz3eYYfCv5PnO1OO9Uwqp0AK/19X/Qy8=;
 b=EWEcbylaIcUcJjbVXl7y8nhyO4VBJbTxsAOC1ErCHNI+jaD59dW1mOwHUAFRkEt+NU8qLDU9B0JcCjjejmgWh5UT3lqGQ+aAEeNJxHCo0jE33OZDvsBAqQT3fpBME0Rr2HiBn2aNleLiXZ6HCM0ztfwCAbnIXpql4P7K96T7QfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 16:30:56 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 16:30:56 +0000
Message-ID: <82c6a709-adc8-4b2a-b2bc-a11cb8d32cc1@amd.com>
Date: Thu, 21 Nov 2024 09:30:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][PATCH 1/6] xen-u-boot-scr: Add
 bbclass for xen boot script variables
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, mark.hatle@kernel.crashing.org
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com>
 <Zz650spUU9SEUE1c@gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <Zz650spUU9SEUE1c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::26) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: d72d4877-b495-4a36-0194-08dd0a49dfc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1JHeVg1ckZ2TTJBcVZDK3IvR3E0Z1Jya2lkRjRzNHB3R1o0UUJTclZwNUpv?=
 =?utf-8?B?bXJZMEovSGRUUjAwNXhWNHppbEdHRGJPMVJrWit1RmRybnYzNlBUMFlydDdM?=
 =?utf-8?B?dWd1cjFsTE1mdzVzVTl4OW1jQzhUWVY4ME1VVGdDV1g5VVA1aFhQbldoWTVn?=
 =?utf-8?B?RGdNMENJWkFsVUtzSnVvdHAyVkRBcWw3U1JtS20zUHhqd0xwWFVxSlc5UmVp?=
 =?utf-8?B?em5XMDh0YWVlQTNUQ3BsSm1yOEdqTWg1QUw4aWFCRjdnRjIzdjBOQWxOQ2FE?=
 =?utf-8?B?Q2hkY1BGMlQyMWk3Z21WSHYvdlIwTzFyV01sam5rN1ppZGlHMjl0RDdOUkI5?=
 =?utf-8?B?ZE12NDJtNlhiS3pwQWU5WGRTdWJBa2RGeHI5amdPeml6dEJVVkI4MFArMm82?=
 =?utf-8?B?YlNvYmRrQnVYV2xobXU1SEZQd2JhQ0dNbDJUcXEvU0RHei9ucVpnZlJzQnJa?=
 =?utf-8?B?Qlg3UlVqRlFoclhFNVZnRjZWU1k5MDJHWUtTaGFaM0tsL0xJNkoyZGtuN3Ro?=
 =?utf-8?B?OHBNbHkwK2pGTHJkSGRZU0NUM3ZCYmxaZGFKVEtXRmNWVkVLaWdsNGtlemQ0?=
 =?utf-8?B?NGtGNXorZU1lM3lMVU5aL3ZRa1E3MUV3UzNlS3NIemcwTmYvRm40SGphNXVQ?=
 =?utf-8?B?VjFWclZWcCtQZWU2bFFtejVVOXhNNCtpOTBad0s2ODZpVk1yaVhsM1d1VDdo?=
 =?utf-8?B?TGRvQmx4dFZUQk9QVkJXZlNLY0RodG1mazVsa0lES2d0NGY4ck12VWkzUTNP?=
 =?utf-8?B?RUFGT2U5Tm5BdTZkUzl1MDVjSElzVjNhU285dXNlVEJwZE0xb0F1cG0yOHVS?=
 =?utf-8?B?REVOYm4zclZwdFMvZnlwbG5XR2xTc0oxV3NqZFg4czd1amlNZnIvTmdEcU5u?=
 =?utf-8?B?NExMZjBjcHdEcXFGd0ExZ1RtZ2ZDTEZ5TU9mSUVZWWdHVEF0QmFyeU1XMjRO?=
 =?utf-8?B?VkRKWGw1akhFNExwRG11S0FlQmZaNVdsOXpOajVCYzJMQldxSmNFNmRiUE9u?=
 =?utf-8?B?OFIwS2JxOXQ3SlFYUjlUUHVYYlYvUVJHWlhiZSt3bXpldmNoSWlCOUljeElK?=
 =?utf-8?B?K2lMUU5JTFV1L08yQzZyUzZINjJ1M2pDQldkWlFRYk95NUtEMStJOXB4UExD?=
 =?utf-8?B?UmFPN1dVd2ozK3NGbDB6YXFnWXZZRkhuQlJBNVdxT21XYWpIdDVSNkpuYm40?=
 =?utf-8?B?RWpMR2xJNStzN2N1Y2plOEZTVVZqM0s3dXVMcnNXV2loZnBGZGlUNHVocmxH?=
 =?utf-8?B?WHg1NzNnYnBtQzNzYmFNVzdMM3p6bktMVmNFMzRRMW43bVJUVVZxT09HcEUy?=
 =?utf-8?B?eUdhRGw3Y1FDU25Ga1lPTHRvc0g4ZGl4c28xNVFaUzh6NTNVKytjR2pHMnJQ?=
 =?utf-8?B?Ylk5cXN6SWRIMXdsWTV4SVRqRlVjM2lWRzh5WXRiZVFLK2FScFhwcWVIVmRn?=
 =?utf-8?B?ckFNSTUzRGxpOC9iRVRUaGpCVkVVTE5ZMkZhaWZsZldRaWhLOVZZcmxYbmFy?=
 =?utf-8?B?YkZDUVU4Y1JScjdSZWJncWVud1NoMFYzVTlsNk5wNzRtSUlJbGVmRWNRL0hp?=
 =?utf-8?B?bE1kWDVkcCtVWHd5bXpqVnRXanZvMUZId0hwdHZVa3JXcjhXNlpGbnN4V3A4?=
 =?utf-8?B?N0J1cDNTV2E1Z2NJNDRza29LT0I5RjBwTkJDTlMvWFUzS2R2Y0tmeTRkSDkx?=
 =?utf-8?Q?cQDb5K14I5FMe5t9X/P3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHNaOG4zMFdiN1E0L2Qyc0t2NXl1NUtIekxrdGVwZWVCRnBKajQwTW9uaUgr?=
 =?utf-8?B?RG1QZElMQmpKVVNnRDF5VWo1S0RoNk4zbS9xaVVuOXdYVlN4eVJCMlJCZUNW?=
 =?utf-8?B?TWtnVzF1Zzd0T25KNUV0NUZ5VTJ6V1lhSUdyYW1VdGpEdUtlbWtPdG1wNXhr?=
 =?utf-8?B?eGpXemtIcEtPWVl6UlVmc3lxVjNKcy9nZERPTjR3MmdDdDlPQ0lKNTdwcVp2?=
 =?utf-8?B?MGFOTnB1TjRsUjlVcjRFdUdWUkdlSXh0VVZKR25ZdXVmeXRydTZ3V1VhVkJj?=
 =?utf-8?B?NnJRTWlCYll4Q09Zc2NkVkdiSlY0a0lZbHZsNE5SK3E5VlhPVXpHMDRadzgz?=
 =?utf-8?B?YzhCekppWmFJMnE5OU05SjIySUF1NnpTQjFSUEVLOTRZRDZpODNmVUUzc095?=
 =?utf-8?B?WEpQbE9xYUwreFZHamR1YmRkcHFtZE5UTEZKZVQ5Z1VGbU5HUm9oR1hYbzE0?=
 =?utf-8?B?VTNaNVV3ZGFuRmFNamhic2dqcFdzS3JQWEJLMjViVnlCRzRVU1JRNTAyWE9k?=
 =?utf-8?B?YUVzWXhzQkFaOXBYUDZlck93akdLcENreGxZSEQrVGFqU0ljTG1zMEFTRXY5?=
 =?utf-8?B?VXRUUWNMa3ZjenJjeTV5dGRBSjBNSWZTeU8wQXN5NGpScDVaVkd1TU5yaWhF?=
 =?utf-8?B?ZENNNHAySEx3TXFOa1RHN3BLYmptUm9GZXVDcEpDcmE1K05BK2JtcFVUaWpt?=
 =?utf-8?B?Y2VGUDVwS0xaYTMwRXd6ZHZyTG1LdzcrYzdPZmJ0K3NNeldRNWhKcytPczNq?=
 =?utf-8?B?UVR5NDBsQ0R6cnFHdmpPYWMzc0JjSHlOM0MrMThBT1o1UUFDRmRXSWs3YSt0?=
 =?utf-8?B?RlhYbHFWYVdHaGFqUENJUVRoZGpoUGJKeGhoYmg1REhUQm9zT1VRYXo4clE3?=
 =?utf-8?B?azh6SW10aVpTQWpZNkd2bUxGZGt1TDZiSFFWWWlQRmt2SzZUZFovT3lkYzd2?=
 =?utf-8?B?Zk1XeVk3UlQwblNkZHFCcjVGUzBXU0c5eVRwZ25WaVcvUU56bnFLUEJya2tz?=
 =?utf-8?B?WnVvUTVRRWQraW8vTmpmb0o2RzRnUDJZSFFTVUVGODNkaEo2aCtPSktpZzE4?=
 =?utf-8?B?alYzSHg0MXdnQTYvV1VPT21YSjNZYlN0akx1WUVOVkNKekQ2aitiYW5rbWhi?=
 =?utf-8?B?ckdXZlZEMXRHR29uTXJMbEd1a1FWL0tzZlRsbHk2aVJZSlhSRlp0TzNOZkdi?=
 =?utf-8?B?NVBxcXlxdWgwV2FDR05USUtGREZKdE9Kai9wWGJMYVFhOGR5b1hpV3dkbDA3?=
 =?utf-8?B?ZVNsaTYyWXZHMWw1Ynl3ekdWbWYrVW1vWWpnWTd0dWhZVFNOeWlIRVpGbE5Y?=
 =?utf-8?B?bzhodjV5a3lnVllLTVJxWEpVd1JXSG4veEZhVWVra3NaVzlDRWZzMWljV0ND?=
 =?utf-8?B?QnBOTUJkUlZ4L0xVVlVzaVNDWHdKdy9ERVp5a1V3SEt6Mk1PRXR2QmFWdFdN?=
 =?utf-8?B?Q1J0Sjkxb2lUNGpzZGN5SEtaZnRWNm5FVXlEek5sRURGWEgvK0locHN1bW9D?=
 =?utf-8?B?aUdLS0FFTEQzajNHRFdySmxxdTd0Z3pxa2JYUklGTVYzTVUxMG1xdUZzelFN?=
 =?utf-8?B?dENRZkQzQzFwYXNVMUJvQkkvOEpsZVJiU2wxaHRsYnliaE1PU1hxNXczaEFI?=
 =?utf-8?B?MjQ5c3BUaUk2RHFzSzRxeGRTM1VETGtRVXIzdmJRNmgzcVZRbmcrWjlHUTJN?=
 =?utf-8?B?MDdIQ2NYbmsrd2IxWE9QTjJ4UUUvRmd2eVMzOEhRNlRYbkNVdlBiRWR2eENV?=
 =?utf-8?B?R04wbzZuRUl6aFViU1E2SjE2QWlnaWJsbzVidS9qbFVCNy90TVZuYW83QVM2?=
 =?utf-8?B?YlV2WFVodXRQMkxpS1ptdENCV1ZzZUIwSUpURzFqRXNQdlZFZUM1dlA4OTdV?=
 =?utf-8?B?UGJab2FsVVBGWlkxWXR6TERUSlM0elVPcmhzVG42OGtCZmR4V3JtTVlycDVM?=
 =?utf-8?B?V040YXZGK0FRWTZiNXl6OHlhNyswNWlmNmtsY0VoUCtXYnVVNDR5T3hyVENp?=
 =?utf-8?B?WUEwUTU0TWZtRC8vVkhESjFjZ2FPaGpmTGdnTXV2ZkdWcXRLTzhzb2hzOGIv?=
 =?utf-8?B?M0RHNDg2Nm8vZyt0ZWxUUFF5YWhwNEtLMWxtRzNKNzR1VmtvNzhsbStUOFZp?=
 =?utf-8?Q?bhDFqqNG7oqv8cqoYFLN1VORd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72d4877-b495-4a36-0194-08dd0a49dfc2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:30:56.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkRUu9WPlsyf/uuHifE9QTpYixAbnLw8oIkIO3G5G9+1fTRppR/mAX79Gt7IaRqKD7X+hjR5TANcohB3LkCb2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 16:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8997


On 11/20/2024 9:40 PM, Bruce Ashfield wrote:
> In message: [meta-virtualization][master][PATCH 1/6]  xen-u-boot-scr: Add bbclass for xen boot script variables
> on 18/11/2024 Sandeep Gundlupet Raju wrote:
>
>> Add a new bbclass for xen boot script variables. This bbclass provides
>> common xen u-boot boot script variables which can be inherited by any
>> vendor specific u-boot boot script recipes. Also these variable are
>> configurable from recipes, global and machine configuration files.
> This is this just for configuration, I'd prefer if the
> class was called: xen-uboot-scr-variables or xen-uboot-scr-configuration
>
> That way when I see it inherited from the recipes is it very clear
> what it will be providing.
[Sandeep]: Sounds good I will send a v2 patch with bbclass rename.
>
> Bruce
>
>> Variable nomenclature is aligned with xen documentation.
>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>
>> Currently it supports Xen Dom0 boot and can be extended for DomU
>> or Dom0less boot.
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   classes-recipe/xen-u-boot-scr.bbclass | 43 +++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
>>
>> diff --git a/classes-recipe/xen-u-boot-scr.bbclass b/classes-recipe/xen-u-boot-scr.bbclass
>> new file mode 100644
>> index 00000000..df8287e1
>> --- /dev/null
>> +++ b/classes-recipe/xen-u-boot-scr.bbclass
>> @@ -0,0 +1,43 @@
>> +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights reserved.
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +# This bbclass defines u-boot script variables required for xen boot which can be
>> +# inherited u-boot boot scripts recipes and also allows to configure these variables
>> +# from recipes, global and machine configurations files.
>> +
>> +# Variable nomenclature is aligned with
>> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>> +
>> +# Image Load Address for Xen Dom0 boot
>> +KERNEL_LOAD_ADDRESS ??= "0x00400000"
>> +XEN_LOAD_ADDRESS ??= "0x00200000"
>> +DEVICETREE_LOAD_ADDRESS ??= "0xC000000"
>> +RAMDISK_LOAD_ADDRESS ??= "0x2600000"
>> +
>> +# Xen boot image types.
>> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded by u-boot.
>> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by u-boot.
>> +#                Example: xen or xen.efi or xen.gz
>> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used, Example: cpio.gz
>> +XEN_IMAGETYPE ??= "xen"
>> +DOM0_RAMDISK_IMAGETYPE ??= "rootfs.cpio.gz"
>> +
>> +# Set the amount of memory for dom0 depending on total available memory size(DDR).
>> +DOM0_MEM ??= "256M"
>> +
>> +# Specify which UART console Xen should use. You can sepecify the devicetree
>> +# alias or full path to a node in the devicetree
>> +# XEN_SERIAL_CONSOLES = "/soc/serial@7e215040" or
>> +# XEN_SERIAL_CONSOLES = "serial0" or
>> +# XEN_SERIAL_CONSOLES = "/axi/serial@ff000000"
>> +XEN_SERIAL_CONSOLES ??= "/soc/serial@7e215040"
>> +
>> +# Specify additional command line arguments used for Xen and this will be appended
>> +# to xen-bootargs cariable. This can also be used for passing debug cmd line arguments.
>> +# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all guest_loglvl=debug"
>> +XEN_CMDLINE_APPEND ??= "sync_console bootscrub=0"
>> +
>> +# Specify the max number of vcpus for dom0
>> +# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>> +DOM0_MAX_VCPUS ??= "1"
>> -- 
>> 2.34.1
>>

