Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDEAC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 18:37:21 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.52])
 by mx.groups.io with SMTP id smtpd.web11.69898.1691519840162139281
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 11:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=ozfM+vJS;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.244.52, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw+HpD+cVFbysnlg8NiVFM3mHpsYUMaA61sLxW8dW2Rj6sOAB3cZspoD/n99gqVqjYmrz1D3D/aXxxdTwktJCnZhX9S8vyDhfx3VnrB8PSlMW44s0O+rWmz4haiRzUaEGq+ZUk//BcVajybgvY7EfNTxIZ4Z0EZroZL17+lAXWNjlR1xVKXIpd5hEQBqztp8aJbaw4w+38uIhv+MDqNdOJ65qSsrZ5/IeUQSoYfxPOFcWb34JdbMbbIjG9Xrd4OO7NDH4r6pcG9UJdxZHXprf9Si9hwO+BbPNWZYZbx6EhqlTPqY1jPy4fO3Mp94En9hzmYMpSKzbKtDRHQXRztf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfggTxjAtYVcNdloiu4Jpuok4hVsSInUyn4KYoF7cto=;
 b=ELCpeHvQ2jScU8c5RebOGRQutz79nOLWxSQJ5jxj7gFQHpqOJw33I1FUfsRxuPRQwxZNVojDSOnGgJZwMw4dvtBwtFH0fRB1mX6vuxp1BORXaAZ8VgCXoZftCSpgkDbZCfedWP5svjHFNKBrUQI/HGGHuIcIyxaa0t1HokM2L1sNXgaWHne7UI6yZGyEd9vhyePGQ0spMhtyWg2cB4hD0mi/FX3t3+5Hyl4mBPt069Je4VrGsNkjqlv86I0xPKI0Od/23EnpnSmRJaYqjM+57ACzehLpl4pxock1NPz8ElqJ+5NLB27X4Jr4DKGkG0tTuf4G26/N/myxosjQzeiJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfggTxjAtYVcNdloiu4Jpuok4hVsSInUyn4KYoF7cto=;
 b=ozfM+vJSeSi/4vzVBBfCTiTYxaUN58jXNdN/13hXR7pK4t0KXYYSnywHzc9GewRyUMZleUewsqZD5BA/KtxJ6xqbwfmXkNLxKGWQLN1VBHzkVTu4oBbAt14eTeYH8DYsBLCX1QX5LuZMDI6H32VmgGsadG9esJRJHZYKAYKBBLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 18:37:17 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:37:17 +0000
