Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web11.1538.1627668795278871019
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 11:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=XLlMOnuE;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7357; q=dns/txt; s=iport;
  t=1627668795; x=1628878395;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QJvap5GpVh6WlM1mDDjgSokoMLDjk7vdAdcw80wmxwY=;
  b=XLlMOnuEoZ3/Z3mdHl9OX95+1f4OEaQezBVzPxmjfznDsmTf99YCaqrh
   ne3vvM7HpOAJNwnezu8N20SFq6n1HYzPTAovWHblt/NhvJQzr5++VZECL
   voNacyXG0uHVk3nLrsTzjhFBRFpPV0aXMEjwIJ67ksf0AThNAhXfB/aQr
   A=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AihDgNB0tWhVR4rVmsmDPtVBlVkEcU/3cMQsc6?=
 =?us-ascii?q?55hgLVLIeyv/JXnaUrY4/glzFrERp7S5P8Mje3K+7vhVmoN7dfk0jgCfZVAW?=
 =?us-ascii?q?gVDhZAQmAotU8GAAEz/avXtan9yEMFLTlQw+Xa9PABcE9r/YFuHpHq04HYSF?=
 =?us-ascii?q?xzzOBAzKP7yH9vZjt+80Ka5/JiACzg=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A4a2P2q6VNmuDiYTBkgPXwZCCI+orL9Y04l?=
 =?us-ascii?q?Q7vn2ZFiY1TiXIra6TdaoguiMc0AxhJ03Jmbi7Sc69qADnhOBICO4qTPeftW?=
 =?us-ascii?q?jdySqVxeRZjbcKrAeQYBEWmtQtsJuINpIOdOEYbmIKzvoSgjPIaerIqePvmM?=
 =?us-ascii?q?vD6IuurAYOcegpUdAc0+4TMHf8LqQCfng/OXNPLuvk2iMonUvFRV0nKuCAQl?=
 =?us-ascii?q?UVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1UjegIK5Y1n3XnOkgT/6K?=
 =?us-ascii?q?nmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3DRY0eTFcBcso+5zXYISdKUmQ?=
 =?us-ascii?q?8XeR730k8d1vFImjTsl6eO0EDQMkfboWwTAjTZuC6laDPY0LzErXQBepd8bU?=
 =?us-ascii?q?YzSGqH16Lm1+sMjJ6jlljpxKZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5?=
 =?us-ascii?q?ACAYUh4LD30XklW6voJhiKorzP0dMee/309bJTaxeXfnrZtm5gzJilWWkyBA?=
 =?us-ascii?q?6PRgwHttaO2zZbkXhlxw9ArfZv0Uso5dY4Ud1J9u7EOqNnmPVHSdIXd7t0AK?=
 =?us-ascii?q?METdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrIkd9aWvYtgF3ZEykJPOXBdRsn?=
 =?us-ascii?q?MzYVvnDYmU0JhC4nn2MS2AtPTWu4hjDr1Cy/PBrZbQQFi+oWEV4r2dSq8kc7?=
 =?us-ascii?q?/mst6ISeZrP8M=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B5AABRQARh/49dJa1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgUUHAQELAYFSUQd3WjcxiA8DhFlgiF4DmjOBLoElA1QLAQE?=
 =?us-ascii?q?BDQEBKgMUBAEBhFgCgnwCJTQJDgIEAQEBEgEBBQEBAQIBBgSBEROFaA2GQgE?=
 =?us-ascii?q?BAQECAQERKAYBATcBBAcEAgEIEQMBAQEfECgKHQgCBAENBQgaglCCVQMOIQG?=
 =?us-ascii?q?fNQGBOgKKH3iBM4EBggcBAQYEBEiEVBiCNAmBOgGCe4pzJxyCDYFYeIEzNz6?=
 =?us-ascii?q?BBIFeAoFKGINLgi6DHnsTAUIJeBtQkmGMA40FkhcKgyeBMokGjEKHZxKFKqE?=
 =?us-ascii?q?9C5YDigqbCQIEAgQFAg4BAQaBYDuBWXAVgyQJRxkOjh+DcYpeczgCBgsBAQM?=
 =?us-ascii?q?JiAqCRgEB?=
