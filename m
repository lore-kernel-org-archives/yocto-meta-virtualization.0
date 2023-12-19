Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5E5C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 08:34:58 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.8025.1702974897125247759
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 00:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zb3bDq6J;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: liu.ming50@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3dee5f534so2113135ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 00:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702974896; x=1703579696; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9w5C3r5lsR9gwB+IIPto37RyCWSKDXpQ49Exz+MzIjw=;
        b=Zb3bDq6J5w3Qcz1P7Kp4DGu71YbxSyTgQbycDd1Tu1LyK6rRjW93LeBupmr5x8xQsE
         ngWR/Jl8PLwwfl2lymgBJQEsb2mUq67zXG7PQtaAJ3vThARyxIPmSgGbgckAdd5ksvaa
         CUnWlx4x3DlSffFxHO1ASdXq7CX+ZVZUSU7Chnnqjx2mbfXQpC+tWJszd13WTlK3EdJX
         fkO8viL5EFs5kNzto6pp4KPi53ZZWjwHmDbFFcMGoDy6RYNuYIzeJ2eATA5/wdPVDghd
         0qmVPIboqSPztfp8kNG/3N6GSq+Kd4OCZM/xu87JIxp9l36w/vT+o3SIrFzs4dAU5WYM
         gpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702974896; x=1703579696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w5C3r5lsR9gwB+IIPto37RyCWSKDXpQ49Exz+MzIjw=;
        b=dB0+vs3Ra2nI0X9PWM29sPPO8CiFbYbu23fA0fEr3ELxLvzorzEyZeJ1x9TKSzkgoL
         Kv1G75v3yYr0x5WNj2ORZmgo3fWm3iFL6OXAWv+J10tb1jY2lqGVZe+P28UabTJ/3HjX
         ZK9Z8M+g1eIEvDD3WJtHs6jc88XynuReiB5R43JdxgOtp3c5j3/Ju9MaJbQROolwqyjb
         Uh9bxAzAOyMvYigIWPC42h/AwRfApa2ddpyVJmuPk8kGah6zXlG5yyFSZMQ5LMZ9heqn
         WDlnNNl4NkmR9eiggSkKfG2SYNMN2lMfo/XPi+HQ2UUyC16NFSJtcPjV5MOUGGmAL1LX
         HXrg==
X-Gm-Message-State: AOJu0Yx6pj04uNVJn4LzEzHLpDC6VzNtDv7PUu/tuJ5GIbQAEviVDNhN
	VQ1Yl1imxkoFolfmLbsn3Rw8vKcm2RBufFCn4yE=
X-Google-Smtp-Source: AGHT+IEzz8GBPVmQm6ikt/mua3xQrMRUs8DSDM7rYrVooworUHG2lHmSubhXyj5V6bU/h2F2JXUv4qzK7nOdsfgCklU=
X-Received: by 2002:a17:90a:6f06:b0:28b:c1a9:97c2 with SMTP id
 d6-20020a17090a6f0600b0028bc1a997c2mr158021pjk.12.1702974895633; Tue, 19 Dec
 2023 00:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20231216102601.54277-1-liu.ming50@gmail.com> <ZYEH8GQs9IbnUptj@gmail.com>
In-Reply-To: <ZYEH8GQs9IbnUptj@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 19 Dec 2023 09:34:44 +0100
Message-ID: <CALatG=6otBjmxvtkvr04XZ_5Yyuux40jT7Z31B9j4fD_e+sceg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker-compose: introduce pkgconfig docker-plugin
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b73a36060cd8bdff"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 08:34:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8516

--000000000000b73a36060cd8bdff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce:

Yes, I tested it for both docker and podman, will update readme file.

the best,
thank you

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2023=E5=B9=B412=E6=9C=
=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=81=93=
=EF=BC=9A

