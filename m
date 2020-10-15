Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.14199.1602773898392940754
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 07:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uPCYEDuX;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id x1so3451334eds.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Oct 2020 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jXrGcjEmV5TaURkQD1Oz0SBarPrHSHuwhyWtZTVu24=;
        b=uPCYEDuXdZT8cpK3cN1EPvcLSgHfyig4kCrlEwDw2euPSkl8ORa7K22JLX4AYytHXL
         SNLNkNyy0BuQ9Q5RecvN4hUsSQX3WOXNctlJIOafXMewUReQ5sxv2MBUXv5wTivujJaC
         Ib3WWYfTl8O6wIXDFv+gpL+Uuk/msVzQmGEUWZVOyVSddELSk2Li7yMZU+T8ZE+zwsMi
         6BuOK2FNYxfOqhSgFwYInXFn+4gH4Tu9gC5+qsB4f4m90Gp7wBdbVv97ulSr0T3/4H5G
         32P+4I+HUWa3IZ0KH3zyVP9jOAoPy8H3rrEYgXreaRQRHU8n1IeCzNafH13WsgDCshZG
         L/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jXrGcjEmV5TaURkQD1Oz0SBarPrHSHuwhyWtZTVu24=;
        b=rh4GQqb3xK9p/HlT63HJW6mtxxFfOqz48hnvaH4NOCXgN8HRWjHISpoenxPsI8XiAo
         QqHNdagfgGvf547aDOsd2GGdiASRUfHHvipauRLr3Rs6bZ1y77ai5POmuS4BpZTR+//k
         mDrKg7qW/ycz4jrdHUZtG8/SGdNv7JFgh9D970qZWHDaQQ51E4J3qv7+6LXNIkcIOhCv
         dShVunSFWei7VVfdy/xjkQYyXdxxYBEku7zWWJrlCQfJleC9DBGcASJ99d3ZtxoT19aF
         0CA8GhHpZgENEqPJexjqmpHHwIBdq1uPCGJc1LstNmSCeeKyTuq7ZbmLlLYlOhSk2glZ
         ODmQ==
X-Gm-Message-State: AOAM532/ozxTu6qTwJcR3rZjPf8Rx8E/4Pe/dcNGqIm4TgZLu3VRo6RU
	jfyZX9sfBHeUNAIlJHUtC/PXz7TEUBFiL5IULb8=
X-Google-Smtp-Source: ABdhPJy0sFEnPDGJnPP1gzH9kwRXYG+7S3LVh70FsDDrH7BCPxBwM+ByLIP/5T5OnIHvzX9VTB7k77zsnOL0F+zAeNU=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr4617899edb.129.1602773896864;
 Thu, 15 Oct 2020 07:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
 <163C52E32AF7858D.12576@lists.yoctoproject.org> <F3AE8A23-E5CE-4C57-8F4B-0E64B78F5CDE@arm.com>
 <CADkTA4Mk-0JPMNMg8fo+Xm2PgMhjH6XAu3ywxHS+F16duh-q1A@mail.gmail.com> <AAED5790-0D3F-47FF-BC61-1A229304EF65@arm.com>
In-Reply-To: <AAED5790-0D3F-47FF-BC61-1A229304EF65@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Oct 2020 10:58:05 -0400
Message-ID: <CADkTA4Pg5GCO88WZvhnK_pFYGswhdc16ZCibe1vT76jMxoMKGQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools installation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c7292005b1b6e0f6"

--000000000000c7292005b1b6e0f6
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 7:54 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

>
>
> > On 15 Oct 2020, at 12:44, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > I merged this yesterday, but it is held up in my breakage of containerd.
>
> Ok thanks for the info
>
>
And I got containerd to build again, so this was merged along with that fix.

Bruce



