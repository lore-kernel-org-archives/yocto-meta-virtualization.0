Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.2970.1607668280862442396
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 22:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8cXsh0R9;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20041.outbound.protection.outlook.com [40.107.2.41])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 5242438C13DD
	for <meta-virtualization@yoctoproject.org>; Fri, 11 Dec 2020 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkLBclFOPb07W2ztDU8D5L7kjGt4m90yMAytVoTBZI=;
 b=8cXsh0R9I0NNBh/VQdSdKMdrnhtmaAjczvrxIvGPf1Wf55sPPEbsDeVJ23QEwdxpRhHByZMU51y5qr2bbGNljWiBfnd61UOGLRq/4CQ0SpKGnMPqT0NBdh6Un2DXRWdQ6WKVRBOru0gIP0Afz6RpqNk96yzhezvPwIVlcvx1Gks=
Received: from AM4P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::29)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 11 Dec
 2020 06:31:17 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:56:cafe::6d) by AM4P190CA0019.outlook.office365.com
 (2603:10a6:200:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 06:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 06:31:16 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Fri, 11 Dec 2020 06:31:16 +0000
X-CR-MTA-TID: 64aa7808
Received: from eb2eebadaff2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42C1DEDD-A6EF-43D9-991D-BC3A98A0CC85.1;
	Fri, 11 Dec 2020 06:31:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb2eebadaff2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 11 Dec 2020 06:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoeQs3BOcdurKS82d3GRFmrQdf9vlO2DVoHcL7KIFMNwIGNdQbgc0ysmD7OhalcugN1cUNR5le9DLVL2U303sqX+gKVvvlddoZMjXkwdot58f2PY+GfgROpIl6BZ/3gQ6VAzAxl2XussGstBJyeaf1D/eWm139y0U/Sk1HR737GK4e0F5YSdhwLTTK0lPM6/ACE0udAVzGysnxcSurOLZI1QQr/qp/JbBz+bcdRh8/hArXAe0MxYwRaP8hr58mvjAKLzXAOfQTtnFxMaHNaepyx+GqLkknEaBo3bIgXeP9Ptlr8CvkCEE3C82W4OZiz+usE48gKsi6sbe97Rgcpgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkLBclFOPb07W2ztDU8D5L7kjGt4m90yMAytVoTBZI=;
 b=Im6x4xKl/igSACqTIxiN6kSCX/t9aysVCYY84ZA7NORLYdtBR5miiH8uZknu/9YO2swIDfT13jEsacnabUNozzVHPjKUHyueoFD1yySuca8QD1DkJkdEtflmy86fxL5TR4Iarb4H7vIZpLj8BX1D6jQzmO9iNDtf0MWIqtw7W1MDsxMgN6/aj780zwTKdgOsQ2E0OyykutsItIP97u0H94l4tYr2xkTjnbdsdW/5GAGSuRdQhZFIWZMYLbv1ljySmRhTW2/PDk9BRZVQ57G7Vjnck1V8jLHQzGIneCB+D9XbNBwJgBnYOnFXl2LAX3hN8Ous9rTG5gefANQOM2FSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfkLBclFOPb07W2ztDU8D5L7kjGt4m90yMAytVoTBZI=;
 b=8cXsh0R9I0NNBh/VQdSdKMdrnhtmaAjczvrxIvGPf1Wf55sPPEbsDeVJ23QEwdxpRhHByZMU51y5qr2bbGNljWiBfnd61UOGLRq/4CQ0SpKGnMPqT0NBdh6Un2DXRWdQ6WKVRBOru0gIP0Afz6RpqNk96yzhezvPwIVlcvx1Gks=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DB6PR0801MB1752.eurprd08.prod.outlook.com (2603:10a6:4:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 06:31:09 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::48a0:6c02:a83e:3578]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::48a0:6c02:a83e:3578%7]) with mapi id 15.20.3654.013; Fri, 11 Dec 2020
 06:31:09 +0000
From: "Lance Yang" <Lance.Yang@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Joakim Roubert
	<joakim.roubert@axis.com>
CC: meta-virtualization <meta-virtualization@yoctoproject.org>, nd
	<nd@arm.com>, Michael Zhao <Michael.Zhao@arm.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
Thread-Topic: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
Thread-Index: 
 AQHWvN7jgv01Iw0ulEaEn70waR1PtanMUR8AgAABKgCAAAJ1AIAAAqmAgAAIdIuAAAHlgIAAV5FmgAF95YCAACSxgIAjN3nw
