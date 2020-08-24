Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.193818.1598274082006872903
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lubMSyW9;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD852E02087; Mon, 24 Aug 2020 06:01:21 -0700 (PDT)
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
	*      [209.85.218.50 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A33AAE0203E
	for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 06:01:20 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id md23so11032814ejb.6
        for <meta-virtualization@yoctoproject.org>; Mon, 24 Aug 2020 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JemHUvaBEPcpHST7+An16/fPcTBmOtWUyCU2fOo6DHg=;
        b=lubMSyW9BUhXuYSHzJ+A0J5+EMyQWGMI3ou6V08ZBZd9MTYKSxMES/PVyd1J8zQcpD
         5QrBb8qaHQmpDopNMPmylh0/73Jbf+m6UIzVYxXRXLTHsLzRzOArqeP6Dt14SD5bSmRz
         KPeGc8w/+f792kp16exWDrEIooL/wBhHtdG3ZFWw5plIGlf7oxuYMk4F5JMzlHBS2uhd
         nmg0Lcd8G5U4Rc3JOSbdMeV7eof4TJZTET/KPlW/YgmSP2UUgdz7F1TFsRcPpRROqBCo
         2apCP3GknrsBYJm9lMhl8v2sIP6fR711FiYaIhZv2Am+VrfVxoxHUEI/+YiJxdruFMtb
         6Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JemHUvaBEPcpHST7+An16/fPcTBmOtWUyCU2fOo6DHg=;
        b=KdktSbumEyMvEyPtGmQU53qRXQWZSPQ97RMeh/pSfV2KtwopLMKf2reQJuhv3dXFiD
         lH1NcWe6A57orVtFooTOV4/elKwtM+uplRJRfioN8/+hKFilh1fBQVZ17GLBWRsGOefz
         Rju3dYrTgMUr2F17nQ7uo4VCrs/tdXeLkibembESHmiWGnjHn/E0mGRElWVQe1UOXmkt
         j4S/ZqAggu7mKcgs6xE33vrobvPN7jU8s962fL8mmylr6sOdCosDR9pcslynFTmkPrYm
         cf9YGCAwKS6m97RadN+kW7+0Tp21DuevLcw1Vlinlm/mSqzLoJKSjDaqbqf7xVKOYPpj
         QVQg==
X-Gm-Message-State: AOAM530yBC0MmyQqW/Fdb0ijoRmeWgMKjXZpvZRqdH6FjFWN4WTKTkHq
	PRq9odcYVAO5e7fL/NhxJ5XadXNgETcowwltEuY=
X-Google-Smtp-Source: ABdhPJx2/xSOy/f3vJmKl18QjgbpM6uI3fzQcQNikFxIJcr2Dr+tUVQ2qjVW5rRphEAitK+o01yAHD4qcljxH4FGvE4=
X-Received: by 2002:a17:907:205c:: with SMTP id pg28mr5225508ejb.22.1598274079741;
 Mon, 24 Aug 2020 06:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <1598290032-121849-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1598290032-121849-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 24 Aug 2020 09:01:08 -0400
Message-ID: <CADkTA4MsfGdkQB_7V7+4bj8G+aTQeV4DQTYPvF0d4CozqnDPzg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-angular-fileupload: Remove python recipe
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c6d9f305ad9f2eda"

--000000000000c6d9f305ad9f2eda
Content-Type: text/plain; charset="UTF-8"

Same, let's log the removal reason.

Bruce

On Mon, Aug 24, 2020 at 4:27 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
> ---
>  .../python-xstatic-angular-fileupload.inc     | 22 -----------------
>  ...hon-xstatic-angular-fileupload_12.0.4.0.bb |  2 --
>  ...on3-xstatic-angular-fileupload_12.0.4.0.bb | 24 +++++++++++++++++--
>  3 files changed, 22 insertions(+), 26 deletions(-)
>  delete mode 100644
> meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/
> python-xstatic-angular-fileupload_12.0.4.0.bb
>
> diff --git
> a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
> b/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
> deleted file mode 100644
> index a845453..0000000
> ---
> a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileupload.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Angular Fileupload packaged for setuptools (easy_install)
> / pip."
> -HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-FileUpload"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e634b82c14383ecefd736caa40ed2222"
> -
> -PYPI_PACKAGE = "XStatic-Angular-FileUpload"
> -
> -SRC_URI[md5sum] = "1cf48c0204783da2f71efe79039a8468"
> -SRC_URI[sha256sum] =
> "68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f"
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
> python-xstatic-angular-fileupload_12.0.4.0.bb
> b/meta-openstack/recipes-devtools/python/
> python-xstatic-angular-fileupload_12.0.4.0.bb
> deleted file mode 100644
> index 644a631..0000000
> --- a/meta-openstack/recipes-devtools/python/
> python-xstatic-angular-fileupload_12.0.4.0.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-xstatic-angular-fileupload.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-fileupload_12.0.4.0.bb
> b/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-fileupload_12.0.4.0.bb
> index 644a631..2fc8f88 100644
> --- a/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-fileupload_12.0.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/
> python3-xstatic-angular-fileupload_12.0.4.0.bb
> @@ -1,2 +1,22 @@
> -require python-xstatic-angular-fileupload.inc
> -inherit setuptools3
> +DESCRIPTION = "Angular Fileupload packaged for setuptools (easy_install)
> / pip."
> +HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Angular-FileUpload"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e634b82c14383ecefd736caa40ed2222"
> +
> +PYPI_PACKAGE = "XStatic-Angular-FileUpload"
> +
> +SRC_URI[md5sum] = "1cf48c0204783da2f71efe79039a8468"
> +SRC_URI[sha256sum] =
> "68e66efc4f2ed81438553a54646d5cc67487b05764c0003ff25ae5beb8dae21f"
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

--000000000000c6d9f305ad9f2eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Sam=
e, let&#39;s log the removal reason.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Aug 24, 2020 at 4:27 AM zhengruoqin &lt;<a h=
ref=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signe=
d-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" t=
arget=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;/<br>
---<br>
=C2=A0.../python-xstatic-angular-fileupload.inc=C2=A0 =C2=A0 =C2=A0| 22 --=
---------------<br>
=C2=A0...<a href=3D"http://hon-xstatic-angular-fileupload_12.0.4.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">hon-xstatic-angular-fileupload_12.0.4.0.=
bb</a> |=C2=A0 2 --<br>
=C2=A0...<a href=3D"http://on3-xstatic-angular-fileupload_12.0.4.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">on3-xstatic-angular-fileupload_12.0.4.0.=
bb</a> | 24 +++++++++++++++++--<br>
=C2=A03 files changed, 22 insertions(+), 26 deletions(-)<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/python-xst=
atic-angular-fileupload.inc<br>
=C2=A0delete mode 100644 meta-openstack/recipes-devtools/python/<a href=3D=
"http://python-xstatic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-xstatic-angular-fileupload_12.0.4.0.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-angular=
-fileupload.inc b/meta-openstack/recipes-devtools/python/python-xstatic-ang=
ular-fileupload.inc<br>
deleted file mode 100644<br>
index a845453..0000000<br>
--- a/meta-openstack/recipes-devtools/python/python-xstatic-angular-fileup=
load.inc<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-DESCRIPTION =3D &quot;Angular Fileupload packaged for setuptools (easy_in=
stall) / pip.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Angula=
r-FileUpload" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/XStatic-Angular-FileUpload</a>&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3De634b82c14383ecefd736caa=
40ed2222&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;XStatic-Angular-FileUpload&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;1cf48c0204783da2f71efe79039a8468&quot;<br>
-SRC_URI[sha256sum] =3D &quot;68e66efc4f2ed81438553a54646d5cc67487b05764c0=
003ff25ae5beb8dae21f&quot;<br>
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
on-xstatic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python-xstatic-angular-fileupload_12.0.4.0.bb</a> b/meta-openstack/rec=
ipes-devtools/python/<a href=3D"http://python-xstatic-angular-fileupload_12=
.0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-xstatic-angular-file=
upload_12.0.4.0.bb</a><br>
deleted file mode 100644<br>
index 644a631..0000000<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-xsta=
tic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon-xstatic-angular-fileupload_12.0.4.0.bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-require python-xstatic-angular-fileupload.inc<br>
-inherit setuptools3<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pyth=
on3-xstatic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-xstatic-angular-fileupload_12.0.4.0.bb</a> b/meta-openstack/r=
ecipes-devtools/python/<a href=3D"http://python3-xstatic-angular-fileupload=
_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-xstatic-angular-=
fileupload_12.0.4.0.bb</a><br>
index 644a631..2fc8f88 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-xstatic-angular-fileupload_12.0.4.0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3-xst=
atic-angular-fileupload_12.0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-xstatic-angular-fileupload_12.0.4.0.bb</a><br>
@@ -1,2 +1,22 @@<br>
-require python-xstatic-angular-fileupload.inc<br>
-inherit setuptools3<br>
+DESCRIPTION =3D &quot;Angular Fileupload packaged for setuptools (easy_in=
stall) / pip.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.python.org/pypi/XStatic-Angula=
r-FileUpload" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/XStatic-Angular-FileUpload</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3De634b82c14383ecefd736caa=
40ed2222&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;XStatic-Angular-FileUpload&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;1cf48c0204783da2f71efe79039a8468&quot;<br>
+SRC_URI[sha256sum] =3D &quot;68e66efc4f2ed81438553a54646d5cc67487b05764c0=
003ff25ae5beb8dae21f&quot;<br>
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

--000000000000c6d9f305ad9f2eda--
