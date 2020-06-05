Received: from USG02-BN3-obe.outbound.protection.office365.us (USG02-BN3-obe.outbound.protection.office365.us [23.103.208.71])
 by mx.groups.io with SMTP id smtpd.web12.817.1591386943118859288
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 12:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dornerworkssystem.onmicrosoft.us header.s=selector1-dornerworkssystem-onmicrosoft-us header.b=DDtQjcxN;
 spf=pass (domain: dornerworks.com, ip: 23.103.208.71, mailfrom: stewart.hildebrand@dornerworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Y1w4wM5i8x8QB+kVqQAUuDVCsabmR79YAPU5JdJ3IBDwxRRoZ4f21YeQDXxLsx58cGI8P1eI4VyLDMheHckvNJGV2ccUXHjFsdQmvY35KweRq3wX5svMUnOQEvCxjg2PF3hpcGSGWYlqiTSumw2p3HZS9kPA+FE347U6ZWGAyYl5lB8lRj7bfOHhGIJVRVvwGifQwXpud87XYOo/zR4fldfN+6AFdSBjBF3ed3EKO6Gn62uKKUrWKNE4RC4kxrzF6FWr+bifAr/dMrA4aPu5TNJ3vBJlGAw8m4+EnQYU73LIDOXe6OVxCb5ilaxi4//3a45PrmGVQhtoHzYVm9CAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkWRwOLoKJLUoTkZF1tdK66zw38Y6EV2oomPMVdbKqs=;
 b=0EwiHAw6A3DQYeNFxvsSNNw9jgvsAVL6BEz83iO7SvzCq7O2yMcASlU17fW2mA0DqqfzHGFZKXqD2RPY1eWMD8vvezqzefXUWU9YXt90hoXrjctMRMA2TZC9+BEjF8+aML3ayFszOs9Vok0hm9R6zCIbHL96fibawYZCICNebN+icv804pCH2rM7Uaezr7grvHnhQ3URzYXZfD3xEDzLYheH6xhuFwYyYyVOPh0QGL4ybJFKfPRa/DrK+eVrqc/q+0Fj/+eCvqChRxS1WP/nyxj1BxDOtbSfrM7aCSB6qfp3PQ83DqOPHbVP+Bxk3CVuyvkofRUGBq0iBT4heOdi6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dornerworkssystem.onmicrosoft.us;
 s=selector1-dornerworkssystem-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkWRwOLoKJLUoTkZF1tdK66zw38Y6EV2oomPMVdbKqs=;
 b=DDtQjcxNDq+Pqt6Dc9/de2uSZ+zOlvHZNsLFzpel++WQUA3VllWGBTmA9EKbuo9AJFC1tJ93R6X9SNgBkmcLqGBZ+sj2/oPgnD4RqtZ8zGp+JsnPOAQvKfDl5rji2nvDufBGrTDQGh4+hTAJrZbaYzSlWarf3x2LFgNfL9b+hRo=
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM (52.145.2.14) by
 CY1P110MB0215.NAMP110.PROD.OUTLOOK.COM (23.103.24.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.32; Fri, 5 Jun 2020 19:55:37 +0000
Received: from CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9ce0:61d4:901a:7b05]) by CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9ce0:61d4:901a:7b05%9]) with mapi id 15.20.3021.036; Fri, 5 Jun 2020
 19:55:37 +0000
From: "Stewart Hildebrand" <stewart.hildebrand@dornerworks.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Corey Minyard
	<cminyard@mvista.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Siddhartha V
	<Siddhuvgowda.18695@gmail.com>, "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
Thread-Topic: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve
 the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs.
 and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR:
 xen-image-minimal-1.0-r0 do_rootf")
Thread-Index: AdY7cueh7BKux6jPTM6klc5Hy0Q9gw==
Date: Fri, 5 Jun 2020 19:55:37 +0000
Message-ID: 
 <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=dornerworks.com;
