Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA10C4167B
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web09.948.1650395233609756395
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=XMiCVz/c;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf47VxIY1e8MBztInd5SxpP7GBQwDerR+9IKhCBwZP4=;
 b=XMiCVz/cA7Zi5U5jXnJxAYkkWvKAeX6aq66MA7n9MVebhHEM6XvgRfFeTPRSysftFNNds3fXTj/VVjPboD7YBYXfdrVWgsCRp9oEqdD4DqtNdBfOzzfxO0OFifms6YQM2Z7S6qRC4eFGMJQ0a9l1bZmzaTC3zFFVIHbce4wMKVU=
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by AM0PR08MB5508.eurprd08.prod.outlook.com (2603:10a6:208:186::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 19:07:10 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::15) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.21 via Frontend
 Transport; Tue, 19 Apr 2022 19:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 19:07:09 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 19 Apr 2022 19:07:09 +0000
X-CR-MTA-TID: 64aa7808
Received: from ed3c1c3eeb4a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E2A2ED1-2131-4537-B127-103CC02601E2.1;
	Tue, 19 Apr 2022 19:06:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ed3c1c3eeb4a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Apr 2022 19:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U419PYInYzj2hopMpgne5W7p58vpCg/GPSjFQk9l3m4nE9hqzvphs/RzIl4naXCtdOXeivMgfVW61XHBWfF1e+UCBqh6w36u5Ku3Nkf8pp0skNe6UIl0xa7q17R+FELRFw5t4mI53PHCWDk2B29DTDRQeCztQ77RKKYaTSOOWh+u0wuB9hV4fQbP7CUxwvSVjkINjTBhSHgT2TcbU5ltBF7Jk2kRsfGxlEuC/dLuPqOoC0/lQz96/D5fMEMcTgfBOHdDE1ns5rBFw04sT5Xjhxq8ib4nkOYy6yC/rpk7awGWf+2cjD4ya1V4TlgyCwO7hgzTruQjaRXKQrJGVp3oXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf47VxIY1e8MBztInd5SxpP7GBQwDerR+9IKhCBwZP4=;
 b=GIwWl1DTAbxxFx8te70ZWTChub9je+JLWRFCpMaIVnZe2U/jPLxiakclqrfPDOy/04LFMymHIIQVJkwc9qBxHOWYeewSuhXCjL5LLGrQaeq6ZJ2ubeMgB+gcmmLd/vZTOYW60FaGRaNjLP3J1irFngzLNuHbJ04vM88fYNoPssSb+sw6a9C3snWCgA+gZYT1iNJnPQLlB5RSFshVqYcJOdD1Ag50e/WteXaRhhoXhi2IbSD6R6gtkTQO0xaYGs16Eo4BtdaAe0suoJpguUgn+zzL76UjvWRsEtq+ZD5uP6qWNGHTBXy5Zz5Z2YNnuLOVDI0LyxFpgZRBs5JUqJ/w1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf47VxIY1e8MBztInd5SxpP7GBQwDerR+9IKhCBwZP4=;
 b=XMiCVz/cA7Zi5U5jXnJxAYkkWvKAeX6aq66MA7n9MVebhHEM6XvgRfFeTPRSysftFNNds3fXTj/VVjPboD7YBYXfdrVWgsCRp9oEqdD4DqtNdBfOzzfxO0OFifms6YQM2Z7S6qRC4eFGMJQ0a9l1bZmzaTC3zFFVIHbce4wMKVU=
