Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92036C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 16:23:05 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.49])
 by mx.groups.io with SMTP id smtpd.web11.66864.1702657384794147477
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Dec 2023 08:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=QSeWtFSm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.49, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcBvs7OL4r3oLnskI/bL7093AAzkGcA2aPpb1KrHb3RMqbjU8GMzYRo+tf2d4b3GeyU3LlIKe+yMNolc5dwFOAOlx0XfwIphgE1X46LbgmLPpr+9Bq+Previk/bIL6IAktUblU7DkeRiJdNIQGLh3sPostlBcZyTZ5bkcQ4APgUhoEVLmZ5zfV4d64t0oXZxT0Cu+qfYEYKzTwGurb0wyMwVQctqC63MrTNIxyvwQ+kUMVsB6WE/pFJohXuxoQV7qfCYq2Ccya+l+7CYG2k7AncupOD8Wk0AsD4JiZrUIFjOKzNGLlvZyjSzqEsBU7hkvmynGsMhRA40hSQiqms7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6PKHU/Yx+wJVkVXx+ByoIKFq5B5JxfExT1h3a1q04Q=;
 b=TrJLZigBFEJNkHZTAMUs1w0xtdg6xKnKnCm8kSVdCPZCHCwEXL7LEpI0cx7IF9NCoQUEj33uWgFP7xHcZuHOoWxJlY2khdSTrXmGQw8+o9UmNfSafI5kdTYIgJ6TEwatLNIwrZyuY7F5s08xtUSDmk+FuT+CUAEewbbKAzCvK/vGq3Q9aKEEDU6acENAgzTaF8DHqx2ewXoPEU3ic0t+e2ZWzos62c1ALeaFEFbPT9CRm5LdhloqnLHNTvbKrFIR78zZfoFxdLx/X+k2Cwla03M61/mwSmnAsXR1joL9o7aNUHEbe3erHlxmssCUXzXoQCBUkwSqjmsapsdiZETpqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6PKHU/Yx+wJVkVXx+ByoIKFq5B5JxfExT1h3a1q04Q=;
 b=QSeWtFSmJ1ujJnRLM+fiuryKzdy/5jN1DpUzQ04pJvTqghtj9QxLDcaPK/WBn3y/62fJa4fIVqbkNEixAMQFD2Vw4hvmlsue3vdUek1xDB4OVUSPRZbUpDOUWTsLOCedn4T9q8fuM2emsFCdKaaacFJqcPesKF1sAAGF7JDtDao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.28; Fri, 15 Dec 2023 16:23:02 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::96c8:3001:17fd:30f]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::96c8:3001:17fd:30f%4]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 16:23:02 +0000
Message-ID: <a5aa7075-f6f5-4029-b301-d36ca47a56b2@amd.com>
Date: Fri, 15 Dec 2023 09:23:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove
 device_type dt nodes