Date: Fri, 11 Dec 2020 06:31:09 +0000
Message-ID: 
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com>
 <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com>
 <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com>
 <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com>
 <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com>
 <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 94800F7FD573E44491E758EAFDDA0FA9.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a482c96b-b890-4ccd-3155-08d89d9e5d52
x-ms-traffictypediagnostic: DB6PR0801MB1752:|AM5PR0801MB1908:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1908E614D84ADE9782AAC5BD91CA0@AM5PR0801MB1908.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4o+MwZM/9PKLO+seBxsRj672zxoD9Qf92nBBpm8nouHGP6b2saO6CQEwj1MoDjqVQzbZxeUFq/jcHZ+hFS/vNm8vEV/su03Y15+XykV4P4qxuaeQkeGbzT5/n1MU90nk1kSUsIglO1UibjNugeizL54H12JMqv09nD1reDLuH7R7e53qEFROxhryWpISYhvOyPvS7dRJbgmUkZXG92mva6d4Tx1d5pEVLPymGwr/Q3shxUS6yRI3rqLSjRrLV8RceTxqyr7J2Pk9YEz/uOLFMPguF1IhT3fRnX42bV0ZiIgfUIT8m3qD/VRYFxw+45ooaN3RX1EVy01kojlKsMim9w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(346002)(396003)(376002)(9686003)(4001150100001)(8936002)(66476007)(52536014)(66556008)(4326008)(6506007)(71200400001)(64756008)(8676002)(55016002)(33656002)(2906002)(86362001)(110136005)(186003)(83380400001)(54906003)(316002)(5660300002)(76116006)(26005)(478600001)(53546011)(7696005)(66946007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?R1BpVkdNSGNCMG1mSnNURlFUc2JQN3Y5c2NqWE1XNSswc2pqVlVZbnd5Vm5B?=
 =?utf-8?B?RDU2cmcyVzBUQnN2cUY0UEt1SmlFRTJXY2c3ZUIwTkZkSVZsT0hMY2dZN1E4?=
 =?utf-8?B?Wjc1ZGIra1ExZVkzSWxCNEZyMXZkY1RhdXVOaTNSa09HRDJ1YmdNVWZaclE2?=
 =?utf-8?B?UTlibkFwRUhtaTVySWY2dkhmcXBKOTg3UWpZUXptejc3bFNEa2pSZjhLcUlX?=
 =?utf-8?B?elJBOGRDd2lqSVk2T1RFZERBZTRMUVI1U1RDdDgwbEY1dElOcnkxQldGOHF1?=
 =?utf-8?B?a1pHVm1ldWRtaEE1elBHRk5ZZTRueXhsdjRmd3hPQzlJU1ZRTE5ESGErbytz?=
 =?utf-8?B?c2tOTDVueG90N2t4Z2NuNkpvbTFJRUJFd2RpbjNxZU85TmR2cDVKS1N6d0Ft?=
 =?utf-8?B?VDRvcmlQdXMwTXBhYlh3VFpqL2pWcHNxWUpOTmNkV00rZEo2UEY1dFZmMWFy?=
 =?utf-8?B?UXBFTXQ2TVNHQ2ZYWUlZVXdweHJjaUFzMW0zL2JiQ2pScGlVUm0vVm1McHVp?=
 =?utf-8?B?V1NJaWwvNGZ1R0ZnZFRqZWtveDZ3SVF1YUMwVGgvRG5zSk5qNUU4Z0hvUDc4?=
 =?utf-8?B?K1ZSR1ZhaTByb2hpVDZKK2ZtVzB1blNtNEFPWGRIYjdPaCtTeVRhS2RRYkZJ?=
 =?utf-8?B?ZlVGalBScWM2Y0FSUjk3dnlQMk9aam54OFltd2hIbFZvaHRBOS9iQVBrWUpl?=
 =?utf-8?B?YmhnN0NBUmdJMjBFZ0IxblRUSUwxaEg3R21mWWFFd3E5cFVwK1FvdEh4Wit2?=
 =?utf-8?B?aDVNL00yM1gzZWhsTEVZTVFuOTFkbVJiMmZSZlZ3d3I2VXRHZ2VSSExrclJ2?=
 =?utf-8?B?OXQrbk1uekoweVlXd291dDNkUWQ2a1VIclFvUlV0QkdERHp3ZWxkRW44VEp6?=
 =?utf-8?B?NDRabTRNbys2eTFtOFNwalF4V0dsbjVBMWxKOUNMaGtnN2tWTnQ2SVpSekhO?=
 =?utf-8?B?VUlNVE5PRDQ5dDl6eFh4S3JaMGRIbTFzdnBvUjJ5MzVGS21oNjlacXRlanM5?=
 =?utf-8?B?dUJQNjZIU2lIcnBRZ0FwTGpwU2d6OFBHVE8wVVdCWVdkZFpod0ZMbHdzdUds?=
 =?utf-8?B?ckk0VmdQTzN5ZEJiVktaSkVwY0s4K2ZnaytzcktqS0VPRnNQWG0xdGloY3ZC?=
 =?utf-8?B?a2NRcjRiM3FjcFZ4MmU0Y1E5d1dBS1ZkQnpZeTNsc200RDQ2Mlg3cmpKUmtQ?=
 =?utf-8?B?b0xGQXhYL0RUWDU2ekFDRGhtdld5MlZ3UVFlSzJvV1h6V0ZnRWdYRm4ySTAz?=
 =?utf-8?B?VjA2ZmlFL0tiY0NDaGhGSXo0TkNjWG5EWHl0YUJMcWtIY0p1c1o0Wm1kQnhv?=
 =?utf-8?Q?FbwG6TBNTlMw4=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1752
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8de0026b-6024-41ab-b13c-08d89d9e5924
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DrThtNTrrQSJxEiW3n77qx3SeUExA0Pe+3sMr2PrXR6aaamZ2bGlP/kyq120te0EjyUFpTWj21s0ah2xf31uwyRXPE97A7A2ZxKLKgr8G5nbG7uJcmHS93PoeHyewp+3N+Yf8gXEGf35NPHFMIaYc1ZyTE5A2FGsvC4YjsCwVYJK2WXAsw7J6sVP6D0YLuK8yM86s5Vbm+C5/gnOKQCSP/ZtCoFEG8EOG3llDFVn3HxYPb4bXqO5hYPQFhEO0jvlP6XBPs1VhkXW12Jj3LM7v6U7K+COVZ6ziHbKKtNxGEDCH4C1FUtTY6yUp7ePCh2UhHXQINSh183ZeLgh7gjRSa31TpUrCBV59nx6dt1ZJ50wtixOL0Jrj+9nVwsh4T7ra6nuyVeGMo+NVsesWWVPmg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966005)(9686003)(82310400003)(52536014)(70206006)(70586007)(8676002)(33964004)(6506007)(83380400001)(8936002)(336012)(7696005)(53546011)(33656002)(26005)(4001150100001)(47076004)(55016002)(186003)(86362001)(478600001)(82740400003)(81166007)(54906003)(316002)(356005)(4326008)(110136005)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 06:31:16.8126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a482c96b-b890-4ccd-3155-08d89d9e5d52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0DBBPR08MB4725eurp_"