X-IronPort-AV: E=Sophos;i="5.84,282,1620691200"; 
   d="scan'208";a="823150451"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 30 Jul 2021 18:13:13 +0000
Received: from mail.cisco.com (xbe-rcd-007.cisco.com [173.37.102.22])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 16UIDDej005640
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Fri, 30 Jul 2021 18:13:13 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-007.cisco.com
 (173.37.102.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Fri, 30 Jul
 2021 13:13:13 -0500
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Fri, 30 Jul
 2021 13:13:12 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-005.cisco.com (173.37.135.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Fri, 30 Jul 2021 13:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/VuQcTahKvC++uER20oVfwdbgWe7XuKROzUdHIAp1h9Nwi+aWQscCF+yaYODroPRNVEYEmE+cp5m/toIzd6p0mfi3TYBrQkayZqVhwQXgRsp6HDigPvLsjX4Cb2sYvfL0quxx22sPx4TVemR3HruViXV0geJ6HlWFIY4ly8thIlu0RIizlVRTZeeV24oE6deQS55xlkRBnWyFhpY3bFMe1x6ri70eI8ilbBpavNDU4W2/leQv3ZKCFoC2HMBbazn47CIM+BfYRZuE8YHT/LLJ2sYwV9xXuV1lR73uiIQQAdeekLrWChreUulQ3LFLmPe0Y6OZ//WM2lKlf9aRoE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbFzpn100ooE9csUxP435qVlOv98ZbgkPN7Cku++gxo=;
 b=GT6sl6w68GPI2eKJ7zZA/BRaEgd+6Vd7mnKC1NkAj3nuEGrj2FfcO+kv5/8byo88EHjx4B5ONr3OrtDYGdDnP6uVO1P4sTLwb97wOkwH03QgZ2F6+h0mFoyLyobOe9T+r1+RWHV7/eCoZb+k4ydhsQTZB8nMTvUCTpvveM1GsiXUv0R7ma6hV1Yt1pMzLzNHcGzaRKcsHcCjSI/G+vKyGrm8aRY0p32tM5bUVAceHEFoc/cTZlRwfzSPMOCABgOQZUTt7MeTZhw+z/BFMjl6ecWR/yD3BsC+JtqWKh8GrCx/YzoLguO+kV7bAw6XBUS+7tgG9fapTJDRntR51q7EMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbFzpn100ooE9csUxP435qVlOv98ZbgkPN7Cku++gxo=;
 b=dXPx42gOWI7lOaBUT00nJ4CQKUZSsUNs6EJ9nc4PljjkH9lrEV0tbdegL0YKaRABLG21YzmenjAANTGV1VbKkOSNntrSpbojZhgjsejm6NLnKwfrYD2RBAOwf2XutetccIsrXikcZWiWaY3jse8Qr3/m/he0msUQ9xTyktsxsms=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 18:13:11 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%4]) with mapi id 15.20.4373.026; Fri, 30 Jul 2021
 18:13:11 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "sakib.sajal@windriver.com"
	<sakib.sajal@windriver.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
Thread-Topic: [meta-virtualization][hardknott][PATCH] kubernetes: fix
 CVE-2021-20206
Thread-Index: AQHXg9NDRiW1QOkeGUKT/euY4ee8+KtaDLIAgAHIhHA=
Date: Fri, 30 Jul 2021 18:13:11 +0000
Message-ID: <SJ0PR11MB47848F36E8CF4CD2EA403678ADEC9@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210728170838.21526-1-sakib.sajal@windriver.com>
 <20210729145821.GC40673@gmail.com>
