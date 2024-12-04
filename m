Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E26E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 18:07:35 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.42])
 by mx.groups.io with SMTP id smtpd.web11.21537.1733335648074786455
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 10:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=Gze/4xRB;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.42, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxv6OGUq59zOVUPsP90wd4K5X7rKWS8pz7T9Pj1IG+R+AvdAM6jx/01YAiZY7jC5qhrfoO937R7t1Rc5HDzoQmydAUwYRo3rfW+XeMIOKNHsub55Z1KrW4seoIuLsWonXuvWIgnQWXUKFTw+AYv0Ilkxh5Jv5SHB/v6Ts7TVtwcR/sAvupQMX3rEf4LN7FRwrHa/VpanhpBFUTmsDqyjNBA4+H1Ttn0I1QnyFZ1dcftJleiTLSCSDuqTP0PvRxuLV5C1CjNqwFgFySLWtHAvZE8vJIAIyWL0gN5xx0xPucV2z+P4TTiDMbgmX9K83oaQKf3+7v0t/QwqWyR1WEmypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w7TX1VDKYES0Xjb8B+mWY0/IVz7mr8BhdsqJoGsYr8=;
 b=kPZ6nUKmwCG+H3Sf0/8asdnx1BDv4N/TJbI7MaUMIGEHEFCbPqzp+8z9XNFxneD4Nm6sDhy9hvwckpB1ARH/XpufRxfaT+l9c0puUerFVJXM8EoluX712FHaLLixY1LfF6stSyTKWYf4jgvyJazKlcSFfJt4yGTU/mCNVXahQFU7SiMiJWkwF4F0pGoGKmU481k0ZwHfa+yli4VUZ4KLUIs5cD8WckFSAN6gO6NYhtp4hScUbXuuoml7PdTaiGy76gzT+pJHgbMwmAOpXJOVbJ9KqQBSqiZVwJPwyyLgSOCPC/x9XXB8CMtztjEuZ5NbPE0mp3KGV4IVdPzOwOgQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4w7TX1VDKYES0Xjb8B+mWY0/IVz7mr8BhdsqJoGsYr8=;
 b=Gze/4xRB4NN9UyTfs/0D3ZJyztgt79UGAkzg3SjOlp2Kidn8maWBjTmSuI5Z/pkxbhRFIQ/kfGhPm6xqna88b+6rbQR85R25naMbN+awOw6mAh3OxQShFFwxPLDUSGKwyHHeAOQTDAKojZ3lP9DzGirn1HVFM+XMB7WiG+d3XaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CY8PR12MB8313.namprd12.prod.outlook.com (2603:10b6:930:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 18:07:24 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 18:07:24 +0000
Message-ID: <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com>
Date: Wed, 4 Dec 2024 11:07:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6]
 Add bbclass for xen launch config variables
To: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com,
 Christopher Clark <christopher.w.clark@gmail.com>
