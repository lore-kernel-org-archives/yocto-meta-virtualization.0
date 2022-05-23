Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC58FC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:47:43 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.49])
 by mx.groups.io with SMTP id smtpd.web12.25595.1653299257849888706
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=7OfJdpe7;
 spf=pass (domain: arm.com, ip: 40.107.15.49,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Oqk86lAa8s+0qtqECzQ2iBvgmIEoBNK+stz84ou3Kd5YxAsrEUVnRMd5tBH72tq4tm+7omgQuFMsm3C2GvmNfvZRk0YFSTy5W+vk1bdUSc8b1ON2FohlfG/jDnuFDYcOnttsdR84FbXZnspO2sNub6XmeMHmyBGaRYV/GxAmSQHP7GsbtLZGSzd0yqApX4T+V1VkyUDJD3JQ2FHPTbcPk1Mq5c9wVxtmfs6OQ5zQbyeTCagNwSS7rXIXiHUipWCU2R2CodI+zwwhGED6Vj/j3PnvctXtkguGT3JjXs5m7lscgiHLkITXdN4EKrc25ZU8nkHDh7DO+WNnkuSxtR76rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBIvQFkfDlpaLPtvQI0gD/vHxSPomp09HlKYIWUtYFk=;
 b=aI8ebp0NQBdRnRDZXLky4AfdDL2QrUQ2IhXfxZrjV52VVPbtLZSIwCyhH771ZKO7V/LyvSMPXwwpzApbdxGZB1y+4F2Tx+UkpDKlZRljfSBeQ00/BvTtghyKGBRqi2TDLKzcEMrGqmE7LR7P+pRFZZpKgS1+RHE5Xyaj2Xo9ib56fQv0YprCUawmFDPUJO8MQI1JGQR2pWGaen3QG2+R1Ju6pKoVX9hfTuae94mIBhTiiXSed6lLxw6LtD0iQFUzgA+hi1xNf6HuQsNZ0CKVF5vVD/ykAPlo92TpVDD9zSfmpbeOyQv6Sp1ZFzpIFuTJd50eOjg5BSKoZcH561fphQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBIvQFkfDlpaLPtvQI0gD/vHxSPomp09HlKYIWUtYFk=;
 b=7OfJdpe7m0KAodYhUZDtfX1zxFy3g3IqU85gMoCKWNbHZnRahqSWyl5JdCJhFW5CUa4mpKD2o5wrPGoxT5qmbS9OXiQaTdbgkih2v2uo3BTLTah9dnWMHpHfQlJ9C9BORq3rvxi/qUZnhIWklaeXsqBBj/LUfMyJl9Bptah6fdg=
Received: from DB7PR05CA0071.eurprd05.prod.outlook.com (2603:10a6:10:2e::48)
 by AM6PR08MB3064.eurprd08.prod.outlook.com (2603:10a6:209:48::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 09:47:30 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::12) by DB7PR05CA0071.outlook.office365.com
 (2603:10a6:10:2e::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 09:47:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:47:30 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 09:47:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ed73be819831dae
X-CR-MTA-TID: 64aa7808
Received: from ac6bfa24d09d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53B14B8E-4153-49E7-9A14-B74D44083B56.1;
	Mon, 23 May 2022 09:47:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ac6bfa24d09d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYZJ6nmNgtWEkAkIhNlKSDuH57rjVLGmy+Zxd5Fs/QTFG0drLXrqMEaYTWSpEHrFT7SQEkQg2Sla0W8m64mRPELUVHFSTMT3iiYEkZJoMpTkx084MH9H22Z7+mW61gABafdaiH+eaHqMBRcH+jzZlV6YX2Ui/8LPQG1rl2+dex9CYCnA9eOHNJ1NpDF4q/7xK+Dx4Atu91/Gk8QcdUEF/hptl2f5Rv4aqAF1+Difyz4AghKM817S2G/R/pZtp0OqW3A0WUw8FGaYVMfVXuK9xXYNgkhHFcUQYvlfhJGxLLincfE+T+3RSw4lt+2mm6P+UmiyBE/47tZTCQS+XMml1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBIvQFkfDlpaLPtvQI0gD/vHxSPomp09HlKYIWUtYFk=;
 b=k2j9TMceiElG0YZQTTCAn4hc0bUPlITSfZ1BFttxdU3frjYePz/ZC04iy6JIImL9qY6flWNFFpwfob8n+d4SmUcnC2znZa3KZtKuXYamfYUZ+n9HVqY8ZbKOERq3qlU30oYXY+mpjaR7NpEz/LH1PMgZ0r9LvZhPZhUC03DndNF/1MliBOLlq5l8CWV0Y5Bc5rk1slj04asl1wg0/9kzMwje29JVb40yFCRgrpgCvyoohIv7WOlf4fqtjhMCeeh0ba7UJPnll2B42NGNuv5qmwqDQ//HRkYc0LPltTxfBOA3/vW5Equ8UvY9HpPwSXR09qE6cWfwYjZ99bq/rgLTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBIvQFkfDlpaLPtvQI0gD/vHxSPomp09HlKYIWUtYFk=;
 b=7OfJdpe7m0KAodYhUZDtfX1zxFy3g3IqU85gMoCKWNbHZnRahqSWyl5JdCJhFW5CUa4mpKD2o5wrPGoxT5qmbS9OXiQaTdbgkih2v2uo3BTLTah9dnWMHpHfQlJ9C9BORq3rvxi/qUZnhIWklaeXsqBBj/LUfMyJl9Bptah6fdg=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3120.eurprd08.prod.outlook.com (2603:10a6:803:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:47:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:47:20 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re:
 [meta-virtualization][gatesgarth,hardknott,honister,kirkstone,master][PATCH
 0/11] Xen on Raspberry Pi 4 fixes
Thread-Topic: 
 [meta-virtualization][gatesgarth,hardknott,honister,kirkstone,master][PATCH
 0/11] Xen on Raspberry Pi 4 fixes
Thread-Index: AQHYbUW1PnurQN5aq02DA/MPL3aSRK0sOaIA
Date: Mon, 23 May 2022 09:47:20 +0000
Message-ID: <8C32F3E0-0C9B-4628-88E3-9C386807C2C5@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1506c27c-c3bc-42af-2271-08da3ca14101
x-ms-traffictypediagnostic: 
	VI1PR08MB3120:EE_|DBAEUR03FT063:EE_|AM6PR08MB3064:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB30649950DC5000365337BB7C9DD49@AM6PR08MB3064.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6NtU+2helRc+ibXrcYaSKpH6w4xUqWw0/xTPbMxf8IrpvH8mE+w5yVJPzrFRVAfQxetX/Hxy+qsbfiS0dqKz1Gi/hjjfx9mr97UogUMRoH3Zx/Gl9q956pSC3hS9181HxnS4Yz5mbsJ5hckGf3ptW1sknzJmBB5yBL1HLqHZywjC3gOssDnBfgpSEFa/wKms4c1UhaV7rz0XfHp2oIwnSRG9jp0bDuszgx1V5TE5M3Aez/pGPjsTnPiwZQPa/7Bm+qlncP2txs5MSimVIkiesx44kP8mFGLIrL02QfB48ptfDvHaIdDSdn3VYdjF8l/KgAqVtMsj0WXU35ty53760YhswFnhsNLa0cjQFF1uTibVUOVNGsa1fH275eONUdvFEa9QhEkqDF89odBxvWFaNe16AF9Ab6rmAQYnTG/k4FuPnR31UZn2zIWWPoMYWwKY7I1f8OXzVh2d6Xzq7u9fRme71en4hGDLPNjVvgrsQyPUplMYRJ1lfoWbnVkwfZVUMeHc2k62P2l+e910/m3ZBVAFXS0kQrkMbrgtV0Z5ObQnnRcgpuXxvrji9xCp1SgMhJG9vg4YRWm3ioAioF25B3s88NSAq50l1UeV5YQduRCzBELFy487ztesPElXKFWcVm7sXNNqucdjrRgq5Vlc40KVupZ9bLis1LNcZ7cgBkojKsRdXMRkFeBKS2DOrh+XG54YE1hsGT9bsgKE8wKwUk1OerZ+wWjkScC2z3MDAccVM5f24MaXdTrTad1Jg9FR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(66946007)(66556008)(66476007)(66446008)(64756008)(26005)(83380400001)(91956017)(8936002)(8676002)(4326008)(76116006)(6486002)(5660300002)(2616005)(508600001)(33656002)(186003)(86362001)(316002)(122000001)(6512007)(2906002)(38070700005)(36756003)(6916009)(38100700002)(54906003)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DAA952BB70EDA468ABE3E15058D2212@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3120
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	689f902e-d0a9-4937-683c-08da3ca13acf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bra+5PZJLJYmyDREg5qoHgLpIz0X/h2qFH9LCNqzFxYTxh8hePo0neMQrvOYEhOoexyRuQS9sunkOsC1jsqI5EW/KEXQLmbXU4plgKmRL5iRDf/yQ8hMHKlukyOu2c9BvCtnQ/UCEFxbZE///HlTNyGbF9jI3BDcpWV9vBIyb0hRslF5jtrKxPzwF5Yapfpmh4++VLMTYKggPYHftuht4Pw9qufTaY1ESHuu33W1+DPVhuvUNPfM7BUF/yvB6cZzK4swMl1I9LO8CLb0QW0HWa05KElVWUs5Df1xwcy+H0eYajASNiSBbxRHZ5rtQwTwzj8/dI+BjKA17Rw+iF6e7PPMd2888fFSbBKe9HGOr0wGYAHSoXjDuUAN1HEYeTTge/r+7AN1gtQ7DeDLgT9vWUbz5bZFKl6OyuZgqD/IR82+kLg8p49MLkpDde9+VMxLupTL1zu230yPst9ejVGrYhZyvMn3zke/bFeT7S4LsVJRHAbMZ8G11kt8SxK1yf+BpJK1bu18Syr5rTg/T0j23DlI7gPUSBzqskd4mJ1SfPoiw89rtNVckULcj8yeuFiThVFle3VWWMnXtH1rBV2QrWNR3l6P378d+HQKTajez4OUpy6Regn7n96MC2S0J/VIrr/3iB6TbTBqyNam3DfmuCRqofGZofCejYvxkk2Nl52xtWWRlA6U2ENe2ypu2YVM
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(107886003)(8676002)(5660300002)(2616005)(6862004)(86362001)(6512007)(316002)(508600001)(36756003)(8936002)(186003)(40460700003)(33656002)(54906003)(47076005)(4326008)(26005)(83380400001)(336012)(2906002)(36860700001)(82310400005)(356005)(53546011)(6506007)(6486002)(70586007)(70206006)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:47:30.4341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1506c27c-c3bc-42af-2271-08da3ca14101
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:47:43 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7311

Hi Christopher,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> A series of fixes applied to master and across stable branches where
> needed to fix running Xen on the Raspberry Pi 4 board.
>
> This updates Linux kernel configuration for Xen to remove tracking from
> the linux-yocto-dev kernel, either by applying a fixed revision and
> specification of a stable branch or replacing it with the linux-yocto
> kernel. The Xen build configuration is updated to remove the hypervisor
> defconfig for the Raspberry Pi and drop the arm64 prelink patch as a
> license correction and since the build no longer needs it with the newer
> gcc toolchain.
>
> Tested on hardware.
>
> Christopher Clark
>
> gatesgarth:
>  01: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
>  02: xen: drop patch to workaround prelink on aarch64
>  03: xen: fix boot on the Raspberry Pi 4
>
> hardknott:
>  04: linux-yocto-dev, raspberrypi: apply fixed revision to kernel
>  05: xen: drop patch to workaround prelink on aarch64
>  06: xen: fix boot on the Raspberry Pi 4

Hardknott and gatesgarth are EOL so I do not think those patches are needed=
.

>
> honister:
>  07: linux-yocto-dev, xen, raspberrypi: remove tracking bbappend
>  08: xen: drop patch to workaround prelink on aarch64
>  09: xen: fix boot on the Raspberry Pi 4 with Xen 4.14
>
> kirkstone:
>  10: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15
>
> master:
>  11: xen, raspberry pi: replace linux-yocto-dev with linux-yocto 5.15

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

