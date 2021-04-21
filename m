Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.59])
 by mx.groups.io with SMTP id smtpd.web10.9752.1618996953889797415
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 02:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PvzmaGHi;
 spf=pass (domain: arm.com, ip: 40.107.4.59, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TbKkSD1uex84D5uEcTFn7nn2f0EQJe1Wpz8NRxajag=;
 b=PvzmaGHiGV+Q69KB98YU8aY/NmKlurFgZlyobLPKcUcW1Ccf9vbHK9Jla4Chl7/L/AlEwkOMSfRpDAM+jUlPbmeZhqObuh0oREVakD1gptzuLA0YpscZoHaDA0zOci1uTNNRVU86k5yAVV1SVWKdH4moJZIEIfWyDOP5rmnQiGU=
Received: from DB7PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:10:36::16)
 by VI1PR0801MB1792.eurprd08.prod.outlook.com (2603:10a6:800:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 09:22:30 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::2b) by DB7PR05CA0003.outlook.office365.com
 (2603:10a6:10:36::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 09:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 09:22:30 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Wed, 21 Apr 2021 09:22:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74e4c105986e757c
X-CR-MTA-TID: 64aa7808
Received: from 715c15306c96.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7B2C4A6-4880-4D6C-9F31-6C130899477B.1;
	Wed, 21 Apr 2021 09:22:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 715c15306c96.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Apr 2021 09:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS6PvN7Ie8Avf2atloqJWWvTRTTtbt/V7h8tEl+6yV0zCuaLJwo9gC3IJBcjceHhJBlBjx/sK0PFpT3Y3YMDBaMY2rcK/RzXIHVxE3ngiy/qrlm7oFcMe5hSnIq/e2waWXKJViw4IrTacXM6y8/bGT1cmqdfzh0cZoTgdeAJr+QUCFY0/Cau6w6/jeqNMKSrKF8O5WgF9TYpMbS7ug4W6Lbds1a7LvTp9/kvmody831JPVHTit4UXCo5l+LH4ZgKEUJQ+gGIHbZN5D0RxEUbGCMBEMeXIlI6xqZ2fi6dMIt+OtP+FDFnyTB6CBD+CFWkvApjVtWUHqdqczYNGAXYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TbKkSD1uex84D5uEcTFn7nn2f0EQJe1Wpz8NRxajag=;
 b=A86Vqz5cnyxLltnhqtGhhyGo9ppDvEzEOcpudl48Pe0fUKa1R0oFrtrXMMKsNTfOXKtxPQgurghVi9DSaucnCRG6MVvt0FFIOQ37ojxUYb7N7nnFtDcEGq7DVUG98AqUJLdjlxc1fPt1yMFNOAb8b8fPcusDXd9qpyAqoh+F0bUnbxPwiBJ5X0hlTZ8WJpRBXu32uigClJC4Wc6yFp2b379GPDv3TfEQzhlkbtwDgT8L6lkqoE+hv6LiUo0+xy2y5tSOVEMmO8iX9hJ6xC38ZVDp6BTxoM0QFPMw12IWIh/4rrHEDEerkvwY0vml7qhiTDSDzR0XOkAV43+v/kBfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TbKkSD1uex84D5uEcTFn7nn2f0EQJe1Wpz8NRxajag=;
 b=PvzmaGHiGV+Q69KB98YU8aY/NmKlurFgZlyobLPKcUcW1Ccf9vbHK9Jla4Chl7/L/AlEwkOMSfRpDAM+jUlPbmeZhqObuh0oREVakD1gptzuLA0YpscZoHaDA0zOci1uTNNRVU86k5yAVV1SVWKdH4moJZIEIfWyDOP5rmnQiGU=
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PA4PR08MB5886.eurprd08.prod.outlook.com (2603:10a6:102:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 09:22:22 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::1181:7889:ac28:ef7f]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::1181:7889:ac28:ef7f%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 09:22:22 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, Bruce Ashfield <bruce.ashfield@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 3/3] xtf: update SRCREV and remove multilib dependency
Thread-Topic: [meta-virtualization][PATCH 3/3] xtf: update SRCREV and remove
 multilib dependency
