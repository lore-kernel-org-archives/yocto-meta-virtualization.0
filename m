Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.193809.1598274056202162580
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 06:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o5J96N39;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18E34E02087; Mon, 24 Aug 2020 06:00:56 -0700 (PDT)
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
	*      [209.85.218.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CD58E0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 06:00:54 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id bo3so11756957ejb.11
        for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eRWVEGXjc2mFcTEi+EST2oSPJ7eh4D+Lmjjtd/M6aMk=;
        b=o5J96N39DEtg1R2PBP2HSPBUxZhdAvxrkixHh9tAVxPCFza34xya6NR1Zmro2MzSGM
         XbwjjoEteNtIfSDhtb9kUiV2XLLv2b5bBhiFDSrpv59Uk/gfir2fMN1h9AYsQSfqEMjG
         LhthtFweGev+lbs6j22R+xCbDlmPSe6/pl/8TvshKUb2CqXAdhsvXbnZXNU75lZYvGC9
         67yfpN/fUy/Pyy+vnVDuB/46ESYvMF8TYvHVEoM/ouejA8NRkphJIkEdfNoQz6gjckne
         SCqFaIbvAmc2j8cJKf1rpO9GpuTXQreHaLVb4FzRt/emmgMXlu1Jr0z7FOKUBDeUZe3h
         OFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRWVEGXjc2mFcTEi+EST2oSPJ7eh4D+Lmjjtd/M6aMk=;
        b=YXWa2mgLZx5G4gKRwmmh9bSU9se8If8OQhQuprknM8SlV39Pn5ghmrv9nYDXukd07n
         XHW7eq1U0fsK0BuB0upAEY9no1rojY8sCxDwWSm08LKhBoRrR9jv+0h42sLLTZ04G2Bk
         4fGmjQ6xSZqh+Usvce2J0uN/PZox9WHzMOJm9bDVTKP8RnyQUITnh4q9W9iT7Zp7Mbjz
         OA2bW3E8DGTB+776DIXo48pzRRVOERXD27N6u9BitK8xbEJxtQem3fAI0gtbq6p/b4DF
         7T2t0R4jVZQokYS0r7sfStOm043cuSzz5M9e7MvffVZr4sZeffa6JLSqvHoeutu9r+qc
         /mZw==
X-Gm-Message-State: AOAM531bOo2EskBzfJOwrj0l3k2AOQ25pPB7WZV7CToLixObh7+da+D4
	kv3z3RguNyAohoFXXG1aFjCuoq2wFJjpN4VY0ZkpP9YBEGerAw==
X-Google-Smtp-Source: ABdhPJyy0b1qu+G1SeLmgnTajGxSdPPKFXdNpDP1JKGZqs3CuDRlq6yFf0JSujHLZKNBeDTfH+v8R8ZcANkOtVaXV+s=
X-Received: by 2002:a17:906:71d3:: with SMTP id i19mr5423798ejk.459.1598274053254;
 Mon, 24 Aug 2020 06:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <1598299693-63275-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <1598299693-63275-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1598299693-63275-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 24 Aug 2020 09:00:41 -0400
Message-ID: <CADkTA4P=O8V+0fU0x2f3ifgnKx9vK7RcSnM3iY-P+QndWiUH4A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-bootstrap-datepicker: Remove python recipe
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000032b2c205ad9f2d8f"

--00000000000032b2c205ad9f2d8f
Content-Type: text/plain; charset="UTF-8"

Same thing here. Let's log the reason why it is being removed.

Bruce

On Mon, Aug 24, 2020 at 4:08 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python-xstatic-bootstrap-datepicker.inc   | 19 -----------------
>  ...on-xstatic-bootstrap-datepicker_1.3.1.0.bb |  2 --
>  ...n3-xstatic-bootstrap-datepicker_1.4.0.0.bb | 21 +++++++++++++++++--
>  3 files changed, 19 insertions(+), 23 deletions(-)
>  delete mode 100644
> meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-bootstrap-datepicker_1.3.1.0.bb
>
> diff --git
> a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
> b/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
> deleted file mode 100644
> index f1d19f3..0000000
> ---
> a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-datepicker.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for
> setuptools (easy_install) / pip."
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=717661446a83183e303f3f8e0a1ea277"
> -
> -PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
> -
> -SRC_URI[md5sum] = "68375e81274159874ab5fd6d85ea405c"
> -SRC_URI[sha256sum] =
> "df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e"
> -
> -inherit pypi
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/
> python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> b/meta-openstack/recipes-devtools/python/
> python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> deleted file mode 100644
> index 9e9db89..0000000
> --- a/meta-openstack/recipes-devtools/python/
> python-xstatic-bootstrap-datepicker_1.3.1.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-bootstrap-datepicker.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
> b/meta-openstack/recipes-devtools/python/
> python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
> index 9e9db89..6ecaf8a 100644
> --- a/meta-openstack/recipes-devtools/python/
> python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python3-xstatic-bootstrap-datepicker_1.4.0.0.bb
> @@ -1,2 +1,19 @@
> -require python-xstatic-bootstrap-datepicker.inc
> -inherit setuptools3
> +DESCRIPTION = "Bootstrap-Datepicker JavaScript library packaged for
> setuptools (easy_install) / pip."
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Bootstrap-Datepicker"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=717661446a83183e303f3f8e0a1ea277"
> +
> +PYPI_PACKAGE = "XStatic-Bootstrap-Datepicker"
> +
> +SRC_URI[md5sum] = "68375e81274159874ab5fd6d85ea405c"
> +SRC_URI[sha256sum] =
> "df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e"
> +
> +inherit setuptools3 pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
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

--00000000000032b2c205ad9f2d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Sam=
e thing here. Let&#39;s log the reason why it is being removed.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24, 2020 at 4=
:08 AM zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com">zangrc.fnst=
@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fns=
t@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python-xstatic-bootstrap-datepicker.inc=C2=A0 =C2=A0| 19 -------=
----------<br>
=C2=A0...<a href=3D"http://on-xstatic-bootstrap-datepicker_1.3.1.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">on-xstatic-bootstrap-datepicker_1.3.1.0.=
bb</a> |=C2=A0 2 --<br>
=C2=A0...<a href=3D"http://n3-xstatic-bootstrap-datepicker_1.4.0.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">n3-xstatic-bootstrap-datepicker_1.4.0.0.=
bb</a> | 21 +++++++++++++++++--<br>
=C2=A03 files changed, 19 insertions(+), 23 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/python-xst=
atic-bootstrap-datepicker.inc<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-xstatic-bootstrap-datepicker_1.3.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python-xstatic-bootstrap-datepicker_1.3.1.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-bootstr=
ap-datepicker.inc b/meta-openstack/recipes-devtools/python/python-xstatic-b=
ootstrap-datepicker.inc<br>
deleted file mode 100644<br>
index f1d19f3..0000000<br>
--- a/meta-openstack/recipes-devtools/python/python-xstatic-bootstrap-date=
picker.inc<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-DESCRIPTION =3D &quot;Bootstrap-Datepicker JavaScript library packaged fo=
r setuptools (easy_install) / pip.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Bootst=
rap-Datepicker" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.or=
g/pypi/XStatic-Bootstrap-Datepicker</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D717661446a83183e303f3f8e=
0a1ea277&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;XStatic-Bootstrap-Datepicker&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;68375e81274159874ab5fd6d85ea405c&quot;<br>
-SRC_URI[sha256sum] =3D &quot;df33add9f5e785fa884ac4b182601af6aac9e1eeef7c=
fe62dbbcb0654d0f2d6e&quot;<br>
-<br>
-inherit pypi<br>
-<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on-xstatic-bootstrap-datepicker_1.3.1.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python-xstatic-bootstrap-datepicker_1.3.1.0.bb</a> b/meta-openstack/r=
ecipes-devtools/python/<a href=3D"http://python-xstatic-bootstrap-datepicke=
r_1.3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-xstatic-bootstrap=
-datepicker_1.3.1.0.bb</a><br>
deleted file mode 100644<br>
index 9e9db89..0000000<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-xsta=
tic-bootstrap-datepicker_1.3.1.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-xstatic-bootstrap-datepicker_1.3.1.0.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require python-xstatic-bootstrap-datepicker.inc<br>
-inherit setuptools3<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on3-xstatic-bootstrap-datepicker_1.4.0.0.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-xstatic-bootstrap-datepicker_1.4.0.0.bb</a> b/meta-openstack=
/recipes-devtools/python/<a href=3D"http://python3-xstatic-bootstrap-datepi=
cker_1.4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic-boots=
trap-datepicker_1.4.0.0.bb</a><br>
index 9e9db89..6ecaf8a 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-bootstrap-datepicker_1.4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-xstatic-bootstrap-datepicker_1.4.0.0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-bootstrap-datepicker_1.4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-xstatic-bootstrap-datepicker_1.4.0.0.bb</a><br>
@@ -1,2 +1,19 @@<br>
-require python-xstatic-bootstrap-datepicker.inc<br>
-inherit setuptools3<br>
+DESCRIPTION =3D &quot;Bootstrap-Datepicker JavaScript library packaged fo=
r setuptools (easy_install) / pip.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Bootst=
rap-Datepicker" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.or=
g/pypi/XStatic-Bootstrap-Datepicker</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D717661446a83183e303f3f8e=
0a1ea277&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;XStatic-Bootstrap-Datepicker&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;68375e81274159874ab5fd6d85ea405c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;df33add9f5e785fa884ac4b182601af6aac9e1eeef7c=
fe62dbbcb0654d0f2d6e&quot;<br>
+<br>
+inherit setuptools3 pypi<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
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

--00000000000032b2c205ad9f2d8f--
