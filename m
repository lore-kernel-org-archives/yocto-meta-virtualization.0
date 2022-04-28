Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6BDC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 15:04:58 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.77])
 by mx.groups.io with SMTP id smtpd.web08.11694.1651158289423430572
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 08:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=E+PvGIn0;
 spf=pass (domain: arm.com, ip: 40.107.7.77,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hfpeb/MmvxY+msIzte6HIJioL8aHqFDzVx0zplM1jak+wYd+b0U4GYkgRsDaxX2KKbasGBeRQ28Ed1zLvUg3fLfA192ZEnEbQ/9TMPbhZI8gQ1UlYpQCWUMG6l5uUcuZzKs9h0WsvqKnRbT2gFM7rZTbGQY9aq0Lizi4a1iQzY4E5TGN3NRr9l+mIIpdgOucsYoXHRu4kM1mk2P+2n8ODG/2IWQ55zGQxOoWy/04f5/jE5+OXRMo8ULofAMznfuGbjmwrlgqZiTIembEgGgwr/Zu+IvjGjViCon0fWFL/nWhy/xe1lEagG33olqtF+M0MZXiZzFIiuMj3Va/jM3E8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCMm3Cmud4BdYQLEpv4yciWKTf/zDhV9Ry2mbfaha4g=;
 b=NeGEWd2USHrxyoYL5WA4aykoal1ECgxT45xi7s9C8baM8yBZzPDCt48YjkCHe9juQYVI635Xg3ZWMAP3k9jJmlGFD9ikAZ2XWoJegOBU8FtAtGCJtf+ahEdJ/IjoPea9BO527jDrCI3DUpgtRSTTatDJK32rQ3lxQLpyV0u0c4ed+OPm7pdar90rgXsQzh48nN1TVxTToOvoJhSHzTQXl0Jyac78MZf4BcwY9u86EiUluqQNS4YQkj2sx4LEQ7qlzYgprMi6k28YIxxLbHRgQcP34N1d7FxnTw0NZF5R9tPnZwVArvc0kLzmoKMJtl+FHA0bU+eV3G86bV7kKULgWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCMm3Cmud4BdYQLEpv4yciWKTf/zDhV9Ry2mbfaha4g=;
 b=E+PvGIn0w6+fOX087b1O7kYZGTw8qk04gMZVtOk8ye2RuL3tBQlRGTRnJb5h2qWLTa1p3eTwuxc6Ruj/OVuN2IlGVNQMxnAMjRlGeYYelPdV0+bfektQSUAl7UEtJOGCvIpDdPZdEDVsPgf0kzQRDPXC+6klQvodI/nDmppU2bc=
Received: from AM5PR0601CA0064.eurprd06.prod.outlook.com (2603:10a6:206::29)
 by HE1PR0801MB1884.eurprd08.prod.outlook.com (2603:10a6:3:49::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 15:04:45 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::e5) by AM5PR0601CA0064.outlook.office365.com
 (2603:10a6:206::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 28 Apr 2022 15:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 15:04:44 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 28 Apr 2022 15:04:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 976b1ed6ed97ebff
X-CR-MTA-TID: 64aa7808
Received: from fbe11e4325cd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 244EF90B-F2F6-48E6-9683-C083774DF373.1;
	Thu, 28 Apr 2022 15:04:36 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 fbe11e4325cd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Apr 2022 15:04:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPhkTaxBzIPYmYpLPGYu35GJUXp37K6CkJmpeAob5sPL8i8jQj3eQ2YWWU+TdLHhv7BxcUhqCGk0Gv/m/EInsVxs+jyVqX053ZPXN4FYDQ+pJkhzQkdtDwLWKsy3rMsl5B0T2zIwTib0ZPgcuWjLW1KTizKOHjhBDlmqQdMdGCYx3vIRb2U/epvqkIKTzM0Zyj/R9TCVkwusHgBWycp6BqG82tKsqSHa0GcV/yJ6e9C9YpicM2zgOjwL1NdCAgUharBIHXwtZOzApFIhMcjA4Ufc9eXfufBo+WRC1uEciMcAdANPc9qYrWWAs52+tFUgUHIOTtI4VIZXawzoMc+VFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCMm3Cmud4BdYQLEpv4yciWKTf/zDhV9Ry2mbfaha4g=;
 b=ofa7aReZD77sDhTeV1tkszAou2VsVosehF7yn3wEaOCpixMtgeTy+3LLVlItTNCDAWv3d8CPJZch3kuM+4sDyRdvafmE+ZPyoqNgikmFnSarBYmEPs8jgbxnLxQRddZnm28QQzoBqSZ34vlSJxTzhH6F77eLMD1WuZv6hEibsJu4JNvHQx+JQ/FOXopmWKM55I7BAb73LgurzVRgs0f3wCEXavoHsLPD5EsrhTjq2H45nDmRncI0gqSzURwJfWdG9r0rFfEksyprVNYBmge0CNIABkNlr9Tv0plBT74MAWydyVn/vKFQSmgzr5soSRx847ijGLA6u1kPZ38dQ6dcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCMm3Cmud4BdYQLEpv4yciWKTf/zDhV9Ry2mbfaha4g=;
 b=E+PvGIn0w6+fOX087b1O7kYZGTw8qk04gMZVtOk8ye2RuL3tBQlRGTRnJb5h2qWLTa1p3eTwuxc6Ruj/OVuN2IlGVNQMxnAMjRlGeYYelPdV0+bfektQSUAl7UEtJOGCvIpDdPZdEDVsPgf0kzQRDPXC+6klQvodI/nDmppU2bc=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 15:04:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 15:04:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@cardoe.com" <cardoe@cardoe.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>, Diego Sueiro
	<Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
Thread-Topic: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu
 integration
Thread-Index: AQHYWpPTnFu3WGfk1EKQOEqfK1rWW60FbWGA
Date: Thu, 28 Apr 2022 15:04:34 +0000
Message-ID: <7CD063FB-A7E3-4A80-AF36-A4F0D580C1BD@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220428000609.26814-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d2510bdf-8b64-4ec0-0f2a-08da29286dec
x-ms-traffictypediagnostic: 
	AM8PR08MB5732:EE_|AM5EUR03FT005:EE_|HE1PR0801MB1884:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB18845A45B17EDA2B72956A149DFD9@HE1PR0801MB1884.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aFk2wTxg1JXbdnELvAwf0VGBe1zyz01qgxQvBL3ZVM1iyktSDde+VgB16Wp9972mMAUbZsbz0KG5RQjAGorrsJ5Gxk339OjALBHxqoHgmXT4a1DhLixDHrzIERFSdDtvTGBD9VZtnfVsRVCw3rjfqDJ5DryhBLi5B7m1uZeZyPCxm+d1XT9is5yk/hbOAw9tVSPixxdjrHSvbNic7DLyQGnopPcVewnIDsNZ9DrBRZAvfYRpuap7QPlUfFhC3ucWMX+G8a+1p3de7g2UY/nPI7xyY0EPDTgwsFG/b8p48MIhbOPRmTpUnQqnyql10/HCNIMFWHBsROPXU+uU6cvigs79pNlUY31BnrlVM5SYCjUs3zflZ1AhB6bd/CMmiNv3tXcVn2AxVfjY8yWgjgjVEm59pCC4KR6aP/os86ZyUQ8V68f3MzfNij9m4bjApFoVqWMIKkvgyYaxoKdbd1VbEKPD/EKuoMsMy/iZmvvAM+vE9CWBKwQyRuPkym1wLk6TvirtX2OoVsscGMC9oXhfrVw1QN6xjHlKcBom7BBwGcns7aF6yea362R0WMOO0IHSPKpi7ffkOt4ptTCMuJ8Y0PFZz9xvLDrEwJnlxsV7mY1F/Bskc3wiA464k8T2kDlTgar2GxoCim9ii9VS2sjAn9yoU1G54kpSeZ2c4OzacklqZ/olBJzwUwNUP9ZZFAAISGEf5eJYFmTqQcmnC4O3L1AhiNoJ8ORqSY8Q49eT+0jWO8EpJiaEXwBwWr32kQcmyyzre63/6A7WXgu6UN42Tmeyp3ogux+EPR6MJaJsdLOJh6s6eZqtkvvKqcEav51G
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(5660300002)(6506007)(6512007)(6916009)(38070700005)(38100700002)(2906002)(53546011)(186003)(8936002)(33656002)(36756003)(2616005)(83380400001)(6486002)(508600001)(71200400001)(966005)(122000001)(76116006)(86362001)(66946007)(91956017)(316002)(66446008)(66476007)(66556008)(8676002)(64756008)(4326008)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB35FE5ECF6BAF4A9130EB4D6B34E7F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4db688c5-8e04-4f91-bc77-08da29286840
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iU+H9K7lZTEImfeIYi6MlVkIskAYqfj9soxW3g0wEDX8rYuJR7xbKFqXrC2daKpd9Eo24JPGBa4JlqI8kjvbZDH375l4hjJUR4Zlfq8uDf7Gu1dHusftydaIe3HggKDvWankmx2JIFnptRnTA350rgnkQTCAUXPT1h7v1B98TBGyW+EaZx8D7yGp8RruFyl+Lau89OAdbGyUZBdyDjzGUZxcjtCx9Zv7mqLHa7I+gR5huuMvtiP+s0ldvtWex5FbnNU/0+2Qf4NbOkd/TVS561zAE3YX6E+6iA3U5t7a94/26eR8p92uVWBrKP9dk7i6UP5YKxKhhApA+JHtN+eCOR9eDK+b1nWL91WU2f2Lc5abWPJhqw7F7ninWrKjvLFQa1R/VrNdLwwA3uMJjpA15JVX+Olx/+HDe2VFnLmQk+4C5+jefXuib6hxGcn2rt0IPHwh4+fs0pklRbJAy98fAXqFtb5mxs8cJgDd3fIq83b7MENbu2wnGDq4JSJ7vK7TaYAvFdjWGQpB+D015u/RpxnbAxvpKSc7IRm6TbKIV5J6TdHnUt9SVq6YHDc8cAKq6tK7/RutwBV8a+BXWltEZ7TlTe0b3/y+bojbDkAuPvqlIDIESt/MY8tLEXtumbufGXN8Db6d7tEiaV4Na4EK/2q0R/UDUdUYy7HplV86jFEYoJDcCZ/dgyRCwGOtG0uBjxQx6F70AMa8r8fqz+pqdZNTpaXG+5KxApQ6kx7jufuSBR6s9JbK1lExXxnKYxaNS2zxIX3NHGRJ5eGYVtxoIA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(36860700001)(316002)(6512007)(2616005)(26005)(966005)(54906003)(508600001)(5660300002)(6486002)(107886003)(8936002)(4326008)(6506007)(40460700003)(36756003)(81166007)(336012)(47076005)(33656002)(186003)(2906002)(82310400005)(83380400001)(6862004)(8676002)(70206006)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 15:04:44.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2510bdf-8b64-4ec0-0f2a-08da29286dec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1884
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Apr 2022 15:04:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7229

Hi Christopher,

> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> A series of improvements to Qemu integration with the Xen recipes:
>
> - update the Qemu package dependency for the x86 Xen tools
> - add support for testing Arm 32-bit images with Qemu and testimage
> - configure a standard Xen bridged network xenbr0 for Xen images in qemu
>  to improve support for configuring guest virtual machine networking
>
> v2 coalesces these patches into a series and addresses feedback on v1

Thanks a lot for that.
I will test and review those in the next days :-)

Cheers
Bertrand

>
> Christopher Clark (3):
>  xen, xen-tools: add recommendation for Qemu for non-hvm x86
>  qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
>  xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
>
> classes/qemuboot-testimage-network.bbclass   |  36 +++++-
> classes/qemuboot-xen-defaults.bbclass        |  26 +++-
> classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
> conf/distro/include/meta-virt-xen.inc        |   1 +
> recipes-extended/images/xen-image-minimal.bb |   8 +-
> recipes-extended/xen/xen-tools.inc           |   9 +-
> recipes-extended/xen/xen.inc                 |   6 +-
> 7 files changed, 197 insertions(+), 17 deletions(-)
> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7225): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7225
> Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
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

