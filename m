Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A11FFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:12:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6397.1777356716360939281
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 23:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MqKO3sji;
 spf=pass (domain: siemens.com, ip: 52.101.72.15, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOlfDXLVaY0b1ZjmBQSoP7O/xZyZUuWj+8yRBiDMMbAg7xd9ZDQD+Nb+BiG353Go5hXJtDn1DEODVqGrzcjWUhjWauCx32sEDL9E4zrwcIKMkkumjs6l+68KhFHe/6EnPqkTsnUa5gtvYVu/HFMEke4aPHI0uo/iWmVMuuBWNuC2WPJmdWjWAc9vNEq0GgjsqnuiWBQEWkW0pv4NZioNwsv3URHuclJaCQz5M1p0zeLKMAPzH4RX0LLZHAn+Ay/wQK0jsf8+NhEIljnrC0rbd4Bm/v6rQJ+/WMXLlWq9GVXiOBNfMpN+wbIkCuMpiOrGgnOdtE4JaQZ2hQPz3ZT0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFe1uf+6noijBYHNpFsG9NkhGnk8exxbN5PGoW1TlcU=;
 b=Lee/WeFC/n1zaterZ2iF/yXU/BRlMAjQuybqdQ1VaXh/Ay9RqYSKVkFDG8LPuw77w7JX5h22Ii1PBHgYDrJ3f6/03M5DMxiFGkRke3hAX5JbOBfLhxqo+TGjlNJT2/Zdcc13dOzOB+4LyikxcoZaGZzR+TRI6gg0vIJpXmpavf+649DOjywlSDo4MHOcINblJtrZ9Z5aupBU0Gwjd1FGrwEdDmjBYp+fXpcV4OjyWmt32d1OKpHkTWQ5D6/Ik714li9r/F7ztXtj/kb3rsrvT/6y4OebzaJdUTE/y8tVUgJa+Y2ZvfWyGnPIUvy9TtkaEhUHPWN0DBk7A57FRLY6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFe1uf+6noijBYHNpFsG9NkhGnk8exxbN5PGoW1TlcU=;
 b=MqKO3sji0xIy5Vb6gq05j9dVxAbeKvoy3xXHepSsvkuflx2c15Wb04scRN99QG9aDbO+5hgF1HTiEgdhrbMOkHLROn99lejJwWsZKTnEprOmE9CNY54FublY/cH+EGY/SlvKyHV5PPl41UfYomGTZA0wW9kWvsZqegWxzjloOQkVNIYeBCebis6nAup1hAIRmCKx26jtJigA7qYCZo8fQHvyj+d8KqtR6DSQPkbwdB+uGRU2cLJK2jTu0Wb5hkdmi2LkSIqp5lmD5zXQDDYLgMISGP5sE0TvwXgwKr9kMIK3i/4DEYPaATJoUbnoKKFp5dtK9741HxTbX/fG4Xpyxw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB5819.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 06:11:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Tue, 28 Apr 2026
 06:11:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "patrick.vogelaar.dev@mailbox.org" <patrick.vogelaar.dev@mailbox.org>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] Podman version mismatch
Thread-Topic: [meta-virtualization] Podman version mismatch
Thread-Index: AQHc1s6CMp2ikxBqpUyDc+vgAkY2F7Xz+9Yw
Date: Tue, 28 Apr 2026 06:11:51 +0000
Message-ID: 
 <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <255898079.381409.1777353521045@app.mailbox.org>
