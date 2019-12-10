Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.7647.1575969314336141323
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 01:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mUC8cwmR;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id n9so2264002wmd.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2019 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OrMDUV5MwLlteqYdzB7evvJSDZsZtwRU7nHzu8aPTUA=;
        b=mUC8cwmRF7M3F/yDGHPaJc5+Qi7puyPdsT8VpmB+DdCMg+6iI7VblYAsJjs0SqMGLA
         wny7oZkHElbGUb4kLKCQN3xozoJr2/UCp5Oh8WoFRbVBD/5MOtnFmU5Kfu858x0OSlM+
         QBctC72CDg6AhMPt+JVtdOPRYAzDysGQkGYMyq0UG37z8dK01SKkE2IARrmSBh4+Ua1I
         DLli/I5Ksv7mzWeTpBZk/GYzosMKWeZAy433F/1+DX0SYnWalF3xScvYe+TJ5GKGro60
         uABG72a3uZ5RetLu86VjtEpH/v/1Kzh7nQVXwTdjacsesdAJCxbFr2xn7TjBdhcb6iN1
         gh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OrMDUV5MwLlteqYdzB7evvJSDZsZtwRU7nHzu8aPTUA=;
        b=OYVxsujxGYnE6S3Xt+VAZhpcqHIi1LwxmtbPfmm5tXyKEyLAcfnPU3LC/AtCEdqw9M
         DF8n7ARXWztbIj9M92I4+V0AYGsyfBcgc22iSGZ2plN0EPFuSNIXP4dtKNtIYglrjJPE
         4Ui06ZLfjONYhtqKeYnhvw5N8/ILp1lifF6drzKzVd3LelbN1yj6j/yIxlP2zI32sT5h
         pNABDBGpsOJvsp/nxm5XKEVXsdYB6rZAiE8T6XSbtlFIQMqA3CyvTAWro94ChZ5IfQbk
         L+eyWAYj3V5sqc7NmgV6bvRFAPs9FQURGQpWLiyYmgCjHXc49foL0GIsCwFSeE9J5VBa
         uKvQ==
X-Gm-Message-State: APjAAAWw3u7nLPRDO/JgeThku/1rQPq8iMyygiiGWfDu3XdPyrWbC3+0
	ILFqJViSdkO3xP3uKxPtmOtfVD5Twg9W61YEDb0=
X-Google-Smtp-Source: APXvYqz3ihFnaAP1Dm+WRO+Kk84ZlVAtdKr5F6O5wG9t8aRbu2lSya8vVnF0WyXYugfnrxzY/P9bd1PyMPaOo7cIk6k=
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr4053858wma.5.1575969312762;
 Tue, 10 Dec 2019 01:15:12 -0800 (PST)
MIME-Version: 1.0
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com>
 <CADkTA4MB39xztYRKj-g=V63f1Zhp7S62UPuV9heOK-F9aOc0QQ@mail.gmail.com>
 <CALatG=5P9fCk08_ggUz4OAs03DJBqcXmzN7KsNP3joWgTveHFw@mail.gmail.com> <CADkTA4NTeqvmEG386aEW8f6DetJtYpuioLCDdyGTvdFvsr1PUw@mail.gmail.com>
In-Reply-To: <CADkTA4NTeqvmEG386aEW8f6DetJtYpuioLCDdyGTvdFvsr1PUw@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Tue, 10 Dec 2019 10:15:01 +0100
Message-ID: <CALatG=7gCSJPoeFqFeiiPVW=PGkicYtwfL7Xi6k-m+4SDLCRYw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Uprev docker-compose to 1.25.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000010702a059955f301"

--00000000000010702a059955f301
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thanks!

//Ming Liu

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=
=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:11=E5=AF=AB=E9=81=93=
=EF=BC=9A

