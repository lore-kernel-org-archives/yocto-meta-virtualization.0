Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web08.13655.1633014190906659250
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 08:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=A3NDr8LX;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjPhVE9uOsLpTqW+BmC0uEHIsgwU5ublob6hRRdXf1Y=;
 b=A3NDr8LXTzRAgsb7ulznvTfze8y1tBF/L8zMhdcyuSdGfbsZBs0kyqmLhjF9cvJEb/EaNwGO5fYCkghcTsLmiA4ceZ0hXQv1BMRDnKZU+UlChKKUvtBjlcWy9X08HjqrLFNL3ltgKvuVSWZ5CzExHzI7qY7B2R+DlSn0lcJ3DuA=
Received: from DB3PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:8::47) by
 DBBPR08MB4693.eurprd08.prod.outlook.com (2603:10a6:10:d7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Thu, 30 Sep 2021 15:03:07 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::2) by DB3PR08CA0034.outlook.office365.com
 (2603:10a6:8::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 15:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 15:03:06 +0000
Received: ("Tessian outbound 8b24208353e0:v103"); Thu, 30 Sep 2021 15:03:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd256267b7e32b02
X-CR-MTA-TID: 64aa7808
Received: from 80725ced3235.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D6183DA-9684-4626-B611-E3B3159F0C6F.1;
	Thu, 30 Sep 2021 15:02:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80725ced3235.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Sep 2021 15:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGcoI9gqixNxusFFZiyt/UB/XLEU1F49N01axjoVbSXZs29MWDRvDLYxZZqY1k1561ibAnbYNgmIOsJGWqObvuh0lhYbEbQ0QqMRwXCqO5gP5sP+TwyPg927bRC4EW5/eF7gD0AcrE15bQ7HEczQKFVvpkmtZI8WYBbkk65PVKZZtRX/OvmMvqcyhNUG1jbm9I68bVAs7F/rKYt7ivOlxC4qfeVEU7I/ITKFENtV6r81D5QUilIz95gJrdOr4mbM14kfPkgQRlJIf940y0+DI73A88ZLM98OMAmQPp34Vku4zBLnJWeDA+Igz23uv813MJuH+Z3mR0P8XoRjy1abhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WjPhVE9uOsLpTqW+BmC0uEHIsgwU5ublob6hRRdXf1Y=;
 b=JPD0pAzu+bAt7Ayrondbr8tqjKaV9HRnQcJz5lPvVTUB+2R2LtSij9FbRt4mmciRFw6dR4ffRvarzKIpBTyGaRnpR0MHmMOiX7Us15ts/e6eQoHKtJutG371mWDPcy+puNaAsGk+tEgXbx3O4sx4hWkaC1gyE39nTAk0RTlGzo1zQgC8lJ+6ox/yBl9l2jpIkiyhGGmTmgvdPhDP7zGlQOj5E2DpjXEWhpGLFLVeW/ymScNx/iFEbH+i2yG39qWaOEXm5xZ+GlrYuAM8dIv6LgFf5D6TbyiTON/mQlXjfiya14M9Bk0zCEgc2xKWitaXsneWNIAj8/7hBQPVskU0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjPhVE9uOsLpTqW+BmC0uEHIsgwU5ublob6hRRdXf1Y=;
 b=A3NDr8LXTzRAgsb7ulznvTfze8y1tBF/L8zMhdcyuSdGfbsZBs0kyqmLhjF9cvJEb/EaNwGO5fYCkghcTsLmiA4ceZ0hXQv1BMRDnKZU+UlChKKUvtBjlcWy9X08HjqrLFNL3ltgKvuVSWZ5CzExHzI7qY7B2R+DlSn0lcJ3DuA=
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Thu, 30 Sep
 2021 15:02:47 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 15:02:47 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [PATCH 2/2] xen, rpi4: Use PARTUUID for rootfs discovery
Thread-Topic: [PATCH 2/2] xen, rpi4: Use PARTUUID for rootfs discovery
Thread-Index: AQHXtgsYha0t4JcpvUidNs/kC8ZcWKu8rF0A
Date: Thu, 30 Sep 2021 15:02:47 +0000
Message-ID: <CBE9B37C-92EA-4FB6-B55D-59A4DC0C8849@arm.com>
References: <20210930145423.17162-1-luca.fancellu@arm.com>
 <20210930145423.17162-2-luca.fancellu@arm.com>
In-Reply-To: <20210930145423.17162-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4221e1af-4475-4834-836a-08d9842368f6
x-ms-traffictypediagnostic: PAXPR08MB6446:|DBBPR08MB4693:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4693E0936D876B4AD2CD334A9DAA9@DBBPR08MB4693.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 37IfxmSGAcSco896xCfNX+LhjNO961DgpilbYCm4mr+pzqCmHhrhghApUNO7sBhcdwwJgFoD+RHjshZKWZ1Xta/yEwr6ybN07IKG7fAOzo9R4dxyzC2pS8F3wXGqYabKcVhAllbRDz80cXo2S+CAMPmC3Gr3PTHuk3OAxOpRJzROdJMyODOTe+sEO+VQ108fau0de80F7/fuAEMMbVfVWyoetai+Vwy+8cYmmmqA+rgop2OMUzPLmVkJBaZGsiafBpxdgL+ix54YofWNWQO/giRJ6BEx9RUofXucrBp4oxpNh9HFNjzHVl/TPcX12SiEYoL0PWYFIorUkU4HaKq3w4//L5AKbQA6oP+MTgpn4WnIsrG0OGG2qSWQ9pEgsoEQiO84IYXv4kIOoXp/Spl+6maDlKZOCoafeFiq7wlTHLNYaOQf5gp58ptu0IfdkhgTgfYDlmVjD/roGYCdrxZ59PVRp6iRZKvgw35uNftWfzoVLTfi2QKOm1USiFFVieja9ArUfkMke7IrP3y1MtsoW4mNf4MxHBZrEOPDwwWK1OTw8LdALbTctBjP2h5ukZdSPEAcZJudh5Sg0AMB3Wmm+VYgyj/6wuA+yq7Z8JcZV9D0sHwh5c5g3GJrFrDi6VG5xYxsDlJ/Mc3nq85Ry0JhJm1XUqaHx8RYeaVgDuwYDHbl/VuyCBBW3hAmCPulZ0RajKi8KDk41NwqBnaaOga0DqVGY6lkL5FTtl8HlMYWdZlpV1PLIWMUYV7FQ7vLQtvk
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6636002)(71200400001)(8936002)(6512007)(2616005)(83380400001)(26005)(37006003)(6862004)(316002)(64756008)(66476007)(38100700002)(66556008)(8676002)(5660300002)(66946007)(86362001)(6506007)(66446008)(122000001)(36756003)(33656002)(91956017)(2906002)(4326008)(76116006)(53546011)(38070700005)(508600001)(6486002)(186003)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6446
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	83929049-6abb-4d5c-d50d-08d984235d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C5w9RCSr4+1ls/XP9DXCRw1c74Z6RgBVrtky6z7PUQYdeRquT+xFcAD/EtgKU/tBhaMkMiYslQWR/qojMJHWVXjVaQBLYZSS9KqOsbJtpx28l8NqOyHmH0IXGMMJvlBgMoiJSsK6VD1Z6kQefUQqUOJzzjpOdHPeOVc2riwm7w0wUQ8T8F1rAVIMD5IdAwjMpxHaM9+e7B6XsaEQo5tunPaCSC6wE4aEkr8IgpZuOjeAwm/enPSU12+FCcXq+Eyp51//b62SXWVyAThp8mLq6oF4mn7lQ5JTRuEFmoybL0mIBYWS47eo641KimvtH4VuHuQQZsdCEKUx+jsPcC1HebBDlcFeDKrXmJ9Fis7qGDVJ+RJ2+yiLD6L1ZjLgf3bWB2l40m1qhSfe0PeRmH71iSwybSy9pGKbvWyZQzFgE7KJzZmy/zw+SxnON3OGvShQuufNFLdD7jxm5pR6deeosvNULDufgNRyrO4FEH8WLMe4MNwJd6CIvupY6pOGsN5CShEKueMUi6ujO1fa9biKwWlm1AnRwMRpIRGNl5fTpcjAl109jKoiksCLN0MPCT3g65UkcGrXY/GG8VUdghnV6g/TDUsOksebrkq4Y/ho3gi2JRrwCA1MWulw15Ojrg5BLaykIOUogMyMQzk+gjE0VmUSMzA8GciAMn/tBNwuL4Esc+sTR0zLLjsY8vxMhMuIqGqDcfuJJ6UTxN83NKr6shNBcHlAnFtshfRIITnQZlc=
X-Forefront-Antispam-Report: 
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(356005)(316002)(47076005)(82310400003)(81166007)(83380400001)(36860700001)(508600001)(26005)(6636002)(186003)(5660300002)(33656002)(2906002)(6512007)(53546011)(8676002)(6486002)(36756003)(37006003)(336012)(8936002)(2616005)(4326008)(70206006)(6506007)(6862004)(70586007)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:03:06.9263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4221e1af-4475-4834-836a-08d9842368f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4693
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA8B46F89385CD43A54B126D7FE584FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Luca,

