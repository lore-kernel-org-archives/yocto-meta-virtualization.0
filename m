Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web10.11961.1638969159633934718
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ywlc8Eww;
 spf=pass (domain: arm.com, ip: 40.107.6.63, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIDEFyrDt/HTAkXmp4k31WHYekz5bjNEBx2CJlBT+0s=;
 b=Ywlc8Eww5C+Nve0muGu8Z+VfrtVQ5OLPt3xDHhf1NkQ+ltWuZ3Jyf9+aFA4UYkVDCfzQ3yi7Gx45uErE44jeHk8Vp0WNw++8oFTyPfeNrgJAzMmYc0/V8ALsaA8sHws8jptpgMZfkPUdwLaZbJDjNrEvqI81SxtJEz/68ZYoGtM=
Received: from AM6P192CA0045.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::22)
 by DB6PR0801MB1991.eurprd08.prod.outlook.com (2603:10a6:4:71::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 13:12:28 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::98) by AM6P192CA0045.outlook.office365.com
 (2603:10a6:209:82::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Wed, 8 Dec 2021 13:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 13:12:28 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110"); Wed, 08 Dec 2021 13:12:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fb97a5a74a6f1c2
X-CR-MTA-TID: 64aa7808
Received: from 2ce3474cd4e1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9CCF49EF-8A11-4337-9132-F6E20A838201.1;
	Wed, 08 Dec 2021 13:12:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ce3474cd4e1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 13:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f54iJ+aXWYC/De7vv2utOp0QDocBkv4g8xvV5PcW6CmNN7wgaqorUnTMdK3HfsvrTkqXNrid/po+kPfRhnxzFEVRgKM3+jdugYUNzQ0aPkM0I6RTE6yvzCpxoJhIpfmeRqDr62P/REmp4Ip4Mgt26J9n6EvnSykDCTSIKebK1nm2msU6FKLPn7YtpfF8ByTOrfa3wH9EaiM2DqvaP501Jht1vq8h2fiPl9DrGMNRik9AGgQro7GIJFMaoz6qwim8kIZGqu4coqf9/Ji4c+nRt1j4W3gDIlVVu8+iQ6Qm6W7vor5IoxhNBt6yeeG+ALs1mI0Hvs0h2O8MkF+ddP/w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIDEFyrDt/HTAkXmp4k31WHYekz5bjNEBx2CJlBT+0s=;
 b=BamfcIvc16MIF2mznLhWqTuj50P3zi/f/5mohNJpxYVayLYkofxOanH/EJzC0QjK/K3pxVIEweHtNmnUj7rxjsGmmKbgFzb9lbfqq2N022t3VWuuTBk6vS31qMfoA7l4x7r0bJpv0RpJ0R6kBWUwwJCApN4Tfm7FE+/4/BxY+V7slWVfltmr2rHGsy+Zl58B3PDZo6QqWwSMZfMFUmg7L/mcc1pUfLgI1OmfdxYtcOPEePhuEc/xJqxq0ibczGL0Iv1b84DXF9jD4kNmV7cwG6Jsk6Sim3YSHmj1aM1r9hL21BW9AjIMtq6Y8GHGSvPhm2d6s78fTDOX6zMNYQBd0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIDEFyrDt/HTAkXmp4k31WHYekz5bjNEBx2CJlBT+0s=;
 b=Ywlc8Eww5C+Nve0muGu8Z+VfrtVQ5OLPt3xDHhf1NkQ+ltWuZ3Jyf9+aFA4UYkVDCfzQ3yi7Gx45uErE44jeHk8Vp0WNw++8oFTyPfeNrgJAzMmYc0/V8ALsaA8sHws8jptpgMZfkPUdwLaZbJDjNrEvqI81SxtJEz/68ZYoGtM=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5991.eurprd08.prod.outlook.com (2603:10a6:20b:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 13:12:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 13:12:05 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 3/3] grub-efi: Add xen_boot support when 'xen' is in DISTRO_FEATURES for aarch64
Thread-Topic: [meta-virtualization][PATCH 3/3] grub-efi: Add xen_boot support
 when 'xen' is in DISTRO_FEATURES for aarch64
Thread-Index: AQHX7CDjq/qwCsJcYE2ubqM1BgLUpqwokiEA
Date: Wed, 8 Dec 2021 13:12:05 +0000
Message-ID: <C412EF42-3330-47CB-BB30-739F20B5D807@arm.com>
References: <20211208104458.28009-1-kamil.dziezyk@arm.com>
 <20211208104458.28009-3-kamil.dziezyk@arm.com>
In-Reply-To: <20211208104458.28009-3-kamil.dziezyk@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3c06d52f-02e9-4343-9e45-08d9ba4c6282
x-ms-traffictypediagnostic: 
	AS8PR08MB5991:EE_|AM5EUR03FT019:EE_|DB6PR0801MB1991:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB199114CCD523E969C55966A19D6F9@DB6PR0801MB1991.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:196;OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pUlxJOOjts+Ly7MoZd8TVrDoDY1XhHFFOPrptEWV0/qsnef16pHlj3wGntwa0Qrb4Wj7UQvlZyHl1TTEwh7bb73LLxgmbl7LTXQmLTRrxMkfF3FZ6WGdUTaVRxGRZMoQ5KHyvDfz0kPOjMjq3R2dHmQmBDmcSlxemtRbooe8lRH8ITMbQnZVeDHadC7tdx7+ylaI9JRO8ySdB0yQbLq4IZ5ddamotSvxLdHm8HL5Hl5cmD35LcccN8aJaX+pAwWKnY7EcSSxMsaTIsTVf8JZtK2vWu3o9VzYdUdApSpNGxi4URWNlXbVD2SaAa3Y3IN2JPqatWE9qLlHhb2CF2c6FrP/szqMAQCnCC7D/DVOqWSErAodOeXN8MsAnC5vd1BwUZDTJ40MnAKGZ+LsmHUSjlI8mc2Y+7lmD+G04J9sDk/1078WwKngICMjd8Ssh0kGeiBq3fZZyL3fL/ZQfoK1EYdbce2lDeNpxaHujOSXXRIVIFprghR9oFH7j3fSepWjRBJPTO5DwnOoStUIv/guJVN4zjds814B3k+uVof6AZHqI81AagF33xN2BQgiSXC5924RS3xuEg4EAFVaw9wN0Q8xQRkK6s0J1kQCWx7RdMZZNPDbtnNGHeOov6yGH8bZnqe7WjsgXWhOzWzdxxpAdL24rsB4tszb2XHp+0H/VUinKzhSI85cf5V8JPtY4CRuGhEllW9Oeuq7/DITXT8Ox9POGe0g4uYzemoaGWCzs8vx5J1joZCRFBjhKprEeiEsCIYDV/9EvjDt/4CYMuglj9ZCQG09Os/WCmYGuvouqzaIqEE7iF0DLcdxHWnaCu1Rs2TIeg6l8J6BUlaVIa9LLLwmqbfuqAPQOVxhJG2A9k0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(64756008)(8676002)(86362001)(6506007)(37006003)(66946007)(38070700005)(2906002)(53546011)(71200400001)(6486002)(316002)(966005)(6512007)(66556008)(66476007)(33656002)(4326008)(26005)(8936002)(76116006)(508600001)(91956017)(2616005)(5660300002)(54906003)(122000001)(36756003)(186003)(6636002)(6862004)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5991
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4a581bf2-28f0-4b81-9cf3-08d9ba4c54bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M8zfeKs/tszsZWSH40It4H75gNDUuVXtcfJSdKJvK0L4R2y2ftG109+H6CnpDtsKAhqK83hFtalUy6yYsH6Y4zz+7EqfQhLwcaFJ/7TRCc3irqr3YNZ72J2vNII/cqvIHfz3DzXP5ig5xPyUNamyWBM+3pba7U4vXcBt5eCwgA1P9nOX/dmBVqiPc0IdKvF02CpGPWeI2Tbr0MFq9LkVxN/GZUquiBDrMHeSWGLL16MW5Av5GkueMAjvgXOQtWtvcIhm7MzbMLl3itA1u6vqCwEDYmYxBtEP+Ts4opuKoZ+gesoaB/rYJE1zbtt7mgjb7OWS0ax28+jrU//X3JohBPapoO9a8dcTEK/VD+gUbbCp8YVSwXMVH0D7MViVQcxgeZYcfE5LJHVKYAlAaYKu3Gddp20weVrJ1NjciNbRB/4W8LImVxLaDuLHBmLvPi0fFeTc95TUy2pn9cU1HK6RQQSBASh6u5QCzGQbCF4BWDR5NNsnEFETi5PwJpjcYbhAqUeX5QAN/a7aTvUjCchYiXPXrHgHueXfiWDeawysGgkdmDZMoXa8FKbHCDZtpbUOWceuAIl5B34x8LsdHiBErPCoc1rDkXoMlRiTuaHDXmgo6U1vYeZxpFofxUic1LPJNAaLRlikpeyAtB7P9woZa8IoiTJp3UXS3cq2a+YnRRsUF+MTJIkCAyoWzG1g/YQu7MoX44SJXP/1PuowTiwxN8h2cYdV+258FEVZCY2OHlp8A0kslR6Px6jMtsM9+nPfyWUtrpKqHI2rhlNmBEfmtzaxGQQ+x9px5+gyfkkzjuK/AZxTnzRo5suECJV8UzoD+5wIziSFQVzf4mZfaeHQPg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(26005)(336012)(508600001)(6862004)(8676002)(86362001)(966005)(6636002)(83380400001)(2616005)(186003)(47076005)(6506007)(8936002)(81166007)(54906003)(356005)(82310400004)(36860700001)(53546011)(316002)(70206006)(2906002)(5660300002)(70586007)(37006003)(33656002)(4326008)(36756003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 13:12:28.2019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c06d52f-02e9-4343-9e45-08d9ba4c6282
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1991
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <D14B2819C9D18F4D84338FD474F3CACC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> On 8 Dec 2021, at 10:44, Kamil Dziezyk via lists.yoctoproject.org <kamil.=
dziezyk=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

But an empty commit message is not something that I like (more for next tim=
e, no need to change this patch).

Cheers
Bertrand
> ---
> recipes-bsp/grub/grub-efi_%.bbappend | 1 +
> recipes-bsp/grub/grub-efi_xen.inc    | 1 +
> 2 files changed, 2 insertions(+)
> create mode 100644 recipes-bsp/grub/grub-efi_%.bbappend
> create mode 100644 recipes-bsp/grub/grub-efi_xen.inc
>=20
> diff --git a/recipes-bsp/grub/grub-efi_%.bbappend b/recipes-bsp/grub/grub=
-efi_%.bbappend
> new file mode 100644
> index 0000000..df2b688
> --- /dev/null
> +++ b/recipes-bsp/grub/grub-efi_%.bbappend
> @@ -0,0 +1 @@
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${BPN}_xen.inc',=
 '', d)}
> diff --git a/recipes-bsp/grub/grub-efi_xen.inc b/recipes-bsp/grub/grub-ef=
i_xen.inc
> new file mode 100644
> index 0000000..5aa0958
> --- /dev/null
> +++ b/recipes-bsp/grub/grub-efi_xen.inc
> @@ -0,0 +1 @@
> +GRUB_BUILDIN:append:aarch64 =3D "${@bb.utils.contains('DISTRO_FEATURES',=
 'xen', ' xen_boot', '', d)}"
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

