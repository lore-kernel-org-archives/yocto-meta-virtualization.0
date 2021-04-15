Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.57])
 by mx.groups.io with SMTP id smtpd.web12.4524.1618478417745946252
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FCwnyQNa;
 spf=pass (domain: arm.com, ip: 40.107.15.57, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tryLBe86d3qxW96bK/uYi/airFx2AyJGmtTgJmylXc=;
 b=FCwnyQNaSBIzR/4tR8OQbken0Oo1sjKR3Ml9Zg/v0Z1X8z1rDuS9SegUjotcZJeBapIQ5wRA+E1fhaUvMgAgWzI0uazJ88Kr8WatUiGstxLNB8eHbwCqhxXes144f67POAAAMRbPmF1zdYexL/KODzBDizw1TBIgD9kWJg8D8+Y=
Received: from DB6P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::31) by
 PA4PR08MB6078.eurprd08.prod.outlook.com (2603:10a6:102:e0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 15 Apr 2021 09:20:11 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::4f) by DB6P193CA0021.outlook.office365.com
 (2603:10a6:6:29::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 09:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:20:11 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Thu, 15 Apr 2021 09:20:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 545a18c39ea38336
X-CR-MTA-TID: 64aa7808
Received: from 7ceeb65e52b3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 98997E6F-1CBB-4F23-B95F-ED263B01D936.1;
	Thu, 15 Apr 2021 09:20:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ceeb65e52b3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:20:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK/wbAVZ5VS4zVCpL42jfmkScuYIzwzpXF+uJrl2q5L15sUaX91vREf03gZyTRO0NqGoK84c21MUlMm1/RWwvfe9uGIcI2kHvDeKsMXfxgo5y4WejsmrWdzaFnv5FdZ6MIEHmS/PBt8gmuwn1vTggOm9LsrtIdkJH9K+nYi21cE49GAX5ZHcvnHOouJxCi+XexBEXuZAn2MTzUrQBDz9+Ofz/bDnnXid9wCtOM94lmHfdo1fVX53AESoIWvn/Hd8rZAUW5s8Ce0ASt0wYBtIpsB4cYH7/fbfMHe76AAxQNEaOehkFMyM3KZg8AMAmGLsH0xfCJ0qsZVG8fSSisS8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tryLBe86d3qxW96bK/uYi/airFx2AyJGmtTgJmylXc=;
 b=AW2MXCrzdI+6jYHkRfbc70jQVfFfsdVvdQc5XuBgtMnA6wIe62QvDxal0XtGLvu1udoTIBIbJjh1hXO1kNoAsy5vCwhL3bki/gfOhZBuhLQDc1FB7GaLho/YLWa3H9Sc5lWeh/rbiotth3LwnkUCJTIn/W5bhTB3Jjaoa8KHG5j1f40swXn+8vO15D6WJZ4YZN54eFQ3fKNdimAMayWT7eVJgZsljxDq6PKZvCQ5OjFDWUc7yN+0tN87VBXlLCp12zi7aMoYwLt1NnFWYRNpKMfG1DaAzKONDva3heHpXu6JpCF0uGWsvQQZxqksBEN/iwz+iRX3vfLkFtSsfhom8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tryLBe86d3qxW96bK/uYi/airFx2AyJGmtTgJmylXc=;
 b=FCwnyQNaSBIzR/4tR8OQbken0Oo1sjKR3Ml9Zg/v0Z1X8z1rDuS9SegUjotcZJeBapIQ5wRA+E1fhaUvMgAgWzI0uazJ88Kr8WatUiGstxLNB8eHbwCqhxXes144f67POAAAMRbPmF1zdYexL/KODzBDizw1TBIgD9kWJg8D8+Y=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 09:20:00 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:20:00 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, Bruce Ashfield <bruce.ashfield@gmail.com>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 3/6] xen, xen-tools: uprev git recipes after 4.15 release
Thread-Topic: [meta-virtualization][PATCH v2 3/6] xen, xen-tools: uprev git
 recipes after 4.15 release