> On 30 Sep 2021, at 15:54, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>
> The mmc probing order has become unpredictable
> due to recent linux kernel changes, therefore devices
> like the raspberry pi that have two mmc interface most
> of the time can't boot from the hard-coded root path.
>
> Modify the u-boot script to fetch the PARTUUID of the
> second partition of the sd card and use it to put
> root=3DPARTUUID=3D<xxx> in the command line passed to
> the dom0 kernel.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in          | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/fi=
les/boot.cmd.xen.in b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot=
-scr/files/boot.cmd.xen.in
> index 0367e36..9874220 100644
> --- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boo=
t.cmd.xen.in
> +++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/files/boo=
t.cmd.xen.in
> @@ -13,10 +13,6 @@ fdt resize 0x1000
> echo Add boot arguments for Xen
> fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/soc/serial@7=
e215040 dom0_mem=3D'@@RPI_DOM0_MEM@@' @@RPI_DEBUG_XEN_ARGS@@"
>
> -echo Add boot arguments for dom0
> -setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot debug root=3D/de=
v/mmcblk0p2 rootwait"
> -fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
> -
> echo Add a dom0 node to chosen to put Linux boot information in
> fdt mknode /chosen dom0
>
> @@ -32,6 +28,13 @@ fdt rm /scb/pcie@7d500000/pci@1,0/usb@1,0
> echo Delay to allow the MMC card to be ready
> sleep 1
>
> +# Retrieve PARTUUID for the rootfs partition of the sdcard
> +part uuid mmc 1:2 rootfs_partuuid
> +
> +echo Add boot arguments for dom0
> +setenv dom0_bootargs "console=3Dhvc0 earlycon=3Dxenboot debug root=3DPAR=
TUUID=3D${rootfs_partuuid} rootwait"
> +fdt set /chosen xen,dom0-bootargs \"${dom0_bootargs}\"
> +
> echo Load Xen into memory
> fatload mmc 1:1 ${xen_loadaddr} xen
> echo Xen loaded, size: 0x$filesize
> --
> 2.17.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
