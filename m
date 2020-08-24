Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.194218.1598273989474482734
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 05:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SQfpGJfm;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C43DE02087; Mon, 24 Aug 2020 05:59:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.218.44 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99413E0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 05:59:46 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id j25so2594745ejk.9
        for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vhiALzjKZ45tnL9+0DkqOdImu0c7qFNFIgRgWcpjrzc=;
        b=SQfpGJfmbuNsHlhrUOATtm03sbSQRJ+BhOW7qc9rYe5GozE/FrZd8keAUSazAYhNVZ
         poh13dhK4YAvd9jSy6yG1TE+WuMtCf9bl2D5d2XoLFJjkOiMXeJ/EW/buSUh5/hYECVq
         XYpvYJDYCeOuqIDBmMb96kD7e3f4jcvpDJLWnA6atMerTYPDEyVV6oa5AJQhnHgstLEO
         3JzkNuRUJIy1cHyr8im8m6QdC41UVzq+5aEQj9t2VBtWDwHd4ndVjArYSf2rPrzj2vhp
         VVj1hf+GYqBKVHZnmGpexz2uyWp/hjPPuZlq2TGeKBVCCJVrlsuNZ+DbsdbrnN1KrODh
         b0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vhiALzjKZ45tnL9+0DkqOdImu0c7qFNFIgRgWcpjrzc=;
        b=UCVRpjGxaT79WsS1kBg37HcvTLWC+jlKVZp3XYR3x301ZlybLgGzse8T7yIffkVhL9
         wgWgD5jzXxh9Qw2wB6OP3rgBPxBGj7IHU0KW2+WoP8bDOzPHrtWl+QGcyfJvTMGalDkc
         JtKzt1Ssaf7nVbrhfMrc8dHV0GdSRx1YIBIwARZGzNrjKiCgJkzBdhhjd0tKVA78Ax2N
         IglOnB8hr8Fxi1M50M5kPSi1Ch6KHZShU78lTwofFA7KdAAeSMxgW+cDx5SCCUxfcwg5
         JDjHsGNZ/03VoCDYnzn+0srfzShTsGxAwYlLOWb4yHH8bULq5qVLejComTGoCU3Mhrdx
         Lymw==
X-Gm-Message-State: AOAM533d7dNlTHR3A88ryXZWyhFOzATvNYiv4dv00uC4wVXbKsTK7SpY
	RyCv5vWlvOOidmrbzsbhajcutv/aiQoaPrk8Oc8=
X-Google-Smtp-Source: ABdhPJzr5rF+NhaxOAzGryaOwCekWAaownxxPIbj+ou0EaRN20kNIZQW0C2mj3JNYvyom7dRlbrq6mBGVf6P33+FjAA=
X-Received: by 2002:a17:906:554:: with SMTP id k20mr5389524eja.334.1598273985608;
 Mon, 24 Aug 2020 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <1598289989-121800-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1598289989-121800-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 24 Aug 2020 08:59:34 -0400
Message-ID: <CADkTA4OQkdy2REP6ezyOQica9HSzEDdqb0eUb+9T=Cg0HQVACg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-angular-cookies: Remove python recipe
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002a808d05ad9f2970"

--0000000000002a808d05ad9f2970
Content-Type: text/plain; charset="UTF-8"

For the remove patches, we need to be logging why something is being
dropped.

Is this replaced by the updated angular-xstatic recipe ? Is it no longer
required ? Is the recipe coming from somewhere else ?

Bruce

On Mon, Aug 24, 2020 at 4:27 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
> ---
>  .../python/python-xstatic-angular-cookies.inc | 22 -----------------
>  .../python-xstatic-angular-cookies_1.2.1.1.bb |  2 --
>  ...python3-xstatic-angular-cookies_1.2.1.1.bb | 24 +++++++++++++++++--
>  3 files changed, 22 insertions(+), 26 deletions(-)
>  delete mode 100644
> meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-angular-cookies_1.2.1.1.bb
>
> diff --git
> a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
> b/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
> deleted file mode 100644
> index bc3923b..0000000
> ---
> a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookies.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
> -
> -PYPI_PACKAGE = "XStatic-Angular-Cookies"
> -
> -SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
> -SRC_URI[sha256sum] =
> "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
> -
> -inherit pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> -# RDEPENDS_default:
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/
> python-xstatic-angular-cookies_1.2.1.1.bb
> b/meta-openstack/recipes-devtools/python/
> python-xstatic-angular-cookies_1.2.1.1.bb
> deleted file mode 100644
> index ee9591a..0000000
> --- a/meta-openstack/recipes-devtools/python/
> python-xstatic-angular-cookies_1.2.1.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-angular-cookies.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-cookies_1.2.1.1.bb
> b/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-cookies_1.2.1.1.bb
> index ee9591a..001bde9 100644
> --- a/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-cookies_1.2.1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-cookies_1.2.1.1.bb
> @@ -1,2 +1,22 @@
> -require python-xstatic-angular-cookies.inc
> -inherit setuptools3
> +DESCRIPTION = "Angular-Cookies JavaScript library packaged for setuptools"
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-Cookies"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=70856f1d03d62a3e0c0cb1b7f8c7fd00"
> +
> +PYPI_PACKAGE = "XStatic-Angular-Cookies"
> +
> +SRC_URI[md5sum] = "a67066fac5dfe9774ab163d44e5a896a"
> +SRC_URI[sha256sum] =
> "c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c"
> +
> +inherit setuptools3 pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default:
> +RDEPENDS_${PN} += " \
> +        "
> --
> 2.25.1
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002a808d05ad9f2970
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">For=
 the remove patches, we need to be logging why something is being dropped.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Is this replaced by the u=
