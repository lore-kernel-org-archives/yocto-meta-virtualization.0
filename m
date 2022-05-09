Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B5C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 13:58:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.73])
 by mx.groups.io with SMTP id smtpd.web11.32509.1652104718501800539
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 06:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=arL44fNo;
 spf=pass (domain: arm.com, ip: 40.107.7.73,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OPYw8fspzrshVCqPiYEiiOYw3oBwJWxo9oodZvj2ki3fcpMeeESb0K08zMjtwwgm7kZYzDnCoh9YmD0DTrrpA8TYbnA8SmStgqIZ7TkKhtYKtmkh4v7ykvclmLKZ/Z4Cv/VZfFLHdTiPa/BsF2zkc2ST3kD4o7gw8f4txhApgddtbViXQ7+zaOWCCRvEhiloh9jxdOhW2Z2skKyaJW3q7gEItSkDhH2cTN7xQE6sl0iAhjKnFPB/obPxFumDD0SO9AnL1bp3wUOz4kDbR00oGMmn7x3IAbxEW90LCr9HMMiuKXdUG3ZZepi3PnH7rLq2Fy8MUdNfbOLbLFHBurk9vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2duqfDk3h017GFxNb1QCp0WY0Sh5f7ZPg0y8Yb0ul7g=;
 b=DCPOusChwOvdzcZzLiZnIYnXUCiK21vv7F/MO6WOrk11rHuK9p9O0oyhQoDc4Puv2fP5S54MqAumkdh0m4sPpNsJnzXE+oK0B9R+cHSYfQkde4kcofJL5kU9SbTCRZa9ephJ+PLgR+0qQnuaqg4uI44txhcFIevKVH97DZ52tVxzNUFY+ajwXE5gHUwy6bQK818BChMl4Vk20gUpge4cRmLAYAIyU/gru4LeEyWThhzp5/M5TlRJq3PYlbWPAXs//rGmhJGexY1A9+n/i6TA2Lnp+LLg5a+9eCHeTSAmGK13fhKoLMjQr1p/zBqpPWDrGF18B+743llP9YAPF2NdRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2duqfDk3h017GFxNb1QCp0WY0Sh5f7ZPg0y8Yb0ul7g=;
 b=arL44fNoGlAcN8pahsxG5xLyX3+GOcFssNGgXINCERx0V5g6Ronumxkw+1mXaAeVbvg4j18FCFnQeIrmXbCONS6IK2/Rmc7HCcE3tvVzOhgeblcJb3XI6DtIF6Cc0DH1ARWsvLKpy6tumpRnzM4HelpE1ohNNAkFm4r3a3nN6n4=
Received: from AM7PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:110::15)
 by DB9PR08MB7039.eurprd08.prod.outlook.com (2603:10a6:10:2cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:58:33 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::62) by AM7PR04CA0005.outlook.office365.com
 (2603:10a6:20b:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 13:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:58:31 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Mon, 09 May 2022 13:58:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a12671fd01c05a37
X-CR-MTA-TID: 64aa7808
Received: from c70a0e87ee24.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1D122CF-2D36-442C-8076-84FC762C406F.1;
	Mon, 09 May 2022 13:58:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c70a0e87ee24.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 May 2022 13:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSXVDLVSsSclozaASIzNCFPybXspnbUaAAWBse7O0OazMnimGR2RpDgGrYkDvKIRoGTmd+2TQBGCXoRi1hcjT32S9Bv9GXAxY37xYN8mMOx9bGA5uExz8RnQbOQbRKDr8irE5S7y0f+AwLAQqNzWPJezHvv6DJ6vWXDbzVOWy9Hb8KEA1UCv2TLOXcsU6DDX/awDtJ9wpFtkOQqcrUfZ2Vclpgy/5sWZkJI/hpAu4OkhzFAx/ZjhTerrYAaSoy72WElGgM1Wl51RH/1zoH4zveGJBDMnox5KBVNoi3FUOAZjumqUHeVED9uAIQuNP+BqxrfddzK8V+EmgNgGDGl8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2duqfDk3h017GFxNb1QCp0WY0Sh5f7ZPg0y8Yb0ul7g=;
 b=R/BJCGrMcU17Ujt9dCwrgLnKdu9L+TCYNyBEPKwYHh29tfA/LTvyEsNTkPLEKuvVn4ADflwtpV5aiHK1euPqbEe+n7QR/jiILOZO72yapY6N4wVfKncOmMouDvB6IjDXYHfGqUauNnApjmmohJap9VZS4y0ASPZWbVrtacN+XUFRy7G/OyHOLa0kuwnXdzASVGHlYMKMglQ7V3RfNISoftCe8cd5S7IUOz+pqdzkM+dAQW/UY+kU+7MFptv/Nn7ZL+NxTCb/kcAysgIO23XKl9HdFZxew+UTEHuwxQwGQ8hU7v/cg2EAXWUUT9QK4FvVBjAZI1XMh0AUlM0df1xIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2duqfDk3h017GFxNb1QCp0WY0Sh5f7ZPg0y8Yb0ul7g=;
 b=arL44fNoGlAcN8pahsxG5xLyX3+GOcFssNGgXINCERx0V5g6Ronumxkw+1mXaAeVbvg4j18FCFnQeIrmXbCONS6IK2/Rmc7HCcE3tvVzOhgeblcJb3XI6DtIF6Cc0DH1ARWsvLKpy6tumpRnzM4HelpE1ohNNAkFm4r3a3nN6n4=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7503.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 13:58:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:58:17 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Daniel Smith <dpsmith@apertussolutions.com>, Scott Davis
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>, Jon Mason
	<jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
Thread-Topic: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu
 integration
Thread-Index: AQHYWpPTnFu3WGfk1EKQOEqfK1rWW60WkL+AgAADvICAAAhOAIAAB7gA
Date: Mon, 9 May 2022 13:58:17 +0000
Message-ID: <0EE9D5E6-5FE9-4E32-8D04-B552236E31DE@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <CADkTA4OBc-C3UXRrjHkWHNYpNi7ZxX8RpiODOdoQCXdf4a7AMg@mail.gmail.com>
 <6C681FA0-E19C-4499-95DD-A0FE0B7B4EF7@arm.com>
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Pa3C+XdESD0Ynxv-8RnaWfeQMTNU7iUymNsE002Z6BoQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 91735cfc-f621-47ae-b6bc-08da31c40094
x-ms-traffictypediagnostic: 
	AS4PR08MB7503:EE_|AM5EUR03FT030:EE_|DB9PR08MB7039:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB703921A922FA8BC05CFAB6299DC69@DB9PR08MB7039.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UvEHkLIGMCR7/UZ+l+4Ehd0vnkfuWrOcBEwjdXxM3QGL4A+fn5tfRQio0YuywqyadOqygraVeS3sCKlVlzqYkDMYnlsu8DmZN8HHlHTaliFMstMg2gIx5ae+vSlpeEOM9FejqXTZerBgkgybuHDB1cu6wncyZZ+uSbDk8OX5e7K9pIChA3d1x0d6ZLu0zCwlxmdMdm30zI2Qa2w/s696fQnVrsXDj/ynoP/dvg5505e5HteuSDpGRSNx7wNcr4ujBl2KPWii4P0WFTo5btNjfTKrVKkI6m2pZ9LZwxO3Tj2AxpPgPTVyvQaHIvz40Xytmwk1PFe9EQbXiPUC43bmb9vNXqeQIAXf81QNA5f83noOvPWbM4iSLasH91lw9sz2e8t1TJdWeKeHezdNDfddd3eCRemwAIGKOg3OeafFYBecl26xv9UjkehBqpaPwyuuIGEjhtt8D+xQyV4OjwegaRNd1tRFHHi5X18/jAClSGdYLtKQDifbPYKNOSpNAkc9dDYdDvpIh7qYcT5vllHvaGdSEdcI+KLpyZYt7+QbcBX31BIxHTX6crQylp0a69iJJx0W4Dy1TdXYQrHUlRFdRHujhdZyiqRSyVWzfYhbswLJA+faF+0fl3uItsd924jrV+mraDUzQOe3O89lFcKuIRAKITLVujaVzCBzm9Ar04zDU2XGTuz0Cli+Lsbgx7p8phhqGhtqAXI2Be8HwpJT9ux+AY+kJW1SJXQmmfBkUeY0Ckkry+iRZvwTXYPrFMaiiYzTqOf00UL/rsOAqnyK6XYYaMAGHv68Q/UWxQGkhWiFQAqUy6DMsVJz3QnilEHz+qr7TmA8UPDZSPrh81040RsTF5gu/fVDm5EZvM86kUI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(966005)(2616005)(2906002)(33656002)(6486002)(316002)(6512007)(26005)(6916009)(186003)(54906003)(6506007)(86362001)(53546011)(36756003)(508600001)(38100700002)(38070700005)(71200400001)(122000001)(66476007)(64756008)(66556008)(66946007)(76116006)(8676002)(66446008)(91956017)(8936002)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B38C55F400CB741AC2F4E012D5E2616@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7503
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dee1e9fa-2e9a-454c-320d-08da31c3f7d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jg0Ac2QRlE0Hwi9Vchgh8A23UB1RQ8mxoTIvjbcne26BU1wfOTNneXJavZcVIrE5xzdMDbfAXcp8HVI9+AbfRr9ZHDMtohiV5uaDHDmXCfkr/Lez4kRNECLDmF2zxqMDE8Nmyn8hlEk3T+vDT7Dc7bw/gJTg8sKJWkNiSgiUZW4n1Q8qC3TGyvUVMAR6YlSjizIW8UmcmN3IuJM++78tM1MeXgcmsqNOzsjcSBHhrSdqjzurigCvoMR30/W0SBz/wXrlWvmjCB/B3LwNY3rYiVj0BIHPpsWMLzLFAihuf11AP0bx6ktVn3H3sqJ66zAwLi9hA5As6ZX9q0/duQdFQqGxYf4+YUabxjsuhBdpNhSvgGkjJ8umJw6hWTzg0ZyFeKDtmt7lraiPxkzf2rNibeNFFU+ELQgBhHOfGD/hvR/UYPFMKbOTTX7xc7bEWViQa/vye1D2pTD+cy8Vlv3bIJr+vk/Osxa3wNjU/swwo1h1hdyLzHXmAAJo2h98CT+0n0klSkoL+UfmcFiNs0YLZCJazYcqqGe+uaF6gL9ZtEVEkCy30BUw9ClCaeMSFHJ7NLj0LVzjwtyLTkdVkPSZpcP7whJqFFSGI7tGOgJI1tPIzh3FxEOyKHLqFrJ/EmpgsWv6fs5u1DAmYXSz0oL3p9RYNxhMyBJTyVaiLHOgDMs3EAC6EHLnvE0U2k+gFI53nlFaWYKOgkZhdLwhGmI6+vdjEX6tY0yMN5kMmkS+2UtfZ/eYs1mSya8VjlylOuRbwY7yKfkPeq3us5Sa0Y7YbXt0RAn/KtXzkyJASRNf0eo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(6862004)(4326008)(8676002)(70206006)(2616005)(70586007)(54906003)(107886003)(316002)(86362001)(356005)(53546011)(2906002)(6486002)(6512007)(81166007)(6506007)(26005)(508600001)(47076005)(33656002)(40460700003)(36860700001)(966005)(336012)(36756003)(186003)(82310400005)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:58:31.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 91735cfc-f621-47ae-b6bc-08da31c40094
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7039
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 13:58:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7258



> On 9 May 2022, at 14:30, Bruce Ashfield via lists.yoctoproject.org <bruce=
.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, May 9, 2022 at 9:01 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Bruce,
>>
>>> On 9 May 2022, at 13:47, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>> On Wed, Apr 27, 2022 at 8:06 PM Christopher Clark
>>> <christopher.w.clark@gmail.com> wrote:
>>>>
>>>> A series of improvements to Qemu integration with the Xen recipes:
>>>>
>>>> - update the Qemu package dependency for the x86 Xen tools
>>>> - add support for testing Arm 32-bit images with Qemu and testimage
>>>> - configure a standard Xen bridged network xenbr0 for Xen images in qe=
mu
>>>> to improve support for configuring guest virtual machine networking
>>>>
>>>> v2 coalesces these patches into a series and addresses feedback on v1
>>>
>>> I've gone ahead and merged all three patches of the v2 series.
>>>
>>> As for the qemuarm boot (with uboot or not), we can address that in
>>> follow up patches, since I see that Betrand did send what he's been
>>> using to the list. And I'm interested to hear if that also works for
>>> Christopher.
>>
>> My review on the second patches was mentioning that it does not work on =
my side so why merging that one ?
>>
>
> It worked here, and obviously it works for Christopher. So at that
> point, I wouldn't hold it out of the tree.

Could you at least explain me what I did wrong.

As said qemu is blocked waiting for a dhcp/tftp to answer in uboot.
Why do you guys have something starting a tftp server and I do not ?
Is it something that might happen to somebody else ?

Cheers
Bertrand

>
> Bruce
>
>> I will try to test this to check if init issues are solved and come back=
 to you
>>
>> Cheers
>> Bertrand
>>
>>
>>>
>>> Bruce
>>>
>>>
>>>>
>>>> Christopher Clark (3):
>>>> xen, xen-tools: add recommendation for Qemu for non-hvm x86
>>>> qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
>>>> xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage
>>>>
>>>> classes/qemuboot-testimage-network.bbclass | 36 +++++-
>>>> classes/qemuboot-xen-defaults.bbclass | 26 +++-
>>>> classes/qemuboot-xen-u-boot.bbclass | 128 +++++++++++++++++++
>>>> conf/distro/include/meta-virt-xen.inc | 1 +
>>>> recipes-extended/images/xen-image-minimal.bb | 8 +-
>>>> recipes-extended/xen/xen-tools.inc | 9 +-
>>>> recipes-extended/xen/xen.inc | 6 +-
>>>> 7 files changed, 197 insertions(+), 17 deletions(-)
>>>> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7257): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7257
> Mute This Topic: https://lists.yoctoproject.org/mt/90743681/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

