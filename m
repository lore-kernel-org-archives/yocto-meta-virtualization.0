Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.63])
 by mx.groups.io with SMTP id smtpd.web11.5880.1603875103917844991
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 01:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aAgy+q8/;
 spf=pass (domain: arm.com, ip: 40.107.0.63, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbEbJYhAnQpGFX4ZK1KJl0cm1ehfdjJhXM3TeNdAC+k=;
 b=aAgy+q8/w4C33oKsH8Echah4Td+ias56i8dxDNrTbz0mwkorUwRfofNH4bba8K2Yy83wyc0qbowJdRkSPr3r+wKJhBk0fdYF69qcQq3BwjUsxKwAUvdkW9fVV/kGHxstynooockQKu242cV8FIUokwjAEzKepzmNXRvF/dw/Td4=
Received: from AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17)
 by VI1PR08MB5311.eurprd08.prod.outlook.com (2603:10a6:803:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Wed, 28 Oct
 2020 08:51:41 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::18) by AM5PR04CA0004.outlook.office365.com
 (2603:10a6:206:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 08:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 08:51:40 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 28 Oct 2020 08:51:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6af76c391c213f38
X-CR-MTA-TID: 64aa7808
Received: from ebc29bead13d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 29A25665-4F92-46D2-9077-2C91B948AE4E.1;
	Wed, 28 Oct 2020 08:51:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebc29bead13d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 08:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lsyi2a6FY1HJ2rlAdzHkskAEf0D99WrfISzeKrz8+eXFHeq9lDlEtiISp2ZnYzG3bHgFft/tYShMCV6fPD9em6L51Wd5aW23Tym2PqmdE/ZCBy5ZkTxmXQS2IHh45koy5RLG6U60rw747mFGNySthlbj+Z7scpQ0O/qGsFtlkS6IUGrY0R/B7zBg5GTsGjhlpZ6vpCXMzUW2h0DcYk2gsUhEit3wk8sEA51rb0SLKfiajNnaWc/LBd+O8UUq0otl7F6szRSPgXJPeWwJYxCGqkg8OdA+z30wbEn7ucMnn/ksMK97dTDWLNlPle3UU24Ls3HHPe0CZAOgvG9DUjIZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbEbJYhAnQpGFX4ZK1KJl0cm1ehfdjJhXM3TeNdAC+k=;
 b=M+ipxt9NgOw47Qod8gZZpQBfxNOcDeiJuYq4FLqhAMIqMgaWn8vljPe37ZsD6aXqjELVj+VQUWB2jGPh3EBJcz1OxAnpGGs3cbj1A0FQ7EIeHOfeD19c8EKTju9wYGLWTsLJqllNsAJZXbf+Quvi6D1Y/E7v3qCmH1riehKkuCbr0N5FgBDe+OY9sfxdWeoxLVogTxFuVpDn71/7/bcIed553aIVY0lxMRJPlHSobtS+OB9f5rw0xtet28OrrqL7jpMtojYXDSuSFb9rAvOWS2CKcoZKhjhALbtVJn/5wWvJmkkbgglVT8kipp6DtDhhpTi/1ccCpWepxT2pfb9wKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbEbJYhAnQpGFX4ZK1KJl0cm1ehfdjJhXM3TeNdAC+k=;
 b=aAgy+q8/w4C33oKsH8Echah4Td+ias56i8dxDNrTbz0mwkorUwRfofNH4bba8K2Yy83wyc0qbowJdRkSPr3r+wKJhBk0fdYF69qcQq3BwjUsxKwAUvdkW9fVV/kGHxstynooockQKu242cV8FIUokwjAEzKepzmNXRvF/dw/Td4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6236.eurprd08.prod.outlook.com (2603:10a6:10:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 08:51:32 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 08:51:32 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: run do_deploy after do_compile and do_populate_sysroot
Thread-Topic: [meta-virtualization] [PATCH 1/2] xen: run do_deploy after
 do_compile and do_populate_sysroot
Thread-Index: AQHWrHnVHet+MS8D4US238lCXp2Wvqmsth0A
Date: Wed, 28 Oct 2020 08:51:32 +0000
Message-ID: <36EAA7F4-1823-4119-8982-AC32E9C6BCD2@arm.com>
References: <20201027155536.12513-1-diego.sueiro@arm.com>
In-Reply-To: <20201027155536.12513-1-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 122dbea2-312d-4a6f-2999-08d87b1eafc7
x-ms-traffictypediagnostic: DBBPR08MB6236:|VI1PR08MB5311:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB53110FAD24F6BE477E067B109D170@VI1PR08MB5311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0NYeamy4vgiCjJo7SaH8gX10LyscaHdcKt1Tx4PM1MsBDjqXDo094ErG48sENFI8vOmwkYwDlZpmvouqTjrSyNs53yJC8brTywrxutcTSq/g10MiOlp/vvGpZdjP041thTqMXJudAMLNpMIcbBW4VCdrnrl1ZHafevKBAas9Uz2IuxMy3YJ/BSV85femqxX9+i1XiwSyKy/CcP1aurP+rsMGXcq6XYnZHWN81Srvh3smvovrqJB7BYwf8r3vqeIbA41YfocJG1BusNnh9YPsI4Y5HVWj0VXMbIT8Lk/CLfboJhB3v9L01ZGAeliRA3Z2pGFiv7aXN0zq68P0rk1xElENYN7/pEyyIdeI3/Xq6TZXRZVyfKusrs00Dmu+yb0/0+rbmu32TOUdbvCiCQphpg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(5660300002)(6862004)(71200400001)(33656002)(8676002)(37006003)(53546011)(6636002)(966005)(4326008)(8936002)(64756008)(86362001)(6486002)(66446008)(54906003)(6512007)(66476007)(76116006)(316002)(66556008)(91956017)(83380400001)(66946007)(26005)(478600001)(6506007)(2616005)(36756003)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 PUHOOXZJrHcS/n1hUT51LPYt7TepQk9o447/Mn3PwqRml824G1F5nKY3ou4xXc90/tcM+EjVqm/aKkJsjaTaZXRzeiRE98fyyR3qDCEk7dLYkQ6L+aIdZxRcs+a1Uu9zewaKA+SUuMjOTL6tjDRXgM9tQsS/au8HAOsGjyIvYQWNdVFodt+fAW8FqI9QqqJggXlRtHyY495z2n27QTNVtWevtBP9a7D430G8IRFkX9BNpFpzlNA9SFVuX5+Igo5ZPIiRrPUiooUl2Upo5n+zTSOZob/jxLfDATiiBmGXRg9O+1rtZQ3biJ1nXRB/xCEVTXlOXKyXbspfIC/1IvHZrOjMyEnT59pL3rl/Tr9m3FXmXyEr3dWP+IsWFgI3hQkm9XLtsLtEQF77IHzSFfkDi5w3yAuf0HhOOODgUmLgUT4L4nYU9QrXIcUFT7aRp6yS6Ocg5LQ2oYYGUIbThtbohoy24MPMddb4J4jRaRne+chhyMILwyFP0rCeC8NHntNV3P+eZ9/w6P7Wtet256QV15gqog1v27pRoINFrM9raYKI8Mr3gwDajJp/TQaZvJ2FOFHRxaidbctYLTqd1KAOCmB9YO5cMK40Wa3k+iV+OEqD8+XoiiO8DY/35Aj6uZJUkOVenCouNmVkut30WisJpw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6236
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7f1c0d8-b9ae-4e45-0fba-08d87b1eab59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6FZpUVd7RhBdf5kHPYqQ/NQACdjYdmqAutkl28DvZRhWmeiqLx4E2Wy8D8mMUJVT75HF7a+92n/A6erTIGilQNvm0x3b140YUqbStXnFBbhJMbFt5i90+ezOvRY5ne66WT+Fut1wNGJuaDfgt0JyWfdprswiX+Znl3IQx+V2TLy9O1RU7mZQSenOewggIGEIfGANMvbJr/R7eSh6KjQbob52D/MYT+j6IAdt7b68VUz4WUZEgYrZftMUlJxjVvKAbznCiLG/C+rteM19cmvMPns3o+hzBrwfBiQsv3p0Sag+WmRwe1BimCQ4bHtqG+cj5Urb9cnDHmJt1WZc7u7ZE/drucdFtgLfFUB/BUACst+h7jS5cDOxOnjXRSK8PXygEEwdJ04/aX1Z0arbhJx7W8P8JHK75EQgYxG06UwZpzSvzPKu9DImtBp1R0hDrer0TOeRgxCWUEIaptWbDGfIyPJT1w8Btmm6Vqu3bfJ9Bok=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(82740400003)(186003)(8676002)(26005)(86362001)(8936002)(6512007)(37006003)(81166007)(54906003)(356005)(47076004)(33656002)(83380400001)(70206006)(36756003)(316002)(5660300002)(6486002)(70586007)(82310400003)(2616005)(6636002)(6862004)(36906005)(6506007)(107886003)(966005)(53546011)(4326008)(478600001)(2906002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 08:51:40.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122dbea2-312d-4a6f-2999-08d87b1eafc7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5311
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA47B28F2799F341AD3917756DD9A057@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 27 Oct 2020, at 15:55, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> When having rm_work and bitbake needs to re-run do_deploy, we need to en=
sure
> that the ${B} is re-generated, otherwise the deploy-xen will be empty.

I can confirm this was encountered by me to and this is solving it.

>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-hypervisor.inc | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/=
xen/xen-hypervisor.inc
> index 3bfee8e..6a75d16 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -76,11 +76,13 @@ do_deploy() {
> #   at least run afer that task has completed
> # - the hypervisor binaries may be included in the image filesystem, so =
we
> #   must ensure that the binaries deployed match what is staged in the s=
ysroot:
> -#   so do deploy must run after do_populate_sysroot -- which is always =
after
> -#   do_compile, so that handles 'after do_compile' too
> +#   so do_deploy must run after do_populate_sysroot and after do_compil=
e is
> +#   also needed for when having rm_work and bitbake needs to re-run do_=
deploy,
> +#   we ensure that the ${B} is re-generated, otherwise the deploy-xen w=
ill be
> +#   empty
> # - add the task before do_build to ensure that deployment has completed=
 when
> #   the recipe build done stamp is written
> -addtask deploy after do_populate_sysroot before do_build
> +addtask deploy after do_compile do_populate_sysroot before do_build
> # To ensure that a deployed hypervisor has matching tools, add a depende=
ncy to
> # make sure that the tools have built and been staged:
> do_deploy[depends] +=3D "xen-tools:do_populate_sysroot"
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