Thread-Index: AQHXMYeEao8fRj2UdkW5jrtPY/Qyeaq1TfSA
Date: Thu, 15 Apr 2021 09:20:00 +0000
Message-ID: <7A9EB71D-ECC8-481F-A43E-C64191BB993C@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-3-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-3-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9e7e88fd-0cfd-4904-3b6a-08d8ffefab69
x-ms-traffictypediagnostic: VI1PR0801MB1854:|PA4PR08MB6078:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB60789249DEDF71972A1C28F79D4D9@PA4PR08MB6078.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gncOpVLFoYxDdNxotn/bTcw5XKWXE7/Ag0d/uuDg8NtQUJesMLCSrzCU2XnxRUIpAqlzwwYtDqa68/ILJo5PJsFGV7mx1+8Z5+B91RR5U8tUZTHa/Gq4yhSpk3y/G7c0Qhz+YtZK6WtMWb7hoJjkvUABCPBQEibDolpv5jal863b8chGzAlbxxuNwrgxQwsBk3nadW0ToVu4XXj8fgBE4eVzIqXkoTDM8qA5hAAt+Zh1XpbrJ9nhTVag6OQlACzeGzOy+78scmMR+PW3M6r7zpbToX9rJ5RVibcHt4MMkBTO3jeDflpSc7MNTtk0tXHox8baTtMmcs4W7U2vMzzUqzuyTbeN8T4A6CA8CvKWleCJzz/3mi31ygAUfCnicsec6pezXudiK7dMR/zVdhbfjrie6eRhkfim0R0CHUKz+alFpfO90mpI2xU0dpGEzYxC1DDWLMRDAgXms/utdTDrRBb/5pop61PSaao99JdnQni1CaCCRe8w6DeUrU3lGQp+EyiyrpYHxyYMe6UTapmQM1DcZ4RRlW+0L7G5C6c9Sn/rFwbMOZ9aG6qDeonB+RJ5uIwouej9SlBlL1ENOCWmDt5VmUGjAyRXqWOFGSluB6X3cpZ5KKfgYUr+0hRkBWRkdesOyxAkdIOWUrMBtSBNw844opaizSVwc9asQ9SSWKH4wlGqkHfrJrMRBTMfcSUZrUkmjN8IWlBrqJEFI77OcgT42xGvgZR2Z/Izb+DZfaM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(66556008)(966005)(478600001)(6512007)(76116006)(2906002)(91956017)(53546011)(54906003)(66476007)(66446008)(4326008)(64756008)(66946007)(38100700002)(26005)(6486002)(186003)(71200400001)(33656002)(36756003)(6506007)(86362001)(8936002)(5660300002)(8676002)(2616005)(83380400001)(122000001)(6916009)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?W5DQwx2RzUblX9Ozul13nsKEvxsWnBcNkasx/+u/9gMN4wGvSpYBxkVMwmx+?=
 =?us-ascii?Q?O97KQjNWCuJSQ9dMDk5VdaHUryd7XqRTW22zLNVUxkksn0lls28r7LSj3BsP?=
 =?us-ascii?Q?ZldKHJfYdmHrOH03BJRUNZJmij0tdLZIM5uwb3lGSImb4RQW0xdf7lr5w6Ah?=
 =?us-ascii?Q?l7RO/Ng/f7XJsQRomyNy4F/6WkEVp6qdI4tKFj/u+9AaOmtNI1F8EmZRXU7S?=
 =?us-ascii?Q?M03J7d7kqO0ShZ7V0XilBarH2ovx3b9OFAsrFHUbrVDghm/k/3FOIkiQcJPt?=
 =?us-ascii?Q?hEOPtLlg01H3LxrJQSXSbATphWt0AijNQiLMr62bWibr0zpXFkmEp7i866eY?=
 =?us-ascii?Q?WCQ1p0BTr99V6hjyoEgJtmpkSmMFhCHP+0DjgzAyUcVhUfXLazctQrtOU8sX?=
 =?us-ascii?Q?hM9xVCXBVZQrr9wpHTzrV3Q0Q5F0pu6AXeoHOEdQ5BduIHxbXPyDbWY7KLOI?=
 =?us-ascii?Q?C/JRD8phMWZJIGrARZQ2nyaeYILgnebLRAV8J9mVmSqThDmbKbu4QK1U7GbP?=
 =?us-ascii?Q?DNtriwFa2m7thKWbKv6JTr/I/AaCJ6FrpL0wUGLK7km3iIJiX9sAJk8exIj6?=
 =?us-ascii?Q?2YZjHA4HkWTe42Ir7x2C6T3ZDQ8P5rFa8GfeWw2TR9OS0CEUF6M0QPRUd0rh?=
 =?us-ascii?Q?AtbGiJ9Rr7xgHymFYlpxhotU9WqFICC6W4GC7AZK6qh7rvtbCcacj2cWG4sZ?=
 =?us-ascii?Q?fUib6ByVcq/Rv1GMvcEFKR00Qn+YQ2Tl+vtyLjN9iBI/tDhGXhHfAjJJ51CP?=
 =?us-ascii?Q?t2kTQGDjFGWXTDN7gw6r9xeSAQxVsxnfjB+W/pzXc78iEJmyCU5LuvZnIlTq?=
 =?us-ascii?Q?0dvewrQ+JCm+cvTRY8cJ7qq617icXJWJS2uCKH0OQuQvKBZnnRWYQtR7TPdj?=
 =?us-ascii?Q?j8K392DYLuUXRH/3LHp5QMcKVjxo2yQBKtZtxhTIc/Uogk/HPk27OPmQQDTk?=
 =?us-ascii?Q?hPknVgcMD+0kf8yKLxG9mh4L0KoWV/zMAIi6POet1Qr2Bez71vAZTAx/idIo?=
 =?us-ascii?Q?9TCNzzv+PLfOkVFd4oPetSg+ZoxPtHqxfHyllmMty/1MEyW5Z1DFCaWEUDHn?=
 =?us-ascii?Q?dCS3afj7/X9S3mgIXb3JqU1/NbZ0SKeQ/6DKkVLzYxDeDJ5Dgymd4s7Xumk4?=
 =?us-ascii?Q?M34JOxS52/pDLYEpEWGf5MVydrVwM0kP0kf2HB5xwwi3ta7Sqg0G8AC+lTcz?=
 =?us-ascii?Q?crDqUEsvjWYsJWzgpasGch4JWJ5Oi52aKtRaGeuIIKNASChv/MvDZzpEU2vo?=
 =?us-ascii?Q?0ZCG47SbNiPdBD0b9GtxJkUIGQ5Hyb3JDTzTyY/uKSSWN4fbi9fIbVj9VEMP?=
 =?us-ascii?Q?TbuRN4sGVcV4oAbVNOLjUexU5fO/pAckRicLb9OReso5AQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9832ee54-b0df-4e62-89f3-08d8ffefa4f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ufv8aKWyI1lEzB+L413Q/+mstdO3cTSAhChHrR341IfgkKJ7FneGzhrWJgdXwkcxF1hIPqrXo7AD5wmp5Zj4vYpYMKS8qj/zYX5ykV02RFXBz777m/eCJh7R6r6lpiUR4me49twzP6s9+3RxnbXFXqRJbo9yVYwCQ2aaG71Ss4SmXqfldaqrY21Ik6TUmNw1R4b1tegEQ5l9ajrFbtiQvJjMggRBQ0LKvSJcbNEGd62RZLbdoPyg2RgJyGtrLTcRJwD/16Y/Ab+63iWVxOsTJqiwR93ZYZfm2siLGQ4UW5/x4yyX1sRc4aLMcMhxLA6gssVjAs1bdHkDC92V2AK3GupgWKE97BH1kvsnbfnqdKWEAMByjvdxo5MPyLYGsWs7qMZHsZvVtdD3uCtjVudGSMC67ZVqXS0rVERvJm49A021vJO2N5ehgKn/cVjTAyvUtEUvg+CPNzFfUYr/NSBUZyKIeTUUn4Ale63R07Zit7GPompbW0DtR1q8sPlxtCQbStVXnZ2hFxNRRwWHxU8iNLZHo3t/ymej4WnYVP+TXbJfZIvYBUwmanleV8U/a0raBE8P7ynpxmimQ31s4cga5nVfAFyO4qO1sUJ9hHurku0HvhcnomxmHwBmLeOS2yoXfSyHq2fBLhDS9i44osRFH6J2IUgq5gQKhVaYqeHfCQk265JtnC0Q+EisBQjcYSwGrVzFMTBMiJFEAzqLeYpGtBGl0YrwVyCgC/mfqVs47pk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(36840700001)(46966006)(2616005)(316002)(54906003)(81166007)(82310400003)(5660300002)(70206006)(26005)(6506007)(6512007)(36756003)(47076005)(70586007)(966005)(2906002)(33656002)(478600001)(6486002)(36860700001)(186003)(336012)(8676002)(356005)(6862004)(83380400001)(86362001)(4326008)(8936002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:20:11.0922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7e88fd-0cfd-4904-3b6a-08d8ffefab69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6078
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D2A2D1D3EA1DA41A237B634609B9C5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Updated to the branch point for 4.16 development.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-tools_git.bb | 4 ++--
> recipes-extended/xen/xen_git.bb       | 4 ++--
> 2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xe=
n/xen-tools_git.bb
> index 71850ee..0188bdd 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>=20
> -XEN_REL ?=3D "4.15"
> +XEN_REL ?=3D "4.16"
> XEN_BRANCH ?=3D "master"
>=20
> SRC_URI =3D " \
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_=
git.bb
> index 2b62c5c..eaf3956 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>=20
> -XEN_REL ?=3D "4.15"
> +XEN_REL ?=3D "4.16"
> XEN_BRANCH ?=3D "master"
>=20
> SRC_URI =3D " \
> --=20
> 2.25.1
>=20
>=20
>=20
>=20

