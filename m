Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC57C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 14:45:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.17544.1714488323175117688
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 07:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=Lsn4oVWt;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.208.169, mailfrom: troth@openavr.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso71739831fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 07:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1714488321; x=1715093121; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/EJUFl6ZK5jjBI8dgGS8+IxG+0H/2cBJTmECSwStpQ=;
        b=Lsn4oVWtSjXR9My4WJudCOaNdWqnJ+L3lW0RslN8iYzAbNWVRJLma5e/sbYzfjZg0k
         uC0WYDUbzD4/I2U5gdU0H3MAf3o+MCHUAywYOvv2b7wT+Izy1RfKbY28TSmRluobRbYJ
         AZtkc5hLtt7nt8vH1zhT2Ot6kXncfSWOHIt+Qr/qo04obBklb/uNnTsqO1Rcc/gK3LwX
         WhaxfnZGnzfU8K3smzWqP3S25EcZnzommrkXhDxEkPY5NdIPrfhtw4tUatjMl/sJNRMM
         qL4SJqGVAKZg6KMjMH7ISG5gCAU2m1qRj7fTrPOZYaKT2qC2Urx76eBwM3bK1WhsmZk4
         2xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714488321; x=1715093121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/EJUFl6ZK5jjBI8dgGS8+IxG+0H/2cBJTmECSwStpQ=;
        b=GL+6ueD5dazBo+AG9sUlCJ4AMyyyghggOjGlLMB35Hzx/2rroCIr2EmZdHDLCDO90L
         Z+ccSHPPhY7pn+hWYExgbqD8IF9Z9FdycGBVbRL/TsPdCZbXrDXY1g35t+JElRQiAFyR
         BbwaeL3wHze5llmay6z+stAf461t01yYpJwVLHzHK35LJHT0HS5uuaoRzmx4abXBlKZg
         68XpipEB1wScIdBfFecqPR8TAbuHvR4ZBU+cZ8jfzjro6RAAgI8pumWPcUYg89AH6XHd
         9oTCWnBe/ya9Xd0eAogcp2B47kuaUxEgQMbwybv6Xd6pQCPG4HbGDksR4TcMMNY0kOTm
         I/qA==
X-Forwarded-Encrypted: i=1; AJvYcCWuu5aqbpZwpA9KXCcyNOnJ/Ephtd2A9BcG2apBdeLZICF+UQ7vsYSxKnPD3XTTWCAFdIBSNRS8rUMl1jJ87EZMunqPq4VWCYrVssnlEE3hBmmWgBZjafhG5vQ=
X-Gm-Message-State: AOJu0YznYhoFrKglBx+EKcWzYv20KaaCm0K7CN4Yo1Wmnritb7MwRHj6
	FsLacjoTMhVw4TRzxCAqzxhuxBxbTlWFWRRqUi8+Pyt1A+yC5naaalSeqULOftYr9ZN/LJ5Od1F
	IXywezUE7Lx/xNZAgrBvv5VxwybagtHhIMF39kA==
X-Google-Smtp-Source: AGHT+IEBBkupXidBwat3dBOO7a/pCBkqdH9SC9J7u/oYFYJERYWB12RsRWw39bHZ9FQbfAWFR+OHwS48plCnNb7s6b0=
X-Received: by 2002:a05:6512:3294:b0:51b:567e:7ea4 with SMTP id
 p20-20020a056512329400b0051b567e7ea4mr2042309lfe.26.1714488321104; Tue, 30
 Apr 2024 07:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240416225615.165473-1-lukasz.czechowski@thaumatec.com> <ZiZ8UpRSfDbkzocJ@gmail.com>
In-Reply-To: <ZiZ8UpRSfDbkzocJ@gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Tue, 30 Apr 2024 08:45:09 -0600
Message-ID: <CAFMvBt0fxFbmJwnXr1LSCyK2o+DK=tmBzfzQNQ8qiROaiXb-VQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] podman: fix location of user
 systemd service units
To: bruce.ashfield@gmail.com
Cc: lukasz.czechowski@thaumatec.com, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005a015b0617516ba1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 14:45:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8707

--0000000000005a015b0617516ba1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 9:03=E2=80=AFAM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

