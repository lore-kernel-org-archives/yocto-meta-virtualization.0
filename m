Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE1EC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 08:34:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web11.8847.1642408437829138755
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 00:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=nGNpq1lX;
 spf=pass (domain: arm.com, ip: 40.107.22.42,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtuaG0VjTlmKdcO5r3AQIugQX/ZEujmQXm7aDleRshA=;
 b=nGNpq1lXwXBqsERf4xBm9ncrIZ4gzl6G0u9DVcQnjkt6kH6R6+2mxFEhBkNXl5+w5rQDstHki7MJdBvLbRffFYBVMb9GVpOOssLGF56hpWyCksbbM4KVgs9ZLlZ4TS0CZBmJd7z2V7MZRhq1GjcTYtNNHnIJNLx2z9Z0D7hfYLQ=
Received: from AM6PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:92::19)
 by VI1PR08MB2846.eurprd08.prod.outlook.com (2603:10a6:802:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.13; Mon, 17 Jan
 2022 08:33:54 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::35) by AM6PR04CA0006.outlook.office365.com
 (2603:10a6:20b:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 08:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 08:33:53 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Mon, 17 Jan 2022 08:33:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 904732b92e171e76
X-CR-MTA-TID: 64aa7808
Received: from d8a51584ac00.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54D372E2-CBC8-49F6-A169-DDD33B06F18B.1;
	Mon, 17 Jan 2022 08:33:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d8a51584ac00.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jan 2022 08:33:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+ccS46w9ljxqbhiWC9v/1XtFCKpJzIJ+hb44LEnF8sSzXJGoW3JbZuewdv4qwhQLVnZzAoZPKfBAtRF0A5yQM3wEYWBOZi/0pB2obRwtModuk8IiLzU8tKIvUR6acvOSie3ZpJQpeHk3qMKr+xKCqki4JCodvlsZEIAXTJE//fTF6bVybR9ZkfB4H22jVm7oGKEK4YxWcRacuDPJhDPjDOtopeEYc8GL0XmwKtPs4zPmKTQAgtQ2644IZtFl7PvTRENFv9JEOHngc/sAGxEJmKeXmqbMYFztl7gX3bwsdccLvA+64yJ9kFbXC+fA0Jczq45HZgWx8d7ZR7JdrPr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtuaG0VjTlmKdcO5r3AQIugQX/ZEujmQXm7aDleRshA=;
 b=mPrDTcZhX6mLFxliXdnTdhQTHVSH1gZKrIPM4WU/rKEBWaozh+k13c8S33p3XoYUS5LhS/VlkfHexhUyOCj3wd5k9w5f0h8C02k10RXyD9tW0Bbffgp8L8KiJ5zcFW0IMnVHCPBFSwdYi9NF/GpCgVgjLgaLkaKwl5RdwhSjw+qYd9uWEnv5u4N3ytzDeeL7lagq7UL0+oHQRu257L9+MPQNUYo5+2c+EWO8NAEuqpYrjt7ZxWLun71vgJ6jrbU9hZINJMuKoxV/Ah4/5VudWPXDbqnOAa8rPCi2hVXED87MIczREjN5dTVg1lM43Y3clBZXFyFR21Ubd3znhO87Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtuaG0VjTlmKdcO5r3AQIugQX/ZEujmQXm7aDleRshA=;
 b=nGNpq1lXwXBqsERf4xBm9ncrIZ4gzl6G0u9DVcQnjkt6kH6R6+2mxFEhBkNXl5+w5rQDstHki7MJdBvLbRffFYBVMb9GVpOOssLGF56hpWyCksbbM4KVgs9ZLlZ4TS0CZBmJd7z2V7MZRhq1GjcTYtNNHnIJNLx2z9Z0D7hfYLQ=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 08:33:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 08:33:39 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
Thread-Topic: [meta-virtualization] [PATCH v3 1/2] xen-tools: Load xen related
 kernel modules during system boot
Thread-Index: AQHYCHFZD8WlW53C80aFSCZVLdCOhaxm6PQA
Date: Mon, 17 Jan 2022 08:33:39 +0000
Message-ID: <B3561BB1-3D00-4AA5-8176-9A28789F607F@arm.com>
References: <20220113113059.20489-1-kamil.dziezyk@arm.com>
In-Reply-To: <20220113113059.20489-1-kamil.dziezyk@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7bb14057-ac2f-4c61-01c6-08d9d9941827
x-ms-traffictypediagnostic: 
	AM6PR08MB4915:EE_|VE1EUR03FT063:EE_|VI1PR08MB2846:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB284624F351BBC8D83786E6A29D579@VI1PR08MB2846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bpcyK4XDvNqANCurPA5vuvx2D4MSQwAZUJ69ias1EekfW7nFYJI52o9BUjMyHDLPHO+E4UUuTCLTfgDAhXu4n3y63cTgA6kQDvMtyhdpjlsNmexVbQvcGsZKIuiriZwt431zpA0Tf7F4FOIPqeyAaxiRfy5W3RkaTDssb/F7DicfUUyXgG5L42CCd84Ls9D7l/uXH/17U24lIGjzMiu0bck8eYgtaYrkEWxWsyX+GKWkOSE58hxnWW5utZ5JeudSCuWzbS49KTkZ427GtZhyNn73AsrShy2cUdbKZrqB1c1sZaQWrUcPhBYvr/Zo2iLjmwKFwQLbFQwJQ4ePrLdsb2tTnGzTx5A/4mpoPOhACZoaF884Jgy9rbDFugxbDz2Yrn4nWme2CyTnC6HMnzMiRQVNdGptgXq61XoDJKZ6Y+/Wuqa40eiuzvYUTRJwDYvbHdJHkvo12pDjt8p2p449RR45/xMzvTyo32sJnHvJtOHhW5oLRuQjj4o9RM6eE7Vtfq9yQ0LoPmudQASENnoZlOaOZO1dwW4/dK82Rq6NG7OtxTctTW0jMSzUkkVTtoY9aev5qD9huvaJWAE1qwmFqnP4s8qwVjCWjeJQZpNKzWhQ1SMLVwiSshr+4Mm3cGvyOCKWevJLPmFtg716DSTo5fDo601co25jVW5fWTDUkUHfwRkPf9U8poZd5cjKo8XwDt79trZbhoO2FYbBv5isKBS92bNiod9qWOBiVKL5XSR3vi5emLyNqVXcPUfRK27pWkC9axqhScWfuYrfGQXvYVUnqGGZd93dCFaXngtOYbMKcg2lyF0PE0HkU+OwQyxwDveDlxIxdi+DyvbAcoN+fT2z5uY9W525VFS2BFkND9A=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(91956017)(71200400001)(6862004)(6512007)(4326008)(26005)(5660300002)(53546011)(186003)(6506007)(8936002)(33656002)(2616005)(38070700005)(66476007)(66556008)(66446008)(83380400001)(122000001)(2906002)(64756008)(6486002)(66946007)(316002)(76116006)(86362001)(508600001)(966005)(54906003)(36756003)(6636002)(38100700002)(37006003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <3713B5B1ABABF54BA13CD409C5882362@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b00a20e-00d6-408a-930c-08d9d9940fef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X2ncpp4VF1tcaJjQYAdyaoNtKtJ/VT4CV+FcBDrGbm6cqvdHSqazrDbSV8MV2y9PAtk2H44R/uQ0lWr8kqdlgXEAkjBHU9SO1BaHtXq/iymKmZAIQeEYf8pUKTYYe9QcRBcZNWSdUClx1sV5Mk6pBZ9C+G9BVwW7YjhJrlUPzeKB2jvqCdiYFkpfGSRT3ryEucu+TQJM7CHmviBi7G9dccUnd8VfY1D/hnXIAdCQXzlbK77N8fL394nJjmg/9OI/qVQdcGOcbNJ1lSNqcs+XenWqzYulVUkMH6+P5FeqM0s6Kj4nRcHWtBXW+UOWjqe/VbegRrNebeWfe6ofZrq+njf093kGPUSDtW6Y66KLkFPDchGkMjJ91FeozWKvW9m5sgafckwfzLX8we4c3GtHY67eSH/oentuOGegEYGXhlc1l4V2G8ki7pQbjrO+dHaUbz7/LCbZtwCFUer2dqSW4PeBohsRkzFsMYfeTl9e7mhgXC3OEQLUGJam1WDWP4MEN5/VhkA2zZRU7Uf0o/KE28vN2852s+Edff877ADBik45ta7/oyMCZRUH93TqRkjbw03b2GfFnYCMHqsfoBSUp+rPsoCA8fJW+BONPSMC3RBkFSqyy3MdFGW9ZzwtfwbTi5tSJ9758o1pSXmQ6eZrCKILB8ZNeJd+QYblRUHIIaYGHXjhcjITvwov+OYqI865p4R/dIkPKtSA7UEXFJIW2pawkr0dy1P4IYr50e8SVSgJa5fjVMHGf0SvuydyI4bHeOkd+a3RIC9hrBmUESS/NytcD1KpzNlZd7gBIckKOAuhDwicIPcz3mYakFqIX8hTrm8iPJ8i1hExx2tc2Znfuw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(6862004)(37006003)(508600001)(5660300002)(81166007)(316002)(86362001)(107886003)(36756003)(2616005)(54906003)(70206006)(47076005)(6512007)(8676002)(4326008)(2906002)(33656002)(26005)(70586007)(36860700001)(356005)(336012)(6636002)(966005)(6506007)(83380400001)(53546011)(8936002)(6486002)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 08:33:53.1982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bb14057-ac2f-4c61-01c6-08d9d9941827
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2846
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 08:34:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7005

Hi Kamil,

> On 13 Jan 2022, at 11:30, Kamil Dziezyk via lists.yoctoproject.org <kamil=
.dziezyk=3Darm.com@lists.yoctoproject.org> wrote:
>
> This patch changes the location of xen.conf file, that contains list of k=
ernel
> modules to be loaded during system boot, to "${nonarch_libdir}". This is =
done
> by removing '--with-systemd-modules-load=3D' flag from EXTRA_OECONF varia=
ble.
>
> Previous path based on "${systemd_unitdir}" was not considered by default=
 by
> systemd-modules-load.service.
>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-tools.inc | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
> index ca924f4..6e25046 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -653,10 +653,10 @@ FILES:${PN}-xm =3D "\
>     "
>
> FILES:${PN}-xencommons +=3D "\
> +    ${nonarch_libdir}/modules-load.d/xen.conf \
>     ${sysconfdir}/default/xencommons \
>     ${sysconfdir}/init.d/xencommons \
>     ${sysconfdir}/xen/scripts/launch-xenstore \
> -    ${systemd_unitdir}/modules-load.d/xen.conf \
>     ${systemd_unitdir}/system/proc-xen.mount \
>     ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>     ${systemd_unitdir}/system/xenconsoled.service \
> @@ -744,7 +744,6 @@ SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.serv=
ice"
>
> EXTRA_OECONF +=3D " \
>     --with-systemd=3D${systemd_unitdir}/system \
> -    --with-systemd-modules-load=3D${systemd_unitdir}/modules-load.d \
>     --with-initddir=3D${INIT_D_DIR} \
>     --with-sysconfig-leaf-dir=3Ddefault \
>     --with-system-qemu=3D${bindir}/qemu-system-i386 \
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
> View/Reply Online (#6999): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/6999
> Mute This Topic: https://lists.yoctoproject.org/mt/88394698/3619089
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

