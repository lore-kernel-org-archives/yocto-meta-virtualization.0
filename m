Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA797D743FD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:40:59 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.81])
 by mx.groups.io with SMTP id smtpd.web10.4535.1732210854809608768
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 09:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=FabZEZYs;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.81, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb8mF8aykP3BAxgZXm9AmjydE/vENgBdB5i4YAQdN5GcKSgYMeWo4VOy27paWFo/NgtT7QwWn91X0bJUDFaBNaWcd9/LjgQZnbzfMY2FH2bEep1YryHM83Z7ZHPh/1IRoaVV5r381f+g9jjaZ3QERkUqiM6idpg5eQ7NZI012W2ruE4j0b+qNl3OfkJ8BROmZJp+iMWyRbWE3q6+aFTaO8Xj3rhalapEsheebUGJZ4VtkNa9o2ncIXsKX5kSMVEIAac0D8jS0qM+IiDUD4FicVIgwV03+DL9thq91cnzhNlBiubGhFjpQpBO4JExWII87KWeX8BaufzHlnwEp9T2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwAIGZyXrTMfKfLhSxHYpFOdz7T9wdPAPescKBALw+Y=;
 b=usg5W+EOZrfFhI+xaj8u/VMlb7ffdnGlTQ4cWcu/vrAKCXSZ/tnPsC1qC6KH2oDxo+HxWvpKwlJFxIzMEWazEYJYqYldVkDqBKzfc5TJZWrMHlOidog57qXH2XFOqD4YGAhwTnSOiwND5uj3/UdS2htukqVDs3A1l38hyThArt1A9lOxoXbRXnOfMIsvTr2VpxMQj9HVGN4WGlRYi98nDcNaR+YWI7KI2uNBxjPPM1/4AHi1mOUlf73BDz4F0yBRi8rqQ0lmCRzTbzwkhFp6e5L8CisyoN1FFieVDan70suBulLzDytDOQCZvVReyWcUr5vrTPdDgumn68q7nMcymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwAIGZyXrTMfKfLhSxHYpFOdz7T9wdPAPescKBALw+Y=;
 b=FabZEZYsv7byQ/FNzy0xqp9Nwj3zewZU8MRyujucIFko+5nC9HFi59kyxGF8ryosgQpCpOFOfUdK+xCb73PoLaXHkJvPMtyRsYVyB/WSzVjm2/50U//OXDVPi6PI/w5OD27eg5Yl/la/LVcokwv0k78e4NvXdTOTKDy2boN5F90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Thu, 21 Nov 2024 17:40:49 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 17:40:49 +0000
Message-ID: <1321e54d-21cb-46c6-8d03-d9b840063920@amd.com>
Date: Thu, 21 Nov 2024 10:40:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][PATCH 1/6] xen-u-boot-scr: Add
 bbclass for xen boot script variables
To: meta-virtualization@lists.yoctoproject.org,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-2-sandeep.gundlupet-raju@amd.com>
 <Zz650spUU9SEUE1c@gmail.com> <180A08C7C2D5332A.23999@lists.yoctoproject.org>
