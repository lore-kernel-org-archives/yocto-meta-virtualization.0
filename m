Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA20EE77188
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 02:21:53 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.57])
 by mx.groups.io with SMTP id smtpd.web10.12149.1736216509474586657
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 18:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=PMtcAELX;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.102.57, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrIDkNcAkzP0NDkYqNQzUqen/ZlLSekxay7nqn7elKiY6RyRMhaipD/OcQPmBvzS9wrzwQ6gEW+42y8TpWzVY5rLPWD1klOVVVE0KfNnZ7S47NawY5AiHfs2m0JTkfbadz8f7CjKpqZ1X6pU1PGV65n66dNW+TWvwV3WCNvvUKBK8VKf9cd1OWNZVWnaC0IDA6h51lxPcH+mUR+vF9ibLn38SStVBV+59esQrGB8x6VbvLMAbF3qrY5zqCaz/VDxwz5v0/n6kjeHxYhDZrnN4yNai3AehMpp8ReAguIzxZI/ez7Epy6MXRAtm42P3Js2G1c4xDIBTEA1z4QkKXnVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlLOe00v6iA4yZ4CeGCVTXgQ29mxkMu+t9qr0c27y+U=;
 b=GHvLgdcIkx/XtiiDSjjGxkLNh+JPeBu58rfkw9DYFHCeiKOBChDwnX1AL2wouY6jWGTitp80eOH44Wn1kuKi0Nn5lBFUBACPacXg1KBz8G0LWkElPGJC4W5nTWHORgytGFn0dxhSgzfuYY3ZC60UImet0PILqW1IXg4f70eo4PP9+nBsjuioiEB/v2Hvv7vCYBPzyBptXt6gwkBWecv0Af8tfypfOG8i+wPAVw0pL1qdXrf3ssklUKeqwTeMZD3e4P45aCFCrBfA5SGx6vVysM0YdGNz1vcLqFfbZSPydyToKz6uz4B3iNes4i8U/aQNcxJlTbQT7jnyIOFB55NPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlLOe00v6iA4yZ4CeGCVTXgQ29mxkMu+t9qr0c27y+U=;
 b=PMtcAELXX9gAZkP71bGQojQ0bGX6zStFulQuPJQXBV/vbNPbS2ZMQj3POvXTI7pij7F8X4RGDBR5sAiDVgohpcGOoEFb7i1CDivHxATGnJ0HSty9/LeNPA1oqHayYlvk0XZiAnChvSDJ12TpHcToqOIUD6g44lJOK1GvTPQcbSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SJ2PR12MB9189.namprd12.prod.outlook.com (2603:10b6:a03:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 02:21:43 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 02:21:43 +0000
Content-Type: multipart/alternative;
 boundary="------------hjoht020zY6zTYdsp1goiwoR"
Message-ID: <e61ff9f2-3848-4a29-a084-0657e9220a87@amd.com>
Date: Mon, 6 Jan 2025 18:21:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 1/5]
 xen-launch-config: Add bbclass for xen launch config variables
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com,
 mark.hatle@kernel.crashing.org
