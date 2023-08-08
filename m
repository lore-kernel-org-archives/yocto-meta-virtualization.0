Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA9EC04E69
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:48:41 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.85])
 by mx.groups.io with SMTP id smtpd.web11.68519.1691516920678138311
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=XiUSAhIH;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.101.85, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k43HsO+uT6A7CyMSQvVBTOdk6hgUOR9lJrNWxbZPN8Xs3CwYYxQ37RO4sgks1cvw0dTCrpQFR01iKzz1XQoPQdghqo1tTvZn6Oop4fGrChbotT7GOeoHL5yN6n+dzijsNjBXWvN5FGCwzZWQ6kJ2td0iBaTQyIsE+Gfm9d+6WZtmor68k4+98/Hd1tsXogWVdzGZpkq97IHWADW/O0rgOGLtIqKAxMC/OkQV3oN7rWNpsMsQB/V92+a8mk0l79S3L+Q7QeQNYF78tqzQkkzPU0d2uM/qQeVSF6PZUxqo+hmaWRTMGmzQrcZ2N0yhGj+vwAIBFXytrB0atfLnNU5Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmUmWUx5GI3q2WHRYQsTSPtL33eGq3H0lKo0jqWwYqQ=;
 b=TuYKPAQwCf7CxPq5Ax3walnLm3rqXrvqReNCj8sCyqLma2CHs/A2QEIQNXVt5HTwC98I3fGbyCvtWshmtXTRl6iK+o/drx5pOGNxo86pfrTbNjStx6SSmOgKu7IGSMuIrHv5vgAHMpPCNBXUA4+uV488eZGKbp6+wp/k6Srv4YNUx2zz6GSO2gR+8bddTYpFpBV799CZhr5M6CHhisSIBS/MCLg7iXPDnxmfkdU8buPQei3sXfXRfR7+nihqBd9xsUwe49HEXHH4oal7rMCeODD1Ac/uij/Khfq8C0BW3HCaRiH0R319+b9xKm2lURmubNlvJbVv1UANRK7C2HGIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmUmWUx5GI3q2WHRYQsTSPtL33eGq3H0lKo0jqWwYqQ=;
 b=XiUSAhIHs4b5YK5ZwcHbjDU4wqDq4z1C/mpOvgv+gkfV0XlyYFOHlotdbzoLUKkFgkap7xkDJ5AHgWiUcOMymL8K10Tm/iyIyxL6FNP0ieT1rFz9YV8KL7ouPZjGl4SRk9ljnhYsmS7gjpa0YBnibWx2qvmC5p84BiSPk7z7NLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 17:48:38 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::6bfd:c007:9174:ff54%5]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 17:48:37 +0000
