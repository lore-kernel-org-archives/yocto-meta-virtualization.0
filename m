Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.48])
 by mx.groups.io with SMTP id smtpd.web12.6763.1618566071591022750
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 02:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=L9rxnJHS;
 spf=pass (domain: arm.com, ip: 40.107.1.48, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0Go1q72hHODdnMgmrTBR/lfDLQaXhhnyQZCBPeK2EA=;
 b=L9rxnJHSql+1D4xEUwZjviC3HK7RuAM719/JzB+DT8Y0a9alK0uTDWO0vsUbFUqX8gkv3SLqd1SszZjalG9aTHkJKDnuJMkjEJGuJXklUTQOTGOgmCYDnQY/Q3jpi6tH100m62Hgv1tFb3W1K/0riTsoEyBwkrm0SfON0+tK/EM=
Received: from AM5PR1001CA0068.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::45) by PAXPR08MB6926.eurprd08.prod.outlook.com
 (2603:10a6:102:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 09:41:08 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::79) by AM5PR1001CA0068.outlook.office365.com
 (2603:10a6:206:15::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 09:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 09:41:07 +0000
Received: ("Tessian outbound b610e7b4d771:v90"); Fri, 16 Apr 2021 09:41:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a98163f44200f25
X-CR-MTA-TID: 64aa7808
Received: from 3c5a1a70586a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C021D5EB-D366-4983-A229-48BCF564EA6F.1;
	Fri, 16 Apr 2021 09:40:56 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c5a1a70586a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 16 Apr 2021 09:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEdteBFNGj4gW7C513xoqPABXXgGb2PjmZg3KHYwXAYdHL8Sy50gaAAW95aouJ0LlpWY1Z8Mb9fhQvtm7AN2tdJji3iRWtRm6c1dceWY1ddMnkd7DOvy4GqtnY/dPTDaV8kbPVmCkDnO/vo14gNHQFmoeJnpj/KnPCpEoN0tKIWsiJpgooxNMRT3xfELqoBwT/1n8QZECwHvqezpRLdnyNr3+3vSbZU8om5QZyMf6wAlW5iTTbNlH3l2nZFtjI5B1/1+yPWat5lSebsZTq3sRYKNQM05Ni5KmF9VRwTbXJwrZ/y1YgnMZtOQ05/mjyFpKb/QQRPy0Er1gQlnT8OIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0Go1q72hHODdnMgmrTBR/lfDLQaXhhnyQZCBPeK2EA=;
 b=eggHjuUu+sFJkNcDmc8nlMmMbNi796yCftML9lKpLIrT9ORxm0a8qHAk8V3QJMs1cZi1rZyO6GKmzvpSRyfBUsp69/yRWHHGS4uAVsqS8uE1yezcU2498vlnranV52ngyc/NmdxIb66lZo8W4B4uZIPSOMYWWJ3JhPZ8koJ8qC6ks9PETdFtfJNXetOgJ+JXVgZz//t0hlHmHMoCIB40cBHHjQntsaxpfFARK7Z2WKSsNGfSm/RDk4VbFglcJ2CBERZXhf1kGL3GZs22rFhhbe35hHgWGoFNuqeFnlwlv+N8NKoNctuoPi4J1RYtyyFN0eXu5mHkN9Kodxol0v4LIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0Go1q72hHODdnMgmrTBR/lfDLQaXhhnyQZCBPeK2EA=;
 b=L9rxnJHSql+1D4xEUwZjviC3HK7RuAM719/JzB+DT8Y0a9alK0uTDWO0vsUbFUqX8gkv3SLqd1SszZjalG9aTHkJKDnuJMkjEJGuJXklUTQOTGOgmCYDnQY/Q3jpi6tH100m62Hgv1tFb3W1K/0riTsoEyBwkrm0SfON0+tK/EM=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5294.eurprd08.prod.outlook.com (2603:10a6:803:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 09:40:54 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 09:40:54 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes for new stable Xen 4.15 release
Thread-Topic: [meta-virtualization][PATCH v2 2/6] xen, xen-tools: add recipes
 for new stable Xen 4.15 release
Thread-Index: AQHXMYeD2WCkSCcMjEmYs0aCW1a32aq1S+YAgACq8gCAAHVdAIAAeeuA
Date: Fri, 16 Apr 2021 09:40:54 +0000
Message-ID: <1F5A1052-F34B-4AAA-A662-E528871E4F81@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-2-christopher.w.clark@gmail.com>
 <5B911C57-4D5E-40AA-B61A-8C07ACA3A5FE@arm.com>
 <CACMJ4GYkeZTD=QO8-B+mJ5vqneaK4KDN3iGhmVnnNkDYcgpCCA@mail.gmail.com>
 <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N8=WbiwzkiwsFoMO-WMgOdoU9rLRov_fqticwsuxRv2A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 086d5770-d114-42a9-5b0b-08d900bbc310
x-ms-traffictypediagnostic: VI1PR08MB5294:|PAXPR08MB6926:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6926CEC16196EE7B5934F16B9D4C9@PAXPR08MB6926.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DpbKxldn+sG7XAssuw9o78HjRTFUavOFUdcZrG0y4c15TistXuUJoMbtwGq4WbESJGpPzxSr+SzrinF98gy4SqX+n6iI7Ob8PWxWM+oWEUr+2ao13zujO1hL84JV90ZYjsoj4PHfML0PHjhqwb50pltqIyDIi6W33pjW2ZTVTXpt1sFesf+x6hbozTWadjmcrPVVtLEUspRMDuQd+fHgDEJMav7LAAxdWminiMzk71CRdIgaFfevP78mWHhp6z5j0SQG5gt+VeZH9GXig0tAqbFE2K4QRM4PQsQ8da5enSbB74uU2Wwx5pmzpSypwM1geDRj7jCly8b5dzRVZ10m3Qt7kWLYnTCSQ1LWU5sKjMfcztyv5JfpEFEMB13uawv6x/FTrpnroT2Qg2JdtfQTg7VyB/FOrwFMKo/zuVIlDt6SRNcH+XYtjrlMsR+XRbLItXMyo30eduGI8D24u0jc6wRZjZWEhxgohty4n3G5TP0Sh5bAuoXUI5LncarH1mkQ191l88UXQnHEy8m0wUdlZNhRD9IQs4KYTERzivMhqLMSr6f8Ck9DR54v9TjNTQl/ccgKpx0o9nHMWV3lJzoZKP6qgmfugMDndQYOLp5dGHzy1mMuYi//NNV5dqX5LqvNj/w3AtXeqsShXbfAWHEKiT4UiIRzbsuVgvCmdREtDr/VWg2deAMPXIQSCzCSjqmu9j7PZUrO4S0tfTsc3leblZCZnbOjigdjnVQGq+b3J9s=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(38100700002)(83380400001)(54906003)(8676002)(5660300002)(2616005)(71200400001)(66946007)(478600001)(33656002)(8936002)(966005)(6486002)(26005)(66446008)(316002)(66476007)(66556008)(64756008)(53546011)(6506007)(4326008)(36756003)(91956017)(76116006)(122000001)(186003)(6916009)(86362001)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RXJISjZuNnhEZG5OK2tMaWp4emV1Snljb05tVUhDRFBWV0cvdGd6RklnbmJs?=
 =?utf-8?B?ZkNhV1VtNnFtWVdqelNZOUt3TWd4UXhWNGFoek01NFBKWktPRE1aRkxsODgr?=
 =?utf-8?B?SnZZMHFqMDJXN2RrelJwNElQcXJmR1Z3SkYzeUdvNHV6OEk1VTlGaWZrM3Vi?=
 =?utf-8?B?NzhFUy9kMEJZNmVlN3RSaFRkTCtFRUNMbHRyajJmMUJEOW5CVGhPQ3A0eEZl?=
 =?utf-8?B?MHlaQUlkb3ZEbzVTWGxNbUs2eTBMbTN0OVBQMDFnNTZwUStEQm0vVWltVDRJ?=
 =?utf-8?B?TGt5TWZ3ZjhNWGdUOUViM2J4YW5GZjBsaW53TU5pZTBKRit1Y3pwL1dUTmFK?=
 =?utf-8?B?dDJMMEUvTkFOLzRuaG45MDlnenQ0U0NxZ2xveHVjd3QzcWJTK1ZTVXpjcVA3?=
 =?utf-8?B?UExBQXUyTTJHOTlLQWlydDVLb0lNR1QvakZFczMzUGRHcEQwV1FzS29BM2J0?=
 =?utf-8?B?TWdxSXVicHpCbGIzc05CdjFtdVhIbTVidEdpUjdaWkJ1cVh1Y1AyeTFVZDZC?=
 =?utf-8?B?RFVuekFKUmxobDRVdlVWMENmZVk3RDZ0aTJqUEFNUW1CSjEyTGRPWVBSTTZ6?=
 =?utf-8?B?cWF1SU8wa3NWZzIyQUQ0aVlPS1B2a1NmMC8rU1E1cFJrN1NRMDBJTmRvU3g1?=
 =?utf-8?B?bVpPck1pL3JKaTVMUE92V1poOVlzZ1d5NG1vUHhXbDY2UjhsaWp0M29ObHVB?=
 =?utf-8?B?b2VwbHJ5LzZzbzUxL3FZNVVYY1RhVHJCZjE4aS9kQUNLendCYUt5TzR4Y0U1?=
 =?utf-8?B?UTBkeUxXT1QyaTVrY1h2WThNRUs4WTExa1VIZmprUjFOMUE1UFp1MTZ0S01W?=
 =?utf-8?B?aWViZHVBZGFJUDNZWWliWndQRktoQTR4dUhxcms0aytPMm5kYzNsU0lGRWsv?=
 =?utf-8?B?YnQ0SnpEOTR5eWVla0thR0luMFJtS3ZKeTM1S1BBNzlsc1FpVkNTM1FyWTZw?=
 =?utf-8?B?enduV1pPSjAzTzUzWHZ5Tm5EVEVVcTBYOW1UWTZlWU9YWU1XbDFHQVRIbU5M?=
 =?utf-8?B?bUQ3dWNGQ2lzdjNxYmVoaGc5Tjc5T2hScnJtVTVidUZGVGY2UmdtZTI2eWZh?=
 =?utf-8?B?US8wQ2xsTUJ6b1lxbUZRV05uWkI3QS85MzlwUUR4bkNJUEJjM1RZSXU3ajN1?=
 =?utf-8?B?SXBZeTJlTm5obG1pbjg3S0g3eWtIRUpNVFZ0dytnN1hEYlBQcHgvOXFIMW9j?=
 =?utf-8?B?a3pIdjA4WCsrYUxtQnhtczBMUnYzMWlIYjJ5ODNFelp0YUJMTHF0bjFQY0NI?=
 =?utf-8?B?SG5UQmIwKzhnWGY2Y1YxVzFpK25xc2E3K3IxREFUYlE3U3dzSzh1NVlMeGp0?=
 =?utf-8?B?YmErN0dxUjJqWklTVTQxMGs2SzQ4ZkNJcHFibW9wRlBTOVNmeVBKSWlTTXBP?=
 =?utf-8?B?SGN4ekIyU0dubFBFTlVyeHVsZDhtNVZJMVl1L2FrM1FSaUhrei9FRmpLa1dy?=
 =?utf-8?B?WWwwRXNua0U0cmdua2JWczAvK3hWdk8yd3VVNHZsSlBEQ1Q1NUhST0g1U2VZ?=
 =?utf-8?B?QXJRM0QrMEF0RDlNV2J5T25NN0dPOTdWRmNScjVoaCtnL0xyUEk3MGxwRWw3?=
 =?utf-8?B?cWEzalVJVkpYRUR4NUhDblJrMkYxY2ZwSm8wN3VtaGdaMTJuemcvOGgyT3dt?=
 =?utf-8?B?NFZFZDR5bW03M3Z6eFFQS1QzUy9Lb1l2SkRmaUpOQkg1OEFNSzZRdVRDUktS?=
 =?utf-8?B?Y2taVW04SDNCamlpVzg2ZElYUXJkZzMzNDhNb1gxSk1rZ2hSQi9LTUlCa2FF?=
 =?utf-8?B?T2pPQjBBUThpeldkTGU1cW9TWE1iMWZTRWtlWTNRS2N2ZGVXU284WFN0VCsz?=
 =?utf-8?B?QlZGMmRVdWhOd2FuZnQvQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5294
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	690184db-199f-4bad-6b4d-08d900bbbae7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kfoIj3YHMercThPtmMW5OzZh/1wxF3Tocd7mrmePLHlFwvX9Tjuwu14fP/7b4/p5sBCyWZWx9GCe5TaO2cMl+pJbquZFNesXoi0DHKbYzgTGa6vIS/nQokm0P37eJPPBMlKt3uI5YMqSkBV5Yhs7kpRS6xxhRKnarjuW+W+laG18tJXz+0L/sDGAgdA6a2BhD4Q9twJggq4Rx/37Ieuh20kRRJqbxce0O+cwwDuF6UJRwHP4Vw0hbrkpnXBnu9Ped45YHbX22KuW+Eg7r7mf9R8p7HuD33fEOr+XJyFLGy+yFwF/Hl+DVDgL8PdOR7olChuBCE5VEMcu8IRSyOulVxvsnD/ut3sToRlv5uqJEn0j2mRzKH4fFAV7fqizvgZW9wEH8x70PI5H+ZYtFqH9R8JutrOzLCVBUXYCCLU++4zqbj1xiHxFxuwQwfFKU5EHlbUAOKkV0LczHu0x5r994euO3aRNf7V3nOdSr8XbuSHOBoROD/XvRcWkmNLI8anee1Jjj8djc29YLLkLS5MSiZDeq6VWqlF2AmqTQaNOppFKLWc98cZyHLj+b7cyQ5YAIjCJ/l/qR+yy3uqml+dfqK/ONmut91lGV0bB6JKXaFWMdYOuFe9EBr856VynTBrDu0VEP6b8pkPZjsuenAonS5+/PKQGVPu9yrEIV69MoEjNkYB87R752nmeB5H5uXd6CubvIc6zI2I8fTHwmxP6hLr/QoMIHKjI2yhVVwbVlx0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(2616005)(47076005)(8936002)(316002)(54906003)(6486002)(82310400003)(83380400001)(356005)(8676002)(81166007)(4326008)(36756003)(478600001)(336012)(33656002)(6862004)(966005)(5660300002)(2906002)(6512007)(26005)(107886003)(53546011)(6506007)(70206006)(70586007)(36860700001)(186003)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 09:41:07.9390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 086d5770-d114-42a9-5b0b-08d900bbc310
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6926
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC14970284A0D04F95618143DEEEB688@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCj4gT24gMTYgQXByIDIwMjEsIGF0IDAzOjI0LCBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2Uu
YXNoZmllbGRAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gT24gVGh1LCBBcHIgMTUsIDIwMjEgYXQg
MzoyNCBQTSBDaHJpc3RvcGhlciBDbGFyaw0KPiA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5j
b20+IHdyb3RlOg0KPj4NCj4+IE9uIFRodSwgQXByIDE1LCAyMDIxIGF0IDI6MTIgQU0gQmVydHJh
bmQgTWFycXVpcw0KPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4NCj4+
PiBIaSBDaHJpc3RvcGhlciwNCj4+Pg0KPj4+PiBPbiAxNSBBcHIgMjAyMSwgYXQgMDA6MzksIENo
cmlzdG9waGVyIENsYXJrIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxjaHJpc3RvcGhlci53
LmNsYXJrPWdtYWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4+Pj4NCj4+
Pj4gQWRkZWQgYXMgbm9uLWRlZmF1bHQsIHJldGFpbmluZyB0aGUgWGVuIDQuMTQgcmVjaXBlcyBh
cyB0aGUgZGVmYXVsdA0KPj4+PiBwcmVmZXJyZWQgdmVyc2lvbiBmb3IgdGhlIEhhcmRrbm90dCBy
ZWxlYXNlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hy
aXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiByZWNpcGVzLWV4dGVu
ZGVkL3hlbi94ZW4tdG9vbHNfNC4xNS5iYiB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+Pj4+
IHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE1LmJiICAgICAgIHwgMjEgKysrKysrKysrKysr
KysrKysrKysrDQo+Pj4+IDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPj4+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1leHRlbmRlZC94ZW4veGVuLXRvb2xzXzQuMTUuYmIN
Cj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE1LmJi
DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHNf
NC4xNS5iYiBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbi10b29sc180LjE1LmJiDQo+Pj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAuLmQ4Y2I4NDYNCj4+Pj4gLS0t
IC9kZXYvbnVsbA0KPj4+PiArKysgYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW4tdG9vbHNfNC4x
NS5iYg0KPj4+PiBAQCAtMCwwICsxLDIwIEBADQo+Pj4+ICtTUkNSRVYgPz0gImUyNWFhOTkzOWFl
MGNkODMxNzYwNWJlM2Q1YzU2MTFiNzZiYzRhYjQiDQo+Pj4+ICsNCj4+Pj4gK1hFTl9SRUwgPz0g
IjQuMTUiDQo+Pj4+ICtYRU5fQlJBTkNIID89ICJzdGFibGUtJHtYRU5fUkVMfSINCj4+Pj4gKw0K
Pj4+PiArU1JDX1VSSSA9ICIgXA0KPj4+PiArICAgIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4u
Z2l0O2JyYW5jaD0ke1hFTl9CUkFOQ0h9IFwNCj4+Pj4gKyAgICBmaWxlOi8vMDAwMS1weXRob24t
cHlncnViLXBhc3MtRElTVFVUSUxTLXhlbi00LjE1LnBhdGNoIFwNCj4+Pj4gKyAgICAiDQo+Pj4+
ICsNCj4+Pj4gK0xJQ19GSUxFU19DSEtTVU0gPz0gImZpbGU6Ly9DT1BZSU5HO21kNT00MTk3Mzll
MzI1YTUwZjNkN2I0NTAxMzM4ZTQ0YTRlNSINCj4+Pj4gKw0KPj4+PiArUFYgPSAiJHtYRU5fUkVM
fStzdGFibGUke1NSQ1BWfSINCj4+Pj4gKw0KPj4+PiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4+
Pj4gKw0KPj4+PiArREVGQVVMVF9QUkVGRVJFTkNFID8/PSAiLTEiDQo+Pj4NCj4+PiB3ZSBoYXZl
IGEgZmlsZSBtZXRhLXZpcnQtZGVmYXVsdC12ZXJzaW9ucy5pbmMgaW4gY29uZi9kaXN0cm8vaW5j
bHVkZQ0KPj4+DQo+Pj4gU2hvdWxkbuKAmXQgd2UgdXNlIHRoYXQgZmlsZSBhbmQgc2V0IFBSRUZF
UlJFRF9WRVJTSU9OIGluc3RlYWQgb2YgdXNpbmcgZGVmYXVsdA0KPj4+IHByZWZlcmVuY2UgaW4g
ZWFjaCByZWNpcGUgPw0KPj4NCj4+IEkgd2Fzbid0IGF3YXJlIG9mIHRoYXQgZmlsZSBzbyBoYWRu
J3QgY29uc2lkZXJlZCBpdCAtLSBpdCdzIG5vdA0KPj4gb2J2aW91cyBhcyBhIHBsYWNlIHRvIGxv
b2sgdG8gdW5kZXJzdGFuZCBob3cgdGhlIHZlcnNpb24gb2YgWGVuIGlzDQo+PiBiZWluZyBzZXQs
IG9yIHRoYXQgaXQgd2lsbCBjaGFuZ2UgdGhlIGRlZmF1bHQgdmVyc2lvbiBvZiBYZW4gYWNjb3Jk
aW5nDQo+PiB0byB3aGV0aGVyIHRoZSBESVNUUk9fRkVBVFVSRVMgaW5jbHVkZXMgJ3ZpcnR1YWxp
emF0aW9uJy4gU28gSSBhbSBub3QNCj4+IHN1cmUgdGhhdCB3ZSBzaG91bGQgZG8gdGhhdC4NCj4N
Cj4gSGF2aW5nIC5pbmMgZmlsZXMgd2l0aCBsaXN0cyBvZiBjZW50cmFsaXplZCB2ZXJzaW9ucyBp
cyBoaXN0b3JpY2FsbHkNCj4gd2hhdCBoYXMgYmVlbiBkb25lIGFuZCB0Y21vZGUtZGVmYXVsdC5p
bmMgc3RpbGwgZG9lcy4NCj4NCj4gV2UgYWN0dWFsbHkgZG8gb25seSB3YW50IHRob3NlIHByZWZl
cnJlZCB2ZXJzaW9ucyB0byBraWNrIGluIHdoZW4gYQ0KPiBkaXN0cm8gZmVhdHVyZSBpcyBzZXQg
KHhlbiwgdmlydHVhbGl6YXRpb24gLi4gd2hhdGV2ZXIpLCBzaW5jZSB0aGF0DQo+IG1lYW5zIHdl
IGNhbiBpbmNsdWRlIHRoZSBsYXllciBhbmQgaXQgd29uJ3QgY2hhbmdlIGFueXRoaW5nIHVubGVz
cyB0aGUNCj4gZmVhdHVyZXMgYXJlIHR1cm5lZCBvbi4NCj4NCj4+IChBcyBhbiBhc2lkZSwgdGhl
cmUncyBtZXRhLXZpcnQteGVuLmluYyBpbiB0aGF0IGRpcmVjdG9yeSB0aGF0IEkgd291bGQNCj4+
IGxpa2UgdG8gcmV0aXJlIGFuZCByZW1vdmUgYnkgbWFraW5nIGltcHJvdmVtZW50cyBlbHNld2hl
cmUsIGZvcg0KPj4gc2ltaWxhciByZWFzb25zLikNCj4+DQo+Pj4gU29tZXRoaW5nIGxpa2U6DQo+
Pj4gUFJFRkVSUkVEX1ZFUlNJT05feGVuID89ICI0LjE0JSINCj4+PiBQUkVGRVJSRURfVkVSU0lP
Tl94ZW4tdG9vbHMgPz0gIjQuMTQlIg0KPj4+DQo+Pj4gVGhpcyB3b3VsZCBwcmV2ZW50IG1vZGlm
eWluZyB0aGUgcmVjaXBlcyB3aGVuIHdlIGNoYW5nZSB0aGUgZGVmYXVsdCB2ZXJzaW9uLg0KPj4N
Cj4+IEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgdG8gbW9kaWZ5IHRoZSByZWNpcGVzIHdoZW4gdGhl
IGRlZmF1bHQgdmVyc2lvbg0KPj4gaXMgY2hhbmdlZCwgdG8gbWFrZSBpdCBhIGNsZWFyIGxvY2Fs
aXplZCBjaGFuZ2UgaW4gdGhlIFhlbiByZWNpcGUNCj4+IGRpcmVjdG9yeS4NCj4NCj4gSSBjYW4g
c2VlIHRoZSBhZHZhbnRhZ2Ugb2YgYm90aCBhcHByb2FjaGVzLg0KPg0KPiBUaGUgcHJvYmxlbSB3
aXRoIHRoZSBERUZBVUxUX1BSRUZFUkVOQ0UsIGlzIHRoYXQganVzdCBhcyBtYW55IHBlb3BsZQ0K
PiBoYXZlIG5vIGlkZWEgd2hhdCBpdCBkb2VzLCBob3cgbGF5ZXIgb3JkZXJpbmcgZG9lcyAob3Ig
ZG9lc24ndCkgaW1wYWN0DQo+IGl0LCBldGMuICBJdCBpcyBhIGJpdCBoYXJkZXIgdG8gZ3JvayB0
aGFuIGFuIGV4cGxpY2l0bHkgbGlzdGVkIHZlcnNpb24NCj4gKGFuZCB5b3UnbGwgZ2V0IGEgd2Fy
bmluZyBpZiBhIHJlcXVlc3RlZCB2ZXJzaW9uIGlzbid0IGF2YWlsYWJsZSwNCj4gZXRjKS4gIEJ1
dCBvZiBjb3Vyc2UgREVGQVVMVF9QUkVGRVJFTkNFIGV4aXN0cyBmb3IgYSByZWFzb24gLi4gYW5k
DQo+IHRoaXMgaXMgb25lIG9mIHRoZW0uIEkgdGhpbmsgaXQgZG9lcyBjb21lIGRvd24gdG8gcHJl
ZmVyZW5jZSBhbmQNCj4gY29uc2lzdGVuY3kuDQo+DQo+IEkgZG8gbGVhbiB0b3dhcmRzIHRoZSAu
aW5jIG15c2VsZiwgc2luY2Ugd2UgbmVlZCB0aGVtIGZvciBvdGhlcg0KPiBjb29yZGluYXRpbmcg
ZmVhdHVyZXMgaW4gdGhlIGxheWVyKHMpLCBidXQgSSdtIGZhciBmcm9tIGluc2lzdGluZyBvbg0K
PiB0aGF0IGFwcHJvYWNoLg0KDQpJIGRvIHRoaW5rIHRoYXQgdGhlIERFRkFVTFRfUFJFRkVSRU5D
RSBpcyBraW5kIG9mIGltcGxpY2l0IHNvIGhhcmQNCnRvIGdldCBmb3IgYSB1c2VyLg0KV2hlcmUg
dGhlIFBSRUZFUlJFRF9WRVJTSU9OIGlzIGNsZWFyIGFuZCBlYXN5IHRvIG92ZXJsb2FkIGluDQp5
b3VyIGxvY2FsLmNvbmYgd2hlbiB5b3Ugd2FudCB0byB1c2Ugc29tZXRoaW5nIGRpZmZlcmVudC4N
Cg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+DQo+IEJydWNlDQo+DQo+PiBXb3VsZCB0aGF0IGJlIGFj
Y2VwdGFibGU/DQo+Pg0KPj4gQ2hyaXN0b3BoZXINCj4+DQo+Pj4NCj4+PiBDaGVlcnMNCj4+PiBC
ZXJ0cmFuZA0KPj4+DQo+Pj4+ICsNCj4+Pj4gK3JlcXVpcmUgeGVuLmluYw0KPj4+PiArcmVxdWly
ZSB4ZW4tdG9vbHMuaW5jDQo+Pj4+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL3hlbi94
ZW5fNC4xNS5iYiBiL3JlY2lwZXMtZXh0ZW5kZWQveGVuL3hlbl80LjE1LmJiDQo+Pj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAuLjQ5MjY4Y2MNCj4+Pj4gLS0tIC9k
ZXYvbnVsbA0KPj4+PiArKysgYi9yZWNpcGVzLWV4dGVuZGVkL3hlbi94ZW5fNC4xNS5iYg0KPj4+
PiBAQCAtMCwwICsxLDIxIEBADQo+Pj4+ICtTUkNSRVYgPz0gImUyNWFhOTkzOWFlMGNkODMxNzYw
NWJlM2Q1YzU2MTFiNzZiYzRhYjQiDQo+Pj4+ICsNCj4+Pj4gK1hFTl9SRUwgPz0gIjQuMTUiDQo+
Pj4+ICtYRU5fQlJBTkNIID89ICJzdGFibGUtJHtYRU5fUkVMfSINCj4+Pj4gKw0KPj4+PiArU1JD
X1VSSSA9ICIgXA0KPj4+PiArICAgIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0O2JyYW5j
aD0ke1hFTl9CUkFOQ0h9IFwNCj4+Pj4gKyAgICBmaWxlOi8veGVuLWFybTY0LWltcGxlbWVudC1h
dG9taWMtZmV0Y2gtYWRkLnBhdGNoIFwNCj4+Pj4gKyAgICBmaWxlOi8vMDAwMS1tZW51Y29uZmln
LW1jb25mLWNmZy1BbGxvdy1zcGVjaWZpY2F0aW9uLW9mLW5jdXJzZXMtbG9jYXRpb24ucGF0Y2gg
XA0KPj4+PiArICAgICINCj4+Pj4gKw0KPj4+PiArTElDX0ZJTEVTX0NIS1NVTSA/PSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTQxOTczOWUzMjVhNTBmM2Q3YjQ1MDEzMzhlNDRhNGU1Ig0KPj4+PiArDQo+
Pj4+ICtQViA9ICIke1hFTl9SRUx9K3N0YWJsZSR7U1JDUFZ9Ig0KPj4+PiArDQo+Pj4+ICtTID0g
IiR7V09SS0RJUn0vZ2l0Ig0KPj4+PiArDQo+Pj4+ICtERUZBVUxUX1BSRUZFUkVOQ0UgPz89ICIt
MSINCj4+Pj4gKw0KPj4+PiArcmVxdWlyZSB4ZW4uaW5jDQo+Pj4+ICtyZXF1aXJlIHhlbi1oeXBl
cnZpc29yLmluYw0KPj4+PiAtLQ0KPj4+PiAyLjI1LjENCj4+Pj4NCj4+Pj4NCj4+Pj4gDQo+Pj4+
DQo+Pj4NCj4+PiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBh
bmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZp
bGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50
cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBv
ciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo+DQo+DQo+
DQo+IC0tDQo+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBj
aGFvcyBhbmQgbWFkbmVzcyBhd2FpdA0KPiB0aGVlIGF0IGl0cyBlbmQNCj4gLSAiVXNlIHRoZSBm
b3JjZSBIYXJyeSIgLSBHYW5kYWxmLCBTdGFyIFRyZWsgSUkNCg0KSU1QT1JUQU5UIE5PVElDRTog
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlk
ZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5k
IGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0
IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55
IG1lZGl1bS4gVGhhbmsgeW91Lg0K
