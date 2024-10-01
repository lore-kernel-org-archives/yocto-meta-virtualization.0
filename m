Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6161ECEACFE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 19:45:12 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web10.91056.1727811907435915817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 12:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=DTXfQFjP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.73, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS0J6Kve4D/QFOTm+eCM2y9A/NsfhAmVEj23cIH1fQVIJP9KyDdglp9EWqwgcuTd7wwRTYvNUNFYR3QWGUZPG069xFebdujHsuinuQQ0DfZ0LGkncb8m2YlrYqniMQh023+pm3n8uBO4w/MG2BM7nVsA9FYef9EU3Po+ed2aOCftz/n03JCo+f2Q/gZKZp+gSJTvWuSNVsgDvkGmgiLe72VrD+jObxdM98+9VET24yHA8sQbUfM57cNO/c8lk36WX7e9mgmbhgOE0cZWcWrvtkeoqTfyqT/impZ65Zpwg3EJgesQPtFufhzORCmt2RqxihNET0omoMCrwEbILAlrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+5UQNZqjuWj3oNcDz2cPmq4EsU51rJXIxcrHKrWxls=;
 b=Lrlw2nc0KZzoKQF0M2JIgEZEjHg3/fzpZx7x+/h9TmyZjZr3bi8uub7rhnB74YAZuKoeoirDTB0knfnye5lNMmBDeU7kSEUDxVpUCnUGZpTz7i4jJRujR7y1FLzNfgqYNhCYm9DG8DAZvUp+ZF8QuuDL+F7mNqJ7a9ivDWN4i0/DrNPwMZAKlkhssZLPt0KOfPlrjSPNhgR03iz7WzixmzqAU7wJLrH0Fc45fo97K68buHWf0OLIQymizt7ZmYvsrwj4LpSiSvgHHMBDIIyyuCNhLCq6OIHnB3vHRYU5KOIZtZgPsGsD4epi9dgrU7ncEOPdDqw1EfK2jif0M3eZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+5UQNZqjuWj3oNcDz2cPmq4EsU51rJXIxcrHKrWxls=;
 b=DTXfQFjPeydIZNh7Fru9/nOtsnbBXiukdjo2H5Vf8WBIIz1zdu+7vFYNk3SrldlOUYo8oUerEPxg5KsWkAzuc6CaktkfID8Z3lMMICf6isrP7V7bvhuOCb6y+G1sLmBrpl9JXg0i2JyuYBpcMM1MitJUNCoCZdPJCCFvmoAChtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by IA1PR12MB6186.namprd12.prod.outlook.com (2603:10b6:208:3e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 19:45:04 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 19:45:04 +0000
Message-ID: <969828a4-706a-4377-9de6-8c2d7d3b7297@amd.com>
Date: Tue, 1 Oct 2024 13:45:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scathgap][PATCH] device-tree:
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
To: meta-virtualization@lists.yoctoproject.org
References: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
 <ZvrxRiQoiRmJCVmx@gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <ZvrxRiQoiRmJCVmx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::25) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8666b3-89dd-4f0d-be8d-08dce2518ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnlsbW55bzR3ZnhWZXBnT09GZEpENm41SXQvSERyY3RRbTIyQ0hqMWxzUWdK?=
 =?utf-8?B?L05TSzlsMXJwNkl1Smk1VzVUaGI2bFBiVGY2YlJwYTl5NTlyemIrMXFseElU?=
 =?utf-8?B?R3daTjZoWDZSTjJJTWl6MXl4MDNDSjFIZW1tWDNUWjNJbEhOZTNvbU1NOUlm?=
 =?utf-8?B?RTNCelBWMC9xTjZtTjdoV3dSZnlVc2dLYlRiOGdISXNyZVEzQ1JGK3BxQ21H?=
 =?utf-8?B?OVEvR1pzcjYrbWZJN0FJUDM3VkJRcDFuazE2NDlJeVBkQ2lCRkp5VFFjWi8x?=
 =?utf-8?B?Lzk4WHhPaTB0UXhqQUtuTFNXMml5R3NTQnFBekxRWmdESGxzc3I1Zys0dGlP?=
 =?utf-8?B?VWx1NE1KeU1jTHVHd0JWTHgvbngyMDcrS05HT0tXVHRzK3YyU2tkQi9YUnJL?=
 =?utf-8?B?UmUrQit5YTNVc05vSlBURVpMdjM2M2lkT3lKaHlLNGowRlQrR1hCUTdrZ0dR?=
 =?utf-8?B?NGNHUnVXekplTTd0MmxjWEtpM3d4cDRnc0s2TXpTbmFteUUvcFNVdE5OTStp?=
 =?utf-8?B?bVBCdGdSU1FKOGpQbmt3a0x3M3FvZ05TVXBqL1RibXJuaEdUUSt0bDFDVGVp?=
 =?utf-8?B?TkZ1akxBMWVJYnBVYm1CK0pZdG1JNXRyRjFWWTlVa0xQWVpGU3FERzIwRncz?=
 =?utf-8?B?dkJXdmpBWDdyUVhkVGNhNXRoY0JoR2kzRkVuanhrRDJ5OC9oZU1pVzdQNjdt?=
 =?utf-8?B?b29iV0ttQm0weHZGS2tQUzZTckhJSm5WdGdZMzQ2TXRqZm5NbzZhdGRWSTVa?=
 =?utf-8?B?a0ZtZjR4OW9JK0puVUR3cDVJVHlGc3RzcksySGFNemFsK01Oa3QrRlV2NnBi?=
 =?utf-8?B?ZXRyRWRTYjN6UEtyenMycnR5Q096VmprY2E1MHNlZXloekw3b1R0aWlBQ1dL?=
 =?utf-8?B?b05nNWVSSURDY2xWb3I3OEdLb1MzU2I2eXdmdGtmcDk0VnJqb1NRNDFXN3ZR?=
 =?utf-8?B?UHFrQ1R4TC9pcHZ5cElBOEdneVZnL09Gb1hyV3p5VXUrRm0wa00zWUNFaXZN?=
 =?utf-8?B?cG1qSm1IZHF3cXRLZW9FRTFGbGMzUElET25sMklGUm5mT3piOG9pNFpMcEJX?=
 =?utf-8?B?eEU4QUovejNxZk5EYVZlVDNZN1NxNjJMZ3dQQW5XeWh2TVlCa3Z2MHZOcm80?=
 =?utf-8?B?ZUU0QXM1Z3FrL2dlZGxiUTRZWnQrTGlTOG5lallIUVJSWkV6Q04zbDBCTlJL?=
 =?utf-8?B?dnhlVDhNeXB2V050UCs5V1gzbnBRdUk3VnRlQTRIR0EzM1ZhdXBLZlBEMVV4?=
 =?utf-8?B?ay8yVmQwVDc5OEFiNUdKRGlnZUx0b2NFcEE3N1ZLQkQ4R3pleG9ZMERFUEhj?=
 =?utf-8?B?Nzl0VXhlSkVwcmJublV5S1dNY2plcUxidEJmcWpDUG1ONERHT2xpRll4bHJj?=
 =?utf-8?B?ZnM5N05zYnMyNzBtc0U1Z2tMeW1Gbk90eHVKVS9KUXdWZS81UnM5dU5kVVdI?=
 =?utf-8?B?bDkvS2NsTW8vNlBnV0c3RWczWjVXdythTURIUkUxYW15TTJaV3g1azRWQTJS?=
 =?utf-8?B?TEhvK05jR0szR1lyZlZQcGRhY3Z3WEh1Qnl4OWZDc0MxZklFV2JNSjhJOUZE?=
 =?utf-8?B?ZGJVbkRTREovWWFGcGRJUFF1LzA5YzZaV3pidmp1Sld5YmZIc09ic1YwQ2gv?=
 =?utf-8?Q?IxfRvC290kIbmg3UanVO4CxH6bkt4s3BiiS3Jn6jvrXs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVJLZnpXV0tpcnY4aFhYT0xTRGVydFVTZHRIRFArV0t5WWIwK0Q1K0lwM1Js?=
 =?utf-8?B?N2hjcndXb0VlaTJWQVlPV0dkbG5ZTTdHKy9vRDNGcjR4MUFMZU5vaDBvZUF3?=
 =?utf-8?B?eTNxZENOb0pYNGt3OUhiUTR4b0hYbmN5VGJSWjUxR05UenQway9DS2MwNVFF?=
 =?utf-8?B?TE9ucWswSVdzM3JYNFdhYmtrR0xYVEoyMjV1YTV6OSs2Y2pzNGJ4MjJOdGJj?=
 =?utf-8?B?dVhyVTlwaEs4Q240Y01NSkVYSEtmYzBTQnBTbVQxeURKN1FOODExcnlnK0M5?=
 =?utf-8?B?SzRXc3liN2ZYNEF6VkhEZytUaXNIaHVYZWNQSVByWW5YWVh0WHdnelFjM1Vx?=
 =?utf-8?B?YSt0L3NqdWFQMVk3emlLMGVrdEVYeDYrc1BiUkJ1LzlRYTBVVnp6eHBtUWpI?=
 =?utf-8?B?dC9jWTRSMGFOY2Z2MjRSOEphQ1AvV3gvVk5UNzYvVmpPWnJmYXkrZnRnZjN3?=
 =?utf-8?B?NGpqZXAzZmd3TnJOb21nZUw2Rm9FZ3RORjZPdEJocDgrSmliZWY3WVhqSFJH?=
 =?utf-8?B?OVBQZlc5Nm4xK0w2L2tqaVpXSENEbm9kVFhYUHR4V1NwbGF2RE9ZL0tZWlox?=
 =?utf-8?B?NjdyY20wRE93dlE2NVV0WjNjUER0a2xBY1ZrR295bVN3WEFmamhpYjVFOGpi?=
 =?utf-8?B?Q3FVVmlScXQ2cGxCeFJpazBXWEozVzNtQ2pTb1NEbkpQVnBlS3ZyR3h5VkJa?=
 =?utf-8?B?SzBHZkVaU3ZuaklUbFlHcXQ0NXdvMkNvUzV1WmUzblpQZ09RWGkzNFdBZWlp?=
 =?utf-8?B?cWlPTzJYYU9lajRDT09nUkRJS0YwanRNNVpkMmIzTnoreVNxbkQ3QTNTS0l3?=
 =?utf-8?B?MlhYc0Q5ZS9NWjFpVHhIYW1YNGFxQzRoYnA1U2VRTkJIbE0wU1ZaU1FWVkhE?=
 =?utf-8?B?anh6Y3ZsYzFnQ2NxZEJ6aXBkSUFLOTBCR3drZWlpVFlCN0pTajVBMlVkYjAw?=
 =?utf-8?B?dkFtUXN2WVRTWlNKaU5PVHpDdTFFaEt0M0JydkZvQ0RBdmRYRGY1bXp0YmZ0?=
 =?utf-8?B?V1ViQ2o1OXFuRDErb1hvSXk2T2wxMUdEMEkrakFNbFJTVWEwY2duSG9kbUJJ?=
 =?utf-8?B?VXg4SjB2NjlsYmtRbUpzWUpRYWVSOExEYVFyM1FUOGhUZ0NtSmxWeWo0aTdV?=
 =?utf-8?B?ZC96aWsyQ05hVURjMmJETytIUk9hR1VQaXRic2dNTE45bVFWZ0ZKTU1LODJ5?=
 =?utf-8?B?WmZVdFphMmc0YnJiQ1BaeEUyTjlCSjgzSzgyL3hJWGJzODRvZ3FHeGJ1emZ0?=
 =?utf-8?B?dnVyNnNJMjZzOXZ0TzZEb1BqZW5RMHBOWTV1MHJXTDc0ZHoyd1l5UnR3K01t?=
 =?utf-8?B?T0JBL1czRVhpRTV1WDNiOGtkeTF2SFpDVlptTU5hS3JwT0Mxbk5lVFVrSGg4?=
 =?utf-8?B?cWNBeTkrakNpZXlvdjc3NmFZallJMnRVVXhWUlhHSFZVRXNod1VvblNKeU0y?=
 =?utf-8?B?cThNcFoyVDY0bWZGaFpPQ0ZBbWE5N3dmNnppM1JNN3R0cDdvNUtIcnlLcFg4?=
 =?utf-8?B?Rms1Ky9QY1JBdllSYUFIb2QwSzlQcTZ3SElXcEVaSzFBdnJGdDRYS0dxbk85?=
 =?utf-8?B?c1BvelRXNnZqalE4cDlzYTFRUmYvbitIYUZqMUthdUxnaDhuN0JiNE5PbDI1?=
 =?utf-8?B?LzgvSDlPQllVMUMwV3NSY2QzRTJsQmZwaFVOVXAxUUcxYVplNStGaExEa1h0?=
 =?utf-8?B?WEVhOE9ta0pVQVBJU1JROVpiVkpSMlJiNHhEOTZaQzdxL0JjcVVtalU2cXAv?=
 =?utf-8?B?Z0FGVEpiU3BOMEU3L3ZpQkkyeHJvRFVJTUh3aTE3bUhwU1NoUmZzcDJpaW5K?=
 =?utf-8?B?TUt0aFhTSW5WTU9uL3Q4N3N3d002R3NvNFd0U28wSUVySVlKLzlaRkM1aUgv?=
 =?utf-8?B?YXVuNWpJSWUyQlJFRFpuaE85UGRzY0FvQXc5dkdnQmlHUzQxUnBNNGRDckNj?=
 =?utf-8?B?Y1lNWU4yM3IwR2IvWXdSVFFaWGhvL05VanExbHErYXJGM1luL1VyUTVuLzls?=
 =?utf-8?B?K2RRMGZSSjFITGlMVG9UUEdxTmd5dmpZcVh5QmtxQXR4RWRSLy9xY2ExaERa?=
 =?utf-8?B?ZEpSWE1aUDVYZVhlQzd0Yk9qbm1ZdURaZVlRNnNuZ0VlOEtOVUo1b3BWVEti?=
 =?utf-8?Q?JVBEmxKNTbB3y8qR7HzZJnXBc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8666b3-89dd-4f0d-be8d-08dce2518ba8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:45:04.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g88W/eBzUNHkAoSGVu1d0GzjoGoF4kkK7K6IO97cN3R+yWS5O7znmbYa6rulh1IXXvuIfYtf+K9sj3qrDlP1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Oct 2024 19:45:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8905


