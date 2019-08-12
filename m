Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A574E00D90; Mon, 12 Aug 2019 07:59:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69F2AE00D8C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:59:47 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id r9so98582056ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5mDwqK98/Nfed5xWgpCygPIkAoBU7RDYgQk3sq9JPEA=;
	b=LSaLX4nBzz/Ll32u9xYIDsCUoxZMb9tFT/zlq/4AzuuL1dWfPSlfnpD4GJ6jOnIRQr
	55/wdauLfe8iOMcb+rzjI4jcR3+usXYHIEWGEe7HlwRGyBBHrZ17Qo9TjL3PXSHniUop
	7J8Bnw+dhmdqGm6eAq4nnj82CoH9vdpny3mynBjr4NWvW3iG7bQfnhr4kYBMrXvgLmW2
	+EOsAQ9i/gduUUOipG/AFtMaUkjgdixq7jA0Gv8lC+tzHtOZ45iwWWehTaMx8O/wHi3Z
	TXnnsnADajyykxvrzUUglXJrIPDR6Kd/VrDWNJMp/E/cdBpGzejgUsHsV7qb7TNSO3wS
	OnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5mDwqK98/Nfed5xWgpCygPIkAoBU7RDYgQk3sq9JPEA=;
	b=GOwvxzq+MmbW2pCBdj73t6Y+J2/BS6BmsxLJ9/+NDcBpmKlSHfQw0QZmuaLEu1zjVT
	hS1BMrsQnFCLoiJVRJUfKgcn5Oi1X0vRWWMd6nYhz8qFIfHMMJ8f7EkQnei3NLdL300h
	aV1RP4UioXPxUEH5XVI3wwSDQTS3TYPFX7bYpEGD0DfmsysOwgg9IVvY3JpcrjP1w4bf
	ZAIqYpSh25QGeuUVuZ/8GAE7rocQr+8case0JKWUhXCC5VpCoxCkbaiH/e47JtAZBBra
	NEWXG2UsC2D0xu3gmtNKM6x0NktrFk1f1tgyWQYT87R/a2GxUJwxJ0Y6P8HPKxzH9oQt
	ibmg==
X-Gm-Message-State: APjAAAUAvu4z+k5oq/a8u1eDVqy2hjaFvy4Gk2hJkKZlg9ZisOtx82Qq
	n89S8dhOqfUuF5loKrOqZEEm8i6+8+GYy73Mfpc=
X-Google-Smtp-Source: APXvYqxWIyLiUjLciyX8e5Ed20pRdH1OqpxKuh11x+7LNeMIs5F6gB8UT3Ej28TCU0fbXEeaNK+CwCn8w9KrlVquKKw=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr12770795ljh.104.1565621986318; 
	Mon, 12 Aug 2019 07:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <1565597457-78893-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565597457-78893-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:59:34 -0400
Message-ID: <CADkTA4PA_aR+7130SKXw2-ifarStuFhgDU67b5uCQPDCq9ox7g@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-webtest: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 14:59:48 -0000
Content-Type: multipart/alternative; boundary="00000000000058de09058fecc616"

--00000000000058de09058fecc616
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 12, 2019 at 4:11 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Providing a python3 version of python-webtest.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-webtest.inc     | 12 ++++++++++++
>  .../python/python-webtest_2.0.33.bb                | 14 +-------------
>  .../python/python3-webtest_2.0.33.bb               |  2 ++
>  3 files changed, 15 insertions(+), 13 deletions(-)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-webtest.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-webtest_2.0.33.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-webtest.inc
> b/meta-openstack/recipes-devtools/python/python-webtest.inc
> new file mode 100644
> index 0000000..d4e9e07
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-webtest.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Helper to test WSGI applications"
> +HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
> +
> +PYPI_PACKAGE = "WebTest"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-beautifulsoup4"
> +
> +SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
> +SRC_URI[sha256sum] =
> "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
> diff --git a/meta-openstack/recipes-devtools/python/
> python-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/
> python-webtest_2.0.33.bb
> index 527f5c7..3a1fe90 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
> +++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.33.bb
> @@ -1,14 +1,2 @@
> -DESCRIPTION = "Helper to test WSGI applications"
> -HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM =
> "file://README.rst;md5=e3e00192f000e33de99fd5a3cb32a8fc"
> -
> -PYPI_PACKAGE = "WebTest"
> -
> -RDEPENDS_${PN} += "python-beautifulsoup4"
> -
> -SRC_URI[md5sum] = "dd0385c725b85ac1e8079f38d2acd7b1"
> -SRC_URI[sha256sum] =
> "41348efe4323a647a239c31cde84e5e440d726ca4f449859264e538d39037fd0"
> -
>  inherit setuptools pypi
> +require python-webtest.inc
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-webtest_2.0.33.bb b/meta-openstack/recipes-devtools/python/
> python3-webtest_2.0.33.bb
> new file mode 100644
> index 0000000..aaf0b42
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-webtest_2.0.33.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3 pypi
> +require python-webtest.inc
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000058de09058fecc616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 12, 2019 at 4:11 AM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fu=
jitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Providing a python3 version of python=
-webtest.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-webtest.inc=C2=A0 =C2=A0 =C2=A0| 1=
2 ++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-webtest_2.0.33.bb" rel=3D"norefer=
rer" target=3D"_blank">python-webtest_2.0.33.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +-------------<br>
=C2=A0.../python/<a href=3D"http://python3-webtest_2.0.33.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-webtest_2.0.33.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A03 files changed, 15 insertions(+), 13 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-webt=
est.inc<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python3-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-webtest_2.0.33.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-webtest.inc b/me=
ta-openstack/recipes-devtools/python/python-webtest.inc<br>
new file mode 100644<br>
index 0000000..d4e9e07<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-webtest.inc<br>
@@ -0,0 +1,12 @@<br>
+DESCRIPTION =3D &quot;Helper to test WSGI applications&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/WebTest/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/WebTest/</a>=
&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3De3e00192f000e33de99fd5a=
3cb32a8fc&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;WebTest&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-beautifulsoup4&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;dd0385c725b85ac1e8079f38d2acd7b1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;41348efe4323a647a239c31cde84e5e440d726ca4f449=
859264e538d39037fd0&quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.=
0.33.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2=
.0.33.bb</a><br>
index 527f5c7..3a1fe90 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-webte=
st_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.33.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-webte=
st_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python-webtest_2.0.33.bb=
</a><br>
@@ -1,14 +1,2 @@<br>
-DESCRIPTION =3D &quot;Helper to test WSGI applications&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/WebTest/" rel=
=3D"noreferrer" target=3D"_blank">https://pypi.python.org/pypi/WebTest/</a>=
&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3De3e00192f000e33de99fd5a=
3cb32a8fc&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;WebTest&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;python-beautifulsoup4&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;dd0385c725b85ac1e8079f38d2acd7b1&quot;<br>
-SRC_URI[sha256sum] =3D &quot;41348efe4323a647a239c31cde84e5e440d726ca4f449=
859264e538d39037fd0&quot;<br>
-<br>
=C2=A0inherit setuptools pypi<br>
+require python-webtest.inc<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-webtest_=
2.0.33.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon3-webtest_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-webte=
st_2.0.33.bb</a><br>
new file mode 100644<br>
index 0000000..aaf0b42<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-webt=
est_2.0.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-webtest_2.0.33.=
bb</a><br>
@@ -0,0 +1,2 @@<br>
+inherit setuptools3 pypi<br>
+require python-webtest.inc<br>
-- <br>
2.17.1<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000058de09058fecc616--
