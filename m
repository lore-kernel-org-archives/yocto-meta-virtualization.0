Return-Path: <ksaye@saye.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41C9C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 19:23:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.130])
 by mx.groups.io with SMTP id smtpd.web08.8555.1665170623770021509
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 12:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sayeorg.onmicrosoft.com
 header.s=selector2-sayeorg-onmicrosoft-com header.b=I7GSx9hs;
 spf=pass (domain: saye.org, ip: 40.107.94.130, mailfrom: ksaye@saye.org)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df5TYZq1+iUqU1ubXsv4syHquFodhBhEQrwl7W+yKC6J8rqgrX/ujDjbMHVGkAy/MW31MQl6gH5T0emV6pIrfaWJdlqyCXMAW0Y/LRjaJ6onR+0mNPbmD68Xzl0r7XGWY6VSmcyxwIlK8ay6w+FzXZtpOC//eZz5rIcMITdOAEXGlXUk/CZV7atSclwQVG7sRTcU/hvkWJbsNjhOmVTm1bqCbXNquuTkheQO9QjEmcYEpNzrOxDKDCZEdEDDx95T8XL0mYjDYtqOR++0M1n2h94ZLSktyLa1Ss4+wFkcEnSGzX7D51tY9I7fNldboBvSefgPnkQt0uLKdqGEyOOBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PuMVLVMnkoVDTX1OZj9b09gG2ENIdFHPQ3Y2NzMcJA=;
 b=aIYwqUI/YGpHJBMlovTQ+/sLwaggFqMQ4a4Zn5P+VHPtkFfJB5ehq1JaSBNgGNb+hEVkz/PK66tzQeScJFxmIutgaYjH7Cn9v1yWaLl72wp9xdV20EuYD5/1uRGoC9LLig62XwiDgz8dUNHFdgF8c51xuAis9cNRvv5jd1ZURHIAUbki6JIelo/j4uFmJ9DsB2ixdvesQv6dOc4zV/0ayLyGwMHQS+qXvXBm1Q5q+ElF6Wax9rz11UBhem6Bn5qCAjmWJvCuk9z0EBIgm7ULYIflDdTJLe9b9aiTM/pgkN4AQalCwfN4ZB/BWVlI5dD6pxKJtvdZe1ICDFX4A/pB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=saye.org; dmarc=pass action=none header.from=saye.org;
 dkim=pass header.d=saye.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sayeorg.onmicrosoft.com; s=selector2-sayeorg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PuMVLVMnkoVDTX1OZj9b09gG2ENIdFHPQ3Y2NzMcJA=;
 b=I7GSx9hsIybv+v4Onp26id0sWeTCXzvAGI8d9a4FCUIHjvvhQ1Htd1Tc4xVra7XRRZt8vxjN+4ASFIdQAT+yHJtXptCIWhHz9FP/S4SkRD2W24++e5MbsPmduRJ9CcV0RHYwbErRZaU2z1pyyoJUr04ESyQZf8wGdu5vdpUph0E=
