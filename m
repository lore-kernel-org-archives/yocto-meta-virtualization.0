Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ABDCF854D
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 01:12:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.web10.1574.1727917916364653320
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 18:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Vp+sIkqn;
 spf=pass (domain: axis.com, ip: 52.101.69.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlE0QfFCxhZ71foc2v3D3b4or8cYsSmQZhemgsiLCRtliOV4uycM9WfuPsHQqhZ7/6m9IiG3eaoxq/tdlPER8Z4bq9jS196IbqFHMjcALH3v3h+u2n3yuYltwlLQP3whuUwblgk126lSSJGVxF7zg8jIXEj6XJIYNKUHj/AEftDoAAeuq3kREYKPGZFMglcqRrvoyuCqvE/SubCVi/CWViL7Si6lmmy+CRaya0dHrMsxjtP+N2GA0s2uS7iCdE0dzj6v1jDWvnnhKDq8dSIDqzAHZoItT95JjfODPnLwHwrbCg7AZU1QssJwNfpovpNPnWVWW03WN5qm7G2+l+w9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWifFyTuKOR4sKJZEiFP+MPVa1hSgJ1dgdbsH0y5XlI=;
 b=EuamodP2bwki4GnnapKR3KI4f7ZKO/TdsWWx1Z3Vpa3s+9Cwj0ltBTmrh7OJDHQPhm6AvRyk8lf94RvUa89NZu45pCN2OeaEWXs2CI8/ElNYKXExCt+QSUFfX7Ogm4BcHbsIru9L/RZdgB1hPJfQn4n5rHpvj8VUxpw+UePs/Vtb5KmjPbyKuy8GSGcFZUoKmOTh3lahqS6moDEoQTFgb1JOSUmaWTyP3DHgIVfW4YBFxEuSnbTBvbexgLiQcUMDHtqbqZU5o3ODbzjTyJbKWcvQQEAHuW442ZBfsppsmycKs4K5VSKgw9Df83G+3NzLpsM8HUyI8tK3QXamEsU9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWifFyTuKOR4sKJZEiFP+MPVa1hSgJ1dgdbsH0y5XlI=;
 b=Vp+sIkqn8ARRqwdgwd7g7jEb8rXktoJtWQdU5mxjV4FfgI/YeSm3XcE4btu2v7VyKpVn1uzExEP5peTZnyK2I4BTzGe75YmH3TWZDawU/4pJ1DQpYQJSLO3y5hw8G6LXX9I3BZbkb/d56lNba6MiE7btwX3TjHjRAnpuJOWEwSI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU2PR02MB7807.eurprd02.prod.outlook.com (2603:10a6:10:2e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 01:11:52 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 01:11:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][scarthgap][PATCH]
 linux-yocto_virtualization.inc: If using externalsrc adjust dependency
Thread-Topic: [meta-virtualization][scarthgap][PATCH]
 linux-yocto_virtualization.inc: If using externalsrc adjust dependency
Thread-Index: AQHbFRvoCzB3FldAL0G9lEqMcl+VHbJ0NZ4Q
Date: Thu, 3 Oct 2024 01:11:50 +0000
Message-ID: 
 <DB5PR02MB10213ED534518A5071B926B9BEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1727908743-22316-1-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <1727908743-22316-1-git-send-email-mark.hatle@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU2PR02MB7807:EE_
x-ms-office365-filtering-correlation-id: 66873bba-03df-42cb-1de6-08dce3485c90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?SRmaLPSL4zkrdVCKojSojPRDL9sTpdASw2oN9NaQtDFoiSFI1PzFCqp9X5Ys?=
 =?us-ascii?Q?gYwdKnvpoQh1pdykg/zg/3j2yiz6K4WBF4WU2br75OWFfCwkaUu/CTWNCNit?=
 =?us-ascii?Q?vKxN0kZb8p8gH73GmYLYfTXav8RDWywzWqFt6vtDTUqjnAYrhC3OjEuFrbq7?=
 =?us-ascii?Q?1v66vfKUeFzQyNAwORrTPKWQrlh71VCz89S5bneNxVVqg3FTA1tWcEoZB4R5?=
 =?us-ascii?Q?TWbOUmsJ2/1jMhRQCECc7WRQ9krQgsGdZnWg1M5jtbv/IKHkSDQ1sI4fPTC+?=
 =?us-ascii?Q?RGJ9zprkyG6uNfmcKwxCauPH2tEEjIK3jEkN5pvJPjGzVaS0TdzaPTBsvs6t?=
 =?us-ascii?Q?RyU0DEXlqfd4J9DcE6u6M34BTConDm1wmZkstyF4x+TtMLj3Bk8PdKOVjBrC?=
 =?us-ascii?Q?YXQcQQgHflK2HEaVuPPc4SvEPQjON002kWCHkxocxB/jMlLe/dm4iDXobIMe?=
 =?us-ascii?Q?ywBHWu70CSMuIPV3sHU/lSHCOoN8MrXRjhqpOaaDvrrJbZxm5RWfGMmQiNpH?=
 =?us-ascii?Q?/OF683FIg9TuIqoSpIVhnJi2cffraEIqWvelpIwPoFnX+/+p4bMzddTWJTXD?=
 =?us-ascii?Q?grL5x6qabxbtrwKXYV4uFq5fMgyUuf468PYFd+4lBYlIjVOki2QNokc8/moi?=
 =?us-ascii?Q?VysestbYued1h23N0WnVlUZU4sdpUH11AEj+LlXNA4yZfT+pDO6e0bPMjN0p?=
 =?us-ascii?Q?tVvKFLTGjAmhQh9uPzePMWTLadxnv8bsFwV4C6RAEynj43R1pWcpS9QlBHxN?=
 =?us-ascii?Q?6RM+SYm7ZnHQGivz66yCC5jOBu+g10xricwQmpDwde2aRFsfbOxwhecZ+vX3?=
 =?us-ascii?Q?8Sxaj4bq9aIo0yq6lQUaarlwrAZD3i9nHZJNBcdr6v4rUvlXQKHcu1VU2C0z?=
 =?us-ascii?Q?DcRJcKxKlqlxqQLy7PWrOg91HpIdylvDcEFC92fvI1tN5oNGrlgjbINxvJxG?=
 =?us-ascii?Q?PxGbF3LbUzIEakX0qavq/F3Xwt89/4OioIPuUXk0cB2gQLeYQkfeULFqpweR?=
 =?us-ascii?Q?6Z/0HdKSepNvL1aknT/4W0w9Zh3VxYSqD6c2z/IXPlUd+OCTzIZcWFhsNy3E?=
 =?us-ascii?Q?enkqHX7MCY26lAMi/QdUNBA/d3mQrdYzvYQKb2Yy3vW098Ea9uWL7vtCdIYA?=
 =?us-ascii?Q?bDnO29uJPXejhOXRfzSVahb6PedlqHcRkURZzvE7FUF+ABtGZbYtmNoFxxjl?=
 =?us-ascii?Q?TV/tUpQClYhG9vqhztKiWrm6AaQgl3GyEuJch86kpI987qEqBwNfsP/bs8yD?=
 =?us-ascii?Q?7lVojWdKTPpQeWkvYe8bfILQGbUeMz39Q5HRXHhbevy2/xT8WRbP2YxYbrag?=
 =?us-ascii?Q?Oh3Kj36PwPrNvwJadm9wkiuLE68tAaOJ6/bCvit4FtjfGw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ypreScnUvAc4hc4FFiJpbXEzECCSxJlpQFUGzmwjz0vdj0Y1QOYomKWUvhj2?=
 =?us-ascii?Q?1NuihFd7AofJ7ygd/gPrrEq2DBNixooBwsWx9IyrdKQzovFn3kUTNQrE/6Sw?=
 =?us-ascii?Q?ehCDLRkFkUnp4mrFdhyTK0gzAanBlA0z2Ora0PWN1Bw0pPykfqb4ObKFwgrO?=
 =?us-ascii?Q?T+2jKhPMo/dG+laELpYNbU+ZASkRvCMUp0QmGfuy3OXx9DBu+ZIXwuZLjc4K?=
 =?us-ascii?Q?Hb9XYw08Q3pQ2c0qfRyyrUe81tclejb25WBubSFrpfI+Pw5ZYTMgfYhIOh7L?=
 =?us-ascii?Q?EW9zMwrvHF/G7EwwwUTmhlhMAhkk+cZMuJDFEEdRbdgy6eainyHSJalhlqHh?=
 =?us-ascii?Q?VIrrEXOqbS6MjQJKShDpoelccx5rIE1tH/8iuQcY01BEzZrz1ppUqHmE5R57?=
 =?us-ascii?Q?gK3AsLozIcE13yLukU+e1g0qDOT3sGzNCM8aO4pgVxO/g3oAh8eBnGr946cE?=
 =?us-ascii?Q?MMO4vqC3OYu0FchXK9Btliahjv2x5wal+/LsmS0ccahiUhUQIcuhGwrs1Fky?=
 =?us-ascii?Q?XVDz7A7izQDvQTN99cZiOKiGA0L7oTAvSjAerFBEf6H/wB+08GoKiy94OGmT?=
 =?us-ascii?Q?yYrVu5Lyt86jtyVVTYTTz3UdzDLM1qNfmwUEh6FPSiQ1bAS5FTGYiInv9boS?=
 =?us-ascii?Q?WleJJPbxT6WWkL6L45xGBzNsV57VsDvd5v9jorl/eggfX4iXeHVU2MrhUdlp?=
 =?us-ascii?Q?ehlF4Fyhal5ciDDBCQzCoRMSvEv+7YCYKFbBJRTThM68AN03UqV5WIJ1mE/z?=
 =?us-ascii?Q?TU4jgIthmm2arF61R3zQq6snQXonNOvoRevJEwX6i+0XyTrtzRV9voru6vQp?=
 =?us-ascii?Q?lc1EY737XDs1ZjzxK4i4A3zuen93sWeLKGXMjC3tyW1KpesdyLgcLRksqBqv?=
 =?us-ascii?Q?hAAuyeo7H4vzKq4lGJAiTryitRoLo131uNQ69lwhq1xrDU7WkSJdCgWUP7yD?=
 =?us-ascii?Q?3tF0+fCyMOqq0QL5P8KN5jzfo3kqa7GKGRK0BBx8Noephco5QBoJrPbN/x9a?=
 =?us-ascii?Q?4lg0ZbjoxYrw07iVVyKYt8erON5UCuQ9uliVpat3UYmvN/6JyJY82LknlxAi?=
 =?us-ascii?Q?s9MY+b5moAudgXjcwwBYW/32msmNbpFmcuWY/fUNWFlAkjCck54wtA1tYCqf?=
 =?us-ascii?Q?3XQ9w9MRNnUDjrPNURWiQU86IyJaAoWWZIrKyT3AMdM4CS5Q5WX1R5cln/ED?=
 =?us-ascii?Q?+bTubmDRxmdTamGmZDAq4nO7fbQjJJTmw41O4r7IXwrd4et7pxFc8nbxBSeE?=
 =?us-ascii?Q?R1nOWkg5WcJSxpwTA450yc6A3gUPuKVi7BG71H1wk3U8PNRoGE8KlGLKIcb1?=
 =?us-ascii?Q?EByaDO3bHGbcmQMdkIfKY1NVsGx+i6f7Oux2BWDfO9xMbr38aQBEiGg6iLJ6?=
 =?us-ascii?Q?uX+jurAlwCTHUEBP8zDlQiG2NWe6T8Cp7g3DGEeuxtXERkB585kZ80j0ojMh?=
 =?us-ascii?Q?8p0+LSsZj1GcWbJOmrY6KBiA6uzD9oQzcyUjP9X/uy8ASy+13e9MqZCis8f7?=
 =?us-ascii?Q?eX9kMcaUGLr+1w41P5H4Y2PBBsXC7cqs7BohwX8qWbRaAgPhcT+cWqpTmiAr?=
 =?us-ascii?Q?d//b6ljd0JzIPUoi9Gs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66873bba-03df-42cb-1de6-08dce3485c90
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 01:11:50.9631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47rZyKPZDdh4vBAC9d8zbxAiljecd3C8txvVrsk7zClOKokRSKUu2HLYDurHNPEW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB7807
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Oct 2024 01:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8913

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> On Behalf Of Mark Hatle
> Sent: den 3 oktober 2024 00:39
> To: meta-virtualization@lists.yoctoproject.org
> Subject: [meta-virtualization][scarthgap][PATCH] linux-yocto_virtualizati=
on.inc: If using externalsrc adjust dependency
>=20
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> When using externalsrc, the system will disable a number of tasks such as
> do_validate_branches, do_unpack and do_patch.  The do_kernel_metadata tas=
k
> is configured to run after do_validate_branches do_unpack and before
> do_patch.  Since all of these have been removed, the task will never
> run.
>=20
> The do_kernel_metadata task is responsible for populating the
> recipe-sysroot-native/kcfg directory via it's own dependency to
> yocto-cfg-fragments-native:do_populate_sysroot.
>=20
> Without do_kernel_metadata running, do_kernel_configme will fail to run
> with errors like:
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Feature '../recipe-=
sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configuratio=
n failures.
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Check the SRC_URI f=
or meta-data repositories or directories that may be missing
>   ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Set KERNEL_DANGLING=
_FEATURES_WARN_ONLY to ignore this issue
>=20
> Fix this issue by detecting if we're running with externalsrc, and then
> adding the task do_kernel_metadata (from the current recipe) as a
> dependency of do_kernel_configme.
>=20
> To reproduce th original issue:
>=20
>   $ . ./oe-initbuild-env
>   $ bitbake linux-yocto -c patch
>   $ cp -r tmp/work-shared/<machine>/kernel-source linux-yocto
>=20
>   edit the conf/local.conf adding:
>   DISTRO_FEATURES:append =3D " virtualization"
>   INHERIT +=3D "externalsrc"
>   EXTERNALSRC:pn-linux-yocto =3D "${TOPDIR}/linux-yocto"
>=20
>   $ rm -rf tmp
>   $ bitbake linux-yocto -c menuconfig
>=20
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>  recipes-kernel/linux/linux-yocto_virtualization.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipe=
s-kernel/linux/linux-yocto_virtualization.inc
> index 9a6554d..f0ec80c 100644
> --- a/recipes-kernel/linux/linux-yocto_virtualization.inc
> +++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
> @@ -49,6 +49,12 @@ KERNEL_FEATURES:append =3D " ${KERNEL_CACHE_FEATURES}"
>  # features can be enabled via the fragments
>  do_kernel_metadata[depends] +=3D "${@['', 'yocto-cfg-fragments-native:do=
_populate_sysroot'][(bb.data.inherits_class('kernel-yocto', d))]}"
>=20
> +# if externalsrc is enabled, do_kernel_metadata dependency on
> +# yocto-cfg-fragments-native won't be run to populate
> +# recipe-sysroot-native/kcfg because do_patch is not run.  Manully add

Typo: Manully -> Manually

> +# the dependency to do_kernel_configme for this special case
> +do_kernel_configme[depends] +=3D "${@['', d.getVar('PN') + ':do_kernel_m=
etadata'][(bb.data.inherits_class('externalsrc', d))]}"

This can be written more readable as:

do_kernel_configme[depends] +=3D "${@d.getVar('PN') + ':do_kernel_metadata'=
 if bb.data.inherits_class('externalsrc', d) else ''}"

> +
>  # xen kernel support
>  # SRC_URI +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://=
xen.scc', '', d)}"
>  KERNEL_FEATURES:append =3D "${@distro_cond_feature('cfg/xen.scc', 'xen',=
 d)}"
> --
> 2.34.1

//Peter