> In message: [meta-virtualization][PATCH] docker-compose: introduce
> pkgconfig docker-plugin
> on 16/12/2023 Ming Liu wrote:
>
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > This allows docker-compose choose to be built as a docker plugin or a
> > standalone binary, in the later case, docker-compose does not have to
> > rdepends on docker, so nother container tools like podman can also use
> > it.
>
> That's how it used to be installed, but upstream broke it for a bit.
>
> Did you test both modes ? If so, it would be nice to get a follow up
> patch in the form of a README in the recipe directory that indicates
> the test steps. That'll allow me to automate it in the future.
>
> For now, I've staged this on master next, while we wait for those
> test instructions.
>
> Bruce
>
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  .../docker-compose/docker-compose_git.bb       | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/recipes-containers/docker-compose/docker-compose_git.bb
> b/recipes-containers/docker-compose/docker-compose_git.bb
> > index 092ce3d2..b7745f2b 100644
> > --- a/recipes-containers/docker-compose/docker-compose_git.bb
> > +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> > @@ -34,7 +34,8 @@ COMPATIBLE_HOST =3D "^(?!mips).*"
> >
> >  do_configure[noexec] =3D "1"
> >
> > -PACKAGECONFIG ?=3D ""
> > +PACKAGECONFIG ?=3D "docker-plugin"
> > +PACKAGECONFIG[docker-plugin] =3D ",,,docker"
> >
> >  include relocation.inc
> >
> > @@ -63,16 +64,15 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -        #install -d "${D}${BIN_PREFIX}/bin"
> > -        #install -m 755 "${S}/src/import/bin/docker-compose"
> "${D}${BIN_PREFIX}/bin"
> > -
> > -     # commonly installed to: /usr/lib/docker/cli-plugins/
> > -     install -d "${D}${nonarch_libdir}/docker/cli-plugins/"
> > -     install -m 755 "${S}/src/import/bin/docker-compose"
> "${D}${nonarch_libdir}/docker/cli-plugins/"
> > -
> > +     if ${@bb.utils.contains('PACKAGECONFIG', 'docker-plugin', 'true',
> 'false', d)}; then
> > +             install -d ${D}${nonarch_libdir}/docker/cli-plugins
> > +             install -m 755 ${S}/src/import/bin/docker-compose
> ${D}${nonarch_libdir}/docker/cli-plugins
> > +     else
> > +             install -d ${D}${bindir}
> > +             install -m 755 ${S}/src/import/bin/docker-compose
> ${D}${bindir}
> > +     fi
> >  }
> >
> > -RDEPENDS:${PN} +=3D " docker"
> >
> >  FILES:${PN} +=3D " ${nonarch_libdir}/docker/cli-plugins/"
> >
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8510):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8510
> > Mute This Topic: https://lists.yoctoproject.org/mt/103206987/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000b73a36060cd8bdff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>Yes, I tested it for both do=
cker and podman, will update readme file.</div><div><br></div><div>the best=
,</div><div>thank you</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfi=
eld@gmail.com">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2023=E5=B9=B412=
=E6=9C=8819=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
In message: [meta-virtualization][PATCH] docker-compose: introduce pkgconfi=
g docker-plugin<br>
on 16/12/2023 Ming Liu wrote:<br>
<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This allows docker-compose choose to be built as a docker plugin or a<=
br>
&gt; standalone binary, in the later case, docker-compose does not have to<=
br>
&gt; rdepends on docker, so nother container tools like podman can also use=
<br>
&gt; it.<br>
<br>
That&#39;s how it used to be installed, but upstream broke it for a bit.<br=
>
<br>
Did you test both modes ? If so, it would be nice to get a follow up<br>
patch in the form of a README in the recipe directory that indicates<br>
the test steps. That&#39;ll allow me to automate it in the future.<br>
<br>
For now, I&#39;ve staged this on master next, while we wait for those<br>
test instructions.<br>
<br>
Bruce<br>
<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../docker-compose/<a href=3D"http://docker-compose_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 18 +++++++++---------<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/docker-compose/<a href=3D"http://docke=
r-compose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.b=
b</a> b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
&gt; index 092ce3d2..b7745f2b 100644<br>
&gt; --- a/recipes-containers/docker-compose/<a href=3D"http://docker-compo=
se_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><b=
r>
&gt; +++ b/recipes-containers/docker-compose/<a href=3D"http://docker-compo=
se_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><b=
r>
&gt; @@ -34,7 +34,8 @@ COMPATIBLE_HOST =3D &quot;^(?!mips).*&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_configure[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG ?=3D &quot;docker-plugin&quot;<br>
&gt; +PACKAGECONFIG[docker-plugin] =3D &quot;,,,docker&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 include relocation.inc<br>
&gt;=C2=A0 <br>
&gt; @@ -63,16 +64,15 @@ do_compile() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 #install -d &quot;${D}${BIN_PREFIX}/bin&q=
uot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 #install -m 755 &quot;${S}/src/import/bin=
/docker-compose&quot; &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# commonly installed to: /usr/lib/docker/cli-plug=
ins/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${nonarch_libdir}/docker/cli=
-plugins/&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -m 755 &quot;${S}/src/import/bin/docker-c=
ompose&quot; &quot;${D}${nonarch_libdir}/docker/cli-plugins/&quot;<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, =
&#39;docker-plugin&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${nona=
rch_libdir}/docker/cli-plugins<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${S}/s=
rc/import/bin/docker-compose ${D}${nonarch_libdir}/docker/cli-plugins<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bind=
ir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${S}/s=
rc/import/bin/docker-compose ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -RDEPENDS:${PN} +=3D &quot; docker&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; ${nonarch_libdir}/docker/cli-plugins/&qu=
ot;<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8510): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8510" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8510</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10320698=
7/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/103206987/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000b73a36060cd8bdff--

