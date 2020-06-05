Received: from USG02-CY1-obe.outbound.protection.office365.us (USG02-CY1-obe.outbound.protection.office365.us [23.103.209.88])
 by mx.groups.io with SMTP id smtpd.web11.2299.1591384319378188950
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 12:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dornerworkssystem.onmicrosoft.us header.s=selector1-dornerworkssystem-onmicrosoft-us header.b=mXaXgjKd;
 spf=pass (domain: dornerworks.com, ip: 23.103.209.88, mailfrom: stewart.hildebrand@dornerworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=CA6/TWXjPw9SsSME06CRPAdd4S8dmMvmkUt0IE4aJMX/Ujw6n4kvR7M/cvXhdmOaQQWNIq8w0IaNXPqLOpKr5vXHoUT29oSkdJIp3WbG0fFu61+kXa45AnIBNCsqFS5FMt/IAhyUdZQ2DMUZ9mwXGQM+l8JEvHULOCXggA/YoAtvKMADhdEmgSjYtFMq1JzgoYYPnsyzwpsGHfAcaqrLXJAA3x9lmOsM7VsCDtXJSywi6tCmiT2zqyNYY539i7lhLGs3f7ZZbwjTtYB+eXKz5banG1aJQ7iytibMSHR2C+sTS3rxajhTPtLqB0eQsWxAtdJAijEwhZ0MH42D8p1C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMaYt/a4x6uKLyifaYuAJgFnWqjAcuV2ugWaXw/buec=;
 b=HF6p2vr0jN9XKlgVocj4v2Qx9Iya0tKL/gT1N6pYSRoI5WQn5Y8sa12Pv5rjXYaJBn3L8UWBmwaYd8QiyTz4qk3yQpaCiK55TK59m1po6Y8sz+SWoFZo1pTP8hLh6/mF9awwMfekqdjcr6hhL7DclKj1aklOaDLpoy7D2PRvXmSHay26Ei5XU3Moa/rxGn7bWMm+DZLRPYXG49rMtnUsbf1LE8VcuNPl0bcTDqscEZ1ku0xgIWHyR4GZBbw1DNFN7kzJk8QAegZsDmfJKlLXDidRn5CJULSlHVAHPAbqVuRQR/qTBKYg/nHSGGzY/LeIC4iGXOl5PD1FCYJawDyr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMaYt/a4x6uKLyifaYuAJgFnWqjAcuV2ugWaXw/buec=;
 b=mXaXgjKdHo8RtHRH4YnfWYZ+zLCc05keKgCXmtyu992BtL761g3sQe/hMxmu/cP7tvl+5ztAeLm4WLbMmgWjAn4FdUle/T/6tE9mZ0tux292wctj46IvNK3zoPoO9JotPOi95vVZw9amJbKv+A2diJEPPh+3lnsZuH/X7dVRGr4=
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:404::14)
 by CY1P110MB0471.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.32; Fri, 5 Jun
 2020 19:11:54 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9ce0:61d4:901a:7b05]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9ce0:61d4:901a:7b05%9]) with mapi id 15.20.3021.036; Fri, 5 Jun 2020
 19:11:54 +0000
From: "Stewart Hildebrand" <stewart.hildebrand@dornerworks.com>
To: Christopher Clark <christopher.w.clark@gmail.com>, Siddhartha V
	<Siddhuvgowda.18695@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
Thread-Topic: [meta-virtualization] How to resolve the ERROR:
 xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR:
 xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf.
Thread-Index: AQHWOrTxwxfvJx9Pvk6mbsfhBEhaEqjKYoXg
Date: Fri, 5 Jun 2020 19:11:54 +0000
Message-ID: 
 <CY1P110MB0551CF1CC39152785C654EA08C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
References: <F6Xm.1591272345632844743.Xl2d@lists.yoctoproject.org>
 <96BF8243-B90E-4E4B-B7D0-29A384966AAE@gmail.com>
In-Reply-To: <96BF8243-B90E-4E4B-B7D0-29A384966AAE@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=dornerworks.com;
x-originating-ip: [172.58.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ccb21b7-8147-47fd-ec64-08d809844f8c
x-ms-traffictypediagnostic: CY1P110MB0471:
x-microsoft-antispam-prvs: 
 <CY1P110MB0471779C0B15BBAAD40182988C860@CY1P110MB0471.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(4326008)(7696005)(8676002)(4744005)(71200400001)(2906002)(83380400001)(186003)(33656002)(53546011)(86362001)(8936002)(110136005)(26005)(6506007)(52536014)(508600001)(66556008)(66446008)(66476007)(966005)(5660300002)(66946007)(9686003)(64756008)(76116006)(55016002)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccb21b7-8147-47fd-ec64-08d809844f8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 19:11:54.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0471
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1cnNkYXksIEp1bmUgNCwgMjAyMCA1OjEzIFBNLCBDaHJpc3RvcGhlciBDbGFyayB3cm90
ZToNCj4gSGVsbG8gU2lkZGhhcnRoYSwNCj4NCj4gSSBhbSBhbHNvIGludGVyZXN0ZWQgaW4gcnVu
bmluZyBYZW4gb24gdGhlIFJhc3BiZXJyeSBQaSA0LiBJIGhvcGUgdG8gaGF2ZSB0aW1lIG5leHQg
d2VlayB0byBiZSBhYmxlIHRvIGxvb2sgaW50byBpdC4NCj4NCj4gQ2hyaXN0b3BoZXINCj4NCj4N
Cj4+IE9uIEp1biA0LCAyMDIwLCBhdCA1OjA1IEFNLCBTaWRkaGFydGhhIFYgd3JvdGU6DQo+PiAN
Cj4+IEhlbGxvIGRlYXIgbWV0YS12aXJ0dWFsaXphdGlvbiB0ZWFtLA0KPj4gSSBhbSBidWlsZGlu
ZyB0aGUgeGVuIG1pbmltYWwgaW1hZ2UgdXNpbmcgeW9jdG8gd2FycmlvcsKgKCJiaXRiYWtlIHhl
bi1pbWFnZS1taW5pbWFsIinCoGJ5IGdpdmluZyB0aGUgdGFyZ2V0IG1hY2hpbmUgYXPCoCJyYXNw
YmVycnlwaTQiLg0KDQpDb3JleSBNaW55YXJkIGNyZWF0ZWQgYSBsYXllciBmb3IgWGVuIG9uIFJh
c3BiZXJyeSBQaSA0IGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL01vbnRhVmlzdGEtT3BlblNvdXJj
ZVRlY2hub2xvZ3kvbWV0YS1yYXNwYmVycnlwaS14ZW4NCg0KVGhhbmtzLA0KU3RldyBIaWxkZWJy
YW5kDQpEb3JuZXJXb3JrcywgTHRkDQo=
