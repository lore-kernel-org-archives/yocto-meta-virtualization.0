Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web09.1014.1580581950014861328
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Feb 2020 10:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJKgIx8D;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id z193so12080821iof.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Feb 2020 10:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lv4Fc7lI2SRVNxgQNrBfVa/KQJvKF9y9uEjFdWldBF0=;
        b=YJKgIx8DDMqFVSUTkh0/439Kk+T3i5MmTbI6mnhcj4R3vB2WmjJJ4HHN/cuYF4cVwO
         q6cZTxHFO+rTvEjbAWfz97aNxAjT1optXE/Zl1YwevS9ZumlXmpnY5aX6bjx78AYg6uC
         lBBtSFyFBfjC1tqCuxslSwvGZ2iwPhLMmF1yAK6+nVjupZVHnOL5LiysE2Zjc8BVNWYY
         dngKIjp5aDrWopp+X3c2Tpw3zHGvTsQQ4dWpu8weNwFUaCDGAgi6zr7ULFY8N5cMJYjD
         ZfN/jwnHGlDAivc13aB2li7QxsbfBv+XjioZOy23U1d7SzQaAMzHmo8wGhQqUcZXvHkQ
         ILiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lv4Fc7lI2SRVNxgQNrBfVa/KQJvKF9y9uEjFdWldBF0=;
        b=nUkSoxVT5GHPRBKYCg/2twVAoKJDsMxNUiRRD/qZP8NTDrEsQND3DWT33XQY6FIF5t
         hthsDYF5lKnt+dCXOB80sKdTa9fgzVlK9lvpOOywP9rDXV8yTbwXiZsNWxH0ABxiOZW1
         jYG1mEO7vWC+kjBMKB7dHp+AjfdOvevMApfmZSMlBNG/QiaiKphDo28mAxNFjOKCW2rV
         VTPre7LP/zTRgyIWETQindRJjegJLxr+sVkrxeqxSMRPFNS9r0DMlkJxtjcz2ZQMu4En
         sDMd2Oqg8wYP2oJMwMglOs6kiUh/izG5RRknReunqZIpb/xba0+jGtLkW0JYux9XkfLi
         dQqA==
X-Gm-Message-State: APjAAAVPLjENVwM2q74LLdTRyKPjL94432mBYEOZt/msatlg7BZWPY6M
	t92Itd8YoQ3DaJJler+MlgoGbi+/DBlTFViXf6Y=
X-Google-Smtp-Source: APXvYqw1vIhTFn6I1Vct/Y1LAeaWAxpCkwysRzoFOJsUiN+hjw6e6incTHNdLGySK7qPy8RU1RLI53SgaBIykQCJYq4=
X-Received: by 2002:a6b:5503:: with SMTP id j3mr13012720iob.142.1580581949393;
 Sat, 01 Feb 2020 10:32:29 -0800 (PST)
MIME-Version: 1.0
References: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sat, 1 Feb 2020 10:32:18 -0800
Message-ID: <CANx9H-A7CM_-M=U0ij0ajsqz0RTGfnUH_tG+AEuGF_vVMkKmfg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] python3-fastentrypoints: add recipe
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, simon.bueler@toradex.com, 
	stefan.agner@toradex.com
Content-Type: multipart/alternative; boundary="000000000000a1d017059d87e9df"

--000000000000a1d017059d87e9df
Content-Type: text/plain; charset="UTF-8"

This seems generally useful and should go to meta-python?

On Sat, Feb 1, 2020 at 9:47 AM Ming Liu <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
>
> python3-fastentrypoints is a python module that make entry_points
> specified in setup.py load more quickly.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../python/python3-fastentrypoints_0.12.bb             | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-devtools/python/
> python3-fastentrypoints_0.12.bb
>
> diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> new file mode 100644
> index 0000000..7bd1651
> --- /dev/null
> +++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Make entry_points specified in setup.py load more quickly"
> +DESCRIPTION = "Using entry_points in your setup.py makes scripts that
> start \
> +really slowly because it imports pkg_resources, which is a horrible \
> +thing to do if you want your trivial script to execute more or less \
> +instantly. fastentrypoints aims to fix that bypassing pkg_resources, \
> +making scripts load a lot faster."
> +HOMEPAGE = "https://github.com/ninjaaron/fast-entry_points"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM =
> "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
> +SRC_URI[sha256sum] =
> "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> 
>

--000000000000a1d017059d87e9df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This seems generally useful and should go to meta-py=
thon?</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Sat, Feb 1, 2020 at 9:47 AM Ming Liu &lt;<a href=3D"mai=
lto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@=
gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
python3-fastentrypoints is a python module that make entry_points<br>
specified in setup.py load more quickly.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-fastentrypoints_0.12.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-fastentrypoints_0.12.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3=
-fastentrypoints_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-fast=
entrypoints_0.12.bb</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-fastentrypo=
ints_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastentrypoints_=
0.12.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-fastentrypo=
ints_0.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastentrypoints_=
0.12.bb</a><br>
new file mode 100644<br>
index 0000000..7bd1651<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-fastentrypoints_0.=
12.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastentrypoints_0.12.bb=
</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Make entry_points specified in setup.py load more quick=
ly&quot;<br>
+DESCRIPTION =3D &quot;Using entry_points in your setup.py makes scripts t=
hat start \<br>
+really slowly because it imports pkg_resources, which is a horrible \<br>
+thing to do if you want your trivial script to execute more or less \<br>
+instantly. fastentrypoints aims to fix that bypassing pkg_resources, \<br=
>
+making scripts load a lot faster.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ninjaaron/fast-entry_poi=
nts" rel=3D"noreferrer" target=3D"_blank">https://github.com/ninjaaron/fast=
-entry_points</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://README.rst;md5=3Df212a0cb34eb678477972d=
2011fb365a&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;390ad9a9229164a06156a5b1f0ef1b22&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ff284f1469bd65400599807d2c6284d5b251398e6e28=
811f5f77fd262292410b&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div></div>

--000000000000a1d017059d87e9df--
