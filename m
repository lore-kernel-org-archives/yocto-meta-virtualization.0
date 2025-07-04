Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3485EC8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 04:44:25 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.112])
 by mx.groups.io with SMTP id smtpd.web10.5621.1751604261893675950
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 21:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=QndFn9D4;
 spf=pass (domain: nskint.co.jp, ip: 40.107.74.112, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBVXxMua95nQILKr6QwkoR3X7E4vXBDMh92fdzzIMWkZpLs387d/6TQc5bscr+F8bjfBIpF4UJRdy1VyUS5qDiBnJpWexakk7I0jTmouJMHliG+dFz9r3+EyPdbIF8LLW5S+1v7yEPXICY4uzskMoww4eC+n/3Rzs67/pVTVyY2jUTe/Y0J4fXm1QsVJednqtBoBAP5VqO3HkQaxNYfTad2aag7gg0ALD30dUh9cOICBom21oFtGjJAdVGJ67YL31ImEcrT5ZXtx75aT55hGollxI1sNqBw0xXFfiHk0K+toof5Erm5HI1QRx7Ts7/OPllPuO77LZDamGDdkE0+Dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2vOSPJxvApF23NUoWg3/D+SFp9UZqGByNXlaJT47ZE=;
 b=P8HQFZD6Tg6ztwrWZxI+5Mq/59bPKqXlUvS9Wkl1eVmNpCGSRo8B/LN2YioK0bAGu9791kbujlpjKEDqu/d97fa5CaBc+0v/01nmBM+fn2ySJov1RAUfKTZ1oiR7bW9ThQlUj6rS60z9Qb9qvanElZkUPxyhPJHDX99a037x8+x/4l0xnDSntoITyxpPNSjVbf8sdaPRrPrRyCA2+TboJJuxY0IfXZLkvxdl3gzoBy+OGDTSFw7p3AE2yjMad2qLqtHdOe9f5ujvsIyV0CNrwgOM2UP1n1NOpDMVP7eysmj1Jt6HkmiSvPdUmYDHUFq9wu8ZsjknqLdCNW6u2GsBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2vOSPJxvApF23NUoWg3/D+SFp9UZqGByNXlaJT47ZE=;
 b=QndFn9D4khNMoWH6+0EIjXfmhyxFqTsApLooXbM+jO8wF0Er7hgtAegwzdY2NaoV/OBSh4/lYUQVuEkxo+SK14PLsyIVNGecH//ybS+iC/7NXEVfiqMkTg3/3RUca2rppTTINjWLeaIOXDLcbFfX3UrXvj5Qv1xcG/vZbF7BVIQ=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by TYCP286MB2992.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:301::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 04:44:17 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::497b:8736:584c:bfb1]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::497b:8736:584c:bfb1%6]) with mapi id 15.20.8901.015; Fri, 4 Jul 2025
 04:44:17 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>, Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: [master-next][PATCH RESEND] containerd: fix remote branch
Thread-Topic: [master-next][PATCH RESEND] containerd: fix remote branch
Thread-Index: Advsnjd3YVam+5NJQ1CKNSn2KyHXzg==
Date: Fri, 4 Jul 2025 04:44:17 +0000
Message-ID: 
 <TYRP286MB5995716340E18EFD416688F6DB42A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|TYCP286MB2992:EE_
x-ms-office365-filtering-correlation-id: 495002b1-2426-4ae2-83fb-08ddbab56f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?bxhAC8LmIRtllWluRbiFIiibBhhwL0VyQMBMolvRPMfFO2Qv0aiPLc/LfLWN?=
 =?us-ascii?Q?FWL9UazSk2mS2rLUscVzLV7z8f3QJHM5nZHalzuzuGlfiBh/jdtTeRB7Wg3I?=
 =?us-ascii?Q?bzlqy4k+b8XqbuRhrGVGapfLkliRxvoPVLZipZvct671o8aih7V14A9D4Tu2?=
 =?us-ascii?Q?8GgJ13T9z1DGMVLH9/oWTyC85rd/n4XDx3nOrdDmFYTMmthmaSTFjepjgM8F?=
 =?us-ascii?Q?PLx5ayHtYMjbVwBHt38efiEUmfX1n7feirK7St6lppfwKRoJWHJPbTqmtzTs?=
 =?us-ascii?Q?KSvV062VdLaCGFAoCnZvi/kZ66HhO9z2uba4V3DCqKcC8LhRiHjgWxA78IAQ?=
 =?us-ascii?Q?UVyF0AfPLElPJEBN0kvyPf90vNF4UPkdOoOKM53xVnzd9uJuMVeeS7M9WyUZ?=
 =?us-ascii?Q?8yJ/XayvtsHvJAIDe+7In+HFlwfIZAlTX9MXjM9EjMhWzTFaavbKuNR1251A?=
 =?us-ascii?Q?p4ede1Jnc5gr+yQtXIAHUnRCac3a/lsRDgWKnzFfZWNMAj4Qb2cmn1crpxFx?=
 =?us-ascii?Q?kD8IISdVAFMkzO1Phg4P89bMeFyUiY3zZdaa+2DMd3USiUUWKOWVYr0r+Wiq?=
 =?us-ascii?Q?wGSFgctqvJefHoEvayEPTs+PP+8w0YBnHM0xVTlKyhN27LK8nFgnHkA2vX0y?=
 =?us-ascii?Q?19WjOKplWJ1mkYGN5zWAbG2PsH/5oUyIYaJWWRyRpXO0/ojkmbqYUINdCfQ/?=
 =?us-ascii?Q?kEBeTpamPtBGaTnJcDkSuhsvugXaGhU35YT4pvEw6obdi8cStfe1SlmK24kZ?=
 =?us-ascii?Q?tazQnwS4dXyichpP0vYLISWxWZNZjbIZpUREvLxKxUXSdrVAM7Sqra7g60+b?=
 =?us-ascii?Q?w2pEeVWEqNy5TM9Zg8xysnrgosPtbGoT7pSOTdZbABX1jF4R/HzrqWc9W6aB?=
 =?us-ascii?Q?SGiMRch8mYLMaVmW5yeoi2u8EITZbzxljeKwAxwkCdsLlIgvUXDMdge+jBSC?=
 =?us-ascii?Q?ZQ5v4wH9j3Pu4FrdENs2QqCTlacjXZrDffPTbWJWV080lMz8QGkz2lI6j197?=
 =?us-ascii?Q?kyxp6GJX9g/K2/SiNvXElsaAa2kG5eyziz5EkRCvCHYIltNoCKsjwqiKLOqn?=
 =?us-ascii?Q?90/bWHpnu/bt3IhRgN7NjcgOwHXFMDg7G+wcfavgEXpbePRsp7AOfeDXlSU0?=
 =?us-ascii?Q?mcB1isc4RiUckP90ftvscrytwnQ3qDTw3uQ9bc8143mvz+Dqql83kLgWUjnr?=
 =?us-ascii?Q?JOR18YFUxO2mD7VHxLeLXcYPRvYwY+HnJxwh5qCI9iWCyBGQYAgT/L/l1gt7?=
 =?us-ascii?Q?XSI3GkOgqHWQqUJPUJXzkZ4y3pdfj/0ruoD+nSkHI+KzMCAn3XukaQRwiJVQ?=
 =?us-ascii?Q?afDAFCRbCinuyp+K3dFBePSPL5uunwYc5NgiimdsdMiVmWQG79HB82dE1ymM?=
 =?us-ascii?Q?Ng4Cp8RXrY1IoV7aiHqVN2mGKM+xKsJAlEXbvqx3j8Zt7773DdEbYMMZ8eFv?=
 =?us-ascii?Q?WJiYEEh59RLWIBxGrYjJfMDnhZtuj3TPPxqtwnpduBFHpvatzYmfvQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?P/Fl7/BpKHwl/mKXRCCCtpo38ma1eLosjZ0n/t+O9Y9ToYco0qSExcJw+9Ul?=
 =?us-ascii?Q?IWxjRbgLkVWZ/Gqm73BptsMFbxIQX+VOWpJjxrQ/ZtmPQFLHCt4dCrgIfVx0?=
 =?us-ascii?Q?tuwkRerqtzZWNXQvus9sxMwEXweyyafY0lr5C4A/gYJBTXXRHJfzME+/UE5E?=
 =?us-ascii?Q?g7hhNYEauOn2Vly1cVAn+V0HU8UsGA6l5vy9lz/uDJJzt7eKD0CgK4S3GyV/?=
 =?us-ascii?Q?oDAO+khStDs9Xn8wKMAU5zDW+nCbAhgHkC6CdSF6meBto6yiweVgr2L9J4pa?=
 =?us-ascii?Q?6AnC0NvLyRLCO2V6fmTAaayr7IjZ4rS1HRoygOqxDAGSsw+1IpQxPO7cOQk4?=
 =?us-ascii?Q?VDZ4GjF8NxNmHLrFLW3gL9iyalPqxglhjHyKGjjHOK6OPk9bixZTHhZeIVjZ?=
 =?us-ascii?Q?BsJNwK9K3bnDt/SeSkSOw7+05EruJjWx92C0ibJK/Bi3rVSp6uUP/ebOC5zO?=
 =?us-ascii?Q?esAINI+71fUlFHvrPZIEIUgYyYg1TcEjPKksZPw99/Iexp8/qDpxPHuW/pyh?=
 =?us-ascii?Q?AFXlfOt6a1A0nAEFKzicxQCx5+r/66E0ndVLtQVN7dvgbOQGlFyJ2+fQqpB9?=
 =?us-ascii?Q?/KvgEcYmtVfk0xqAUruEEE35NIhPl58mRIfnaoNArPJbgyl5QJx4qo9z1b1w?=
 =?us-ascii?Q?8WGDvYl5c3YvoU+G/iIMsYRAcLMiDEGq+LsPxjST43CeUMALapCNnMN35Z6B?=
 =?us-ascii?Q?XBkY3V8phBxYkl2omaTGfWNn+cxJy7zf1fD5J2CELKVg68ZhcvCdbJ647NRz?=
 =?us-ascii?Q?iaIToqHHMlB9FxeF/pS1EGqG0Ylr5VPA/xvHWxDBVjVICcgnjgp+VGPIEgwx?=
 =?us-ascii?Q?J3997w45vH1HpPyJaOOsONvEBadgxSZCJ76buE0M05oU+c3hNjJH75Twpwtb?=
 =?us-ascii?Q?qeJucHX5amktB0jtefhxMA5mN4n26/miLe+3bTPeY8sRk38VAiJKuzR7i92i?=
 =?us-ascii?Q?MboU7bkOWUW8UcCzwit0F8QmSRQyuj/Lmf4HzZHPM5pd1mHxrZ0tRUqr+CSw?=
 =?us-ascii?Q?/onYQ5bcLpGRgucoMlaLEB4PR3xVZ9Pq1OKFfYEwpDcwMoydqAUypknorwFM?=
 =?us-ascii?Q?ruMO/DXu5wfu8PEAOUO/ZgW5nUdigZFQT+unRqwZiQsv7Di+fN1kW59Fvw4w?=
 =?us-ascii?Q?oZlsvPjIMYOzo1RLR2DnkljAH1nQKpW3+nlR942STow5XaDlqX2lj47mXQMA?=
 =?us-ascii?Q?RD09cHqRbiOpRNoTfFtDa35L4X+OKpl5GCVG8mHsXzYKPgUUlQ+3+zQwvoc3?=
 =?us-ascii?Q?aE3l5zmAnjbor8+3KPPK/WzNxQjrnAnvyWGIH62HO5U3kjspWdPDmVypK0qL?=
 =?us-ascii?Q?LfUrK7xyR8z3AmpErVFQPn8hz/O5qf3u9aXlQd3fFr/VpJtpiB1+hnv9HSmG?=
 =?us-ascii?Q?oKMbEHKkALjA5qf9qTW7Ug12tuvjIcrS8TrvwizljKMD+UdhPm2Tvi2np5xo?=
 =?us-ascii?Q?XCWXPrgGqeUR94t8HqSv5A/ppyKf/Rr2d5qegjEgdIfbgCuc+8n0Jktw/vJ5?=
 =?us-ascii?Q?Uq743e5TuybbWs6LyEG6Fhl+xte6C3ErylwQ47q4zR3YuGuZt9BAlxYz5BIE?=
 =?us-ascii?Q?hBHQLKup9kb3EJbbPQD5YXkGJSs46LE0fdqcXzAK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 495002b1-2426-4ae2-83fb-08ddbab56f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 04:44:17.1360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QD9lDqrp9ZcA41UXwy1dMAnaYWjTk5+Fm6VNbLceuVeDM3yxJJiHGARFW8itEMnNoSCDQTR7VEAJ+F+2fqxGU3PlkCohSvMuPVNfAniWQBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2992
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 04:44:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9294

SRCREV(41bb88c7ed2a56dda8a2f67dcce35c106919ae55) is the revision of release=
/2.1, so we will fix it.

Fixes: 6059618d ("containerd: update to v2.1.3")
Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp>
---
 recipes-containers/containerd/containerd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-cont=
ainers/containerd/containerd_git.bb
index 44f6b7ae..b1723547 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION =3D "containerd is a daemon to control runC, bu=
ilt for performance and
=20
=20
 SRCREV =3D "41bb88c7ed2a56dda8a2f67dcce35c106919ae55"
-SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/2.0;p=
rotocol=3Dhttps;destsuffix=3Dgit/src/github.com/containerd/containerd/v2 \
+SRC_URI =3D "git://github.com/containerd/containerd;branch=3Drelease/2.1;p=
rotocol=3Dhttps;destsuffix=3Dgit/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-spec=
i.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
            file://cni-containerd-net.conflist \
--=20
2.34.1

