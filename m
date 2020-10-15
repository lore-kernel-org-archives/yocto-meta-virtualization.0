Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.10157.1602762285976331347
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 04:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ut5ZYDv9;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id md26so3129769ejb.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Oct 2020 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTF+K3AQC8eIv0cFBA1acnnckdd8FVYTculHaslMfqo=;
        b=ut5ZYDv9zWFWRwJ3NGs+3aI0MT2HAzjwMEipuX5wJ2h+ob0NAveb1N6cldYuW0UQnd
         OXuBHgOAATIzLOhXz4MIb6CAMqX/mHQjhcY7F/D9lLTaBFyf8xlCl4A8O5oxjKfre2Oy
         U2Kaf86flXaQ2TwwuGPKkWlhrXx5LJbYyN7SVEsKb8gy3uU9oBYzDJ3XiiGixkkIs1wN
         PLAY1d6Yqq2+q3zk+BN2ij6YI0Z2VCSUBiKPhE8vALYBNasKIEZEGSSYj4KW/r2m5fjA
         xAEcYOn8UP6O52a8YejSdRX+Frse23rdXGxg1SaBn185V4Oa43a2WNghbeqs/LG3X1nq
         lgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTF+K3AQC8eIv0cFBA1acnnckdd8FVYTculHaslMfqo=;
        b=SaqWjtB90VR3cj3s9xGbCznB+kCU4noJd6Xh7yOvZCGkIGV5I05lflQ4ZRsU8u8ISu
         zAmo7tv4IuIay6PTHlbBX/pO/Km4fgQ19XewXvZ7vNufHa+dS1XniDOO72QjEa3fHZDg
         /gbZUepz7KrPvpYXrlM/pkVomA3Fh80HyK/heFuK+n8efwopyO7T3dUk2CCiQneqVm18
         JKN5vpjpVOIIouvHDTkjH0V21vQ/ckRRKv+ZMGpHzVrDylIXZWfM327HTktXHxyA/ZZe
         WQI0hjGi+wsb+hDu+Ncnbmcre5kZdIcys2WvLNSzulj/dGmz8lse69+c5PACyzjaMJTs
         TZIA==
X-Gm-Message-State: AOAM533kg4LKutDmY/Ee/1zvhDEe6TUKn7bPe6IOlRoXbxLtEup191S0
	AcXTjwBBZQfveNau8WmSC7soQdc9N38bdEfi4TU=
X-Google-Smtp-Source: ABdhPJxPo9DXu2u0bXtGm8GciBVFp6B9m00BoKd8yPmskyeg04XQn4facYqPdmqbuG3CDt0BQ98BJt2NeDvYZ6fe6uI=
X-Received: by 2002:a17:906:4695:: with SMTP id a21mr3877233ejr.357.1602762284487;
 Thu, 15 Oct 2020 04:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
 <163C52E32AF7858D.12576@lists.yoctoproject.org> <F3AE8A23-E5CE-4C57-8F4B-0E64B78F5CDE@arm.com>
In-Reply-To: <F3AE8A23-E5CE-4C57-8F4B-0E64B78F5CDE@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Oct 2020 07:44:33 -0400
Message-ID: <CADkTA4Mk-0JPMNMg8fo+Xm2PgMhjH6XAu3ywxHS+F16duh-q1A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools installation
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a05a7105b1b42c14"

--000000000000a05a7105b1b42c14
Content-Type: text/plain; charset="UTF-8"

I merged this yesterday, but it is held up in my breakage of containerd.

Bruce

On Thu, Oct 15, 2020 at 5:28 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi,
>
> Gentle ping :-)
>
> Cheers
> Bertrand
>
> > On 9 Oct 2020, at 13:31, Bertrand Marquis via lists.yoctoproject.org
> <bertrand.marquis=arm.com@lists.yoctoproject.org> wrote:
> >
> > Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > recipes-extended/xen/xen-tools.inc | 10 +++++-----
> > 1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> > index ace1a01..736a766 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored = "virtual/xenstored"
> >
> > FILES_${PN}-dbg += "\
> >     ${libdir}/xen/bin/.debug \
> > -    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
> > -    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> >     ${libdir}/fs/xfs/.debug \
> >     ${libdir}/fs/ufs/.debug \
> >     ${libdir}/fs/ext2fs-lib/.debug \
> > @@ -261,8 +261,8 @@ FILES_${PN}-dbg += "\
> >     ${libdir}exec/.debug \
> >     ${libdir}/xen/libexec/.debug \
> >     ${bindir}/.debug \
> > -    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > -    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
> >     "
> >
> > FILES_${PN}-dev = "\
> > @@ -497,7 +497,7 @@ FILES_${PN}-pygrub = "\
> >     "
> >
> > FILES_${PN}-python = "\
> > -    ${libdir}/${PYTHON_DIR} \
> > +    ${nonarch_libdir}/${PYTHON_DIR} \
> >     "
> >
> > FILES_${PN}-remus = "\
> > --
> > 2.17.1
> >
> >
> > 
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

--000000000000a05a7105b1b42c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I m=
erged this yesterday, but it is held up in my breakage of containerd.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 15, 20=
20 at 5:28 AM Bertrand Marquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.c=
om">Bertrand.Marquis@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi,<br>
<br>
Gentle ping :-)<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt; On 9 Oct 2020, at 13:31, Bertrand Marquis via <a href=3D"http://lists=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.=
org</a> &lt;bertrand.marquis=3D<a href=3D"mailto:arm.com@lists.yoctoproject=
.org" target=3D"_blank">arm.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af<br>
&gt; Signed-off-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marqui=
s@arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>&gt;<br>
&gt; ---<br>
&gt; recipes-extended/xen/xen-tools.inc | 10 +++++-----<br>
&gt; 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc<br>
&gt; index ace1a01..736a766 100644<br>
&gt; --- a/recipes-extended/xen/xen-tools.inc<br>
&gt; +++ b/recipes-extended/xen/xen-tools.inc<br>
&gt; @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored =3D &quot;virtual/xenst=
ored&quot;<br>
&gt;<br>
&gt; FILES_${PN}-dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/.debug \<br>
&gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/site-packages/.debug \<br>
&gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.de=
bug \<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \=
<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowl=
evel/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/xfs/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/ufs/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}/fs/ext2fs-lib/.debug \<br>
&gt; @@ -261,8 +261,8 @@ FILES_${PN}-dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}exec/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${libdir}/xen/libexec/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0${bindir}/.debug \<br>
&gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/dist-packages/.debug \<br>
&gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.de=
bug \<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \=
<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowl=
evel/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; FILES_${PN}-dev =3D &quot;\<br>
&gt; @@ -497,7 +497,7 @@ FILES_${PN}-pygrub =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; FILES_${PN}-python =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 ${libdir}/${PYTHON_DIR} \<br>
&gt; +=C2=A0 =C2=A0 ${nonarch_libdir}/${PYTHON_DIR} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; FILES_${PN}-remus =3D &quot;\<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
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
 - Gandalf, Star Trek II<br><br></div>

--000000000000a05a7105b1b42c14--
