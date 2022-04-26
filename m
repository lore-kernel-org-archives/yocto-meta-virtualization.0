Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483B6C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 10:03:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web11.4323.1650967412107272617
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=iVTytKAs;
 spf=pass (domain: arm.com, ip: 40.107.7.50,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdMDiS2+YwPb78Rs4erZ4orZcgbmOyf/gT5U20jshWk=;
 b=iVTytKAssMxxABLZ1VmS2bFG/hNLK9XWVaucFQrBpy8LDIPegXeb7kyou9oX9kOfTSqxvJjn2xg6IWsd6qxkQ8bNPijjuaQPufaJ/UJbj+c6IP190ZUBI4vfy4QnhMKqdA/blBtVn7jg29M7L5foiH0u6cLF1d9QcnfzVKmkdLU=
Received: from AS9PR05CA0044.eurprd05.prod.outlook.com (2603:10a6:20b:489::34)
 by PA4PR08MB6064.eurprd08.prod.outlook.com (2603:10a6:102:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 10:03:27 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::3a) by AS9PR05CA0044.outlook.office365.com
 (2603:10a6:20b:489::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Tue, 26 Apr 2022 10:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 10:03:26 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Tue, 26 Apr 2022 10:03:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3657bcd7fd458c4c
X-CR-MTA-TID: 64aa7808
Received: from cf09e60c55ed.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B67123A9-D6FE-41AB-9645-DA1F19FF07CE.1;
	Tue, 26 Apr 2022 10:03:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cf09e60c55ed.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Apr 2022 10:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h19lVeSZHcHvhM0ySGF9NojeASZDqctLRAMkGQUhp+21tQIjTW6C4EMRb9CesCQ42LQbVuu6m9vRWWyd7SKQUQxyAQJIATbpqKBpmxe7SVeEQyVdV5sAlq08owNclyAk7qB8b39wWRg6pD4QM/9UuuVENfwyK3dJFLM24SGweRt249gR6+3qxV3TyV5FR+T+YoYz8mm0Cf2m/68vkbvd13pP+Lf5+KVShjQQ08sol5/WF0HIjSu4FpZyTVHsT9cuI12PIG79vOHKkYKFwER8iErx1j0WqKxy+AS6L1TdpHYNeMPoZ7WI6p7H0AsbtZa/9IsgetPiopaysW4rYoDoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdMDiS2+YwPb78Rs4erZ4orZcgbmOyf/gT5U20jshWk=;
 b=byKS2O25HZW2TbuXnYnf6Q4YGh77nTvn3XRqo2LLEGb98JDxiv//PoYwo0O1jntYhsOkqO85L/ly6rwCvEfEmrAvfyuqM6fTsAKJICUObZtCuZ7XhUJfJtV5wMNkDXmfMEdbZUwqHb2cBxuL9daE0z8MdwTUT13v+gUzoMpkXFDIw2HCJbmlXISPENjKXdIZ1qUtqGqmG774lsFcf1eR6iqJ6iTU0vt8Tkq9e9BVZUveOyr84d9unqzHjnd3iZ2lG+RxxMAJrwXnsma9UIByCPqdodcz7nxqD3I4o2vlcsUzlajoEBbLpY4MHUhXNiN8Ut9XDwS7yE/WzYzLYwTtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdMDiS2+YwPb78Rs4erZ4orZcgbmOyf/gT5U20jshWk=;
 b=iVTytKAssMxxABLZ1VmS2bFG/hNLK9XWVaucFQrBpy8LDIPegXeb7kyou9oX9kOfTSqxvJjn2xg6IWsd6qxkQ8bNPijjuaQPufaJ/UJbj+c6IP190ZUBI4vfy4QnhMKqdA/blBtVn7jg29M7L5foiH0u6cLF1d9QcnfzVKmkdLU=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB7PR08MB3017.eurprd08.prod.outlook.com (2603:10a6:5:1f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 10:03:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:03:11 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Christopher Clark
	<christopher.clark@starlab.io>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@cardoe.com" <cardoe@cardoe.com>, Diego
 Sueiro <Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>
Subject: Re: [meta-virtualization][PATCH] qemuboot, xen-image-minimal: enable
 runqemu for qemuarm Xen images
Thread-Topic: [meta-virtualization][PATCH] qemuboot, xen-image-minimal: enable
 runqemu for qemuarm Xen images
Thread-Index: AQHYVnDrmaJv5TOc8EOe8i+4xMZAS60B/MgA
Date: Tue, 26 Apr 2022 10:03:11 +0000
Message-ID: <07D7CC41-F661-4A59-B4DF-7E63B31465A3@arm.com>
References: <20220422174610.58059-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220422174610.58059-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6754bd3b-2467-40bc-8ff9-08da276c0200
x-ms-traffictypediagnostic: 
	DB7PR08MB3017:EE_|VE1EUR03FT036:EE_|PA4PR08MB6064:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB60648A30212937A45B2213C99DFB9@PA4PR08MB6064.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 W5SuNdqPt1TCBKBiSFd6ppqn/uQZcrNWYJvGRWsqAY2mvTdIRCUmLjRlHUWSjqZbh3hf38f2q9mUg4WOZPRzszu4+wD32loRSlXqBqlnyD5YfqDM24JPSnhvdqXtQBYdR9l1XqjL5uGqxmIYbDbzCl2z5Z49QEYsl7lCvqzXsBis7eTrML/vaPgLs0JTZcv4gxcnX7/S0r1DRM9TRsdnAlC3PLqq0bg6U7Muvhmx2HMaBKXddmc4r2T2j01gZ6mE9/JAOA3ylxMHX99x+UEAQ+g0pCPngbv2Jmeyd+58tEA50SDNducUr5UWDPTwisqwnzwvX40AtpOit88UmnxeNAt73Zz62UKTMbLtDW7BWAGgiuGiOkbQ8rFqY/4DketHHynj9rDYRvPogSPLMCC3MqcRAv/8LnSMRAl0JEqTyfH46olXx8/L+O7osaEGFzYXOSh4zLWXlFSZI++uJZ/ywK7FbqvN7VgeEwhi4i42J+Qf3jsOczy+whWC4gLe2HtcsAUGmnm4tK6kX1Ilw/lx8bqklb0IRzj6GSTqsHx3Dlblmzwwh/aTi3N5uKXwTgYnqgM/5ma+cDifu4peVigz0xTFBwbN2u9m3PKhgTibZalkYli2edTO4PdKLqfc1OjqynSDeta6dyOlOhmDWy7fl7Rii3mOVK9gMvWZjuiqikkSKZWlwBu5gK1PzbcZ5j06gtdRU26vCuQ4TmQKyoa+QBZI5FRZmmDkW9puVlAkJMVYdWxOHsjUoBRhFEaadW/X9sjBbN6fKkDii2Sho757hKZ/KRofaNymiiVjZx+FkVmJYz+ktqiQYopjdsJ0eg5K
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8676002)(30864003)(966005)(2906002)(8936002)(86362001)(5660300002)(316002)(6916009)(33656002)(91956017)(66946007)(76116006)(66446008)(54906003)(38100700002)(38070700005)(64756008)(122000001)(4326008)(83380400001)(36756003)(508600001)(53546011)(6486002)(186003)(26005)(6512007)(71200400001)(6506007)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <443AEBBE7DDE21408EECC0D164515BB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3017
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12f1b8f1-c561-40fd-77b1-08da276bf8fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lOE2UqhuOtafFBKEm2qnF5zPsQx482Y+T7MJJIMKWza0agVRam6U2wJj9Ul1+xtVZr6RbJiepN8Peo7O/T/EZxWxFXBPLhAyOUfAExBI3MIdr0xC6LOXp+oMv0eXtJO25G0A8UcGa9aaXLfnDtGcVtR6FFonB3hcVegQVmEk8coyfNelL9OZYp+70++MGGTRIwOJPJvEBJoCZphFDg2AqWjeJkToLjMXedgJRTEaQOyNcmiEShrdPRfRPOVzVWM3rKj3uCvPEDhoNjgzB0xjK5xIrKanpoo5WDi0rWAKl3DrDi1nAJnoUu/CC+0T1dOnjWFLXZUx3HFx0IrFNK+KP9jhIxOiqMCsN5FQF65DvJr7QlhN47Q/5Bomhgz4+bFRlhbXIpVeg0iRiqoUk9BXgT3PkjkyvF0VG6JTAqX7V/anMvz1q4JNmlo0OkOGJJMw6iwV1X1nvK1wCSjbv7B/T7u6to7VF1wetYCSeahGSUYQuakxTO6kCDrcIokXzT+SFKXctnjavXNzVaeop1gW1ByusE8m96bD+Kbr5mjSZoxqcuzBW0jZXxCD+Zr3VwbR8pcNvglv937VQtBMmLqIrWqKlzkWJ0Y+KOWg2TQcGCQc3L4k3mo5lVENcIOdectPI1thAMiZsNoKndeZ8ugZZcNRp0XmZ+8mHxW4il8hTG5yB30ZRf8mOop8yQlYwP1yhG5ruqHapdlh+N3+Br/z4siXxuItRX8qbz6WtXVHgMQChVxnDgj6NgKWb++mxoTA9oAIplQP865RMV/TioYMEQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6512007)(5660300002)(356005)(6862004)(33656002)(47076005)(316002)(81166007)(336012)(36756003)(36860700001)(30864003)(83380400001)(2906002)(107886003)(6506007)(26005)(86362001)(186003)(508600001)(40460700003)(2616005)(8936002)(82310400005)(54906003)(70586007)(70206006)(6486002)(966005)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:03:26.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6754bd3b-2467-40bc-8ff9-08da276c0200
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Apr 2022 10:03:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7219

Hi Christopher,

> On 22 Apr 2022, at 18:46, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> From: Christopher Clark <christopher.clark@starlab.io>
>
> The Xen hypervisor built for Arm 32-bit targets can be launched with
> runqemu by providing a u-boot script and configuration for Qemu,
> which enables interactive testing of Xen images.
>
> Add qemuboot-xen-u-boot.bbclass to add a new bitbake task for generating
> the u-boot script.
>
> Update qemuboot-xen-defaults.bbclass to supply working default parameters
> for the qemuarm machine needed to boot successfully in testing.

The changes are very nice but I see 2 problems here:
- all variables are using the architecture (arm or aarch64) instead of usin=
g the platform (qemuarm, etc) which would prevent an other platform to be a=
dded (for example Xilinx board emulated by qemu).
- xen-image-minimal is now inheriting a lot of classes doing stuff for qemu=
 even when you are building xen-image-minimal for an other board.

Could we switch to platform name in the classes instead of using the archit=
ecture ?
Could we find a way to only include the qemu classes when building for qemu=
 ?

We are working on making a generic class to be build a Xen device tree and =
this adding more and more things conflicting with our attempt.

Cheers
Bertrand

>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
> classes/qemuboot-xen-defaults.bbclass        |  16 +++
> classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
> conf/distro/include/meta-virt-xen.inc        |   1 +
> recipes-extended/images/xen-image-minimal.bb |   2 +-
> 4 files changed, 146 insertions(+), 1 deletion(-)
> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>
> diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
> index c7e74c3..1190f29 100644
> --- a/classes/qemuboot-xen-defaults.bbclass
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -10,6 +10,17 @@ DOM0_KERNEL ??=3D "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGET=
YPE}"
> DOM0_KERNEL_LOAD_ADDR ??=3D "0x45000000"
> QB_XEN_DOMAIN_MODULES ??=3D "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:mult=
iboot,kernel"
>
> +# Qemuboot for 32-bit Arm loads Xen via device loader parameter rather t=
han
> +# kernel and boots using u-boot as bios
> +XEN_BINARY ??=3D "${DEPLOY_DIR_IMAGE}/xen-${MACHINE}"
> +QB_XEN_LOAD_ADDR ??=3D "0x46000000"
> +QB_OPT_APPEND:append:arm =3D " \
> +    -device loader,file=3D${XEN_BINARY},addr=3D${QB_XEN_LOAD_ADDR},force=
-raw=3Don \
> +    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR}=
 \
