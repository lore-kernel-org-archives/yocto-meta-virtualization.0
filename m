Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300AFEE14D0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 21:31:35 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web10.2214.1694035890659622927
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 14:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=Oeeg6uLV;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.40, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcHhxTl9sqLyG1sBsnLt92srsXz5SnCGAQeyDTqjlHEq+5mrkiyg8HNgtUu6NpIe8I767Jv2i6JMhVPeuY+YjBjYcq43innF8doa700NdH4IBV5xQMAAhCuy1SchKkLkvBkS3jaYVmntwKUOkMFEjW4TyuuBeIw/5o6ilWWSnhysipIGHE1dNgUhEhjc9wiS854+vd89rvhvdojufjKTD8SSXk6KRN2MfPv4Ks1zXSBBt0Zh2jjMB99moW7YUf9eOj1N4vYKL2t4KpXu1WpQaNVLCvIDgHyH/krFwB2p8SbU/OXTxm2f+G3pFGOqcQrims78oosjY7l2Hi3XVoLdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=armIfniD5ud4SLlvMDAbW0OK7wXb75RsG8fCdNxFyRg=;
 b=KEYP5aPAKt8rDZHxpU47NwKvrc0hemcjjNj1VxMQA6ViWMdJslgbh5qXOtADcZebxIGaBzo4OwIhQKpyZXzoMDUsmx9HCRhWCmmOehwXZeSG9TTw9hI92/2bLa43V5Z2YVoclzHr0m9g5kCQGS/lcxeszGpeLmshYFNAaMl5kxtEGu6spy90XRHlNYBGgWsW/6Mvy/5J/AB3o7KpNDJpixbFAnqL/6DUtMFlZqiVn6FKZfYDbmi5KyjEJSU1pla1u0udKJBZSdfrfY9ASAHzAmitEsyiUFowUUV6GGRS+mlnx6Mc/mSLo3ZJNE+GYpw9XofHHcNuOkQrMat28+m1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=armIfniD5ud4SLlvMDAbW0OK7wXb75RsG8fCdNxFyRg=;
 b=Oeeg6uLVztB3aaTlJcg1AdyVZSs1DuKvijVAL3VQS9iY7PHgeeZDBhUVN6QXphAPOgAbhBaciRCxhz+ubOSwAFvPeJjGn8EY4ow2qxGWmp+NW1Qyej6mxSbiFzHrPDLeTEO0ktZXc0LwEMuY2kfPwvlQ3d0SClYZmLg3M5wcB3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 21:31:28 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::8bcf:a1ee:afe8:ea4c]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::8bcf:a1ee:afe8:ea4c%7]) with mapi id 15.20.6745.035; Wed, 6 Sep 2023
 21:31:28 +0000
