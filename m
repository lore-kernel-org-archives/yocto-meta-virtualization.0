Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB28610A1E81
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:46:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46245.1774525570146917790
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 04:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rYSc9JjP;
 spf=pass (domain: siemens.com, ip: 52.101.84.6, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTDyQGAqzbDVySU1eXRxNdrhwWhW0vR4+jbJ0ZVSXtTsUyL0DCLgUloLVQ2CcCG6c1dv+kRMmcy11mha3kFFt2wbq2FDwNfgF83YhgFhl0RxJlMJzLfzTxgVo2+GGCETGgAFkUx1+3ifQ1/8C0mJZknkKdUyf5b0TdBCzeQ5kVe/k5069oVv9YWa75h+Dy8ZDt0QAQEypZBAMjES0ThlBkC8cu+C4dtZi3SP91w3xBopGafnRCMreNe7+mBuNisaNWHOpNYN1MvqMp37z13W71egPvOEC5iwKS86pcvEWOWjVksDx3TwLdJCI3pp7csBlejYEeBWLezpGAPdGn5lTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxu7edolJObV72pMZ1LImboU5SqCrRaZpjzlTNQ+nBo=;
 b=GCR1mRGD8+J77iC2PHQhWwKVmiKjrFJXYjzUYBep4a6iZuArEARyKFERyxyYhA/XkUeQjovMYCiZ09t37VwiWVjXjTg/43xS/y1SWRy1SLCfYqD4XfVm+odBFNXshjfgKjQiNwUtOS5lEhrXS4XFW7+TTDdYhm2ZICiG/Dtiwlbypzj56BarGuAJAELoHqbqJZQRg8nNQKcfJvSpiM1zmwIcSRmhQRuzOIAFBLcpmolVv1Y42mRNrubXkWOB/HU629BDHTuJvPVczaEUGK1Pb2zcpLDqUEz6yzE3yhp92nhuWsdUlUZWaDZx8CVV9Tw5kFmp9Z66UQhvfFBbidMB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxu7edolJObV72pMZ1LImboU5SqCrRaZpjzlTNQ+nBo=;
 b=rYSc9JjPZhjtJLsAuOXrmVBdK/J2rIXYb1ssuYupR3JLFg0IIGzN3PfzZqpqCW9tHSIdZy8ZoxfK8kNW/bUpI61q9NphhhubHUwxkQAnbvQyq9EED4JDxkWOQHMkcynLaxtR/bsUCW1p9TG7WxVnUIh3G2l3n2t6pQHIeOfudozCGz8q36PvcjsJnywqN4U43dnJxDAzRiVogD3i12lae+M7PazMJJJQ8NEqIwQAoAD5syodAP1wh6WXBVGQsNNVD/K9x8ssmDIG4wsfxZtToHNCEVjFqLExEgiIIf+ZP45jbl1+q5GlNAqAHO8kCieHaJJsSmLdOkXYzjgVojDMCw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:46:05 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 11:46:05 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: RE: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
Thread-Topic: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
Thread-Index: AQHcuvB3eVoUnWW7O0KWGfUJnAjm17XAteDA
Date: Thu, 26 Mar 2026 11:46:05 +0000
Message-ID: 
 <AS1PR10MB56978B8D8BB9EDAC5E9DACCCFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260323181103.10030-1-peter.marko@siemens.com>
In-Reply-To: <20260323181103.10030-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=87fe6435-f12d-4ac6-983d-08dd9e727f7d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-26T11:44:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7008:EE_
x-ms-office365-filtering-correlation-id: 2da60c98-e661-4c50-f670-08de8b2d435e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003|55112099003;
x-microsoft-antispam-message-info: 
 OL36n0s416WEPCxgu/bEMiUm7Ov5/QtYxe8G2ZhoaaNU9QImO43mo0rHGVBDByjZF0yybyGtlWLCw3+Fefh5Xq72xFmEw1SLGlGq/pY9UmKhCDs9ztT69Qoya1KO2UjhuBFoTBSfC++cqh4spk+mrO7n51tPum4XeuFMuxrLyK4KYZQWOeMJlz3NIPUUXQCMLdCttK4fshQC9QyOhDlerikJ3r+h8iR6YtFWogB47xAv3lLwHZvOVZz0QZOwkLxFaHvd/ejAJx28SJEGwHbM32g5Rh1FOlWrGRSV7+54162NBrdIJP9p/Wsb4lF+UACrpDyxlyeCTFzN2ssn/Itl1DjMxrKd33QGnoqEHoQs8OliJhE/J53rCZrZcQshnQEry6KdfL3GYUegZEO4kHJC87K1UNZ1KPo/Da8t15XwgFJBs0cpz78IdUZ+mYdpN7df5SFLNwnZxt0zdylyuKJP+EmIOi6R2CjaqimckUsV7clYvzwNvUozP0YNJH0Hzy809tcNvSqC3IuLuACZLo79qiNSbWxQjoZug5HgtId5jQrYOSp0YZGJj9gOvbY/7UP4WYPx0dJVOC/EJZ13jEWRBwRqKJI/OK5vJgkUgsZfqm0Pv8kgQzrT4FhkeIbjX+FH5fYRW0Y7U/3Uved7vDVqh6ZfJyMzXrUxqSpawcMW0hwtJn7ukOT4Cmqn7HZixDYJd68sl1K5Nso6pxo1remMCrrToP6E8sT02H8S+olERqdJFTyV3PayALRLsjzudNR9VD5K7d6H0lSByFkPveP/cUkrUNx7BRBoz+1AyfaoXwk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DKMbkiFa3S0vuXyzDEbR5pns/dhgJLg1z2BzpgJo/fZqD2qhgHkMhHyKRwwS?=
 =?us-ascii?Q?Ou8GP2qkb3QmgKW34UFTTxWgnefKt3B0Ya1A3RyJCqIBXwBAsfWpJ9xZVf5A?=
 =?us-ascii?Q?hkOd7xUPx97xdMBk1uDQkkYv/YblZeypSUGozcUmXiemRTU1L/szKOGHOOz9?=
 =?us-ascii?Q?vL9eU+7k1mZ7h0yPjh2Mvt1P6o3hVNvfHv25cHonSlIA1ar5OFZBvb0k8Qqn?=
 =?us-ascii?Q?tv17XlaODbA8hnFPFehhBz7TkHILTvhLxFXP4WEFLaQF4WI/gPnhe6x4K8f4?=
 =?us-ascii?Q?NJqhTjs8SpBAbVJ9+2EQXrzZR6tjoRy5naEZJzqGP8WdVlR4Kir8ADESirtn?=
 =?us-ascii?Q?fF/YCgR/BSC1+/dQbhoSaLDSEU+/RL8FPO2d6lZG8Krxr46ab9HYioGUeX5b?=
 =?us-ascii?Q?ccw/ZfwIYij+BxoQC36K3q9HYRlkwGhCVvor8iF2UIkg5FiEp1c1d8BbGTr5?=
 =?us-ascii?Q?jF5J8oWjcTLzNeykhDl+BNDOl1z+Ak7BKftedN8e3wfgNxWnxMmpkE+QS32N?=
 =?us-ascii?Q?gqY9QODj+IPXxmZA5sPlrVccPAAMRNv9C1HkMA9evabBK+YrMUE36ogZX+cp?=
 =?us-ascii?Q?xyFPp6dlUfY54u/M/GgAVtscuCxMIkVlBLOhtDgiL80mSlRL/u7Y3cDw7z6f?=
 =?us-ascii?Q?JRd/7gwr1RcfG/8lZjQaGCiF+Ks+fkmkhiQzfi0ImkcdlBq5VX5EAiqu7OFS?=
 =?us-ascii?Q?EE+NbNjJKkKFFTb7jq4tu7x8Q4Aa56Bl//UFKjj6TEeX8kpkwbTJJOgOx8R3?=
 =?us-ascii?Q?rvNjLJZtJbBcaLq4B5IIz5HJ89BS3zI3X08A67ZExDeAtzvb+qbeVxh8YahG?=
 =?us-ascii?Q?VPyWdN2rrX3tZLLVjiJ1q1b3XeUW856Me8l2bJrePrAfGXUrEysVzbH9NMfN?=
 =?us-ascii?Q?oW3Numh58HqhBehUvNBpaefMYV9ea60ypHarJNcPrwj7jTlmxg1qxXqewpSH?=
 =?us-ascii?Q?DbK2DjRkG+NxZpsJpfQfiAOQSS4krvTGTF3gItmnH0rNgWILpKVfQhRrhVNL?=
 =?us-ascii?Q?XHyCJ0Txe9UVs75Uyqnbz++EUViu3W4I3V1fRfVKGcELi03VVJMFP3L7vLz1?=
 =?us-ascii?Q?JlxV1V8eBkU3r2hxTWT+/PwUiE4gRYvaoUjGVtQH1E9kPR/abowjmAG68Sr6?=
 =?us-ascii?Q?KiWHLkkosB6wTaiHR2O2bDI9LizHo8GFATnwGrdrXNjyhUSwF6oS5/oZzUcd?=
 =?us-ascii?Q?6xwizyHG2t9KTfpr54GvZZCIvwaKz02nQukF8K2hZPJeT67jbYuLsfrimGWs?=
 =?us-ascii?Q?+Sb2O/CpZnUPAD0zaQZTenHBAwr4vTo/TEzDZWuF8OLZIqpYyKnwW5xjW4Kc?=
 =?us-ascii?Q?J+3ZCizI3Lkp5w4gVogbbIdL7n8Br/qadNj6EuiYcA1d1yRMzrw1Xm3tCazs?=
 =?us-ascii?Q?bvQvhPO/YRJ5qcdMLHQES02dBLjr5Olv/Ah85dgFXPPfwrB1HqLz2DMuVDzZ?=
 =?us-ascii?Q?V3ztMRhCwYs21V+woOdiZ+cFxllrO9rardzvLe8a6J6+uuTOJMRnt2lsINBy?=
 =?us-ascii?Q?H2h28USXpBD1orFAatZ8AjqMKuOo503BWeRbxerSRqInN81JO7NIu+nhYyoF?=
 =?us-ascii?Q?vlMcohjsH3lmd86zYjm8J5s36KlH3SAMMXt2Wt7qhgmoNoG+5YX1sEuVyZ1O?=
 =?us-ascii?Q?O1whBnq12Th+kyEIm/9O0vlM0luxQX6wsHbUtzVCFrEYaMpmVLRYOIEoKzyT?=
 =?us-ascii?Q?Nmbu3sfrQjXFagtx3Qj37dsSmeZjeo7bLXQAmBp7lQSDfW37J8CBTKV9qpHi?=
 =?us-ascii?Q?d3ghGOHh4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da60c98-e661-4c50-f670-08de8b2d435e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 11:46:05.2822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5ZzpJ0xXwjE6W6BF6hggIrpeWy96hIxrLdWx1p4QsacodSi2R512Yt5raoqYXaDlwJg9659ZQ1HX0JHRxjTBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7008
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Mar 2026 11:46:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9674

Hello Bruce,

I see that you have made your own update of aardvark-dns, but slirp4netns i=
s not done master next.
Could you please take this commit, so we have the latest version when branc=
hing-off wrynose?

Thanks,
  Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Monday, March 23, 2026 7:11 PM
> To: meta-virtualization@lists.yoctoproject.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [PATCH 1/2] slirp4netns: upgrade 1.3.1+git -> 1.3.3
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> $ git log --oneline
> ee1542e1532e6a7f266b8b6118973ab3b10a8bb5..944fa94090e1fd1312232cbc0e6b43
> 585553d824
> 944fa94 (tag: v1.3.3) v1.3.3
> 0422b01 CI: bump up deps
> 019cd5a bump libslirp to v4.9.1
> 1bdd0db Merge pull request #355 from takumin/ci-build-provenance-attestat=
ions
> bf1c767 CI: Enable actions/attest-build-provenance@v2
> 9996a4e Merge pull request #353 from AkihiroSuda/dev
> 4523924 v1.3.2+dev
> 0f13345 (tag: v1.3.2) v1.3.2
> 6c9d461 Merge pull request #352 from AkihiroSuda/dev
> ead6f78 CI: update deps
> d6b8b5f Merge pull request #351 from AkihiroSuda/dev
> e859823 bump libslirp to v4.9.0
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  recipes-networking/slirp4netns/slirp4netns_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-
> networking/slirp4netns/slirp4netns_git.bb
> index d245324c..62b14a2c 100644
> --- a/recipes-networking/slirp4netns/slirp4netns_git.bb
> +++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
> @@ -6,10 +6,10 @@ network namespace to the usermode TCP/IP stack ("slirp"=
)."
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1e2efd29c201480c6be2744d9edade26"
>=20
> -SRCREV =3D "ee1542e1532e6a7f266b8b6118973ab3b10a8bb5"
> -SRC_URI =3D "git://github.com/rootless-
> containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps"
> +SRCREV =3D "944fa94090e1fd1312232cbc0e6b43585553d824"
> +SRC_URI =3D "git://github.com/rootless-
> containers/slirp4netns.git;nobranch=3D1;protocol=3Dhttps;tag=3Dv${PV}"
>=20
> -PV =3D "1.3.1+git"
> +PV =3D "1.3.3"
>=20
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES ?=3D "seccomp"

