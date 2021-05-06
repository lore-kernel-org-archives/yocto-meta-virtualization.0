Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web08.5637.1620280926161524037
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 May 2021 23:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d50jhWqt;
 spf=pass (domain: arm.com, ip: 40.107.0.72, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxFnl+iCvv9NSMiDctW8IWGteetU0iDkmZc86obdSGU=;
 b=d50jhWqtqQh0FKqaJeDZNKAgumJ/QJdlG1qJgZLZGA0oVStojJe3YuY4Y06Fgh13clQxIxjWIyM8tn8vFDwx5eOD7ZeFnZTzwKiPmDS/KeN4Irv3T9Z9W1Tkri0CtPvS1S7SiE6ERsVm/nSSDPG8DAwBgHsMgV9ox4NK7TGNqRg=
Received: from MR2P264CA0141.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::33)
 by DB6PR08MB2774.eurprd08.prod.outlook.com (2603:10a6:6:23::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Thu, 6 May
 2021 06:01:55 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::28) by MR2P264CA0141.outlook.office365.com
 (2603:10a6:500:30::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 06:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 06:01:54 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91"); Thu, 06 May 2021 06:01:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from 3acc55509b92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7B739F5-C4D6-440E-B7C9-2ECD5BD685E1.1;
	Thu, 06 May 2021 06:01:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3acc55509b92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 May 2021 06:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpK3cf9wZcL7s5Q3aZnNX550lf53olpk3bzrRfpVR7o5ZN+XIi88Fw1Ydab/jlhyRWTz44rL/RTMrcoyWjhSjcfGJsIlGICBJcDpae9lJqn/nVGcTpsolPL5fej9GNCML7bRdtmJ03IBEwx/Q6WI2ChjLxW1ttaq/LWKJZnmeN83K5ORtDKSc6HHGtnwzzRS2oNlo3YE8RcK1GIHL3/MpapjpNOtOy4UbDT3fN3x/qA9QR1HvuBpwtQTEqwBjAUU+VdhMOmxm/GmY/jS/uol3dKlZ46s8gLbip6TPuvHjiQWgCH83W3NYjY+loClMf7tBNEZp7Bku7YK16rKb7RIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxFnl+iCvv9NSMiDctW8IWGteetU0iDkmZc86obdSGU=;
 b=HwdEQQ19+i7yO8RimZxhAxvrWLRUmrXQ1mgDFVPrPg9/RlBwwFAcohYqvhDIhmxiH0N3nfSfwn3SZnJevZb+OIhRihrGlgurIAf/q/qLtCL4xbc98h+hzscTGC7kq55VopDuPzsfPsNwX2BxheTs1SXppQDmOZqS4VslGZjPBOmyyqqeEziWRFV6V9nEaUJyzydYoceCzIyDw/w1jqLJ/zXCsF5yiq7QZrmOa1UMszP55YwbECfuja3yqmaK8c3noFYODvJYsD6vILAAOYr54YYsYBDP0A4tqk7lTl58bBJrjceta8AtApFLTAI/6fENdvbJWX+/e9Z+bda63R5cPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxFnl+iCvv9NSMiDctW8IWGteetU0iDkmZc86obdSGU=;
 b=d50jhWqtqQh0FKqaJeDZNKAgumJ/QJdlG1qJgZLZGA0oVStojJe3YuY4Y06Fgh13clQxIxjWIyM8tn8vFDwx5eOD7ZeFnZTzwKiPmDS/KeN4Irv3T9Z9W1Tkri0CtPvS1S7SiE6ERsVm/nSSDPG8DAwBgHsMgV9ox4NK7TGNqRg=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6392.eurprd08.prod.outlook.com (2603:10a6:20b:31a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 06:01:42 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 06:01:42 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: xen-tools compilation errors with GCC 11
Thread-Topic: xen-tools compilation errors with GCC 11
Thread-Index: AddCPA7nTi4GFZwESYWNOS6pOr1sWg==
Date: Thu, 6 May 2021 06:01:41 +0000
Message-ID: 
 <AM6PR08MB34616A38425054102C5C6ED692589@AM6PR08MB3461.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 7E27041B3D1D1242977CAA6BD9C7BC48.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [5.68.2.5]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a852117-c252-4452-a6ba-08d91054738f
x-ms-traffictypediagnostic: AS8PR08MB6392:|DB6PR08MB2774:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2774B6A093FE20B76D2F22C292589@DB6PR08MB2774.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QmKc48cNu9omYsYtvxGFwv4+ln9M43xox2L1ggiTK65w+tW6GPpvR3/C4gSAA+hI81w3kSg0jAsT6tWCYMIOaF14Me3aScGcuuA7+v6YDj/v0nlcXPFWHnZgCrGbKDC9vPTf/xZHVIRigzYmTWJhoF9ziTDJggnqhP19QMHbWNCzoXh8u6N6+v42y1RVsmSCoJIhDHfgBu5ttIeinss/GumfK2UUQdFQssyBoxr4PDnRIay7tl+CDgWP2GaHdUldGnl5NuDU5ptkMS4czV39ucDUMPKAYo984q7l+T71mIuCi+3uUnKVZ+Wls125yrUZIqQ602v9XqUGalcZqLHS/cPB2Yh7wDL4sqYvZir/msWUrSDV+0N4B5hZ+MZz970jrMcJIP/ufTVcGt25L0ROIOUJONkrLV13JFJj/tQgbY+gdSKarWVbnEEFHIjHSgZBXcZBQoeffZomdsHmNknlVWtLI9UH0qSD/zukWvTT6HVB3KRgoq/81OknUHE2p6FhTQy3F/MvK+205ER4f6tRKIbDeyJjAUIgtlan1Oq0dNLdy7iOARz5NCJAridToC2hXylUzb25i2eVJpcb3JPtbE204sgX7J2FwYw7OnztAF4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(76116006)(8936002)(9326002)(26005)(86362001)(64756008)(4326008)(38100700002)(66946007)(9686003)(186003)(33656002)(6506007)(8676002)(478600001)(55236004)(2906002)(52536014)(71200400001)(7696005)(316002)(66446008)(55016002)(5660300002)(122000001)(54906003)(66476007)(83380400001)(66556008)(6916009)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?RXR0A08UE82Z5eqAbNqDyyr7+aRDYGmfrgFSQl5C/HPJ3HDm4QVj9T55Gtkt?=
 =?us-ascii?Q?Yqai5H7ws5ncr9FuxOblMUbp2Ocf1bdBS9FWg/1w+v1w3Flv6fdTBMYPlnhl?=
 =?us-ascii?Q?JyAI2nk/I7HWTCIfEBcEDI/VNeRsqQlIxDQn6822rPwrILgny1kYHGTwxxdN?=
 =?us-ascii?Q?lOjUzJ0rw4Db0+e5O0f05rrJofFzv7nbaf8rhgEDiuKXV6pNwxd7A8T8M7ze?=
 =?us-ascii?Q?MitVtf5/g7KzC2fUr6oYJdnOKIfbtQ7UOSHp8TjgW4XAhjNLQ3uq5wTphe49?=
 =?us-ascii?Q?ie9AX+LTy4flSI29Wc28CjVOm2KLdi8ooCcczQxJCDUv5iC6I4PJBnEcw/pM?=
 =?us-ascii?Q?0H18RFdQuCQ0QXs0H+s0vByMSr32TtOuiCttjTYh2ENlsr2P+IJdhTnytSpz?=
 =?us-ascii?Q?uTHEF9XzSP+aLc67JDMGm7hjyh1t+QuPPLIeRwnvmmIDYFT6QdR7t0lxv00h?=
 =?us-ascii?Q?ffEzECSIAgHS2Jg9F6uhbcWhGN1oQ2sUb5TYgc5Sk4gDjiusk/+DpNZrC8dZ?=
 =?us-ascii?Q?YA6O+V6sHVrrGNSP2QwHJw4T5BtF2sZ5RFgPZ7jfiH8EKbkxwsgUGfs2WvO6?=
 =?us-ascii?Q?+KIfLVe/nuuOUckkNvED+kvTR091L2l3dQEcsSWhUnlpehxujAD5j3/NiJeu?=
 =?us-ascii?Q?yWYa0SAFUV6AZ1H0eJsda5OErg915jxSA43Z3vm3qZr0BDXtcCc4jSCXk0Nc?=
 =?us-ascii?Q?dvbDRqgg1f27bl30/snuyboOsAVMZ2Al8T0+j6Qpp2CNluIqWOu6FiewYfgy?=
 =?us-ascii?Q?J0prv9qwbluwLvl3UZkaSfdVQB3BIYujM/m+UUEu7qtFuJKDv/MH2rO+Qhud?=
 =?us-ascii?Q?FxPYV92rAnmNPtB6GhmnDM0DQAxbo8aNEH5s4ccZZdb5xJtVRGrFN+mpf15x?=
 =?us-ascii?Q?3N4OkQxPmtc1IS5s/PyJPSHQ4DP5wljbBYYAAfuZJ/wmpeh2lWlvcBxgXySp?=
 =?us-ascii?Q?fuoy1LmRrEp5IEMqX39jtPbF7DWl+CaOIAzhXn4YosvWFnIOBxHMNhizKazv?=
 =?us-ascii?Q?UTWzEUxhneDWXZapnf4BOxhHhMpb/n4FiamL+k0OBE7Mh4OiMfV1sSYu/uvS?=
 =?us-ascii?Q?+hYGPf9f04iFdmIwZN2BILoTVloqBwrBXvvVIjlsX6SLVZzU7GkiQIqYC5nA?=
 =?us-ascii?Q?RXIZIw3OkS7pKtTwVDpsWRF/hHHeoZN8kgEiwk9Rg0IhZTTgtddLhiVGCE46?=
 =?us-ascii?Q?gKgtuoqLEwnxEDYNy7tt8Sk/ZmspK7f8v1Vdl42bX4f1A+jjmEiUnWb+eke2?=
 =?us-ascii?Q?OvDuPMYwjr4ubmER/ZzkoxqE8zafcxaz0udO/EXrJCMJtEXh5O9Cc++qFem0?=
 =?us-ascii?Q?IhM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6392
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6013746c-de6f-4242-ebb5-08d910546bb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YrKl101NOvdZgd95aINgznkEbydE0cYQctPMlpOfF37AvVwkvfGkCvILjtvYwr+s2ivPFWkZIJkvPDTmj0UqqVjCGLRNZrUns6JKflO00paGJ/FOm8fW7BZRaqoYk/EuToio+cFj9LWQz62ISOyvfu7qqFtvjyNIEXIKgqajKI3gXkpI90bWGHoDUOA5RhNlEPbQyN3em4LOLNEJST3r1f64aLb1fKc5BQxGBbfBltGlBfJfEZkPnuJ3gHq/d4Od+9O/ect+KH6li12m6ZH2uUugbDQZNeHwAxeVVg62Y8APsVB5ucxTneT7YxHFDfx7jlomsYDPlInCDcXMM6JANyqeXKKX6y2s7o3L5YB2dwmMVqhvyJY/H69l1uxKhyBMtEL4woMNuWg3If7w+9HUUOkih9yCJT7IuQyZskVzoOAVwS3kmZWFOoA3KCvE6NuMp3tqpdNu7+whwyt6Fnecn3bC4PeHKcOqeFmWTSBplkQMxFPbU6DW+B+NsCBQPpn1S961Ow+rfA5aeJ0ALhVa0vvYraaKUL7sxVrMxzqobRc1Cd1GDSCgq5OSfZbKWqpg4NSzC2P1y8YGCvV+cqv1mgm5L6+ffYpicQFv8eSkSl99T/x8RHQnfWwp74HsoTeL2PgF54DV37HbuPbKxexC6ttoq+bnD8rTj7nlKp5anwY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(55016002)(9686003)(107886003)(81166007)(82310400003)(316002)(8936002)(52536014)(36860700001)(26005)(8676002)(336012)(54906003)(82740400003)(70586007)(4326008)(7696005)(6506007)(55236004)(9326002)(6916009)(5660300002)(47076005)(33656002)(70206006)(186003)(2906002)(478600001)(356005)(83380400001)(86362001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 06:01:54.9955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a852117-c252-4452-a6ba-08d91054738f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2774
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB34616A38425054102C5C6ED692589AM6PR08MB3461eurp_"

--_000_AM6PR08MB34616A38425054102C5C6ED692589AM6PR08MB3461eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We identified compilation errors for xen-tools (4.14 and 4.15) with GCC 11.=
1 due to `-Werror=3Dvla-parameter`.

There are a couple of source files with similar errors like this:
```
linux.c:164:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const l=
ong unsigned int[]'} declared as an ordinary array [-Werror=3Dvla-parameter=
]
  164 |                                  const xen_pfn_t arr[/*num*/], int =
err[/*num*/])
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
```

The quick fix for is to have the following:
```
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc
index 3560e79..5a054af 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -725,9 +725,11 @@ do_configure() {
     do_configure_common
}

+EXTRA_CFLAGS_XEN_TOOLS_append =3D " -Wno-vla-parameter"
+
do_compile() {
     cd ${S}
-    oe_runmake tools PYTHON=3D"${PYTHON}"
+    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_TOOLS}" =
PYTHON=3D"${PYTHON}"
}

do_install() {
```

I'd like to know if this is an acceptable solution or if you have any other=
 suggestions other than fixing the actual code
since this might take some time and I think that the Xen community will be =
looking at this soon.

Cheers,

--
Diego Sueiro



--_000_AM6PR08MB34616A38425054102C5C6ED692589AM6PR08MB3461eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"ProgId" content=3D"Word.Document">
<meta name=3D"Generator" content=3D"Microsoft Word 15">
<meta name=3D"Originator" content=3D"Microsoft Word 15">
<link rel=3D"File-List" href=3D"cid:filelist.xml@01D74245.A86818D0"><!--[if=
 gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
<o:DoNotRelyOnCSS/>
</o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:WordDocument>
<w:Zoom>130</w:Zoom>
<w:SpellingState>Clean</w:SpellingState>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:PunctuationKerning/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-GB</w:LidThemeOther>
<w:LidThemeAsian>ZH-CN</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:BreakWrappedTables/>
<w:SnapToGridInCell/>
<w:WrapTextWithPunct/>
<w:UseAsianBreakRules/>
<w:DontGrowAutofit/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
<w:DontFlipMirrorIndents/>
<w:OverrideTableStyleHps/>
<w:UseFELayout/>
</w:Compatibility>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false" DefSem=
iHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99" LatentStyleCount=
=3D"376">
<w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D"No=
rmal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"he=
ading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Normal Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"header"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footer"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"index heading"/>
<w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"table of figures"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"envelope address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"envelope return"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"footnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"line number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"page number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"endnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"endnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"table of authorities"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"macro"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"toa heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Bullet 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Number 5"/>
<w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" Name=3D"T=
itle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Closing"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Signature"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true" UnhideW=
henUsed=3D"true" Name=3D"Default Paragraph Font"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"List Continue 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Message Header"/>
<w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D"S=
ubtitle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Salutation"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Date"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text First Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text First Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Note Heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Body Text Indent 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Block Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"FollowedHyperlink"/>
<w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" Name=3D"S=
trong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" Name=3D"E=
mphasis"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Document Map"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Plain Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"E-mail Signature"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Top of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Bottom of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Normal (Web)"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Acronym"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Cite"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Code"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Definition"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Keyboard"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Preformatted"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Sample"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Typewriter"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"HTML Variable"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"annotation subject"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"No List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Outline List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Simple 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Classic 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Colorful 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Columns 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Grid 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table List 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table 3D effects 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Contemporary"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Elegant"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Professional"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Subtle 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Subtle 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Web 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Table Web 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Balloon Text"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder Te=
xt"/>
<w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=3D"No=
 Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1"/=
>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2"/=
>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading"/=
>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
<w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true" Name=3D"L=
ist Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Name=3D"Q=
uote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true" Name=3D"I=
ntense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 1=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 2=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 3=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 4=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 5=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accent =
6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accent =
6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1 A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2 A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent 6=
"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading A=
ccent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Acce=
nt 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true" Name=3D"S=
ubtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true" Name=3D"I=
ntense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true" Name=3D"S=
ubtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true" Name=3D"I=
ntense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Name=3D"B=
ook Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" Unhide=
WhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
<w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table 1"/>
<w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table 5"/>
<w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table Light"/=
>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark"=
/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Light=
 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dark =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark"=
/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Light=
 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Accen=
t 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dark =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Color=
ful Accent 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Smart Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Hashtag"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Unresolved Mention"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"true=
" Name=3D"Smart Link"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536869121 1107305727 33554432 0 415 0;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-alt:|\00A8\00AC\00A1\00A7\00A1\00A7??;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:-1610612033 953122042 22 0 262159 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:-1610612033 953122042 22 0 262159 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:DengXian;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:DengXian;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-fareast-font-family:DengXian;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
</style><![endif]--><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"tab-interv=
al:36.0pt;word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt">Hello,<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt">We identified compilation errors for xen-tools (4.14 and 4.1=
5) with GCC 11.1 due to `-<span class=3D"SpellE">Werror</span>=3D<span clas=
s=3D"SpellE">vla</span>-parameter`.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt">There are a couple of source files with similar errors like =
this:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt">```<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt">linux.c:164:50: error: argument 7 of type '<span class=3D"Sp=
ellE">const</span>
<span class=3D"SpellE">xen_pfn_t</span>[]' {aka '<span class=3D"SpellE">con=
st</span> long unsigned int[]'} declared as an ordinary array [-<span class=
=3D"SpellE">Werror</span>=3D<span class=3D"SpellE">vla</span>-parameter]<o:=
p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt"><span style=3D"mso-spacerun:yes">&nbsp;
</span></span></font><span lang=3D"PT-BR" style=3D"mso-ansi-language:PT-BR"=
>164 |<span style=3D"mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;
</span>const xen_pfn_t arr[/*num*/], int err[/*num*/])<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span lang=3D"PT-B=
R" style=3D"font-size:11.0pt;mso-ansi-language:PT-BR"><span style=3D"mso-sp=
acerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>|<span style=3D"mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; </span>~~~~~~~~~~~~~~~~^~~~~~~~~~~~<o:p></o:p></span></font>=
</p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span lang=3D"PT-B=
R" style=3D"font-size:11.0pt;mso-ansi-language:PT-BR">```<o:p></o:p></span>=
</font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span lang=3D"PT-B=
R" style=3D"font-size:11.0pt;mso-ansi-language:PT-BR"><o:p>&nbsp;</o:p></sp=
an></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">The quick fix for is to have the following:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">```<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan lang=3D"PT-BR" style=3D"font-size:11.0pt;color:black;background:white;m=
so-ansi-language:PT-BR;mso-no-proof:yes">index 3560e79..5a054af 100644<o:p>=
</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan lang=3D"PT-BR" style=3D"font-size:11.0pt;color:black;background:white;m=
so-ansi-language:PT-BR;mso-no-proof:yes">--- a/recipes-extended/xen/xen-too=
ls.inc<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan lang=3D"PT-BR" style=3D"font-size:11.0pt;color:black;background:white;m=
so-ansi-language:PT-BR;mso-no-proof:yes">+++ b/recipes-extended/xen/xen-too=
ls.inc<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan lang=3D"PT-BR" style=3D"font-size:11.0pt;color:black;background:white;m=
so-ansi-language:PT-BR;mso-no-proof:yes">@@ -725,9 +725,11 @@ do_configure(=
) {<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan lang=3D"PT-BR" style=3D"font-size:11.0pt;color:black;background:white;m=
so-ansi-language:PT-BR;mso-no-proof:yes"><span style=3D"mso-spacerun:yes">&=
nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style=3D"background:white;mso-no-proof:yes">do_configur=
e_common<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">}<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">+EXTRA_CFLAGS_XEN_TOOLS_append =3D &quot; -Wno-vla-parameter&quot;<o:p></=
o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">+<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">do_compile() {<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><span style=3D"mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;
</span>cd ${S}<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">-<span style=3D"mso-spacerun:yes">&nbsp;&nbsp;&nbsp;
</span>oe_runmake tools PYTHON=3D&quot;${PYTHON}&quot;<o:p></o:p></span></f=
ont></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">+<span style=3D"mso-spacerun:yes">&nbsp;&nbsp;&nbsp;
</span>oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS=3D&quot;${EXTRA_CFLAGS_XEN_T=
OOLS}&quot; PYTHON=3D&quot;${PYTHON}&quot;<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">}<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">do_install() {<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">```<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">I&#8217;d like to know if this is an acceptable solution or if you have a=
ny other suggestions other than fixing the actual
 code<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">since this might take some time and I think that the Xen community will b=
e looking at this soon.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">Cheers,<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:11.0pt;color:black;background:white;mso-no-proof:yes=
">--<br>
Diego Sueiro</span><span style=3D"mso-no-proof:yes"><br style=3D"mso-specia=
l-character:line-break">
<![if !supportLineBreakNewLine]><br style=3D"mso-special-character:line-bre=
ak">
<![endif]></span></font><span style=3D"mso-no-proof:yes"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
</body>
</html>

--_000_AM6PR08MB34616A38425054102C5C6ED692589AM6PR08MB3461eurp_--