Content-Language: en-US
CC: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <180A08C7C2D5332A.23999@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CY8PR12CA0069.namprd12.prod.outlook.com
 (2603:10b6:930:4c::14) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e14b63c-53f1-4389-c514-08dd0a53a365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w0lAPS0mGQZ5q5fSit+Kl38QBlscUXp17QHfA5ohizV2MJhVdDvVwRt6Wj28?=
 =?us-ascii?Q?gT69wZO2oRlRhHy1B08uuLt9tdG7VAW7tlwxoBAXh+mZgXSY/SGaO4ZeCZxS?=
 =?us-ascii?Q?ztOSoanAFfTtPqjEOCl8bJoGyaG908xS/JRcFqkCei3NEYluaUuy/siuQf8p?=
 =?us-ascii?Q?cyNHCaXvuaPO0yDkw51cgul5bZUNwVWfniWDr4HmoZaLfg5X3e+vHOR6tevm?=
 =?us-ascii?Q?lTc7aIxJSUkSoSeZ9mQO5dxYTX8Qy41DidMd1YedFpxwaYH/t2j8q53upcaR?=
 =?us-ascii?Q?a/3bCZvwEd1ZWR+JJHivco8lCkHetA0AF7totplmrf6uMNHedtAHvZt9Paiw?=
 =?us-ascii?Q?kDAyZa1X7fKuSajEK0+SeQ/e7KyMLLWn8sVHomasLJIUrgNcJkCGSYB6/D0r?=
 =?us-ascii?Q?qlVKrVXuSVZXXT0aLZ0JX/7G+CzmopDi2Zudk7jvDXCBWdRyW+88An/nTgbG?=
 =?us-ascii?Q?vHf4P3qynWOpy85JlIxNJdKsNDbxkHu+EhLd6qagjC6tO47R3toltXSoRIry?=
 =?us-ascii?Q?VMELUbFVWnwe3jdbrhekCIG0QjHFkFPNjRHzSZVrX6LUDDGCJccydBwIjJN6?=
 =?us-ascii?Q?dyMQT7/LvsJ+3/sXRsViOVfJn8JtmjL6yriPXacLM1MosJkfKdzxvQbanw23?=
 =?us-ascii?Q?0cMXd8/l54Tx9ALiArIWA2F+e0iwcajEQWH35qhEI51bp3klHRD6WGsKu8cQ?=
 =?us-ascii?Q?Re7ZrxdwlibQSw5Tn/hkWAJNtL8YfZ4J37QZE9v0XtHUvk40AN12KRYQKbHs?=
 =?us-ascii?Q?oU56+GqSM4vbaK2xOZqJXCTmOD0Nzuri1xJb1m5UHfyVks+23rCGihtfT7NU?=
 =?us-ascii?Q?U2nMlR1cIz5OPNkctTg6Mh1SW2JFttWbK9e0M5hJ8zLeHrveBCMQaDmGpvcm?=
 =?us-ascii?Q?NDPtvdIpcZAQwgfTTtuciSSXf0oYbZujrZ/NDIWHV3G5wOEGj5pz02sZYne5?=
 =?us-ascii?Q?si2h2Md5Gtlv8G7OJousWxeMZmpr3eOtrWSUXuAAufXQqbCM6u0k4VRkHiPQ?=
 =?us-ascii?Q?X0DJP6QtnJpdL71u9LeIfN4BmzjoJmL9oD5dlZ0+RFy17GAOjiPcan4+0ODm?=
 =?us-ascii?Q?h/99xmvHX7wcaZakfbgJrtjTlXBbAwHbbnCsvuoxOV5dmyMkbc/vXbh2i2cC?=
 =?us-ascii?Q?pUuG4q49RcGXmiioF9wiuafTwFCMh7qj941V3/t+wvRMnVegkMV2wLJyiEAi?=
 =?us-ascii?Q?U1v7oMFqmyD+WHWMQmKSeL42FhY6AFl6igrkM+3CvpVaq4zqGQTBQkDkXP5t?=
 =?us-ascii?Q?bYydW4TtzCrbiv1RpLaZ/b22dLC6rnyYQS0KEtE7zA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BXIdBOw4z8KcZNTSVA+8xDgBZOrnT8XsCPfdGhDqlkzWalN+hqKMUcHxjiGe?=
 =?us-ascii?Q?LRmyJRdd6gG4+rOcLnDvoVmQCMov13z8z2d9dtSuEpSNxC/SFz7ytC84+Twz?=
 =?us-ascii?Q?kMkNEKC9PY4vhDj+nRlzbXsplp/XdHIkEXttQ/Ua2Sb9J1Hnxy6U/Gncx/90?=
 =?us-ascii?Q?YxA08XW5Q/lMBmmXNszXVjg+A5DfSlX8dbQsLTp9YQU9l3zWaUdyX3ht7dC0?=
 =?us-ascii?Q?brMWkvjNltupuYA5t584URL2viX+jnn9x2FSy7jA1a96YwEfvIVkGg4PG0ce?=
 =?us-ascii?Q?h/PGWjwyIr+dS0b7n8WJpW9DoQOGiLDZ5/ktQEsc15qjo5f5pAUUCS/crfHS?=
 =?us-ascii?Q?Mg3bBjo2iL7PIeR3QbPpDJ20sdUmvbMYw5iJnN5ukU4PUsZvkXRq2Bi8c2wq?=
 =?us-ascii?Q?wzTwZ/6BCWx+SKoTrW3MK6s44nY96gqXKu5hiYNsewJ0vXFHGWiuWZahHofO?=
 =?us-ascii?Q?DWdditYH04SRBjGzQ+qaU2Y4YvLnfriA8wNvfdwvsb5BqWaUEwNUXvlA9n/f?=
 =?us-ascii?Q?lKKfc3h9l+M1mSKcVkkEF+tkFqgTxS525daCyRr9mMoCEsZzJ7K6beg8Hb4W?=
 =?us-ascii?Q?9rr7Pr3thjIKuBNT8dQCtAe3EchkpMn1Vnn/rhFycnLRl/SeSz9U9SQLA7FT?=
 =?us-ascii?Q?w8Fec3DkAqQ2drPU9C/9LvOoW7cJ3QDLumXD99bAzpvJibV/nuTXFB03MdfR?=
 =?us-ascii?Q?Zy8tM5MWomUZSr65QRa4H1PZATA3nGQ65hftMlu+QpFfIAgrF7tvstTp6KL4?=
 =?us-ascii?Q?jMRtzU2YV0dHjvjYDg62WSuIfDCGcFgnThFT/wAuK7Gn4bqYMQ3gg5jHn8/V?=
 =?us-ascii?Q?lSp3Z+T7TicD81GKEDAqbVbfeLjiKBM516Vjyf6pacI06o8Jf74Zgtgl7YCj?=
 =?us-ascii?Q?EGE6Oq756dd2CCJDUtU7qkr1UbNJRXspds3Jgf6y+gArPGfzCoGq8eZsk6re?=
 =?us-ascii?Q?rnXCr2IdTcVUMknjVID9yzaFQ+XY/GJW/lPHPjHnDD37shIaH7rfUtZiT1Ej?=
 =?us-ascii?Q?5MOMdNnP2oJ87itK6QjtiIx3ZpIZouyz3R7bEo2/zh3k6Dza/QWRKEcIQ6xE?=
 =?us-ascii?Q?6oyg7sTAlq+0yzqN/NY/9o/jvfDMvsi0fEM5i3S/DbvBlDACSA6hCVUjOk+s?=
 =?us-ascii?Q?iBk9v9qQtk14awvEOb0E70YId/QYssf9K9QPmMnpXBQ0pjxupCr1KDqSX6gW?=
 =?us-ascii?Q?woq1HqvaD3xqaX/tgdUsCefqTdi+VNf44jQ5G2p8hSMWtMZkmQX0g2abb9js?=
 =?us-ascii?Q?P4+j7WRHUqTvXtfsvEwoZGp1C8A/qNtE+wnmrk/kURz5dIwd+64Opn/HkCSC?=
 =?us-ascii?Q?ZjTSO1PGc4S3KYPq+5e/dctw7FN6RGAo89dvkXnNn2k/xS27ZQcURIart4r5?=
 =?us-ascii?Q?X6bf8IeVHgBfghbvDV9AcnOFwmmLvEwmfrSUSnMJHlTA/hSE5sUg5Zl6tH0Q?=
 =?us-ascii?Q?AX2Jf4sjLSIjjX/++Pi+LKVWSk9bBDM0e+j9CmbSiYm8lzMzwLM96KBdjAoW?=
 =?us-ascii?Q?3wSZCAIf9qjyqOoCiEwHw1N4B9Y4LMcWQrJ5nFUdzKuDqN6FuEpf4vlVXDlA?=
 =?us-ascii?Q?v+1DhOSxCZZRuikMZcUbSI8Pj5ebAae4jwWFCxSV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e14b63c-53f1-4389-c514-08dd0a53a365
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:40:49.7772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfw27bZMBawLvV/uR4vqJdMm/DCiSfW/X9MPH/0BbRVYzKzqVARnzCre298+rVE1g5/ytDzzeVCM0uH+EApInQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 17:40:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8999


