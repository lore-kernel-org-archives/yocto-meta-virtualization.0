Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 08:42:25 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.86])
 by mx.groups.io with SMTP id smtpd.web09.8390.1648111343681534743
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 01:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=0ssFTTEd;
 spf=pass (domain: arm.com, ip: 40.107.4.86,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsSqyn+2DdiLiLXuP8mLQCD3sxb2ndZypmiO79W3le0=;
 b=0ssFTTEdYldUt2d8fU/LSNCXE/XB0br1BZ7wBPvglih/uZ7/vwBjuQKM2K1sjPo/gbeqpi3Xx/dJxbXU1Ih9Y7hmZFHk+bS/RMGYnfCTn+i3vvR856wb9POfR90OUND09tQJEuYVcfTdde4xPn0EjjxtKy9Yb+jNtJPk70Ky1vM=
Received: from AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) by AM0PR08MB3377.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 24 Mar
 2022 08:42:19 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::2a) by AM5PR0602CA0016.outlook.office365.com
 (2603:10a6:203:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 08:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 08:42:18 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Thu, 24 Mar 2022 08:42:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11ee31584a4e7a40
X-CR-MTA-TID: 64aa7808
Received: from 3e2853e166e0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 003B6DD0-09BF-4977-ABF9-76EFBDA2BDA1.1;
	Thu, 24 Mar 2022 08:42:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3e2853e166e0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Mar 2022 08:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAbb8YIdPiIEg5KF820UAjxvLkwi4DfXWdJcSqgXcNe5eRvJzi4U8cE1oV5CU4I9cb2+114XGCpQQj6phmC569kK9y+vXg2utMoX7iGEr6WDOQTFG5kY++Gzp16Pk3HiaUX7LfhiSrivciR2a35ryegrJP14O534THfYBjjYL411FICT25QanZ7x/KuGhySLaBWky/uaQq7iTv5wV8KxG1AzsvrDq6Jfh9c/QqB87rzt7yMc95fQ0ovB/RLTX5rE1NvJJhOUH2i1A5npRNtD+5qLXqfmxMzV+YiD8BrxFA5Hvcz2kRGzcCKe0OF852Y67baZXtgMKlV1tAFGFhrjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsSqyn+2DdiLiLXuP8mLQCD3sxb2ndZypmiO79W3le0=;
 b=B2WMHszLTY3TVU/MiIiAh+UQe8aDDqanCNgf+xlWGqnN9La0HvS/8eol4Id+EnOpFLhgHKU1GFjf5vW1oFncB/oapJQ2atSWO9FFKNHajmgnB8iBdvDUr8uwGh8Rkx2DhaPssp73u+KfK3Hs6kcXLeHzzE4IKcrHT+5NLBvQrLPaybwr+lhx7TNMsxr75GlEwWwIUdjg28p4ya7D5uCeP2umn+VEhpfisKdFV7YwL12dkd4LkYm8cyWfr4gq3qLEeasKquRPt7qmLbWp4YNdI61uIr+zbsgN7O9he23y8eokgZNWXStoO/SHDdEpupkPE0/U7qI0I38Exbm+85FMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsSqyn+2DdiLiLXuP8mLQCD3sxb2ndZypmiO79W3le0=;
 b=0ssFTTEdYldUt2d8fU/LSNCXE/XB0br1BZ7wBPvglih/uZ7/vwBjuQKM2K1sjPo/gbeqpi3Xx/dJxbXU1Ih9Y7hmZFHk+bS/RMGYnfCTn+i3vvR856wb9POfR90OUND09tQJEuYVcfTdde4xPn0EjjxtKy9Yb+jNtJPk70Ky1vM=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6912.eurprd08.prod.outlook.com (2603:10a6:102:137::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 08:42:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:42:03 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Paulo Sherring
	<pauloasherring@gmail.com>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: 
 AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQCAACJJAIAABfmAgAACFICAAAYkAIABGP0AgAAff4CAALS3AIAAvz+A
Date: Thu, 24 Mar 2022 08:42:03 +0000
Message-ID: <C276A488-48A1-4FB1-9B84-945F91881588@arm.com>
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
In-Reply-To: 
 <CADkTA4OWyu3qpbUqtjVCGAmsAaZcMMsitX+R8J_X_tSa3vY01Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7b2bf4eb-0f1a-420f-8c6b-08da0d7234a1
x-ms-traffictypediagnostic: 
	PAXPR08MB6912:EE_|AM5EUR03FT051:EE_|AM0PR08MB3377:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3377D9099DC06184234F63E09D199@AM0PR08MB3377.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nZvzs2G4lCiB4kvqeqkoNgE/kLXNMisO4ouDIYlhDHWq6LhLwVtYicVZ6KzAxNz8hVBaxBPJspF3M6n7GJMM1hrSZCQrz0zYJuJ6pOi+Xcu2TTQTkIHVBmJuZzE82r5texXHgafZMJ1y9b5kdubGBMzyxOK5TjqQ1uQVX2x6Gat0kuEbAT0jQUmWCnesguIz22dDDIyIAzFwowx4pT1YSfGmCnwyu8I4yiXxyGNAZpgN998LoHElgE13vWT4O82lNMbSxLgu0f4V7iLPQjPzDQbogf5GTnJ5Xwo/BmfcZseWdBo2/Ad6JBrw38Q/onD3cupCA+FUn7jJKiRwFp8XhP2WfixX7tg3m/uAv8XBE0ozEUW96zDzVWlFMFl+mlfRx3XUtugqU2c3i/jC4wD/bkNOuLO1bKmeHHEV1bfztFeO7Lz6aeC9aiB92ZaPcpsV5QO7+xLl8vCXYQ00dUAqPwv1rIioLGHTfeDlG7KeIj67fpJ5n6l64tyhkwyOayTax1/jn4Pv4piagYrVqUGQasIQ96iGH2WhhfRFBvljSHGzoPh7ENM4j8xUj1j/qJq0iZ6YgAiTPu3X5OZiwcWrGTUG/Yj8TJupsCmb7QpApVLScoZuiEzFI7OfKD0x867IsjeS4l8wcVmbFSY/vqVVZgGOQ+YggINEffqbjwjhbAxIET0c1vofX8PVWr8T/85U82IihRlJfhEs5uSfmOnaX05NHxt23R5PEh58i+H314OeatzN0XGDVNGzbrRho6kgRE+bFHVhQxeDOyvmfbb6wTGU6nLejsLAjrEDdZjacwS5WdHVS/xf4ix5c3hrVlvEtpD9BU0Ptf62aTWMzxIBWyb0a4l7iNEMRZWQFaRJL2Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(2616005)(83380400001)(33656002)(6486002)(966005)(6512007)(53546011)(36756003)(186003)(26005)(508600001)(71200400001)(316002)(8936002)(38100700002)(54906003)(86362001)(6916009)(91956017)(4326008)(8676002)(76116006)(64756008)(66476007)(5660300002)(38070700005)(66556008)(66946007)(66446008)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6AC8D035362D04B938DEBA0A2AEE44E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6912
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	120100e6-8786-4a50-9d85-08da0d722bdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZjNl1Pq2COj1BzQ1RYl265stAjXPl9IzJgKaf0UZbmRdYqCRhBxSDL4G8LHbb9wA/ZfsJ5m/oo8GrvdsM/6RAL/ktS+REzMA1xPP/eoWsTYstAFvRN4BchVmbXwrvPT/St708lyFgAdFBbJaLwqsl8yzN7vUpNCKIiXNvZ/l1IAiQ/lwB7VAlCvIJ0QuVxXhWQPKOVTAtqcxH+jMX0Sa2voi0cc2F2Td/kUsnYXTppPS7LlTTj14cZq0a9PuE7Y8auLvZyzzDa5QvjF7Xcdtd8Q0ri4ASfbaP8NcZ/a0YJ/2/1dYyypxKYMb82iNQn2NdiTAkrBmQq4JCJhD4LD4FKkNjx3ATL4zZodyG9RKeSXkSNz3hvU9bPbRoz00PmtXawg0MX8n2qESMggefu3v+wXxNPvASG22N/+jbgkFaltrxDdZdnxNYt20gpWOLzDZYE44N5KrVyMfqmIGycVBVWMZE1uc9GMYZ3KgU6N0RB1tOirvbVBF3y8BNaAJYbi1Eoh9O97wowzi3mOEJVhRUsnXJXeCQq7rln42cGHDmE5s/eUEXuhbIZi1epWBmY16Nm3s+918HKjkJN8xGbaEkcIRvnbnP1gQwgRe7WRwU9eRPEsmtZfbCryNBZkbB2YQ+sKzMZ7BK0rgZvBsvOazCldbC/9PW+N7cHqbuP1KqCfsUqb7wP3sFOxKy0mrab1Zte9Y/iZcgBWoFnJ5e6KOpHoQPIP6EVzRw5vEDWhsrgWKB/pAL2a6enJP0RpL/91ZVLNcehTah/Gp5n/tvNRTarF3W91P6Y0LtWjcNLIN65E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(33656002)(36860700001)(26005)(70586007)(86362001)(54906003)(36756003)(5660300002)(8936002)(40460700003)(47076005)(2906002)(336012)(508600001)(83380400001)(4326008)(6862004)(8676002)(70206006)(81166007)(82310400004)(186003)(6506007)(6512007)(6486002)(316002)(356005)(53546011)(966005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 08:42:18.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b2bf4eb-0f1a-420f-8c6b-08da0d7234a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3377
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Mar 2022 08:42:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7113

SGksDQoNCj4gT24gMjMgTWFyIDIwMjIsIGF0IDIyOjE3LCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiBXZWQsIE1hciAyMywgMjAyMiBh
dCA2OjMwIEFNIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPiB3cm90ZToNCj4gT24gV2VkLCAyMDIyLTAzLTIzIGF0IDA4OjM4ICswMDAwLCBCZXJ0cmFu
ZCBNYXJxdWlzIHdyb3RlOg0KPiA+IEhpIFBhdWxvDQo+ID4gDQo+ID4gPiBPbiAyMiBNYXIgMjAy
MiwgYXQgMTY6NTIsIFBhdWxvIFNoZXJyaW5nIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxw
YXVsb2FzaGVycmluZz1nbWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+
ID4gPiANCj4gPiA+IEhlbGxvIERpZWdvLCBCZXJ0cmFuZCwNCj4gPiA+IEp1c3QgY29uZmlybWVk
IHRoYXQgYnkgYnJpbmdpbmcgdGhlc2UgY2hhbmdlcyBpbnRvIGhhcmRrbm90dCwgdGhlDQo+ID4g
PiBtb2R1bGVzIGdldCBjb3JyZWN0bHkgcHJvYmVkIG9uIGJvb3R1cC4NCj4gPiANCj4gPiBHcmVh
dCB0aGFua3MgZm9yIHRoZSBpbmZvLg0KPiA+IA0KPiA+IEBCcnVjZTogTWF5YmUgaXQgd291bGQg
bWFrZSBzZW5zZSB0byBiYWNrcG9ydCB0aGlzIGFzIGhhcmRrbm90dCBpcyBMVFMgPw0KPiA+IElm
IHllcywgcGxlYXNlIHBpbmcgbWUgaWYgeW91IG5lZWQgc3VwcG9ydCB0byBkbyBpdC4NCj4gDQo+
IGhhcmRrbm90dCBpcyBub3QgTFRTLCBpdCBpcyBhYm91dCB0byBnbyBFT0wuDQo+IA0KPiANCj4g
QWdyZWVkLiBJIGRvbid0IGxpa2UgdG8gbGVhdmUgdGhpbmdzIGJyb2tlbiBlaXRoZXIgLi4gYnV0
IHdlIHJlYWxseSBzaG91bGRuJ3QgZW5jb3VyYWdlIHBlb3BsZSB0byBrZWVwIHVzaW5nIHRoZSBi
cmFuY2hlcyB0aGF0IGFyZSBnb2luZyBvdXQgb2Ygc3VwcG9ydC4gSWYgSSBmaXggdGhpcyBvbmUs
IHRoZXJlIHdpbGwgYmUgb3RoZXIgaXNzdWVzIHRoYXQgYXJlbid0IGZpeGVkL3BhdGNoZWQgaW4g
dGhlIGZ1dHVyZSAoYW5kIHBvdGVudGlhbGx5IHNlY3VyaXR5IGlzc3VlcykgLi4gc28gSSdtIGxl
YW5pbmcgdG93YXJkcyBsZWF2aW5nIHRoaXMgbm90IGJhY2twb3J0ZWQuIA0KDQpUaGUgYnJhbmNo
IGlzIHN0aWxsIHN1cHBvcnRlZCBhdCB0aGUgbW9tZW50IGFuZCBpcyBicm9rZW4uDQpJIGRvIG5v
dCB0aGluayBpdCBpcyByaWdodCB0byBzYXkg4oCcd2Ugd2lsbCBzdG9wIGZpeGluZyBpc3N1ZXMg
YSBiaXQgYmVmb3JlIHRoZSBicmFuY2ggaXMgb3V0IG9mIHN1cHBvcnTigJ0gYXMgdGhpcyBpcyBl
cXVpdmFsZW50IHRvIHJlZHVjaW5nIHRoZSBzdXBwb3J0IHRpbWUuDQpPdXQgb2Ygc3VwcG9ydCBp
cyBtb3JlIHNvbWV0aGluZyB3aGljaCBzaG91bGQgYmUgd29ya3MgYnV0IGRvZXMgbm90IGdldCBh
bnkgdXBkYXRlIG9yIHNlY3VyaXR5IGZpeGVzLCBoZXJlIHdlIGhhdmUgc29tZXRoaW5nIGJyb2tl
biB3aGlsZSB1bmRlciBzdXBwb3J0Lg0KDQpBbnl3YXkgdGhlIGZpeCBpcyBzaW1wbGUgYW5kIHRo
ZSBwZXJzb24gaXMgdW5ibG9ja2VkIHNvIGl0IHdpbGwgYmUgZWFzeSBmb3IgdGhlIG5leHQgb25l
IHRvIHNvbHZlIGl0LCBzbyBteSBhcmd1bWVudGF0aW9uIGlzIG1vcmUgaW4gZ2VuZXJhbCBhcm91
bmQgd2hhdCBzaG91bGQgdGhlIGVuZCBvZiBzdXBwb3J0IGRhdGUgbWVhbiBmb3IgdXNlcnMuDQoN
CkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQnJ1Y2UNCj4gDQo+ICANCj4gaHR0cHM6Ly93aWtp
LnlvY3RvcHJvamVjdC5vcmcvd2lraS9SZWxlYXNlcw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmlj
aGFyZA0KPiANCj4gDQo+IA0KPiAtLSANCj4gLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5V
TEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZA0K
PiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KPiANCj4g
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzcxMTIpOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL21lc3Nh
Z2UvNzExMg0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9tdC84OTk0OTAxMy8zNjE5MDg5DQo+IEdyb3VwIE93bmVyOiBtZXRhLXZpcnR1YWxpemF0aW9u
K293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWIgW2JlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCg0K

