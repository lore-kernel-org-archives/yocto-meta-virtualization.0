Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.43])
 by mx.groups.io with SMTP id smtpd.web10.10269.1604480211192951363
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 00:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TdZ4tVL2;
 spf=pass (domain: arm.com, ip: 40.107.4.43, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvWvOeJRaHt7DfY8D0MwsiQazJ3Lr3ApB8b/GbYQHn4=;
 b=TdZ4tVL2/29nhlc9SsCjMTEon62cbx3VBZaKL40ZBTB7lElSmwtuIarPVL8YMGff/Tx9vm7NY+O3FsfnB5vuDs3HRTCyOTdFChOIS3+8lpGgUSrF0CbOgSXRpk9H2FVdoLfxhrtU22waU3HTJFBKD4exRFDYYIpMNpCIzDmWCPw=
Received: from AM6PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:92::35)
 by DB6PR0802MB2488.eurprd08.prod.outlook.com (2603:10a6:4:a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 08:56:47 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::90) by AM6PR04CA0022.outlook.office365.com
 (2603:10a6:20b:92::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 4 Nov 2020 08:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 08:56:46 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Wed, 04 Nov 2020 08:56:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b3858220f0be08c
X-CR-MTA-TID: 64aa7808
Received: from 0c186a8d183b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 07D04601-0536-4F00-902D-87139579F5D4.1;
	Wed, 04 Nov 2020 08:56:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c186a8d183b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 08:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN7y+/tItegc7kzbstTIZ6dYMH5xvXhUmPWo0n99UwuaurS6XPr1rlFtblX9qNGcJwZTunejDiK2yUIO1TQaLQfcke96Nx23kD0mPPlzMiNTnSqUElpTFntuhsanleEUMOtOP04T3PRbegXkZoEFvjI9/0aG5HF+NGWjCl1wNUZcDfvM7EWaz1WJE4wPF1qK4oKahQ4llaJc9+q+hFOu9J5TQOMjbHUxz67pcmJS1f+3zlV6LDvKP4HCb6hSlouwFY7c2RI92d4ESq/5Nuwg0wYLCkfhMjOqQJPkaw47q/TCYG6QYfMrlqx83YjDvlJkblPvE+756XJqRhfAdfEH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvWvOeJRaHt7DfY8D0MwsiQazJ3Lr3ApB8b/GbYQHn4=;
 b=C+ziztxVUN83SzSYb1GJUEYBoFgd/qLAtIB+22qr/Ep17KlmxteXtfNXiO6sGM4roaUEykoh4qPxBwSaIUgvQ1bdsuWx3TI0N9fpq+SH9JXO7/tLGcM28Doa5IyRofvGTKhXXehYzXaQe6mtigeFxiMS9iW5TQHH0e7Hgp4nF7vFC19AI0/OfKWKUjrQipoTVZ4A2wZUWlewdElrrNurAiwNHA3P+8cy513hkLtBW8F5KAMLo0vKCfg2POZJezo0aIeQMYncVpp+1ddXRpXZnzLXtgZFUemjQWyEg2TBNsSh0KdhgMsrZKGED3/yLKYInkbB8uJ7ZcxWcGHfPusRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvWvOeJRaHt7DfY8D0MwsiQazJ3Lr3ApB8b/GbYQHn4=;
 b=TdZ4tVL2/29nhlc9SsCjMTEon62cbx3VBZaKL40ZBTB7lElSmwtuIarPVL8YMGff/Tx9vm7NY+O3FsfnB5vuDs3HRTCyOTdFChOIS3+8lpGgUSrF0CbOgSXRpk9H2FVdoLfxhrtU22waU3HTJFBKD4exRFDYYIpMNpCIzDmWCPw=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 08:56:36 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 08:56:36 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to include installed binaries
Thread-Topic: [meta-virtualization] [PATCH v2 2/2] xen: extend SYSROOT_DIRS to
 include installed binaries
Thread-Index: AQHWsPBA0TDAXkQH306XKsd45NEZBKm3ruwA
Date: Wed, 4 Nov 2020 08:56:36 +0000
Message-ID: <2B82A9A7-869C-4BB8-AA2E-47329BAA8818@arm.com>
References: <20201102081357.4975-1-diego.sueiro@arm.com>
In-Reply-To: <20201102081357.4975-1-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 512e614f-464b-4705-c91f-08d8809f8f90
x-ms-traffictypediagnostic: AM0PR08MB3972:|DB6PR0802MB2488:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2488ECC5109882350659BC679DEF0@DB6PR0802MB2488.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:321;OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Jsqy+ew28Cte58PAMOhCfakvknDO3LCRmXHtDJNoAUUTwTdRfTsfFMD9N4wz1k4j4LajuhLP8XuAAZ4LzGTQhXottB+nmLeEqCbvDkOfZB3cuyIa8ZMiK+FX/ITs+YdkKaa8NRQjUO5CbbiNQFd0HxxywJgTM2rE/Lfp8fTYUonYhxq3IEyZNXOFp0OL5TKKzwx4YkhMPnEkSVCbQayrWC5gWOtt1fWSS4GyPG4FSauhTXlhMcs4mZiH4d7u9c8HgelS9TwuUBBx4l8BDZS5x2WMS57logfXSBBEYuHcd8rSBWptvESYACsnbd5WXDq/Dgodj0F8w4yhIVF7+pzdFgZBS7mtEm2EiXkLKdYLHEQqBSDJ/AMfEK5Q3YvPBCHazZkRDLFbkpl2L3z5pDxE+A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(71200400001)(6512007)(4326008)(33656002)(6862004)(26005)(5660300002)(8936002)(186003)(86362001)(8676002)(6506007)(478600001)(66446008)(66476007)(6636002)(64756008)(66556008)(66946007)(76116006)(54906003)(37006003)(316002)(6486002)(966005)(53546011)(36756003)(83380400001)(91956017)(2906002)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 p2YRJe6cCcbS+qIZl4W/CmlDaEqd+bZU+kNCJUh9JU3p/Ga/59/Cx2yuILpkNWVg6z1RbBuBzJZW/ritHu24CL2cNjg8SEIngyMkC8cuZUzsVTb8WNZZP+5K25LbW3pp3/isB+3xvMatUU8oqkaxk2FuSyxlbEBVJc5cv4Z+iIIeDhW1AFnwSMshFtX6Ivy9cVsq+FhoT0RLnszvaCFKLlc1GI9vJb8gcAW7YUIWd+lBuiq1RuQ6fvsZ21P2h5TUHdneOmfiRbK5ZLyGDe91zLnAhHLMizgzz7j8IAGsbTpjleAMevOXF3z2wHSjjZkiHEClsHTMmzPECowPcg8Z2itWAxQ0nYLDNY6Mv3KqAOGC++7cidsftrngkYGz17XIlMqJpJ0flojcK4733yRY2j+aAmcGSpI944S5Swz9ZPa7QZ35JG/ppDkMfnmDAwLujvSPJAvu0Lt2YUMMe/IX1lGgTbIds+S4bBlKnEs/k+NunxuhUDLMyTJtV2sMinh/fzr4jHkvVuIIkTwgUQnlLRoUXmlCGftg8e4TZ24zjwaz8xXbn0IWIqrEU7gD+OGcIbc2vS4+et5lC2Gkt93KwhyR8cmId0nQS3BlyCQzDVwa69q5EJPkXxnOa5mLpw4SJMfm/8O/5F9pbsaNYQuigQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3972
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e69c1d43-5ed5-4093-d9da-08d8809f895d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shnhezuckK9QPSqkjIDUtb9UKnV/YSI4AklkYshw6O8VNxnOGgPtifCfl2CpbsloBW9qOm4Ay35nYPURez0dI5k/arvQ8xVdpgwvaG7CyufPcf0IOUxhMQepFFhUERBVnI9CwOtcZ+iAdC+JqSJvYDrdq44L7Hf0U980leOA7T4IiEL5Dc80XgmjXGGaJADoBjf3zVmjaTAVFnC6d6Ny1d88ye9EocmsuE+8KI0fYsEb/TKAFi6kBvOMhAw2OfwTX6oCK9nbVJJN8gAYVscIMJjD9pO96HYWwmNKrCB3nZGtUwa0aT+VJ52ob6zgtl7u/Pze5sHBfDEZbZ0Rzn/3gXxcQJtqewG0vHlwmrFYkn6RmE1AyLhQz/oEd6XxHDoGYoiYiqdENQcieNTyHydJSks9SnIh7WodmCPcUhx2d1RyZ5Vdu/VbMkFa8jcxzEMoHqkvVf3VH7OhbB25kd44Bw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966005)(478600001)(107886003)(6486002)(6862004)(70586007)(70206006)(36906005)(186003)(26005)(36756003)(5660300002)(37006003)(316002)(6636002)(54906003)(966005)(8936002)(82310400003)(33656002)(8676002)(81166007)(6506007)(2616005)(47076004)(82740400003)(6512007)(2906002)(86362001)(4326008)(356005)(53546011)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 08:56:46.8661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 512e614f-464b-4705-c91f-08d8809f8f90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2488
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09C4340B0402344D9CEC6049100CBEB1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 2 Nov 2020, at 08:13, Diego Sueiro via lists.yoctoproject.org <diego.=
sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> If a recipe DEPENDS on xen we should include its binaries in the sysroot=
.
> The do_install task also ships files to /boot and /usr/lib64. Hence, ext=
end
> SYSROOT_DIRS to include these paths.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> Changes in v2:
>   - Updated commit subject and message
>=20
> recipes-extended/xen/xen-hypervisor.inc | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/=
xen/xen-hypervisor.inc
> index 6a75d16..916bd3c 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -55,6 +55,8 @@ do_compile() {
> do_install() {
>     oe_runmake DESTDIR=3D"${D}" install-xen
> }
> +# The do_install also ships files in /boot and /usr/lib64
> +SYSROOT_DIRS +=3D "/boot ${exec_prefix}/lib64"
>=20
> do_deploy() {
>     install -d ${DEPLOYDIR}
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