Message-ID: <3248da58-3271-37fe-c60f-ad9217d9ae5f@amd.com>
Date: Wed, 6 Sep 2023 15:31:24 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen
 variable as addendum
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 christopher.w.clark@gmail.com, mark.hatle@kernel.crashing.org
References: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
 <20230825181811.3306054-2-sandeep.gundlupet-raju@amd.com>
 <ZOtOQIeCfldaixvL@gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <ZOtOQIeCfldaixvL@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d76210-c81e-4545-7479-08dbaf20a105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LbXneqbsz9ZEp13jQJE3y8PIV7ZxK4n99YnpyMqW6zSIUW8B0MU0Mng8n9yWq+cF2j9j0U73DS9vAySl8xPivgE/IQqUywRn7u1NXTVl0146pXjKmI/BJeNRqOJy44LAlatus/wJPUcSPDaW2ZneZgrY/Ttv9v/WrfizKX+R2PEijMa27LKPj94JZ9X7gZtCaIWJtaHr0jNFvFrR5qpvebk+bvsT6sWZ0hkC8HE8+d4cx8V14BCovSAaAvXY9yR/XhgRJVoQQER8EWtCeGYzmghUWcKRA7roVymfTKaIioqnJ0sGuin77X/WyyNOeA4aNvRbQs3k4idYv1asXQVeVI7g0BZGcoq5D9FS+Pin42KtgRlOmvuMMtCFMS6r6MCkh2RGYj4Rdoz8p7ZFQMoOCWUSkMp30BNjaP1W6YGXuog1ZY4IO6EGoz1TVSlRuEQ6neBwYCng2gwiUiYDh/M+glKBaQ9AkKGONPcyb4d/0J3TrbW+ZYh1hBou+Uk3siyQIZQoCWGGnI4t4c+M4BeJc85E3Kiwr1GgG4uKemzsKeggJlAztGW4TJ4xTSgCGeXMhCM46QKnUgzrR1CEBCTwCt200RbTL1fZOjik1OKkODdcpquYByjeliR/qiBMGM4XOfs2Mk4Nsj5gMvHJMRZ0Kg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(1800799009)(451199024)(186009)(6506007)(6486002)(6512007)(41300700001)(66946007)(66556008)(66476007)(6666004)(53546011)(316002)(6916009)(26005)(2616005)(966005)(5660300002)(8936002)(86362001)(31696002)(4326008)(8676002)(478600001)(31686004)(36756003)(83380400001)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3oxV3dkY3lFQk1Cb2NVeXkrQ1FMQjgyVEZqRHRocWFIaCtLTGJPcjdaZFp0?=
 =?utf-8?B?YjRDSWhEU3F3U0kwZnNrK0h5eVo5OXhMR3Fqb1dxSG53S1lKbzE3dk16Zml1?=
 =?utf-8?B?OUN2L09kNnJtL0ZieHFlV3FheHowYlJsQ3h3akkzVUJIbHdhVUpINGdXMnYr?=
 =?utf-8?B?MjVURzNjUEZrc1FkUEl3aXJ6TjhxUnNYV3RoMExZbnpZTmE2azJ2QlVTT3JQ?=
 =?utf-8?B?ZWpJNFQ4Z0Q0Ujh6d1c0RVFTUlZSRHdqbjdSbjRudVVuYmdIWkUxcTZRdWdG?=
 =?utf-8?B?cGFITUFKb2VpektrcW5EOVB2R2JWSGp5cmNLTzNhWTF2cS9hdmgyaCt0RzJJ?=
 =?utf-8?B?NVN3SCt4RXdiY2JFYnVCVklRZ2tjTVVJbW54Ri9HVUJJNTBSbkhZU0o1Yzdv?=
 =?utf-8?B?N1U3ZWNxNktsZWZ2R2hQZVluU2V6MmZjRkNLdWZteEFQajk5M285cU1sNE5W?=
 =?utf-8?B?UHNiZ0tIb0FZMk9tYUZEMVpBUVA4VkM3QStFVGliL2s0WWl1MWRwZStuci8z?=
 =?utf-8?B?a3ZIK3kwUllNekZmNlowbVNmZTlZM1paNkhNbytiNUhZU1pPOVRkVWRFQ3Ey?=
 =?utf-8?B?dWVja2UzNVBZaitnUjYyWDUyYjBhWmJGWE9vbG1aSy9LSkMwcC9YT3NRYk4y?=
 =?utf-8?B?djdaY2JsWnplcGRGU1lEZENkcmZWd1NrOVZGaXhENVFlLzZyUmpqYUpEMzcx?=
 =?utf-8?B?clRqQVRQU0xYQTBFVXlTazA1cUxmQzRNajBScTRVN1hJZzFNeXczRUExeHpY?=
 =?utf-8?B?dUtVSjFtSXpZMndHY2VLT21wSHZSaDlHbzdlV0JnTFNZdEltMGZVdWlWOGRw?=
 =?utf-8?B?d1FqL083aVhWQjFGYlExeW4xVFpBVU9ZL1NobHhsVkpwMWg5Q2l5WVhZMnV4?=
 =?utf-8?B?WUdaS1ZKWjZFYUVwSFljNmZ3R1ZocjJsYkpia1NhckdoV1FqOW9pNnVTYk40?=
 =?utf-8?B?c0paS0ZGcTREVzNPTlhhZUVUMTZnTkowZ3NDekdsZjh1bVgwSHVtb3ZGV3Fo?=
 =?utf-8?B?UFRBNXBCRmhIMWR3cEIrMmJPbTVDaVZjUWNpSFV6c1VWOFVXeWJUZEgvQ3ho?=
 =?utf-8?B?dHMyWldqeGx6RFFpSkUvSGVLVTZabTlDclphSGFmdVpiQ1E0RXNmMFpHMmJE?=
 =?utf-8?B?dGxsMFhCMWt6UE9LcHU5SkdzUTdOVlpjbWdybXNRcVRCeGliK3ZDNnQ0NFVq?=
 =?utf-8?B?OEVjNjhpcWxXK1pMMWJvSThIRmFpZHhLZzZRL0RtMmJWa0NEWmdkNGVVN01Z?=
 =?utf-8?B?SG5pdWU4QVpEdU1Cc0RTZis3ZEpzYkhEZSs0aGw2QTd2aHNONWhNTSthdVFS?=
 =?utf-8?B?RVlkT3BJNGV1eXN2ZTB4Q1V6K3RyUWR2Q05QdHpNcWkxN2ZFeE5IVEhoSjZ4?=
 =?utf-8?B?ejF1b2VTdkxBY0QwVFFTNHlRbnBHUTNmKzQvOVNpZnpiVk1IZHFrZzlpbEF3?=
 =?utf-8?B?STVON1NmRDFWRjdrdnBtMllEekI0VXBXc1RucmZWdkxjbStwalZmL2lpeXBF?=
 =?utf-8?B?Sll5Sk9ZcFZPTUVIdEYwY1MwdWVyOU5PRXBoYjRDY01vL1NONlVWVWovYWd6?=
 =?utf-8?B?aFhXc2V0d21xVm4xbWl6YjZHTm5kZi9XUm9PbHNaeHBnK0NMa2pzMWV5eXY4?=
 =?utf-8?B?SzJXOEJRaGQvME1jeC9GL0R6aENBYVM3NS9zZ1VtMHVkcXVYZkk0YUY2VkVh?=
 =?utf-8?B?WnMwN2o1WER5b1RGbXg5eVQ2eXBWMzB0TlFVKzFLMnN5RVBjNFM3Q3plemg0?=
 =?utf-8?B?ZFZHajhGb1VyTVZYWmhsT2l1VkdESTVYdmtSQ3o5VmQzRzM5OGFVSjJYOUk2?=
 =?utf-8?B?REhUdGdieXpyd1k2QmVzdTdvNnlTN1BnSFdOTnVQbE9CY0ovejA2TzBOaklZ?=
 =?utf-8?B?VFpKZTcwMHBsdTNtdkdOb0lJMm5SZ0w5ZHl2aDg3c1UvN0ZWTW9ZOWpHNmxE?=
 =?utf-8?B?bURKZ2tzWlRzazVVVFlPWjE1UWNSc25Od3BWZWNBeTZEWGRvQWVHU0FqWjNH?=
 =?utf-8?B?bysxejJwRm5qNEU0Z3R2ZHU2bVltVDFhclljZnJMU1JYYnFlemNpOWUvVnFz?=
 =?utf-8?B?TFJxcVgvTXdnVjdhU25RK1ZPUkwzb244NFl2VmpkK1ZXd2dMZk1XUGNIekVY?=
 =?utf-8?Q?/ECb2KUeTN7psTRR4RdQSJOKp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d76210-c81e-4545-7479-08dbaf20a105
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 21:31:27.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/UIeKDSwX1/MZ1ieuooPPRlcO7UVb9qZcKaQ99X0D5mE3qghj1cAUdwdBJYQMKHehviEOAmM1i+I5u9yATPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Sep 2023 21:31:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8281