pdated angular-xstatic recipe ? Is it no longer required ? Is the recipe co=
ming from somewhere else ?</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Aug 24, 2020 at 4:27 AM zhengruoqin &lt;<a href=3D"mai=
lto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: =
Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_=
blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;/<br>
---<br>
=C2=A0.../python/python-xstatic-angular-cookies.inc | 22 -----------------=
<br>
=C2=A0.../<a href=3D"http://python-xstatic-angular-cookies_1.2.1.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python-xstatic-angular-cookies_1.2.1.1.b=
b</a> |=C2=A0 2 --<br>
=C2=A0...<a href=3D"http://python3-xstatic-angular-cookies_1.2.1.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-xstatic-angular-cookies_1.2.1.1.=
bb</a> | 24 +++++++++++++++++--<br>
=C2=A03 files changed, 22 insertions(+), 26 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/python-xst=
atic-angular-cookies.inc<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-xstatic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python-xstatic-angular-cookies_1.2.1.1.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular=
-cookies.inc b/meta-openstack/recipes-devtools/python/python-xstatic-angula=
r-cookies.inc<br>
deleted file mode 100644<br>
index bc3923b..0000000<br>
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-cookie=
s.inc<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-DESCRIPTION =3D &quot;Angular-Cookies JavaScript library packaged for set=
uptools&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Angula=
r-Cookies" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pyp=
i/XStatic-Angular-Cookies</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D70856f1d03d62a3e0c0cb1b7=
f8c7fd00&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;XStatic-Angular-Cookies&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;a67066fac5dfe9774ab163d44e5a896a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c8fc1a52549c601809fc9f25144e4fd346820412b643=
0e89256e7ec71fce0b4c&quot;<br>
-<br>
-inherit pypi<br>
-<br>
-# DEPENDS_default: python-pip<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-# RDEPENDS_default: <br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-xstatic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-xstatic-angular-cookies_1.2.1.1.bb</a> b/meta-openstack/recipes-dev=
tools/python/<a href=3D"http://python-xstatic-angular-cookies_1.2.1.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python-xstatic-angular-cookies_1.2.1.1.=
bb</a><br>
deleted file mode 100644<br>
index ee9591a..0000000<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-xsta=
tic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
-xstatic-angular-cookies_1.2.1.1.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require python-xstatic-angular-cookies.inc<br>
-inherit setuptools3<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on3-xstatic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-xstatic-angular-cookies_1.2.1.1.bb</a> b/meta-openstack/recipes-d=
evtools/python/<a href=3D"http://python3-xstatic-angular-cookies_1.2.1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-xstatic-angular-cookies_1.2.=
1.1.bb</a><br>
index ee9591a..001bde9 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-xstatic-angular-cookies_1.2.1.1.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-angular-cookies_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-xstatic-angular-cookies_1.2.1.1.bb</a><br>
@@ -1,2 +1,22 @@<br>
-require python-xstatic-angular-cookies.inc<br>
-inherit setuptools3<br>
+DESCRIPTION =3D &quot;Angular-Cookies JavaScript library packaged for set=
uptools&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Angula=
r-Cookies" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pyp=
i/XStatic-Angular-Cookies</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D70856f1d03d62a3e0c0cb1b7=
f8c7fd00&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;XStatic-Angular-Cookies&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;a67066fac5dfe9774ab163d44e5a896a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c8fc1a52549c601809fc9f25144e4fd346820412b643=
0e89256e7ec71fce0b4c&quot;<br>
+<br>
+inherit setuptools3 pypi<br>
+<br>
+# DEPENDS_default: python-pip<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# RDEPENDS_default: <br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--0000000000002a808d05ad9f2970--
