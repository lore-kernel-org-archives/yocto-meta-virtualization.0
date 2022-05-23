Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA711C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:53:23 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.64])
 by mx.groups.io with SMTP id smtpd.web11.25767.1653299594852215075
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=iY5NrDYs;
 spf=pass (domain: arm.com, ip: 40.107.5.64,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X61A768H/CDKlc6Q/2N5PvSbufK8ezr5sTblqJW8+B9lNONS6IdNf96P9Z8EBL0/x0d0WGFA1fVXHpRtyXJmsy/K1wjcVjKdciB/kRsOvRNKQaDEVaXz7eepiWpveGMTeIxUD6dnxx9xHnSCrrLqY1hXe9VBm1iNndfsoWMc6/D0DMB6YlA2RtIHsd3bKN5yl3al3nN94//y0rbAHM3pRaiCdOvaTLCc+wSoh/I6/tCN0kZeqpeXTu5z5HUTe6T7XFlVMe5xLECOIlZyKUwFXGzRcd0kfId9k32/8bwqxC4C4lPpDuU+j9fRvB27GXP/1x3S4enshDEV1XNS9PVxug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgTUs1kDGbofyggDI1dU2ecKKLfr+D1qcpAyjhmqNAE=;
 b=a6xtpaYqsqfTHkanTNa1eGVlATPztKfu9VWNRhGHsFWCgqusIBobggXCO5Qzyu0JgyDcJU5F3Fa8yV+3VHpjEESDXerOUk9QWOEnW7GjSXoTR/74eRqH6YBBbqDjNbJQi8bS7ZthyfjyATXZLYQoLpEAv7Y930P8eDkZ5yA8EbbpzrPmECxSQjI3F5jCQmN0u5aLwT0potpcpGRat9CkVoU28ljPlBBkqtJH7p++pvtJSIq0ZE2BInR30Q1azDmr699gjlGMbK7y7jyH7MMHZ4gay8p6DsB1lb2DwYxXUP6F6tNtX2x8NC8gL3NV0DVJ3hDyYsItcD7H8wIX7ChjJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgTUs1kDGbofyggDI1dU2ecKKLfr+D1qcpAyjhmqNAE=;
 b=iY5NrDYsQ47j2DJKqlqqsoBZnXScI55FvPzShzEsrQlTvw2p6CNyL+HNbxkebbOz7IyAgsdaRJavEvXiC/f/jjpGl1P4AACMhl4visyzwS7xk3xch6ZIhKVCzHX5vCD23AngOjAuhIrrRNDWbOcy8yod4PFjWpXNVUhm5OtcyLA=
Received: from DB9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:1db::16)
 by PAXPR08MB6749.eurprd08.prod.outlook.com (2603:10a6:102:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:53:09 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::e0) by DB9PR06CA0011.outlook.office365.com
 (2603:10a6:10:1db::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 09:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:53:09 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Mon, 23 May 2022 09:53:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae07575abd1c93c5
X-CR-MTA-TID: 64aa7808
Received: from 1576825939cb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A7545B5-1397-4AD0-9509-B3F1910C984B.1;
	Mon, 23 May 2022 09:53:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1576825939cb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:53:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBOb8NB1nmDlOfAwNHf3tCJrzwGk1LrbGg12JzgkIhObrwU8dX6vyohy5gQUuddB+cFONSIgwXsA4BEp7s33kFDWvRthDS21xs9OuLOmAYqDTvfqIyR0kJY/rs8df8GdQgOvGjTVY+9+f5TPBvDJgFgmPWar6GPh4h6Zd2usm1L6pDf0rKxtoXFGHcB59Mkt/V9D67za9DowE8UVKaosypAeBivPZzhSC5k4zpghqvkxhmrlepMyhj1o1v9Fg4jDb3tqvXcqbIJaceo51uNyGxnhEe5VHao67WdVHICIgdHv2R4DwXlGPDeQJ3wD8v6uLEtMAXeGq2CnDicCw86kXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgTUs1kDGbofyggDI1dU2ecKKLfr+D1qcpAyjhmqNAE=;
 b=bA4tywb8b5MVJPa9j9B4VOUTWREtURwt2h3rUGgIEjK3FLrfExNwUO2Cy4uRLxJaYgbCaOkUTUJH+ttLRt1Ud4s/iLY8fAL02ABW1w/C7qKTxcTNlZhe256ZRHBMY98mMD4PtN8PED2Rk301NJQUL16Xs7Uo6h1KnGhRIsdcDwl28Ryp0x5ALTsNiAOwDXLafVjpXNJdkZ/jW45mjKuqDrVMPz5DYCFr1D6iVfnrzCup3nXVgTyYETqJDp8BA/wW3Qap2b24PE9ikKtkEQfK6/+NaKsfcXY2OEncfHQgNLOWnaWFEZNXpu37ctMEPXlWa4Jaot9LWgzVoJo4VO8bYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgTUs1kDGbofyggDI1dU2ecKKLfr+D1qcpAyjhmqNAE=;
 b=iY5NrDYsQ47j2DJKqlqqsoBZnXScI55FvPzShzEsrQlTvw2p6CNyL+HNbxkebbOz7IyAgsdaRJavEvXiC/f/jjpGl1P4AACMhl4visyzwS7xk3xch6ZIhKVCzHX5vCD23AngOjAuhIrrRNDWbOcy8yod4PFjWpXNVUhm5OtcyLA=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4881.eurprd08.prod.outlook.com (2603:10a6:20b:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Mon, 23 May
 2022 09:53:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:53:01 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] xen, raspberry pi:
 replace linux-yocto-dev with linux-yocto 5.15
Thread-Topic: [meta-virtualization][kirkstone][PATCH] xen, raspberry pi:
 replace linux-yocto-dev with linux-yocto 5.15
Thread-Index: AQHYbUW67aLtMmFXxUOWEvNebPWf4K0sOzoA
Date: Mon, 23 May 2022 09:53:01 +0000
Message-ID: <5E6206F7-523C-4FF6-9AB8-91329149AAAA@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <20220521190447.135705-11-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-11-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6c7091a4-9ab0-4ea2-3365-08da3ca20b08
x-ms-traffictypediagnostic: 
	AM6PR08MB4881:EE_|DBAEUR03FT061:EE_|PAXPR08MB6749:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB674978E2E7F6467B315D77339DD49@PAXPR08MB6749.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZB/OCTl4WqYhEyIwScdPqaJwUN4V21x5vZ6wpGwD3qeTq+fMyb4V1AyQQHo623OTpBZjMlLcgokuYOf3gvtjShfaFrAnKaaHG6zny+oXGCojHgE1rsIVPh2raI8pfUK/GCEL0G01/0q3QCICU+0dw/5mfoLnhdEm75Z66gbYt+Rz8hFhMy7cCn3YCD9d0R84Xw71GrJiw0tCGlWbGP5cvRwEP/7dKTSdllB5vcOuIR08puBDd1BpBjg2B1soTKLEn6dPGPAO6eVAVHDHO26P8aYHXXoTOZo36l7xuJOi00+DUl/DxldNPyidpe1F5WB/kY66Vt1AgU2+kKbOQx5LsMDxpdzZ2zS9HXCmlmGYif90mAAQbLyFyLlsNsVj0Caep6tVLxyTbs5Et3lG1O60ShrfaE8AJpKNdlnSd72nc298zB0Y1tXbJrtjheRmAXtzKubDKu/xJTzffm8X+YyfPOnvxF8JC3lgnhDYdr50gweEHnuVwqINSNNv0Ojvo6aFBJXKu5nsZOZz+jJYI1HapdQZhIOvavVwmjUHButTlhJuLaGDzDdLHx89C9paeqqT7+4Q/e2GCdKEgZNi6AU4SZ2DU/ITWfIkYYgkxOikTrqcLn+0FyM32WZpr3GI6WNvMaD4gC6MZGWM0CYmn/61E/TDu21qMyU7YNkxN51dB+4D5yfG2PfdmSu++N0s0KLNbTFCzrGZYX/0cGIaNKMCRbeWVusqGGIbxU8ACj4B/LeJPZGHP3xx6YC4o7xiVLrf
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(38100700002)(76116006)(2906002)(66946007)(38070700005)(316002)(86362001)(83380400001)(54906003)(36756003)(5660300002)(66556008)(8676002)(33656002)(64756008)(66446008)(66476007)(4326008)(6916009)(91956017)(122000001)(26005)(53546011)(6506007)(71200400001)(6486002)(6512007)(2616005)(186003)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D0F156EC74E134AAC12F88D76033230@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4881
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ee77509-d6db-4267-2dd8-08da3ca20649
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n2WXmeJGQioYF9jfu/8odaEtFwkWUWH/00dnzCn0DhLsNbEpZRM+iiK9JUSqrX5PRSWIwGU9x0lpBn+vvZNHfxmqMD98DXmKO6PecHAk3/dg5OS0Kx6/ZlyPJOZgCfLFYlOzlaE285J67ZsjKLIEtCg9iqYfqY91S7II8Q+TbGXy3tvXEKn8fTcwnNaaVO+baHtpTy0mu2tsJSFP8CUB5KXz+PSsWawe7rqEP2/j02pHx+NUuLC0pXlK6qGDxjGWkPVBJf65UFyhz5P537l5mqCrZ30VqaSyaLvSHdV1KJgxQqooQB6TdqXYOt9hsl/Gr7JQ5gVQBbcU1AefGDH4hviswRk5zMY1WHTuO44k3JqVFUYbknEe4ewY50y2179xdveZIxwMnWeB3JgF0Vvor1HAIs8lDTWJipa1JFTXUlGs9rZV0gQLOKPfaBI3hM8BSJJIgjsNZiiFtvQn6jblhLLQa5dEAp0q90pOM8lLh65MyScXlOymoMPdJ2WD58JL3+s+yCfxSTWSW3SSEljAvUyOQ/GWIPDrF6RmgOM0vewvnFoJvfdynRLN43xUeBAQnoMJtdYn8czUFmEBuqzc1yD93h3NzYhA3QXNCMPD7crDxZksgeKUm34/DuDTas4YPchjkQpOrDZ0nKS3hb3XADoVPbuQZtMaYBfEh3VvT7shPgEh17/4CYb5eJD/00HZ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2906002)(336012)(107886003)(2616005)(186003)(26005)(6862004)(8676002)(4326008)(70586007)(70206006)(47076005)(5660300002)(508600001)(40460700003)(6486002)(33656002)(6506007)(53546011)(6512007)(86362001)(83380400001)(81166007)(36756003)(36860700001)(8936002)(82310400005)(316002)(356005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:53:09.3645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c7091a4-9ab0-4ea2-3365-08da3ca20b08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6749
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:53:23 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7314

Hi,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> The default preferred Linux kernel for Xen on the Raspberry Pi 4 in this
> branch is linux-yocto. The alternative provided option is
> linux-yocto-dev, but this is unintentionally a branch tracking configurat=
ion
> rather than a fixed revision so not appropriate for a stable branch.
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