On 11/21/2024 9:30 AM, Sandeep Gundlupet Raju via lists.yoctoproject.org=20
wrote:
>
> On 11/20/2024 9:40 PM, Bruce Ashfield wrote:
>> In message: [meta-virtualization][master][PATCH 1/6]=C2=A0 xen-u-boot-sc=
r:=20
>> Add bbclass for xen boot script variables
>> on 18/11/2024 Sandeep Gundlupet Raju wrote:
>>
>>> Add a new bbclass for xen boot script variables. This bbclass provides
>>> common xen u-boot boot script variables which can be inherited by any
>>> vendor specific u-boot boot script recipes. Also these variable are
>>> configurable from recipes, global and machine configuration files.
>> This is this just for configuration, I'd prefer if the
>> class was called: xen-uboot-scr-variables or xen-uboot-scr-configuration
>>
>> That way when I see it inherited from the recipes is it very clear
>> what it will be providing.
> [Sandeep]: Sounds good I will send a v2 patch with bbclass rename.
[Sandeep]: Bruce, One more clarification we do recommend=20
xen-uboot-scr-configuration or xen-u-boot-scr-configuration? Most of the=20
Yocto u-boot recipes/bbclass has u-boot nomenclature and not uboot(no dash)=
.
>>
>> Bruce
>>
>>> Variable nomenclature is aligned with xen documentation.
>>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>>
>>> Currently it supports Xen Dom0 boot and can be extended for DomU
>>> or Dom0less boot.
>>>
>>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>> ---
>>> =C2=A0 classes-recipe/xen-u-boot-scr.bbclass | 43=20
>>> +++++++++++++++++++++++++++
>>> =C2=A0 1 file changed, 43 insertions(+)
>>> =C2=A0 create mode 100644 classes-recipe/xen-u-boot-scr.bbclass
>>>
>>> diff --git a/classes-recipe/xen-u-boot-scr.bbclass=20
>>> b/classes-recipe/xen-u-boot-scr.bbclass
>>> new file mode 100644
>>> index 00000000..df8287e1
>>> --- /dev/null
>>> +++ b/classes-recipe/xen-u-boot-scr.bbclass
>>> @@ -0,0 +1,43 @@
>>> +# Copyright (C) 2024, Advanced Micro Devices, Inc.=C2=A0 All rights=20
>>> reserved.
>>> +#
>>> +# SPDX-License-Identifier: MIT
>>> +#
>>> +# This bbclass defines u-boot script variables required for xen=20
>>> boot which can be
>>> +# inherited u-boot boot scripts recipes and also allows to=20
>>> configure these variables
>>> +# from recipes, global and machine configurations files.
>>> +
>>> +# Variable nomenclature is aligned with
>>> +# https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html
>>> +
>>> +# Image Load Address for Xen Dom0 boot
>>> +KERNEL_LOAD_ADDRESS ??=3D "0x00400000"
>>> +XEN_LOAD_ADDRESS ??=3D "0x00200000"
>>> +DEVICETREE_LOAD_ADDRESS ??=3D "0xC000000"
>>> +RAMDISK_LOAD_ADDRESS ??=3D "0x2600000"
>>> +
>>> +# Xen boot image types.
>>> +# KERNEL_IMAGETYPE: Specifies DomU kernel image file to be loaded=20
>>> by u-boot.
>>> +# XEN_IMAGETYPE: Specifies xen hypervisor binary to be loaded by=20
>>> u-boot.
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Example: xen or xen.efi or xen.gz
>>> +# DOM0_RAMDISK_IMAGETYPE: Specifies DOM0 ramdisk to be used,=20
>>> Example: cpio.gz
>>> +XEN_IMAGETYPE ??=3D "xen"
>>> +DOM0_RAMDISK_IMAGETYPE ??=3D "rootfs.cpio.gz"
>>> +
>>> +# Set the amount of memory for dom0 depending on total available=20
>>> memory size(DDR).
>>> +DOM0_MEM ??=3D "256M"
>>> +
>>> +# Specify which UART console Xen should use. You can sepecify the=20
>>> devicetree
>>> +# alias or full path to a node in the devicetree
>>> +# XEN_SERIAL_CONSOLES =3D "/soc/serial@7e215040" or
>>> +# XEN_SERIAL_CONSOLES =3D "serial0" or
>>> +# XEN_SERIAL_CONSOLES =3D "/axi/serial@ff000000"
>>> +XEN_SERIAL_CONSOLES ??=3D "/soc/serial@7e215040"
>>> +
>>> +# Specify additional command line arguments used for Xen and this=20
>>> will be appended
>>> +# to xen-bootargs cariable. This can also be used for passing debug=20
>>> cmd line arguments.
>>> +# Examples: XEN_CMDLINE_APPEND ?=3D "sched=3Dcredit loglvl=3Dall=20
>>> guest_loglvl=3Ddebug"
>>> +XEN_CMDLINE_APPEND ??=3D "sync_console bootscrub=3D0"
>>> +
>>> +# Specify the max number of vcpus for dom0
>>> +# Example usage: DOM0_MAX_VCPUS =3D "2" or DOM0_MAX_VCPUS =3D "2-4"
>>> +DOM0_MAX_VCPUS ??=3D "1"
>>> --=20
>>> 2.34.1
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8997): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8997
> Mute This Topic: https://lists.yoctoproject.org/mt/109660017/3619217
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
sandeep.gundlupet-raju@amd.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

