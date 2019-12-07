Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.1240.1575725137641493708
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 07 Dec 2019 05:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KP4xRaL4;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id t2so10927542wrr.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Dec 2019 05:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AwyfkpZSZ3rL3768erp2Ppz5XEHWBppNz69vlNnqh7Q=;
        b=KP4xRaL46zhOj8g/Ls9wWUz+Wxv8fEmhXsqJM0rmrySJf1LaNeGo3KcmEUtd2Z9SJ6
         jedY3f8l8Nld3RWp0uxgILSuYiWsI9uWRz8zj2YBsCwfxDYFhXkxHW1mVLbbKb2c6yQL
         CjJ6wk4tS4TkAv3QiHa8lCuiCPRmIfOplfd5Emw2wpBtk2KvYCu7BAIKnSqRmBKzOPxM
         5O0k8ILovqeAeBM38/1O6Al51F04RyS87y8im/DVA+flmEvxWZWRTk3xiulvy7aHHv/G
         gvqfRpCLBPkCDmGmku/7Ypkecl4PUI7woFIN27MiFsc3cvkh6yGH+FcNUCttsSmZzIvs
         I3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AwyfkpZSZ3rL3768erp2Ppz5XEHWBppNz69vlNnqh7Q=;
        b=nT34f7me5geAPqZYN0uW3M7HPiGGugv6Z8fI17QP/tyAnfFpjGF0uD3Fv8+2mOfvHZ
         aveW8WZuec/mp9HwHDBveH47+xowpBNjwaLBdcNkIT7DQ/u0gv9zNHz+iCgjzZoHP2u6
         j302VZ6kdcXV19sR3OZUoZ1pbVwseVlhLM+SLwGz4WRS/X0aPJfNNiY+mTL4wqlkMsTU
         0EsPth5QltjWqz+Mh5c8E5EvU0izSxooxZroM6kAuPPcMtNsBG54coirkuBdXTwvZ0VG
         MLsFDkkG4yK8Y8vU71xIEUrBtLRxQ0yaIZLi+6lk0E+CZcfZ511nhRg3fa4yqZvi2dA8
         DwrA==
X-Gm-Message-State: APjAAAWwXoXwh+rDlITgnci0b2GykLi0V+Lg8d3b6xaK654sb4Lqea3I
	kuTF2J2u1d2Nl84wLY3/2HD9tx2OzUp6tb8ygtY=
X-Google-Smtp-Source: APXvYqwEaA7R/r8+V7n7bECc8C5d7+3dG/lGeEBiQQfLU70GO34N3leZsSHxFDo/vNlpB+p/6TVOeSlVe+aK8pKMLeQ=
X-Received: by 2002:adf:b645:: with SMTP id i5mr20786567wre.347.1575725136146;
 Sat, 07 Dec 2019 05:25:36 -0800 (PST)
MIME-Version: 1.0
References: <1575314833-10994-1-git-send-email-liu.ming50@gmail.com> <CADkTA4MB39xztYRKj-g=V63f1Zhp7S62UPuV9heOK-F9aOc0QQ@mail.gmail.com>
In-Reply-To: <CADkTA4MB39xztYRKj-g=V63f1Zhp7S62UPuV9heOK-F9aOc0QQ@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Sat, 7 Dec 2019 14:25:25 +0100
Message-ID: <CALatG=5P9fCk08_ggUz4OAs03DJBqcXmzN7KsNP3joWgTveHFw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] Uprev docker-compose to 1.25.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Stefan Agner <stefan.agner@toradex.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000000f75d05991d19fe"

--00000000000000f75d05991d19fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bruce:

I think I had introduced a regression for this "python3-docker-compose:
uprev to 1.25.0" commit, it depends on python3-paramiko and python3-nacl
but I forgot to add them, sorry for that.

I have just sent two more patches to add them in.

//Ming Liu

Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=
=886=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:08=E5=AF=AB=E9=81=93=
=EF=BC=9A

