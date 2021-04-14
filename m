Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web09.14964.1618414472181705513
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=n8pldjde;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+W2po+gXHARDf2cpUuveBBhqfdT52lQp+entJyn7YM=;
 b=n8pldjdemHr7Y4cixFogFHJWUG7d4rY9n6DZJJCrxhFfAXh0pjE2NQ60u01U4ENKmKGSK8+csDe6j75WUOKa5PUXsQnzqWobsW9F19RZLVR6O+tqE4cVSiNfyFfw5DOqWSmKrkU9c7rRiqapciNkMASOSDxe8BcP1hYa4zm8Chk=
Received: from AM6P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::36)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 15:34:29 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::33) by AM6P191CA0059.outlook.office365.com
 (2603:10a6:209:7f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 15:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 15:34:29 +0000
Received: ("Tessian outbound b610e7b4d771:v90"); Wed, 14 Apr 2021 15:34:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d36e04fce16f1e89
X-CR-MTA-TID: 64aa7808
Received: from 4576a2665467.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B9D43AC8-DAC6-49ED-84E0-217028A99D97.1;
	Wed, 14 Apr 2021 15:34:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4576a2665467.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Apr 2021 15:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eezAjuf3Kyz/VuHl09gIUzlTa3l5JjrxQ/4AFP3wx1fGyrlPG3wEqnHT1rSLV5B5+Ee4iXCLgvaD/ru+3Q7DkmKobZ21ogf7wy55eHwDiM/GmvZzaqw4xgKgnXSf0rzy2BmQ4mZD1W2aAAN8AfZ9drOVT+Z0Sx3L7g33i82y4z6lnFNf0SMIxYRa7Sb9nXhxXg9KZLPgh23Y6+W9EzO0vRAxUpm+gw0zLYUkcaGBNGSb1/TaA+3mXmMGOGkreuM7IcnsKt71gi/N5ER/z3GG2+51C+wCRMaLNYtRPVE40php4ICiriEYJyOJBO4JrHGeeRnyRteHU+EtewFHARapCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+W2po+gXHARDf2cpUuveBBhqfdT52lQp+entJyn7YM=;
 b=nW6Y9MH+oAbk4APch7RV249gLDLG1BvwhWsfQhuuoGsjakdkTci9bfE+kkE3Gbqqt6Sg8qg0qUYEoovtIHubSNxZ2lMmKN4yWUXbEbhv5Xek1t96/7SXXMduG6Nd/ENCMs38zpZ1/AA15UqJk1Kf2W64qVSUIo0HEXdjzCzcJDCiLMzLvWfIZMVHxnUzzBw0EaBQCuGVD5v7ToSXH9+CO5+VHSgT+vZ/bUg8k1+995UqAscefcDbf7IFgSbZzRchYzoV2jeDZLvUJUOwZUIBGhy6vx2W6EsdUeZyzgMCww32s0Or2BVjf00JEdYjAiHV12vvi/YWnH3jqeetHJ85JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+W2po+gXHARDf2cpUuveBBhqfdT52lQp+entJyn7YM=;
 b=n8pldjdemHr7Y4cixFogFHJWUG7d4rY9n6DZJJCrxhFfAXh0pjE2NQ60u01U4ENKmKGSK8+csDe6j75WUOKa5PUXsQnzqWobsW9F19RZLVR6O+tqE4cVSiNfyFfw5DOqWSmKrkU9c7rRiqapciNkMASOSDxe8BcP1hYa4zm8Chk=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4621.eurprd08.prod.outlook.com (2603:10a6:803:c3::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 15:34:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 15:34:16 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Nathan Dunne <Nathan.Dunne@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] busybox: Add nsenter for podman runtime
Thread-Topic: [meta-virtualization] [PATCH 1/2] busybox: Add nsenter for
 podman runtime
Thread-Index: AQHXMQYOJ3CjirkuYUeQOr2pxpfRrqq0JTSA
Date: Wed, 14 Apr 2021 15:34:16 +0000
Message-ID: <E89A3BF3-D256-4549-A04B-09A84087BA58@arm.com>
References: <20210414081303.30312-1-nathan.dunne@arm.com>
In-Reply-To: <20210414081303.30312-1-nathan.dunne@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ef4e7b93-561b-4a90-966f-08d8ff5acb09
x-ms-traffictypediagnostic: VI1PR08MB4621:|AM9PR08MB6177:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6177FC7C6826276D9A3EDD559D4E9@AM9PR08MB6177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:308;OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JyxOYsXIQho08R23hA9lz0GtrusTyEUCQHq5MttyYf45DunxjZPF+zvJBpefgcO1EnLga+R7N7XvL84XatKF3NkcXXygAK1Cb4epZxK9QrQuhnZRvpuEBq4jVqw49XCP6D60/zM/JWJkvoQcQVXaCOaAyJM3jivRqYxahOjJ8tyv9jsdmWG1grmFUhVUqnSa/fvTdYITje/fyrmigUqoSdlFzBdjyRNzswWG4l4GVFia3FGo2WU/oqJwvpVdU5ZMoqSBRxPI7WpvU2KW/FPy2FVl9fMz8g68VWKOeqKLLEyg+s/Wj5ZW9uEN7Xhi0VDSzHBWxjmCqWgVHm4RF1kSW8+sog2506C6LB2vr4IUrsD4rrOO1Rj9Lo1rCLsNgY/gNlvRZ5JZ27D8UK3KznQs49s75qhPkr5gsDGskN9aiaXVil/Dno8QpgDVfJNz2mw4k3bOuAW2FHlWbulxFJ0eJUQ9neXmNDaGNMIHScP9uwO/KO+yLuAlPIZiQHdELls74Tmhhc0Qb5BwBwB9XbQkzSRSqG8zFAi6cgT6nTk4Q5VI4bh/rp1nQ0HbDm2BuuZZoNOf8L/WwZMVZa3JUFL6CMC3DK7jjGJ9ZdZHwWz8gtGhh9VxfUsl79EcxbJb4nkCozTNLyaptDE9RiYeZFQ9B0wQaeQ8fFtufUdAZSmaivYnDSY5zmZP/cPU51GALS1y8s1mwl/3phCPcQFwSuMRwqiZ3XBjkofcRCp2SEWjPyg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(136003)(396003)(346002)(316002)(6512007)(966005)(64756008)(37006003)(4326008)(66946007)(71200400001)(6506007)(38100700002)(8676002)(2616005)(478600001)(36756003)(91956017)(8936002)(122000001)(54906003)(66556008)(83380400001)(6636002)(2906002)(26005)(6862004)(86362001)(186003)(6486002)(66476007)(33656002)(76116006)(66446008)(5660300002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?1cEZpqPmfVxkkCDgGHQ8ygU9+5QoQUwQv1LMcgs74MR8/jI8c/rMckTbn1C1?=
 =?us-ascii?Q?t9l1Z87W1mSaN/QeDG2R/jc0ZtkpW7IKkzAR7ZaU1HPkFMy6zoePwxj9psuJ?=
 =?us-ascii?Q?sILKcxJGcwT3qVwW8GQn764hffjm05i3QbCiCYxLjp4kTGGDzv1+YotKqb1L?=
 =?us-ascii?Q?rSHr465lyHXsV8Cbfbutcgj2UfI2+Rxr0mXxhvEnGuM9dnCOVmwGN75cEU+g?=
 =?us-ascii?Q?2Us6FJ/+ogZPxeUELAuD8gubLpw4mjKDv0l2U5AsYcdXdAFQCUDe7lFSxiJA?=
 =?us-ascii?Q?8pmgw5W1y0ASugwSDXt4+7JGqun6k7PHxvVq6cUeMXH9FYSuF4WrFQQTTkgd?=
 =?us-ascii?Q?2ewkVom4deKb577FChbDRV9FCyhgOec/58VST5jxjWOgAD9or99wrtVdW6NL?=
 =?us-ascii?Q?Oxmq0xLjTIfNDoO3Pji9aEJRNvEh63iK0T1l0sv7ad48nyXpQfM3WLFwL/GS?=
 =?us-ascii?Q?gasi8iC5wDnLWOkOAdrwJfiQOOV1fqlzzIzhFWumbb/8XhjthQmu9t6FtO5O?=
 =?us-ascii?Q?OZ94zuXeRK6L6KaPDBe/wfrnzeA0sXQkSjFj4x3ZrFe9INNORXCvQ4qYGxjZ?=
 =?us-ascii?Q?di8dZiTWbSrp9JEysepCj1zsH7C5TfeEawEgvT4ILuzTUkuWR86gWwvu4BdA?=
 =?us-ascii?Q?qseiO5UsvELejHf/TZQ7TiQmOj5jz9CavdfHaopbCBuNPkJZzjcXBtbqr1qb?=
 =?us-ascii?Q?uuDcT25s90jS7gaDjkNOhckWbtnyWPPL/QPF0KC6Wu36ajWzJYYMKkkfHFea?=
 =?us-ascii?Q?9fTt3t0l5JhBGcLQiAonpur5nF7Xr/rMXNBLuPFDhJV2QLDO8nKn4qIqQgsr?=
 =?us-ascii?Q?QjqhqK/mQPoEUpmTIeHSKn94+HSudLQ3crGCYG15Zdi8GKd2GuyIsiztZmsd?=
 =?us-ascii?Q?iFf6RF4+udOqX7QOct3zaOrjJJdgRpfzr857vHKlHfpKn2hN6wUwF/UdJhBt?=
 =?us-ascii?Q?3q4TwqslWKdu6g/78SvIz3iZSTlK80PY1xqJX0JnVcjBngyzDFABFWl49qJu?=
 =?us-ascii?Q?avIm0VuZ024DJQahsdc+LQ+KxYvhW9NzqLu57TUr2wWl81pUP+mMw+84cPSh?=
 =?us-ascii?Q?h++R4tqnpDQ5qq6uePujW6F2Kd+s9KxJEXKkTeafV20yc1yy1oXcBn806jsP?=
 =?us-ascii?Q?mrR+2FQVyRPKGdDWgR9JgIT0A3EfsrmVVwOdPcAzxlX2pb59KrqyIX4epJ00?=
 =?us-ascii?Q?WXne/KjMtbZi5qzkW0SJ95FfzYZj13H+KfdiiNcawYion8D5VfV4D0JTFPFj?=
 =?us-ascii?Q?l2KN6yVyYOxe9S5eh3hTtfcs4JkQmX0arCceJuXvFnOME3CMa/wQQeXyLy1Y?=
 =?us-ascii?Q?XrPkDT9wTsK0n83UcS4hzs9cnisl+7IY+mnyt6LUDifKCQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4621
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	54b2e71e-338c-40ae-860a-08d8ff5ac34f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SRYNOqtzRSKwZPxtclPPJWfX2atvyEG86LwSkZKD0bp4ecSujNMFKRh4S+V44nUwqMomwSiNV/bMnRPikBxVOy0KwRgw8A6d6tPdbRi+MGf3lVm0rsYwKXJQHXZRrZ0ptgWjR2Mac7x0QWc73dvYFdCPdW5bzOGoVyXmAyzYT6rYRr+w6I5PWj8Dit79vmzrbbDcDEqwgeoOd3/e1IqTjcQOqy8m5f+4isEE1xyyGc01IgZGPF3wCi06Qlz6gQjPs+H6ZgetJD/n4D2byHvug7MnPgeGj6UmCFvhvApX5MAVAg3K9UDLWbqARvbGwxdp9o0fBsqZTcXqxQqbC+8Yi7AU+NuvaErDJ+zmaeG0MYa6fAjtRwoUhwILkkx1ZhnQmGnh9WlNMQVcOYhCObVnxSndQH8Qe3Qipkrw0I6f0jNa/USRw93E2udh3rwN5Hn/5cl+XxRm3mZ0SirHYWP5yKH4VcnZZ20eWUuZ3zU+64cDkE6IMf1IV7wYG+70u172sMc8rvhMf0mnPOmmIQ5CmhMzqPiS/dhjU04BmXejplYnpGH33S8AKTemn6HxWA9zDIaE9UiaXR8aWHRiK/d89MparF+rFJwUHaKsih8QAjXjNHXmsOQJtKAv6QGS4vGdyUt1H0gAcnsgnXmBPXMiJeMdUwTd2v7vo4eAV9vY/U2iZYO5OgwAIuqOLUmtxw5taqwhqJxDehViy4kcTG5JBG5zbLad6dmUGDzFbhgePmU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966006)(36840700001)(478600001)(4326008)(36860700001)(316002)(2906002)(70586007)(5660300002)(966005)(6862004)(186003)(6512007)(47076005)(83380400001)(82310400003)(8676002)(6486002)(70206006)(2616005)(54906003)(81166007)(36756003)(356005)(33656002)(37006003)(6636002)(336012)(26005)(86362001)(6506007)(82740400003)(8936002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:34:29.0808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4e7b93-561b-4a90-966f-08d8ff5acb09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65E55737174DF8448D7E03A64F3E0116@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

> On 14 Apr 2021, at 09:13, Nathan Dunne via lists.yoctoproject.org <Natha=
n.Dunne=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

NIT: Maybe the commiter could add a simple commit message like:
Add nsenter to Busybox configuration as it is required by Podman at runtim=
e

Cheers
Bertrand

> ---
> recipes-core/busybox/busybox/nsenter.cfg        | 1 +
> recipes-core/busybox/busybox_virtualization.inc | 1 +
> 2 files changed, 2 insertions(+)
> create mode 100644 recipes-core/busybox/busybox/nsenter.cfg
>=20
> diff --git a/recipes-core/busybox/busybox/nsenter.cfg b/recipes-core/bus=
ybox/busybox/nsenter.cfg
> new file mode 100644
> index 0000000..0a58df5
> --- /dev/null
> +++ b/recipes-core/busybox/busybox/nsenter.cfg
> @@ -0,0 +1 @@
> +CONFIG_NSENTER=3Dy
> diff --git a/recipes-core/busybox/busybox_virtualization.inc b/recipes-c=
ore/busybox/busybox_virtualization.inc
> index d9c4e67..15f1930 100644
> --- a/recipes-core/busybox/busybox_virtualization.inc
> +++ b/recipes-core/busybox/busybox_virtualization.inc
> @@ -7,4 +7,5 @@ SRC_URI +=3D " \
> =09    file://mount-cifs.cfg \
> =09    file://ps-extras.cfg \
> =09    file://getopt.cfg \
> +	    file://nsenter.cfg \
>            "
> --
> 2.17.1
>=20
>=20
>=20
>=20