> Bertrand
>
> >
> > Bruce
> >
> > On Thu, Oct 15, 2020 at 5:28 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > Hi,
> >
> > Gentle ping :-)
> >
> > Cheers
> > Bertrand
> >
> > > On 9 Oct 2020, at 13:31, Bertrand Marquis via lists.yoctoproject.org
> <bertrand.marquis=arm.com@lists.yoctoproject.org> wrote:
> > >
> > > Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af
> > > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > > ---
> > > recipes-extended/xen/xen-tools.inc | 10 +++++-----
> > > 1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > > index ace1a01..736a766 100644
> > > --- a/recipes-extended/xen/xen-tools.inc
> > > +++ b/recipes-extended/xen/xen-tools.inc
> > > @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored = "virtual/xenstored"
> > >
> > > FILES_${PN}-dbg += "\
> > >     ${libdir}/xen/bin/.debug \
> > > -    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
> > > -    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> > > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
> > > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug
> \
> > >     ${libdir}/fs/xfs/.debug \
> > >     ${libdir}/fs/ufs/.debug \
> > >     ${libdir}/fs/ext2fs-lib/.debug \
> > > @@ -261,8 +261,8 @@ FILES_${PN}-dbg += "\
> > >     ${libdir}exec/.debug \
> > >     ${libdir}/xen/libexec/.debug \
> > >     ${bindir}/.debug \
> > > -    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > > -    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
> > > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug
> \
> > >     "
> > >
> > > FILES_${PN}-dev = "\
> > > @@ -497,7 +497,7 @@ FILES_${PN}-pygrub = "\
> > >     "
> > >
> > > FILES_${PN}-python = "\
> > > -    ${libdir}/${PYTHON_DIR} \
> > > +    ${nonarch_libdir}/${PYTHON_DIR} \
> > >     "
> > >
> > > FILES_${PN}-remus = "\
> > > --
> > > 2.17.1
> > >
> > >
> > > 
> > >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c7292005b1b6e0f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 15, 2020 at 7:54 AM Bertrand Marquis &l=
t;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On 15 Oct 2020, at 12:44, Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; I merged this yesterday, but it is held up in my breakage of containe=
rd.<br>
<br>
Ok thanks for the info<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">And I got containerd to build again, so this was merged a=
long with that fix.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Bertrand<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; On Thu, Oct 15, 2020 at 5:28 AM Bertrand Marquis &lt;<a href=3D"mailt=
o:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Gentle ping :-)<br>
&gt;<br>
&gt; Cheers<br>
&gt; Bertrand<br>
&gt;<br>
&gt; &gt; On 9 Oct 2020, at 13:31, Bertrand Marquis via <a href=3D"http://=
lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctopro=
ject.org</a> &lt;bertrand.marquis=3D<a href=3D"mailto:arm.com@lists.yoctopr=
oject.org" target=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af<br>
&gt; &gt; Signed-off-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.m=
arquis@arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; recipes-extended/xen/xen-tools.inc | 10 +++++-----<br>
&gt; &gt; 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extend=
ed/xen/xen-tools.inc<br>
&gt; &gt; index ace1a01..736a766 100644<br>
&gt; &gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; &gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; &gt; @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored =3D &quot;virtual/=
xenstored&quot;<br>
&gt; &gt;<br>
&gt; &gt; FILES_${PN}-dbg +=3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/.debug \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/site-packages/.debug \<br=
>
&gt; &gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/site-packages/xen/lowleve=
l/.debug \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.de=
bug \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen=
/lowlevel/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/xfs/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/ufs/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/ext2fs-lib/.debug \<br>
&gt; &gt; @@ -261,8 +261,8 @@ FILES_${PN}-dbg +=3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}exec/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${libdir}/xen/libexec/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0${bindir}/.debug \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/dist-packages/.debug \<br=
>
&gt; &gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowleve=
l/.debug \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.de=
bug \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen=
/lowlevel/.debug \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt; FILES_${PN}-dev =3D &quot;\<br>
&gt; &gt; @@ -497,7 +497,7 @@ FILES_${PN}-pygrub =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt; FILES_${PN}-python =3D &quot;\<br>
&gt; &gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR} \<br>
&gt; &gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt; FILES_${PN}-remus =3D &quot;\<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informati=
on in any medium. Thank you.<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000c7292005b1b6e0f6--
