Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.12183.1604671830738321993
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OGW2FXLs;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id k3so2103643ejj.10
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 06:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJPWT+r/zz15q12JHCMGgCBx/tTApKy3aUpAe1RtPCY=;
        b=OGW2FXLs3jpGlFbFYXfD+ZK1g19C9f8OHTWS5C9TveZ7V9bZBJh5DlUwigpdfQ+YXb
         US7wyySogQEG/DBn/qyFTmkvKpVir4Gx0UUG5KGiVWLTO00jlNjdA2JKpcUthklzIMCx
         UIJ/Q2YdjqDyF8caV6I7NHy37B79qZNR6z0Mx4Y01xvfxWkM4H6YPZIWjMR8pTJIg9jG
         K/A90a8w39LDgomEhXJw8xMdME1HAsKGuh0qljj6VVUiPbr5IRxUQ4AphS73tbfhSqUe
         cFCElYwXaO2A8YvDi0AKntS/R5IP6j9KB8cSPU/VIXuthWsyCejLKs9URHqTmbsTtYy1
         /2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJPWT+r/zz15q12JHCMGgCBx/tTApKy3aUpAe1RtPCY=;
        b=VihJBegqcfZ4VUD9uWvzrODhejXxlZkLaeo3s8QrSJyl+GTGclOlOUCK29mfBwTZP4
         lhSWBFWmJNVMMMo+sRlt3JjJmSkCDlQZuSoJvC08oJn7evl6Y4PDRF9mleUceYHhGUv+
         bnwXnLcXrwHhWICb1mXuO4R2fK9HOHq93ep0KmvHttuKQK6DYToOB9HElDTP4DMdSJVU
         57ES8TtNLCFGZGXoTiQZG7kHBJ1AMidrrPQ/EXbDKXOXf6NXmgDY6WmvP2qClKnzDCxg
         p3Ydc0uRzjd6DoMOKiKGq8HbM5muIyLVBIXQZ9Gti3+uGmJM8/XO8xwP93LcXhtuaBy6
         t2/A==
X-Gm-Message-State: AOAM5338ID/aLDLHHgfJ8sQkAs9Bzp2p5Y/jYFxFkc3VVu+0QEpuM0Zv
	btBDTN1smvsb3Iec4IlWWZPmGDKD3cn7JHPKI8A=
X-Google-Smtp-Source: ABdhPJw3YoBuxPHoUyZ17ZW4ZVOEIn+ZJnCYVl370qYnmbiesK+38kBvTBjl5j9r/gvXH3Nr6bykh/NiQT4/i2EJRZo=
X-Received: by 2002:a17:906:e2c3:: with SMTP id gr3mr2115660ejb.471.1604671829260;
 Fri, 06 Nov 2020 06:10:29 -0800 (PST)
MIME-Version: 1.0
References: <1644F07A1FB221DF.2515@lists.yoctoproject.org>
In-Reply-To: <1644F07A1FB221DF.2515@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2020 15:10:18 +0100
Message-ID: <CA+chaQcM2oVZM2i+3pOcDC3kDD2z2CCVEtzRdBPq5EfePqkrCg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] layer.conf: add security to LAYERDEPENDS
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005d3d6805b370c6eb"

--0000000000005d3d6805b370c6eb
Content-Type: text/plain; charset="UTF-8"

ignore this one, it was sent by accident (and already rejected before)

On Fri, Nov 6, 2020 at 3:09 PM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> * fixes:
>   NOTE: Resolving any missing task queue dependencies
>   ERROR: Nothing PROVIDES 'libseccomp' (but
> /OE/meta-virtualization/recipes-networking/slirp4netns/
> slirp4netns_0.4.1.bb, /OE/meta-virtualization/recipes-containers/crun/
> crun_git.bb DEPENDS on or otherwise requires it). Close matches:
>     libcomps
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'slirp4netns', 'libseccomp']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 4294f99..9d741be 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> +    security \
>  "
>
>  # webserver: naigos requires apache2
> --
> 2.27.0
>
>
> 
>
>

--0000000000005d3d6805b370c6eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ignore this one, it was sent by accident (and already reje=
cted before)</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Nov 6, 2020 at 3:09 PM Martin Jansa via <a href=3D"http=
://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;Martin.Jansa=3D<a=
 href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproj=
ect.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">* fixes:<br>
=C2=A0 NOTE: Resolving any missing task queue dependencies<br>
=C2=A0 ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but /OE/meta-virtuali=
zation/recipes-networking/slirp4netns/<a href=3D"http://slirp4netns_0.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">slirp4netns_0.4.1.bb</a>, /OE/meta-=
virtualization/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=
=3D"noreferrer" target=3D"_blank">crun_git.bb</a> DEPENDS on or otherwise =
requires it). Close matches:<br>
=C2=A0 =C2=A0 libcomps<br>
=C2=A0 ERROR: Required build target &#39;meta-world-pkgdata&#39; has no bu=
ildable providers.<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;meta-world-pkgda=
ta&#39;, &#39;slirp4netns&#39;, &#39;libseccomp&#39;]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index 4294f99..9d741be 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0networking-layer \<br>
=C2=A0 =C2=A0 =C2=A0filesystems-layer \<br>
=C2=A0 =C2=A0 =C2=A0meta-python \<br>
+=C2=A0 =C2=A0 security \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# webserver: naigos requires apache2<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005d3d6805b370c6eb--
