Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A43C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:34:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web11.8849.1642408451733288577
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 00:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=sXrrzIOv;
 spf=pass (domain: arm.com, ip: 40.107.6.87,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg1vf7wwcncCa02BHnXduFraGZrSgscr2UTrfxPsTrA=;
 b=sXrrzIOvDAHdMSXHUA1iZLqd6FjDl6mjUQzEUls7tFI+dJz1Nawd3uhtBRRd86gr445CcqukXWzNhAWKmqKBlmfJXVuLhXRefQT5s9o5wyPDWMGW2z9Z05NyRtkTwsBHgjdMELXo76Se4TyqR0qMTc4bCiwNwsGkwiAZqh1KbQ4=
Received: from AM6P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::26)
 by HE1PR0802MB2569.eurprd08.prod.outlook.com (2603:10a6:3:e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 08:34:05 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::27) by AM6P195CA0013.outlook.office365.com
 (2603:10a6:209:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 08:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 08:34:04 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Mon, 17 Jan 2022 08:34:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0b52e087d58f4e6
X-CR-MTA-TID: 64aa7808
Received: from 4b116aaec54c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0732025A-313F-4259-B882-A60B10CE6EDF.1;
	Mon, 17 Jan 2022 08:33:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4b116aaec54c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jan 2022 08:33:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8PIihyo66VoiG3GCWYhtEXpqe8dt1cHWMaMKPm49D2dQHSkECurJl1OT/oZ0fTnZ4DpRSyoh5wPT/ioJzdWWyWshyOdH4OACCx5k6WGncWOwdgsRA54ySBqVm7wGCPBCgLcSAW+k2Jz/fHT0KoY14yPCQb4ycZAI4kvy8HNgXMO7YOEdew4gHCNo1sA1QHHr8ZtDoqTKTm9HaC5EZJUF1VTFP+TGGrmPjV4GAwCUSrObS22xHhTzEmA9H+tOzvlRArLeNlcRKpyxbc4yIXmMwRfvjxQMvZZ6wlIZRRaTyODabI/RiB/qfq4j8tvQG7ouDJh05W97RHNJHdRsbw2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg1vf7wwcncCa02BHnXduFraGZrSgscr2UTrfxPsTrA=;
 b=kBXrB/Bn4dcTwei4ajbx/rPF/Q+sVbsv8rxl6PoDRHu8auOd56HbLCp+TabD7Rhh/jWb5rsd/n4c0HX7+bBqMovNEbH0ePRTCSaT1PZqUI5X8yaA9C+ulLx2BhuP9fUHefEImB3r0YXm20s2gOlhUnwayoLvZwBj41xXLbeReXyl2apMUh5T7onJNt5bB/7CtP6evuVl9FIaAqzwKuDa2KHR4VMABAABFJGCbL6sK2VT8NUiFVlI+XN425zfyyCzAxYJObYOheeaOUjE08kdnAcpfEtSGkzEJZXwF1Eb3E2DRpjBSoPRODhVSb5Nx0MPeycgKkg7S8M/aBnRZ1E8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg1vf7wwcncCa02BHnXduFraGZrSgscr2UTrfxPsTrA=;
 b=sXrrzIOvDAHdMSXHUA1iZLqd6FjDl6mjUQzEUls7tFI+dJz1Nawd3uhtBRRd86gr445CcqukXWzNhAWKmqKBlmfJXVuLhXRefQT5s9o5wyPDWMGW2z9Z05NyRtkTwsBHgjdMELXo76Se4TyqR0qMTc4bCiwNwsGkwiAZqh1KbQ4=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 08:33:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 08:33:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH v3 2/2] xen: Clear TUNE_CCARGS for
 Xen build for aarch64 machines
Thread-Topic: [meta-virtualization] [PATCH v3 2/2] xen: Clear TUNE_CCARGS for
 Xen build for aarch64 machines
Thread-Index: AQHYCHFoaSBN5sln4kWD8rFlDbBDyaxm6QiA
Date: Mon, 17 Jan 2022 08:33:56 +0000
Message-ID: <977A07F3-C1CD-407C-AEED-9CC7C5B45E23@arm.com>
References: <20220113113059.20489-1-kamil.dziezyk@arm.com>
 <20220113113059.20489-2-kamil.dziezyk@arm.com>
