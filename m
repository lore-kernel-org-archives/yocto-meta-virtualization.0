Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.117539.1597951856715308602
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 12:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OuaG0DEd;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id f24so3870826ejx.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2020 12:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QeSU4vlpWGNJc78VD40X+HCZ/VwvoEW/djrQ6fNkJ7o=;
        b=OuaG0DEd6ePAirlWrtfgbAHBys8B+AMp6xNOApk6HrKGHAwPSrIBwac+aFJsgZHmNc
         ItsTn3cTGj1UurxOHsecHbUQP5KSGuAZeS+CKzJNOGHGoX3ilWn5yJF5oI4n2ZDx30GY
         rFeq6090Y1qmAlqRrPtevIwU2O8I2AeXXxNuSn0W/xrDwNLaBJZV3U4/UoHXQE4zosIM
         qOUdL+N8vXUankFg4Q//cvzZp2tmCnVs3N8xLpLgkOGQYu7bWcshOIjfuMoTN71LAmr8
         kWVfEKkndiVGWutd4dnLTAqgcXcBoGQ+LqlpJPP1X68RmU4XWQYAlotFCLImvyJqV2nD
         LXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QeSU4vlpWGNJc78VD40X+HCZ/VwvoEW/djrQ6fNkJ7o=;
        b=gUEuBCBEb5Y4o/bWUmRegCeDKidAwWpDBFH9Dv2fbW7lgmjDiuCqPzNESyRbbGFHS3
         ALykXn+6dkGphIJY+iEiaFl81go5nRvnb9LGRQ2Y0HxG7NNs+IugG1NIOQm4+YKFe1j1
         7fqjgw1iGPtMR8h8xZlLxLxeZVErxSwbN+ZYVYAo1lx4HqatzlcMX4ires2baYRXVtb9
         PJ3JTs+hFr9PPo6y8HE2qRCL48fnm46BSBYX1Qw9E8HJyDokm5qJuTWvuiVu5eKs4R0P
         YE4vqr+3BuSBkwhAb0Uxm45XMAFy7bCumrQIYmClrrHox8X4ld1mMg29Xz/4om5G7UbD
         Agdg==
X-Gm-Message-State: AOAM532u5oklI7IMdibvOrv+0dq5aYtxlDXQeCB/6fHKdn/VA8gcCCq/
	JpByofZM12u9aQKut/cYQFGoYPPBAof24k0pbJk=
X-Google-Smtp-Source: ABdhPJw5Mf2y3C54CSt+HdFAxYHTa8RLWR5s+spvGqwmC7QPJZW2IPGHezo+8NQP2IjEAiJslygWUTaj/SVRpuFYIo0=
X-Received: by 2002:a17:906:b815:: with SMTP id dv21mr156707ejb.517.1597951854939;
 Thu, 20 Aug 2020 12:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200819060759.2014410-1-samuelzeter@gmail.com>
In-Reply-To: <20200819060759.2014410-1-samuelzeter@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 20 Aug 2020 15:30:43 -0400
Message-ID: <CADkTA4OG0HZ26csjGu37ZnTLF4wXE-r_RX5fPhsKafdcbNWV5A@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] salt: Remove hardcoded Python 3.7 path
To: Sam Zeter <samuelzeter@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ae91d405ad54286d"

--000000000000ae91d405ad54286d
Content-Type: text/plain; charset="UTF-8"

I tweaked the patch to apply to master as well (the salt version changed).

We should always ensure that we have these on master, and then a version
for a released branch.

Bruce

On Wed, Aug 19, 2020 at 2:08 AM Sam Zeter <samuelzeter@gmail.com> wrote:

> The salt bitbake file hardcodes the Python 3.7 path as
>
>  ${libdir}/python3.7
>
> In order to ensure compatibility with Dunfell, which uses Python 3.8,
> and other future versions of Python, the variable PYTHON_SITEPACKAGES_DIR
> should be used.
>
> Signed-off-by: Sam Zeter <samuelzeter@gmail.com>
> ---
>  meta-openstack/recipes-support/salt/salt_3000.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-support/salt/salt_3000.bb
> b/meta-openstack/recipes-support/salt/salt_3000.bb
> index c2bc8da0..f80ceb65 100644
> --- a/meta-openstack/recipes-support/salt/salt_3000.bb
> +++ b/meta-openstack/recipes-support/salt/salt_3000.bb
> @@ -104,7 +104,7 @@ RRECOMMENDS_${PN}-common = "lsb"
>  RSUGGESTS_${PN}-common = "python3-mako python3-git"
>  RCONFLICTS_${PN}-common = "python3-mako (< 0.7.0)"
>  CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}"
> -FILES_${PN}-common = "${bindir}/${PN}-call ${libdir}/python3.7/
> ${CONFFILES_${PN}-common}"
> +FILES_${PN}-common = "${bindir}/${PN}-call ${PYTHON_SITEPACKAGES_DIR}/*
> ${CONFFILES_${PN}-common}"
>
>  SUMMARY_${PN}-ssh = "remote manager to administer servers via salt"
>  DESCRIPTION_${PN}-ssh = "${DESCRIPTION_COMMON} This particular package
> provides the salt ssh controller. It \
> --
> 2.25.4
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ae91d405ad54286d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I tweaked the patch to apply to master as well (the salt vers=
ion changed).</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">We should a=
lways ensure that we have these on master, and then a version for a release=
d branch.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Aug 19, 2020 at 2:08 AM Sam Zeter &lt;<a href=3D"mailto:samuelzeter@gma=
il.com">samuelzeter@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The salt bitbake file hardcodes the Python 3.7=
 path as<br>
<br>
=C2=A0${libdir}/python3.7<br>
<br>
In order to ensure compatibility with Dunfell, which uses Python 3.8,<br>
and other future versions of Python, the variable PYTHON_SITEPACKAGES_DIR<=
br>
should be used.<br>
<br>
Signed-off-by: Sam Zeter &lt;<a href=3D"mailto:samuelzeter@gmail.com" targ=
et=3D"_blank">samuelzeter@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-support/salt/<a href=3D"http://salt_3000.bb" =
rel=3D"noreferrer" target=3D"_blank">salt_3000.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-support/salt/<a href=3D"http://salt_30=
00.bb" rel=3D"noreferrer" target=3D"_blank">salt_3000.bb</a> b/meta-opensta=
ck/recipes-support/salt/<a href=3D"http://salt_3000.bb" rel=3D"noreferrer" =
target=3D"_blank">salt_3000.bb</a><br>
index c2bc8da0..f80ceb65 100644<br>
--- a/meta-openstack/recipes-support/salt/<a href=3D"http://salt_3000.bb" =
rel=3D"noreferrer" target=3D"_blank">salt_3000.bb</a><br>
+++ b/meta-openstack/recipes-support/salt/<a href=3D"http://salt_3000.bb" =
rel=3D"noreferrer" target=3D"_blank">salt_3000.bb</a><br>
@@ -104,7 +104,7 @@ RRECOMMENDS_${PN}-common =3D &quot;lsb&quot;<br>
=C2=A0RSUGGESTS_${PN}-common =3D &quot;python3-mako python3-git&quot;<br>
=C2=A0RCONFLICTS_${PN}-common =3D &quot;python3-mako (&lt; 0.7.0)&quot;<br=
>
=C2=A0CONFFILES_${PN}-common=3D&quot;${sysconfdir}/logrotate.d/${PN}&quot;=
<br>
-FILES_${PN}-common =3D &quot;${bindir}/${PN}-call ${libdir}/python3.7/ ${=
CONFFILES_${PN}-common}&quot;<br>
+FILES_${PN}-common =3D &quot;${bindir}/${PN}-call ${PYTHON_SITEPACKAGES_D=
IR}/* ${CONFFILES_${PN}-common}&quot;<br>
<br>
=C2=A0SUMMARY_${PN}-ssh =3D &quot;remote manager to administer servers via=
 salt&quot;<br>
=C2=A0DESCRIPTION_${PN}-ssh =3D &quot;${DESCRIPTION_COMMON} This particula=
r package provides the salt ssh controller. It \<br>
-- <br>
2.25.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000ae91d405ad54286d--