Cc: mark.hatle@kernel.crashing.org
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8P220CA0039.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::24) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CY8PR12MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e0b15c-ab6d-4803-7c3e-08dd148e8160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEl0YlNjSVN4dlhBWEdNZkNBM29MZUxTUkgyWXlNNDFlZTJwR2pZZjZqM0Vm?=
 =?utf-8?B?aHdHQXoxOTZtZWk2c3VFMFFmQUhOZmluMDkwNFVOaGQwdGxjV0FrcnF1MDZ5?=
 =?utf-8?B?MFRGc1RURVFCaVo1c0lpdEtwRk9ncHFqR2IyT1pEN21mUDYwcEhLbzRKNjVL?=
 =?utf-8?B?VTJnN3RyR0UvSzVaNm5mMjRLd3VPY2NqT1ZJZGpSTVRnSzJrNkVuOHVMaUds?=
 =?utf-8?B?QUZQdnpMbWRySldndG1ueFEwNEJWbG5oK3M4R2RDZjNyeTB4Y244cHgrcUJR?=
 =?utf-8?B?dDRqaE0yU0dwRm4xU3cxWFo4TnhZendCSEZ2cUc1cXhBWG5hRlRlQnlHY24z?=
 =?utf-8?B?Q0VPbEkzMlFkb3VPRkJ5RVBaOXlvZlhsQWhNd1gyZVNIVndTRFJlSlJQUklQ?=
 =?utf-8?B?d0xPZEdhL3Jmd2FFc3ZpRFU5V1M3aW5ISDRiM0E3UUF2Kzk4UkYxa21vcFBm?=
 =?utf-8?B?cjlMNUU0R2tYUk9XMktnQldIbDM0bUN4UEUzSzcxRzZEUVBWVk5HcFdSWjlG?=
 =?utf-8?B?dlJqTUUxTU5HOHFPd3JvMGxoRVpZa1huUUliaXVHcGl6dTRsUVlobEVkWmVP?=
 =?utf-8?B?VGlMTEJndDgxMEVnY0pmZkVXU0ZNYlJFb204d3NpZGlDY2hoQWkrNEtHeFhm?=
 =?utf-8?B?Z1V0T0NaaFo1WGkwOVNFNkM2NUJxTWZxNWxXR29kN3FJenR6RkYya3h3Y3Zl?=
 =?utf-8?B?MGJpRzFqWHdSTkxPOTgrbGhOUkhuamR1VGtZUDVMYmFoaEpnYmtaRkx2WGg1?=
 =?utf-8?B?bWZCdWtJRi95eDJYY2RLeTZZVWY0OHpGMXBMNXI4anV6eXNYOWIzRkU4RHYw?=
 =?utf-8?B?MGtpSm8wandhUlMxbnN4aFNvMFNzWmpvK2s0UHFIV1dtSEpXUmdDU2lycWNK?=
 =?utf-8?B?ZFRhREFSeE5VbkpYRzFsNTNUcWt0eXdGNkI5SXZQSC94VWRxN1htc3J5WURy?=
 =?utf-8?B?cm1WTW1EeWt3SzB5K2RuYU9pSlEya3o5Z3Z0Q1daV1VhS1FZQ1VIWVlNZmlS?=
 =?utf-8?B?VmFIT1ZON2w5RjNCS2h6c1VtVzROT3JFenk5c1B3WWxQUFRHaTFxM2dEdHE3?=
 =?utf-8?B?NkZ3bWZmZUtEQnEzNW9vRjVhQUd5cjFDTFBjL3Y0ZUdUc2VUTU9mak5wblpR?=
 =?utf-8?B?bk5wMWJYL0VtNFNqMlA1anVXTGNSQVlGM0pVV3diTC9pY3VsdTFXQmV5SFVa?=
 =?utf-8?B?U3hrdVBQWnJlUkpuc0hjMWNTVzkxTVRsQkdLSGgyQ3BnNTF4MWx0S3hSV2dv?=
 =?utf-8?B?RkdaMVcxSTEwMGpRRENUbktFRnVyVTZydk9MdC9ERjk5VzRNb3ZFYTI2MGZo?=
 =?utf-8?B?elFKcFVVamNncmdseEhGV2djdCs2c3hsMzE2cGFmdk41b0pFS0pmRnVRV3NS?=
 =?utf-8?B?Q3BXbmZhQ2h4ZzdpUmFGYzZyeDlJNjUvTzZOYUhMejZDRThERVJSV3lVZFZ2?=
 =?utf-8?B?UHAxTklSOVU4RG5RNnNqdjVxVGhsZGpGaWJ4MTRsdkJQczJteDFlaGtpZFJa?=
 =?utf-8?B?TlVOb1NtWlNSd3crUWw3SzM0ZWpyZ2tSR002dWoxRmRZanNTWERuaEFjZHdS?=
 =?utf-8?B?MHNrSmlxY2dnN1FGa3JXVzNkOHA1STgva1MxcFBVRFg2SmRwcWtxdkRXTjJQ?=
 =?utf-8?B?ZkhZN0Y1Mk5ZR2kxZm1HK1QwZnoybFRMVmEreGZJK3RGbWVKMHpBVllPY3pk?=
 =?utf-8?B?N0FlcGJLRExEdzViZzg3SXZkRTlONTgzb3RvaHVKMDRqOE91RFB0clFkME9Y?=
 =?utf-8?Q?U3W8iMYWQR2DkUpvqM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEJ2UmZBZTVjV2FBb1dZb0FFWmdhQXZZbVhIR2ZGZjdnVGsyOUlFYThSdEYv?=
 =?utf-8?B?R21Hdkx6d0hpQXZDVkN3cTZ4ckEvRnZNcS92YnpyL0lxT3ovdmh0Wk9xMkZy?=
 =?utf-8?B?Vk1QVHU3OGgyTVhBeTR5cHNFMFhSSmErY0oxYXNldkI2UW5KNnkveU10VE9P?=
 =?utf-8?B?bFBKS0FldDN1ZUxSS09tWWhrUlBqQTcvMkhoVmpkT1A1eUpQVTA5U1E2R1Zr?=
 =?utf-8?B?RGw3b2FzUTFjSlpQZk43Q3ZYdWtyNzRyWXJWYS9NeEs3RnBkNVhDOE1uaVdr?=
 =?utf-8?B?eTRTRTExcll6a3Jqa3FLK2dxMDM4cWJZTzV6NHN4RzJsNU1FTEppRElvOFVh?=
 =?utf-8?B?VFhab2swVVhna2x2Nzd1dmF3M0RybkhHQUkwYjBqNW9ibkloOVZ2LzZ4K3E1?=
 =?utf-8?B?UjZkbm5RSDBkYUZoWmVUQzZ0Z3AwdmxkSlJTR3ZjbTFobWt5Mmx6NjVDaFdT?=
 =?utf-8?B?OWJiMUFub0ltOHpBUHc2ZTU1cVp3blhJSzdYc0VqYm9zK3dOVkdUUzF5SGhl?=
 =?utf-8?B?MkFKQ0hEWmJFVGMyYk5KQzFXK0ppN2VHbW5OdXhVUmNQeGt0WW55aG45aEQ0?=
 =?utf-8?B?QklWSS9sWFRYNWp5RmNnY0N6Y0s4N3lNTS82QWVETTB0K0tFWkpMV3c0WmI0?=
 =?utf-8?B?dEtsNzZlNElPMHk2L1d4UlVPVVpjOWRob2xwOFlHbmdzQ3RXa2QxdmJjQTFE?=
 =?utf-8?B?L0ZnUVVrTlRZT3d5S2xSSDJGOVJzZS80S1NUNjdpdjFQOEV3bFd4YWppditq?=
 =?utf-8?B?VDVzMWVPeDEvcjR2eUhvNVFodkFaaXIzUGJNMnFaeVQvOUx6eEt3d2JjdGtu?=
 =?utf-8?B?REdwUi9sbnQ1eFdvYmUvb09aQlJwMUZSWVRWWGg1dmRHRXZuVTlDcTRVRktD?=
 =?utf-8?B?allCSW9lamRpN3lTYXhvS3pKT1lFVlJWRmtiazBrT21EQ1dJOUJZVmlybEpZ?=
 =?utf-8?B?ZjNVT1hPN3Y0b1didmR6OXMyQUJxYVRMb20zemF6SDdIN2tlYk03dVRHcWt6?=
 =?utf-8?B?M3NJeFBIaXVLRGkrS05DdVhjeWZqN2VINTNYY0pJU3NXSVI1VHd5TWxkRzQx?=
 =?utf-8?B?ZXdyV2hGd0pYV2xkUEluWkNNR3JDQ0FlSUt6ZkNTcTB4dFhMYzE5YW8zNS9I?=
 =?utf-8?B?THo4U0hXbWUwY2RPdDV6b2RjYjhLTElDZTN2UllGVFpkTzd1ZjdHejZOaUhi?=
 =?utf-8?B?ekw2R0x1UTlvampiRHVZRXprN1lXTDlwUlAxakFyN0lhQ1hnRjRUbFprekQz?=
 =?utf-8?B?M2JYWUV5L0pXQnhWU01iUnlMdFowZzdDZExTQkU0VDczUi9ROEpsMm0wdXk4?=
 =?utf-8?B?M3g3eFFHZ2J4cmFOOXZzRjhXM0l6WW80QmJ0M1ltczh4TUlKT2lSMTBPRCtX?=
 =?utf-8?B?S0NLRTNoZjBSMklEUk5ySldmYjJHbHQ4czh1SWN0K1VvRndVVTgyYU1Mam5K?=
 =?utf-8?B?VFVoeUdFcE5mMHFBQUh1ZnM5cTBNWHdJeFFBMUcyaHArMmZ4R0p3QWg0TlNO?=
 =?utf-8?B?WFlNTHhqbzdEZG1uWmduK1RzVmFLU0l6eGphM1BuSm03dWx0YjVuYUhRcnhn?=
 =?utf-8?B?OGVuNmhjeTJ4dE40U0JQOHU5aWtVZ0JhOE5yUlVwZ1RxWmppWkZFczZQeTVM?=
 =?utf-8?B?ZFoxTUpjbkFsMGZJOVRGMHBhZitNT2dXTWtKU0thOXZlOWFoNTF4NmJ4aWw0?=
 =?utf-8?B?WTRTSFhTVFY5NVlKK3lMcXRNNDVXQjVMRzZ0K2RQSGdqL1I3YjVWVjVTTWhy?=
 =?utf-8?B?Y1VBVm5BREw4VmtrT2NyUDlUNmNOdmg4V01mT08reWZzVVVEZWJjUFRQcysx?=
 =?utf-8?B?eE13QVczYTVWK3NrZmpLTzlXazZBZkpMQjVIa0NlOWQ3QkE2ZnBYVWFGLzVk?=
 =?utf-8?B?cXliVTRPdEdLQWZmVmw2TXgyYndpVldmTkZMWGszL0dtdzdXdGx1YmNlMHlY?=
 =?utf-8?B?a3VuU2Y0Q3dzc0VKcjlYM2R2cklWVC9BeE9LS3kzcmdlQ1FRdHJrd01xc3kz?=
 =?utf-8?B?SlBmWGxtMUdkM2gydFFnL0h1V1JQSXgzTVVNQU1XNDRUaFNxUy94RnY1TmNm?=
 =?utf-8?B?aFc4UHdWaEVDUTZYQlBaeXp6U3R3UGpsMzBhWUplSG84UVpDWmJsd0gwRnlm?=
 =?utf-8?Q?HXoPtIuzWRA+hEhJFSUU50Ao4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e0b15c-ab6d-4803-7c3e-08dd148e8160
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 18:07:24.6183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuP31vwR7jHLQXNOEw0bqWM/z6bh67OumKpCeReXI4g3wvJsQ8HPmWgjlg7Jrd5fACjIjHiWsXloBbvcZwbG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8313
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 18:07:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9038

Hi Bruce, Chris,

Do you have any more comments on patches? If there are no comments can 
we get this patches merged?

Thanks,

Sandeep

On 11/29/2024 3:29 PM, Sandeep Gundlupet Raju via lists.yoctoproject.org 
wrote:
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
> Sandeep Gundlupet Raju (6):
>    xen-launch-config: Add bbclass for xen launch config variables
>    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
>    xen-boot-env: Move xen variables to inc file
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
> View/Reply Online (#9026): https://lists.yoctoproject.org/g/meta-virtualization/message/9026
> Mute This Topic: https://lists.yoctoproject.org/mt/109841154/8188369
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

