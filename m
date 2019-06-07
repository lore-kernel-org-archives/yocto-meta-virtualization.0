Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFC06E00BAF; Thu,  6 Jun 2019 23:58:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.196 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ticotimo[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30699E00951
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 23:58:18 -0700 (PDT)
Received: by mail-it1-f196.google.com with SMTP id r135so1182404ith.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Jun 2019 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y9uQQcJ6mv0KSfvjfyngKROVS0H8HUqR3/I7z9QdMlU=;
	b=kW2j52Mn+hE/zX67jmjRYPpbB4h+WfZc4uk22YXt7sv2AbPV6ZTbu4ozgGgRIm6BvX
	v/sJEdH+PrSOpTUa9AaO3qqwtoR7bEnNBs7sWQ1XtBsW6pmBa1pf1+LtcwbEcstpk5IN
	Kxd4v7pVWgcyW/pyXGqxOI36S9iQndKOv/HBz/0sbwE4jJR645w8wteHqll+0/4W4A1N
	lz4sbulvSUTA6QDY4Uq3dutRxet551da79TZCiCd7sgV/1HErdfZN4AUzqQBjef4ImMb
	kvgQ8atIDXLOMhBDF5eRYNbsreEuMRL+dhe+MoYBf/3C3bLIaVSuhX8G9be8qZJ9dsAk
	0GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y9uQQcJ6mv0KSfvjfyngKROVS0H8HUqR3/I7z9QdMlU=;
	b=TEuJJJpBG5Uj9iggzXP2kbBaBIZUESTOl1kwlYBc/WwyC6YqoX1qjU7/v18g0bzq6C
	xwmrx9Eo8/7G6OIrwLnXNyM6r+SOlX7MJTWa7xVcYfjdAWsKhiEmudbXPJoRx1EHAza/
	KWz8DXVeUloZAn6rktplFbkr8S2CYPs8tvc2Foq7hFydPeE5F4tgj8tv4lk30cO1auMv
	6VT6s9fqyeRxdqmLNovTo961QMZvboOQpBomnc1sHqMxDHWi7N11AhYCJdVoXi4xtSB9
	gaOuNheO+5JrkONGHY6PbqG1cU4UhW7BN3FeaHwQu/V4Xl7A5YvhkMn1nbT98BXmE64l
	RI5w==
X-Gm-Message-State: APjAAAUQX1CGiiuB7diYI5vvEZgDpPF5xNcQxwU16rl52OD49LDaGRFN
	Od0MubLmsupGA6HrWKeYWEHqncsdNj7r3A6CXHo=
X-Google-Smtp-Source: APXvYqwCxTiVnqgJfTsY2mCTZDzYH2P7Jzxl996shDmIv+WAhqmdwrFvSdpbfLQ/IbPzDCPbaOyIcuSL6bWTrUBV9ic=
X-Received: by 2002:a02:a493:: with SMTP id d19mr30667960jam.22.1559890697646; 
	Thu, 06 Jun 2019 23:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190606025710.30112-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606025710.30112-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 6 Jun 2019 23:58:06 -0700
Message-ID: <CANx9H-D0YuUw5XX2oKo3=OeejdG6oNHk7vmygT3p2iSah7QW3Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-webtest: upgrade 2.0.29 -> 2.0.33
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jun 2019 06:58:18 -0000
Content-Type: multipart/alternative; boundary="000000000000ebf549058ab65af2"

--000000000000ebf549058ab65af2
Content-Type: text/plain; charset="UTF-8"

Please consider adding a python3 version as well.

On Wed, Jun 5, 2019 at 7:56 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-webtest_2.0.29.bb to python-webtest_2.0.33.bb.
>
> -License-Update: Changed the path of docs.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python-webtest_2.0.29.bb => python-webtest_2.0.33.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.29.bb
> => python-webtest_2.0.33.bb} (52%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-webtest_2.0.29.bb b/meta-openstack/recipes-devtools/python/
> python-webtest_2.0.33.bb
> similarity index 52%
> rename from meta-openstack/recipes-devtools/python/
> python-webtest_2.0.29.bb
> rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
> index c075a55..527f5c7 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> +++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "Helper to test WSGI applications"
>  HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://README.rst;md5=c7fb282fc7269ea1ef7dd689470b528b"
> +LIC_FILES_CHKSUM =
> "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
>
>  PYPI_PACKAGE = "WebTest"
>
>  RDEPENDS_${PN} += "python-beautifulsoup4"
>
> -SRC_URI[md5sum] = "30b4cf0d340b9a5335fac4389e6f84fc"
> -SRC_URI[sha256sum] =
> "dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccbd7e91d5d2a2580c922d"
> +SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
> +SRC_URI[sha256sum] =
> "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
>
>  inherit setuptools pypi
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000ebf549058ab65af2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider adding a python3 version as well.</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Jun 5, 2019 at 7:56 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@=
cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">-Upgrade from <a href=3D"http://python-webtest_2.0.2=
9.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.29.bb</a> to =
<a href=3D"http://python-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_b=
lank">python-webtest_2.0.33.bb</a>.<br>
<br>
-License-Update: Changed the path of docs.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python-webtest_2.0.29.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-webtest_2.0.29.bb</a> =3D&gt; <a href=3D"http://pyt=
hon-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_=
2.0.33.bb</a>}=C2=A0 | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-webtest_2.0.29.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2=
.0.29.bb</a> =3D&gt; <a href=3D"http://python-webtest_2.0.33.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-webtest_2.0.33.bb</a>} (52%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-webtest_2.0.29.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.=
0.29.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2=
.0.33.bb</a><br>
similarity index 52%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-webtest_2.0.29.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0=
.29.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-w=
ebtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.3=
3.bb</a><br>
index c075a55..527f5c7 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-webte=
st_2.0.29.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.29.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-webte=
st_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.33.bb=
</a><br>
@@ -2,13 +2,13 @@ DESCRIPTION =3D &quot;Helper to test WSGI applications&qu=
ot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/WebTest/" =
rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/WebTest/<=
/a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3Dc7fb282fc7269ea1ef7dd68=
9470b528b&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3De3e00192f000e33de99fd5a=
3cb32a8fc&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;WebTest&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;python-beautifulsoup4&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;30b4cf0d340b9a5335fac4389e6f84fc&quot;<br>
-SRC_URI[sha256sum] =3D &quot;dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccb=
d7e91d5d2a2580c922d&quot;<br>
+SRC_URI[md5sum] =3D &quot;dd0385c725b85ac1e8079f38d2acd7b1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;41348efe4323a647a239c31cde84e5e440d726ca4f449=
859264e538d39037fd0&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div></div>

--000000000000ebf549058ab65af2--
