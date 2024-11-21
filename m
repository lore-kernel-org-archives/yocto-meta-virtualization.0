Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C3FD7878C
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:28:59 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.52])
 by mx.groups.io with SMTP id smtpd.web11.2639.1732206533296961820
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 08:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=XAvZtmPT;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.102.52, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EILNLYxJxSqOgunJk7h5guM3BNCy6onF0cWayeQHuMaJDHmrwVjRjVzpRA6ChEWVJG1GyEttBhyiKeuEJOAo0K7a3wJ/qjfjFkYbxiHeMN7jjG8TssqrN+x5LOXb+tmLN6+AF+A/Jj7pct/hM8VoAkHcsX6IVUYH8JysloQ8/gf5WI6K9qbx0Tht+c0oURd+HqsvIyd6yKG/fy5hdA6Sb4QLmDjde5nojoxzG6Bpia8jqkenfB2pa2DsnWa3+oD8HyBHbdMPuVArYYRFKXUFy5hUhnfdddTjLuHppFj2qhcv0pyBXpTf46upZe9kxZa6EgTPhqxewCQMspHSDAUAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeuhykPMZg89pkd6pFdf75SulknQa3Q309sFKmgMGek=;
 b=SmQqc+ythqylUynT3HFn20Fd1+TDmHLWLF+4wFbL52+gSXlhe9XQ5zV/NfNr3yLuWGZ2cPPBO8hU7DOg3Ma/yCQJ02lAI9Sl1QuFgA87FQnej0v3Fze0RekzzKH8QhwQMI2a/F0Z5XmlZU2u5rSJ72JqM2xQnuMN6ielGnpVf2VKq2s22FCB7WgUGkJSv13KH/pr0R02oB8mxy9YqRo4Dn5n1R+6kG34e9BI/ugnovnpLH3CSA1ZU2MoFYOWqBEjrMp+D6dMm3D6HTrDsDiAOZSLazNpms2hK1n2AcqUB86uR/F+PcqYSMoLpLbC5oISvm039cUCBV1TTM5WVDro8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeuhykPMZg89pkd6pFdf75SulknQa3Q309sFKmgMGek=;
 b=XAvZtmPTDlSiaU8Ey9JtPO0Q+l+4xTc3FquUxOBeeDclmADNoc6E/eLXhoUz9hYBpHK/fmqErgNrjiHwqacZMezsHa4tVMrIFYvXISMvFW+bKEWv+ycF5Q+XP3I8wCTr1ulSCZk4mYFb3xr6MzqM0NhrBduQpeqFy33JHINnZKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 16:28:50 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 16:28:49 +0000
Message-ID: <3a52f570-ec67-40f3-aa13-7be24ba2b229@amd.com>
Date: Thu, 21 Nov 2024 09:28:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
 u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
