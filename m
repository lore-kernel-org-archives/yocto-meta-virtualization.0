Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA33C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 12:39:41 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.8051.1681475979690382343
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 05:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=m0BDHuXk;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id c10so3299191iob.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681475979; x=1684067979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBxNOG7VYJlXRziOMATOl1YS7aJSDER3TvNCSmlcFKI=;
        b=m0BDHuXkW6vcSl6hg652AOdXrGk7NQ+juN3KHQcivUKJ0CHHCR+mw+iq1zFvGmrxDw
         yS1sJFDj/qohLXsMpqtDUYxnXc4wAUTFPxA8Yr1T2rzP/Boi48JKyn/DePls08VT8+4T
         Pe0XQ1kR5g7BP8kwSFCNV5HNM7UhaBX5FnKdO2b/otZJQ7rWmGrDNIcsWaUqmYwPI6nJ
         58mIoXwEeClCkV5CDujmTVYrklvYciGUyoPVF96a1dk/qegcPL5sxdCD6lcBFkdGa6Dm
         wA6WymL7n1kneOahNEN6f66iwnh/cAlzKhmPbkRUtIN048SF1ORJmmlekJdQygOp77bd
         yTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681475979; x=1684067979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBxNOG7VYJlXRziOMATOl1YS7aJSDER3TvNCSmlcFKI=;
        b=ehk6Zm8mJp/ZIGuh7WVz/7qJkipgaS2/QT2N4M3f+M3DUP8L3RAfNf9EAtz1BEL/g0
         FDyw8MKEG7xAi8gGYqaoPtho1F1iD++KuoHl/H/iSsphsrlgeI3U8wIrv2RlY3a97bTC
         4nXN4O4LAa38RJujiniqWBb2a4YRt550gIP/GJF05kHi37piDmBIIiQxBZmiVODOUgYV
         BaVddtchDaibPAS/iB+x/wImGU6fcKr/Go1ZwA/DDNus5DvOfkI0CexYw5IE6uwRvgqs
         JVN09k5x6oLPnd2MiAb7hFcglbFwgasdMbUrApWq7bXOR2OR/lpw/HpqXvOZ8xORP2Lm
         tXCQ==
X-Gm-Message-State: AAQBX9fMxfOBd4KvFe4AHvs7pzymYMW0muLZGGLl1jlXFURuVRb8Lji9
	fXk28IXoYRC7z6eLLTskVUDLE5OIiIh4W9dnRWg=
X-Google-Smtp-Source: AKy350ZnK2tNmUTPzbe6IaMoBDKvrAoHwdHu0NJhHLc/QhamfRM4a+otHtvDz6lm6Mc65elNCxHoGvcRfHvdqtEzJog=
X-Received: by 2002:a05:6638:10f6:b0:40b:c595:9424 with SMTP id
 g22-20020a05663810f600b0040bc5959424mr2080057jae.5.1681475978773; Fri, 14 Apr
 2023 05:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230321062823.2778260-1-wentao.zhang@windriver.com>
 <ZBzcFWsvOk8wbrns@gmail.com> <DB5PR02MB10213B569850FAB29A3C06EEFEF999@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213B569850FAB29A3C06EEFEF999@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Apr 2023 08:39:37 -0400
Message-ID: <CADkTA4P9k7rUT8ikiJ-QCn3FpDXgMH3pqrGsZ97HHOhwviFLpg@mail.gmail.com>
Subject: Re: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs with
 unsafe characters in is_valid_endpoint_url()
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Wentao Zhang <wentao.zhang@windriver.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 12:39:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7992