Message-ID: <90adcafb-a036-020b-2d34-d85c06a7d179@amd.com>
Date: Tue, 8 Aug 2023 11:48:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [meta-virtualization][master][PATCH 0/2] Add Xen dt and u-boot
 script support
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
CC: meta-virtualization@lists.yoctoproject.org,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230727232229.3784426-1-sandeep.gundlupet-raju@amd.com>
 <CACMJ4Gam5O7t9u2tkn7ydFZ7bc+FQCpDqJFtVYsxtsMtCB2BqQ@mail.gmail.com>
 <1d1582d5-3dcf-9813-6e6d-924b0db23346@amd.com>
 <CACMJ4GY04=7hdpp7u5c2KGHavoa2iMmc2kQ-5xL=4XgH+6bJgA@mail.gmail.com>
 <CADkTA4OnuTXVhKz9OVUieK8K3kNJHj84sFwAUG-XpPgiEEdHiw@mail.gmail.com>
 <CACMJ4Gb0epaez9_XHWjGOnxrRUGvxUZn4PwzR+zprR3Wrxsv4Q@mail.gmail.com>
 <CADkTA4OL0j4v=kSCxhFQNmo1ouMcV+yZy86L1ew_SX9arb3mnQ@mail.gmail.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4OL0j4v=kSCxhFQNmo1ouMcV+yZy86L1ew_SX9arb3mnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::37) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebdd80e-71fd-4f33-69c8-08db9837b1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qG777P5a69Ih1c3y8WOXqXFuMiEFryULfcMRIT8aUVWzfKtw8ahvFZjfnW8s2XIkFA1IxvLE7klm2z+apGcws6MQATNDkZaW/EPXPl1WizGeqinrMeZ27w6zjxPlTArVQhT8rZQMPatp3+S2WfXSpLBOG3A1X9sElQ0px30ruV3PVe2rUgudz/uuBWrD0KUUEOn+Z9HJiK7A3R9iEW6L1IfXFkZnBjQPXfnm12Y7Piag8hv4YDdoSO8P611NjoYrN+RQwXRxM5207POjlp6Biz4mrAKpcWOs2c65Zmy2Xdp08+Megzd7EbkiEgqX7Ec6867P8SQYc38gMkrqi7iBLepoSnUCp9Ho9vEa02Rq9Yaa5o2VVIsSoHerPEzd1SZlbFMHZtv31gYFx8YBxvIZs2jlzIFSwxbGI2wLhMQtcAureUzaGZqjoWdnJfC4blJCapYOYJc8+jb/+8GTLtB/zFfOM9yALNnFGS8RLTEnrQm035BZjtcDJMKal7CaYizlkfMqFdQ0mRSxD8pgJj9KJi//Aep6hMjZ93cUw1ehu60Xp1QsWMEIaa8IA7Vo4wMA2U+70oY8aYtu7Fqn1cFJCMVAD4nDCJh7UY4QQvP2FmK36FpKSwj2D2DMRiZYXLKm0kO7LwOgPW2w0i0El9uiAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(31686004)(5660300002)(83380400001)(8676002)(66899021)(8936002)(2616005)(38100700002)(316002)(31696002)(53546011)(6506007)(6486002)(110136005)(54906003)(478600001)(66476007)(66556008)(6666004)(86362001)(66946007)(6512007)(4326008)(966005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fWpuZZpJjlaMlxTXIolg2Rxmzx28BuirEA7F3hVhoLjQjdcjKNThyO0dxoNu?=
 =?us-ascii?Q?Xr/t1TXHOZx4Lx6k9330MFpIs/gWP621hA5w0N35jcGGXHMctMLwgaTlm4h/?=
 =?us-ascii?Q?kTda8tkV7zAsOiLEvg4ZnYJb+/V4KrCUITqB9FESeyCPiEthuGX/ahmIdSoI?=
 =?us-ascii?Q?4DaVCjg88RNFG/nVvJm5PyALI1AAgFaAC7mm2hMzE2dkBVB5EyQz7EXoMQUZ?=
 =?us-ascii?Q?r6L3wSUBNfuzIMrzsux+cxZUOTBlHuOBuLS+gUzUEnv5VeylIXPlJs5ciaiG?=
 =?us-ascii?Q?/aDAJFwGqS5imekYIIbxIz+/WS5DX+qxZ6eejBLJhZxk4ee6289kiW9j2Fic?=
 =?us-ascii?Q?s1PYqfLzVe4bZLug+lS+YZsiSaBMvFulVVz0OA8gnuB5oOn8HGDivxmjBiqC?=
 =?us-ascii?Q?h3EH4npvJ4UMhuSq/ykP40n3FcQbk7IByEc9xC2Xvj54LgfYLfvc7rXEQ+Fi?=
 =?us-ascii?Q?oAzHmvXPElk5BjvujC9Gs8R18H6uAD7/v+knh8s7u0jOSwGnKr1DCWyDfqUg?=
 =?us-ascii?Q?SgABbtOe+VInHrgLMKYYwR4DXCiCBNKaLso8z1P6m+ybbhWCfyzlX0EWy0ys?=
 =?us-ascii?Q?pxZQ9L1YFco/YSUNKVkpkbojqrFVPUf8WvS0Cca5gwfYMKuJhWcEV6pKwjEL?=
 =?us-ascii?Q?/Y5mvzjTpVhAEfcQNwO396rVNChzP6K0d7ThJsjpT6WlHeZypwTrD2+ls8bm?=
 =?us-ascii?Q?imbUeg2sm0xu+y/Ce9UsAuFoBY+RUqT6EcerXitTSkvUnTMv0lghsPVzcrZM?=
 =?us-ascii?Q?6h+kEC1a3X4VHb2wG9z5NoMvVQ9U7bhqJI8+kY3t5cRc4zebaIKwUwljTN9q?=
 =?us-ascii?Q?CTGpuER9BKzrNrM6mzEYxPIKdwwHYd43IeVTbm8lUaKB+0k6vwfWqT2dZ0UR?=
 =?us-ascii?Q?mtOHHRL8jpZT1kWJqLdQTnHoiXq7nkdl4LU34O5u5N7kBGdECZStmlyOgMUO?=
 =?us-ascii?Q?2rMieRQDT8pJMt0NJJYdKMx28IaWFjzbZMVjxN5LOQEKhWTSYp6d7dc9aMqi?=
 =?us-ascii?Q?qixRdGFbxRtpqFYwzHqua8jlAwiSzDs6XJhtddOjFKBJkQb5Ok9nc6fQdm3A?=
 =?us-ascii?Q?HozYgn+y4gs0bnGjRaxSsqh9ovXobN4XQpQjKUXDEtJJ9wk1Kb3W3AF87o3F?=
 =?us-ascii?Q?Kb3SEoWOcpEytQXsa6y9cCjRB9N8ioyM2IytBxTUppocrI0hBnSzJVrAIuRU?=
 =?us-ascii?Q?66SvIfHVU+z5kPGoDJdA2vph9aSGD1fEiw/DeXgezz9ARmgbxOs3l4jFDb75?=
 =?us-ascii?Q?JJMZTM3irTOfILOQsGOFMzsuoNTeKut8zkPdS9jWRED4wQwqrbRsDSPElx2f?=
 =?us-ascii?Q?jIgHuW3OBqu83QKoblj6tIBcghC6E8I5dKqvL73LpnfsVfkQg0YFeVhRWQ4c?=
 =?us-ascii?Q?IzvYilLmUGm81woE2EWSFgI78Q7nwTjiwm1kgcxiguf4waBT3stRhVy5VVwi?=
 =?us-ascii?Q?5SkSFdMQH7SAusSeM92jFx+c5Lh7iAPmM/HaCC32rW4u9NU22Ev97uOGrncN?=
 =?us-ascii?Q?GNsgRs6M2aPxEYNb0GtxXs3/ZjvoSbAXKVcjGDU7F3KpGV64JbdDYS87EQRL?=
 =?us-ascii?Q?XMrLddANcDeP8HmPPGpuNSzfRvSqsq4YlTsw76QY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebdd80e-71fd-4f33-69c8-08db9837b1b1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 17:48:37.8723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qy/iyC3MhvuWYIhDm0fWvSZhlon2r1hveClthNJU/V5E9uSU8G6pAm7VZSsq4Oy+WHPyNW51/XIzn3SFdR5oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8170

