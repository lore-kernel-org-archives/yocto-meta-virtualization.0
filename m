Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A9BC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 08:38:27 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web11.6760.1648024704836687688
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 01:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=UlCBANPe;
 spf=pass (domain: arm.com, ip: 40.107.7.74,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGDCwm7etEi8dm838dYejCp6iYQiqFM+s5fJsT52YJc=;
 b=UlCBANPexRmNYaRxi35IhzxcRZ/698HZ56/UJL55e5w0+zFx380NTxsUcIetLFq7cxzgiDc36TAovqKpRhHN4l8vMG+95ZHBStjeAGDyvYWsLvGw+F+05cV0U51dJep+c97HGeOkdeho1FQ26ulKK5ZG9uhv7HInDVHoN4aNux0=
Received: from AS8PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:20b:331::10)
 by VI1PR08MB3277.eurprd08.prod.outlook.com (2603:10a6:803:3f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 23 Mar
 2022 08:38:18 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::d9) by AS8PR04CA0155.outlook.office365.com
 (2603:10a6:20b:331::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 23 Mar 2022 08:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 08:38:18 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 23 Mar 2022 08:38:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a92343565ca7d286
X-CR-MTA-TID: 64aa7808
Received: from 7e414661ace2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC0CEC73-D9DE-4E34-9745-51EC612197B3.1;
	Wed, 23 Mar 2022 08:38:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7e414661ace2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Mar 2022 08:38:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfGfyRmPAfQLdG/bKMsqGWd27Lf1HKdQRu9EAbS163nUUpB3rr3y7WJWpCMFO4CGxM/EWZtacsgGoR8SyBj96p2USFpHRxDXGuECvKvJOPghWFuU/k1skOO+yu6aZ9fjrDyQlvF/poIUBJT7ENdqvDysvkNyf8IGpX+OYiJsozoQu+r8f64mu9uFIoJtvcBMF0r10XstE5UVBaL/LtVuRGlzlPzXTxUza5nX+vsvkU5Js24jw7J/nVAZ6ncs2Z0oiN0nLDn2O06Zq0fpepJPqr1PgMaFlxkStA2jxF2v22N9dmdk8n/yftOmLSlwV/htmF3mAs7RKllTlH7JY+iCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGDCwm7etEi8dm838dYejCp6iYQiqFM+s5fJsT52YJc=;
 b=Y1+M/I7+kB+S5KkCnAP4+zG45jcE2D7upm+cmt8y4KZsfaA6/6Dx1EdPvRJZr9zEyVN/qBCnw1hRflw6rDNuzyIkpk1t3QMDU90xyaIoF3pemWUe8a6TI3FDy+wG+DDAPcWZhJZBsYTWu10HT8QC1WMbizVFROt8Fi76KMhtQBPIAzcn79IQ8nUYaPNzaKOzMudPrFmpBZx3NytYvjbenrOO9jglRSqFW+RIHB+elkiKulr9uiTyY5D0h+HHZUAxaozWUEEpGYjf15yj6R59tafA3c0UYxGu4I06/RZPxvABP50fd/V+AgiMIoaFJRNwv4B1sHTypRbe1xG74KVs+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGDCwm7etEi8dm838dYejCp6iYQiqFM+s5fJsT52YJc=;
 b=UlCBANPexRmNYaRxi35IhzxcRZ/698HZ56/UJL55e5w0+zFx380NTxsUcIetLFq7cxzgiDc36TAovqKpRhHN4l8vMG+95ZHBStjeAGDyvYWsLvGw+F+05cV0U51dJep+c97HGeOkdeho1FQ26ulKK5ZG9uhv7HInDVHoN4aNux0=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0801MB1625.eurprd08.prod.outlook.com (2603:10a6:3:7f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 23 Mar
 2022 08:38:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 08:38:03 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Paulo Sherring <pauloasherring@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQCAACJJAIAABfmAgAACFICAAAYkAIABGP0A
Date: Wed, 23 Mar 2022 08:38:03 +0000
Message-ID: <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
 <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
 <CAG9RwPKbpORfL3FkARJuT=fAM5PZGY-Lkv+PQ-rEjt1+j9qVeQ@mail.gmail.com>
 <26959151-CAA8-4FDC-808D-51F58228EC06@arm.com>
 <AM6PR08MB34615752123840EC55863F2492179@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
In-Reply-To: 
 <CAG9RwP+_FzmRwL9O7wMuGPOtVDjh30Z=UZNfeav4ELxga=8n5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e275067b-9c53-427b-4155-08da0ca87ae6
x-ms-traffictypediagnostic: 
	HE1PR0801MB1625:EE_|AM5EUR03FT029:EE_|VI1PR08MB3277:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3277EF2E09AFB9E115DE20229D189@VI1PR08MB3277.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K9Dp66Uxph3+MllUcH+eNrD84R1PZb5VDFgg3m5K3LSQHM2L74EUOSn+JyUWSXk7KWI2T+W7DXBzyCoTGZv8+x4Zr3Obaso7n74DTh3wM560d8rXRWKSIlWfu3VditG3tpxr70JWaKAo+wWO1i7F5KdtkJSgdy6yVkimFEjcwdyjFqzDl0qWRoNdUXt8CRuGKXozxaDYqw3VJAoxzMgy+KoflD5N1PjupnXdHdRslgk5oUmkgkxqbfFw/Dz1jQbAak5Aj+oazibbvby2+fj6H0p/piM0B+7XliVI0/UNoZVujrNLsArcJPzKrymPNjbKavJbNCdFXPa5Y0NNZkmwWxjIc82XgSkHTE8ubjQRpoB0kgyzLO+toMqindzXGALO4+CBso7L6GU0GuE0s+Z2Ofrs2r6aTw9RoZFmcqQq56BZbppVx/DRKLqufucJebpZmmvGxGCBfsQzIeaOI4iFhSGKzm4yo7W+UkwQSHh1uiQim85tzpw6u0YC3tEG04HISrQYw/SXKfloMtdYC1tYkWoxPfU2Nd4ZUicKXHRoy/L+KFfHAdWcu18toVg9QXeGx3EicRMlg7RSucr7o3vmyMO4P5dru6U+T36HCE1dbmzrBdCmiFBh1LykzDDuIxYATowPyNyvAq5qkGkTTWYK1I5Pn0s4d1FTSAePohNbpg9G7fbwxZXRn9z7WY6lTHoOESRFQAGNwV48GqInqQHPcPQaa0+KLBDeMIOhAaWy3F3vbpzP7j7TvhybGftLCBK2p2Q1ZCvtpATm5irhg/ecdkURP/ZQMOZECPcXHMj3x/CewbLjdjEHIeGlyyCyPBkxQEfLeZnKARifGPyQ0m68reDMgyiSYcXjzK5pNJrWvvU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(86362001)(53546011)(8936002)(122000001)(5660300002)(36756003)(6506007)(6512007)(316002)(38100700002)(8676002)(83380400001)(91956017)(33656002)(71200400001)(110136005)(54906003)(64756008)(2616005)(66476007)(66946007)(66556008)(66446008)(186003)(508600001)(6486002)(966005)(76116006)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51CF27E7EA6C3249BD7FCBCC5A7229A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d676d783-62b9-47fa-1f26-08da0ca8723f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nM2n0batLoLKURie+TPx70Rr2TwM9750X7QM8nC+rOaP5ZfJHejfvibQFLHPQrsu26VE92s8QOsM/KhvSDFXcJpKiInKPufh6Yn9ClhV2ocqaPJaZEKpB6JtX8cx0fo0NZcQV80ybsFNvuVDDqehcsqV7EXvorurl7b2VPEVaQizenRVqYEF7QIpv4dhl9esbGElRtonvTsEQ7zYfk3oiMVOn6XiBnVAwKwm1cWRHel+p7RWMDylQ4i+FwekQMAGCK2k0SMlSkK9PAIn9vWINn3PGOVYqcsKaAPOwsgGwvRjTlkOFwzQXArwWi0jTXfBlOtGc97fxIZJeQZX7Z5pdr/aI7Eor4DZMbQk5viYnxMZC0q4xVytM69nMPch7TY6hjoFBiQQ7tNirFwTSece8w14kFb+GS2L45upAgMnEsWcP5wg67+Qqv5avdX5wj2jf8J8o1Sf9vTuhHuBsYsJevQNrGiQ6gc5/s9aOKl5F5CVr8m0f1IF4Ohp9i+AjCk6myP+rF3BteR6aSErPrhLfqiUa4Zyu47i7SNiCtKmWxJkHab0whRwj3pdgCixNtHe6woy/qt9uO019qvhGAY05bEOUYdDpU0yiDkOiVyQ3IE85hMvrp+fsEyqoIeF8nHPiOmGhy4wgLr0GIt99sFn9mVZejDjB91oo7180xsYVVWLXFF4zS3adeVInmQ4CwhXNaKnqUPasnpGHHtmKrlgr+Qge15xyFWGmzbT+8NVBuF7AqY3ccArn9IVJjuRGGnDy4PV/QJvqmgGMnp9bo33vSb4fzrfs1l7Q6LL/NjvYuE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(2616005)(110136005)(36756003)(26005)(966005)(316002)(33656002)(83380400001)(40460700003)(47076005)(70586007)(6512007)(54906003)(70206006)(8676002)(6506007)(53546011)(36860700001)(4326008)(6486002)(336012)(508600001)(8936002)(82310400004)(5660300002)(81166007)(86362001)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 08:38:18.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e275067b-9c53-427b-4155-08da0ca87ae6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 08:38:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7106

Hi Paulo

> On 22 Mar 2022, at 16:52, Paulo Sherring via lists.yoctoproject.org <paul=
oasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Hello Diego, Bertrand,
> Just confirmed that by bringing these changes into hardknott, the
> modules get correctly probed on bootup.

Great thanks for the info.

@Bruce: Maybe it would make sense to backport this as hardknott is LTS ?
If yes, please ping me if you need support to do it.

Cheers
Bertrand

>=20
> The xen.conf content, just for completeness:
> xen-evtchn
> xen-gntdev
> xen-gntalloc
> xen-blkback
> xen-netback
> xen-pciback
> evtchn
> gntdev
> netbk
> blkbk
> xen-scsibk
> usbbk
> pciback
>=20
> Thanks for the support :)
> Kind regards, Paulo.
>=20
> On Tue, Mar 22, 2022 at 3:30 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote=
:
>>=20
>> The xen modules load from systemd was fixed in master as https://git.yoc=
toproject.org/meta-virtualization/commit/?id=3D44dad5105d408e7b6217600eba36=
72e72db0f42f and honister as https://git.yoctoproject.org/meta-virtualizati=
on/commit/?h=3Dhonister&id=3D6cde8f2ccbde5ecc9997cf727939a0ae5e0fe11d.
>>=20
>> You might need to backport this to hardknott as well.
>>=20
>> --
>> Diego Sueiro
>> Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)
>>=20
>>> -----Original Message-----
>>> From: meta-virtualization@lists.yoctoproject.org <meta-
>>> virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis vi=
a
>>> lists.yoctoproject.org
>>> Sent: 22 March 2022 15:23
>>> To: Paulo Sherring <pauloasherring@gmail.com>
>>> Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>; Bruce
>>> Ashfield <bruce.ashfield@gmail.com>
>>> Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boo=
t
>>>=20
>>> Hi Paulo,
>>>=20
>>>> On 22 Mar 2022, at 16:01, Paulo Sherring <pauloasherring@gmail.com>
>>> wrote:
>>>>=20
>>>> Hi Bertrand,
>>>> One very important piece of information I missed to disclose: I am not
>>>> using runqemu, as it was not being properly set by the resulting
>>>> bitbake build (the resulting image was pointing to the kernel instead
>>>> of the xen binary).
>>>=20
>>> This should not impact the module loading.
>>>=20
>>>>=20
>>>> So, I am launching it "by hand":
>>>>=20
>>>> ./tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nativ
>>>> e/usr/bin/qemu-system-aarch64
>>>> \
>>>> -nographic  \
>>>> -machine virt,gic-version=3D3 \
>>>> -machine virtualization=3Dtrue \
>>>> -cpu cortex-a57 -smp 4 -m 4G -machine type=3Dvirt \ -bios
>>>> ./tmp/deploy/images/qemuarm64/u-boot-qemuarm64.bin \ -device
>>>> loader,file=3D./tmp/deploy/images/qemuarm64/xen-
>>> qemuarm64,addr=3D0x4500000
>>>> 0
>>>> \
>>>> -device
>>>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>>> 5.10.103+git0+792f127
>>>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x46000000
>>>> \
>>>> -device
>>>> loader,file=3D./tmp/deploy/images/qemuarm64/Image--
>>> 5.10.103+git0+792f127
>>>> 2dd_3aab5bb12b-r0-qemuarm64-20220317212819.bin,addr=3D0x48000000
>>>> \
>>>> -device loader,file=3D./virt.dtb,addr=3D0x44000000 \ -drive
>>>> id=3Ddisk0,file=3D./tmp/deploy/images/qemuarm64/xen-image-minimal-
>>> qemuarm6
>>>> 4.ext4,if=3Dnone,index=3D0,format=3Draw
>>>> \
>>>> -device virtio-blk-device,drive=3Ddisk0 \
>>>>=20
>>>> And then stop it on u-boot, and setup the fdt:
>>>> ## Dom0 only:
>>>> fdt addr 0x44000000
>>>> fdt resize
>>>> fdt set /chosen \#address-cells <1>
>>>> fdt set /chosen \#size-cells <1>
>>>> fdt set /chosen xen,xen-bootargs "dom0_mem=3D512M"
>>>> fdt mknod /chosen module@0
>>>> fdt set /chosen/module@0 compatible "xen,linux-zimage" "xen,multiboot-
>>> module"
>>>> fdt set /chosen/module@0 reg <0x46000000 0x1373a00> fdt set
>>>> /chosen/module@0 bootargs "dom0_mem=3D512M root=3D/dev/vda rw
>>>> earlyprintk=3Dserial,ttyAMA0 console=3DttyAMA0,115200n8 earlycon=3Dxen=
boot"
>>>> booti 0x45000000 - 0x44000000
>>>>=20
>>>> Please find also some more information below:
>>>>=20
>>>> On Tue, Mar 22, 2022 at 12:59 PM Bertrand Marquis
>>>> <Bertrand.Marquis@arm.com> wrote:
>>>>>=20
>>>>> Hi Paulo,
>>>>>=20
>>>>> Hardknott is long term while honister is not but both are stable rele=
ases.
>>>>>=20
>>>>> I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is =
building
>>> the latest 4.14 version of Xen.
>>>>>=20
>>>> That was just me being silly. I was looking into xen_git.bb which
>>>> clearly is not the preferred provider. I am in fact using Xen 4.14, as
>>>> you pointed out. Sorry for the mistake.
>>>>> From what I see modules to load are in a xen.conf in modules-load.d
>>> generated by Xen tools compilation.
>>>>> Gntdev is properly listed in the current xen source tree as one of th=
e
>>> default modules to actually load on boot.
>>>>>=20
>>>>> Can you check the content of modules-load.d/xen.conf (somewhere in /e=
tc
>>> in your dom0 roots) ?
>>>>>=20
>>>> I have nothing there. But, I did have two hits when searching the root=
fs:
>>>> /etc/tmpfiles.d/xen.conf
>>>> /lib/systemd/modules-load.d/xen.conf
>>>=20
>>> This is the interesting file.
>>> It shall be used by systemd on boot to load the modules required by Xen=
.
>>> Please check if gntdev is listed there.
>>>=20
>>> If yes then this is a systemd issue, if not this is a Xen issue which a=
ppear to be
>>> solved in xen master and I will have to check in the 4.14 version used =
by Yocto
>>> LTS.
>>>=20
>>>=20
>>>> Not sure if there there is some sort of startup script that was
>>>> supposed to move around these files or even if
>>>> systemd-modules-load.service would be supposed to be looking
>>>> elsewhere.
>>>=20
>>> No the lib one is the right one for systemd.
>>>=20
>>> Cheers
>>> Bertrand
>>>>=20
>>>>> It could be that this was actually missing in the xen release you are=
 building
>>> or that systemd is not actually loading modules listed there.
>>>>>=20
>>>>> Cheers
>>>>> Bertrand
>>>> Cheers, Paulo.
>>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7103): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7103
> Mute This Topic: https://lists.yoctoproject.org/mt/89949013/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


