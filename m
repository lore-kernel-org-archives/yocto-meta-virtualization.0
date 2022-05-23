Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C774EC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:53:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.72])
 by mx.groups.io with SMTP id smtpd.web08.25658.1653299615991120296
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=8tJ5t8FI;
 spf=pass (domain: arm.com, ip: 40.107.6.72,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SPoqOLi3hYyzcVQe4VF9bBjGyxGfNSBvAdG6z70Vnw/uV1xfC/q8xiljjYuzq99fcxLOQci6knhJBwEK0FykRNul63MtqtStM2K4RUWAzT6cvZPTMSztjNds2QLOQ53F+ZTyQJdpZC4wDAS3LOjevDxHWEJt+Z9ni9Ky+yrFYD3F1wcuVh6zX9wgRogkZLq4EAponNVHoo/T7qp95sPT1icNEtOxo54vq2BRsy9f2ZuGmwmvpmRMZSTXbKJCMOWho48hh86Eia2ZRG1ldm8bRnymT3uAAVHlCmx4j94VzwvuzYPz1MBKFoQtobMPJgmjp19FlWFqWVVV0OqwpKRQmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b+hRJcpAE3UV/WKFcxtmy91E0EYBNl0mBX3cURBcxY=;
 b=DEInzBMxZdvPkK22XG1QwOZyU5+eD0nGCLos/SAjBDndHhz/qV578B8zXJMfMo4+Mo3JQl6JR+KHPvqVEMkL4b9yUNladKcUR1ID1BGvtT8VfblyxufuaE4icmLm7LPKZna2yNi0jU1pLQzg3NBubEFE87gV8KUZC0eQQ6leB76OWfCWcZ7E6Ar4zopZYWrcqqSNJ6Lxifv96Esd3uYVmHVXAJRMLB8UqpDMXPRGGDyOv4xGpbO/vS5LiqTs4fdNHJvxb6cTYP1Dlm8o2xrxHBHj2JDIBmUbomq9v+sS+rjK3/MLgbnpsZl1sBb+xSZiBOBJjjhipg/HKzQ1cu2uWw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b+hRJcpAE3UV/WKFcxtmy91E0EYBNl0mBX3cURBcxY=;
 b=8tJ5t8FI8VMOwoaMIsOYJpetR2wn7OS9hUIs1+fVUhnjqMV2k2uMe9PemMiWo9kUP9ROVHIxpNKiVsnhyzrvPkgVwgrHAgwmLeN+tYiPBelFSB6AK0SJswDwZ/tNvLJyxCUTmOCaTOO53qx2IXx0MvhOizDJmoX+MucZoSRAwoA=
Received: from DB6P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::32) by
 AM4PR0802MB2193.eurprd08.prod.outlook.com (2603:10a6:200:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 09:53:31 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::c6) by DB6P192CA0022.outlook.office365.com
 (2603:10a6:4:b8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 09:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:53:30 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Mon, 23 May 2022 09:53:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8ff5c3d71f1f15f
X-CR-MTA-TID: 64aa7808
Received: from 4305bfa0ff25.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E462B3C-3629-4FA8-ABB0-A47270AA99C6.1;
	Mon, 23 May 2022 09:53:24 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4305bfa0ff25.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:53:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaQlIbvR0QUlwbLIpy/qt2erkN7AA0BBzs0S++Nu3oT0liiDmv3hHGtlSks6gCZTgMDOtVLgQVJPWPNcJfppL+urnQRPon3m8djO/OSnQiiqsZ6/EPIgbvb1Xt61T6M4zV3h9RdXEcHuFEUK3kTuCin1wlCDlO4N4UAMvSVPW2mMvg6Pm2tLSMiaxRxvA7qsZCVYb0TttHgrHUqrP4EGAd5q73AZjtrIq1nhsS8ya0CAOBECxhcpu7JIeOkx+teHC2hJXh0oBSK144qoGlx1hEW6rDQsmsWZRKTWDAFzeROeZFItkyhjA061gdJKas02UrAqEkSuaNJ5xVpgGLtoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b+hRJcpAE3UV/WKFcxtmy91E0EYBNl0mBX3cURBcxY=;
 b=P0hfRZmOJTx6U9VWIH4cHqTPr0muuxyaI5xBWqTjBh2ToRwsrb9sbFTj6hREldtbLerJxEjLYyyurhwwxq6Y5GAloDSCzjfxX8uj7NWZY2wVPLXSwPC2Mes6k2QRMc6g5JZo2kMjxggvcMXJu6oAmVPmR6LF6cDluaPkBKLURq13iEys7HybugpPyvSdGfw2WCZPIbbPw4OxV89cKjlZF5Q0bIKy2yA8fpccWuBrdKgdmLjOD/lvcVb0Jqo/1aYd2k2NtlGqmUb7WH9KUNCzD9VAhcqo9W0vpbnYYEJwOxOuTv+Zq4fHjoGoANDCV5vo8SCuyHvvqfZGEuRO5MCTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b+hRJcpAE3UV/WKFcxtmy91E0EYBNl0mBX3cURBcxY=;
 b=8tJ5t8FI8VMOwoaMIsOYJpetR2wn7OS9hUIs1+fVUhnjqMV2k2uMe9PemMiWo9kUP9ROVHIxpNKiVsnhyzrvPkgVwgrHAgwmLeN+tYiPBelFSB6AK0SJswDwZ/tNvLJyxCUTmOCaTOO53qx2IXx0MvhOizDJmoX+MucZoSRAwoA=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6632.eurprd08.prod.outlook.com (2603:10a6:20b:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 09:53:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:53:22 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH] xen, raspberry pi: replace
 linux-yocto-dev with linux-yocto 5.15
Thread-Topic: [meta-virtualization][PATCH] xen, raspberry pi: replace
 linux-yocto-dev with linux-yocto 5.15
Thread-Index: AQHYbUW5FDZAauAYSEG57tDqZZH9Ca0sO1OA
Date: Mon, 23 May 2022 09:53:22 +0000
Message-ID: <546BF863-E952-4CC7-BF37-FFEC7139BB0B@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <20220521190447.135705-12-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-12-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8d3e888d-11e2-48d9-5fd0-08da3ca217dd
x-ms-traffictypediagnostic: 
	AS8PR08MB6632:EE_|DBAEUR03FT013:EE_|AM4PR0802MB2193:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2193888D11B8E44DA0B0010C9DD49@AM4PR0802MB2193.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IHhzXYtDxCXi2SIEWCePmOESatCiSeHl3RjfVhKkxYITfYBBR8JBA7+GtF6GzMnq6YdjczUObGMVxd3HFlkxYZH0KhJGSor2jPuVmPMXrpJiOSyFJu4mjjuZw4OaNVzRymu6/FXyLJLgnn0l18gjYn+TRVFPEDyMjIcnJQ2Fual5M3MJ+AtUZsItE/zf3B+T7lVh5yxjbZiYvvKg3tQqIrCGIWpH1W3LEuR0pLTJjohlU0duD3WXchoHinD+OJDYV3oPrwt21K2YQyMPZBgq5zZwJRmX0558QSh48yh1Y41eUlVGguG8KXxpINpfIyfZrALQ9E8J0P6OJM6yDU4OOirBbNxvyG8GxW5JKbILp/3SNC1AuR0e2RNN/RCj7atamV1IuEolTYALQ4rdloNgRQ0pXo49oDbx9t3xG6szvV82Tnk/OzZCzn7fvmFdFRn7tkS9TSg6XTZbTsxxAFIcWLbSsYhdMkPapK44FJPEIEmR2NanwVApArA5rBUvhPN9IJCGkIclVgglS8Gcer+clDeT4849IPNqcFlcfVNMQzcJB+8dSytR4U4gDnEs/qjbrVDfyA7sKhoIO0dbkzyH5t/m+15a1Uk0FNTxP0n7lqz/FbBP9FoL3Skdbu/nAgN4uMQipFUT9d/ScuBuY74yffAwGA93UL4EFNjlbOEMydupOoWeCA04fgpJ7inek8+ifkxsyPM2perLw/hp89y70sMbdEF65BPO4boIg6x5RBLDI72lfyCA2hOhlZtsqnMh
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6916009)(66446008)(64756008)(66476007)(66556008)(38070700005)(316002)(36756003)(38100700002)(33656002)(8676002)(54906003)(91956017)(4326008)(122000001)(76116006)(8936002)(6512007)(5660300002)(83380400001)(6486002)(6506007)(71200400001)(2906002)(53546011)(508600001)(2616005)(26005)(86362001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7F3D7BF0B23B344A1BC03908500E0D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6650b0dd-8437-4818-e8a7-08da3ca21314
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Q5S/KRSJrP2I1mAhaq/cYhjppNnStBQnno6wp246c7V1PE4JRtev/XQzotMl3OzQlBac5LRrAkmK+iJ1UggkfpqFxhwxPeGApyiiN0EOpzLBOUqto1hRxvmC5ZRnSSPiu31392pWb+KKjeueGL+rrnLzj3f9s3tsG0ACRuH/B9CFZU/DjD0Q6FdbnIUObjZNFom7k3xFJ5rgx8V6nus5XJt3PC5kKArg2/jTVh3OGBESTfGXGITGxo5lR7M8jHXOcvNMAuvM3GkTISMS3+DnamUKpZzJfBaHOzpE38amy/EGik1Zd+GJOsDMTCnpL7P2eIq4w8C5VDgv6nq/3ZPbHvgEaIlnMu2jMMvwh2Qwt481MBymh/lGDD4Fr0IGMUpIAI1xYckQ0sgA9syeHmRCYzjSPsSZCLfqa0iCFLCSr1PwcC4en9ssEulf0hkHHugGWZUg9+0eu4lbvLa5OZa2tJgX0dazaCkxS1WTKOJZ/Wr9/Mz2Lh1xhh4N6OpGZTtQzAcmdymeGRAYYsdKez6loyIX2as74ZdhnWAqn/ufciZUFIFKoyRSDwzHZHJLwpie1Drz1csCNJ6npfRHWfYmXJq3hB2Ad+dafzbMkbneEK+TZrraXrJuDjE6pkCidr+wFz+5yYaQPSmsj6pRC/6+vYKbKqXclXZo1jeE0XdWbWF41DpQH8UVlpdixnH+bdX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(83380400001)(82310400005)(2906002)(5660300002)(316002)(26005)(508600001)(33656002)(86362001)(47076005)(336012)(6506007)(8936002)(6512007)(4326008)(8676002)(6862004)(36860700001)(53546011)(54906003)(70206006)(70586007)(81166007)(36756003)(356005)(2616005)(6486002)(107886003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:53:30.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d3e888d-11e2-48d9-5fd0-08da3ca217dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2193
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:53:43 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7315

Hi,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> The default preferred Linux kernel for Xen on the Raspberry Pi 4 is
> linux-yocto. The alternative provided option is linux-yocto-dev, but
> this is unintentionally a branch tracking configuration rather than a
> fixed revision.
>
> Remove the linux-yocto-dev in favour of the linux-yocto kernel version
> 5.15 which has been tested and verified working on the board.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 --------
> .../recipes-kernel/linux/linux-yocto_5.15.bbappend        | 6 ++++++
> 2 files changed, 6 insertions(+), 8 deletions(-)
> delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-=
yocto-dev.bbappend
> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-=
yocto_5.15.bbappend
>
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend
> deleted file mode 100644
> index 5f43052..0000000
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bba=
ppend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# For a Xen-enabled distro on the Raspberry Pi, override the contents of=
 cmdline.txt
> -# with Xen-on-ARM-specific command line options
> -
> -KBRANCH:raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
> -KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
> -
> -require linux-yocto_xen-rpi.inc
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_=
5.15.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto=
_5.15.bbappend
> new file mode 100644
> index 0000000..572f7ec
> --- /dev/null
> +++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bb=
append
> @@ -0,0 +1,6 @@
> +# Enable use of the linux-yocto 5.15 kernel for the Raspberry Pi 4
> +KBRANCH:raspberrypi4-64 ?=3D "v5.15/standard/bcm-2xxx-rpi"
> +KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> +COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
> +
> +require linux-yocto_xen-rpi.inc
> --
> 2.25.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

