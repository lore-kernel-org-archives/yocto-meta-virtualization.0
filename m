Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web09.3903.1615521482028453028
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 19:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=K/SG5hOW;
 spf=pass (domain: google.com, ip: 209.85.167.171, mailfrom: rburanyi@google.com)
Received: by mail-oi1-f171.google.com with SMTP id x78so25553273oix.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 19:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oO4a14H9FWqOxxo4rJVYdtqMCK2plPK8vInhz2V+NLo=;
        b=K/SG5hOWOp8GF19q8iBpWL1q+0jpIwaPak7saJCgihWBgpikWL2Yu8L2dXRaz6QSyJ
         Xlva05O0zxhoQgs6DjY2mR/jNRtp+xmxmsT9i/QjMlqSXfFwJt4Hp8d0cZju5cwhEFuk
         3J/yJAp2fhcZ/8RWJNW/XB827M2rtwkN83BAzQOUtHSYQ+3J8G4wH8JwlKFNvdNOHqUy
         zKFZuAIC1iYuwPt15MAby5nY286T4wrO9UPfgkrHSRxrDa9xvHjX63smETmGNcb4p8H2
         WIAxSYtdDAVlM+uTc0SZz47bTD6D4LPN2Ez9LEypbr/5vNzNgODaNQQ6S2vxkBeG1ZPx
         iB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oO4a14H9FWqOxxo4rJVYdtqMCK2plPK8vInhz2V+NLo=;
        b=jQwbHlqNEj77SAUoq4GO87tJaza4kl3zNi2EG5umozPxQww1A7DHd+v8hO9OGcEk0q
         V6p2QXXOFcZ2oPFh76k9m5yULHhaTUIfkej9E+aHdXzh5dIjjBOqffAiIkJcYJAS/4Vn
         +LE+CERVAwIfpF4oLBngRurOL+YwvWo/2n8g9mUlYpMinUFIp38bfNz24GVEUKXYbeKi
         AnB+pOthmu+/dzhwTA7Q+yhoO1/6nSBw9oXZAwwxotku/+MO5zwwPp+wI/hv3bkt+wyW
         0Ct7iHTkdAAXoQ3/5SQ7FCwlHsYmdcMGe0/iLxy5Z0j6aWyu6DDc0+BO3z6NW0TH3S82
         8lRw==
X-Gm-Message-State: AOAM532jmsKTZQnkT63sHlPlO1pGE24PgAuG67CsSMjZ2yiJJleukXcJ
	ink81PrfkNxsnJdPX0HPwYJ8wtrmVEl/O/Iy7+rhPw==
X-Google-Smtp-Source: ABdhPJy/SNzmPACHcaGL06K0cCuMSW9ULYwI+aVZliflGBD0YYiw9ttJ7bvT+AD6SLNNPONMnYSSjneP2vqOJ69mons=
X-Received: by 2002:a05:6808:2d2:: with SMTP id a18mr9025792oid.152.1615521481122;
 Thu, 11 Mar 2021 19:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20210311193040.621009-1-rburanyi@google.com> <20210312035103.GB12488@gmail.com>
In-Reply-To: <20210312035103.GB12488@gmail.com>
From: "Robi Buranyi" <rburanyi@google.com>
Date: Thu, 11 Mar 2021 19:57:50 -0800
Message-ID: <CANF=oU47b38sOkkVHcHz=zFhF+Nw_J40B9xpdi2Q8N-K97uopw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: change download folder
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000002c7ed05bd4ee88f"

--00000000000002c7ed05bd4ee88f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for reviewing and merging it, Bruce.

I was sending it through regular =E2=80=9Cgit email=E2=80=9D with the conf=
iguration I have
found in some internal guidelines from my company. I can ask around if
there is something I can do.

I am working on the dunfell branch and I see the issue there too; I just
wanted to first send the patch to the main branch because I thought that=
=E2=80=99s
the first step?

