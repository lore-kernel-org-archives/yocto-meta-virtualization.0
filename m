Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A1C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:51:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web09.26131.1658145106181990857
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 04:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=z+jfwTSY;
 spf=pass (domain: siemens.com, ip: 40.107.8.73,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTCSNegQRON5PG6XGutxYTJe2sqDxJM7VeGVtYrDrG1Yqo5cd259AlK5WbupecCoKK9penoCX7QdfG1OLcY1GK43RKCDpPuYsAECktly/BiitnAyEQa1GBFqAamSUhrTBlISldwFCLglff8F7oivxwqNUYVXbZZbesSIE/nPZuhCv0ZJTA8kJ5dHuszR72M07QDFaq4HKcNSbk6xiq8za1HSU8IV8KG7chU18870aths0h60wYdBQdFGmFdSTrvH2QIN/YOsfXyGI21WGNxg0R5DfAUv/XC5+YauW8rnC5TljfuKjVQ0uTSeAMjF6Vgja0AwoxZAxJTDlFHwwQxVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnkt+66whqPeBcP1rfXwiOQBbV9M/Xfl4iO9hGwZ/Yk=;
 b=U11668PapW6pmoOSQzQlhrahJQ03b9pzuAiyLvjCvdGrauEyAbmGv7/o51ievduNsmmM+4HDCoGwUU92nhm6frcMJ47BQZGh6gKtbJqtTAOYxNLk0JQZNcN2t8b1TH75fjDFx8BB4I2oJCxOhVMbPVPq0SGB1gQbexIc4x4Dm5wSW4pUQJmabcfKeT2/KwgwC/V0ibdYohiMMrwkG5SDEQXFMaINbEY5NPRdqLCkMkRXjgJOIyQW7zD5HHe237hJasZBznqry8b3luHFxQ8pAhADxdd9xBqUOQOSaiL+tiYj5U/5Uwh3T7CROmrHCgB6xRdETM7pSJiGNqNO2H9PVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnkt+66whqPeBcP1rfXwiOQBbV9M/Xfl4iO9hGwZ/Yk=;
 b=z+jfwTSYBtl5PSybX3sIH8TG4Z0TgmIgr6E2IMOpqcqnXo6PDZoUXT9SXBhg7JScvWwfvtkvVp/eyAxh6uzMMR5IxuBHGox0L8bN1ACuDCnGL1CDZXq68IglWQTOlz2YFU53n/emkFX78VxuPi0WyzcOx4cbsLB3xhzl3oTRIiKOaRN9e14e+co4W7SQmIfIp6qhLfqA9R/HZqVt8QiZqJpfNdFXqjCw6Mxb02/OaShi08sG57yCXOOSKdNplbsck4HSwFUuG/2DSzIQzCTdhoU0NTclqx4JzWoPvDsg9KLZsohUrFmv9RVoB+MHM5KQuIoeOgsgbp1HcG2/oaGbfg==
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b6::18)
 by AS8PR10MB4849.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:348::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 11:51:43 +0000
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6]) by DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 11:51:43 +0000
From: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>
To: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
Thread-Topic: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
Thread-Index: AQHYlojkHHOFwCLM1USRTz1pkaf8ga18w3KAgACrD0CABp2B4A==
Date: Mon, 18 Jul 2022 11:51:42 +0000
Message-ID: 
 <DB6PR1001MB12850350F80F2A045592CC51FA8C9@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <CADkTA4PZ6rMBUAF1Q23C6ov9OzjByCjvDQ+dMMxumyJL2fzaUg@mail.gmail.com>
 <12926.1657696750463147139@lists.yoctoproject.org>
 <CADkTA4NzkovYyu_b-pJCFjoKwpCb+q-mQKkRZVQ7mkkxsf389g@mail.gmail.com>
 <17019F65456D67C8.559@lists.yoctoproject.org>
