Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.81])
 by mx.groups.io with SMTP id smtpd.web12.2756.1592467307993504160
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 01:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VW/f/LXu;
 spf=pass (domain: arm.com, ip: 40.107.3.81, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS5Q1lgOan90BBFDTnAjjAgOkhzTMrhdJFvdCcB/Mxg=;
 b=VW/f/LXuFC64O3YUYFSEhLFVhZL/HQ26z/v29SQv7pbgbs6Wa5SoHF3PiMyK0ustzz0C+hAIRQ+rSW4DHowCNn76byAjYlsV3+SrlynzcZv5vLsPqwA6fWu99qykHJy5dl4feiwXMk08fCCIBNEkm6E43SW5kqnOoqXJ3g8YRgc=
Received: from AM0PR01CA0162.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::31) by VE1PR08MB4669.eurprd08.prod.outlook.com
 (2603:10a6:802:a8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 08:01:42 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::f4) by AM0PR01CA0162.outlook.office365.com
 (2603:10a6:208:aa::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 08:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 08:01:39 +0000
Received: ("Tessian outbound b2c4593baa67:v59"); Thu, 18 Jun 2020 08:01:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba199e939226f481
X-CR-MTA-TID: 64aa7808
Received: from 097867874772.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A5D26D30-977D-478E-AFFD-42B33895BECB.1;
	Thu, 18 Jun 2020 08:01:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 097867874772.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Jun 2020 08:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHx0m2n4a7f8aDYgc8YJfDvXLRwt9gQJOQSq/p331HgKjpKzvjDW2YE54p59pfJim3Q49g278j7mWlJjOIXs7ZMyJt9oHVDsipme00WcXsDWOHIr+wO86qt31auQgw9G5DmOPVKkKYcAxyB/ZZ9xh/tZG/VrLP3qPlBDx+8+Edg5Syoq6VKpj9EG+m0WQm1zk1ydotdlLMbvZ7fSX+LQwwyd/rWnUHytVl75w0OvewaSjgyHytzOzkmXcv+MuCnnGA7GMD+YhkRkWDF3E8PSgzXIV4ToWE1X0H8Li9GdSTKJoNFvWbgYBqdeLQx5CjgO6d9iJkKUU3COGRJscOiE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS5Q1lgOan90BBFDTnAjjAgOkhzTMrhdJFvdCcB/Mxg=;
 b=DToSMsOwLyCRelVg+EPzqz2eTeanzTTxsSA0xfj06B141vIbyb1hgevrc4ibJw1k6z01R0lg9cWXJw9P2eB9jgQpZoj/BQGhziaqI553c9PSn4nz5H+IGyV2HAVxxS7kvsCjtgwqJQybV584FmS4jmgx5iqXjn9WqaQQDVp8adEgJVKJdbx3CwdsB6vhcQJiexpD+jnAVZ/vwCNOZPJtjgWEuQwcVbKS8kjPocvPVeuuIV/VH624vEhqfKCNNfglLfdprcyruTdhzzgpU//yNswRoGqiHwo7QgNheUkAeYj2+kBZO4gtIxrk7ZDFgQth3gEVf/SzEOnXFl66WdKIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS5Q1lgOan90BBFDTnAjjAgOkhzTMrhdJFvdCcB/Mxg=;
 b=VW/f/LXuFC64O3YUYFSEhLFVhZL/HQ26z/v29SQv7pbgbs6Wa5SoHF3PiMyK0ustzz0C+hAIRQ+rSW4DHowCNn76byAjYlsV3+SrlynzcZv5vLsPqwA6fWu99qykHJy5dl4feiwXMk08fCCIBNEkm6E43SW5kqnOoqXJ3g8YRgc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3242.eurprd08.prod.outlook.com (2603:10a6:5:1a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Thu, 18 Jun
 2020 08:01:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 08:01:31 +0000
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
 AdY7cueh7BKux6jPTM6klc5Hy0Q9gwAIcLkKAdgWTGwAB3dcAABFDr0AABaUT4AACQ9DpQAHKM2AAAGdW4AAH3qNgA==
Date: Thu, 18 Jun 2020 08:01:31 +0000
Message-ID: <DBEFB2A8-9585-43DF-B13E-8FFCC44F1CA0@arm.com>
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
 <8E523F21-6597-4C12-B9A1-3E689C1C932D@arm.com>
 <CADkTA4MHcCy52fYq1Q8wQTH_iHqMDPGXYD231XFkw-G_w2somg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MHcCy52fYq1Q8wQTH_iHqMDPGXYD231XFkw-G_w2somg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03da6d97-7f5f-4bc1-07af-08d8135dd48f
x-ms-traffictypediagnostic: DB7PR08MB3242:|VE1PR08MB4669:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4669E67D633B828E45E733E19D9B0@VE1PR08MB4669.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TdoeRDh0J8LGgfmO6nn3vOiHQ68RHr40QaE6CI2uNYR4Vjg1bMI7w0EZy7CUq5sBcNyKjBZwbRLsCkT3QFWno2sAhp1bxs77NU8qBIbMciotQVFZhxEpgM3YvkFrW0IFwa76F9P2dfdPK6sZBj+AgDc5ofib6tBNeT5569t88OunJb3sKTUNPVlxX1pFj6zPhtjMSwwEkkdA+PNIysXMqNPswY2McT8DVTnscmvVSl/uHccde9T28npi+ux2AcwHpy4Ha1FSwb3COglTbonoQyyN8J6/FFznAEj95883LCIeh7IKh+wP2gNg4AUHtut0fswZCEBqI4+zxeBRP+Hi36O9iTbEusKLQWuNcYrRe0IDDm5MrJOR4ARZNPi8ybly07LX9AgMSyn21yd5UilzEGfFKS9tv9g8RTzmg792zSWalEDULGBeOE4pCZ37Cdi3WrNRSvKQK0xZ4x9xXeghTw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(316002)(86362001)(26005)(186003)(478600001)(6506007)(54906003)(4326008)(53546011)(966005)(8936002)(6916009)(5660300002)(2906002)(66946007)(76116006)(6486002)(91956017)(30864003)(8676002)(66556008)(71200400001)(6512007)(83380400001)(33656002)(66476007)(64756008)(2616005)(36756003)(66446008)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 vWd5Wm6HEgLv2USRjOQmS+4nB5gD8GPEnxnw8qNsoE3E7ttlWsYhsdZ35YGd8zoBrk0E1FgvN4kZU03mTovlCOtLA5HObek2H3Iqz03W7KOEn+bnIuTuIdTuzlj6m1Jp8SBpNDEP4TqL/nvPOtg9kDOsBT0CKqp5p4Cq/uuFJVbsgCPsxCvbCvb+osy6gBzsTklYJA8t3m9K18dgcfYDdByPaTWYrRG5Lolutp8N2vJvfGHYm9tK00Z2JRjQ3+3CgLXl57qZvB35Jk1GzvYdrdBEStlz54chAaZ/NelAiWUiEmj9twioQHBngRVHufXMWlnfPXCS0oUsF1Bg+Dnc8DuVJwKmZT5wjiwulC12tDa3eFZ9wTcOheYEuWdQnGre27WrLPAIy1iEvxztnTuu3FEwBqz9864+yuzhZgtZWRBeseyK/vfLxGny5Ukw8ihbCUcijhL5xAgE+2SN7leMapgJvN8ZP5uWxFqmmkuvhUU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3242
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966005)(26005)(336012)(70586007)(70206006)(5660300002)(36756003)(86362001)(6512007)(6862004)(30864003)(4326008)(186003)(2616005)(53546011)(81166007)(36906005)(356005)(82310400002)(316002)(966005)(8676002)(83380400001)(82740400003)(2906002)(33656002)(54906003)(6506007)(8936002)(47076004)(6486002)(478600001)(219693003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	750fba77-9914-4d32-b375-08d8135dd004
X-Forefront-PRVS: 0438F90F17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6OVs2RHlhob9aRaqTAN/MjmuhHUQLlszFdMLD+iUukrG4kv3n/fbOA5E7bfRjYtS/R+5sIMHmqh/767oWCWCLf6zmLd+l2oU2GRf8iFiLpT97zGqkILAMzJ0RRUQ8Nur5UfHTGpL6maB4h8Me9AH+jHIpzyXe3RaF1U0FtAE1TT8c8bictJByGuJcK8kl39lsJy5l39g0BP42ygaCpjvMOvFA41vaBj/8qr9s57wM5MlkWcCDSpCLsZx9J1Ui3eVRXmOXZZEtKFSHxbnhcgBUSy/M/zasKob//MsbC+xYP1QYyAB8jhsp/iY5MphDtDv9tOVqSpCLnLu8oYKtmskI4/otGUS/ZI8PGiNXfxSSvkx2beUm98rFiBYZZ7YXNWcdbr+uBR9/JFuX65/RZmXn1C13gmjXuWIkHk7QwQiU7Fe0ohmtpsHjN689bwmdFE1Q8p3UL6gY4lLoOPvANzGo0a0Ju7lBmEcwqaVdzDYo5qC0EBsAUye/j3dXiVtQ7oI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 08:01:39.1105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03da6d97-7f5f-4bc1-07af-08d8135dd48f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4669
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D50821C30159844929CBA04EF5535FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gMTcgSnVuIDIwMjAsIGF0IDE4OjAwLCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMTI6MTQgUE0g
QmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+
IA0KPj4gDQo+PiANCj4+PiBPbiAxNyBKdW4gMjAyMCwgYXQgMTM6NDgsIEJydWNlIEFzaGZpZWxk
IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxicnVjZS5hc2hmaWVsZD1nbWFpbC5jb21AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBKdW4gMTcsIDIw
MjAgYXQgODo0NSBBTSBCcnVjZSBBc2hmaWVsZCB2aWENCj4+PiBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQo+Pj4gPGJydWNlLmFzaGZpZWxkPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
PiB3cm90ZToNCj4+Pj4gDQo+Pj4+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDQ6MjkgQU0gQmVy
dHJhbmQgTWFycXVpcw0KPj4+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+
Pj4+IA0KPj4+Pj4gSGksDQo+Pj4+PiANCj4+Pj4+PiBPbiAxNiBKdW4gMjAyMCwgYXQgMjI6NDMs
IENocmlzdG9waGVyIENsYXJrIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxjaHJpc3RvcGhl
ci53LmNsYXJrPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4+Pj4+
PiANCj4+Pj4+PiBPbiBNb24sIEp1biAxNSwgMjAyMCBhdCA1OjQ1IEFNIEJydWNlIEFzaGZpZWxk
IDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+PiBPbiBNb24sIEp1biAx
NSwgMjAyMCBhdCA1OjExIEFNIENocmlzdG9waGVyIENsYXJrDQo+Pj4+Pj4+IDxjaHJpc3RvcGhl
ci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IE9uIEZyaSwg
SnVuIDUsIDIwMjAgYXQgNTo1OCBQTSBDb3JleSBNaW55YXJkIDxjbWlueWFyZEBtdmlzdGEuY29t
PiB3cm90ZToNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPbiBGcmksIEp1biAwNSwgMjAyMCBhdCAw
Nzo1Mzo1M1BNIC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gRnJp
LCBKdW4gNSwgMjAyMCBhdCA1OjE2IFBNIENvcmV5IE1pbnlhcmQgPGNtaW55YXJkQG12aXN0YS5j
b20+IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBPbiBGcmksIEp1biAwNSwgMjAy
MCBhdCAwNzo1NTozN1BNICswMDAwLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+Pj4+Pj4+
Pj4+Pj4gKyBDb3JleQ0KPj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+IE9uIEZyaWRheSwgSnVu
ZSA1LCAyMDIwIDM6MTkgUE0sIEJydWNlIEFzaGZpZWxkIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBP
biBGcmksIEp1biA1LCAyMDIwIGF0IDM6MTIgUE0gU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0K
Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+IENvcmV5OiB5b3UgYXJlIGhlcmVieSBlbmNvdXJhZ2VkIHRv
IHN1Ym1pdCBwYXRjaGVzIHRvIG1ldGEtdmlydHVhbGl6YXRpb24uDQo+Pj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+Pj4+IE9rLiAgVGhlIGxheWVyIGhhcyB0aGUgZm9sbG93aW5nIGJhc2ljIHBpZWNlczoN
Cj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gQmVmb3JlIHdlIGdldCB0byB0aGUgb3RoZXIgcGllY2VzLCBJ
J2QgbGlrZSB0byBjb3ZlciB0aGUgbmV3ICJycGl4ZW4iDQo+Pj4+Pj4+PiBNQUNISU5FIHR5cGUg
dGhhdCB0aGUgbGF5ZXIgaW50cm9kdWNlcy4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gTXkgcHJlZmVy
ZW5jZSBpcyBmb3IgYXZvaWRpbmcgaW50cm9kdWN0aW9uIG9mIGFub3RoZXIgTUFDSElORSB0bw0K
Pj4+Pj4+Pj4gcmVjb25maWd1cmUgYW4gZXhpc3Rpbmcgb25lIHRvIHJ1biBYZW4sIGlmIHBvc3Np
YmxlLCBhbmQgdXNlIHRoZQ0KPj4+Pj4+Pj4gZXhpc3RpbmcgInJhc3BiZXJyeXBpNC02NCIuIEkn
bSBob3BpbmcgdG8gYXZvaWQgdGhlIHBhdHRlcm4gb2YNCj4+Pj4+Pj4+IGNyZWF0aW5nIGEgbmV3
IG1hY2hpbmUgZm9yIFhlbiBmb3IgZWFjaCBib2FyZCB0aGF0IHdlIGFkZCBzdXBwb3J0IGZvci4N
Cj4+Pj4+Pj4+IEluIG1ldGEtdmlydHVhbGl6YXRpb24sIHRoZXJlJ3MgdGhlICJ4ZW4iIERJU1RS
T19GRUFUVVJFLCB3aGljaCBpcw0KPj4+Pj4+Pj4gdXNlZCB0byB0dXJuIG9uIFhlbi1zcGVjaWZp
YyBmdW5jdGlvbmFsaXR5IGFuZCBjb21wYXRpYmlsaXR5LCBhbmQgSSdkDQo+Pj4+Pj4+PiBsaWtl
IHRvIGV4cGxvcmUgd2hldGhlciB0aGF0IGNhbiBiZSBtYWRlIHRvIGJlIHN1ZmZpY2llbnQgdG8g
ZW5hYmxlDQo+Pj4+Pj4+PiB3aGF0IGlzIG5lZWRlZC4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gVG8g
dGhhdCBlbmQsIEkndmUgZG9uZSBhbiBpbml0aWFsIHBhc3MgdG8gc2VlIHdoYXQgaXQgbWlnaHQg
dGFrZSBhbmQNCj4+Pj4+Pj4+IHRoZSB3b3JrLWluLXByb2dyZXNzIGZyb20gdGhhdCBpcyBwb3N0
ZWQgaGVyZToNCj4+Pj4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9kb3p5bHlueC9tZXRhLXZpcnR1
YWxpemF0aW9uL3RyZWUvcmFzcGJlcnJ5LXBpNC1pbml0aWFsLXhlbg0KPj4+Pj4+Pj4gDQo+Pj4+
Pj4+PiBTb21lIG1pbm9yIGNoYW5nZXMgdG8gb3RoZXIgbGF5ZXJzIGNvdWxkIGFzc2lzdCAtIGVn
LiB0byByZW1vdmUgdGhlDQo+Pj4+Pj4+PiBuZWVkIGZvciBhIGd1ZXN0IGZpbGVzeXN0ZW0gdG8g
Y29udGFpbiB0aGUgaHlwZXJ2aXNvciBiaW5hcnkgLSBhbmQNCj4+Pj4+Pj4+IHRoZXJlJ3Mgc3Rp
bGwgc29tZSB0aWR5aW5nIHRvIGRvLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiAxIFRoZSB4ZW4g
cGF0Y2hlcyBmb3IgdGhlIFBpNCwganVzdCBhIGZldyBwYXRjaGVzLiAgQXMgdGhlIFhlbiBncm91
cA0KPj4+Pj4+Pj4+Pj4gZml4ZXMgdGhpbmdzLCBJIGtlZXAgYWRkaW5nIDopLg0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBVbmZvcnR1bmF0ZWx5IEkgaGFkIHRvIGRyb3AgdGhlc2UgcGF0Y2hlcyBmcm9t
IG15IGxvY2FsIHRlc3QgdG8gZ2V0IGl0DQo+Pj4+Pj4+PiB0byBib290LiBJdCBjb3VsZCBlYXNp
bHkgYmUgYSBsb2NhbCBidWlsZCBpc3N1ZSBvciBhIGZhdWx0IHdpdGggdGhlDQo+Pj4+Pj4+PiBv
bmUgdGVzdCBJJ3ZlIHJ1biBzbyBmYXIsIGJ1dCBJIGRpZCBoYXZlIHN1Y2Nlc3MgYm9vdGluZyB3
aXRoIGp1c3QgWGVuDQo+Pj4+Pj4+PiA0LjEzIGFuZCBJJ2QgbGlrZSB0byBnZXQgYSBiaXQgbW9y
ZSB1bmRlcnN0YW5kaW5nIGFuZCBjb25maWRlbmNlIGluDQo+Pj4+Pj4+PiB0aGVtIGJlZm9yZSB3
ZSBicmluZyB0aGVtIGluLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiAyIEhhY2tzIGZvciBnZXR0
aW5nIHRoZSBQaTQga2VybmVsIGNvbmZpZyByaWdodCBmb3IgeGVuLiAgVGhpcyBzaG91bGQgZ28N
Cj4+Pj4+Pj4+Pj4+IGF3YXkgaWYgeW91IGRvbid0IHVzZSB0aGUga2VybmVsIGZyb20gdGhlIFBp
NCB5b2N0byBsYXllciwgYXMgaXQNCj4+Pj4+Pj4+Pj4+IGRvZXNuJ3Qgd29yayBsaWtlIG1vc3Qg
a2VybmVscyBpbiB5b2N0by4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEkgc2hvdWxkIHRha2Ug
YSBsb29rIGF0IHRoZSBjb25maWdzIGFuZCBzZWUgaWYgSSBjYW4gY3JlYXRlIGEgZnJhZ21lbnQN
Cj4+Pj4+Pj4+Pj4gb3IgdHdvLCBidXQgSSBjYW4gdGFrZSBjYXJlIG9mIHRoYXQuDQo+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4gVGhhdCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5LiAgVGhlIHN0YW5kYXJk
IGZyYWdtZW50cyB3b3JrLCBpdCdzIGp1c3QNCj4+Pj4+Pj4+PiB0aGF0IHRoZSBQaSBrZXJuZWwg
ZG9lcyBub3QgdXNlIHRoZW0uICBTbyB0aGlzIGlzIHJlYWxseSBQaStYZW4NCj4+Pj4+Pj4+PiBz
cGVjaWZpYywgYW5kIGhvcGVmdWxseSB0aGV5IGNhbiBmaXggdGhlIFBpIGtlcm5lbCB0byB1c2Ug
dGhlIG5vcm1hbA0KPj4+Pj4+Pj4+IGZyYWdtZW50cyBpbiB0aGUgZnV0dXJlLg0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBUaGUgbGludXgtcmFzcGJlcnJ5cGkga2VybmVsIGRvZXMgdXNlIGxpbnV4LXlv
Y3RvOyBpdCdzIGp1c3QgdGhhdA0KPj4+Pj4+Pj4gbWV0YS12aXJ0dWFsaXphdGlvbg0KPj4+Pj4+
Pj4gbmVlZHMgYSBtYXRjaGluZyAuaW5jIGZpbGUgdG8gYmUgcHJlc2VudCBmb3IgdGhlIGtlcm5l
bCB2ZXJzaW9uIHRoYXQNCj4+Pj4+Pj4+IHlvdSdyZSB1c2luZy4NCj4+Pj4+Pj4+IEFzc3VtaW5n
IHlvdSdyZSB1c2luZyBMaW51eCA0LjE5ICh3aGljaCBpcyB3aGF0IEkndmUgdGVzdGVkIHdpdGgp
IGFkZCB0aGlzIGZpbGU6DQo+Pj4+Pj4+PiBtZXRhLXZpcnR1YWxpemF0aW9uL3JlY2lwZXMta2Vy
bmVsL2xpbnV4L2xpbnV4LXlvY3RvXzQuMTlfdmlydHVhbGl6YXRpb24uaW5jDQo+Pj4+Pj4+PiBj
b250YWluaW5nIGp1c3Q6DQo+Pj4+Pj4+PiBpbmNsdWRlIGxpbnV4LXlvY3RvX3ZpcnR1YWxpemF0
aW9uLmluYw0KPj4+Pj4+Pj4gd2hpY2ggd2lsbCB0aGVuIGVuYWJsZSB0aGUgbGludXgtcmFzcGJl
cnJ5cGkga2VybmVsIHRvIGFkZCB0aGUNCj4+Pj4+Pj4+IG1ldGEtdmlydCBYZW4gZnJhZ21lbnQu
DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFRoZXJlIGFyZSBhbHNvIHR3byBMaW51eCBwYXRjaGVzOg0K
Pj4+Pj4+Pj4gMSkgRGlzYWJsZSBETUEgaW4gdGhlIFNESENJIGRyaXZlcg0KPj4+Pj4+Pj4gVGhp
cyBvbmUgbmVlZHMgbW9yZSBpbmZvcm1hdGlvbiBpbiB0aGUgY29tbWl0IHRleHQgdG8gdW5kZXJz
dGFuZCB3aGF0DQo+Pj4+Pj4+PiBpcyBtb3RpdmF0aW5nIGRvaW5nIHRoaXMgYW5kIHdoYXQgdGhl
IGVmZmVjdHMgb2YgaXQgYXJlLiBTaG91bGQgaXQgZ28NCj4+Pj4+Pj4+IGludG8gdGhlIHN0YW5k
YXJkIFJhc3BiZXJyeSBQaSBrZXJuZWw/DQo+Pj4+Pj4+PiAyKSBGaXggUENJZSBpbiBkb20wIGZv
ciBSUGk0DQo+Pj4+Pj4+PiBJcyB0aGlzIGZpeGVkIHVwc3RyZWFtIGluIG1vcmUgcmVjZW50IGtl
cm5lbHM/IEl0IHdvdWxkIGJlIGdvb2QgdG8NCj4+Pj4+Pj4+IGhhdmUgYSBwb2ludGVyIHRvIHRo
YXQgaWYgc28uDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEJydWNlOiBUbyBhcHBseSB0aGVzZSB0byBq
dXN0IHRoZSBSYXNwYmVycnkgUGkga2VybmVsIHdoZW4gaXQncyBiZWluZw0KPj4+Pj4+Pj4gdXNl
ZCB3aXRoIFhlbiwgYSBrZXJuZWwgYmJhcHBlbmQgaW4gYSByYXNwYmVycnlwaSBkeW5hbWljLWxh
eWVycyBtaWdodA0KPj4+Pj4+Pj4gYmUgYW4gb3B0aW9uIHRvIGNvbnNpZGVyIC0gZWc6DQo+Pj4+
Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vZG96eWx5bngvbWV0YS12aXJ0dWFsaXphdGlvbi90cmVl
L3Jhc3BiZXJyeS1waTQtaW5pdGlhbC14ZW4vZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVj
aXBlcy1rZXJuZWwvbGludXgNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEkgY2FuIG1vc3QgbGlrZWx5IGxp
dmUgd2l0aCB0aGF0LiBJIG9idmlvdXNseSBtYWtlIHN1cmUgdGhhdCB0aGUNCj4+Pj4+Pj4gcmVm
ZXJlbmNlIGxpbnV4LXlvY3RvIGtlcm5lbCBkb2Vzbid0IG5lZWQgYW55dGhpbmcgdG8gd29yayBv
dXQgb2YgdGhlDQo+Pj4+Pj4+IGJveCwgYnV0IHdlIGNhbid0IChhbmQgc2hvdWxkbid0KSBlbmZv
cmNlIHRoYXQgY2hvaWNlIG9uIGV2ZXJ5b25lLiBJJ2QNCj4+Pj4+Pj4gcmF0aGVyIGhhdmUgcGF0
Y2hlcyBjZW50cmFsaXplZCBpbiBhIHRvcGljIGxheWVyIGxpa2UNCj4+Pj4+Pj4gbWV0YS12aXJ0
dWFsaXphdGlvbiwgc28gaWYgd2UgbmVlZCB0byBhZGQgYSBkeW5hbWljIGxheWVyIGFuZCBhIGZl
dw0KPj4+Pj4+PiBwYXRjaGVzLCB0aGF0J3MgYSBnb29kIHBsYWNlIHRvIGJlLg0KPj4+Pj4+IA0K
Pj4+Pj4+IHBsZWFzZSBzZWUgbXkgbmV3IGNvbW1lbnQgYmVsb3cuDQo+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4+PiA1IEEgZmV3IFBpLXNwZWNpZmljIGhhY2tzIGZvciBjb25maWcgYW5kIHUtYm9vdC4NCj4+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+ICM1IGRvZXMgc291bmQgbGlrZSBCU1Agc3R1ZmYuIElzIGFu
eSBvZiBpdCBkZXN0aW5lZCBmb3IgdGhlIHJwaSBsYXllcnMNCj4+Pj4+Pj4+Pj4gPyBPciBpcyBp
dCBib3RoIHJwaSBBTkQgeGVuIHNwZWNpZmljLCBzbyBkb2Vzbid0IHJlYWxseSBtYWtlIHNlbnNl
DQo+Pj4+Pj4+Pj4+IHRoZXJlIGVpdGhlciA/DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSXQncyBi
b3RoIFBpIGFuZCBYZW4gc3BlY2lmaWMuICBJZiBldmVyeXRoaW5nIGdldHMgcHV0IHdoZXJlIGl0
IHNob3VsZA0KPj4+Pj4+Pj4+IGJlLCB0aGF0IHdvdWxkIGJlIHRoZSBvbmx5IHRoaW5nIGxlZnQg
aW4gdGhpcyBsYXllciA6KS4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gVGhlc2UgYXJlIGluIHJlY2lw
ZXMtYnNwIGFuZCBJIGFncmVlIHRoYXQgdGhleSdyZSBib3RoIFBpIGFuZCBYZW4NCj4+Pj4+Pj4+
IHNwZWNpZmljLiBJIHRoaW5rIHRoZXNlIGFyZSBzbWFsbCBlbm91Z2ggcGllY2VzIHRoYXQga2Vl
cGluZyB0aGVtIGluDQo+Pj4+Pj4+PiBtZXRhLXZpcnR1YWxpemF0aW9uIGNvdWxkIGJlIGEgcmVh
c29uYWJsZSBjYWxsLCBzaW5jZSB0aGF0J3MgdGhlIGxheWVyDQo+Pj4+Pj4+PiB3aGVyZSBYZW4g
c3VwcG9ydCBpcyBmb2N1c3NlZCwgYW5kIHNvIHRoZXkgY2FuIGJlIGFkZGVkIHRvOg0KPj4+Pj4+
Pj4gZHluYW1pYy1sYXllcnMvcmFzcGJlcnJ5cGkvcmVjaXBlcy1ic3ANCj4+Pj4+Pj4+IHdoaWNo
IGluZGljYXRlcyB0aGVpciBzdGF0dXMgYXMgYW1lbmRtZW50cyB0byB0aGUgbWV0YS1yYXNwYmVy
cnlwaQ0KPj4+Pj4+Pj4gbGF5ZXIuIENoYW5nZXMgdG8gdGhlbSB3b3VsZCB0aGVuIGJlIGVhc2ls
eSBjb29yZGluYXRlZCB3aXRoIHRoZSBYZW4NCj4+Pj4+Pj4+IHJlY2lwZXMuDQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiBBZ3JlZWQuDQo+Pj4+Pj4gDQo+Pj4+Pj4gU2luY2UgSSB3cm90ZSB0aGlzLCB3ZSd2
ZSBzZWVuIHNvbWUgZXhwcmVzc2VkIGludGVyZXN0IGluIHN1cHBvcnQgZm9yDQo+Pj4+Pj4gcnVu
bmluZyBYZW4gb24gdGhlIE5WSURJQSBKZXRzb24gTmFubyBhbmQgWGF2aWVyIE5YIGJvYXJkcywg
YW5kIG9uIHRoZQ0KPj4+Pj4+IHhlbi1kZXZlbCBtYWlsaW5nIGxpc3QsIGEgcmVwb3J0IG9mIHN1
Y2Nlc3MgcnVubmluZyBYZW4gb24gdGhlIFJvY2tQcm82NA0KPj4+Pj4+IGJvYXJkOg0KPj4+Pj4+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAy
MC0wNi9tc2cwMTA2Ny5odG1sDQo+Pj4+Pj4gDQo+Pj4+Pj4gSSd2ZSBwZXJzb25hbGx5IGJ1aWx0
IFhlbiB3aXRoIG1ldGEtdmlydHVhbGl6YXRpb24gdG8gcnVuIG9uIHRoZSBDdWJpZXRydWNrIGZv
cg0KPj4+Pj4+IGRldmVsb3BtZW50IGFuZCB0ZXN0aW5nOyB0aGUgT2Ryb2lkIEMyIGFuZCBYVTQg
YXJlIG9mIGludGVyZXN0LCBhcyBpcyB0aGUNCj4+Pj4+PiBYaWxpbnggVWx0cmEtOTYtVjIgYm9h
cmQ7IGFuZCB0aGUgTlZpZGlhIEpldHNvbiBUWDEgYXQgb25lIHBvaW50IGhhZCBzb21lDQo+Pj4+
Pj4gbm9uLXVwc3RyZWFtIHBhdGNoZXMgYXZhaWxhYmxlIHRvIGVuYWJsZSBYZW4gb24gaXQuIFBD
RW5naW5lcyBtYWludGFpbnMNCj4+Pj4+PiBYZW4gY29tcGF0aWJpbGl0eSBmb3IgdGhlaXIgQVBV
MiBpbiBtZXRhLXBjZW5naW5lcy4NCj4+Pj4+PiANCj4+Pj4+PiBUaGVyZSBhcmUgYWxzbyBzb21l
IGNoYWxsZW5nZXMgYmVpbmcgZW5jb3VudGVyZWQgaW4gZ2V0dGluZyBhIG1vcmUgcmVjZW50IExp
bnV4DQo+Pj4+Pj4ga2VybmVsIHdvcmtpbmcgYXMgYSBkb20wIG9uIHRoZSBSYXNwYmVycnkgUGkg
NCAtIGVnLiB0aGUgTGludXggRm91bmRhdGlvbiBFdmUNCj4+Pj4+PiBQcm9qZWN0IHJ1biB0aGVp
ciBvd24gcGF0Y2hlcyBmb3IgNS42IGhlcmU6DQo+Pj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2xm
LWVkZ2UvZXZlL3RyZWUvbWFzdGVyL3BrZy9uZXcta2VybmVsL3BhdGNoZXMtNS42LngNCj4+Pj4+
PiANCj4+Pj4+PiBBbGwgb2YgdGhpcyBwb2ludHMgdG93YXJkcyBpdCBiZWluZyBhIHJlYXNvbmFi
bGUgcHJvcG9zaXRpb24gdG8gaGF2ZSBhDQo+Pj4+Pj4gZGVkaWNhdGVkIFhlbiBoYXJkd2FyZSBz
dXBwb3J0IFlvY3RvIGxheWVyLCBzbyB0aGF0IGJvYXJkLXNwZWNpZmljIHR3ZWFrcyBmb3INCj4+
Pj4+PiBoYXJkd2FyZSBjb21wYXRpYmlsaXR5IHdpdGggWGVuIGNhbiBiZSBtYWludGFpbmVkIHdp
dGhvdXQgY29tcGxpY2F0aW5nDQo+Pj4+Pj4gbWV0YS12aXJ0dWFsaXphdGlvbiwgd2hpbGUgY29u
dGludWluZyB0byBwb29sIFhlbi1hd2FyZSBjb250cmlidXRpb25zIGluDQo+Pj4+Pj4gYSBjZW50
cmFsaXplZCBsYXllci4NCj4+Pj4+PiANCj4+Pj4+PiBJJ2QgbGlrZSB0byBwcm9wb3NlIGNyZWF0
aW5nOiAnbWV0YS14ZW4tYnNwJzsgYW5kIEknbSB3aWxsaW5nIHRvIHdvcmsgb24NCj4+Pj4+PiBt
YWludGFpbmluZyBpdC4gRmVlZGJhY2sgdG8gdGhpcyBzdWdnZXN0aW9uIGlzIHdlbGNvbWUuDQo+
Pj4+Pj4gDQo+Pj4+Pj4gQnJ1Y2U6IGhvdyBkb2VzIHRoaXMgc291bmQgdG8geW91Pw0KPj4+Pj4g
DQo+Pj4+PiBJIGhhZCB0aGlzIHByb2JsZW0gd29ya2luZyBvbiBzb21lIG90aGVyIEJTUHMgdG8g
c3VwcG9ydCBYZW4gd2l0aCBtZXRhLXZpcnR1YWxpemF0aW9uICh5b3UgY2FuIGNoZWNrIHRoaXMg
aW4gbWV0YS1hcm1bMV0pLg0KPj4+Pj4gDQo+Pj4+PiBJIHdvdWxkIHRoaW5rIHRoZSBiZXN0IHdh
eSB0byBoYW5kbGUgdGhpcyBjYXNlIGlzIHRvIHVzZSBkeW5hbWljIGxheWVycyBhbmQgcHVzaCB0
aGUgcmVxdWlyZWQgc3VwcG9ydCBpbnNpZGUgdGhlIGxheWVyIGNvbnRhaW5pbmcgdGhlIEJTUC4N
Cj4+Pj4+IFRoaXMgd291bGQgbWFrZSB0aGUgbWFpbnRlbmFuY2UgZWFzaWVyIChmb3IgZXhhbXBs
ZSB3aGVuIHRoZSBrZXJuZWwgaXMgY2hhbmdlZCkuDQo+Pj4+IA0KPj4+PiBXZSd2ZSBhbHJlYWR5
IGJlZW4gdGFsa2luZyBhYm91dCBkeW5hbWljIGxheWVycywgYnV0IHRoZXkgZG9uJ3QNCj4+Pj4g
YWN0dWFsbHkgc29sdmUgdGhlIGlzc3VlIG9mIG9uZSBzb3VyY2Ugb2YgdHJ1dGggZm9yIGFuIGVu
dGlyZSBzdGFjaw0KPj4+PiB0aGF0IEknbSB0YWxraW5nIGFib3V0Lg0KPj4+IA0KPj4+IEFuZCBv
ZiBjb3Vyc2UsIGF0IGEgZ2xhbmNlLCBJIGFscmVhZHkgc2VlIHR3byB0aGluZ3MgdGhhdCBjb3Vs
ZCBoYXZlDQo+Pj4gZWFzaWx5IGJlZW4gc3VibWl0dGVkIHRvIG1ldGEtdmlydHVhbGl6YXRpb24u
IFdoaWNoIHNob3dzIHRoZSBwb2ludCwNCj4+PiB0aGF0IG9uY2UgeW91IGhhdmUgbGF5ZXJzIGFz
IGEgcGxhY2UgdG8gc3Rhc2ggZml4ZXMvZmVhdHVyZXMsIHRoZXkNCj4+PiB0eXBpY2FsbHkgZG9u
J3QgZ2V0IHN1Ym1pdHRlZCB0byB0aGUgY2VudHJhbGl6ZWQgbGF5ZXJzLg0KPj4gDQo+PiBUaGlz
IGlzIHNvbWV0aGluZyB3ZSBwbGFuIHRvIGZpeCBpbiB0aGUgbmV4dCBtb250aHMgYW5kIG1vdmUg
c29tZSBwYXJ0cyBmcm9tIG1ldGEtYXJtLWF1dG9ub215IHRvIG1ldGEtdmlydHVhbGl6YXRpb24u
DQo+PiANCj4+IEJ5IGN1cmlvc2l0eSwgd2hhdCBhcmUgdGhlIDIgdGhpbmdzIHlvdSBoYXZlIGlu
IG1pbmQgPw0KPiANCj4gVGhlIHR3byB0aGF0IEkgbm90aWNlZCB3ZXJlIHRoZSBxZW11IHNwbGl0
IChJIGRpZCBzb21ldGhpbmcgc2ltaWxhcg0KPiBmb3IgcnVuWCwgYnV0IGl0IHdvdWxkIGJlIG5p
Y2UgdG8gY29uc29saWRhdGUgdGhlbSkuIFRoZXJlIHdlcmUgYWxzbw0KPiBzb21lIGNvbmZpZy9j
b25zb2xlIGNoYW5nZXMgZm9yIFhlbiB0aGF0IEkgbm90aWNlZCB3aGljaCBjb3VsZCBiZSBpbg0K
PiB0aGUgbWFpbiBsYXllci4NCj4gDQo+IFdlIGFsc28gaGF2ZW4ndCByZWNlbnRseSByZXZpc2l0
ZWQgdGhlIGltYWdlIGRlZmluaXRpb25zIGFuZCBpdCB3b3VsZA0KPiBiZSBpbnRlcmVzdGluZyB0
byBzZWUgaWYgd2UgY291bGQgcHJvdmlkZSBzb21lIGVhc2lseSBleHRlbmRhYmxlIGJhc2UNCj4g
aW1hZ2VzIC4uIGJ1dCB0aGF0J3Mgbm90IHdoYXQgSSBub3RpY2VkIGluIG15IHF1aWNrIGdsYW5j
ZSBlYXJsaWVyLA0KPiBqdXN0IHNvbWV0aGluZyBJIHRob3VnaHQgb2Ygc2luY2UuDQo+IA0KPiBJ
J20gY3VycmVudGx5IGhhdmluZyBzb21lIGJ1aWxkIGlzc3VlcyB3aXRoIHFlbXVhcm02NCBhbmQg
WGVuIGluDQo+IG1hc3Rlciwgc28gSSdtIHRyeWluZyB0byBmaWdodCB0aHJvdWdoIHRoYXQgYmVm
b3JlIEkgY2FuIHRyeSBtdWNoIGVsc2UNCj4gb3V0Lg0KDQpJIGZ1bGx5IGFncmVlIHdpdGggdGhv
c2UuDQpJIHdvdWxkIGFsc28gdGhpbmsgdGhhdCBpbnRyb2R1Y2luZyB0aGUgaWRlYSBvZiDigJx4
ZW4gZG9tMOKAnSB2cyDigJx4ZW4gZ3Vlc3TigJ0gY291bGQgbWFrZSBzZW5zZS4NCkkgYWxzbyBo
YXZlIHNvbWUgaWRlYXMgZm9yIHRoZSB4ZW4gcmVjaXBlIGl0c2VsZiBhcyBjdXJyZW50IHN0YXR1
cyBkb2VzIG5vdCBhbGxvdyB0byBoYXZlIGEgZGV2ZWwgdmVyc2lvbi4NCg0KSSBub3RlZCBkb3du
IHlvdXIgY29tbWVudHMgaW4gb3VyIGJhY2tsb2cgZm9yIHRoZSBuZXh0IG1vbnRocw0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IEJydWNlDQo+IA0KPiANCj4+IA0K
Pj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+Pj4gDQo+Pj4gQ2hlZXJzLA0KPj4+IA0KPj4+
IEJydWNlDQo+Pj4gDQo+Pj4+IA0KPj4+PiBDaGVlcnMsDQo+Pj4+IA0KPj4+PiBCcnVjZQ0KPj4+
PiANCj4+Pj4+IA0KPj4+Pj4gSWYgeW91IHdhbnQgYW4gZXhhbXBsZSBvZiBob3cgdG8gdXNlIGR5
bmFtaWMgbGF5ZXJzIHlvdSBjYW4gY2hlY2sgbWV0YS1hcm0tYXV0b25vbXkgc3ViIGxheWVyIG9m
IG1ldGEtYXJtIFsxXSAod2hpY2ggYWxzbyBjb250YWlucyBvdGhlciBpbnRlcmVzdGluZyBiaXRz
IHJlbGF0ZWQgdG8gdXNpbmcgWGVuIHdpdGggWW9jdG8pLg0KPj4+Pj4gDQo+Pj4+PiBDaGVlcnMN
Cj4+Pj4+IEJlcnRyYW5kDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBJTVBPUlRBTlQg
Tk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFy
ZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlh
dGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29u
LCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlv
biBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo+Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IC0t
DQo+Pj4+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFv
cyBhbmQgbWFkbmVzcyBhd2FpdA0KPj4+PiB0aGVlIGF0IGl0cyBlbmQNCj4+Pj4gLSAiVXNlIHRo
ZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCj4+Pj4gDQo+Pj4gDQo+Pj4g
DQo+Pj4gDQo+Pj4gLS0NCj4+PiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2lu
dGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQNCj4+PiB0aGVlIGF0IGl0cyBlbmQNCj4+
PiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KPj4+IA0K
Pj4gDQo+IA0KPiANCj4gLS0gDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBv
aW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KPiB0aGVlIGF0IGl0cyBlbmQNCj4g
LSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCj4gDQoNCg==
