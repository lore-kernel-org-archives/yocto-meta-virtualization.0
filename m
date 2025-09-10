Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67FBCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 19:17:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.67])
 by mx.groups.io with SMTP id smtpd.web11.27768.1757531846022584516
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 12:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=EXsXBaji;
 spf=pass (domain: axis.com, ip: 52.101.69.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lI+yUHcPgHp0AY72YOULhgHZOzjIkfmkzRFZ2+ee2J4NMzzGtoo+01hR9MhbVJ/96PME7F8BBl4LqijJbtDY+xHWsNx/oyEpWL3o4eawcUc3KRliKOIoZ7hqZKh5rzo0u8dnM63KID0C5JEyECQKvqm4SNGyEdBBsj9obyPQk2pmYIRj49i4SzA6+Lci2BrMuKNTHvD52FtLkW+DzxmmPaXxx6ZEyOIgOd3+IddM6jRAmWZboIhuOdgK2Gele7NCy/gGylu7J4peTr4SnBDABi3j5oV+eBLvqjfHQY6Itq4tvnfSI0dRXs/6vc8h9fEIbl9rKjEtWwLzc/MvCVziDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh1i7gfbsDqvOHIqRxEHl24re/cUSu/KOGuGayQ32Tk=;
 b=uzoL/9oSz9fPbJXd4i3P2blXcsF2ROQtWkNfu7oWV3eABEddkjmvVrSQzBEnpG9zWODObpRRIk62H55S3w+ozDfUTFk4UdxmBeMKcLmCayhbCLn6/SNjcg8Z/wUm2Kf/WMQPGDKOYYjhF5tjBF9rcNYEQPsIuQC9yeunmzYdzA8xXDtQLNh943TEk0R6QgmMrsN54LAnEpMBH+hSwL09THbtEdOOpxDw11qTzVhbxfJyVp5IhkVT6VRICg6Z1eXz8ywh4inAX8QpbUTdHe9l0jjqc9nQNmvsIdL8fzy1MIhOiphd66ck6hZyfpIQRNJrycXnGeMu9ouW7Li/sK6bYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh1i7gfbsDqvOHIqRxEHl24re/cUSu/KOGuGayQ32Tk=;
 b=EXsXBaji/EwbwjBOmQRbd9mKNcx++s3NsTMyWw4lZP7gr+GUKDZ8QaH1viFNycdUuuwWsZB5VRiU7Zi1FyYHXiyFuQXKZtpQ6M8O8ETxr8hp6EXWa8/AvOX2FIACEaEcRprd3uOF1F39kZO3XwabqLKcX5NdEgVy7GJrvqP67+U=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB11236.eurprd02.prod.outlook.com (2603:10a6:102:4f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:17:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 19:17:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [PATCH] Revert "coreutils-native: don't
 install groups"
Thread-Topic: [meta-virtualization] [PATCH] Revert "coreutils-native: don't
 install groups"
Thread-Index: AQHcIodoXORgfDEieEOxD+jR/0ptvrSMyd0Q
Date: Wed, 10 Sep 2025 19:17:22 +0000
Message-ID: 
 <DB5PR02MB102133A4DAA714273E06611CEEF0EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <186401D8040DF014.10180@lists.yoctoproject.org>
In-Reply-To: <186401D8040DF014.10180@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB11236:EE_
x-ms-office365-filtering-correlation-id: 0553138f-759d-41c0-78d0-08ddf09eab8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?JnstatXD77g8sgZTmlK+mPQggP1+CrC+5uSoQXafZpYZ8hqbTN6rBI0Y8XzN?=
 =?us-ascii?Q?31yTXU8SN62VWfGtMli1vs+IrfR+4uHY60lvtDd8tHSjzoPaJnklZ2RSTAtI?=
 =?us-ascii?Q?5sD32M5mTzXtYCHA/SDEyQgMOSD92HDxkGG4fd2ysdbr0eWvDXgIzc7j326L?=
 =?us-ascii?Q?fFBktWT9wKaIG3NzsITjA8sYcunbhxeRyg/X5QV2Uee1AsulEMpBTqj6oadE?=
 =?us-ascii?Q?zrK9l4u2iUxQARM3OZhxRW+EHAlq2/cqZOrWDNMIXlZQJJrBst9Tb0AuDRmS?=
 =?us-ascii?Q?VnGXWTGxgF4PPnl853QvJFEjSvEoyZ8JaHmLpe9lnwgbqIw66Cn32oD2v/SL?=
 =?us-ascii?Q?w/XzAxfXloV89CMekcwScuieEAp6Znq9JzVHI8JuLKCh82GyehTDdMdjCANK?=
 =?us-ascii?Q?gr/QgK+3nPGDabMz+sw3lZDiZu8dGrYrDrNsRbn+GlGcYXhcnRrGCJzAmwrt?=
 =?us-ascii?Q?YODpuS8HV7DwiqPipCPE42DjwkWh2lNj4ZDQbmH9qGUrq2sRO0Q8yKmwe3zh?=
 =?us-ascii?Q?j39WjneBmMpk0flJl6btXMiMmVYP0Eonb0VTsBS0/sx/Bwsvne9DUX4rWQBE?=
 =?us-ascii?Q?Zu/RC1zGyveD9dp48L3g92h7U1aYsqZDNcInBP62vA2iRTno6rK2bAu/g1hc?=
 =?us-ascii?Q?9xsqJJZMTgj5f8MvFqdf4IqQTcNGcN09quDQX/jK7ZAyEO/Tyoz2NH9quj17?=
 =?us-ascii?Q?IEbAQMJq8fG68vpgfpu6pUXJurV57woJPwR3zjLwW3kR4tq1cQNQwCm7+Rac?=
 =?us-ascii?Q?zBtcZgDUbK0lMuKEp0Mqqm3+K6k84G9swqPdeMJFcRhCasd6QG5DJO+0rFI2?=
 =?us-ascii?Q?gVsxQ/pNXhL4BzjQOmI+ghzEQjdqte1jwF2WsRLhXk9+p8/MqgaLZtrmXNaE?=
 =?us-ascii?Q?8aUAwxe55z1oysBNMzw6WFq24Z8Ln47ZoXetOHSbPBCULzT7kAhC84aLwoDb?=
 =?us-ascii?Q?ggdZ5Hdh+rnaxYRnfX0FQ4mlh4bEzqsNd1qg3S1NZuJZbPpwWcFLDoXoqosz?=
 =?us-ascii?Q?sc0Ftvb/5k0h4S9L2mZELZJ4CYugLA4BQXfztPJ8CJaWzvYHCnIhdaIcIoZ2?=
 =?us-ascii?Q?CIuFHdRrwKJRmHgw1J7jzRqK8DYY9LFkZKqHERH8zcHo8tFO0CmlerqaqP3J?=
 =?us-ascii?Q?Cba9FnFvOGaT2P/g/KMpNfK9hIl9/ApW8DeZMT4PWqjZU6rG6KRG1jEF9aY5?=
 =?us-ascii?Q?ds53ANG8x9yN5HmJlelNwIF2elPn55z1jrOq0NOLKrMMNliIolkTPU4RkC5V?=
 =?us-ascii?Q?FbUVm1fHG+LQMeXrvaRLhcThaAqPdq92TJ+sPS7cu/VVOX6n/hv77zGl7O6O?=
 =?us-ascii?Q?vNMqtvA+l5qm6vgeFTpq5u791YCQ4g6/oThdRtD3TgRiNJIg61L/pYoPLr/B?=
 =?us-ascii?Q?1nvRUK2JfL4cooIhekhoU7u/Y+74BAzmFVgsO4RiFo9+tTJKByuYoqfPgkG6?=
 =?us-ascii?Q?Pv56HNwV5eV5CvtLoQsBDFwRU6j6zeUskKXeVZ7fvhWBmnc0+Ft3eOtFQ52T?=
 =?us-ascii?Q?KVAlKWJV1l325zQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PZlfAe7oLH2nGKDpG2spMnTJl+9RkEaOJik82kn06eKimG50od0lzramzkYl?=
 =?us-ascii?Q?BmbBSUQUKV6SZlsAsEbSnxRqawU5XhubLEqctCODkwdhaci4/aCS8Tm8ECQN?=
 =?us-ascii?Q?TrAEdhVhsLKmXfdmLyvcdshBOrotd3CEyU7WXgwwP3vAG5qoOU0IE6dGkS3h?=
 =?us-ascii?Q?DsVoAZKTiiUHaD77y1Tf3PY80AYdNFO24zDd5w+O4nIP5dMLpZiSJhJkDann?=
 =?us-ascii?Q?l8gwKHKLv9XVt5QhV00QSrY2VdFMdcggJRXFqNcaFtPAQ0I0UjzblLf7JiNT?=
 =?us-ascii?Q?EezYE1u/dGqxAvY2gy07jLetLZ08pIEIyJ1oDSVIMDwYUf4gmQIptvcuiMo6?=
 =?us-ascii?Q?U91fYzeGulznN9/ywfy4sfAjRRFk4xgwoR9Q6Pw8Fd8NykmvBtHLGLtA96bb?=
 =?us-ascii?Q?ISpHiIWQhC5MbMB+KsznVHNXLb9Fq5cKsukSBwvW6mNRwZuwXS2/pnaObKuU?=
 =?us-ascii?Q?I8lgta8v7prCECMl96GntKFtwC7toLpQ6yR44LZOnKriYUKaM4svjOxMeeJX?=
 =?us-ascii?Q?rk2r31pjZIeAqyrXC3E1nqAGN/OPA9fmQ92Isxqn/fLpMziXRlEb7rI6ivln?=
 =?us-ascii?Q?DfJQOvw957mxzsyY4YKe3lbZRrY3v/D7NJbVTAFwNqfrIGHY/pDA6B/XQWwu?=
 =?us-ascii?Q?5HtnFWdNs4YeQVoinZHKsvmmr9mIqoNn4/pvGSN0Z9q+YUY8K4z2Qdi+JYna?=
 =?us-ascii?Q?mF6AAnfQp7VvkOBDpzPdGbkhl45PKncTiKVSITBX/LXc24JDN2aYu10J/Z/t?=
 =?us-ascii?Q?jG2uJKYgh4xeo3Df1JYBtdt6lbFKk8QirINruPZdtbnx7h9EMJ4FdkiQXg7c?=
 =?us-ascii?Q?l43CQsSxW7Qf1HzBDmwwlHirZqoFhKNms05lGpvk1SR34ARFQiGleiJCutDJ?=
 =?us-ascii?Q?A/3R5/r/VEbeX2ufWsqXxAmGPpu0d/ip297o4dj7j+gJV9wGSH/iuJzTKzf8?=
 =?us-ascii?Q?OYQxTw9WdnnEGOYgK6FsTmU/0LH+KhBypbPt4DhxoQ1U8+UGuWN2mD7R0XQC?=
 =?us-ascii?Q?MZL552NL5F2Px4HkJ+RpWIp5fwS89s9OTul5j48W1rO1LLI38ROAKvK5vCAf?=
 =?us-ascii?Q?f5TgtXLDJiLXtDRnMxyKY4x8lvfO6fxgU336VkqOd/arrwJ/nBJyY8RubHy4?=
 =?us-ascii?Q?SkPhgT1zgemFeqvgGshGFE/9WVl2oKtC/u+JnFsM8ov2zLjk0gHAucZfqHVI?=
 =?us-ascii?Q?9faAU6LQS7ZhlQfmdMg00X3wa5HdoQ9CniLWdJLY2S+z5TOOiQqj9y6Y2u57?=
 =?us-ascii?Q?eJMZvLS9qkHmBZLNTxa50O5FIH8FJwsOcp6Cl9cjnRRs8VA3QGWZjgOGNEGX?=
 =?us-ascii?Q?lmpSIVs/qpaEzx4RTsS0ldAI/zCL3pdvBXw5ULC7W9RGCnKYg3Beu2hsfcAT?=
 =?us-ascii?Q?FTXsls4VTtaObiYwEEGjj4Wej6JFmWPhNIk5PlLs6CgWkwmtro7mxA/fliy1?=
 =?us-ascii?Q?ohmlNJabyIcdSJBxCeQIql/t+0QZMh+bi40eJbGwbsQ7cqknHi6/W05smhWS?=
 =?us-ascii?Q?bRfyB7NokTaRoAg8je6FPZXDef09rR603KPMBGpYfmEAPHONV0omef7lNQ?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0553138f-759d-41c0-78d0-08ddf09eab8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 19:17:22.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: duOneuoHInaIRAZwYY2fhCc9qoToYPCTxIBndynKs4DdhhDv+zqqRAp3Ju4Lzw44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11236
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Sep 2025 19:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9392

Bah, sent to the wrong list.

//Peter

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-
> virtualization@lists.yoctoproject.org> On Behalf Of Peter Kjellerstedt vi=
a
> lists.yoctoproject.org
> Sent: den 10 september 2025 21:16
> To: meta-virtualization@lists.yoctoproject.org
> Subject: [meta-virtualization] [PATCH] Revert "coreutils-native: don't
> install groups"
>=20
> This reverts commit 113225b93c55d55a330fcca7d9f996ec039fb953.
>=20
> The groups command was previously installed by shadow. Therefore the
> one provided by coreutils was removed for native to avoid a conflict.
> However, since version 4.17.0, shadow no longer installs a groups
> command and thus there is no conflict anymore.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/coreutils/coreutils_9.7.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-
> core/coreutils/coreutils_9.7.bb
> index 3658f7100c..201be4144c 100644
> --- a/meta/recipes-core/coreutils/coreutils_9.7.bb
> +++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
> @@ -82,10 +82,8 @@ do_compile:prepend () {
>=20
>  do_install:class-native() {
>  	autotools_do_install
> -	# remove groups to fix conflict with shadow-native
> -	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
>  	# The return is a must since native doesn't need the
> -	# do_install:append() in the below.
> +	# do_install:append() below.
>  	return
>  }
>=20