In-Reply-To: <17019F65456D67C8.559@lists.yoctoproject.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Enabled=true;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SetDate=2022-07-18T11:51:41Z;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Method=Privileged;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Name=unrestricted;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ActionId=283129f4-def8-45b0-ba49-04a0e4608c8d;
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ContentBits=0
document_confidentiality: Unrestricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d5c385f-5131-43d4-e48a-08da68b3e233
x-ms-traffictypediagnostic: AS8PR10MB4849:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 booqhESfCkJBj9teVWT82AdtopDeZRjeKwUCzqOrYo5aaxOqwh+1z7AxyBccB4FjGmMofzzN32ZOqb3YjB3z2cjDBm/MNXby+isY2oncpx/4O8mt2hogSI7hecZFCnIqP9s9U9EGh9Cn9jWkiMvOj39VdsxCDt85AC0MSMbE/zP1kBebFsOcq72ipUMmXK7m02XmoPmITiw93wvfeNHTqp3/2GgP+Yc27/+IrjI5iEPLr9YaBpal9+/gYV56U8LhqbcguNJP1B0JfF+EEFNsYA2oARPsmm7t48BwIwDx3HywKZEyz/mkm5ejWO2Q4pUKjZV2RgPZe/RYjqQ618WxC+VBECgbAfb2rbvjxc/O1Z8R6XqAK1ohduJgz8OUWwQLwyiq1TUrvgaywZ8yrWNcvRLMlMHnmKHqFwD7zJjwlpbhea0tCF6BJ1tbESEJbOVQW4hXlDMmXLEY756hV3HiNjBdEUJN4yHvQqj8VMqhyU575FufA2ZoFkNSJ5zDYAW1cx5ZHGs3mAm3nHWwqvV9Mfgk+1UvRVF45PXwV2gCfL6BnfT7/42mk7pnTt1y6P3BviqET+0QgNKDcqr67ycOWlwaUGGEobCWkmGwLpdYw90E3K8jha1blalBHL0+E0tAO4ZCgw72yEAyA+FAAjcFW9a2rOVFSnNUPSSDgud4UHf+E/gTC1w7ghdQww0wVnubHAEulhVPZRN9EMAedpTbkOyj+x25qFVcjA5zheh2CvawmRQvE4AdQTkIuOF7b4Sxo3tkFby3JCdYpTtXbL5GnVuoueNOKiBFXYxQdly/Q9RcLcYd/JVjdwSCRGCpUtEsnffmstbKsbgFQtVStldun+SLyNqEp7BQZnPHvpPkGhk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(83380400001)(9686003)(26005)(186003)(33656002)(41300700001)(2906002)(478600001)(55236004)(7696005)(53546011)(6506007)(966005)(5660300002)(8936002)(52536014)(86362001)(45080400002)(122000001)(316002)(38070700005)(82960400001)(66476007)(71200400001)(64756008)(66446008)(110136005)(8676002)(4326008)(55016003)(66556008)(66946007)(76116006)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NhiNEzH+d67b7DKBPUklCHI4bd/6JE8rbkYmZSbi+1I+ZyiSpf0yEAYVXM9q?=
 =?us-ascii?Q?mNvgHUzKYs1C43PsX1Ax01KCOG7BgE1ViuaJ84SHWKe6A1gPaSfLcBSdsRko?=
 =?us-ascii?Q?gHJDodvKTYzn7WjJaEDj4aF5t+fd+y1APStgMPut/kZLXYZGTwilu8Aw/DIR?=
 =?us-ascii?Q?v2mnZM3/Q0PvWVBszh0oZ852beLZ65+4IBCXffmk2Bwr9BwnAe3EYuib+EVb?=
 =?us-ascii?Q?5teNtaGyAIoxZuA0Cqz/3p9BHekMn0Hfu9J2hTL/Z4DvHkTmgEadHmSSvLV5?=
 =?us-ascii?Q?r2BKYrsv1A/+omeHRcMDfvXWbhZEiXgo41A/4fGNZu7sw/y8YpQByApjjDCU?=
 =?us-ascii?Q?R2KUGIG1mUXTuusqAPLAovLk3AdOpHmUEbOdWBsNCa6ti6XtfDHykNb/nwwl?=
 =?us-ascii?Q?4kphtPaanJCYBKMz5gkZoH9ix0zv6SPfDbnKUg0dr1rKm5qdin6/M0wl6ZUu?=
 =?us-ascii?Q?GbkK1ecxCOMEyACRBpu7WG7prTMVXqrKn432YkVxuHJ1WzC89E6Vt6Vr+YVB?=
 =?us-ascii?Q?qlVlSeKZe802XRJBoYKA1Use7oBZPsltF5LIzix09gXXXQTzaPI3qbtNHCQn?=
 =?us-ascii?Q?sHYQ4NBnPDIf9uDFMZrKwZ9Ewk8rQFahqnKAikPxW8m/Gmmz1Nlv81Uou/Vp?=
 =?us-ascii?Q?Ga110SZ2aZa/PPrX661BfB3Qw2IfIplGxp6ADegpFrslgqXBJaCuUOnRlijq?=
 =?us-ascii?Q?8WS9965QLOB9TLFFldmVdJAdPLa3XwLrQTfZ3M1XeM6Bqwpy/4fGEtifNmyJ?=
 =?us-ascii?Q?qsWubzUhqedIGK24x2jOoK4xaeG7Z0b3jMAqVsGirF5c7kMohadoNks09AAa?=
 =?us-ascii?Q?Klbr5k3gK3G4UYqGKMynHDG10hu1GLVtBvJdUFU1iB5/i5fYQ4Ndvhkt3prR?=
 =?us-ascii?Q?VT5VDQKgwlSKnQYNEtqR0oVsfRiodvOMfVQoMCcVjZAkenYPmM0rC8CKw9QQ?=
 =?us-ascii?Q?EfBZS9I74k2jC4rJ/4LA7uPp/tSVof55vkoaSjsr0wvL+1akqt3ngFSE50Ha?=
 =?us-ascii?Q?6CuQGcU4O11i+bodWs44DlePhGtW2h7UdchEQoIL39/scMdJw84jr7734Sk4?=
 =?us-ascii?Q?TyxdC7LQH3lr4Zx4x49S4SqwdDyAYcuUp9hwonO+F+OL0s/6clQ+MB3Lprg9?=
 =?us-ascii?Q?bEpY5VOMbZRD9oE2dV+NiXIO60/+LZcw1PoYXPqqHk8TiCi/6rf53ZbrDGy1?=
 =?us-ascii?Q?rFzEVGUllydj/sIqFol4muhmGc8THFJrrZmkQXJYN2hFnEtwHZFx6TN1dwgV?=
 =?us-ascii?Q?1Z1NhQVJGm1KLtbg9bigkw2IHKzM/MsDl8uPrQFbIu21b03i7CGspRgsZiRM?=
 =?us-ascii?Q?opB+syBJ4bK1JJhkKmJ3GCTT/A2ad0goy32ZO6lMQP9MZHlBnB/1+myoJHpk?=
 =?us-ascii?Q?yOzNZmd+WVAzmhCew0RtmbEXHbFqGEgQluqsqQQY4m/T1j6k/jotmD7J5Q5f?=
 =?us-ascii?Q?6uzbwmNFSTOKUvRg0zVrtxf7MkQWhZNaLHizvrCXDSsEU/DHZ1A9oDvV5Vnr?=
 =?us-ascii?Q?40APlz492qZuAEMB/rkUq18XMPBs14FHgHJJ+8yCMsjC6Hpnw1AUPhOiqmtD?=
 =?us-ascii?Q?ss4zs74o2P5wKwAbuxGUwY3juaDlrYdBlKYbyTHF6J07axdnZ3qFUEkjb1DH?=
 =?us-ascii?Q?gRpPM0WNR9bcNgdg+zj2a34=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d5c385f-5131-43d4-e48a-08da68b3e233
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 11:51:42.9520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 B1JTxerAuqTUtM5obofma/rbTmzZqYpTgcNJx2Xb5LqLzUikZ1VpvAANmOeBN1kp1XF/J/IPVo1GxoO98J+n4p2IlTf10AmPcvxQ3SI0S5eSNPQnMTt3SXsOyYsowVS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4849
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Jul 2022 11:51:51 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7466

