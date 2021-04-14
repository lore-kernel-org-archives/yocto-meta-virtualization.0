Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web08.14886.1618414505439928524
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hB/Lmwz0;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIquoQZR4/2o8FLWO76YXGWJQmU+2EtqpTyLIyLc9iA=;
 b=hB/Lmwz0n6rngmy4hZCV6G1u4H/B70jIWKGDluKPD9kI3/eBOunWxY2CAlGIU4OzV1GCLEuy0q58RW5yOFECKJfFOwCJ9JkVAc6lPUL+bBL41PZfuaftWGkve6H+k4YrHQJAhU/6zPkHjblLiQtBrmfU/K2OOeUUBoKc8xxJpVQ=
Received: from AM9P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::33)
 by AM0PR08MB3025.eurprd08.prod.outlook.com (2603:10a6:208:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 15:35:02 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21d:cafe::a2) by AM9P192CA0028.outlook.office365.com
 (2603:10a6:20b:21d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 15:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 15:35:01 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Wed, 14 Apr 2021 15:35:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8198bb2b68e149b5
X-CR-MTA-TID: 64aa7808
Received: from 82b1b2c81129.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B21F5F4D-01CE-4980-AC2D-F71EFACB5E91.1;
	Wed, 14 Apr 2021 15:34:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82b1b2c81129.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Apr 2021 15:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9Xbh2kZ925YDzUJwUbvTwHhfxjHKNokE4FB/Xw6dUVlLXch4ETMFA/VcafgqYIZdVveOXaomgnCGb7aUVDdf72gA3KoaJj+qQONLx2vU5qZKys/3AX7MOhlOSdVdmw3NHz4IoMt4W10TbnfElty28jdJc3lf3LliAFO5ktZtGwMwU7YO4xifKENI7dGGWuV0Zj1fsEL0kczD1ikxXXFukk+WqwpCrvobPNPYnKMN/t1z029l97lYiLTNM31EIzv9gBY6+kovwkearGVSCicXFQ8MToY9x8vnc8Ql/dJizrgRaHGAjjkTvzzBL/arLpIrnj9asQSQqcAZljueAPcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIquoQZR4/2o8FLWO76YXGWJQmU+2EtqpTyLIyLc9iA=;
 b=RnWE7nQC32khH0xoAyS+k7XDB2+JhY5rGvS5ykeBFau6lU1NtN2UsmjFVEs4ltHA7r6cO/+Txx5qsoyJ/QuUwgQAsIhoM/hGeS8/S++773TBtZ4RTVRTrTBCxlRGBV7AZHFVhMkHhj4VjAoU80AlCQnH5LbZfMXO5uR7uiOaLXruUSq4DKMeYLLSxp6lhKHYAfQ9B6OAw/CygNE/ZrGaxxVyfVaCCk3weCbkeTXyErWh6PwIx2sg6RC3im20uJPhH1ktv+mlqKLnIH5Km39nyK9JqmN+6tVRdHk1KixFzmfS3P9SveeggVoM9nd3Q4ve/389HOT89vRMs2wASi6r0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIquoQZR4/2o8FLWO76YXGWJQmU+2EtqpTyLIyLc9iA=;
 b=hB/Lmwz0n6rngmy4hZCV6G1u4H/B70jIWKGDluKPD9kI3/eBOunWxY2CAlGIU4OzV1GCLEuy0q58RW5yOFECKJfFOwCJ9JkVAc6lPUL+bBL41PZfuaftWGkve6H+k4YrHQJAhU/6zPkHjblLiQtBrmfU/K2OOeUUBoKc8xxJpVQ=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3615.eurprd08.prod.outlook.com (2603:10a6:803:79::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 15:34:44 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 15:34:44 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Nathan Dunne <Nathan.Dunne@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] podman: Added kernel modules for iptables error
Thread-Topic: [meta-virtualization] [PATCH 2/2] podman: Added kernel modules
 for iptables error
Thread-Index: AQHXMQYSKPU4Ak8R20Sp6MJ6pjB0Aaq0JVYA
Date: Wed, 14 Apr 2021 15:34:44 +0000
Message-ID: <72DFA041-AF8D-42FF-A432-7B8509873BA9@arm.com>
References: <20210414081303.30312-1-nathan.dunne@arm.com>
 <20210414081303.30312-2-nathan.dunne@arm.com>
In-Reply-To: <20210414081303.30312-2-nathan.dunne@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8b93d52f-b667-4266-d382-08d8ff5ade9e
x-ms-traffictypediagnostic: VI1PR08MB3615:|AM0PR08MB3025:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3025D651C875124E55ED0C669D4E9@AM0PR08MB3025.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:494;OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3u2yXfKPj/vqPSqyVBBId2SD44S4IyDvfwozszJX+K5qMwP6Ex2L5J0AwvdecW44x19fuFy00vK6mIB+dwj5kQOQUKFCqMU09AG3QazVOorSoa2o3MW/XsEYT0gStRhdt+NJR5RezkextFwA77+2B2GbNCxkjF1Z6qp2GKMSHkX5EKYMygnt35YCcLD0RxXvzKy/2es3Xw3EBxsZIsC79OLoTeL8YxZBmvpjNSj6eSIZMBwlB2e9aFrwfFBLmTFNzo5RDRPGh6vgfPJD61yN6zQnOebU1+VAWZjZDKuIMNjZ/LMQIaDS8l9qghyGRc3nri49YL6R4Chayx9rNUWk2ouigonEbiFyEpox8hO5jOGXM22+iNuWSCmMvNKCVMnRZhoKar9jgOr6WxbQErKmWexRGaDkqBRorarC7cI2ZcpGdYo+jA9jWT+Ps2UmMXGP4JN0on8WINuwywSKqUJeNiwvQSzW1DeQQs6IU2WMlX1JWaka3yZ/5+r6eyAylj9TdUXPS4J5nSrB4Vgq4F/4yLVXJgE8g85x6OaIkdpror7yWyMYMHMIXeJPgn/PyJtod6MNifIyafWjwrKovotP9p3/js9xmLLyYMPudM0MUf6DTOJloiFIdYgOcdHGcBpM/74ZPqQ72DPdcHN33tAKA1fUZdnbSqY1OfqD3ezooUrL4vr04ez0nqM359+iqMI4F1q/cHtzHEzT1UGp3lq080/4yrYrVmz7FcPcu4pmq6w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(66446008)(66556008)(76116006)(66946007)(8936002)(38100700002)(83380400001)(26005)(36756003)(91956017)(66476007)(8676002)(6486002)(6636002)(2616005)(2906002)(4326008)(122000001)(71200400001)(86362001)(64756008)(966005)(37006003)(54906003)(33656002)(478600001)(6506007)(316002)(6862004)(6512007)(5660300002)(53546011)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?SmMdYSu6Xu55gvapFGTddS09yeI3Sb4Bg/W/j8SH7INlY3/SORLgEJrpUVcN?=
 =?us-ascii?Q?Rsb9XeH7xDlrUsxJ0F8ohDs9U9oEfWvKnSzxBpy+Uc2BZMfTAN5SeoxBJQ4l?=
 =?us-ascii?Q?yGBJkxmfpJUthmUMWMeOjRghWdAKcsI8GUnNKSzQwlEmC5gyfnq8mR7lyk7h?=
 =?us-ascii?Q?JEe1YecrAJhV5sY9CkiWmFTi8X/dkWk/HH3jdjh+sx8rTWKodKhA1LIzddnI?=
 =?us-ascii?Q?c2UyEeOZYzCKLWosxS2Jr/7EeLo6RVKaovJckvcuwtkFddN1v/UuAo9V1jot?=
 =?us-ascii?Q?lvClQuyuY20I0P+4cKcltlx8O6yPe7pHVDMRgtSaTyw2YY4G/PwUr2izDkdS?=
 =?us-ascii?Q?BSyXNlBJGqTFACb/wXtO1tV1oP+vt1/Y+f0yH3DAlslhqCnUdjzfik0TMYLL?=
 =?us-ascii?Q?P3BshKAz3zVT4vLhHLMfHnVS+GuTEWyxnUjI4WMVwfx18A/rFquSbbapE3RS?=
 =?us-ascii?Q?+kP+5rWuYwOphuqPz0zxmFJXq+wH8C2TeSl0S68ZJoEF4+zPBEpDmWhxuPOO?=
 =?us-ascii?Q?gdUPkvVgDcaFIoWInY0spzNo8e2jzQf1BA/FqqhL0zxdHo2sX0TuizJAv7xi?=
 =?us-ascii?Q?ie2neQZvDsTeZq+WDVGznEmoLOoOF+OYIR+73TzIKmcMrEeP0CqpCmayAtZc?=
 =?us-ascii?Q?wNxrRnwpvfy5POctaJLPIh9VpdlMGVeXis3EgdiPK574s8y/QzPY4Co15CTo?=
 =?us-ascii?Q?WQmHGUiONAbUEiLi6hX4wuQVSr7aiD9KygWxhdId5io+5ydQJhORG+AlAzCz?=
 =?us-ascii?Q?zImHvN7qG3Zs/0aRhnEWEc5qGerTLRq+ViL6Ii11T/6nNRrVb0bGQpCkvd4T?=
 =?us-ascii?Q?hkqb8U2rkqONZiB8+7IPl/Bsmzw5rDzZ/Q86wySd8quNLzro9prJxBqVqTy5?=
 =?us-ascii?Q?i1na9uh89slw8r+00/RVk88JDJi9FFD2t/1JB1oaMup6S5ogGIWhAHhgFqxR?=
 =?us-ascii?Q?/XnA+OrwIhTiRlyukkjJ55e/x/mM5dBEyWBcwwxkcGD3TUB8gkAQylhL7sCg?=
 =?us-ascii?Q?TX1ShR8VlfhX05Anjbs8PlerGyLZBSzi2bZy3KQLzseZIPDm/gGKpvvkCtTp?=
 =?us-ascii?Q?1az5qO/CklTKqeNPHnEDm47JC0oiYb8ZVOyJ2a3v0OPy2NShn9JYubq9g0Bh?=
 =?us-ascii?Q?GbB9T3tGafuIwC4bR3PnxaqF/gVTudHfABYHo0NsKBxKbUPjJSbzejRomHhf?=
 =?us-ascii?Q?DD5YNnVSEL+Tm0rWDS56vJ4PMuArg9Zu+bMDs9Mu+w2Gykb0tsFCbutWQHhY?=
 =?us-ascii?Q?UPN4GNWeySkYOKLwzKIywqj1cFQ8Pglag0FIsm+9FN9VRNezelq/ZVRd+uY1?=
 =?us-ascii?Q?RRMQwSzKJjnzGVRS3aCXEKUJ4NIIqvLiYUF6jkq7Ni5+gA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3615
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	97c96554-b04b-4b37-a001-08d8ff5ad444
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gKvk2qMc+n/q2pqZS+HGkpRjma0I+IMGRHglDd4tL/dhzuvuBC2z2+QTFAYUN8g01d75RyBM2Cm9+Ub8rQZHO1bVrW82dOdTxOh1FD+pW+92hFPKdvJpupWCc8uEdOWbdQx47pya0nAzl/yfl9ExkYhdffTZ3j8U/aFr7+SPhbsHJvYP5pV/ih47puIv8ZEwk8XpEj+8sUfOPzF3U4HNiiuPS1Rid91Ajv+zUjTm36+X8pnC7B+/+DEmfvZIzUtB2FkleEgP8U+Ww/vLjNHbSQr0OJdfVBtsK4XXIGxLAo5NGLF/8TokjgfeVvDNH/55fSikNH0VTW51oiFhKlIiwPBvl842xft5SU1hAh1bFkc6zqxqOwXx5SDHnpMdbsFBOrtMLSk74WG/Q0s4T2bMT79DBn5UcoYb3CTVIcG3qIT6HgbHx7y1yAquyr1yzF8YmWeQEI2Rh7+PuYB2UWlPwZrbNBOMg9S6qbCoj47z1a6Ekif1KikPtocsoN/SKhr9A46eLQT2FvB+xb28t0QGVKBJRW4wzmbQ4S21QpUhdVFMHgk5bvPC2YL04lWGBER1QU0RHlsFBShTwhDbk6EuDJx5XTufgOH0mK43iHyXwjF7n3fFjyrIZynUDhlfPEA3G8ZIjwECGBVTehx9ZBHbERNYsNW+cmfLEbuFtXStUvcg11S5KCAJgSHCAmB5bP3+Ns+0AymLVNMynH35VUXHwfD+mM2MD518VgbOw02Ogrc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(46966006)(36840700001)(6862004)(70206006)(86362001)(54906003)(81166007)(36860700001)(36756003)(47076005)(478600001)(8936002)(82740400003)(70586007)(5660300002)(2616005)(966005)(356005)(316002)(336012)(2906002)(6486002)(6636002)(8676002)(37006003)(53546011)(186003)(4326008)(6512007)(83380400001)(6506007)(26005)(82310400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:35:01.9165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b93d52f-b667-4266-d382-08d8ff5ade9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3025
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48804B1FAC80704E9A009FC617904D07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 14 Apr 2021, at 09:13, Nathan Dunne via lists.yoctoproject.org <Natha=
n.Dunne=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Added kernel modules kernel-module-xt-masquerade and
> kernel-module-xt-comment to RRECOMMENDS, to avoid iptables
> errors with podman
>=20
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-containers/podman/podman_git.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-container=
s/podman/podman_git.bb
> index 62ae024..6fb803e 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -109,5 +109,5 @@ FILES_${PN} +=3D " \
> SYSTEMD_SERVICE_${PN} =3D "podman.service podman.socket"
>=20
> RDEPENDS_${PN} +=3D "conmon virtual/runc iptables cni skopeo"
> -RRECOMMENDS_${PN} +=3D "slirp4netns"
> +RRECOMMENDS_${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel-=
module-xt-comment"
> RCONFLICTS_${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'd=
ocker', '', d)}"
> --
> 2.17.1
>=20
>=20
>=20
>=20