Received: from VI1PR08MB3470.eurprd08.prod.outlook.com (2603:10a6:803:7c::24)
 by DB6PR0802MB2469.eurprd08.prod.outlook.com (2603:10a6:4:9e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 19:06:57 +0000
Received: from VI1PR08MB3470.eurprd08.prod.outlook.com
 ([fe80::5869:ddee:b2ca:9417]) by VI1PR08MB3470.eurprd08.prod.outlook.com
 ([fe80::5869:ddee:b2ca:9417%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 19:06:56 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, nd
	<nd@arm.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: RE: [meta-virtualization][PATCH v2] xen-tools: Fix
 xen-tools-xencommons do_package
Thread-Topic: [meta-virtualization][PATCH v2] xen-tools: Fix
 xen-tools-xencommons do_package
Thread-Index: AQHYVBvM2Sol7Fo6VUO95/WYGSTLvaz3lhtw
Date: Tue, 19 Apr 2022 19:06:56 +0000
Message-ID: 
 <VI1PR08MB3470D55C69E59D176411051592F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
References: <16E75FCC13F8DB9E.24908@lists.yoctoproject.org>
In-Reply-To: <16E75FCC13F8DB9E.24908@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: F3AD2CADDBF3DD41B492DEF08D6B3BBD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: abc1dad6-93e6-4b27-30f5-08da2237cdf5
x-ms-traffictypediagnostic: 
	DB6PR0802MB2469:EE_|AM5EUR03FT047:EE_|AM0PR08MB5508:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB550835CB55C825DBB0A4F9E192F29@AM0PR08MB5508.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Xk/gHsjoxGrxvn6SCPzPVq29A/l6aJx8eClho9F1CZiMb9T9wer7GZhoZa/v/lEDxWnC7jB4bp/c0o/j6Ru2ANN8jQp+fRKpXronCz169EQGe7pLxiTPdQV0x6WgbFVeE/JN1UBPwFhKOYDraKq7siq85lizpjVIeAvyN1LyEkUckYL33MQlJmIqQVJxr1CKyUC9YgXkHZZYoo+PBSvxUTRS3Ku3MzSKHqoN2mZpGAAbeCB/QymD6TLf7uSTKW1l0u4MMHWiT29ioxKT4uG6sGDHf9cbWTtW/ewo4uAorv7ffMTJg9D2AWP5CeobV/68WkXhI0wdHU9UDVDYxiswrSOW23OX2wXH0OQjCiLdmaZ7Li6DJHQ2JcIs+nq7hZM7qp0ojP6JdFXus6cWwYqNl07/MnmRdtK1/bnTRNuAwJ0KvUBgyY5nDos73CXITBuBoF8RjqJOIY+JyK/T5w2JvHVUUz5YDgLJGk8Fmes4AVowRjLyyv1jZYu9FyICVvCeT3JWLWezppgyd74Gn9UencygnQjfgfCiZmrXzR14/lfobpoVIqgmsK4KCsGxXWpm8Mp+T2x4q1MzKn1Fho081jluzUTvFYpiOUafXyMULpR3JrRgAu+zvhXPJAQrMC/GMJDPymFFTsevVyUcHw0HGar5a1L7Zlsv5MvAIFGlEjWHQsyxyInAE/Cy6889MtKlMD0CXxJFmor8L02X17JN5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3470.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66446008)(55016003)(110136005)(66556008)(508600001)(4326008)(86362001)(9686003)(76116006)(54906003)(122000001)(71200400001)(6506007)(7696005)(38100700002)(38070700005)(33656002)(26005)(66946007)(66476007)(8676002)(316002)(8936002)(83380400001)(52536014)(2906002)(186003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2469
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f83f899f-defb-482c-d096-08da2237c626
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hGDiGDs4tP42accdzvhXtzwF0YdYanyyUADr0H4a2wCCWOnr+kASP9LD3UbavpZ6PQ2Z6wGgE3QkLVNvhV+Sk5mmO+cHbTFIT0s7QUq8nyMoAxQ47G0MkTsJfV4Sy6Z6NstH9dDDEc1nv0mzavn3acVTPt7ZF5CVBKM+TOwkEBoJY2r9YSrVnIxOMg7537QTcejTkGiO9gsMO3COMnrW6LauSLshKCXTtrDrFWlDrUEaN3EKbpho+CJNJsaL6LSQsuk45OQunVZThrRMZEIRtD4jPyPJfWirqkY7RAF8xwnzbf9ebGw8q4hz/KQ8arvR53LwAyZdMhflHT0/CCzLNYPVpDSOZwagNAZdIRWnyWleBOH+r1kX5ZIRt5dIbEpX80rpgw3h0Iyh40SqsZMjXmobpVPHgfnUi6W5AvQgfMXAXsxwKtxfschwG30vYUzBdJpuxz44FyKKLFc83JtIyZAYKGGOSTh9FJA3Q7g7MX+ydz1m6iy/QQyQ7DQSL/yc7ZlEucSzoM1Ap5qpXejfPJ8EQ8JkTyHcX3nkK3S3ecmqjwYIC+Z8YZTTLCDPq/uAKD/9ClTD2eS8UtQSmkHp+Sn5pqsTmwEDH+y8LtEh12kXWOAtmW/jDG6xHL2JBxv9lHXtfR1X0xjXWbjicDnjLeMBMTpRJmJmy5RqSyQR86U516Nx5Dw8QVmCKmyVf1rf
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(4326008)(55016003)(26005)(498600001)(82310400005)(40460700003)(86362001)(6506007)(7696005)(9686003)(110136005)(33656002)(54906003)(186003)(107886003)(8676002)(70206006)(47076005)(336012)(81166007)(52536014)(70586007)(5660300002)(8936002)(356005)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 19:07:09.9509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abc1dad6-93e6-4b27-30f5-08da2237cdf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5508
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7195

Hi Bruce and Christopher,

I'm not sure if this is the best solution, since after fixing the xen-tools=
 do_package, now I'm getting the following error on do_rootfs:
```
  Installing       : xen-tools-xencommons-4.15+stable0+84fa99099b-r0.   429=
/483=20
  Running scriptlet: xen-tools-xencommons-4.15+stable0+84fa99099b-r0.   429=
/483=20
%post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): scriptlet st=
art
%post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): execv(/bin/s=
h) pid 5408
+ set -e
+ systemctl
+ OPTS=3D
+ [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali=
zation-image/1.0-r0/rootfs ]
+ OPTS=3D--root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol-virtualization-image/1.0-r0/rootfs
+ [ enable =3D enable ]
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable proc-xen.mount
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable var-lib-xenstored.mount
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable xen-qemu-dom0-disk-backend.=
service
ln -s /lib/systemd/system/xen-qemu-dom0-disk-backend.service /[...]/build/t=
mp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/r=
ootfs/etc/systemd/system/multi-user.target.wants/xen-qemu-dom0-disk-backend=
.service
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable xenconsoled.service
ln -s /lib/systemd/system/xenconsoled.service /[...]/build/tmp_virtualizati=
on/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/syste=
md/system/multi-user.target.wants/xenconsoled.service
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable xen-init-dom0.service
ln -s /lib/systemd/system/xen-init-dom0.service /[...]/build/tmp_virtualiza=
tion/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/sys=
temd/system/multi-user.target.wants/xen-init-dom0.service
+ systemctl --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/=
ewaol-virtualization-image/1.0-r0/rootfs enable xenstored.service
ln -s /lib/systemd/system/xenstored.service /[...]/build/tmp_virtualization=
/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/systemd=
/system/multi-user.target.wants/xenstored.service
+ [ -z /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali=
zation-image/1.0-r0/rootfs ]
+ [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali=
zation-image/1.0-r0/rootfs -o ! -d /run/systemd/system ]
+ type update-rc.d
+ [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali=
zation-image/1.0-r0/rootfs ]
+ OPT=3D-r /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ualization-image/1.0-r0/rootfs
+ update-rc.d -r /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewao=
l-virtualization-image/1.0-r0/rootfs xencommons defaults 80
update-rc.d: /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-vi=
rtualization-image/1.0-r0/rootfs/etc/init.d/xencommons: file does not exist
%post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): waitpid(5408=
) rc 5408 status 100
warning: %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a) scri=
ptlet failed, exit status 1

Error in POSTIN scriptlet in rpm package xen-tools-xencommons
  Installing       : xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r   430=
/483=20
  Running scriptlet: xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r   430=
/483
```

I guess that the "xen: only package xencommon systemd components if systemd=
 is enabled" (c9554c6) patch introduced the issues for do_package as well a=
s do_rootfs.
Also, I never had the issue , at least using system, reported in the commit=
 message. And as far as I understand systemd is capable of ignoring sysvini=
t scripts.


--
Diego Sueiro
Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
>lists.yoctoproject.org
>Sent: 19 April 2022 19:32
>To: meta-virtualization@lists.yoctoproject.org
>Cc: christopher.w.clark@gmail.com; nd <nd@arm.com>; Diego Sueiro
><Diego.Sueiro@arm.com>
>Subject: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-xencommo=
ns
>do_package
>
>With the patch "xen: only package xencommon systemd components if
>systemd is enabled" (c9554c6), the following error is displayed:
>
>    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package: QA
>Issue:
>    xen-tools: Files/directories were installed but not shipped in any pac=
kage:
>        /etc/init.d/xencommons
>
>To fix this, we need to conditionally include/exclude files in do_install
>depending on whether or not systemd is in the DISTRO_FEATURES.
>
>Also, take the opportunity to have the relevant extra sed processing in th=
ese
>conditionals.
>
>Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>
>Change since v1:
> * Added missing ${D} when removing unnecessary files.
>---
> recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
> 1 file changed, 14 insertions(+), 6 deletions(-)
>
>diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen=
-
>tools.inc
>index 6bbc8cd..4acf054 100644
>--- a/recipes-extended/xen/xen-tools.inc
>+++ b/recipes-extended/xen/xen-tools.inc
>@@ -805,14 +805,22 @@ do_install() {
>         for i in $VOLATILE_DIRS; do
>             echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles=
.d/xen.conf
>         done
>-    fi
>
>-    # fixup default path to qemu-system-i386
>-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-
>system-i386"#' ${D}/etc/init.d/xencommons
>+        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
>backend.service ]; then
>+            sed -i 's#ExecStart=3D.*qemu-system-
>i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
>+                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
>backend.service
>+        fi
>+
>+        # remove sysvinit specific file:
>+        rm -rf ${D}${sysconfdir}/init.d/xencommons
>+
>+    # sysvinit
>+    else
>+        # fixup default path to qemu-system-i386
>+        sed -i 's#\(test -z "$QEMU_XEN" &&
>+ QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-system-i386"#'
>+ ${D}/etc/init.d/xencommons
>
>-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
>backend.service ]; then
>-        sed -i 's#ExecStart=3D.*qemu-system-
>i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
>-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.serv=
ice
>+        # remove systemd specific files
>+        rm -rf ${D}${systemd_unitdir}
>     fi
> }
>
>--
>2.35.1