Hello Bruce,

Thank you for merging the changes for the image-oci-umoci in the master bra=
nch! I was wondering, if it makes sense to also back port these changes to =
the kirkstone branch? If yes, should I send new patches for the kirkostone =
branch?

Vasileios

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Vasileios Anagnostopoulos via lists.yoctopr=
oject.org
Sent: Thursday, 14 July 2022 08:50
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent=
 directory in tar

Hello Bruce,

Ok. Thank you for the extra info! Let me know if I can help in any way.=20

Vasileios

-----Original Message-----
From: Bruce Ashfield <bruce.ashfield@gmail.com>
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
> -i
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
.anagnostopoulos%40siemens.com%7C45180cb757f947e2f63008da656510d4%7C38ae3bc=
d95794fd4addab42e1495d55a%7C1%7C0%7C637933782366613603%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DOnmF%2BmqKwRl0uBfYVswDG7Ko3f62BOMwFyzqQ3zOwjU%3D&am=
p;reserved=3D0, https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F7441&=
amp;data=3D05%7C01%7Cvasileios.anagnostopoulos%40siemens.com%7C45180cb757f9=
47e2f63008da656510d4%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637933782=
366613603%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D%2Bo56q8uJz5WdxSdKh3r=
zpdw4n9EguCgbgihXmlNPBIM%3D&amp;reserved=3D0) are still relevant, because t=
hey are fixing other minor issues.
>

Yep, I still have those tagged in my "to-review" and "to-test" queues.

Cheers,

Bruce

>
>
> Vasileios
>
>
>=20
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end
- "Use the force Harry" - Gandalf, Star Trek II