To: meta-virtualization@lists.yoctoproject.org
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com>
 <Zz66Tw7AuYZ5eTpC@gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <Zz66Tw7AuYZ5eTpC@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:610:e5::21) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 11eae28f-9c33-42e6-162d-08dd0a499487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2JRT2dCbUtGTk14SVRMVHVkSVhEbVJ6a0ovdHRXd0NLTjVpK1BZdnVDaXZD?=
 =?utf-8?B?N3B4TmtyR2k0Q0ovSmdRZmJYaWw3SGVCY0lOOXJ2cThHYXFlSTc1UFZzOWNM?=
 =?utf-8?B?ek1BRnlCR1NsVVJSalhrTmlXZzI5L1dQN1oySzRtQ0RlMjB0NHNzVWtHV2dB?=
 =?utf-8?B?YTRkaE9ua2k2SWpsNUNkVU92QWFZR29YYm1lT293by9YSzdvUE9VTXAxc204?=
 =?utf-8?B?WGwxSG94bmR6SDlXNmlTQVZuMDU2by9oNHAxbUhqcXdxN1ZDV1BvRlB6YVZO?=
 =?utf-8?B?dzM4S1RpVlZHc2NmYWhnaExiOEpuMVZNZVpoWVp0QUVEcWxIdXh4dmcrQlpQ?=
 =?utf-8?B?cGhraDI0aWM4MEFiQ3VMd0JrQVNSNHN6a2ttYzV5Q08rYU1hakdFbk82UVNr?=
 =?utf-8?B?KzJtZkxjTGp0czNmMk1vUGsrV0Uwd3VlNjAzTXBrNVZVZG9YNVZMZWZiYmFR?=
 =?utf-8?B?UkFEOWFxWkFiZHVkMmxubjg0OGZzNmpCam9kZGxMRjE5czFKM29jcmJjVmFE?=
 =?utf-8?B?K0VaYjlLeS9hQTFtdk9MRHk4RExEVkJKU3lHQzZmck55SktMTVNJclRCOFNm?=
 =?utf-8?B?UHZWZEhCTWRGL3MxVFVEY2tyVWg1RDd5Ukg1ZGtNdmFmeVFOMHFKek9GTGxy?=
 =?utf-8?B?NjNaNHBEaFZqT3pCRG9oZ1VnMzFoVUhXSTk4Z3pYZnZkTzhWdU9YRXZmUTNR?=
 =?utf-8?B?WUIxRWp5VzlmVERoY1JienpNWTNXVzJBUXBhL2hQMnNkUGtCTzFnZzU3MlhJ?=
 =?utf-8?B?WGE4YUR5TFNMRWgrL1hVQTA4NWl3d0U5Q09CMU5WMWlYUW9NT1I4YUUvTFY0?=
 =?utf-8?B?RHpyd1FhSTlqeFBDRUZRRE5STVl0UFVVN2FaSHBPSTFZVnZEdXBsVmR0WDBJ?=
 =?utf-8?B?SjJJYjZOc29LcC9aK2EyeWFVdnI2akg3UVhwd2k5V09XdEhUaFZSZmwwOUhV?=
 =?utf-8?B?VTJrT3NIZU5zdHhXd1cxWmdrd2o1N0daNjk3UFdKUWYzZ000djZlOHBVM2FL?=
 =?utf-8?B?ckJEMEJkbjA3WXgydDFXaW45OEF3TkJHOU9qZ1diamtDOTdGVk41bE1kTUx0?=
 =?utf-8?B?ZWwxZzh2VkdvM1luVXl1YjBkWFJrM1QxNmlyaFBubmhiQ2t2NjRVV3VsSjlr?=
 =?utf-8?B?MUtqQXpITlRzNWp5R3dGU29lZkVudzg1c2FtWmZLSGZGQzBkMTZrc0dkTjNN?=
 =?utf-8?B?KzNmeEorU3hpOTBnTDV5eUExSkVNN3Q3dHJHRW1hbU1SUithRFRCVC95bTBP?=
 =?utf-8?B?OGZvV2dtZVB2blUwSENIOWp2WjZ4cGoyL2hMVFdhVzBUWlpTaTBJTjZ2VVRv?=
 =?utf-8?B?OTJJc3hRaThPTXBtQlJlUlUzclFoYTZWQU5nMlVyRFNLSHlZNHkyZUsxRFNk?=
 =?utf-8?B?cFN6ZzlpS0hNb09JQTlQaFhTc3dmSlA3OHVsdnJsOENLdmI0OXd6WmhlSUJG?=
 =?utf-8?B?TlgzTXJUMFVkUGY3Ukx4S2dJRDgvTEk2TUkwMnVSWnphc1NvcTdGeGlLTXRk?=
 =?utf-8?B?a0k3YVYzNzgvZFNhcisyWUxORGZyeE9UTDgrTzZGUEJNVmlTZnpxQ2F4WFJy?=
 =?utf-8?B?eFllcGwwMXZQZ2xVT2YxVGF3cTVyeGUzTy9sYzlKbE5NRnhENmZsenJxcnEx?=
 =?utf-8?B?U0NyNStxMzJ0QUowdGVmVU9yRVZRTjNBMG53Ukd4NzJLZHVXWFR6QVhEdHNY?=
 =?utf-8?B?d051OXVqaWNwcTJUTVhVWTJ3cVdpalBXWTA4MEFCWkwrU1NwTGU0WVJBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R21kUXd2V3BKVDlZSHFtWFdDaEN3eG9iUXNLTmVkWlM4aHBUWkpoaVQxbnhj?=
 =?utf-8?B?bVh6N3IvTkJJaS9USGJmeEN5cFM4NTF5YWhyREh1MWdqMWFSOThTOXVrTEh5?=
 =?utf-8?B?aGdJK3JneUhTeCsyQXhPeFp2MmQ3dXA3b3FheHYzSlNEMFZUVE00Z3MzTUw0?=
 =?utf-8?B?T0ZXazJvNXRBZEEwUzYzNEVJeStFNFpIRXk3T1hSY25HcDVEYW5vUThubjJP?=
 =?utf-8?B?SmdHLzQxRENWMVlJS0N3Z1FuRktPVG5SMlhhREZvSnZDOUZ3cDZ0dmd3bWhU?=
 =?utf-8?B?bDhmbzhNNTg1aUJiUUNnVXNjZDNOcFZ4QkRuT1BkMXB3QklRQUcyak1qUGs2?=
 =?utf-8?B?RUUxYmZNQmNzL1l5ZU9lT1BESkxXQUE1dkVlU0tzMTg2QzVoQ29iUk5COHZt?=
 =?utf-8?B?S0UrM21uTkd4UWMvRUZRV0dKODdvL1h4Wld3d29WeHlQUUZDaTNsRGF1K0ow?=
 =?utf-8?B?ZDFRajI1QVpzaFh2U00zM2FxZEJ0WHlFRTlQSy9Ed2NSOHlIZUFqU2FQbG1o?=
 =?utf-8?B?SStLT21Zb01mLytvN0xTYWhVY09lWW01L1BvTUdjd0poelVRYk1mOFp3b1or?=
 =?utf-8?B?a0pkOEFPNG9QVWdlTVZpNE51YnhXT3NIOHI3cDNWWHZLMUREMlZERmxoZjRl?=
 =?utf-8?B?ZkFNTEhXVUVEVnpKN2VlNWxkL1lSRExuNWtzQWt2dHlYcHMycFByMUZBY1ly?=
 =?utf-8?B?bFJVR3BKWTRKRFcrdHFPS3NHNUMvZUVHcHJ4dzdjVnQ5TytCcnJ4eU14NXpR?=
 =?utf-8?B?dDJ4bTNESUU3ZGdLZUd0L0Qya3dpMDhUN0pXUTJLSWMyYjVhYmN3T3ByR0Rl?=
 =?utf-8?B?bzBQQm1wV3BVOUZYV3B2TTY4dWp5MVVSL1lwTWJvcFlPKzlsUkFPV0lVdWFx?=
 =?utf-8?B?b3A0K3BjVy9WYmRPVEdhK1lCTm1GOHNKcmFiYlgyZEZVTDJteXpvSGZPYTl2?=
 =?utf-8?B?c3dhM1kra3JUUlkzdXZNdDMwM043dE5PMWFRRS92N094dzlCRW1IZVdhQzhT?=
 =?utf-8?B?ZWl2bVE3dmpBL2xObFhHTjc1NVJFN2U1d0hsVjcvN3M0aHZtN21RNHFqWXZq?=
 =?utf-8?B?SkdiTjdWUkI2V2J5NEFOZkpKcjJLSWE4c2pJTGpUM1N0TjVjaENpeFhSbWRS?=
 =?utf-8?B?WUlEYmRzZngyaFRqWGd1Mjl0MXlwMDBaUUlzdkEwNXVaSmVWYmJ3RGkyb0c1?=
 =?utf-8?B?U2I5VzE4Y2p2dHZQL1ZBRkRYY005K2gxNGhCcXRLVXovVjFIR2RpamVRSGRZ?=
 =?utf-8?B?enRmdG1LNGN0MFVaSEdXeXpGUVhKVjd5TVIyejZZbzY4Yjd1Qnp1ck8vNUNF?=
 =?utf-8?B?aFBCKytHc2NDYkNRMmhudHVFdlYxeTA3aThlazd0bmRMWEo0MXFoTlNnYXhG?=
 =?utf-8?B?WWFLZ05CUVZMQUo0MGlpRjM3MTM3QjNzNWVUR3VCM2JkNXYzc0c0cDRnSDVD?=
 =?utf-8?B?eWh4R3BhT0VVZFNEUWtEeXFWdm10cUdITHlobVd1N3ZJN0xlUGlLWjhNNmRE?=
 =?utf-8?B?Y0JjMGdJdDNncndhcmc3ZHJTbm5nbG9zQVl1Y25heGtBZ294ZjRjRHdGRE1j?=
 =?utf-8?B?OUltY0M4L2FDSjlZTVE0Z2I0NDd1Qnp4ZXZJRWc2M0pNeGVWUDloelFGaTVo?=
 =?utf-8?B?UkZSRVZqQ2JUTXM0Q3FZUE9IUWNwSWRxZ1o1Q2NpOHREeTl0RUpwdlVVeVJh?=
 =?utf-8?B?TzlTQ3RSaTJGcUpBTHdSYlBWZDhrbXUvUFRpWDBDT09pR1pIVFlyTlpHcVVG?=
 =?utf-8?B?bU9aQ3doVXVaNkxjVXpvS0RIZEV2TU8yTEsrZTJqZEhHYUhjdXZiaENCc0FJ?=
 =?utf-8?B?dzFxOWgvRldyeUw0bWp4TkJEWHpqSHVKdXlHUUdXWld6YjQ2MVZlbG9kZTYx?=
 =?utf-8?B?TURqcFR6Z1lCdUNET1RMZnRxZEkvTGIvZmVMd3dhK2NWNHpYQUdXaWZQNEM5?=
 =?utf-8?B?UkJSSjgxUTFsRk1aU1NFZWx5alAwVnZzRXM3WllNc2tYR1hKTlVsMHFidDFt?=
 =?utf-8?B?bUZBMFMrU2kwL3lZOVZoT3B5clkvM1ZFNjFuRDR6NlFXbjdxN3E2WG1WQ2hP?=
 =?utf-8?B?NUErMGpuOGZyYU00ZUl4dDY2T2lSQ1NKdHlEWWtXaVdyR1d0dzN1c2Y5S0xo?=
 =?utf-8?Q?X5+rUlxP4/MFtLr5zBPO4+apO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11eae28f-9c33-42e6-162d-08dd0a499487
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:28:49.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbOJo31xbJEReJIAgVE2beBHOFVmJjEF+vxNFXcyPp40YAdKBH1vRVpV6xvpFNXWasnTowfgFQl/jn7MRXVC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 16:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8996


