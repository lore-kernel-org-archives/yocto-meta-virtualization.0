Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6275.1794000256957483858
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 13:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GoVv3J5I;
 spf=pass (domain: siemens.com, ip: 52.101.65.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGdJdpvFtV9pi3CuyG3jSdHH3qfaLqiYSthtSd5n9Ru0NCN2SVIqRSW2YOC4NOO3qhxnBCUQuz4AMVypnHey2N7O8d3tzE8nGKvvZTeh6uuTEttjvHkBSs6Ma+Rmvf4RqcfC2bRRs2EvKk1/zDtzEVefDT+CE7eEdEgTBHZPJoxs/lcExvQ8WLtt2IgBxvfrQ8vgsSCWAZXy2e8ZVps33jZ9D2Pr/iTOodGSA2m5K9pplcophlyBLicgC7q9X6BE3ZbqGzVFQLLbug8Y30qyhkupsrh/07J2fQsd0Uw93ChEEs0Y23HWB/pkGPSy3Xp+uAzKGTsXyLJoNSr+es9Y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqHY9W+6nWOGJgDhlq9rI0g76L2RhjdIqoH+hA4tZXU=;
 b=jhHvXsliNMysZyYcRzgGC1kcKuigKExxp7ZfcKIWVe3e7h1Z2HZ9kcf6gX9MomVVfq5op9Lp+BYd/E1fDUktO+qH3xUWFm7ThdBi1JfZ4S0w0PXNrAtPHIg39jIOFkf310WqtXB37YYQx9MHFgxc/zDFfoAfA7R8QYuD6ZfnzIMP2uy+akqg1k7BG8/Ist1k4ur6cse6hAq0ust+RCJwNQJI3KOwb4nBwDtF4Qz5RohLID7ImdJj0IO5dHhChDTa/qdnCvrR/u8Qi0x1otAW8ZShXIJ8Dqa+clZhU8p5uJtWsC7QTBzW8xQgXCGPigZ1rOM4vRmP6x3Qb9GjQSWuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqHY9W+6nWOGJgDhlq9rI0g76L2RhjdIqoH+hA4tZXU=;
 b=GoVv3J5IiM5WPeGIz9dA1/WfQNHayjjuz9XbCFCQybTKl9vpM084QTGrGqhA6oqgCB0ekPXMmfk1z8temLYjNs5lGlwZic38o56HR2pC9ODvOebrqbNWSWelU8r6c0QXAc4kZ+epKWQqBapZvQNR7ZUrnaHwyg4xbIoSzNdYWENfZXIz+LBQCDWrLwA0mCoVr4b8u1jhvRU0EY4icDaL4s0eT4OExAY2xttR3wN2JcdV408ka+oX93WPCCAdMukIjS9p4SPwm5CBTxUyr0IE9UEbzmqRE/ijybrtpiybRwcHFECRZTVIc684Wy57+3TEFhZB9+FQzLQ/YsLN0p4Vyw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AM0PR10MB3250.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:189::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 21:24:13 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Fri, 6 Nov 2026
 21:24:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] podman: set status of several CVEs
Thread-Topic: [meta-virtualization][PATCH] podman: set status of several CVEs
Thread-Index: AQHdZ95y/u3FQEZuy0GT3RUYBDbRF7cfteSAgAHkk8A=
Date: Fri, 6 Nov 2026 21:24:12 +0000
Message-ID: <AS8PR10MB50735BCE1FB111C4E5143FBAFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261029194748.3069710-1-peter.marko@siemens.com>
 <6aecaee3.d56dd9d0.9301c.8eb7@mx.google.com>
