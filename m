Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.16013.1627878961940590858
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 21:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=lHX9Vftc;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8439; q=dns/txt; s=iport;
  t=1627878962; x=1629088562;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=heXiysJVKEKgoQ0tnlDUB4XIej6uptn6B6wo0Feg1EY=;
  b=lHX9VftcDgZC7gzBKP8xYnFbee+ZwMJ1ifRGqfXs/ti8CfzYicwIHXp0
   pXqDvh2hBmD5Jb0CT2jBSg2F3emYxe/mf87k/j5DFhqoCqZ5FYNVc1SCA
   rAWsDiCJyFGk0Cnn+EjqWMf0DLv/RE4+LYrQuJxx/WRrAiwq+j7mq67N0
   Q=;
X-IPAS-Result: =?us-ascii?q?A0AYAACedQdhl5xdJa1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UUHAQELAYFSUX5aNzGIDwOEWWCIXQOKWY9agS6BJQNUCwEBAQ0BASoDFAQBA?=
 =?us-ascii?q?YRYAoJ/AiU0CQ4BAgQBAQEBAwIDAQEBAQUBAQUBAQECAQYEFAEBAQEBAQEBg?=
 =?us-ascii?q?QiFaA2GQgEBAQMBAREoBgEBNwEEBwQCAQgRAwEBAQEdARAhBwodCAIEDgUIG?=
 =?us-ascii?q?oJPAYJVAw4hAZ8HAYE6AoofeIEzgQGCBwEBBgQESIRXDQuCNAmBOgGCe4pzJ?=
 =?us-ascii?q?xyCDYFYeIEzNz6BBIEcQgKBShiDS4Iugxl7EwFCCXgbTwGSYYwDnkBcCoMng?=
 =?us-ascii?q?TKJBoxCgWuFfBKFKqE9C6ANhWKVJwIEAgQFAg4BAQaBYDmBW3AVgyQJRxkOj?=
 =?us-ascii?q?h8Zg1iKXnM4AgYLAQEDCYgKgkYBAQ?=
IronPort-PHdr: A9a23:SSf1uxLwgNmLCgrnotmcuXsyDhhOgF28FgEQ45sjzblJd/fr85fjO
 RnZ4vNgxB/MUJ7A4v1Jw+zRr+j7WGMG7JrA1RJKcJFFWxIfz8lDmQsmDZ2KDET6KLjhaClpV
 MhHXUVuqne8N0UdEc3iZlrU93u16zNaGhj2OQdvYOrvHYuHhMWs3Of08JrWMG11
IronPort-HdrOrdr: A9a23:DNYGQaAqfNm4AKjlHenC55DYdb4zR+YMi2TDtnoRdfU7SKelfq
 yV8cjztiWbtN9yYhsdcLm7UcG9qBjnmqKdj7N8AYuf
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,287,1620691200"; 
   d="scan'208";a="776779770"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Aug 2021 04:36:00 +0000
