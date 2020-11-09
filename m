Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.9119.1604913979319183523
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 01:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FCqRmzUR;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C050F38C0364
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 01:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLfgg/5tYqa0o90+FFAES/7xHqr0zCxkXjSwea3BZbA=;
 b=FCqRmzURywm6U3sOSzm98aRUTr9tzJLvFQRNmnfrV2sGGmX/rwwMhTHycHqJRkyGb/HeFaRkMvibTIaMh6AwT2n6K7+73LZY3x2y1CZ94U5XWJB1ttwuFpxevCyM/QlShQCnfZcQ5OXBo6+tzUs7EbQAmeM+sPAzN5Z2INw+Sl4=
Received: from MR2P264CA0117.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::33)
 by DB6PR08MB2885.eurprd08.prod.outlook.com (2603:10a6:6:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 09:26:14 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::6f) by MR2P264CA0117.outlook.office365.com
 (2603:10a6:500:33::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 09:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 09:26:13 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Mon, 09 Nov 2020 09:26:13 +0000
X-CR-MTA-TID: 64aa7808
Received: from ea1749a3c956.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38BB603B-C86C-4059-A7F3-5F694EE8DA93.1;
	Mon, 09 Nov 2020 09:26:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea1749a3c956.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 09:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAbLom4C9cTdFYGRgg4EGVdOawMpn1KP+6A60VhY7SM3S7qG1ipk9H44Qj9KmePYwfNKTcXYFBjvF35Dwa5PxR92w3ymTjP7/vXg6Ux6a7IWqNV6nEEuR1LjyPQsN4IdHq/ogJhex/2RhllGalbiGZhiVb6AA4mENGdEMLPc1bKXzCpkvUca8rH1OXNlrA1ZArwX6Hvdq4DEx9iSBNbDVNkpD8qeLOHxgtJynqQnJfBMCohHy5gdXeuZvkkzfNfuPHgBFiy5wjGQoPZX13zN6VHsRTYoxYG25WLebhYd/0JqBLuPydAY2JXwilyyhuyp9lk/MLGjoDrKyP+LOK0yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLfgg/5tYqa0o90+FFAES/7xHqr0zCxkXjSwea3BZbA=;
 b=jJOPdWezCkcyZiF6Q6QNLnSVR6iPCQuU7vqMv/0o5/uHRwosML6SZYUWc4O5ZFcq6W5IFXUmovrQI1t+9Wj9MB6KL7BO9ZvY1FLtlASQZc6cH8b1RNx9B+3HbFrTMsKr67zYHMBIDVUf7FFF42iBB0/ej1CucKgxf+c73WA5eUc2IDRnmBDvv31acCSP3JSNiQcePDdEdVPIPjslhPjyNcAdWWwo3+GYVD0BdTz2meYcHFCnQDeDPYjb0qTlK3UWbMC08NAN8dGzWVj8fSwX4eXkChtzPVBW2DbxeIIC1JLPQR1r3or8/rWzE1WNbMjyYFqSuuKQOeWDxusLBKDVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLfgg/5tYqa0o90+FFAES/7xHqr0zCxkXjSwea3BZbA=;
 b=FCqRmzURywm6U3sOSzm98aRUTr9tzJLvFQRNmnfrV2sGGmX/rwwMhTHycHqJRkyGb/HeFaRkMvibTIaMh6AwT2n6K7+73LZY3x2y1CZ94U5XWJB1ttwuFpxevCyM/QlShQCnfZcQ5OXBo6+tzUs7EbQAmeM+sPAzN5Z2INw+Sl4=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DB6PR0802MB2311.eurprd08.prod.outlook.com (2603:10a6:4:87::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 9 Nov
 2020 09:26:03 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84%6]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 09:26:03 +0000
From: Lance.Yang@arm.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "joakim.roubert@axis.com"
	<joakim.roubert@axis.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Topic: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Index: AQHWq69fcPQ8C1m0vkKsSMY3RAelSKmssl2AgA77roCAA9QbgIAAF4VQ
Date: Mon, 9 Nov 2020 09:26:03 +0000
Message-ID: 
 <DBBPR08MB4725EE645E4C4D4CC7844E5C91EA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <af00b32f-7619-a755-13b1-714675419946@axis.com>
 <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
 <46f448dd-5f62-0058-dd34-c826df195c54@axis.com>
In-Reply-To: <46f448dd-5f62-0058-dd34-c826df195c54@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5B7A56EDF7BAB84C90E967697EF0F02F.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2acda562-f9b6-47dd-a7ae-08d8849180dd
x-ms-traffictypediagnostic: DB6PR0802MB2311:|DB6PR08MB2885:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB28853B73A28DD2EF3D458B6491EA0@DB6PR08MB2885.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WYlvZ9hbKOI/I+HnqcUvuzzJDNdA+tk+k8t680nh49baFveiFnz6MKbGTzsnTBBQTrPPwZNSeh0e8eucLFQo6TQpRfIuLfURNB7O9wfsQj2ctapnXGcZ0wfPoeDKl/AGW3IhTJ/uFPi9B29i0XlHjAOl/dUg+vtiIBwgufK7d0ysICT0ADLq3NQqawwrVD0h89xvG4bfVWfy9PFSFaHx9v2AS9s87+4MAwtnorJPGwW+0jsy789BniVR8VeQBEfzxfSc5C9EWzMgjY3fRORx1urZNxornFuJfaVbISVhTdMkkwj0Cv5XE3J/agNMLQdqWN4P1HdniUCytupoVqDKz32Kkmczl3KhKOJY6R73nIvRk/9nP52hbdA3erL1p7+wB3ufhnQFB5xaxV8Nj22cPP42xabcKLc55nNGM3r40TyxyqMseVpK8Vv2zctqi21p
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(33656002)(64756008)(55016002)(66556008)(966005)(66476007)(76116006)(66446008)(4326008)(83380400001)(186003)(9686003)(66946007)(86362001)(6506007)(478600001)(5660300002)(54906003)(26005)(52536014)(53546011)(316002)(7696005)(71200400001)(8936002)(8676002)(6916009)(2906002)(42413003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 PqBbcxApfTBzatIMDigc1FL7tu+/UtNATKL1FUU2k43c2L4snEuv+f1wPIY3gNiuW+S4jo8ZF5xuXUZm/jXL1CY3l+OJNmk/pQ39g0HPLGvAG3vRCkJDjp82TqvZ6IZvsvY/RcnmQ3RdFlkf1Ly/kUMQ3ZDkPS+vklSb6zKqxsvuxNoV/lK9ZJIq6RMvrc4SUXSii+EDR3WGQS55zIr4Kwxsj9mXBGJy7VTUZz4WqCVRAhjYwWtBs42NKTrmY/y31T1Ckc/tEYOEzikf6gZ/dgOehfEKiZm+DgNeFn8fI1sj/0b7gNphOx6MtB+UBw2cU6g8I6XnTxw3NGhbPjZrAM48xcaOyuswVnYvRHMqrp72iqbJ+c2fDu9wNJM1skj54dCvQg2EouJDkKkZSvaTZz+PpP6SMK/CuBRwg/rPDvkCwG8vgrB3fcezNTrw8S/7e77tpcEUtN40IyLbEYSQYT6g110Df7kjZQ4VoO6QrfjKvR7zJ7lTCca9D1B8wRLlr13vo2ASn3nyje2Yoq5F7gwIpyNCh66GpmvFluuhJ0QDuogeMNodCZhC3KW7GT5ISoD0ceoiIhzOdfTM5AvdgK3PWRyNhz42uFjKuqP1wTIAO8lTd9FYRAMC1S/fTVu6uAbyY4twZqviXwej2RUm+g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2311
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c958cb7-3a09-459c-1fea-08d884917ab3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yhpZoiqKNmWpxnwqPRUAKzD3wqKp+a763nXbWffR2sAVodxLoZFFKG1rRL3w9PkvAgp6CPsbq52om0eWCpgOybkSYoDtrHGH7Q5b3pBApVqzYYJpdrTMZHlNMcr3NiFWlofz6OCHu0wnbg9lSnkoRpZ+Jwi/jk251+zD8nBAdMxaaD7vQuzpn5/AMu9r8l4IblrklVVqNwmWvpW+SJh18lKtk/tKgFAV6WDhkwq0RmzcexEpNqxCo0enBPx0smenEphguWOt43++XSeohKA98LRvJ7w9TG83NyMCZapBrADKyOQ69Sqkmfu4mcy2hcFudLGIuNw/kx0qcmLObsinG7J4Cg8CoYfHxFZ9tx7zl4Ne+n2RTf1xQH3XfW1rNPAsCz6IcskHZv/T4wNxidJYE/CFrxxCoNOx7huIt1ziy0uvePCI6Bi8vAuK3/QhUH9POsnICfQ7yPHEh58zLDMlJK/L8LyBDvpQMK/hNvfpYaZsFk4F38PeH3Sq5ajIEK8o
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(6506007)(70206006)(70586007)(2906002)(54906003)(966005)(36906005)(316002)(356005)(55016002)(52536014)(336012)(186003)(86362001)(82310400003)(6862004)(53546011)(26005)(81166007)(9686003)(7696005)(478600001)(33656002)(8676002)(8936002)(5660300002)(47076004)(83380400001)(4326008)(82740400003)(42413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 09:26:13.8220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acda562-f9b6-47dd-a7ae-08d8849180dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2885
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UsDQoNCkZvciB0aGUgaXB0YWJsZXMgaXNzdWUsIEkgdGVzdGVkIGlwdGFibGVzLg0K
DQpBcyBpcHRhYmxlcyBjb21tZW50IG1vZHVsZSBiZWxvbmdpbmcgdG8gaXB0YWJsZXMgZXh0ZW5z
aW9uLCBJIGNoZWNrZWQgbXkga2VybmVsIGNvbmZpZyBhbmQgc2V0IHRoZSBwYXJhbWV0ZXI6IENP
TkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09NTUVOVD1tLg0KDQppcHRhYmxlcyAtVg0KaXB0YWJs
ZXMgdjEuOC41IChsZWdhY3kpDQoNCkkgdXNlZCB0aGlzIGlwdGFibGVzIGNvbW1hbmQgdG8gY2hl
Y2sNCg0KaXB0YWJsZXMgLUEgSU5QVVQgLXAgdGNwIC0tZHBvcnQgMjIgLW0gY29tbWVudCAtLWNv
bW1lbnQgIlNTSCIgLWogQUNDRVBUDQoNCkl0IHdvcmtzIGZpbmUgZnJvbSBteSBzaWRlLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpMYW5jZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS12aXJ0
dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhhbGYgT2YgSm9ha2lt
IFJvdWJlcnQgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciA5LCAyMDIwIDM6NDkgUE0NCj4gVG86IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVs
ZEBnbWFpbC5jb20+DQo+IENjOiBtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmcN
Cj4gU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSCB2NV0gQWRkaW5nIGsz
cyByZWNpcGUNCj4NCj4gT24gMjAyMC0xMS0wNiAyMjoyMCwgQnJ1Y2UgQXNoZmllbGQgd3JvdGU6
DQo+ID4NCj4gPiBJIG5vdyBoYXZlIGFub3RoZXIgNiBvciA3IFdJUCBwYXRjaGVzIG9uIHRvcCBv
ZiB0aGlzIHRvIHRyeSBhbmQgZ2V0IGENCj4gPiBzaW5nbGUgbm9kZSAiY2x1c3RlciIgd29ya2lu
ZyB3aXRoIGszcy4gSSdsbCBjbGVhbiB0aGVtIHVwIGFuZCBnZXQNCj4gPiB0aGVtIGludG8gdGhl
IGszcyBXSVAgYnJhbmNoIHNob3J0bHkuDQo+DQo+IEF3ZXNvbWUhDQo+DQo+ID4gSW4geW91ciB3
b3JraW5nIHJlZmVyZW5jZXMsIHdoaWNoIGlwdGFibGVzIGRvIHlvdSBoYXZlIGluc3RhbGxlZCA/
DQo+ID4gKGxlZ2FjeSA/IG5mdGFibGVzPykNCj4NCj4gIyBpcHRhYmxlcyAtLXZlcnNpb24NCj4g
aXB0YWJsZXMgdjEuOC40IChsZWdhY3kpDQo+DQo+ID4gSSdtIGZhaWxpbmcgdG8gZ2V0IGZsYW5u
ZWwgdG8gc3RhcnQsIHdpdGggYSBzZXJpZXMgb2YgZXJyb3JzIGxpa2UgdGhpczoNCj4gPg0KPiA+
IC0tLS0tLS0tLS0tDQo+ID4gSTExMDYgMjE6MTk6MDAuOTg1NjU2ICAgMTA2NDEgZXZpY3Rpb25f
bWFuYWdlci5nbzozNTFdIGV2aWN0aW9uDQo+ID4gbWFuYWdlcjogYWJsZSB0byByZWR1Y2UgZXBo
ZW1lcmFsLXN0b3JhZ2UgcHJlc3N1cmUgd2l0aG91dCBldmljdGluZw0KPiA+IHBvZHMuDQo+ID4g
RTExMDYgMjE6MTk6MTAuNjM2ODk5ICAgMTA2NDEgcHJveGllci5nbzo4NDFdIEZhaWxlZCB0byBl
bnN1cmUgdGhhdA0KPiA+IGZpbHRlciBjaGFpbiBJTlBVVCBqdW1wcyB0byBLVUJFLUVYVEVSTkFM
LVNFUlZJQ0VTOiBlcnJvciBjaGVja2luZw0KPiA+IHJ1bGU6IGV4aXQgc3RhdHVzIDI6IGlwdGFi
bGVzIHYxLjguNiAobGVnYWN5KTogQ291bGRuJ3QgbG9hZCBtYXRjaA0KPiA+IGBjb21tZW50JzpO
byBzdWNoIHkgVHJ5IGBpcHRhYmxlcyAtaCcgb3IgJ2lwdGFibGVzIC0taGVscCcgZm9yIG1vcmUN
Cj4gPiBpbmZvcm1hdGlvbi4NCj4gPiBJMTEwNiAyMToxOToxMC42NDE2NDcgICAxMDY0MSBwcm94
aWVyLmdvOjgyNV0gU3luYyBmYWlsZWQ7IHJldHJ5aW5nIGluDQo+ID4gMzBzDQo+ID4gLS0tLS0t
LS0tLS0tDQo+DQo+IFRoaXMgaXMgYSBiaXQgc3RyYW5nZSwgYXMgaXQgc2VlbXMgeW91IGFyZSBy
dW5uaW5nIGluIGxlZ2FjeSBtb2RlIHRvbywgYWx0aG91Z2ggYSBzb21ld2hhdA0KPiBuZXdlciB2
ZXJzaW9uIHRoYW4gSSBoYXZlLCBhbmQgdGhlIG9ubHkgdGhpbmcgSSBrbm93IGlzIHRoYXQgUmFu
Y2hlciByZWNvbW1lbmRzIDEuNi4xIG9yIG5ld2VyDQo+ICh3aGljaCBpdCBpcykuDQo+DQo+IGh0
dHBzOi8vcmFuY2hlci5jb20vZG9jcy9rM3MvbGF0ZXN0L2VuL2tub3duLWlzc3Vlcy8NCj4NCj4g
TWlnaHQgdGhlcmUgYmUgc29tZXRoaW5nIG1pc3NpbmcgaW4gdGhlIGtlcm5lbD8NCj4NCj4gSSBo
YXZlIHRoZXNlIFJQTXMgaW5zdGFsbGVkIGluIG15IGltYWdlOg0KPg0KPiBpcHRhYmxlcw0KPiBp
cHRhYmxlcy1tb2R1bGUtaXA2dC1haA0KPiBpcHRhYmxlcy1tb2R1bGUtaXA2dC1kbmF0DQo+IGlw
dGFibGVzLW1vZHVsZS1pcDZ0LWRucHQNCj4gaXB0YWJsZXMtbW9kdWxlLWlwNnQtZHN0DQo+IGlw
dGFibGVzLW1vZHVsZS1pcDZ0LWV1aTY0DQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LWZyYWcNCj4g
aXB0YWJsZXMtbW9kdWxlLWlwNnQtaGJoDQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LWhsDQo+IGlw
dGFibGVzLW1vZHVsZS1pcDZ0LWljbXA2DQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LWlwdjZoZWFk
ZXINCj4gaXB0YWJsZXMtbW9kdWxlLWlwNnQtbG9nDQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LW1h
c3F1ZXJhZGUNCj4gaXB0YWJsZXMtbW9kdWxlLWlwNnQtbWgNCj4gaXB0YWJsZXMtbW9kdWxlLWlw
NnQtbmV0bWFwDQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LXJlZGlyZWN0DQo+IGlwdGFibGVzLW1v
ZHVsZS1pcDZ0LXJlamVjdA0KPiBpcHRhYmxlcy1tb2R1bGUtaXA2dC1ydA0KPiBpcHRhYmxlcy1t
b2R1bGUtaXA2dC1zbmF0DQo+IGlwdGFibGVzLW1vZHVsZS1pcDZ0LXNucHQNCj4gaXB0YWJsZXMt
bW9kdWxlLWlwNnQtc3JoDQo+IGlwdGFibGVzLW1vZHVsZS1pcHQtYWgNCj4gaXB0YWJsZXMtbW9k
dWxlLWlwdC1jbHVzdGVyaXANCj4gaXB0YWJsZXMtbW9kdWxlLWlwdC1kbmF0DQo+IGlwdGFibGVz
LW1vZHVsZS1pcHQtZWNuDQo+IGlwdGFibGVzLW1vZHVsZS1pcHQtaWNtcA0KPiBpcHRhYmxlcy1t
b2R1bGUtaXB0LWxvZw0KPiBpcHRhYmxlcy1tb2R1bGUtaXB0LW1hc3F1ZXJhZGUNCj4gaXB0YWJs
ZXMtbW9kdWxlLWlwdC1uZXRtYXANCj4gaXB0YWJsZXMtbW9kdWxlLWlwdC1yZWFsbQ0KPiBpcHRh
Ymxlcy1tb2R1bGUtaXB0LXJlZGlyZWN0DQo+IGlwdGFibGVzLW1vZHVsZS1pcHQtcmVqZWN0DQo+
IGlwdGFibGVzLW1vZHVsZS1pcHQtc25hdA0KPiBpcHRhYmxlcy1tb2R1bGUtaXB0LXR0bA0KPiBp
cHRhYmxlcy1tb2R1bGUtaXB0LXVsb2cNCj4gaXB0YWJsZXMtbW9kdWxlcw0KPiBpcHRhYmxlcy1t
b2R1bGUteHQtYWRkcnR5cGUNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWF1ZGl0DQo+IGlwdGFibGVz
LW1vZHVsZS14dC1icGYNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWNncm91cA0KPiBpcHRhYmxlcy1t
b2R1bGUteHQtY2hlY2tzdW0NCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWNsYXNzaWZ5DQo+IGlwdGFi
bGVzLW1vZHVsZS14dC1jbHVzdGVyDQo+IGlwdGFibGVzLW1vZHVsZS14dC1jb21tZW50DQo+IGlw
dGFibGVzLW1vZHVsZS14dC1jb25uYnl0ZXMNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWNvbm5saW1p
dA0KPiBpcHRhYmxlcy1tb2R1bGUteHQtY29ubm1hcmsNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWNv
bm5zZWNtYXJrDQo+IGlwdGFibGVzLW1vZHVsZS14dC1jb25udHJhY2sNCj4gaXB0YWJsZXMtbW9k
dWxlLXh0LWNwdQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtY3QNCj4gaXB0YWJsZXMtbW9kdWxlLXh0
LWRjY3ANCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWRldmdyb3VwDQo+IGlwdGFibGVzLW1vZHVsZS14
dC1kc2NwDQo+IGlwdGFibGVzLW1vZHVsZS14dC1lY24NCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWVz
cA0KPiBpcHRhYmxlcy1tb2R1bGUteHQtaGFzaGxpbWl0DQo+IGlwdGFibGVzLW1vZHVsZS14dC1o
ZWxwZXINCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWhtYXJrDQo+IGlwdGFibGVzLW1vZHVsZS14dC1p
ZGxldGltZXINCj4gaXB0YWJsZXMtbW9kdWxlLXh0LWlwY29tcA0KPiBpcHRhYmxlcy1tb2R1bGUt
eHQtaXByYW5nZQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtaXB2cw0KPiBpcHRhYmxlcy1tb2R1bGUt
eHQtbGVkDQo+IGlwdGFibGVzLW1vZHVsZS14dC1sZW5ndGgNCj4gaXB0YWJsZXMtbW9kdWxlLXh0
LWxpbWl0DQo+IGlwdGFibGVzLW1vZHVsZS14dC1tYWMNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LW1h
cmsNCj4gaXB0YWJsZXMtbW9kdWxlLXh0LW11bHRpcG9ydA0KPiBpcHRhYmxlcy1tb2R1bGUteHQt
bmZhY2N0DQo+IGlwdGFibGVzLW1vZHVsZS14dC1uZmxvZw0KPiBpcHRhYmxlcy1tb2R1bGUteHQt
bmZxdWV1ZQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtb3NmDQo+IGlwdGFibGVzLW1vZHVsZS14dC1v
d25lcg0KPiBpcHRhYmxlcy1tb2R1bGUteHQtcGh5c2Rldg0KPiBpcHRhYmxlcy1tb2R1bGUteHQt
cGt0dHlwZQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtcG9saWN5DQo+IGlwdGFibGVzLW1vZHVsZS14
dC1xdW90YQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtcmF0ZWVzdA0KPiBpcHRhYmxlcy1tb2R1bGUt
eHQtcmVjZW50DQo+IGlwdGFibGVzLW1vZHVsZS14dC1ycGZpbHRlcg0KPiBpcHRhYmxlcy1tb2R1
bGUteHQtc2N0cA0KPiBpcHRhYmxlcy1tb2R1bGUteHQtc2VjbWFyaw0KPiBpcHRhYmxlcy1tb2R1
bGUteHQtc2V0DQo+IGlwdGFibGVzLW1vZHVsZS14dC1zb2NrZXQNCj4gaXB0YWJsZXMtbW9kdWxl
LXh0LXN0YW5kYXJkDQo+IGlwdGFibGVzLW1vZHVsZS14dC1zdGF0aXN0aWMNCj4gaXB0YWJsZXMt
bW9kdWxlLXh0LXN0cmluZw0KPiBpcHRhYmxlcy1tb2R1bGUteHQtc3lucHJveHkNCj4gaXB0YWJs
ZXMtbW9kdWxlLXh0LXRjcA0KPiBpcHRhYmxlcy1tb2R1bGUteHQtdGNwbXNzDQo+IGlwdGFibGVz
LW1vZHVsZS14dC10Y3BvcHRzdHJpcA0KPiBpcHRhYmxlcy1tb2R1bGUteHQtdGVlDQo+IGlwdGFi
bGVzLW1vZHVsZS14dC10aW1lDQo+IGlwdGFibGVzLW1vZHVsZS14dC10b3MNCj4gaXB0YWJsZXMt
bW9kdWxlLXh0LXRwcm94eQ0KPiBpcHRhYmxlcy1tb2R1bGUteHQtdHJhY2UNCj4gaXB0YWJsZXMt
bW9kdWxlLXh0LXUzMg0KPiBpcHRhYmxlcy1tb2R1bGUteHQtdWRwDQo+DQo+IGFuZCBpbiBteSBr
ZXJuZWwgY29uZmlnLCBJIGhhdmUgKGFwYXJ0IGZyb20gd2hhdCBpcyBuZWVkZWQgZm9yIHJ1bm5p
bmcgY29udGFpbmVycyB3aXRoDQo+IGNvbnRhaW5lcmQpOg0KPg0KPiBDT05GSUdfTkVURklMVEVS
X05FVExJTks9bQ0KPiBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX09XTkVSPW0NCj4gQ09ORklH
X05FVF9VRFBfVFVOTkVMPW0NCj4gQ09ORklHX05GX0RVUF9ORVRERVY9bQ0KPiBDT05GSUdfTkZf
TE9HX0JSSURHRT1tDQo+IENPTkZJR19ORl9UQUJMRVNfQVJQPXkNCj4gQ09ORklHX05GX1RBQkxF
U19CUklER0U9eQ0KPiBDT05GSUdfTkZfVEFCTEVTX0lORVQ9eQ0KPiBDT05GSUdfTkZfVEFCTEVT
X0lQVjQ9eQ0KPiBDT05GSUdfTkZfVEFCTEVTX0lQVjY9eQ0KPiBDT05GSUdfTkZfVEFCTEVTPW0N
Cj4gQ09ORklHX05GX1RBQkxFU19ORVRERVY9eQ0KPiBDT05GSUdfTkZUX0JSSURHRV9SRUpFQ1Q9
bQ0KPiBDT05GSUdfTkZUX0NIQUlOX05BVF9JUFY0PW0NCj4gQ09ORklHX05GVF9DSEFJTl9ST1VU
RV9JUFY0PW0NCj4gQ09ORklHX05GVF9DSEFJTl9ST1VURV9JUFY2PW0NCj4gQ09ORklHX05GVF9D
T01QQVQ9bQ0KPiBDT05GSUdfTkZUX0NPVU5URVI9bQ0KPiBDT05GSUdfTkZUX0NUPW0NCj4gQ09O
RklHX05GVF9EVVBfSVBWND1tDQo+IENPTkZJR19ORlRfRFVQX0lQVjY9bQ0KPiBDT05GSUdfTkZU
X0RVUF9ORVRERVY9bQ0KPiAjIENPTkZJR19ORlRfRVhUSERSIGlzIG5vdCBzZXQNCj4gQ09ORklH
X05GVF9GSUJfSU5FVD1tDQo+IENPTkZJR19ORlRfRklCX0lQVjQ9bQ0KPiBDT05GSUdfTkZUX0ZJ
Ql9JUFY2PW0NCj4gQ09ORklHX05GVF9GSUJfTkVUREVWPW0NCj4gQ09ORklHX05GVF9GV0RfTkVU
REVWPW0NCj4gQ09ORklHX05GVF9IQVNIPW0NCj4gQ09ORklHX05GVF9MSU1JVD1tDQo+IENPTkZJ
R19ORlRfTE9HPW0NCj4gQ09ORklHX05GVF9NQVNRX0lQVjQ9bQ0KPiBDT05GSUdfTkZUX01BU1E9
bQ0KPiAjIENPTkZJR19ORlRfTUVUQSBpcyBub3Qgc2V0DQo+IENPTkZJR19ORlRfTkFUPW0NCj4g
Q09ORklHX05GVF9OVU1HRU49bQ0KPiAjIENPTkZJR19ORlRfT0JKUkVGIGlzIG5vdCBzZXQNCj4g
Q09ORklHX05GVF9RVUVVRT1tDQo+IENPTkZJR19ORlRfUVVPVEE9bQ0KPiBDT05GSUdfTkZUX1JF
RElSX0lQVjQ9bQ0KPiBDT05GSUdfTkZUX1JFRElSPW0NCj4gQ09ORklHX05GVF9SRUpFQ1Q9bQ0K
PiAjIENPTkZJR19ORlRfUlQgaXMgbm90IHNldA0KPiAjIENPTkZJR19ORlRfU0VUX0JJVE1BUCBp
cyBub3Qgc2V0DQo+ICMgQ09ORklHX05GVF9TRVRfSEFTSCBpcyBub3Qgc2V0DQo+ICMgQ09ORklH
X05GVF9TRVRfUkJUUkVFIGlzIG5vdCBzZXQNCj4gQ09ORklHX09WRVJMQVlfRlM9bQ0KPiBDT05G
SUdfU1RQPW0NCj4NCj4gQlIsDQo+DQo+IC9Kb2FraW0NCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBj
b250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlh
bCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
IHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBu
b3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3Ig
YW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRp
dW0uIFRoYW5rIHlvdS4NCg==
