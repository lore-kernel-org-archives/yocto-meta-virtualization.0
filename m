Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5C3C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 06:50:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web10.4718.1657781394275096524
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 23:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=IGhgzlEs;
 spf=pass (domain: siemens.com, ip: 40.107.20.40,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lweTHfaI1W7ILqhugkRc3l1niKqEqKNbZjUs8qaztVYljIToiTwAsbQfuyR1p67GcgH+PediWx8Y3BGTk17QG7oee5UBUFNHIUq5inYTUTpYm981VSr7IV3qKdBwU6qFpfxMa32z7hv+oLOv8HX9lJzYoIiihMU55Rxk7l7IuYVe21U6BTR76ljvldjS+KCmsgBeMp57XSmJ9p+bzWMfPzcf9MaDLD/7lmmWt7txlttSHShhSult6nkY/Ty2reqIgowH2jKPHwPB9wq2IWO5jh2cCxge5BLccLXAJo2SHYxxBWRegBJzA5n3xKqnYmHrSW7PJ4ZM0RR4xOOfla97eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB69PVIlR3MZVJ/V/X13DiTmCp/n+gOUtF3pYrsGVTI=;
 b=TvZDo8wYNECcL5IFxQmjwmoq0QXuQ7o8gslOktpgngZ+4+Ux2XMASfzI60lfdbluD5vqVfCOW1CmfPwiFfnh3+tP45EVD9Iljq01rnzsp7I3syIBn5B3Ayy3Rdb7adRP8cLyIcvm9cUNsuFma/g7Xs9yKrJwLy/AfDaZrrofXjJvgTAmYW8XWpWw8tqp9Z9gfzcEAtyzb5AfnzIC5ky1nWM7WnmtWKDZokDjJlSo2VlPBI5JX7sDeoNKzxxlRFk+LG3zEScaJ5zYJ8ij5Mseqbo5Oy1wUZFfdvwcyobTHXFezcdqNNTlfXJbF9bADSu3k5z6M/K2by7SSTlJh6CfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB69PVIlR3MZVJ/V/X13DiTmCp/n+gOUtF3pYrsGVTI=;
 b=IGhgzlEs4LVNFJlNP3OL+w9SGUFmVuBPioXILKF9MX5bF9qRICGQfhjguDSpox2WTS/qS12y7JeqLCA0SMBFRC78agje7biFNEoCf1P0aWPuLxilMu+jEqOTUBSszmcd9Jmx59w+jEHtkTMgC+lV5/syUHCatwsrD8tORVrS25dAV4cRss9GlXAnrsbbU8a6pRz9IgNV5zrJy2KbK5YS/10JR+B6gxghBAgb40gkqJ1JtZB8g2QswWrJGa2OrURD09E74ZIjC+TKJwVSa18CyARJVzcBZ2KqxCzjvDdUFkF+v1Gh0YjQ8FE1HqiF5+mJRFw+LpLE1oEPJqNT9VCYIQ==
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b6::18)
 by AM0PR10MB2385.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 06:49:49 +0000
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6]) by DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 06:49:49 +0000
From: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
Thread-Topic: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
Thread-Index: AQHYlojkHHOFwCLM1USRTz1pkaf8ga18w3KAgACrD0A=
Content-Class: 
Date: Thu, 14 Jul 2022 06:49:49 +0000
Message-ID: 
 <DB6PR1001MB1285815B1B914AF71EC6201AFA889@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CADkTA4PZ6rMBUAF1Q23C6ov9OzjByCjvDQ+dMMxumyJL2fzaUg@mail.gmail.com>
 <12926.1657696750463147139@lists.yoctoproject.org>
 <CADkTA4NzkovYyu_b-pJCFjoKwpCb+q-mQKkRZVQ7mkkxsf389g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NzkovYyu_b-pJCFjoKwpCb+q-mQKkRZVQ7mkkxsf389g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Enabled=true;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SetDate=2022-07-14T06:49:47Z;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Method=Privileged;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Name=unrestricted;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ActionId=283129f4-def8-45b0-ba49-04a0e4608c8d;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ContentBits=0
