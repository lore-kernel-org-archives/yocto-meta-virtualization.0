Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F265CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:50:04 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.web11.14887.1758203393524847993
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=q73tp3Pj;
 spf=pass (domain: siemens.com, ip: 52.101.72.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkMmsB9Vs4UQ4LT51A//jlnzbQugum8Oujm9kxEFzSTJseDjPt65Lby8pzZdo3EWorB3gC1/YFm79ttleiNCk69xAhXW5D6zZ9oNAKHy5fDRKHW1Lf2xlIlyIIg1FpGpypgNBPOtt7H5ufY0JpAroPt8oeGdM1HIGLDrB+d8gNSaxQ0X8kk+IfrDCMXl6UX7MKXunflFin04OKs1MstS61lD1GTtupx2L8QSzk+sTCTqdA8hSjAn2wbq8ymEpH/LYx+SU9/5rs84Mp4RN//w8dMVcAB0xpoj3BwBazcn+SgDD+Yq3oZAvmBBTXbontf4vsh1oxnrJ1vqfMxsgUH+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxhVNT6ikwEHHnjeT0XRARwOIqwDvJ8JXA4rOj5MDr0=;
 b=a9IRAN3yjcMP8VI7JY/BkfdOU6Fv4m4VL0H8V8kFjFAhEU4e069pB6ZcQJ8QqjJ3d97wpsq0hJyZPCaC3DByXJ41R42gFrUB2aZ+jtncRsySFuDpofG/eI77qPG92fNgstr6THPFjqTDZt42Qy9zk0NqoYgsSfzb/k8kc6ZwXAT+MA0UhjwA6jWmgPcwyLjFdqdzC1zQimn2A9LdTB4gCogS8PFFsK1FrpKsGiunHNrqsZgCtyEriLO6ekDpueYYdyE6nzMdlgo2UhZCIswxvV6IWY9TqZrFGW3nkBB7L2/DMO4ivz2Qa1lhP0EqmyBMz9TTxKHXKaeDCosjDtyzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxhVNT6ikwEHHnjeT0XRARwOIqwDvJ8JXA4rOj5MDr0=;
 b=q73tp3Pj/xNBoQ0u8gluFIwPm+WVRRlVPHKMZXw0BdCsz5PwV24KOsVqewNKf0UK1MaB4Bvm1IDXwgtBIL5/gGwk6//kQjKRbqBuMxOvK4u/vT1p22KfMP1dy062pdu5Kcjbzey4DZ3wx8Dpvsx7P/Ylei+og9sJ+SRWi3z2dYlSXi/wda8QeGHG7s/bndSgQngRo3DCz+cn9rzFUAbiJ2yyOwcglZ3GCmaLQ7+ygq/rb+7DQ156dI+TnKGgwtNuQKc/w+uvolO1oMtOA2PfW82f2ax+sGxhFJZRnJE+sy2degGV9iTIMOIrs1H4krK8CTsHqCI7v7KtS39Hr5ww4A==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by DB4PR10MB6965.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 13:49:50 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%5]) with mapi id 15.20.9115.018; Thu, 18 Sep 2025
 13:49:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Yogita.Urade@windriver.com" <Yogita.Urade@windriver.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [OE-core][walnascar][PATCH 1/1] grub2: fix
 CVE-2024-56738
Thread-Topic: [meta-virtualization] [OE-core][walnascar][PATCH 1/1] grub2: fix
 CVE-2024-56738
Thread-Index: AQHcKHi4jCGp58mQzES/+WZtkF/FjrSY9Spg
Date: Thu, 18 Sep 2025 13:49:49 +0000
Message-ID: 
 <PA4PR10MB5707F44563F9F3DB166B66DCFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20250918084542.274452-1-yogita.urade@windriver.com>
In-Reply-To: <20250918084542.274452-1-yogita.urade@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6d4760cb-3993-4c95-b225-662a3ca435c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-18T13:49:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|DB4PR10MB6965:EE_
x-ms-office365-filtering-correlation-id: 5ad14f0a-abe1-4a56-4f3d-08ddf6ba3cba
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?fbtwuXdicB15FmGzgEnWic3whHyOUNOCm2K4fER1L+bPBpK+UcIh5aOduUcI?=
 =?us-ascii?Q?aCG3u9BTfxWT+N6L4X0q5vzVCp24iiRtif2B/dGAXIBOoHd1m3gyZTh0oFRV?=
 =?us-ascii?Q?V8F0N5sR6e0dF87OpdnOANL34H/GgXgrtRm+pDDg6ev7UJhTH4QnxiG4q5u3?=
 =?us-ascii?Q?7oJ/vZwGwr2anAfHJP03/acItZcg8Kd6ZT8fIfRsXL28bpeYbZbqOxklg8Mr?=
 =?us-ascii?Q?1KJDGCiyxEMkCB3KGVhPAeNAU4QJODBvCoEFHTfFGK8/UillHepKFKAJxauv?=
 =?us-ascii?Q?ACXbZ7vavr3gpWZB8GpbK/Nqzr8muHAeBMQLkbmEUu0SK2MPJcHCP50sDDSh?=
 =?us-ascii?Q?VPMn1YPHB2lXoU6OK0HL5ywEK5UvXKzZ8Gu+ehjdGpzJv7MBNWKs7PssIpfS?=
 =?us-ascii?Q?Sn9L4dS1BU0oZ4eI/cmNZuHzkhG1J5CfoZtTOR7Bv9HeHzU2zsP+oz+Fdm6J?=
 =?us-ascii?Q?6ixkSCTQaGPzsAk+wrR7FoHunuoXIpDucrLgLkWY2zBvojZcI0+oaPyjsmpz?=
 =?us-ascii?Q?qs/10xAtTf27ca0xesuJld9ESH557FTU7ymR9Hx834RCpXKcE91nn4I98hMo?=
 =?us-ascii?Q?adepjX1wqC2T7hj6ux3T7hb5u8ZSsWCblxmvnNU+me5sA2OTUI2VJ6dF9a2b?=
 =?us-ascii?Q?Di+FtwdqbYW9bAmLSCywgRtVZyYwmnZoBruSeFORCXmz10cQejKI8Dj5f3Ir?=
 =?us-ascii?Q?+WDZQHKZbJt98D4cm8dZQMifhCXYSURfzCA445IK5pKTiDVllwJ0LezP2dI/?=
 =?us-ascii?Q?AdYlHJMuBF0Gk0kCD9RuYj/2rwKXAs3QYIGR7ptgue4Au9K32rJm/a3Vsa6Y?=
 =?us-ascii?Q?oDapI431CSC4hDUE3o8ZxuYvTgNykT1OM41fSVImRv34XKsiN85v9GWmW4UP?=
 =?us-ascii?Q?v2jNZxCetjYwa2/BeLvOXa+Qa0AJAOH8OCKHLHl/srsiEUOL1eA36CDjDRGc?=
 =?us-ascii?Q?LEeKD4+D5Jw6NiXCnGShdDsN1/B0zkDqlCsBowyFE83f53aHz6dKMZbIgOfQ?=
 =?us-ascii?Q?x6FpIjINNkKNJbtN4AReUBL+Tl6pN7/1HoRCsmZJzJS5Oc3oUvPn73KndIT7?=
 =?us-ascii?Q?f8AClicgJj7JXpSoHuwT6zGTdgYqOj2eU+xXiNnUwt4c7LvpyJP+9gkKjcY9?=
 =?us-ascii?Q?k18GWWV+qTiUoEJjjwdsod20q861E6bxBr0UyeO39g8A4iJ3dYYnkMRAr0Ql?=
 =?us-ascii?Q?8A5Ff6tnVhgsqXALc8lZSduDLhipgY01NgTt9Jg8pxaOOQekcXFZvwiLtoSI?=
 =?us-ascii?Q?OlVXLavwTrKZbuA2bYju4w+weXgIT+sRF9aIgi2yddJM8SrWgWXwNDnVTMDW?=
 =?us-ascii?Q?0eW+2heJT/Hu9juO5jaQxQfUrUCI+FvuPK//c0mI5E3LkRhwFNOlbKBH4857?=
 =?us-ascii?Q?yubw3zDh1RKbErydaW2x1awcuouYV9kxSsm/LTSdTAM1eXM4L6fK9Pc/jn7S?=
 =?us-ascii?Q?ecXhaUZG6o3wpLxCUm5SAoCfxxWIz1ztNbvimVFgNwssaHDxvWwXNw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oKRPN9tjUS9kLB7JhjJkQnNXtzBE4puoYGMaoU7QQBzYxaWFLM1foFREaUT4?=
 =?us-ascii?Q?ZTZWWjN/AfnTtlb/hA+aR4O6+V1lyaVCZakNRYhAc4mnenXNt5C7iFTRa6Qk?=
 =?us-ascii?Q?T22g9yWa9qWlM4vc/7Rx184OSLW3/ziDm2xdeEwdKaU0FNHHF1+0pAFtxTza?=
 =?us-ascii?Q?X3POIL4/pijwE0FpOsUYNUeGAiAp+3pv8M54x7xxxjl3HnFs1kTLr3t3Z3kE?=
 =?us-ascii?Q?M7c03vijpofAOzQdHS1n6Demd5qP9DkY7uAn+NjpDHEndDULZQlTtX4YJgE/?=
 =?us-ascii?Q?yw+kh42dOmhkElNK0N5kW31e+OU/oYA7Izeg4VwMzeRhDKx9yZW0zrKiYZv3?=
 =?us-ascii?Q?o2txDThbVBYZjLdtuY9StqcSyETwlWx5iqyEhJaWzLSGdkxrAXiE3FzXaRRV?=
 =?us-ascii?Q?RzfeY7C6iIIBRDAAQ8nJGe1phMCrLQHUHN4Z+6fuXTVc64hSEE5kUTJj8sFm?=
 =?us-ascii?Q?wm935I5yp2cjdXmQQJurYq2rETscqY1LLMU4ILQAoqxi8wZbdqiI8otPs1r9?=
 =?us-ascii?Q?uOmctZbxEkpDVjwMPBmQCQUgTErhaNueHp2p5+SSeC2k5GAHf6cXYOfUwmjY?=
 =?us-ascii?Q?ELYUYkgCqrBN/rAa5xOwUlPndAUorxwhf3mt9QYvy5wQT5gdOOuUHUXlPVez?=
 =?us-ascii?Q?oLh23NK/ybmxWn5pir/gEFXn0CuFBXa6b0+WlCuk03WnxvIoAyOZUNxzcaPH?=
 =?us-ascii?Q?D9IXuMUjirF5vRIztUkT8U5/pmEe6ygokya+LI94CBw1NPji/EMtgUr72odt?=
 =?us-ascii?Q?dPOSwzdMc1LZ8/O23QVryAk4Bcvrtv5WojjoRhTQYp6cUhIaBnGI6bhqxCbF?=
 =?us-ascii?Q?gKmmnaUxHJhh8xBIWy+Efeo1YmXYW+AMmRdjttB+LBuOAjD3ONR7b9tBbmRH?=
 =?us-ascii?Q?xLNAEZ7WSQsTrAQSGcFHzyn6tQhzzCDTbyoYjROSULGLLHj0/zebGZJjFucj?=
 =?us-ascii?Q?eETFAmTDEomRc6xvkfoDoUB4gP255dxlXEdpoW8/zRnm5cP2Tb6QI0r+NLQ2?=
 =?us-ascii?Q?mza0SN19G7sPk9pWVsst4k6jQF/A1lR5qCmFGDtDF9xg+cSOA5JBHN3TzMJP?=
 =?us-ascii?Q?pC8wrka2RbeLEh4L85wGUANmM3N7X4/j/iQu8iiy4n/1YVxuN+Lnw31EoRI9?=
 =?us-ascii?Q?dMRQQ6D8mm9PeT9dEBpuFeIa+EmbV3U1O/hyPL9VWUq12JPYgjSSLoEA9BjE?=
 =?us-ascii?Q?jjipP6ZamND2exlQcjs/mS6KxmAVke0UWrd2RPZtM/aQss4IkvdjovcWIdbl?=
 =?us-ascii?Q?zoSC5NsZVxOuvL39nD8FuLnnaAXCjPdbdt1dBHiDnrq8hLLP083typtrK0bh?=
 =?us-ascii?Q?3qKug95z/YG/aGImdLgUvOJ812QY3SzTvfbNd2BXC2r0yP+oZ8EZXBXIJs8j?=
 =?us-ascii?Q?w2dR9ZZLlLd197mMbdCsK48lOInuOuyiLrMITss642R/ZZX8Zn/I+S3Mhbtr?=
 =?us-ascii?Q?r10pg6HZSpsVRJOPIhU8DG/UPHRue4ORJNvah9E6NcN4IPwoXQITQeQ9HxjI?=
 =?us-ascii?Q?PZ7o6Wtbj4RcIJ4qZ+UzKBMJS3jRPvuBwHzLUuajx8/6KqqmlqKY32f+q8JA?=
 =?us-ascii?Q?kJZmH/ziZEY6Nacp0ZD3+XHckQxaJ5MEn8JzhAcH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad14f0a-abe1-4a56-4f3d-08ddf6ba3cba
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 13:49:49.9101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjtprwz/OcugocyU9X5vOH/oPv321F9RGK4SLhQRqZkxwGKmBFDS0lScJ2EYFZX6Od0MykAWoSMj+5zoFS09Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6965
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:50:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9399

This was sent to a wrong mailing list.

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-
> virtualization@lists.yoctoproject.org> On Behalf Of Urade, Yogita via
> lists.yoctoproject.org
> Sent: Thursday, September 18, 2025 10:46
> To: meta-virtualization@lists.yoctoproject.org
> Subject: [meta-virtualization] [OE-core][walnascar][PATCH 1/1] grub2: fix=
 CVE-
> 2024-56738
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> Backport an algorithmic change to grub_crypto_memcmp() so that it
> completes in constant time and thus isn't susceptible to side-channel
> attacks.
>=20
> (From OE-Core rev: 30a1cc225a2bd5d044bf608d863a67df3f9c03be)
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../grub/files/CVE-2024-56738.patch           | 74 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch
>=20
> diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/reci=
pes-
> bsp/grub/files/CVE-2024-56738.patch
> new file mode 100644
> index 0000000000..f6a3641eb1
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
> @@ -0,0 +1,74 @@
> +From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 9 Sep 2025 14:23:14 +0100
> +Subject: [PATCH] CVE-2024-56738
> +
> +Backport an algorithmic change to grub_crypto_memcmp() so that it comple=
tes
> in
> +constant time and thus isn't susceptible to side-channel attacks.
> +
> +This is a partial backport of grub 0739d24cd
> +("libgcrypt: Adjust import script, definitions and API users for libgcry=
pt 1.11")
> +
> +CVE: CVE-2024-56738
> +Upstream-Status: Backport [0739d24cd]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + grub-core/lib/crypto.c | 23 ++++++++++++++++-------
> + include/grub/crypto.h  |  2 +-
> + 2 files changed, 17 insertions(+), 8 deletions(-)
> +
> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
> +index 396f76410..19db7870a 100644
> +--- a/grub-core/lib/crypto.c
> ++++ b/grub-core/lib/crypto.c
> +@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
> +   return GRUB_ACCESS_DENIED;
> + }
> +
> ++/*
> ++ * Compare byte arrays of length LEN, return 1 if it's not same,
> ++ * 0, otherwise.
> ++ */
> + int
> +-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
> ++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
> + {
> +-  register grub_size_t counter =3D 0;
> +-  const grub_uint8_t *pa, *pb;
> ++  const grub_uint8_t *a =3D b1;
> ++  const grub_uint8_t *b =3D b2;
> ++  int ab, ba;
> ++  grub_size_t i;
> +
> +-  for (pa =3D a, pb =3D b; n; pa++, pb++, n--)
> ++  /* Constant-time compare. */
> ++  for (i =3D 0, ab =3D 0, ba =3D 0; i < len; i++)
> +     {
> +-      if (*pa !=3D *pb)
> +-	counter++;
> ++      /* If a[i] !=3D b[i], either ab or ba will be negative. */
> ++      ab |=3D a[i] - b[i];
> ++      ba |=3D b[i] - a[i];
> +     }
> +
> +-  return !!counter;
> ++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit=
.  */
> ++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & =
1;
> + }
> +
> + #ifndef GRUB_UTIL
> +diff --git a/include/grub/crypto.h b/include/grub/crypto.h
> +index 31c87c302..20ad4c5f7 100644
> +--- a/include/grub/crypto.h
> ++++ b/include/grub/crypto.h
> +@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
> +		    grub_uint8_t *DK, grub_size_t dkLen);
> +
> + int
> +-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
> ++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
> +
> + int
> + grub_password_get (char buf[], unsigned buf_size);
> +--
> +2.43.0
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
> index 1fe39a59d2..db053b27b0 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -36,6 +36,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://CVE-2024-45778_CVE-2024-45779.patch \
>             file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-
> 0686_CVE-2025-0689.patch \
>             file://CVE-2025-0678_CVE-2025-1125.patch \
> +           file://CVE-2024-56738.patch \
>  "
>=20
>  SRC_URI[sha256sum] =3D
> "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
> --
> 2.40.0