In-Reply-To: <255898079.381409.1777353521045@app.mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=56571dcc-9168-48ee-8b7c-240ec8e215c9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-28T06:03:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB5819:EE_
x-ms-office365-filtering-correlation-id: c2a6be95-d612-4104-aaeb-08dea4ed0a31
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|55112099003|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 IZzFJI4SQbqI800jTw8lOQYyx02RkZtf3fa0Fb43LGwY/nf6UppmARLyh/8pDdQaMrHeiKuZLZ2uPpbaGC7UL8m28gvj90RMfRIsFocTHqv6UkpH6lrjeIXY98kL1awOXYfUtLONz38Zuq0Zgvyy7apsfy1j2vRtn4Ky3weIOu7BqLWm3dfn0dLLXjjE8SVgDQG34SKsFueipvFYO6zvD2+f+zSD7WY5UOThrP4PbShTjS4GXAtQ5oJr8Vz5P9ynPo2SHtd4HadrvX6KmiGNgfvRLyNhwChKrT7VupOrBgTlp6hfl6APK9FO3qMb8YVdQIsqWr5xQEmFBNv6O6X8EinaRaflsywkYoMKFiPtPUUEB6U4sMNu25LhawC6vGtr3FicHPEhHtDoUoQFrARJdTPlLL4NUixv2hstoK7dyK5uofGtDezsGRK8wTDA74QI0P677gfx8umDtYOO6jJsv/22baW8h1EHS7m2gPLY3W13m0wClWiAFSq6taXAUX76WqfB6j1a7xmR6aTt3lj16GVRiiuwpw27fzf2KUkPRhw6UfF3Jrbks66MUpw+85QTb8zfaIrXG4q++hZVYxZnYbkknkA857coG6OEyW9L6UxNn759JYuh3tUIEQbTMeCulQlsOrsgCGIvb1GXSHCLlkJNJ4IfWMm+XSEWIRU0dMSuO50yDlMX0ngZoWHCylSIV5tKj6j7fGoP/b+HVdJ74q1EtF3rv4yZ3WT5iWrviWYIZxqGCDM+ISY/lWdBWRomXOWyFRtEapZtDZEGxnvfehnyQKc3OBks4w//ajx3QUE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(55112099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEhCYVZqYS8yWFlGd3pnOXBBV254bUZOQXV5cnJTam5WMXVZY3hWSEIrbG5X?=
 =?utf-8?B?YjhwNU1kejAxY3BXRndSVUx6cG1jeVVLWTA3ZkxxMWJ5S0xJbndFaXYxUFBa?=
 =?utf-8?B?cklwRU16MjdSUU4wRGcrL0ExcjlMZTJaRDdjbk9SenRqUkp5VFNtd1dFeG5h?=
 =?utf-8?B?THVEREZ6cjhjSm4yNGxpd0NhZFB4NjZOWThWWnBQdWZxd1o5VVFIZUxLR0cx?=
 =?utf-8?B?QXZLaE8zcDFOMVp3c2IzazYzekN5aXh1TGZLNmtldkQyWERTMS9qcmphdE5G?=
 =?utf-8?B?b2dkdnozV2hGWW9UbkZHdTZTbEpGaFkzOEp5dEpvYjZiY0hnbHVnQ25HWUZl?=
 =?utf-8?B?WEhpUHZiMWFmVkUwRzQrWFpsTndxRWNxaUhNS1YvekJoVUw0Q1gwOFZJMHNM?=
 =?utf-8?B?MnUwWXFmdkJrd216WXNuM3JFMTM1Wm5NV1lMWnFIOGtZVGUxTUpWSjdhNjFY?=
 =?utf-8?B?TE1xWGtwQmpnTWNmS0VZNkM4SmVwdGxaVjF3SWt6ZUJkU1RtdHVWVWVKZ3Vr?=
 =?utf-8?B?ZlhJd2hhWVlmdFdtOXlPM05DTEtEMlZRWWZhc0IzRS9aSXBjakl5Z1o1TFJK?=
 =?utf-8?B?U1NjNjMyeGVMZE9vNHZuNnBJNlN5bEo4YUJ0WUJMWlAvSnlOamlOSUxrTTBV?=
 =?utf-8?B?UE80bFJpOVpzK3UzaUZ1QzQwaWc1YUxhRkVhM2pKN1IvdUNaWlRxTC82cWNP?=
 =?utf-8?B?ZklLSVFjdjZnek5ZVGZGeGM4L0dJV0w3N1VTNDRNditlRUpKRmFxOVdEZmx2?=
 =?utf-8?B?Q3JNUnN4SllCeXBiRDJ1QW52VjROUGluOUp1ZmhLcEJ0b3ErT3NwcEkranc1?=
 =?utf-8?B?OEhEWmQ1RGlzblBCWVZJLzZPUnN5WnJpRTBvOUhjOVd5a2RwYU9rNVlUZ2Iy?=
 =?utf-8?B?VDFyQm1oVWNJWFhyUEoySGlibXBaT3RTajMxcHhkcURnTnZTdE51VGozS20v?=
 =?utf-8?B?cGExdHEraDZuMFhSbXZpaGRrQjB1eU9aQm1BR3lBNFFQZkhOTlA3V2RTSTFj?=
 =?utf-8?B?aFltNW5WNG5BbGxzS0g0NVdZK1dIbGVJdjF2YXRlR2NudXo3OUQ3NkIyQXdV?=
 =?utf-8?B?b0hsV3QrWUtxRFdwN1BnajNCdUlxRzM3YzVscFhyTUNvVXMrVWpGNlhDM3JR?=
 =?utf-8?B?QzhDdjNOdWdIMTF2dlg4Nk42dEZTZWNuMXRhUStld3crZ29yWC93Rk5PZmVi?=
 =?utf-8?B?cGRrZVpPcmY1ZEtXQnZsekRaWklVbCtEMzdkTXpsQUUwaFRQd3lGTFUrc3lW?=
 =?utf-8?B?MDkxS1NqbmtENXppV2JjTGFQYUQrODQ3enBDNUJ6NGZlTTd4U0tqcnlMZE84?=
 =?utf-8?B?UnRpNXhaRVJLNDlXL1k0eHF6Skg0ZnN4V3pOZ0x6UTBlSEZVd0xIenZva01Q?=
 =?utf-8?B?TkNEVVg4UmlVaWFXVk9VQkF5SW9mQkRKblllcFpjWmZIVEY4QkdEZkh2RVlo?=
 =?utf-8?B?QnAvb3ArR3VSejNsTzVOZWN1d0xxT0tVK0VTRjRTNVVZTFA5QnlKZ0R1Q0NG?=
 =?utf-8?B?ZU0yK0VmZzRON0dvTlZNVE0ydncxdDh1N05jY01yVXZzY1E2aFlhM1RaaXEv?=
 =?utf-8?B?dmZYVDB0WVJQdXc5WVY0aTRhVlQ3QzJvUHV1ZkJQNjZkU3h1ZU5KbTYzNTBX?=
 =?utf-8?B?VnJ3VGVLcFZwWUsrMHRBTmtxTjNIR3A0d2RQeW8wK080YzVpNTduMnVERXVz?=
 =?utf-8?B?YzZUZThGNXZmSmE1ZUNXTEhRNVo5SzNOZUpUYzJmSWdQdGpzaGlWOTJiMGNw?=
 =?utf-8?B?UGRNUHEzbys1VndSL2pUYUpsU0QrMVh4Y3VQN3hsYnV6eG1mVWZCTFd3Njd0?=
 =?utf-8?B?QVBVWEtPNUdBVkhhQU9wYmFHVXBiRWZYcVJmUzJyUUhTZVIvWDgwUXE2UC9B?=
 =?utf-8?B?anlEVWdWY0tUWU5xRHdiZVRBQUFwRTJrM2xaSld2MUs0NnF2UWFEMjJmSE9C?=
 =?utf-8?B?RmRqeVZLc3hNaWdNbUJOcURYYnA4UWZzdHp0N0UyZWg2UlYyRGdvQ2ZOeENI?=
 =?utf-8?B?UzlwWjdoa3V3Smt0aUZCTUlTMkRQak8xNnpMYlVkQTBYb29oRXhzK2pjZkJS?=
 =?utf-8?B?Z1YzdTlCSnFhUFJTRUcyVFpYS21pY3A3SDRkSlFmaG9KUkQ2RE1yRWJTdlh3?=
 =?utf-8?B?NlVtY051a3MwNUpQYVAyUVhYYURvbEpFWlhJMlhEbGRPOTRKdjNxdWRaMjEz?=
 =?utf-8?B?UnFtbE55OGV3RjY0NnB1NTVWb0NpeEZ1a0R1VWlZWkJhN3djWDg4b0lMODRm?=
 =?utf-8?B?NEZ5OUZJMWV1bVVBekt3RWRpVXNYOFNsTXZkcUk2cXpnR2xzRVA2K0tBS250?=
 =?utf-8?B?VXZxS1NwdHAxYTRKYXNwcEJSckt5bUpaWUsrYnlEVi9FQWtLWEovZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a6be95-d612-4104-aaeb-08dea4ed0a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 06:11:51.8303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mncksTjo5QCCU2orLo7W10ecm00XxAo86wEwkISz3p0suJWXkXV0+kDKWxQITanfby6h/c2k0yMbQcUQKNz89w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5819
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 06:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9755

