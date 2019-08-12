Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59FD9E00D8C; Mon, 12 Aug 2019 07:59:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.53 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E74E1E00961
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:59:36 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id b17so74437653lff.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tPEs64BmtiVOLQPFHybImatuaaU0YaRQAp16jRNsZFU=;
	b=AfTNEsWsdvmxHTbfcg2XFNqLHLGC0GiLI42yOJnVsdej0BUC9atxIp3Gv8xl/jXR42
	nKlpBd0m2/m4juZ9tN6RxZ0BdXlJ9JxPlLOy08uobbb76StEo7ut3pde8WcVVdyeSlGQ
	tqBk7wSFynBXWMwiD5JqfAvaf36gGAcx72iq7BIpXpSIbF854nDNd05VKckvBwGSlC6u
	8/8FkqgF/G1nQgG2zjhYN4g9M/cwKbJ8vbikZ9d3rDyMItjlBwE3b0RnINnCbBfYz5ow
	lS5ISrGwiSUTU4D6qNg90ss1QikYetuoiV7e3aWJr7oYzphv7z3H5e5jn3ZFzGE1kvn2
	VsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tPEs64BmtiVOLQPFHybImatuaaU0YaRQAp16jRNsZFU=;
	b=FaKeazqxSfP2N2xnE47TDvG7RLd3o54ArxsGOYEZ5gfHcZ4vv1x3PrUEYo/EiXTaf8
	auol8B+pERfn2K+mks6yJlpck+WGvNDVI83rx//Rx4LHPeWsbOsGJvEjNvTzDS8Wf2d0
	kAv6wCgJ0Yi+rF38ff5baS26MkF3EoGyR1ejIldNF3ULrGEJFQohxO7Ud9e+18SSEQnt
	ckYrOyy75tQ7U/wP7pk+JrNiAZYr7k5KIKPD5JlbSaMv8w8jsQihoeqIT7+62feJEGqA
	wgPjCSqovy1XUkB+3JqpUA6WEjmxN985Aqne5JBswv9j5sJQyy4oIhO8Ef6l/uUtad0u
	DzZQ==
X-Gm-Message-State: APjAAAXF9nIc+aXKLF69orElT8Cj03aLvHxDsQUDO8PVdYSZRiwriIMm
	m89bbxRfMcdlsur+QYZNdDAqO+sNcM21Ztf1oK/ZIo8/BfQ=
X-Google-Smtp-Source: APXvYqykiCXF9VLdKmTN7/NnquY9zCbZde8YBsdPTYNfshzgCcW0XK9ttXOYskKP2q10aVAvi1A/zmxX2BErAFvxuzI=
X-Received: by 2002:ac2:560b:: with SMTP id v11mr8346285lfd.177.1565621975289; 
	Mon, 12 Aug 2019 07:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <1565597430-78846-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565597430-78846-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:59:23 -0400
Message-ID: <CADkTA4O3U4oNtM6=QmsRDdZ_QwxGq0cQ503XrLF3iSu4ke=ReQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-wsme: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 14:59:39 -0000
Content-Type: multipart/alternative; boundary="000000000000b0931a058fecc53e"

--000000000000b0931a058fecc53e
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 12, 2019 at 4:10 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Providing a python3 version of python-wsme.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-wsme.inc   | 24 +++++++++++++++++
>  .../python/python-wsme_0.9.3.bb               | 26 +------------------
>  .../python/python3-wsme_0.9.3.bb              |  2 ++
>  3 files changed, 27 insertions(+), 25 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-wsme.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-wsme_0.9.3.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme.inc
> b/meta-openstack/recipes-devtools/python/python-wsme.inc
> new file mode 100644
> index 0000000..b402a09
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-wsme.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Simplify the writing of REST APIs, and extend them with
> additional protocols"
> +HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
> +
> +PYPI_PACKAGE = "WSME"
> +
> +SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
> +SRC_URI[sha256sum] =
> "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} += "\
> +        ${PYTHON_PN}-pbr \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> index 4e83299..b332f5f 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> @@ -1,26 +1,2 @@
> -DESCRIPTION = "Simplify the writing of REST APIs, and extend them with
> additional protocols"
> -HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
> -
> -PYPI_PACKAGE = "WSME"
> -
> -SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
> -SRC_URI[sha256sum] =
> "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
> -
>  inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += "\
> -        python-pbr \
> -        "
> +require python-wsme.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
> b/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
> new file mode 100644
> index 0000000..f792d0e
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-wsme_0.9.3.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3 pypi
> +require python-wsme.inc
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

--000000000000b0931a058fecc53e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 12, 2019 at 4:10 AM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fu=
jitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Providing a python3 version of python=
-wsme.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-wsme.inc=C2=A0 =C2=A0| 24 ++++++++=
+++++++++<br>
=C2=A0.../python/<a href=3D"http://python-wsme_0.9.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">python-wsme_0.9.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 26 +------------------<br>
=C2=A0.../python/<a href=3D"http://python3-wsme_0.9.3.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-wsme_0.9.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A03 files changed, 27 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-wsme=
.inc<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python3-wsme_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
wsme_0.9.3.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-wsme.inc b/meta-=
openstack/recipes-devtools/python/python-wsme.inc<br>
new file mode 100644<br>
index 0000000..b402a09<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-wsme.inc<br>
@@ -0,0 +1,24 @@<br>
+DESCRIPTION =3D &quot;Simplify the writing of REST APIs, and extend them w=
ith additional protocols&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/WSME/" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.python.org/pypi/WSME/</a>&quot;<b=
r>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5a9126e7f56a0cf3247050de7f=
10d0f4&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;WSME&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;e6cb3864bae872acaa0cd0c2efacc94f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e24fcff24392a0b176e560ffc6591b1f658342bbc992f=
84e0e8a3c53fd92580a&quot;<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-wsme_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb<=
/a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a><br>
index 4e83299..b332f5f 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a><br>
@@ -1,26 +1,2 @@<br>
-DESCRIPTION =3D &quot;Simplify the writing of REST APIs, and extend them w=
ith additional protocols&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/WSME/" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.python.org/pypi/WSME/</a>&quot;<b=
r>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5a9126e7f56a0cf3247050de7f=
10d0f4&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;WSME&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;e6cb3864bae872acaa0cd0c2efacc94f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;e24fcff24392a0b176e560ffc6591b1f658342bbc992f=
84e0e8a3c53fd92580a&quot;<br>
-<br>
=C2=A0inherit setuptools pypi<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pip \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-# Satisfy setup.py &#39;setup_requires&#39;<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+require python-wsme.inc<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-wsme_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsme_0.9.3.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-ws=
me_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsme_0.9.3.bb</a>=
<br>
new file mode 100644<br>
index 0000000..f792d0e<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-wsme=
_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsme_0.9.3.bb</a><b=
r>
@@ -0,0 +1,2 @@<br>
+inherit setuptools3 pypi<br>
+require python-wsme.inc<br>
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

--000000000000b0931a058fecc53e--