> +    -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin \
> +    "
> +QB_DEFAULT_KERNEL:arm =3D "none"
> +
> # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> # and the device loader option for the dom0 kernel:
> QB_OPT_APPEND:append:aarch64 =3D " \
> @@ -17,6 +28,8 @@ QB_OPT_APPEND:append:aarch64 =3D " \
>     "
> QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
>
> +# 32-bit Arm: gic version 2
> +QB_MACHINE:arm =3D "-machine virt -machine virtualization=3Dtrue"
> # 64-bit Arm: gic version 3
> QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtualiza=
tion=3Dtrue"
>
> @@ -25,6 +38,9 @@ QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -=
machine virtualization=3Dtrue"
> QB_MEM_VALUE ??=3D "512"
> QB_MEM =3D "-m ${QB_MEM_VALUE}"
>
> +# 32-bit Arm: qemuboot with a u-boot script image
> +QB_XEN_U_BOOT_SCR:arm =3D "boot.scr.uimg"
> +
> # 64-bit Arm: qemuboot with a device tree binary
> QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> diff --git a/classes/qemuboot-xen-u-boot.bbclass b/classes/qemuboot-xen-u=
-boot.bbclass
> new file mode 100644
> index 0000000..3767c09
> --- /dev/null
> +++ b/classes/qemuboot-xen-u-boot.bbclass
> @@ -0,0 +1,128 @@
> +# Enable booting Xen with qemuboot / runqemu: u-boot configuration
> +#
> +# Copyright (c) 2021-2022 Star Lab Corp. All rights reserved.
> +#
> +# Author: Christopher Clark <christopher.clark@starlab.io>
> +
> +# Interface variables:
> +#
> +# QB_XEN_U_BOOT_SCR :
> +# If this variable is set, this class will generate the u-boot script im=
age file.
> +# It must be set to the name of the compiled command file that u-boot wi=
ll tftp
> +# from the image deploy directory during boot, currently: "boot.scr.uimg=
"
> +#
> +# QB_XEN_CMDLINE_EXTRA :
> +# A string to be appended to the default Xen hypervisor boot command lin=
e,
> +# for supplying Xen boot options.
> +# The device tree that this bbclass generates will contain Xen command
> +# line options to connect the Xen console to the Qemu serial port.
> +#
> +# QB_XEN_LOAD_ADDR :
> +# The hypervisor load address
> +#
> +# QB_XEN_DOM0_BOOTARGS :
> +# A string for specifying Dom0 boot options for the Xen section of the d=
evice
> +# tree.
> +#
> +# QB_XEN_UBOOT_SCR_TASK_DEPENDS:
> +# The task dependencies for the u-boot script generation. A default is p=
rovided.
> +#
> +# QB_XEN_DOMAIN_MODULES:
> +# A space-separated list of colon-separated entries:
> +#   "<file for the module>:<load memory address>:<module compatibility s=
tring>"
> +
> +# Set the default value for this variable to empty: no file generated.
> +QB_XEN_U_BOOT_SCR ??=3D ""
> +
> +write_add_chosen_module() {
> +    CMD_FILE=3D"$1"
> +    ADDR=3D"$2"
> +    SIZE=3D"$3"
> +    MODULE_TYPE=3D"$4"
> +    cat <<EOF >>"${CMD_FILE}"
> +fdt mknod /chosen module@${ADDR}
> +fdt set /chosen/module@${ADDR} compatible "multiboot,module" "${MODULE_T=
YPE}"
> +fdt set /chosen/module@${ADDR} reg <${ADDR} ${SIZE}>
> +EOF
> +}
> +
> +generate_xen_u_boot_conf() {
> +    CMD_FILE=3D"${B}/qemuboot-xen.cmd"
> +    cat <<EOF >"${CMD_FILE}"
> +echo "Running u-boot launch script"
> +fdt addr 0x40000000
> +fdt resize
> +echo "Device tree resized"
> +
> +fdt set /chosen \#address-cells <1>
> +fdt set /chosen \#size-cells <1>
> +
> +fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/pl011@90000=
00 ${QB_XEN_CMDLINE_EXTRA}"
> +fdt set /chosen xen,dom0-bootargs "${QB_XEN_DOM0_BOOTARGS}"
> +EOF
> +
> +    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> +        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> +    fi
> +
> +    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
> +    do
> +        MODULE_FILE=3D"$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
> +        ADDR=3D"$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
> +        MODULE_TYPE=3D"$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
> +        RESOLVED_FILE=3D"$(readlink -f ${MODULE_FILE})"
> +        SIZE=3D$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
> +        [ "x${SIZE}" !=3D "x0x0" ] || bbfatal No module: "${MODULE_FILE}=
"
> +        write_add_chosen_module "${CMD_FILE}" "${ADDR}" "${SIZE}" "${MOD=
ULE_TYPE}"
> +    done
> +
> +    cat <<EOF >>"${CMD_FILE}"
> +fdt print /chosen
> +
> +echo Boot Xen
> +bootz ${QB_XEN_LOAD_ADDR} - 0x40000000
> +EOF
> +
> +    uboot-mkimage -A "${UBOOT_ARCH}" -T script -C none \
> +                  -a 0x20000 -e 0x20000 \
> +                  -d "${CMD_FILE}" "${CMD_FILE}.uimg"
> +
> +    # u-boot tftps this filename from DEPLOY_DIR_IMAGE:
> +    install -m 0644 "${CMD_FILE}.uimg" "${DEPLOY_DIR_IMAGE}/${QB_XEN_U_B=
OOT_SCR}"
> +}
> +
> +do_write_qemuboot_xen_u_boot_conf() {
> +    # Not all architectures qemuboot with u-boot, so check to see if thi=
s
> +    # is needed. This allows this bbclass file to be used in the same im=
age
> +    # recipe for multiple architectures.
> +
> +    if [ -n "${QB_XEN_U_BOOT_SCR}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; the=
n
> +        generate_xen_u_boot_conf
> +    fi
> +}
> +
> +addtask do_write_qemuboot_xen_u_boot_conf after do_write_qemuboot_conf b=
efore do_image
> +# Task dependency:
> +# An expected common case is that the kernel for at least one of the ini=
tial
> +# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
> +# add that as a task dependency here since the kernel size needs to be k=
nown
> +# for generating the device tree.
> +# Dependencies are only introduced if a device tree will be generated.
> +QB_XEN_UBOOT_SCR_TASK_DEPENDS ?=3D " \
> +    ${@[ ' \
> +        u-boot-tools-native:do_populate_sysroot \
> +        u-boot:do_deploy \
> +        virtual/kernel:do_deploy \
> +    ', ''][d.getVar('QB_XEN_U_BOOT_SCR') =3D=3D '']} \
> +    "
> +do_write_qemuboot_xen_u_boot_conf[depends] =3D "${QB_XEN_UBOOT_SCR_TASK_=
DEPENDS}"
> +
> +def qemuboot_xen_u_boot_vars(d):
> +    build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> +                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> +                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> +
> +do_write_qemuboot_xen_u_boot[vardeps] +=3D "${@' '.join(qemuboot_xen_u_b=
oot_vars(d))}"
> +do_write_qemuboot_xen_u_boot[vardepsexclude] +=3D "TOPDIR"
> diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/=
meta-virt-xen.inc
> index 5fbb57f..0bfcf59 100644
> --- a/conf/distro/include/meta-virt-xen.inc
> +++ b/conf/distro/include/meta-virt-xen.inc
> @@ -13,3 +13,4 @@ include ${@bb.utils.contains('MACHINE', 'raspberrypi4-6=
4', \
>
> # Set serial for working qemuboot console
> SERIAL_CONSOLES:qemuarm64 ?=3D "115200;ttyAMA0"
> +SERIAL_CONSOLES:qemuarm ?=3D "115200;ttyAMA0"
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-exten=
ded/images/xen-image-minimal.bb
> index f6fa5ed..6277614 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -34,7 +34,7 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-xen=
-acpi-processor"
>
> LICENSE =3D "MIT"
>
> -inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testi=
mage-network
> +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testi=
mage-network qemuboot-xen-u-boot
>
> do_check_xen_state() {
>     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)=
}" =3D "no" ]; then
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7213): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7213
> Mute This Topic: https://lists.yoctoproject.org/mt/90633655/3619089
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