Thread-Index: AQHXNXESeQT3CB30BE6AjysChL4Etqq+tMeA
Date: Wed, 21 Apr 2021 09:22:22 +0000
Message-ID: <B2C3A33B-67F6-4CCA-9D7C-ED3E7245328B@arm.com>
References: <20210419230854.121217-1-christopher.w.clark@gmail.com>
 <20210419230854.121217-3-christopher.w.clark@gmail.com>
In-Reply-To: <20210419230854.121217-3-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 95ba056a-784c-4b22-3880-08d904a6fd1d
x-ms-traffictypediagnostic: PA4PR08MB5886:|VI1PR0801MB1792:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1792EA0DC632221875D39BA79D479@VI1PR0801MB1792.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QcjPyZpZxnv2xISue4YxW4TwVcebsn5MLhRwdda2kD15ErToAPvLoj5SzdlS5k/3XVlznzhjlrIFzR7i628flzrwOiWZgBVCjIAP5ZS9aSzGxmzxJR/K7nb3+lUnTsC9eT+MVzcVqAGSIxj+7H62h6o8x3Kpm4n6cw/lm+q+UPkvl6BmkvXS3bxY2zeftU0QWo4q4K3bZisJmRfXZQF5g/OjswaxORmMUvuW3wN4u+uVNj3LxvOmC3JSuLjkHFLSaWkIRTARbsU67au2QwTu5LeNfr5Gx5y4xGv6MiCewrXF8ujk799p2Qcp2TXvMiHSw0oAR7CF4zYBuFM2+A1aVV4HevtmX8DlPhule6Xs2WmDLLlRBfd9TxdrSj1+omdZDXvkTPh7/2m6MkqYyV1Ze/UygSuoRgePJDItf0H6XXPA2z1H390S/SRQqfNbqY+4y8owgRa/BhHS4mBHfh6bd4qvh0aiOkr7DZzYLtOm1PwTFWZoFlhk8rVfWJqBkKH/IBLyG1UDUgDqZQ+IZtnvHhS82qNNtXrdjrMju5QRlAnjKVKHwBdFpynP48Qq1Cm46QciIDLOIRwe0H6BVdz5cR3Dsw1wFw/sI11rngUDLyRfMVImMDm1Z1Rzlks7FnAJbDQzF4QzswYO9VMx8gsyf2z3wIV69cuOjtltxv1LiFfDt6og5nnZAzj+shHk6cpSd+hH/IQzo+bCmTqEqXQdJWQxa8Msh+PPpyrFo2xMNVE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(66946007)(53546011)(91956017)(6506007)(4326008)(6916009)(478600001)(38100700002)(36756003)(6512007)(122000001)(6486002)(83380400001)(966005)(71200400001)(66476007)(316002)(26005)(5660300002)(8676002)(86362001)(15650500001)(8936002)(66556008)(186003)(66446008)(64756008)(2906002)(2616005)(76116006)(54906003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?xZie0khv+Wn02vfDKszD+WCmzU+FuhHQ1JVn9OJFXIczJMjguN7HbE6nRwBr?=
 =?us-ascii?Q?ujNcvP8UzWy4gwPWuRHpVW5PkQMt90Y4kfmnQLVB8W247FSEuHowgGwhh+K2?=
 =?us-ascii?Q?9PGYkpiwKxKnGmsqPrzjG1VutZKuYyTCK3HcaZTOufIJywke6DOBvA3c+r+X?=
 =?us-ascii?Q?+f0PqalmyNFgu/bK9Wk1bxwIJmlns+rgOpz/kNELxJu2ZGjgmS5tmWWZV8/j?=
 =?us-ascii?Q?Qv8wkCNDBnHSw3tzpD/C2HL38ZMxEG5Vyb+GI4FTIzgRhHwKOG77kxX+yk0Y?=
 =?us-ascii?Q?wHGZUuf7vc+SQqTgSCrfqIC/Oc71xG5ER8mwXdjpWDdUZrjbLyJq0fs++KvS?=
 =?us-ascii?Q?2aLFFVcMAox64pM3Ma4Cxe5m4Hwdg1IGjVTd88m/3yGNd+o01COA6ptVTTgq?=
 =?us-ascii?Q?WFJPO5crl5uTwWBHgZyHkvBueUnVq2MyUfLKrjr6FYMbmjoZ0fDeUcY8gCLR?=
 =?us-ascii?Q?HflZHOKzNjcY4tqYUyjKDyTbw6V8wtoy9o4H5W0zUEnHDKUT3Q52SqBxoN/B?=
 =?us-ascii?Q?6+ndu5AffI1VbrFfgF4SJOC1CXz9ZjlpgR3uMIQd7FqrQdkRkWaHTl229F92?=
 =?us-ascii?Q?/NPy9y0nhzKOvaDQw++aNPdTbkS23Ftvs5hIzRb72H0AMA2wMnbGvOx+GhhP?=
 =?us-ascii?Q?7DMauJb3zaX06ws0OA4tU9+yDYzRsSBwCTLwygWJT9ERlVMeSLhoVSZJgWzi?=
 =?us-ascii?Q?+kEuUvfvnP+3kzKbVnqdxzAmotPvuksXDqybpxc1YhRoqhxQpI1M122Ae0JS?=
 =?us-ascii?Q?BWnZVXZjCpxSE8XoidET4Zssskq9LfGiy+hAtPJivrFnDW8VF/QSEbJKkYQW?=
 =?us-ascii?Q?+OkraHWviRCy0MI0rDNj2dJaRX1VO7j50Y1XzSjBNcSKZ4Gh4PNErvsq1B8c?=
 =?us-ascii?Q?ySOuIwVJu0TNm+Ak2T8jQvfT6FdtxiUfnhpvC1ilo4he424HYOcDl2Dfps3M?=
 =?us-ascii?Q?yMfW64jzJ6o2hrnoBZdbxWD12VYnR4c3ymoPTpDzXYsIET3x90PFNeiUoX9Y?=
 =?us-ascii?Q?TWCQPQNkjwjpuXRqfa+DHngYgPzLlbsUU6K/vQ4lTPzKK5l/SbaIzU1ui6Hm?=
 =?us-ascii?Q?N/IrirVrbYeTyrAexB/XnVvxxfXu73sPy8BGPNe6l+TkClep2e+ao0Ef7yzb?=
 =?us-ascii?Q?jvLTlgSWZ+HNKOGZieHfDt20jfTOcfpM93r57ItjLbvk1smTmuvJOUwA3sUA?=
 =?us-ascii?Q?HhiFp8Cxvkabkek4FFUcT3rLi9zrhz1/Zxo8weaNQAsSXPr8l7SZftOhClWN?=
 =?us-ascii?Q?Cfq7szOioYwfgsUIHNHOXa7XMtUJMeju5H70Cpo0g5yxsMd4UnaEZkcL4WXs?=
 =?us-ascii?Q?xx7AVau5IY/yTg2/aLEC9/ptxZjqrrvKmz9mq/MKYxL3HQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5886
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91569b5a-c455-4136-c334-08d904a6f818
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1xVeuy1tm4scN3VIsF/9KbGlyfcmcfXvVBVLYkVuyReGubA3INpx7HBZ2KGc9JEitGwDvPcdEsjvfIQ9bA5MIEMoB8HuHF/5RNQ38aBiyIHZVEN5OlVO4i3M2LKumb8eoyJnolbnhgixbVgBeuwQg/6jhcGVZj2SV+X+u6DHgD5R449MSyxIoY3vcE2GthDp1qnfGKoXJ+NqbtmxmZRf7e+OjsBop6hHusljPgRP8zQBf4lm2Qlk+UJkXK17+zSyAdgS4lr1Ft7STzeuVKUUYduDH4HL3APeqGj1yQGMPD2jbUrskyek/zh0jk3NotoiobL0ZmthoY1XdZqM/kqyIUZPqp82v5rtJTJGPkVEFTNmRvv/lr7ztH4L636u30fCKgGUFCaJ5dvmSUjVGzgMyf09wJ+Arc+7D4MLBl/cd8H4Jl+NQMIM9eLMH6erX5Qjyz9FfyGNTf6kwdEiXttZJlfKU62XlIqHGRegvBcZ/vuPKAO1KOT2F1v10Gs5JUQeaO9vR9wnPsWl07RmXNf47SkHOyVsf1b/salwJjaXxDCU4syUAswmBU3Fe8OOicc+5semK2vwSMAlPZpjFae11KX4z5ODROyBJSW61M16SSrdaJD003K486Z0XUPHT8Ojh4DoI3FQxr3QSO5BmOHqzbE9PqkwNkxz4G4z97hWToH16783okBApHQV7SBTpdlcSzGVgUjYuUNfWTDl8U4SaOxR/s4jVR5pGZBT+8Vt3Ms=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(2616005)(15650500001)(8676002)(6486002)(81166007)(2906002)(5660300002)(186003)(86362001)(478600001)(26005)(54906003)(316002)(6862004)(36860700001)(336012)(6512007)(33656002)(36756003)(8936002)(47076005)(70586007)(966005)(4326008)(6506007)(83380400001)(82740400003)(356005)(82310400003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:22:30.7178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ba056a-784c-4b22-3880-08d904a6fd1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1792
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF677755A8B1054097F35F021A2F5996@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 20 Apr 2021, at 00:08, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> The latest Xen Test Framework has removed the gcc-multilib dependency.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

XTF is compiling properly in a project without multilib for x86_64.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xtf_git.bb | 21 ++-------------------
> 1 file changed, 2 insertions(+), 19 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_=
git.bb
> index db08643..3580324 100644
> --- a/recipes-extended/xen/xtf_git.bb
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "BSD-2-Clause"
> # https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/=
79/xtf.pdf
>=20
> SRC_URI =3D "git://xenbits.xen.org/xtf"
> -SRCREV =3D "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
> +SRCREV =3D "b0bc49846c154b79243f39d461a4515804bcaf53"
>=20
> COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
>=20
> @@ -18,23 +18,6 @@ S =3D "${WORKDIR}/git"
>=20
> inherit python3native
>=20
> -# To build 32-bit binaries some files from 32-bit glibc are needed.
> -# To enable multilib, please add the following to your local.conf -:
> -#
> -#    require conf/multilib.conf
> -#    MULTILIBS =3D "multilib:lib32"
> -#    DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> -
> -# Use this multilib prefix for x86 32-bit to match local.conf:
> -MLPREFIX32 =3D "lib32-"
> -# Add the multilib 32-bit glibc to DEPENDS only when necessary:
> -# The DEPENDS on a multilib 32-bit glibc is only added when target is x=
86-64
> -# This x86-64 override is never intended for native use, so clear that.
> -GLIBC32 =3D ""
> -GLIBC32_x86-64 =3D "${MLPREFIX32}glibc"
> -GLIBC32_class-native =3D ""
> -DEPENDS +=3D "${GLIBC32}"
> -
> PACKAGES =3D "${PN}"
>=20
> FILES_${PN} =3D " \
> @@ -47,7 +30,7 @@ RDEPENDS_${PN} =3D " \
>     "
>=20
> do_compile() {
> -    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIP=
E_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
> +    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" \
>                CPP=3D"${CPP}" \
>                OBJCOPY=3D"${OBJCOPY}" \
>                PYTHON=3D"${PYTHON}"
> --=20
> 2.25.1
>=20
>=20
>=20
>=20

