Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251E5E6ADCA
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:55:59 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.55])
 by mx.groups.io with SMTP id smtpd.web10.36180.1732312550636191080
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 22 Nov 2024 13:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=HsGKjLgR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.55, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrbxKzSySthxLBig6m93veK0Ql3OI7srfKiDJ3WCFSL5ziITjQUAmtk3oRIXs2lHd3wWBKCxPQopC3N4vfWcGNC8EKuGbvxaLPBvxAQvmLcHxM+TF097lQfA/7A/ImiuCQ1MCyK2oFxuXYUKOXZ4RQ4pa6VqoWtZ1R+WeUMPy6CyF74puAXSJ8sK+LdtHMfnQWaBwpkZ0yFWcAqnP1wYD3I2cAErqVuhMxpaRR/TvqlsDA+i8kv7euNJ4kl63VBIDGzSMtmDpvT9SYdkoL6opjcZzeIGd72lf58gSr+EMiROCGoMZA5fMCrrXH6ks4r/hY6Yryo5fISSIzUFV3Grzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMwh6Ag8duxvCG9d5Y+D0W6h3ORiGi3VgRn4EEeHw5w=;
 b=YSyardSqmIwXLwWEYRPgRYR3B+u8HnyOoJYFP6COG6BQ4DiouPTWXSyQboiD3tCtzKpoUVllcTxaIi0Gomw9bPBdOoyCH7WkJGs+A+6QU7BfeEPC0+IBhoITnSiE4uC6WiMIHD8/XpXB9PcPAW+8gv10/ESYbOHumhlZKV6pAQ/w7sjDzzZ7Hg5iel/gLXcSvYSerZnVgWrTnaGZVA0zRnaRuNQ+75dOLIEcL8NC8yUrSQyxqM5KlIHOZxjN2jId7zYaUzPgIldOWSp/hBXc05iHyzrT0OHyt1ouTl04SGRRTuj1s+oNUbJWsqOY/gS3DUOX1r6PgfFd7SAzQR74EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMwh6Ag8duxvCG9d5Y+D0W6h3ORiGi3VgRn4EEeHw5w=;
 b=HsGKjLgRzdYQKpzt+F6si9eM5mdLOYeYlksHUoae4tBfT/rEEn5xBbQSSBD/n5zW3YSyXgim86XbO71Fu69hLySnzWnfZSGY0FZZH2VSiCReYpdUC0ssh/FsbxlTt4U/KkpI5EbQSFoTN6U3DLDkyss+/cmfBqW2HpCTJSJAexA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 21:55:46 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8182.018; Fri, 22 Nov 2024
 21:55:46 +0000
Content-Type: multipart/alternative;
 boundary="------------aru0x4d0bqoqFnRnmjectd2j"
Message-ID: <6952bcbe-548b-4bf7-b994-6a28bcd4d314@amd.com>
Date: Fri, 22 Nov 2024 14:55:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][PATCH v2 1/6]
 xen-u-boot-scr-configuration: Add bbclass for xen boot script variables
To: meta-virtualization@lists.yoctoproject.org
References: <20241121224929.776765-1-sandeep.gundlupet-raju@amd.com>
 <20241121224929.776765-2-sandeep.gundlupet-raju@amd.com>
 <CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com>
