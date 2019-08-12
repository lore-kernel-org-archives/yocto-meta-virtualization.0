Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40FF1E00D5F; Mon, 12 Aug 2019 07:57:20 -0700 (PDT)
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
	*      [209.85.208.169 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1AA8E009E6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:18 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id z28so44364160ljn.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5Zzi1FfpJJXL3l1zqqqgxhe+H3Yo/UcG9jD8tixJjUc=;
	b=JN7ZDYUjn8xNQZgVQGw9B0DcOowWL+a3JSOpavGSDXw6iBcRqeB9pwtVMzXbhxHd+8
	uBMejZmkluJSaO+zEy0C/tKyljcO2LMAUwwMaBEBJD24XtsjE8fSA6miyGv02VM0Db0e
	5zLkdb4XySsA6zPqWpFQB5v1X7kvNsL3k1pMuGrWIMYG2kz8sL/HRwxrcVKIKS4Dr2j9
	tyXVxrd4liVO6uWw0xZWpUzc/MegaKKZAnaNhpCIFrh4a/QY7orV8avO4B6op1Zei/jB
	4Bd5FTSHirMNZneZYtV7VcV/srwUKrJWLN7Yr6HVPlWRt07A3d8cMdLhQmPne/94dmyR
	BF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5Zzi1FfpJJXL3l1zqqqgxhe+H3Yo/UcG9jD8tixJjUc=;
	b=A1mF+1CxqGRYuXv9cGkdTfm4xDPxTz+nvUbpuuxHcKpT8mTy3OggrMKUFuOcl7l4D6
	vhHGrZ7mOiEnkQ8W785o5Ei2yuFaS7MfUtcAb+vraEM1wW7gLJ+28GE3+iEps0iGcVE4
	2ueJECIYHRG9x9uCsIVQm8ule70Qw0iR1bHYpVHOhHYzwHECdSXiuygum28nlo1LQnjB
	UMJQ/QGhnIKehptm+4DMdef2j7NvP/aty5CH1La9nrVa/1d9V4exjJwXndkxBr4fP1iT
	fApUnnQ2PR0JdZW9N5TYjSIz8kqPc2MVJmINb8/Ow9QK1RwGnibX3JhBWOH8+bxUzeDX
	oriw==
X-Gm-Message-State: APjAAAXA9q8UXYggGIehlD9EliYXEzmmu4lEmG29/Y4T5s6VOjNh4DUK
	Ok45fBfAzJptERTy9TSJ4tL6RbIjXJXWfKCBvP4InyUBksI=
X-Google-Smtp-Source: APXvYqw1OY1x0STN6ajqkXzvPRLzmIOmfioJ2GvcolQlQYtb/Pr12XeHfaYsG6jlXwTm8kl8S051PEdlYE63nCO/FFc=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr18919435ljj.185.1565621837753; 
	Mon, 12 Aug 2019 07:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <1565261588-52140-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565261588-52140-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 10:57:05 -0400
Message-ID: <CADkTA4N+JWhHL3aiDwjAOwgvT6Xa6Em=G2AQYvfCVR0Jxfh3qQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-osc-lib: Add python3 version
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
X-List-Received-Date: Mon, 12 Aug 2019 14:57:20 -0000
Content-Type: multipart/alternative; boundary="0000000000007df35a058fecbdb2"

--0000000000007df35a058fecbdb2
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Aug 7, 2019 at 9:53 PM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Providing a python3 version of python-osc-lib.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-osc-lib.inc                 | 23 +++++++++++++++++
>  .../python/python-osc-lib_1.13.0.bb           | 25 +------------------
>  .../python/python3-osc-lib_1.13.0.bb          |  8 ++++++
>  3 files changed, 32 insertions(+), 24 deletions(-)
>  create mode 100644
> meta-openstack/recipes-devtools/python/python-osc-lib.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-osc-lib_1.13.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> new file mode 100644
> index 0000000..58e994c
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "OpenStackClient Library"
> +HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
> +SRC_URI[sha256sum] =
> "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
> +
> +RDEPENDS_${PN} += " \
> +        python-pbr \
> +        python-six \
> +        python-babel \
> +        python-cliff \
> +        python-keystoneauth1 \
> +        python-os-client-config \
> +        python-oslo.i18n \
> +        python-oslo.utils \
> +        python-simplejson \
> +        python-stevedore \
> +        "
> +
> +CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/
> python-osc-lib_1.13.0.bb
> index 7540e79..4ea2de2 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> @@ -1,30 +1,7 @@
> -DESCRIPTION = "OpenStackClient Library"
> -HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
> -SRC_URI[sha256sum] =
> "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
> -
>  inherit setuptools pypi
> +require python-osc-lib.inc
>
>  # Satisfy setup.py 'setup_requires'
>  DEPENDS += " \
>          python-pbr-native \
>          "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -        python-babel \
> -        python-cliff \
> -        python-keystoneauth1 \
> -        python-os-client-config \
> -        python-oslo.i18n \
> -        python-oslo.utils \
> -        python-simplejson \
> -        python-stevedore \
> -        "
> -
> -CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/
> python3-osc-lib_1.13.0.bb
> new file mode 100644
> index 0000000..63265d9
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> @@ -0,0 +1,8 @@
> +inherit setuptools3 pypi
> +require python-osc-lib.inc
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python3-pbr-native \
> +        "
> +
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

--0000000000007df35a058fecbdb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Au=
g 7, 2019 at 9:53 PM Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fuj=
itsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Providing a python3 version of python-=
osc-lib.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-osc-lib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python-osc-lib_1.13.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python-osc-lib_1.13.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 25 +------------------<br>
=C2=A0.../python/<a href=3D"http://python3-osc-lib_1.13.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-osc-lib_1.13.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++++<br>
=C2=A03 files changed, 32 insertions(+), 24 deletions(-)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/python-osc-=
lib.inc<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python3-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-osc-lib_1.13.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/me=
ta-openstack/recipes-devtools/python/python-osc-lib.inc<br>
new file mode 100644<br>
index 0000000..58e994c<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc<br>
@@ -0,0 +1,23 @@<br>
+DESCRIPTION =3D &quot;OpenStackClient Library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://opensource.perlig.de/rcssmin/" rel=3D=
"noreferrer" target=3D"_blank">http://opensource.perlig.de/rcssmin/</a>&quo=
t;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa3=
7d52a2&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;5e91028524b50a72f9913ccd2994cf77&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707=
950dc1c6f0b286cce77&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-babel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-cliff \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-keystoneauth1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-os-client-config \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.i18n \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.utils \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-simplejson \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-stevedore \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.=
13.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1=
.13.0.bb</a><br>
index 7540e79..4ea2de2 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.13.0.bb=
</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-osc-l=
ib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osc-lib_1.13.0.bb=
</a><br>
@@ -1,30 +1,7 @@<br>
-DESCRIPTION =3D &quot;OpenStackClient Library&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://opensource.perlig.de/rcssmin/" rel=3D=
"noreferrer" target=3D"_blank">http://opensource.perlig.de/rcssmin/</a>&quo=
t;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa3=
7d52a2&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;5e91028524b50a72f9913ccd2994cf77&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707=
950dc1c6f0b286cce77&quot;<br>
-<br>
=C2=A0inherit setuptools pypi<br>
+require python-osc-lib.inc<br>
<br>
=C2=A0# Satisfy setup.py &#39;setup_requires&#39;<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-babel \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-cliff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-keystoneauth1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-os-client-config \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.i18n \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-oslo.utils \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-simplejson \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-stevedore \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-CLEANBROKEN =3D &quot;1&quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n3-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-osc-lib_=
1.13.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://py=
thon3-osc-lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-osc-l=
ib_1.13.0.bb</a><br>
new file mode 100644<br>
index 0000000..63265d9<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-osc-=
lib_1.13.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-osc-lib_1.13.0.=
bb</a><br>
@@ -0,0 +1,8 @@<br>
+inherit setuptools3 pypi<br>
+require python-osc-lib.inc<br>
+<br>
+# Satisfy setup.py &#39;setup_requires&#39;<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pbr-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
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

--0000000000007df35a058fecbdb2--
