Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web09.8302.1613661594618404490
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 07:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=N9wKYUxj;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxbgzdImNcd1Ed8cSR+fwsMJ9e2KjzZTmf3+79l7Ec=;
 b=N9wKYUxjLrALkNy0Xa5sKVvETlW7gLSmWFSZPgfbP2l9c/xsLQRAiIWa9zGy5G3JA0lk0AfN1vf7MOnIYFtSibNBP3DDq44+8FhKSk07k+O2ShEqUXTB/X4IEjk/0fA/2rC/t12CYrUadJIn20JB2TjuVYwc1C5n2vrbehbBs+I=
Received: from AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) by DBAPR08MB5848.eurprd08.prod.outlook.com
 (2603:10a6:10:1b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Thu, 18 Feb
 2021 15:19:51 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::d0) by AM6PR0502CA0058.outlook.office365.com
 (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 15:19:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 15:19:49 +0000
Received: ("Tessian outbound fb307b4548b2:v71"); Thu, 18 Feb 2021 15:19:49 +0000
X-CR-MTA-TID: 64aa7808
Received: from cb53f316df33.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D920BFA-1243-4038-8F76-71CCED7812D2.1;
	Thu, 18 Feb 2021 15:19:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb53f316df33.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 15:19:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XufYVZUbRmkEBhxuY7y4lTmB2b/3hdvEdyGHADkH39HeVmpQkyhM1luC2B4wMRDYPL8sdeqvQGJZ1Dja3+jg7d6l4zz7eDCpppY5B4HKZzpufti83z/C11L27IPUUfr4xMMYeqHheTFpFnEI/a2GQE/vraMOx4rJ1Uc+11n++2VuUwk+9rlJY5nki/lFI0arZYUvh0RADIeGdSqKnc9Br6Bd9NPvVxb74pyng8dXWNJW8puU0RKM5rIzKiJ26XPRrMmzuoncr153EzdcxS2A4bzDiPOZZvV3ZljCiopJvuxo5z1uoKW1apydkL8OiLuBiuCYXcpaK7VxVEuOMFIIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxbgzdImNcd1Ed8cSR+fwsMJ9e2KjzZTmf3+79l7Ec=;
 b=a6iqBNYM7Ep2NSMskMPtg0rkzluKbOs/+MYOp+SiHDu169mk3jnc89RXT6JRTpPxABHsr29WGUOFfd/0exidukHD3RRcQ7nA7rof9iqNimL21Dd+qcgF7Ydq/weC+18Tu+GVtE+/uDUaADqjWXp0SlWlu0uhQYnkXTc1hBqvkeU/ysR6c1FCHx6v4SRYFzyehnbv9t9rIuz+Qa+7lMWqN7ev+wzk2ioFPbioUaXlJpI28cuM9seI4wWymVCHQxlWgc0WPZhQBJFpkTnVx5hE32DErPI6K6R0nY0BYsms47I7GjDMhubNeB1Kyi0pvFYByIlfvFZCwSWFSyEv8hbNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpxbgzdImNcd1Ed8cSR+fwsMJ9e2KjzZTmf3+79l7Ec=;
 b=N9wKYUxjLrALkNy0Xa5sKVvETlW7gLSmWFSZPgfbP2l9c/xsLQRAiIWa9zGy5G3JA0lk0AfN1vf7MOnIYFtSibNBP3DDq44+8FhKSk07k+O2ShEqUXTB/X4IEjk/0fA/2rC/t12CYrUadJIn20JB2TjuVYwc1C5n2vrbehbBs+I=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3510.eurprd08.prod.outlook.com (2603:10a6:20b:48::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 15:19:41 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 15:19:41 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and current master
Thread-Topic: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
 current master
Thread-Index: AQHXBgeT+QKRNq5USUiB4oaaJKVCFqpeBpyw
Date: Thu, 18 Feb 2021 15:19:41 +0000
Message-ID: 
 <AM6PR08MB34614F21BA86DE2E60E51FCC92859@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <7f53a8e6f74499215ec593993a00631049e05c8a.1613658838.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <7f53a8e6f74499215ec593993a00631049e05c8a.1613658838.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 8D708A04C4C4F442B5465C6B84037F5B.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [188.220.204.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0990b1d-a73c-42b5-d6c9-08d8d420a218
x-ms-traffictypediagnostic: AM6PR08MB3510:|DBAPR08MB5848:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB584893961006E5194A81C0DD92859@DBAPR08MB5848.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U3hqZafqNQ5EKwYvSbdz9+oB6WJHwweG+/rQiuOwerQinl/knt0bpU62cMrQ1NmyTfOAs/duXrc7W+OyPfs9syezcekrRUk+1uoEtmZFC/cI1hLE8C4vcAlHRNRDKYFj2avF543dgqby/ztCSfMwOmQzNZKKE9l1+YmNcEXlmd7/DX83ritHrh7ISQhvvPGnaX4f3Ci7748OhKr1/fcOYgumlhha+N6oqo/XWQtct88h5bnORAtqw63AJinLJJ1e7z9JjTF2VZqhRTBPCNOFKz1r2QJ5yMBLLkmSQ8y1efR0ADvnxfI6NPmeUNBMPdVQfoG491beP1R3JK+ztB4vW1VilmfQNBts+fG9QCUsaH4G5DOHDZF8aC0c09uWEzQVIabw4/P5vco8UTMzbC3epsOh3SlcsjNiYx3vvViPDAnfesYEy32MhSsasac7peRsYEgHk9u/VFT54aEMShvF0fKVXzmao1hrcRxI7nBkpgYNdOb/21h/+UlLqPFaOA3iHLi3cm/+TrluBGBUWeoIMalRp93LvIYxuGfEFXq3e4BXdd8hCP9Kf6LqXVh9qSPjAo/UN3Lb5DzttBe8aLeTpURkDT2yKjkc1Cas/RAVwHE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(83380400001)(64756008)(478600001)(66556008)(71200400001)(4326008)(6506007)(110136005)(26005)(66446008)(8936002)(186003)(76116006)(66946007)(7696005)(9686003)(66476007)(316002)(8676002)(55016002)(30864003)(2906002)(33656002)(52536014)(86362001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?hP8KFyB/YOxQPt3JAOlCRiFLGFOqdIjRXfX+pLDv6VbY2lny+WsALpVnGijm?=
 =?us-ascii?Q?X3mDJAfb4tbw+FR3hA7RjGSvgqMkIXZcT9/DNuJjGcUIlGh+Q7xOCuVD1wPb?=
 =?us-ascii?Q?xHj9S2iEOf/QKzbmsWNVp8Gx+BGCu7f1GSm9tyClpKHhtG0zQlOn0NT7YYow?=
 =?us-ascii?Q?VFBAZsZzYPyGXxRvidrm21Be6Clug+JnIX9GfSXSyXlF/DBKQHwgyaYP1siY?=
 =?us-ascii?Q?m5SSTKnwG3fb+pxonsuDpx72KmpQAOk8zM7dgqz0lTL3T03TpAbyxCiWIlkO?=
 =?us-ascii?Q?UxjpCcGte61jYCbrrv0zey0lDXsKOVsLzNA9eUK0G/4sCvR9izg9m2IYXlNf?=
 =?us-ascii?Q?nYdA/wQPX2y25mQgA3qYadlPZbwiRLDUAo7myYmyzhamVdXkkswM8wgYOSNe?=
 =?us-ascii?Q?X/rsI/b9SDS1govYpw9PubrhpZmZ2YwLFv8rwtEzteimFi8B2/kp6i4UM6+5?=
 =?us-ascii?Q?UNJFZfS3RskuO7JOz3aK1iwShrFqlUqGjvPuFOAvs7ccmxRC7A+8V/WEbBM5?=
 =?us-ascii?Q?FvqVmjU1DR1X4/vKO3P1EUJrxpEs8qEvgIYvLa1c+lF72Ejmy6Az3UBAoqhN?=
 =?us-ascii?Q?eAr34otHjT+DbCROdPnKm/dE0Y/7Dr9ERgrT4bVzzxc0iqoML88JOGkTks/P?=
 =?us-ascii?Q?nz6gcy5YJo3+mmJ20EZicF4tLF/G5RkrMrn2bWY1UvcOUkpckKcvmx3t5c5t?=
 =?us-ascii?Q?0CYBevBO3LoaubnS2J6/0ouWNIfM44aIoIXCX4JQVAv5o0BEdvHcF9oHp6jW?=
 =?us-ascii?Q?G0wElAAXF+zatkvC4B1j5MICm8sF4UyMaTs3NAB3OaSjx45XA6kIXozdTdHG?=
 =?us-ascii?Q?9GzHId7uH+MX9QkTQCaWW+mQQ6qO5QkQFVydzAcbP34OZB+/CcTkR57cwU8y?=
 =?us-ascii?Q?D2lCkrLMf73gErPVeDfl/pXlXh3I3nfcKBw3zYsfjzGGqEO7e/vcDnZWxBWi?=
 =?us-ascii?Q?NLkvLazNR6D5moaI/hmZLOLOjV3J5V1ozy4KGt9WljGOAwh1hdKHtL3qZnnv?=
 =?us-ascii?Q?5eQHXZGbq+s8Xof82AOityAN5c+NaNWUBMXiRXuD+mzedcsDFKF68D7coDa7?=
 =?us-ascii?Q?ySW1hOQ6uoMr4sBKIqrqHTMJCY5jGQobVOlbU1w+Cv21BeuaymCSRqkuZp5u?=
 =?us-ascii?Q?xjVxZjZojFRfe8So+Nt1H2pDhCqh4AyDk9sgTm43k0wfH/agRNG6rUetI+bl?=
 =?us-ascii?Q?uhtCpKgfzWxzOmck2DU5c2f09M5BP2E1CcKBKOTuN7A7zNwEzkb8LyqnLNQD?=
 =?us-ascii?Q?EpFQHXjW8YyleY9CGtm1Eb1UXQNQTAVlCoo7R8NqG1uRMrZxw18Fb9r3XFds?=
 =?us-ascii?Q?OnY6QOR/AaAriZhJO81S57yk?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3510
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3cb13023-996c-455f-3dc7-08d8d4209d7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AKsQ9KuqIIJUmvPvP6gRF2JiHUh6GAOfY6wnMk9ZzE6HhO62KloRkXpp0PpnTHGRGwgVEN+mjri8RzRek9fGBneC7gQ6YKAGCBIFhRut/iHCzXV+R3lA2IyW6SK9DbhIPXVypJrdBjzzR6Xiw2R6O8LAJHVXOAADjuhxr4M8vPTopUbH/xDkqk+JfhxosfuTwWypquf5VkbQePLRbh2TCUc7bcRFH3A0nRKsrQ2l6AKce9+M5sqXzL3fjl0rNvCA8p4GwSJL43YnhaCv5RezU0p8BAYqj4XrSxrDwvp9IO2HvS1be/1dVc4PNGmLWjmIZgWGKelOkUVLPI2v346hYczAwFjrgYBSMCwvUjouCMB4a8KYbL1/zc36Pl4OdiB6hnQrgoq8RIA4eMbuwOIUcQ4nBt1sncgKPdiIk10wvl0Alai1p8jVTB+lpQ9yPdiv/JmbFx0cuEuAd95oMGvThqCWBWH9W+gXaZtCnyji2rxltQQ3LcNEJc/flUNRgDUnks++BwmNmyxDVsKbegPhHzAKKJbJpKW2ZXgpYVq4xRz643zNY5y2ov42fFAmqP2e49/C8SfWKYfgS21Y4R41/o3y2Me4i750zFOwoWnpAz9cxw1epv/8NNO3d0LStFb+K9cx9NN0KzwG+216WfvkCFL2xeZxvTVTQ4wglUtnT89PIPZw5DJ0lMR3zxVV3QulOzNju2KcB8N3++wJHHSZBPG2mz1L1EY15NZkaZSxdHc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(110136005)(5660300002)(30864003)(6506007)(82740400003)(9686003)(86362001)(33656002)(55016002)(186003)(7696005)(336012)(478600001)(47076005)(82310400003)(70206006)(26005)(316002)(4326008)(356005)(83380400001)(36860700001)(52536014)(2906002)(70586007)(81166007)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 15:19:49.4794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0990b1d-a73c-42b5-d6c9-08d8d420a218
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5848
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis via
>lists.yoctoproject.org
>Sent: 18 February 2021 15:05
>To: meta-virtualization@lists.yoctoproject.org
>Cc: nd <nd@arm.com>
>Subject: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
>current master
>
>Bump SRCREV version of xen recipes to use the latest 4.14 release
>(4.14.1) and the current status of master.
>
>This allows to remove some patches related to gcc 10 support which have no=
w
>been merged in Xen.
>
>Xen-tools is modified to include the latest tools installed with Xen:
>- a rename of the bash-completion,
>- a new xl example,
>- xen-access,
>- xen-memshare (only available on x86).
>
>A new patch to fix python and pygrub is added as the makefiles have been
>deeply modified in 4.15 which require a new patch (but doing the same).
>
>Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73
>+++++++++++++++++++  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 --=
--
>-----------  ...uild-temporarily-inhibit-Werror-4.14.patch | 26 -------
> recipes-extended/xen/xen-tools.inc            | 14 ++++
> recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
> recipes-extended/xen/xen-tools_git.bb         |  6 +-
> recipes-extended/xen/xen_4.14.bb              |  2 +-
> recipes-extended/xen/xen_git.bb               |  2 +-
> 8 files changed, 92 insertions(+), 95 deletions(-)  create mode 100644 re=
cipes-
>extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
> delete mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-
>gcc10-snprintf-warning.patch
> delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily-
>inhibit-Werror-4.14.patch
>
>diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-
>xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-
>DISTUTILS-xen-4.15.patch
>new file mode 100644
>index 0000000..35cd9a8
>--- /dev/null
>+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4
>+++ .15.patch
>@@ -0,0 +1,73 @@
>+From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00
>2001
>+Message-Id:
>+<6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.m
>arqu
>+is@arm.com>
>+From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>+Date: Fri, 19 Oct 2018 11:01:37 +0200
>+Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py
>+args
>+
>+Upstream-Status: Xen: Inappropriate [oe specific, python install
>+issues]
>+
>+Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR) as
>+well as other parameters set by the OpenEmbedded build system.
>+This is especially useful when the target libdir is not the default one
>+(/usr/lib), but for example /usr/lib64.
>+
>+Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>+
>+Forward-ported to Xen 4.12.0
>+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>+
>+Modified to support pygrub installation with python 3
>+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>+
>+Forward-ported to Xen 4.14.0
>+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>+
>+Forward-ported to Xen 4.15.0
>+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>+
>+---
>+ tools/pygrub/Makefile | 7 +++++--
>+ tools/python/Makefile | 2 +-
>+ 2 files changed, 6 insertions(+), 3 deletions(-)
>+
>+diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile index
>+37b2146214..ffb9270065 100644
>+--- a/tools/pygrub/Makefile
>++++ b/tools/pygrub/Makefile
>+@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>+ all: build
>+ .PHONY: build
>+ build:
>+-	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
>LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>++	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
>++LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>++$(DISTUTILS_BUILD_ARGS)
>+
>+ .PHONY: install
>+ install: all
>+@@ -18,7 +18,10 @@ install: all
>+ 	CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
>+ 		LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
>+ 		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>+-		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
>++		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
>++		 $(DISTUTILS_INSTALL_ARGS)
>++	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>++	$(INSTALL_PYTHON_PROG) src/pygrub
>$(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>+ 	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>+ 	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>+ 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \ diff --git
>+a/tools/python/Makefile b/tools/python/Makefile index
>+cc76423647..5cb11ae453 100644
>+--- a/tools/python/Makefile
>++++ b/tools/python/Makefile
>+@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)"
>LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
>+            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
>+            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
>+            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
>+-           $(PYTHON) setup.py
>++           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
>+
>+ .PHONY: build
>+ build:
>+--
>+2.17.1
>+
>diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprin=
tf-
>warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-
>snprintf-warning.patch
>deleted file mode 100644
>index 0a136c9..0000000
>--- a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-
>warning.patch
>+++ /dev/null
>@@ -1,60 +0,0 @@
>-From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00
>2001
>-Message-Id:
><0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.bertrand.m
>arquis@arm.com>
>-From: Bertrand Marquis <bertrand.marquis@arm.com>
>-Date: Thu, 15 Oct 2020 10:16:09 +0100
>-Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
>-
>-Add a check for snprintf return code and ignore the entry if we get an -e=
rror.
>This should in fact never happen and is more a trick to make gcc -happy an=
d
>prevent compilation errors.
>-
>-This is solving the following gcc warning when compiling for arm32 host -
>platforms with optimization activated:
>-xenpmd.c:92:37: error: '%s' directive output may be truncated writing -
>between 4 and 2147483645 bytes into a region of size 271 -[-Werror=3Dforma=
t-
>truncation=3D]
>-
>-This is also solving the following Debian bug:
>-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970802
>-
>-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>-Acked-by: Wei Liu <wl@xen.org>
>----
>-Upstream-status: Backport from 4.15
>----
>- tools/xenpmd/xenpmd.c | 9 +++++++--
>- 1 file changed, 7 insertions(+), 2 deletions(-)
>-
>-diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c -index
>35fd1c931a..12b82cf43e 100644
>---- a/tools/xenpmd/xenpmd.c
>-+++ b/tools/xenpmd/xenpmd.c
>-@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
>-     FILE *file =3D 0;
>-     struct dirent *dir_entries;
>-     char file_name[284];
>-+    int ret;
>-
>-     do
>-     {
>-@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
>-         if ( strlen(dir_entries->d_name) < 4 )
>-             continue;
>-         if ( battery_info_type =3D=3D BIF )
>--            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PAT=
H,
>-+            ret =3D snprintf(file_name, sizeof(file_name),
>-+ BATTERY_INFO_FILE_PATH,
>-                      dir_entries->d_name);
>-         else
>--            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PA=
TH,
>-+            ret =3D snprintf(file_name, sizeof(file_name),
>-+ BATTERY_STATE_FILE_PATH,
>-                      dir_entries->d_name);
>-+        /* This should not happen but is needed to pass gcc checks */
>-+        if (ret < 0)
>-+            continue;
>-+        file_name[sizeof(file_name) - 1] =3D '\0';
>-         file =3D fopen(file_name, "r");
>-     } while ( !file );
>-
>---
>-2.17.1
>-
>diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit=
-
>Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-
>inhibit-Werror-4.14.patch
>deleted file mode 100644
>index 0e0a3dc..0000000
>--- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror=
-
>4.14.patch
>+++ /dev/null
>@@ -1,26 +0,0 @@
>-From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00
>2001
>-From: Bruce Ashfield <bruce.ashfield@gmail.com>
>-Date: Thu, 18 Jun 2020 09:05:22 -0400
>-Subject: [PATCH] xen/build: temporarily inhibit Werror
>-
>-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> -Rebased on Xen
>4.14:
>-Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>----
>- tools/libxl/Makefile | 2 +-
>- xen/Rules.mk         | 2 +-
>- 2 files changed, 2 insertions(+), 2 deletions(-)
>-
>-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile -index
>6da342ed61..c67560e269 100644
>---- a/tools/libxl/Makefile
>-+++ b/tools/libxl/Makefile
>-@@ -11,7 +11,7 @@ MINOR =3D 0
>- XLUMAJOR =3D 4.14
>- XLUMINOR =3D 0
>-
>--CFLAGS +=3D -Werror -Wno-format-zero-length -Wmissing-declarations \
>-+CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarations \
>- 	-Wno-declaration-after-statement -Wformat-nonliteral
>- CFLAGS +=3D -I. -fPIC
>-
>diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen=
-
>tools.inc
>index 0c69fec..722c503 100644
>--- a/recipes-extended/xen/xen-tools.inc
>+++ b/recipes-extended/xen/xen-tools.inc
>@@ -234,6 +234,8 @@ PACKAGES =3D " \
>     ${PN}-xl-examples \
>     ${PN}-xm \
>     ${PN}-xm-examples \
>+    ${PN}-xen-access \
>+    ${PN}-xen-memshare \
>     "
>
> PROVIDES =3D+ " \
>@@ -633,6 +635,7 @@ FILES_${PN}-xen-watchdog =3D "\
>
> FILES_${PN}-xl =3D "\
>     ${sysconfdir}/bash_completion.d/xl.sh \
>+    ${sysconfdir}/bash_completion.d/xl \
>     ${sysconfdir}/xen/xl.conf \
>     ${libdir}/xen/bin/libxl-save-helper \
>     ${sbindir}/xl \
>@@ -642,6 +645,7 @@ FILES_${PN}-xl =3D "\
> FILES_${PN}-xl-examples =3D "\
>     ${sysconfdir}/xen/xlexample.hvm \
>     ${sysconfdir}/xen/xlexample.pvlinux \
>+    ${sysconfdir}/xen/xlexample.pvhlinux \
>     "
>
> FILES_${PN}-xm-examples =3D "\
>@@ -692,6 +696,16 @@ FILES_${PN}-xendomains +=3D "\
>     ${sysconfdir}/sysconfig/xendomains \
>     ${systemd_unitdir}/system/xendomains.service \
>     "
>+FILES_${PN}-xen-access +=3D "\
>+    ${sbindir}/xen-access \
>+    "
>+
>+FILES_${PN}-xen-memshare +=3D "\
>+    ${sbindir}/xen-memshare \
>+    "
>+
>+# memshare is only built for x86, so allow empty package for other
>+archs ALLOW_EMPTY_${PN}-xen-memshare =3D "1"
>
> INSANE_SKIP_${PN} =3D "already-stripped"
>
>diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-
>extended/xen/xen-tools_4.14.bb
>index 73a52bc..a79b41d 100644
>--- a/recipes-extended/xen/xen-tools_4.14.bb
>+++ b/recipes-extended/xen/xen-tools_4.14.bb
>@@ -1,4 +1,4 @@
>-SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>+SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>
> XEN_REL ?=3D "4.14"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>@@ -6,8 +6,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>-    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
>-    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>     "
>
> LIC_FILES_CHKSUM ?=3D
>"file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5"
>diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-
>extended/xen/xen-tools_git.bb
>index 1f6be1d..71850ee 100644
>--- a/recipes-extended/xen/xen-tools_git.bb
>+++ b/recipes-extended/xen/xen-tools_git.bb
>@@ -1,13 +1,11 @@
>-SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>+SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>
> XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "master"
>
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>-    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
>-    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>     "
>
> LIC_FILES_CHKSUM ?=3D
>"file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5"
>diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-
>extended/xen/xen_4.14.bb
>index 91e8988..653e3b6 100644
>--- a/recipes-extended/xen/xen_4.14.bb
>+++ b/recipes-extended/xen/xen_4.14.bb
>@@ -1,4 +1,4 @@
>-SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>+SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>
> XEN_REL ?=3D "4.14"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>diff --git a/recipes-extended/xen/xen_git.bb b/recipes-
>extended/xen/xen_git.bb index 57791fc..2b62c5c 100644
>--- a/recipes-extended/xen/xen_git.bb
>+++ b/recipes-extended/xen/xen_git.bb
>@@ -1,4 +1,4 @@
>-SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>+SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>
> XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "master"
>--
>2.17.1