X-ClientProxiedBy: CH0PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:610:76::27) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 622f0880-8e15-4259-0a60-08dd0b406b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGcvYk1kbzlxQlBIREZWbEthNFhhc3JEa2ZSTjY5TUhxYkI1Zmc2MEV2Z3Zk?=
 =?utf-8?B?NTZpdWxrdVB3NGp0WTB1RGdPTHJWNTVza0tkd0t5aU03ZldWTGh2QTN4T3Ru?=
 =?utf-8?B?WnVmYXZFcERUL2tteXkxdkVpRkE1RTlJcFZjYVhBNllpMnlTVmZCQlJJemIw?=
 =?utf-8?B?eVM5WXdDTHdCZEFrV0RFeDUxSHBUMTQvN1BJbnZOSjAvSXBob0t0ZXBoTjlp?=
 =?utf-8?B?Y0Zsc1k5cXhJRk9WNzI4a0FBVHVOcldORW9mYkVoSHNNbm80Ui9PRWlVVTgv?=
 =?utf-8?B?U3NTd20rSURHbmZSeTdBM0taa0tNNkRPZ3BPMElrbk5iUGVRV3lhVmtIS2NU?=
 =?utf-8?B?UDNnNHZ5RWhicmIzNlYrRWZKRjB6NmxUVkt1ODZxMUhOd3hJQlQzV0IxQUtL?=
 =?utf-8?B?RXQ2R0hBS0xkaUYwVjdlOTNTTkMrbnpEWjFmcWtLRkl5akhkM2NERHJRTXlN?=
 =?utf-8?B?QjRmY2tybGMwTm5LL0tVNm1uRDN6d2w1UEhxNXlveDNpQ2Nya2QweDkxUE5l?=
 =?utf-8?B?MWQ0MllOVzg3Y0ZhT3FhNkxjRFdxZWJvcU1lQ0J2OUhabFp6RjMydEtDdzZi?=
 =?utf-8?B?ODVLVE9WYzN0Q0NhL2E4UlNaTzNNbi9yakRwZzJjSlZSeHkxSXpVRkF3ZTNv?=
 =?utf-8?B?RWUzcE9qdlBPb1hkVStFWmdpa3EzVjE3cHV5MEl6QlFiMFBjRkxIZlYrbUhZ?=
 =?utf-8?B?L1RYNWZGM3QvREsreDRCaUxmckpQMnNYZ0svZnJUMnVNaU1PeFNhd3dtMmZy?=
 =?utf-8?B?R3l2OExyZGhrM3llc2psNVlhU2FGL3VWWXk2R3pkTUJtNnRGZzJOTEExOTRW?=
 =?utf-8?B?bWJrRXdabG1XRElFcGIxbVN0OFpxcjRZVUdzKzJ1NGJ2bk9VVEVDQktkdkhZ?=
 =?utf-8?B?NmZvc1BlUjJFK0xSYnNaQktDOHZjbXh6VlJVOHpzQnRyZ0RwN2tvVFFqeElz?=
 =?utf-8?B?UGVudlNoYnJQUy8rMFc3ZkpxdEJXeC8wUUhOd2pMR3lINmhJYUNRWDZMaGVC?=
 =?utf-8?B?eGk2aDBWOHJHVzBZT3pmdFNaN0tTbFA2T1prWU00OUxZUTZIWGNCZjhQL3hP?=
 =?utf-8?B?THQxaHRuMWNranh5MTdmNzlRbkx4TU9hUm52WGtmc0FkT05HQWY0SGl1Q0FO?=
 =?utf-8?B?eFk1dUpnaG8zRWFQbFYva1N3MHpXZUswY0k4UW9CaVpQZVIrU1hGUXQ5eStS?=
 =?utf-8?B?QkE1UytMWVRkVm5uS2xEaEZkZjdZM2JxcitWRUhtK0ErY2tpMFhkTEdpYlhV?=
 =?utf-8?B?Y0JENHU3T09nME5iTFRuV2pjczhMSjd6aGpwNEcvTGI5eHRlVEFBYnVHVVVk?=
 =?utf-8?B?YlpmT2FVem82S241a2ZGU0xHZDZHWnBmNDBIYWpvemJEbHFVMHVmcXlrcDhQ?=
 =?utf-8?B?UXBXZFVpNWRXUTVzOFlLTWFmc3hGV0pOcHM0STZ3QWFKRzJVUWZFaDdzckM0?=
 =?utf-8?B?TEI1eElHelFmWEJxSUY1ZjFmZ2IreU4rdTNsS24vMnhKMHlaYmEyV0labzdY?=
 =?utf-8?B?SGh2UExPU1B4QVJkZXR4VTRVWUcvMnJnNmh6R2hPTXpJSnp4bnE1N1VCYnVk?=
 =?utf-8?B?QjFwaUZPYVZ5UnhsZ0ZPdzhPS0VRT2pmckMrTGNnZjhIcHYvTHVLcFhTU1E4?=
 =?utf-8?B?N3ZnN0UrbFVlQzVqMWNSOUlwcTllT0libFJ5K0xCbnpZL3IrRU5rVnV0NGVS?=
 =?utf-8?B?M3VicGJUdXMyTjkyT3FkQVVNRlFMQXBMdjZlWGhNVmIzQStvS2ZuWWFRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHBEWDY3dE8raDZOVjdFL2h0TVN4MGFCVC9wOUdQaUFmN3QzTXBTcEF6N01h?=
 =?utf-8?B?Q0ErQ1RzVzNLdmQ3YzJYMUxCaGF6bktmZDF0c0trQjBVZ2NlcnRhZkFPYkox?=
 =?utf-8?B?WmlyWnRINzhpY1lRWG02bTlwa1hrR1FvTEg5bW16Y3lCYVlzcTFDdUdTSFJ0?=
 =?utf-8?B?RHdtKytGd0IxWUg2RFdXdVNBaWZmQkcyL3lRTnFWUll4ZWJrand0V09EdFBF?=
 =?utf-8?B?c3NiYlp2Z2IrU0VlRllnMnE3T25GWEJpdGJpVnU1NkNtcC9TQXU1a1BIWXpl?=
 =?utf-8?B?dWNmYlBnRXgzSHpGdzlONkhrKzA4eDd4Tks4b2RUdk8vc3QxMDVOWi9pREF2?=
 =?utf-8?B?NGx4c1U3QUxWeFN0eXppV1o5SjM0dDN6bTd4WWpLZVUybmpNc0Y3czd3K1Jt?=
 =?utf-8?B?RWpwSmRHQVFKdjBSdklIZGZqYXJGM21hZWx4K00zd0k3Zmhsbmc1ellRSW5I?=
 =?utf-8?B?bTFEWXJzaVdxN0g1dnZaSkxXS1ZLWmsvTDNlVXUrZUFuaWh3Q1p6M2F0bjg3?=
 =?utf-8?B?VjNFVEx3OEJnWjJZMkhDV1YyenRHSm5EY095RVVKMXZwekFsajRpdnM3bUwz?=
 =?utf-8?B?R044YXNCbkcxWUNxaWczd3RMY1R2cktRWFVhTE1Od2JjNUFSTXpkY1BhbWxI?=
 =?utf-8?B?cjY5SFVvdElBYmI5eWZXU3pQKzJMYzRscmVoNmd1Y3grR0VzZjVvSkVnV25D?=
 =?utf-8?B?NVp5UXB1dFJnSnJIMW1HWjJaQkpyRTEzNk5IckRoWWRPSnBFQzFmd2twM0Rp?=
 =?utf-8?B?WTJETXc1YTROdk9ndC9PcFJNVTFJMWQzSnVQSTVGd09kWlpuNjA2VWdpY2ps?=
 =?utf-8?B?b202OXBRazFKUVRyZGNsZ2hPMG1lTTkvL2NCN01YN1VzbktvVWFFbkQ5Unl3?=
 =?utf-8?B?VDYzSTFKYTliWXR2dkJEVW1aSWFXTnFEZEZYTjlUd29GZjgybStEU0ZrZVEv?=
 =?utf-8?B?WUtxZVRNSER1eHlFTjNQQkxyUk9qbmlhN0xzMmtuQkRoQzJYSkVvanJnUWcx?=
 =?utf-8?B?NVNmczNKUkZTTVJmN1hudXFOQnJzdy9EalZTTDBHNFpIeThGZ2JGcDM4QTFG?=
 =?utf-8?B?OHNPbExMdmpOUEZmS3BpcW8vSjlvcy9tVjFyMjRsK3JjQ2tOZWMxbk9adXpi?=
 =?utf-8?B?R2RFekRMQkIyODlTMW5NaHpCQ1d6d1VXcHJEbGNITjZ3c0xtVzJ2WXNmbTFo?=
 =?utf-8?B?MVVkOEcxWjNoQ3VEeVVOMHY1QnpjZTA2R3RsaitoUTRLYmhWUzYvamg0TDZO?=
 =?utf-8?B?Z2JLVkFJbnR3bElPSVRwenUzT1RkUW91aUdiL0hjNlo5emJiaXIrOGtMN2Zj?=
 =?utf-8?B?cUxWTlFsejVKLzBuREs1VndYaGthbVErUW9iN1gzU0p4T1dEQVhrTzJ2V0tI?=
 =?utf-8?B?d3NsM1pzbS9yeDZubFhOMEJIQnFiUlE1Z25uUWpZWUEzVVVIREZzVjdXazBw?=
 =?utf-8?B?T25yK285ZXNFWm1OdVZoTWZtRE51RzRvRWZGclRhUDV1S2NvVDY3ZlkvenlE?=
 =?utf-8?B?RTQ2dXFpQXdUeUsxQU5vd3JMN2kzb0xrT3h6WUpZNGJCbFpRZ2J4aENtWjc1?=
 =?utf-8?B?VEtZMy9aTmdNaFFsa0krbE1XeXQ0ckJIS3pXM3B1VElxR1lSMTlUeCtBU0ZY?=
 =?utf-8?B?TEpkV0xZWG5TQ21sSnMxTE9XS2JMN3l6Z3BoMzJROFRjNkl5eTNTbkVZOWoz?=
 =?utf-8?B?ODdjSWFhZ0VJOGR6ZFZOdWpkQXh2bVRzSGl0WHYyOW4vYnRHZG9iVXE4N1hp?=
 =?utf-8?B?ZjhtT2tMOFAxd2RYSmtLYXZPdGdsSmpJeU5MaVNsQThjS29TMFRtQ3Fvc3lo?=
 =?utf-8?B?b0dxV1FMTFFmcDNDNjJUa25EaTFHRmR0V29YS1RMcnh0aXcrWFZiVEFsV3FZ?=
 =?utf-8?B?ZzZOMFBKTkFOQzNBNnBIR0pjRXdFUDdwcW9OSVljcEpzRG1EWE5IQjVOWUlp?=
 =?utf-8?B?L2JyRk9aV3IrTDNEWGw5b3kwOXNJaUVxZFIya3BsYTNBNXJtUk5namxmMlov?=
 =?utf-8?B?RnMya2ZHdkFjKzl2eG5pVmg1UWh0Yjh2V2FZYk16ZjlweDlEMWtTZ29LN0g3?=
 =?utf-8?B?RzJDV1JQQUZBSXErSHRYSjdqZGYwL0J4TGRFSzgwWlZTUkZNVUthWDI2emFJ?=
 =?utf-8?Q?2Dt/z6LbaUjNkr7kY+OhMN8q+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622f0880-8e15-4259-0a60-08dd0b406b23
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 21:55:46.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGzYCP71kfFgM6hxzbspCz3t32kG/gt4hW0IDVLXlW9Zuy3b/t4reSIMe0E58eNc1wE0GOgHvHV3dFjEAsNH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 22 Nov 2024 21:55:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9010

