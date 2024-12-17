Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F99E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 17:53:29 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.84])
 by mx.groups.io with SMTP id smtpd.web10.87749.1734458009097963529
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 09:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=ntT8KFIc;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.84, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGYRB6WFIhDytB/44I55NA0ISoZkf+rpu5mi1LISfZ7DWk84m8U/BeNsrDebs5ukczR6qhZhLVsmyYRPqT7g7XGf/jdwV20eE30QXlwv+7ss7D8xiGju4lCuez0dNeoX3StUoPav5F1DHjzCdx3XT/Mf2W/QDAcrcmyp9NYPn8JMrjyxqZOF2E0X8XTVeD9+3Qpsv1zDEsha60ZuQ9uL7x3p9AQDXMeGbtnDdZAsptnJvChPV2LrqqIqtU00Zbh8igZWV9FVbms4xOkamprxpWuyfUJN/pWiuAwr8eHZ/PyNdecWrk0H88ThsCtup3Zo1taR+PoCMH3xCDF3uyuT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEkosu2rkJXKo+44mVQIh9IlKJiB0GbrCmNpI2cFKLA=;
 b=XHjwd5Qv/dHn1s1jGOVS6+4INe23C/JEQXG7Jak1YN9mL0ZaKNF5xUchwWi/qXdapuNUGnamvmcNt23BTmnbhW292OWnkNN2rgZoA8rJ4BqniDsRjggOoPtPWzmRSKXK9aG2lDhqPjWmxMYxEP6so5h/2oUSgpw/YbmxIYRAZB2ExpyHRyhcXz13Bx4EswV6eX5UvXHvFg+sAMCahwl1M92GtYqy78H7AsRooiQq1lfOBZ9/WNlQKaOfuRNyWhfq90gDEM7r+J8pWVNTNaXCqmKBa8LW7yg2ld6Qh+ZZsxGlP9dWUstu1/Hs5ApIHv0tAhvdNGcrMlDVg3ARNp99sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEkosu2rkJXKo+44mVQIh9IlKJiB0GbrCmNpI2cFKLA=;
 b=ntT8KFIc7GGc7aIve9lahZfFOhcgLDMaGsSFXE+sP2M1JMVdai0XoIT75fCnrkpRChI59DiUl4H0rRev5BH607ZtpdQJVqURbnSP0BJ1O3sS/R+vujtATSoOO1IZgrzGd1TEHeiKO8v6NbsIzqxWxO7/Xxb3/o/NZeL2/9MA99Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 17:53:23 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8230.010; Tue, 17 Dec 2024
 17:53:23 +0000
Message-ID: <29aae416-4352-4fc9-ad55-32f76f69a555@amd.com>
Date: Tue, 17 Dec 2024 10:53:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 0/5] Add bbclass
 for xen launch config variables
