Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web09.9745.1618996850354252360
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Apr 2021 02:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oxYjKTEs;
 spf=pass (domain: arm.com, ip: 40.107.13.48, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPyG/NDsR403FHajJZXXuGDOp6epPSfBGn35b3BluMw=;
 b=oxYjKTEsKEX3YV4+2fFXqUlqhovMoesTRNyDFuwvl3RwekdBkrAEBBITLfMgL05p19M+Md+pvaZxcZwNFQb8DVG14hKZxjrGDTRTZ0ntpU0vsXgGCtpH5GmEVYhOfgqd1hPsOJDF/QqP8pkh7IVtOzxW3TzrL5Dligiel6ZW6Xg=
Received: from MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::30)
 by AM5PR0801MB1761.eurprd08.prod.outlook.com (2603:10a6:203:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 09:20:47 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::9) by MR2P264CA0090.outlook.office365.com
 (2603:10a6:500:32::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 21 Apr 2021 09:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 09:20:46 +0000
Received: ("Tessian outbound 34291f7cb530:v90"); Wed, 21 Apr 2021 09:20:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05521b2a1036d86d
X-CR-MTA-TID: 64aa7808
Received: from 1490c071a593.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 21650328-AC9A-48C6-8AAA-4E7551125C97.1;
	Wed, 21 Apr 2021 09:20:39 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1490c071a593.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Apr 2021 09:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O22d8kQX0jzGAxFmt6ZHPUa4aqgvT1Q7+US4ARPwuYf+uMzXE3BA5LIoWDlmHHjAUAqsUicpJRVevoNwF1+4KztYdJtIvsGf1sH6USppcH5lVTyQ/KcIlHRjrAcW8/B6mbW+vBO/nHNlmBPKhH+ueW3oMgz/xECNe1cjCAWhZ96STBapuZU3JIVA1z2GTFzAAq5VX7mV2aHyMtkt3srXCXWF/RuDV4MkjryIEoaR9A4crozABSj/4ww8SbxKKYk+YdFzUKVmuLJJCav7Sh4hx3kLl4eMLlPdYuTVP6cRCQYY8Zwm9SjvFWDEG751ij3qFYsCokg5hebqJ6YQvV6kPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPyG/NDsR403FHajJZXXuGDOp6epPSfBGn35b3BluMw=;
 b=abqWql1IaaPY0/tMnAJmvt667Z1R4EMETY2+tL2vk6F0GA3+SkZE7Yhv5WBzXghRR8ZiNbmIg3rTvAXPVNTWaT/uwzXg0sNzFrB391EcmKGr2ryxQxj+63KRrSyyX0Re/Dp4KBSBFVcIT/dNx+jZMxiJ7Ua377srhMOfSDV/9z2H2U6yJpoYXeRUJ4Blt/JT1boPazoE2A7RzKv6auqJh0KAXObROE8PJXW8hEXFXzmcMYUt1VMuON13LM6q375wE+XcbK+GdFAhTPq04rVsJO5L4xRpy5FAOnTwMsvmmXowZu9wZEO9kllkz7miVo8BwaMo6Ttqx/UUQToWmDCnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPyG/NDsR403FHajJZXXuGDOp6epPSfBGn35b3BluMw=;
 b=oxYjKTEsKEX3YV4+2fFXqUlqhovMoesTRNyDFuwvl3RwekdBkrAEBBITLfMgL05p19M+Md+pvaZxcZwNFQb8DVG14hKZxjrGDTRTZ0ntpU0vsXgGCtpH5GmEVYhOfgqd1hPsOJDF/QqP8pkh7IVtOzxW3TzrL5Dligiel6ZW6Xg=
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:15b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 21 Apr
 2021 09:20:38 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::1181:7889:ac28:ef7f]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::1181:7889:ac28:ef7f%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 09:20:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, Bruce Ashfield <bruce.ashfield@gmail.com>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 2/3] xen-tools: remove multilib build requirement for x86-64
Thread-Topic: [meta-virtualization][PATCH 2/3] xen-tools: remove multilib
 build requirement for x86-64
