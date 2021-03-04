Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.59])
 by mx.groups.io with SMTP id smtpd.web12.168.1614879433948755020
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 09:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PWvFPgYE;
 spf=pass (domain: arm.com, ip: 40.107.2.59, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaEbEP562o3lXZw9M950IplLmr8D6aIdhP3YrLlhIhw=;
 b=PWvFPgYE1XamjS7vaOcIyW6QAsja91sijrs2SzCEwIFc3S7J5jCdXImICmKV21h/iWs8lxfqbE7iJFEhqab54J8wopzc3Q9UIYGIr2/2eX1bO0s3Gd/MrPQ1vY8nVp5WbsvRGeNht/M5HNJ0zu1cmFMNNJjiD25sZe5YT0OZ8tI=
Received: from AS8PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:311::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 17:37:09 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::3e) by AS8PR05CA0013.outlook.office365.com
 (2603:10a6:20b:311::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 4 Mar 2021 17:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 17:37:08 +0000
Received: ("Tessian outbound 155e15b2e217:v71"); Thu, 04 Mar 2021 17:37:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db44a68958ab65b2
X-CR-MTA-TID: 64aa7808
Received: from de132d2a6070.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D2707CB-5F95-4C1E-9925-D1228643FE83.1;
	Thu, 04 Mar 2021 17:37:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de132d2a6070.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Mar 2021 17:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbmLzGlJpp2KuPaCfaiK21+e/Kj0hErBzYeK+99ggiqhtJR2CiieWwX4rHvYWSRY5PgXUy7Vim/WjZFckfaMPqhrgzPGJ16TMoM3S7VpBfIBIU73XLUZULRLBirEVQGYG4T6xANQuNrsjQj+6XmFfUiFpYjoOIGf7OBkwdKvOIvs5hgEgdfdzHeE/8ZS8UUODuBDH1uqizNhYiusrB6JQm1GJ2Qxb+raLUmeK1aVrrB8Soms1VRGkeNVW2Y/Ae9r3y+RgVJCNWJvr+RXhmQocn5g4mSPoamCRzjVHC6Ov/J/Q6AuKZutUwG1wkd21F241AM8wSpmaRrLk7uaccMhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaEbEP562o3lXZw9M950IplLmr8D6aIdhP3YrLlhIhw=;
 b=HvRwCFyKC3aK/q1g3E5SUGbPAkPcQNwWAx3fNfW5tQdIYyI8zFEOOzimVH5ONeWGq9VfwikvrBm2XVV3J1srBpaLeIK8UwBpItnYD4+q8leGtN3oca971xaTg1rHnS+h1iJTT01SuE3FEcqAjfCP6miDPoxxZiRixMXiiLmZAcQ6Bv9+gx4dhEnGZlZFDpxIJqanWJXkuq3wikeXWMjBw+dJoi81cUMVybFr/ZOP8ULmOccRleiGOu4iZezi7JgNY5y8d2Eo4ddv7wm5ZafzJtIx3gS9HgjW7/OjHdzOEiXDYLFer4i4mLTepGkiLRquTYSA0HEzi6Ay7o3MTpEDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaEbEP562o3lXZw9M950IplLmr8D6aIdhP3YrLlhIhw=;
 b=PWvFPgYE1XamjS7vaOcIyW6QAsja91sijrs2SzCEwIFc3S7J5jCdXImICmKV21h/iWs8lxfqbE7iJFEhqab54J8wopzc3Q9UIYGIr2/2eX1bO0s3Gd/MrPQ1vY8nVp5WbsvRGeNht/M5HNJ0zu1cmFMNNJjiD25sZe5YT0OZ8tI=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 17:36:58 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.022; Thu, 4 Mar 2021
 17:36:58 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and current master
Thread-Topic: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
 current master
Thread-Index: AQHXBgePIItmbU+MdE+eSLqW56Z0N6p0LeOA
Date: Thu, 4 Mar 2021 17:36:58 +0000
Message-ID: <B6A0774C-AAB4-4239-8791-5AD3E0C7E96C@arm.com>
References: <1664DFE1A4BA4F42.31496@lists.yoctoproject.org>
In-Reply-To: <1664DFE1A4BA4F42.31496@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d77abd40-a837-4b77-80b4-08d8df34229c
x-ms-traffictypediagnostic: VI1PR08MB5503:|AM4PR08MB2851:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB285134403EADC5365178315C9D979@AM4PR08MB2851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ivU7RBs+VLLurtDwem5JgkuKWgdR7aWP0t0tD82xSU/ey0SyWPk6c1fFgtwWdZiWGWeccIyLjVvhbqxws9pQX0W0uzsGl30PD1Eon9zoGTHSNhBcqgP4BLEf3kyZSNBDUfUa7a7/xmnv0+B0UFI+y47wshzSQvuuxtuBJzbW2c7sh6DfIIntQ6ujop8wq9JLXwtLXZ4gDuHP6VpgZfbyFGgUhdmEMX8eT+JH0Bvg9mcYCck6KrnHwNz0kxsMDtZELDspvLm1eWqA0JxVszE1YoPv9AF7ITQZuMirZsU9eiftaygI/iBjLBN709STw2Tul7dv7+L+biYX8Vd9Y5gw1eujV6Km3b6/3DXq+jLqVwkgVlBgW44r+g+QA6aVZfjTP8CpIiNlewxvZSGPEBtcxB5Cluz8une1mbK2Qi61pNr0MSDytdkeuAlX8mGm8sM+R6+hU/4p7g4xK5uyf6oP9he3w9MZm8EgOXYKur4QgZkij6f/tCvWINXjJQqvr52WDkuIcuYuohoevCjENiXwvICcf4UBzprvnlyxB8SQaRSZ4boD9dwnCu6oHfYzwpk4wFkxda4KPAoBBU4z7BsPbkHOtnldmt4iS15fbZgyD8mHa/UEM7CSws1yBPZ6S+6w6B23ScSWyqFr0R7Lm1KohA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(366004)(376002)(76116006)(91956017)(55236004)(26005)(66556008)(66476007)(66946007)(66446008)(33656002)(6486002)(2616005)(64756008)(186003)(4326008)(6512007)(110136005)(2906002)(316002)(86362001)(83380400001)(53546011)(6506007)(8676002)(8936002)(71200400001)(478600001)(30864003)(5660300002)(966005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?pwhc/PtPQ3spIY4U69WTv9FBbzRt25e29qdMbiF7rgJd2b9s8KuaIoGeyNXa?=
 =?us-ascii?Q?Jxh/WyKlXa1TZEhI0+i1L7YQ4T5BW9hLpbgTAYC5A93ksO8TLTKFKLMkwWOK?=
 =?us-ascii?Q?8uti2Gz1Ltr6D0piSpBwUPUGSYVEt/4l6Ds+qinugSaR0DfD3jN1MXdje20R?=
 =?us-ascii?Q?vbNmunBOc9+LMfT85ggE1vV8Tip7cYAgQiiNG9MbIMRsHZOwKohBA22tMUgp?=
 =?us-ascii?Q?ZdmQn0onxBSr4Cy1va8hHQ1Uw6QjBPfIN9FpPwvvvhOqdoiWu0tWiSWmfodj?=
 =?us-ascii?Q?Vsg/v92sHA0NeNbeoGXG+jQPMh+OUBIzjwwpQBeA5uOdTyk5IVww33LFXbde?=
 =?us-ascii?Q?a/aOJGKmJFYq15igrASq0TY2hX2YrxeftF+ascE6GhIEiMdIGi1c+WJijq65?=
 =?us-ascii?Q?dYkmmGAUTx+0M+scKwNIAfykR7beuUoon7gfBQYhjr+b+8lMyxIgzs2XIxJg?=
 =?us-ascii?Q?2tLkWIQi2qoK77hSH1h26HcY4/7J8DwVyIF68XenGB+u9Mb6VXsEoilMIIjZ?=
 =?us-ascii?Q?V5ATpTstwL3vjRykNS7Ia59dQc9a3JO2yTRaGS2REFMYEmAJ0+bMMxeRBUQC?=
 =?us-ascii?Q?PEyrH2wlxxZkAT8Mh7bbpoAorsadUhDCgUladeRLFEwifxawRnYC65Wo3ieq?=
 =?us-ascii?Q?T9UzzhQva30sfZWg7L6d4/cf+u7WYRppmCqOcku+WjPdh32YyQJl+Y/ffmzR?=
 =?us-ascii?Q?Cu3OCnj1jwXLcqYcgo+9B6NJDMyqs2igJsU4lUy9wbfnMhzgvBZ30yIgR8Tj?=
 =?us-ascii?Q?xvCGJftFmLbylZLbzkxQTso7ZLppUodvlaB3kWLThLgExRlvzQd3//ye3fdf?=
 =?us-ascii?Q?v1iqf6xk4um0X8e7rKo66sPYOdGLex4FroPOeC6AAetCT5F0IFbJieG3/d2x?=
 =?us-ascii?Q?WbC8xyH+ePLPzRdDrRw7chBmksG8pL905XgUMgWhRDT5EL0znS+30tB/aR2K?=
 =?us-ascii?Q?WljD/1nrNeHMuVVfBaiGqxDVcdeBhuOR4gX7Ik16y+3fJFU3zXL+aqBWWgH2?=
 =?us-ascii?Q?/mQZ1DBsaq6DbTWNB3KFpueqj+jbF+T7ddZVUkU849V65xIPeGKO/eWTdt/O?=
 =?us-ascii?Q?pwPt2zyU9L/AJ/oV/5sfKUF2jgHXncMZ8mYRBqu+Lzt2w6y+oDVa1XNPwE8y?=
 =?us-ascii?Q?9eg2oCAl0EGySt5zaceGZsSBaPG5MPKtCQLFZ/I9pEHycJ40W1b0w9aT6RR2?=
 =?us-ascii?Q?GZ+oy7NCVL13YW9pDsFZWkwwrEERJUeGRG5tmoOK37iHheIXr8zsMrKppPWq?=
 =?us-ascii?Q?/ZMkfoj3f1/bVsk6/ip3Uss/1QGgtl87hGoQMmKskwL2PlDn/yhjX/HgaauQ?=
 =?us-ascii?Q?9gYE0ed8TFa4hzids4Mk9Png?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5503
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c31e3cb0-d28b-4491-b2d7-08d8df341cbd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NPSUKYcB5TzvzB0emhHQjHOSYJtLeFnHdukp28nA4qLNefJ9YaENCmQ4WMP24S//qu1h8DGn0SA3RTyC4hDOIseEMytGXSHS0SeM/LntVyMV8CgF/QWarQAntvB8UCw8+XrdDiNfJM+BggFPzgOK60OmtEUNCzh/HlNeEvqj8wo8WP+S7zKpIS/69GdoHUIfGAGPlwpD30cLkdk6Zvo29EPb5kSz8hII77AM6Mil8a907gTZDjKos7FABDZRqovek4GI02HaLs3P7Kjix8/Lk+5GQJN71ykrWEgDU04V1BszN3Y45cETXtSKLgfRyGy7GoNg26429j4TUTw1JKaxT8do0IlbnLZjwATy2T1fp3tmQA1VUmH6smAe72kl/mPeWAQyZugYC5oMBT0mDmeD8pkfWR3YtLXG6mvglt62q6ZzxT2Kt8eDBa8bAQeMuQrjZABmXGJF/8c4CAMn3BDhCcMMhFr1AQCB0BSLk6J0MpvskCW6QRmbudsxrYQImyCKUIAqGUSRkY2GXDTMv21S/2DIiF5LWrDilUKYSH4dem1BWD+hQEP62iobLUOOPaX2D7XYrIhhtHqytHNvf+FJ2eYwizI0WjneUitELjjfiFF5afqMNrpshNub7GKpF0UpeYDoI4wSEZsoybRd9U69qW1qxfodA1AvYsbXMuRiqTWNAsaO90Hlu+hyI4GzP/Az2KwPH5LFB6tmR7VzbLbLQ2sDxCgT7ztiC2QWsKicCqI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(346002)(36840700001)(46966006)(36860700001)(53546011)(6506007)(26005)(4326008)(33656002)(186003)(336012)(6486002)(47076005)(5660300002)(110136005)(86362001)(316002)(8936002)(2616005)(6512007)(30864003)(966005)(55236004)(478600001)(70586007)(36756003)(70206006)(83380400001)(8676002)(2906002)(81166007)(356005)(82310400003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:37:08.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77abd40-a837-4b77-80b4-08d8df34229c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D5358F40825AC84E915B2A0934C30D4A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 18 Feb 2021, at 15:05, Bertrand Marquis via lists.yoctoproject.org <b=
ertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This allows to remove some patches related to gcc 10 support which have
> now been merged in Xen.
>=20
> Xen-tools is modified to include the latest tools installed with Xen:
> - a rename of the bash-completion,
> - a new xl example,
> - xen-access,
> - xen-memshare (only available on x86).
>=20
> A new patch to fix python and pygrub is added as the makefiles have been
> deeply modified in 4.15 which require a new patch (but doing the same).
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

This has now been reviewed by several persons.

When do you think you could check and maybe merge this ?

Cheers
Bertrand

> ---
> ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 +++++++++++++++++++
> ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 ---------------
> ...uild-temporarily-inhibit-Werror-4.14.patch | 26 -------
> recipes-extended/xen/xen-tools.inc            | 14 ++++
> recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
> recipes-extended/xen/xen-tools_git.bb         |  6 +-
> recipes-extended/xen/xen_4.14.bb              |  2 +-
> recipes-extended/xen/xen_git.bb               |  2 +-
> 8 files changed, 92 insertions(+), 95 deletions(-)
> create mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.15.patch
> delete mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc1=
0-snprintf-warning.patch
> delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily=
-inhibit-Werror-4.14.patch
>=20
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTIL=
S-xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTU=
TILS-xen-4.15.patch
> new file mode 100644
> index 0000000..35cd9a8
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4=
.15.patch
> @@ -0,0 +1,73 @@
> +From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 2001
> +Message-Id: <6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.be=
rtrand.marquis@arm.com>
> +From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +Date: Fri, 19 Oct 2018 11:01:37 +0200
> +Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py arg=
s
> +
> +Upstream-Status: Xen: Inappropriate [oe specific, python install issues=
]
> +
> +Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> +as well as other parameters set by the OpenEmbedded build system.
> +This is especially useful when the target libdir is not the default one
> +(/usr/lib), but for example /usr/lib64.
> +
> +Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +
> +Forward-ported to Xen 4.12.0
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +
> +Modified to support pygrub installation with python 3
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +
> +Forward-ported to Xen 4.14.0
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +
> +Forward-ported to Xen 4.15.0
> +Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> +
> +---
> + tools/pygrub/Makefile | 7 +++++--
> + tools/python/Makefile | 2 +-
> + 2 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> +index 37b2146214..ffb9270065 100644
> +--- a/tools/pygrub/Makefile
> ++++ b/tools/pygrub/Makefile
> +@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> + all: build
> + .PHONY: build
> + build:
> +-	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(=
PY_LDFLAGS)" $(PYTHON) setup.py build
> ++	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=3D"$(=
PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> +=20
> + .PHONY: install
> + install: all
> +@@ -18,7 +18,10 @@ install: all
> + =09CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
> + =09	LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> + =09	--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +-	=09 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> ++	=09 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force =
\
> ++	=09 $(DISTUTILS_INSTALL_ARGS)
> ++	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> ++	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> + =09set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> + =09             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> + =09             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> +diff --git a/tools/python/Makefile b/tools/python/Makefile
> +index cc76423647..5cb11ae453 100644
> +--- a/tools/python/Makefile
> ++++ b/tools/python/Makefile
> +@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDS=
HARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
> +            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
> +            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
> +            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
> +-           $(PYTHON) setup.py
> ++           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
> +=20
> + .PHONY: build
> + build:
> +--=20
> +2.17.1
> +
> diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snpr=
intf-warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10=
-snprintf-warning.patch
> deleted file mode 100644
> index 0a136c9..0000000
> --- a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-wa=
rning.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00 2001
> -Message-Id: <0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.be=
rtrand.marquis@arm.com>
> -From: Bertrand Marquis <bertrand.marquis@arm.com>
> -Date: Thu, 15 Oct 2020 10:16:09 +0100
> -Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
> -
> -Add a check for snprintf return code and ignore the entry if we get an
> -error. This should in fact never happen and is more a trick to make gcc
> -happy and prevent compilation errors.
> -
> -This is solving the following gcc warning when compiling for arm32 host
> -platforms with optimization activated:
> -xenpmd.c:92:37: error: '%s' directive output may be truncated writing
> -between 4 and 2147483645 bytes into a region of size 271
> -[-Werror=3Dformat-truncation=3D]
> -
> -This is also solving the following Debian bug:
> -https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970802
> -
> -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> -Acked-by: Wei Liu <wl@xen.org>
> ----
> -Upstream-status: Backport from 4.15
> ----
> - tools/xenpmd/xenpmd.c | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> -index 35fd1c931a..12b82cf43e 100644
> ---- a/tools/xenpmd/xenpmd.c
> -+++ b/tools/xenpmd/xenpmd.c
> -@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
> -     FILE *file =3D 0;
> -     struct dirent *dir_entries;
> -     char file_name[284];
> -+    int ret;
> -    =20
> -     do=20
> -     {
> -@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
> -         if ( strlen(dir_entries->d_name) < 4 )
> -             continue;
> -         if ( battery_info_type =3D=3D BIF )=20
> --            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_P=
ATH,
> -+            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_INF=
O_FILE_PATH,
> -                      dir_entries->d_name);
> -         else=20
> --            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_=
PATH,
> -+            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_STA=
TE_FILE_PATH,
> -                      dir_entries->d_name);
> -+        /* This should not happen but is needed to pass gcc checks */
> -+        if (ret < 0)
> -+            continue;
> -+        file_name[sizeof(file_name) - 1] =3D '\0';
> -         file =3D fopen(file_name, "r");
> -     } while ( !file );
> -=20
> ---=20
> -2.17.1
> -
> diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhib=
it-Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporaril=
y-inhibit-Werror-4.14.patch
> deleted file mode 100644
> index 0e0a3dc..0000000
> --- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werr=
or-4.14.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Thu, 18 Jun 2020 09:05:22 -0400
> -Subject: [PATCH] xen/build: temporarily inhibit Werror
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Rebased on Xen 4.14:
> -Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ----
> - tools/libxl/Makefile | 2 +-
> - xen/Rules.mk         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> -index 6da342ed61..c67560e269 100644
> ---- a/tools/libxl/Makefile
> -+++ b/tools/libxl/Makefile
> -@@ -11,7 +11,7 @@ MINOR =3D 0
> - XLUMAJOR =3D 4.14
> - XLUMINOR =3D 0
> -=20
> --CFLAGS +=3D -Werror -Wno-format-zero-length -Wmissing-declarations \
> -+CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarations \
> - =09-Wno-declaration-after-statement -Wformat-nonliteral
> - CFLAGS +=3D -I. -fPIC
> -=20
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/x=
en-tools.inc
> index 0c69fec..722c503 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -234,6 +234,8 @@ PACKAGES =3D " \
>     ${PN}-xl-examples \
>     ${PN}-xm \
>     ${PN}-xm-examples \
> +    ${PN}-xen-access \
> +    ${PN}-xen-memshare \
>     "
>=20
> PROVIDES =3D+ " \
> @@ -633,6 +635,7 @@ FILES_${PN}-xen-watchdog =3D "\
>=20
> FILES_${PN}-xl =3D "\
>     ${sysconfdir}/bash_completion.d/xl.sh \
> +    ${sysconfdir}/bash_completion.d/xl \
>     ${sysconfdir}/xen/xl.conf \
>     ${libdir}/xen/bin/libxl-save-helper \
>     ${sbindir}/xl \
> @@ -642,6 +645,7 @@ FILES_${PN}-xl =3D "\
> FILES_${PN}-xl-examples =3D "\
>     ${sysconfdir}/xen/xlexample.hvm \
>     ${sysconfdir}/xen/xlexample.pvlinux \
> +    ${sysconfdir}/xen/xlexample.pvhlinux \
>     "
>=20
> FILES_${PN}-xm-examples =3D "\
> @@ -692,6 +696,16 @@ FILES_${PN}-xendomains +=3D "\
>     ${sysconfdir}/sysconfig/xendomains \
>     ${systemd_unitdir}/system/xendomains.service \
>     "
> +FILES_${PN}-xen-access +=3D "\
> +    ${sbindir}/xen-access \
> +    "
> +
> +FILES_${PN}-xen-memshare +=3D "\
> +    ${sbindir}/xen-memshare \
> +    "
> +
> +# memshare is only built for x86, so allow empty package for other arch=
s
> +ALLOW_EMPTY_${PN}-xen-memshare =3D "1"
>=20
> INSANE_SKIP_${PN} =3D "already-stripped"
>=20
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/x=
en/xen-tools_4.14.bb
> index 73a52bc..a79b41d 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
> +SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>=20
> XEN_REL ?=3D "4.14"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
> @@ -6,8 +6,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> -    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> -    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>     "
>=20
> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xe=
n/xen-tools_git.bb
> index 1f6be1d..71850ee 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,13 +1,11 @@
> -SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
> +SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>=20
> XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "master"
>=20
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> -    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> -    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>     "
>=20
> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen=
_4.14.bb
> index 91e8988..653e3b6 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
> +SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>=20
> XEN_REL ?=3D "4.14"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_=
git.bb
> index 57791fc..2b62c5c 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,4 +1,4 @@
> -SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
> +SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>=20
> XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "master"
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