> merged
>
> Bruce
>
> On Mon, Dec 2, 2019 at 2:27 PM Ming Liu <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > This patch set mainly aims to uprev docker-compose to 1.25.0 and also
> > upgrade some of its dependencies to the latest release version.
> >
> > Test on a colibri-imx8x machine against:
> > https://docs.docker.com/compose/gettingstarted/
> >
> > Ming Liu (3):
> >   python-docker-pycreds: uprev to 0.4.0
> >   python-docker: uprev to 4.1.0
> >   python3-docker-compose: uprev to 1.25.0
> >
> >  ...up.py-remove-maximum-version-requirements.patch | 33
> +++++++++++----------
> >  .../python3-docker-compose_1.21.2.bb               | 31
> --------------------
> >  .../python3-docker-compose_1.25.0.bb               | 34
> ++++++++++++++++++++++
> >  recipes-devtools/python/python-docker-pycreds.inc  |  4 +--
> >  ...eds_0.3.0.bb =3D> python-docker-pycreds_0.4.0.bb} |  0
> >  recipes-devtools/python/python-docker.inc          |  4 +--
> >  ...thon-docker_3.4.0.bb =3D> python-docker_4.1.0.bb} |  0
> >  ...ds_0.3.0.bb =3D> python3-docker-pycreds_0.4.0.bb} |  0
> >  ...on3-docker_3.4.0.bb =3D> python3-docker_4.1.0.bb} |  0
> >  9 files changed, 55 insertions(+), 51 deletions(-)
> >  delete mode 100644 recipes-containers/docker-compose/
> python3-docker-compose_1.21.2.bb
> >  create mode 100644 recipes-containers/docker-compose/
> python3-docker-compose_1.25.0.bb
> >  rename recipes-devtools/python/{python-docker-pycreds_0.3.0.bb =3D>
> python-docker-pycreds_0.4.0.bb} (100%)
> >  rename recipes-devtools/python/{python-docker_3.4.0.bb =3D>
> python-docker_4.1.0.bb} (100%)
> >  rename recipes-devtools/python/{python3-docker-pycreds_0.3.0.bb =3D>
> python3-docker-pycreds_0.4.0.bb} (100%)
> >  rename recipes-devtools/python/{python3-docker_3.4.0.bb =3D>
> python3-docker_4.1.0.bb} (100%)
> >
> > --
> > 2.7.4
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4799):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4799
> > Mute This Topic: https://lists.yoctoproject.org/mt/65175066/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000000f75d05991d19fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>I think I had introduced a r=
egression for this &quot;python3-docker-compose: uprev to 1.25.0&quot; comm=
it, it depends on=C2=A0python3-paramiko and=C2=A0python3-nacl but I forgot =
to add them, sorry for that.</div><div><br></div><div>I have just sent two =
more patches to add them in.</div><div><br></div><div>//Ming Liu</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=886=E6=97=A5 =E9=80=B1=E4=
=BA=94 =E4=B8=8B=E5=8D=888:08=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">merged<br>
<br>
Bruce<br>
<br>
On Mon, Dec 2, 2019 at 2:27 PM Ming Liu &lt;<a href=3D"mailto:liu.ming50@gm=
ail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This patch set mainly aims to uprev docker-compose to 1.25.0 and also<=
br>
&gt; upgrade some of its dependencies to the latest release version.<br>
&gt;<br>
&gt; Test on a colibri-imx8x machine against:<br>
&gt; <a href=3D"https://docs.docker.com/compose/gettingstarted/" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.docker.com/compose/gettingstarted/<=
/a><br>
&gt;<br>
&gt; Ming Liu (3):<br>
&gt;=C2=A0 =C2=A0python-docker-pycreds: uprev to 0.4.0<br>
&gt;=C2=A0 =C2=A0python-docker: uprev to 4.1.0<br>
&gt;=C2=A0 =C2=A0python3-docker-compose: uprev to 1.25.0<br>
&gt;<br>
&gt;=C2=A0 ...up.py-remove-maximum-version-requirements.patch | 33 ++++++++=
+++----------<br>
&gt;=C2=A0 .../<a href=3D"http://python3-docker-compose_1.21.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-docker-compose_1.21.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 --------------------<br>
&gt;=C2=A0 .../<a href=3D"http://python3-docker-compose_1.25.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-docker-compose_1.25.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++++++++<br=
>
&gt;=C2=A0 recipes-devtools/python/python-docker-pycreds.inc=C2=A0 |=C2=A0 =
4 +--<br>
&gt;=C2=A0 ...<a href=3D"http://eds_0.3.0.bb" rel=3D"noreferrer" target=3D"=
_blank">eds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python-docker-pycreds_0.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0.4.0.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 recipes-devtools/python/python-docker.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +--<br>
&gt;=C2=A0 ...<a href=3D"http://thon-docker_3.4.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">thon-docker_3.4.0.bb</a> =3D&gt; <a href=3D"http://python-d=
ocker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_4.1.0.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://ds_0.3.0.bb" rel=3D"noreferrer" target=3D"_=
blank">ds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python3-docker-pycreds_0.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.4.0.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://on3-docker_3.4.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">on3-docker_3.4.0.bb</a> =3D&gt; <a href=3D"http://python3-do=
cker_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker_4.1.0.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 9 files changed, 55 insertions(+), 51 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 recipes-containers/docker-compose/<a href=3D"=
http://python3-docker-compose_1.21.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-docker-compose_1.21.2.bb</a><br>
&gt;=C2=A0 create mode 100644 recipes-containers/docker-compose/<a href=3D"=
http://python3-docker-compose_1.25.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-docker-compose_1.25.0.bb</a><br>
&gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://python-docker-=
pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycred=
s_0.3.0.bb</a> =3D&gt; <a href=3D"http://python-docker-pycreds_0.4.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0.4.0.bb</a>} (100=
%)<br>
&gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://python-docker_=
3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_3.4.0.bb</a> =
=3D&gt; <a href=3D"http://python-docker_4.1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python-docker_4.1.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://python3-docker=
-pycreds_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycr=
eds_0.3.0.bb</a> =3D&gt; <a href=3D"http://python3-docker-pycreds_0.4.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.4.0.bb</a>} =
(100%)<br>
&gt;=C2=A0 rename recipes-devtools/python/{<a href=3D"http://python3-docker=
_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker_3.4.0.bb</a>=
 =3D&gt; <a href=3D"http://python3-docker_4.1.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-docker_4.1.0.bb</a>} (100%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt;<br>
&gt; View/Reply Online (#4799): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/4799" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/4799</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/65175066=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/65175066/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--00000000000000f75d05991d19fe--
