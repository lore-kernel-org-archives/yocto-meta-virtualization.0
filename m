Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.73])
 by mx.groups.io with SMTP id smtpd.web08.11833.1638969040388475185
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TMGEqD3E;
 spf=pass (domain: arm.com, ip: 40.107.2.73, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6vw2/0+J7Xts6/Al7sA0KNHvSELYx/MMaB7qO48ZOE=;
 b=TMGEqD3EIRrmw5IwI/D9qjOkR4f7iiq/aV0FvfapYokkBNOkddH2lRmvdSQRjHftyjy+7lA7ArrBBL6nrvOtWSNCbZ6XEe6vpKS4GfKRiNOzBC+I66LbtBykJ0crhwhX+mhgPKGrJXXIBIsuE9DfAM/dFke4iL/a2PGrBLvztGQ=
Received: from AM6PR10CA0061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::38)
 by AM8PR08MB6433.eurprd08.prod.outlook.com (2603:10a6:20b:36b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 8 Dec
 2021 13:10:36 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::94) by AM6PR10CA0061.outlook.office365.com
 (2603:10a6:209:80::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 13:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 13:10:36 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110"); Wed, 08 Dec 2021 13:10:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70bdd9e348f099d1
X-CR-MTA-TID: 64aa7808
Received: from bdbb25f75e7d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38F10AE2-8F83-4728-B438-6F7B4D3F2DF4.1;
	Wed, 08 Dec 2021 13:10:19 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdbb25f75e7d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 13:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsKi4dU2V1yh8dvDWI0hnqdbaWT/GqUal5c3zHyRpeO613JApKXZo6BJKWkyMlTqXgK9RuDnGQVd+eO1yB3vW206gc9Xkuu1dUJZMFu+bI/DBO/u0n3JP2o8TKlc6OrWAVZ+MHUFq7MGwn9l2P5IlbzJ7HUZRJ3eY7IOQel65OtvH6i6LJeC/fP1LhavpzVNrwPWIW+8a0WSEQwqLsGiCaFyzNJuY9PBdVoSO66UDrp8yuODMnfsn0ZCTxcBB2hroQvdLiilRDxnUO6NqiRYFTpwxdiyTPiVDVd0jUazwkrD9Blb3P7dMneQ7gNLd4XZ+aVlY7L614uB2gi3e58Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6vw2/0+J7Xts6/Al7sA0KNHvSELYx/MMaB7qO48ZOE=;
 b=JNmPnvbaTmF8UxxcWCL8V8zJ2iVt9GAiEG+rt5/cV6TPF2bwWRnx1TdDOJXeTfRRb7EpTkzVxLyyBp881gJ66AQr20Y6pxL+d5HJZ65rYSupDv+zKA7GMZR4TAZTvhaVMTyaPAykePJiFlsao0wd3Olyt/4gx+6O9ASz1ERhvEtBk1GM33eb+SGPeEmjNGnpNAayVw6e9WazqjIynu0mpacFPI3t9t9Ai/OSXSVnzFqmFetRvi2fS/ADJF7+tDI6+JKodyYvKk9juBx1EmIL/0V9Mxw9cBM2i8hwkpl9KWnSBWhoFU6IrD8Px/iu9Q0prrnzP7GL1jRqoYOsuIhWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6vw2/0+J7Xts6/Al7sA0KNHvSELYx/MMaB7qO48ZOE=;
 b=TMGEqD3EIRrmw5IwI/D9qjOkR4f7iiq/aV0FvfapYokkBNOkddH2lRmvdSQRjHftyjy+7lA7ArrBBL6nrvOtWSNCbZ6XEe6vpKS4GfKRiNOzBC+I66LbtBykJ0crhwhX+mhgPKGrJXXIBIsuE9DfAM/dFke4iL/a2PGrBLvztGQ=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5220.eurprd08.prod.outlook.com (2603:10a6:20b:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 13:10:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 13:10:18 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen-tools: Load xen related kernel modules during system boot
Thread-Topic: [meta-virtualization][PATCH 1/3] xen-tools: Load xen related
 kernel modules during system boot
Thread-Index: AQHX7CDZQxEaitZBzkCW4zOVMW3ydawokaGA
Date: Wed, 8 Dec 2021 13:10:18 +0000
Message-ID: <5968C1C2-BF9B-4EC5-AAA9-DCB01155EE3F@arm.com>
References: <20211208104458.28009-1-kamil.dziezyk@arm.com>
In-Reply-To: <20211208104458.28009-1-kamil.dziezyk@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 37443401-57f4-4316-c7f9-08d9ba4c1fba
x-ms-traffictypediagnostic: AM6PR08MB5220:EE_|VE1EUR03FT063:EE_|AM8PR08MB6433:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB6433AC7749577DC5D1FDC5D49D6F9@AM8PR08MB6433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PUtI3aSDQm9XeTdlTqvPguVwLCCURbZrnag2UFJHAGYtIkMfzyww3RI+KjSK7KnqyTpiNox7YJl2uFJqts9AbXs6/69FRQrGj5VIfHy33bxUkJ7Kn84aF6tgerRh0etPrUg8K0T82jldV/MKrWHjhnG1ENDEhaSqYSsoTLqVxhIwFr9evQXkpMNghbTh7k/RzNl1uD43yEMIJzmW7Hp5z3te7jeB14T1IIX0fF4jRvfAiRzsTznSLJr6xysM293PAlt/nrlLuDEXhHYqgkXd2ANCIBNM7wggzpDlQwY7ktu7GluLnUXD3haglt6weZ7x+OUSmv+HWZ1gOPM8CYB42zVlcMTG948lomRZ20kGRm+s46SgDFZRG5pjJV9ap4E/UI9QyqZpAKCFUzklZIqjokxrqBpWVO6pmvMvKI48JQoud6kUNwDR8psYywUJj39rPC33UERHQl6LhZ2lOCOFlN54U/7B6elV/yEjK5mOlg+TM9lghzPk0G6Y6xnFOXkidemmV9Hq2opB6zUGYBBMaks6AojIAIfZ+yzotJIsHX4tr+syBVqoBf3rCZlIbeAZAHkCdfF4ZqfL1Xqg1Oyz4jsnjWeQt5pL7Eudv+Kc9CNecDeKTn2yLc17web+JA64YTWqydCgjSAPxAxTFpB1PD5h1YjbBaKnu2GSGBPb6/I1wrHpwAz6BpdrwYF1jqN4+S1UI/00cAd1j60dGa5+11dBHjTOJAPKpNjbEBUGil0IwbB//EKIEtd5PL9eMnfB4uJdvLcXz8wQJIjbWuMQVOgb9ZT56LEZFgyQAodtSqvwlrvdAWoV7msYLk9VREr9dYPYUaWX/syeMAEHiAFSwLk8CmFjv3PWi43EZj9doEg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(508600001)(6636002)(53546011)(6506007)(2616005)(86362001)(2906002)(316002)(5660300002)(966005)(54906003)(122000001)(71200400001)(66556008)(37006003)(64756008)(66476007)(66446008)(8676002)(8936002)(83380400001)(6486002)(38070700005)(76116006)(6862004)(66946007)(36756003)(4326008)(91956017)(33656002)(186003)(38100700002)(26005)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8eb9e197-2f5a-4694-0e4d-08d9ba4c1516
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cp34o4ATHwljeluGZpdtkzGPactq/tgQUkCQyoJFnxR0Q04Vj1h53H1bFdS1gn/1VBwhfzJb05doHFHvPdJJEBV/4bSLft0nFOKJdLbqL+m5OSVFdpdVM7RzzlXBODu2cgolLQy/DB/xNdOveC+0BS3toNlH/ukeZidieoGHpaz4uJMirq+Dr+Dsijjv6wQVy4/O1HuXh8XOT7DxhuB2DpfJnKa0vPd3jByYtBrETLNkn27Wl8UnSmgZ5lw6c6kCuP/iF+7lbnh+0P4zywazeRC8vcsyfN7DchFpQ/Z+CLVHEYdEIT7a9G1YeD7+sNDmhG02BjtlmbDiYmi1DOgBw40ZVvCOXmJw2S836hcaBYq8rjdvcOFtxavvHAqMMhS6RrVYbn3EAVaarIPi9NxuqeI5sXZrAgEZMDn7ZCUHFob7ZNgsy2AZUbvhK+NTtpDEagAHiV7MMrg9V2prVK1zbCM5JzPIM9ErSnXj6JSQRW+e2Txp7Xbwc8nyA6dAE3cvYRN5BExIJeAgDeKWjplZy+SORT0XkgyqUJOA/xm45eP4HSgRcKp6E3/OZr6OFW+XUxZwRo+ObLQb4vqeCD9d+OicKf/UUA3D+xo0PLmYLXvgFnq5uGwKoeR+31XRptJ14QIJICjlwGTlwoB3PsbjPs2kD6mERbqtHIaZvxxQ7ZwiREbhgj3jXKDi3mPiL93OHxRK+T4WErfT+1bQmycn/zhUEtCB8TwNhy+6ym1L9gEdxUQjm+99+NjqxOrMmEG6cZixXMHD8PGvDyRJK3ZFpW0cGrJefBZOwEmVZFDhbOZac7QFQUtMFEet/nLjUvHm
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(37006003)(356005)(5660300002)(53546011)(54906003)(47076005)(6636002)(966005)(82310400004)(316002)(6486002)(83380400001)(81166007)(6506007)(4326008)(2616005)(70586007)(33656002)(8676002)(70206006)(508600001)(336012)(6512007)(6862004)(86362001)(36860700001)(8936002)(36756003)(26005)(186003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 13:10:36.1168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37443401-57f4-4316-c7f9-08d9ba4c1fba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6433
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <E910827308C0C644B2184C7D571893B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> On 8 Dec 2021, at 10:44, Kamil Dziezyk via lists.yoctoproject.org <kamil.=
dziezyk=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch changes the location of xen.conf file, that contains list of k=
ernel
> modules to be loaded during system boot, to "${nonarch_libdir}". This is =
done
> by removing '--with-systemd-modules-load=3D' flag from EXTRA_OECONF varia=
ble.
>=20
> Previous path based on "${systemd_unitdir}" was not considered by default=
 by
> systemd-modules-load.service.
>=20
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-tools.inc | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
> index d831941..6b99040 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D "\
>     "
>=20
> FILES:${PN}-xencommons +=3D "\
> +    ${nonarch_libdir}/modules-load.d/xen.conf \
>     ${sysconfdir}/default/xencommons \
>     ${sysconfdir}/init.d/xencommons \
>     ${sysconfdir}/xen/scripts/launch-xenstore \
> -    ${systemd_unitdir}/modules-load.d/xen.conf \
>     ${systemd_unitdir}/system/proc-xen.mount \
>     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>     ${systemd_unitdir}/system/xenconsoled.service \
> @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.serv=
ice"
>=20
> EXTRA_OECONF +=3D " \
>     --with-systemd=3D${systemd_unitdir}/system \
> -    --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
>     --with-initddir=3D${INIT_D_DIR} \
>     --with-sysconfig-leaf-dir=3Ddefault \
>     --with-system-qemu=3D${bindir}/qemu-system-i386 \
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

