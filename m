Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FCBC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:50:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.25372.1653299441677651579
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=EhU642/0;
 spf=pass (domain: arm.com, ip: 40.107.20.73,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YSCre1nrcaZn62YsU0f9077BR8uqvPoP/UpazdEp+KtpfwVQgk2SKILCHd/mQ+a2CSOc2Kcbb0bGSOi2JELHVgptiilsVW8NovTpQnH52ufjHZyrupdICHBwEdPEGmtx2LsIVQUWcTVGqtr7857XiK/1HGstDSX74cZkzn2sy+xfSVQ3IQqd0mJOLnJdoqJoI62hzp4d5voCEse8yglAAQyj8LN6DFFq65qDml2fPm8QchvxmF1jpQYoBaTbKosg8FBR1T+M5cKaYsfRLx7WLPp9IC4kYR9BR6sVgh5RHiCm39OcJjo/O5rRUi29bbwUBDjXHFgxmbo1Il1DYeI1tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8KjPAPnvymh97gZKmzDx22zj6rhzh4Oas/EI9gEShE=;
 b=hxKReAWVvJ+lO83rj3qbVqBckNO6Lqc+t+ZJHIxFGYfJbtU3K8DU4CNPlB6jZn22eXavwsEEaz5VH3di/KUXDsKTzc90PlfBjZn4JsKY2ymWVsXE+HFDRrfJ98hi+r1sYbjDU6y+qZDVpjI1VRFTBtvI/i7GJ2xgxXYuI+0bbauRltU4Xokkuw7CTRzEsumY5T18xmAJExZw8h3pwsIs11JpFrXhZKVz36YJ5pCYIN7A+TE/rxcdxORs9fh+l5lQRbDc0NY5zXyNBLUjpz5Sv9xlyXaBBRDWKWludt/gkw7/WClkVb9Pbh4+CobtWglnCw3TEH/zgw4MTxNt9Up/TA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8KjPAPnvymh97gZKmzDx22zj6rhzh4Oas/EI9gEShE=;
 b=EhU642/032RQY3LpOQ5vMcKqkQrIdDFZcC5200j/lhE/f59tS+MmpgYuoIJ1kMQe5RPgdpMDsuU6sge9jRGR38rk3xSfLrFyNXPI1YxeNaiP6uwqv6+d/MList9XvUAsR1/QDmnjDaOFxiG9DqiMH2pu3aR2ZArCfMroI4Vpkvs=
Received: from AM6P193CA0091.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::32)
 by DB9PR08MB7470.eurprd08.prod.outlook.com (2603:10a6:10:36e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Mon, 23 May
 2022 09:50:38 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::52) by AM6P193CA0091.outlook.office365.com
 (2603:10a6:209:88::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 09:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:50:37 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Mon, 23 May 2022 09:50:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1078e92d960309c
X-CR-MTA-TID: 64aa7808
Received: from 89a22e629cb5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1BC7C81-B57F-471A-A2BE-CFBA32FC17B7.1;
	Mon, 23 May 2022 09:50:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 89a22e629cb5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB6F/WuUfrdlBt4areL7V9njt2MyvJVtigfVsr9ib0JJJM8UNSVat0CPeSPxD2DngKdhCwlG1yRzxtGzci0Ozyz893DojDksE5zYHstbP6JEZnPNnydJqnaX8pireXdS7Z/vQaIM2Rx4Eb6QURUjQJvoSYwBmte78owJ9eKYAfuSnBiiJwiwEro6cpqVTRpB5vPA7zGMO6ePXwON3RpoUNEmbqNl9goJ3z4qxDSbEZbvxwpJwNyWnO9Dhz0P4vs+J4ugtIBj2ewM+XXSSvYH+4QEdzH0CIkJZgj0AysLXM2JYsSWvJckAt8LaXFfCXtCsseyVO8G6o8+op2ar94eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8KjPAPnvymh97gZKmzDx22zj6rhzh4Oas/EI9gEShE=;
 b=C/AzkhxmxUqTP/LnBJTHjUVHhPPXspPPzdiR6wCuCRYdw+8XsGWEAaVv5VHJVjEDKHQc0mT07rdB1dSoApj7lRw6KHIXN/dLW4BRtbEFlb8r3BD3tvLpBrpDhkuQC5vIOsP7u3sOni+uPsgeZGpn88/CEGBVM6sRqv3qgQd7hfvoCfgx0Rld7r2N9iQFhjwLizx2df1l8WyRBWnTCyJgEwskFrIydF1g8yZBSU2gZzyhMz0LIs6oOcmiVrLVmS7+DMZyKo3OEodII60Q1/O4ph1z9fkq/+PmsZ/JiS6hqFNAWfN3LZSvAW83+/gj3RoCam28fjWOXi0Aimlsg64PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8KjPAPnvymh97gZKmzDx22zj6rhzh4Oas/EI9gEShE=;
 b=EhU642/032RQY3LpOQ5vMcKqkQrIdDFZcC5200j/lhE/f59tS+MmpgYuoIJ1kMQe5RPgdpMDsuU6sge9jRGR38rk3xSfLrFyNXPI1YxeNaiP6uwqv6+d/MList9XvUAsR1/QDmnjDaOFxiG9DqiMH2pu3aR2ZArCfMroI4Vpkvs=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6929.eurprd08.prod.outlook.com (2603:10a6:20b:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 09:50:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:50:28 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][honister][PATCH 3/3] xen: fix boot on the
 Raspberry Pi 4 with Xen 4.14
Thread-Topic: [meta-virtualization][honister][PATCH 3/3] xen: fix boot on the
 Raspberry Pi 4 with Xen 4.14
Thread-Index: AQHYbUW24ts0DqF+PUSCZTbFzrJZqa0sOoSA
Date: Mon, 23 May 2022 09:50:28 +0000
Message-ID: <422B574E-8994-4341-B90F-56FC70FAA687@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <20220521190447.135705-10-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-10-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e4df723c-53c6-4455-e5b1-08da3ca1b097
x-ms-traffictypediagnostic: 
	AM9PR08MB6929:EE_|VE1EUR03FT042:EE_|DB9PR08MB7470:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB74704D30B923836E75F0ACE79DD49@DB9PR08MB7470.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WsVx0FJ0DtFZ//Vew/JcRyzbAgz0bqenmm7r4piKdgYB0SbwEhvWx5AWbmTu5nHr/b8L2ZLsVcrTXh4a+AFbfqsf7xwHkjHuNa4CSG+rAarKLQCHnUBbtuU0s2t1sdHcH0QlJHadD2fID7r5SqcSMRCAUyuGCcuaxt6VdB+5nzA/ngQhE+ZuPrqpj88l18yXgXznOVU+7kePcxMZMtRT+NevhWVbT003zjjbajG/sK5WpC0j/grvBEfBBdna1nGocbrnF71vFmVfGi5jXVwtX0zCui52XzWd/xgb0TW6H9K18LuYBEZuUd0/d1nylr9vv7/L8/i5YrRtIz34wPNPUg5frixYEGxYlSERThXbIZfUpbBFVn2HrXxWHpYYuIiHlqZ+SCIOK9kOi6buObwaD2E9yzJ3HPjiHBUFI/RvaTydrBZ7TcazpeBae1n0atcjnt9T4Gbsj87ItTZFUUCAQ6Sz8GAqFMhuO5H18EljLsgIbMz8QE/uvARX6koCMWl3VUK9H9d3b3M9E+nU/Acyy9gC6EbHQWZBZKeokqIug5Z+/cB2oq4RsqRW29KAuHrGBn0xzGMCC1oWVOFfsAOnAUd1OrNyXWrl67+NlYXRW28XUe/cgAQV0YvDfLDChqdEYnNZA5Zfsj2X+MC6yCaANQro+tGKbF8165IJX5XqIjyvNpzytXD/xE/vPQT7Sx5KDKOxuBibck1LJAmemKkqnkvkXlF226AUdHw8XBwoN1NkOXmduhj9BGp26jz7f82slpeVGWb7UGnee9LfpyFaXhCISRWKU513o4LGzxbax9Bt+OrgAG7tCwa3/y3L7/59dBDeZFRL+h9GigJwTpOpXA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(71200400001)(6486002)(508600001)(966005)(2906002)(5660300002)(36756003)(33656002)(6506007)(8936002)(53546011)(54906003)(6916009)(122000001)(8676002)(4326008)(38070700005)(83380400001)(38100700002)(316002)(186003)(66556008)(66476007)(76116006)(66946007)(64756008)(66446008)(86362001)(2616005)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <92A5768FB7CAD24C871F0BEFAEA1A813@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2588912b-b81c-4a7f-316c-08da3ca1ab05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i9GFZC0LbdRv6B4DtjPLc+NHADNXLpZRRbhour98QcQ0r8nYIqLhpA07dhvHeDMw5GLwnsO3lqLoFHeafacDNSUtdI3T+jmWCI9X9f5GI/cPjGdAOlKA4LeXkrrdTz/H+x9jibZSRgAHdU7pNZzB6zLwk9ICStld40YJzqVasV5Usz2p32YWtNMgmHtSV0bTTJ/gM10c7gFgP/wesTzvItoqiPNKHGt6JpZ3gdCGnAEizwYlOd8Fxl8e7dMyh6BY4yJe45q3YZoePjLgPk364PXcMVPZNOi5xUj0zhnCDJTIFikDgIqNYJlvtRBvxJ5j4nWMF02+mP6cuh4s64I58SKG4GUat4FLnj2/JnrFlRtEXX+mQttxhcFhaNsLg5rRArS/8xaX4SHR4p5MHPS/eBGDTPWG3EKV4XfBIeLT+rHropO2AVufCEJRX/XMQACIyaR2tzqyIuVGl4S8JMe+SLFP8PbMzHIgw0mk7F6NjBNlQ0LPyDcBzUO4xruOiNlMSYE0awCPee1CGJBGbYXgyBmuzIfLEILa/7BGAnfok0KOMWcl/sf7bY3LqMqcgql2B+SiHKM+aZHczgSggx5QIf46wN0SWNjwTsvOrzIRrHiB7mgNZCpkULqnfKlxYQHhOdog3GEwJYqDTeNnhoRbE5buOwLGqPvkah0SrtrWh9I0V+ikRn9MKvIkeFAd5DeIaA286v8S7xsMaylZjFUisEDhu2LBSH0Ird7wIlSdWJ/cIJX+i+X1gi7wwC2ovFM4x9AsZy4WN13YixkTnhyiWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6512007)(83380400001)(5660300002)(40460700003)(508600001)(966005)(53546011)(6506007)(36756003)(6486002)(26005)(70586007)(2616005)(8676002)(6862004)(4326008)(82310400005)(47076005)(336012)(186003)(33656002)(86362001)(356005)(81166007)(70206006)(2906002)(36860700001)(8936002)(107886003)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:50:37.5086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4df723c-53c6-4455-e5b1-08da3ca1b097
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7470
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:50:43 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7312

Hi Christopher,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> Apply the patch from Xen to fix device tree parsing in newer kernels.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> ...issing-device_type-property-in-pci-p.patch | 91 +++++++++++++++++++
> recipes-extended/xen/xen_4.14.bb              |  1 +
> 2 files changed, 92 insertions(+)
> create mode 100644 recipes-extended/xen/files/0001-xen-workaround-missing=
-device_type-property-in-pci-p.patch
>
> diff --git a/recipes-extended/xen/files/0001-xen-workaround-missing-devic=
e_type-property-in-pci-p.patch b/recipes-extended/xen/files/0001-xen-workar=
ound-missing-device_type-property-in-pci-p.patch
> new file mode 100644
> index 0000000..09a461b
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-xen-workaround-missing-device_type-=
property-in-pci-p.patch
> @@ -0,0 +1,91 @@
> +From 5a4087004d1adbbb223925f3306db0e5824a2bdc Mon Sep 17 00:00:00 2001
> +From: Stefano Stabellini <sstabellini@kernel.org>
> +Date: Tue, 9 Feb 2021 11:53:34 -0800
> +Subject: [PATCH] xen: workaround missing device_type property in pci/pci=
e
> + nodes
> +
> +PCI buses differ from default buses in a few important ways, so it is
> +important to detect them properly. Normally, PCI buses are expected to
> +have the following property:
> +
> +    device_type =3D "pci"
> +
> +In reality, it is not always the case. To handle PCI bus nodes that
> +don't have the device_type property, also consider the node name: if the
> +node name is "pcie" or "pci" then consider the bus as a PCI bus.
> +
> +This commit is based on the Linux kernel commit
> +d1ac0002dd29 "of: address: Work around missing device_type property in
> +pcie nodes".
> +
> +This fixes Xen boot on RPi4. Some RPi4 kernels have the following node
> +on their device trees:
> +
> +&pcie0 {
> +     pci@1,0 {
> +             #address-cells =3D <3>;
> +             #size-cells =3D <2>;
> +             ranges;
> +
> +             reg =3D <0 0 0 0 0>;
> +
> +             usb@1,0 {
> +                     reg =3D <0x10000 0 0 0 0>;
> +                     resets =3D <&reset RASPBERRYPI_FIRMWARE_RESET_ID_US=
B>;
> +             };
> +     };
> +};
> +
> +The pci@1,0 node is a PCI bus. If we parse the node and its children as
> +a default bus, the reg property under usb@1,0 would have to be
> +interpreted as an address range mappable by the CPU, which is not the
> +case and would break.
> +
> +Link: https://lore.kernel.org/xen-devel/YBmQQ3Tzu++AadKx@mattapan.m5p.co=
m/
> +[fix style on commit]
> +Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> +Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
> +Tested-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
> +Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> +Acked-by: Julien Grall <jgrall@amazon.com>
> +---
> + xen/common/device_tree.c | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> +index 18825e333e..03d25a81ce 100644
> +--- a/xen/common/device_tree.c
> ++++ b/xen/common/device_tree.c
> +@@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const=
 __be32 *addr)