document_confidentiality: Unrestricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a06171f-8ab2-4fab-e792-08da65650bed
x-ms-traffictypediagnostic: AM0PR10MB2385:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vPGlAvKH9mlzKjRobrp9EgXJiTqPexMDFJAuew5WQGu9PVwlcOYGnpUx9MUiqFhWRBk2NRuxjeBEpDFvl/JouLfpvpmFmZgSePkCSJC+ETu8clmlF6bsyFz7ema1EtiXoG49DKsnvuNiB9M4u8aJU/57QfLWDdoQgYNn4skBlw2P+gkrVyvQaHAhdePIQN85FuZ+QdbgLjeOmAXC/IzJubqeRNgvELv6gFmF4nXhC2SIc5DizTq0fxlOBr2lIuDGQqGAs4MISlqAKzO4e2gkUJKsg4uTuTn/BFb3Dqu1EdnMA/b90Dcb9+u4hLwVk5uVxMyIN1hig65mZNf6tCM3jr2kuh088Exp6DZIHbbhff+nQ8z5lmkWCxBJsODUfdsT7B8Ds09Ol0bSGcnoh8yahUFovQd0DToG7RwRKreVWayulIlF3WQ6b8FV88/QQTI11Yo8strhICfSXyCKO73d7jbdXKnL4z9HPI4iXvWHYLq6Beqwq5I7HjwiUdErndPLeKSJXbkn2w1vjSbbPtSxN14MUjlB0UVBqPTsl73EdIo76OQiIdRByhVVK4ZJV+j8fMtaR54fMINe+KEX061NPadlnehhnmewzHn+IVxyccrFHrKcAKVZNfvjQZ4d3kysf+5GXAiu3QQoMeRkNq0mcP6nGpeuTNcFc8JkSE4HcrTrQMPiisBtooZWka/UaUjRVZL/TQaYPUYeHnxZ6OgSC1eQIJ8FpvhYNh1Nt0+NMNCrD22zRUzGmLmEzS/sOs+Hu8hgWfqxSq8w1mlJY2J6D7Lx4n7+w51x+/EabWV0umbiq2p39s8M3nfILKqQNYo0CT+BleLMmb70WC73q+ae5Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38070700005)(5660300002)(26005)(7696005)(53546011)(55236004)(6506007)(41300700001)(966005)(478600001)(9686003)(4326008)(66556008)(316002)(45080400002)(8676002)(186003)(6916009)(83380400001)(86362001)(122000001)(52536014)(55016003)(8936002)(2906002)(71200400001)(38100700002)(33656002)(64756008)(66476007)(82960400001)(76116006)(66946007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6n47BCNdH9ZHEdsBnE2eH0HDF7dStV8EV9Hpmgzd0D00jqAQpiL0a1cODu/V?=
 =?us-ascii?Q?8VNhwYRVr7rFHUwBWKf6iet1yxsvZv08C2LgVTd7IvkjTiOpQwOB5WBp/Fi6?=
 =?us-ascii?Q?verFq/L3Dr012gQ3mHNPC0Zmv3XoZTwWq1ZgiVVNSSb2/hEcJINSlGHU9jK/?=
 =?us-ascii?Q?9ufNhiXhqhC5H2HdJVbi5Rz9WPrmnNt61i0/FnuKyXq3QjybpGyx44uAPJHn?=
 =?us-ascii?Q?/3Ah+7ZSHYshggCqU3BHEJ3D///NaCVT4ouXc1pf8FD+dnzc57f1nLv2On5b?=
 =?us-ascii?Q?d/puB8df7cT5BWOxrk3FKiIZvU4tYRWlrGXXALJeCkGMDN9e/ObZjV6haJwr?=
 =?us-ascii?Q?oGUolBKMG1crbf66tKQtgJud3DtPfFu44xDO1KnvrgC2gP9P9CY9q77RXQJl?=
 =?us-ascii?Q?LrXMvWOHq4a1pdgVFb264agTEywVNXsKSfcpm70SkMoe7ifnrKQ16ud/thWe?=
 =?us-ascii?Q?uZI5aj6cOIsM2591VkkHqObAa4Yq9ht/RkxFY2dCaTryd2hwDxQ47q+VsY0p?=
 =?us-ascii?Q?3diuirGU/QMTGncSgmkL7es66zAyG0FUT4o1LJBE0reoLY5tUoZxXqoTcBSi?=
 =?us-ascii?Q?rXLZy04qEpwcWjOpfvQVMr9bkCpdAU7S/p5e26EKTF5mZcXqJNWEOe60L4i2?=
 =?us-ascii?Q?V3CQY1JcQ5fib2xt+Flb03sV8HmUzcLXcP/LdjQT78LtNiWpwVeCsUQQvWqj?=
 =?us-ascii?Q?dy+E7Osrv9FJcOL5Nt1DTSBbXJ1ekPFQahc6YRVe82GDmz/5ssQrZzzNQCMU?=
 =?us-ascii?Q?QWQmgaUo8WlVzCt/CRMHaslPRaqGIXZZgVsa6hwyzIzNQeCESZOrByqJeHbR?=
 =?us-ascii?Q?mzsoB3R8bZuVVLZYGLCQfhF588igSAW/rQFieTSmeU4Q8xbUJUZSs7iJ8QPk?=
 =?us-ascii?Q?M0Y3UcfQINEF5cg5SF0V4uJJN8g1PzYQsqBzePyHA091etLCGFFzko5QyBA6?=
 =?us-ascii?Q?vtZzbPpgPoNc7+b2Oxti3CiRh+0OG6QHaG6ZHui1ypwIBAxGBDP/ISDZJSE7?=
 =?us-ascii?Q?mtJQUwXFMDpGq2e4JwyCbx4f9Z4xo0dC0Rqz68sH/YXD3j6UCmsG6fOI1kT1?=
 =?us-ascii?Q?hrPOEMCmy00WshrVIuE4sZtjWJMccbdIYLCopRt4oyl87LIlOqQwEzTbvYb0?=
 =?us-ascii?Q?HTAIelKOTvEd7CgXyGorBv26rPZkPxilG+onPjtz2UKm4tZPw64espTsLT8K?=
 =?us-ascii?Q?R8tiNa7lk3zZn/utnyWJruEwJLpdX4Xp1giyGTBgo6T0bpGibjkcGAvk/AZj?=
 =?us-ascii?Q?sO4gfRk2EbdlMiINTXVpmoTTBl8dKG8LyCyLo8njh/eYTZVc5C6ZcgRfXjhY?=
 =?us-ascii?Q?wXLnkLG86egBQqcHQexuDmRDBK67sK8Kfm4XMIUEr9iChNh7564qB3dZj6cY?=
 =?us-ascii?Q?QbLxuTEMiSV7QkLXekQIBaNv+yWkkolJbaRk5/XT/4uslz3mOdwmsy/J/eRu?=
 =?us-ascii?Q?THMqxHg8vjR/bhVjk8zMXooUBlsjMgSW82yjgo80R9lph9llmX/vR4f31pLL?=
 =?us-ascii?Q?KSVyNPMGzgobBFG73tOJ4bT/1D0Iw3lefvlEMWO1vHjlISX1mQowwOweSgsT?=
 =?us-ascii?Q?Fn/XJU2ITrsc55edeehwfwAsSQ5Y8dwYY/Er7O21e94iWvN24YmC9gfru7Kp?=
 =?us-ascii?Q?BRRnS7KtHMPoDhVjYOsVUzc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a06171f-8ab2-4fab-e792-08da65650bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 06:49:49.2433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 umfB4vUyOVmsAkWbrMQoRVKeEjLpwsxLD55hC0jjj4lIGLd2lhCl6y9IjqBKZfs/r2tOcgV8HnWdDTM9lALGPcqqgmPqQ9zDo2ONXElWpgb0WrFaTRzon0PItjLYmeT4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2385
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Jul 2022 06:50:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7461

Hello Bruce,

Ok. Thank you for the extra info! Let me know if I can help in any way.=20

Vasileios

-----Original Message-----
From: Bruce Ashfield <bruce.ashfield@gmail.com>=20
Sent: Wednesday, 13 July 2022 22:37
To: Anagnostopoulos, Vasileios (SI BP R&D ZG FW ITW) <vasileios.anagnostopo=
ulos@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent=
 directory in tar

On Wed, Jul 13, 2022 at 3:19 AM Vasileios Anagnostopoulos <vasileios.anagno=
stopoulos@siemens.com> wrote:
>
> Hello Bruce,
>
> How do you generate the images and import them? Could you describe a bit =
more the use case?
>
> With podman for example you can load the image by using `podman load=20
> -i=20
> build-oci/tmp/deploy/images/capricorn-64/name-of-the-image-capricorn-6
> 4-20220713063601.rootfs.tar`
>
> Usually, the tools that support the oci image format also support the oci=
-archive image format. An exception is docker that does not support the oci=
 image format and I have first to transform it using skopeo.
>
> What is the advantage of first un-taring the image and then doing the imp=
ort?
>

There's no advantage, it's just the support for the OCI image format when I=
 added it, was around the oci image, not the oci-archive, and it was design=
ed around oci-image-tools, runc, and directly executing / manipulating the =
images. The tgz version was something I added after, to make it easier to c=
opy them around, stage them, and otherwise collect artifacts.  docker, podm=
an or any other specific runtime wasn't the target.

skopeo was from the beginning the tool that was used to copy/import the ima=
ges, and that was with the oci: type .. not with the tarballs .. in those f=
lows as well.

I'm just pondering the right way to not break existing layouts and flows, a=
nd that will take me a bit longer.

> Probably the other 2 patches that I send it with this one (https://eur01.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.yoctoproject.or=
g%2Fg%2Fmeta-virtualization%2Fmessage%2F7442&amp;data=3D05%7C01%7Cvasileios=
.anagnostopoulos%40siemens.com%7Ce7c7815f43d3483c14f508da650f6d65%7C38ae3bc=
d95794fd4addab42e1495d55a%7C1%7C0%7C637933414173777208%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DRD4LV6MF%2BnRRQ8XoWpfskOl3UqEBIEMWLATbhT9Ny%2B4%3D&=
amp;reserved=3D0, https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F744=
1&amp;data=3D05%7C01%7Cvasileios.anagnostopoulos%40siemens.com%7Ce7c7815f43=
d3483c14f508da650f6d65%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6379334=
14173777208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DUmp5aMIAv2jgdVmJHsX=
qhlS8ls6ywPV3jQv2F0%2BoCoo%3D&amp;reserved=3D0) are still relevant, because=
 they are fixing other minor issues.
>

Yep, I still have those tagged in my "to-review" and "to-test" queues.

Cheers,

Bruce

>
>
> Vasileios
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7451):=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F7451&amp;data
> =3D05%7C01%7Cvasileios.anagnostopoulos%40siemens.com%7Ce7c7815f43d3483c1
> 4f508da650f6d65%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637933414
> 173777208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DvhWe9v3YtsxGI
> Lew09eaASExIkXzQu%2BspPMmcnqg%2FkY%3D&amp;reserved=3D0
> Mute This Topic:=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fmt%2F92331697%2F1050810&amp;data=3D05%7C01%7Cvasile
> ios.anagnostopoulos%40siemens.com%7Ce7c7815f43d3483c14f508da650f6d65%7
> C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637933414173777208%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D76OW1JHk0VvjDBeL6j8MfSKMq6fwU7
> U%2BJE5DwyzGQHY%3D&amp;reserved=3D0 Group Owner:=20
> meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fg%2Fmeta-virtualization%2Funsub&amp;data=3D05%7C01%
> 7Cvasileios.anagnostopoulos%40siemens.com%7Ce7c7815f43d3483c14f508da65
> 0f6d65%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637933414173777208
> %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I
> k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DWQKeT%2FXON37v1fW1uIc5
> GMW29oqVZSdMzvJvLS7NQEM%3D&amp;reserved=3D0 [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end
- "Use the force Harry" - Gandalf, Star Trek II