Hi Bruce, Chris,

Thanks for considering this.

On 8/1/2023 12:33 PM, Bruce Ashfield wrote:
> On Mon, Jul 31, 2023 at 2:20=E2=80=AFPM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>>
>> On Fri, Jul 28, 2023 at 5:52=E2=80=AFAM Bruce Ashfield <bruce.ashfield@g=
mail.com> wrote:
>>> I'm travelling today, so I can't formulate a full answer at the moment.
>>>
>>> I just wanted to let everyone know that I have been reading and do
>>> have an opinion which I'll send out when I get a chance to properly
>>> write an email.
>>>
>>> I hadn't seen the patches in great detail before this send, so I need
>>> to go through things and have a closer look.
>>>
>>> Generally speaking, I support having related recipes in a layer, as a
>>> full reference stack.  Perhaps there's a subset of things that are too
>>> hardware/board specific, but again, I haven't looked in detail yet.
>>> Layer "expansion" is also an issue for maintenance in the overall
>>> ecosystem. Having too many layers is an issue for maintenance, along
>>> with having too few layers that don't have a clean split between
>>> distro/machine and functionality.
>>>
>>>
>>> Even if some of this does land in a non-xilinx specific layer (that
>>> isn't meta-virt), we'd be well served to have a README or other file
>>> in meta-virt that explains how to build for hardware platforms. Having
>>> only qemu available in meta-virt, and then having integrators wander
>>> off into the wild world of non peer reviewed vendor layers and forks
>>> of various components is something that I've been concerned about for
>>> quite some time.
>>
>> Thanks for replying -- the challenges of dealing with layer proliferatio=
n are real, which is part of what motivated the introduction of the dynamic=
 layer for the Raspberry Pi board in support of enabling simpler testing, a=
nd I hadn't given that enough consideration in my response earlier. Without=
 a reference document or direct example, it's not easy - it takes practical=
 experience and persistence with it at the moment, so thanks for doing that=
 work, Sandeep, and I apologise. The dynamic layers are good for enabling c=
ompatibility with composition and these changes are in support of a positiv=
e experience with enabling Xen platforms, so please continue.
>>
> I'm finally back at a keyboard after 20+ hours of driving in the past 4 d=
ays.
>
> I won't dig in much more to the patches, but I wanted to be clear that
> I wasn't criticizing your comment in the slightest. We need that sort
> of review.
>
> If we do find something that is inappropriate that I miss in the
> patches, please flag it and I'll remove it and ask for it to go to a
> BSP layer.
[Sandeep]: Bruce any updates on patch review? Mark Hatle had a minor one=20
on commit message. I was thinking to send a v2 patch once Bruce has=20
finished his review.
> Cheers,
>
> Bruce
>
>> best,
>>
>> Christopher
>>
>>>
>>> That all being said, don't take any of the above as more than my
>>> initial thoughts. I'm extremely pleased to see Christophers review and
>>> questions .. that's exactly what we need!
>>>
>>> Bruce
>>>
>>>
>>>
>>> On Fri, Jul 28, 2023 at 2:06=E2=80=AFAM Christopher Clark
>>> <christopher.w.clark@gmail.com> wrote:
>>>> +CC Bertrand
>>>>
>>>> On Thu, Jul 27, 2023 at 5:38=E2=80=AFPM Sandeep Gundlupet Raju via lis=
ts.yoctoproject.org <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.or=
g> wrote:
>>>>> Hi Chris,
>>>>>
>>>>> On 7/27/2023 6:10 PM, Christopher Clark via lists.yoctoproject.org wr=
ote:
>>>>>
>>>>>
>>>>> On Thu, Jul 27, 2023 at 4:22=E2=80=AFPM Sandeep Gundlupet Raju <sande=
ep.gundlupet-raju@amd.com> wrote:
>>>>>> Add Xen dt and u-boot script support for AMD ZynqMP and Versal devic=
es.
>>>>>
>>>>> Hi Sandeep - this is a slightly surprising submission. I'm unsure abo=
ut meta-virtualization being the right place for this as typically hardware=
 enablement is more appropriately done in a BSP layer, where engineers who =
have knowledge about and access to specific hardware can collaborate on mai=
ntaining the machine-specific aspects of recipes.
>>>>>
>>>>> [Sandeep]: I checked with Bruce before I submit the patches, Since we=
 had xilinx dynamic layer, he has no objection in accepting the patches.
>>>>
>>>> That is generous, but I think you could make the layer maintenance res=
ponsibilities easier and help with establishing good practice for hardware =
support if these changes can go into a BSP layer instead, if that is an opt=
ion? I do appreciate that you are working on enabling Xen to work on additi=
onal platforms.
>>>>
>>>> The Xilinx dynamic layer could be removed from meta-virtualization by =
adding its Xen image creation logic to the primary Xen hypervisor recipe --=
 possibly with a new mkimage task? --  to be enabled via new settings in an=
 Arm or Xilinx MACHINE configuration.
>>>>
>>>>> Xen in this (non-BSP) layer has support for qemu MACHINES, plus gener=
ic x86-64 and the Raspberry Pi 4 board for Arm platform coverage; the latte=
r is a special-case that has been discussed by Xen and Yocto community memb=
ers as a basic commodity reference hardware platform for testing (and using=
) Xen, and the community for this layer has more of the interested parties =
participating in it than meta-raspberrypi does.
>>>>>
>>>>> Are you experiencing difficulties with maintaining your Xen recipe co=
mponents in a separate layer?
>>>>>
>>>>> [Sandeep]: No we are not experiencing any difficulties in maintaining=
 these files, currently all the dtsi files are in meta-petalinux layer and =
if users are using without meta-petalinux distro layer(building xen-image-m=
inimal), then Xen doesn't work on ZynqMP and Versal devices.
>>>>
>>>> Do you know which layer defines the MACHINE configurations for those h=
ardware devices? It seems like that could be a suitable BSP layer for these=
 changes?
>>>>
>>>>> Mark Hatle and myself we discussed on this and we saw rpi u-boot scri=
pt and other files in this layer, we thought this is a good place to move t=
hese files.
>>>>
>>>> I see how the raspberry pi dynamic layer can give that impression whic=
h is unfortunate. The motivation for the inclusion of the rpi files in meta=
-virtualization is to enable collaboration on hardware testing (and reprodu=
ction and diagnosis if needed) of the Arm architecture functionality of the=
 primary Xen recipes, on a low-cost commodity hardware board, with agreemen=
t on this from Xen stakeholders at multiple different organizations. X86 do=
esn't need it as generic x86-64 support (see meta-yocto-bsp) is enough.
>>>>
>>>> Christopher
>>>>
>>>>
>>>>> Mark can chime in here to add any additional comments.
>>>>>
>>>>>
>>>>> Christopher
>>>>>
>>>>>>
>>>>>> User can enable xen u-boot script by adding below variable from
>>>>>> configuration file as shown below.
>>>>>>
>>>>>> BOOTMODE =3D "xen"
>>>>>>
>>>>>> This u-boot script also supports to configure below Xen params from
>>>>>> configuration file.
>>>>>>
>>>>>> params          variable assignment
>>>>>> ------          -------------------
>>>>>> duart           XEN_SERIAL_CONSOLES =3D "serial0"
>>>>>> dom0_mem        DOM0_MEM =3D "1500M"
>>>>>> dom0_max_vcpus  DOM0_MAX_VCPUS =3D "1"
>>>>>> extra params    XEN_CMDLINE_APPEND =3D "loglvl=3Dall"
>>>>>>
>>>>>> Sandeep Gundlupet Raju (2):
>>>>>>    recipes-bsp: Add device-tree files for Xen support
>>>>>>    recipes-bsp: Add u-boot-xlnx scripts for Xen support
>>>>>>
>>>>>>   .../device-tree/device-tree.bbappend          |  19 +++
>>>>>>   .../files/versal-net-xen-qemu.dtsi            |   2 +
>>>>>>   .../device-tree/files/versal-net-xen.dtsi     |  67 ++++++++++
>>>>>>   .../device-tree/files/versal-xen-qemu.dtsi    |   2 +
>>>>>>   .../device-tree/files/versal-xen.dtsi         |  59 +++++++++
>>>>>>   .../device-tree/files/zynqmp-xen-qemu.dtsi    |  16 +++
>>>>>>   .../device-tree/files/zynqmp-xen.dtsi         | 123 ++++++++++++++=
++++
>>>>>>   .../u-boot/u-boot-xlnx-scr.bbappend           |   2 +
>>>>>>   .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  80 ++++++++++++
>>>>>>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       |  38 ++++++
>>>>>>   10 files changed, 408 insertions(+)
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/d=
evice-tree.bbappend
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/versal-net-xen-qemu.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/versal-net-xen.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/versal-xen-qemu.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/versal-xen.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/zynqmp-xen-qemu.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/device-tree/f=
iles/zynqmp-xen.dtsi
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot=
-xlnx-scr.bbappend
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot=
-xlnx-scr/boot.cmd.xen
>>>>>>   create mode 100644 dynamic-layers/xilinx/recipes-bsp/u-boot/xen-bo=
ot-cmd.inc
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#8146): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/8146
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/100401326/3619037
>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [christopher.w.clark@gmail.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>

