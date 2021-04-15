Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.52])
 by mx.groups.io with SMTP id smtpd.web12.4519.1618478370966285059
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ky+I+Jdq;
 spf=pass (domain: arm.com, ip: 40.107.6.52, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bd2piihg+CQyHNyYcy0S2iULZXy167eX4wTfUFHufs=;
 b=ky+I+Jdq2n358gTlQOop+Wjmxq2TOUCJqTubrZkeLzMBXHsipwOyC3sdsPh/4ctZprUFFvt2v+96YoP3Lv1mu0D1V1KVZQS9GoiZcLbqxNCvFIhf8IsMlosHvMnkvFVu/G2uVPxEJ3GQ9GYO7bm2qp7jGJORzQ/aJN7DJOY9dYU=
Received: from AM6P191CA0091.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::32)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 09:19:20 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a2) by AM6P191CA0091.outlook.office365.com
 (2603:10a6:209:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 09:19:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:19:19 +0000
Received: ("Tessian outbound 47ca92dabae7:v90"); Thu, 15 Apr 2021 09:19:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb25e9b263bf4f56
X-CR-MTA-TID: 64aa7808
Received: from 526142291a8f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24DA41AC-C4E8-4844-B76E-B3FD21B695BE.1;
	Thu, 15 Apr 2021 09:19:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 526142291a8f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVq2DLDPoXokFdafsXBdcMEpG868gnAtEtBHTNyCOcfvncrRgLUBzwinA2/C6axxvbrHArUuO2RyUDUb+hpJTv7CeM/nutWR5IN3fDs6I85fHU2KSIcRxmszPMAMZgFU7TPkawLtAM4cTsnuD2x48mgepsaC7W+Vv4cBHJuIKVUtkKccuvkxFze1X6dRXvzp/wtyF/VniwEQjIcR9ckxs5c7W/JvIRUx+9ON2G7T23ill0N4aQel8NaqoIC6U/ftZD7SMHNzJh+1px9PmcSKcu1xb8W4Id0BxEm+vYsSxJwlcJENEAKdwvkUNcjJX/xNmtoXUugruPlLa2l4ovIBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bd2piihg+CQyHNyYcy0S2iULZXy167eX4wTfUFHufs=;
 b=btMrqabQAIGvLk4BS8W4kc9Mr960CLret/aGwhwBM61mstBC75fSGHmnBShRp2z5jC3wrPUWstensmDow8b6L4v3xzdKrcAcurt+FfQ9s0xIcY4Vu7XKRPYKb8yRl076Y8nBTNF7OqjiQNg3+cVtvD0T7sR8FD0mgnBTAZm2zJQxFOCHWgmSQl28ysNI1mEgXf06RLfaT4ZGTS+pc0xJTJg+JB03bbGeHLR6uw4h/XHe+2D7AoTpL42M+YfUzmnqm5ZgWs83/KT2LGsLh167VB+FU1t3CT8WwtdAxU7Okrv3gVbBJB2xErHCkcQk9dZusba8ug4Atn3zMZLUq+y+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bd2piihg+CQyHNyYcy0S2iULZXy167eX4wTfUFHufs=;
 b=ky+I+Jdq2n358gTlQOop+Wjmxq2TOUCJqTubrZkeLzMBXHsipwOyC3sdsPh/4ctZprUFFvt2v+96YoP3Lv1mu0D1V1KVZQS9GoiZcLbqxNCvFIhf8IsMlosHvMnkvFVu/G2uVPxEJ3GQ9GYO7bm2qp7jGJORzQ/aJN7DJOY9dYU=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1983.eurprd08.prod.outlook.com (2603:10a6:800:86::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Thu, 15 Apr
 2021 09:19:09 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:19:09 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"martin.jansa@gmail.com" <martin.jansa@gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/6] xen-tools: fix 32-bit x86 build by setting pvshim configure flags
Thread-Topic: [meta-virtualization][PATCH v2 1/6] xen-tools: fix 32-bit x86
 build by setting pvshim configure flags
Thread-Index: AQHXMYd/M8D1kl2mNEWsltfHz+kHB6q1TbiA
Date: Thu, 15 Apr 2021 09:19:09 +0000
Message-ID: <9C7E16B1-685E-4ECD-BF35-FC4500FA01B7@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e7a77088-9be0-4526-2938-08d8ffef8c9d
x-ms-traffictypediagnostic: VI1PR0801MB1983:|AS8PR08MB5910:
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB59106A50B9785505839DD05A9D4D9@AS8PR08MB5910.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X99eIoWz1xvMbOckZeO4dAEvhklI/afngR/PXg2E/7KbenFS25XqOSrS090X4r4iM7hJT2MVOwOVStQXA5+jEQw+U9Tv5w+PfH7mubG+y/S4rGZzXbKZF7qHh+TQj6tFy3MvXCOF7ChL7k11yNraxWVHd45mZVCcwRqgme8Ei6Jk1saKxzyw7DPtOsC7gWeAcYr8hqUYqSM5wAJK8mv0U0zvyWA8LC59RqkgphK5oNeLOWm0dJVJ52oZOO6TUlCI5bMSmb1AGawB2ZAVwluFbkH7VwzcypwNk1f5ViRZZZ1RfaFfQL93V7NcdJ3Gzypw3JLGAQ3j//dZfalXmOvirK7m0FAHSr40WJdZXacwtj5iIUmkwVYG/CpqKCYLlJpyBSSHKvvNeTmRxNQpDUS7DVKJ2AaguLJ038nrPsj3cfFavPmEu1dVo4RGxOv2p1qpDga/1qeB3qNuy/8+8Bd7IHsMLkEzlAxWXnXtXNx24wdCTPZeBEDRhw1r/hD/wPpFbvU2kuiO3bi/iD9BVIUSCUH7cq+kncG3FBeuwKqVe4V2a0x4jP66S+3yinNWthTIDpnlUsvzxuVaRSj5kLBXi3LBqkaArI0KcptRWPhFDbW1ri/0KqJ1zsvexD2QBNtxkI8NAFV7fcw5GsdNJgY/ncoHY+jxBveVJw6sM4qWp5Lctc3O4TtMlhIMNVUCngV+5cHUqgK5KXuh3KXMXnqnIibPBCBSEiDoazlLYnEoemM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(6486002)(66446008)(6916009)(66556008)(316002)(66946007)(36756003)(966005)(5660300002)(83380400001)(71200400001)(26005)(38100700002)(122000001)(64756008)(478600001)(76116006)(54906003)(2906002)(6512007)(6506007)(8676002)(66476007)(4326008)(186003)(53546011)(91956017)(33656002)(2616005)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?JXFsiEPsjW1E6tKTBMERTEGZWTLCRosQCuLWUEC4H79m0scloD1Rt6LAiGTZ?=
 =?us-ascii?Q?pWBW44PyQr2AWGHzkqyXc/IXM7P8/BbYKegIElHCz1P7BLy1Gfh/de2b5Dif?=
 =?us-ascii?Q?ZdH8yWGX/0MFbbAQ6Wkpf2d+rDTPqYlsXpXfFxeFvbsp6ZcR3YjzrA4HulGW?=
 =?us-ascii?Q?x6vzda7OTGX5GEYwFgkzkKb1UgpipPgGmgeymLPSgbVkJ4S9O86a7ZUqYb8a?=
 =?us-ascii?Q?m4ezsefShVRpH2Rzud5mV0iHiKRPbx1/fuDUll2z2xCMBXF18VswXHtQlPg+?=
 =?us-ascii?Q?tMSgtctPBF+0l6UjCXS5WZvHm6EbJBhjclolBpQ2joUsoc/m8ViXy+72HDAg?=
 =?us-ascii?Q?9lZGpezzVtgQ7ZzSsYyiTC+UTqmHG1zpFuY6MjumIpbSTOFbiPYUCZ7Oyfz1?=
 =?us-ascii?Q?bg63VoI5xcGfie0T689K1uFnWQrH0t1OFc55QNpJnjSeajAojA1fO6voGtu2?=
 =?us-ascii?Q?KrP0wPt7e2er+TMlvQDA0tuydDvNS2n5qzqp97QfUXKXAQN8GPJ+KF8BxNfG?=
 =?us-ascii?Q?Y4k3ej4sQiqkcQb10ZdeF8UcYWMpCA8C4fSwxI3xnM/3BZ0MWApHVWWvU/vW?=
 =?us-ascii?Q?w0rF6TPaN9GGcxxqty6/SSoLvtqsZxdhbjtr2U4MnGcg/DDsdC3gEYEeevFs?=
 =?us-ascii?Q?NDkJFp/WQ5Mwy9P8OTp2a5yt0uCbLeC1KyUFbRENnOy8Etud5oXMqqlWEgFi?=
 =?us-ascii?Q?fIh+AyFjMJjnQ1L1kXiJvqfqevFNpwbMeRlGMd7vJ1+yCONCTcoZwu+zWHRi?=
 =?us-ascii?Q?E4GEL+m+hgLGsD2NOdHU9dzYw7yRuYznbhZxCexBQqVV25AHAwcvEcRtaN77?=
 =?us-ascii?Q?1GXoe0hy27JAD/UTDUBYj4asIJG+bg8Q0jagY2q4fXXM/+PHn/D7AQRkQQqd?=
 =?us-ascii?Q?PDvq/lMVdXwDsAkecwmk7XuENOb0AuQ8zj+rM0rm5d4FePMKeCFkL1VNNtYd?=
 =?us-ascii?Q?ofG3Ejkj3dG4o3snubiOYyMRBgd7EM1weywhZnDaUP9puPWdlhSX6MyBqOdr?=
 =?us-ascii?Q?7JN4PVFmNgkXliK4ClSjczvrIF3HKaLMCMfERQFktlmYuF0ko3Ao39IR79my?=
 =?us-ascii?Q?kA8op6mGlx6ap6yDKQSPuTe8NIp2bG8PIMrVoTlvfyWIaphq9yCPNWCD7q5w?=
 =?us-ascii?Q?NAjsC6P+tKHujx1oKLm/wvAHyKQehbg6uv6Hw4w27HE5+gvQYHlfU7mp47Vi?=
 =?us-ascii?Q?8YfQQF3O+Jlpl84rFONZLmfYmYoMCzZRxe49gIWIXcY+Nc/B39gFpSGAxune?=
 =?us-ascii?Q?AfJL5nNtRvjJval/lZdZ52QeKt2v1LzJ0s+ztp4LnLglYIp+Fh8EKYMuW2Px?=
 =?us-ascii?Q?LtLnvFhejyhB+33ArRKSm7GMUD4NwF5IomIinp6kel/SaA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1983
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5f65549c-1281-435d-8c9e-08d8ffef86f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S152Rt9NAC0IpDwhPN57nLTzynaHObHFU4VEae4StjSyF0ho8PKIIC9t/wtrLZkSlEuPLZ5/WvATInZV4CpwIDxL6ZFaHnN642o9mYdwCTwpN38brZ8EvOm7nyaR9x3GHc5yIA4MC6wMoIz3RfMkDjJRN8A6yUVGrygv71VKqs5QC3ClTpgxj6YJfzXl4RN7Tsth0cSJm5nZz/MNQQGbZnWW0j6xJdZyDyAwZWeCReOqNxOQJNE3ZMkpflens/s3+Ew6hcYicb5zEG6f0wXaxLFWqEaGd4raLQBsvuLwW8P/kIdlO2HGARSqi5FhzXPeDSj92bxw6Ms2AWAnAVZa9mUHEHjFUnvYisVQohTLLsVIhdbyOjYKa6H9ztmRu7KL40stcgR046w6DYShfRPQvvus/CNJmhD0wMN57SVw18UioRy/zL7hDDzzAv9KA2d8VVrwHNFjZBI94ZeHHnFkuf+8Qh78s7GfP0ArDN4BG8QegjeoFin6z6BwtFEAigWNx/tv3yFWqWN2FzgvpZR5rIwuyxEu19sED0B+r+OqC8Pnt2RGBBT7kIYLX7/FyiK8tM7gYgL7LuNRW4hKn2nn5iL9cfyZ6LiNVBTjJKMcSedVdry3UUhIzK2CjjhNzrHzNHeW7x1y1PhwHfwgJTzIVKVHAdLx57hD0bSmzoZBmsoZMzJoeCITajlEOopMGD/sbkDaR3DugISzhUDW5Rt5TYY+4WsWIxbVw0traZFNsVA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(36840700001)(46966006)(186003)(54906003)(82740400003)(356005)(336012)(26005)(81166007)(2616005)(36756003)(478600001)(70586007)(70206006)(4326008)(8676002)(6486002)(8936002)(5660300002)(6862004)(33656002)(2906002)(107886003)(966005)(86362001)(6506007)(47076005)(82310400003)(83380400001)(316002)(36860700001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:19:19.3058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a77088-9be0-4526-2938-08d8ffef8c9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B07FD32F0B10748BBDB622E87B52DAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Enable building the PV shim for x86_64 only.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen.inc | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9e8fcad..2fbdb3a 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -125,6 +125,7 @@ EXTRA_OECONF +=3D " \
>     --disable-rombios \
>     --disable-ocamltools \
>     --disable-qemu-traditional \
> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim'=
, '--disable-pvshim', d)} \
>     "
>
> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/v=
gabios-0.7a.bin"
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
