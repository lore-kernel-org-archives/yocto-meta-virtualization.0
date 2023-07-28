Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA034C001DC
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 00:38:33 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.75])
 by mx.groups.io with SMTP id smtpd.web10.22760.1690504706801754150
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 17:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=gQJ36PxG;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.75, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Duz/mYAulc3WmpjpMI5Fu2RGyRtJB3MFkq+drKgtHXw2ZvQQ9CUfvkxQ3J1KNezV7r8qX7asij44XaV5KlWeFbPizzntL89gqQ7zZTsFJJQp6jBoFtnhG+/VN1vsekudcxwESiqgKKnW/OXYksmFZlgCm3XoJ+iJWWe+3IBczz1pqQ31qsbIBuLdKD7uYlUJlg1YEQ62yfGx7ShqkLWfOxnPzjCjMGSADlSxXGlaVAUgaM0EpF/ABqi4dfi9AEspKWeFxhaqlKtXjywIK+oa1fYBHBHLhQjllp5XmQVSUbZUNtE+R6OXblaejqP6QsMXr+sH/aOfHn9B7oOR3OwPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjtUOEn9YutGBp218+jl7+OJN9L3oCkVkZ5NLT/0VNA=;
 b=OqEebUD6+OAqFlgwvLTZZfzO8KTmsW/9e9zDdStF0aor6d6xozaUyJsA/9WQyVw8BsqsvRyCXc1+v7cI9nyAuopH7AHD5YRJprLv4Q1VQYTVyp6XnTQE3TuMFsAGekk4umfurHlbsDvWdrOf29zBkoFyICZisu4AR4vsDAlebczA/89QIxoYwSRBo5VtstjFjWRVLzA1tDh+QtW4StMgAvfh3blTceWX8gBROyBnYvjBLStn+4jA1vucavmQ1nOcL9pYtWgr9HRQtkUqT4jsf59YFJh3DtRqEm26rNGVlvb8jsC+zWvmVZKrXyzLC51xmpqU6/e4nDgQSgtMjJvJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjtUOEn9YutGBp218+jl7+OJN9L3oCkVkZ5NLT/0VNA=;
 b=gQJ36PxGyzENTl0iQ7qCXsupvKRBLDhCcDmcuv1D7de3OoaqQ1oqpftNjqrSYj0wzWOVPuKS+MonocmGCGcgTlUg4rB5Ckspo7Y30PN01CWPf8Qu98QFd4NkEgVHuJ8/FesvUxx1DI10RGDUmOHy7FOTPaV7o9/bXpSdkbulpIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 00:38:23 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:38:23 +0000
Content-Type: multipart/alternative;
 boundary="------------tPEivbTUpqWKEwie57Lvzd0F"
