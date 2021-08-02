Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.15522.1627875586668777406
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 20:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lIzEkU/D;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id yk17so20924307ejb.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 20:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXxb14mpyOXsi9/8LCcd8G9mP6l79U5f+MbOi8XelLI=;
        b=lIzEkU/DONLaVRdkl9Fu8CiiT1b/ZR+kRiC0XT5+gOGesVIV/CnPiID3Pz5SS0kG1a
         3QLe56Rc+gXvRM0GgVwKC4yRASX4ps2maRSc+tizH0bzkrF/93e4FU7o0KRzwO6kjUAM
         +8pIe7k7LkIh428u8BSw2tX+rRk+oHId+8F9w7CbWQVhXjfWv081LxF2ZgYUSoE93e6m
         dAL++XrXl4vIxMpsMy1aj2hXfn10Ck0jvcCzqwh810bYh1yD8k+bEHeO6ZiSPJ8AddAf
         AU1DRBpfJ52BbRwJSRSd3xoyh+RF3sVABSgf1sMY4bzwAm1C2SnmO1SYfJ0ZSa5h3Frj
         a1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXxb14mpyOXsi9/8LCcd8G9mP6l79U5f+MbOi8XelLI=;
        b=KOezzkk0hS6ndDprNDOK2GaEU0q7Utxh1o43RhQIILjpyRcjAJ5KRWePRfPIEDZx9a
         kCZ60+e122GlpHvL+Sj3ISCRJeUQ98KN3R72SJLKEFG4eiTKFGbs4j+mqWV534EcGWNj
         I/sr64L5qnkrG0LL8ESc/UUCXRB3udW7mrPPuzf3uVJyU8aIP92hfktj4UQn1X5xM6U/
         0aZ4XRLi5GW+t6+jeGFlPyFmVrToKMWMCcqZnIlaGIPDAALYuJ+LdbqfK5skenj+2I0D
         oX83uJq90nNisDr/CQJTu/bzfhopCICWenOkM8+qUJkD6LfeL7nJXBpYwe8UYe8FSGZg
         8JxQ==
X-Gm-Message-State: AOAM530JyYA9GAbnZ6tCDYCT+p4u8q50/fwJ+ceEUDnhvd0HsMF7Jq5+
	yLWevlOmmLguZcgHyXNOcUoxL8CuCHK5+8Iqfno=
X-Google-Smtp-Source: ABdhPJxj/CVzmG2HD82gen4VHA9m6kSFLfe1jg46/Wf3Kqoja3snZUEkKkReNSasfkY4Z5TfIZUaZJDSkYopN3fWDPs=
X-Received: by 2002:a17:906:c2d7:: with SMTP id ch23mr13033287ejb.298.1627875585231;
 Sun, 01 Aug 2021 20:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210730151319.54916-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210730151319.54916-1-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 1 Aug 2021 23:39:34 -0400
Message-ID: <CADkTA4M7gGWdQdsuu8PLuu1Mb_JxqDK4ki0AvHTnHeK_QaY5tw@mail.gmail.com>
Subject: Re: [meta-virtualization][WIP][PATCH] docker-distribution: manually finish override syntax conversion
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ff0ff505c88b516b"

--000000000000ff0ff505c88b516b
Content-Type: text/plain; charset="UTF-8"

Thanks!

I've added this to the master-next queue for the overrides conversion.

Bruce

On Fri, Jul 30, 2021 at 11:13 AM Martin Jansa <Martin.Jansa@gmail.com>
wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker-distribution/
> docker-distribution_git.bb b/recipes-containers/docker-distribution/
> docker-distribution_git.bb
> index 48d1c93..028c728 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -69,6 +69,6 @@ FILES:docker-registry += "${localstatedir}/lib/registry/"
>  SYSTEMD_SERVICE:docker-registry =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
>  SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
>
> -RDEPENDS_${PN}-ptest_remove = "${PN}"
> +RDEPENDS:${PN}-ptest:remove = "${PN}"
>
>  CVE_PRODUCT = "docker_registry"
> --
> 2.30.2
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ff0ff505c88b516b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve added this =
to the master-next queue for the overrides conversion.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 11:13 AM M=
artin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../docker-distribution/<a href=3D"http://docker-distribution_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/docker-distribution/<a href=3D"http://dock=
er-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distrib=
ution_git.bb</a> b/recipes-containers/docker-distribution/<a href=3D"http:/=
/docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-di=
stribution_git.bb</a><br>
index 48d1c93..028c728 100644<br>
--- a/recipes-containers/docker-distribution/<a href=3D"http://docker-dist=
ribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_g=
it.bb</a><br>
+++ b/recipes-containers/docker-distribution/<a href=3D"http://docker-dist=
ribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_g=
it.bb</a><br>
@@ -69,6 +69,6 @@ FILES:docker-registry +=3D &quot;${localstatedir}/lib/re=
gistry/&quot;<br>
=C2=A0SYSTEMD_SERVICE:docker-registry =3D &quot;${@bb.utils.contains(&#39;=
DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;docker-registry.service&#39;,&#=
39;&#39;,d)}&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE:docker-registry =3D &quot;enable&quot;<br>
<br>
-RDEPENDS_${PN}-ptest_remove =3D &quot;${PN}&quot;<br>
+RDEPENDS:${PN}-ptest:remove =3D &quot;${PN}&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;docker_registry&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--000000000000ff0ff505c88b516b--
