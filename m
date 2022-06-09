Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDB8C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:01:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web11.9339.1654768884567691109
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 03:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=JWxImTcV;
 spf=pass (domain: arm.com, ip: 40.107.21.87,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IR2XLqGB704HTCKr0yk/R79/WBs6mH+e6qzHlGc+nTNoeATqXt6p6PtG3140hyIRzIc2bd89Hpn4GIj48g2MnPCLl6Ja3/4u74luwepR0RhFuZ5F539Q/td1Q2tYDmwBlpk68xJITXwo0Aa2n7pLGT7zENt52ITiyftj/ly92+gKoc90JlWT8zcfZGlO4ePki1pypxzD+5doJye88wV3hamrHUYA2w3swyZ7cFz9IpsfZgZznTROQydiwhiyAzP8ZIzX/2BVuj/qQAQdn8/Y+X/p2oS161YpdaZ9hbdIoVvTe9CVi/pkup7xMaxxWy7+susKLxmKWyuGOlMVIbJzyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRfg6p/JvAkG7KvXxB7Jpkl6p9qB6hzVZHMT+FfIpUU=;
 b=ZIzSBcoRS6lkAUwO7HJZaO+JsZ4QobxVYN9xv0rMOhFCrwNkId9aB5qpXXTyTV3C/OrmCa3MULbC/p/FAfFB+GamHOmKJ9h4wO9sDXJUSXFM3ac+M+9kuKZ1NXnRbWgplZJntz/VlXrZn5fpwbuazShRyViVyH7YDA5eUzFliCFGrabrlAv9YZwRtiytqxw383nJcvQk+IdgHpuhocsJvbqLIOS20g4c7pOt3X3xSIjIWHhhP5yhvVlBwwjX8hxOBDLTZSIJ6Pm+XW0SXtzTFbSBzB5H1T1x5BY3+99dH2/cJQtHOtdW0nJ8qcrjdUsp9c1Ci1aJIFbDZ0+3tSXitQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRfg6p/JvAkG7KvXxB7Jpkl6p9qB6hzVZHMT+FfIpUU=;
 b=JWxImTcVVH5tViZQlo232/8n8fQGXjXgJb2KTY7l90t+gzfFfDQDq8mBbyKenf+BdO8vR7d+rSzHVyISwTXC6AHxnjE8tvtBEfVN3oXeDAwjXlOIwZ0R6DK9qjVNW9ZKnlozlt2DqM3Ba9dkwu0hWePqygJQjA2N9/T5kh5h9k8=
Received: from DB3PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:8:1::35) by
 PR2PR08MB4747.eurprd08.prod.outlook.com (2603:10a6:101:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.16; Thu, 9 Jun 2022 10:01:20 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::9e) by DB3PR06CA0022.outlook.office365.com
 (2603:10a6:8:1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 10:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 10:01:20 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Thu, 09 Jun 2022 10:01:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb823ffdf5d9ce25
X-CR-MTA-TID: 64aa7808
Received: from 1ef05fd2ec5f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEC7B5BB-0B6A-404D-9FA8-46417BADC625.1;
	Thu, 09 Jun 2022 10:01:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1ef05fd2ec5f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jun 2022 10:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9sYs5CZO8aaVEJIpwt+6sQ8cHHUlZqpQxguy4sieBgy6vlWQLXLIkgOqvHph1/D35QsjrS+xGK4CXaXpdRUWnuFqEaFnTG+lH0Up1SWjNh9ZXuTSmnAkBX8TRRetjlonEPKsV8cYgBfaJWQbJOxuMCFsgqQyASvIau2vBALX3QKz43//R+Mr6iWuD6Y8J6OCvbSYWQ6ub0x0G6cf5Ef+gxmkvMSACIZYYsmGOyUON6a+mrKPnxIQuCg4enahKceyon4qVzylmMNidwtdLgswE/8eH/Db258B4BL7fBjfJ/6frsQ5iexyJHVEu8fH+IL0uSNOjmFj1WUdCFBgt5EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRfg6p/JvAkG7KvXxB7Jpkl6p9qB6hzVZHMT+FfIpUU=;
 b=ejgmbuRkvPQiMogN7S/O7WPs04ygkjj0xoJlzMtOITC+6xKPV3DfBssP+wjrZTRX/LJFKl02QSrBJZMgCPZOfmXNV0AQKF+exyX7QNs8wPDRmpH0KfDuggcfd03Qw8PCR33FsxgC2fxPRpfZrrb8d0k1dTrFh4+wdNVfFPAVc++XA9XUSH6RnNozVD5Va8HTEOIlvcRhy+Ckq8QEoB3jKYpeChPHOpo5q+iq9kBFMAW21qP5UEiWvPTiqxDH67gVrxz9cc1dxkNX3OdLNlt7uY8Z5ioKEkRSGKNDNLolQonFFmZ1Lh2HQ1PPRcEKt7Gm5+5IwJ23zNU5tClwzQx1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRfg6p/JvAkG7KvXxB7Jpkl6p9qB6hzVZHMT+FfIpUU=;
 b=JWxImTcVVH5tViZQlo232/8n8fQGXjXgJb2KTY7l90t+gzfFfDQDq8mBbyKenf+BdO8vR7d+rSzHVyISwTXC6AHxnjE8tvtBEfVN3oXeDAwjXlOIwZ0R6DK9qjVNW9ZKnlozlt2DqM3Ba9dkwu0hWePqygJQjA2N9/T5kh5h9k8=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:01:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:01:05 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] Revert "xen: Disable PCI on
 qemuarm with Xen"
