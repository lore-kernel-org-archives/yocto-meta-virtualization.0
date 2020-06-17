Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.75])
 by mx.groups.io with SMTP id smtpd.web10.361.1592410670040603322
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 09:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XT44u3db;
 spf=pass (domain: arm.com, ip: 40.107.13.75, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtWLtqIyaHeMgTKUgy1I3cUIE8j59H9ZYN1S7NIvSw=;
 b=XT44u3dbuO7/yLRn3fNle5JRjYgnl8jj7KZYB+SVdi9V49/NzoG8OhC4dld7odtM7ADcDq3SgRcGA6NorUPdUcJJaUYWMqi9G0pUrBxq0MyUrpz93YPZOIvV+KLI1xrHmXD49oYgDNOwjRIORwX//IIBMArBiO1UKEvVJEjPrY8=
Received: from AM6P191CA0097.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::38)
 by DB7PR08MB3338.eurprd08.prod.outlook.com (2603:10a6:5:1b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Wed, 17 Jun
 2020 16:17:46 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::4d) by AM6P191CA0097.outlook.office365.com
 (2603:10a6:209:8a::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 16:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 16:17:45 +0000
Received: ("Tessian outbound 866352848bb9:v59"); Wed, 17 Jun 2020 16:17:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07710cc1401179d2
X-CR-MTA-TID: 64aa7808
Received: from 4053e735e1a1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BA2865FF-B4AD-4FAF-9B76-25B61D2ED8C3.1;
	Wed, 17 Jun 2020 16:17:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4053e735e1a1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 16:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJmwNnJhs1ZGwxp1dNsP6Q6dDIH/TH8TDKcrt9G9f0hjq577AoFno1LrnIwpEBFTBrBTCti3kF2TL+mhY0x1r2W/qoXCXg34cMMefvMwDaNE9KGQOv3O6op7tRJdc8ypxxu0m5Vumoz2KSyv7R7xcTsStok8HrAwIxYGx4/emJ/Rm+cD46aZ++hWom+vFjelJnhwSH36it6IBE+niF6g4JplpkjJp8gnVP16jnULgo6u2QI5PyyyKwcyBUyyNSCNZuji0qZgIcHY8LN56aXGPTBxv4Eb7XjY88EbtQ7LFI8VDD3Gr8SF08gsEIkf6UNakNVh2+dLmp0VCrkWPw/1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtWLtqIyaHeMgTKUgy1I3cUIE8j59H9ZYN1S7NIvSw=;
 b=mY/nweaqTYM3WN5qm+sudNA7k6LOOpUiv/M1HhJXLml+PN9ymCf7JkkTigcrgChPmjVtX1uQHmCeRAwAG7mZSCT/bf0SaAJB6qJWOU9oYq3p5bVyW2HwUpMIH0yQiUB+3WiRbFi5rvGq8hM+boANSb0iBNLBwTq5Cbgaiy2dZZByvs8FK6toUrlgw0u8UuWdf9pMYvXA+BtU7w1hsSAYh7/otcy02Ha5euU97IHjNgqULfJvky6spMjqcQyBsjc53Q5Xq28ksBtChA9VRzH0ORX/UpOC6wq7iu5bo3CIwsUdYt+w58zggcVpQ5KAS4V2i2kTkmd5RVBBS+xfoOAR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBtWLtqIyaHeMgTKUgy1I3cUIE8j59H9ZYN1S7NIvSw=;
 b=XT44u3dbuO7/yLRn3fNle5JRjYgnl8jj7KZYB+SVdi9V49/NzoG8OhC4dld7odtM7ADcDq3SgRcGA6NorUPdUcJJaUYWMqi9G0pUrBxq0MyUrpz93YPZOIvV+KLI1xrHmXD49oYgDNOwjRIORwX//IIBMArBiO1UKEvVJEjPrY8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3370.eurprd08.prod.outlook.com (2603:10a6:10:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 16:17:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 16:17:39 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Corey Minyard
	<cminyard@mvista.com>, Siddhartha V <Siddhuvgowda.18695@gmail.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
Thread-Topic: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve
 the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs.
 and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootf")
Thread-Index: 
 AdY7cueh7BKux6jPTM6klc5Hy0Q9gwAIcLkKAdgWTGwAB3dcAABFDr0AABaUT4AACQ9DpQAHSbsA
Date: Wed, 17 Jun 2020 16:17:39 +0000
Message-ID: <84611057-227E-4A10-9ACC-4FD0416E25EB@arm.com>
References: 
 <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net>
 <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
 <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
 <CACMJ4GbZw2j4CZQ6ijDopT-cgoHeBjY87MouhFkL0DaCMBP=Kw@mail.gmail.com>
 <B7EF9851-B689-45A1-BCA1-167786E43A85@arm.com>
 <161955761BC8F01E.18675@lists.yoctoproject.org>
 <CADkTA4O1y+GHbnQyRie7iyWwCON_qc1zmHRAc7Hi0LwzcZ_pDw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4O1y+GHbnQyRie7iyWwCON_qc1zmHRAc7Hi0LwzcZ_pDw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b7ff566-d9ab-46c4-d084-08d812d9f895
x-ms-traffictypediagnostic: DB7PR08MB3370:|DB7PR08MB3338:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3338F6B11A051EF62F647B909D9A0@DB7PR08MB3338.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BZv8v18zX+lKwyLWcxq25sUgDhKfoy4gzQjxMO2LYGze5rvXxkCFyIpREXs1gq371g0xInGFz1acYSytHvypEHBfE1lhxJZKBLJN5pYoGsGVNPlOS1WZRqT4zQ3nzqUukNT0Ev174LgeAxHf6kr1xcql/gN3lGE5rnykUC5PV+ZevKHChdxu2cnt0s+sYBwhhW27REDLuGTIuxX6G0woBpI9HBGldwQ0C1Vc4jfXJPqYOtOhz4DSfNRp+qgCEPkRNfe848wwjzin4MtrTJNyga/8HeoVmNA4Nao8tlFBbMcugmsRkM+lZ0rWmkniRCrpb7OUDHzFXwuG5bo8zpD0/PPJSJQ6jtR+jnMc2wMKkf9mI5HB2Jo9ueGh80a9qYKW15IPP7m7rBXM8yOLWaB9NzpDVSAbRVWvDtQK+jvLVi83GRGCwxXcfFts9CA4Htzs/KHgU1eFQAZ8ebwnNBYVtg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(8676002)(6486002)(5660300002)(36756003)(8936002)(71200400001)(478600001)(2906002)(6916009)(6512007)(966005)(4326008)(54906003)(83380400001)(316002)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(26005)(186003)(33656002)(53546011)(6506007)(86362001)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 8zPIuZBjLdWQuSCa2rx03QgPoFW00zc0BtkVBl+KDRVH2y3U8LhDpiqFgPqf4pZ5qG7tjpsScyE/UoCALx6E/zXwCVOu5Ena3TxUztXSJ7/2g2IhaOX/FFQXbE79Mpe/mAmNZtiKjdxeGU101fsdzaE2bvLicgA48AXX1ZdjhjUOsvhCW0fFWiqm6HqGdf3L5cUz0m29KIMS6LC3/wFv/AqNbFlduGxfhR3X1YKiSuiIdHFfB6ALMw129Y1n4DlHeVErZ/bCj+s7Fm5dmLI/iHtkocqCkzw/zzxhBveDGTH/9WYBv1wi2eSCJEBx49DrbIy/yqmXgsJMqo3kSuWZuA+mhN18U9DgqtTeavUIhMjJaKvK8IHeD5VJd9O1OyAqc//W0TxQ8fZkAWBaYXGN50iy7oD2B8/ypIyocjTDw3AGEDPR7LrsSsblDPXt506XZ5zD7wTcr/wcNp8Ekn/pjJKl4bBrKtLqwvwT2h58Ph0nXbyh5JJiJa7MSILaww6w
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3370
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(33656002)(336012)(70206006)(36906005)(70586007)(316002)(6512007)(36756003)(54906003)(2616005)(83380400001)(8936002)(356005)(8676002)(82310400002)(6506007)(26005)(6862004)(478600001)(186003)(86362001)(2906002)(6486002)(47076004)(966005)(82740400003)(4326008)(81166007)(53546011)(5660300002)(219693003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	caf40a90-8f53-4793-606b-08d812d9f483
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j5/CqMCR78tQ8sEWYBeRG323mGMyE9OrNPjZTklWyMsyvwMIo+GRKt/YD3qxKnZJDTdw77zqeQN+VCBYowPyetL0avmFsH0II06IpWgsw0Da7vCwzK9ysVJaT8jRhmmirhf1f/x4jhCm0gF5bL0ODtHmiLxXA0nEfmKHlw0cvoR/A6PPi+pnZRdPJ5HQV3bCYf2Y3rkYI6Z7QMzahYrasQ3eSqrjqtRyyGKbBrtPgAdCpYT2HmYv6vsB8Lslio/8pNIrP9YT+oS95xmhZvvlMaNqtX3eqw6hoq54w+qVWm/svWClCBeGSemMfeapc9paGvMODKHN7zXAZUkkPGvz9OhLnhvqb5gbvTPja3kxvSC3KlBA7Q8HLTLRmXAaSOB/ms3buvTk3dLsk7Qbz9gGkjMS8j8mLiJBh4nrtoXx389Caqi6kMBvsiGuLuta9EaMGRa4WulSzqpVUEsuljmeMJOnTEeJ0xCjEkkMrLpsdQHVddTQTH71tRye3sRkT9jP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 16:17:45.8967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7ff566-d9ab-46c4-d084-08d812d9f895
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3338
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28F6EA3BA2BE5749B29846A547579F41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 13:48, Bruce Ashfield via lists.yoctoproject.org <bruc=
e.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> On Wed, Jun 17, 2020 at 8:45 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>=20
>> On Wed, Jun 17, 2020 at 4:29 AM Bertrand Marquis
>> <Bertrand.Marquis@arm.com> wrote:
>>>=20
>>> Hi,
>>>=20
>>>> On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.org=
 <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>=20
>>>> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
>>>>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
>>>>> <christopher.w.clark@gmail.com> wrote:
>>>>>>=20
>>>>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> w=
rote:
>>>>>>>=20
>>>>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>>>>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com>=
 wrote:
>>>>>>>>>=20
>>>>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrot=
e:
>>>>>>>>>> + Corey
>>>>>>>>>>=20
>>>>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>>>>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>>>>=20
>>>>>>>>>> Corey: you are hereby encouraged to submit patches to meta-virtu=
alization.
>>>>>>>>>=20
>>>>>>>>> Ok.  The layer has the following basic pieces:
>>>>>>=20
>>>>>> Before we get to the other pieces, I'd like to cover the new "rpixen=
"
>>>>>> MACHINE type that the layer introduces.
>>>>>>=20
>>>>>> My preference is for avoiding introduction of another MACHINE to
>>>>>> reconfigure an existing one to run Xen, if possible, and use the
>>>>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
>>>>>> creating a new machine for Xen for each board that we add support fo=
r.
>>>>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
>>>>>> used to turn on Xen-specific functionality and compatibility, and I'=
d
>>>>>> like to explore whether that can be made to be sufficient to enable
>>>>>> what is needed.
>>>>>>=20
>>>>>> To that end, I've done an initial pass to see what it might take and
>>>>>> the work-in-progress from that is posted here:
>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-i=
nitial-xen
>>>>>>=20
>>>>>> Some minor changes to other layers could assist - eg. to remove the
>>>>>> need for a guest filesystem to contain the hypervisor binary - and
>>>>>> there's still some tidying to do.
>>>>>>=20
>>>>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen gr=
oup
>>>>>>>>> fixes things, I keep adding :).
>>>>>>=20
>>>>>> Unfortunately I had to drop these patches from my local test to get =
it
>>>>>> to boot. It could easily be a local build issue or a fault with the
>>>>>> one test I've run so far, but I did have success booting with just X=
en
>>>>>> 4.13 and I'd like to get a bit more understanding and confidence in
>>>>>> them before we bring them in.
>>>>>>=20
>>>>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This sh=
ould go
>>>>>>>>> away if you don't use the kernel from the Pi4 yocto layer, as it
>>>>>>>>> doesn't work like most kernels in yocto.
>>>>>>>>=20
>>>>>>>> I should take a look at the configs and see if I can create a frag=
ment
>>>>>>>> or two, but I can take care of that.
>>>>>>>=20
>>>>>>> That shouldn't be necessary.  The standard fragments work, it's jus=
t
>>>>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
>>>>>>> specific, and hopefully they can fix the Pi kernel to use the norma=
l
>>>>>>> fragments in the future.
>>>>>>=20
>>>>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
>>>>>> meta-virtualization
>>>>>> needs a matching .inc file to be present for the kernel version that
>>>>>> you're using.
>>>>>> Assuming you're using Linux 4.19 (which is what I've tested with) ad=
d this file:
>>>>>> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualiza=
tion.inc
>>>>>> containing just:
>>>>>> include linux-yocto_virtualization.inc
>>>>>> which will then enable the linux-raspberrypi kernel to add the
>>>>>> meta-virt Xen fragment.
>>>>>>=20
>>>>>> There are also two Linux patches:
>>>>>> 1) Disable DMA in the SDHCI driver
>>>>>> This one needs more information in the commit text to understand wha=
t
>>>>>> is motivating doing this and what the effects of it are. Should it g=
o
>>>>>> into the standard Raspberry Pi kernel?
>>>>>> 2) Fix PCIe in dom0 for RPi4
>>>>>> Is this fixed upstream in more recent kernels? It would be good to
>>>>>> have a pointer to that if so.
>>>>>>=20
>>>>>> Bruce: To apply these to just the Raspberry Pi kernel when it's bein=
g
>>>>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers mig=
ht
>>>>>> be an option to consider - eg:
>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-i=
nitial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>>>>>=20
>>>>> I can most likely live with that. I obviously make sure that the
>>>>> reference linux-yocto kernel doesn't need anything to work out of the
>>>>> box, but we can't (and shouldn't) enforce that choice on everyone. I'=
d
>>>>> rather have patches centralized in a topic layer like
>>>>> meta-virtualization, so if we need to add a dynamic layer and a few
>>>>> patches, that's a good place to be.
>>>>=20
>>>> please see my new comment below.
>>>>=20
>>>>>>>>> 5 A few Pi-specific hacks for config and u-boot.
>>>>>>>>=20
>>>>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi la=
yers
>>>>>>>> ? Or is it both rpi AND xen specific, so doesn't really make sense
>>>>>>>> there either ?
>>>>>>>=20
>>>>>>> It's both Pi and Xen specific.  If everything gets put where it sho=
uld
>>>>>>> be, that would be the only thing left in this layer :).
>>>>>>=20
>>>>>> These are in recipes-bsp and I agree that they're both Pi and Xen
>>>>>> specific. I think these are small enough pieces that keeping them in
>>>>>> meta-virtualization could be a reasonable call, since that's the lay=
er
>>>>>> where Xen support is focussed, and so they can be added to:
>>>>>> dynamic-layers/raspberrypi/recipes-bsp
>>>>>> which indicates their status as amendments to the meta-raspberrypi
>>>>>> layer. Changes to them would then be easily coordinated with the Xen
>>>>>> recipes.
>>>>>=20
>>>>> Agreed.
>>>>=20
>>>> Since I wrote this, we've seen some expressed interest in support for
>>>> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on the
>>>> xen-devel mailing list, a report of success running Xen on the RockPro=
64
>>>> board:
>>>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067.=
html
>>>>=20
>>>> I've personally built Xen with meta-virtualization to run on the Cubie=
truck for
>>>> development and testing; the Odroid C2 and XU4 are of interest, as is =
the
>>>> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had s=
ome
>>>> non-upstream patches available to enable Xen on it. PCEngines maintain=
s
>>>> Xen compatibility for their APU2 in meta-pcengines.
>>>>=20
>>>> There are also some challenges being encountered in getting a more rec=
ent Linux
>>>> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Foundat=
ion Eve
>>>> Project run their own patches for 5.6 here:
>>>> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6.=
x
>>>>=20
>>>> All of this points towards it being a reasonable proposition to have a
>>>> dedicated Xen hardware support Yocto layer, so that board-specific twe=
aks for
>>>> hardware compatibility with Xen can be maintained without complicating
>>>> meta-virtualization, while continuing to pool Xen-aware contributions =
in
>>>> a centralized layer.
>>>>=20
>>>> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work =
on
>>>> maintaining it. Feedback to this suggestion is welcome.
>>>>=20
>>>> Bruce: how does this sound to you?
>>>=20
>>> I had this problem working on some other BSPs to support Xen with meta-=
virtualization (you can check this in meta-arm[1]).
>>>=20
>>> I would think the best way to handle this case is to use dynamic layers=
 and push the required support inside the layer containing the BSP.
>>> This would make the maintenance easier (for example when the kernel is =
changed).
>>=20
>> We've already been talking about dynamic layers, but they don't
>> actually solve the issue of one source of truth for an entire stack
>> that I'm talking about.
>=20
> And of course, at a glance, I already see two things that could have
> easily been submitted to meta-virtualization. Which shows the point,
> that once you have layers as a place to stash fixes/features, they
> typically don't get submitted to the centralized layers.

If someone is developing a BSP in his own layer and has some specific patch=
es to make this BSP work with Xen and meta-virtualization, I would create a=
 dynamic layer in his BSP Layer so that including this layer would give me =
full support for the BSP.
How would you suggest to handle such a scenario ?

Of course if the fixes are generic then those should be pushed to meta-virt=
ualization.

As an example: where should I put a xen .config file and the bbappend to ap=
ply it during compilation for my BSP ?

Cheers
Bertrand

