Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.49])
 by mx.groups.io with SMTP id smtpd.web12.12721.1602247338745915048
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 05:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4Z4YaRnW;
 spf=pass (domain: arm.com, ip: 40.107.14.49, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uISBN4zhgQRbfI7mOCPa3AKkLrAfcbvfTGYmiCP1Z2g=;
 b=4Z4YaRnWuzdkYRnaJJIHFb/s/P5ZmOBWbcQ+u223LCbyr8vwv0KUo+IgS6sBV7eOHRLSPmAzskiJ79P90NE2rluJJ5ArkoFkHDmpl/Iw91KmYf4WnsifoHWc7eKXhaEzP40cO/5SZj97pWXAJb333cMhubdDh2agLlO3i+rfLEA=
Received: from AM5PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:206:14::44) by AM8PR08MB5857.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 9 Oct
 2020 12:42:16 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::c1) by AM5PR0301CA0031.outlook.office365.com
 (2603:10a6:206:14::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Fri, 9 Oct 2020 12:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 12:42:15 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 09 Oct 2020 12:42:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39d1f6ec89759b51
X-CR-MTA-TID: 64aa7808
Received: from 6e61579ff175.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5E65125D-B5E2-42B8-8AAB-EEE2EC93507A.1;
	Fri, 09 Oct 2020 12:41:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6e61579ff175.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Oct 2020 12:41:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV9EzqzoIg6mDfy1KzR6YZGqsWT2rTnunCRwlCYRqt24lUugwybuJLwN2xM2y0VDHYuh7CAJf+ME5igekAQGu0o58xVqgdsd0WkHnAJu21XL1zV9lyQLS6jyqgNs4EYVDLS9uwls/qKnp2xcU6MyoKDQl8Oscl07DjtqKy/pfGeh83b/ekMAqXk/QuMo1VsLGrZNJyfKAEvUrA0XtmScHPCLys1ra0PiKbPWr8uenePaV/tTZmuYojfQRvcdaiMotlcrJtKPidJ7nHbIxExCPXb6ilL4v0dBRYV0xUzvj0OKKYuGQ/e2G6iUGsXDoyijiiLkt7ODKebxLvvCzUzk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uISBN4zhgQRbfI7mOCPa3AKkLrAfcbvfTGYmiCP1Z2g=;
 b=gZT7asvLotLUGMl7lkOeLpw85JST2cS8/j5KbhLTJU/DNG5346PbIcr7cVxRZ2QVc1c+qgHI44tuoFLcrdeypwABr3g7fQrUvXFdHDNOJjwklWbnjCE+Q+5AD2u4sBFxHHrrsVE5PQRMKMPAoVSd/VyGCvTos1xlCZF5p0g7u50ODUfk+hymLwVJE/GVGEr0ET3VbUJkJxaSAAW9m92PVcKFCCqDRqYJ+tuxx3Mi3AsLX37gUMx2wYgi239zB1kNik7J7YAI89rReeMqpk+rU6fK9i3pF0DeKFS+m6VABwKFKTTwAgZfytebxNI/xi9hdfcCMUAywC+Uct+gsW/X8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uISBN4zhgQRbfI7mOCPa3AKkLrAfcbvfTGYmiCP1Z2g=;
 b=4Z4YaRnWuzdkYRnaJJIHFb/s/P5ZmOBWbcQ+u223LCbyr8vwv0KUo+IgS6sBV7eOHRLSPmAzskiJ79P90NE2rluJJ5ArkoFkHDmpl/Iw91KmYf4WnsifoHWc7eKXhaEzP40cO/5SZj97pWXAJb333cMhubdDh2agLlO3i+rfLEA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4678.eurprd08.prod.outlook.com (2603:10a6:10:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 9 Oct
 2020 12:41:35 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 12:41:35 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] ipxe: Fix gcc10 compilation
Thread-Topic: [meta-virtualization] [PATCH v2] ipxe: Fix gcc10 compilation
Thread-Index: AQHWnjj8dPpgfXObaUmnKXpPMvMFKKmPNpmA
Date: Fri, 9 Oct 2020 12:41:35 +0000
Message-ID: <9A256608-2410-47FA-B224-FF6FAA87A11F@arm.com>
References: <163C53331F54B310.15658@lists.yoctoproject.org>
In-Reply-To: <163C53331F54B310.15658@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97035da5-9910-4db9-b75c-08d86c50c09c
x-ms-traffictypediagnostic: DBBPR08MB4678:|AM8PR08MB5857:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5857863B83FAFF27B4010B9D9D080@AM8PR08MB5857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1751;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 u9XxJB9rH8NB7hNIn0Qn6cjREK69pGsG/qF6Qm2WN6YSbFCa+SyiMV8zx4FhrsMAF5Lnwe1KGZX/GauXdo9a/YvrTYXfCHew2RNAVpLfbUjBMWYnwjvVeNfCmxlLHzbH2QvAHtuGKmdQA7VTLYlKZZlOOAvr0agVzprJ6EhokgxiDXvqw5xiC1zmwLF00ZpcqTEux7rgXJ2+wbJ5F90Ap0NAKqzlSSk8CSxTQ4D6vUOzLSH1bjPptG1TUDStGXRoa9jLDb4X4nq3bhL0PXEBNCFnR2YQNe91LQHdHOedGYRkv8FCuzoWMlzFkkfrLVetYdZhNbDcJc8D/s6OWKQBkQitqndUMgYvyEXazBmIWhF9baG9ie/PROjGewY8KfhQQdsvn9cs5CMvQW4mo0fSUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39850400004)(376002)(316002)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(5660300002)(66946007)(83080400001)(4326008)(83380400001)(26005)(33656002)(53546011)(6486002)(6506007)(478600001)(8676002)(2616005)(86362001)(186003)(6916009)(71200400001)(8936002)(6512007)(2906002)(966005)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 6h7JoO/gXoLMK4XW4F52RDZlx+8M+HJPcUVTRRFxgxBeXxmU2a6xICKSzTtIBli7hv3/hop/HpjW7kIz3Tg0wA9NQ5PSqUeJWwhtn0owhfxcCNS8FLolv/P5ABws1ThuSadEM3gOZEOk3UU8IlEOVVwsbyqgWWrCtnQXY55Kaf4My7IEo6MA9P0zLiLZzsgivHvIaBM9Yzn5KTn9z/JIu+VeCwz3uxRNOFfavJTOjWzFZt69wF4H/+ZzzqWEYbelINDR0L1wjEpfWXC7aEM2nEDZw90kdHhOfJtKvYqTxhUgKoMitPANGn2nAJu0xRg5MDfskOVZDYcD1ivmLknP+Pi+mhiswz1l0fXgFT2dMfcXmk2IUQ43nlMjCjy7GYzcpxaGW735M+9l1yHvjKhajtHLd9BYtjEhBz92iy6nwxqDHWEYt8KMjrlBaeX+/+0LgkYZuJd/piZoFsy93Qm1mBem+b6j/c2qcQNcc013+2VfbCepvktGoUPcols5BrvH3x+LxTtL8p2mkBXuMIyZl6EQyRqCmn19tsJAGsjIUzrqFIK7wz0TUCAfJWj6nns8B936QP6jrv4ApDZWwZ+CTCyiE3qL3Xzak6rZqjFTH+ld+Ud07ukrD4Zgbl7RznSNiUdJ0/JswbW2yak0rR28/A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4678
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	805a2bc0-382a-4a90-0897-08d86c50a8df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nh2hdgjEEHE/FqpGxz2zpmL9ypptJZ1h9TEjcgHwIr4Nwz4tUT/Jol+lAWdu4yuU8HxBVc0ZsZ8lTsljW+lUo9WzAF3DqzvQoOI46kT5VB74Ic3XZPe4UNhv+1htdYom1Nzx9zpj8r4f/g4bVFvfe06eTEvIE4X7tXYSIS3AneBl/l/s4V68tcVCCFCeOo532ItCUYvnDBZhMsfK794XoLioJKdL2DJpMrBA22Xdwu0r3xxk6i6iS1R9VGrhXiZ85RDbbCvLlh9AsQ0Vb3v+P8S3al4ugu1AdAlEbWYqNXjDumOcHN1M/Z5jekYPDjPNzAcAwDlpBVI+vOmNgbfd3mnmC6nNZj0+pKPkjI+r0yUnIYJGyu/OUYvX7idUw22TOsc1/od8R2nA3dpJndodO0cqn385YvfBzTd/j7QXitQDzuiNOl92qr+QtSZ6XyzCNF5Doi68lzGoQlO5JG0Vkg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(46966005)(70206006)(107886003)(47076004)(36756003)(70586007)(33656002)(5660300002)(36906005)(82740400003)(86362001)(2906002)(356005)(82310400003)(6512007)(316002)(6486002)(4326008)(83380400001)(26005)(8936002)(478600001)(2616005)(81166007)(8676002)(53546011)(6506007)(83080400001)(336012)(966005)(186003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 12:42:15.6964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97035da5-9910-4db9-b75c-08d86c50c09c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <73774128567AB84CBBA4A8C5E1C2289E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

For whatever reason the beginning of my commit message is removed, i tried=
 to resend it
but the same happen again.

This is the first sentence:

Add ipxe patch to pass -fcommon flag to gcc during compilation.
This patch is required to have ipxe compiling properly with gcc10.

No idea why this is happening.

Regards
Bertrand

> On 9 Oct 2020, at 13:37, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>
> Without it the following error occur (and multiple others of the same
> kind:
> bin/blib.a(epic100.o):(.bss+0x0): multiple definition of `_shared_bss';
>  bin/blib.a(davicom.o):(.bss+0x0): first defined here
>
> Change-Id: Id9aed4cfe6bec9c0cbdb0b99271ddff472f1f0c3
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2: add missing part in commit message
> ---
> ...cit-about-fcommon-compiler-directive.patch | 33 +++++++++++++++++++
> recipes-extended/ipxe/ipxe_git.bb             |  1 +
> 2 files changed, 34 insertions(+)
> create mode 100644 recipes-extended/ipxe/files/build-be-explicit-about-f=
common-compiler-directive.patch
>
> diff --git a/recipes-extended/ipxe/files/build-be-explicit-about-fcommon=
-compiler-directive.patch b/recipes-extended/ipxe/files/build-be-explicit-a=
bout-fcommon-compiler-directive.patch
> new file mode 100644
> index 0000000..6fa5858
> --- /dev/null
> +++ b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compil=
er-directive.patch
> @@ -0,0 +1,33 @@
> +From f982a712979619dbae2c6e0d741757e2ce94be11 Mon Sep 17 00:00:00 2001
> +Message-Id: <f982a712979619dbae2c6e0d741757e2ce94be11.1602165412.git.be=
rtrand.marquis@arm.com>
> +From: Bruce Rogers <brogers@suse.com>
> +Date: Wed, 6 May 2020 15:03:02 -0600
> +Subject: [PATCH] [build] Be explicit about -fcommon compiler directive
> +
> +gcc10 switched default behavior from -fcommon to -fno-common.  Since
> +"__shared" relies on the legacy behavior, explicitly specify it.
> +
> +Upstream-Status: backport
> +
> +Signed-off-by: Bruce Rogers <brogers@suse.com>
> +Modified-by: Michael Brown <mcb30@ipxe.org>
> +Signed-off-by: Michael Brown <mcb30@ipxe.org>
> +---
> + src/Makefile.housekeeping | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/Makefile.housekeeping b/src/Makefile.housekeeping
> +index 66d6dd44..b6c61c11 100644
> +--- a/Makefile.housekeeping
> ++++ b/Makefile.housekeeping
> +@@ -418,6 +418,7 @@ CFLAGS+=3D -Os
> + CFLAGS+=3D -g
> + ifeq ($(CCTYPE),gcc)
> + CFLAGS+=3D -ffreestanding
> ++CFLAGS+=3D -fcommon
> + CFLAGS+=3D -Wall -W -Wformat-nonliteral
> + HOST_CFLAGS+=3D -Wall -W -Wformat-nonliteral
> + endif
> +--
> +2.17.1
> +
> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/i=
pxe_git.bb
> index fbaad30..d7c60ab 100644
> --- a/recipes-extended/ipxe/ipxe_git.bb
> +++ b/recipes-extended/ipxe/ipxe_git.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D " \
>     file://ipxe-fix-hostcc-nopie-cflags.patch \
>     file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
>     file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.pat=
ch \
> +    file://build-be-explicit-about-fcommon-compiler-directive.patch \
>     "
>
> FILES_${PN} =3D "/usr/share/firmware/*.rom"
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