Received: from SN6PR03MB4127.namprd03.prod.outlook.com (2603:10b6:805:c0::25)
 by SA0PR03MB5481.namprd03.prod.outlook.com (2603:10b6:806:b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 19:23:41 +0000
Received: from SN6PR03MB4127.namprd03.prod.outlook.com
 ([fe80::f6ed:661d:fb14:afd7]) by SN6PR03MB4127.namprd03.prod.outlook.com
 ([fe80::f6ed:661d:fb14:afd7%4]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 19:23:40 +0000
From: Kevin Saye <ksaye@saye.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] Breaking Change: Github disabled support
 for git://github.com
Thread-Topic: [meta-virtualization] Breaking Change: Github disabled support
 for git://github.com
Thread-Index: Adjafwn1cPgevEyhSg62MpW2zevRSwAAofkAAAAhGUA=
Importance: low
X-Priority: 5
Date: Fri, 7 Oct 2022 19:23:40 +0000
Message-ID: 
 <SN6PR03MB4127F3EFA0C9E68691D9878CC55F9@SN6PR03MB4127.namprd03.prod.outlook.com>
References: 
 <SN6PR03MB41278821A2E85FF22A8FECD7C55F9@SN6PR03MB4127.namprd03.prod.outlook.com>
 <CADkTA4MUQxP-_3ioLKpMU3PPNV5V9JnvuV+QTcj4wBwsgtVxYA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MUQxP-_3ioLKpMU3PPNV5V9JnvuV+QTcj4wBwsgtVxYA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=54f58053-9658-4d50-a19d-fc4fdec22128;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-07T19:22:06Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=saye.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR03MB4127:EE_|SA0PR03MB5481:EE_
x-ms-office365-filtering-correlation-id: d9d80033-c9ac-4b32-e50d-08daa8997127
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g7NRjQMFJhEP3xdiE01wRgs8VINVbOJE+nDSkd1r1TrSvwvM/bVKpXhdICbBpVnLyU7UGoffCCw3WcpyPqFIGwuTL5v2iViiEsMOPRR32vaVOWEbYt479olEH3/nwVawfLG23E50rXNl5zsOulk75HtRpx9xwZ03dRTfmcxl9BB+bol1NA0O4yJwyQG4g6uej6IuNtUeFwDCrZm4oqoC9bRt0MULRohl23pfa9XYV7pF11Mt6gkaL81uXb4DBOPNBucKbeKvwAztdvcKEkvEatOP6E2mtdQpdDH/Cfiiq7YNe9Lxiyime03OI99xifybSUhzPo5FnwjGndoXEmBeL55T9rodr8GWS+YTO2BM8rnUIbUC8a5zW6SDcW1Ct2II/ACY0PrPrSufSHrPEXCb78aO9OeZfrzfdn2ch/Q5uNTain8CGFhrYfV/S/As6FG6/jZw9q+KNyrlge7OZZHx1CMorcLkMZkrQUKv3R7YaujTfRg1zE5wCafq+/djmYqN/BdHooYb7AMBSPCJ32PKF/ioiXHVvq9KV4IN22Mhok5tHRXRBsaFCFP5tEs8DVw2BAzb36pu9tS5W+vimgf9TRqn8iQrsrhFtwmrZWRwJoa0HtekpxLykP7WMriv+/U+8rAj+YQ+RtEbABu8C+Jqa5VAd9AAf4Z5Vee9ph8ftiE8IZVs6pLhSFzHILqQPxPixRgjGQGtjsrpRpU+j4Tv27oQCatQaPNO8Uywg+BuyCtr4+8XFFByxmEvfFNEficPUtVz3so/JQJ2bO9W/Av51geft4mezF/MRtlkAWWmxUY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB4127.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(366004)(39830400003)(136003)(451199015)(66899015)(5660300002)(38100700002)(71200400001)(966005)(478600001)(33656002)(2906002)(316002)(786003)(7696005)(6506007)(76116006)(6916009)(55016003)(86362001)(186003)(66476007)(64756008)(4326008)(66946007)(38070700005)(66446008)(9686003)(41320700001)(66556008)(8676002)(52536014)(41300700001)(8936002)(83380400001)(26005)(53546011)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VmtncGV6MFZFaHFVMEFqYnIzNm1QcnkvNTJpSVh6RVBrNWgyb2JaWHpET2Uv?=
 =?utf-8?B?M0tTMXFaWDI0dFpYbStwek5ESWk4Q0ZCeFFVSnJyMVNSaFlwQnZQK3pVaWVI?=
 =?utf-8?B?UmhGQjZiamxkTkVBQ201VU44Ty91b1ZRb1h5NC9HT3RqNCtZTGlCZ0JPMkdu?=
 =?utf-8?B?dFhXYjhGc1JwOHA1aGhoK2hRTDY1czNGRE95WW55NFoybFNacEkzUzNGU2p0?=
 =?utf-8?B?bExYeHhJVGJ4ZlZEcDFUZnZMSmgwSm5jbnNzNS9aOCtKSG9WVXF0M2tSdHlN?=
 =?utf-8?B?VENnSlAxdGNsb3o2SEQ3SWUrWEVVWlRTVmxLVkhCT2lzT2dpdmJ2V0FBeVk2?=
 =?utf-8?B?ZDR0REpuVzl6M2dsTTk2MWlRcis0alM2TkxoT2p0OENvRS9DZWMyeUFkSXNJ?=
 =?utf-8?B?Tm5sN3NCcHpjVHpndmJkSDNhdkdBdTVnQVc4b1pURUFTR2Z4aHNWZUtXdXZk?=
 =?utf-8?B?QUdFUDlyTWxsMlpneXc3TnVNN1V4Nm12OFlLNlhUd2p1QnpoclQ4SkNzYmRC?=
 =?utf-8?B?MTBHTDk5b0djaVkvRFRpdG5SY2VBVDJGaFZWWlVwckZUaHlQNzBndTRmY2pK?=
 =?utf-8?B?RlNwSlcrU0lvcFN3M3ZQQVJsbGlTbStTR0FiMTNIOG9jeDNReDQ2U0xmSmQz?=
 =?utf-8?B?QUlOMUQ3cnRBdEdMa3VzRFJXSW5yVnNCMld6dWs1SFRwSitVSUpmYWg3cVNY?=
 =?utf-8?B?b2lYTDVCdnVQWnRqTGFLczNXdTlpNkllSXA4cWZ4bS9JQ2FoblAvUzhOdEFN?=
 =?utf-8?B?WjV0REs5UmlCQWRTd2pnSG92NjA0R3N3SjFEK3V6MG9pOE02bWFhQTJQamw3?=
 =?utf-8?B?ZS90a0dzRHViQ0dPTDZXRXZXVjF1dnlnRzRyRVI2aVRuYmNPTjFHb2NURkR2?=
 =?utf-8?B?MWRzTi9BVE0yOEFPNURIcCtmajRhQ1JsdnFMWVNBdURCT1VJa3lkNWd2RDhS?=
 =?utf-8?B?OFpOREVJQlYzWHkyTG5GcDFGK0drWHBUd1lmZEcyazJjVHRRTGd2RzdLeGxJ?=
 =?utf-8?B?TFFjUFBnaTRIOHQzbTNWeVo4aTE4RDM4RzdRZlNwdzBtRFVJdmdnanVpT3kr?=
 =?utf-8?B?azFEelFrNmlRU1l4VmJUcjdHZU1kaW81TGFEQmdhV0JDWEM1eFAzM0tpZ2Vn?=
 =?utf-8?B?OUgwdXJRZC9NL0Q0NmFYeGxCNWIvL2N4Yi9hQ0dMbjE5eXBwNUFRMm9yajBu?=
 =?utf-8?B?TTgveDZyc1lwOC8rTGpFeDZhK091ckNySTZrVGkxcmdvbHlOZ3d3dkRTN3ZE?=
 =?utf-8?B?RzBXdE9rb0VHd1p0Q2pUeXVGSG5Ka3FBT2ZJV3NqSXE1VVdMUHBBcGVPemR1?=
 =?utf-8?B?S05FYlluN2Y5cDJKbDlLYi9EZ1FUVlFyRGFGbExUSG5zbHh5T3hWai9wSkhl?=
 =?utf-8?B?N1RZV01McEd4YkVxMU01dkRUcjNIdU5oY3VHZTJPRFM3VHVKcktpMFJwV0oz?=
 =?utf-8?B?TURMQ081OG5xbDVPREZqY1Z2KzZNQTFsOWM4SnNEZUFqNlYxWDJNWjQ3S29X?=
 =?utf-8?B?WHlLZlhQVEVrV0tURTZ0TEkvVW9XNWJ3OUZGQ3N2eEt4dzNFY3ZrVmFwMFBN?=
 =?utf-8?B?L1RIUmIrWXlmeUNBTVJPVnQ5bmxVbS9kWEpiS2dXVFA4KzFPOXV6RWx5S1A5?=
 =?utf-8?B?eHBGVWc5TC9Ja1hIcms2Q0VWTXRjTEFFL2cyS1FYejl2c0ZEbndiQUIzK2Ji?=
 =?utf-8?B?L2d2bVkra0MyWHI3WWRzYzBNaVF2MzlEeHM2M0tlT2tmclhKcGNvc3g2QUZY?=
 =?utf-8?B?Z0hYQ0RPeTFSSlpta01IRFFaSThqSUhGeFpUQWtDaThJYUFvZzdnTUtKSmVL?=
 =?utf-8?B?TlZtV3BmU2UzcDFVcEVBVm9wcFQvdXRaYmtacDZEUVRpZGhPS3JucDdpelFQ?=
 =?utf-8?B?SU9NRTloZXZCa3o2eFRSMkVEVXZQalhRUndEZUQ5bVJTcWtIWmNwK3djSHk2?=
 =?utf-8?B?SVlnbmRJZmN5c2c0dCsxNEI2YzBSbitLVmFNdHQzU3VWQUJTTC9nYWZrVHEz?=
 =?utf-8?B?U3FXcTZTMVMvTGVZT3BxMkRoQWhWRzFUMDNlS0tUMGhWU1NaMmU4UVRjL3Rn?=
 =?utf-8?B?UG1jWVBPVXlQOXJzQXdZazZlT082K0VndldMTU8rN2R1Zk5odWo3ck1XaGpE?=
 =?utf-8?Q?HM/w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: saye.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB4127.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9d80033-c9ac-4b32-e50d-08daa8997127
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 19:23:40.8092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e07ddb96-c37e-46dc-a3be-d6fb8d768523
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 eB1uhgmde4xC9Rg48x/KZR5F2AIXQOTLLcvRcrGQOnIxNQztjNE9Mn2dNF0VYj9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5481
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Oct 2022 19:23:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7649

VGhhbmsgeW91LCBJIHNlZSB0aGUgIjtwcm90b2NvbD1odHRwcyIgaW4gTGFuZ2RhbGUgbm93LCBJ
IGp1c3Qgb3Zlcmxvb2tlZCBpdC4NCg0KWWVzIHN1bW8gd2FzIG1pc3NlZCBhbmQgSSBoYXZlIGFk
ZGVkIGEgc2ltcGxlIHNlZCBjb21tYW5kIHRvIHJlc29sdmUgaXQuDQoNCksNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IA0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDcsIDIwMjIgMjoxOCBQTQ0KVG86IEtl
dmluIFNheWUgPGtzYXllQHNheWUub3JnPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXSBCcmVh
a2luZyBDaGFuZ2U6IEdpdGh1YiBkaXNhYmxlZCBzdXBwb3J0IGZvciBnaXQ6Ly9naXRodWIuY29t
DQoNCk9uIEZyaSwgT2N0IDcsIDIwMjIgYXQgMzowOSBQTSBLZXZpbiBTYXllIDxrc2F5ZUBzYXll
Lm9yZz4gd3JvdGU6DQo+DQo+IEFzIGZhciBhcyBJIGtub3csIEdpdEh1YiBkaXNhYmxlZCB1bmVu
Y3J5cHRlZCByZXF1ZXN0IHVzaW5nIHRoZSANCj4gZ2l0Oi8vZ2l0aHViLmNvbSBvbiBNYXJjaCAx
NSAyMDIyLiAgTW9yZSBpbmZvIGhlcmU6IA0KPiBodHRwczovL2dpdGh1Yi5ibG9nLzIwMjEtMDkt
MDEtaW1wcm92aW5nLWdpdC1wcm90b2NvbC1zZWN1cml0eS1naXRodWIvDQo+ICN3aGVuLWFyZS10
aGVzZS1jaGFuZ2VzLWVmZmVjdGl2ZQ0KPg0KPg0KPg0KPiBNeSByZWNlbnQgYnVpbGQgb2YgWW9j
dG8sIHdoaWNoIG5lZWRzIHRoZSBtZXRhLXZpcnR1YWxpemF0aW9uIHNlZW1zIHRvIA0KPiBmYWls
IGJlY2F1c2Ugb2YgdGhpcyBiZWNhdXNlIHJlY2lwZXMtZGV2dG9vbHMvZ28vZ28tc3lzdGVtZF9n
aXQuYmIgaGFzIA0KPiBhIGhhcmQgZGVwZW5kZW5jeSBvbiBnaXQ6Ly9naXRodWIuY29tDQo+DQo+
DQo+DQo+IFdoaWxlIEkgYW0gdXNpbmcgc3VtbyAoaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9tZXRhLXZpcnR1YWxpemF0aW9uL3RyZWUvcmVjaXBlcy1kZXZ0b29scy9nby9nby1zeXN0ZW1k
X2dpdC5iYj9oPXN1bW8pIGJ1dCB0aGUgbGF0ZXN0IHNlZW1zIHRvIGFsc28gaGF2ZSB0aGUgaXNz
dWU6IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS12aXJ0dWFsaXphdGlvbi90cmVl
L3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tc3lzdGVtZF9naXQuYmI/aD1sYW5nZGFsZS4NCj4NCj4N
Cj4NCj4gQXJlIHRoZXJlIGFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gcmVzb2x2ZSB0aGlzPw0K
DQpXZSBkaWQgYSBnbG9iYWwgdXBkYXRlIHNvbWUgdGltZSBhZ28sIHRoYXQgcmVjaXBlIG1heSBo
YXZlIGJlZW4gbWlzc2VkLg0KDQpKdXN0IHB1dCBwcm90b2NvbD1odHRwcyBpbnRvIHRoZSBTUkNf
VVJJIGFuZCBpdCdsbCB3b3JrLg0KDQpUaGF0IGJlaW5nIHNhaWQgbWFzdGVyL2xhbmdkYWxlIGFu
ZCBvdGhlcnMgc2hvdWxkIGJlIGZpbmUgYXMgaXQgaGFzIHRoZSBTUkNfVVJJOiBTUkNfVVJJID0g
ImdpdDovLyR7UEtHX05BTUV9LmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyINCg0KQnJ1
Y2UNCg0KPg0KPg0KPg0KPiBLDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzc2NDcpOiANCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvbWV0YS12aXJ0dWFsaXphdGlvbi9tZXNzYWdlLzc2NDcNCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvOTQxODY4ODgvMTA1MDgxMA0KPiBHcm91
cCBPd25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+IFVuc3Vic2NyaWJlOiANCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0
YS12aXJ0dWFsaXphdGlvbi91bnN1YiANCj4gW2JydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4NCg0KDQotLQ0KLSBUaG91IHNoYWx0IG5vdCBmb2xs
b3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQg
aXRzIGVuZA0KLSAiVXNlIHRoZSBmb3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkN
Cg==

