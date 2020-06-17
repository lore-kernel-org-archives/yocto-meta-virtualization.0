Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web12.3053.1592382584388296294
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 01:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MkkEyqNv;
 spf=pass (domain: arm.com, ip: 40.107.22.57, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s51xOI+yYb0hLAekcbhc/01TBYjYz7BSinYRzwniOEA=;
 b=MkkEyqNvnvcZBU4Qn/4Qa2Qn+6LWYl4MuNpNNiguPBvWufUKkiFDy3JTI77C2yCtrtPhXtLvZifgfE4nD1JqT2UybaVOLldX+FBB/4A3/HF/kF6FAutkNYo+xPHtib35o3uOCgMzp2v4v4IayKg2wd/41hphPRviAPmF2AzSyKM=
Received: from AM5PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:69::29) by DB8PR08MB5308.eurprd08.prod.outlook.com
 (2603:10a6:10:f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 08:29:41 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::23) by AM5PR0202CA0019.outlook.office365.com
 (2603:10a6:203:69::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 08:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 08:29:41 +0000
Received: ("Tessian outbound 866352848bb9:v59"); Wed, 17 Jun 2020 08:29:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53d580a02807f9a9
X-CR-MTA-TID: 64aa7808
Received: from c26fe85df1df.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81A88B81-0EEF-41D8-A860-078657356D83.1;
	Wed, 17 Jun 2020 08:29:35 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c26fe85df1df.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 08:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjSMaDYyvWR/WQVz/O1Wksfkt98bGS02tIbd1PFyrF7DKJD50WUo6erNklqLywNvKgnNJoP8HIEFXS08s2sLiBsP2dbZfkCIQf+x9g8OWXM0V3lTjRALMtIFy1Bj2YPOxu4kTqCIeSXvuWergTdioqr9SE38gtlNY+UFLMHArRH6tBqMCSW7nyNU1Bhvgv7UNXBLLZ7WK14416O4ALZjNfpvpTk+3tRqF0DTqhLHd99sITzj5clvhUpx78KfZo3js99EYTtm9u/bqU+HY0EqxJf+4NDy/UqVAWAWVQMp22GyCJtlyPGJLjm7/nYe+j3N8k9FqZGZW44ykqxHDgsZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s51xOI+yYb0hLAekcbhc/01TBYjYz7BSinYRzwniOEA=;
 b=mTwI+JWWHoSMre+f4/72aSS2GpvolyUNmUUX7TfYePnigGH+8zBwf+Y6SLZdqbde+IilYdEjEnxm932q0IxI6qFacqxZA7CgN0amdPSQoQalb0eqOhmZtV5VlLmxaR1VbFd5DPvRKQOOpPOhLyr9Utf2Ll8glW0pwGvTrBzad+30ott9NpmjzDaJyuAK+9uCT9fetKK6SscvQVK2kVnW+XKXR9VtxK7E16BzXCGawUoeEeTC2EPGlm2Wgt9SBodn2xtu6RkejmddKjKnPqNvV7lVcgAPeEyLV0qbGEBmq2CDm68/HYyEK6BpOZqX8XnhmPMC8zpYZN4bDOmrO0Pa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s51xOI+yYb0hLAekcbhc/01TBYjYz7BSinYRzwniOEA=;
 b=MkkEyqNvnvcZBU4Qn/4Qa2Qn+6LWYl4MuNpNNiguPBvWufUKkiFDy3JTI77C2yCtrtPhXtLvZifgfE4nD1JqT2UybaVOLldX+FBB/4A3/HF/kF6FAutkNYo+xPHtib35o3uOCgMzp2v4v4IayKg2wd/41hphPRviAPmF2AzSyKM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3001.eurprd08.prod.outlook.com (2603:10a6:5:23::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 08:29:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 08:29:34 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, Corey Minyard
	<cminyard@mvista.com>, Siddhartha V <Siddhuvgowda.18695@gmail.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
Thread-Topic: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve
 the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs.
 and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootf")
Thread-Index: AdY7cueh7BKux6jPTM6klc5Hy0Q9gwAIcLkKAdgWTGwAB3dcAABFDr0AABaUT4A=
Date: Wed, 17 Jun 2020 08:29:33 +0000
Message-ID: <B7EF9851-B689-45A1-BCA1-167786E43A85@arm.com>
References: 
 <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
 <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
 <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3377f79e-9f53-4faa-6fb5-08d8129894d9
x-ms-traffictypediagnostic: DB7PR08MB3001:|DB8PR08MB5308:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB53083442F00BDA31890E84409D9A0@DB8PR08MB5308.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 se7FUBYRjAee4QuYnEPeB3gOzbrGxFCN1zpXmXwhJI6O/iBg+u7mdQrduDGReDXz19GUjSV+Idq50pudFQNnaRLB7S4ar0ArpMr6lUvlf5NmOXnMm7T/5dD9ui5KZAFYVg3ZDwVdimTqOg1aQ8894QfClwDLJ2IIvrPwqC/XI/V5qBZvO9WWxspZZkrn1sKjZ6WwN4g1MlvYD2cLWB3pwY4oRY6xv5nF+jczfrimRzS1jKcWDIseuZg45PPr/vIBUM5J2DFiMH8JPv2MHge6qbjJ8WQ9AenMazpenjR/xtRm7zo6AEVxU+Ji7lMJd5igpNjvfHraqJCBZaoiXpDKzz2iSrMY7GCkBqdWZCzvvLKCc3ha3OtJ5jHBQ0ZcJ5KLlvAIby4Ly2BUQYHBW3C1kqm+M1TJUxFWXLSCrSCSvzUKhF4Q7l5yceebM8tdRPbkIL9WAY0Z/IAkHUuWAtbpRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(966005)(2906002)(83380400001)(478600001)(71200400001)(6512007)(6486002)(8676002)(53546011)(6506007)(186003)(8936002)(54906003)(26005)(316002)(4326008)(33656002)(2616005)(86362001)(66556008)(64756008)(66476007)(76116006)(66446008)(66946007)(5660300002)(91956017)(6916009)(36756003)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 a2kCgf64hrWSlvEASuwWt9tk5n3BSumKNioANsIiHIDrb9Amu/pmyGEmEMw/FSflivxdzRGu1PkCWkPem6Y2GYkhGFITRZTU0I7R5cVwsvcjhBkAGP86Wce+qJ7nHWi/4tPoEBnAbO4cTq7gQQnd1jrdgGlIbE4IojgGBYrqAYqHWuQY1JfgY46cV90zveId44Xt6Aq3vC9bJn18m+vBrzBFQvYbsgKUF4JcDShXwaDYfaE5DTyx6DkJkiRYqpsVoVTjFctLaEUayNn8J0WJEYVm/y9u+IraB3wjjsF57eKcjy3iS8syBao7a2IastYlCZbC5NrWYbT/4DvmIxbVexckTrO51cuqh/jukpwUlE2QWJe3F66NT4XnHFJDyRL3GmTWJsEjMPO59rIxZRk/s5uz6xPTAuD7ODDGNihD6xxXG1wHR9eXYZysMBOYrCMPM5YjNvRgKp5YVZuzUrQuKlxMot02il7a61aeRjF0wvZtN6f3x3c3vmIyfa4N0yZC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3001
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(83380400001)(336012)(4326008)(70206006)(70586007)(2616005)(966005)(81166007)(5660300002)(6862004)(47076004)(86362001)(6506007)(26005)(53546011)(33656002)(82740400003)(36906005)(8936002)(54906003)(316002)(356005)(478600001)(8676002)(6486002)(82310400002)(6512007)(2906002)(186003)(36756003)(219693003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4c6c5ae2-b4c5-43ee-167f-08d812989071
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4qWT1bPNcrR3jbNtxIEkLfzhvVNkhH8Q61i31C62P94VgPBRWL26Bb80KETQMqWwdppKUs9AxDa/6klolxXRqrl3c4cktKaaBV+jxizsmxT6bDD3tJyO5Sf9jYQw7jL418tEvRqpaY9cnLHTWl6D1ZynLh9PwYnngqfJvK/4whXJMLrSFQCNjfXxod9QogLdKAC+M3CfeHklGIbcIIB5ApfTJMw4XB39obWJP7QJQFZ35oK6QeHpGmKPjzLxrlXSl0X25koNo34agh5jyiePyyKr2I4VHZypRmfoLoKUuV+iqwq9cSkYXP2/pxeuJuo0SSQXCX8jc1rm65NibpFmpp9UDmsMBoMKZDxzTF1+Ll+d1bqSMEpvj+QrFl6Fpb2jEuZ5pVK2n7t24V61Dd9TZmFuvhoDFSd39LHhixn/viHChgsMjG8C+4TA45whH56WuPOTLiprlEzLyEkaNVkik2xhXLkVIDvJ0DO66GMQOKCZe/eIP3ZHF6NkiXEZpC1t
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:29:41.3962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3377f79e-9f53-4faa-6fb5-08d8129894d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5308
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65FA21110589C44D9E67D5C26AF822C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
>> <christopher.w.clark@gmail.com> wrote:
>>>
>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> wrot=
e:
>>>>
>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wr=
ote:
>>>>>>
>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
>>>>>>> + Corey
>>>>>>>
>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>
>>>>>>> Corey: you are hereby encouraged to submit patches to meta-virtuali=
zation.
>>>>>>
>>>>>> Ok.  The layer has the following basic pieces:
>>>
>>> Before we get to the other pieces, I'd like to cover the new "rpixen"
>>> MACHINE type that the layer introduces.
>>>
>>> My preference is for avoiding introduction of another MACHINE to
>>> reconfigure an existing one to run Xen, if possible, and use the
>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
>>> creating a new machine for Xen for each board that we add support for.
>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
>>> used to turn on Xen-specific functionality and compatibility, and I'd
>>> like to explore whether that can be made to be sufficient to enable
>>> what is needed.
>>>
>>> To that end, I've done an initial pass to see what it might take and
>>> the work-in-progress from that is posted here:
>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-init=
ial-xen
>>>
>>> Some minor changes to other layers could assist - eg. to remove the
>>> need for a guest filesystem to contain the hypervisor binary - and
>>> there's still some tidying to do.
>>>
>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen group
>>>>>>  fixes things, I keep adding :).
>>>
>>> Unfortunately I had to drop these patches from my local test to get it
>>> to boot. It could easily be a local build issue or a fault with the
>>> one test I've run so far, but I did have success booting with just Xen
>>> 4.13 and I'd like to get a bit more understanding and confidence in
>>> them before we bring them in.
>>>
>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This shoul=
d go
>>>>>>  away if you don't use the kernel from the Pi4 yocto layer, as it
>>>>>>  doesn't work like most kernels in yocto.
>>>>>
>>>>> I should take a look at the configs and see if I can create a fragmen=
t
>>>>> or two, but I can take care of that.
>>>>
>>>> That shouldn't be necessary.  The standard fragments work, it's just
>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
>>>> specific, and hopefully they can fix the Pi kernel to use the normal
>>>> fragments in the future.
>>>
>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
>>> meta-virtualization
>>> needs a matching .inc file to be present for the kernel version that
>>> you're using.
>>> Assuming you're using Linux 4.19 (which is what I've tested with) add t=
his file:
>>>  meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualizati=
on.inc
>>> containing just:
>>>  include linux-yocto_virtualization.inc
>>> which will then enable the linux-raspberrypi kernel to add the
>>> meta-virt Xen fragment.
>>>
>>> There are also two Linux patches:
>>> 1) Disable DMA in the SDHCI driver
>>> This one needs more information in the commit text to understand what
>>> is motivating doing this and what the effects of it are. Should it go
>>> into the standard Raspberry Pi kernel?
>>> 2) Fix PCIe in dom0 for RPi4
>>> Is this fixed upstream in more recent kernels? It would be good to
>>> have a pointer to that if so.
>>>
>>> Bruce: To apply these to just the Raspberry Pi kernel when it's being
>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers might
>>> be an option to consider - eg:
>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-init=
ial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>>
>> I can most likely live with that. I obviously make sure that the
>> reference linux-yocto kernel doesn't need anything to work out of the
>> box, but we can't (and shouldn't) enforce that choice on everyone. I'd
>> rather have patches centralized in a topic layer like
>> meta-virtualization, so if we need to add a dynamic layer and a few
>> patches, that's a good place to be.
>
> please see my new comment below.
>
>>>>>> 5 A few Pi-specific hacks for config and u-boot.
>>>>>
>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi layer=
s
>>>>> ? Or is it both rpi AND xen specific, so doesn't really make sense
>>>>> there either ?
>>>>
>>>> It's both Pi and Xen specific.  If everything gets put where it should
>>>> be, that would be the only thing left in this layer :).
>>>
>>> These are in recipes-bsp and I agree that they're both Pi and Xen
>>> specific. I think these are small enough pieces that keeping them in
>>> meta-virtualization could be a reasonable call, since that's the layer
>>> where Xen support is focussed, and so they can be added to:
>>>  dynamic-layers/raspberrypi/recipes-bsp
>>> which indicates their status as amendments to the meta-raspberrypi
>>> layer. Changes to them would then be easily coordinated with the Xen
>>> recipes.
>>
>> Agreed.
>
> Since I wrote this, we've seen some expressed interest in support for
> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on the
> xen-devel mailing list, a report of success running Xen on the RockPro64
> board:
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.htm=
l
>
> I've personally built Xen with meta-virtualization to run on the Cubietru=
ck for
> development and testing; the Odroid C2 and XU4 are of interest, as is the
> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had some
> non-upstream patches available to enable Xen on it. PCEngines maintains
> Xen compatibility for their APU2 in meta-pcengines.
>
> There are also some challenges being encountered in getting a more recent=
 Linux
> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foundation=
 Eve
> Project run their own patches for 5.6 here:
> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.x
>
> All of this points towards it being a reasonable proposition to have a
> dedicated Xen hardware support Yocto layer, so that board-specific tweaks=
 for
> hardware compatibility with Xen can be maintained without complicating
> meta-virtualization, while continuing to pool Xen-aware contributions in
> a centralized layer.
>
> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work on
> maintaining it. Feedback to this suggestion is welcome.
>
> Bruce: how does this sound to you?

I had this problem working on some other BSPs to support Xen with meta-virt=
ualization (you can check this in meta-arm[1]).

I would think the best way to handle this case is to use dynamic layers and=
 push the required support inside the layer containing the BSP.
This would make the maintenance easier (for example when the kernel is chan=
ged).

If you want an example of how to use dynamic layers you can check meta-arm-=
autonomy sub layer of meta-arm [1] (which also contains other interesting b=
its related to using Xen with Yocto).

Cheers
Bertrand



IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