> On Sat, Dec 7, 2019 at 8:25 AM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > Hi, Bruce:
> >
> > I think I had introduced a regression for this "python3-docker-compose:
> uprev to 1.25.0" commit, it depends on python3-paramiko and python3-nacl
> but I forgot to add them, sorry for that.
> >
> > I have just sent two more patches to add them in.
>
> And they are now merged.
>
> Bruce
>
> >
> > //Ming Liu
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=
=9C=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:08=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >>
> >> merged
> >>
> >> Bruce
> >>
> >> On Mon, Dec 2, 2019 at 2:27 PM Ming Liu <liu.ming50@gmail.com> wrote:
> >> >
> >> > From: Ming Liu <liu.ming50@gmail.com>
> >> >
> >> > This patch set mainly aims to uprev docker-compose to 1.25.0 and als=
o
> >> > upgrade some of its dependencies to the latest release version.
> >> >
> >> > Test on a colibri-imx8x machine against:
> >> > https://docs.docker.com/compose/gettingstarted/
> >> >
> >> > Ming Liu (3):
> >> >   python-docker-pycreds: uprev to 0.4.0
> >> >   python-docker: uprev to 4.1.0
> >> >   python3-docker-compose: uprev to 1.25.0
> >> >
> >> >  ...up.py-remove-maximum-version-requirements.patch | 33
> +++++++++++----------
> >> >  .../python3-docker-compose_1.21.2.bb               | 31
> --------------------
> >> >  .../python3-docker-compose_1.25.0.bb               | 34
> ++++++++++++++++++++++
> >> >  recipes-devtools/python/python-docker-pycreds.inc  |  4 +--
> >> >  ...eds_0.3.0.bb =3D> python-docker-pycreds_0.4.0.bb} |  0
> >> >  recipes-devtools/python/python-docker.inc          |  4 +--
> >> >  ...thon-docker_3.4.0.bb =3D> python-docker_4.1.0.bb} |  0
> >> >  ...ds_0.3.0.bb =3D> python3-docker-pycreds_0.4.0.bb} |  0
> >> >  ...on3-docker_3.4.0.bb =3D> python3-docker_4.1.0.bb} |  0
> >> >  9 files changed, 55 insertions(+), 51 deletions(-)
> >> >  delete mode 100644 recipes-containers/docker-compose/
> python3-docker-compose_1.21.2.bb
> >> >  create mode 100644 recipes-containers/docker-compose/
> python3-docker-compose_1.25.0.bb
> >> >  rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb =3D>
> python-docker-pycreds_0.4.0.bb} (100%)
> >> >  rename recipes-devtools/python/{python-docker_3.4.0.bb =3D>
> python-docker_4.1.0.bb} (100%)
> >> >  rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb =3D=
>
> python3-docker-pycreds_0.4.0.bb} (100%)
> >> >  rename recipes-devtools/python/{python3-docker_3.4.0.bb =3D>
> python3-docker_4.1.0.bb} (100%)
> >> >
> >> > --
> >> > 2.7.4
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> >
> >> > View/Reply Online (#4799):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4799
> >> > Mute This Topic: https://lists.yoctoproject.org/mt/65175066/1050810
> >> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub  [
> bruce.ashfield@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000010702a059955f301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks!=C2=A0<br><div><br></div><div>//Ming Liu</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashf=
ield@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=8810=E6=97=A5 =E9=80=
=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:11=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Dec 7, 2019 at 8:25 =
AM Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">l=
iu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi, Bruce:<br>
&gt;<br>
&gt; I think I had introduced a regression for this &quot;python3-docker-co=
mpose: uprev to 1.25.0&quot; commit, it depends on python3-paramiko and pyt=
hon3-nacl but I forgot to add them, sorry for that.<br>
&gt;<br>
&gt; I have just sent two more patches to add them in.<br>
<br>
And they are now merged.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; //Ming Liu<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=
=9C=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:08=E5=AF=AB=E9=81=
=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; merged<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Dec 2, 2019 at 2:27 PM Ming Liu &lt;<a href=3D"mailto:liu.=
ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patch set mainly aims to uprev docker-compose to 1.25.0 =
and also<br>
&gt;&gt; &gt; upgrade some of its dependencies to the latest release versio=
n.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Test on a colibri-imx8x machine against:<br>
&gt;&gt; &gt; <a href=3D"https://docs.docker.com/compose/gettingstarted/" r=
el=3D"noreferrer" target=3D"_blank">https://docs.docker.com/compose/getting=
started/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ming Liu (3):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python-docker-pycreds: uprev to 0.4.0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python-docker: uprev to 4.1.0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-docker-compose: uprev to 1.25.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 ...up.py-remove-maximum-version-requirements.patch | 33=
 +++++++++++----------<br>
&gt;&gt; &gt;=C2=A0 .../<a href=3D"http://python3-docker-compose_1.21.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-docker-compose_1.21.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ---------------=
-----<br>
&gt;&gt; &gt;=C2=A0 .../<a href=3D"http://python3-docker-compose_1.25.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-docker-compose_1.25.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 +++++++++++++++=
+++++++<br>
&gt;&gt; &gt;=C2=A0 recipes-devtools/python/python-docker-pycreds.inc=C2=A0=
 |=C2=A0 4 +--<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://eds_0.3.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">eds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python-docker-p=
ycreds_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds=
_0.4.0.bb</a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 recipes-devtools/python/python-docker.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://thon-docker_3.4.0.bb" rel=3D"noref=
errer" target=3D"_blank">thon-docker_3.4.0.bb</a> =3D&gt; <a href=3D"http:/=
/python-docker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker=
_4.1.0.bb</a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://ds_0.3.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python3-docker-py=
creds_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds=
_0.4.0.bb</a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://on3-docker_3.4.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">on3-docker_3.4.0.bb</a> =3D&gt; <a href=3D"http://p=
ython3-docker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker=
_4.1.0.bb</a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 9 files changed, 55 insertions(+), 51 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 recipes-containers/docker-compose/<a=
 href=3D"http://python3-docker-compose_1.21.2.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-docker-compose_1.21.2.bb</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 recipes-containers/docker-compose/<a=
 href=3D"http://python3-docker-compose_1.25.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-docker-compose_1.25.0.bb</a><br>
&gt;&gt; &gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://pytho=
n-docker-pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-dock=
er-pycreds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python-docker-pycreds_0.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0.4.0.bb<=
/a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://pytho=
n-docker_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_3.4.0=
.bb</a> =3D&gt; <a href=3D"http://python-docker_4.1.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python-docker_4.1.0.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://pytho=
n3-docker-pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-do=
cker-pycreds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python3-docker-pycreds_=
0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.4.0=
.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://pytho=
n3-docker_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker_3.4=
.0.bb</a> =3D&gt; <a href=3D"http://python3-docker_4.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-docker_4.1.0.bb</a>} (100%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.7.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; View/Reply Online (#4799): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/4799" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.yoctoproject.org/g/meta-virtualization/message/4799</a>=
<br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/65175066/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/mt/65175066/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoc=
toproject.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--00000000000010702a059955f301--
