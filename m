Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF47C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:03:39 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.44])
 by mx.groups.io with SMTP id smtpd.web11.10574.1648127017092430307
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=h8F6s9NV;
 spf=pass (domain: arm.com, ip: 40.107.5.44,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf9Zx/AuGhFI25CazesfThDhcI8nUn2jzwHvnTsXXV0=;
 b=h8F6s9NVbhAM8foJ29qu3MdXnl/oD2C533Xp8tqokiyxSXyKnWcOV/KJrHNnPgmVTHMqba14h6vjOmE8R32blfdH/mgVk2a86H7F9l580aneOdCup22moP+NsEh4YnNvHEmUFGmsdi6Y1m0XQGUnQH3NWB1GC9FosaApdKqWbEw=
Received: from DB6PR0801CA0062.eurprd08.prod.outlook.com (2603:10a6:4:2b::30)
 by DB6PR0801MB2119.eurprd08.prod.outlook.com (2603:10a6:4:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 24 Mar
 2022 13:03:33 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::4e) by DB6PR0801CA0062.outlook.office365.com
 (2603:10a6:4:2b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Thu, 24 Mar 2022 13:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 13:03:32 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Thu, 24 Mar 2022 13:03:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90cd2b0c962f0a0b
X-CR-MTA-TID: 64aa7808
Received: from af76f4f31bd1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD04ED0F-E288-409B-AF42-9DB4CE5759EA.1;
	Thu, 24 Mar 2022 13:03:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 af76f4f31bd1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Mar 2022 13:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dREMhv9nE2HKNj05KH4e5dauyKN2fqWP+wdnwvusDDtwtuQdq53tOZhfHdaIgljouop4EXTecVrRVs82+xffLefJFndWbPe+By4jjr/SgYSpjbt9+PTAfmQw7HLQbIbY2RWushWBIsgLUYexQj9ztbyFahqPvL/t6sFqmH6bS+oXLcfyvhUa6x6ra2H8m7yzE/T16B+g1s/4Zcb+8jR1oJTIOeZkXxoQPdMGTgChBotwKhApuRKoEQTDDc/hQ88oVOD4N42CbmHxhC5VG179oeG8JZPkjmFyBIccPs8gE9HIDQar8eYmq3g7iVGon8r0TjrYEvOBr73i828nGxgf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf9Zx/AuGhFI25CazesfThDhcI8nUn2jzwHvnTsXXV0=;
 b=KobAMQNdJJFKhvc1wjkyOx2lbATgC54eccHL49o/By10Y/AkbaGbraZwywjekD67Jm6cepenRNy950+j2XgOKQn6nHYwbzw0n25XhIIbo6r2G4vqO4nrs4u18o3dAzxI8P2FTtkrheub+uwaDgKRWaZfAQYS1CH9tyg6VF6xVXPo+Kzib+3cTKs2Iz+Ha5+OeSI+oTZESoAHJoEFfYshiNR7kBTvh64cY2NTo0fIFdC0vk2nPvAEcyFFwHV5SNtm8e18OttzgLCI2YyzgjbDuDiQLEYp7Vk54YkyCiH3qHcbNzsdNBCVjMJMMRuI1tp3uyD/km7C7U/b66BwMigmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf9Zx/AuGhFI25CazesfThDhcI8nUn2jzwHvnTsXXV0=;
 b=h8F6s9NVbhAM8foJ29qu3MdXnl/oD2C533Xp8tqokiyxSXyKnWcOV/KJrHNnPgmVTHMqba14h6vjOmE8R32blfdH/mgVk2a86H7F9l580aneOdCup22moP+NsEh4YnNvHEmUFGmsdi6Y1m0XQGUnQH3NWB1GC9FosaApdKqWbEw=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4556.eurprd08.prod.outlook.com (2603:10a6:10:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Thu, 24 Mar
 2022 13:03:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 13:03:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Paulo Sherring
	<pauloasherring@gmail.com>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQCAACJJAIAABfmAgAACFICAAAYkAIABGP0AgAAff4CAALS3AIAAvz+AgAA5BQCAAA/1gA==
Date: Thu, 24 Mar 2022 13:03:16 +0000
Message-ID: <6FE2E73D-4BAA-4344-8AD3-A1E70D974483@arm.com>
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
 <7ABFA491-0F02-43BD-A187-1EBD36E6DB97@arm.com>
 <7c3e09f6d8b36e7e8573384f4dac48f93f5f40ff.camel@linuxfoundation.org>
 <CADkTA4OWyu3qpbUqtjVCGAmsAaZcMMsitX+R8J_X_tSa3vY01Q@mail.gmail.com>
 <C276A488-48A1-4FB1-9B84-945F91881588@arm.com>
 <CADkTA4P-MtN55u3Jh5Q_sDFwcpHEgB_HKB=R-d3Esm-N5AXJRA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P-MtN55u3Jh5Q_sDFwcpHEgB_HKB=R-d3Esm-N5AXJRA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 51012017-dd20-49ad-63a8-08da0d96b331
x-ms-traffictypediagnostic: 
	DBBPR08MB4556:EE_|DB5EUR03FT028:EE_|DB6PR0801MB2119:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB21197ABEA2B9E2360BDCEFB09D199@DB6PR0801MB2119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3kqg1TWjMKrAmqQJ9xrN7TMKxpILiMxwqHWufsLf9s/W4f4trOWjMaRKBmrfJGdib4ofxuLynlkWoEv/KAP/U2eTsH6JUYrBZK8TVm3HGB6JMpBgPtemKOX3Hp5vFYepFd9I24enhg/DJks83QzlyCQwZKDq9JIdDFo3l8NzTeD7w0SnpZhRqTwf3OOUCemHtex4PIOutyfPi9/OXIi1RgMshrtJndS0KyFowGPFAzYS3MJamMsuE8e8YwWyHaHTJZeQwKNrpewoMo05UHmpEifmRNviaFB4yd6MHhnJdAQfKTx7buYToENX2N+ftiGPs/7KfnsMNJPc2YdbXD7HAyPhhgANm09olTJyDejova8U34DUJrnTD8Pl7XipOFAQORfCYOLUxBzpa4vXGx5coYVem8lYrDYTih7GX7TTnDkVL10SaQvrUQjCQdbi83T24MEL9Y6VnNRrGaQZ3Rb3wpWVwPZkTQR2JMHsSUr/G7F/Y9cz+SmHIMqXLVx6LZN5bRyHhynYJlh3WblYBknQbXYu0ck16NEX9vodY4li67issmD7pwwltktJ1LQ0Dm1VbXD8dfMve1Wpj9Qvs0/utuD7e00WWf9kZl+PSBP0MIVs9CKb/z+Sb3MMa9Bzw/GERoYo8UQfd+FGY+sV5kAvec1Buq7kmOcL0r3g5UzBfQjBo2LK+kWHhwUG8C+mrRgPVsJXm1TzdU77dyC/p1uhiU1qv5pGkWXS0HBdb2mssGyRZM0cRlpE/FkF8i5Rqt9SNbN2WTzmzFAeGhf/QqJedeRNqlYblfu6kDypQF2RGjgNeaWTZLoz7yLaO9GDTJAze44wERsvEsBiFPxQ9O+p8nbx2GKHEUw9M4hfz0z4W5I=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(186003)(54906003)(6916009)(83380400001)(5660300002)(316002)(86362001)(38070700005)(8936002)(71200400001)(36756003)(6486002)(966005)(6506007)(508600001)(33656002)(53546011)(122000001)(2906002)(38100700002)(26005)(91956017)(76116006)(4326008)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C9774C920BBD243B0D5166493098346@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f661348-174b-421a-e0b7-08da0d96a986
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CgUYLLVg5F7sP63OHITv0gArGCuO6Xn+7lDjFebytNKndRna5ptEde1oURrLGiZqTQFCJNY142GOzbatFeMl58zniJ2kqAX7rSSUPjHogs5g+yF2DV8NdAjga18K5BxE3UIUpNHOiNLFtLr+KdVZZzkjsVaucWnlP9FmMD0oi8h3YMGtu+4Ww5G/Gd4jSrqm1RJuBIGJonkDsPvXDe9xg7IdLnOk53od2k5py4LsCxUelSyOmwKaqi9jAVRG4Rdl5USOm3pKRTlSGE3V3UDgw+NBiV5WtxUc5t4wDxn7jTBIlVD5sr9xmcWn8NKJscabK6nPfghPA7rvxURZ34RxCqCCQ81bQWBXShlN1h6/tfp3NFLZUmoSO9PZNTz6IRopDuEqzKwROvNHRB/J3rF2gBUwWub8xMA2HMTYvoTYYFYYJdGcI6HUU3r/VuZJH43JLSJ6IlbdqnPpFaZv5rCF/TOfm9WD9F3KoJRVqWH2afcqkw9P5R5RWqyLvO3UretaJogMIT2zlJzU8p+Pk8C+E2mEuPw68KCqgTp0JwqAWIOVS58FLdk3cqA9voHzG5tbzWWGs1hMvabb7VTJGRGJFVUhjmm0YTruHeQfzhIofZeCdCRouO33aq9kBo9k/zZPDhGXkYW+UczjSrJN6eM32mX4CTTHNr8FqnpUrWU9vREaXD9rEzu2Wc3mMuKcYn40aHCypX7kJxDM+Fn8NtTqRzjnYJ83MxPwyWYYluBntsTlNZ2KPKIvA0hsfKDXgeuhXD6U6e8km7VBmwQsQy0UmBfieINvEUhfVZXFGiSgHFg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(82310400004)(336012)(6512007)(2616005)(508600001)(86362001)(966005)(6486002)(33656002)(6506007)(316002)(54906003)(5660300002)(186003)(40460700003)(70206006)(53546011)(70586007)(81166007)(8936002)(36860700001)(2906002)(4326008)(6862004)(8676002)(356005)(47076005)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 13:03:32.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51012017-dd20-49ad-63a8-08da0d96b331
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2119
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:03:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7116

SGkgQnJ1Y2UsDQoNCj4gT24gMjQgTWFyIDIwMjIsIGF0IDEzOjA2LCBCcnVjZSBBc2hmaWVsZCA8
YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gVGh1LCBN
YXIgMjQsIDIwMjIgYXQgNDo0MiBBTSBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+IHdyb3RlOg0KPiBIaSwNCj4gDQo+ID4gT24gMjMgTWFyIDIwMjIsIGF0IDIyOjE3
LCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8YnJ1Y2UuYXNoZmll
bGQ9Z21haWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+IA0K
PiA+IA0KPiA+IE9uIFdlZCwgTWFyIDIzLCAyMDIyIGF0IDY6MzAgQU0gUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+IE9uIFdlZCwg
MjAyMi0wMy0yMyBhdCAwODozOCArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4gPiA+
IEhpIFBhdWxvDQo+ID4gPiANCj4gPiA+ID4gT24gMjIgTWFyIDIwMjIsIGF0IDE2OjUyLCBQYXVs
byBTaGVycmluZyB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cGF1bG9hc2hlcnJpbmc9Z21h
aWwuY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4g
SGVsbG8gRGllZ28sIEJlcnRyYW5kLA0KPiA+ID4gPiBKdXN0IGNvbmZpcm1lZCB0aGF0IGJ5IGJy
aW5naW5nIHRoZXNlIGNoYW5nZXMgaW50byBoYXJka25vdHQsIHRoZQ0KPiA+ID4gPiBtb2R1bGVz
IGdldCBjb3JyZWN0bHkgcHJvYmVkIG9uIGJvb3R1cC4NCj4gPiA+IA0KPiA+ID4gR3JlYXQgdGhh
bmtzIGZvciB0aGUgaW5mby4NCj4gPiA+IA0KPiA+ID4gQEJydWNlOiBNYXliZSBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIGJhY2twb3J0IHRoaXMgYXMgaGFyZGtub3R0IGlzIExUUyA/DQo+ID4gPiBJ
ZiB5ZXMsIHBsZWFzZSBwaW5nIG1lIGlmIHlvdSBuZWVkIHN1cHBvcnQgdG8gZG8gaXQuDQo+ID4g
DQo+ID4gaGFyZGtub3R0IGlzIG5vdCBMVFMsIGl0IGlzIGFib3V0IHRvIGdvIEVPTC4NCj4gPiAN
Cj4gPiANCj4gPiBBZ3JlZWQuIEkgZG9uJ3QgbGlrZSB0byBsZWF2ZSB0aGluZ3MgYnJva2VuIGVp
dGhlciAuLiBidXQgd2UgcmVhbGx5IHNob3VsZG4ndCBlbmNvdXJhZ2UgcGVvcGxlIHRvIGtlZXAg
dXNpbmcgdGhlIGJyYW5jaGVzIHRoYXQgYXJlIGdvaW5nIG91dCBvZiBzdXBwb3J0LiBJZiBJIGZp
eCB0aGlzIG9uZSwgdGhlcmUgd2lsbCBiZSBvdGhlciBpc3N1ZXMgdGhhdCBhcmVuJ3QgZml4ZWQv
cGF0Y2hlZCBpbiB0aGUgZnV0dXJlIChhbmQgcG90ZW50aWFsbHkgc2VjdXJpdHkgaXNzdWVzKSAu
LiBzbyBJJ20gbGVhbmluZyB0b3dhcmRzIGxlYXZpbmcgdGhpcyBub3QgYmFja3BvcnRlZC4gDQo+
IA0KPiBUaGUgYnJhbmNoIGlzIHN0aWxsIHN1cHBvcnRlZCBhdCB0aGUgbW9tZW50IGFuZCBpcyBi
cm9rZW4uDQo+IEkgZG8gbm90IHRoaW5rIGl0IGlzIHJpZ2h0IHRvIHNheSDigJx3ZSB3aWxsIHN0
b3AgZml4aW5nIGlzc3VlcyBhIGJpdCBiZWZvcmUgdGhlIGJyYW5jaCBpcyBvdXQgb2Ygc3VwcG9y
dOKAnSBhcyB0aGlzIGlzIGVxdWl2YWxlbnQgdG8gcmVkdWNpbmcgdGhlIHN1cHBvcnQgdGltZS4N
Cj4gT3V0IG9mIHN1cHBvcnQgaXMgbW9yZSBzb21ldGhpbmcgd2hpY2ggc2hvdWxkIGJlIHdvcmtz
IGJ1dCBkb2VzIG5vdCBnZXQgYW55IHVwZGF0ZSBvciBzZWN1cml0eSBmaXhlcywgaGVyZSB3ZSBo
YXZlIHNvbWV0aGluZyBicm9rZW4gd2hpbGUgdW5kZXIgc3VwcG9ydC4NCj4gDQo+IA0KPiBCcm9r
ZW4gaXMgYSBmYXIgdG9vIGRyYW1hdGljIGRlc2NyaXB0aW9uIG9mIHRoaXMgaXNzdWUuIA0KPiAN
Cj4gQWxzbywgd2hlbiB0YWxraW5nIGFib3V0IHN1cHBvcnQsIHdlIGFyZSB0YWxraW5nIGFib3V0
IE9FY29yZSAvIFlvY3RvIFByb2plY3Qgc3VwcG9ydC4gVGhlIHJlc3Qgb2YgdGhlIGxheWVycyBp
biB0aGUgZWNvc3lzdGVtIGRvIHRoaXMgc29ydCBvZiBzdXBwb3J0IGFzIGJlc3QgZWZmb3J0LiBT
byBhIGdlbnRsZSByZW1pbmRlciB0aGF0IHdlIHNob3VsZCBhbGwgYmUgY2FyZWZ1bCB3aXRoIGV4
cGVjdGF0aW9ucyBhbmQgdGhlIHRvbmUgb2Ygb3VyIGNvbW11bmljYXRpb25zLg0KPiANCg0KU29y
cnkgaWYgbXkgdG9uZSBkaWQgbm90IHNvdW5kIHJpZ2h0LCB0aGF0IHdhcyBub3QgbXkgaW50ZW50
aW9uLg0KSSBqdXN0IHdhbnRlZCB0byB1bmRlcnN0YW5kIHdoYXQgd2Ugc2hvdWxkIGV4cGVjdCBh
bmQgaGVuY2Ugd2hhdCB3ZSBzaG91bGQgZG8gaW4gc3RhYmxlIGJyYW5jaGVzLg0KDQo+ICANCj4g
QW55d2F5IHRoZSBmaXggaXMgc2ltcGxlIGFuZCB0aGUgcGVyc29uIGlzIHVuYmxvY2tlZCBzbyBp
dCB3aWxsIGJlIGVhc3kgZm9yIHRoZSBuZXh0IG9uZSB0byBzb2x2ZSBpdCwgc28gbXkgYXJndW1l
bnRhdGlvbiBpcyBtb3JlIGluIGdlbmVyYWwgYXJvdW5kIHdoYXQgc2hvdWxkIHRoZSBlbmQgb2Yg
c3VwcG9ydCBkYXRlIG1lYW4gZm9yIHVzZXJzLg0KPiANCj4gSSBoYXZlIHF1ZXVlZCB0aGUgY2hh
bmdlLCBidXQgbXkgcmVtaW5kZXIgYWJvdXQgZXhwZWN0YXRpb25zIHN0YW5kcy4NCg0KVGhhbmtz
Lg0KDQpJIHRoaW5rIHRoYXQgd291bGQgYmUgZ29vZCB0byBiZSBjbGVhciBvbiB3aGF0IGNhbiBi
ZSBleHBlY3RlZCBpbiBhIHN0YWJsZSBicmFuY2ggYWZ0ZXIgdGhlIHJlbGVhc2UgZm9yIG1ldGEt
dmlydHVhbGl6YXRpb24uDQpUaGF0IGNvdWxkIGFsc28gaGVscCBtZSB0byBrbm93IHdoYXQgSSBz
aG91bGQgY29uc2lkZXIgY3JpdGljYWwgb3JuYXRlIGFuZCBmaXggaW4gc3RhYmxlIHJlbGVhc2Vz
Lg0KDQpLaW5kIHJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+IEJydWNlDQo+IA0KPiAgDQo+IA0K
PiBDaGVlcnMNCj4gQmVydHJhbmQNCj4gDQo+ID4gDQo+ID4gQnJ1Y2UNCj4gPiANCj4gPiAgDQo+
ID4gaHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9SZWxlYXNlcw0KPiA+IA0KPiA+
IENoZWVycywNCj4gPiANCj4gPiBSaWNoYXJkDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gLS0gDQo+
ID4gLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFu
ZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZA0KPiA+IC0gIlVzZSB0aGUgZm9yY2UgSGFy
cnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo+ID4gDQo+ID4gDQo+ID4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzcxMTIpOiBodHRwczovL2xpc3Rz
LnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL21lc3NhZ2UvNzExMg0KPiA+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzg5OTQ5
MDEzLzM2MTkwODkNCj4gPiBHcm91cCBPd25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitvd25lckBs
aXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWIgW2JlcnRyYW5kLm1hcnF1
aXNAYXJtLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCj4gDQo+IA0KPiAt
LSANCj4gLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9z
IGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZA0KPiAtICJVc2UgdGhlIGZvcmNlIEhh
cnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KDQo=

