Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC1C54F3B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web09.26993.1649666275891045402
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 01:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=gcgo6DvH;
 spf=pass (domain: arm.com, ip: 40.107.21.75,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5GyhXPvQXgER+5hAZo2IkzohPQ6jqPtSHni174ocnI=;
 b=gcgo6DvHqqoGAJ55ERQt0o5/rXwWv+Q9yWtFX5eFBB7e7vl0PNsu3Rq9HO57SnK8XasJKf7TU0RskgB345ELymN38PhBBCFYqEogRcaURI9gIDsyWdVS5H0MazGHZqpNKo+Vxml27/TdeNkjazIQMl+mUp3j9E+j9U/ad1TrH1M=
Received: from AM6PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::46)
 by AM9PR08MB7215.eurprd08.prod.outlook.com (2603:10a6:20b:413::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Mon, 11 Apr
 2022 08:37:50 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::48) by AM6PR10CA0033.outlook.office365.com
 (2603:10a6:209:89::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 08:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 08:37:49 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 11 Apr 2022 08:37:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56d5dc4ae20ffc35
X-CR-MTA-TID: 64aa7808
Received: from 966d99c0c9ed.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36753C6C-B1E4-4F81-8839-5FB8888DFDCA.1;
	Mon, 11 Apr 2022 08:37:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 966d99c0c9ed.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Apr 2022 08:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNqaOOEMxUICRHrTuKs3c3tw4ab9/idFO+Uz4ngOHpIA3ar03H85a5NdJAGjgdW7Unj9pOs4ydGxAY4dK0ZKJZKTADeV7EldNC0lAtap3qaC9/AZ0IiyR8J6PwlugBLTJKVk0Fd3m5JqsZ3WixgrJc54KsTRj5R8wRrzoK9tH3+qjmf+tXLPa7PhFlIonlcvfSlBjA5eht1CbJaM244aNAWdnA60lHT+RlBwv+V3UcJAZDSHvM8Vp2UvwGNNXCEJjw1vkPc+8nT+ltSFKnqk6u5lg+XVMwTCpRUu4K8NVtYxoZvdjEYD++wBWg0QDoLBPh3DAc6jxM98AJCFmQ1sTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5GyhXPvQXgER+5hAZo2IkzohPQ6jqPtSHni174ocnI=;
 b=aUU6fHo742XY7WgJsXbIw3jLq1+/7rzFIiJ6sOh36VfzELQrkoQYLrNtMwlqT3d4UtCL3JZ79O4mnTVVePoW2YRZNFgBVG9AoxdA9n8aeHMTgFxoawlDyt/bMKMrvSdA+Tio/Griv0peIhMlPBjdAaRPaZi2vfc1l3nfi6IUXdI8NxCGyDj/yrg4LhCxCQxfazOIiI5UMr5nnaRdkVHXbkz6H3B6FJTwqnS94X4hIeCw+fK/k7lyVvZajUZeI2gD327TD8lvmX/7o40oTj9D78eYaV7sf7WCh0PpcKZqXM2Ibcqk/7vpS9Fe713PpcmXrkayLe0cICWnLFp+fMziFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5GyhXPvQXgER+5hAZo2IkzohPQ6jqPtSHni174ocnI=;
 b=gcgo6DvHqqoGAJ55ERQt0o5/rXwWv+Q9yWtFX5eFBB7e7vl0PNsu3Rq9HO57SnK8XasJKf7TU0RskgB345ELymN38PhBBCFYqEogRcaURI9gIDsyWdVS5H0MazGHZqpNKo+Vxml27/TdeNkjazIQMl+mUp3j9E+j9U/ad1TrH1M=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB4845.eurprd08.prod.outlook.com (2603:10a6:802:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 08:37:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 08:37:28 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
Thread-Topic: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen
 and xen-tools
Thread-Index: AQHYSyT3PeROfVQ/8EmQnVCX2MDFSKzqaHWA
Date: Mon, 11 Apr 2022 08:37:27 +0000
Message-ID: <D8DE52DD-A581-4ADF-B9AE-ABE020EF983C@arm.com>
References: <20220408084420.102085-1-michal.orzel@arm.com>
In-Reply-To: <20220408084420.102085-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 56f503ba-4915-43ce-2d7e-08da1b968fd9
x-ms-traffictypediagnostic: 
	VE1PR08MB4845:EE_|AM5EUR03FT046:EE_|AM9PR08MB7215:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB72155BB7C21C1F65844EF2809DEA9@AM9PR08MB7215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /gJFG0O4gOZJ/FRkMy7Ut/MPJoCGUCAhMyVBihvSfHjNR562Exvm6+2Z94mWV2hQ3RmyZpthXA4h3m5030qd1CjGhDiqQ6jkQcRtg2G/GYu/IG8FY99QOntW9oYHfcYqo3B+mJ3dhmHG98c1vL2KtMSyQUwzGM6FpRR6H3gnbWrmq+PEt31yNAGcF9GD3e9K+ej9kYwCu7u+I99ndKxR4+tY0CxEn3m/8VNpfgNA1PIA6gHtEs9WDwhc7U1dxxwNedch+g20LJxiGxQ3CyvkV8MRbD3b2e2bMDI1zUScG6E2vZR2R31G3ujp+TCIpB7u7pOjW12J62+6qxoUceBe6oc7GSMMrEkDHO8JGbVmauyiDy1bxOgWRhK3jjnp4c4odc3WenWKXbpULkI8l007L7OUO2jB+xwOvQeSY2KfKzEv8VJJWUlYHNudRqciuEezeFJWDIMrid0Y0xKxekJoku026eMmOwpmTjidJ38CZAOpeVIXHHxJ8QwpwGGAY1I/VHuWXuw5+hcdTdQjtK/I3/ZFiU7oAD2aw3dtmXkeUqTv7kSlrFSEuLYCsdrmEps8zF/nEAXzhnGybg0re1Ex9RxncLoFtLzE45DIrA9jwIEg2AqjhztndvIHTNa73BDYX5tmMG66+B1jNyxM0SsTNlcDH7jVzGbnsKkTIXyPQdChCUErsUjanYTjMe6b4w9INvptRAlulbIlCxwAEVi8kJ+ORMhmwlsgbTQ4HPVBFPw7aXraFPMHeYZDNBIsVmws/AXToleynRQn0P0iCBb2dV9ruVMdAJ4SmycduA0WvJz0HNsWxSBGwW6bn89ch6Ou
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(508600001)(316002)(64756008)(66476007)(8936002)(91956017)(76116006)(66446008)(66946007)(66556008)(2616005)(83380400001)(6486002)(54906003)(37006003)(6636002)(86362001)(8676002)(36756003)(5660300002)(71200400001)(38070700005)(4326008)(6862004)(2906002)(38100700002)(53546011)(122000001)(6512007)(15650500001)(6506007)(186003)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBC4706AA1AF314FA8E25A60256CC72E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4845
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1a598f3-34e5-476a-6bf8-08da1b9682d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Zq17+Zn5HIbKk4ZEt8yqr+b2oMdcgjY4PJXHeyVc/r0WcXKZgut+kG0wATI26aNYcSAkBGSEysRF0n7W91OHaYtdCbOGzdN3Ex14VTVlzR0CTMX7IL86yEk5EaEuvhdxJNUmGibrtnKaBRy9pEJxqPmhOUDwl1u6NCGLQ4bfGCouyt2M6Xq+aONYLypFU0Dd14ZKyL/NFpqlQXxZGSbKPQJn8OG+y7uLkI6i3w2uykDGvDDFpEp9k8UznVHYYnjB6lZch/HT4upkP2vnz+9cTfSlgyKPyXRyaVYoN3uyXrDBdAQsO3dR7dUvAXOYQHQkZCunGWwkMp5FE/OuM0QuD4yyaBp6zsxHiVxpExhT/K3ikRCTMLU9jG0pekLJOaux8qjXQhKgNnXus0zvfxUN+mDXmrPuR0jp0hM9dhCu/ucLkNlqcdZJ44u7OzafeyndBz0OSAeGMdUoeK151vRXGp+t4LOF/hyvaMOs93vm+6ZTwFYf+W7sh8nCcp3oyUNifXeGoA6qVkpWuuwpECOUgYro8boPlrHv6oGurS2MSt2ZnL4BaqARUZARcO9QiPrXSpj8wStfs/zKUrP+bLcCpykBJLL+JldyI28wBHQLj3jNyplM3aSPA8T/RJ+Bh8GBsZEc4vNgyoZYRAuXerH5wPabzqPtTXrbJv2YyUPtUro7fcM0/YPcgD/gf3qzDCN8hYNPdO2q+9Kk9PGU5UAEzNR8sEMCH/3BqlORYnWrksjPgbJoLR9EX0nnHYSxirphdw972Xn6pp7V+mab9p14Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(8936002)(70586007)(5660300002)(70206006)(33656002)(186003)(82310400005)(6512007)(53546011)(26005)(36756003)(336012)(2616005)(6506007)(316002)(6486002)(37006003)(47076005)(508600001)(966005)(54906003)(2906002)(40460700003)(15650500001)(8676002)(6862004)(4326008)(81166007)(356005)(83380400001)(86362001)(6636002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:37:49.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56f503ba-4915-43ce-2d7e-08da1b968fd9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7215
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7147

Hi Michal,

> On 8 Apr 2022, at 09:44, Michal Orzel via lists.yoctoproject.org <michal.=
orzel=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Before the next Yocto release, Xen recipes need to be updated.
> This patch series:
> - updates 4.15 recipes
> - introduces 4.16 recipes
> - removes 4.14 recipes

Thanks a lot for this.

For the whole serie:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Michal Orzel (3):
>  xen: Bump SRCREV of 4.15 recipes to 4.15.2
>  xen: Add recipes for stable Xen 4.16 release and update master
>  xen: Remove 4.14 recipes and related patches
>=20
> .../include/meta-virt-default-versions.inc    |   4 +-
> ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ------------------
> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch |  66 -------
> ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 --------
> recipes-extended/xen/xen-tools_4.14.bb        |  21 ---
> recipes-extended/xen/xen-tools_4.15.bb        |   4 +-
> recipes-extended/xen/xen-tools_4.16.bb        |  19 ++
> recipes-extended/xen/xen-tools_git.bb         |   6 +-
> recipes-extended/xen/xen_4.15.bb              |   4 +-
> .../xen/{xen_4.14.bb =3D> xen_4.16.bb}          |   6 +-
> recipes-extended/xen/xen_git.bb               |   6 +-
> 11 files changed, 34 insertions(+), 363 deletions(-)
> delete mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-sta=
nd-alone-set-of-headers-Xen-4.14.patch
> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.14.patch
> delete mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-f=
irmware-as-ffreestanding-Xen-4.14.patch
> delete mode 100644 recipes-extended/xen/xen-tools_4.14.bb
> create mode 100644 recipes-extended/xen/xen-tools_4.16.bb
> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.16.bb} (79%)
>=20
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7130): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7130
> Mute This Topic: https://lists.yoctoproject.org/mt/90331599/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