In-Reply-To: <20210729145821.GC40673@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33c1e884-21dc-43b9-22e8-08d95385b0f8
x-ms-traffictypediagnostic: BY5PR11MB4243:
x-microsoft-antispam-prvs: <BY5PR11MB4243765AA2CD5394EA40E8C3ADEC9@BY5PR11MB4243.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ufbYeU94NsBTONTgPg2C0AGFsU6pDUs9ZXoWQgXNB4Yb1bkv+10AWRr2EOM3Y1J3vSr3WZwPtlxn316XzOWh1JikVxpDfSBeroI1XFcgTupMFWUX00cyl460O/p2cCnBbEYGAEGxns/GsyHGM0s0wn1jFLQ/G8W+EQJLMiY6s7/jX0pzaxkRTqIhdhBlcZIL6E6sezFnBZ9IALVmvPvHASO9lXXQMMi4MDeoYkmSd4/OV8bwraTM3NXVv+2Gmko7v6LJ2ydl2md3Vru4toPskbts97OPCLQOjIq2gKFORjV85tp03a6orHgQhUeCFmYLtl0XW1CdnnTFkhnu26kYsU1JToBZTg7PLX7L8+1LeI6K2ThjjjBJUk9fO50rEnaVkQ6zdCIvq2l0TAxJGsqm8WihP61CUjTLCoa2gmNbaDHr+ywOeYqtnO+X4IuQmRjE7yruPTAJjpjBGk/YZBsw4smbIDEX9+635fa+S8n/CrkCQsrSOC1SiNPODou/M4riT45ySl4SUKZ0Hv/0U9Hvfmx9Bvlda3CF9f9m3PIFtxnpUYcJFFFsHaSOGG18/WOz/I+dpShFKRT3IkHjNYrquqUhnzxpI0+ho58CGpj124BoE0PJIQYlCBIjMw/zv309AfOu3KfOhXFlX9TIeMAkxq9fusZEKwdOH97w6X7fI9LLkQDjJLmbFvIMkGRMXVWHcWJvoLM00SmYIPjipQ/1yE7KEhty2Oz69voGOJx02DDIqIis05i98BtRvkH7W2/ZB/ujrG4XquftNeRhi6KHGHwsX0i0FYDKMYSkBJrBh2XmeCqk4/4g63Y0c8S8bIZFiI+lJgc4rd2CkG1AKyoFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(376002)(346002)(396003)(136003)(33656002)(9686003)(110136005)(4326008)(71200400001)(66476007)(64756008)(53546011)(66446008)(66946007)(7696005)(66556008)(52536014)(8936002)(8676002)(83380400001)(86362001)(6506007)(76116006)(316002)(38100700002)(2906002)(122000001)(26005)(38070700005)(478600001)(186003)(5660300002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SB4JmTIa1v7l6pMGUSRrj7BY5RURJtfB9GL866MiT3blpS/Z9A+V8RxGTsd6?=
 =?us-ascii?Q?d42IGX9PPUDxSg+yFZXfjuX1ibtRox1T8+687JoZrmOct0U9VbWGzjTz9VGE?=
 =?us-ascii?Q?RqWuMZ2fUFyylrt9pwju40vcfSqsbSYQwR/xP7dOSGmJD1/2YP5CH7BbN2GQ?=
 =?us-ascii?Q?DHTHt7l4seH6wdoFG5FeVoPLIM5OHOrxxiQ/u/YIu2GU9/L74WMMtU8SlwK0?=
 =?us-ascii?Q?wYRzoCOLQ7lrY169HTKhIBd4fyfDn8VKEfVzPc7trqjudO5VNHpsdT//1mMu?=
 =?us-ascii?Q?fV86KIcRzLxc5hxE24YbTnrmhQVvNn0sUYvHcmFlEihiGkV5KywfJ1lkGGrm?=
 =?us-ascii?Q?QYe7k9BwhFl8pC1Z3d54eVhv85U7OYZBLqgtdv72QnxPIsFr3Sx/DGi3okcY?=
 =?us-ascii?Q?Ap21U2jhhpAfDPBJZ8z570vYjhuVbAThETc+AiKJa0G/AuP3/S8r8sSOeHM3?=
 =?us-ascii?Q?jhEqCjKhjiZQEVvXzvgZ+SC7jt5Syfg/KNzZaA/9DOdC3oyheeZY+YAqru7J?=
 =?us-ascii?Q?QRjz7NTwKG5vuK+sw7W33wgeSNltkG/1sv6gxvhA6HZ9yqU7An5NH5kkjp4H?=
 =?us-ascii?Q?dxpZoA+KACBN5SeuzdrBbPxX9TQJe4LVzyLwrFcIm024cQ0aoTYGpZoMMGBm?=
 =?us-ascii?Q?tBrlQeaawigE0cOXI4qzJKOy3zzFlAdz838lFAGcCAh5Odzw6P7fnNKGwWMa?=
 =?us-ascii?Q?dRR4RYAg24r007E7VlHsRx5UWcLvpt89gaoFL8RhikbJYnnOeNUYRO13gINo?=
 =?us-ascii?Q?1OKcHNhblOaNJZ8qfgKKfe5FvR0kuuTGyQd+9CjNSKeHALwqucix0t8rYUmA?=
 =?us-ascii?Q?+YWwwnwjvZnllDh8eoLDeq4Mdf6+JUwAJUYZ7Vk9JDCtpzDN5wIGyMoW6kE+?=
 =?us-ascii?Q?cWj/fyiL1fUZ3Kx/rpj7TNo6qHFbakyjAeOF9x4+oU4QGAR96zr1A+bBrkmz?=
 =?us-ascii?Q?L1f9ETMd9ZE2Y/zjAPElv23eLItnYlhDW/gBIKEgbKKIimh+wlWbfl2eGtcB?=
 =?us-ascii?Q?Pb2jlsWpoLhbbD05dmRH+YqFPA3y/Ja54ORDRo9tUMIcY1Sgvfujh2MNwDIE?=
 =?us-ascii?Q?jZtCJMBnzLUQFi2Qrt5c8FdqZHRqOB3QszEmmsv39YSghpfc5OH0vy1p4fhk?=
 =?us-ascii?Q?o4VY2uLLgoCu1gtK7qDwtoHbWtf0vMgk9pnctE+MwnkVHtJnK180nV3gtMM/?=
 =?us-ascii?Q?gyRXxK3UPOKsWk9AOs4s3ZxzAInxJ6t0tP3WHfLq5iH72RaozKWzNXjKjfG8?=
 =?us-ascii?Q?AN6ga2vHTnggPXmm2yWlL2N9j7M9UZ5UQ3pYwuudvb0OrOMi0DZNxeCumB9u?=
 =?us-ascii?Q?qsI=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c1e884-21dc-43b9-22e8-08d95385b0f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 18:13:11.2870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcwHvK2QjlFObSIriedGzSzEozM4uDH85n4BwJqCLYLU+ejNukSlRQAEnZ5L/E+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4243
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.22, xbe-rcd-007.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Bruce!

Can this be cherry-picked into Dunfell and other branches as well?

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Bruce Ashfield
Sent: Thursday, July 29, 2021 7:58 AM
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-20=
21-20206

merged.

Bruce

In message: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-202=
1-20206 on 28/07/2021 sakib.sajal@windriver.com wrote:

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../kubernetes/CVE-2021-20206.patch           | 92 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644=20
> recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
>=20
> diff --git=20
> a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch=20
> b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> new file mode 100644
> index 0000000..dc4e902
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> @@ -0,0 +1,92 @@
> +From 5e8f9a8a72351e2fb5bcea3e3c58c935314557b6 Mon Sep 17 00:00:00=20
> +2001
> +From: Navid Shaikh <navids@vmware.com>
> +Date: Thu, 6 May 2021 15:41:08 +0530
> +Subject: [PATCH] Bump containernetworking/cni to v0.8.1
> +
> + Fix CVE-2021-20206
> +CVE: CVE-2021-20206
> +Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + go.mod                                                       | 4 ++--
> + go.sum                                                       | 4 ++--
> + vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
> + vendor/modules.txt                                           | 2 +-
> + 4 files changed, 10 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/go.mod b/src/import/go.mod index=20
> +e0ba549ab40..d4cc9ce01a9 100644
> +--- a/src/import/go.mod
> ++++ b/src/import/go.mod
> +@@ -28,7 +28,7 @@ require (
> + 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
> + 	github.com/codegangsta/negroni v1.0.0 // indirect
> + 	github.com/container-storage-interface/spec v1.2.0
> +-	github.com/containernetworking/cni v0.8.0
> ++	github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration v1.0.10
> + 	github.com/coreos/go-oidc v2.1.0+incompatible
> + 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
> +@@ -214,7 +214,7 @@ replace (
> + 	github.com/containerd/go-runc =3D> github.com/containerd/go-runc v0.0.=
0-20180907222934-5a6d9f37cfa3
> + 	github.com/containerd/ttrpc =3D> github.com/containerd/ttrpc v1.0.2
> + 	github.com/containerd/typeurl =3D> github.com/containerd/typeurl v1.0.=
1
> +-	github.com/containernetworking/cni =3D> github.com/containernetworking=
/cni v0.8.0
> ++	github.com/containernetworking/cni =3D>=20
> ++github.com/containernetworking/cni v0.8.1
> + 	github.com/coredns/corefile-migration =3D> github.com/coredns/corefile=
-migration v1.0.10
> + 	github.com/coreos/bbolt =3D> github.com/coreos/bbolt v1.3.2
> + 	github.com/coreos/etcd =3D> github.com/coreos/etcd=20
> +v3.3.13+incompatible diff --git a/src/import/go.sum=20
> +b/src/import/go.sum index 288f4554b1f..9168f49c859 100644
> +--- a/src/import/go.sum
> ++++ b/src/import/go.sum
> +@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2=20
> +h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
> + github.com/containerd/ttrpc v1.0.2/go.mod=20
> +h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=3D
> + github.com/containerd/typeurl v1.0.1=20
> +h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=3D
> + github.com/containerd/typeurl v1.0.1/go.mod=20
> +h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=3D
> +-github.com/containernetworking/cni v0.8.0=20
> +h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=3D
> +-github.com/containernetworking/cni v0.8.0/go.mod=20
> +h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=3D
> ++github.com/containernetworking/cni v0.8.1=20
> ++h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=3D
> ++github.com/containernetworking/cni v0.8.1/go.mod=20
> ++h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=3D
> + github.com/coredns/corefile-migration v1.0.10=20
> +h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=3D
> + github.com/coredns/corefile-migration v1.0.10/go.mod=20
> +h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=3D
> + github.com/coreos/bbolt v1.3.2=20
> +h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=3D
> +diff --git=20
> +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> +d.go=20
> +b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> +d.go index e815404c859..e62029eb788 100644
> +---=20
> +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/fin
> +d.go
> ++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke
> ++++ /find.go
> +@@ -18,6 +18,7 @@ import (
> + 	"fmt"
> + 	"os"
> + 	"path/filepath"
> ++	"strings"
> + )
> +=20
> + // FindInPath returns the full path of the plugin by searching in=20
> +the provided path @@ -26,6 +27,10 @@ func FindInPath(plugin string, path=
s []string) (string, error) {
> + 		return "", fmt.Errorf("no plugin name provided")
> + 	}
> +=20
> ++	if strings.ContainsRune(plugin, os.PathSeparator) {
> ++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
> ++	}
> ++
> + 	if len(paths) =3D=3D 0 {
> + 		return "", fmt.Errorf("no paths provided")
> + 	}
> +diff --git a/src/import/vendor/modules.txt=20
> +b/src/import/vendor/modules.txt index 6a263b51686..c3b68a5f547 100644
> +--- a/src/import/vendor/modules.txt
> ++++ b/src/import/vendor/modules.txt
> +@@ -257,7 +257,7 @@ github.com/containerd/containerd/pkg/dialer
> + github.com/containerd/ttrpc
> + # github.com/containerd/ttrpc =3D> github.com/containerd/ttrpc v1.0.2 =
=20
> +# github.com/containerd/typeurl =3D> github.com/containerd/typeurl=20
> +v1.0.1 -# github.com/containernetworking/cni v0.8.0 =3D>=20
> +github.com/containernetworking/cni v0.8.0
> ++# github.com/containernetworking/cni v0.8.1 =3D>=20
> ++github.com/containernetworking/cni v0.8.1
> + ## explicit
> + # github.com/containernetworking/cni =3D>=20
> +github.com/containernetworking/cni v0.8.0 =20
> +github.com/containernetworking/cni/libcni
> +--
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb=20
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index bc694a2..7b9aab8 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.git=
;branch=3Drelease-1.20;name=3Dk
>             file://0001-generate-bindata-unset-GOBIN.patch \
>             file://0001-build-golang.sh-convert-remaining-go-calls-to-use=
.patch \
>            =20
> file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch=20
> \
> +           file://CVE-2021-20206.patch \
>            "
> =20
>  DEPENDS +=3D "rsync-native \
> --
> 2.32.0
>=20

>=20
>=20
>=20