Hi Bruce,

Sorry I totally missed replying to this email.

On 8/27/2023 7:23 AM, Bruce Ashfield wrote:
> In message: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen variable as addendum
> on 25/08/2023 Sandeep Gundlupet Raju wrote:
>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   .../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc       | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> index b2b76120..6d113c9a 100644
>> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>> @@ -36,3 +36,15 @@ XEN_CMDLINE_APPEND ?= ""
>>   # Specify the max number of vcpus for dom0
>>   # Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>>   DOM0_MAX_VCPUS ?= "1"
>> +
>> +# Add xen variables as addendum.
>> +# Variable SCRIPT_SED_ADDENDUM id defined in meta-xilinx and set to null by
>> +# default and enable only for xen builds.
> s/id/is/
>
> This really entangles the meta-virt dynamic layer with the xilinx
> layers. You need to have an understanding of one, to really understand
> the other.
[Sandeep]: I understand the problem is there is no standard way of doing 
this.
> If we are setting or appending to a variable, it really should be
> defined in meta-virtualization.
>
> Is there a way to move the functions that are using this variable
> into the main Xen meta-virt recipes, in such a way that this is
> a generic way to customize the boot ?

[Sandeep]: We can move the xen specific variables(such as DOM0_MEM, 
XEN_CMDLINE_APPEND, DOM0_MAX_VCPUS etc...) to main xen meta-virt 
inclusion files. Then using SCRIPT_SED_ADDEDUM approach in dynamic layer 
we can append to existing soc vendor boot script recipe do_compile task 
or a separate xen boot script recipe similar to RPI. I will prepare a 
RFC patch and send it for review.

I'm open if you have any better idea or way of handling this.

We can also explore on image builder tool 
https://gitlab.com/ViryaOS/imagebuilder/-/tree/master, We can create a 
imagebuilder.bbclass and user can input the cfg and generate the right 
u-boot scripts. It's VERY unclear to me that this is useful for anyone? 
we need to better understand this component, how it's configured and 
it's general purpose usage.

> Bruce
>
>> +SCRIPT_SED_ADDENDUM += "-e 's/@@XEN_IMAGE_NAME@@/${XEN_IMAGE_NAME}/' \
>> +        -e 's/@@XEN_OFFSET@@/${XEN_OFFSET}/' \
>> +        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
>> +        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
>> +        -e 's/@@DOM0_MAX_VCPUS@@/${DOM0_MAX_VCPUS}/' \
>> +        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
>> +        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
>> +"
>> \ No newline at end of file
>> -- 
>> 2.34.1
>>