On 11/20/2024 9:42 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> In message: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6] u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
> on 18/11/2024 Sandeep Gundlupet Raju wrote:
>
>> Include xen-boot-env.inc file if BOOTMODE="xen" and also remove xen
>> u-boot boot script variables from xen-boot-cmd.inc.
> Is the BOOMODE variable documented somewhere ? In the main
> uboot recipes ?
[Sandeep]: Bruce, Variable is defined in 
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33 
to support multiple u-boot boot target 
https://github.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_versal.h#L124-L132 
for u-boot distro boot. I don't think we have a documentation defining 
all the variables.
>
> Bruce
>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   .../u-boot/u-boot-xlnx-scr.bbappend           |  7 +++-
>>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 -------------------
>>   2 files changed, 6 insertions(+), 36 deletions(-)
>>
>> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>> index ec64d246..4e39c316 100644
>> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>> @@ -1,4 +1,9 @@
>> -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
>> +# Include xen-boot-cmd.inc only if BOOTMODE = "xen" is set from configuration
>>   # file and xen enabled in DISTRO_FEATURES.
>> +include ${@'xen-boot-env.inc' if d.getVar('BOOTMODE') == 'xen' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
>> +
>> +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from configuration
>> +# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is supports multiple
>> +# boot modes such as JTAG and SD(ext4 and ramdisk).
>>   ENABLE_XEN_UBOOT_SCR ?= ""
>>   include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
>> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> index 7a4e41a6..6fccc7b4 100644
>> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> @@ -1,38 +1,3 @@
>>   FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"
>>   
>>   SRC_URI += "file://boot.cmd.xen"
>> -
>> -# Image offsets for Xen boot
>> -KERNEL_OFFSET:zynqmp ?= "0xE00000"
>> -KERNEL_OFFSET:versal ?= "0xE00000"
>> -
>> -DEVICETREE_OFFSET:zynqmp ?= "0xC000000"
>> -DEVICETREE_OFFSET:versal ?= "0xC000000"
>> -
>> -RAMDISK_OFFSET:zynqmp ?= "0x2600000"
>> -RAMDISK_OFFSET:versal ?= "0x2600000"
>> -
>> -XEN_OFFSET:zynqmp ?= "0xBA00000"
>> -XEN_OFFSET:versal ?= "0xBA00000"
>> -XEN_LOAD_ADDRESS ?= "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
>> -
>> -# If dom0-ramdisk is used for Xen boot then set RAMDISK image to cpio.gz
>> -XEN_IMAGE_NAME ?= "xen"
>> -RAMDISK_IMAGE ?= "rootfs.cpio.gz"
>> -
>> -# Set the amount of memory for dom0 depending on total available memory size(DDR).
>> -DOM0_MEM ?= "1500M"
>> -
>> -# Specify which UART console Xen should use. You can sepecify the devicetree
>> -# alias or full path to a node in the devicetree
>> -# XEN_SERIAL_CONSOLES ?= "serial0" or XEN_SERIAL_CONSOLES ?= "/axi/serial@ff000000"
>> -XEN_SERIAL_CONSOLES ?= "serial0"
>> -
>> -# Specify additional Xen paramaters which will be appended to xen-bootargs
>> -# This can alos be used for debugging purposes.
>> -# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all guest_loglvl=debug"
>> -XEN_CMDLINE_APPEND ?= ""
>> -
>> -# Specify the max number of vcpus for dom0
>> -# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>> -DOM0_MAX_VCPUS ?= "1"
>> -- 
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8992): https://lists.yoctoproject.org/g/meta-virtualization/message/8992
>> Mute This Topic: https://lists.yoctoproject.org/mt/109660021/8188369
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

