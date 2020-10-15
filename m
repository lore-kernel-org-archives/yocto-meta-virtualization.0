Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.86])
 by mx.groups.io with SMTP id smtpd.web11.8347.1602754123603427105
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 02:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bFzvAptW;
 spf=pass (domain: arm.com, ip: 40.107.6.86, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnaJnuWUR6U4Gp1gS3GGL44W+96MZvI3NLKng/ezlXw=;
 b=bFzvAptWwBeuVq2pimgkdElyx2fErX19gcjBZDJu8C5WWa+YBvR0LziqyENnvIHIASLVBUYfB829mn4+ZTef25akSZLy6/mPZpZWooJ61RTwxZqQKKB39fv7qmgQYBHd/O5H3Tl+H+e2TxY48w1FIrzWCzBkGbBbjbYp5NKNpmY=
Received: from DB6PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::32)
 by VE1PR08MB5613.eurprd08.prod.outlook.com (2603:10a6:800:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 09:28:41 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::ee) by DB6PR1001CA0022.outlook.office365.com
 (2603:10a6:4:b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Thu, 15 Oct 2020 09:28:40 +0000
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
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 09:28:40 +0000
Received: ("Tessian outbound c189680f801b:v64"); Thu, 15 Oct 2020 09:28:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 427649828ef27e26
X-CR-MTA-TID: 64aa7808
Received: from a48679e0e4e9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 164514CF-18A8-4CD1-820C-04BAEE498781.1;
	Thu, 15 Oct 2020 09:28:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a48679e0e4e9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Oct 2020 09:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZJOPN8K1jqilEWy4HxrXpwdYUtf98h2bzxuxrC6zef7hY7Hy8sobwZLgvXWMVPZE2fnakN62NEBrwbMCDjAsvTJiBuHmNW3sr6R7qNFNYfZQeiGgsyXqcvTC8q2IOBUzh/2YYRJRpOyxaJhTZLyIZa/PC4WWu0unrz+GyHwLjq3KGbwLgs/pr5JTH2WwZRrkFGdRRr/VtSOT8SpXGXOOm54WfF3JlelzWqC3Yn1rT7CkwOea99PtIt51vIASgWHEwKNSmRoKKB6q7CLIjtbQfcc5CMVaJtURqNJ1cH9rEV2o2rua5hTmZ5mlbS9E36NflV84SMY1vNfBXUpxxNuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnaJnuWUR6U4Gp1gS3GGL44W+96MZvI3NLKng/ezlXw=;
 b=mQc8BTNWtha1aDnAUZsn1dv3AfXestHfDh4ZOkXKeVqRzH4mproO86/4umVyqIiX+ggiTey1Q4mAw/QE3yFT799RZGrth5uK24gcAv+Gy43w2YwM+XgBljvELyNK6PuK9RNKkrmDjQaXtRiQK4pz//yI50MCQScfrcUZ183VYrxYyjV/7Vcs7i37x/jzhDePeBB3wym7E6lzLSHrMGMK4Rp+/9EoucWrYusnqEQMaQzko/XaIIMlrsAqHgTKI0l5lqgrYkpnjGJEMzAhChQkbMIhqTGauBuuoycoah/yvweYsUVJdYjVF46DheML0VuQ0MejjY3ekSfzOOGYdP4lZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnaJnuWUR6U4Gp1gS3GGL44W+96MZvI3NLKng/ezlXw=;
 b=bFzvAptWwBeuVq2pimgkdElyx2fErX19gcjBZDJu8C5WWa+YBvR0LziqyENnvIHIASLVBUYfB829mn4+ZTef25akSZLy6/mPZpZWooJ61RTwxZqQKKB39fv7qmgQYBHd/O5H3Tl+H+e2TxY48w1FIrzWCzBkGbBbjbYp5NKNpmY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 15 Oct
 2020 09:28:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 09:28:01 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud
	<persaur@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools installation
Thread-Topic: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools
 installation
Thread-Index: AQHWnjg9vGO4XNyZOEGHjXUBS3Z55amYboIA
Date: Thu, 15 Oct 2020 09:28:01 +0000
Message-ID: <F3AE8A23-E5CE-4C57-8F4B-0E64B78F5CDE@arm.com>
References: 
 <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
 <163C52E32AF7858D.12576@lists.yoctoproject.org>
In-Reply-To: <163C52E32AF7858D.12576@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2959f6e-b626-4848-3407-08d870ecb3f6
x-ms-traffictypediagnostic: DBBPR08MB4776:|VE1PR08MB5613:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5613A21C8DAC2336386E9C7C9D020@VE1PR08MB5613.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:419;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hTVADt/z4DuKd/xdNZHe5P8ordyxAJAhb87Fhxi1WSk8mZZ2txMFiLIOeJLI8L7ZRm8DuMPLOApECJug4UiZahuv0YLX7Z/Tmp9E9W5RG6bnhJ9sdT3lg96LbcK/TDzJzyr+Nj7sjFvsgjv3EFGaVeuibIycRsXdTDGuGigGJg4ZM4WC54XzuQjQo4PVHXnZWEgCwQZ8bXn1U4oi05EjM9z1sQidjyF00DzlybNYmg5gQpza5Xc34dKARDOOvlTe+9Kdo5x4PAr/h6VdsJ+xvbL5LHZEbZ5ZbxasJgBvSJYMPnRd2E4CHbVcKhcyqzRy0GqIFKbB64iH3IVTF1zZ3V2j613Bh9ogf6xh6qDu+ZcpqCkcAVrlis9bLbWscHjN0bnXm1jAVe8CqTHbigU/wQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(4326008)(54906003)(316002)(26005)(33656002)(6486002)(186003)(5660300002)(966005)(83080400001)(6506007)(6512007)(64756008)(66556008)(6916009)(66446008)(2616005)(53546011)(478600001)(91956017)(83380400001)(36756003)(76116006)(2906002)(66946007)(86362001)(71200400001)(8676002)(66476007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 BBfUEArBTH4fJP51KEqHgtxV6NBw31i+vwoArEWp5HGHTyqm7aNZbyNAZzzX3USlLVq8GCxOzSzUff9aq9ZzN5W7BLQZq85k8/LMdXfO3MEi1Lf4eerIK393dNL9IEeMXIfKHgwjzwQQF7SgRSvHzBuCO1izmxYw4v/XHXxNKJUy8HQLZAD1gNGFxsbqdWg+8JPxz0s/T8PiGdSW3gJ03HoFF8ET7TOaqyamiih5WJakzoc/TlyAnhFapNtcBFQ2l7XTA1EicaWPrfJorC9QIl473cNVHUf26rrVcKl/NYXZDE65wo/jjHl3YU5SW7T6lj0y9qWxB9RMBkKF1alwayAEPaBV69VmBHY+gevLfWyA8eZRROOErVZjRcvmN2Mc4x+U8fftwAo5LpvvcYzArKajPrEzGf2ZRc6w/twCEvhyWW2R0R7Y0mk4rNHPR/NHeYDKjPlJtYFcqEoeFsNtNvUH0PPGp1qtMEt4u+XJMbXxcNqu4XRPk8H+J9dwmdbQvQA8N70uXY+kgZVCQuh/kP3g6FfEhBu8A7tkaXvuIVtp7kMsWh4h430iZJ607TKCOCpG5+CAKtq43XtGE/p6hLaMb/EzuSF0CkrEo33RR74b0q/N2As6h4V7uzD/lJw6z3C2iV1ktUAsHwp2NZ4K7w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	891c03d1-5900-40e5-6eca-08d870ec9c9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HOQNcQ6+56ZnWgLbGjKu2IY69D/8EsBMIXWzsYL3C1z5ljniQinUdsiWmZLdMXIuitbOMD3hC2pT3BYCkRNc3Wd60PdXqt9sU+JaJZYF2TGzWnhNQq6Fk0exBTxSXpcDR8ZhA2ynlzA8MVg2o+VEoya95opMr/M+NVsXWrqhwEXC4w2T3soLei5Y27FphdiGRmMCzuzOPDsWU76UyxspDvEBg9KSVolDsjZHXgbA0BfoL7illwFfmGm47deZZdXxlKMfz4FVJhqoY/Ay/BNCCWzaTfcoFTg2XS1pas3PvD1lZKYhqxuxXHaWKVk22DSSseGTbL45hQm+2QBef47JGTnMjErTOJKkqbCxnihluekplFHGqzC2J9mreP11EIrP73bkHM+jDIj5R+ARIU9bJS8agJrGvWcHn29Ug7Vd5naZif4Kpee5ND5bwb/gPNvXttHBbmLAyzHu0gvwQqYVS8DI4yvaFHbbnaZzk1ig1eY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(33656002)(478600001)(5660300002)(54906003)(2616005)(186003)(6486002)(316002)(82310400003)(6916009)(6506007)(336012)(53546011)(86362001)(26005)(83080400001)(8936002)(47076004)(8676002)(966005)(4326008)(356005)(36756003)(2906002)(70206006)(83380400001)(81166007)(6512007)(82740400003)(107886003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 09:28:40.6709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2959f6e-b626-4848-3407-08d870ecb3f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5613
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <111C5D784D83824593790BA9A422DF91@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping :-)

Cheers
Bertrand

> On 9 Oct 2020, at 13:31, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>
> Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> recipes-extended/xen/xen-tools.inc | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/x=
en-tools.inc
> index ace1a01..736a766 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored =3D "virtual/xenstored"
>
> FILES_${PN}-dbg +=3D "\
>     ${libdir}/xen/bin/.debug \
> -    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
> -    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
> +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
>     ${libdir}/fs/xfs/.debug \
>     ${libdir}/fs/ufs/.debug \
>     ${libdir}/fs/ext2fs-lib/.debug \
> @@ -261,8 +261,8 @@ FILES_${PN}-dbg +=3D "\
>     ${libdir}exec/.debug \
>     ${libdir}/xen/libexec/.debug \
>     ${bindir}/.debug \
> -    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
> -    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
> +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \
> +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
>     "
>
> FILES_${PN}-dev =3D "\
> @@ -497,7 +497,7 @@ FILES_${PN}-pygrub =3D "\
>     "
>
> FILES_${PN}-python =3D "\
> -    ${libdir}/${PYTHON_DIR} \
> +    ${nonarch_libdir}/${PYTHON_DIR} \
>     "
>
> FILES_${PN}-remus =3D "\
> --
> 2.17.1
>
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