References: <20241209145442.3291634-1-sandeep.gundlupet-raju@amd.com>
 <20241209145442.3291634-2-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SJ2PR12MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: a9aa849d-7845-4e7a-6a8d-08dd2ec206f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnhDVFBJQ1c3Znc5MXViNVJYUkFwaEFXQTBWejhDcnZubnhXR0RmalR3WDV0?=
 =?utf-8?B?cnROWEd1ei9SdU9VVFdreUU5bmRXRXl1SFBjamtYOXN6TC9QR05PY2w4SmpK?=
 =?utf-8?B?TTBkZnQ4czdjWDhyNnlhdStMUjZLZFNibG9zOUk0YUtnNzRZbmkxN1hPY0gx?=
 =?utf-8?B?YW9jOFJvZ2s1a3J1Zk91N3ZFQWdGaE5QdzEvSEErN1o5K3l5TXNtaVg4VDZ0?=
 =?utf-8?B?ZWswUDhaYTI5Mms4dHljQ3RPSC9FWXpMNDdKK2VVd0IzdUM2WG9PMi8vUGpQ?=
 =?utf-8?B?R1BwT0s3ek5xMzNyTytjOUo3N1dJUWEwelJVMzc0cWYrMnU1cm1VejNURFFJ?=
 =?utf-8?B?bkpYUHhwNlpJOERYd2tJajJMK2t0a0hYcGRsRGtHUkczYkpYYldRU3RwT3pD?=
 =?utf-8?B?djNTWit4dnIydEY1QjVMcmcyWWFPWlBzL2R4TVJYUndYS2t5SUVQOXFJUThR?=
 =?utf-8?B?b0tvZjQzWThOTllLOG16dGJTZ0xpRkRsVnNpZEVEa29nekQ3OXl4RWtURmYr?=
 =?utf-8?B?UDFsMm1FelJpSkR4MXJKK0p1WnRKd0R2M01qR002M3NEVE1UMWxPSmJYOWdj?=
 =?utf-8?B?STl3TTh3TFlEZkE0S0xFdFk0cEs0NDhzR2Y2MTRXTDRJSmNMUVkrTUdENkli?=
 =?utf-8?B?WFhrRXdUcjdlQU1KZGx0Qk1Ia3IraWtRTlR0L3dOMnlicVRrYkxjWWNnTTg1?=
 =?utf-8?B?aEhhKzJkenF5UldGV2x0andYd3BYR0tJL3NMRFU1L0ZzOTlSWlE5bkY1dzIx?=
 =?utf-8?B?MFVKNmNaaUx3dUNOTCtTYmc3dS9pTGU0bHJLak1FZWRra2xSUGFsTWxrcWdI?=
 =?utf-8?B?MFEyaTNjaWIwSWhpTDEwN1h4bU8zaUN4NDhQNTFsTmpOQjRLL1lySlBiU2c5?=
 =?utf-8?B?SmE1QnJUb2xvUXpnaU1pbys4T0FjaWk2WHJobHNTRHVzc0VHUllneUhQQm9E?=
 =?utf-8?B?NGJkcnRPSjBEa2d1N0kxV1lwalJxMGl1VE0xbWZKQWo1OTdnYnM3VEZ2bjQz?=
 =?utf-8?B?bjBsQnVQeHNNSTRUVkVUL3JyeldVNW0wSzVFeDlqSjdpS1I5VVhOZlk5THNv?=
 =?utf-8?B?OUpEVjhQejg1aFFNZGpnZHlTWnZ2MklZb09vZkhrL1FmUHpMc2NtbGRkVENz?=
 =?utf-8?B?VGFvTGtvRDJIQUNZc0JOWXcrRTJQbDVuRUVBWHdRZjY2eWVnTENYZFBicTFr?=
 =?utf-8?B?d21HZ1p2TFhuZ2NmeHhCWldkMU05d0ZLTjdXRW94em5ybFV4WnJ1aStQMFRO?=
 =?utf-8?B?eEhDVnJYRnpqU3JlZTlhdzQ4NURUYTVhYVdhaTlDOWhOaEJIeUhrVzh2NVJw?=
 =?utf-8?B?QzVkckZvR003M3k5UXFVcmtBZjBXd1JtSVNTWDBuSWJnWG1PWWZhRmU4S2hj?=
 =?utf-8?B?LzR4YU1qWUJzSXpZU2paQlpMclZkUHpBVlM0K1RWSTlMeVAxcUNvbVM4STNS?=
 =?utf-8?B?RFNTcGlwSW9ncXo0Y0hxR01hOS9MZUFXaE9hTi9WemY3MUFPelkySVJSc0Yx?=
 =?utf-8?B?SVM0b2pPVURqbnVrZjJ0ZXZ6a0RZZzhuQ0Ntc0hNb2pIL0loZndxRUVmOGJJ?=
 =?utf-8?B?Q1dtNXBpNzZKVXl4SlUrNjUyODhWcWxlUmgyMm5xczFwOFkzclNPK2NKL2JN?=
 =?utf-8?B?bWNZS2pwSHdkeGlqTCtSWTJYQjc5b0I2djhRdXBHKzRsSlZ0aEtOTTNXNUVK?=
 =?utf-8?B?dFFYa0tTY0xHSHgwNEpGa2RLZ0FIQUxiT0lwOGYwdnJMcDBQcVFYZXA1RmlZ?=
 =?utf-8?B?bHFtaDk5cFhRbFJqWFdDUEREK3NXb2p0SzdPb1UwdUNUVE9xQWpTcVI4bFVw?=
 =?utf-8?B?NDZJZ3JJcVlXeDZCYXlqUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXVLajVhakFRNXBZRmlrZkIxNlV4VU9SNG5PVjR6TmszaUtSc1hNS204b0FQ?=
 =?utf-8?B?TUVON2JIOXhZdTYxczlTNTlaQXZLYmlSVW9YUnZ4MWk1WGtFY216OXJoYkZa?=
 =?utf-8?B?MzRhSFBzeUdsWGVhaU9POTFsTDh5S01tYnRENnRPNE5USWpZZ0c2SnYzUjJa?=
 =?utf-8?B?SVc5MXpDc3F1NnBVNWpsMUc5aFI1eFByVEpxZVBOdTVOR2xSZ3M1TGY5S2tu?=
 =?utf-8?B?bUxtb3V6MDQ4eU03NzNVSWx0OGEzS0hZTzBGcVZaMUVuSWVKekY4aitwYzVI?=
 =?utf-8?B?ajA4dG5qdTBCdy9IVldPVzVrTHVTTmI4eVlUMXhIYWhMUjNnb2hheEJqRzdW?=
 =?utf-8?B?bzI3b2xkU3NJRC9PNXJYM1Y5elVkL2VvMU1UeWpYa3NsODBkMml2M2E3YU9w?=
 =?utf-8?B?UzJ0cStqTWpBN2pYVlBvOHlaRmc3VEJsQlJ4TDhWTXdqWjBScVEvbHE3L3V2?=
 =?utf-8?B?eWVPZGJnTFdHRmJVdXpPUHFqK2UzbVhCdWF3cU5ya3p5dkl3eThXcFRTUDhO?=
 =?utf-8?B?cS85UjI3dXlrL01VTk5qdFR4WldPK2VDR0xlNGM1ZnVrVC9HeUdLSGJTR211?=
 =?utf-8?B?dWJqRUI2Nkd1SE40YTU3SHBFZDhFV1lpWm04RStlRFJWZVlLUHhQSjU5U2NG?=
 =?utf-8?B?MVJkY2NBSmNQZit6N0RsUitZb2xZTWF3M1VicUM3MGFIOEhKNnV5QmptR0xO?=
 =?utf-8?B?NEJPYUNic1BhaEdMeEExcWtuYloxT1BTeFdmRVVoZE44QTl5dlZLdHExMFo5?=
 =?utf-8?B?ZnhBTFRNQ1FlbStuSG5QUmZBL1hCWEJvTEdFRXRyUE0xWE5odFBiNHdDTnY1?=
 =?utf-8?B?dS81MVJ2WUFzMFFWSUYrTWZoTDFFQS9uQUdPQXFKZ1Z2d0swVFlEOFJvK2o4?=
 =?utf-8?B?UDQ3bWF3N0ZaOEUzWnJMUUFXeHJIaytCYk9qYWQ2RnVMbGNQd3E4M2lGYTRl?=
 =?utf-8?B?bjdFVVZXM0hieFVEaGRFbHVWRGZzVEZSQVJieVJmOHZ6ZTU3KzlBOUFrWXll?=
 =?utf-8?B?bHI3eDZHU2l4TGFrYnVqbytvMXgwUjFWZldKak1CYXVMS2g1TXQyWERYL0Vm?=
 =?utf-8?B?VUlETXYxL3NJUExrZmp2aE16SHlGV0pJQ3I0OWVtOWZ6N0Z4ZndUR3JzeWxn?=
 =?utf-8?B?NTFkeXNQMk9DYTY3ZWxLWGRYWjhZL21xcDRKTENjdEdOLy9hcVJwRVlaV3Z1?=
 =?utf-8?B?S1hTLzZKTDBjYkNUUlNPUjVOL2NmTms5Sk96aW5UQnZ2aFordGpockI2amxE?=
 =?utf-8?B?U0FOT0xocVdMUG01czVGTzZsREduYkgwRlUwc1VXR2hib1lkUEwyU045Ulcr?=
 =?utf-8?B?YWVwUlMrYmF6ODVYZG1PZUcvMWx2MFJJZlR5TmxTdXJwczMwTlVCNG0vRFF4?=
 =?utf-8?B?MCtwYlByZDZhWWdvTlk0YmIycGFOakp0STQxclMvamVFeEM1MlVKNUUxcm1u?=
 =?utf-8?B?dFhpUGFKcWl1R3JHL09pMmt3R21JNkh6UVovNEFLbTdHSHdvTGE5cFR5TUxQ?=
 =?utf-8?B?aSt3L1FGRzFoU0V4cUczeC9vOXprZUh6Vjl5K2Z6TFhxQTFwSTdPcjMzQlU1?=
 =?utf-8?B?VENHZGtqd3d3Yy9pYzh2SHJ4MCt1a09DSGZxZHp5MlBRbnF6bXNnbjgwd0Zz?=
 =?utf-8?B?bm9FTWc4TFpOR2o2MTBmOVJqall5YnMvaEVIcW85VTdYYUQzZHFKc1dPOVp4?=
 =?utf-8?B?eEpYVnFmbHpJcXZKc1VCMEg2WjlGTGJ6TFVGYVJqY2tjRi9UUWg0ZmdmdUVU?=
 =?utf-8?B?L2o2QzVvdnd4OUs1U0RrRXJHWmdNYjJ1eWE0UENnYTM1TE9DUDVqSlduOHo4?=
 =?utf-8?B?N1pHcVNyMDJBT1FoSjI0dTFTaHRQSGVvN1dRbE9YNXhUWEZkdXljMXlFa3FO?=
 =?utf-8?B?UHdmVEFLYlp0Y1lFYTdsT2thTnQ3VVUvbXJHYmdyTFRXeVFCa0RYOFdxY05a?=
 =?utf-8?B?Z0d6MHoreHI1MFF1MUFqMGtJMzFxQ1Q4c3Bxdzd4b05jc1g2Z3E3TlBKanhj?=
 =?utf-8?B?Qy9LRk9QQUhGOWpMTTM2S2tlQ0R4Wk9KSFpjd2k5dS9vMC81WjJ5L1ovQTJH?=
 =?utf-8?B?YWN1VjRQN1pkWURDN25nTEMyQjVCSCtXM2cxajVFbk5RczJqWEtyNEFmSVMy?=
 =?utf-8?Q?H+Lm0QYRnMp62FnAjBUUUu9/I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aa849d-7845-4e7a-6a8d-08dd2ec206f3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 02:21:43.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQYShiFk1osYrGney+VepCsMIE1iFJkqinc1FNbRUyHVMVn8t0vBA+HQprMRAiR0AU5xsu71sfocX95/UdiM3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9189
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 02:21:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9072

