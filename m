Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.50])
 by mx.groups.io with SMTP id smtpd.web08.4480.1618478510999931395
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=72yFPr/N;
 spf=pass (domain: arm.com, ip: 40.107.0.50, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfk9IRpooP9vpDnQ9JumqoGu6Cx9ggZVhsrx/Np6rPs=;
 b=72yFPr/NPhHwhtPzcVOs1muuNqT7j8vU+2bDfvrTwXonnI2magN6c+LW6xmD16SYLRyRRnZbf4WflM84R3VY2HAquT/5SZg6HKPROhyeLDphDzmFP4mUNWfD4NDJYXLFhsuoMVE0W7JRGedyzuNwkVSXmhT/9S5zB+G1maTlZQA=
Received: from AM5PR0201CA0023.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::33) by AM5PR0802MB2611.eurprd08.prod.outlook.com
 (2603:10a6:203:a2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 09:21:48 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a8) by AM5PR0201CA0023.outlook.office365.com
 (2603:10a6:203:3d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend
 Transport; Thu, 15 Apr 2021 09:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:21:47 +0000
Received: ("Tessian outbound 47ca92dabae7:v90"); Thu, 15 Apr 2021 09:21:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82acb1a320b86a91
X-CR-MTA-TID: 64aa7808
Received: from a2969e26cfb6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6DE349F5-D7DF-4756-B7C5-CDD746263469.1;
	Thu, 15 Apr 2021 09:21:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2969e26cfb6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKT/kqEovoGp4ayykELWQUh+vwwA8iAZD/bhPrrTa7t7YfydXXW3vLFdc687fzTr6sS8atSMaJbxn3hiQHKztruVJ45J//YHaGi3hCn+3vHp7zdYfOXntGYPgbgbNlFn/Ya4O/5LcANaXGPDpMUL8XQRtJYElRxYthtuy4wYhzh8Q0vvuzI+b10Huj1roCwszWgZB+0T6vmJn6AnmfQjXJTthdv8DmpuBEv6NRCgEpFono0kV69J9b1ErY2XxS02dBQFOQV7Cbh1TreARqiqz+qtevtwbxEVt+gKVE/+nlRl80tPQgab4VmhI6NjM8HDhWInvbmTlVQz/Kwk/2xfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfk9IRpooP9vpDnQ9JumqoGu6Cx9ggZVhsrx/Np6rPs=;
 b=ZwI9hlwqYm7ZoC5FpmQWwI0USGWSYAnY6igjxJw4+6RDygH5bDRX1zT6SVQrZjWGOU/aVBnDLFQJt66M/CQKxx54IjTjAzZVtzeldRKHUBHUyI2fkc/m8tZ5Xg2e4IvyzBKIqOtRbAl3UKhb6pNKKiHYux+QT/DTEB/fCaDTmc7Sp7yYIlyXvRYHbjFCiIFJ2UxtUw3mUN0Q5+RZBnnMOCaV6iBQkKta/eqPfLeEnqQfrHDOGTIOPtHIm06xSm3oJpUlSbnLzxMMRPwNQdYi9G+GPBCtArNQ/8PuD952JSBFf6FFO9vBuGlZMk8Db8lze+6PtdVvGQky1esAsa0eDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfk9IRpooP9vpDnQ9JumqoGu6Cx9ggZVhsrx/Np6rPs=;
 b=72yFPr/NPhHwhtPzcVOs1muuNqT7j8vU+2bDfvrTwXonnI2magN6c+LW6xmD16SYLRyRRnZbf4WflM84R3VY2HAquT/5SZg6HKPROhyeLDphDzmFP4mUNWfD4NDJYXLFhsuoMVE0W7JRGedyzuNwkVSXmhT/9S5zB+G1maTlZQA=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4047.eurprd08.prod.outlook.com (2603:10a6:803:df::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 15 Apr
 2021 09:21:20 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:21:20 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 4/6] xen, xen-tools: Document the version update process in README
Thread-Topic: [meta-virtualization][PATCH v2 4/6] xen, xen-tools: Document the
 version update process in README
Thread-Index: AQHXMYeJ98B+BHV2FUyO9Mtc3eSLwKq1TlOA
Date: Thu, 15 Apr 2021 09:21:19 +0000
Message-ID: <B18934F5-C60A-42D2-898E-26F6AA521B33@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-4-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-4-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 71ece854-6825-4fce-deed-08d8ffefe49d
x-ms-traffictypediagnostic: VI1PR08MB4047:|AM5PR0802MB2611:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB261135772C0242EEE16CD3949D4D9@AM5PR0802MB2611.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /7Xx38+bwbnG7XeKu+kZGVNvbNYj3yk7G1URw1fn9cOcNe+4h+4Mtv9BVRPQ451H7KcVG8HdZ9UXesjVwdn2RZ4x8xzfRNNNra0VC+/8scvSvUbc5Ov8mqMKYISYfJDZFk+m5ATeVzArWojmqPp243BMT+EDH0UJj9xLrs+dfJ78RrQgwMJvruSTdJEVtOK48F918Vu+RV3I3bnsP0HeMpi+S6q0bS0CcWsnT00XdFyLBxdWLDqTHXVgwA+TW/4A4zaMSz8iyGiKuzwm4bOmjLSwa3shziq+R+fNvDIBOSemsJGCvuAzZ2QZR9iQXOy4PhbKQ4FEty1y7a6/m9DrV8PwntdV8QqejdxpVPLQ85WKqOuiDU4ZW6+V3aV0vqT6y1C3qcuT3s2oTH3Uef9h13kEbtWy1t0CqvtW4Gdba+7QjoeHAilEdPaZXwYCHAVXccRS3stvbcIF4h1k+d+i8ibgCWH3LQWcVeYSbI36VslMkVtJaGl+YTp+AnnOb4LwVCgoJMxJLej4iMwyDwV8TPjZ4Gea+f18CoUO5AMaq2RaRpj5PtNhGSKo6VdQRTIqKxMipFYLKBOCfp+2eQ5YoW2TExRbHr1njFYKuxM2r3V6d1mf9YtZGtGpyW+DtnecVICN4R602FKZdsjOLgz3lJ06sR85vN9Z/CwpKbDeBU6RDZeTni02GQY2vD2u42lD7j3ST3eVpMoXM880K3rV7nqjM/6Khw2YG2jB6X4j0sw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(346002)(136003)(53546011)(6506007)(8676002)(6486002)(15650500001)(5660300002)(91956017)(66476007)(26005)(66946007)(71200400001)(2616005)(66556008)(8936002)(122000001)(186003)(83380400001)(86362001)(316002)(38100700002)(36756003)(33656002)(4326008)(966005)(2906002)(6916009)(76116006)(6512007)(64756008)(66446008)(478600001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?j7rRXSbDMr/pv2HN7G51MuZSDB6ye90h2KQMovCnb9E/rL0fx/tl6TF71fTr?=
 =?us-ascii?Q?QtJA4JMP/2+AYae/GnIJcUB+optRbheJqSBCLAlb9V/+MWS3ptBt1kKwpQOY?=
 =?us-ascii?Q?Jj3FTWkhPylZXemgGoKMNAkvnIAHhzKsxUUem8B1P9P4MiSqO2yMdSHsghCY?=
 =?us-ascii?Q?n5abuV2qE53vQD8nZWyABehmTx6DZc+rdXyw8dAE2MzJpI4Mur8wR+BAAysF?=
 =?us-ascii?Q?pMnXPLKPnOnTv66SXj/32QVZ5BHKTVEVx2mlhF3SCBatS54wj87pcQaRimHu?=
 =?us-ascii?Q?pl1WdbwIh2wvLvUIqgakz0R6xuS47HMMniu5aSZEHuja39AHkOAZkoklKpFS?=
 =?us-ascii?Q?OMfSavvLghUUiVeuDin8Ove8WrbwnT88whCXcePjvr4OsgyUECu5by7049L9?=
 =?us-ascii?Q?3uS6se17vTGg3aZnYHRxfPlTwiXFIqw5FrKal+DA11Zl0ispW/qhOMvUjkLP?=
 =?us-ascii?Q?KyUHpSguVUFE9uXZKrK/uBXkDEOap3GkBPRnlTODMBn7UYFffC9Y8dVaSTu/?=
 =?us-ascii?Q?mKrC2bKbGZBBBuo4W4MqV3D34CoHQaV54eOFknt1PXCkdTIn3FLRT9umXOkc?=
 =?us-ascii?Q?Ejf5oNgdP0gLo+f6KmXXWnLno0Q/9+b32Ho3syq9T8+cRm7PjYnGncAh12rI?=
 =?us-ascii?Q?3TqMYL33CQlBzXL0UOLVgM4jzKfpA720ZU3ZwHPxbATuU3xI1/S6Ffe/7sT2?=
 =?us-ascii?Q?xTh4T5hEzGx8y33As81BiuJ4sGA+7xbK/J6u3kpkoCJ/bJHlSBfH0paV56Xy?=
 =?us-ascii?Q?qg0RpqivoC609P7jv+pOWGKkNcoHrxruGEIcT1lp42N3A8Cnev309IbQZByd?=
 =?us-ascii?Q?m0f8Obc3Kzt87PYdQh8oe3aHlAvRDZ6GuGqlQZk62ZLYO3xl04SDOSsmBrmA?=
 =?us-ascii?Q?awWSEjGLjTnDRljqE50+zPe6pisNOssjJmcsXdNxtxd0hIo+Z1eJWcA0zd3y?=
 =?us-ascii?Q?NX5Vpf0eaUDWv7Z9bt7QlKBlPnKfl1aHaGx5qZaS00Gtyf6XzwuMfS+F7THQ?=
 =?us-ascii?Q?cfoMGy+2OS0iRHEq3ABeYoz7FQwVIB7BKGXvFojuDHa86H3N/TdheVYlg1vm?=
 =?us-ascii?Q?XSAs9LHlz4PvfCi2Hv5ECxvoa5JHU54U4PBWIzjatgAVxyN1irDxwu3lyT4x?=
 =?us-ascii?Q?n1rEkhG2FjWXDiLSuVpTaSiamHlpNhPJ7J1Z+8/nsbpEbah4we5tp2cIG8uM?=
 =?us-ascii?Q?ZSN3fEAVfEpeGFaGPGbLLIXCaBTOJaBUmafzmxGQxHfeiDbebc1FINdw0N7n?=
 =?us-ascii?Q?vv1NXjClfIXhbBWWqJwxe+kUqpiHLF35QOU/0LLSL3kRldA9aOusnu7OD2pB?=
 =?us-ascii?Q?AkiggsvcCEfBcur7ox14N+8EH0fbDgryNHafakUyEuMj3w=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4047
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fb5b9ae4-6ccb-49e3-d3b9-08d8ffefd487
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3f1q95PO4+b3SVhcCDCoKeTdMu9WdavIEWgKoaWx+SkIQeHOvTh3t8FBniBviNjdxskFA8NBAxulSgFHgD5thvinHtQSSx7qP8be9UlzODb5jWAbwcfaPV0fbqmmNo/QLnmyOc6rdD97ZIZQfQDDUyISAaPtU0lVDD2pRjS6FTA+Eoe8YX7ePeG7qIktEToVr1uqoyTn7Kvvk4Pk9Xxp/S/4ix0DjQqBtOMAr8CWPWIsUj6PYHyQC3+dgFlMRvz9WC9TCiAwtRX8WJBWTCtfOY2W7oBSJzbsChf6lrONxj3MBWL6a1RL+mi/pQJuxFTFPEApL7NX/tLaHEGtdBQn+gHD1wMO/z4teHEb1Nl4LJH+Qy8pFyxL5r8/ix+oKJCEC973L7GnGZFUWOZcp9J5kPW0j9bSZzLAVo2t+BYPV+VZmyWhs/wYjkyUf2lwAHCzwGOkeCTY3u/MaN8vqO/VwrSB2yMTLfxmXFsCCRJlM8qjU72Fp6DYtgJAuq6gV8nLGyvySpSK6XcZ0wjf1okpnckrePQ5r4uekO2Awu+F6xg/Go0UaxvKyDODiZgXn6sBMIn6YlAP+1mCTmxKVCTKPlTcYGv1JnHoYHLKOdQXTzw4cD6eYvPNOwL2s1usNdcWtpg5TW9o1OEB2fejP+xH4LY9cA6JPOUpA4qm6fIUI02zYgGAY36p3mY+dykbX/mngYoIdqV9TPmBcUphWXmZ0DGs/fsY9iQgJZE+thVAfjvQa1AabrNdVkUF2XlxPx5PflUnR6dqETBbagkIob2IMA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(36840700001)(46966006)(5660300002)(2616005)(336012)(478600001)(70586007)(8676002)(82740400003)(70206006)(15650500001)(6506007)(82310400003)(33656002)(54906003)(83380400001)(36756003)(316002)(107886003)(86362001)(6862004)(356005)(186003)(2906002)(6512007)(47076005)(26005)(6486002)(8936002)(36860700001)(4326008)(81166007)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:21:47.0183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ece854-6825-4fce-deed-08d8ffefe49d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2611
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB38928EC6CD1545801F530804E78742@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Describes the versions of Xen to be included in meta-virtualization
> and recipe maintenance in release branches.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/README | 50 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> index f286bb5..b9117f0 100644
> --- a/recipes-extended/xen/README
> +++ b/recipes-extended/xen/README
> @@ -36,3 +36,53 @@ as XSAs (http://xenbits.xen.org/xsa/). The easiest wa=
y to include those is to
> drop patches in 'recipes-extened/xen/files' and create a bbappend adding=
 those
> patches to SRC_URI and they will be applied. Alternatively, you can over=
ride
> the SRC_URI to a git repo you provide that contains the patches.
> +
> +recipe maintenance
> +------------------
> +
> +# Xen version update
> +
> +The following rules shall be followed to define which versions of Xen h=
ave
> +recipes in meta-virtualization:
> +
> +- Before a Yocto release meta-virtualization shall have recipes for:
> +    - the latest stable major version of Xen, and
> +
> +    - the current version of the Xen master branch (known as the git re=
cipes)
> +
> +    - In addition, there may also be recipes included for the previous =
stable
> +      major version of Xen, in the case where the latest stable major v=
ersion
> +      is new and the prior stable major version of Xen is to be the pre=
ferred
> +      version for the Yocto release
> +
> +- On Yocto LTS and the latest stable Yocto release branch, the preferre=
d Xen
> +  major version that is present when the Yocto release is issued must s=
tay
> +  supported and the recipes shall be regularly updated to follow update=
s
> +  available in the Xen stable branch for that Xen major release.
> +
> +- On Yocto LTS and the latest stable Yocto release branch, the recipes =
for the
> +  latest Xen major version shall also be regularly updated to follow up=
dates
> +  available in the Xen stable branch for that Xen major release.
> +
> +- On the master / in-development Yocto branch, new Xen recipes shall be=
 added
> +  when there is a new Xen major release.
> +
> +    - depending on the timing of the next Yocto release, the new recipe=
s may
> +      be preferred, or the prior major version recipes may remain prefe=
rred
> +      until after the Yocto release
> +
> +    - the recipes for the previous Xen stable major version shall be re=
moved
> +      from the branch when it is no longer the preferred Xen version
> +
> +- On Yocto LTS and the latest stable Yocto release branch, new Xen reci=
pes
> +  shall be added when there is a new Xen major release.
> +
> +    - The preferred version of the Xen recipes shall always stay at the=
 same
> +      Xen major version once a Yocto release has been issued, and shall=
 receive
> +      regular updates to track the stable Xen branch of that Xen releas=
e.
> +
> +    - When new Xen recipes are added to a Yocto branch for a new Xen ma=
jor
> +      version, then any older Xen recipes present, except for the origi=
nal
> +      preferred version recipes, shall be marked as not updated anymore=
 by
> +      adding a comment inside the recipes. The older recipes will not r=
eceive
> +      any build tests or be updated to follow the Xen branch.
> --
> 2.25.1
>
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