--_000_DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0DBBPR08MB4725eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UgYW5kIEpvYWtpbSwNCg0KSSByZWNlbnRseSBzYXcgYSBuZXcgYnJhbmNoIG1hc3Rl
ci1uZXh0IGhhcyBiZWVuIGNyZWF0ZWQgaW4gbWV0YS12aXJ0dWFsaXphdGlvbi4gSXQgbWFpbmx5
IHJlbGF0ZWQgdG8gazNzIGFuZCBJIHNhdyBrM3MgaGFkIGJlZW4gYnVtcGVkIHRvIHYxLjE5LiBJ
IHdvdWxkIGxpa2UgdG8ga25vdyBpZiB0aGUgazNzIHBhdGNoIHdpbGwgYmUgbWVyZ2VkIGludG8g
bWFzdGVyIGJyYW5jaCBzb29uLiAgSSByZW1lbWJlcmVkIHlvdSBtZW50aW9uZWQgazNzIHYxLjE4
IGhhcyBzb21lIGFnZW50IHJlZ2lzdHJhdGlvbiBpc3N1ZSBhbmQgc29tZSBoYWQgY3Jhc2ggbG9v
cCBpc3N1ZXMuDQoNCldoYXQgaXMgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBrM3MgcGF0Y2g/
IElzIHRoZXJlIGFueSBmdXJ0aGVyIGlzc3Vlcz8NCg0KQmVzdCBSZWdhcmRzLA0KTGFuY2UNCkZy
b206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS12aXJ0
dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQnJ1Y2UgQXNo
ZmllbGQgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJl
ciAxOSwgMjAyMCA0OjM5IEFNDQpUbzogSm9ha2ltIFJvdWJlcnQgPGpvYWtpbS5yb3ViZXJ0QGF4
aXMuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb24gPG1ldGEtdmlydHVhbGl6YXRpb25AeW9j
dG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0hd
IGszczogQnVtcCB0byB2MS4xOS4zK2szczMNCg0KDQoNCk9uIFdlZCwgTm92IDE4LCAyMDIwIGF0
IDE6MjcgUE0gSm9ha2ltIFJvdWJlcnQgPGpvYWtpbS5yb3ViZXJ0QGF4aXMuY29tPG1haWx0bzpq
b2FraW0ucm91YmVydEBheGlzLmNvbT4+IHdyb3RlOg0KT24gMjAyMC0xMS0xNyAyMDozOSwgQnJ1
Y2UgQXNoZmllbGQgd3JvdGU6DQogPg0KPiByb290QHFlbXV4ODYtNjQ6fiMga3ViZWN0bCBnZXQg
cG9kcyAtbiBrdWJlLXN5c3RlbQ0KPiBOQU1FIFJFQURZIFNUQVRVUyBSRVNUQVJUUyBBR0UNCj4g
bG9jYWwtcGF0aC1wcm92aXNpb25lci03ZmY5NTc5YzYtYmQ5NDcgMC8xIENyYXNoTG9vcEJhY2tP
ZmYgODIybQ0KPiBjb3JlZG5zLTY2YzQ2NDg3NmItNzZiZGwgMC8xIENyYXNoTG9vcEJhY2tPZmYg
ODIybQ0KPiBoZWxtLWluc3RhbGwtdHJhZWZpay1tdnQ1ayAwLzEgQ3Jhc2hMb29wQmFja09mZiA4
MjJtDQo+IG1ldHJpY3Mtc2VydmVyLTdiNGY4YjU5NS1jazVreiAwLzEgQ3Jhc2hMb29wQmFja09m
ZiA4MjJtDQo+IHJvb3RAcWVtdXg4Ni02NDp+Iw0KDQogRnJvbSBteSBvd24gZXhwZXJpZW5jZSB3
aXRoIENyYXNoTG9vcEJhY2tPZmYgc2l0dWF0aW9ucyBpcyB0aGF0IHRoZXJlDQptYXkgYmUgc2Vy
dmVyYWwgZGlmZmVyZW50IHRoaW5ncyBjYXVzaW5nIHRoYXQuIENhbiB5b3UgdHJhY2UgZG93biB3
aGF0DQppcyBjYXVzaW5nIHRoZSBDcmFzaExvb3BCYWNrT2ZmIGhlcmU/DQoNCk5vdCByZWFsbHku
IFRoZSBidWlsZCBzZWVtcyB0byBoYXZlIHNvbWUgc29ydCBvZiBtaXNjb25maWd1cmF0aW9uIGFu
ZCBubyBsb2dzIGFyZSBjcmVhdGVkIChhbmQgaGVuY2UgY2FuJ3QgYmUgYWNjZXNzZWQgdmlhIGt1
YmVjdGwpLg0KDQpSdW5uaW5nIHRoZSBzZXJ2ZXIgb24gdGhlIGNvbW1hbmQgbGluZSBqdXN0IGdl
dHMgdXMgcmVhbXMgb2YgbWVzc2FnZXMgYW5kIGEgbG90IG9mIGZhbHNlIGxlYWRzICh0b28gbWFu
eSBuYW1lc2VydmVycywgaXB0YWJsZXMgLS1yYW5kb20tZnVsbHkgbm90IHN1cHBvcnRlZCwgZXRj
ICkuDQoNCkkndmUgdHJpZWQgYSBmZXcgdmFyaWFudHMgdG9kYXksIGJ1dCBjYW4ndCBnZXQgYW55
IHJlYWxseSBzaW1wbGUgbG9ncyBvdXQuIEknbGwgZG8gbW9yZSB0b21vcnJvdy4NCg0KSSd2ZSBi
ZWVuIGFibGUgdG8gY29uZmlybSB0aGF0IG15IHBhY2thZ2Vncm91cC9pbWFnZSB0eXBlIHJ1bnMg
ZG9ja2VyLCBjb250YWluZXJkLCBhbmQgcnVuYyBsYXVuY2hlZCBjb250YWluZXJzIGp1c3QgZmlu
ZSwgc28gdGhpcyBpcyBqdXN0IHNvbWUgcXVpcmsvaWRpb2N5IG9mIGsqcyB0aGF0IGlzIGNhdXNp
bmcgdGhlIHByb2JsZW0uDQoNCkJydWNlDQoNCg0KQlIsDQoNCi9Kb2FraW0NCg0KDQoNCg0KLS0N
Ci0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQg
bWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0g
R2FuZGFsZiwgU3RhciBUcmVrIElJDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2Yg
dGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBh
bHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3Nl
IHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3Nl
LCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5
b3UuDQo=