On Thu, Mar 11, 2021 at 7:51 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> This will hit more than master, but for now, I've just merged this
> there, and will wait for problem reports on the other branches.
>
> Also, however this was sent, the Author field came through as
> invalid and the yocto hooks wouldn't let me push.
>
> I've manually updated the Author field, and this is now merged.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] lxc: change download folder
> on 11/03/2021 Robi Buranyi via lists.yoctoproject.org wrote:
>
> > The URI has been changed to 'https://linuxcontainers.org/downloads/lxc=
'
> > by the site maintainers recently. Updating the recipe to reflect the n=
ew
> > path.
> >
> > Signed-off-by: Robi Buranyi <rburanyi@google.com>
> > ---
> >  recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/lxc/lxc_4.0.6.bb
> b/recipes-containers/lxc/lxc_4.0.6.bb
> > index ddff9af..b422909 100644
> > --- a/recipes-containers/lxc/lxc_4.0.6.bb
> > +++ b/recipes-containers/lxc/lxc_4.0.6.bb
> > @@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D "file make gmp nettle gnut=
ls
> bash libgcc"
> >
> >  RDEPENDS_${PN}-networking +=3D "iptables"
> >
> > -SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz=
 \
> > +SRC_URI =3D "
> http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
> >       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> >       file://run-ptest \
> >       file://lxc-fix-B-S.patch \
> > --
> > 2.31.0.rc2.261.g7f71774620-goog
> >
>
> >
> >=20
> >
>
>

--00000000000002c7ed05bd4ee88f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you for reviewing and merging it, Bruce.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I was sending it through regular =
=E2=80=9Cgit email=E2=80=9D with the configuration I have found in some in=
ternal guidelines from my company. I can ask around if there is something I=
 can do.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am working on=
 the dunfell branch and I see the issue there too; I just wanted to first s=
end the patch to the main branch because I thought that=E2=80=99s the first=
 step?</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Mar 11, 2021 at 7:51 PM Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">This will hit more than master, but for now, I&#39;ve=
 just merged this<br>
there, and will wait for problem reports on the other branches.<br>
<br>
Also, however this was sent, the Author field came through as<br>
invalid and the yocto hooks wouldn&#39;t let me push.<br>
<br>
I&#39;ve manually updated the Author field, and this is now merged.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH] lxc: change download folder<br>
on 11/03/2021 Robi Buranyi via <a href=3D"http://lists.yoctoproject.org" r=
el=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; The URI has been changed to &#39;<a href=3D"https://linuxcontainers.o=
rg/downloads/lxc" rel=3D"noreferrer" target=3D"_blank">https://linuxcontain=
ers.org/downloads/lxc</a>&#39;<br>
&gt; by the site maintainers recently. Updating the recipe to reflect the =
new<br>
&gt; path.<br>
&gt; <br>
&gt; Signed-off-by: Robi Buranyi &lt;<a href=3D"mailto:rburanyi@google.com=
" target=3D"_blank">rburanyi@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_4.0.6.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" r=
el=3D"noreferrer" target=3D"_blank">lxc_4.0.6.bb</a> b/recipes-containers/l=
xc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"noreferrer" target=3D"_blank">lxc=
_4.0.6.bb</a><br>
&gt; index ddff9af..b422909 100644<br>
&gt; --- a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_4.0.6.bb</a><br>
&gt; +++ b/recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_4.0.6.bb</a><br>
&gt; @@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettl=
e gnutls bash libgcc&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN}-networking +=3D &quot;iptables&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/$%=
7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://linu=
xcontainers.org/downloads/${BPN}-${PV}.tar.gz</a> \<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/$%=
7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc-1.0.0-disable-udhcp-from-busybox=
-template.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc-fix-B-S.patch \<br>
&gt; -- <br>
&gt; 2.31.0.rc2.261.g7f71774620-goog<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000002c7ed05bd4ee88f--