Thread-Topic: [meta-virtualization] [PATCH 1/2] Revert "xen: Disable PCI on
 qemuarm with Xen"
Thread-Index: AQHYe+eGhkFetrTpVUuJezv1z0XxR61G19kA
Date: Thu, 9 Jun 2022 10:01:05 +0000
Message-ID: <52F65039-0525-4B22-B8D9-7B59B49B02E6@arm.com>
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <20220609095748.176486-2-michal.orzel@arm.com>
In-Reply-To: <20220609095748.176486-2-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9e2723a8-1205-4bd8-6d41-08da49ff00e0
x-ms-traffictypediagnostic: 
	AS8PR08MB6839:EE_|DBAEUR03FT046:EE_|PR2PR08MB4747:EE_
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4747CC0A03AD774B3553822D9DA79@PR2PR08MB4747.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 z7AgiuR+H6vGaQa8Nm7MB3+OM0GbWVZlyLFr8CO0J2ZNdZTglS2ca1C/5Xs9VteE5SNX/kXK6AGzooICG1P2yqI35Rg+vyR+hLQc6uAJd2v8XNvHojALrU1eqndgPdKTDwvkKFTpNosPy3LTZjRWjMunHKm5fN8jwzNC46bejEC/ukqwKay93Y+tNdD2F1k8sQYRl8wyuIaHG0nBoHrIsCrxDiYuz/Ea3TRHQm1RoR0OA3kqBuOF0l7vxIBbZV37KmeNONxucWtr9EVk7/V32xdfsm8diSIKvcVfPYfVWLhtzXQLrT+OjtovMB4uviZEgoFiNPa26LHj54YgOoQ2dlkrkRCsVAgSAUPXS9urHpVFvv+x6CHmVu+7h7hmTn3OHtBSl+Da9f3OzmcpnOKcH4Ydo47C5XiWSBJRHlRCsuKeW7MrYV0TmXM4G+jQsZi0UZRC8RDgjAU2ejwA2v5CjmyKRkktzg4sjDERmMIqJkX0Tj8Lkn8HfKegXPQ+lWeXgtY52+XlUeUYCu/cI3cKIcYmIzr+jKnRr++L1JgcalR9G0F7JFe5sO3GDaDxoiWTg86zb/asjxmjXHx/4GcSdYDPNUOcAYsx63jaDdVU5x6mhVDnYfHbU0Okko0mWgfLRHPvBaGLv40oAZXFZxZfqBatSL4KpYpovHMe9U6uQHb/I3ORNCPB1XWtiS68cWMRR30dV1qLQP1hyOM8tBlEjAPr33NeMYsjJZxpd6P8tUolkNSkdphJ5mXmCMvi8gWqmS+z3n1lTTrNpcsHiIQ0sCTPF1OG3+VMzilqP41ge32By3gG4sSnKUG3NFwe43cOydQ/QXKa0q213ei8k7f5mO/CXD0ZRZMZV/NPKK0R6Gw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(5660300002)(33656002)(71200400001)(66446008)(64756008)(4326008)(8676002)(122000001)(76116006)(91956017)(6862004)(8936002)(66556008)(66946007)(66476007)(37006003)(54906003)(316002)(6636002)(38100700002)(6486002)(966005)(6512007)(53546011)(26005)(6506007)(2616005)(38070700005)(508600001)(86362001)(186003)(83380400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2547F20D07E30343AC52E9BACC8A934F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90a5cb16-5571-4368-2e46-08da49fef7b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FGfD2QgGEUTH6xsxm0t2jVJlREn0ZJL9KcFPorzNk3Wz/AdYH4wnILxFydcfHLIYZiXpkqVX0ut98wj3OmTn+E6OS/v5kNKRGvLxG0ZEBTgCKFltQ+0YBivmCkZ1kTpisT474RbUk/fjI85/ay2S/XbUCJv+hrUL0SZ4bWx69i1GMf0iSbeGCxz/1dYS/s6NM1YPwXAqUrz2hr3GGA77HIA8MauCqZKhzEDY/iwwzJbxElERnz+WcQwXu/OmJoMiR5ZfqOv3XzNxH+NLTyt2hGLN+RFQeSG5RDLeKgAvED5yTvq9KQaEd5Tbcm214JuVnt4hUctuPrrtVvardT0TnLxcLcGDLQXgOnUW2rzL4LWD8jubfH0cweig7wtydpcWkMq1hM7vNXtGEtLowek7XaX0wCuoVh7tBGOfnulE612ZZgsN6EGbJByyIex6M4VMLSVkCl2EuL8MNcyj+TrwgnU8JWglzo3iaLJc4Gk/O7mBhuvwZ9BmvnvdKjYjnSHzMLvOYS+X/c4AOl/EfX5n8Vrx4B4w9Ad8uhmzQZ2RrRWW9h6ACSLGix8kDVHukarbUAFo0L4RV6nX0FuDKsgfKYdcQ3cVP2sqWXG+nhADRiB2rPA1ce+poOH6F6lfscDlVCaHXUJoIAaq792+igVoFvYFkEGhNvaUYz/Xz/osKaalnw7JAHRoiD8Lh7mPumvKuEpz113vY9SqaVBqNz5swUT4L4bXuBKWmuqrqwtg8mEwu7bU51ChOt9YWydFvemV7lMvmghrLwQRhiVrGFme6kCuhuqqcrox4I9nGP9kGPo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6506007)(70586007)(47076005)(36860700001)(36756003)(8676002)(82310400005)(4326008)(5660300002)(186003)(336012)(6862004)(8936002)(83380400001)(81166007)(2616005)(26005)(2906002)(6512007)(356005)(70206006)(53546011)(54906003)(86362001)(6486002)(966005)(316002)(6636002)(508600001)(37006003)(33656002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:01:20.6386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e2723a8-1205-4bd8-6d41-08da49ff00e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4747
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jun 2022 10:01:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7353

Hi Michal,

> On 9 Jun 2022, at 10:57, Michal Orzel via lists.yoctoproject.org <michal.=
orzel=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This reverts commit fb0a7b97db4f419b82309f98a4944ae3330d1e2e.
>=20
> Justification:
> Commit fb0a7b97db4f removed the PCI node from the qemu device tree
> due to the issue when trying to access PCI configuration space that
> was causing Linux running on top of Xen to end up in an infinite loop.
> The investigation showed that the problem occurs due to qemu placing
> ECAM space at 256GiB mark. Even though Xen officially supports on arm32
> up to 12GiB of physical address space, it is able to map it correctly
> for dom0. However, when Linux tries to access the ECAM space and the
> stage2 translation fault occurs, HPFAR register contains incorrect IPA.
> We can say it is incorrect because using hardware AT instruction or
> software lookup, we can obtain the correct IPA from the same VA. This
> can suggest that the problem is related to QEMU fault handling.
>=20
> Instead of removing the PCI node the follow-up commit will disable
> highmem option in qemu which will cause placing ECAM space in the
> 32-bit space.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also tested on kirkstone and dom0 boots fine and pci is working.

Thanks a lot
Cheers
Bertrand

> ---
> classes/qemuboot-xen-dtb.bbclass | 22 ----------------------
> 1 file changed, 22 deletions(-)
>=20
> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.=
bbclass
> index 1f17a86..d43d23a 100644
> --- a/classes/qemuboot-xen-dtb.bbclass
> +++ b/classes/qemuboot-xen-dtb.bbclass
> @@ -63,21 +63,6 @@ write_lops_xen_section() {
> EOF
> }
>=20
> -write_lop_rm_pci() {
> -    cat <<EOF >"$1"
> -/dts-v1/;
> -/ {
> -    compatible =3D "system-device-tree-v1";
> -    lops {
> -        lop_1 {
> -            compatible =3D "system-device-tree-v1,lop,modify";
> -            modify =3D "/pcie@10000000::";
> -        };
> -     };
> -};
> -EOF
> -}
> -
> write_lop_add_to_xen_cmdline() {
>     EXTRA_XEN_BOOTARGS=3D"$2"
>     cat <<EOF >"$1"
> @@ -150,13 +135,6 @@ generate_xen_qemuboot_dtb() {
>     write_lop_add_to_xen_cmdline "${B}/lop-xen-cmdline.dts" \
>         "${QB_XEN_CMDLINE_EXTRA}"
>=20
> -    # On Qemu Arm32, Dom0 accessing PCI config space ends up in an
> -    # infinite loop. Remove pci node from the device tree
> -    if [ "${MACHINE}" =3D "qemuarm" ]; then
> -        write_lop_rm_pci "${B}/lop-rm-pci.dts"
> -        LOP_MODULE_ARGS=3D"${LOP_MODULE_ARGS} -i ${B}/lop-rm-pci.dts"
> -    fi
> -
>     if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
>         bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
>     fi
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7351): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7351
> Mute This Topic: https://lists.yoctoproject.org/mt/91642063/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


