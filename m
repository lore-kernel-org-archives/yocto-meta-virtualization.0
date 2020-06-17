Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.299.1592410448123356464
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 09:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lbZHE0Ds;
 spf=pass (domain: arm.com, ip: 40.107.6.51, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AR2JeqEMaK1khafiIMtqhOpLb5210h21RZnVjEpODM=;
 b=lbZHE0DsX82ZadtmSr1ytimW7+6RoyYMI+Fxws8oXMtp2T+FMiVjuhD7GFpTJdadfyOaWDbg2Asy0Km67GLPdEYnZo4ZYpcDI/FK1dv27vGCRg7XndIY9Qw5XMhtUlSWTZ0OSdmAE486tmKOUSA0MB8xUp7F73evqOcmGF/Tg4g=
Received: from AM6P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::48)
 by AM0PR08MB3154.eurprd08.prod.outlook.com (2603:10a6:208:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Wed, 17 Jun
 2020 16:14:05 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::37) by AM6P191CA0035.outlook.office365.com
 (2603:10a6:209:8b::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 17 Jun 2020 16:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 16:14:04 +0000
Received: ("Tessian outbound cdc313860a50:v59"); Wed, 17 Jun 2020 16:14:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a381cad291caffb
X-CR-MTA-TID: 64aa7808
Received: from c01066d58e6f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F3086B48-2B88-4DB9-9D14-917BDA9CDA83.1;
	Wed, 17 Jun 2020 16:13:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c01066d58e6f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 16:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbgm+cQ11aLN8AXv7rHUl6HVxphKAAgpztHVDE8tvLhL9il31kjD5yPV3sjR491sVEi1SPtVflx4T/rRLnCYjH0nIgwlp4qQzvyH+7q0bCT5FPsqrlO2SGHaG4YahOleIvUVNa0q6vFps7BmBk+WhCFTadwJoP2g8GawDzUVkKw9pekDA71yTJewQQ1j9bz7jrCFwTKk4IV7GCjNOx7qWPZpnV4TfP6v4vT4uX79xaLqLKxVIfnZh3qZpREo2pAdY1H8FxeezSxNTICZ0CHRc53QKTADjbqNjN8tRdMNv/5pSn8C1ogZZY6uD8cn2ED6laOZzUvkJwxWkpVDjchTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AR2JeqEMaK1khafiIMtqhOpLb5210h21RZnVjEpODM=;
 b=Nv5uEZeH9A2PoHhVulocAnrhYdbL0IBN3mo09gZAd07/RnXi7xkDdWh5dGNoB9XT6nYx97UUfV4m708nrVbQbjphpBmtD06IjZAHIlIfNCSdNd3L/BDBs1z6eYJhlKkx0RzCQ1fuAJ7KqNWcIzonmPr3gQmaQuy/bSjmyUT3uKdIweZlwwJoRbnm8k4VNa+kpe1rc1RE/W/LMB1cELBCMJjV2UbtYrG5uBIq7JrYE0hkdGt16o9SHLrktncWbhILAa44NVDRsGf93P80/GJx8w+uLsHJ2RQ3du8O9soFy576l/2j64Z3cKFWiqKDzjZYUBsqPziZ/h8dB/FV0xF79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AR2JeqEMaK1khafiIMtqhOpLb5210h21RZnVjEpODM=;
 b=lbZHE0DsX82ZadtmSr1ytimW7+6RoyYMI+Fxws8oXMtp2T+FMiVjuhD7GFpTJdadfyOaWDbg2Asy0Km67GLPdEYnZo4ZYpcDI/FK1dv27vGCRg7XndIY9Qw5XMhtUlSWTZ0OSdmAE486tmKOUSA0MB8xUp7F73evqOcmGF/Tg4g=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3370.eurprd08.prod.outlook.com (2603:10a6:10:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 16:13:58 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 16:13:58 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
Thread-Topic: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve
 the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs.
 and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootf")
Thread-Index: 
 AdY7cueh7BKux6jPTM6klc5Hy0Q9gwAIcLkKAdgWTGwAB3dcAABFDr0AABaUT4AACQ9DpQAHKM2A
Date: Wed, 17 Jun 2020 16:13:58 +0000
Message-ID: <8E523F21-6597-4C12-B9A1-3E689C1C932D@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3fb614da-6af3-49f0-723b-08d812d974c4
x-ms-traffictypediagnostic: DB7PR08MB3370:|AM0PR08MB3154:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB31548FD5099AF92F9821BC6E9D9A0@AM0PR08MB3154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 W3+XWuj0t9lVVynsMo0rhX8liCxntDfxtjZtKrAIlRbhU8mwEJFf9qQaOdJzzl9rPTl3MEzkVlwRqO6+Uw0v2AjGjiRUEt12JR8dGet6oIdbRKgWCfG/qYHw8jj5+Xio3Yi/541J2eEED9DDh4EcWtIX+VS9G+bRabDlBOr+1OC2/uz02stAU1Mdu8mu1Ja3i3VYKS3WKbhBuTSagWoC/rTWpR8kgHusoSwpCdxaSnBwyfBxIts2QqTwPHOE0Q4yyJPzcgAx6GRjgO1LMp0p76+7H2yL2HkI0f/j94Pqv7g9eYw1e9pxSWJjMleiIimB0fWqgIQNOpKiSSxMCjZxmDmAVL0dbxbOqHCYfuHvGo0VLGaUyKaeJ4ITA6JDn4jhzsDZQ2r62JZG/26vciqdSbRfkKXkkFzOyfwDRYkehaRkfhHNY4cALAlLJKXhfLjKD54uHyO7YFy+MNAelhP1xQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(8676002)(6486002)(5660300002)(36756003)(8936002)(71200400001)(478600001)(2906002)(6916009)(6512007)(966005)(4326008)(54906003)(83380400001)(316002)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(26005)(186003)(33656002)(53546011)(6506007)(86362001)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 CUAUZx1zC7kBwtr837IgvYS4jXWBmKobh2cg11OflaIrbM6fITnGjWw6mVzdix+5vl7XG4Rhw4S6tWhuoru9mp5gL6cqKuLwCyTrVD/fl6CdkgCd91ohmQMKOAr8gqm6bucUR2/XCl+9cL1keImSxC8hMsT2tigPP+pu8+5rS5rRgeW4SxRpccDgQHK0GzOjYT/RTOLPd3zB2GT85A5MuixnB80HVYL3l9uU90sDXzwbXWNo1V6ooJyzdo/6zwTWDrO63bG4A9cKL75ZUMWtvJWVJ7KRc2DGMaazF75NutkkxIDeAJASMDT6CuHSoYDCTbHSfvD+u48yI0JYZqWIv89FaiT2KI+yek/+XFRVcsg3TRCIaGnTPlp4/nDC31eXj/jBkXOD/5JfCg3Qd6x3EGPxH5lSAltZDw8Ag3RLXCKkbT3I5aPMnw5nvRLK3AI1hVFK4qy6fxmdi4KoGOM7G+dJDq/3KO43HRtj8KfP2wA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3370
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(82310400002)(70586007)(966005)(83380400001)(86362001)(478600001)(70206006)(36906005)(6506007)(47076004)(53546011)(316002)(54906003)(6862004)(5660300002)(30864003)(336012)(82740400003)(36756003)(2616005)(33656002)(356005)(8936002)(26005)(81166007)(4326008)(2906002)(6486002)(186003)(6512007)(8676002)(219693003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d88156a4-a053-400f-bf84-08d812d970c7
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XB68NyIuZNXBd+7IXX5g0zBb6xZZudgizeZAJB2k04sCPSk9hLhAoJ+wD268cB4gskckcy9HkoXhHdNiBALxkHpxBFM68FnO/PoWKmtZQ9zYT7/SPHqzw2dBaGd1CwMNIDfIoXiZSkrWMXa1U/+RQmkrjJjp83qj4amWXCyaacG5c8gcCHJjuHjgvGGjGR77ZYuvxFIyo/KnyvK35JjH1SnMAPPA/LawNzW+4O49xu8rQpqaCMjKUiTGsks69uJ0kSpE2HqWeiSXrdjPXUcd5YyXI9RvpgIrI5na45ubxDYFiOXvF0dDWaSGHLnNDQ45Tszg4pbKGCPSfyGZHvt/2VRE5x/fZ40XlMzFUADApxn24zu8GTRN/1izuqVcntb58tMIR30SKTgMcm9HspL7oP4C8beukNNbO6aROgHIHnCSh8LvMuOtEQmrhg6OZphEosZ3mx31yy3IF5d4a9RDaJnjgQpJ5/dBmIOWYNf6ox1lZYc7mm401QBSXU1vGyKC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 16:14:04.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb614da-6af3-49f0-723b-08d812d974c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3154
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AE370034FDDC94996B808A148EF88DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Jun 2020, at 13:48, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
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
>>>> On 16 Jun 2020, at 22:43, Christopher Clark via lists.yoctoproject.or=
g <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>=20
>>>> On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.=
com> wrote:
>>>>> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
>>>>> <christopher.w.clark@gmail.com> wrote:
>>>>>>=20
>>>>>> On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> =
wrote:
>>>>>>>=20
>>>>>>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>>>>>>>> On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com=
> wrote:
>>>>>>>>>=20
>>>>>>>>> On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wro=
te:
>>>>>>>>>> + Corey
>>>>>>>>>>=20
>>>>>>>>>> On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>>>>>>>>>>> On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>>>>=20
>>>>>>>>>> Corey: you are hereby encouraged to submit patches to meta-virt=
ualization.
>>>>>>>>>=20
>>>>>>>>> Ok.  The layer has the following basic pieces:
>>>>>>=20
>>>>>> Before we get to the other pieces, I'd like to cover the new "rpixe=
n"
>>>>>> MACHINE type that the layer introduces.
>>>>>>=20
>>>>>> My preference is for avoiding introduction of another MACHINE to
>>>>>> reconfigure an existing one to run Xen, if possible, and use the
>>>>>> existing "raspberrypi4-64". I'm hoping to avoid the pattern of
>>>>>> creating a new machine for Xen for each board that we add support f=
or.
>>>>>> In meta-virtualization, there's the "xen" DISTRO_FEATURE, which is
>>>>>> used to turn on Xen-specific functionality and compatibility, and I=
'd
>>>>>> like to explore whether that can be made to be sufficient to enable
>>>>>> what is needed.
>>>>>>=20
>>>>>> To that end, I've done an initial pass to see what it might take an=
d
>>>>>> the work-in-progress from that is posted here:
>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-=
initial-xen
>>>>>>=20
>>>>>> Some minor changes to other layers could assist - eg. to remove the
>>>>>> need for a guest filesystem to contain the hypervisor binary - and
>>>>>> there's still some tidying to do.
>>>>>>=20
>>>>>>>>> 1 The xen patches for the Pi4, just a few patches.  As the Xen g=
roup
>>>>>>>>> fixes things, I keep adding :).
>>>>>>=20
>>>>>> Unfortunately I had to drop these patches from my local test to get=
 it
>>>>>> to boot. It could easily be a local build issue or a fault with the
>>>>>> one test I've run so far, but I did have success booting with just =
Xen
>>>>>> 4.13 and I'd like to get a bit more understanding and confidence in
>>>>>> them before we bring them in.
>>>>>>=20
>>>>>>>>> 2 Hacks for getting the Pi4 kernel config right for xen.  This s=
hould go
>>>>>>>>> away if you don't use the kernel from the Pi4 yocto layer, as it
>>>>>>>>> doesn't work like most kernels in yocto.
>>>>>>>>=20
>>>>>>>> I should take a look at the configs and see if I can create a fra=
gment
>>>>>>>> or two, but I can take care of that.
>>>>>>>=20
>>>>>>> That shouldn't be necessary.  The standard fragments work, it's ju=
st
>>>>>>> that the Pi kernel does not use them.  So this is really Pi+Xen
>>>>>>> specific, and hopefully they can fix the Pi kernel to use the norm=
al
>>>>>>> fragments in the future.
>>>>>>=20
>>>>>> The linux-raspberrypi kernel does use linux-yocto; it's just that
>>>>>> meta-virtualization
>>>>>> needs a matching .inc file to be present for the kernel version tha=
t
>>>>>> you're using.
>>>>>> Assuming you're using Linux 4.19 (which is what I've tested with) a=
dd this file:
>>>>>> meta-virtualization/recipes-kernel/linux/linux-yocto_4.19_virtualiz=
ation.inc
>>>>>> containing just:
>>>>>> include linux-yocto_virtualization.inc
>>>>>> which will then enable the linux-raspberrypi kernel to add the
>>>>>> meta-virt Xen fragment.
>>>>>>=20
>>>>>> There are also two Linux patches:
>>>>>> 1) Disable DMA in the SDHCI driver
>>>>>> This one needs more information in the commit text to understand wh=
at
>>>>>> is motivating doing this and what the effects of it are. Should it =
go
>>>>>> into the standard Raspberry Pi kernel?
>>>>>> 2) Fix PCIe in dom0 for RPi4
>>>>>> Is this fixed upstream in more recent kernels? It would be good to
>>>>>> have a pointer to that if so.
>>>>>>=20
>>>>>> Bruce: To apply these to just the Raspberry Pi kernel when it's bei=
ng
>>>>>> used with Xen, a kernel bbappend in a raspberrypi dynamic-layers mi=
ght
>>>>>> be an option to consider - eg:
>>>>>> https://github.com/dozylynx/meta-virtualization/tree/raspberry-pi4-=
initial-xen/dynamic-layers/raspberrypi/recipes-kernel/linux
>>>>>=20
>>>>> I can most likely live with that. I obviously make sure that the
>>>>> reference linux-yocto kernel doesn't need anything to work out of th=
e
>>>>> box, but we can't (and shouldn't) enforce that choice on everyone. I=
'd
>>>>> rather have patches centralized in a topic layer like
>>>>> meta-virtualization, so if we need to add a dynamic layer and a few
>>>>> patches, that's a good place to be.
>>>>=20
>>>> please see my new comment below.
>>>>=20
>>>>>>>>> 5 A few Pi-specific hacks for config and u-boot.
>>>>>>>>=20
>>>>>>>> #5 does sound like BSP stuff. Is any of it destined for the rpi l=
ayers
>>>>>>>> ? Or is it both rpi AND xen specific, so doesn't really make sens=
e
>>>>>>>> there either ?
>>>>>>>=20
>>>>>>> It's both Pi and Xen specific.  If everything gets put where it sh=
ould
>>>>>>> be, that would be the only thing left in this layer :).
>>>>>>=20
>>>>>> These are in recipes-bsp and I agree that they're both Pi and Xen
>>>>>> specific. I think these are small enough pieces that keeping them i=
n
>>>>>> meta-virtualization could be a reasonable call, since that's the la=
yer
>>>>>> where Xen support is focussed, and so they can be added to:
>>>>>> dynamic-layers/raspberrypi/recipes-bsp
>>>>>> which indicates their status as amendments to the meta-raspberrypi
>>>>>> layer. Changes to them would then be easily coordinated with the Xe=
n
>>>>>> recipes.
>>>>>=20
>>>>> Agreed.
>>>>=20
>>>> Since I wrote this, we've seen some expressed interest in support for
>>>> running Xen on the NVIDIA Jetson Nano and Xavier NX boards, and on th=
e
>>>> xen-devel mailing list, a report of success running Xen on the RockPr=
o64
>>>> board:
>>>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg01067=
.html
>>>>=20
>>>> I've personally built Xen with meta-virtualization to run on the Cubi=
etruck for
>>>> development and testing; the Odroid C2 and XU4 are of interest, as is=
 the