In-Reply-To: <6aecaee3.d56dd9d0.9301c.8eb7@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3715fcc5-ab86-47e7-80f4-c973a50eb770;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-06T21:23:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AM0PR10MB3250:EE_
x-ms-office365-filtering-correlation-id: e1242ef6-3ff7-4e06-b294-08df3c4c4ddc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|22082099003|18002099003|55112099003|38070700021|56012099006|11063799006|261026121527099003|4143699003|261026140227099003|261028144727099003|261022105027099003;
x-microsoft-antispam-message-info: kuTpPL5wl3lIafedbgQiRf4f4FawAAgyENDt0qhi+uxAHRs9NlcSbOs4TvlTMshd/KTc/odEUul/85E+nkIg8DCqGPCghOcxIm9lC2Iz7Xy+MfnWlNFXlcPojFdHtmHi22EdUi/+3njzJwPrvWQKAKosPlUwGLT3kmpUPg1bCvwzHBHb+uBJIrF91vA3RmCAoqpdNSzPZINRgISFvyjGZuFpYKncsKrjYgf6htCn336VFl8h1KgLIs36ntg+6c6zxKJkGJg5cAn5Ifv+vdUuAXmhJuI4gpAvvGhNXgagL/3qNrhoffuOoNtynTO0kEDxeT5i3eentI3PBRgfW1vSRu7jNkuikI9oJtDQj3A34/7MTKX5c4PtkF3PNEE2nxgjMiPi/ym7bNzcvKLvMvlFX5h71RNsQqnz81+7ksTHxBANYA0E2T0UgyKMDK6yKixakxCS7nQBa+HIjZ7fwa6eT731MUdC215TOLb2D0wosSAgiTOfuwNu5JgsE5jS/HZKMyf+6YGhfyyszn4a+CJpXPwbxmnq7BNgS++8BV0mIlmk4uR3tkCUUMiwNfJOcT0Qs7joyUoc2Jqv8k7B0vs40FUVthozxVmWcGvQfsrgZanC1naaUTTcktP77b1Nt9UHhb7xv+vEqrFNMxRUUA8IslHvqq7jx9vq+dgou9omm1GMDPV4EzpE46zY+Fm3Eb3coc5C4S5JG2oIn3mbTbRvJEUDMEWh6lf1oVRv+CDsibc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(22082099003)(18002099003)(55112099003)(38070700021)(56012099006)(11063799006)(261026121527099003)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KytSYUZibWUzRGs4N2UrSExFLzJjMTlHR2VSYUNsS0FZclhZRDdIaWpYT29B?=
 =?utf-8?B?emJva1lmcjFHRnR1NmZqMFNYR2dRQ2wxMUMzRUZVSGpRVUVwSHdSZXBVZ2Q0?=
 =?utf-8?B?bTFCSU9pMXAreUVnWUVlVUVNdWJrNDBMMHVJSjZBaCtXSC9SQWZVakoxcG9G?=
 =?utf-8?B?UUFyY2xJM21ZZEVKemFzck5oRU8yTWZ1M0JhV09tSHpRMnMrRlh3NER1bU9X?=
 =?utf-8?B?UzkyTVJObXdzb1ZkNWJ4UFU0VUlGYnVEU3dESmt3cDhOTHV3ZXFNZVZnV2o1?=
 =?utf-8?B?eUlHdEVZcE15Q2FkWFFqMHhjTjdPU2d6Qm40VXF3WWM2M1lZLzZWeG5oeHk1?=
 =?utf-8?B?QmNINHVwWGo3eHk3U2grZ1pTNDFGeVVTK0VpQnNXeGI5dHp6WlFSakptV05W?=
 =?utf-8?B?RmRwcmFCejVteFRrOE1HdlJKMlJweFVBRmE3c2dyZzB2MnRqMmRCTHlibVVh?=
 =?utf-8?B?MEZ3clNEMTJxTVNaRitrTTliNXdKUmVacXMyMmhDNnRtenhtV1BQQXJLUCtH?=
 =?utf-8?B?WFFSY0N0eDFBNHJYWDJtM1lVNjRwMlZLcmMyaEpBSkhxbHI2YjBSaTk3b3dQ?=
 =?utf-8?B?MXVZTS9adXNwRFJlQjE5cHo2MEdGUys5Z1RTT2Q1dHN2c2IwRjR2eitVd0ZS?=
 =?utf-8?B?dU5UZitYWkw4RUp3SG9HVGd4Rmc0S3Q3RnFJdTFuTnk3ZDF5YUs3LzhySGM1?=
 =?utf-8?B?bDBhMDFveHRTanhvQXJFb2pvSnFpelR0MmtobmEwNUVQL3JDTWNYQmdzZ1FB?=
 =?utf-8?B?dy9iZUZLSkFzSDRpUXhEY08vaTdCRXZSMXIyMXh4WUx0TkV3K0U0dEdtdHUy?=
 =?utf-8?B?dU1WUXZEWU5YdTlPREI2b2FidndITnRaL2R1dkRUaCthNDdReUZ0L29HVjlu?=
 =?utf-8?B?WmlucEovaVJZSHN4NDI1TjV4RVpRSnZyVStBWUNScFVxR01QWXc4RnVNL1FC?=
 =?utf-8?B?NmJ2TVlqSC9VQkhnZmRoYTZ5SDlTNUtwSzRvZmh1MlhvOGMvWll5UDQxaVBh?=
 =?utf-8?B?Q21SVG4xZkFVNjFJMmd0MVVuZ0Z6UHE4YndFODNZQkNUWmU1WlFGa29OTlE3?=
 =?utf-8?B?SG5RVzdtQ1dGSk1xNUtWT1BwZE1mMDVVbWhNcFNhK0VQSEhCbUhySkRoRkVU?=
 =?utf-8?B?YkhmSFVOdnppY1diRjNURnFNV1EydkpCc2gyOXk1Z3NHVzd3eWQzeUtaUHZo?=
 =?utf-8?B?OFlhelNQbjdmVDdKNTlIcUY4TEpWb0RyVU5ZVmFDRllhQzlTUysydnlnODRY?=
 =?utf-8?B?aW51V1MvUjVVWDUxYUwwQitzNDNEVTZYT1M2bXpEam1teHN6R2E2dFJSTnhP?=
 =?utf-8?B?N1ZJZWl1QTlWdTQzK2xsbHRQckVXK20rdnNOYW9zN01Ca0RjeDRmaDRTSXRt?=
 =?utf-8?B?Y2JyOVVmMDBRUC9CQWNBdUZhVDhYY1VIdmwwbnlYd3pwNVZDNFZIQ3NDQ2NQ?=
 =?utf-8?B?NmV6ekRtZHRFMHcvTXFVRi8vWTNZcnVUL21PT2E5ZTE3Yzd6alNhZ0Z5c05U?=
 =?utf-8?B?Y0VjK3NMUTU1U1RsWXZ0ZzdxWVVIcURuSDc0UW9wYmNaRjFtZFNqS0ViNFpE?=
 =?utf-8?B?YlZtbi9CejVtUFBYUkRRKys1VkQwQkhVZTlKd1hTRGJ2L3JhZzVWTmcwUCtD?=
 =?utf-8?B?TTY0b01rTnhNcll0cFc5c3dBWm5jdzBsbVRxd1ZqcjZNL1FYcS9EVXhia2VQ?=
 =?utf-8?B?ajZqSE5RQnI3TCsxN0VtRTA4RTZkN3dmcHg3YzI5TGZsSXhMeHJiemQxY2ZL?=
 =?utf-8?B?ZTgyMW5Vc0hmQ3J5Z3RIZ00wNE5LYm9KcW1ReDV4VG12V20yamd3ZHlrWllk?=
 =?utf-8?B?N21zYzZSd3FOdU5yRXNFcmxTMXRENlhrcDJXWEMvQXFKRlNwaTNDaUNaN2pJ?=
 =?utf-8?B?WUZoNlhxOVR6NHRIbXRlcWt3S3BUcHVrT1UvQ3BRRXVHdzFIZCt2OUJtWW5x?=
 =?utf-8?B?YjlaUlZPODBiZ3BqWWwxc0ZUb3JmMStpYUEydnh5dWdhcjFpME5zeTV0SFpN?=
 =?utf-8?B?WnRrZ3FKUUFwb0NpaTVnVXFaZ2UzUHluZHFDZmZZQTJPQTZJQjBjNmplcHRo?=
 =?utf-8?B?eVZkalphMUZqOU9JVXNzelJhVkNBZEZPVTdKbzFJL2JQOTFlSWJIcTYrRFdL?=
 =?utf-8?B?RHNQT1hpd2RkeUxWdEJyYmovcFdWU3Bra0kxVXlSOGJJYjJwNGtKL2RXOXFl?=
 =?utf-8?B?WWpoOFdvdGxESkxTaUJLUGRFdVFhL0xuRTQvOGRHa3BmdFEvWXRzaG9lQ21N?=
 =?utf-8?B?L1FKbnk1a0FDT1hnMkJocmlRaGRHNC9pNk1UOVlxZU9vMnhYVzJobnlOdHo1?=
 =?utf-8?B?dEtzM2FEZ2R1RGw5NXNVdDRDTXZtdTJKU2xzb3IveHJhUEE0NmRzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1242ef6-3ff7-4e06-b294-08df3c4c4ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 21:24:13.0844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtiE3B6sn3dBOhLMxDUUKGTW+bBQDE1QUXtZs/d8kx5v8rNdQYPKhaJ1EgXXFXi1arei07kpBdFDTSC4lj2nUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3250
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2026 21:24:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10163

U2VudCBmb3IgYmxhY2tzYWlsIGFuZCB3cnlub3NlLCB0b28uDQoNClBldGVyDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZp
ZWxkQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDUsIDIwMjYgNToyOSBQ
TQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIXSBwb2RtYW46IHNl
dCBzdGF0dXMgb2Ygc2V2ZXJhbCBDVkVzDQo+IA0KPiBtZXJnZWQNCj4gDQo+IElzIHRoaXMgYXBw
bGljYWJsZSB0byB3cnlub3NlIGFzIHdlbGwgPyBJZiBzbywgbGV0IG1lIGtub3cgYW5kIEkgY2Fu
DQo+IGFwcGx5IGl0IHRoZXJlLiBJZiBpdCBkb2Vzbid0IGFwcGx5IGNsZWFubHkgdG8gdGhhdCBi
cmFuY2gsIHNlbmQgYQ0KPiB2ZXJzaW9uIGZvciBpdC4NCj4gDQo+IEJydWNlDQo=
