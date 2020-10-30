Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web08.10552.1604047426850898559
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 01:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=758O6+sZ;
 spf=pass (domain: arm.com, ip: 40.107.21.46, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8B43qgHInVl3qCjn0fvR8yzq683y081S2E8JyYy4kY=;
 b=758O6+sZpvTx3A7SDX6rLLORsnwfpjPvHrwIWVxpf/T8xhx9tOOCacW/ObSI8q+vo1XN8kpbv7VOF79QI2kvU8hjJEcAKZd8eKy2XmIeYJUGLsYo8HB9WmzGm2c0o3wlEr+ktqhj+moZf6OvI4fR/flGqaWM7WTEsnOKW6KzvOw=
Received: from AM6PR0502CA0065.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::42) by AM8PR08MB5828.eurprd08.prod.outlook.com
 (2603:10a6:20b:1df::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 08:43:40 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::35) by AM6PR0502CA0065.outlook.office365.com
 (2603:10a6:20b:56::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 08:43:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:43:39 +0000
Received: ("Tessian outbound c579d876a324:v64"); Fri, 30 Oct 2020 08:43:39 +0000
X-CR-MTA-TID: 64aa7808
Received: from ad20efa340b3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9AF73E91-101E-4271-BC5D-C20F930B2DEC.1;
	Fri, 30 Oct 2020 08:43:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad20efa340b3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 08:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1Rci10vQStEZU0Aum9q4zpeUzZv1x3TR41ExaYk9fAXAeol8fq8RGE5zsc15VyPfBua6ZlsK8Nzd0zROQ/s2F0VwLsuS8wlPP9b87NtDelmh6Xv0Ye5d8fnDuOIryEGpuMo/POViCJ4B5EKYIvnsNUGiIZUqo3f5ZQUih2y8FQzVoqDT+y5hl+urpl5bYgiHnMNhFpMgGs0pp00JUkjB5CcGItIjGeJsx1cdnjBn91z3kGXiJU0bnJdIe4RnYxJtF4pHedziuX25uMQf5d4iYZ8nPJjndyo/TaJQO4xP+U/n0mXqex9zhE+68h3KRuEvIxVP1s1G8e0d6OCGdDlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8B43qgHInVl3qCjn0fvR8yzq683y081S2E8JyYy4kY=;
 b=n+IBRMKhx5XXiHkvvPzaPfZRfYuFcDE6vbn8oe+Hv8MFxGWzQvJ9S8we2k+/OIAJNbX1594+/EqkdTO4TizBbju4JBL/xTaWONAJaIAK8vPaMKL0fSwxFcYCpxBgrH0vSc/gr/lEIkwVsWQnAHy2y13w0FMt6wyF+86gUYXWwYtd0xxr3dIQX3c+gNksGDHifwlnNbNHGc7wwP+8cclH7ZadHLWtgqPZzPAnBbUpAhLBafQvVnE5LFEH5ok0IWgKXUJdv1H1pBh0r/KNfbgOksBVM0gN+gINcWjVckUvkO9ME1X6U6yWYmY/gvZOjDRw4j75J6aCuORykBuBD4fGRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8B43qgHInVl3qCjn0fvR8yzq683y081S2E8JyYy4kY=;
 b=758O6+sZpvTx3A7SDX6rLLORsnwfpjPvHrwIWVxpf/T8xhx9tOOCacW/ObSI8q+vo1XN8kpbv7VOF79QI2kvU8hjJEcAKZd8eKy2XmIeYJUGLsYo8HB9WmzGm2c0o3wlEr+ktqhj+moZf6OvI4fR/flGqaWM7WTEsnOKW6KzvOw=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4707.eurprd08.prod.outlook.com (2603:10a6:20b:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 30 Oct
 2020 08:43:31 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 08:43:31 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
CC: nd <nd@arm.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Topic: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Index: AQHWrHn0Oytpowydxk2X9qW7uvn8Kqmv2AfA
Date: Fri, 30 Oct 2020 08:43:30 +0000
Message-ID: 
 <AM6PR08MB3461B708E14D6181ADF4993992150@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20201027155536.12513-1-diego.sueiro@arm.com>
 <1641E48767A9AF65.22812@lists.yoctoproject.org>
In-Reply-To: <1641E48767A9AF65.22812@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 131B464F6C591B4C94327074E7CC8E07.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.219.69.79]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85c4cf8f-22ee-4a79-8e18-08d87cafe64f
x-ms-traffictypediagnostic: AM6PR08MB4707:|AM8PR08MB5828:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5828E9FFF7417669BF15902292150@AM8PR08MB5828.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SphyycijXk6zGL787/lszdqtZ+1hkTQGrdPvHPfj0GEzd2xhysbneZjD3TRCP+03brD+YmxdCR9qqIq9thqdGt3t5+Z5lccb7cPGBvlVbwWu0t0m18dne+LRgaxeJ5KdzpnjNgRzdoMSkXfIvM4tE7fw5RRO93R73f+sfADEjWQ/3Jjokf8ALhPNtZ2wdq5a6dvXYjD5B/N/9EjbCtk+VgrsdgaMvkJJ6xiM1LPxTMYrfWLqMMlKppBUdQ2hf6oPv7EaoP9+oPW1X+84MWCqUDFG9l23I7uftpW3rXaRw51W9lDnaes0W32pm34X78tZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(52536014)(316002)(54906003)(110136005)(55016002)(8936002)(478600001)(9686003)(6506007)(2906002)(71200400001)(7696005)(66556008)(86362001)(66946007)(33656002)(66476007)(76116006)(64756008)(66446008)(26005)(5660300002)(8676002)(186003)(4326008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 AIKBb4saDZ2hxaCabXTZqvC0M07ZS/r6AQN0VXUD1VpMotpUQP0LgvZRYy9dhbOytz8u41na5ZwP/13Poiwvp7HfbDxAQ9eDIyq4iAE8LlOU0vo9GoqNneEpBAZfTUGa3DRgvc0pHoy0QAvwUkk+HN9hMT/7IA0BkxKLhG+hyklWbQv1Oi4/aiPP9tor3+xyk4IPjSPvy9Ni206vCQjEGCgfuHQT7HVONX+XnXMjkATQN0KRst004Yj1xQO2btG13s5/fAvK/0OwZv+nzTcU5LSQ2/deTsCVBm3yXbeKiqCrWR5ULg0Aa7hOPned57PnvunBuDClBl4bLArHGl5VO490fCmnEbEhfQSdA2bxL0vSgDf9KGvQlc4lr9QNqRxM+UvE1A2aRdr3Qb4P6OB5ZMWFKCyswB8olEGh1lw6JbUPLyvpgCeI982B+wO34FbMVo5BkyL9Impt2H5fuvuojf3y6CDn267I7zLnk9Gc/HsZKkwE+4QjU1PlSFyOSY0NVO2BXrvMxyBjYu54ULGqCFhZEoKVbfnPvubVG011dnS/JUHY/k7shc6QB/u8Ouslk2FWcnQvIOc4Se3l5FAG08uhsw/qllL1xK7S3APQKOJAPYo9vgUBusboYGgnwU4VVkNtRYdf8KhEg+pWqpvypw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4707
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	88662029-a28e-4f88-6e4f-08d87cafe124
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ykdtoebgjT/545MogyNHmEublWvlyVd1EHkP7Vet8ZgAkPMBumDD9iWDYJthegT2wDZJEnKm1332qOIKMoUCylIVZKqLlPgFc6R953hXh9tGAIWpO3WxJyapANcK6Pl7b3K3MNXpVoD/+Ey7bhXhMPwbaHdXIP76mhsxbXnPs2V+4qjjeK37pAdA8b46gzwzzj3q1LbJ5BlD1tdcV4Vzp25H6CT3z1yty09pB5+TDnfsgiM3HIvSki8ndha97rqixNctp2bvarWpaaCnAgh3lQgW+uN3PGwbt+psMspIb/0ifhtgAck1EU4zaS4fZk4yk/GytVH0a/GzPj7MtQsc868ua3cUAuWKUfJqVoeu4D3TFueTxwSPHey5x5+8UYKYsOYcoDujjAmiX08A7A1IA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39840400004)(46966005)(5660300002)(47076004)(356005)(81166007)(316002)(54906003)(110136005)(82310400003)(4326008)(478600001)(8936002)(86362001)(107886003)(6506007)(26005)(9686003)(33656002)(8676002)(52536014)(55016002)(70206006)(70586007)(186003)(2906002)(7696005)(336012)(83380400001)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:43:39.7425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c4cf8f-22ee-4a79-8e18-08d87cafe64f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
>lists.yoctoproject.org
>Sent: 27 October 2020 15:56
>To: meta-virtualization@lists.yoctoproject.org
>Cc: nd <nd@arm.com>; Diego Sueiro <Diego.Sueiro@arm.com>;
>christopher.w.clark@gmail.com; cardoe@gentoo.org
>Subject: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
>
>The do_install task also ships files to /boot and /usr/lib64. Hence, exten=
d
>SYSROOT_DIRS to include these paths.
>
>Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

@Christopher,
Can you please also review this patch?

Thanks,

--
Diego Sueiro

>---
> recipes-extended/xen/xen-hypervisor.inc | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-
>extended/xen/xen-hypervisor.inc
>index 6a75d16..916bd3c 100644
>--- a/recipes-extended/xen/xen-hypervisor.inc
>+++ b/recipes-extended/xen/xen-hypervisor.inc
>@@ -55,6 +55,8 @@ do_compile() {
> do_install() {
>     oe_runmake DESTDIR=3D"${D}" install-xen  }
>+# The do_install also ships files in /boot and /usr/lib64 SYSROOT_DIRS
>++=3D "/boot ${exec_prefix}/lib64"
>
> do_deploy() {
>     install -d ${DEPLOYDIR}
>--
>2.17.1

