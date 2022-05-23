Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F65C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:55:33 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.88])
 by mx.groups.io with SMTP id smtpd.web08.25669.1653299729889194572
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=9qZUnUzr;
 spf=pass (domain: arm.com, ip: 40.107.3.88,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NZGr14vIPsQBt2temugD1/BHd6LCGZFe9p12H0b5AlTWW+BXobA7IB2u6NP5TSPKki/0Ck2vQTlxavBJyoo9byAM5MLYN3OU7OG0QEo5OSLrM604t+0K8hSONGmbiay82NyYlORx61ObCBzbPpVRmL1jfAB2k9TUdbnmTCfbmv+xq5S+SZH9qIM9v6RyEQavBO2oG23lKslsZiYWaCw+wV6rGmvhHpUIG2qy5wWr9cfEkUvKv585wiwk9s7aCZLC+mgosw5DeHIwd519hACE8dN81Gx38IwygwJAz0w71kc4i1xHH9yM3LadYdHFBxxoOAViy9MjKJSzYsBmv/qFSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEG67RQyNHW3hZ+6TDjkPMOLpWGXEx8dUhWpOB09xCo=;
 b=UdVT3plwJU1LccqD16RfRZLfoHMVEI1tvPJi1J8CPLApkihxhueE8Pz0s2Q+QqUnJHp/iESq5RnqhX/NWHK+6yTAvmEC2vPDtnJh0yZpW+ef68JwOCwZvnUrSwEbQ3BLUUN2mO09QROJWgn8yJ3cKO/c1pNFhvpDZOJzq19hrfpVMATw1OErDmvWZw5wSKiDyAd9EtWJjyIoJ19eNEq5dkE3n7NQ0gKSVKFq9rhssY2s3OUhJnzj1wFSkpsMcV+cC5kVvrjAts8EWA57zu2T/xG2rsLIXCvBAKWdudo58hDVEiAhO4xe+qrn0MudZB/YZbtej8Gq4q0fMyH/mvjx8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEG67RQyNHW3hZ+6TDjkPMOLpWGXEx8dUhWpOB09xCo=;
 b=9qZUnUzrtO+kEK00tWZXGl8RTD8zKIK0VJ1D4PaUQnXUmz7Grpf2o8UWv2LwICLiMVHSrb6w9hvK9cUVgqAXehy7TTZ/ldsUj6MBhT/ZbojttYoYcsxAzIHnZks6ncEgis7vG/Od0vnvWtpYQWph/s8onTGggilAoPsmKia+yss=
Received: from AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::35)
 by DB8PR08MB5449.eurprd08.prod.outlook.com (2603:10a6:10:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 09:55:25 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:e6:cafe::b5) by AM0PR10CA0118.outlook.office365.com
 (2603:10a6:208:e6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 09:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:55:25 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Mon, 23 May 2022 09:55:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 168ff5e613d9c89a
X-CR-MTA-TID: 64aa7808
Received: from 96dd75095210.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE52D446-80FE-4F17-9D55-6ABF20A45B5D.1;
	Mon, 23 May 2022 09:55:18 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 96dd75095210.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:55:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGaSaZC2PpKSEBFqpxohe32fyTElIgfwTDiO9wDRLcRj9BUDg3guoSXOY7ERsMUnai5GmQd4obYKQI8k40Ztjuxmp+Nv6oWRlCaBV8Onbzyf/qYvVf992GChl1lDY0tDOEW7MJ7log+mH+OT7+Q2mAE3q/2xAOD3zED6+IIHRjvB+QzmoNBqRZb1hayYaZqYAdoEcXi5JkfiRljp86+LZhlGg5QsYmwD5SRDqcu0vzO2hLyi7Bvln84JPPRQo2ReMsD5jl4Cydqq36m0Ws+KpMAo+ldpqL2gDXG25SSy69a47zAKERqpds380nA06J8zqHAvoEXVaiKGmwsClT/a/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEG67RQyNHW3hZ+6TDjkPMOLpWGXEx8dUhWpOB09xCo=;
 b=LnfiOcgsuFhgBB807Puw2RBh1caZ5w5ddq6JgCLPygcOho5+91e127rWsXN9zMRqDGwuj5MVmqf3rgyQblKaxcDOv3GO+E3dkaR8zmBFy/xe9lRMKYeL00YP4c6px5fZ/AWxe2CEyFrTIU0IzYhKtb0mSxKo2dEvmIUFZxwXcH0hsC8pdM4R2SAQZXZ3eRQCJcSPvC1P6LYwKpMDf5uxLOnv9BUECt/x6YS+7ACQ11TqN+zgOk6Qq9MfnOAAYaBmwKWX1Th9Bt71E8RHUMoIB8kbSdi/RjFK4/ToUIuzcSJab0iyP6AniK2iJ1FBbf7PyZxjNXp3XJ1gPFchmth1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEG67RQyNHW3hZ+6TDjkPMOLpWGXEx8dUhWpOB09xCo=;
 b=9qZUnUzrtO+kEK00tWZXGl8RTD8zKIK0VJ1D4PaUQnXUmz7Grpf2o8UWv2LwICLiMVHSrb6w9hvK9cUVgqAXehy7TTZ/ldsUj6MBhT/ZbojttYoYcsxAzIHnZks6ncEgis7vG/Od0vnvWtpYQWph/s8onTGggilAoPsmKia+yss=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6632.eurprd08.prod.outlook.com (2603:10a6:20b:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 09:55:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:55:17 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][honister][PATCH 2/3] xen: drop patch to
 workaround prelink on aarch64
Thread-Topic: [meta-virtualization][honister][PATCH 2/3] xen: drop patch to
 workaround prelink on aarch64
Thread-Index: AQHYbUWxLPGhzoteZ02PzxHMjNt1i60sO9wA
Date: Mon, 23 May 2022 09:55:17 +0000
Message-ID: <B200D892-AAAF-4971-A312-B13D881BF1F5@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <20220521190447.135705-9-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-9-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c7026b9e-146c-4eae-270a-08da3ca25c00
x-ms-traffictypediagnostic: 
	AS8PR08MB6632:EE_|AM5EUR03FT041:EE_|DB8PR08MB5449:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5449E31ADAAE55248AFBB7209DD49@DB8PR08MB5449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KB+JfUfGdr25MBsKTSuKClRpq0WILNzrV1uE1e69X+UWBcno1z46KE7/M+fi/SsH0RGJ0zHBvNj56RVhF++mpVO61SONFVbFq8aVJqxnNsFSqLH9ABgKHwygIb8jVx/hNSesL3T5ycfwyq0WDl+XNVZfbEd+11UytCQe9trDytsvl6+JMLTiS0u9t6Alfai3rR40/zT3KRDqmdp920oJ+pn8Nrf2aWlrZBnyQJMq+LVFp7bKMPA3qePkuc0hiv3A2hXQ0GxMqNdqX6f3gFao2PQpdi+53ZlpR3CsMNfdzcDZ8eR6zrreSjbDq9DwozTkyJFbh3UeivXrKt0VmCWlLCgRdyGtchjEkR7QshBiFWxIpFJQ8mG0vi8W3vzlPdTQUMtf/dTijRpEnTdytukp9p1p6eXYB77ppsTrANFnK9lVbSm6U2SIwg3PKkVE5SuX6ljdhvYK48NpqYX/2HdzBWCcRSbggtmNSrCXsKoNshHs1Ej0wp92vByVr50Xtf0iwMXdEFm1Xe9KkpeBHWvOggr0pjyAhVbMHcguVRZzAYOPB2WRYNoZUs9OnXwWYaqFGND0zp5Q/rgP/Ots/Un94CWUi7j3Pgr0Fk6WquB67HrJSYOLEGCZ/TVc1qSLFGhLhz8zDDW40QXXL65RMyQ0GKCle/DBXjrCrjbCBP2h6T9FsZo+3GCdPEA5Z1BPv/6e8uQRfSoUvNxGigWc6mbArxm0UJoZJnM/PX9qEH9Qgnw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6916009)(66446008)(64756008)(66476007)(66556008)(38070700005)(316002)(36756003)(38100700002)(33656002)(8676002)(54906003)(91956017)(4326008)(122000001)(76116006)(8936002)(6512007)(5660300002)(83380400001)(6486002)(6506007)(71200400001)(2906002)(53546011)(508600001)(2616005)(26005)(86362001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <58A3C652E24B7A4A98377234D148F9F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f9cd197-61c8-4a2e-9b9a-08da3ca2573b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1UtI0gU83L0eudjYQhSugNdyaH+CGVfNxQBVQIK8O93veeav8BP5ADJrBPPIg51eYajhQPpDD3nlwR0nFkPs1XwmzHUfPyhi39KR6J1wkWkYgFyGkXNrYZ6ZJnEPY8y4JI5BIgXrxLCCJqaJa65phbVvInN9k/Su6dhy5ortYhCIWdEvLjhjp/EsoT7qUuDPcnuEOq4Xui8vnm4PapaB7LIiz1H0Ib55GegSeTCpQV/RnXyQHRp+dyp1J3mTiEBNsR7NAeLGp/jzMXKl1EcxH3EdmzJUPre0Ob7vxAqHUzsYjdaYcCuqGbE8X2xUOGTaYFnedpAwxRFdNiVLpI1ZtoU75QOS8Bq3RUPM4xvanXtFji0qsiqHUMLtkCx0zovbrk7A0MBfbboebP6g7NHwpRs1ZT6RO08bS+Hu6tpQGezdsQ54qbvNqbSnhRMMn2q/qCTU4Jw1nFk4Gy5LM7KIVPidAKYdohbpmi9IQ1KX33ybs+/dHvMZe5MuCEv1HlhHJk1t9q/tdc0Em2dX3fZbm58ZkVO+pIA0I+WYF3IJCQb2SZG0Jig0i38M43qxthWF4dJnerVpXW66lOqVmtrmDD5ZZDY3/PZrQJcTgH7HtsccjlBgcxwz9h3s01dp/XRYqmPRWBwL2n6hbDEzHHFKtMLEvZTpWS9SUtnEHnRr/hc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(40460700003)(81166007)(86362001)(356005)(33656002)(6486002)(508600001)(36756003)(186003)(6512007)(6862004)(8676002)(4326008)(316002)(53546011)(6506007)(70586007)(70206006)(54906003)(8936002)(83380400001)(107886003)(2616005)(47076005)(336012)(82310400005)(5660300002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:55:25.1624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7026b9e-146c-4eae-270a-08da3ca25c00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5449
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:55:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7316

Hi,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> Patch is not needed for image prelinking since the gcc toolchain
> in this branch successfully links Xen without it.
>
> Remove the patch from the stable branch since the BSD license of the
> modified header file differs vs the GPLv2 source code referenced.
> Removal preferred to replacement with a new patch that moves the function
> into GPLv2 .c source files since the build now succeeds without it.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> ...xen-arm64-implement-atomic-fetch-add.patch | 50 -------------------
> recipes-extended/xen/xen_4.14.bb              |  1 -
> recipes-extended/xen/xen_4.15.bb              |  1 -
> recipes-extended/xen/xen_git.bb               |  1 -
> 4 files changed, 53 deletions(-)
> delete mode 100644 recipes-extended/xen/files/xen-arm64-implement-atomic-=
fetch-add.patch
>
> diff --git a/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-=
add.patch b/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add=
.patch
> deleted file mode 100644
> index 6e957a5..0000000
> --- a/recipes-extended/xen/files/xen-arm64-implement-atomic-fetch-add.pat=
ch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> -From: Christopher Clark <christopher.w.clark@gmail.com>
> -Date: Fri, 26 June 2020 16:34:00 -0800
> -Subject: [PATCH] xen: implement atomic op to fix arm64 compilation
> -
> -Xen's ARM implementation of arch_fetch_and_add since f9cc3cd9
> -uses a builtin, despite the build being performed with -fno-builtin.
> -With gcc 10.1.0, this now breaks prelinking spinlock.c, so
> -implement the one atomic operation that is required with logic
> -derived from Linux's atomic_ll_sc.h: ATOMIC_FETCH_OP and comparison with
> -the binary produced with and without the patch with gcc 9.2.0.
> -
> -Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> -diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
> -index e5d062667d..c46dd3ac71 100644
> ---- a/xen/include/asm-arm/system.h
> -+++ b/xen/include/asm-arm/system.h
> -@@ -55,7 +55,32 @@ static inline int local_abort_is_enabled(void)
> -     return !(flags & PSR_ABT_MASK);
> - }
> -
> -+#ifdef CONFIG_ARM_64
> -+
> -+/* see atomic_ll_sc.h:  ATOMIC_FETCH_OP(name, mb, acq, rel, cl, op, asm=
_op, constraint) */
> -+static inline int arch_fetch_and_add(unsigned int *ptr, unsigned long i=
)
> -+{
> -+    int register lptr asm("x0");
> -+    int register result asm("w1");
> -+    int register newval asm("w2");
> -+    int register status asm("w3");
> -+
> -+    asm volatile(
> -+    "   mov       %[lptr], %[ptr]\n"
> -+    "1: ldxr      %w[result], [%[lptr]]\n"
> -+    "   add       %w[newval], %w[result], %w[i]\n"
> -+    "   stlxr     %w[status], %w[newval], [%[lptr]]\n"
> -+    "   cbnz      %w[status], 1b\n"
> -+    "   dmb       ish\n"
> -+    : [result] "=3D&r" (result), [lptr] "=3D&r" (lptr), [newval] "=3D&r=
" (newval), [status] "=3D&r" (status), [i] "+r" (i), "+Q" (*ptr)
> -+    : [ptr] "r" (ptr), "r" (i)
> -+    : "memory");
> -+
> -+    return result;
> -+}
> -+#else
> - #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
> -+#endif
> -
> - extern struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *ne=
xt);
> -
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_=
4.14.bb
> index 0d7d20b..267db16 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -6,7 +6,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
>
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://xen-arm64-implement-atomic-fetch-add.patch \
>     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locat=
ion.patch \
>     "
>
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_=
4.15.bb
> index 0cfaf0c..1b87ae8 100644
> --- a/recipes-extended/xen/xen_4.15.bb
> +++ b/recipes-extended/xen/xen_4.15.bb
> @@ -6,7 +6,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
>
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://xen-arm64-implement-atomic-fetch-add.patch \
>     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locat=
ion.patch \
>     "
>
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
> index 3957de1..2fbfb54 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -6,7 +6,6 @@ XEN_BRANCH ?=3D "master"
>
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://xen-arm64-implement-atomic-fetch-add.patch \
>     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locat=
ion.patch \
>     "
>
> --
> 2.25.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