To: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com
Cc: mark.hatle@kernel.crashing.org
References: <180F89FA56BC204A.19074@lists.yoctoproject.org>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <180F89FA56BC204A.19074@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::7) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 301d69a7-79d7-4f18-9b26-08dd1ec3b352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXVPeTVmWDMrUktDeDZZdk9vY0RkWkFvSVNycFB3Y2VTUWQycnRZQkZ0K1Jo?=
 =?utf-8?B?SlJiOXh1ViszWStTRTZOT2JSNmNva0NXRTBEMVBLNDBHUGlGREpEbndQcW1h?=
 =?utf-8?B?ek9jT2Z5dy9kV0syN29YeUVsUE1MazlXeUFCWmhqYnFUWURNMzQ2Y3M4aTdF?=
 =?utf-8?B?SzFKY0tVMVJJOHVOdGs5NVJsaFFPZVhidzdkT3ZxbnRGTkp2RCtORENMTGhh?=
 =?utf-8?B?UndxZjVhdzVlenJjb0V4SDBXTUtnYTVrZHV6WkpJTlA1dTgxZjIvTHA3VTZZ?=
 =?utf-8?B?YkZKUlQ5Rm1vcWVaaWJ0NUc4bTJESVlyUmF3cEhITm5naDZaN1dqSnE2VnFn?=
 =?utf-8?B?cmdEWVF2NTlRUS9QcDhFN3NaQmhFZmFsaUZVLzY1d3FkQm9FUDI1c1BFZ1Rn?=
 =?utf-8?B?Z0JHalk3MmJaN1NEMkhCZk90djBxVnZnV1E4a1VvY1gwZm9JUWxMa3g0K09E?=
 =?utf-8?B?cW1KekNBWGN0QXpyTmluK3d5djBycmR4YzBoWEhyMTd6NjJJN08zVEpKMzBp?=
 =?utf-8?B?N0xyNHhvdUo2TmpaZ09QM01aR3dDZDBlUzA1WWtNakdMdUlzbVJ0dWNDOFdF?=
 =?utf-8?B?TklRQVNsUjB0YlZGSTM1eUx0KzJvNDJXMSs2VW5LamZpdWVnVEp4UGpWOU1s?=
 =?utf-8?B?dWR3L0pQcnRMcEluc3JGNklZazN2eHNGNmVEQTlmbkV4VGt6Mm8vcU8yZk5n?=
 =?utf-8?B?VVVjcFdwdC84ZjU3N1hveGV3TmFJNlFjOWJmc2pqSmZodHp4d2llWTlodVJH?=
 =?utf-8?B?c3ZqSmxnSlRiRWNRYjhKaWxFcTBXdlV3cEl3Q082TDI0aVhaL241YTZES0NQ?=
 =?utf-8?B?Y3JJdzNpSUNxRjlzelhZMkVydmI4bXlvdkQraXVsVXhxRzFtRFNFNzNzcldI?=
 =?utf-8?B?KzZTS09TSmUzVVJiWnRmT3VOVjVDL1Bjb1ZkcU4wWUhNT0EwTEFaS2JPMWd3?=
 =?utf-8?B?WkR4aTF5b2ltZjlTOEg1OFJBT2ZOVDNZRW52K1p4ckd1TGhXQmRQbmh6MHh1?=
 =?utf-8?B?ZmhrWUc3MUVQSVhVYzFrWFozZ3VjYjR3ZWtZSU5zcUFSZ2dNckFiYXdlWVBo?=
 =?utf-8?B?ZW0rVHNJUkc2K1ZZTyt3RUxJSlNhNGhyMWlhdTRHaWVXYjEwajlzNEdKL1Nl?=
 =?utf-8?B?cGk3MFJYcEljWFFpS3lvbUlsOVdhRjBwVVAzUDF5MUxESm9uaWxPTXZOQTdy?=
 =?utf-8?B?RGF0VUNxZmpBNVh3cjVnYWhPY2RQR3lxc2RYN0NJSlBxV0lIcGJKQjAvbkdS?=
 =?utf-8?B?NkFnbTRya0VpK3lnQXgxUGt4YzZ2T0lqL2R0dlhhU3M0ZnZmN0VwMDkxeldY?=
 =?utf-8?B?eTF3ZC83czRzLzBkQWRrNmRQaUNRRTFscGJFYkVTT1E3b3paRnhvTXp3ZnhQ?=
 =?utf-8?B?bzBBaFlJRWQ2eENtVjJKNnpHb1FYNjB5ZnhKZlhRdElHTW9qU1NCT2V4TkJY?=
 =?utf-8?B?SzM5ZFQzc0pVN3B5bFFIcnBWVVQzWG93ZjJHNVFKL3RlMXJGZkxhOUhLd2dZ?=
 =?utf-8?B?aHlWYkZRQ3AyK1Iyc1ZlNXZrdXVrMnk5Z21ySDhVVEdBb1ZVcnVOZzV1Mkwy?=
 =?utf-8?B?ZXZkZ2hsMzk2ZXNNcDFwNjJUMkFOQVd5ME1lSWR1MUUySTIvQnFpc2dqU0F1?=
 =?utf-8?B?SG5HRUtMNThUbnlCN0FVOGNGRmZaVVZTRmlLSFBVakRnUDl3NWpaSWt6OGFG?=
 =?utf-8?B?cE9KNFB6UmozbmlFSDhXUC8zRmZDTUFoWjMvblp1V08yK25nK1o1NTdCM21l?=
 =?utf-8?B?ODVGQnJJRzAyVmdldzhBK202Z3RueW9rV1ppYzZoRFR5d3VxRlI3MzRmODZw?=
 =?utf-8?B?c2JDR0p2NWpVUGUrQVlSdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnlUSTNLMGtURUpqcCs2YWFnZE1jQ0NGWFhNQ2hDYXhJalVRZDlWbkJIbmc2?=
 =?utf-8?B?eG9HM2dORWZVZ1dZeWVYQVl4SnBERFVqRFVrQ00zMVl4UlRkeFA4QWx1MTVn?=
 =?utf-8?B?NEo0UisyQTRsbFI3dWVML0RuUUsvM1V1bW05aXA1QnJvQkp2Z2IzbXB3d2Fu?=
 =?utf-8?B?cC9YTzBnRFptUkJoQVd6WXNZV0FVd01SWHVlYjlwdDliNzRCdDBpdmxwbTlM?=
 =?utf-8?B?cWZNTmVXNzJMZ0RDTTY4YmhwaGUvbWFuVURETnkzV1l6L1BmcDJ3SmcxSm85?=
 =?utf-8?B?MmRKanhwd1cxWGZVNUx5NDg0TzlXTGdXeVFHcHY1YUUzMTh5STFYdE41cEJu?=
 =?utf-8?B?ODBqZnBLSlIxTlNXSmw5bmtmZGZpcXp0TG1rZW1UdFRKekp6a280L0FFN2Vv?=
 =?utf-8?B?MURKRWh1UWJhelFRSmkxVERoTW9zMTB4ZWZwYXFlenF4YzVHbGw4NmJ2L3VK?=
 =?utf-8?B?cjFBR2N5WDhwTjI1KzlGMmRQWmUveThZWWlSandXbFVlbFhNSnlBempqY25Q?=
 =?utf-8?B?cFBkcWlsMCtMbnJ1eHYrT2h6bnVFUjBWQlV0ZmhFdzVoemh3Z21TbFlMaFE5?=
 =?utf-8?B?MXFVcVpRd0RzVndIbVNQaGZaL21uQU03ZGYrajhMbko2bDRFTUdPblFidXRJ?=
 =?utf-8?B?RTVBNnJwcUtzdXh1TmtMbEVOUnZPeCs2VmNTSzA4ZDBLdklLbzhpYjBadWVw?=
 =?utf-8?B?SjNGMG5KaGs4UThSdzY2TVlLd1BvOC9XR2s2STFKQnJ0NU4vRGlXcW45djZP?=
 =?utf-8?B?TE9oVERyUTk5aTJxZkVRMTBkcGpvb1VDTS8zcXlzNDVCaUlFZ1ovdUZ4MGwr?=
 =?utf-8?B?NnptQ3VpT0NISmVOdTV5RkdBanpOL1REaE1wSS9ZMVNMRktGb2tkUkFmakdM?=
 =?utf-8?B?cGJzcC9sK0tGZUdTSXlUWlJYVERwN3J0emhKVUVEbTBNd3dlZHZqZEVyZUJI?=
 =?utf-8?B?M2hsMzBYL1M3S001VFI2NUp2ZEt1MzFzNE1vMTFhWXZTRi9ETnd5RG5RaHU5?=
 =?utf-8?B?R3Z1WVk0YjlNQUhDQkN4eU4vd2pOb1J6TnNvQVlsTDBvNHVsTmsva0pvSDFw?=
 =?utf-8?B?aHdnOWNlRm41bnNRaVJ0ajh6QlRjTzJhWEdDMXdLWU9oUE9pRU5CcFJiQW1x?=
 =?utf-8?B?ZjVUa1MxSUhXeTNpdkxhRTVjczV5NnJOYTUrRDhtS25yWmpUd29XR3hBb1Y5?=
 =?utf-8?B?Vm1lMHZiWnZLa0JKbHYzVEhXbnAzZFJuZEsvcEI2ZWZZRkVRdm9IMUV3c0Vp?=
 =?utf-8?B?VjBpdHM5UGxuUGd3d0JsYXhqYTdXWDJMOUYwVjRWL1IrVTM3eFVib3ZaNnRG?=
 =?utf-8?B?cTQ1eXAvSXFhOGtTMk5ZNlM2U09JQ0NDTTlZZ0hmV2tVcFY1Uzl1dHRycnho?=
 =?utf-8?B?YTQwOEt6eHRyQVZ4d1JOanlPSGhiakY2T1hCbTVITHZvT3pZc0tMTURxSUdx?=
 =?utf-8?B?TjJKaDhhNHpHcnRuUDcrOWxXWlFsalFuZkVva2Y2VUpVN0VhNGR5dlFDRGxu?=
 =?utf-8?B?VU5seFE3em14dytaYXFiWXJ1K2VwN0R2VnFvUkFTc3hYUlZ6RFlpSlVSajVv?=
 =?utf-8?B?eEtaWU1rKzU2am9qcU5ZdjI1emtFNEtHRDN3anNLR2p6TjRmcHhsdW9XVk9S?=
 =?utf-8?B?YThJNVNySFpsTklnSmV2dWZWZHA2dzBWKzcrSkVTRkhyR3oyMnBiUC9RVTh3?=
 =?utf-8?B?QlV6MXRSZnBmTGdKM1dzczdrck9WOHBJTVZVem14UmV6Mm9KcUM0UGxWMHZo?=
 =?utf-8?B?OFlQR3kwMjZBdzdsN2swR0Z4c1VKaU56NFVmd0RrMXdzcUkwRGRFcUM1cGx0?=
 =?utf-8?B?dnIzc3F2eGJaMVMzOU1VVDBkL2xTREJRc2VneHE3SzhpRitBd1VCMG9wM25X?=
 =?utf-8?B?RW14bVRXYzNSSjI2U3hiakJkRnFHNzVWVEdTdGxPL0ozZzZ0NkRlVUhjWGdL?=
 =?utf-8?B?Uk9wVVB4NGdDV2dLcGd4NjhIRXJDUXpDazNDWnZpTDJnTkxoZnpLN1NXZlF0?=
 =?utf-8?B?UldyNkJRRlBrL2M1eUxZcmorV2ttMDByZ0F5Zm9VTVNYOW1FUTVTay96QW9W?=
 =?utf-8?B?OUtTaDBtVWpqWC91SGV6SWdHMlBQTGw0UVhpTE4wa2xKMm5vby9QTTZkRkRu?=
 =?utf-8?Q?PMWT2EXkSu6Jj8H6jQYCqxsfg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301d69a7-79d7-4f18-9b26-08dd1ec3b352
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 17:53:23.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds5KsZSa65nuheryTe7ubX23qmOPKjElEU7IqoFvl3HEg8uLjFoIpoDWk+7FSlTAqTzfRI11kt0Tp7wheV9bvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Dec 2024 17:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9059