> +  * PCI bus specific translator
> +  */
> +
> ++static bool dt_node_is_pci(const struct dt_device_node *np)
> ++{
> ++    bool is_pci =3D !strcmp(np->name, "pcie") || !strcmp(np->name, "pci=
");
> ++
> ++    if ( is_pci )
> ++        printk(XENLOG_WARNING "%s: Missing device_type\n", np->full_nam=
e);
> ++
> ++    return is_pci;
> ++}
> ++
> + static bool_t dt_bus_pci_match(const struct dt_device_node *np)
> + {
> +     /*
> +      * "pciex" is PCI Express "vci" is for the /chaos bridge on 1st-gen=
 PCI
> +      * powermacs "ht" is hypertransport
> ++     *
> ++     * If none of the device_type match, and that the node name is
> ++     * "pcie" or "pci", accept the device as PCI (with a warning).
> +      */
> +     return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
> +-        !strcmp(np->type, "vci") || !strcmp(np->type, "ht");
> ++        !strcmp(np->type, "vci") || !strcmp(np->type, "ht") ||
> ++        dt_node_is_pci(np);
> + }
> +
> + static void dt_bus_pci_count_cells(const struct dt_device_node *np,
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_=
4.14.bb
> index 267db16..c0fa938 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -7,6 +7,7 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> SRC_URI =3D " \
>    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-locati=
on.patch \
> +    file://0001-xen-workaround-missing-device_type-property-in-pci-p.pat=
ch \
>    "
>
> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a=
4e5"
> --
> 2.25.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

