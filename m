Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.8991.1636628756255114296
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 03:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=SN+j2sGA;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636628756;
  x=1668164756;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LoMQ4tnqLD3w32OPEERIyUdNSIGTyOu7QpJ5qL3FBco=;
  b=SN+j2sGAynNiGwxV9Gyzf88o7yfuZHKYPFF/4LhbJ0mkop5kJKGFW7z9
   OXwfJU0W06l7/kX8tZuQSDz+iy/vh+jBmzJsRIhQxIfzCGXeykIJAiTiH
   IK6HoV4zcAoFW60XSqUkDJ6tXVcO3QWCvlN8nSYknn8qME6da1ClTnYKo
   wKl5xYHm24N87W0phj1H/UVEVhbbKLYZS4wyusj5Gj8lIXGlk+jrDRFpm
   sqp4eCD2wFpWZMCX8BvZBmnAVwXRqzo74XuKKkMcik/5L9pzFqhAtJhO+
   z69s7pSVkQWEmYxdxKaix13J2cUf/6l4pgy0gJ9pDW5VwvLPxdeOZm/jP
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: kai <kai.kang@windriver.com>, "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit branch
Thread-Topic: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add
 explicit branch
Thread-Index: AQHX1uP7gDaR48EWp0KRqxauJ2vGR6v+KhoQ
Date: Thu, 11 Nov 2021 11:05:53 +0000
Message-ID: <8552b0e951af4cd1b9a0a7d945ccef85@axis.com>
References: <20211111100725.38963-1-kai.kang@windriver.com>
In-Reply-To: <20211111100725.38963-1-kai.kang@windriver.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-
> virtualization@lists.yoctoproject.org> On Behalf Of kai
> Sent: den 11 november 2021 11:07
> To: meta-virtualization@lists.yoctoproject.org
> Subject: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explici=
t
> branch
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Add explicit branch master for concurrent-ruby as the same for other
> recipes.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.b=
b
> b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> index a328203e..61a2c598 100644
> --- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> +++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.concurrent-ruby.com"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dfde65ae93d18826f70c6fe125aa04297"
>=20
> -SRC_URI =3D "git://github.com/ruby-concurrency/concurrent-ruby.git;proto=
col=3Dhttps;tag=3Dv1.1.6\
> +SRC_URI =3D "git://github.com/ruby-concurrency/concurrent-ruby.git;proto=
col=3Dhttps;tag=3Dv1.1.6;branch=3Dmaster \

While at it, why not remove the tag=3D and replace it with a proper=20
SRCREV =3D "<sha1>"?

>  	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 2.17.1

//Peter

