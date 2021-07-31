Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web09.599.1627766456727920407
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 31 Jul 2021 14:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Yv02IiW+;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2010; q=dns/txt; s=iport;
  t=1627766456; x=1628976056;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V8Cx6swhmq8rrXN5Cr1IY/Hu/DCnN2nd3v9Ol6M7ZdY=;
  b=Yv02IiW+SrbP+BCNMz7O+eaYBvvuEdrZ6m9/Z2WJymDO7yO9BbO7RqNu
   0ngUqyIfMUDt0opehvJxKsWUBwMkatYJdsSvUQrk9JbvQBoNFWuNxb0n2
   0zKh3pGmeaDFvA1uSl6+lVv87CWOw9dBWnvUgSkN7HfZ0tca+z1mrQaEM
   4=;
X-IPAS-Result: =?us-ascii?q?A0AiAACCvQVhl5hdJa1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UUHAQELAQGBUVF+WjcxiA8DhFlgiF8DmjOBLoElA1QLAQEBDQEBKgMUBAEBh?=
 =?us-ascii?q?FgCgn8CJTQJDgECBAEBAQEDAgMBAQEBBQEBBQEBAQIBBgQUAQEBAQEBAQGBC?=
 =?us-ascii?q?IVoDUABEAGFcAEBAQECAQERKAYBASUSAQQHBAIBCBECAgEBHxAoCh0IAgQOB?=
 =?us-ascii?q?Qgagk8BglUDDiEBnmEBgToCih94gTOBAYIHAQEGBASFGBiCNAmBOgGCe4pzJ?=
 =?us-ascii?q?xyCDYFYgmI+hEaDS4IugxyBDgGBQ2UGAatokhcKgyeBMpVIh2cSg2OLYJcku?=
 =?us-ascii?q?yECBAIEBQIOAQEGgWA5gVtwFYMkCUcZDo4fGR6DIRmKXnMCNgIGCwEBAwmCO?=
 =?us-ascii?q?Yc5XgEB?=
IronPort-PHdr: A9a23:/bbLQh+k2qgJmP9uWD/oyV9kXcBvk7rxNw8RrJEgjuEGfqei+sHkO
 0rSrbVogUTSVIrWo/RDl6LNsq/mVGBBhPTJsH0LfJFWERNQj8IQkl8vBceEDQvwK/u5JyA/F
 d5JAVli+XzzOENJGcH4MlvVpHD67TMbFhjlcwRvIeGgEY/JhMPx3Oe3qPXu
IronPort-HdrOrdr: A9a23:IMEOQK6w5qoY+aOlKQPXwFDXdLJyesId70hD6qkvc20zTiXIrb
 HLoB1E726QtN9wYgBapTnXAtj3fZq8z+8A3WB1B8bZLXTbUQSTXf1fBOHZogEIZBeOvtK1uZ
 0QDJSWTeeAfWSS7vyKlTVQcexQseVvq5rYzNs2pk0FJWoLGthdAh9Ce36m+w9NNXp77PICZf
 yhD6F81kidkBosH7qG7rRpZZm1mzXS/6iJXfbybCRJ1OBMt16VAXzBeSRwEi1uMA+nCI1PgA
 r4egXCl+6ej80=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,285,1620691200"; 
   d="scan'208";a="776419240"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 Jul 2021 21:20:55 +0000
Received: from mail.cisco.com (xbe-aln-004.cisco.com [173.36.7.19])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 16VLKtC3027295
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Sat, 31 Jul 2021 21:20:55 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-aln-004.cisco.com
 (173.36.7.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Sat, 31 Jul
 2021 16:20:54 -0500
Received: from xfe-aln-001.cisco.com (173.37.135.121) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Sat, 31 Jul
 2021 16:20:54 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-001.cisco.com (173.37.135.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Sat, 31 Jul 2021 16:20:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JC3xpahPft5+bkBLeEu4tnZQxCEfAbaU5BWlmuKioCugbVUdHklYoVGyYYFG4Tbpd+v8k+m1aQH8AsDhm+xzw9pVi2bGmFsZElCQ3s2KOtnqNHbm5xv/FqepMN8r25NSitHItKT3rGJhOBSNX4FjCbzvp+D05ZDDu+fw8RDDtHL16jR4u9ub4bQMSCEM7+EYRtkhCJH6RPkenypyJRfOctocmy8PiJuol5S8q1flJvx+zo8jIHjWBLGyCfD3krIWCykByGNRaBRJglqNCU8QPjwte057RWoPsvhu/apgAjOltDCdKisvVwLPxIKmVv9IeehUHl7rei0gph44VW0RZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ypK/b7M+w+30O4pMTVp8FgPUlNRiGuU6qiFSiL63IE=;
 b=XtePuEHz2n/uoM6JDBIND9/5edfL8JaBpikbGWNejUyGkSKaLkD4d/T5KIhOjMmbyrwgE+g8TIPQajVTpRk8xFIJ5OSlQ+Toofhp534zJvZzKBH5ChD9++qhuwGWKMIPwblU58/u8N1jE4MePu7aUSEU6pWU+jQ6W9i7uFP1zmFGp3WexADUjIJ3ST+zrOFKIQsH/SSf5fp9pYX/Kpe+Rufx+uvbw8QHYrhPVUr8HcpC9mbNiCYueCSt5+JY3g8Vw/rWC/ryWP8JVkIQVvpoV7KVzI49+03pBEFmotrNmhcveS4CXa3sCmr3A2ph0WGVYUgO6vlgEjBUNXucZwRFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ypK/b7M+w+30O4pMTVp8FgPUlNRiGuU6qiFSiL63IE=;
 b=0s8A5aI4n/I9k5+vH2yLuuQKpoWfJWi3rffspJdUMI47UxuShoLOpRzWIxuV7T7CTIgD9TFVmZJBd7CUHjHfsmA/0oMUVJ8hk1PoBH0/K1jcRi2HjBc12oWop6UfnFw3PSya52yjJa2yIQZTD6tcp1yiO6lucz2pLWi1H7xKGuY=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Sat, 31 Jul
 2021 21:20:50 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%4]) with mapi id 15.20.4373.026; Sat, 31 Jul 2021
 21:20:50 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