>>>> Xilinx Ultra-96-V2 board; and the NVidia Jetson TX1 at one point had =
some
>>>> non-upstream patches available to enable Xen on it. PCEngines maintai=
ns
>>>> Xen compatibility for their APU2 in meta-pcengines.
>>>>=20
>>>> There are also some challenges being encountered in getting a more re=
cent Linux
>>>> kernel working as a dom0 on the Raspberry Pi 4 - eg. the Linux Founda=
tion Eve
>>>> Project run their own patches for 5.6 here:
>>>> https://github.com/lf-edge/eve/tree/master/pkg/new-kernel/patches-5.6=
.x
>>>>=20
>>>> All of this points towards it being a reasonable proposition to have =
a
>>>> dedicated Xen hardware support Yocto layer, so that board-specific tw=
eaks for
>>>> hardware compatibility with Xen can be maintained without complicatin=
g
>>>> meta-virtualization, while continuing to pool Xen-aware contributions=
 in
>>>> a centralized layer.
>>>>=20
>>>> I'd like to propose creating: 'meta-xen-bsp'; and I'm willing to work=
 on
>>>> maintaining it. Feedback to this suggestion is welcome.
>>>>=20
>>>> Bruce: how does this sound to you?
>>>=20
>>> I had this problem working on some other BSPs to support Xen with meta=
-virtualization (you can check this in meta-arm[1]).
>>>=20
>>> I would think the best way to handle this case is to use dynamic layer=
s and push the required support inside the layer containing the BSP.
>>> This would make the maintenance easier (for example when the kernel is=
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

This is something we plan to fix in the next months and move some parts fr=
om meta-arm-autonomy to meta-virtualization.

By curiosity, what are the 2 things you have in mind ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> Bruce
>=20
>>=20
>> Cheers,
>>=20
>> Bruce
>>=20
>>>=20
>>> If you want an example of how to use dynamic layers you can check meta=
-arm-autonomy sub layer of meta-arm [1] (which also contains other interest=
ing bits related to using Xen with Yocto).
>>>=20
>>> Cheers
>>> Bertrand
>>>=20
>>>=20
>>>=20
>>> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>>=20
>>=20
>>=20
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>=20
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20

