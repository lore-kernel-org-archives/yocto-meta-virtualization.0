Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web12.4781.1618480508399329505
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c+5YSb+U;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJCuPa3+Ns0ImqzwfctjCdMu8oXGDy8RUkrC65gva4U=;
 b=c+5YSb+UBA1V9jDffT6W1mMG+peyD7qXdzjZsDQ98vDTYXDWjXaAhQeV4NpYtFpIVd6houEdyTdZhaC+uohU3+wAN7Tcdk6DA314fl0vcZgjTLZDOND9h8Dr/OjQwIafBdKT5LlDXtggqkh313CyD4LnNlSRoryOatIlNtnFDZA=
Received: from AM5PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:203:51::18) by AM9PR08MB6740.eurprd08.prod.outlook.com
 (2603:10a6:20b:305::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 09:55:05 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::ea) by AM5PR0701CA0008.outlook.office365.com
 (2603:10a6:203:51::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend
 Transport; Thu, 15 Apr 2021 09:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:55:05 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Thu, 15 Apr 2021 09:55:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd0a35c5f384f654
X-CR-MTA-TID: 64aa7808
Received: from ae05f0a65915.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CDCE72D0-16E2-4C78-B207-D4CD3A8D258F.1;
	Thu, 15 Apr 2021 09:54:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae05f0a65915.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asRb28bNYqDv/tG0IsA7/ijssilMlycgCapW0deIxJaSY4i5+c5brK3kUgc8go2ZI+BeK3qBWmdOQClAvVy70W7LDoYbzuqJkoco66GLIhZjLVP44Dc502FgGeIrSKMTcUf9ETVEYS480uHhOqPobxf8dGkFzOLK0SsQnuATErfUVQVOhvRf+t/w1KLX4+U3eQoYUh3dSM20T3K5iK5F3F6UP/SrG2mCa3NiypD5n+LAUmmMxh56oGYHOECQCwdIHdNqHil8WOjU6PJxrJRKejlr8sR3EKo0ROtV4tYwL3QW7Re3VsExflXoWA4vXrpolGxTJAXc9Bouf/Ivr0TYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJCuPa3+Ns0ImqzwfctjCdMu8oXGDy8RUkrC65gva4U=;
 b=ZA01gjpZF7ZyELIjlgofHYgdnBUCeBCgurZ9I7fxHRDNlZXKVB8WZokFZYalFrJqB3qZpKbId0jXkqFSyE/QLVwt5PDuN4Excavq0yHBVCg7pNVmmK84hpcNahJSlDgD0jDwcSqcryZn+wK1W6+8wpP5mkTuLMw7PKFMXWecylNTEjk720vTc4qApheQBi52hMGPtQrp+jU5YDpxcTfQq3mTLy4YpnWDJWAt2LRous6qq7I9Ol36AnG6uHlHEqo8IfVKGMrKVK7ZY7gOpkJJ8PgkKr/nMaKY7ajbMf6KE3+JtJ1LU1M+U993mTTQk71cd6tK+2U6GSrlVO6xPkS+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJCuPa3+Ns0ImqzwfctjCdMu8oXGDy8RUkrC65gva4U=;
 b=c+5YSb+UBA1V9jDffT6W1mMG+peyD7qXdzjZsDQ98vDTYXDWjXaAhQeV4NpYtFpIVd6houEdyTdZhaC+uohU3+wAN7Tcdk6DA314fl0vcZgjTLZDOND9h8Dr/OjQwIafBdKT5LlDXtggqkh313CyD4LnNlSRoryOatIlNtnFDZA=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5710.eurprd08.prod.outlook.com (2603:10a6:800:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 09:54:56 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:54:56 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, Bruce Ashfield <bruce.ashfield@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 6/6] xtf-image: add a new image for the Xen Test Framework
Thread-Topic: [meta-virtualization][PATCH v2 6/6] xtf-image: add a new image
 for the Xen Test Framework
Thread-Index: AQHXMYeKIf/IGpwmt0Gl9si4VeDDeKq1V7eA
Date: Thu, 15 Apr 2021 09:54:56 +0000
Message-ID: <8EF0C966-A03E-46DE-AEA1-728BEB471646@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-6-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-6-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e3403db1-18ce-4e8b-cbf9-08d8fff48b94
x-ms-traffictypediagnostic: VE1PR08MB5710:|AM9PR08MB6740:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6740E9388F98E263172AD8199D4D9@AM9PR08MB6740.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Zmnjnjn3c23/UaG70rAO60SKz2NEtwoD4eXxDwPpe7TTrCzayqCZNtlgSSIjuoN5W3hNkt2kW4R/J5+xJF8xWW/pE9xjdWqiBArXINKsnfFSFyFvcIZ2TEmhJIU9gzlJXZODBJntGPrE1NJIgA4q8WcepeWQnv+ooBX9dG2MmaOuT3K8a5ncvVR6FqFyZ5BX8wtvMXJ6+m95pg1+aCfQhVSoLUCF8BU0crRT8HV0yMxlYakAAK6VPcViCIviok/WK/6ebFxhxF3UuSa/gwmDo+Lqa+AhIM7YMjAFaD8e/ePtUC1LF+msAcDute1bf2pC7+3drxAcG2wriDl+Ablf3Hx+3YdgIYhtwmTMHF2WrbQyLYs/EmvAFKSJRXTK93Sc4Wc0RGrsT15GoE99hfJLudEtuz7LU/AJjLzFlw9J3yRnAPcqwl/4hz6RUTzYAKkukCjAfK7mzEwH2j1bcON+uRiBemCgBNW1UMBkw45t+JJq1G63mDigptSEr5Ft+b1F0p3a+cXBQSXNQQECus8tLOzoDBAjmT00iSWcQTdOjPLBjNtTrZG1CX/GlLBv32fAyErylQuIc2NDR+cJ/8S0qX7tvR0hnUH6CRhnNTF/MlWRzUtzxdtouWjoIfY3172JoHuQIAIOSFcwgB+roqvkalmnWdBzzLyk/fpNzmgqjHk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(66946007)(316002)(83380400001)(8676002)(38100700002)(54906003)(6512007)(122000001)(66446008)(5660300002)(186003)(26005)(2906002)(71200400001)(6486002)(36756003)(66476007)(33656002)(478600001)(6506007)(2616005)(64756008)(91956017)(8936002)(86362001)(4326008)(76116006)(6916009)(66556008)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?JKEy3+6jrejMdkbuM0oisG3bQv+4c5/ncBox1MDNf7Jb+8lODEuAeBqsWDs6?=
 =?us-ascii?Q?YkkFa5s3bxnwvHoFiAn59h2xDdSm514xsErr+QeHeWGYaeVlHysSARa86xgC?=
 =?us-ascii?Q?9YxVSoCRkDwkvRPJVC4Nbp6H6QOR3nrJibRFsUpKdvqq296fioSh/tEuk46o?=
 =?us-ascii?Q?ZuyYMu8Fu//+QVmLZoizs6P1Mb7cfVohtXMIgYIhRJ1fGNjA6keHBv1PXLX8?=
 =?us-ascii?Q?Fq4S6A0QBl/QNLysV923cr5PDhEpa+xFoY7uNACh/1U2ugh4KPmC+CRXTdZk?=
 =?us-ascii?Q?IHQT3jYckeyk640MEwbLYlN+poQkHddEW2CKgP7LW4fW4mdBevYUiCrQn8zL?=
 =?us-ascii?Q?hHPTOYtqFZypoUbXAaVhl/40LR26nT7LRDKGJMxGzPjT05HM8FebHgk8TWfL?=
 =?us-ascii?Q?bDLhqpe7JaljFwfXGKm3oFXYZ3KB6DVarBv8xv7yLk8wIoZe1Zf6jCZaiGJZ?=
 =?us-ascii?Q?K8c4BgkNyz2N78FXtNK59rivJk+jx67PCc/RVFX3Uc7VSDkP7BpiX5LiV2M9?=
 =?us-ascii?Q?M+HjSpifCMpFlP0KIDx8IBYuitwLHqlQ6atTEx/sdfL2c8oOuCy7DjggTLFa?=
 =?us-ascii?Q?kGh3z5k6q1qhin5CgznusL/7NoQl7x643E35goYVQ/y9vMBRCoSBjwNQqzbL?=
 =?us-ascii?Q?XG9sPl+UMpV/KilmU2Bew9eXTapoe1Rq2X5NKIFy7rDVZ4UR63e8GOhH0B+u?=
 =?us-ascii?Q?SwZqHn6AGmNzzD366W6rgp1fjIF0iiyZuIwrTepXsyJyxyiObMMgy3NBQW+C?=
 =?us-ascii?Q?1Tvai7AvfHPLhyHVc9lcD2NGvXF846TJppfb0fEnCUnU03juhG5Jzpg3mRYF?=
 =?us-ascii?Q?moHX2rvNSN3pPZZy668Ii3RxXykHWTai8hcLU/FChQnNWQmC0g0NnTct/e95?=
 =?us-ascii?Q?JWwp1v80lBx9WftLcQosM7zMM+fruFPk2HW1Hy2Nu4bXd+j1xjFVEvB7V4fP?=
 =?us-ascii?Q?KadTKp3KACO1/MaBDx20EpUbrcI9leSqqhCljkWPxjsc4Nc6L38l5WBXSACz?=
 =?us-ascii?Q?G5d1rXnCai9aqSgTyOxk7hxY44JuYhkjMAPv/xXdCo8gSmHRx2wrhXfRxhHr?=
 =?us-ascii?Q?IPt45dXL1fsY/mjvPBIMJcmTOoFH1RNz45L1o/z9gl0/xxZ7AQKzUa1VApop?=
 =?us-ascii?Q?GKoyOW4+F1wsYiwA79UdovvEmE6bPtQyuGXIpvEcyMkeqd/SyNYNiVqolQ++?=
 =?us-ascii?Q?vyMmKJjiJcr2GmyQ4xNwGTyfqqm+dfj1knAMiIljOr/NlWX5syD+7cFQrw2u?=
 =?us-ascii?Q?On3aNcdKSVV4u7a66+m9fPHZcldPYoGKik8FcdfrgucZElrifEunsmrQ3Sbg?=
 =?us-ascii?Q?XIonMnv0VLbBNep59KIbm9qjIeGv/FqBCPe4aSTQowAE/w=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5710
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	27fc1549-37de-48c5-1aeb-08d8fff48642
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ep3R6wXEraLem1JonDG5h/w6hXi0B4+6v/1uj62OS2sKwcL7Cug+3TnQaJd67XzV243gXH6zs4nAHtm+AWfLmCINqa5Lr6rKLf5mNYhIelx1gyoPUXcfACnCscjmEF/FmY6C0hZrVvWmDthO2I4bsZfW5QlfzhXAl/ncPfn+uNBD+JMB5bPCISF44VYjCllwSzYEYuIizh0XyGCfw5Xda8NlQ20GE8/9YS0cfsXwpHD9BNK/fjYGpU/C3cihaes8a5a6wmSzciixz8ZCVBC+Yq1TEN1/NF48WTzXz4mhyrmV8t8EkPVwqUqoo1DeveJTjyltSbFvjuAKj26N6W5qY9i2gnjQbfrnWziquL5lcpnhbRiX0qmqYqbfkabK+JJK/r3CaqvUl/DvXTvVQU5uZNcU40rB4Yo6GusBKhOuf3NtzGuPwpNfkilwFwgm+18YiwbOQozNtM8cWFsmq1NmEL9r48HpmioQy+U5ZOGSp4lCzu/WNSwpPqztwvU7LZCVNW60CiQZuMbPcIabi+b3AfELaJsAYYC9ukqmNLV/VPSNm1GRn5o/apYrqU3qJL5mrlX1LgOCTLzl3HWvwI4xoY+CSS4P9CnavXt3gbvm17bm85CKopEu+ily/VwoSwN322Wh85Vc7mMJs5nyRW/UuvdgQWSa+WMv0R7eKe5ZSAE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(376002)(46966006)(36840700001)(54906003)(316002)(26005)(82740400003)(5660300002)(6512007)(6486002)(8676002)(8936002)(2616005)(2906002)(336012)(53546011)(186003)(6506007)(4326008)(356005)(70586007)(33656002)(47076005)(36756003)(36860700001)(86362001)(81166007)(83380400001)(70206006)(82310400003)(478600001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:55:05.1253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3403db1-18ce-4e8b-cbf9-08d8fff48b94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6740
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7207252F98A54744A6CA9D01794871E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 15 Apr 2021, at 00:39, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> Testing the Xen hypervisor, with the qemux86-64 MACHINE:
>    runqemu xtf-image nographic slirp
>        (login as root)
>        cd /usr/libexec/xtf
>        ./xtf-runner --list pv
>        # run an example test:
>        ./xtf-runner test-pv64-livepatch-priv-check
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

NIT: Maybe the image could also be filtered for x86.

Funnily i get an error when doing bitbake xtf-image on arm64 as xtf
is not compatible but when doing it for arm32 it is packing something
even though bitbake xtf is not working as expected.

Anyway not something blocking more a suggestion so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/images/xtf-image.bb | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
> create mode 100644 recipes-extended/images/xtf-image.bb
>=20
> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/imag=
es/xtf-image.bb
> new file mode 100644
> index 0000000..3f9af25
> --- /dev/null
> +++ b/recipes-extended/images/xtf-image.bb
> @@ -0,0 +1,24 @@
> +require recipes-extended/images/xen-image-minimal.bb
> +DESCRIPTION =3D "A minimal Xen Test Framework (XTF) image for testing th=
e Xen hypervisor"
> +
> +# To run XTF tests with an image built for the qemux86-64 MACHINE:
> +#
> +#   runqemu xtf-image nographic slirp
> +#       (login as root)
> +#       # xtf-runner expects to be run from the top of the tests directo=
ry:
> +#       cd /usr/libexec/xtf
> +#       # list the tests available for PV guest types:
> +#       ./xtf-runner --list pv
> +#       # run an example test:
> +#       ./xtf-runner test-pv64-livepatch-priv-check
> +
> +IMAGE_NAME=3D"xtf"
> +
> +IMAGE_INSTALL_append =3D " xtf"
> +
> +QB_DEFAULT_FSTYPE =3D "wic"
> +
> +# Set the dom0 memory level lower than that assigned to qemu so that Xen=
 has
> +# some available memory for allocating to the XTF microkernel guests to =
run:
> +QB_MEM =3D "-m 400"
> +SYSLINUX_XEN_ARGS_append =3D " dom0_mem=3D256M"
> --=20
> 2.25.1
>=20

