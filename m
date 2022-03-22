Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02350C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:28:21 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.40])
 by mx.groups.io with SMTP id smtpd.web10.9216.1647952098587828137
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=2vdnJyiE;
 spf=pass (domain: arm.com, ip: 40.107.15.40,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgFNBxVsmngLWvs4WHxI23M4rva8j3QxyQhPk0GNFSk=;
 b=2vdnJyiEXXc6SLdiCub+UjQ1m0GPN+nYA8m4BLyGh7ncWxyD/pU4cf4RJNu7wEeVkX/WN5sCaTmcmZwbh7I3A5jQyY0JOj2uqCNqea2E8y8j3AiPkKY8sJUwE3FpXG0WF0+2aNs7rXx0jfKF1fjPA8r11UrRgOCQn3iJq6xfX7o=
Received: from AS9PR06CA0361.eurprd06.prod.outlook.com (2603:10a6:20b:460::13)
 by HE1PR0802MB2346.eurprd08.prod.outlook.com (2603:10a6:3:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Tue, 22 Mar
 2022 12:28:07 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::e0) by AS9PR06CA0361.outlook.office365.com
 (2603:10a6:20b:460::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Tue, 22 Mar 2022 12:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 12:28:06 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 22 Mar 2022 12:28:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 374d4a953b292273
X-CR-MTA-TID: 64aa7808
Received: from 509283a17f14.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCD3B54B-02F1-49B7-81D6-19CCC1BFCBC8.1;
	Tue, 22 Mar 2022 12:27:58 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 509283a17f14.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Mar 2022 12:27:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjO9fyUd65fWvkHeSDSCHZWyhKA1HGssliLN3xKgkHv68nKaXhzy/jXPdB0SXLN7NX30rl2PqXc2pqtTsVm/og7qO0Ao8qi3h/ADanm1UFVVUl5w5tYDAhdBibzEdmvEdFjVgxs4oCx9ZwfXGD0cahZIEDhpJDwWF4feygqpXGGvzjVs50EOYUUx8nQwJTZgFV/pThbjkkMyup8UecCPGO/wytVDMI4Eql3JsSnP0hyRurjUusouYY7uZkctBulcdFbXXFQCa4BvgamJO2tCSY8ABRQNn3/8eF48POPMDPo6btYxhNTSX4/ZV5ZkuObQPlCrogNDZ5fiWOJLouYQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgFNBxVsmngLWvs4WHxI23M4rva8j3QxyQhPk0GNFSk=;
 b=grSbpb79cfmfHxaq3eETWSXbRu93vmD15M6QNiQR7rmDZBzn3pR35ZkRlLnpCfsDn//mbVAk4wgd7ffAVLf2ExLhwF+kpVHbYp40ZJMddMjR7t0Dw1u9cMUyk9j1Yrx9d27aI2K9S+Dk4Xn/Q78loI50A/ImgiwH1H0/5PFiDRVDhVTaFfFYLiJnZ/dezqf9R8ZVa6UuZPqoi54C2VX1vyWslwlGLs3nQprRZSvdsXkyHtyfLp6f6WkUFuwO0BJBzXNwx/Rln0U+mkDC+0dxyBGUzUrns37bP/GcfM8H31PspKppizQm/xs/UYNs9ZQpyEKAa+zu/KuTqnlRZxu/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgFNBxVsmngLWvs4WHxI23M4rva8j3QxyQhPk0GNFSk=;
 b=2vdnJyiEXXc6SLdiCub+UjQ1m0GPN+nYA8m4BLyGh7ncWxyD/pU4cf4RJNu7wEeVkX/WN5sCaTmcmZwbh7I3A5jQyY0JOj2uqCNqea2E8y8j3AiPkKY8sJUwE3FpXG0WF0+2aNs7rXx0jfKF1fjPA8r11UrRgOCQn3iJq6xfX7o=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7527.eurprd08.prod.outlook.com (2603:10a6:102:24d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 12:27:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 12:27:55 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Paulo Sherring <pauloasherring@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAA==
Date: Tue, 22 Mar 2022 12:27:55 +0000
Message-ID: <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
In-Reply-To: 
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d1877862-abb9-4c8c-bcec-08da0bff6aee
x-ms-traffictypediagnostic: 
	PAXPR08MB7527:EE_|VE1EUR03FT045:EE_|HE1PR0802MB2346:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB234657F50DF8E938AAACDA529D179@HE1PR0802MB2346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s/fJD6D5YRRM8wyaLuF0NvRBAUbKU7ZVk8oIjOwEkj1fsxct40djpVMmTL+ACRxItwS0yFZq16+OZjoAWWziUCJ6kD5oamNbNS+lgR2/JQ0j4M9WjGxYwIsG1kY5wb5LxJjI9zvnwQzpRXqrg3k9TqwB+njcMzV9pQCQ287vV4JPnml2aiGnrivKMYmYkiqgQCEif78Ggo9eXIUDlOWv7CNT8U5Is8lty1brKHKlMZI+KDdIBYO9D901KYA5sUDfrwvauBqOSbHKQeWcndzgXY62nh6v3/xQBpPsuFbcRrOoP0H0Q57FMldoYL+PNLBHWmICWgAa6N3Wrbqk+SAWU6y6h8mdFrS7YDH9TUkG9paE7BSryE0fF9kww58EXyMIQeIFqJkAt46fFF1DZlm/VrnkRzI+gS8rN2EVUvJ+G/aEFrMvvLDFLM4i4PVN1g/K2EJmour94elTKTXtHcFxaESYy9jO2Wtjkk6IfmdvjXbD84leGY15E2GJP/FANPCVSdFCV7EBWKZyJbEvKmUeN9uRoIUn2/z+3h9Rsbc9V3So/QPSfJc/ZAdFkLcsomph4EUHw4eP8TrmQ2PyHe88jatpZTZZy3Em/mnFOQklMtOkaBZ3e/zm/x8vWglqH8pKw0Hrdp0zxiHu/OpffaDtJnI22alHjavXWekjtl0JriSlXW/3bfJtgW+83ax53aMAIo4IZLBJLtECrgdq1crG30dfni/Mf73vLZd0RuDYmuSmvPSDpa/QUPnViOKKR6/m
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(33656002)(6512007)(83380400001)(66446008)(53546011)(6506007)(66556008)(64756008)(76116006)(66476007)(66946007)(91956017)(508600001)(86362001)(26005)(2616005)(6486002)(966005)(5660300002)(122000001)(54906003)(316002)(6916009)(71200400001)(36756003)(2906002)(38100700002)(38070700005)(186003)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9073815219033A46AC3496EE29345745@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7527
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7811a7d2-61bd-424b-1505-08da0bff6490
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oKyoaTiekkTWEL8XUQpMMgtLOyBMuHxwzwLincGotw/i5WVavu/OhEN9YOQr6zePo+It4drOMVQ8G65fw9yqVTzccMr0//pcqwQZX0asS1Yw6Ppu8i1++uDQc1zU4qfVBuDiE2GWbMvJ7K41/ZDbYggennerVmIIE99YR+sl/qLmMBS8Y70AmtCRBxiMKy/AZ3H/KEE4emchMuJrukOQCWm1hpzk0zTN2RfKi9zVK8cFV8zW6CZvjR6Zb/GQxX376ICP70jzoeDx5/woHAQEbxKlkqsA0VH3YpBLowG931YqhnZL67Zoc0EIJQrSh4Y0VopzOt8th3m5MLwRGjBdTUwssLyrjdkc1OLtM/wLBriIpA+slLBhjxFCTkutghj3lyfC0AOwGAtFN2ssViLXEV5umFAB+sQHEa5xgMXLH6SPnRTZNm9ZiISe6Roo1fqPU8dL0VSmZxnWvA8yFAw1UpUEpI2DKaViPLfliucE7TXA4vN4+7FqhTc2liyp4yFiQjskwbcu7WQpc/xAyzJb1Wng7Uz/wzHEKzhXgwmujXBUAwQ6fo9QsxWj9iKVwMnFLrLvz1Nm3e1GJwLBBpQwU3+LjnwAtHBNdEGQqIZL9wOeUTb6h8OlDH1HoYL7ZSauMV/EUb/SLozbXdt/hYinqKAub4xNovyQWsrIpb1XtLAJf5ItngwbWK1SyovEvEVw
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(40460700003)(336012)(2616005)(47076005)(2906002)(36756003)(36860700001)(186003)(33656002)(26005)(6506007)(6512007)(6486002)(5660300002)(8936002)(54906003)(70586007)(70206006)(53546011)(316002)(82310400004)(356005)(966005)(508600001)(86362001)(4326008)(6862004)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 12:28:06.3537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1877862-abb9-4c8c-bcec-08da0bff6aee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2346
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 12:28:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7097

Hi Paulo,

Please always keep the mailing list in as me asking the questions does not =
mean I will necessarily be the one working on this.

Please see some questions here after.

> On 22 Mar 2022, at 12:03, Paulo Sherring <pauloasherring@gmail.com> wrote=
:
>=20
> Hello Bertrand,
>=20
> On Tue, Mar 22, 2022 at 10:44 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Paulo,
>>=20
>>> On 22 Mar 2022, at 11:33, Paulo Sherring via lists.yoctoproject.org <pa=
uloasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>=20
>>> Hello all,
>>> I am a bit new to meta-virtualization and to the Xen project And to
>>> virtualizations, so please bear with me :)
>>> I've been trying to make use of the xen project, currently targeting
>>> qemu (and later on, rpi4). After messing around, I was able to boot
>>> dom0 and a domU.
>>> But, I had to add the xen-gntdev to the `modules-load.d,` because
>>> `xenstored` was failing to start, due to some missing connection,
>>> probably brought up by xen-gntdev module.
>>>=20
>>> As I am new to all this, I was just wondering if this is by design, or
>>> this is an issue (and therefore, I should/could submit a patch).
>>=20
>> No problem at all and thanks a lot for the feedback.
>> This should not happen and should be fixed.
>>=20
>> Could you tell us what you are building (which image) and what parameter=
s did you set in your local.conf ?
>>=20
>=20
> - Baseline is hardknott.

Any reason not to use honester ?

The rest of the configuration sounds about right.
I will check why gntdev is not in.

> - Target image is xen-minimal-image (for the host)
> - On local.conf, I have
>=20
> require xen-host.conf
> and the contents of such file is https://paste.debian.net/1235220/
>=20
> (Also below, just in case the link expires:)
>=20
> Thanks for the prompt answer.
> Kind regards, Paulo.
>=20
> ## Machine Definitions:
> MACHINE =3D "qemuarm64"
>=20
> ## Generate ext4 rootfs for manual handling:
> IMAGE_FSTYPES:append =3D " ext4"
>=20
> ## Virtualization:
> DISTRO_FEATURES:append =3D " virtualization xen"
> IMAGE_INSTALL:append =3D " xen xen-tools"
>=20
> ## Kernel stuff:
> IMAGE_INSTALL:append =3D " kernel-modules"
>=20
> # Extra Packages:
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> EXTRA_IMAGE_FEATURES:append =3D " tools-sdk"
> EXTRA_IMAGE_FEATURES:append =3D " tools-debug"
> EXTRA_IMAGE_FEATURES:append =3D " eclipse-debug"
> IMAGE_INSTALL:append =3D " nano findutils tree openssh"
>=20
>=20
> ## Wayland stuff
> DISTRO_FEATURES:remove =3D " x11"
> DISTRO_FEATURES:append =3D " opengl wayland pam"
>=20
> ## Systemd stuff
> DISTRO_FEATURES:append =3D " systemd pam "
> VIRTUAL-RUNTIME_init_manager =3D "systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
> VIRTUAL-RUNTIME_initscripts =3D " systemd-compat-units"
>=20
> ## Connman:
> IMAGE_INSTALL:append =3D " connman \
>    connman-client \
>    connman-static-ip \
>    "
>=20
> EXTRA_IMAGEDEPENDS +=3D "u-boot"
> UBOOT_ELF =3D "u-boot"
>=20
>=20
> IMAGE_INSTALL:append =3D " lvm2 bridge-utils"
>=20
> ## Extra space for fitting VMs:
> IMAGE_ROOTFS_EXTRA_SPACE =3D "5242880"
>=20
>=20

Cheers
Bertrand


