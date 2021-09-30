Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web08.13607.1633014015671841769
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 08:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=M6/44NJw;
 spf=pass (domain: arm.com, ip: 40.107.20.57, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1d0r4d0SB9Orqv2+ZApBb0Md6u0/K70y6JuuCPWdB8=;
 b=M6/44NJw6LnEybCmimAT/KyAaQHnZdlgjkW7tgEOqn8W4th7Fi9h62U6VsCIoUvcV/Y+fwLZSuvxCuHzbe4QiM1tYC2nZdRiwcBq3lxnrH7sF00372LfzwH5uGnr3uV1qmdNIi6xOVAPOQie3lkO+/vzuU2z9YEmnvx+tQb08BY=
Received: from AM6PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:20b:c0::32)
 by DB8PR08MB5468.eurprd08.prod.outlook.com (2603:10a6:10:11a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 15:00:13 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::6d) by AM6PR08CA0044.outlook.office365.com
 (2603:10a6:20b:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 15:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 15:00:12 +0000
Received: ("Tessian outbound 78bf72cc015a:v103"); Thu, 30 Sep 2021 15:00:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 13e2eda8c661.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BA89A21B-88D6-4A60-848E-AB49B9A4495E.1;
	Thu, 30 Sep 2021 15:00:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13e2eda8c661.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Sep 2021 15:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+gqq1TribDLSnPC3R8tLPdbK/7HrEdVBUhw8z8ZG6c//P/6yCeaZW6e4xQUHy11Tze99CHdZzzNpcoyu/VKv8wJlL9W298GsCCHTPcHN2DEFrohigYDQBOe3tGxUAFYDHp+qay2ousQ5YcZ8HnVbB6ltL9FxcFIT9MTamop14i1SC8Z1LwCBzRmXXmr0/BvpXmJB+q9LOnSaFYIdDLseRd6gxYdhdaTNx7FUq0B8NnABUFL5E3Gz/pOH4pa62p79neOKI4jYcWXSzSAvA5+IOALEiWQPJIAunO/o4xbDBM5TP+9Y9uDD/nmfRbvHBB26py+30IrYXKZ+sAXsKfncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n1d0r4d0SB9Orqv2+ZApBb0Md6u0/K70y6JuuCPWdB8=;
 b=XA4Na59pfbLTD28mw9fRRcs84Idd1dzBuyfrKrd987SAkhCZAZCtiutGOpUqjCgTXLgxM2frYNmppTWdBqMNpkd77WdZfH4cGWpJCukbNCRWp9vaATvRZijtIpmR5v//XXEpvTzL1o3CGykQ/aV9lu21/hU+IkGlPyKnECFkG12YWnWnkbHOtsKuNTIU3NJrVJcOd9GlCGlp7mCuw0kIyZGGeqqHR3Vo0OEHTmvzyydgGZwvSSrg9uqTKwj8qyOdHiHDvdBQQG6l18q0kfiyuUMC/zI2rc7sdiWHmm+P0J3PS2NFrj0bUI8ZJ0ed+jR+GfiNX0BlAvKJDF/yiFOX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1d0r4d0SB9Orqv2+ZApBb0Md6u0/K70y6JuuCPWdB8=;
 b=M6/44NJw6LnEybCmimAT/KyAaQHnZdlgjkW7tgEOqn8W4th7Fi9h62U6VsCIoUvcV/Y+fwLZSuvxCuHzbe4QiM1tYC2nZdRiwcBq3lxnrH7sF00372LfzwH5uGnr3uV1qmdNIi6xOVAPOQie3lkO+/vzuU2z9YEmnvx+tQb08BY=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1873.eurprd08.prod.outlook.com (2603:10a6:203:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 14:59:58 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::40a1:ebcb:aa97:5718]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::40a1:ebcb:aa97:5718%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 14:59:58 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen, rpi4: Use PARTUUID for rootfs discovery
Thread-Topic: [meta-virtualization] [PATCH 2/2] xen, rpi4: Use PARTUUID for
 rootfs discovery
Thread-Index: AQHXtgsrXhY0SDim9kuHLfU2xFBfOau8q3vw
Date: Thu, 30 Sep 2021 14:59:58 +0000
Message-ID: 
 <AM6PR08MB34619F7C657AB84B68BDF7F792AA9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20210930145423.17162-1-luca.fancellu@arm.com>
 <20210930145423.17162-2-luca.fancellu@arm.com>
In-Reply-To: <20210930145423.17162-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 4E1C78B3CD3115478C4F8F0C54CFE7C9.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: aa950e74-1553-49cd-99bd-08d984230143
x-ms-traffictypediagnostic: AM5PR0801MB1873:|DB8PR08MB5468:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB54687158E36D44BEAC78F84992AA9@DB8PR08MB5468.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SpzMnffE6ZaWZ0M+R+5r+aywORu1+n03cPT1WAKqGjV6PrMYxhOlQTi+XtP5N3vbAU4OWgHqYSvgTsH2Eofvn3sa2hAS3IHObGQsdo4zESW1mL2jMWhmG/kpzRn9UTHmcWKy1tasCdJV4gNRZeicW2HoLtzIlPOqKjmsNAlENeddwmfRRLa82OjgGT7oVdZxgr42Te7XrI8KqoB1JLFTJGnH000fFDIZkNCoMz1zGCf1RqIkH/pplQaMsUVegvfM8mYdH27F35IZIRIMhrW9bDtFvaUP0g5CHxPe7A3pLO9xqDoF/y9/8LGACFHOBOtmGfIRNRRXzs+e9SPGsJVuq81Dt/uZnTkClcP9Nh5j41mFHEN0iEo2CeJ44Afw+EbkUl2xE+n/dmJl/GSt6zxnC2g4J9Z/+tsTNSdfTCa2tq0MsvqR98jCssWqdqxOrY+TvQdBlfZCP0VrNO7FypTR5lSPkc0m9X7iPUeiuczWgjhAZ2oUi5reCSyERwRfsmkh6fwcnTDtky9voDttzIN69lOfTGNmYUO7SbkMI6tZePtJx2ZGqpp/cwA161p+HxuSaPLy96psmkGFzvNQdMJRFAV40qoznUWbmDUVu3a+ZH/haewV3axUOZ9olpkhqo1oYp13GOXHo+rXmEB5Sjbxix5Jg57OlVpuQs9Kh0UDzdM9smVS73oXpLg9aMfW96VRFFB3fIdNu20bv4u65zL3oQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(8676002)(26005)(8936002)(186003)(4326008)(55016002)(9686003)(508600001)(2906002)(66476007)(66556008)(38100700002)(66946007)(66446008)(83380400001)(76116006)(64756008)(5660300002)(122000001)(316002)(110136005)(33656002)(6506007)(38070700005)(7696005)(55236004)(86362001)(52536014);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1873
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6421ab32-a965-4edd-e9ec-08d98422f86f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JDQl6FEL627CVL0u/tUVhJO9gVuS0IeZyUcp73SWmro5m+Rf8/6DpZpuSLUW2BNktYyQEhYYoKxPE6rzQkMuCvp66nr8P0UmM0dD5pXvpfaGvIRAA5a6Y4pOeDctV50TT82DkcFDHj1fvsia0mCVk05Dtu6ptmSmTFv77CgZ0s0/G3seg55y/1SyxkdoMs6/bGfU8O3RVw1JYo5opwKsHjJh2bUYLoQNT1fa8r6lnMbI2w2BBmR91ig+vdTc3iQlfmWTunxZqBDVVqn9BhBl5/juF5MSDJcBso+U7GFZJMYnIkJj57Dai197HDDSHCZEG3eDxgsaxzy3Rx356442M/dF5J5YV2nGhaSiWy20Gp3ve5bY8A7AOu9sj025KaLadZfu8GKkaGyteAu7oOKzxL8Zq1i0f/Tk2y3o0X55M4BX9F1nuIBSD/DBeIm9TXxvl7ReqVUFf5/oifJAOkhkF6EPnO8d+2k1+U/92jVbOfHfX5yQHT5H3powOHG7LwPlfWaLyk11r/ryvKm6q0EtM/tloYlXN/LSN0ZHLAh6P5ySlGpdoPLtROfb1y7RLmX7VUtBlykWf6dWOGTTj1K278Tu5IrI+bVIInyLY4WtAqap+jrhSEjckzovxKax4vmliVo2ozU+P86VzImJVHnJ+lgTsYOJD1A2AmqwnoT3/XJlDuTsq1NggCWtjONrmdzEycXLWDW0suVzxUMJ/HkLSuVMkh6wZBu0iyJvAVfr1ZM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(5660300002)(8936002)(9686003)(26005)(336012)(81166007)(52536014)(508600001)(55016002)(186003)(356005)(8676002)(7696005)(70586007)(70206006)(316002)(110136005)(47076005)(33656002)(2906002)(83380400001)(6506007)(4326008)(86362001)(82310400003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:00:12.8485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa950e74-1553-49cd-99bd-08d984230143
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5468
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of luca fancellu via
>lists.yoctoproject.org
>Sent: 30 September 2021 15:54
>To: meta-virtualization@lists.yoctoproject.org
>Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>Subject: [meta-virtualization] [PATCH 2/2] xen, rpi4: Use PARTUUID for roo=
tfs
>discovery
>
>The mmc probing order has become unpredictable due to recent linux kernel
>changes, therefore devices like the raspberry pi that have two mmc interfa=
ce
>most of the time can't boot from the hard-coded root path.
>
>Modify the u-boot script to fetch the PARTUUID of the second partition of =
the
>sd card and use it to put root=3DPARTUUID=3D<xxx> in the command line pass=
ed
>to the dom0 kernel.
>
>Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in          | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-
>scr/files/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi=
-
>u-boot-scr/files/boot.cmd.xen.in
>index 0367e36..9874220 100644
>--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-
>scr/files/boot.cmd.xen.in
>+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/bo
>+++ ot.cmd.xen.in
>@@ -13,10 +13,6 @@ fdt resize 0x1000
> echo Add boot arguments for Xen
> fdt set /chosen xen,xen-bootargs "console=3Ddtuart
>dtuart=3D/soc/serial@7e215040 dom0_mem=3D'@@RPI_DOM0_MEM@@'
>@@RPI_DEBUG_XEN_ARGS@@"
>
>-echo Add boot arguments for dom0
>-setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot debug
>root=3D/dev/mmcblk0p2 rootwait"
>-fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
>-
> echo Add a dom0 node to chosen to put Linux boot information in  fdt
>mknode /chosen dom0
>
>@@ -32,6 +28,13 @@ fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0
> echo Delay to allow the MMC card to be ready  sleep 1
>
>+# Retrieve PARTUUID for the rootfs partition of the sdcard part uuid
>+mmc 1:2 rootfs_partuuid
>+
>+echo Add boot arguments for dom0
>+setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot debug
>root=3DPARTUUID=3D${rootfs_partuuid} rootwait"
>+fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
>+
> echo Load Xen into memory
> fatload mmc 1:1 ${xen_loadaddr} xen
> echo Xen loaded, size: 0x$filesize
>--
>2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