On 9/30/2024 12:43 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> In message: [meta-virtualization][master][scathgap][PATCH] device-tree: Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
> on 27/09/2024 Sandeep Gundlupet Raju wrote:
>
>> Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
>> are renamed in device-tree recipe.
> Which device tree recipe is that ? We should include a link to that
> base recipe in this commit, so that others will know which one we
> are tracking.
>
> I checked meta-virt and OE-core and didn't see any variable renames.
[Sandeep]: device-tree recipe is in meta-xilinx 
https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/device-tree/device-tree.bb
>
> Other than that, no concerns with this patch.
>
> Bruce
>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   .../device-tree/device-tree.bbappend          | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>> index e235826..813c08f 100644
>> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>> @@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>>   ENABLE_XEN_DTSI ?= ""
>>   ENABLE_XEN_QEMU_DTSI ?= ""
>>   
>> -XEN_EXTRA_OVERLAYS = ""
>> -XEN_EXTRA_QEMU_OVERLAYS = ""
>> +XEN_EXTRA_DT_INCLUDE_FILES = ""
>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES = ""
>>   
>> -XEN_EXTRA_OVERLAYS:zynqmp = "zynqmp-xen.dtsi"
>> -XEN_EXTRA_QEMU_OVERLAYS:zynqmp = "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
>> +XEN_EXTRA_DT_INCLUDE_FILES:zynqmp = "zynqmp-xen.dtsi"
>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp = "zynqmp-xen.dtsi zynqmp-xen-qemu.dtsi"
>>   
>> -XEN_EXTRA_OVERLAYS:versal = "versal-xen.dtsi"
>> -XEN_EXTRA_QEMU_OVERLAYS:versal = "versal-xen.dtsi versal-xen-qemu.dtsi"
>> +XEN_EXTRA_DT_INCLUDE_FILES:versal = "versal-xen.dtsi"
>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal = "versal-xen.dtsi versal-xen-qemu.dtsi"
>>   
>> -XEN_EXTRA_OVERLAYS:versal-net = "versal-net-xen.dtsi"
>> -XEN_EXTRA_QEMU_OVERLAYS:versal-net = "versal-net-xen.dtsi versal-net-xen-qemu.dtsi"
>> +XEN_EXTRA_DT_INCLUDE_FILES:versal-net = "versal-net-xen.dtsi"
>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net = "versal-net-xen.dtsi versal-net-xen-qemu.dtsi"
>>   
>> -EXTRA_OVERLAYS:append = "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('ENABLE_XEN_DTSI') == '1' else ''}"
>> -EXTRA_OVERLAYS:append = "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getVar('ENABLE_XEN_QEMU_DTSI') == '1' else ''}"
>> +EXTRA_DT_INCLUDE_FILES:append = "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}' if d.getVar('ENABLE_XEN_DTSI') == '1' else ''}"
>> +EXTRA_DT_INCLUDE_FILES:append = "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_FILES}' if d.getVar('ENABLE_XEN_QEMU_DTSI') == '1' else ''}"
>> -- 
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8903): https://lists.yoctoproject.org/g/meta-virtualization/message/8903
>> Mute This Topic: https://lists.yoctoproject.org/mt/108696924/8188369
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