Message-ID: <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com>
Date: Thu, 27 Jul 2023 18:38:20 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org,
 "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: d740ef08-9f0d-46f4-4137-08db8f02f322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bomun0o/oVDsCIJpgImIA/r99an7R5g+RAwsyqhcsCFDwdTcmhSsvaU98D3wD+n4+C5ZEVuouDeaVgB3qrNrUT7jUemojRcXPcyLvQWbwKEdrSJ6iwIN5i3KSkNPcAYgchPu5V148uP92LplePv52zmE2dS8gEwn0hF/au6hMUj/C7oR7HbizQ/dmnrqsNJSDxmjNstAurnWsLMIXJKiBfL1rUMzpOAsfB05/i+swz22SpANTOH7WfSqs/+Q3kHHFyzmcoLgt8B/YlmYRY+E+eQ3qb+DntSIzID6W4xxHbdaYIUzTixTo/y45poIbJvbsXFirjWH2xCq0ZHE/DAo7K7S82HgM/uwJIcsZaMd2c974PrkbWtWbO3UulnDYqyCT33u6HFiQj4IL8zJx8UQQPQthjv4eWzeEJ1IiDWzGi15c9rX6CTAu6OWf19o0/bj/5sbicndW+xacN/WBZWwi8AQkOz6/pB3dQbf69quuFi+kVv3zT6hRd6svQP/VfEr5RDMeXWwfNBfwdWINdBRMlmY+3h3YA5tYF8pXMQasNBSmJJ0jEVykPKXxYhT5375OpUIJm2Uvgjv/XAApKSlwoEgLk5Ciccq/O6QHQA5eD20wgfYXgdPdOgl45pOdUG7fFNw6rlWDaW9NZOSaIkgYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(2906002)(316002)(8936002)(8676002)(5660300002)(86362001)(66899021)(41300700001)(36756003)(31696002)(53546011)(6512007)(166002)(966005)(6506007)(26005)(478600001)(33964004)(6486002)(83380400001)(186003)(31686004)(2616005)(38100700002)(66476007)(66946007)(66556008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDJtemlCN3pyc0dRUms3MC85dlZxUWV5Q0prajBKZmdud2l5TzlJZWIzMGx3?=
 =?utf-8?B?dDZrZWxlL2xkbjdRRUN1WmR0RTBBK1I0K2NoTDdQcnJLNE5QUzlzU29mYnFH?=
 =?utf-8?B?RUc2TS9UUFlTdVBTQ0NzeTE3UkI5QUk0WE92NSswbHhIbzZUcGg2OTI2RjIy?=
 =?utf-8?B?bjZHd0l1M1pMa3Ewekd0VkRmbmpNR1d2VHd2L1dHYy81SUJQRk5LOEk4b2Js?=
 =?utf-8?B?TTAyVjJHTENzSFFCQVJoN3F1dlkzQmJwRW1Ra2lNUVlaVjczZ1BydTFLRjlu?=
 =?utf-8?B?dE9KRzlXLy9ueSttNVc5NXorQzFZVC9OMTNvMXFmTVNBYTdYUnhvWU13NlF6?=
 =?utf-8?B?VGRQaFBqUWlnNWlFSXZqTkZyZFc0YTBqekxTY3JaUVRHRURUaVJoSlpJOWp1?=
 =?utf-8?B?RUh1aGNXd0J4cU9iR0VLQVY2NWhROWZ1Ujc3bC9DbnpSVDhkZDBoOW9TWVVE?=
 =?utf-8?B?ZnpjOFZyWUFxZG9BT1JQUStxRTMxZE5RZ0ppazE1eHBaZG4ydkdLcEx2K0ZD?=
 =?utf-8?B?LzhtSURKUndsaHhvcVpISGFIZ0hBNWZObzdCNkpncm52WW9OWWI1aDVGVTBj?=
 =?utf-8?B?SFM0S0txTVo3QjBtaG9YVFpTSm5jRDEydG9DYUtSb25OOThMbDB1dEwxaEo2?=
 =?utf-8?B?eWlSQVFaY25JNGVoc2t0TkpFSlh3WEVrWUlJSlhDUnFrWmdKRDRaMHRFenMy?=
 =?utf-8?B?R0w2YlpYZE5MWmlFRmpQNTZQWDh4N1lMWjNveW9IZEtWa2syRGZQcEhNRHFs?=
 =?utf-8?B?VTMveXVHQk5BS3pBTTYxNFEyN3JsMTliaytIWVVZQzhTYTJtMjhtZHBlU0tP?=
 =?utf-8?B?K2MvUHM2bWxRL3A2R3dPb1o4cEFSWUYycHdXYkd2R1FTSVB5NmJhU0FvY21H?=
 =?utf-8?B?Tnppa0dySTBRNDY0ZWJnWWJSSUlvajliK1UyOXJaTjFrQ0s3c2tSV1laNkIy?=
 =?utf-8?B?bEJWN2pqOTYvcGw0N2FSa2N6NkhyaE5FWGU3NDVRLzFIWTRacmxZd01KbE1F?=
 =?utf-8?B?Q1FQZUFKYlVYSW1VYTZNNnIxTWowNGhKcnloaHpONURwWWJlcGhaMVl0eHQr?=
 =?utf-8?B?SkFQd2FObHQramRRaDZUL0FNemVQUlBSWmh1YlIrNjgrcGRZMlR5a0xNWXFH?=
 =?utf-8?B?SW1tYTdYczlWSjhyanQwb1U2QkZVOW9nRHJCcTViQ3ZJMlpGZ0xiRWdYNjZq?=
 =?utf-8?B?R1hjVVlBUS9GSStobCsvWmFMY0pReTAydkNxOXc2MHk4RUt6QjZkZFhPTHZ6?=
 =?utf-8?B?R0FudjJaS1ZEVHh6THVaa1NiL29wMnkyTGVoVVJIM3dYRVpUV2phYURzY0hJ?=
 =?utf-8?B?QWlOeXpYekdBL0l1MGZWUFl4Q0U4M0dFOUlxNmhGOWF4ZlUzbllxNjJ0TnJo?=
 =?utf-8?B?Sm0yQTRzTUVsdHZJNkJEMngwa2w2TXluaUgrZE1obm5YSWxad0plMmdGNzhT?=
 =?utf-8?B?ZkNwb2FRVXpZNE9zcWpKcURpTkJOS2VFQVpBRmRmZ082d2luYlV4dFFYNkRo?=
 =?utf-8?B?aGtBRlRGd3AyVlIzbkpnYVBNa1hjdHZTRXBsc210OG11amtJSzBkMDl2KzBk?=
 =?utf-8?B?YVIrd2xDL1JycWhQdmpWYlZVUGs4VWNxUTR1L1ZHK0FUR2FNVGo5Ui9IcTZy?=
 =?utf-8?B?Z2FzbDl3RnBCRWZybDRoQkxuOHp3Vzg4bFRhLy8rVGxMR2xmMWxUSU5nZGhr?=
 =?utf-8?B?RStIYngvUlpMbmJROUJoK0lZUlJ6SWRRTDczSWc2VUNDdHJHN1l1dXZWVzdi?=
 =?utf-8?B?YWdVeEJTa1BwWEduVHNhUFZEcGQvaG1abzVxYzNOMmdwVHhLdDMwbzJDUzIx?=
 =?utf-8?B?aEhhakpyQ3JWSTdFQm0vRUZzR0luejM1REh0aVBoQ3ZpZWE0Y2lwbDUzN3dn?=
 =?utf-8?B?bjVFS2QwR1cvUWF2VExvQ2RDUkg5VFpCY1AxMzU5dWRmRzFCVHdBSzFqc2FK?=
 =?utf-8?B?VW13T1B3TCswR3FJQUZrMm5SNytKbkFGWjhVa2Z4MlEvaVdzcDRCZW5EcXll?=
 =?utf-8?B?cll2U1Y5Q3NObTFEUzdrYWZ0MlRKOFdQU1VBd0E3aGQxR0c4a2NvWFNwSFl4?=
 =?utf-8?B?Rzg2RDZVT2kyMXg3eVNxWEFxUEY1S1kzTzd3d1RUMys5ZDlFbGxIWkM0b3Na?=
 =?utf-8?Q?Bhbe5hGpJ9CEVAuhzK3JcYriz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d740ef08-9f0d-46f4-4137-08db8f02f322
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:38:23.5935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SN++zoclz6qQYu1sjhWd66djqrB1KnKb/fQHnW8+GyGj/1a1/n4TJx96I6TIH1ns6WaljGIwNA4qcegJD3FlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Jul 2023 00:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8146