In-Reply-To: <20220113113059.20489-2-kamil.dziezyk@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b83f3b90-7ab8-4b4b-33eb-08d9d9941eed
x-ms-traffictypediagnostic: 
	AM6PR08MB4915:EE_|VE1EUR03FT062:EE_|HE1PR0802MB2569:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2569A6385816A6988B016D139D579@HE1PR0802MB2569.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5r9U1ISCycUcJgaigZrVyVZoYnKTxf66WJB25Q/hZwyB8r7oS/a9hkVACZPYyAarc31Sf1nTQ0ru5ODrlZ/z/AqQq556xYy5sxqKDDHHPrnDYxcBe7ZnmkUHUWh+lykxq+ubSr6Etl6UOzEQmDSDsz02p96J3zkdFd7busl8ZWWb0vAqqEcQ5hMt+tbV/9n8qmveNOOACCpeNd94StyPOjTcHXWmUHJV92zj5rB3DccWv8Awk9NbdP61jUP6wN7xpMdJnT0fV5ADbCGNoOe3+fe2UVgfXeC/6FoFG4NiPbwvFVMcnwfPsTUDLa30QEjQfBcazG70gvV1P8uY4lV8lTpjSYyLDm8mmrbRrjvZOajCVclQgVokYs/c95tdJzfYe41wW+sY8+b58HgoVEBsyD2Jp0NebLT5d1TLBVBuodT9qNPdxrsK4sMHd0NUO2D1JelUAit5dMU+44t7KzYhB+V4dy4RyURvd7Bh8eFHW4IEfXUzrB7fo4yllHBLLRWFVNeBEfSfJd6T/Gu0WOViqLb2efA9Nv8iCJLb51QyUstdA3I8/LBZmITtsvmH3jhnZTV9I0bQtolsqkX5mLsMte8hVq3aSvMB+r9sneh4XsEprya49Q+vGZCt8Yh5x6Htc87u6r7NjOmiV/XXt40Lyg7ZJZ1jbbOIt3wcG6p/kRiXpYVwnflUZQ1LrhID/uGjUM3qN4LmDUtxVxGUTNktIVmIbvHEXBeYkXDO4EQZnmj32iXRVhZJhM92u8pSLgMupq3+HUDqgsmUzGf6NM2RdzyXM7GrLbxSPuFh9Y7Z2pR2nJxRcM0WURsGciH7zg2yPIdIBMHyZgD8W3Nh+UoNoKzF7xQnkDuxf4yCMT2S+Wk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(91956017)(71200400001)(6862004)(6512007)(4326008)(26005)(5660300002)(53546011)(186003)(6506007)(8936002)(33656002)(2616005)(38070700005)(66476007)(66556008)(66446008)(83380400001)(122000001)(2906002)(64756008)(6486002)(66946007)(316002)(76116006)(86362001)(508600001)(966005)(54906003)(36756003)(6636002)(38100700002)(37006003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <6D12A15A302FFF4C92F97F58D0F7B25F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fa315fdb-0e62-42e4-d7ef-08d9d99419f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4vOW0adSS9f2Dh9eLZbFbwxwPaxf8W4BVNGofNjWfWk2fegpclNwXCaZD32Q5DPk8VR1NNPx1OB6kA9WUhHZ4DjjWmGMGLaKeAEcY7DlzTXURVVNTKBRCUAqot4B39Jv5SgmE0B62aQbL8sC1EsCeqq0ec0R4yBke03kkoVJJqAqUHf8f7Csw+bLBJIdNP87KIywNEKuPG0Z8dPo5V5Jb60iE7wz718kXv6jmGM2AHXtqzoaeL9hbBlT805XSrUvIOJYM1sz0eAVYd315n3GDf45jD1HpT+ebHUGjV3iVjms9vzwv+AlzZZj0KSMKzmKeVKU0Jzivy0i3R13vTP2N/wJrQ9zPYH4WaYLzzi3xmNC+CmeUahm3zknxKSQwTZJfByeQPrb8CGDhFZrwtX8aPOMENx91QvIvfAwbmCFAB4K5DT9UR4U/7MJhRFYis4f9yYf9DiVv74i3rQw26K2f0K5ixz40Cc8Lxlgq+3VxWPt6/suMu3Lu9qv/LIrrmXKicgerb6uaK/v1mUmWQgxyajxYRn+J7AthH0PGwy7aqIDzuSC606K4m1eeCjMdMZWykrSs8oMxa1WGoveoL/isgJT7gkl+uEXDxK8/Ts0x5RMDLXWq/ESvfXGXu4SPpFOrAVZwE3qv5Hq1EIBox6zDFcBixGgVexR33Wdxrr6fs89DH6jg57ImlMB5Kul+OSG5TJGF6uHEqgklNfM/2QyyCtXK0/th2UNuaQtJwCtvv9Tt5elEbW5D0nzPt7k+AJY+kw/zHiWlYXXbwNCU2wipdL/PgCZqXD+wxdZXGvsCpGgZAeLHQ1eh2hCzDbq4Pb4hRmxRGlkEq/VhZXhXt27Ew==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(82310400004)(356005)(26005)(8936002)(8676002)(47076005)(4326008)(6862004)(53546011)(33656002)(6506007)(83380400001)(86362001)(81166007)(36860700001)(6636002)(5660300002)(966005)(6486002)(6512007)(2616005)(336012)(508600001)(2906002)(70586007)(107886003)(54906003)(316002)(70206006)(37006003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:34:04.5816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b83f3b90-7ab8-4b4b-33eb-08d9d9941eed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2569
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 08:34:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7006

Hi Kamil,

> On 13 Jan 2022, at 11:30, Kamil Dziezyk via lists.yoctoproject.org <kamil=
.dziezyk=3Darm.com@lists.yoctoproject.org> wrote:
>
> Xen build may fail for arm machines that have enabled extra flags,
> that can be enabled only for specific architecture version, e.g. armv8-2a=
.
>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-hypervisor.inc | 4 ++++
> 1 file changed, 4 insertions(+)
>
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/x=
en/xen-hypervisor.inc
> index cffd491..81e361f 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -103,3 +103,7 @@ CROSS_CURSES_LIB +=3D "-L${STAGING_LIBDIR_NATIVE}"
> # Specify the root dir of the .config file for do_menuconfig and do_diffc=
onfig
> # tasks
> KCONFIG_CONFIG_ROOTDIR =3D "${S}/xen"
> +
> +# Xen is setting all CC flags on its own. Make sure that they are not mo=
dified
> +# for aarch64, e.g. with architecture-specific optimizations.
> +TUNE_CCARGS:aarch64=3D""
> --
> 2.17.1
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7000): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7000
> Mute This Topic: https://lists.yoctoproject.org/mt/88394702/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

