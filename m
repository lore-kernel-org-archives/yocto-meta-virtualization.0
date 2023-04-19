Return-Path: <adrian.dudau@keyfactor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6431FC77B75
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 12:22:50 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.133])
 by mx.groups.io with SMTP id smtpd.web11.36102.1681906962280055326
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 05:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keyfactorinc.onmicrosoft.com header.s=selector1-keyfactorinc-onmicrosoft-com header.b=ejJrW+1y;
 spf=pass (domain: keyfactor.com, ip: 40.107.249.133, mailfrom: adrian.dudau@keyfactor.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4epoVhXh4BWh9nv/zf6SNnY1XfICRi0Ha84NiiIOcwJFnBvxhftmL+REpC/gzMKsBCqS8B1c+06swcVL5/airvppXJpgGUjWUQRfA6smneVeZZzY6kwxj49mh9ksYpRAeWemZwUTFGdVT1qQ6oXIDaCuHFQFvUsSI4cantaBExeBTnK/iBu4jGLXHuAKuh8mn9/E6p6JxOzjaPqcXqqmL4xJLm2Adzg9sj8mLZRSjYAwDHmz3oL/gPMeV+WlmewWXBYTOb2pyAQR16HVEwoz/452radN9HiTRMoKYQZBMIiTXjbwQ4tvoKi3jIyRl5VG1ZZ+CA9fCAVvfUYQR0BBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yno+JTIXq4Gvu2sI588s9weYcQoLnyeA7R73ZZ6awnQ=;
 b=ZNqvUHZlUEWP+CLh8ndtfd8QXaHIftkbQhwQeG5k1kCBWqKu8d/ARy8fvHKgRxHRB0Qav5fdUymu0ehVV+4JbxLBIR3f/jOl3MaJcMmNKRPIt6sDPWyIgLtO4AGbDtF+KmSefkMaMadYm0WeeLmcVfO26Eh2y4hLnYAxgoNcDuVtijJKhsfezznbFtSTVphdPVszpWRucdpPp+zJWaXNxZz1xKA5R2+LfUFdysn7AggnQoST3EB5ZxuEB6oGRnpKXsGsSukLKXEF48ltQ6XJEcQVZ2Mk3VuJbfQE9ocd+nP3XtyGY5sDhgjzJ2pazKnyHevvhwCGoKbdz2wDWam7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keyfactor.com; dmarc=pass action=none
 header.from=keyfactor.com; dkim=pass header.d=keyfactor.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KeyfactorInc.onmicrosoft.com; s=selector1-KeyfactorInc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yno+JTIXq4Gvu2sI588s9weYcQoLnyeA7R73ZZ6awnQ=;
 b=ejJrW+1yLNmU2vOb9lO9IonsA1JbZgsWw0JKTYykk6guf6Foei2zl0AJqTvvDmzNQhUA/dv9OWcNj52qnAp4pex0GlWP8MoaQthVUxfvCp3GlXyHXvwso8/N6BxzhY1tP9T4aXqdI7spKa8fZInBdlka3GZZr99T1v4abe44YxrOXVkH0O5qwqnXiByz/s09ZKZOZlVS32VrgxjfokFFQ50l6ozXtSK3qsCRRspmT2yP58naLkPjpga7fpIKEv0NdlG5sifXT1i1YKbi996LXMJuY1FrGX6pi/YeQ//30bTMa8+BGDF9pD2SwW0QQv2rJbXtVRcucSoBFvj3a/x15w==
Received: from DB6PR03MB2901.eurprd03.prod.outlook.com (2603:10a6:6:33::29) by
 PA4PR03MB6701.eurprd03.prod.outlook.com (2603:10a6:102:e1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Wed, 19 Apr 2023 12:22:38 +0000
Received: from DB6PR03MB2901.eurprd03.prod.outlook.com
 ([fe80::8765:fe14:31a6:5988]) by DB6PR03MB2901.eurprd03.prod.outlook.com
 ([fe80::8765:fe14:31a6:5988%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 12:22:38 +0000
From: Adrian Dudau <Adrian.Dudau@keyfactor.com>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Deploying container images directly into
 the target rootfs at build time
Thread-Topic: [meta-virtualization] Deploying container images directly into
 the target rootfs at build time
Thread-Index: AQHZZsbb356I5zK8uE2EUe7q1I4nJa8xX0QAgAABZQCAAUMVEA==
Date: Wed, 19 Apr 2023 12:22:38 +0000
Message-ID: 
 <DB6PR03MB2901C4F33D9CA28A11AF8CF191629@DB6PR03MB2901.eurprd03.prod.outlook.com>
References: 
 <DB6PR03MB2901D4439A5131E632CC350791939@DB6PR03MB2901.eurprd03.prod.outlook.com>
 <3071.1681836856076784160@lists.yoctoproject.org>
 <CAJiuCcdure1pYHm74kwFzO8BLv7Tj4fXFq7VXivBG-TcFMdUjw@mail.gmail.com>
In-Reply-To: 
 <CAJiuCcdure1pYHm74kwFzO8BLv7Tj4fXFq7VXivBG-TcFMdUjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=keyfactor.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR03MB2901:EE_|PA4PR03MB6701:EE_
x-ms-office365-filtering-correlation-id: 4472174f-6533-470f-855f-08db40d0c389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 02js6L1sq2QU4sSqL6q40W6xguGWm5gQg5vSX9Az5aclzidy6BJuc54+p6fn7qgfVktoLEH40RGmeoelIZVnzaQWoKCQCOJx+65Kr5a8O8TDCub9/WEMmRZJa3w0diXHYh+W60yPOns7+INvxwgwJF3v8MJjWGaz1px6Y+RqeaHsUjkYEKeEtfmWqEMrZB7Tp+XaTH9qD+KvkjcwHErAX+vOWL4ubiouIIWvQKNPKJ+Ec3u+HzUIliGGu4ixwY1jk02SumPiq0aJqTWT7kmzE6M94XSKfLs2o/fBeIUgNO3dmhB3vI4Lix0Nw/Nt0wkZpg4NFD/zfeXaPb6Yi6SFlrOMWdOp0n6VXe3m4AAxZJJk1c1PDsOXRwqGLutDiJBl0GPFtQa27+mK8zTMAQ/jpw6CxRyaPQFyEt9ip4Aon/8s6Cp+Ji+iwc8c5P5KyvyWHtAHz0Sa/WUququ+0NA/ySIgP4veRFAOx3p95QBs1+Wrol9la+rYbVEMwMn7kGEpyWp2ob1+vy9JtxJ+OXZdlpu8T2i5MjSOmeH2n++0zhs3Tu6Lv65iar+sdJL2EFi5gjP6qpNpVHXp3BN07BoKuNUJOkjqETipWmggiTaxu34=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB2901.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39850400004)(366004)(451199021)(19627405001)(66899021)(186003)(6506007)(9686003)(53546011)(7696005)(2906002)(71200400001)(26005)(83380400001)(86362001)(33656002)(55016003)(64756008)(41300700001)(8936002)(66946007)(5660300002)(966005)(8676002)(316002)(6916009)(91956017)(66446008)(66556008)(4326008)(66476007)(38100700002)(38070700005)(122000001)(76116006)(166002)(52536014)(66574015)(478600001)(45080400002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/pQ39XSHFRAbPvdv11mfSYw0DCsoVwaB7dN1ObZ6I0WHtVzibO77vXAN4r?=
 =?iso-8859-1?Q?YVrvUY6axyt/prTILtZB9t7Wh+HTq4xPFTU6NmjeJFEdQmxBHwcQG6zxYv?=
 =?iso-8859-1?Q?8STiyJdJfCm+7MyOGMMnd2brsyWwp2Rm6nobCBPoqXqjC0RyQzTaWkOO0K?=
 =?iso-8859-1?Q?GM8TgDQHmv0ZTTYFzxQOyoDsrqHNnzGCmzuxCkQm7hrxyGDRLuVRwVa3lx?=
 =?iso-8859-1?Q?hhe1mGS7FhfZymPpohz4+/c593oh+yh5zqYpB+v0uR4dGQnagfNmczGM5I?=
 =?iso-8859-1?Q?S95R8VyidZ174vXketfWAQWPOuQuvqLVEg4gV1AgGkEp+OMKM+PD2jG55f?=
 =?iso-8859-1?Q?BflY22krHuJKOwLzthkBEuNOgcpxMnymgpV8eSvTbguMjs/fMCWid76njM?=
 =?iso-8859-1?Q?MOsOZI8Nz0Sb4UCEL8jwaYvvULkGDUOPiWFZO9SeyXc+VxiFViGgrldyfm?=
 =?iso-8859-1?Q?rLA18TKp3aNQhOzmcbv+Pd4cEAYclk1+pnM2GUzskbsayfjLUrxOf1e2aK?=
 =?iso-8859-1?Q?uxvh5HfUWx7xAkeBVWcZ4gX34q+euNByMuqHci6RMBkfvowfrtQMpfVBkc?=
 =?iso-8859-1?Q?xaRJ2DlW93gmbYnL7QwykyIIrimGgcG8wMEjj8YeBXJspz5goLuhIJgOn+?=
 =?iso-8859-1?Q?4r5VEGg6nH1We68fKqB0Qj06Xa22y0QccYoCX+U+Kp1XVB0EFYzsBxGDgt?=
 =?iso-8859-1?Q?iGd1SuHzjy9u0f3+xj4UckIsSBxMXskRI4LpJN/EaH4WjnvXb7NqTmF6yD?=
 =?iso-8859-1?Q?jEPoEAfdRQVH4iAi40NKrCLLwlYKW2SkVQ1kUr04dVGkcQ5PMWaKx/Q9q/?=
 =?iso-8859-1?Q?MA/4njwdqmDe3HgEndotY7590c1AixDIsLjQ9juPXw8SfydLUC3hBu5Lc0?=
 =?iso-8859-1?Q?WXF8BEwhRvMYIqnyxBd9lB9a94F5fP2fOqCk0ADBHVhbbfGouVh97WxNc4?=
 =?iso-8859-1?Q?0pWIcBiC4Z4cCsiNJVnoDKbirBALxlrHJQMl9/zxa4YY6L4drnpvnx6ize?=
 =?iso-8859-1?Q?M0lkmlmP9nljZcM1gnmW5Yu06Y+hYpHyaRTW69NgXZ/MkPREsub7lOzyQk?=
 =?iso-8859-1?Q?jWLavzWsH3SZf2o1J7LRh6g/A4xa862cbAfY8W14YRxnh9r+QnW2RCCf8F?=
 =?iso-8859-1?Q?I7STkJt2BD5S4fRZixPxALTGqGnQqo36vgksUm0sOAWRNXjov4+XDLt6Pz?=
 =?iso-8859-1?Q?6KLkiMuwMjVlZXXkNhIAzavB4Z1IKI0JgvL4CIDVo82awu76G7BSiXxz2x?=
 =?iso-8859-1?Q?gaR+aIhE46QbyY4aPjgPPkmzxEd5cJMQCASGCHm8knpiRt3xjyy0v4kHPO?=
 =?iso-8859-1?Q?JfPig/mrBHS7fpJeHrJaqtc1A+qoClfn4lkGjaD10y7Sl56iMy+uEb7crB?=
 =?iso-8859-1?Q?/dDsDT7im+b3IIVD0wESAvEElCpv7yA99X/f4v5F43JS3IWW8nrxHYgm9L?=
 =?iso-8859-1?Q?M+P0jYvm/VpeKDv+bsze2Vl8+mPN16Q0nRpaaT8QRhN0g0EeWFAsh+YqpA?=
 =?iso-8859-1?Q?cMTxOz4KA9Cx2Fbs2qfQtCB0jtQDr9DPUxCDzujE8TSYEAFJpvgCo0PRSj?=
 =?iso-8859-1?Q?0WLITRr1ZIdBL2hbfj6AKN3FibugmnC70lQfPLrcmLmYCs32/JCL9uZ0tV?=
 =?iso-8859-1?Q?/WW9Nf50ImTlG9MdmHJ8EHroWb/pPR7PTE?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR03MB2901C4F33D9CA28A11AF8CF191629DB6PR03MB2901eurp_"
MIME-Version: 1.0
X-OriginatorOrg: keyfactor.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB2901.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472174f-6533-470f-855f-08db40d0c389
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 12:22:38.0736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c9ed4b45-9f70-418a-aa58-f04c80848ca9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTgY95/HZjL/sL5KizCHtVhQirlCSt0gqhAcT3JdhnMXPWB4pnzd7ORoBNkacW2IMFS8QV4YgmJ0mKUeC9/O4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6701
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Apr 2023 12:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7999

--_000_DB6PR03MB2901C4F33D9CA28A11AF8CF191629DB6PR03MB2901eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Clement,

Yes, I'm aware of the meta-embedded-container layer. The approach taken in =
that recipe relies on having an intermediary step at first boot where the c=
ontainers images are loaded from the archive, which I would like to avoid. =
For this, the best approach I found so far is to populate the container sto=
re on the host by running podman pull and then installing the whole store i=
nto the target rootfs. This is working so far, but I am having issues with =
the do_package task taking very long (>1h) due to the large number of files=
 in the store which BB has to process individually.

Best regards,
--Adrian

________________________________
From: Cl=E9ment P=E9ron <peron.clem@gmail.com>
Sent: Tuesday, April 18, 2023 6:59 PM
To: Adrian Dudau <adrian.dudau@keyfactor.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization] Deploying container images directly into=
 the target rootfs at build time


Hi,

On Tue, 18 Apr 2023 at 18:54, Cl=E9ment P=E9ron via lists.yoctoproject.org
<peron.clem=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi Adrien,
>
>
> I'm really new in building container with OE but did you have a look at: =
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fsavoirfairelinux%2Fmeta-embedded-containers%2Fblob%2Fmain%2Frecipes-s=
upport%2Fcontainer-image%2Fcontainer-archive.bb&data=3D05%7C01%7Cadrian.dud=
au%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed4b459f70418aaa5=
8f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
sdata=3Dg0%2Fz%2Fv8k%2FkKJsTU04o7AzxCfE5Lx%2FQUQfpM0WenBHGY%3D&reserved=3D0=
<https://github.com/savoirfairelinux/meta-embedded-containers/blob/main/rec=
ipes-support/container-image/container-archive.bb>

Sorry I tried to use the web interface tool, but this didn't make a
proper inline reply :(

>
>
> Regards,
> Clement
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7997): https://nam11.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fme=
ssage%2F7997&data=3D05%7C01%7Cadrian.dudau%40keyfactor.com%7C1dc25be4c8cd44=
2e650608db402e453d%7Cc9ed4b459f70418aaa58f04c80848ca9%7C0%7C0%7C63817433972=
7214337%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DZjeUx5qq42z%2F2Eml28FXkIC%2=
BkC%2B%2BY2fUPAXXrkiAukQ%3D&reserved=3D0<https://lists.yoctoproject.org/g/m=
eta-virtualization/message/7997>
> Mute This Topic: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.yoctoproject.org%2Fmt%2F98055400%2F4240582&data=3D05%7C01=
%7Cadrian.dudau%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed4b=
459f70418aaa58f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3DkY25XR6hS2wCeWL28G9V5lc9mS%2BS9aB9Qbt9UkXIrEg%3D&reser=
ved=3D0<https://lists.yoctoproject.org/mt/98055400/4240582>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Funsub&data=3D05%=
7C01%7Cadrian.dudau%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9=
ed4b459f70418aaa58f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000%7C%7C%7C&sdata=3DO4sSZ2oA1BL1oVgvSZA5iLWuu2IiqcwUIK1hO1kEer4%3D&res=
erved=3D0<https://lists.yoctoproject.org/g/meta-virtualization/unsub> [pero=
n.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_DB6PR03MB2901C4F33D9CA28A11AF8CF191629DB6PR03MB2901eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi Clement,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Yes, I'm aware of the meta-embedded-container layer. The approach taken in =
that recipe relies on having an intermediary step at first boot where the c=
ontainers images are loaded from the archive, which I would like to avoid. =
For this, the best approach I found
 so far is to populate the container store on the host by running podman pu=
ll and then installing the whole store into the target rootfs. This is work=
ing so far, but I am having issues with the do_package task taking very lon=
g (&gt;1h) due to the large number
 of files in the store which BB has to process individually.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
--Adrian<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div class=3D"PlainText"><font style=3D"font-size: 11pt; color: rgb(0, 0, 0=
);" class=3D"elementToProof" face=3D"Calibri, sans-serif"><b>From:</b> Cl=
=E9ment P=E9ron &lt;peron.clem@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, April 18, 2023 6:59 PM<br>
<b>To:</b> Adrian Dudau &lt;adrian.dudau@keyfactor.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] Deploying container images direct=
ly into the target rootfs at build time</font><br>
<br>
<br>
Hi,<br>
<br>
On Tue, 18 Apr 2023 at 18:54, Cl=E9ment P=E9ron via lists.yoctoproject.org<=
br>
&lt;peron.clem=3Dgmail.com@lists.yoctoproject.org&gt; wrote:<br>
&gt;<br>
&gt; Hi Adrien,<br>
&gt;<br>
&gt;<br>
&gt; I'm really new in building container with OE but did you have a look a=
t: <a href=3D"https://github.com/savoirfairelinux/meta-embedded-containers/=
blob/main/recipes-support/container-image/container-archive.bb" data-auth=
=3D"NotApplicable">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fsavoirfairelinux%2Fmeta-embedded-containers%2Fblob%2Fmain%2Frecipes-s=
upport%2Fcontainer-image%2Fcontainer-archive.bb&amp;data=3D05%7C01%7Cadrian=
.dudau%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed4b459f70418=
aaa58f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3Dg0%2Fz%2Fv8k%2FkKJsTU04o7AzxCfE5Lx%2FQUQfpM0WenBHGY%3D&amp;=
reserved=3D0</a><br>
<br>
Sorry I tried to use the web interface tool, but this didn't make a<br>
proper inline reply :(<br>
<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Clement<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7997): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7997" data-auth=3D"NotApplicable">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F7997&amp;data=3D05%7C=
01%7Cadrian.dudau%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed=
4b459f70418aaa58f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&amp;sdata=3DZjeUx5qq42z%2F2Eml28FXkIC%2BkC%2B%2BY2fUPAXXrkiA=
ukQ%3D&amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98055400=
/4240582" data-auth=3D"NotApplicable">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fmt%2F98055400%2F4240582&amp;data=3D05%7C01%7Cadrian.dudau=
%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed4b459f70418aaa58f=
04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DkY25XR6hS2wCeWL28G9V5lc9mS%2BS9aB9Qbt9UkXIrEg%3D&amp;reserved=3D0=
</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" data-auth=3D"NotApplicable">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Funsub&amp;data=3D05%7C01%7Cadri=
an.dudau%40keyfactor.com%7C1dc25be4c8cd442e650608db402e453d%7Cc9ed4b459f704=
18aaa58f04c80848ca9%7C0%7C0%7C638174339727214337%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7C%7C&amp;sdata=3DO4sSZ2oA1BL1oVgvSZA5iLWuu2IiqcwUIK1hO1kEer4%3D&amp;reserv=
ed=3D0</a>
 [peron.clem@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
></span></font></div>
</body>
</html>

--_000_DB6PR03MB2901C4F33D9CA28A11AF8CF191629DB6PR03MB2901eurp_--

