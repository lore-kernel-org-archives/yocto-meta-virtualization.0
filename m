Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8157CC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:23:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.9854.1651238617908725801
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 06:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=IsOYS1sf;
 spf=pass (domain: arm.com, ip: 40.107.20.73,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Lo4mGtYRDOQZbQsExfs2eOXYtk9d0j7kFGMzhqF1y7mrnKB8c1L/JPu8tmo9B6SB3FSB0lQDYGFtTXX3p7BS7uAtPY2/ESsL7I/Ez1Vlzw6Xh6E6sJed1RAuQ/Bu9AFedkzvv0WhEMBP6AKSYFolHWkmCe72qAz9z89S9op/jAqqm5OvETKiwq1MF9KIpFRuVaqYBe9PVTKUd8BZz5JfGsD1m0oTJCrZTCwbTpKgXvNi3kiDIcku0UXHpX+SZ4Ubh4WLGjh90hXzqgdLUnX4vlxwIG4K4N2s1h3Bks8cNEqMc2EtqKyZbxUlMWiatn2QxI/aSVyvsorXHNgDZrgiNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PQAV6y2RR1V5uqRXOqoMGoGidrsRztc60zjV6TxyjQ=;
 b=QlYN5VEfKpKVSw6AdUjt4/2VcQoD6Z20/DfVdVL6dc129rsiKXTr7OZaO9lxIh7/YbiMmAazke3C0haz6WqpmQiWeKyQ0XsnJil5+GD+p017UtkguZops7ndGqWKaDFSWJZRpfi2vjy3CZB/wPalj8LhZ9jYoU6buLAKaJ7j5QSjudh0aEIDw9jM/5ac6d5DdtWOBNDQwh7Trc9mTxw8bFe13gszWmQcByaX8i0IurLDR7fbExMqJ+WvJk+mXL4sC8qE86hiY+OJBfjTMB0b3ciQoGs0+g/UF3mllS/DZlABjaebBLQHx+AEd594caDLG/RW0fDmuet4yGdup/68pQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PQAV6y2RR1V5uqRXOqoMGoGidrsRztc60zjV6TxyjQ=;
 b=IsOYS1sfpfHwhe0uRuOwzQS9muSmnSAOK5v8QbjuuI5lrG7v4Nfb2nIgWdLv83gk7x/g7N0Cfzc1+Qo+EgV3XN2wpxsad7njkwSzjFtmEgOq641A/UW1u/EJZW6EnDKh/a4NAS5MSAhZCZ4j6efS3U+DVhmS0ms1GYGLHm8jcZs=
Received: from AS9PR06CA0747.eurprd06.prod.outlook.com (2603:10a6:20b:487::27)
 by AM8PR08MB6513.eurprd08.prod.outlook.com (2603:10a6:20b:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 29 Apr
 2022 13:23:34 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::ff) by AS9PR06CA0747.outlook.office365.com
 (2603:10a6:20b:487::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Fri, 29 Apr 2022 13:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 13:23:34 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 29 Apr 2022 13:23:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf0e2b1865c3da92
X-CR-MTA-TID: 64aa7808
Received: from bb8b3547c879.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9ED47CD0-E1B5-468F-BB8B-059165500768.1;
	Fri, 29 Apr 2022 13:23:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bb8b3547c879.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Apr 2022 13:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcIpf6nmT9qFX5T0CR3gLMGtr+rmG7gA8EcjyTRTQam6lqiV9KHDGZIKVSu3RfSnhUjvp48DonQaL/Apztic2GjXrpBlsH+TnlnHvG2J11NTLpW7uf36b8XdoUvqXBRiqVaw+Rhb97W0s7gSjd8fgCdSpTzbcetfnBWXeKWPVpb3cCRON+Vi1lo71Bz4oBTaL9puMjqJT/ahIJ/T9c4+JbWnSRwiLlIJcPrzvhNhPLx8SaZGmW7v30jcR5mqs7bq1OUQLl1PWyejUu1MsVnZY+LOdTpIaDK2Wx0OXLvcIhOKsLeaaX1bQSLkA5lU0Zwt2lHpckoIup3x0Csy2n7aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PQAV6y2RR1V5uqRXOqoMGoGidrsRztc60zjV6TxyjQ=;
 b=NNqDJqLiLRIUha+ONQufitdW1pEsUPR9kRZnh5MVDE251iUVeno/SiQbZbgb6rYbPfYtsEExwJ2lVHeP33COiZmnigITa9Y1XcACV5aXafx49d8iM/XLF+6b0H8PyEG0up6TlqhqGzS5kkRGc0VFj62iL0EVnfjwbbcqnAteNgh+O6IQiRO4Xhsl3uH2YNm8Zp9nvcQHOau03lnt8z20v38sq8qsF8QI9QHie5GjK4T3u2PBkyOJT6nx/WDEO/k3Umk78ZE4f7f21vYHuLBvFmCGIsFPePUh9BFgTR/jAmQSnbC7zGtXM76OfNlJSjVEQbc4gAuZhn0FNRhSsWzkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PQAV6y2RR1V5uqRXOqoMGoGidrsRztc60zjV6TxyjQ=;
 b=IsOYS1sfpfHwhe0uRuOwzQS9muSmnSAOK5v8QbjuuI5lrG7v4Nfb2nIgWdLv83gk7x/g7N0Cfzc1+Qo+EgV3XN2wpxsad7njkwSzjFtmEgOq641A/UW1u/EJZW6EnDKh/a4NAS5MSAhZCZ4j6efS3U+DVhmS0ms1GYGLHm8jcZs=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2598.eurprd08.prod.outlook.com (2603:10a6:4:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 13:23:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 13:23:24 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@cardoe.com" <cardoe@cardoe.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>, Diego Sueiro
	<Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Topic: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Index: AQHYWpPid/oZQrV6gE+p6K0H2pRecq0G43AA
Date: Fri, 29 Apr 2022 13:23:23 +0000
Message-ID: <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
In-Reply-To: <20220428000609.26814-2-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0d09df7d-9951-422e-b009-08da29e3762b
x-ms-traffictypediagnostic: 
	DB6PR0802MB2598:EE_|VE1EUR03FT049:EE_|AM8PR08MB6513:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB651316D78F719FF2E0B0C8B39DFC9@AM8PR08MB6513.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 e+3ho95gTM6ZnxZcF4rgmVlRPzi2sJulTloF7Nf0IkNy9HKyzcERgCQZprlzovTFJBWR4nhQJr0i4MbW3qDDISjR88oBW5on4L2lRpKLMw4lErEB9BTyVBsP6TB6I/sPWUNQFnqqsH+PzgYoxWi2sDvK6zWyuAwjDtxbB9bX8tmf5e40y+Dzq7MtCFMi3DU64T1j6JFQ8qNHAU381gfav2P+qz/W5RNOk82t8smAkP5ehiKxUJLjHHab5599f4OPW+LW9sIvYPOE17+o5797EDKPLRQnKwRVOY4Osj8HDyZ1gBkuMWl2qwwpqt/0vlv2PFPoUVr5/YfpH2sgOEv2rPJWGQnDT+kc/to1PColk1qmp7dL/oly2p7MaZV6aak9NelczZ8x3EkPRphIgtrJMRU4+CshW2mc+3OxYXsjNBIV0ucuoPrBZAqrpk5RsXpMzu2ItK1K3pr8FUI3m2u/fWXnmbbtS+4P31YPXIV0Dslxxqx0f2sLNMDQGy1kIgt5PLryhNfSAbGaj14Vd/IVsaKpxI/h7XhkRTOegolXIVh7ZfWhUDmRn1zMzbIQEX7Muzq6SiEnal0sx1nfqGR/UCfCAgIzpaDLVYzU1KMo9hxNdXWrizOvJcSV7osAOZoBYQPrG9Z7cU5q/QPRFOkUGx9dPWC6mURcDaudIWal51DEkLpdNyhyzJHrPWuBJAGs1lK2qia5sA41iBK+CZFvtG92iWIX5Eh1ek30RiXQMZMiTKRRdRD88YUmQ2Iw59Tq8CO23ZIqvaf1FoujzOOBEigzxwxdpF7XTivn+HYoeXnCe13/7ZuLYCH4jMIyrmCN
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8936002)(76116006)(91956017)(966005)(66556008)(66476007)(66446008)(66946007)(71200400001)(5660300002)(64756008)(508600001)(6486002)(8676002)(38070700005)(38100700002)(54906003)(6916009)(86362001)(316002)(83380400001)(186003)(36756003)(2906002)(2616005)(6512007)(53546011)(6506007)(26005)(122000001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4ED588CD89952B4A93429FE264A6DFFF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2598
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7307de42-2e16-42e3-dc5c-08da29e36fe5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0n5hYefsvGfO9/QKpo9YIr6Du47saB0TppgH5mZicSAf2xUNcbrEdiJp/ZwGQBvJeHnbxm4artVardQllc2GXpwA0sA9xCh3rhlp6H3ycmJJ4nxM9GiwbZEfbVBLHG5J7sRC1VDyLK88WhFS9XB9be9QXiLozFTvFUt/8N8Ch/p1YPH/DMMzQ1ygEgtBumM7oGfN0FcZCfqlBndq1XDMyDE/LXifutKdn7N+gH0CcI9cBJ15S8c6GtwEM2y/eGtNIfl25PGOzFnbUMZqRLC1pR8kPY5OvwHCctVwMgi3DwaHXPOWB6pttbFpGaGNaDfdf7xva9PFc/lEaWir0Dopl75obsETDnErN4D0L9i8zkG8uI/XBGtuXy2YEC6EFw0gGfx96BcDU4sqKxXVGV7Ve0xYcfw8YVwAALRl667O5zmdbqlBx07n09BvZXah/0nerGcx79dOGKDknW3SI65X7Y7PIvetwc/2ky2sW8VGvO/wvGQ1nwE6VL3K+vO0yOUW1boooS22nCRgNOV/t6K1ekUv5PdnPYTn316NmbOC4ylthBL7eksC75ZN6w5wXLrmDqpMFikdXvR0b168N0lGeN2PjZF01pJViOQvV7zD4K3K3t76WnA7SQ4SEvnNIVNT8vr2iCaXB96+KhN/vmC3d1/RBL/N0kqogEkmk9vd2ADWmrVkwSVZYbKshyPNNkwtv8+fVarNJlqx+ZJHEpKfdMkoUEYHrHavNpNGOhBvPvObaixn8KWYIEy65S9lCI1Z
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2906002)(508600001)(82310400005)(83380400001)(36860700001)(316002)(36756003)(8936002)(6862004)(4326008)(6486002)(8676002)(70206006)(966005)(70586007)(5660300002)(6506007)(107886003)(2616005)(26005)(6512007)(33656002)(47076005)(186003)(336012)(54906003)(40460700003)(86362001)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:23:34.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0d09df7d-9951-422e-b009-08da29e3762b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6513
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 13:23:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7232

Hi Christopher,

> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> The Spectre and Meltdown mitigations for Xen run PV guests within
> HVM virtual machines, so Qemu is no longer only needed for systems
> configured to run HVM guests.
>
> With the split xen hypervisor and tools recipes, the bios dependencies
> belong in the tools recipe, so move them and replace the hvm
> PACKAGECONFIG option with the recommendation based on target arch.
>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I can build and run on x86 qemu and I get stuck during init in Dom0 (which =
is apparently already known).

Cheers
Bertrand


> ---
> Unchanged since v1
>
> recipes-extended/xen/xen-tools.inc | 9 ++-------
> recipes-extended/xen/xen.inc       | 6 +++---
> 2 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
> index 6bbc8cd..54bc477 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
>
> RDEPENDS:${PN}-dev =3D ""
>
> -# Qemu is necessary on ARM platforms, and to support HVM guests on x86
> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}"
> -QEMU:arm =3D "qemu"
> -QEMU:aarch64 =3D "qemu"
> -
> RRECOMMENDS:${PN} =3D " \
> -    ${QEMU} \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
> +    qemu \
> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vgab=
ios', '', d)} \
>     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP=
_RRECOMMENDS}', d)} \
>     ${PN}-flask \
>     ${PN}-hvmloader \
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 8b86de5..4c38ccf 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -9,13 +9,11 @@ require xen-arch.inc
> PACKAGECONFIG ??=3D " \
>     sdl \
>     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}=
 \
> -    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>     "
>
> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkpolic=
y-native,"
> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd,"
> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware/bio=
s.bin",--disable-seabios,seabios ipxe vgabios,"
> PACKAGECONFIG[externalblktap] =3D ",,,"
>
> DEPENDS =3D " \
> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
>     --disable-rombios \
>     --disable-ocamltools \
>     --disable-qemu-traditional \
> -    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim',=
 '--disable-pvshim', d)} \
> +    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
> +        '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bi=
os.bin"', \
> +        '--disable-pvshim --disable-seabios', d)} \
>     "
>
> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware/vg=
abios-0.7a.bin"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7226
> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
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

