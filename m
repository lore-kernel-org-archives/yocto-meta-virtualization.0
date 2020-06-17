Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.47])
 by mx.groups.io with SMTP id smtpd.web11.3194.1592383118604748413
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 01:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XT56Enq2;
 spf=pass (domain: arm.com, ip: 40.107.13.47, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQnc80PrqbpDdKWjkDCdPHaaSFqtAYouo5aH9d7TRsY=;
 b=XT56Enq2FAgECZo9zSWZ2u01MHXTubYgyyMpebriLLYoBd8N9o6nZwIllxvXFGT7zkQipvzbHM7BSZXcz4G9ypxxSFrytlPX/i2wF6HvDiBQep3aVu2FMvtqmOEr+FfAaOG7Nk5z7fjGW+d2ogMuNdp78Sl1OCs/ndoargjYnlM=
Received: from AM7PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:20b:130::37)
 by VI1PR0801MB2093.eurprd08.prod.outlook.com (2603:10a6:800:8a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 08:38:34 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::a8) by AM7PR03CA0027.outlook.office365.com
 (2603:10a6:20b:130::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 08:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 08:38:33 +0000
Received: ("Tessian outbound 866352848bb9:v59"); Wed, 17 Jun 2020 08:38:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46636a58c86df0c0
X-CR-MTA-TID: 64aa7808
Received: from 6fe4c9fed13d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 633DBF48-0116-4213-9C89-8F711526C823.1;
	Wed, 17 Jun 2020 08:38:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6fe4c9fed13d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 08:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHKwsSzEXd31tHLB7j0cBmfsaAOFUcIWV7qTC57JupIXjGYP99H4WfOh8wYamVZhCtxU06bwiUscMWhTh1J8pjCFlWNmmbwSxpdNavtOGAg6Q9fkeCnthPqtvfqs/I+w+eJeJCNLbBl50OwKI+i4FgWCPkcpXFmJ26DactKVHgC4VD3fhmu3CytXfHwcuIG0V2WMVOpIQSHPigGFGGjAeG2MJVBCHMQgbqE6VDRNQuM9H+CtycAHiHWYZgmE9yr13H5/i87TxIRAg4gyLa7l4kv8Lyhgvk4AkvTqg0qUmnPRMSo63kLAZQtmLwnMCslxleZguh1t0GPQL8NvCu8PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQnc80PrqbpDdKWjkDCdPHaaSFqtAYouo5aH9d7TRsY=;
 b=B9vIVPY+fufASTyW33Znhe9MeFVBnOqt9/ucIbtaDKbQhRAUlw2RfetMOoa2g4xc1P6TvywjyODR3yYG0xP/2lad4ayqdmj00mS6g0wX6Jy3jAlSECjHr/Ya9WPitCEChpdts34gDBvF89ceu9D0060IC6wehZAnKpRDmh0LrjhpHJ/ES6zWwFxkT1a+jBwSNItMgoW2HZJ+gpwbGDAcYf5Gd0KMXTHwJ31O8GGjuXOueXwR5f5vq5fa75ZEJpjc9Uuu/COW5zdpffK5ITXDquxxP0hZ2q8FEqTgfy56vdiyB0qM1zqiqj4AtFNVf5We40dX6oUikY4TB7Stod1ClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQnc80PrqbpDdKWjkDCdPHaaSFqtAYouo5aH9d7TRsY=;
 b=XT56Enq2FAgECZo9zSWZ2u01MHXTubYgyyMpebriLLYoBd8N9o6nZwIllxvXFGT7zkQipvzbHM7BSZXcz4G9ypxxSFrytlPX/i2wF6HvDiBQep3aVu2FMvtqmOEr+FfAaOG7Nk5z7fjGW+d2ogMuNdp78Sl1OCs/ndoargjYnlM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3724.eurprd08.prod.outlook.com (2603:10a6:10:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Wed, 17 Jun
 2020 08:38:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 08:38:26 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Corey Minyard <cminyard@mvista.com>, Siddhartha V
	<Siddhuvgowda.18695@gmail.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
Thread-Topic: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve
 the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs.
 and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootf")
Thread-Index: 
 AdY7cueh7BKux6jPTM6klc5Hy0Q9gwAIcLkKAdgWTGwAB3dcAABFDr0AABaUT4AAAE9tAA==
Date: Wed, 17 Jun 2020 08:38:26 +0000
Message-ID: <E204769D-C4EE-4C85-9164-37F3E24735E5@arm.com>
References: 
 <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
 <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
 <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
 <1619478656883F6E.14876@lists.yoctoproject.org>
In-Reply-To: <1619478656883F6E.14876@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f58e8f8e-3092-47d9-05b3-08d81299d254
x-ms-traffictypediagnostic: DB7PR08MB3724:|VI1PR0801MB2093:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2093E726D2FD516E1E1E64829D9A0@VI1PR0801MB2093.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r3Nq8ULzRD7eFCUZ9h2rxPTO1zWBBzHgg7wubIjZpmFniELYfXTNosGhZtafuAC44zNvFdNqygv/kQWRocxGWafjy35B9pdi5Jy+4Z9yHcFYI3vzwexQOBx9nn0O0n36w9u9aPnXm4XRYBrviBJJpnJhJeqYn4d8ES2RN+RcmE1uTYJX10s5B08AE9bRwgN2r6Cb1oqr3dBlTa5Tf8Nu31PgHjvPO+FNW53gBck531jS0izsbxRAhyueDrtfYD48I22mxOgcV+RicvRhyQYZe0hTz6/EB7jUravjB1UeVlUd91laHXVZU7a8n+6bxiSYc01eBuhoElVr/tsL3d8fU1Qog2MwnWvV4YtMtDI1NLAM5Q4RE4ENgmKze1wX86d0Aib83HL3OguvEZxgjhh1KLKjdyguFXggCvDwJffe+2ZdDMGblWhHgjo4FPvoAS43SF7RFfYaYFuRIl8hNeeo3Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(53546011)(6512007)(6506007)(8936002)(186003)(2616005)(8676002)(54906003)(66946007)(6916009)(5660300002)(4326008)(36756003)(6486002)(26005)(33656002)(316002)(478600001)(83380400001)(71200400001)(66446008)(64756008)(91956017)(76116006)(66556008)(86362001)(66476007)(2906002)(966005)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 VA9N2zcjEkD40eVmwJLwjz3n65ybg0lEgHd2AETFopdTyeM3BgjAwyqKYCjKyl7QXdTrFVqhIweSPy/m3YJDSjzd06EwQa4WGyYhxLaIY+aPQ4ql+y8azHxtXbgNwVGTSFZ8J3LaeIkqc1VPrBUdn9aZoi4EKavcsoGjJlEOonHf1zuCSutV4mw67VDt6kNrVIOjBDlwMTJU2fDl7uu2zHR5qJcEu30tiypTDdCwYiRNWfERXdUWVitltd4KZwQiNgPQFrS6W82LY7QF+sTNVo7w/NtbX0HhTsaqVXtymS9W2pFqx0K1rbpu5WCN2mAtEZ57KofS/mjAer96G9CFx6d4xkdlENYNY3RaYqJ7k79k7wT26uVwPGf846jwCLXLRu+czBi7XXck4o5ocFRnX/DSV004DRyjgqOknuibIy1wZmQysoCm2trwEL08Hj6Vq+1FWQekoHWkxD83BHjDcIpC0906pUqqibch3j6BfR+D0NMxxNL4cFuS+KlcvMnr
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3724
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(36906005)(316002)(5660300002)(26005)(36756003)(336012)(2616005)(83380400001)(2906002)(53546011)(6506007)(86362001)(478600001)(33656002)(8936002)(6486002)(81166007)(47076004)(82740400003)(186003)(6512007)(82310400002)(70586007)(4326008)(54906003)(6916009)(70206006)(356005)(966005)(8676002)(219693003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b27a329-5a62-42bc-a866-08d81299ce04
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CTPT0wl4zfeMVjbjp/GOcjiwVULD/FUXGy2nEF3NuLWC0T6ckzWyFppP3Vv8B7tSAXdZQh6NzgwsOa+vJJ6JT4NdAGiMVoix0SVdvAUfGz5Bk0085qIlS9SNjXXeX7f4h0lvEGaosqezV4baxdoifI1o+Q98rJcyFwTz5QrmpGlWUAH7VAeoZ5NBPYqkIXK2ZLd29rGQviq6Sbw3Ub2mZxbaROgL+mEdC3NET3BId9Yqu5RUJrQSDJY/QyYriRAg8zeLLtLC2R4nbRUw0Do+4Bs+THQCyLtABYgJeINa7Th6ujWkMYcVLP7Ljv6LzVyX0vOc9f2mNXv6B6hD5kg3lVUHMBAob885WhOYHHNR3kxn/sE7qAQp25Fnm61KDtOyWG8v8X6qfb7XbSK0EHaxIjo4VP5r6OvR2lqSg3ii54B4YKo+MQyipbozHHnTFjnoyo3dDUwdeQjFO5ziiTKloyGEG9jRemr8OJg0fk8umh9Ub7fj5EhCdCDOiGs54fmR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:38:33.9400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f58e8f8e-3092-47d9-05b3-08d81299d254
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2093
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B3759A0B955ED4A8FCAE8BAAD5BEDF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 09:29, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Hi,
>=20
>> On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>=20
>> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
>>> <christopher.w.clark@gmail.com> wrote:
>>>>=20
>>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> wro=
te:
>>>>>=20
>>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> w=
rote:
>>>>>>>=20
>>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
>>>>>>>> + Corey
>>>>>>>>=20
>>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>>=20
>>>>>>>> Corey: you are hereby encouraged to submit patches to meta-virtual=
ization.
>>>>>>>=20
>>>>>>> Ok.  The layer has the following basic pieces:
>>>>=20
>>>> Before we get to the other pieces, I'd like to cover the new "rpixen"
>>>> MACHINE type that the layer introduces.
>>>>=20
>>>> My preference is for avoiding introduction of another MACHINE to
>>>> reconfigure an existing one to run Xen, if possible, and use the
>>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
>>>> creating a new machine for Xen for each board that we add support for.
>>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
>>>> used to turn on Xen-specific functionality and compatibility, and I'd
>>>> like to explore whether that can be made to be sufficient to enable
>>>> what is needed.
>>>>=20
>>>> To that end, I've done an initial pass to see what it might take and
>>>> the work-in-progress from that is posted here:
>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-ini=
tial-xen
>>>>=20
>>>> Some minor changes to other layers could assist - eg. to remove the
>>>> need for a guest filesystem to contain the hypervisor binary - and
>>>> there's still some tidying to do.
>>>>=20
>>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen grou=
p
>>>>>>> fixes things, I keep adding :).
>>>>=20
>>>> Unfortunately I had to drop these patches from my local test to get it
>>>> to boot. It could easily be a local build issue or a fault with the
>>>> one test I've run so far, but I did have success booting with just Xen
>>>> 4.13 and I'd like to get a bit more understanding and confidence in
>>>> them before we bring them in.
>>>>=20
>>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This shou=
ld go
>>>>>>> away if you don't use the kernel from the Pi4 yocto layer, as it
>>>>>>> doesn't work like most kernels in yocto.
>>>>>>=20
>>>>>> I should take a look at the configs and see if I can create a fragme=
nt
>>>>>> or two, but I can take care of that.
>>>>>=20
>>>>> That shouldn't be necessary.  The standard fragments work, it's just
>>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
>>>>> specific, and hopefully they can fix the Pi kernel to use the normal
>>>>> fragments in the future.
>>>>=20
>>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
>>>> meta-virtualization
>>>> needs a matching .inc file to be present for the kernel version that
>>>> you're using.
>>>> Assuming you're using Linux 4.19 (which is what I've tested with) add =
this file:
>>>> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualizati=
on.inc
>>>> containing just:
>>>> include linux-yocto_virtualization.inc
>>>> which will then enable the linux-raspberrypi kernel to add the
>>>> meta-virt Xen fragment.
>>>>=20
>>>> There are also two Linux patches:
>>>> 1) Disable DMA in the SDHCI driver
>>>> This one needs more information in the commit text to understand what
>>>> is motivating doing this and what the effects of it are. Should it go
>>>> into the standard Raspberry Pi kernel?
>>>> 2) Fix PCIe in dom0 for RPi4
>>>> Is this fixed upstream in more recent kernels? It would be good to
>>>> have a pointer to that if so.
>>>>=20
>>>> Bruce: To apply these to just the Raspberry Pi kernel when it's being
>>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers might
>>>> be an option to consider - eg:
>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-ini=
tial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>>>=20
>>> I can most likely live with that. I obviously make sure that the
>>> reference linux-yocto kernel doesn't need anything to work out of the
>>> box, but we can't (and shouldn't) enforce that choice on everyone. I'd
>>> rather have patches centralized in a topic layer like
>>> meta-virtualization, so if we need to add a dynamic layer and a few
>>> patches, that's a good place to be.
>>=20
>> please see my new comment below.
>>=20
>>>>>>> 5 A few Pi-specific hacks for config and u-boot.
>>>>>>=20
>>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi laye=
rs
>>>>>> ? Or is it both rpi AND xen specific, so doesn't really make sense
>>>>>> there either ?
>>>>>=20
>>>>> It's both Pi and Xen specific.  If everything gets put where it shoul=
d
>>>>> be, that would be the only thing left in this layer :).
>>>>=20
>>>> These are in recipes-bsp and I agree that they're both Pi and Xen
>>>> specific. I think these are small enough pieces that keeping them in
>>>> meta-virtualization could be a reasonable call, since that's the layer
>>>> where Xen support is focussed, and so they can be added to:
>>>> dynamic-layers/raspberrypi/recipes-bsp
>>>> which indicates their status as amendments to the meta-raspberrypi
>>>> layer. Changes to them would then be easily coordinated with the Xen
>>>> recipes.
>>>=20
>>> Agreed.
>>=20
>> Since I wrote this, we've seen some expressed interest in support for
>> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on the
>> xen-devel mailing list, a report of success running Xen on the RockPro64
>> board:
>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.ht=
ml
>>=20
>> I've personally built Xen with meta-virtualization to run on the Cubietr=
uck for
>> development and testing; the Odroid C2 and XU4 are of interest, as is th=
e
>> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had som=
e
>> non-upstream patches available to enable Xen on it. PCEngines maintains
>> Xen compatibility for their APU2 in meta-pcengines.
>>=20
>> There are also some challenges being encountered in getting a more recen=
t Linux
>> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foundatio=
n Eve
>> Project run their own patches for 5.6 here:
>> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.x
>>=20
>> All of this points towards it being a reasonable proposition to have a
>> dedicated Xen hardware support Yocto layer, so that board-specific tweak=
s for
>> hardware compatibility with Xen can be maintained without complicating
>> meta-virtualization, while continuing to pool Xen-aware contributions in
>> a centralized layer.
>>=20
>> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work on
>> maintaining it. Feedback to this suggestion is welcome.
>>=20
>> Bruce: how does this sound to you?
>=20
> I had this problem working on some other BSPs to support Xen with meta-vi=
rtualization (you can check this in meta-arm[1]).
>=20
> I would think the best way to handle this case is to use dynamic layers a=
nd push the required support inside the layer containing the BSP.
> This would make the maintenance easier (for example when the kernel is ch=
anged).
>=20
> If you want an example of how to use dynamic layers you can check meta-ar=
m-autonomy sub layer of meta-arm [1] (which also contains other interesting=
 bits related to using Xen with Yocto).
>=20
> Cheers
> Bertrand
>=20
>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.

Sorry I forgot to remove the disclaimer.
Bertrand