bWV0YS12aXJ0dWFsaXphdGlvbiBoYXMgaGFyZGx5IGFueSByZWNpcGUgd2hpY2ggZmV0Y2hlcyBl
eGFjdGx5IGdpdCB0YWcuDQpTbyB0aGluZ3MgbGlrZSB0aGlzIGFyZSB1bmZvcnR1bmF0ZWx5IGV4
cGVjdGVkLg0KSW4gdGhlIHBhc3QgSSBoYXZlIHNlbnQgY291cGxlIHVwZGF0ZXMgdG8gbWFpbGlu
ZyBsaXN0IHRvIHVzZSByZWFsIHZlcnNpb25zLCBidXQgd2l0aG91dCBzdWNjZXNzLCBzbyBJIGdh
dmUgdXAuDQoNCkhhdmluZyB0aGUgY29taW5nIHJlZ3VsYXRpb25zIGluIG1pbmQgKHJlcXVpcmlu
ZyBhY2N1cmF0ZSBzYm9tIGFuZCBjdmUgdHJhY2tpbmcpLCBJJ2QgcmVjb21tZW5kIGV2ZXJ5b25l
IHVzaW5nIG1ldGEtdmlydHVhbGl6YXRpb24gdG8ganVzdCBjb3B5IGFueSB1c2VkIHJlY2lwZSwg
Y29ycmVjdCBnaXQgaGFzaCBhbmQgdXBkYXRlIGNyYXRlcy5pbmMuDQoNClBldGVyDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLQ0KPiB2aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3By
b2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF0cmljayBWb2dlbGFhciB2aWENCj4gbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAyOCwgMjAyNiA3OjE5IEFNDQo+
IFRvOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVj
dDogW21ldGEtdmlydHVhbGl6YXRpb25dIFBvZG1hbiB2ZXJzaW9uIG1pc21hdGNoDQo+IA0KPiBI
aSwNCj4gDQo+IEkgZ2F2ZSB0aGUgbmV3bHkgdXBncmFkZWQgcG9kbWFuIHJlY2lwZSBhIHRyeSBi
dXQgaXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBzdGlsbCBhDQo+IHZlcnNpb24gbWlzbWF0Y2guDQo+
IFBWID0gIjUuOC4yIiAgYnV0OiBwb2RtYW4gLXYNCj4gcG9kbWFuIHZlcnNpb24gNS44LjMtZGV2
DQo+IA0KPiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgcGF0Y2ggb3IgZG8geW91IHdhbnQgdG8g
aGF2ZSBhIGxvb2sgYXQgeW91ciB1cGRhdGUNCj4gc2NyaXB0Pw0KPiANCj4gUGF0cmljaw0K