--_000_DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0DBBPR08MB4725eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
QmF0YW5nOw0KCXBhbm9zZS0xOjIgMyA2IDAgMCAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6MiAxIDYg
MCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFu
b3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToi
XEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5OiJcQEJhdGFuZyI7DQoJcGFub3NlLTE6MiAzIDYgMCAwIDEgMSAxIDEg
MTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwg
ZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1m
YW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0K
CXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFs
LXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRv
d3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJ
Zm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJ
e3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpk
aXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtp
ZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4
PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8
bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0i
MSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5
IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHlsZT0id29yZC13cmFw
OmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPkhpIEJydWNlIGFuZCBKb2FraW0sPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgcmVj
ZW50bHkgc2F3IGEgbmV3IGJyYW5jaCBtYXN0ZXItbmV4dCBoYXMgYmVlbiBjcmVhdGVkIGluIG1l
dGEtdmlydHVhbGl6YXRpb24uIEl0IG1haW5seSByZWxhdGVkIHRvIGszcyBhbmQgSSBzYXcgazNz
IGhhZCBiZWVuIGJ1bXBlZCB0byB2MS4xOS4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgdGhlIGsz
cyBwYXRjaCB3aWxsIGJlIG1lcmdlZCBpbnRvIG1hc3RlciBicmFuY2ggc29vbi4gJm5ic3A7SSBy
ZW1lbWJlcmVkDQogeW91IG1lbnRpb25lZCBrM3MgdjEuMTggaGFzIHNvbWUgYWdlbnQgcmVnaXN0
cmF0aW9uIGlzc3VlIGFuZCBzb21lIGhhZCBjcmFzaCBsb29wIGlzc3Vlcy4NCjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5XaGF0IGlzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUgazNzIHBhdGNo
PyBJcyB0aGVyZSBhbnkgZnVydGhlciBpc3N1ZXM/PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJl
c3QgUmVnYXJkcyw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkxhbmNlPG86
cD48L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCBi
bHVlIDEuNXB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNC4wcHQiPg0KPGRpdj4NCjxkaXYgc3R5bGU9
ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0
IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBtZXRhLXZp
cnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgJmx0O21ldGEtdmlydHVhbGl6YXRp
b25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyZndDsNCjxiPk9uIEJlaGFsZiBPZiA8L2I+QnJ1Y2Ug
QXNoZmllbGQgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmc8YnI+DQo8Yj5TZW50OjwvYj4gVGh1
cnNkYXksIE5vdmVtYmVyIDE5LCAyMDIwIDQ6MzkgQU08YnI+DQo8Yj5Ubzo8L2I+IEpvYWtpbSBS
b3ViZXJ0ICZsdDtqb2FraW0ucm91YmVydEBheGlzLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IG1l
dGEtdmlydHVhbGl6YXRpb24gJmx0O21ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0Lm9y
ZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRD
SF0gazNzOiBCdW1wIHRvIHYxLjE5LjMrazNzMzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxk
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+T24gV2VkLCBOb3YgMTgsIDIwMjAgYXQgMToyNyBQTSBKb2FraW0g
Um91YmVydCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpvYWtpbS5yb3ViZXJ0QGF4aXMuY29tIj5qb2Fr
aW0ucm91YmVydEBheGlzLmNvbTwvYT4mZ3Q7IHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0ND
QyAxLjBwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDYuMHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdp
bi1yaWdodDowaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gMjAyMC0xMS0xNyAyMDozOSwg
QnJ1Y2UgQXNoZmllbGQgd3JvdGU6PGJyPg0KJm5ic3A7Jmd0Ozxicj4NCiZndDsgcm9vdEBxZW11
eDg2LTY0On4jIGt1YmVjdGwgZ2V0IHBvZHMgLW4ga3ViZS1zeXN0ZW08YnI+DQomZ3Q7IE5BTUUg
UkVBRFkgU1RBVFVTIFJFU1RBUlRTIEFHRTxicj4NCiZndDsgbG9jYWwtcGF0aC1wcm92aXNpb25l
ci03ZmY5NTc5YzYtYmQ5NDcgMC8xIENyYXNoTG9vcEJhY2tPZmYgODIybTxicj4NCiZndDsgY29y
ZWRucy02NmM0NjQ4NzZiLTc2YmRsIDAvMSBDcmFzaExvb3BCYWNrT2ZmIDgyMm08YnI+DQomZ3Q7
IGhlbG0taW5zdGFsbC10cmFlZmlrLW12dDVrIDAvMSBDcmFzaExvb3BCYWNrT2ZmIDgyMm08YnI+
DQomZ3Q7IG1ldHJpY3Mtc2VydmVyLTdiNGY4YjU5NS1jazVreiAwLzEgQ3Jhc2hMb29wQmFja09m
ZiA4MjJtPGJyPg0KJmd0OyByb290QHFlbXV4ODYtNjQ6fiM8YnI+DQo8YnI+DQombmJzcDtGcm9t
IG15IG93biBleHBlcmllbmNlIHdpdGggQ3Jhc2hMb29wQmFja09mZiBzaXR1YXRpb25zIGlzIHRo
YXQgdGhlcmUgPGJyPg0KbWF5IGJlIHNlcnZlcmFsIGRpZmZlcmVudCB0aGluZ3MgY2F1c2luZyB0
aGF0LiBDYW4geW91IHRyYWNlIGRvd24gd2hhdCA8YnI+DQppcyBjYXVzaW5nIHRoZSBDcmFzaExv
b3BCYWNrT2ZmIGhlcmU/PG86cD48L286cD48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQi
Pk5vdCByZWFsbHkuIFRoZSBidWlsZCBzZWVtcyB0byBoYXZlIHNvbWUgc29ydCBvZiBtaXNjb25m
aWd1cmF0aW9uIGFuZCBubyBsb2dzIGFyZSBjcmVhdGVkIChhbmQgaGVuY2UgY2FuJ3QgYmUgYWNj
ZXNzZWQgdmlhIGt1YmVjdGwpLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+UnVubmluZyB0aGUgc2VydmVyIG9u
IHRoZSBjb21tYW5kIGxpbmUganVzdCBnZXRzIHVzIHJlYW1zIG9mIG1lc3NhZ2VzIGFuZCBhIGxv
dCBvZiBmYWxzZSBsZWFkcyAodG9vIG1hbnkgbmFtZXNlcnZlcnMsIGlwdGFibGVzIC0tcmFuZG9t
LWZ1bGx5IG5vdCBzdXBwb3J0ZWQsIGV0YyApLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIu
MHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+SSd2ZSB0cmllZCBh
IGZldyB2YXJpYW50cyB0b2RheSwgYnV0IGNhbid0IGdldCBhbnkgcmVhbGx5IHNpbXBsZSBsb2dz
IG91dC4gSSdsbCBkbyBtb3JlIHRvbW9ycm93LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2
Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5JJ3Zl
IGJlZW4gYWJsZSB0byBjb25maXJtIHRoYXQgbXkgcGFja2FnZWdyb3VwL2ltYWdlIHR5cGUgcnVu
cyBkb2NrZXIsIGNvbnRhaW5lcmQsIGFuZCBydW5jIGxhdW5jaGVkIGNvbnRhaW5lcnMganVzdCBm
aW5lLCBzbyB0aGlzIGlzIGp1c3Qgc29tZSBxdWlyay9pZGlvY3kgb2YgaypzIHRoYXQgaXMgY2F1
c2luZyB0aGUgcHJvYmxlbS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQiPkJydWNlPG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286
cD48L3A+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVm
dDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxl
ZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bWFyZ2luLWJvdHRvbToxMi4wcHQiPjxicj4NCkJSLDxicj4NCjxicj4NCi9Kb2FraW08YnI+DQo8
YnI+DQo8YnI+DQo8bzpwPjwvbzpwPjwvcD4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PGJyIGNsZWFyPSJhbGwiPg0KPG86cD48L286cD48L3A+DQo8ZGl2Pg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPi0tIDxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+LSBUaG91IHNoYWx0IG5vdCBmb2xs
b3cgdGhlIE5VTEwgcG9pbnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQg
aXRzIGVuZDxicj4NCi0gJnF1b3Q7VXNlIHRoZSBmb3JjZSBIYXJyeSZxdW90OyAtIEdhbmRhbGYs
IFN0YXIgVHJlayBJSTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9k
aXY+DQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55
IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQu
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBh
bnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLA0KIG9yIHN0b3JlIG9yIGNv
cHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0DBBPR08MB4725eurp_--
