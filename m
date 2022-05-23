Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C106FC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 09:50:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.77])
 by mx.groups.io with SMTP id smtpd.web08.25642.1653299448984331135
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 May 2022 02:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=q+V5ITeu;
 spf=pass (domain: arm.com, ip: 40.107.14.77,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DQqPe9crx1+RwRNHXmjEURv3iq4Kfurnfw7t6ZrLI2pPAx83eKEA6Mj6Rk4ouVKstEXAKqX2kavTvcWFPHQuStud/x2FT/gbM/BuF/XJlIPy2kWwk1n79ocYbePeN24hMOIIRLfdsLYt2dsRmE7tLEphpTiuyI6AZeV2LLUl2kKDx6/5DKchfK+yaqvdOVywlIf9SwmoGs5wtEILrvuBfbhj2nT7jmu2wm1UBcWoK5tQmsypUCJZBkk++Dm1YekbTnCEupwrmf+0X/PxEdoJ4Z90EvrVBjcSST1+Zr4MHk3iFCeCVJr69pX9gx2qo3LnF/wKQkZOYq5VsDxKIwtpOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C9auzBlSNK09nJ21GvhZ8FvX3ZgMyXkXTzOppDGxcI=;
 b=VHiDfqUnarselNzwvyIEnniIUeh3CuzSjF3hqEdCGkCisFyljPOkNIhgluGhFuM9vSIGsXPPmkbjUM19mdkejgRp74iuscNZupBJGlReZEe6d6jqY/eq1cIvdGfnX73pRgjkMZlbpBVzjgFYfsWR9QSeIx8QK3enQHjA8nn79MbOBE7Bvc3MvGnmSgLeERKC5nVyL7ufA9RlWC3KYVPacGsvUKMMUg+Ylef3NB31AyvHJbdhpmv44RVw7v3UmUsMDUw0iG52W2X83JT+QujD5mrYPWXD9cIOABJpsnNDxRSvba7ehgUQttLOj6Uh+oYZN5yA7D6GDLy65htC8RFRwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=timeout (key query timeout) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C9auzBlSNK09nJ21GvhZ8FvX3ZgMyXkXTzOppDGxcI=;
 b=q+V5ITeuM6bkMyYn8Pw3rRj/BVCDCBxbLA7qVBTOySCn44Mhc1urCeF9wL/NiXuEsKA3BxrXWrRTJ6A78tiD037w6/AJkyq31XxQDwnLHnNcx2dhZcHC/aIi9Dr289m2g50niWllCA/W3KBp3SOTli2IPEIHYRc3uWXK278sMvY=
Received: from AM7PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:20b:100::20)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 09:50:45 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::4a) by AM7PR02CA0010.outlook.office365.com
 (2603:10a6:20b:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 09:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=timeout (key query timeout)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 09:50:44 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Mon, 23 May 2022 09:50:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86be15e388f0dabf
X-CR-MTA-TID: 64aa7808
Received: from 3a65101051d8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 173550A7-B93B-48AC-9BED-831FC534CFB0.1;
	Mon, 23 May 2022 09:50:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3a65101051d8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 May 2022 09:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wof0wTxF+a9rMJeaKuXcz0a/2wQTlg3B545rifYGr50HyqD1RxFfWF9zPNXFyTrxCmWF/u5amVVEH04V+YGlObnn8wh0gYXHJRm7WyauuMr6ZggYkWhdRBjFLNOpwmei0aLqOC954YpFCeYrLRUlskVQLyB/sNGS/yMVT6INT8IMMhWMt2rDl/HS28HTY92hymww9lAErq1gu89peNhl1YmmhyDISw7RzIvKvwqEkEU1GvxxKzf9ShmSfo0pgr0Htn/ftmFPKNOtpPomkb6cHk+0OXXPLyESqnR5twU4H+6VGVAf68OmypAwoTeAcRyP2Q/Z4EaMTFOfdY72xNHhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C9auzBlSNK09nJ21GvhZ8FvX3ZgMyXkXTzOppDGxcI=;
 b=IenBA31vS7bAx/5L+UD70IHHCUHE3uozlG15cxRi7ZklxYsT+0P/kW7jV++y3Z7rOcZkRvluWs9mXODl5l3ByCRFaAyJ7auvLqFCNDgqBauQEoL8bgJYzdghRVVjjEUOJvBqbSHWgZzvbAhkyp5uaAi0M28ZS05UvmErv1ufC618JrgKDTqMwHNygXg0QbKG9SBneYSmlWFuSWgDlzbdR2Epfg0Q/DuV9pWpXRtWy4ug/Fg35ECkd3w7lT7n8smmm34KQzb0HclliIv9tf/o0XtzHmmCp2Q2v08r6wdl4+rpSB1a2yeFh8A3Wccd4qC3VLIk2yWWhfjkkf/e6Qr+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C9auzBlSNK09nJ21GvhZ8FvX3ZgMyXkXTzOppDGxcI=;
 b=q+V5ITeuM6bkMyYn8Pw3rRj/BVCDCBxbLA7qVBTOySCn44Mhc1urCeF9wL/NiXuEsKA3BxrXWrRTJ6A78tiD037w6/AJkyq31XxQDwnLHnNcx2dhZcHC/aIi9Dr289m2g50niWllCA/W3KBp3SOTli2IPEIHYRc3uWXK278sMvY=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6929.eurprd08.prod.outlook.com (2603:10a6:20b:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 09:50:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 09:50:35 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][honister][PATCH 1/3] linux-yocto-dev, xen,
 raspberrypi: remove tracking bbappend
Thread-Topic: [meta-virtualization][honister][PATCH 1/3] linux-yocto-dev, xen,
 raspberrypi: remove tracking bbappend
Thread-Index: AQHYbUXAuQhLQUxQ1kG2x5HyK3wTQq0sOowA
Date: Mon, 23 May 2022 09:50:35 +0000
Message-ID: <BD952B1E-A02E-423F-9327-AF41911AFAC0@arm.com>
References: <20220521190447.135705-1-christopher.w.clark@gmail.com>
 <20220521190447.135705-8-christopher.w.clark@gmail.com>
In-Reply-To: <20220521190447.135705-8-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3fc58400-7edb-474e-0cbd-08da3ca1b46e
x-ms-traffictypediagnostic: 
	AM9PR08MB6929:EE_|AM5EUR03FT020:EE_|DBAPR08MB5591:EE_
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB5591D4EEBE1FD58618A6298F9DD49@DBAPR08MB5591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yn1EJZvtVPu1XaQESGjFPuSzt8L9PHrXslBG26y8D1k6CN+YNIo/r23PEyhjvZ6OG/1/PuCNAqxIJRE0Ic94rdNSTdxdLDqDccVRik66u3gCvw34vjKx2c/t39nkeimhvi6YoeeiFQJ6XrDt/Rd4QGeZO1ecgBjYcuhGwtEUMeCelQu6pIEGggec2gnrVosS6XNGzc8ifGe/ut4RXR9fNXq3D1ctP5hvSydVeKH1qxKg0jrMT1ZmRMloOg49/gGN44ixsn+szbB2FVdfOC9Z7Lt1GfYWnpqO9RtB9uTfuJtrByMYzVKvJK1yFPduFc9y3MRYIz61n+rlez/9GRhq7TCaSOSuck+6XoFue+TZoBJRO7Qgi5X6oRze5ZJ69pUkUq9VPOEHQjUUWNkUNSoCZWNRwtMTYShtHQ8+ghwE7adPbU1zSMl7s8Mot3sHzD0HWLp5ZSL9LqsreFN/hTXpI4s3j3g9DUpcH0Kl7hd/OFBjN4Z61s9fI5dNDy3RbYuDioKE9k1rMeb/90iB6F5HFQVSoWVJjBxPqKXwS8Hj081zqserSvCFLxKXW76kdyN5Ql4ymPe+mcW7aXlORGnG1d9K/ckFQTlZGpEgEkNoDmpqIVIT9dvfkTzPUlkKtF489VvxLNdiCP1zxlSGYip2RLHl8JpgZusucD0+sizYUuOyhty+j95gtL4AZ1Hru4Q9UdS8brjrOJeFWYC3C7GSo+7zo4N29KZEmB2RlIIjWKGH0HpiTTKT5gJFdzuqKexe
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(71200400001)(6486002)(508600001)(2906002)(5660300002)(36756003)(33656002)(6506007)(8936002)(53546011)(54906003)(6916009)(122000001)(8676002)(4326008)(38070700005)(83380400001)(38100700002)(316002)(186003)(66556008)(66476007)(76116006)(66946007)(64756008)(66446008)(86362001)(2616005)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BF099FE466F0F4B8268E477B69259AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0ce7213a-78ee-4766-7ab0-08da3ca1af6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9N3FQdt+b2gWsbCmNTajRjonL1veA80xjPfOy35WbE1N8t0Hqx8ZudCqTxJNNzwkgjOcrjMKdQIUGkrkBxOOZ9vsvjyg/8CICSoQjyjB27T7IzRfUKyBDVawAOPViKNF4LvCzrlXPpbjlARQMSdGyaaUssNCwT6ex0lm5hbU12lWqm6voTEr22Hog6uOCsfrktrvmOBK0lubhAEtrFLqxXNDi9Ee9fjC3P1cA8fk3LG0F6Cglvzcu56SAVV4gQIXsQsqVkeprNDC7g1Ehwii3JKzT6+qmch6sqXqWP4/BNzSAZdFCNbRLcrBYgO1cF44TvGHxY+Y18/J5EHqnWL7o5L5e9sRXs3PVCrXU6YVf/LKwqjSvEKgF3XxkMG9VdqaHQ+enkANiLpvEkvUOdal/++/LTBwAp9GPfKN0pnedagskVNr4+6k8/KA9LP9qrSEEaV1ZM8cin1B/UQxxMC8MAT7VeaSAdXNE9YXHmZ+IjEhzSTsPbJtq8fT70FLpO4QLy9dOcFi2TY2w+TAiwrbRyBRGAMvXpiWvyOqDFggSRMZ9XjctaJWhF3gyhn3+0A9H2zPDSemcPEBg8VwFvgKAfm1Zlv1iQ6KVj6HNUDKXbCwhoODgqf0+2YzAfhwVf2Okzbwr7MOgi7WZqiZtHMfbmEmSgNefpwqOBEw1/TPUI8sQx/1QkqLG5oux+u/j6hSyVsCF2MwVQDygXtErE8H6Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6862004)(8676002)(4326008)(2906002)(70206006)(86362001)(70586007)(8936002)(81166007)(36860700001)(356005)(5660300002)(40460700003)(316002)(6512007)(336012)(47076005)(6506007)(53546011)(26005)(107886003)(33656002)(2616005)(54906003)(82310400005)(83380400001)(63370400001)(63350400001)(508600001)(186003)(36756003)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 09:50:44.0233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fc58400-7edb-474e-0cbd-08da3ca1b46e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 09:50:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7313

Hi,

> On 21 May 2022, at 20:04, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>
> The default preferred Linux kernel for Xen on the Raspberry Pi 4 in this
> branch is linux-yocto. The alternative provided option is
> linux-yocto-dev, but this is unintentionally a branch tracking configurat=
ion
> rather than a fixed revision so not appropriate for a stable branch.
>
> Remove the linux-yocto-dev in favour of the linux-yocto kernel, which
> has been tested and verified working on the board.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> .../recipes-kernel/linux/linux-yocto-dev.bbappend         | 8 --------
> 1 file changed, 8 deletions(-)
> delete mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-=
yocto-dev.bbappend
>
> diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-=
dev.bbappend
> deleted file mode 100644
> index 5f43052..0000000
> --- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bba=
ppend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# For a Xen-enabled distro on the Raspberry Pi, override the contents of=
 cmdline.txt
> -# with Xen-on-ARM-specific command line options
> -
> -KBRANCH:raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
> -KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
> -COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
> -
> -require linux-yocto_xen-rpi.inc
> --
> 2.25.1
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