Received: from mail.cisco.com (xbe-aln-004.cisco.com [173.36.7.19])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 1724ZxDH015058
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Mon, 2 Aug 2021 04:35:59 GMT
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xbe-aln-004.cisco.com
 (173.36.7.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Sun, 1 Aug 2021
 23:35:59 -0500
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xfe-aln-005.cisco.com
 (173.37.135.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Sun, 1 Aug 2021
 23:35:59 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-003.cisco.com (173.37.135.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Sun, 1 Aug 2021 23:35:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7TuH/A1R5bFVuJus+6vLgO3JhuTYYCdTzVtBqLjqhZ01ZhLa2uaT3qQMw75eTuKmpIyr/P0ScNFaqTAnU7l91wqRqgfV+ga3Lfh5Y24co5kz+23YiCcQ9gT3729mS20OqAKQ+S2c24VSSIV4WWtxgk6msG5hOxJYNf9Hc6k9yS3YgY+2KlCINhmmcO/z2hvqo4j/vC1PzFIPUH+V9onFO3aDMkknarT/qbyRB7BiEzETqU7TdHIH+JatffX/UaCYqA9LqLRzgVio/54OQA4A1UDmIjK4P1plcXRKN1drZbMTAYjWpu7C5NKSLypmW3pZ/n/8NG78mam8js8bNG1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+fbfVpyIJPZQw+pJEVyoG8WW2erQ9xIiPIPxLVePB4=;
 b=UaogFKtTgfoEXDP0ZPQB0rXG+wwC0y0pfctXMqlKTHM7ufipO2wnHHqk0z0tII/eIMi7LcQnVGSEyOS1Z/d9hlHaNf3LBuTqHp+Ku542Pbf8DihFVY4M29aCf7VfL3BEyaMAz5sV+q+PAIO5Pmsyv5C5L1PzHmRoQ9UvQ2PKjpwKnD/o4OfIyP81LbTGFDTPjMkgvr8NYzZW7nn9HuupoIzBsBCwecz0zELgS7hI1J6aFrVcV7lPfk/YkvrcNEkVv77Qz9SqCKmCuEFvXZrLjz8CARoyvzAJ2HmIPmjqlTw923e8VJFUR71WqlaVyW6yoc8X8zZHHuVZnCCiPZK6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+fbfVpyIJPZQw+pJEVyoG8WW2erQ9xIiPIPxLVePB4=;
 b=BdBKBTjYQ9JimQWxRKfxl9p6FIZQ8hVS6v2/L6r4UMvKgdVy0f49zSZ7Jxb6chmmVUp2SGeUs7PFVVV6AcAfaC08moTSFZTcR/qFdsLlo596RzIabXIX4CLrrPoVmuYQ+dWEKD1/sdoHbVIgKx9R0FvM+zBpLw6tODN6EOdv3nc=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by BY5PR11MB4484.namprd11.prod.outlook.com (2603:10b6:a03:1c3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Mon, 2 Aug
 2021 04:35:57 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%4]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 04:35:57 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>,
        "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2021-20206
Thread-Topic: [meta-virtualization][hardknott][PATCH] kubernetes: fix
 CVE-2021-20206
Thread-Index: AQHXg9NDRiW1QOkeGUKT/euY4ee8+KtaDLIAgAHIhHCAA8V0gIAADU8A
Date: Mon, 2 Aug 2021 04:35:57 +0000
Message-ID: <SJ0PR11MB478445A9A6F6FF546B0FE288ADEF9@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210728170838.21526-1-sakib.sajal@windriver.com>
 <20210729145821.GC40673@gmail.com>
 <SJ0PR11MB47848F36E8CF4CD2EA403678ADEC9@SJ0PR11MB4784.namprd11.prod.outlook.com>
 <20210802034747.GB16820@gmail.com>
In-Reply-To: <20210802034747.GB16820@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc44780f-bca1-4a14-3470-08d9556f05d5
x-ms-traffictypediagnostic: BY5PR11MB4484:
x-microsoft-antispam-prvs: <BY5PR11MB4484999A50391E1E3EEFF9AAADEF9@BY5PR11MB4484.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UYA90io7iMARpV1X/l0nQ9uS4IakwvgwiqIKbdLt9XeZT0kMD+wTJnGsMsMjRg0QWIaqWNN26SoIbouP1oCzlxlU3b16EqW/34b5rAIstw9MM7pqNvmEoNNUyEYShM9qKQqxgEUFaHxD1l7npvNr00wmtA6fhpx3jbpLF5yWtr36UXvEsUcBQqvDps6zutfxexqAsZIGK1rC3HMKTrnkWVQHs93XIO46fUzYgeS3mLY7HtUhf71JA2uf2ARs33l0OvsUH3/YKBg1naVjfRjynlXo/Z7uj8cjll0zAPQz539NhXSGhoJ2KRVZlQbsLLA5s0WOUni1bA5J9A+rDnQFySt+6Srea8MO8hb7mViBXx1qyWyyhv+b3t070fdTqRpfvTL9jiG+xI/InH4RMH1ueFDzxzw2Y3QRC+utbc8QuQ78rXmUAlBpXhFy+ARioZGGkFIE+ZpnhUWrQVAw7O6WDIvGQNDR4Zy8rMza/UPUCPpor5w3shB9Zyty/LgPp6Xk4UZ/ycPrAG481IXun0zi/GOy2RJ3GUYrGACdo+TTWzUWmiV0k4DCkJpAFGNfUixYIMpt5O+lgZxvo6iJ6vKfHc+x0mNP4ISBWmh3xVhVmMQw6geqpM6CHuLkyRkhx3JosiijFI/sXVlEB7u9WhBE2Am/iIMFV8s18cNktH28wkTRutofSBOXGavS5GK6j71MEERcT1EE/zTIMzucbIMRI+QHXIB//XEYGQTDMAuuJ8KtHIabwHrIG1Xtv+TjXI6tYiyR3wIduqCzUcPeqiIoktz4jFr6tAKcIkOAEQ1xCoY/OeEZMwSmlHBlwl9cZwdnNssH555mFaN3KTccUdWxRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(8936002)(8676002)(7696005)(6916009)(76116006)(478600001)(55016002)(9686003)(71200400001)(38070700005)(33656002)(4326008)(2906002)(54906003)(26005)(186003)(66476007)(52536014)(5660300002)(83380400001)(64756008)(122000001)(66556008)(6506007)(66946007)(53546011)(86362001)(316002)(38100700002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rvRbCyfrrPNDyqHzF3ekXeQvJkNgHWdst2p/QxAuv7EXY8VvVNCVYm31rQhX?=
 =?us-ascii?Q?AMOWN43o5MId8EBuBimnE8J75yyz7IL7cV5JZSVmc7fa3dYGF516hx1FkWXo?=
 =?us-ascii?Q?wxJGLtBm+m9F3W5RsZJ59MuWZhVQS1zCXbCAl4Kv5SQOrqra5IV0BRzzGDpA?=
 =?us-ascii?Q?FsaGgNwA/ZvwLw52LINiqPn8VCy5rP173QrSRQ7iMORZ1dUcnBJhBYtFTURv?=
 =?us-ascii?Q?0ZElkL5BRzGAG1gNuQIRj+asbcufMYu3q1PHM603o7RzN5eCJpkKrBLAYoD8?=
 =?us-ascii?Q?Ca4C5JFelh5XlrwAbefEHHoMqf+dmShbwQA1sj1QFpoMtIL/sGqYG8FcU3uw?=
 =?us-ascii?Q?MLJyfpyNer8TjyJH5kLkidPHREtUfU1xbbKwFQXu+/V6bG5FPHf4/vWaBPKx?=
 =?us-ascii?Q?WYqj+A2tZ0v9m5G60Wd9X/7b97WYmCE1IHuYZDYmbQzqGCkwbQf8hA5tPe9e?=
 =?us-ascii?Q?cTRuLxgytHV8l5IhfbbV+sNYtTxH6XfLxFviMeKgOs270vFfW4YwCc1dmahz?=
 =?us-ascii?Q?mufEzehjs/d+mAzP+x+X8zWyUzw+aQJ+pFNowwIjy3Thc4iiYhggTPDmmIuw?=
 =?us-ascii?Q?/9nklfmF0JyNTopBc4OLznyxdMghaN1vya7eCjSyIkMq71CCrZ3A5XU/XWfI?=
 =?us-ascii?Q?B/yF/IiWIre622x2sxltTHYmG4ryibZZMvP21mRuNGxLBeFVlCU8I7IN2YWU?=
 =?us-ascii?Q?BGyxGxfGG7CiAo/wCR38DNGsn3w507mEGJ97x3yGB9KATJDDVIOdDHaD/IYF?=
 =?us-ascii?Q?w9YtIYkylfRq+ACj37nh1WgVcifbNjepQ3FoGZ9BCtU5W9arYJQv7YOFfYSy?=
 =?us-ascii?Q?oKKw1qygVMWY8kMbjuQ6ZLVfkKjs8LKtELqAbgppGrl1xKiD/tCGflu4F/M4?=
 =?us-ascii?Q?tHuJCARSALVSoAs2I59KFe1JEgT2o8EsO8YYZolRUiusRg+Lb4bcXkms5ol5?=
 =?us-ascii?Q?qOzE3ZqKoKJRYOOEcXU60LqCKb1+oyWxCJp9czcZlT5qAQ1a9mZDWvT5F5CX?=
 =?us-ascii?Q?WX+ykmYURd5z14uqEdKABOOnIMqj9H6AZyO8HM/cdTLC1vEz2rAcziHIvmI/?=
 =?us-ascii?Q?MhwG8SPnFCU6Q04aBuUFTr0b99ftAjagsqDoGeM8fbQUkHk7n6M6u7xDty/p?=
 =?us-ascii?Q?TiVWs1AY9QZ1Sxzqp24fZZa18fn5adbJ7K2yHVClKX27mt8TXddaZjzGhxYA?=
 =?us-ascii?Q?bXzUgbFbUCRyZY5TTgUjXbbTI7HFf5upbfjlufpmCARPYZrbtyNrJkJmb2n5?=
 =?us-ascii?Q?GFNCEp1Btecbt+o/TmAGrTasSR0l0rk/gyRxb52rvo5iFuReSnjbXt7Fgo6H?=
 =?us-ascii?Q?ujA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc44780f-bca1-4a14-3470-08d9556f05d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 04:35:57.5572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/kI0B31vLE+ArzklAaKQaXRU5EKDj98jk+wkVw5vHnHYk8FbEkuihU2IM2PJBys
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4484
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.19, xbe-aln-004.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I replied to the wrong message. Sorry for the confusion.

-----Original Message-----
From: Bruce Ashfield <bruce.ashfield@gmail.com>=20
Sent: Sunday, August 1, 2021 8:48 PM
To: Ruslan Babayev (fib) <fib@cisco.com>
Cc: sakib.sajal@windriver.com; meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-20=
21-20206

In message: RE: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE=
-2021-20206 on 30/07/2021 Ruslan Babayev (fib) wrote:

> Thanks Bruce!
>=20
> Can this be cherry-picked into Dunfell and other branches as well?

Was this meant to be in reply to the python bbappend patch you had sent ? I=
 assume so, since this one obviously cannot be cherry picked.

Bruce


>=20
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org=20
> <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce=20
> Ashfield
> Sent: Thursday, July 29, 2021 7:58 AM
> To: sakib.sajal@windriver.com
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][hardknott][PATCH] kubernetes: fix=20
> CVE-2021-20206
>=20
> merged.
>=20
> Bruce
>=20
> In message: [meta-virtualization][hardknott][PATCH] kubernetes: fix CVE-2=
021-20206 on 28/07/2021 sakib.sajal@windriver.com wrote:
>=20
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ---
> >  .../kubernetes/CVE-2021-20206.patch           | 92 +++++++++++++++++++
> >  .../kubernetes/kubernetes_git.bb              |  1 +
> >  2 files changed, 93 insertions(+)
> >  create mode 100644
> > recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> >=20
> > diff --git
> > a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > new file mode 100644
> > index 0000000..dc4e902
> > --- /dev/null
> > +++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
> > @@ -0,0 +1,92 @@
> > +From 5e8f9a8a72351e2fb5bcea3e3c58c935314557b6 Mon Sep 17 00:00:00
> > +2001
> > +From: Navid Shaikh <navids@vmware.com>
> > +Date: Thu, 6 May 2021 15:41:08 +0530
> > +Subject: [PATCH] Bump containernetworking/cni to v0.8.1
> > +
> > + Fix CVE-2021-20206
> > +CVE: CVE-2021-20206
> > +Upstream-Status: Backport=20
> > +[185f65fbddb5239666c0c67fb335589b7570f60c]
> > +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > +---
> > + go.mod                                                       | 4 ++--
> > + go.sum                                                       | 4 ++--
> > + vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 ++++=
+
> > + vendor/modules.txt                                           | 2 +-
> > + 4 files changed, 10 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/src/import/go.mod b/src/import/go.mod index
> > +e0ba549ab40..d4cc9ce01a9 100644
> > +--- a/src/import/go.mod
> > ++++ b/src/import/go.mod
> > +@@ -28,7 +28,7 @@ require (
> > + 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
> > + 	github.com/codegangsta/negroni v1.0.0 // indirect
> > + 	github.com/container-storage-interface/spec v1.2.0
> > +-	github.com/containernetworking/cni v0.8.0
> > ++	github.com/containernetworking/cni v0.8.1
> > + 	github.com/coredns/corefile-migration v1.0.10
> > + 	github.com/coreos/go-oidc v2.1.0+incompatible
> > + 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
> > +@@ -214,7 +214,7 @@ replace (
> > + 	github.com/containerd/go-runc =3D> github.com/containerd/go-runc v0.=
0.0-20180907222934-5a6d9f37cfa3
> > + 	github.com/containerd/ttrpc =3D> github.com/containerd/ttrpc v1.0.2
> > + 	github.com/containerd/typeurl =3D> github.com/containerd/typeurl v1.=
0.1
> > +-	github.com/containernetworking/cni =3D> github.com/containernetworki=
ng/cni v0.8.0
> > ++	github.com/containernetworking/cni =3D>=20
> > ++github.com/containernetworking/cni v0.8.1
> > + 	github.com/coredns/corefile-migration =3D> github.com/coredns/corefi=
le-migration v1.0.10
> > + 	github.com/coreos/bbolt =3D> github.com/coreos/bbolt v1.3.2
> > + 	github.com/coreos/etcd =3D> github.com/coreos/etcd=20
> > +v3.3.13+incompatible diff --git a/src/import/go.sum=20
> > +b/src/import/go.sum index 288f4554b1f..9168f49c859 100644
> > +--- a/src/import/go.sum
> > ++++ b/src/import/go.sum
> > +@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2
> > +h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
> > + github.com/containerd/ttrpc v1.0.2/go.mod=20
> > +h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=3D
> > + github.com/containerd/typeurl v1.0.1=20
> > +h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=3D
> > + github.com/containerd/typeurl v1.0.1/go.mod=20
> > +h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=3D
> > +-github.com/containernetworking/cni v0.8.0=20
> > +h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=3D
> > +-github.com/containernetworking/cni v0.8.0/go.mod=20
> > +h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=3D
> > ++github.com/containernetworking/cni v0.8.1=20
> > ++h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=3D
> > ++github.com/containernetworking/cni v0.8.1/go.mod=20
> > ++h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=3D
> > + github.com/coredns/corefile-migration v1.0.10=20
> > +h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=3D
> > + github.com/coredns/corefile-migration v1.0.10/go.mod=20
> > +h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=3D
> > + github.com/coreos/bbolt v1.3.2
> > +h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=3D
> > +diff --git
> > +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/f
> > +in
> > +d.go
> > +b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/f
> > +in d.go index e815404c859..e62029eb788 100644
> > +---
> > +a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/f
> > +in
> > +d.go
> > ++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invo
> > ++++ ke
> > ++++ /find.go
> > +@@ -18,6 +18,7 @@ import (
> > + 	"fmt"
> > + 	"os"
> > + 	"path/filepath"
> > ++	"strings"
> > + )
> > +=20
> > + // FindInPath returns the full path of the plugin by searching in=20
> > +the provided path @@ -26,6 +27,10 @@ func FindInPath(plugin string, pa=
ths []string) (string, error) {
> > + 		return "", fmt.Errorf("no plugin name provided")
> > + 	}
> > +=20
> > ++	if strings.ContainsRune(plugin, os.PathSeparator) {
> > ++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
> > ++	}
> > ++
> > + 	if len(paths) =3D=3D 0 {
> > + 		return "", fmt.Errorf("no paths provided")
> > + 	}
> > +diff --git a/src/import/vendor/modules.txt=20
> > +b/src/import/vendor/modules.txt index 6a263b51686..c3b68a5f547=20
> > +100644
> > +--- a/src/import/vendor/modules.txt
> > ++++ b/src/import/vendor/modules.txt
> > +@@ -257,7 +257,7 @@ github.com/containerd/containerd/pkg/dialer
> > + github.com/containerd/ttrpc
> > + # github.com/containerd/ttrpc =3D> github.com/containerd/ttrpc=20
> > +v1.0.2 # github.com/containerd/typeurl =3D>=20
> > +github.com/containerd/typeurl
> > +v1.0.1 -# github.com/containernetworking/cni v0.8.0 =3D>=20
> > +github.com/containernetworking/cni v0.8.0
> > ++# github.com/containernetworking/cni v0.8.1 =3D>=20
> > ++github.com/containernetworking/cni v0.8.1
> > + ## explicit
> > + # github.com/containernetworking/cni =3D>=20
> > +github.com/containernetworking/cni v0.8.0=20
> > +github.com/containernetworking/cni/libcni
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> > b/recipes-containers/kubernetes/kubernetes_git.bb
> > index bc694a2..7b9aab8 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -16,6 +16,7 @@ SRC_URI =3D "git://github.com/kubernetes/kubernetes.g=
it;branch=3Drelease-1.20;name=3Dk
> >             file://0001-generate-bindata-unset-GOBIN.patch \
> >            =20
> > file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch=20
> > \
> >            =20
> > file://0001-Makefile.generated_files-Fix-race-issue-for-installi.pat
> > ch
> > \
> > +           file://CVE-2021-20206.patch \
> >            "
> > =20
> >  DEPENDS +=3D "rsync-native \
> > --
> > 2.32.0
> >=20
>=20
> >=20
> >=20
> >=20
>=20