x-originating-ip: [172.58.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27b68706-acd2-4fbe-97ef-08d8098a6a9f
x-ms-traffictypediagnostic: CY1P110MB0215:
x-microsoft-antispam-prvs: 
 <CY1P110MB02155094A3F89B8F5C3AAE018C860@CY1P110MB0215.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(52536014)(8936002)(2906002)(186003)(4326008)(66476007)(64756008)(86362001)(66446008)(55016002)(9686003)(508600001)(6506007)(66556008)(54906003)(8676002)(7696005)(76116006)(71200400001)(5660300002)(966005)(83380400001)(66946007)(110136005)(53546011)(26005)(33656002)(219693003);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b68706-acd2-4fbe-97ef-08d8098a6a9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 19:55:37.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0215
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

KyBDb3JleQ0KDQpPbiBGcmlkYXksIEp1bmUgNSwgMjAyMCAzOjE5IFBNLCBCcnVjZSBBc2hmaWVs
ZCB3cm90ZToNCj5PbiBGcmksIEp1biA1LCAyMDIwIGF0IDM6MTIgUE0gU3Rld2FydCBIaWxkZWJy
YW5kIHdyb3RlOg0KPj4gT24gVGh1cnNkYXksIEp1bmUgNCwgMjAyMCA1OjEzIFBNLCBDaHJpc3Rv
cGhlciBDbGFyayB3cm90ZToNCj4+ID4gSGVsbG8gU2lkZGhhcnRoYSwNCj4+ID4NCj4+ID4gSSBh
bSBhbHNvIGludGVyZXN0ZWQgaW4gcnVubmluZyBYZW4gb24gdGhlIFJhc3BiZXJyeSBQaSA0LiBJ
IGhvcGUgdG8gaGF2ZSB0aW1lIG5leHQgd2VlayB0byBiZSBhYmxlIHRvIGxvb2sgaW50byBpdC4N
Cj4+ID4NCj4+ID4gQ2hyaXN0b3BoZXINCj4+ID4NCj4+ID4NCj4+ID4+IE9uIEp1biA0LCAyMDIw
LCBhdCA1OjA1IEFNLCBTaWRkaGFydGhhIFYgd3JvdGU6DQo+PiA+Pg0KPj4gPj4gSGVsbG8gZGVh
ciBtZXRhLXZpcnR1YWxpemF0aW9uIHRlYW0sDQo+PiA+PiBJIGFtIGJ1aWxkaW5nIHRoZSB4ZW4g
bWluaW1hbCBpbWFnZSB1c2luZyB5b2N0byB3YXJyaW9yICgiYml0YmFrZSB4ZW4taW1hZ2UtbWlu
aW1hbCIpIGJ5IGdpdmluZyB0aGUgdGFyZ2V0IG1hY2hpbmUgYXMNCj4icmFzcGJlcnJ5cGk0Ii4N
Cj4+DQo+PiBDb3JleSBNaW55YXJkIGNyZWF0ZWQgYSBsYXllciBmb3IgWGVuIG9uIFJhc3BiZXJy
eSBQaSA0IGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL01vbnRhVmlzdGEtT3BlblNvdXJjZVRlY2hu
b2xvZ3kvbWV0YS0NCj5yYXNwYmVycnlwaS14ZW4NCj4+DQo+DQo+U29tZW9uZSBuZWVkcyB0byBs
ZWFuIG9uIHRoZW0gdG8gZ2V0IHBhdGNoZXMgc3VibWl0dGVkIHRvIG1ldGEtdmlydC4NCg0KQ29y
ZXk6IHlvdSBhcmUgaGVyZWJ5IGVuY291cmFnZWQgdG8gc3VibWl0IHBhdGNoZXMgdG8gbWV0YS12
aXJ0dWFsaXphdGlvbi4NCg0KPkhhdmluZyBhIGxheWVyIGxpa2UgdGhhdCwgd2l0aCBmaXhlcyBt
aXNzaW5nIGZyb20gbWV0YS12aXJ0LCBtYWtlcyBubyBzZW5zZS4NCj4NCj5CcnVjZQ0KDQptZXRh
LXZpcnR1YWxpemF0aW9uIHNlZW1zIHRvIGJlIHVzaW5nIFhlbiA0LjEyIGF0IHRoZSBtb21lbnQu
DQoNCkNvcmV5J3MgbWV0YS1yYXNwYmVycnlwaS14ZW4gbGF5ZXIgdXNlcyBYZW4gNC4xMy4gVGhl
IFhlbiBwYXRjaGVzIGFyZSBiYXNlZCBvbiBYZW4gNC4xMy4gQmV0d2VlbiBYZW4gNC4xMiBhbmQg
NC4xMyB0aGVyZSBhcmUgYSBmZXcgYWRkaXRpb25hbCBwYXRjaGVzIHRoYXQgYXJlIHJlcXVpcmVk
IGZvciBydW5uaW5nIG9uIFJhc3BiZXJyeSBQaSA0Lg0KDQpXb3VsZCB5b3UgcmF0aGVyIHVwcmV2
IG1ldGEtdmlydHVhbGl6YXRpb24gdG8gWGVuIDQuMTMsIG9yIGJhY2twb3J0IHRoZSBwYXRjaGVz
IGFuZCBpZGVudGlmeSBhZGRpdGlvbmFsIGJhY2twb3J0cyByZXF1aXJlZCBmb3IgcnVubmluZyBY
ZW4gNC4xMiBvbiBSYXNwYmVycnkgUGkgND8NCg0KU3Rldw0K