Message-ID: <4684ae72-ce6c-e370-ba1d-833f29772f16@amd.com>
Date: Tue, 8 Aug 2023 12:37:13 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
 meta-virtualization@lists.yoctoproject.org,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com>
 <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
 <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
 <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
 <CADkTA4OL0j4v=kSCxhFQNmo1ouMcV+yZy86L1ew_SX9arb3mnQ@mail.gmail.com>
 <90adcafb-a036-020b-2d34-d85c06a7d179@amd.com>
 <CADkTA4Myee3=c1yXctAvvgrBLJiT-HQdCpkCGm2wTsuWXJA4tQ@mail.gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4Myee3=c1yXctAvvgrBLJiT-HQdCpkCGm2wTsuWXJA4tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f93c9f1-7dea-426d-dc77-08db983e7dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NJpzyor1g3TpJ1ABZV/qML2GrVUHCWNIkPhibuIjgX1H9ylBeWnXMGnJ8VB40W/VThJ38T2KeQQ3nOHOso00H22qP2PeiX/u/h6u+fEw7nkJJ9ak7oSBORIX6E40/3ugQ4sfgzTMLW+weVbQztMvdiOeVO0pIWc/oigtO8780P+4H+M1+LPELsgl58ebFVUHXGKuPt5GZRvDJD/eBi7tT3LBlOKAB1c7MSxqAKGE8uxwgX8msfI9HASVFvhxhKnJ9wBsu9wyNI4xwIASyGGbA1L04/QhTWqfkJ+xwR5tEfcr+RX1TgKQn85rAoejysljBSVCrgloz6MCvGDmRaQw3Lny0Z40TFEvSLjWJGZCUmxogj/LJ0cYGtOGzYK5/ZNtWDLXXPL0yUmhk4hrwvG7AWFd71MuHSk75vtsZ5b8/BQkwPOjUB3jx/k2bh9F8i3j8iuhLQSDg/QaKuBja+bLt/OvjcSfSeRhhwsjjvOVNptx53/rLi7D1/WCczOVgnqWUVAzwNuKsUafl/hppMl4bOw91QigL27Oqyaklbw7WzyzJ2SU++ATRO8ft5VNHpINjQYvGpUcd2I7+QhSabi6FD7b/9zvl6Ce+AW9AQ9oCFv0Wy5B+BrDTGNdkTEskBTcv6ZBm/CKot3XVoiQHhL/Wg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(1800799003)(186006)(478600001)(6486002)(31686004)(83380400001)(2616005)(66899021)(6512007)(966005)(53546011)(26005)(6506007)(66556008)(6916009)(8676002)(66946007)(41300700001)(31696002)(8936002)(2906002)(30864003)(66476007)(4326008)(6666004)(54906003)(38100700002)(36756003)(316002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jekfwTQgKt7u8A3tZtA3z77FtBlwpL0YKoBWeQoo/JlDwWvhh6GYTQnIkJPn?=
 =?us-ascii?Q?bJRCjqbb3+Naf0l77LXMdo8kmdlF2QoRtZycLtgoeMUSKWwdYeAXUkKHtUQQ?=
 =?us-ascii?Q?k7AqfYT7HDCxW3L8oCM1fyCAjNaFIee3tb8Wek93zNTymoJ0ExDFjRIX0DK8?=
 =?us-ascii?Q?oVZ0pWx9lpz1C/RmefNe1M1cwGTqYnXf6IjbK5HcgM4PwKT1EodJHj2WibSo?=
 =?us-ascii?Q?A4kiW3hrQQ8drgozcgWsjrQPNPgu5TwnSZYDeW4NFJKrGa1xuptQ6G9Kv82C?=
 =?us-ascii?Q?3uWQnxb3nukjOBfJsZgTkUMPUYXQorDncg7Dr00xT2VDVgyP/cw9shuMMSfC?=
 =?us-ascii?Q?6FVD7n8K/faxRr6XzAgvBfWEEueu5YlyvbYQ2R5pyjVKgFR3JzH8625CDqpz?=
 =?us-ascii?Q?wNA3FtWZX53c4aXwbbCbKx+rHY6fUMNgt2O41I0Vw2Bu1g9/m+Bm226/n2nV?=
 =?us-ascii?Q?hGy7TAiqqm/EjqIpEmFTP74cu1jTepAUnIAYTs2GkTAmb83vuXq+sQ+x29hO?=
 =?us-ascii?Q?/mgk0tpMpQrvk0uaYkP0Y01BZlSS78FLA9qomtisciMXpA1/ElyAceAyGRSZ?=
 =?us-ascii?Q?6B+BXpWiVvjVMYnfswpbC2v8fEG3D/cZc5PDnRAhrZWIys3KRaso1NYCUedo?=
 =?us-ascii?Q?K9/ymA5VINd23KVaVDeQcEm5mLJi1rtp3FwvqOVYm+2GNEuiPZZxESLRXdcj?=
 =?us-ascii?Q?5z+dTiMUpPkEFccbySuwRMsBF10iECbxGQTDLlaXCg5DVKzWDLzsWnLkWfBK?=
 =?us-ascii?Q?HkSDLXYF/lcgEfdFzBbX8H6xjZGIyyOpSKzxP7ugYoiwBWZk9OB455tCjdDN?=
 =?us-ascii?Q?tFiUdaL16IwLL033T0tqJzyEyXFF6YHevvUWy0IqMbX8KGkeRJ3RA8U7smBk?=
 =?us-ascii?Q?hRg7an2owjwsMIefK2FFWdDuU++QqDyAKCgJYh1HmAIj/EJeEE5jlW2eGH+K?=
 =?us-ascii?Q?lxokP4EZI+T3qrvujb6Q4yVzKeiNj1VQoceXFkHI7kydQ71S3qFpcgMoqZx3?=
 =?us-ascii?Q?3oafZ42OaGwI5Ty2yIzLtUjBkDBqskQw+K9LRzKP9dfoAmoyuUEFymLpiN65?=
 =?us-ascii?Q?MJtZ06W3/RrLdh1D2pkBIAIlrAkdgoiqEArjeQgsDUP7AcG7uA3ndEJYzJWw?=
 =?us-ascii?Q?iV/Du51GHrfsgKeZ6u9e6Scm+ATQnnMauzIJ/Mo9URxCe+UnJ6CogSW7uaKl?=
 =?us-ascii?Q?/UfrE0QcQt01vy7r+Q/illmSlSsWfA777GnLBa3W2TqyWpSup7CLpE2Xul2m?=
 =?us-ascii?Q?GaGXTLcotXuZ8eRWh2w96+Fy9Sy6u39XGEYOg23DCFcy9oK1eYd2FUtK7Qb7?=
 =?us-ascii?Q?uCRC1iHr/FUbnnG5sg3xuy5ZwoT3dqAzsXReeOlnUqQ98gMgJAoxrK/4LY6h?=
 =?us-ascii?Q?U6HIBQrjA0wGnKMv9hNPRADi4UfxpN2xmAYtAoEP3BqN15+9+/sKwpfdyxiU?=
 =?us-ascii?Q?p55c6W6GrsPQC+0Zm4byeiuKsrOsVQ6uLJpmZOtmyETJrECZU0G5ESPhRca5?=
 =?us-ascii?Q?z8JIukrb4n9HMsHz6OauHf/Q3XQjhVLTXvzSqVVK+CXlgR4bILdT8HNZJQvt?=
 =?us-ascii?Q?vo8H1TbGjfOAf0/woYQyu4yF+O+dq7Kp3ahl6eVb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f93c9f1-7dea-426d-dc77-08db983e7dcc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:37:17.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMoonNgBM8h/eA3/RncDKHSQYmz1p1j3G075+0YRllsLUpYSy1fgvDR56RFiKT0EC1ht8A2fm3tzF7qgl+xOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 18:37:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8172


On 8/8/2023 12:01 PM, Bruce Ashfield wrote:
> On Tue, Aug 8, 2023 at 1:48=E2=80=AFPM Gundlupet Raju, Sandeep
> <sandeep.gundlupet-raju@amd.com> wrote:
>> Hi Bruce, Chris,
>>
>> Thanks for considering this.
>>
>> On 8/1/2023 12:33 PM, Bruce Ashfield wrote:
>>> On Mon, Jul 31, 2023 at 2:20=E2=80=AFPM Christopher Clark
>>> <christopher.w.clark@gmail.com> wrote:
>>>>
>>>> On Fri, Jul 28, 2023 at 5:52=E2=80=AFAM Bruce Ashfield <bruce.ashfield=
@gmail.com> wrote:
>>>>> I'm travelling today, so I can't formulate a full answer at the momen=
t.
>>>>>
>>>>> I just wanted to let everyone know that I have been reading and do
>>>>> have an opinion which I'll send out when I get a chance to properly
>>>>> write an email.
>>>>>
>>>>> I hadn't seen the patches in great detail before this send, so I need
>>>>> to go through things and have a closer look.
>>>>>
>>>>> Generally speaking, I support having related recipes in a layer, as a
>>>>> full reference stack.  Perhaps there's a subset of things that are to=
o
>>>>> hardware/board specific, but again, I haven't looked in detail yet.
>>>>> Layer "expansion" is also an issue for maintenance in the overall
>>>>> ecosystem. Having too many layers is an issue for maintenance, along
>>>>> with having too few layers that don't have a clean split between
>>>>> distro/machine and functionality.
>>>>>
>>>>>
>>>>> Even if some of this does land in a non-xilinx specific layer (that
>>>>> isn't meta-virt), we'd be well served to have a README or other file
>>>>> in meta-virt that explains how to build for hardware platforms. Havin=
g
>>>>> only qemu available in meta-virt, and then having integrators wander
>>>>> off into the wild world of non peer reviewed vendor layers and forks
>>>>> of various components is something that I've been concerned about for
>>>>> quite some time.
>>>> Thanks for replying -- the challenges of dealing with layer proliferat=
ion are real, which is part of what motivated the introduction of the dynam=
ic layer for the Raspberry Pi board in support of enabling simpler testing,=
 and I hadn't given that enough consideration in my response earlier. Witho=
ut a reference document or direct example, it's not easy - it takes practic=
al experience and persistence with it at the moment, so thanks for doing th=
at work, Sandeep, and I apologise. The dynamic layers are good for enabling=
 compatibility with composition and these changes are in support of a posit=
ive experience with enabling Xen platforms, so please continue.
>>>>
>>> I'm finally back at a keyboard after 20+ hours of driving in the past 4=
 days.
>>>
>>> I won't dig in much more to the patches, but I wanted to be clear that
>>> I wasn't criticizing your comment in the slightest. We need that sort
>>> of review.
>>>
>>> If we do find something that is inappropriate that I miss in the
>>> patches, please flag it and I'll remove it and ask for it to go to a
>>> BSP layer.
>> [Sandeep]: Bruce any updates on patch review? Mark Hatle had a minor one
>> on commit message. I was thinking to send a v2 patch once Bruce has
>> finished his review.
> I didn't see anything that was a red-flag to remove, so I've merged it
> as-is to master.
>
> If anything causes issues, we'll revisit and do incremental updates.
Thanks Bruce!
>
> Bruce
>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>> best,
>>>>
>>>> Christopher
>>>>
>>>>> That all being said, don't take any of the above as more than my
>>>>> initial thoughts. I'm extremely pleased to see Christophers review an=
d
>>>>> questions .. that's exactly what we need!
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>>
>>>>> On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
>>>>> <christopher.w.clark@gmail.com> wrote:
>>>>>> +CC Bertrand
>>>>>>
>>>>>> On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via l=
ists.yoctoproject.org <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.=
org> wrote:
>>>>>>> Hi Chris,
>>>>>>>
>>>>>>> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org =
wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <san=
deep.gundlupet-raju@amd.com> wrote:
>>>>>>>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal dev=
ices.
>>>>>>> Hi Sandeep - this is a slightly surprising submission. I'm unsure a=
bout meta-virtualization being the right place for this as typically hardwa=
re enablement is more appropriately done in a BSP layer, where engineers wh=
o have knowledge about and access to specific hardware can collaborate on m=
aintaining the machine-specific aspects of recipes.
>>>>>>>
>>>>>>> [Sandeep]: I checked with Bruce before I submit the patches, Since =
we had xilinx dynamic layer, he has no objection in accepting the patches.
>>>>>> That is generous, but I think you could make the layer maintenance r=
esponsibilities easier and help with establishing good practice for hardwar=
e support if these changes can go into a BSP layer instead, if that is an o=
ption? I do appreciate that you are working on enabling Xen to work on addi=
tional platforms.
>>>>>>
>>>>>> The Xilinx dynamic layer could be removed from meta-virtualization b=
y adding its Xen image creation logic to the primary Xen hypervisor recipe =
-- possibly with a new mkimage task? --  to be enabled via new settings in =
an Arm or Xilinx MACHINE configuration.
>>>>>>
>>>>>>> Xen in this (non-BSP) layer has support for qemu MACHINES, plus gen=
eric x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the lat=
ter is a special-case that has been discussed by Xen and Yocto community me=
mbers as a basic commodity reference hardware platform for testing (and usi=
ng) Xen, and the community for this layer has more of the interested partie=
s participating in it than meta-raspberrypi does.
>>>>>>>
>>>>>>> Are you experiencing difficulties with maintaining your Xen recipe =
components in a separate layer?
>>>>>>>
>>>>>>> [Sandeep]: No we are not experiencing any difficulties in maintaini=
ng these files, currently all the dtsi files are in meta-petalinux layer an=
d if users are using without meta-petalinux distro layer(building xen-image=
-minimal), then Xen doesn't work on ZynqMP and Versal devices.
>>>>>> Do you know which layer defines the MACHINE configurations for those=
 hardware devices? It seems like that could be a suitable BSP layer for the=
se changes?
>>>>>>
>>>>>>> Mark Hatle and myself we discussed on this and we saw rpi u-boot sc=
ript and other files in this layer, we thought this is a good place to move=
 these files.
>>>>>> I see how the raspberry pi dynamic layer can give that impression wh=
ich is unfortunate. The motivation for the inclusion of the rpi files in me=
ta-virtualization is to enable collaboration on hardware testing (and repro=
duction and diagnosis if needed) of the Arm architecture functionality of t=
he primary Xen recipes, on a low-cost commodity hardware board, with agreem=
ent on this from Xen stakeholders at multiple different organizations. X86 =
doesn't need it as generic x86-64 support (see meta-yocto-bsp) is enough.
>>>>>>
>>>>>> Christopher
>>>>>>
>>>>>>
>>>>>>> Mark can chime in here to add any additional comments.
>>>>>>>
>>>>>>>
>>>>>>> Christopher
>>>>>>>
>>>>>>>> User can enable xen u-boot script by adding below variable from
>>>>>>>> configuration file as shown below.
>>>>>>>>
>>>>>>>> BOOTMODE =3D "xen"
>>>>>>>>
>>>>>>>> This u-boot script also supports to configure below Xen params fro=
m
>>>>>>>> configuration file.
>>>>>>>>
>>>>>>>> params          variable assignment
>>>>>>>> ------          -------------------
>>>>>>>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
>>>>>>>> dom0_mem        DOM0_MEM =3D "1500M"
>>>>>>>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
>>>>>>>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>>>>>>>>
>>>>>>>> Sandeep Gundlupet Raju (2):
>>>>>>>>     recipes-bsp: Add device-tree files for Xen support
>>>>>>>>     recipes-bsp: Add u-boot-xlnx scripts for Xen support
>>>>>>>>
>>>>>>>>    .../device-tree/device-tree.bbappend          |  19 +++
>>>>>>>>    .../files/versal-net-xen-qemu.dtsi            |   2 +
>>>>>>>>    .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>>>>>>>>    .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>>>>>>>>    .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>>>>>>>>    .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>>>>>>>>    .../device-tree/files/zynqmp-xen.dtsi         | 123 +++++++++++=
+++++++
>>>>>>>>    .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>>>>>>>>    .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 +++++++++++=
+
>>>>>>>>    .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>>>>>>>>    10 files changed, 408 insertions(+)
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/device-tree.bbappend
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/versal-net-xen-qemu.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/versal-net-xen.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/versal-xen-qemu.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/versal-xen.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/zynqmp-xen-qemu.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tre=
e/files/zynqmp-xen.dtsi
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-b=
oot-xlnx-scr.bbappend
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-b=
oot-xlnx-scr/boot.cmd.xen
>>>>>>>>    create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen=
-boot-cmd.inc
>>>>>>>>
>>>>>>>> --
>>>>>>>> 2.34.1
>>>>>>>>
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>> Links: You receive all messages sent to this group.
>>>>>>> View/Reply Online (#8146): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/8146
>>>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/361903=
7
>>>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [christopher.w.clark@gmail.com]
>>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>
>

