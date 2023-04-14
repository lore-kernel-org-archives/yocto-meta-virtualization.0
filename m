Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B99C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 04:21:38 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1424.1681446096532420931
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Apr 2023 21:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kENtRq59;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681446097;
  x=1712982097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pkAr3hAZ0OL1mm1ImbPaGMfFjynqepN2NdnEQvCTra4=;
  b=kENtRq5919s22rAPkwf1quPK47LpbWJ+fL9399APG5mEBUwK9Im5ouuP
   fdHdQzyW/8RuIAUzPTmAnNd5XBmTlaFCHjxIXDpnMFxKUde9a3KaT4FwJ
   ldkre2L3sw/g01jnbKhMsO9CLongifc0W+m/KN80OLD8ZRYHj0vytv74X
   eq9ic3vjp8uele0XbE3Obq1/Jv2zE/5Ro/Y/gO+v6zTglkO5Jtbo5S6nB
   AUwU0DmiRyHJykHFehusp8NgG2wh39x3bKjEVOzS1iJAmlqNgHd+zPAOW
   A5ieACVXxDHxE5Ptf9T8oWNzkcPauhcwHXzxV1R0xnLkzo6u3x+CHa8VX
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7NvavmGb/Vo82wpW5SRMFY0Tr/iL3ZwXvNrjskOvhnuE5jbdU+dkKbh6PqrG+A7T0X654fmsUUe5E5ugEBCXjV2iuyuy5bcu8sm4d9iCbnRbOkK8GfroV9OJkqYJGtRYW10ODIbJUNU6XyCR1XoG56MdRNZxV6h6XpKboRWKCMaMsf0u8x6llEHV6PvDsJVAniCtQ11c+i7X8vG3kKL+UUrBOnglYj5mSN20WYhTUvIDVmvQ1nFIcJZY5clTpQ5p04gy8Ev6KGltID7ct3wjL1kvP8elLpnBPm+0k7S5IlelViRqvQQlqH1/Ok3bMmbsKQUPbtp3NPc4zf1jceKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkAr3hAZ0OL1mm1ImbPaGMfFjynqepN2NdnEQvCTra4=;
 b=IUPsBLglANKGNcHDUHl/e6aY7cP6vHodFZ/qR8IchNZpidvYt9YcWKX2mYQQ9UOncaQtzK7S0vUVP+lH2dZq7t/BTvaWG/CsWjCGZG9ROpM9I4THqpkmuvzIvPltuaIkqsIibITeXjoqbzKV/GtYKa/y9g1nz/n2tMNr3pmkR+BFzXQ9KOhFSHYBmdr0MFuReicdvhlaIURHIwi6rQp6q+9huRQ7anRZpxXHAh0GOWm5azslkpHpRpDpw/8KJiIOuOJVs+5IF1W4XUaYBzKMEpHqDdtbGqIIZkZ94wtOczPdCQWYUtl/iPqsUUDO43hQkaBeqAvlX/Bc6n16As2yXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkAr3hAZ0OL1mm1ImbPaGMfFjynqepN2NdnEQvCTra4=;
 b=C0dSemE8lgD1/p+O7N0jKEauDFB6pidMDeQQ03JByYZVPN6DHIA2/K4YXvQ9CCvozLutMWwjOHon0ma7DVP3ntJIcgfhUmzgP9/r8m7hBSlaJ61XpnXVuv2NSYVYAFtQq86LrzjlO/w5a3uyAXbdwyudSxFR7FOEi8TyAbXocm4=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Wentao Zhang
	<wentao.zhang@windriver.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs with
 unsafe characters in is_valid_endpoint_url()
Thread-Topic: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs with
 unsafe characters in is_valid_endpoint_url()
Thread-Index: AQHZW76PgieVsW34UE6mwd3kKsQgIK8JAXWAgCFWJ4A=
Date: Fri, 14 Apr 2023 04:21:32 +0000
Message-ID: <DB5PR02MB10213B569850FAB29A3C06EEFEF999@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230321062823.2778260-1-wentao.zhang@windriver.com>
 <ZBzcFWsvOk8wbrns@gmail.com>