Thread-Topic: [meta-virtualization][PATCH v3] python3: remove the no-longer
 required bbappend
Thread-Index: AQHXglA1aKwb4ZLL9EOx0bidwiEqjqtaD1iAgAOPzFA=
Date: Sat, 31 Jul 2021 21:20:50 +0000
Message-ID: <SJ0PR11MB4784457572877D025E5E69F5ADED9@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210726185823.26402-1-fib@cisco.com>
 <20210726185823.26402-2-fib@cisco.com> <20210729145700.GB40673@gmail.com>
In-Reply-To: <20210729145700.GB40673@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0210dc1e-515c-4734-7c1b-08d954691263
x-ms-traffictypediagnostic: SJ0PR11MB5039:
x-microsoft-antispam-prvs: <SJ0PR11MB50394B3C106D99BAE6B21E07ADED9@SJ0PR11MB5039.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2W+7935+Oaawauzf0IpqRcUguvJ/MMq+wEpE0V3hWivzzJn5xGIvqVHNyt3pfdAQrHFyEODuQQyioeZE33DzQJaVKLoxWR/af5nXh8hTJ66q28FfZOpAB4z95i4N05zYelWCPOtKrCYKLqClBR3qqOW6mUAqhVg8SYuC6NROXf3EdNh7K43vtLm9g/QGUjrr12lieYmAZOd6LKVnkxSN2iMaBDUp2cipp6QeDX5zBNLfbCNeLo3v0g/HJS8MHxUCBvZMa0jZeq8fua9EE+tn0w9NVUudKWtnidmW3uKm2D8RtAvsTklS2ifvuUeF40MqBLl4O7MJW6pxnS+0V7wFLjquwIzqRSHgZuLtanHb8APeEfBCfXJ5eeF7Zoqkh7HDKdfkhE3P8eI0CqU40Tfq8fKUkrvtiF2qDIjzHAqqZcd4VdaiyWsCE9XSFgksf68e8ErP3B4lIecteH8R5F4rywcmEJMGbXVbL8+X1tMaBStvRIjlyOfEbrr29FSwvJHTUpZkVY5n3D3aXi8OGO/KbtCZf3pUmzD6UoOBBZ44bWEnDjQqMX7wQl9blcsfj2kPHKECKm6w6Xgn5t7YMCLVCJlgA2CyaPOObbAyOuPR03V+RO5Ji4X4yDSkPeYOiXK8rNdF96XbkzYmFc0KEPVIHVa53KkpKmcx+cjhMQW3o/c2tyaUYLFBBh9q622edgPwGd9NIKxFgA53n8yWKJrz5VlHLxCtUFvtMHiwp2ygDmM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(366004)(376002)(396003)(136003)(76116006)(71200400001)(66946007)(64756008)(66446008)(33656002)(9686003)(2906002)(66556008)(66476007)(122000001)(4326008)(316002)(38100700002)(6506007)(478600001)(55016002)(53546011)(7696005)(26005)(186003)(8676002)(6916009)(86362001)(5660300002)(52536014)(83380400001)(38070700005)(8936002)(148743002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nyNDmMAjklWxyN7Wo06UXAsyvGM5jnEArh2+fiJM8ntg9o3LF0gBRaQD0sTd?=
 =?us-ascii?Q?OtIqvCrS48+ys3TwBxpF7AA+euXPXub59t2zbgCLFbcdHUt5G4XkouReqCLr?=
 =?us-ascii?Q?e15I9ZA3fHQz5fXpfrTXlP1SfV709Zkw0/L7UqL9XK3JFRLTLoSt0V3BsQuK?=
 =?us-ascii?Q?ysxMVRYuudYYOrQEtycti8N28gAQmXzmKB6/Lv5YHp73NNrJY/+sRuvdEhoa?=
 =?us-ascii?Q?+rfCcsochfKZF3DkKiZ9aiGJ5+UeIAuc0J7jIfS/0FnEtgtkghkDgAb6LQQ0?=
 =?us-ascii?Q?yQZV/qVh2L9XJQVRi+adGVwYlxiaXe1UfYuyMmApi7af0c8tT2JuM2/P+FAr?=
 =?us-ascii?Q?Cu+Zi0CKc4kMNWCG4tRPEVewuUvUKOouwl98YJF0IiAu4gY+/c9Vw+TIc10Y?=
 =?us-ascii?Q?YP3mn3X8gDMzrII9jT2uTJk24KO/mdfWF2FbSyuDAMHnLccS3DwSUtYrFaYb?=
 =?us-ascii?Q?P9rj7LOKvg7x7QafObQTYGuM9xhTsT1BQ8zlljiJhXJCUjCMcB3URAUPQpSK?=
 =?us-ascii?Q?qipTXKlvnTiVhGmRdhxIrLnB6r0tmNtQ25+9jutok+YXBogzqgzIvlc/nKxh?=
 =?us-ascii?Q?ut+gw2tV+aHnt28EEGrVUV5kFO58xz/uE4z6BmeUEhWi2juwHDojxNxo8Tb9?=
 =?us-ascii?Q?9qRZMhYYI+FpLLOH6azzTpIUwKeJfhsbHgB+jfpkzeFX6yzACpiAdIYWFBNc?=
 =?us-ascii?Q?xNhpymcUg4RL+/bUK4JqHvivfPwylWv7qgELguTexUBMxQyA/FeDpygJOluQ?=
 =?us-ascii?Q?rGBR2wLNRHQAjypa3Dik9W6UVMaEGzKHadSpFtwNLm6+zic/qPxePf1fON17?=
 =?us-ascii?Q?q4RCbvwNV5+IDFvFiSVM7TyFTud2zUV3CKlZekSj0i8SuFK9X+CLqBo149Yl?=
 =?us-ascii?Q?7hgATtV9ocxnSSTQAjCPF+nR/OxQctapSdtBXp2PxTQgf334A3DrBJhItvgR?=
 =?us-ascii?Q?IbsoK4gV7Pqnmhs+v+5b6ankwn4mOOsUfYM6NqD2z55+JMEixmsUIwL98i3U?=
 =?us-ascii?Q?bNVYakth7sWzJsxZx1KyNbtLAPKFVAOfoPaTvycmYD0IHGxxCYn+8jXVKefF?=
 =?us-ascii?Q?OvgKLLfrDWEpUh5lDOFak0pYsRr2NfDI8pp3DJNUN6ZyQqF7qjSXqVLP9weH?=
 =?us-ascii?Q?C7CRWJ3q96kQPFLxrdxH0XDfEpVncye6NR+fJ96tu03VUtgyOCE1UJeaFKaK?=
 =?us-ascii?Q?cd0rEo2NPDLSxAwLKQREVYi1ftTnwm2ovO6YQh5x22FE1/Kv+A6kxyegJ1kT?=
 =?us-ascii?Q?P/80TFQBBGMepvMySRcLEOxlEOwOhPGEbC4Lvt1lcJZ55np1GKOj+MYLc8CM?=
 =?us-ascii?Q?L4w=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0210dc1e-515c-4734-7c1b-08d954691263
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2021 21:20:50.4782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yxi/BjR6sI/Mg5R6ni+NNTzkgNNFWejn3Zu22Vc4RbNSOWVB0AccAmb7Akv6U1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.19, xbe-aln-004.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can this be cherry-picked into dunfell please?

-----Original Message-----
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> On Behalf Of Bruce Ashfield
Sent: Thursday, July 29, 2021 7:57 AM
To: Ruslan Babayev (fib) <fib@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer =
required bbappend

merged.

Bruce

In message: [meta-virtualization][PATCH v3] python3: remove the no-longer r=
equired bbappend on 26/07/2021 Ruslan Babayev wrote:

> It has been carried over from python2 and is no longer required.  More=20
> importantly it breaks the python3-native build due to=20
> ${STAGING_DIR_TARGET} being "" for native recipes.
>=20
> Signed-off-by: Ruslan Babayev <fib@cisco.com>
> ---
>  recipes-devtools/python/python3_3.%.bbappend       | 1 -
>  recipes-devtools/python/python3_virtualization.inc | 8 --------
>  2 files changed, 9 deletions(-)
>  delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
>  delete mode 100644 recipes-devtools/python/python3_virtualization.inc
>=20
> diff --git a/recipes-devtools/python/python3_3.%.bbappend=20
> b/recipes-devtools/python/python3_3.%.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-devtools/python/python3_3.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',=20
> '${BPN}_virtualization.inc', '', d)} diff --git=20
> a/recipes-devtools/python/python3_virtualization.inc=20
> b/recipes-devtools/python/python3_virtualization.inc
> deleted file mode 100644
> index 55301c7..0000000
> --- a/recipes-devtools/python/python3_virtualization.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -DEPENDS +=3D " ncurses"
> -
> -do_compile_prepend() {
> -	export LIBRARY_PATH=3D${STAGING_DIR_TARGET}/lib
> -}
> -
> --
> 2.26.2.Cisco
>=20