To: meta-virtualization@lists.yoctoproject.org
References: <20231213010029.2111483-1-sandeep.gundlupet-raju@amd.com>
 <ZXte4Xc5wn89MFlU@gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <ZXte4Xc5wn89MFlU@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e93ecf-892c-482f-8fdf-08dbfd8a1bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dq0JIdM48cYgLrA9f05pQ7NX9yTbnOChQ2pJLuja/hcghZQZz3Dqaa+gv9Qc/c6lMgo41SXO88MJfpKs9yVAiwd9kbhBaOxiDje3770t3mxTw2vkhMygdzItmcjTmoOP1f4TXEN+G2QUpFzTzrYtgOOT0TXLuQEyr1zpYVmkGHYaBME5BjRQVrWa0UOhOzQYf/2Jvm8eycQVwSAEnefbRMVvXnAyz+J5sByopYwZaUsnnNVrGwFXA7+a7HsIxbFNLCTT2eTeBCUOKJC+k8l9RQ4IxCKdQcqBsZA36vGvw0Syz1j7hFF1dittxe5oaGOuAlJ+0qvPDofJfW+qaWxmm8cv5GequSJnKB/ZZZGuaooMLrdVNgreXAvYlUGCdLZCNZQFgiF1/XNeIMklUkWQFkeh/rTql09v7fQbi+Qfx/uocLzxd15LlS62DeQ4XDzU7ywgg0tMLgK1WniPSSEgGWQsOLMWr1pr0dpmMaA7DWJ/Nt82bldWIB9Sd8O+i++i8D/09UM9Yuf/UoYvGzAnPMUxt8hMgcqanJNUsTmAVWR9d71653AKG6fDUJziMPEzUnr8hKjJVItaL1ILZsbJ1e76axqAiP5OYh2x48q9worl1v0vDXmqkL+gP80/+OV9qsjCjrAZf0LLNWYkR7xmrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(86362001)(36756003)(38100700002)(6916009)(316002)(66476007)(66946007)(66556008)(26005)(83380400001)(2616005)(5660300002)(8676002)(8936002)(53546011)(6512007)(6506007)(66899024)(478600001)(966005)(6486002)(41300700001)(31696002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGl0VDAwb0xVOGJPdjNlUjl4TmhXRnkwNlcydGZtbmF1RHNZbGdDQzFCYVVS?=
 =?utf-8?B?S0F1enRkMkpTanAyZS9rdTkvVVgwT2lJa2ZUWTdwZCtkR2ZaYXQ1MG91MDNx?=
 =?utf-8?B?S0RZMGovTGhBMk1uTjF5UWYvT3ZaaVBLa3c1RjJGZnRMOXg1b2RKdGdET25v?=
 =?utf-8?B?OTlhWC9qeWpNM0Y0VzdXbTZ0UVBaOW1XODVxMjRxK1l3bkZDaE1VNE5GU2w4?=
 =?utf-8?B?WFJ4VE1XQmhHWTZKdUVHbCtPbVVIUFlnOXpzaUxiRjdmU3dCSUtVZHpYcmxu?=
 =?utf-8?B?R2F3dUNkNDIxeFRsSTBMZHhnRUNMMEN3bjdMRU1HZEpIZmFMaHF2dExxUjYy?=
 =?utf-8?B?NUk0WEoveFl3c2VubS85dnR1aEU2SndTenVtQlhVTk1uTXFvK3RJSGFTZXlu?=
 =?utf-8?B?SzdGK2ppWUt1L3JJSFQ1d3dQSFBpUktTMTBJNWlWaEdXVzM4TzZ6QVlIV0Fn?=
 =?utf-8?B?QjhGTVo3OWpnZVA0Rk02eHlhV0R2OUlWb00rSWdldUtNcmdLUkxMMHljTHFr?=
 =?utf-8?B?ek5USS9uUEJZbWdreDZFQ2NhU25IQ2xQbFJmUnNVTkhFem5NU3FLeHp5WlN4?=
 =?utf-8?B?UU1BcDJrOGZvNDBzenI5UHoxa3c3Y00rZ29jSnpsSWgzczlLai9ZSGI2dVRM?=
 =?utf-8?B?ank4Tk1EK0k1SFNsQTVLNm5NYWdCZEtUblZXc2FlTnhIOTJob3lib2VqRnZF?=
 =?utf-8?B?dzErUmtGc3ZhOVNULytrdUJod0NXam1qc1EzcW1leStzQ21ybFVxUlpDMmc2?=
 =?utf-8?B?dzRRNEljajUvbGtWZ1M1dWg4bXgzOWVpMjliajZlbUtPU1I4SUpEM1pYZGxE?=
 =?utf-8?B?cGdYcWJLQWNiVzBPeXRZYWd6SlV1a0xuUFA4Zmd5dmZwZVhpRzRRZmNWakJK?=
 =?utf-8?B?VnBsaW5tK0pramJNOW1ud0N1S2RqT1hGaDBMTzN6bXhEcGZMSW90YkRwWWQ2?=
 =?utf-8?B?OU9uZTB2VkI0aVhwbzhyQklqeDcrUFJ1aXl4WGJmSmdFOHc0elV2Qkc4eUZy?=
 =?utf-8?B?MkRCUllTYnlXYU94NVFUTUFuY01GUnZoZFdIRElxL3lQSlNuV2xwQ2F0RlZr?=
 =?utf-8?B?b1kzRkt4bFdFOTdxd3g2WmwyUWlKa1RzTWNoTlB4dFZKWFdBKzhKcXQvNnJx?=
 =?utf-8?B?WStrSUFWYThmTlF5VmdQOEpCZHNzeHZtaWp1MUYwNE9jSmVET3VTZEdpdi9I?=
 =?utf-8?B?T1JtOGVMUzR0L0kwdW9XL2RwTjlBNmI2QzRsTmVZQ29OMVFtR3F6V1pROGJZ?=
 =?utf-8?B?cVB4OWU1M0JSVGpnUFNHTlRmNjh6K0ZDcDFJUVVsS1kxT3ZFSmlMT3NUemFW?=
 =?utf-8?B?OU1WeHlZM3dBbUw2bWFRWGNWZWFteEJFUjhpaWlyTjVXMEthN3MvWVdZdHhy?=
 =?utf-8?B?amdXZzJuUVZabWxQSlBSSVoxelU4bk9vN3lyaDBYdWVmcnJCQ0FLVVdjTStM?=
 =?utf-8?B?YTRUUkJ1ZWk0dDJrVzgzSXNYOW16UGJMQU90Uk9ZQmRsL2xLNGVoY3VOWm9u?=
 =?utf-8?B?NUtaVzdZSjBTaHRpSCs1eklZbVpPend5QzdRaTRxcDBUbnVzcjlDUStVQWN5?=
 =?utf-8?B?NHdNY0RGa1ZNQU95bEs3RE9jSUh4cm9FZkxzVlVQblZtdytUZm1mSmhTYlhE?=
 =?utf-8?B?NmRGeGNsMU5KOTlIb2p2eW5RUW1ITVNkdksraVVmN1BQU2dKTFgrS3F2NlhD?=
 =?utf-8?B?TmtXYktQZk9NS1I0WjM3eDNWZmZJdGNNTVpKaVdRMVc2WllHWFVQOXN1eU9X?=
 =?utf-8?B?Y1NRZlluVDZXYkYzcS9XV3lFaVBxTC9XdE5MZlVNdXVxZnBGMHFPL2ZkWjlR?=
 =?utf-8?B?VW0yVXd1TVRJNW1mMXZiWldodnZTUVdzcGpRSGNUTEJUTjJtKzZXYmh3UU1p?=
 =?utf-8?B?bmxkNFFWcjVLL2YzVVZ1UnN4bisyT1Z1SXRuS1FQTzQ3OExodkExck1nN3Bi?=
 =?utf-8?B?YzFaaHVubDFDMDQrL3JLS0dmMU4wb2Z6VHovb09FQkpzeVkxTzMvc0pvcm10?=
 =?utf-8?B?bHpRSmNLMGo1UlZZYzZnRHdNZHYyS0gwbEJaWTRpQmRadkZlYUZXY1RGYzln?=
 =?utf-8?B?bmhmRHZtcmxJaW9laDlER25SSWE0bU4yMXZML25iSWpSMDNWaWs4TlQ3QVcz?=
 =?utf-8?Q?V4/+w9rquFLwvFMFOJH7VSFdF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e93ecf-892c-482f-8fdf-08dbfd8a1bff
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 16:23:02.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFoI0ISZktOab02vId4UF7jo/NNX5lyyZh5l16oaiZ0Ty0YwCTX2MgheBUWrji3UvYCqowxUfRU/mWa7eXw1Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Dec 2023 16:23:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8509

Hi Bruce,

Can you apply this patch to Nanbield?

Thanks,

Sandeep

On 12/14/2023 1:00 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
> merged to master.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] zynqmp-xen-qemu.dtsi: Remove device_type dt nodes
> on 12/12/2023 Sandeep Gundlupet Raju wrote:
>
>> Remove device_type device tree nodes as these nodes are no longer
>> required for Xen qemu boot.
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   .../device-tree/files/zynqmp-xen-qemu.dtsi         | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>> index 249a786b..336d7a25 100644
>> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>> @@ -1,16 +1,2 @@
>>   / {
>> -        cpus {
>> -                cpu@1 {
>> -                        //compatible = "disabled";
>> -                        device_type = "none";
>> -                };
>> -                cpu@2 {
>> -                        //compatible = "disabled";
>> -                        device_type = "none";
>> -                };
>> -                cpu@3 {
>> -                        //compatible = "disabled";
>> -                        device_type = "none";
>> -                };
>> -        };
>>   };
>> -- 
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8508): https://lists.yoctoproject.org/g/meta-virtualization/message/8508
>> Mute This Topic: https://lists.yoctoproject.org/mt/103141849/3619217
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/11646999/3619217/1621656938/xyzzy [sandeep.gundlupet-raju@amd.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