In-Reply-To: <ZBzcFWsvOk8wbrns@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB7101:EE_
x-ms-office365-filtering-correlation-id: 50604160-fa09-45ee-7261-08db3c9fba30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZ1zxLTSssgnnOaW5W04TNiXFr01QFOoCcAoDJZV+oK6xOINwwePHYIq4t2i4zEqXlymL6K3rNywa/LiLUKfB+p5Xi/qi/ruiTN7nyKMU6fJDPyZHmDxb7ZLixGQWWtUO+L+8JIu5pnchpEPXUuCheBucxBXs8aGyUQFJEsu0FTqZ3wHHQitdnMAABcofCI0BmBY5MJ/1hEsW3zB6G5hWNfGbZCGOcGYW52mzZdKUlkig524VdPTyTJUxm8FK0EL8Jvy82Tg8SyEwSHiCURlRVvZ6niadNegEWDvUAfTHuxN87K3dHdH5crc8xsYM8ovMd7v0N+TjjmyWgeKsM+WvEsAtz07qH7Hy0BJ7gnNz+xuC+rvSMDKMZVyLYTqsjvlQ0cOLa8kqYA1pizW+YC1WYnYS4wAl1XCTu0Pnt6JgFhto73j9XmYtU2qLQY/ha2EZs+7P6xsvxoO1NAVnmBdg1CxpUJKIB9D3I1QSl2m6r7Y4tJjiUgzsHTgqc2jWgC/Eu6O21FiXiNtlfmwyEW6OJraQtfp5f+oftDg1F9xPAPI2tlKFX+604KhY6kt3+R+mSHmLqEJoM75OqG9BThz+QVyhjrCDOCtUif8676yJ5MXLpKHXBkbKNops756I0vl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(38070700005)(9686003)(26005)(186003)(6506007)(53546011)(33656002)(478600001)(55016003)(110136005)(122000001)(2906002)(8676002)(8936002)(83380400001)(41300700001)(44832011)(5660300002)(52536014)(38100700002)(316002)(4326008)(66946007)(66556008)(76116006)(66476007)(64756008)(66446008)(86362001)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o7zIOU8R9OTB6t5KXBjRk+psRjB2yb4Tm8ZnVVHUNsua6U/D7Y/LUoRV1gPa?=
 =?us-ascii?Q?q9GEUW3RE576MNK5e/lvZFsfeOGCp88lERcoMSGUjS2QPS3lELBtpuTDadJ3?=
 =?us-ascii?Q?1ORTorQtjBDEUIdWjA0HPOsBuwws/i13/iyN+17raJwdHQhdxhsUyt7mP1ck?=
 =?us-ascii?Q?VWS92lH6DKNxBDD41a53YDXHQyf8sDGZTCS0tsJe8wYwlfPufYNNEaBqw9oY?=
 =?us-ascii?Q?M4+Cu5t/PgmbdTP+SYH8XupU0MBn/Kj2ZuA3w8NHXy3W29rxMsYAnbZ36NbK?=
 =?us-ascii?Q?HDzZZomGmt6hXnmflMEEUF+COII+X5AR9efIwlZwkC170QTPwKAAAWbmk1a4?=
 =?us-ascii?Q?3WdOR2YfdigZjczWuHweEsxNjRaON27FhcakS2S8X72S7J2ostOVVOkWAr4O?=
 =?us-ascii?Q?BqRVMAXrbBTpEyqiUogHXU+sx4f79R2GN/vTXU1eNb58XEbWNaRo0a3XytCl?=
 =?us-ascii?Q?CvdosA8ZNnHhcddbFKOOPX13qIBL5MFnShT/zm0ahfYUneQ7eWZgfcmg5oVO?=
 =?us-ascii?Q?36JgCvdRNGYfVYpHGGSwCE1uSqNmVOoY5Ylew9LlCM0N6gA/bFp6YIBMN3WZ?=
 =?us-ascii?Q?AqxdC3STkGk1wwQMv2R7N4gIwM1kavMh9Gp4P74sOZ3BIErRDxXP31j4VqGK?=
 =?us-ascii?Q?8LYTeay/mSlteIj5wz4Hab6ojqQXN6DSuS0TjxYoPA/RR66orBkUook3u4Iv?=
 =?us-ascii?Q?r5Ot0eXCM9XKdl2nWXjUt3tbEogPhXurEHjb/aJ+I4tqGXedkjTkaynPEWVS?=
 =?us-ascii?Q?/v9KXm2dd+sS9JpwzX0RtqW9O4ia8sZfjaUQmx2iQdqqp+eZvL2liV83d2Mu?=
 =?us-ascii?Q?e0BT3ANLTW3jLTKAXWK0vVPjtbrgAWnJXi3r23vdHjaE5SveUR3gTcC7ttMW?=
 =?us-ascii?Q?ox1vwxdx6QXPDdSPUN8ytXzfv0C3/6pEH9SSV0HHg3YdBURx+p2BF9hSANLH?=
 =?us-ascii?Q?jbk97JW4LEmbB2pkjHayRScAVEF/YMWY+yurmdXxhE+REmKCoZd9xHqu0xVn?=
 =?us-ascii?Q?NkMlfYIuGALzIWwv0lZxHixoobpVo1c+RZSAoQM5cz3FMTGQBO/mVfTp7/uG?=
 =?us-ascii?Q?ELhBqnm6bmJMwWa/rfhTDAGZv2mhRwI/MQ6vsIamvfk6ubmuxmsxKB6Zuwo2?=
 =?us-ascii?Q?erI+5h1qLccwoDUCfLNqGXXKIc5P+MNRbjWryb4FHi+ywobiFznQqv1kXwnM?=
 =?us-ascii?Q?QV3w2c/0dPdAOslhLgZnBDFkD4FU0BGX4EmRCwGPW+bj8kzUxuWSKb8WEPwY?=
 =?us-ascii?Q?WISm2Nfokth50YRp460FNhpK2oOkUZbDPNrKfdYn19d+CuvVEUMlNtzN9M+G?=
 =?us-ascii?Q?hUiH6rIi6Rr0sbW6zgT7LH1sHEixGJpb16PNR9cU2gzpmbgLSkCyafSPwO6g?=
 =?us-ascii?Q?G83vLDvnNd+sTdSGztjxEFkuG5/ewYDv0DS0e9VXs/nxpO9e1tSuZzSWgm08?=
 =?us-ascii?Q?ImnNvIQ0uneW8jkJRaYOyoDeSKrysE4iqbc8jM6pvHoMbYHhD7DGiTc8B+Km?=
 =?us-ascii?Q?zOhe2jEXB9jR9EFFv9UTTRoYca6wegb/Qz7sUJGw4qZN+jPKdApQDxRCISMU?=
 =?us-ascii?Q?EgJUEFvHwFxAf+RIDto=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50604160-fa09-45ee-7261-08db3c9fba30
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 04:21:32.4148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6nr8lOW7OyQ6xdgNNJeM8Eorgh3M9sP7fBWfQNxp9jzccfWx7pvR1rke36V0INCx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7101
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 04:21:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7990

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> On Behalf Of Bruce Ashfield
> Sent: den 24 mars 2023 00:09
> To: Wentao Zhang <wentao.zhang@windriver.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs =
with unsafe characters in is_valid_endpoint_url()
>=20
> merged.
>=20
> Bruce

