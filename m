Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A6FCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 15:23:28 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18366.1762442605691850445
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 07:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cWm0qvdQ;
 spf=pass (domain: oss.nxp.com, ip: 52.101.72.50, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWA9DWxvHCU6Gxo4IyFUMdd+oQjLm7WNB2TirbaurCEWGiLoPi32qRTlQDbuCsWY/jz3XvSXgqlOxl+nTHzcP6ivVYAxuJJb/90MQtouIgP7gBHuUulX0KxojTjg5vWQRPROEaezAfSXS0Y5L38hxvGGhNIJxbiEHaIgZFuxr4g3k/I78KmajMIuEzAHfCV0qdf58AXqzit/D/6J5v8zbXZV6HQuUMAFLsInAZZl8bwoONXoe8TxR4K9wor8JHu8C1APLbkJZS9rgtTeENvyNxKOLvPck2EgR8Ws2xTaJRzUt4JgRAm8MC5VP5uM468jhwvTsH6q2qh/OHpmviR3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWcFqlbU2Sqx3UXZJiuVT/CbGaQlkm9YQG8NB006cEw=;
 b=HdCZZWu+yrZhUjOj8vPZGrngdosGa5JtL/W+ro8KD8g0b/yI6nRERApkYCDwihv/nmA3mXYoiHof2NXRXnF5D+I7VXSSOVpbcvpmikZaXcRFaH1S7sm/8xOJM8SFuKwch3UeUUWBf2EJZ3c81n3FXSc7KW6madocUd9YTXUaBBENDhlQBv6zae+Zhbag7NLNpMEXQQ8wpZ6mZWswbO6/QHpSPMYON7lFNshmutb9wqeWmGNPVXzBbnt5Ej+d+5ErHU3wfEPExle2UHSBMjrmUMxMTVLvTCawnoyKlyY7yrVrcsa/T1RCcofmONint3cioLawWUsDzpBRqB4qZ1rvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWcFqlbU2Sqx3UXZJiuVT/CbGaQlkm9YQG8NB006cEw=;
 b=cWm0qvdQeR529NCXEbK9r9sGqV1Gg3Cvx+jDpp+LweW03zt9inwRYZIT4yUN0EtjZeL+u6UhqZIb/YAuqgExGOt7jZ6+fxY/4xoI+F1DuizWN1imxfMVVwZlmcC+s0VghVnhfQShERhYG49or3SzcXHHHSkcWXey49SDtstBh/bsIfnwliHTKG42EbBzV75r72wkZnXJOQAYgaiEA5ZD+OIfimviPmc0KPG+cZIQ+hOa4c9t3iFMZQVrspSo4XHuudHyHKZq6KION5zxPEcm8jjojJSGVVQBKK4bZmK7Qm3RXRu8DGIfteUJw7PbPo7dO0sH/iDRDJHz4J+sH+O2EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6898.eurprd04.prod.outlook.com (2603:10a6:208:185::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 15:23:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 15:23:18 +0000
Content-Type: multipart/alternative;
 boundary="------------75yGcLWA8M350mqGvK4co9s8"
Message-ID: <62baad0b-a697-4065-b956-2b9b71fef33d@oss.nxp.com>
Date: Thu, 6 Nov 2025 09:23:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH v2] libvirt: Fix missing
 libvirt-python
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20251106131437.589960-1-tom.hochstein@oss.nxp.com>
 <CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJfhVKj5a3xUekJQCm4Wg@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJfhVKj5a3xUekJQCm4Wg@mail.gmail.com>
X-ClientProxiedBy: CH0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cfb844-33fe-425e-fc2a-08de1d4869ec
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|19092799006|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TW5pOFQyTjJiU3ZISEdRVGRFcFZTNlJaSThwdlhQeG42RHRpTkhwcUNSUUV6?=
 =?utf-8?B?d0tmRCtmaGdnY1NrcmRXSDF1MEZRREMwUUtxaGppV1Q0UllXMU4xNDdycE9E?=
 =?utf-8?B?UEZYdVk4VkJCZzM5anZWZ2lNcGp5UFFDWEpVSXRMRGZXaFczcGpNZENRcGYr?=
 =?utf-8?B?R0V2RVZzUllmeExJVWw1SnY1clc5cERUenJHY29EcFhCNWVuaHRoT2xxdjdq?=
 =?utf-8?B?b0xzSlRXcXFIWE40UGo3azZNUmwzK3RFQlZvRTlsekJVNnduaTB1eWlLaGFO?=
 =?utf-8?B?aGRZK1VtbS9sYktvOWpNVHJ0bnBLakJYNVVkMTdTTWl1dU5ONk9LY1IxK3E2?=
 =?utf-8?B?RzNFcFVOSlVOU3UvMkJwZlcxRTF6enJmZjM4YjdoTTI0QlhyKzhkQWxaY1Y4?=
 =?utf-8?B?TXB4b200Mmw2UGRoelVSYmZXcHRXcVRmNHNESTdaR29rYjhYMjBVMGVhRXk0?=
 =?utf-8?B?M0FHQzFLS290Tzk1bDVFTDRYYVVVaGJNQ1JrQ2hFYmcyNHB2ZXE2RnJsaUoz?=
 =?utf-8?B?aGYyeExIQU9yYU42eFlaMktwME1nUVJrT1JqcEsvOGxGTitNWkdXWnBCcFZp?=
 =?utf-8?B?eTJtRFR3cVNBYzViMmE4TEVQNkJvYThXT3FqMEsrMDNvdFBhSENiaUw1Y1NB?=
 =?utf-8?B?cUk5TXgxaERpT0QvQmlDeEVIOWtQb0c3N0tKYUhXa3lvK1dpRjlUbFZSWW9J?=
 =?utf-8?B?ODZPTitFdGQ2MFVDVjRSS0ZIVWFrUG1wUVJ4L0FmYWEwREZlZTY2MHl3dG9i?=
 =?utf-8?B?SGU0M0lyVzBGUkRaUndidDFFaS9kV3Jad0tMKzAxQSt2N0pEN2hpMmFoQm9W?=
 =?utf-8?B?aitoSndYYmVnMjVtTEorTWJySDZhU2pyaWxhckU0YXczNEZqcDhzaTVya2hl?=
 =?utf-8?B?bi93RE5qL2NUVkNpTnA3ZlRzSURSelBERk5jeVBBbjZMUHBFelFnM255bnYr?=
 =?utf-8?B?MlhEdDhCMTg5WVB6djcvZUhQdnh6N2tpZkpMc05EdW1vMDg0aUp2MEhZRHh0?=
 =?utf-8?B?ZmxVQmg0OFQrRGZ0bFpveEZCMHFKUE1Wd0hBV21zdU95ckpNYkoyTUVTbnhW?=
 =?utf-8?B?cTZCMzdja2JRRnVhQUtSQU1xVmNGM1QrcGllUHYvbDlPQ05FWGw1MC9tSXNU?=
 =?utf-8?B?dThwb0Zia1pQMVk2NitPWTRkdUlhZkVtRGgzUHVvWTNKeWxlcXR4cGU3NmZa?=
 =?utf-8?B?V0hrREdKKzRoZmR4R0RlRW1CY1YrTy8zMVFwNE1xalZIeVR0Uld3Mi9CN1pQ?=
 =?utf-8?B?NlZSQ2JZeXBJeE1ibmdFdkg0QUpyS3hmak5ORU9ac3g3RUN0VVVPc3JWb0cy?=
 =?utf-8?B?YXFEU3VXRzN0cWNsK01JU3RMOGE3RHk2ODlSWEJGaWdaMmRoNXJCQ2hxSUVK?=
 =?utf-8?B?ejlWajZkMnVHekVUMWllUm5DakNETDNCazI2bHBWUEZpYk5xZHpOZVBaYTZx?=
 =?utf-8?B?dUw0c25OSmFRYkk5eDQ5c1JGM2l4WVUxd2ZKOE5YaHZVOEp1djJKeVpla29I?=
 =?utf-8?B?dFFPbjcybHBNSWU5dXVNa1p2V0JJRW9ZTlJZQXAwT3hIRkhST0g2TWpoN3Fu?=
 =?utf-8?B?UGdvR1ZwLzdmRE5zTHB4UmkySytwL0pCZVo5bUk0K1lBT1RHSzdZSVA1c0tS?=
 =?utf-8?B?S1E0azlPdHEvaUV4T2FYWlZEMndRaFl1OE1zWTVCM1NmVlpsMkdYTXlkeDY5?=
 =?utf-8?B?RWcxWjd0ZmtmczdYdnJ3TmthYUhITk5NUVlkS0RoaDJlR2ZFK3lIL3E3ZTYw?=
 =?utf-8?B?WHcxZURDcFlXWFVINTVIUXhRaS9HWkVIYytrd0o5eEJ0eTZWWWxWYS9sY1c2?=
 =?utf-8?B?VmtnN3lLS2l1aFdxUkV4ZzgwVE5GYS9yNlB4SjF3K0h6UDRPYXJxb0hGc2o4?=
 =?utf-8?B?QXpmU1NadFZ4OHlCcHpEa1BNNzYrenJsVFJVT1BvY2hUNUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(19092799006)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWpWWUkwUFpjTHJkNlBCTDhzSi9EZ0dsOU1MUUNUYWdnQ0NkNXROWnlMZUJq?=
 =?utf-8?B?Ukwrem1nK3VGKzhnUE9LWWFHOWJiTFdJcWhmckhuOWlqZEpQYjJDMzJUMWNG?=
 =?utf-8?B?cVRsS3NzTEU2Z1VSSjRnNHA1U2p2ZXJJWHRwNTRXVS9xUDdjZGxHU0xJNGRy?=
 =?utf-8?B?STNUS1p5ZnE4WUVKWTMvOHRtUXR2N2R6T3N5ZWRLSWpEcExQdWpBdTJKOThZ?=
 =?utf-8?B?dDNtWXlHVFh1cGRDT2N4VnZBTHUzMlFNbjhXUUcyQ01kTTNsRkVQclBuUzVy?=
 =?utf-8?B?NjRFRlAyVERUS3hQNFU3TWp2bzcvK1M2cE5nS2VWa3NGcjVkWE5DRHJ2YWtR?=
 =?utf-8?B?SUNMM2w0ZWxlV1JETElTSmhLb2dyZUdPaVhWYWhBUm1HWllhYmVQdSs3Rm9S?=
 =?utf-8?B?MXJjMGx6VWlzQXhKVHUyaVlNUzNONGowZklnUnZmTE55eVdBWnQ1M0owSHlq?=
 =?utf-8?B?TDI5ckx0U3BtN21GaVJQMXE3RjZUS21GUHdEUjBOd0wwQ1k1UFRHWXEvR2hF?=
 =?utf-8?B?OVlvWTVETS9yeHp0b3NmbE9QdU9yL0J4clhtam5BYTJnL2sxNDlybnFCRU1F?=
 =?utf-8?B?NTI5b1RNWnlVRVhqbVlZTEtxQjJhUWYyV2xlamxaUHA2VmpPekNjMk9OdHFD?=
 =?utf-8?B?cXNzd3F6akNBQXF5dkk2TEJyRUF5dmYwbWVGYTdJTDgva0dKZTljV0xEV3VW?=
 =?utf-8?B?M1dnSUw1eTZaaS93dTU1c3pYS1k1TzFJYWRtNldPRzZxcWVsRTFLN2pXWmFv?=
 =?utf-8?B?ZDNhMS9uSFA0cW10MHkvZmhWeWg5VEREbldNMFJlTmdyYnM0V09TWjVaN0Nv?=
 =?utf-8?B?d1VUT2RmcGNBT1h5dnF6T1FSS09JL3k3NWpvQ3hGc05GSXZXV2ZneVBWUWE2?=
 =?utf-8?B?MW9CZmI2V2ZuSjhzU3U0ZVZEMmpicVdqZTg3VHRvWTl6SjlCeXQ3Ym5zMkRx?=
 =?utf-8?B?dlAzbEZueFllVW1WZ096RmRUa1EvdHExcmVEN0E0Zk00Q00xUWZtOU1lRjJN?=
 =?utf-8?B?ZmlzNXpkNmhvNGFlTFlyMGdjZklnMmtQR0NQMVNqOURqVlVDUFBacm0wQUxs?=
 =?utf-8?B?aXg4VEswY2hVOGllV3VYQ2ZrNTZxUnhsSWg5bHpoZ3VxY3YzWmJDcmFqUU5X?=
 =?utf-8?B?QndYOWRVQkxOM3JBbW83T2VMc05JRGM0OWhXR1BmbndRR2dsOGFCeUpsYnVE?=
 =?utf-8?B?NDFIbmNJenMrWmJyKzNqRDluQ242YnorQmppaFc4amJwTktzVHI1NWFBck40?=
 =?utf-8?B?dmEvQVBaOElORDcxbE0rdFNwV2tFY2pnT2JXUHRXTTNINUVSWU9MQ003YjBT?=
 =?utf-8?B?a0N2cjhVU0V2U1FKRmkvdDNpVm9tdXFzMDNtem9WZE1YZkRVL3NmOVcxU00y?=
 =?utf-8?B?dHE4NDl4a3B6bTVCN0hmTTduWk1YdHVWQlkrNHppSHZrU3ZVRk10Yy8yU2FM?=
 =?utf-8?B?bHA2aGtJZkpNekRrajBBdWNRVE0waHUzSmUyN0xuYlZzTXk5bFZmSlY3SHRF?=
 =?utf-8?B?eFRzKzZZUEt4eUwraFRzcnRjMnpSWmFhTmR3WnQvdjFpdkpzYlNDSmV0UGVD?=
 =?utf-8?B?K3pFR1g0Vk1va2ZHZUhxTzJoRHYrREFCL2xYYmpSZUFmQjJEYVBIT09nckdI?=
 =?utf-8?B?bEJtWDBtWmtQL29ra2xMZGJxWWpQcWlTY1V2ZXFoU0dDWkNMUmw0aG5Vd25x?=
 =?utf-8?B?SzVmelVSZE1IV2tpTDZVUFNIUDhoTDdaalZHZkxTODMvNlk2SnlCRVQ5THdO?=
 =?utf-8?B?bWRVTkk1VklVci9TY2RadEEzQ1hrTEdTVlZVbFlZWXBNZnBUbVAxb25QamNG?=
 =?utf-8?B?OHlVY0kyUkR5RlFzRmxpdWJtWXluek9NNXRSSk5TUW41QWYwZEdnUmxQTUhw?=
 =?utf-8?B?R1p1VURjMjBiWUxiVXhsZ1p3alhBOC9PVmFBd1hKUFhDNjBlNG9XWXkxRW53?=
 =?utf-8?B?cXpkTGhoYU1kZXNWZCtMZHl5NEd5RlVOOU9haVNHNDZCZ0l1aU5rUUlaNU14?=
 =?utf-8?B?MHFBMWVFQUxYdnRHd0g4aW5SVW5OZmFobDgxWGRmOGFsV1EwQkpyNWRHY2Q0?=
 =?utf-8?B?YzJqN25Bbk41TlFpRWM1WHp1Nm5IVU4rWUV0eUprM1Izb09Fem9YZ1ArQXMw?=
 =?utf-8?B?RGdlaGdOcWloKytNYStWalFadCtSYWFBTXFUNlZGaml2bXFKMjhNZzFOWjdr?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cfb844-33fe-425e-fc2a-08de1d4869ec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 15:23:18.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQfn0XKXXrOtwLTT3Cp6t3fH/ua7wYdR1COwfb+hP75CtmYnMlTcWusHg29LqwrZJMWAUgg7/CKbPjEoHIzr5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6898
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 15:23:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9432

--------------75yGcLWA8M350mqGvK4co9s8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/6/2025 8:18 AM, Bruce Ashfield wrote:
>
> 	
> You don't often get email from bruce.ashfield@gmail.com. Learn why 
> this is important <https://aka.ms/LearnAboutSenderIdentification>
> 	
>
>
>
> On Thu, Nov 6, 2025 at 8:15 AM Tom Hochstein via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <tom.hochstein=oss.nxp.com@lists.yoctoproject.org> wrote:
>
>     From: Tom Hochstein <tom.hochstein@oss.nxp.com>
>
>     The do_rootfs task for an image that includes libvirt-python fails.
>     ```
>       - nothing provides libvirt-python needed by
>     packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from oe-repo
>     ```
>
>     The log shows that the do_compile:append() from libvirt-python.inc is
>     failing but not reporting the failure.
>     ```
>     174: cd: can't cd to
>     /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8.0
>     ```
>
>     The root cause is the archive folder format is changed from
>     libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile
>     and do_install tasks are hard-coded to the old format.
>
>     Fix the root cause by encoding the archive folder name in a common
>     variable. Also, fix the build and install commands so the cd
>     failure is
>     not ignored.
>
>     Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>     ---
>      recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------
>      1 file changed, 7 insertions(+), 7 deletions(-)
>
>     diff --git a/recipes-extended/libvirt/libvirt-python.inc
>     b/recipes-extended/libvirt/libvirt-python.inc
>     index c430ffe5..0a99296a 100644
>     --- a/recipes-extended/libvirt/libvirt-python.inc
>     +++ b/recipes-extended/libvirt/libvirt-python.inc
>     @@ -18,8 +18,8 @@ FILES:${PN}-python = "${bindir}/* ${libdir}/*
>     ${libdir}/${PYTHON_DIR}/*"
>      # Currently the libvirt-python debug libraries contain buildpaths
>      INSANE_SKIP:${PN}-dbg += "buildpaths"
>
>     -SRC_URI +=
>     "http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VERSION}.tar.gz;name=libvirt_python;subdir=${BP}
>     <http://libvirt.org/sources/python/$%7BBPN%7D_python-$%7BLIBVIRT_VERSION%7D.tar.gz;name=libvirt_python;subdir=$%7BBP%7D>"
>     -
>     +SRC_URI +=
>     "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}
>     <http://libvirt.org/sources/python/$%7BLIBVIRT_PYTHON_ARCHIVE_NAME%7D.tar.gz;name=libvirt_python;subdir=$%7BBP%7D>"
>     +LIBVIRT_PYTHON_ARCHIVE_NAME = "${BPN}_python-${LIBVIRT_VERSION}"
>      SRC_URI[libvirt_python.sha256sum] =
>     "5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0e6f0ca83c"
>
>      export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>     @@ -46,8 +46,8 @@ do_compile:append() {
>                     # the syroot staged pkgconfig entries. So we clear
>     the sysroot
>                     # for just this portion.
>                     export PKG_CONFIG_SYSROOT_DIR=
>     -               cd
>     ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
>     -  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
>     +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>     +  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
>                     cd -
>             fi
>      }
>     @@ -58,9 +58,9 @@ do_install:append() {
>                     # the syroot staged pkgconfig entries. So we clear
>     the sysroot
>                     # for just this portion.
>                     export PKG_CONFIG_SYSROOT_DIR=
>     -               cd
>     ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
>     -  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
>     -  --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
>     ${LIBVIRT_INSTALL_ARGS}
>     +               cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>
>
> As I hinted at in my other reply just a minute ago, I'd actually 
> prefer that if we are
> changing this to fail on the directory not existing (which really has 
> only happened
> once in the decade or so this exists), then we should put a test for 
> the directory
> and output a clearer error message. Otherwise, someone getting that failed
> cd will have no idea why it happened.
>
> Bruce

I think it's good to keep exceptional logic to a minimum. We might not 
ever see this failure again. Plus, I'd argue that failing on the cd 
command gives a straightforward clue for how to debug. Let me know if 
you disagree, and I'll add the logic as you request.

Tom

>
>     +  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
>     +  --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}
>     ${LIBVIRT_INSTALL_ARGS}
>                     cd -
>             fi
>      }
>     -- 
>     2.34.1
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9429):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9429
>     Mute This Topic: https://lists.yoctoproject.org/mt/116152179/1050810
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [bruce.ashfield@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------75yGcLWA8M350mqGvK4co9s8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/6/2025 8:18 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJf=
hVKj5a3xUekJQCm4Wg@mail.gmail.com">
     =20
      <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%=
" style=3D" aspect-ratio: revert !important; background: revert !important;=
 block-size: revert !important; border: revert !important; bottom: revert !=
important; color: revert !important; color-scheme: revert !important; conte=
nt-visibility: revert !important; cursor: revert !important; direction: rev=
ert !important; display: revert !important; font-size: revert !important; h=
eight: revert !important; hyphens: revert !important; letter-spacing: rever=
t !important; line-height: revert !important; margin: revert !important; op=
acity: revert !important; order: revert !important; outline: revert !import=
ant; overflow: revert !important; padding: revert !important; position: rev=
ert !important; resize: revert !important; rotate: revert !important; scale=
: revert !important; tab-size: revert !important; table-layout: revert !imp=
ortant; text-align: revert !important; text-indent: revert !important; text=
-orientation: revert !important; text-overflow: revert !important; text-sha=
dow: revert !important; text-transform: revert !important; text-wrap: rever=
t !important; top: revert !important; transition: revert !important; user-s=
elect: revert !important; vertical-align: revert !important; visibility: re=
vert !important; white-space: revert !important; width: revert !important; =
word-break: revert !important; word-spacing: revert !important; writing-mod=
e: revert !important; zoom: revert !important; cellpadding: 0 !important; b=
order: 0 !important; cellspacing: 0 !important; display: table !important; =
width: 100% !important; table-layout: fixed !important; border-collapse: se=
perate !important; float: none !important; border-spacing: 0px 0px !importa=
nt; " align=3D"left">
        <tbody style=3D" aspect-ratio: revert !important; background: rever=
t !important; block-size: revert !important; border: revert !important; bot=
tom: revert !important; color: revert !important; color-scheme: revert !imp=
ortant; content-visibility: revert !important; cursor: revert !important; d=
irection: revert !important; display: revert !important; font-size: revert =
!important; height: revert !important; hyphens: revert !important; letter-s=
pacing: revert !important; line-height: revert !important; margin: revert !=
important; opacity: revert !important; order: revert !important; outline: r=
evert !important; overflow: revert !important; padding: revert !important; =
position: revert !important; resize: revert !important; rotate: revert !imp=
ortant; scale: revert !important; tab-size: revert !important; table-layout=
: revert !important; text-align: revert !important; text-indent: revert !im=
portant; text-orientation: revert !important; text-overflow: revert !import=
ant; text-shadow: revert !important; text-transform: revert !important; tex=
t-wrap: revert !important; top: revert !important; transition: revert !impo=
rtant; user-select: revert !important; vertical-align: revert !important; v=
isibility: revert !important; white-space: revert !important; width: revert=
 !important; word-break: revert !important; word-spacing: revert !important=
; writing-mode: revert !important; zoom: revert !important; display: block =
!important; ">
          <tr style=3D" aspect-ratio: revert !important; background: revert=
 !important; block-size: revert !important; border: revert !important; bott=
om: revert !important; color: revert !important; color-scheme: revert !impo=
rtant; content-visibility: revert !important; cursor: revert !important; di=
rection: revert !important; display: revert !important; font-size: revert !=
important; height: revert !important; hyphens: revert !important; letter-sp=
acing: revert !important; line-height: revert !important; margin: revert !i=
mportant; opacity: revert !important; order: revert !important; outline: re=
vert !important; overflow: revert !important; padding: revert !important; p=
osition: revert !important; resize: revert !important; rotate: revert !impo=
rtant; scale: revert !important; tab-size: revert !important; table-layout:=
 revert !important; text-align: revert !important; text-indent: revert !imp=
ortant; text-orientation: revert !important; text-overflow: revert !importa=
nt; text-shadow: revert !important; text-transform: revert !important; text=
-wrap: revert !important; top: revert !important; transition: revert !impor=
tant; user-select: revert !important; vertical-align: revert !important; vi=
sibility: revert !important; white-space: revert !important; width: revert =
!important; word-break: revert !important; word-spacing: revert !important;=
 writing-mode: revert !important; zoom: revert !important; ">
            <td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpad=
ding=3D"7px 2px 7px 2px" style=3D" aspect-ratio: revert !important; backgro=
und: revert !important; block-size: revert !important; border: revert !impo=
rtant; bottom: revert !important; color: revert !important; color-scheme: r=
evert !important; content-visibility: revert !important; cursor: revert !im=
portant; direction: revert !important; display: revert !important; font-siz=
e: revert !important; height: revert !important; hyphens: revert !important=
; letter-spacing: revert !important; line-height: revert !important; margin=
: revert !important; opacity: revert !important; order: revert !important; =
outline: revert !important; overflow: revert !important; padding: revert !i=
mportant; position: revert !important; resize: revert !important; rotate: r=
evert !important; scale: revert !important; tab-size: revert !important; ta=
ble-layout: revert !important; text-align: revert !important; text-indent: =
revert !important; text-orientation: revert !important; text-overflow: reve=
rt !important; text-shadow: revert !important; text-transform: revert !impo=
rtant; text-wrap: revert !important; top: revert !important; transition: re=
vert !important; user-select: revert !important; vertical-align: revert !im=
portant; visibility: revert !important; white-space: revert !important; wid=
th: revert !important; word-break: revert !important; word-spacing: revert =
!important; writing-mode: revert !important; zoom: revert !important; paddi=
ng: 7px 2px 7px 2px !important; background-color: #A6A6A6 !important; valig=
n: middle !important; width: 0px !important; "><br>
            </td>
            <td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpa=
dding=3D"7px 5px 7px 15px" color=3D"#212121" style=3D" aspect-ratio: revert=
 !important; background: revert !important; block-size: revert !important; =
border: revert !important; bottom: revert !important; color: revert !import=
ant; color-scheme: revert !important; content-visibility: revert !important=
; cursor: revert !important; direction: revert !important; display: revert =
!important; font-size: revert !important; height: revert !important; hyphen=
s: revert !important; letter-spacing: revert !important; line-height: rever=
t !important; margin: revert !important; opacity: revert !important; order:=
 revert !important; outline: revert !important; overflow: revert !important=
; padding: revert !important; position: revert !important; resize: revert !=
important; rotate: revert !important; scale: revert !important; tab-size: r=
evert !important; table-layout: revert !important; text-align: revert !impo=
rtant; text-indent: revert !important; text-orientation: revert !important;=
 text-overflow: revert !important; text-shadow: revert !important; text-tra=
nsform: revert !important; text-wrap: revert !important; top: revert !impor=
tant; transition: revert !important; user-select: revert !important; vertic=
al-align: revert !important; visibility: revert !important; white-space: re=
vert !important; width: revert !important; word-break: revert !important; w=
ord-spacing: revert !important; writing-mode: revert !important; zoom: reve=
rt !important; width: 100% !important; background-color: #EAEAEA !important=
; padding: 7px 5px 7px 15px !important; font-family: wf_segoe-ui_normal, Se=
goe UI, Segoe WP, Tahoma, Arial, sans-serif !important; font-size: 12px !im=
portant; font-weight: normal !important; color: #212121 !important; text-al=
ign: left !important; word-wrap: break-word !important; ">
              <div style=3D" aspect-ratio: revert !important; background: r=
evert !important; block-size: revert !important; border: revert !important;=
 bottom: revert !important; color: revert !important; color-scheme: revert =
!important; content-visibility: revert !important; cursor: revert !importan=
t; direction: revert !important; display: revert !important; font-size: rev=
ert !important; height: revert !important; hyphens: revert !important; lett=
er-spacing: revert !important; line-height: revert !important; margin: reve=
rt !important; opacity: revert !important; order: revert !important; outlin=
e: revert !important; overflow: revert !important; padding: revert !importa=
nt; position: revert !important; resize: revert !important; rotate: revert =
!important; scale: revert !important; tab-size: revert !important; table-la=
yout: revert !important; text-align: revert !important; text-indent: revert=
 !important; text-orientation: revert !important; text-overflow: revert !im=
portant; text-shadow: revert !important; text-transform: revert !important;=
 text-wrap: revert !important; top: revert !important; transition: revert !=
important; user-select: revert !important; vertical-align: revert !importan=
t; visibility: revert !important; white-space: revert !important; width: re=
vert !important; word-break: revert !important; word-spacing: revert !impor=
tant; writing-mode: revert !important; zoom: revert !important; ">
                You don't often get email from <a class=3D"moz-txt-link-abb=
reviated" href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com=
</a>.
                <a href=3D"https://aka.ms/LearnAboutSenderIdentification" s=
tyle=3D"background: revert !important;color: revert !important;content-visi=
bility: revert !important;direction: revert !important;display: revert !imp=
ortant;font-size: revert !important;opacity: revert !important;rotate: reve=
rt !important;scale: revert !important;visibility: revert !important;" moz-=
do-not-send=3D"true">
                  Learn why this is important</a> </div>
            </td>
            <td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"=
#EAEAEA" cellpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D" aspect=
-ratio: revert !important; background: revert !important; block-size: rever=
t !important; border: revert !important; bottom: revert !important; color: =
revert !important; color-scheme: revert !important; content-visibility: rev=
ert !important; cursor: revert !important; direction: revert !important; di=
splay: revert !important; font-size: revert !important; height: revert !imp=
ortant; hyphens: revert !important; letter-spacing: revert !important; line=
-height: revert !important; margin: revert !important; opacity: revert !imp=
ortant; order: revert !important; outline: revert !important; overflow: rev=
ert !important; padding: revert !important; position: revert !important; re=
size: revert !important; rotate: revert !important; scale: revert !importan=
t; tab-size: revert !important; table-layout: revert !important; text-align=
: revert !important; text-indent: revert !important; text-orientation: reve=
rt !important; text-overflow: revert !important; text-shadow: revert !impor=
tant; text-transform: revert !important; text-wrap: revert !important; top:=
 revert !important; transition: revert !important; user-select: revert !imp=
ortant; vertical-align: revert !important; visibility: revert !important; w=
hite-space: revert !important; width: revert !important; word-break: revert=
 !important; word-spacing: revert !important; writing-mode: revert !importa=
nt; zoom: revert !important; width: 75px !important; background-color: #EAE=
AEA !important; padding: 7px 5px 7px 5px !important; font-family: wf_segoe-=
ui_normal, Segoe UI, Segoe WP, Tahoma, Arial, sans-serif !important; font-s=
ize: 12px !important; font-weight: normal !important; color: #212121 !impor=
tant; text-align: left !important; word-wrap: break-word !important; align:=
 left !important; "><br>
            </td>
          </tr>
        </tbody>
      </table>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 6, 2025 at
              8:15=E2=80=AFAM Tom Hochstein via
              <a href=3D"http://lists.yoctoproject.org" moz-do-not-send=3D"=
true">lists.yoctoproject.org</a>
              &lt;tom.hochstein=3D<a href=3D"mailto:oss.nxp.com@lists.yocto=
project.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">oss.n=
xp.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.n=
xp.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">tom.hochstein@oss.nxp.com</a>&gt;<br>
              <br>
              The do_rootfs task for an image that includes
              libvirt-python fails.<br>
              ```<br>
              &nbsp; - nothing provides libvirt-python needed by
              packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from
              oe-repo<br>
              ```<br>
              <br>
              The log shows that the do_compile:append() from
              libvirt-python.inc is<br>
              failing but not reporting the failure.<br>
              ```<br>
              174: cd: can't cd to
/.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8.0<=
br>
              ```<br>
              <br>
              The root cause is the archive folder format is changed
              from<br>
              libvirt-python-VERSION to libvirt_python-VERSION, but the
              do_compile<br>
              and do_install tasks are hard-coded to the old format.<br>
              <br>
              Fix the root cause by encoding the archive folder name in
              a common<br>
              variable. Also, fix the build and install commands so the
              cd failure is<br>
              not ignored.<br>
              <br>
              Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochst=
ein@oss.nxp.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">tom.hochstein@oss.nxp.com</a>&gt;<br>
              ---<br>
              &nbsp;recipes-extended/libvirt/libvirt-python.inc | 14
              +++++++-------<br>
              &nbsp;1 file changed, 7 insertions(+), 7 deletions(-)<br>
              <br>
              diff --git a/recipes-extended/libvirt/libvirt-python.inc
              b/recipes-extended/libvirt/libvirt-python.inc<br>
              index c430ffe5..0a99296a 100644<br>
              --- a/recipes-extended/libvirt/libvirt-python.inc<br>
              +++ b/recipes-extended/libvirt/libvirt-python.inc<br>
              @@ -18,8 +18,8 @@ FILES:${PN}-python =3D &quot;${bindir}/*
              ${libdir}/* ${libdir}/${PYTHON_DIR}/*&quot;<br>
              &nbsp;# Currently the libvirt-python debug libraries contain
              buildpaths<br>
              &nbsp;INSANE_SKIP:${PN}-dbg +=3D &quot;buildpaths&quot;<br>
              <br>
              -SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/pyt=
hon/$%7BBPN%7D_python-$%7BLIBVIRT_VERSION%7D.tar.gz;name=3Dlibvirt_python;s=
ubdir=3D$%7BBP%7D" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VERSION}.ta=
r.gz;name=3Dlibvirt_python;subdir=3D${BP}</a>&quot;<br>
              -<br>
              +SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/pyt=
hon/$%7BLIBVIRT_PYTHON_ARCHIVE_NAME%7D.tar.gz;name=3Dlibvirt_python;subdir=
=3D$%7BBP%7D" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;na=
me=3Dlibvirt_python;subdir=3D${BP}</a>&quot;<br>
              +LIBVIRT_PYTHON_ARCHIVE_NAME =3D
              &quot;${BPN}_python-${LIBVIRT_VERSION}&quot;<br>
              &nbsp;SRC_URI[libvirt_python.sha256sum] =3D
              &quot;5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0=
e6f0ca83c&quot;<br>
              <br>
              &nbsp;export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api=
.xml&quot;<br>
              @@ -46,8 +46,8 @@ do_compile:append() {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # the=
 syroot staged pkgconfig entries. So
              we clear the sysroot<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # for=
 just this portion.<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; expor=
t PKG_CONFIG_SYSROOT_DIR=3D<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd
              ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION}
              &amp;&amp; \<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              build<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd
              ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              build<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cd -<=
br>
              &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
              &nbsp;}<br>
              @@ -58,9 +58,9 @@ do_install:append() {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # the=
 syroot staged pkgconfig entries. So
              we clear the sysroot<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # for=
 just this portion.<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; expor=
t PKG_CONFIG_SYSROOT_DIR=3D<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd
              ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION}
              &amp;&amp; \<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              install \<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
              &nbsp;--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
              ${LIBVIRT_INSTALL_ARGS}<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd
              ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">As I
                hinted at in my other reply just a minute ago, I'd
                actually prefer that if we are</div>
              <div class=3D"gmail_default" style=3D"font-size:small">changi=
ng
                this to fail on the directory not existing (which really
                has only happened</div>
              <div class=3D"gmail_default" style=3D"font-size:small">once i=
n
                the decade or so this exists), then we should put a test
                for the directory</div>
              <div class=3D"gmail_default" style=3D"font-size:small">and
                output a clearer error message. Otherwise, someone
                getting that failed</div>
              <div class=3D"gmail_default" style=3D"font-size:small">cd wil=
l
                have no idea why it happened.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I think it's good to keep exceptional logic to a minimum. We
      might not ever see this failure again. Plus, I'd argue that
      failing on the cd command gives a straightforward clue for how to
      debug. Let me know if you disagree, and I'll add the logic as you
      request.</p>
    <p>Tom</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PDjQ9MhCSdCtwnTFPmT0ETfDJf=
hVKj5a3xUekJQCm4Wg@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.p=
y
              install \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
              &nbsp;--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}
              ${LIBVIRT_INSTALL_ARGS}<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cd -<=
br>
              &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
              &nbsp;}<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9429): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/9429" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
https://lists.yoctoproject.org/g/meta-virtualization/message/9429</a><br>
              Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/116152179/1050810" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">
                https://lists.yoctoproject.org/mt/116152179/1050810</a><br>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true" class=3D"moz-txt-link-freetext">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"true"=
 class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------75yGcLWA8M350mqGvK4co9s8--