--------------tPEivbTUpqWKEwie57Lvzd0F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org wrote:
>
> On Thu, Jul 27, 2023 at 4:22 PM Sandeep Gundlupet Raju 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     Add Xen dt and u-boot script support for AMD ZynqMP and Versal
>     devices.
>
>
> Hi Sandeep - this is a slightly surprising submission. I'm unsure 
> about meta-virtualization being the right place for this as typically 
> hardware enablement is more appropriately done in a BSP layer, where 
> engineers who have knowledge about and access to specific hardware can 
> collaborate on maintaining the machine-specific aspects of recipes.
[Sandeep]: I checked with Bruce before I submit the patches, Since we 
had xilinx dynamic layer, he has no objection in accepting the patches.
>
> Xen in this (non-BSP) layer has support for qemu MACHINES, plus 
> generic x86-64 and the Raspberry Pi 4 board for Arm platform coverage; 
> the latter is a special-case that has been discussed by Xen and Yocto 
> community members as a basic commodity reference hardware platform for 
> testing (and using) Xen, and the community for this layer has more of 
> the interested parties participating in it than meta-raspberrypi does.
>
> Are you experiencing difficulties with maintaining your Xen recipe 
> components in a separate layer?
[Sandeep]: No we are not experiencing any difficulties in maintaining 
these files, currently all the dtsi files are in meta-petalinux layer 
and if users are using without meta-petalinux distro layer(building 
xen-image-minimal), then Xen doesn't work on ZynqMP and Versal devices. 
Mark Hatle and myself we discussed on this and we saw rpi u-boot script 
and other files in this layer, we thought this is a good place to move 
these files. Mark can chime in here to add any additional comments.
>
> Christopher
>
>
>     User can enable xen u-boot script by adding below variable from
>     configuration file as shown below.
>
>     BOOTMODE = "xen"
>
>     This u-boot script also supports to configure below Xen params from
>     configuration file.
>
>     params          variable assignment
>     ------          -------------------
>     duart           XEN_SERIAL_CONSOLES = "serial0"
>     dom0_mem        DOM0_MEM = "1500M"
>     dom0_max_vcpus  DOM0_MAX_VCPUS = "1"
>     extra params    XEN_CMDLINE_APPEND = "loglvl=all"
>
>     Sandeep Gundlupet Raju (2):
>       recipes-bsp: Add device-tree files for Xen support
>       recipes-bsp: Add u-boot-xlnx scripts for Xen support
>
>      .../device-tree/device-tree.bbappend          |  19 +++
>      .../files/versal-net-xen-qemu.dtsi            |   2 +
>      .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>      .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>      .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>      .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>      .../device-tree/files/zynqmp-xen.dtsi         | 123
>     ++++++++++++++++++
>      .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>      .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>      .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>      10 files changed, 408 insertions(+)
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen
>      create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>
>     -- 
>     2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8145):https://lists.yoctoproject.org/g/meta-virtualization/message/8145
> Mute This Topic:https://lists.yoctoproject.org/mt/100401326/3619217
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub  [sandeep.gundlupet-raju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------tPEivbTUpqWKEwie57Lvzd0F
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Chris,<br>
    </p>
    <div class="moz-cite-prefix">On 7/27/2023 6:10 PM, Christopher Clark
      via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Jul 27, 2023 at
            4:22 PM Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Add Xen dt and u-boot
            script support for AMD ZynqMP and Versal devices.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div>Hi Sandeep - this is a slightly&nbsp;surprising submission.
              I'm unsure about meta-virtualization being the right place
              for this as typically hardware enablement is more
              appropriately done in a BSP layer, where engineers who
              have knowledge about and access to specific hardware can
              collaborate on maintaining the machine-specific aspects of
              recipes.</div>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: I checked with Bruce before I submit the patches, Since
    we had xilinx dynamic layer, he has no objection in accepting the
    patches.<br>
    <blockquote type="cite" cite="mid:CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div><br>
            </div>
            <div>Xen in this (non-BSP) layer has support for qemu
              MACHINES, plus generic x86-64 and the Raspberry Pi 4 board
              for Arm platform coverage; the latter is a special-case
              that has been discussed by Xen and Yocto community members
              as a basic commodity reference hardware platform for
              testing (and using) Xen, and the community for this layer
              has more of the interested parties participating in it
              than meta-raspberrypi does.</div>
          </div>
          <div><br>
          </div>
          <div>Are you experiencing difficulties with maintaining your
            Xen recipe components in a separate layer?</div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: No we are not experiencing any difficulties in
    maintaining these files, currently all the dtsi files are in
    meta-petalinux layer and if users are using without meta-petalinux
    distro layer(building xen-image-minimal), then Xen doesn't work on
    ZynqMP and Versal devices. Mark Hatle and myself we discussed on
    this and we saw rpi u-boot script and other files in this layer, we
    thought this is a good place to move these files. Mark can chime in
    here to add any additional comments.<br>
    <blockquote type="cite" cite="mid:CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Christopher</div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            User can enable xen u-boot script by adding below variable
            from<br>
            configuration file as shown below.<br>
            <br>
            BOOTMODE = &quot;xen&quot;<br>
            <br>
            This u-boot script also supports to configure below Xen
            params from<br>
            configuration file.<br>
            <br>
            params&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; variable assignment<br>
            ------&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -------------------<br>
            duart&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;XEN_SERIAL_CONSOLES = &quot;serial0&quot;<br>
            dom0_mem&nbsp; &nbsp; &nbsp; &nbsp; DOM0_MEM = &quot;1500M&quot;<br>
            dom0_max_vcpus&nbsp; DOM0_MAX_VCPUS = &quot;1&quot;<br>
            extra params&nbsp; &nbsp; XEN_CMDLINE_APPEND = &quot;loglvl=all&quot;<br>
            <br>
            Sandeep Gundlupet Raju (2):<br>
            &nbsp; recipes-bsp: Add device-tree files for Xen support<br>
            &nbsp; recipes-bsp: Add u-boot-xlnx scripts for Xen support<br>
            <br>
            &nbsp;.../device-tree/device-tree.bbappend&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 19 +++<br>
            &nbsp;.../files/versal-net-xen-qemu.dtsi&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;2 +<br>
            &nbsp;.../device-tree/files/versal-net-xen.dtsi&nbsp; &nbsp; &nbsp;|&nbsp; 67
            ++++++++++<br>
            &nbsp;.../device-tree/files/versal-xen-qemu.dtsi&nbsp; &nbsp; |&nbsp; &nbsp;2 +<br>
            &nbsp;.../device-tree/files/versal-xen.dtsi&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 59
            +++++++++<br>
            &nbsp;.../device-tree/files/zynqmp-xen-qemu.dtsi&nbsp; &nbsp; |&nbsp; 16 +++<br>
            &nbsp;.../device-tree/files/zynqmp-xen.dtsi&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 123
            ++++++++++++++++++<br>
            &nbsp;.../u-boot/u-boot-xlnx-scr.bbappend&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2 +<br>
            &nbsp;.../u-boot/u-boot-xlnx-scr/boot.cmd.xen&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 80
            ++++++++++++<br>
            &nbsp;.../recipes-bsp/u-boot/xen-boot-cmd.inc&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 38 ++++++<br>
            &nbsp;10 files changed, 408 insertions(+)<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappend<br>
            &nbsp;create mode 100644
dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen-qemu.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-net-xen.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen-qemu.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/versal-xen.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen-qemu.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/device-tree/files/zynqmp-xen.dtsi<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr/boot.cmd.xen<br>
            &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
            <br>
            -- <br>
            2.34.1<br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#8145): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/8145">https://lists.yoctoproject.org/g/meta-virtualization/message/8145</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/100401326/3619217">https://lists.yoctoproject.org/mt/100401326/3619217</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sandeep.gundlupet-raju@amd.com">sandeep.gundlupet-raju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------tPEivbTUpqWKEwie57Lvzd0F--