Any reason not to update the version instead? The current version (1.20.51)=
=20
was released over two years ago. The latest release is 1.29.113.

//Peter

>=20
> In message: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs w=
ith unsafe characters in is_valid_endpoint_url()
> on 21/03/2023 Wentao Zhang wrote:
>=20
> > The function is_valid_endpoint_url() in botocore is designed to validat=
e
> > endpoint URLs, but it fails to detect unsafe characters with Python 3.9=
.5+
> > and other versions carrying bpo-43882 fix. The issue is caused by urlsp=
lit()
> > silently stripping LF, CR, and HT characters while splitting the URL,
> > which disarms the validator in botocore.
> >
> > This patch detects unsafe characters in is_valid_endpoint_url() and
> > is_valid_ipv6_endpoint_url() early, in order to fix rejecting invalid U=
RLs
> > with unsafe characters.
> >
> > Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> > ---
> >  ...Ls-with-unsafe-characters-in-is_vali.patch | 58 +++++++++++++++++++
> >  .../python/python3-botocore_1.20.51.bb        |  2 +
> >  2 files changed, 60 insertions(+)
> >  create mode 100644 recipes-devtools/python/python3-botocore/0001-Fix-r=
ejecting-URLs-with-unsafe-characters-in-is_vali.patch
> >
> > diff --git a/recipes-devtools/python/python3-botocore/0001-Fix-rejectin=
g-URLs-with-unsafe-characters-in-is_vali.patch b/recipes-devtools/python/py=
thon3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.pa=
tch
> > new file mode 100644
> > index 0000000..6a43608
> > --- /dev/null
> > +++ b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URLs-=
with-unsafe-characters-in-is_vali.patch
> > @@ -0,0 +1,58 @@
> > +From 370cdf7d708c92bf21a42f15392f7be330cf8f80 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Micha=3DC5=3D82=3D20G=3DC3=3DB3rny?=3D <mgorny@gento=
o.org>
> > +Date: Fri, 7 May 2021 19:54:16 +0200
> > +Subject: [PATCH] Fix rejecting URLs with unsafe characters in
> > + is_valid_endpoint_url() (#2381)
> > +
> > +Detect unsafe characters in is_valid_endpoint_url()
> > +and is_valid_ipv6_endpoint_url() early, in order to fix rejecting
> > +invalid URLs with Python 3.9.5+ and other versions carrying bpo-43882
> > +fix.  In these versions, urlsplit() silently strips LF, CR and HT
> > +characters while splitting the URL, effectively disarming the validato=
r
> > +in botocore.
> > +
> > +The solution is based on a similar fix in Django.
> > +
> > +Fixes #2377
> > +---
> > + botocore/utils.py | 10 ++++++++++
> > + 1 file changed, 10 insertions(+)
> > +
> > +diff --git a/botocore/utils.py b/botocore/utils.py
> > +index 378972248..d35dd64bb 100644
> > +--- a/botocore/utils.py
> > ++++ b/botocore/utils.py
> > +@@ -173,6 +173,10 @@ ZONE_ID_PAT =3D "(?:%25|%)(?:[" + UNRESERVED_PAT =
+ "]|%[a-fA-F0-9]{2})+"
> > + IPV6_ADDRZ_PAT =3D r"\[" + IPV6_PAT + r"(?:" + ZONE_ID_PAT + r")?\]"
> > + IPV6_ADDRZ_RE =3D re.compile("^" + IPV6_ADDRZ_PAT + "$")
> > +
> > ++# These are the characters that are stripped by post-bpo-43882 urlpar=
se().
> > ++UNSAFE_URL_CHARS =3D frozenset('\t\r\n')
> > ++
> > ++
> > + def ensure_boolean(val):
> > +     """Ensures a boolean value if a string or boolean is provided
> > +
> > +@@ -977,6 +981,8 @@ class ArgumentGenerator(object):
> > +
> > +
> > + def is_valid_ipv6_endpoint_url(endpoint_url):
> > ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> > ++        return False
> > +     netloc =3D urlparse(endpoint_url).netloc
> > +     return IPV6_ADDRZ_RE.match(netloc) is not None
> > +
> > +@@ -990,6 +996,10 @@ def is_valid_endpoint_url(endpoint_url):
> > +     :return: True if the endpoint url is valid. False otherwise.
> > +
> > +     """
> > ++    # post-bpo-43882 urlsplit() strips unsafe characters from URL, ca=
using
> > ++    # it to pass hostname validation below.  Detect them early to fix=
 that.
> > ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> > ++        return False
> > +     parts =3D urlsplit(endpoint_url)
> > +     hostname =3D parts.hostname
> > +     if hostname is None:
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-devtools/python/python3-botocore_1.20.51.bb b/reci=
pes-devtools/python/python3-botocore_1.20.51.bb
> > index ca506f6..f71db1f 100644
> > --- a/recipes-devtools/python/python3-botocore_1.20.51.bb
> > +++ b/recipes-devtools/python/python3-botocore_1.20.51.bb
> > @@ -8,3 +8,5 @@ SRC_URI[sha256sum] =3D "c853d6c2321e2f2328282c7d49d7b1a=
06201826ba0e7049c6975ab5f22
> >  inherit pypi setuptools3
> >
> >  RDEPENDS:${PN} +=3D "python3-jmespath python3-dateutil python3-logging=
"
> > +
> > +SRC_URI +=3D "file://0001-Fix-rejecting-URLs-with-unsafe-characters-in=
-is_vali.patch"
> > --
> > 2.25.1


