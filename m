Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.52])
 by mx.groups.io with SMTP id smtpd.web12.4633.1624608712206788378
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 01:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PCBLdeNy;
 spf=pass (domain: arm.com, ip: 40.107.13.52, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLIysbA3CoeGDWlVSTQmXL4pukGAERuQSq4ob9uD++E=;
 b=PCBLdeNyT3cMQnqWPHh2jAsJLsaJUdoln8L3fNwtQltK1oxMiwjF4HTGuUCnBrJVqzL9BXhZdZVYz9Xu1OcsOcg/bzoYzBzVgZu7ANbIip5nLP9eVlZR9rn+fnquVjCKwkrLUcp0kCqy4kkGRxJW6dWnXjhOHlhUqA4lEwuT7So=
Received: from PR3P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::23)
 by AM4PR0802MB2211.eurprd08.prod.outlook.com (2603:10a6:200:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 08:11:46 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:56:cafe::62) by PR3P192CA0018.outlook.office365.com
 (2603:10a6:102:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Fri, 25 Jun 2021 08:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 08:11:46 +0000
Received: ("Tessian outbound 7799c3c2ab28:v96"); Fri, 25 Jun 2021 08:11:45 +0000
X-CR-MTA-TID: 64aa7808
Received: from 0b2e7b0ca64d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 226F826A-8861-4204-A59D-4F7C7B126902.1;
	Fri, 25 Jun 2021 08:11:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b2e7b0ca64d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Jun 2021 08:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jriSiKn1t4Zhfd4+66f2XKjZiyp9+PxkcDqZ7kAmir6atsw5qI8o+ygQ3kI2aXN2DojyxOH9CF115m7iNsYIzyi7JGSyhroDDBPFYq5+1Hfl5aM/ZGgLMVPtqfLswyWUhBYnFjtDxdc40GtTy2Qmw/lGcSBc9XnvGQI+JgCCcjwJK6UN+5RYAusjgmwEf70cEDgEmJWYvefzv+R7V1T681UjqZglUPOwcfeBHSRc3+z/QHKXHGH6egtWYqS2BUqCQxNnX/ItImWPnF2Vb/Iw4iqzx4Mhi6Iy2R9R609n2q04tgYUqrVa0suwBchd+kkxVEPWzNolvA4g57xuqno98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLIysbA3CoeGDWlVSTQmXL4pukGAERuQSq4ob9uD++E=;
 b=cQMqmdLsV7UMj9DkEJpU1ThckWFG9/u1AAMGKUzqNJ7AM1Luj8z+mOH56XiVaFpFHZghZKqI8eLkwFlWbj+D4ruY4eiWEIgTJcHo2K+aFNe+/gbieHbju61aLkAjXXYTPBLe/L+9QKKAnUsfABv4f5tUBXOIzOjDGsiF/GEvFk20eAtZukDWRNluImvJe9mqJ+blIYZDrPEmwPhp+C78NZJNEl5YwX78x0G/Vc5iGDoRkgoDV2EA8tL9X+2Rn+cNbLaef8goTEWiyemWFQFhV1no0ZLTkL7xUWvo1jFCN56BACaioXei/bK+l5c24U00OCrN9BCL6AUx+h6tbtDgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLIysbA3CoeGDWlVSTQmXL4pukGAERuQSq4ob9uD++E=;
 b=PCBLdeNyT3cMQnqWPHh2jAsJLsaJUdoln8L3fNwtQltK1oxMiwjF4HTGuUCnBrJVqzL9BXhZdZVYz9Xu1OcsOcg/bzoYzBzVgZu7ANbIip5nLP9eVlZR9rn+fnquVjCKwkrLUcp0kCqy4kkGRxJW6dWnXjhOHlhUqA4lEwuT7So=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3877.eurprd08.prod.outlook.com (2603:10a6:20b:88::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 08:11:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.023; Fri, 25 Jun 2021
 08:11:37 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
Thread-Topic: [meta-virtualization][PATCH 1/3] podman: Add seccomp as
 REQUIRED_DISTRO_FEATURES
Thread-Index: AQHXaSsa5nUxR56n002bKJlCKIRywKsjkHMAgAAVeACAAGEZAIAAWbOg
Date: Fri, 25 Jun 2021 08:11:37 +0000
Message-ID: 
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 0922299A6C989741830F6399C7F4C142.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2.216.97.69]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5468dca9-15d9-46de-b25d-08d937b0dffe
x-ms-traffictypediagnostic: AM6PR08MB3877:|AM4PR0802MB2211:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2211AA77302E3736E705139392069@AM4PR0802MB2211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Df/XwVG3X3yI6Ra+SBesukSgup65nMAaPfLN4WuM3vFQ/ZaKM6bJ2KMvEfPQJ4EMuMUC9xd25GIHevfwbYD3uO2CbdCTS9mlcHRYNA4s5rVcDJ6EFb7zL6SrnM17shJ1WZdBbFZKrAmR7gkCJz4eGRK2YgYyf3T75g1WaCVznAjGnyx3EviW62EC3pbhm2u0VlPEgkIRKPlCFLr9FSQoUvHgxoqUj5QexJkitOt+9+MiqAhUCUtHSp7G4/JWoQcD6D0CfTmk/xUITPPir1WXtUH2/d/lR4UrI2+9JCXvhrPZ9bWzdHCY456ncSMdBSvZKXUI6LS4aFW5bVlSWRTepHIJa0jJahnLLxV3bZXOD/USeQlYy7osrDbLtOQ0pCUobGg9iqBaEu+UEOZOnCmpBMzXzettluMeyN1bzsIptZPZtq7SqfChX4uDcf7K73jwNtFUdSc9VjgttM/FGgLu6Hv6OVUMDxc6qGbsxVyfoFEBZZn7TIfpQv9MU3cPPAJYuwAwwCEj0kCq6nk+FvDo6IOSQoiFBf9B29j2cT9aVRlncN5asnilJEBpRoourNRbIC7uAJsGnVp/W15cd8LzkJZ3JFVR/GXZ0MtHAu6GtsQ9rXAgq1hqCbDI7aw6cVeLTMadxkButdHM3aGhrL7aYvMbe5DbrrtgX4GayRCKnARMOjaOdanriGNtVB6tagEQqD8b9829gbCeSB5ivWFZx+jNvp2qw8wmcZA6w9H2T1rYPtTlrFnQu+EhcTQ4FiT71d8hTHGnpXlttV1sh713iw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(5660300002)(9686003)(8936002)(8676002)(64756008)(66556008)(66476007)(110136005)(966005)(55016002)(76116006)(66446008)(66946007)(52536014)(86362001)(478600001)(83380400001)(7696005)(6506007)(54906003)(53546011)(186003)(26005)(316002)(4326008)(38100700002)(71200400001)(122000001)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVZjcS9iRVRFSWlERTJURm9tR1BYN0h4VURmbWsrL3BaZXRrU2Z6YnBFS0pa?=
 =?utf-8?B?N2FDTDFlcUhFR1N3c0U4emlrWVVwOFlQbG0vRnpMa3dXZEttWGxBUEwvM1lX?=
 =?utf-8?B?Y3psd0FqNHJrUmZRalRiQUtXMGtncTN0bFdCZjFIWG9UZVB3OUtDL3VoSFVa?=
 =?utf-8?B?R1hUbm9DSk45UkVXc1Nwa3lHNUlxTXJMRTBIS1RkVEdvd2M3TmltNWxzMFg1?=
 =?utf-8?B?QTFJb3pRVVpkR0ozT3hsQWNDUkZxU0FXcElWQXFmbkNSVVhFcVMzb2lOMnFi?=
 =?utf-8?B?RkExOE5IdEZ0SEFEQmtwSVIrR1E5Z0xCQmV4TUpTZDM3TEFYdU5CZDI4UTh4?=
 =?utf-8?B?Z1RIWCtXbmx1OExHYVZxUjVrUUludHhuVXJXaEV6VkFOOFB1ZmVZcVJMVDBn?=
 =?utf-8?B?Si9VVEdJSVI1eHh6UXhFVEtkeC9acWxleW9yeFFDQzlvYklDNTRKRW9KbnpR?=
 =?utf-8?B?K1RHOVVPWkdqYnNLQjhFU2Q4S2JjNGZ3SE5zU3VKNEJpYnJQOUZtT25ac3hF?=
 =?utf-8?B?MXRXTTRYTGljd0xIeVFrL2E5bEYrNktubVh5SjEzdU1pWHdBeW5BYldzSHVp?=
 =?utf-8?B?cWxvWHFTS1FJcStEWndXWlNLOTRudm1pZlM4Yi9rOGcvSUZXWXlVakMvM0NL?=
 =?utf-8?B?TEFrc1pCeFovOFlpWnIrd0xaSVVLdDhKM3VNZTdFZ2d5UFNoNmhqQTNEa2kx?=
 =?utf-8?B?L2p2WUlFOSttU2pZWElRZzY5dkgrbVpicnpQam5scEpNdE9DTWFsc0FoblU1?=
 =?utf-8?B?U0VVVlBqNUZFSkpuNDcyV1dSV1ZIQS85K1Q1RUhyTFB5ZW1jVk0wbU9CZW5k?=
 =?utf-8?B?LzFINFFiSC9YaWNudG5LY2plRGg3MTVCVWRJbDdCYTZnVmJPanV1ZEgzeUlq?=
 =?utf-8?B?SzAwT01ydXpaVmN6b3lnb05xdDk5dnVneTZFUkJoL3NIR2M1Sno5SU5WMFR3?=
 =?utf-8?B?MEpEdkVSWmV3WHlHVjhWRk8ydXEzc01XUUp1WUVmMG9KU052MVg4U2ZmWDRU?=
 =?utf-8?B?Z29LMHdmeWVlR3pyR1E0aVdiUzdvOGl1b08vNzBDVUZqdXc3SmpLRTF0MG8w?=
 =?utf-8?B?N3ErS3dmYVhlQk11MGF5NFh3TU5lbm45TTNUamZhYmlUSCsvM1ZlNExiM2xa?=
 =?utf-8?B?R1VHOHRQSmxmM2tLL2EzOE5RWjQyT1ZtT1hDejV4Mm9kWEVSdkZLYzNEZnVR?=
 =?utf-8?B?cDVWNGZ1SDNPV1F5UzdFYUFlSjV2U05JTFdOSUxvVlZ2Z0tuUjMwUFJCSHFQ?=
 =?utf-8?B?aklGVUY3OVAzUjQxeDVrWG9sUVVJMzRqUndNd1FCZHFtSlBtem1DVWsrVi93?=
 =?utf-8?B?M2d2RFFVQ21ZVFBEUUFPbVRnRldpbE44YzdzZjl1VjFtQXFTeVdFMldNZHdq?=
 =?utf-8?B?MkxPbGU2YW8yVU9XRVQ4N3Jla3RONkhDd3ZmSCtvQ296SlN5bVg5TFlXbm9B?=
 =?utf-8?B?R1NYeVBmRGt2dHNmcWtNWWFKWkdhR1BXMUgvUkllWGhpUENNWkQwZFgwT2Nq?=
 =?utf-8?B?c25NVi9xQmQ2eFV6TzA4SnVPR1pJOEEyMGprK25PanJSUkV6bWJ2clliWGZa?=
 =?utf-8?B?L0ZncHFRQjlOU3BsTzlqQXVzQmRjTHFtbzRIWVozYWwwdHBueXB5NzBuU0Z6?=
 =?utf-8?B?YzFSMXpZcnIweDIzb050R1pjTDM5ZitzWDNuQ2kxcUtHOHM2T0htU1BUcXJa?=
 =?utf-8?B?RS8xdXR1SE9GNFVFTmpnVUE4T0hLOWVrUjR4c0pUdnB4ZE4wbWVrTXB2Nitq?=
 =?utf-8?Q?or7MAxfNiikuAWx7z8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3877
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbaaa7bc-71d8-4c78-5ddf-08d937b0db0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mchtf66O1tpL02O0oMfqvDVJGb3ZP9BLYdx9EjjKARXZsi6g/w3VRDPjBGQRFZNt6+c0mn2iOVBQTYMHQG+mwN9v0t5blvfgZ0z5FlEi5rArsH8AhiHyaP9tzCQ08j33jL3I9J6SXwmBSMeO51qFQEkyoIHASolwW7wE0+XYstMMGAOL4VmwRM7sE9tRcxvQidUwKuo/9Kk6LePQ0aQUBAuo2BvhYRCvrFQxg5ZGqDDpTNlZY0V+aY0lqpBc9ecn14Vv6OuvyBG/EBfA1MvmoOMZTKbxnFxhlMqIsVZtMn/d4ryGlyG0/tltipKrN2TshErsBIh8ZRaizBG/ABbj/mMHtv+KWhJaAKW9GqQVw6xj/UhH4EjyrbT2iVlACI9f3S/PiMgM+TZvj55hwDm29qMFcWIBrSp2xWbjKrGQ/uxPAEpgY/dJEpm0f3WZKLC1jvjQi3rUaDCGa+/kkruMXhIMsvjJZFZ4BDG4BjyMN/QXHYGJYi4skur4R6sy+I+PpoUrUgAxnhClNhsAIdU5dwRmc7xep6AM3zWQ60sbott13jM5hm9tvRIRM/UNr7nr8vDQqXDTVdcDn3aunBoZN2Ji4R788Q23LE2Ld1fCxKWNis8bHvSMTWEL/mFVUzWpi/TDEJWyx4kZk14w7gErCCBZsygkRVutTVW2ug9RKyNDTTEyEqJC71hnaWXjotKxrv44zFE6oQvDNzZtxrQCnAhKasjHlMMe65TCGa9P6vRKADVpsfxlsmCOZFz0ZmlPjtWtCrFHIPFlmmYZfCR/NSDqNBORERlFpkx51C/0PkLmbgEHh4X2gVNgOu5LuXKK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(46966006)(36840700001)(7696005)(478600001)(5660300002)(82740400003)(70586007)(70206006)(54906003)(9686003)(966005)(316002)(55016002)(33656002)(6506007)(53546011)(110136005)(8676002)(26005)(8936002)(4326008)(336012)(36860700001)(82310400003)(52536014)(186003)(86362001)(47076005)(356005)(83380400001)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 08:11:46.0199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5468dca9-15d9-46de-b25d-08d937b0dffe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2211
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNl
LmFzaGZpZWxkQGdtYWlsLmNvbT4NCj5TZW50OiAyNSBKdW5lIDIwMjEgMDM6NDkNCj5UbzogTWFy
dGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPg0KPkNjOiBEaWVnbyBTdWVpcm8gPERp
ZWdvLlN1ZWlyb0Bhcm0uY29tPjsgbWV0YS0NCj52aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3By
b2plY3Qub3JnOyBuZCA8bmRAYXJtLmNvbT4NCj5TdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6
YXRpb25dW1BBVENIIDEvM10gcG9kbWFuOiBBZGQgc2VjY29tcCBhcw0KPlJFUVVJUkVEX0RJU1RS
T19GRUFUVVJFUw0KPg0KPk9uIFRodSwgSnVuIDI0LCAyMDIxIGF0IDU6MDEgUE0gTWFydGluIEph
bnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPg0KPndyb3RlOg0KPj4NCj4+IFRoaXMgY2hhbmdl
IGlzIGNvcnJlY3QsIGxpYnNlY2NvbXAgc3RpbGwgcmVxdWlyZXMgc2VjY29tcCBpbg0KPkRJU1RS
T19GRUFUVVJFUywgc28gYW55dGhpbmcgZGVwZW5kaW5nIG9uIGl0IHNob3VsZCBoYXZlIHRoZSBz
YW1lDQo+cmVzdHJpY3Rpb24uDQo+Pg0KPg0KPlJpZ2h0LCBJIHVuZGVyc3RhbmQgaG93L3doeSBp
dCB3b3JrcyBsaWtlIHRoaXMgLi4gYnV0IGl0IGlzIHN1cGVyIGNsdW5reSB3aGVuIHdlDQo+Y2Fu
J3QganVzdCBkZXBlbmQgb24gc29tZXRoaW5nIHRoYXQgaXMgbm93IGluIGNvcmUsIHdpdGhvdXQg
bmVlZGluZyB0bw0KPnNwcmlua2xlIGRpc3RybyBjaGVja3MgZXZlcnl3aGVyZS4NCj4NCj5BcyB0
aGUgbGlzdCBvZiByZWNpcGVzIGdldHMgbGFyZ2VyIHdpdGggdGhhdCBjaGVjaywgaXQgcmVhbGx5
IGlzbid0IGFuIG9wdGlvbmFsIGRpc3Rybw0KPmZlYXR1cmUgZm9yIHVzaW5nIG1ldGEgdmlydCBh
dCBhbGwsIGFuZCBpdCB3b3VsZCBiZSBuaWNlIGlmIHdlIGNvdWxkIGp1c3QgZG8gdGhlDQo+Y2hl
Y2sgb25jZSBhbmQgYmUgZG9uZSB3aXRoIGl0Lg0KDQpKdXN0IGEgc2lkZSBub3RlIHRoYXQgdGhl
c2UgcGF0Y2hlcyBmaXggaXNzdWVzIHdpdGggeW9jdG8tY2hlY2stbGF5ZXIuDQoNCkRpZWdvDQoN
Cj4NCj5CcnVjZQ0KPg0KPj4gc2VjY29tcCBpcyBub3cgaW4gZGVmYXVsdCBESVNUUk9fRkVBVFVS
RVMsIGJ1dCBub3QgdGhyb3VnaCBCQUNLRklMTA0KPmZlYXR1cmUsIHNvIG1hbnkgZXhpc3Rpbmcg
RElTVFJPcyBkaWRuJ3QgZ2V0IGl0IGF1dG9tYXRpY2FsbHkgYWRkZWQgYW5kDQo+cmVxdWlyaW5n
IGl0IGlzIHRoZSByaWdodCB3YXkgdG8gYXV0b21hdGljYWxseSBza2lwIHN1Y2ggcmVjaXBlcy4N
Cj4+DQo+PiBPbiBUaHUsIEp1biAyNCwgMjAyMSBhdCAxMjo0NSBQTSBCcnVjZSBBc2hmaWVsZA0K
PjxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gV2hhdCBicmFuY2gg
YXJlIHlvdSB3b3JraW5nIHdpdGggPw0KPj4+DQo+Pj4gTm93IHRoYXQgc2VjY29tcCBpcyBpbiBj
b3JlLCB3ZSBubyBsb25nZXIgaGF2ZSB0aG9zZSByZXN0cmljdGlvbnMsIHNvDQo+Pj4gSSBhc3N1
bWUgdGhpcyBpcyBvbiBhbiBvbGRlciBicmFuY2ggPw0KPj4+DQo+Pj4gQnJ1Y2UNCj4+Pg0KPj4+
IE9uIFRodSwgSnVuIDI0LCAyMDIxIGF0IDM6MDAgUE0gRGllZ28gU3VlaXJvIDxkaWVnby5zdWVp
cm9AYXJtLmNvbT4NCj53cm90ZToNCj4+PiA+DQo+Pj4gPiBUaGUgbGlic2VjY29tcCBwYWNrYWdl
IGlzIG9ubHkgYXZhaWxhYmxlIGlmIHNlY2NvbXAgaXMgaW4NCj5ESVNUUk9fRkVBVFVSRVMuDQo+
Pj4gPg0KPj4+ID4gU2lnbmVkLW9mZi1ieTogRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJt
LmNvbT4NCj4+PiA+IC0tLQ0KPj4+ID4gIHJlY2lwZXMtY29udGFpbmVycy9wb2RtYW4vcG9kbWFu
X2dpdC5iYiB8IDMgKysrDQo+Pj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0K
Pj4+ID4NCj4+PiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvcG9kbWFuL3BvZG1h
bl9naXQuYmINCj4+PiA+IGIvcmVjaXBlcy1jb250YWluZXJzL3BvZG1hbi9wb2RtYW5fZ2l0LmJi
DQo+Pj4gPiBpbmRleCA5ZGNiMjFjLi4zNTFmMzhiIDEwMDY0NA0KPj4+ID4gLS0tIGEvcmVjaXBl
cy1jb250YWluZXJzL3BvZG1hbi9wb2RtYW5fZ2l0LmJiDQo+Pj4gPiArKysgYi9yZWNpcGVzLWNv
bnRhaW5lcnMvcG9kbWFuL3BvZG1hbl9naXQuYmINCj4+PiA+IEBAIC02LDYgKzYsOSBAQCBERVND
UklQVElPTiA9ICJQb2RtYW4gaXMgYSBkYWVtb25sZXNzIGNvbnRhaW5lcg0KPmVuZ2luZSBmb3Ig
ZGV2ZWxvcGluZywgXA0KPj4+ID4gICAgICBgYWxpYXMgZG9ja2VyPXBvZG1hbmAuIFwNCj4+PiA+
ICAgICAgIg0KPj4+ID4NCj4+PiA+ICtpbmhlcml0IGZlYXR1cmVzX2NoZWNrDQo+Pj4gPiArUkVR
VUlSRURfRElTVFJPX0ZFQVRVUkVTID89ICJzZWNjb21wIg0KPj4+ID4gKw0KPj4+ID4gIERFUEVO
RFMgPSAiIFwNCj4+PiA+ICAgICAgZ28tbWV0YWxpbnRlci1uYXRpdmUgXA0KPj4+ID4gICAgICBn
by1tZDJtYW4tbmF0aXZlIFwNCj4+PiA+IC0tDQo+Pj4gPiAyLjE3LjENCj4+PiA+DQo+Pj4gPg0K
Pj4+ID4NCj4+PiA+DQo+Pj4NCj4+Pg0KPj4+IC0tDQo+Pj4gLSBUaG91IHNoYWx0IG5vdCBmb2xs
b3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0DQo+Pj4gdGhl
ZSBhdCBpdHMgZW5kDQo+Pj4gLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFy
IFRyZWsgSUkNCj4+Pg0KPj4+IA0KPj4+DQo+DQo+DQo+LS0NCj4tIFRob3Ugc2hhbHQgbm90IGZv
bGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBh
dA0KPml0cyBlbmQNCj4tICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJl
ayBJSQ0K