--------------hjoht020zY6zTYdsp1goiwoR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/2025 4:46 PM, Christopher Clark wrote:
> Hello
>
> Happy New Year! and thanks for your patience waiting for the review of 
> this series.
[Sandeep]: Happy New Year Chris.
>
> On Mon, Dec 9, 2024 at 2:54 PM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>     Add a new bbclass for xen launch config variables. This bbclass
>     provides
>     common xen launch config variables which can be inherited by any
>     vendor specific u-boot boot script and non-u-boot recipes. Also these
>     variable are configurable from recipes, global and machine
>     configuration
>     files.
>
>
> Once this series has completed all reviews and is acceptable for this 
> layer, do you think it would make sense to send corresponding patches 
> to meta-raspberrypi and meta-xilinx to set default values for these 
> new variables in the appropriate machine configuration files? 
> (Raspberry Pi 4 64-bit, zynqmp and versal machines)
[Sandeep]: yes meta-xilinx patch we have it in internal dev branch I 
will ask Mark Hatle to push to public. I will send the patches to 
meta-raspberrypi layer once this is merged.
>
>
>     Variable nomenclature is aligned with xen documentation.
>     https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
>     Currently it supports Xen Dom0 boot and can be extended for DomU
>     or Dom0less boot.
>
>     Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>     ---
>      classes-recipe/xen-launch-config.bbclass | 43
>     ++++++++++++++++++++++++
>      1 file changed, 43 insertions(+)
>      create mode 100644 classes-recipe/xen-launch-config.bbclass
>
>     diff --git a/classes-recipe/xen-launch-config.bbclass
>     b/classes-recipe/xen-launch-config.bbclass
>     new file mode 100644
>     index 00000000..df8287e1
>     --- /dev/null
>     +++ b/classes-recipe/xen-launch-config.bbclass
>     @@ -0,0 +1,43 @@
>     +# Copyright (C) 2024, Advanced Micro Devices, Inc.  All rights
>     reserved.
>     +#
>     +# SPDX-License-Identifier: MIT
>     +#
>     +# This bbclass defines u-boot script variables required for xen
>     boot which can be
>     +# inherited u-boot boot scripts recipes and also allows to
>     configure these variables
>     +# from recipes, global and machine configurations files.
>     +
>
>     +# Variable nomenclature is aligned with
>     +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>     +
>
>
> Suggest: just retain the SPDX line from above?
>
>     +# Image Load Address for Xen Dom0 boot
>     +KERNEL_LOAD_ADDRESS ??= "0x00400000"
>     +XEN_LOAD_ADDRESS ??= "0x00200000"
>     +DEVICETREE_LOAD_ADDRESS ??= "0xC000000"
>     +RAMDISK_LOAD_ADDRESS ??= "0x2600000" 
>
>     +
>     +# Xen boot image types.
>     +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded
>     by u-boot.
>     +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by
>     u-boot.
>
>
> Please could the u-boot references be removed from the above comment 
> lines?
>
> Next, in the Yocto documentation, KERNEL_IMAGETYPE is defined to set 
> the type of kernel binary that is _built_ by the kernel recipe, and 
> then KERNEL_IMAGETYPE is also used elsewhere to identify the kernel 
> file to be installed and to load at boot.
>
> Accordingly, a new XEN_IMAGETYPE variable should behave predictably 
> for anyone familiar with using KERNEL_IMAGETYPE.
>
> However, it is not being defined here to determine any output of the 
> Xen kernel build process -- it doesn't affect the Xen build at all. It 
> is being defined to determine the name of the binary loaded by the 
> boot process. I think it's important to consider this carefully, as 
> there genuinely are multiple Xen image types built in x86 builds. That 
> said, I don't think there is a problem, because it doesn't prevent the 
> Xen build being adjusted to use it if necessary, and if there is a 
> need to add a XEN_IMAGETYPES (plural) variable later, I still think 
> this looks fine.
>
> In patch 3, there is a variable: XEN_IMAGE_NAME
> - what is the function of the XEN_IMAGE_NAME variable? ie. What is it 
> used for?
> - is there a reason that XEN_IMAGETYPE is not being used wherever 
> XEN_IMAGE_NAME is used?
>
>     +#                Example: xen or xen.efi or xen.gz
>     +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used,
>     Example: cpio.gz
>     +XEN_IMAGETYPE ??= "xen"
>     +DOM0_RAMDISK_IMAGETYPE ??= "rootfs.cpio.gz"
>     +
>     +# Set the amount of memory for dom0 depending on total available
>     memory size(DDR).
>
>
> It could be helpful if the comment indicated what behaviour to expect 
> if this variable is empty/unset.
>
>     +DOM0_MEM ??= "256M"
>
>
> Could passing the dom0_mem= command line argument be skipped if the 
> variable does not have a value set? (in patch 2)
> If so, could the default value of this variable be set to empty here 
> and then set it differently elsewhere in machine configurations.
>
>     +
>     +# Specify which UART console Xen should use. You can sepecify the
>     devicetree
>     +# alias or full path to a node in the devicetree
>     +# XEN_SERIAL_CONSOLES = "/soc/serial@7e215040" or
>     +# XEN_SERIAL_CONSOLES = "serial0" or
>     +# XEN_SERIAL_CONSOLES = "/axi/serial@ff000000"
>     +XEN_SERIAL_CONSOLES ??= "/soc/serial@7e215040"
>
>
> It would also be a useful improvement to make the boot script avoid 
> passing any dtuart= command line argument (in patch 2) when the value 
> for this is empty or unset.
>
> Is there a way to enable configuring multiple consoles if there are 
> multiple values passed in the variable?
>
>     +
>     +# Specify additional command line arguments used for Xen and this
>     will be appended
>     +# to xen-bootargs cariable. This can also be used for passing
>     debug cmd line arguments.
>     +# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all
>     guest_loglvl=debug"
>     +XEN_CMDLINE_APPEND ??= "sync_console bootscrub=0"
>     +
>     +# Specify the max number of vcpus for dom0
>     +# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>     +DOM0_MAX_VCPUS ??= "1"
>
>
> Another variable where having good behaviour, ie. avoiding passing a 
> command line argument, when it is empty would be useful and then empty 
> would then also be a sensible default.
>
> thanks,
>
> Christopher
>
>     -- 
>     2.34.1
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9043):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9043
>     Mute This Topic: https://lists.yoctoproject.org/mt/110006796/3619037
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [christopher.w.clark@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------hjoht020zY6zTYdsp1goiwoR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/6/2025 4:46 PM, Christopher Clark
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com">
      
      <div dir="ltr">
        <div>Hello</div>
        <div><br>
        </div>
        <div>Happy New Year! and thanks for your patience waiting for
          the review of this series.</div>
      </div>
    </blockquote>
    [Sandeep]: Happy New Year Chris.<br>
    <blockquote type="cite" cite="mid:CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Mon, Dec 9, 2024 at
            2:54 PM Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
            &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            a new bbclass for xen launch config variables. This bbclass
            provides<br>
            common xen launch config variables which can be inherited by
            any<br>
            vendor specific u-boot boot script and non-u-boot recipes.
            Also these<br>
            variable are configurable from recipes, global and machine
            configuration<br>
            files.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Once this series has completed all reviews and&nbsp;is
            acceptable for this layer, do you think it would make sense
            to send corresponding patches to meta-raspberrypi and
            meta-xilinx to set default values for these new variables in
            the appropriate machine configuration files? (Raspberry Pi 4
            64-bit,&nbsp;zynqmp and versal machines)</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: yes meta-xilinx patch we have it in internal dev branch I
    will ask Mark Hatle to push to public. I will send the patches to
    meta-raspberrypi layer once this is merged.<br>
    <blockquote type="cite" cite="mid:CACMJ4GYSKx4ssyJ9KXZMae3kFv0jE-WzJ7d47ciMsnxb469qsQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Variable nomenclature is aligned with xen documentation.<br>
            <a href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html</a><br>
            <br>
            Currently it supports Xen Dom0 boot and can be extended for
            DomU<br>
            or Dom0less boot.<br>
            <br>
            Signed-off-by: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
            ---<br>
            &nbsp;classes-recipe/xen-launch-config.bbclass | 43
            ++++++++++++++++++++++++<br>
            &nbsp;1 file changed, 43 insertions(+)<br>
            &nbsp;create mode 100644 classes-recipe/xen-launch-config.bbclass<br>
            <br>
            diff --git a/classes-recipe/xen-launch-config.bbclass
            b/classes-recipe/xen-launch-config.bbclass<br>
            new file mode 100644<br>
            index 00000000..df8287e1<br>
            --- /dev/null<br>
            +++ b/classes-recipe/xen-launch-config.bbclass<br>
            @@ -0,0 +1,43 @@<br>
            +# Copyright (C) 2024, Advanced Micro Devices, Inc.&nbsp; All
            rights reserved.<br>
            +#<br>
            +# SPDX-License-Identifier: MIT<br>
            +#<br>
            +# This bbclass defines u-boot script variables required for
            xen boot which can be<br>
            +# inherited u-boot boot scripts recipes and also allows to
            configure these variables<br>
            +# from recipes, global and machine configurations files.<br>
            +</blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+#
            Variable nomenclature is aligned with<br>
            +# <a href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html</a><br>
            +<br>
          </blockquote>
          <div>
            <div><br class="gmail-Apple-interchange-newline">
              Suggest: just retain the SPDX line from above?</div>
            <div>&nbsp;</div>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+#
            Image Load Address for Xen Dom0 boot<br>
            +KERNEL_LOAD_ADDRESS ??= &quot;0x00400000&quot;<br>
            +XEN_LOAD_ADDRESS ??= &quot;0x00200000&quot;<br>
            +DEVICETREE_LOAD_ADDRESS ??= &quot;0xC000000&quot;<br>
            +RAMDISK_LOAD_ADDRESS ??= &quot;0x2600000&quot;&nbsp;</blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            +# Xen boot image types.<br>
            +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be
            loaded by u-boot.<br>
            +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be
            loaded by u-boot.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Please could the u-boot references be removed from the
            above comment lines?</div>
          <div><br>
          </div>
          <div>Next, in the Yocto documentation, KERNEL_IMAGETYPE is
            defined to set the type of kernel binary that is _built_ by
            the kernel recipe, and then KERNEL_IMAGETYPE is also used
            elsewhere to identify the kernel file to be installed and to
            load at boot.</div>
          <div><br>
            Accordingly, a&nbsp;new XEN_IMAGETYPE variable should behave
            predictably for anyone familiar with using KERNEL_IMAGETYPE.<br>
            <br>
            However, it is not being defined here to determine any
            output of the Xen kernel build process -- it doesn't affect
            the Xen build at all. It is being defined to determine the
            name of the binary loaded by the boot process. I think it's
            important to consider this carefully, as there genuinely are
            multiple Xen image types built in x86 builds. That said, I
            don't think there is a problem, because it doesn't
            prevent&nbsp;the Xen build being adjusted to use it if necessary,
            and if there is a need to add a XEN_IMAGETYPES (plural)
            variable later, I still think this looks fine.<br>
            <br>
            In patch 3, there is a variable: XEN_IMAGE_NAME<br>
            - what is the function of the XEN_IMAGE_NAME variable? ie.
            What is it used for?<br>
            - is there a reason that XEN_IMAGETYPE is not being used
            wherever XEN_IMAGE_NAME is used?<br>
          </div>
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: xen or xen.efi or xen.gz<br>
            +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be
            used, Example: cpio.gz<br>
            +XEN_IMAGETYPE ??= &quot;xen&quot;<br>
            +DOM0_RAMDISK_IMAGETYPE ??= &quot;rootfs.cpio.gz&quot;<br>
            +<br>
            +# Set the amount of memory for dom0 depending on total
            available memory size(DDR).<br>
          </blockquote>
          <div><br>
          </div>
          <div>It could be helpful if the comment indicated what
            behaviour to expect if this variable is empty/unset.</div>
          <div>&nbsp;<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +DOM0_MEM ??= &quot;256M&quot;</blockquote>
          <div><br>
          </div>
          <div>
            <div>Could passing the dom0_mem= command line argument be
              skipped if the variable does not have a value set? (in
              patch 2)</div>
            If so, could the default value of this variable be set to
            empty here and then set it differently elsewhere in machine
            configurations.</div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            +# Specify which UART console Xen should use. You can
            sepecify the devicetree<br>
            +# alias or full path to a node in the devicetree<br>
            +# XEN_SERIAL_CONSOLES = &quot;/soc/serial@7e215040&quot; or<br>
            +# XEN_SERIAL_CONSOLES = &quot;serial0&quot; or<br>
            +# XEN_SERIAL_CONSOLES = &quot;/axi/serial@ff000000&quot;<br>
            +XEN_SERIAL_CONSOLES ??= &quot;/soc/serial@7e215040&quot;<br>
          </blockquote>
          <div><br>
          </div>
          <div>It would also be a useful improvement to make the boot
            script avoid passing any dtuart= command line argument (in
            patch 2) when the value for this is empty or unset.<br>
          </div>
          <div><br>
          </div>
          <div>Is there a way to enable configuring multiple consoles if
            there are multiple values passed in the variable?</div>
          <div>&nbsp;<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            +<br>
            +# Specify additional command line arguments used for Xen
            and this will be appended<br>
            +# to xen-bootargs cariable. This can also be used for
            passing debug cmd line arguments.<br>
            +# Examples: XEN_CMDLINE_APPEND ?= &quot;sched=credit loglvl=all
            guest_loglvl=debug&quot;<br>
            +XEN_CMDLINE_APPEND ??= &quot;sync_console bootscrub=0&quot;<br>
            +<br>
            +# Specify the max number of vcpus for dom0<br>
            +# Example usage: DOM0_MAX_VCPUS = &quot;2&quot; or DOM0_MAX_VCPUS =
            &quot;2-4&quot;<br>
            +DOM0_MAX_VCPUS ??= &quot;1&quot;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Another variable where having good behaviour, ie.
            avoiding passing a command line argument, when it is empty
            would be useful and then empty would then also be a sensible
            default.</div>
          <div><br>
          </div>
          <div>thanks,</div>
          <div><br>
          </div>
          <div>Christopher</div>
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#9043): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/9043" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/message/9043</a><br>
            Mute This Topic: <a href="https://lists.yoctoproject.org/mt/110006796/3619037" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/mt/110006796/3619037</a><br>
            Group Owner: <a href="mailto:meta-virtualization%2Bowner@lists.yoctoproject.org" target="_blank" moz-do-not-send="true">meta-virtualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
            [<a href="mailto:christopher.w.clark@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">christopher.w.clark@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------hjoht020zY6zTYdsp1goiwoR--