--------------aru0x4d0bqoqFnRnmjectd2j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christopher,

On 11/22/2024 8:11 AM, Christopher Clark via lists.yoctoproject.org wrote:
> Hi Sandeep,
>
> This series is promoting some of the Xen hypervisor launch 
> configuration from the hardware-specific dynamic layers into the 
> common layer, and introducing a class that defines interfaces to the 
> hypervisor and its guest virtual machines that should be applicable 
> across all architectures, hence my comments from a 
> non-architecture-specific perspective.
>
> There's a lot of opportunity for development in this layer to extend 
> and improve this area of configuration -- thanks for your contribution.
[Sandeep]: Yes that's the main goal and I've already discussed with 
Bruce on this topic.
>
> On Thu, Nov 21, 2024 at 10:49 PM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>     Add a new bbclass for xen boot script variables. This bbclass provides
>     common xen u-boot boot script variables which can be inherited by any
>     vendor specific u-boot boot script recipes. Also these variable are
>     configurable from recipes, global and machine configuration files.
>
>     Variable nomenclature is aligned with xen documentation.
>     https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>
>     Currently it supports Xen Dom0 boot and can be extended for DomU
>     or Dom0less boot.
>
>
>
> I think that none of the variables in the file are specific to the 
> u-boot bootloader, so: could this class be given a non-u-boot-specific 
> name, with a view to this configuration being plumbed into all Xen 
> system configurations?
[Sandeep]: Good catch these variables are not specific to u-boot, I will 
rename and send a v3 patch. Does xen-configuration.bbclass name works?
>
> Some of the values defined are specific to Arm64 platforms: could 
> those default values be moved into an Arm64-specific class? If the 
> variables themselves are also arch-specific, they could be moved too.
[Sandeep]: Can you specify which variables are arm65 specific?
>
> Declaring the Dom0-specific variables as an interface is a bit 
> unfortunate, given dom0less (and hyperlaunch) systems where there 
> needs to be a method for providing the same configuration memory and 
> vcpu values for multiple guest VMs, rather than just dom0. Do you have 
> a design in mind for the extension to DomU or Dom0less that you mention?
[Sandeep]: I assume dom0 and dom0less variables are same, to enable 
dom0less boot all we need is to enable CONFIG_DOM0LESS_BOOT from xen 
configuration. As per Stefano, dom0less is supported for ARM64 today and 
Stefano is working to implement dom0less for x86 and will be upstream 
soon(not sure on timeline.)
>
> Christopher
>
>
>     Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>     ---
>      .../xen-u-boot-scr-configuration.bbclass      | 43
>     +++++++++++++++++++
>      1 file changed, 43 insertions(+)
>      create mode 100644
>     classes-recipe/xen-u-boot-scr-configuration.bbclass
>
>     diff --git a/classes-recipe/xen-u-boot-scr-configuration.bbclass
>     b/classes-recipe/xen-u-boot-scr-configuration.bbclass
>     new file mode 100644
>     index 00000000..df8287e1
>     --- /dev/null
>     +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass
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
>     +# Variable nomenclature is aligned with
>     +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>     +
>     +# Image Load Address for Xen Dom0 boot
>     +KERNEL_LOAD_ADDRESS ??= "0x00400000"
>     +XEN_LOAD_ADDRESS ??= "0x00200000"
>     +DEVICETREE_LOAD_ADDRESS ??= "0xC000000"
>     +RAMDISK_LOAD_ADDRESS ??= "0x2600000"
>     +
>     +# Xen boot image types.
>     +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded
>     by u-boot.
>     +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by
>     u-boot.
>     +#                Example: xen or xen.efi or xen.gz
>     +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used,
>     Example: cpio.gz
>     +XEN_IMAGETYPE ??= "xen"
>     +DOM0_RAMDISK_IMAGETYPE ??= "rootfs.cpio.gz"
>     +
>     +# Set the amount of memory for dom0 depending on total available
>     memory size(DDR).
>     +DOM0_MEM ??= "256M"
>     +
>     +# Specify which UART console Xen should use. You can sepecify the
>     devicetree
>     +# alias or full path to a node in the devicetree
>     +# XEN_SERIAL_CONSOLES = "/soc/serial@7e215040" or
>     +# XEN_SERIAL_CONSOLES = "serial0" or
>     +# XEN_SERIAL_CONSOLES = "/axi/serial@ff000000"
>     +XEN_SERIAL_CONSOLES ??= "/soc/serial@7e215040"
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
>     -- 
>     2.34.1
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9009):https://lists.yoctoproject.org/g/meta-virtualization/message/9009
> Mute This Topic:https://lists.yoctoproject.org/mt/109713423/8188369
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------aru0x4d0bqoqFnRnmjectd2j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Christopher,<br>
    </p>
    <div class="moz-cite-prefix">On 11/22/2024 8:11 AM, Christopher
      Clark via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div>Hi Sandeep,</div>
          <div><br>
          </div>
          <div>This series is promoting some of the Xen hypervisor
            launch configuration from the hardware-specific dynamic
            layers into the common layer, and introducing a class that
            defines interfaces to the hypervisor and its guest virtual
            machines that should be applicable across all architectures,
            hence my comments from a non-architecture-specific
            perspective.</div>
          <div><br>
            There's a lot of opportunity for development in this layer
            to extend and improve this area of configuration -- thanks
            for your contribution.<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Yes that's the main goal and I've already discussed with
    Bruce on this topic.<br>
    <blockquote type="cite" cite="mid:CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <div dir="ltr">On Thu, Nov 21, 2024 at 10:49 PM Sandeep
          Gundlupet Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
          &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            a new bbclass for xen boot script variables. This bbclass
            provides<br>
            common xen u-boot boot script variables which can be
            inherited by any<br>
            vendor specific u-boot boot script recipes. Also these
            variable are<br>
            configurable from recipes, global and machine configuration
            files.<br>
            <br>
            Variable nomenclature is aligned with xen documentation.<br>
            <a href="https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html</a><br>
            <br>
            Currently it supports Xen Dom0 boot and can be extended for
            DomU<br>
            or Dom0less boot.<br>
          </blockquote>
          <div><br>
          </div>
          <div><br>
          </div>
          <div>I think that none of the variables in the file are
            specific to the u-boot bootloader, so: could this class be
            given a non-u-boot-specific name, with a view to this
            configuration being plumbed into all Xen system
            configurations?<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Good catch these variables are not specific to u-boot, I
    will rename and send a v3 patch. Does xen-configuration.bbclass name
    works?<br>
    <blockquote type="cite" cite="mid:CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
            Some of the values defined are specific to Arm64 platforms:
            could those default values be moved into an Arm64-specific
            class? If the variables themselves are also arch-specific,
            they could be moved too.<br>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Can you specify which variables are arm65 specific?<br>
    <blockquote type="cite" cite="mid:CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
            Declaring the Dom0-specific variables as an interface is a
            bit unfortunate, given dom0less (and hyperlaunch) systems
            where there needs to be a method for providing the same
            configuration memory and vcpu values for multiple guest VMs,
            rather than just dom0. Do you have a design in mind for the
            extension to DomU or Dom0less&nbsp;that you mention?</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: I assume dom0 and dom0less variables are same, to enable
    dom0less boot all we need is to enable CONFIG_DOM0LESS_BOOT from xen
    configuration. As per Stefano, dom0less is supported for ARM64 today
    and Stefano is working to implement dom0less for x86 and will be
    upstream soon(not sure on timeline.)<br>
    <blockquote type="cite" cite="mid:CACMJ4GaMrmrotooNaAiPs0Ofwkscog1L1eDkgG=yU+6YspQz+g@mail.gmail.com">
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
            &nbsp;.../xen-u-boot-scr-configuration.bbclass&nbsp; &nbsp; &nbsp; | 43
            +++++++++++++++++++<br>
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
            +++ b/classes-recipe/xen-u-boot-scr-configuration.bbclass<br>
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
            +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be
            loaded by u-boot.<br>
            +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be
            loaded by u-boot.<br>
            +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: xen or xen.efi or xen.gz<br>
            +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be
            used, Example: cpio.gz<br>
            +XEN_IMAGETYPE ??= &quot;xen&quot;<br>
            +DOM0_RAMDISK_IMAGETYPE ??= &quot;rootfs.cpio.gz&quot;<br>
            +<br>
            +# Set the amount of memory for dom0 depending on total
            available memory size(DDR).<br>
            +DOM0_MEM ??= &quot;256M&quot;<br>
            +<br>
            +# Specify which UART console Xen should use. You can
            sepecify the devicetree<br>
            +# alias or full path to a node in the devicetree<br>
            +# XEN_SERIAL_CONSOLES = &quot;/soc/serial@7e215040&quot; or<br>
            +# XEN_SERIAL_CONSOLES = &quot;serial0&quot; or<br>
            +# XEN_SERIAL_CONSOLES = &quot;/axi/serial@ff000000&quot;<br>
            +XEN_SERIAL_CONSOLES ??= &quot;/soc/serial@7e215040&quot;<br>
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
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9009): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9009">https://lists.yoctoproject.org/g/meta-virtualization/message/9009</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/109713423/8188369">https://lists.yoctoproject.org/mt/109713423/8188369</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:santraju@amd.com">santraju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------aru0x4d0bqoqFnRnmjectd2j--