> merged to master and scarthgap.
>
> Bruce
>
> In message: [meta-virtualization][PATCH v2] podman: fix location of user
> systemd service units
> on 17/04/2024 lukasz.czechowski@thaumatec.com wrote:
>
> > From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> >
> > The value of USERSYSTEMDDIR is currently set to
> > ${systemd_unitdir}/user, which might not be present in user unit
> > search path.
> > Use dedicated bitbake variable ${systemd_user_unitdir} instead.
> >
> > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> > index 3eadd202..f69dec16 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -62,7 +62,7 @@ do_configure[noexec] =3D "1"
> >  EXTRA_OEMAKE =3D " \
> >       PREFIX=3D${prefix} BINDIR=3D${bindir} LIBEXECDIR=3D${libexecdir} =
\
> >       ETCDIR=3D${sysconfdir} TMPFILESDIR=3D${nonarch_libdir}/tmpfiles.d=
 \
> > -     SYSTEMDDIR=3D${systemd_unitdir}/system
> USERSYSTEMDDIR=3D${systemd_unitdir}/user \
> > +     SYSTEMDDIR=3D${systemd_unitdir}/system
> USERSYSTEMDDIR=3D${systemd_user_unitdir} \
> >  "
> >
> >  # remove 'docker' from the packageconfig if you don't want podman to
> > @@ -134,7 +134,7 @@ do_install_ptest () {
> >  FILES:${PN} +=3D " \
> >      ${systemd_unitdir}/system/* \
> >      ${nonarch_libdir}/systemd/* \
> > -    ${systemd_unitdir}/user/* \
> > +    ${systemd_user_unitdir/* \
>

Just noticed that this is missing the closing brace. This typo is on master
and scarthgap branches.

Would you like me to send a patch?

Ted Roth

--0000000000005a015b0617516ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 22, 2024 at 9:03=E2=80=AF=
AM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org" target=3D"_=
blank">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gm=
ail.com@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproj=
ect.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">merged to master and scarthgap.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH v2] podman: fix location of user sy=
stemd service units<br>
on 17/04/2024 <a href=3D"mailto:lukasz.czechowski@thaumatec.com" target=3D"=
_blank">lukasz.czechowski@thaumatec.com</a> wrote:<br>
<br>
&gt; From: Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechowski@thauma=
tec.com" target=3D"_blank">lukasz.czechowski@thaumatec.com</a>&gt;<br>
&gt; <br>
&gt; The value of USERSYSTEMDDIR is currently set to<br>
&gt; ${systemd_unitdir}/user, which might not be present in user unit<br>
&gt; search path.<br>
&gt; Use dedicated bitbake variable ${systemd_user_unitdir} instead.<br>
&gt; <br>
&gt; Signed-off-by: Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechows=
ki@thaumatec.com" target=3D"_blank">lukasz.czechowski@thaumatec.com</a>&gt;=
<br>
&gt; Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb=
" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containe=
rs/podman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">podman_git.bb</a><br>
&gt; index 3eadd202..f69dec16 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; @@ -62,7 +62,7 @@ do_configure[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PREFIX=3D${prefix} BINDIR=3D${bindir} LIBEXE=
CDIR=3D${libexecdir} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ETCDIR=3D${sysconfdir} TMPFILESDIR=3D${nonar=
ch_libdir}/tmpfiles.d \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SYSTEMDDIR=3D${systemd_unitdir}/system USERSYSTEM=
DDIR=3D${systemd_unitdir}/user \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SYSTEMDDIR=3D${systemd_unitdir}/system USERSYSTEM=
DDIR=3D${systemd_user_unitdir} \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # remove &#39;docker&#39; from the packageconfig if you don&#39;=
t want podman to<br>
&gt; @@ -134,7 +134,7 @@ do_install_ptest () {<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${nonarch_libdir}/systemd/* \<br>
&gt; -=C2=A0 =C2=A0 ${systemd_unitdir}/user/* \<br>
&gt; +=C2=A0 =C2=A0 ${systemd_user_unitdir/* \<br></blockquote><div><br></d=
iv><div>Just noticed that this is missing the closing brace. This typo is o=
n master and scarthgap branches.</div><div><br></div><div>Would you like me=
 to send a patch?<br></div><div><br></div><div>Ted Roth<br></div></div></di=
v>

--0000000000005a015b0617516ba1--