On Fri, Apr 14, 2023 at 12:21=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org> On Behalf Of Bruce Ashfield
> > Sent: den 24 mars 2023 00:09
> > To: Wentao Zhang <wentao.zhang@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org
> > Subject: Re: [meta-virtualization] [[PATCH] botocore: Fix rejecting URL=
s with unsafe characters in is_valid_endpoint_url()
> >
> > merged.
> >
> > Bruce
>
> Any reason not to update the version instead? The current version (1.20.5=
1)
> was released over two years ago. The latest release is 1.29.113.

That was my plan post release.

You'll almost always see me asking for uprev's versus patches, but I
don't have my own system level tests for botocore .. so I was playing
this one a bit more safely.

Bruce

>
> //Peter
>
> >
> > In message: [meta-virtualization] [[PATCH] botocore: Fix rejecting URLs=
 with unsafe characters in is_valid_endpoint_url()
> > on 21/03/2023 Wentao Zhang wrote:
> >
> > > The function is_valid_endpoint_url() in botocore is designed to valid=
ate
> > > endpoint URLs, but it fails to detect unsafe characters with Python 3=
.9.5+
> > > and other versions carrying bpo-43882 fix. The issue is caused by url=
split()
> > > silently stripping LF, CR, and HT characters while splitting the URL,
> > > which disarms the validator in botocore.
> > >
> > > This patch detects unsafe characters in is_valid_endpoint_url() and
> > > is_valid_ipv6_endpoint_url() early, in order to fix rejecting invalid=
 URLs
> > > with unsafe characters.
> > >
> > > Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> > > ---
> > >  ...Ls-with-unsafe-characters-in-is_vali.patch | 58 +++++++++++++++++=
++
> > >  .../python/python3-botocore_1.20.51.bb        |  2 +
> > >  2 files changed, 60 insertions(+)
> > >  create mode 100644 recipes-devtools/python/python3-botocore/0001-Fix=
-rejecting-URLs-with-unsafe-characters-in-is_vali.patch
> > >
> > > diff --git a/recipes-devtools/python/python3-botocore/0001-Fix-reject=
ing-URLs-with-unsafe-characters-in-is_vali.patch b/recipes-devtools/python/=
python3-botocore/0001-Fix-rejecting-URLs-with-unsafe-characters-in-is_vali.=
patch
> > > new file mode 100644
> > > index 0000000..6a43608
> > > --- /dev/null
> > > +++ b/recipes-devtools/python/python3-botocore/0001-Fix-rejecting-URL=
s-with-unsafe-characters-in-is_vali.patch
> > > @@ -0,0 +1,58 @@
> > > +From 370cdf7d708c92bf21a42f15392f7be330cf8f80 Mon Sep 17 00:00:00 20=
01
> > > +From: =3D?UTF-8?q?Micha=3DC5=3D82=3D20G=3DC3=3DB3rny?=3D <mgorny@gen=
too.org>
> > > +Date: Fri, 7 May 2021 19:54:16 +0200
> > > +Subject: [PATCH] Fix rejecting URLs with unsafe characters in
> > > + is_valid_endpoint_url() (#2381)
> > > +
> > > +Detect unsafe characters in is_valid_endpoint_url()
> > > +and is_valid_ipv6_endpoint_url() early, in order to fix rejecting
> > > +invalid URLs with Python 3.9.5+ and other versions carrying bpo-4388=
2
> > > +fix.  In these versions, urlsplit() silently strips LF, CR and HT
> > > +characters while splitting the URL, effectively disarming the valida=
tor
> > > +in botocore.
> > > +
> > > +The solution is based on a similar fix in Django.
> > > +
> > > +Fixes #2377
> > > +---
> > > + botocore/utils.py | 10 ++++++++++
> > > + 1 file changed, 10 insertions(+)
> > > +
> > > +diff --git a/botocore/utils.py b/botocore/utils.py
> > > +index 378972248..d35dd64bb 100644
> > > +--- a/botocore/utils.py
> > > ++++ b/botocore/utils.py
> > > +@@ -173,6 +173,10 @@ ZONE_ID_PAT =3D "(?:%25|%)(?:[" + UNRESERVED_PA=
T + "]|%[a-fA-F0-9]{2})+"
> > > + IPV6_ADDRZ_PAT =3D r"\[" + IPV6_PAT + r"(?:" + ZONE_ID_PAT + r")?\]=
"
> > > + IPV6_ADDRZ_RE =3D re.compile("^" + IPV6_ADDRZ_PAT + "$")
> > > +
> > > ++# These are the characters that are stripped by post-bpo-43882 urlp=
arse().
> > > ++UNSAFE_URL_CHARS =3D frozenset('\t\r\n')
> > > ++
> > > ++
> > > + def ensure_boolean(val):
> > > +     """Ensures a boolean value if a string or boolean is provided
> > > +
> > > +@@ -977,6 +981,8 @@ class ArgumentGenerator(object):
> > > +
> > > +
> > > + def is_valid_ipv6_endpoint_url(endpoint_url):
> > > ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> > > ++        return False
> > > +     netloc =3D urlparse(endpoint_url).netloc
> > > +     return IPV6_ADDRZ_RE.match(netloc) is not None
> > > +
> > > +@@ -990,6 +996,10 @@ def is_valid_endpoint_url(endpoint_url):
> > > +     :return: True if the endpoint url is valid. False otherwise.
> > > +
> > > +     """
> > > ++    # post-bpo-43882 urlsplit() strips unsafe characters from URL, =
causing
> > > ++    # it to pass hostname validation below.  Detect them early to f=
ix that.
> > > ++    if UNSAFE_URL_CHARS.intersection(endpoint_url):
> > > ++        return False
> > > +     parts =3D urlsplit(endpoint_url)
> > > +     hostname =3D parts.hostname
> > > +     if hostname is None:
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-devtools/python/python3-botocore_1.20.51.bb b/re=
cipes-devtools/python/python3-botocore_1.20.51.bb
> > > index ca506f6..f71db1f 100644
> > > --- a/recipes-devtools/python/python3-botocore_1.20.51.bb
> > > +++ b/recipes-devtools/python/python3-botocore_1.20.51.bb
> > > @@ -8,3 +8,5 @@ SRC_URI[sha256sum] =3D "c853d6c2321e2f2328282c7d49d7b=
1a06201826ba0e7049c6975ab5f22
> > >  inherit pypi setuptools3
> > >
> > >  RDEPENDS:${PN} +=3D "python3-jmespath python3-dateutil python3-loggi=
ng"
> > > +
> > > +SRC_URI +=3D "file://0001-Fix-rejecting-URLs-with-unsafe-characters-=
in-is_vali.patch"
> > > --
> > > 2.25.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