Hi Bruce, Chris,

Any more comments on patches?

Thanks,
Sandeep

On 12/9/2024 7:54 AM, Sandeep Gundlupet Raju via lists.yoctoproject.org 
wrote:
> Changes in v5:
>     - Merge below 2 patches into single patch.
>         - xen-boot-env: Move xen variables to inc file
>         - u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>
> Changes in v4:
>     - Fix xen-boot-env.inc by inheriting xen-lauch-config bbclass
>
> Changes in v3:
>     - Rename xen-u-boot-scr-configuration.bbclass to xen-launch-config.bbclass
>       as suggested by Christopher Clark as this is not u-boot specific.
>
> Changes in V2:
>     - Rename xen-u-boot-scr.bbclass to xen-u-boot-scr-configuration.bbclass
>     - Add comment in u-boot-xlnx-scr.bbappend to specify where BOOTMODE
>       variable is defined.
>
> 1. Add xen-lauch-config.bbclass for generic xen launch config
>     variables use by any soc devices.
> 2. Inherit xen-launch-config.bbclass in xen-rpi-u-boot-scr.
> 3. Move xen variables to xen-boot-env.inc file in xilinx
>     dynamic layers.
> 4. Include xen-boot-env if BOOTMODE = "xen" switch is enabled.
> 5. Add load address to boot.cmd.xen script echo messages.
> 6. Inherit xen-launch-config bbclass in xen-boot-env.inc.
> 7. If user brings in their own boot.cmd.xxx file they can just
>     inherit xen-launch-config bbclass and use the generic
>     xen boot script variables.
>
> Sandeep Gundlupet Raju (5):
>    xen-launch-config: Add bbclass for xen launch config variables
>    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
>    u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>    boot.cmd.xen: Add load address to echo messages
>    xen-boot-env.inc: Inherit xen-launch-config bbclass
>
>   classes-recipe/xen-launch-config.bbclass      | 43 +++++++++++++++++++
>   .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in  | 10 ++---
>   .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  | 13 +++---
>   .../u-boot/u-boot-xlnx-scr.bbappend           | 13 +++++-
>   .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
>   .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
>   7 files changed, 103 insertions(+), 50 deletions(-)
>   create mode 100644 classes-recipe/xen-launch-config.bbclass
>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9044): https://lists.yoctoproject.org/g/meta-virtualization/message/9044
> Mute This Topic: https://lists.yoctoproject.org/mt/110006797/3619217
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [sandeep.gundlupet-raju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

