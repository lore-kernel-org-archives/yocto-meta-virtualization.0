Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web09.4362.1618477973712529039
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zwRD710s;
 spf=pass (domain: arm.com, ip: 40.107.20.88, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRwL2Vt0cd2rAoOq/+GRy4CkZPe+l1LLHIPy0mDH/Tw=;
 b=zwRD710s+wh19DRRXYlozU/4GRxVnqQQ2mR/ITBSA3r4kjXDqKyvQPly8ReBdXbyT954RxGJMSwmajEuBsyz4MHEvR9Hp6/nltu5fGx9SB+lmS0tk+8PyHJBNpvQn5XODOCvhfr7i3L3Na+NxywZLXeK8wcAUDLnaDWOoIc/hZM=
Received: from AM5PR1001CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::34) by AM8PR08MB5634.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 09:12:48 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::1d) by AM5PR1001CA0057.outlook.office365.com
 (2603:10a6:206:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 09:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:12:46 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Thu, 15 Apr 2021 09:12:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb12b9da26527c3e
X-CR-MTA-TID: 64aa7808
Received: from bd9eb81c79a1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D5CAFBFA-3082-48BE-AD4C-068092391366.1;
	Thu, 15 Apr 2021 09:12:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd9eb81c79a1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRmsbHzYsZea78PBJHmBrE5Ws+ZQcYGP8Qvu50+raq4goHn+BWgG01OZEmMpT7R5V9yMQDMz2yQ/QcOGMqi3Kv0ZE5h5q2JD2u9RXRDeGHG7t+w73Ym5Q3WgV4NXarL8JR/b/zyP29ZGr4bEE04Xkw76fQ+p+hHpW3UeAj9caCiIayrqof/idFMIzUG2R/2AX6K7GyZCSvz++WSLDmCsle28mxxJha47y+16HD6YGaqPqa+oduK4cCpRCfjXUKXttPxGfRO6qAZck8i0DRIVmvKe2esfKBYEZC4B2KqBy3plVrcw4ntQIePFcaP84QioMqnvwiZeQQ+i5oDJa0EKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRwL2Vt0cd2rAoOq/+GRy4CkZPe+l1LLHIPy0mDH/Tw=;
 b=Avr3x4YMSfn2dqtJmGuPy2zTGC4SvSe0T8kRlz98XtSpoQmyaGLM3/Z/y1V7tDflQXHDFQbTw+ndGQ2QZFHpo6Hp4OlHLVgS8+6hTfu6koeORDKLW45PhAC4nb05f6yB+sBZWTOeQHP/X+BWjgxYUnaZyB4jXNiyMPv65mywQ7Gp1SC8+B1EPcxqhV3jZ4RWjtwe0HImaWTYdrNTKYWUQJ4F0z1SiDWWUfUxVZTNvMKtLZn6C+i+AOisPYrrP/LxWe2hHwGhFUPjG34Z9YMZAvWaTw7Emm/A90SWWYTnIT/N4nSVOT1ZTKda5aVRj/NihmEr6pQzc46aAyrtLj4L2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRwL2Vt0cd2rAoOq/+GRy4CkZPe+l1LLHIPy0mDH/Tw=;
 b=zwRD710s+wh19DRRXYlozU/4GRxVnqQQ2mR/ITBSA3r4kjXDqKyvQPly8ReBdXbyT954RxGJMSwmajEuBsyz4MHEvR9Hp6/nltu5fGx9SB+lmS0tk+8PyHJBNpvQn5XODOCvhfr7i3L3Na+NxywZLXeK8wcAUDLnaDWOoIc/hZM=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 09:12:38 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:12:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
Thread-Topic: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes
 for new stable Xen 4.15 release
Thread-Index: AQHXMYeD2WCkSCcMjEmYs0aCW1a32aq1S+YA
Date: Thu, 15 Apr 2021 09:12:38 +0000
Message-ID: <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-2-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c743ca0d-3c84-401d-4dd1-08d8ffeea2a7
x-ms-traffictypediagnostic: VE1PR08MB5614:|AM8PR08MB5634:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB56349570B862C6208E1721A39D4D9@AM8PR08MB5634.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8TMAb19FRTOTUZBpTS939AeVQSX5F1Xsdm38MXggK3wAS68e5LrJj1ZtXJXLvD1vVnNRtdEEwryNRFfsUIRHwqcz895+A802Cnf/8Q3OaauBpzp6tqu4Ds5c8uAC7XmJB9yAzu/lapAU2P4cK/pQCE8pShRPajGjjVFxsdW//5n6hQx7Yo9F7WPp7tBZdv0U7aypBAYoTefCHc27LeHk/WYNzpQ3CMKXmaz7rKRjoOxRQ0SjtWtt7fQHH13LHtLDvDTvYQGwCwAHveFzFt0b6DdCyowA8XWFGD3y7fV7YDok62Qj/h13g2hSfalXthZPrbN9wdkdGz6O0tIqCyrq7pol6HG4bGe+sDyiHp/zs0pzL3fhIJi5taTk+7Veca+OasaZMw1xEv927e24V7HVb2OBP98gCLQfvM6eA/ggvHG4bcvQgpvoIom7xfV+OppiL3CKGvSrqWlC1u5JUOt/PCjVH7pH+dRHmg4CwaO7IkVn9dxNFU2YoHtLadOMcz5CNWAmLbqdJ5X33JrrFS7YRk6tVRjnPYhmQNWXaLfhZjXNLTVEInfUoe0ymIb6SYhFg8JHywumlARR8Qen5P/1NOdudBrGky/lkRNgI/RLx2yiCB6k1bVh6UkmsagtpD9EHC4h483Dfl16FwGMseiR0BWoc8Zw2Qu69rZ7likDepmMHQWMwd43bUWJFVIXYpnQ1NbzGOE1niu2Op5tNcpKjnaSGHfXX/M18Ww+h+qBygA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(6916009)(26005)(66446008)(66556008)(8676002)(186003)(36756003)(122000001)(64756008)(38100700002)(966005)(8936002)(66476007)(83380400001)(6512007)(86362001)(71200400001)(5660300002)(2616005)(498600001)(53546011)(76116006)(54906003)(6486002)(91956017)(2906002)(6506007)(4326008)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?dldqNXB0cnhyNStEK2M0Nzg1R3hqOHlvb0YxWWxkdVB0UHhwdXpaazFSZVNR?=
 =?utf-8?B?bFRJS0FWcURVUDVRN3g4eXE0bmdpL0N5cFRWNmMrakc1VDZHNW5mT29UeEkv?=
 =?utf-8?B?K3JuaUFyYkZyeGZGNTVKRGxJay9Lc29nN1hRZUJxSk52bTlHUkw5VzJPNVlI?=
 =?utf-8?B?V01rRk9SR28zSzZJajMyMjlsUzJGZC9LU2tPdEFMTXR5OE1waUFkSFVUR1Ez?=
 =?utf-8?B?UDQxWnJLTWVLQ1N0Zlh2dFI2L25jcTUyWHY2U2lKdUczd2REcTZCWnVHTUhV?=
 =?utf-8?B?cys2TkhtUmhOVXZkV0pVTW9VUEpnbDd5QzVqaGYwZno2MGttOWpJUDdpeVJz?=
 =?utf-8?B?UnpJemFQcjB2WnkwQlVpK1lYZmRaOXNGV1F6U0lzSjFiaU50d2o1Y3FDNzNJ?=
 =?utf-8?B?Q3N2dk9GcTNqeXBwekJWMHd3ei9XYlNybS9ibjVkbVhUT1B5VVJRb3R0WUZV?=
 =?utf-8?B?SDZjTVhZS0JmQkM1aldDYzhWeTlRanpGaDQwYm1BV0pGUDBNSnlFVlFJeUR3?=
 =?utf-8?B?SjdZYktoeFZKVkV5OUx0bEtiV3FOcXlkdndQT000QloyWllRWXQxYjhSUE16?=
 =?utf-8?B?bWxxV0NYaHduU0diOXN1YlRIMEJvblJwaTV3TmFqNVZlQmduZXBLTGl1Ulhp?=
 =?utf-8?B?R2g2Z0FHWXJXZWp4T0J3aFhPV1RYdGc4ZG9NTWFmV2FLMEhxekFuMGFtbVlK?=
 =?utf-8?B?UU4rY3p4ekFzdnViVG8vYzdGa09pNW9aaCtiSmRkRmtNdjhkdGE0NEw3Qmhi?=
 =?utf-8?B?dDAxa2FKcWdLeWJKM0lSa2NtRmRoVEszU0Y5R1h4d2hmdXdYeTlxZFY0Q0xi?=
 =?utf-8?B?S1BiaUgvOTBvazJka0NrRDg4T1NQV1J2cGxpV3VGTGZkc1hrL2xxczl2am11?=
 =?utf-8?B?bnorSGMyWklYL1k0U1RXSWRrU3NFNEJzandiQUJ6U1BvK1hFT0NJN3JOVjV1?=
 =?utf-8?B?bWJwMGg2byt1Wk4wZnFJQU1pZ2w2YnY0bmJINUFFaG9UUzFDZm85U2p3OHZj?=
 =?utf-8?B?ZEhyTWUweDJTNXY2c3dnU0tGZ0VJSzh1RjgvRFB2TnFINXZtUFkxdW1Dbnc1?=
 =?utf-8?B?WWozYVpLYkNzVjNnRC9NK09MYjIvRWFEUU5CcXRGNWdOdnI2UnRSVFRTckZk?=
 =?utf-8?B?bVM0amJGV0Z6NVVQNXI2UVlDSm5KNkpJa0hmVDZEN3I2UEl0Y29RTEhGaHJN?=
 =?utf-8?B?bWhOS1hYNmdxY1RWOWp2SEZFVm00UEdUd0JPYWFuS3ZUanFmNG5DZUthRnQ2?=
 =?utf-8?B?SnAvT3VaL244dmVTZG5QK0xic0paNXVoY0tLV0pub1YzMnNhVmRBSXdNYVIy?=
 =?utf-8?B?N25aejAzTlVlRWkrZ3ptbHE4THZCN1EyY2ZiOWF0Sk9RYmU2VnI2NFBmSzQv?=
 =?utf-8?B?dGRJZ2JmRnFxR21ETStyYzc4NWdOYm84TThINVFGcTJvTjRCWU1kTFVTa2hY?=
 =?utf-8?B?L1dPZDd5aW5NVjQ1S1M3THNCVnNiaFRTN1JubTUxVDk1d1VzdGh5STRiRy9O?=
 =?utf-8?B?TDRNT0FERytQRzY2UVhVTUJLcm5xQWNiZVhhc3llMUQ2T1Ryd2xiSHVZUmpV?=
 =?utf-8?B?UlVtMnZrQWt0d29jY2dERDJES202cGZXeDYwc2tZQXgyaEgxMXphNlBodThv?=
 =?utf-8?B?SzIrczJmTTdLeW5pUXg4bHU3d0VVMEFaUU1lQmRaR2Zsc2I2SS9JUFpJRDc0?=
 =?utf-8?B?VmRzbkhkZmJObjlVRDFVcVMrMjNCRFVySGE3MWRhUTdmcUNyNEF6S2xaZzBq?=
 =?utf-8?B?MG5mL0Z4cWk4UCtHVXlFbXRxL0hualkrMXkySERqVFpUK1pKWWIwNkpoMUxw?=
 =?utf-8?B?QXVaU0I0UzIzODFuaFZKdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c13a86ca-6635-4b00-4d5a-08d8ffee9dd1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BikUa+Ain5hy7FG59UQVybqrQKCANEuNgZMZUjZsiX+ePP2kxCZSuWCYd1FNv40yWcYHJ2ohpcdF8AsS8ZohSN1dezrwMJPw7HgQ3ClrQSap65Ka5w4CtrNwKDXu23iu38mEreoCqd10RjsBmWKWv8onUeCDU9vcsidT09tqB6zY3ZZ0AILAhGmBFwHsGF4yQj1HmPmmwfV8xX2WXxeJH+t3PjO+Q0t8/I3wjt6GILAB4t8VTYnYbOvUZpCrOYBE3f0alVJjtHOMMsoVG3zVdcjd7XlWtTBFBO0YLaUN4zwxuoY+uXlhll3u36+W5JahmnvArM0MjuGIi1aV82J2dTT/I9DNzdPVPBua0z236IfWXFUiFyjRR2SFjSVMeAFhrrATN/umVBWTIFFtISUcflmfFgCZLLqxmGMR/joq/WZXshV+taOfsbhQ/NjQZq4b0fXPLcsNKfHeULsqC0RAMtv4OANABU0/RZ92VQlkolJOh0rPD9Uc3vc3a7myYLkdrS3fbrvAl8c/TmPzQlVm4ZyawXeycizLjw9Qp5EAoP5WQXhTyQAhFULRXndW/zTrwfiDQYi0+lbuY7nSPVNX+9QcmpJbaDSetk5oi67Xc7IZtPZ7z8aiUO98wKUm4cwa50zIVZtsPbcXyI0XfHf1gxPUH7UEoqneOb04gzszVZCXCfLwyMQ4Q0ncwRpym3OrCXXev+3IXZTqxufB55xjAJQzNyYDD1yhuFYtwkZsBwM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(5660300002)(54906003)(6512007)(6506007)(6486002)(36860700001)(8676002)(86362001)(81166007)(70586007)(70206006)(6862004)(2906002)(83380400001)(36756003)(966005)(47076005)(107886003)(26005)(498600001)(82310400003)(4326008)(33656002)(2616005)(336012)(186003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:12:46.8474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c743ca0d-3c84-401d-4dd1-08d8ffeea2a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5634
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CD09E8957A71C4A9EEF3DEBE8ADD6F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0b3BoZXIsDQoNCj4gT24gMTUgQXByIDIwMjEsIGF0IDAwOjM5LCBDaHJpc3RvcGhl
ciBDbGFyayB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8Y2hyaXN0b3BoZXIudy5jbGFyaz1n
bWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+DQo+IEFkZGVkIGFzIG5v
bi1kZWZhdWx0LCByZXRhaW5pbmcgdGhlIFhlbiA0LjE0IHJlY2lwZXMgYXMgdGhlIGRlZmF1bHQN
Cj4gcHJlZmVycmVkIHZlcnNpb24gZm9yIHRoZSBIYXJka25vdHQgcmVsZWFzZS4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwu
Y29tPg0KPiAtLS0NCj4gcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTUuYmIgfCAy
MCArKysrKysrKysrKysrKysrKysrKw0KPiByZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fNC4xNS5i
YiAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPiAyIGZpbGVzIGNoYW5nZWQsIDQx
IGluc2VydGlvbnMoKykNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVu
L3hlbi10b29sc180LjE1LmJiDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWV4dGVuZGVk
L3hlbi94ZW5fNC4xNS5iYg0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1leHRlbmRlZC94ZW4v
eGVuLXRvb2xzXzQuMTUuYmIgYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHNfNC4xNS5i
Yg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5kOGNiODQ2DQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTUu
YmINCj4gQEAgLTAsMCArMSwyMCBAQA0KPiArU1JDUkVWID89ICJlMjVhYTk5MzlhZTBjZDgzMTc2
MDViZTNkNWM1NjExYjc2YmM0YWI0Ig0KPiArDQo+ICtYRU5fUkVMID89ICI0LjE1Ig0KPiArWEVO
X0JSQU5DSCA/PSAic3RhYmxlLSR7WEVOX1JFTH0iDQo+ICsNCj4gK1NSQ19VUkkgPSAiIFwNCj4g
KyAgICBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdDticmFuY2g9JHtYRU5fQlJBTkNIfSBc
DQo+ICsgICAgZmlsZTovLzAwMDEtcHl0aG9uLXB5Z3J1Yi1wYXNzLURJU1RVVElMUy14ZW4tNC4x
NS5wYXRjaCBcDQo+ICsgICAgIg0KPiArDQo+ICtMSUNfRklMRVNfQ0hLU1VNID89ICJmaWxlOi8v
Q09QWUlORzttZDU9NDE5NzM5ZTMyNWE1MGYzZDdiNDUwMTMzOGU0NGE0ZTUiDQo+ICsNCj4gK1BW
ID0gIiR7WEVOX1JFTH0rc3RhYmxlJHtTUkNQVn0iDQo+ICsNCj4gK1MgPSAiJHtXT1JLRElSfS9n
aXQiDQo+ICsNCj4gK0RFRkFVTFRfUFJFRkVSRU5DRSA/Pz0gIi0xIg0KDQp3ZSBoYXZlIGEgZmls
ZSBtZXRhLXZpcnQtZGVmYXVsdC12ZXJzaW9ucy5pbmMgaW4gY29uZi9kaXN0cm8vaW5jbHVkZQ0K
DQpTaG91bGRu4oCZdCB3ZSB1c2UgdGhhdCBmaWxlIGFuZCBzZXQgUFJFRkVSUkVEX1ZFUlNJT04g
aW5zdGVhZCBvZiB1c2luZyBkZWZhdWx0DQpwcmVmZXJlbmNlIGluIGVhY2ggcmVjaXBlID8NCg0K
U29tZXRoaW5nIGxpa2U6DQpQUkVGRVJSRURfVkVSU0lPTl94ZW4gPz0gIjQuMTQlIg0KUFJFRkVS
UkVEX1ZFUlNJT05feGVuLXRvb2xzID89ICI0LjE0JSINCg0KVGhpcyB3b3VsZCBwcmV2ZW50IG1v
ZGlmeWluZyB0aGUgcmVjaXBlcyB3aGVuIHdlIGNoYW5nZSB0aGUgZGVmYXVsdCB2ZXJzaW9uLg0K
DQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gKw0KPiArcmVxdWlyZSB4ZW4uaW5jDQo+ICtyZXF1aXJl
IHhlbi10b29scy5pbmMNCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80
LjE1LmJiIGIvcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuXzQuMTUuYmINCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uNDkyNjhjYw0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE1LmJiDQo+IEBAIC0wLDAgKzEsMjEgQEAN
Cj4gK1NSQ1JFViA/PSAiZTI1YWE5OTM5YWUwY2Q4MzE3NjA1YmUzZDVjNTYxMWI3NmJjNGFiNCIN
Cj4gKw0KPiArWEVOX1JFTCA/PSAiNC4xNSINCj4gK1hFTl9CUkFOQ0ggPz0gInN0YWJsZS0ke1hF
Tl9SRUx9Ig0KPiArDQo+ICtTUkNfVVJJID0gIiBcDQo+ICsgICAgZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL3hlbi5naXQ7YnJhbmNoPSR7WEVOX0JSQU5DSH0gXA0KPiArICAgIGZpbGU6Ly94ZW4tYXJt
NjQtaW1wbGVtZW50LWF0b21pYy1mZXRjaC1hZGQucGF0Y2ggXA0KPiArICAgIGZpbGU6Ly8wMDAx
LW1lbnVjb25maWctbWNvbmYtY2ZnLUFsbG93LXNwZWNpZmljYXRpb24tb2YtbmN1cnNlcy1sb2Nh
dGlvbi5wYXRjaCBcDQo+ICsgICAgIg0KPiArDQo+ICtMSUNfRklMRVNfQ0hLU1VNID89ICJmaWxl
Oi8vQ09QWUlORzttZDU9NDE5NzM5ZTMyNWE1MGYzZDdiNDUwMTMzOGU0NGE0ZTUiDQo+ICsNCj4g
K1BWID0gIiR7WEVOX1JFTH0rc3RhYmxlJHtTUkNQVn0iDQo+ICsNCj4gK1MgPSAiJHtXT1JLRElS
fS9naXQiDQo+ICsNCj4gK0RFRkFVTFRfUFJFRkVSRU5DRSA/Pz0gIi0xIg0KPiArDQo+ICtyZXF1
aXJlIHhlbi5pbmMNCj4gK3JlcXVpcmUgeGVuLWh5cGVydmlzb3IuaW5jDQo+IC0tDQo+IDIuMjUu
MQ0KPg0KPg0KPiANCj4NCg0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMg
ZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBi
ZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUg
Y29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Ig
c3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
