Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BB1EF99DE
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 21:22:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82583.1771017722416169110
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 13:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OextOjIP;
 spf=pass (domain: axis.com, ip: 52.101.84.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzaXu3H9REFLLmzHk0CITKYn9ITKxP+ueAhJti88mYFLYo/33PvLg1w/9064Vf4JzGDv4ujK9StK3LQnQPLO2j+2DaT13J9e5m/0M4i1ztelhnimNL3Ar8Wl50EauuOnVKdB7jD6iYNX6jYUh+z8Qh17M8oXuESyxensR6UcN8uRN8uktYGeJWQueBwTBGIloi7x0TI2dgWZFNGrv0PyCrm/bP813ygAQcRa7UFZqjUbgd4s/slgbyzOVlztbrTJIk/aP6/fYoCCnJiKoKpieKVV6WJ6V73nkhnB5QES3YXlpSzz/pa/putSa3MoglCxuJwAEbjC413CkC9Y1KbBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJphxJ+Qhe/fNNMKF4UzQyXcSjy9ZpxMIznsGr9pHeU=;
 b=ZrX3CchDSmNsiHl8+K7DcRSywpk6pWvUoaaZR0vvWf1UBLuWiA85CnVtleZnDa+65e7QfJ5+3cQHvJGOKSc1GMF/solPJDFDHuYPz44CIOkqEEG03XslRClvJzBM1IviVmQwBLK3/ONKUuGi1mHxPP+ubA+WX0iz3vaZyehslUv5JkK9pSSfTXtlFZBpQMwt6chCq6ZHqAsd9wa1GK/3so7wMU1F7ItlLxPqVBHKdOrFuIPNH3rDUmIi4zFtWfpCD2TqEpBjbyk5Bl5B9Oo2ut3nDYr9empUbl4ueA27iKz0u9YNBIDsM/JfCmXRM8p+o9bc68XzKAUVpBtBK5QkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJphxJ+Qhe/fNNMKF4UzQyXcSjy9ZpxMIznsGr9pHeU=;
 b=OextOjIPYo0hqT/CwbTEjIjlrNrpaAaBBoWp0yAGHhxb97aTCnFYvu09Se+QKYhMw0gWsaWquTLsmFVo1/uOKaQnktopbZFnfdhq3bY72F55c419DytaVhiQb7i8uYpsx9D6VdgVIrIMzZ404lnuamupgj6QiCwnKTOAxwmDmcc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB10033.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 21:21:58 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 21:21:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Meta Virtualization (meta-virtualization@lists.yoctoproject.org)"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Message about vcontainer-tarball when running devtool modify
Thread-Topic: Message about vcontainer-tarball when running devtool modify
Thread-Index: AdydLsayE4fK+40oR3OA0HgUEfJ8gA==
Date: Fri, 13 Feb 2026 21:21:58 +0000
Message-ID: 
 <DB5PR02MB102135C5C5638C66FD1EA6545EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB10033:EE_
x-ms-office365-filtering-correlation-id: f37e1ce2-3a6d-4238-17dc-08de6b45eb9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?YFBwPPSy070SJK0pnPK43IiEF/hPA5AMKjyDzAff7hsrIb5Iz/py2YSXuxch?=
 =?us-ascii?Q?2hlzZO/WGD7MTmIVZ4rUfpLLc8xYn2RgbXO3cyMBL17PKsg5cxsCNR81j0A4?=
 =?us-ascii?Q?xBmqb7bd4Kt+4dAjmPJ7qNm4JjWwaFixN5JxRxHuMoZNC5YjCugXZDfjf6ao?=
 =?us-ascii?Q?gAITwmOp/xM4ap1kJF/pjniBZMTRqIzcZ7rtKpC47npmHRKH2BJ4NdWJ8F69?=
 =?us-ascii?Q?zUWc4HRoS71ghifHszZaXKAbiuOSZ05EpAZ9lwm7kwCUfkcGYOjY3tGSS9W9?=
 =?us-ascii?Q?Jk1bdyi7KXOm0JPYQKxPtGg03NYzePx/XE1eqdAr2PU2mqApIlGkKTfjXymR?=
 =?us-ascii?Q?Xeu53tFV7j4pSufmEH0O3Gubd6i5lVug02WeK7KgRlViviHL/ihQDObj6Oh3?=
 =?us-ascii?Q?YWLdaSETo6lWzRBiE0hesyc6I5q6N8jlxEwtvhygEdPBXLyg/El4z1iwgjJp?=
 =?us-ascii?Q?YnlimoAsB4ZTV/RneH8zC9ivaxCzpENeI/oXj6UFG6qPW52WGlZJZE932ke5?=
 =?us-ascii?Q?CNaMNtF9zNBxBzV1JNaY4fCNUn1Fl68ecsY8eEAvOVPfjcJzn3iz8JK+K9M/?=
 =?us-ascii?Q?0l/pwgph6BDvLy6PWbGnuf+DVmyLnWIcQO8hEQHCh/LrGWAYig6QuwukeNd4?=
 =?us-ascii?Q?4MSp398AtDvExGyhCWp9ruyPTaEYz+YB6qzx1n3o7WVAo94eFKgaFiVp9Xdi?=
 =?us-ascii?Q?E00iU0Ca3Zmc8Ia9tUDZmo3JcTid7b6Yoc+TAcw2Y0j89yXxtp+zP8BAKTmz?=
 =?us-ascii?Q?UpdDKA45DNDeC00Qlcr15aKryRCuNCdEGKgyu7JL/azinhF0qj+SZWXJuf2p?=
 =?us-ascii?Q?dPLJrNK2VP/h1R3Ut5QMqJff4fscEisThQq0oUkUgftnulVNNDJYKAOk7PJy?=
 =?us-ascii?Q?tLWSeos2V+3NJ+1GKR9PCGuaGQDBrtt54cRN1sbYfuzadFIXGJnDUgH+4iyM?=
 =?us-ascii?Q?C2831K9xlu3qz5JeokJba1Hw7QbJnlk/ihWtNe7R4KqT043Qp/QyjJnX+Ogt?=
 =?us-ascii?Q?IAyN8vZleFwm5pVX8exrLYi5caWeaKTDXQJbH85R9HTu83B8zXkBSy33VhQ7?=
 =?us-ascii?Q?x6n9b/I0Hrpg7GknjD0RZQ5Z4enoJrDUqISxiKdu6Ax0updfChpCSqDWswu4?=
 =?us-ascii?Q?IZq6dEYd8L8JWORCgXm/x9BGVt4uGJAcfi25aHIFbhX68xz1U3pmrm4Ae+yX?=
 =?us-ascii?Q?8IAU5rXn82cJ+Rw1C6k8LQTGD0j4Pk1U6E2t5rx7N5d2yvJFyVAgF9BqOJVu?=
 =?us-ascii?Q?agzDlwPMx9WWGfRhKwVH7qDZYEKR5Ej1sWYMLw48qmtcEPS5YEjdd7ODvXOA?=
 =?us-ascii?Q?jzz+dVmaN/itIJRQIpZLHkw1mGtBpsmgEJL/TJoCvsko6BzrYaoaSge4UpJO?=
 =?us-ascii?Q?eqPR2l0TEeis0DosNT+yq2mDkVkDOe0pJ9MW/UoXH58qi0ALCV/guOflweaL?=
 =?us-ascii?Q?y1GKJzPPxcFNxg2ZRL3KABolpT3as5ua2pfnzeH4S17yaZ84/w8ziB79wJaO?=
 =?us-ascii?Q?FBBQ31mFTqQX4WCHVhnhHTjvQdqSj/LDdSx0o1zr3eBwBRvNy5FDhiYOz2k/?=
 =?us-ascii?Q?Hqb3JmTIoAVa8pcxcWR6ajjidJydG521q8T2DVGToP2UsFRI3jujQD8A/KHc?=
 =?us-ascii?Q?aCkj9RWWqA4yMUpR6YRRktI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/Ku72Q28LZ7KlDlmmXha+ty069V8x7GmJLfdmeqO7gojQA6rJ5GGO7RzgTFt?=
 =?us-ascii?Q?V0NzFwKS7tAMpYZc0LhOV1jI0fEM7odsOwbAq6Gcu43+IVxte8GM89zo5FCv?=
 =?us-ascii?Q?Uub9KWYhwhmbHxqZliVGr+9Uzw0w9EhHYkKr3XCtnihZoE6FADl3fCCqXf4Z?=
 =?us-ascii?Q?t4Du8p2QkpL4PbOntjE/zmmenxFggzjQXOm7d6ayD9xNY696MJr9sSKZ64Kv?=
 =?us-ascii?Q?g5vLJ63THfuGtdgaE+P+yAGoms3Xk7I+woPK8XtLSlOolgsDT7RBXxrBUlBL?=
 =?us-ascii?Q?PB3TX/v5HI90h2GRju8JsMRDp7zW1yAJ+444ZWkHjz90PMMr3cTRlT7CzIB0?=
 =?us-ascii?Q?a8t4UxnD/Meuq/iHXokhb+n+IbJ8k7JO5YwhOkI3ioPTywaniQTB3vYuPXBT?=
 =?us-ascii?Q?lXs8bwQzj6nmlalCFUUrtGkREDeO2waNcV7oDjoT4NnA9CQb/nTJrfarGlue?=
 =?us-ascii?Q?21z5CLAgfVP+YLysyjlRTa6pkPonVJQHCJM6CIMUZCoaGsO7ASXc259HAH1m?=
 =?us-ascii?Q?/3LJkOIR/XImsLLN4DryJhIr0KBPTTOsbhtxHo1+z9Ys08gOG4cyhvJ/aY3Z?=
 =?us-ascii?Q?HBKL3pTJL6X1pfzlP1rWkUhoudMI+Ib787Fv7MQarErrN97lJL23yRxwbsGQ?=
 =?us-ascii?Q?vq6sYltBhdzwPwwiz6JWb6aoz1/xOApQmxsFsGjaPwQKA82CFb8ICY0CN2xv?=
 =?us-ascii?Q?SDEXTWZyKzEXWwKA4ii1LhlttXXS8+s906j/1I39aj5ik7Y3HE1kGD75V+YY?=
 =?us-ascii?Q?uMU1lrEPW7+/Gzy8KwwdHFNRNtD5kEUfWDEhM9aeesEQP7K1QAUphDv0jZo0?=
 =?us-ascii?Q?jGTdSH5oGN0M1FLfpzk6noYkA6fXxe8LkwtYjKDzlzLTROcdXy6Jx00LRYOr?=
 =?us-ascii?Q?upnrn1Jkw6aZMgsaC1tMTCFa7YaykTP7b2jn34SI3520WT0SLloH1r/cyl/y?=
 =?us-ascii?Q?+THgDvUjnbGH+Zs+usqSN/5DuH/lVHDtiwpB1yaBa1ymMmhQpGU1PrBnkm8i?=
 =?us-ascii?Q?0sKESoEVznGuBSWNrktjY+U8PbSUL3SDJ4jtdnDbiCfv5PGPzDQXgVlCw9ku?=
 =?us-ascii?Q?r8NavcebMcw6QHxzYsVvHGEV4UreCy8YePFruSL9u623Zizve2RXn667qY0D?=
 =?us-ascii?Q?xSApXC1DTLyIKej2/X8y+DivfiPk5yi9DF6Y9EOaxYkAUrvc2n+9cmkvWsPF?=
 =?us-ascii?Q?m2JhwERD60NKMZAXKhPzZBaiblfC7zW8fE8jtjfeQ4LA4yYyEfRWFqEGPsCk?=
 =?us-ascii?Q?oUF7NMX/oDiCVvNME64nOJsaXI65NktH9ZhGJdjBDBtplz5Zg74SDdeTGfON?=
 =?us-ascii?Q?d36/koem7L1NPRRXgl+piGFKUG1GRU+Z9H/R32k8DI+bcNJAJ8+w7UZ0aAOn?=
 =?us-ascii?Q?PALkhjdvpMYcwpdB53nX+31g1KTTgpCqGlOGSOn7Wx3A8ZURzGObPEEhQn4c?=
 =?us-ascii?Q?dRKUIf6lDFA3VZlh4rCvprVuodN08GS1MaKMv3xSdVpgMuF8hTAbJ8eiYyVJ?=
 =?us-ascii?Q?PgYNx8AP8jLstU6JwuHQSg0ou6NFRBhub2TwCG57RK3w6+LjpPvCyAnzvojm?=
 =?us-ascii?Q?HaXrkvT/AuEgbg5Hp7LiT8gc2K+mjRXW2cu9PCsCAJlRY0yWkIjDkDU/Zr8Q?=
 =?us-ascii?Q?zcsdFocmncMlD7Hx8fWhyMqE9SNR/6FyqzdqjPJ+DaoorQIfyG3brrw0LinL?=
 =?us-ascii?Q?xaZMWjzoww8fTR47QCyitDHsdkI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37e1ce2-3a6d-4238-17dc-08de6b45eb9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 21:21:58.3122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7gnOwj+t0NDL7Zv7HyC38Tmi82oJ9WEy4Ti+T+PxTqJoIM7ONofqumcPKiAInXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10033
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Feb 2026 21:22:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9587

With the latest version of meta-virtualization, I now get this=20
message when running devtool modify for any recipe:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
vcontainer-tarball: Building SDK with multiconfig dependencies

  Architectures: x86_64 aarch64

  This will automatically build:
    - mc:vruntime-x86-64:vdkr-initramfs-create
    - mc:vruntime-x86-64:vpdmn-initramfs-create
    - mc:vruntime-aarch64:vdkr-initramfs-create
    - mc:vruntime-aarch64:vpdmn-initramfs-create

  To build only one architecture, set in local.conf:
    VCONTAINER_ARCHITECTURES =3D "x86_64"
    VCONTAINER_ARCHITECTURES =3D "aarch64"

  Incremental builds enabled (default).
    To force full rebuild, set in local.conf:
      VCONTAINER_FORCE_BUILD =3D "1"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Since I have no plans to build vcontainer-tarball, this is quite=20
annoying.

//Peter