Thread-Index: AQHXNXERF3WTjz2NxUGGfK/3BMhnIqq+tEuA
Date: Wed, 21 Apr 2021 09:20:38 +0000
Message-ID: <30444D77-A61C-474A-85C8-ACBBC853F30B@arm.com>
References: <20210419230854.121217-1-christopher.w.clark@gmail.com>
 <20210419230854.121217-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210419230854.121217-2-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7e797f81-7c9b-4c29-a283-08d904a6bf12
x-ms-traffictypediagnostic: PAXPR08MB6351:|AM5PR0801MB1761:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1761DA43F50BF604D2DCD4B49D479@AM5PR0801MB1761.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Ikd7hhleAA0Ltmgz8y95UkyVA5l3QleSidIvCzVsIhn6ukM23/+FhcoleulB8r7wbq07fFP7V/Tum1cVWKJmYKwJfl0EOCk1KKT+2e0EFmvT8ToxSqp6OdozM+Uch3oPqeRZLWQCMq0Mg0UaFDGfHfcUE8FGk04/XUUoH3cOGNSFQN/A23/S5wnFGlaAJEamSdEdywuKZnWMiZBq5bMgtc4KiVTVxEhFWdSbI8on48iOJsV2lU8fez1RZgkHssklixJ8O1CNBiQoE4MaebR0dzMygddRmiRL3hTCEEY1XbYydoKfAC9XTdloC/OaenoLq8TDlI1jtqHfInC2wYpJnG532y2rek7wjvkV612sgjwTKjCmZm+bOLMgGDMnhLvjzH6b3cZiEJ1CVbWlFlRrcHBsLD9RrsgIC/IPLxq2rFh5r+A4Q2cuogX4EV6dDJ1VyLWRn/BnZfL7tk/q/9J4JK9Q17XMrSOpid0+lWdC++yVtXJEp/yWJJoOehsBhbmHVgT40X1NloPSfozOoFOO7+Wv/gNQ96D3Pjl6vLbklxUxCnWJymU7f4h129Jdcovn8t+EP2ycbRFNwyd3VPaWDI7RArTXM0wm3/hUb9oWpQuSt428jf27jWcx9PdzS88Z9Eqs0o6FQ0jHqyMz2c79lR+YcLa2u4L65uv/cTlxhmA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(38100700002)(122000001)(83380400001)(86362001)(8936002)(71200400001)(66446008)(66946007)(66476007)(76116006)(64756008)(91956017)(6512007)(66556008)(36756003)(2616005)(316002)(33656002)(8676002)(53546011)(6916009)(5660300002)(4326008)(54906003)(26005)(478600001)(6486002)(186003)(6506007)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?1OskcgeEQ8or0CZeuc9VT0csgeZ3V89czP4JQ5cHdnB0oKSu3L6I+o0ZAA2R?=
 =?us-ascii?Q?jWGAtUXcQ9dJPbkJPGhLoq8tFWnvb6J3hUN4/Q3zxrEFO1CsTosdid0MjhO7?=
 =?us-ascii?Q?9Yuhgj+KDy1zzLTNcdigP0kHB13REKm0kpXXLDZNQDT5njFCHUuTykaRwy8j?=
 =?us-ascii?Q?VWIfgVDfL9gPBUMatqFrbzHLR1p4I2jC5BQRnKsuj0zS97Y3AIzHDi5S5YGz?=
 =?us-ascii?Q?I8QErhqeI/xqgrjBE3XLN816XK8CFoE2+/BT19vCTWI6KusNLhxw1QCQO7xw?=
 =?us-ascii?Q?p0YbmpIwJ38JStIMmc1+duDSR6qgNheRSbZLPoBlL7yI24CG7/Zj4BZPxLdE?=
 =?us-ascii?Q?gSqhkub4tFyQxuxXTcQxPgkI5eXe/i1EPxmVLOFBii7yE/Ptok3p3wk3H+3P?=
 =?us-ascii?Q?o3m3YogjlkKqrwof15oNpaE7MOlhF/e+oycpr08LTUuGtcWxaLcIrnRk+7RE?=
 =?us-ascii?Q?y17HUArf5Psre9Cv1b+2GkTCqQv9X6tGQMHPWBire0f0aYbv661uJhga2O3s?=
 =?us-ascii?Q?5FoYfeSsWlZBRWjSsT8wLx9mUD9hCrE0sPwIZ08XD9EiHkruz73z3NT3c85D?=
 =?us-ascii?Q?bST6WXMgkKAjbM2cXxpqkV9YgcksyXST2IU4C9JO8QXNG6PprMwYX0ldLO4H?=
 =?us-ascii?Q?GQn2anuboTYQmQ3o734vD0Zd4lBnZAOiL+5B3d5JNSTirXHYYHKp04arjErT?=
 =?us-ascii?Q?VhYxsUoHufJmU5EI6DsYwxwoxgXclWrFG17w1DdIubsZQczq3uznT7NUM6rN?=
 =?us-ascii?Q?sarzjqAGXNHrsLq17e9FdiflBUpv1mug+Ktt5a9uKxZDI7zjfztjjTBuEMtY?=
 =?us-ascii?Q?QJldb44zOLRo9/Q7UGBDVU9biY8IaPNMxYLZ2Wgl5BXdTlk93g+4XpCJiBGS?=
 =?us-ascii?Q?ZUJxZkoVuhUdrwwpjBphLe2h9Bk4X6W1oXqZYI8HoB7l3dXcNbmHxYZrWMQk?=
 =?us-ascii?Q?48UzY3RgRlc6RHreSAiR83+KrjktToSTpMmXeH2jKgEuNZbPmJkJ+DUJwZJn?=
 =?us-ascii?Q?z3ZVASfdOqzvBx1o+AyTYu5vfD5MkAsnTaK3QupsMUaPexv3XiNEKImtKZu/?=
 =?us-ascii?Q?N+Z2vdn40Tz0C9lb8iO3VN2dCVmnIykIMz7+VUa51qmcj4X1v1WsL4Xkmeti?=
 =?us-ascii?Q?PBT/7mcevnaTyEI9wNlBc4EK+19GjzTPEprrWtHwjIJsKQDkdjgU5K02Vtqx?=
 =?us-ascii?Q?Tlhgnl2FkkxNEfbZgeNYCdE3NVWP/zF+quz8NGlU7yiaRWhqT3Xyi7firAQ1?=
 =?us-ascii?Q?vUI503OzVXszi4922ZNFXKnCEGjj+DEoHugy4gtejk/e0cJp/5RcjGil5yFf?=
 =?us-ascii?Q?YxjoZaRc5MwPRgseIDMLolZW5vBSRqB9ri0vlA7czzQ08A=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e89f7236-b630-4d63-53e3-08d904a6ba2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UkGM1Nwqn3zfw9pIcIohcD3YBRZLkzKaP0yrQ8W1y7KDagrD5iT5SVzFXEw4Y9NtlZTirCD+vAwA/Te5SZFdHZu15qsnqKjHhFQP6VS7uKOWj7yh3yt6/tQFYxaMVPsuh8gDbvOiWu3VkTU6E0Fsl09/xDGCnGd1L8wKp8RmkmZDaC9IyDmVQiyvMqzMAKxJO23zBEcPqxlejrf+NDjp6N7kUoIipPZtos0Z7duIxtELvc6ty9oo6UdahYCx+iOQ8Yxji3RQhu4kiR0tV4vI21MFNIMNemwWWxu1br92ZZpdgAzQUeVIcWrulPyGU58mf3+4rI3BpJq6AoFt9ll1/XgEZacPhzqyrpi5F+zt539II7mXS+mHgo5Ndc0SBRBsT+EN0FCrqaITuc440lQ7ClOyhvcr5FncZG0/TdkQKwHO7qiWnvH+uaLWeqmXIZRlxqK3IzmfWg+CI1JOHD36YcVoHXOue39VT2pUPQodRBlINPzPPm8+RALq4Kbe4wAGJhRLusnTPdrEP1WNQYEv+HlVHRfto7eWX9IVWAuzED+hkyXaycr4XgwgZNIeX0jIe4l6kxyS3an3D2gezJRua436jl1QGBh4siSoOGSkDwrpRWwxU3KFOJ1LsailGZSBU+aZZBOZjo5zuTrSHLYZrzZLUfWlN4r0v0PkJqHMZe4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(26005)(8936002)(82310400003)(6506007)(186003)(356005)(83380400001)(5660300002)(2906002)(2616005)(82740400003)(81166007)(8676002)(36860700001)(33656002)(70586007)(36756003)(478600001)(4326008)(6512007)(70206006)(47076005)(316002)(6862004)(53546011)(6486002)(54906003)(336012)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:20:46.5044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e797f81-7c9b-4c29-a283-08d904a6bf12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1761
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09F9E1F1C121B14BB4E0D30BED24D186@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 20 Apr 2021, at 00:08, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> Xen 4.15 added support for standalone x86-64 hvmloader build and
> previous commit provided Xen 4.14 backports.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-tools.inc | 37 ------------------------------
> 1 file changed, 37 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
> index 722c503..3560e79 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -6,29 +6,6 @@ COMPATIBLE_HOST =3D 'i686-.*-linux|(x86_64.*).*-linux|aa=
rch64.*-linux|arm-.*-linux
> inherit setuptools3 update-rc.d systemd deploy
> require xen-blktap.inc
>=20
> -# To build hvmloader, which is needed on x86-64 targets when 'hvm' is en=
abled
> -# in PACKAGECONFIG, to support running HVM-mode guest VMs, some files fr=
om
> -# 32-bit glibc are needed.
> -# Add the multilib 32-bit glibc to DEPENDS only when necessary.
> -#
> -# To enable multilib, please add the following to your local.conf -:
> -#
> -#    require conf/multilib.conf
> -#    MULTILIBS =3D "multilib:lib32"
> -#    DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> -
> -# Use this multilib prefix for x86 32-bit to match local.conf:
> -MLPREFIX32 =3D "lib32-"
> -
> -# The DEPENDS on a multilib 32-bit glibc is only added when target is x8=
6-64
> -# and 'hvm' is enabled in PACKAGECONFIG.
> -# This x86-64 override is never intended for native use, so clear that.
> -GLIBC32 =3D ""
> -GLIBC32_x86-64 =3D \
> -    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', '${MLPREFIX32}glibc', =
'', d)}"
> -GLIBC32_class-native =3D ""
> -DEPENDS +=3D "${GLIBC32}"
> -
> RDEPENDS_${PN} =3D "\
>     bash perl xz \
>     ${PN}-console \
> @@ -736,16 +713,6 @@ SYSTEMD_SERVICE_${PN}-xencommons =3D " \
>     "
> SYSTEMD_SERVICE_${PN}-xendomains =3D "xendomains.service"
>=20
> -# To build hvmloader, which is needed on x86-64 targets when 'hvm' is en=
abled
> -# in PACKAGECONFIG, additional CFLAGS are needed to set the 32-bit sysro=
ot.
> -RECIPE_SYSROOT32 =3D "${WORKDIR}/${MLPREFIX32}recipe-sysroot"
> -ADD_SYSROOT32_CFLAGS =3D ""
> -ADD_SYSROOT32_CFLAGS_x86-64 =3D \
> -    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', \
> -        'CFLAGS +=3D "--sysroot=3D${RECIPE_SYSROOT32}"', '', d)}"
> -# This x86-64 override is never intended for native use, so clear that.
> -ADD_SYSROOT32_CFLAGS_class-native =3D ""
> -
> EXTRA_OECONF +=3D " \
>     --with-systemd=3D${systemd_unitdir}/system \
>     --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
> @@ -756,10 +723,6 @@ EXTRA_OECONF +=3D " \
>=20
> do_configure() {
>     do_configure_common
> -
> -    if [ -n '${ADD_SYSROOT32_CFLAGS}' ] ; then
> -        echo '${ADD_SYSROOT32_CFLAGS}' >>"${S}/tools/firmware/Rules.mk"
> -    fi
> }
>=20
> do_compile() {
> --=20
> 2.25.1
>=20

