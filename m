Return-Path: <minipada@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2FD2E00D1B; Thu, 31 Jan 2019 00:15:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (minipada[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D33FE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Jan 2019 00:14:59 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id p6so1491935wmc.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Jan 2019 00:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zjKzMU2H57l0oqtxhTttWKdF4yehji35M0XN1atuMbo=;
	b=JM5q+Q7WGb4cjfKaegZwj/+MyP+njI8i9YEaizMlw51jqzB+9/UaGUWyiBZMlxocj9
	ci7u/JGdzP8Sp0z4bippAbv42jQLrRfW0Db2u0GFjQZ7lvHOJRSnlSA2gc9YD4SOaHzL
	pKgkvmpaYBqucBNic27uxJzB3Fnk5uQz5Kz7I2nFAY1IF1TdnqnAunsoeEmL+FFbGsNB
	qKdKrieHdzWMaQzXc5/Ee//mdjS9H07yQrqJqFWVp5LHbOfwosonaUIJoGvxlNAH6iE/
	OMGqjSK1ZmbqiOFaj2CZjTiNmvsnDCqHJiDUNaOmPfDiHYdxyTZbGUTvbSab0CSyBUT7
	roWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zjKzMU2H57l0oqtxhTttWKdF4yehji35M0XN1atuMbo=;
	b=fpsswCd3W8xj8FCrTPrXrsbJ7XscWGYOcpSBK4MoLJNlKc4vy7d6wsQCLZBNg1T440
	wG+80vC4gwcO+38eDHUljxJLktGsiTluxhA/eL2kVGa4hcEA2NKzfsJSSLaQ4kpdB8Ef
	cyu3SQyFMV33CpFcSP7wADUMu+Afbx7MT95QUZ38nxBikPdls0PAIJvvAioCrh5nurDF
	OZ+3k9XTZTlWNOTSno0SyKpzY/k/rZW4Hmm054+bnCMPS9quiXe0iGNMVhpOTzE8yjsJ
	SyvaboRnIGni5uypBPKnPEdpcJzVkUX8z/5O4pQKmNpkKRUCeJN9D3CXGz+kMRLs+Osi
	UAnw==
X-Gm-Message-State: AJcUukeYUHN7ORrVsvS/zHS/GMBQW1trBxU4DPfo4O7k0YnJFTe3WxMc
	14kUGspKET1JTqyWepxusqLvOqKs349/ptVZzg==
X-Google-Smtp-Source: ALg8bN4LKRydDv0OzxYEZzpyo1ihm7vV52gMkOc2ejgI1Fawbvrpyn3gBKxDwvKvUaDEm35HSNE2efZ+kcsFTSF1VEM=
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr26740321wme.94.1548922497927; 
	Thu, 31 Jan 2019 00:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20190125131920.5173-1-dbensoussan@synapticon.com>
	<CADkTA4PAv-Ez7A9H57=MdWHqEYw_DmLQpRKeG9MyrjXup0POYg@mail.gmail.com>
In-Reply-To: <CADkTA4PAv-Ez7A9H57=MdWHqEYw_DmLQpRKeG9MyrjXup0POYg@mail.gmail.com>
From: david bensoussan <minipada@gmail.com>
Date: Thu, 31 Jan 2019 09:14:44 +0100
Message-ID: <CALxi_JG3+8ZNNH6fQHA3+k9rSnO5jyOEM09Zgh4eBbJNJ+qHhg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: David Bensoussan <dbensoussan@synapticon.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-docker-pycreds & python-docker: Add recipe for python2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2019 08:15:01 -0000
Content-Type: multipart/alternative; boundary="0000000000004610dd0580bc9f21"

--0000000000004610dd0580bc9f21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would need it for sumo. Could you cherry pick it and add it there?

On Wed, 30 Jan 2019, 08:04 Bruce Ashfield, <bruce.ashfield@gmail.com> wrote=
:

> What branch is this for ? The following is already on master:
>
> commit cbefd4d88c0878c259c53c02a61b713679379124
> Author: Ting Yu <tyu@cisco.com>
> Date:   Thu Dec 13 20:41:04 2018 +0000
>
>     add the py2 version for python-docker and python-docker-pycreds
> packages
>
>     add the py2 version for python-docker and python-docker-pycreds
> packages.
>     add python-six and python-backport_ssl (for ph2 only) as
> python-docker dependencies.
>
>     verify the connection to docker engine at run time -
>     >>> import docker
>     >>> client =3D docker.from_env()
>     >>> client.images.list()
>     [<Image: 'hello-world:latest'>]
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> :000000 100644 0000000 ca0995f A
> recipes-devtools/python/python-docker-pycreds.inc
>
> Which obviously will conflict with the python-docker-pycreds.inc that
> you have below.
>
> Cheers,
>
> Bruce
>
> On Fri, Jan 25, 2019 at 8:19 AM David Bensoussan <minipada@gmail.com>
> wrote:
> >
> > ---
> >  recipes-devtools/python/python-docker-pycreds.inc   |  7 +++++++
> >  .../python/python-docker-pycreds_0.2.1.bb           |  3 +++
> >  recipes-devtools/python/python-docker.inc           |  5 +++++
> >  recipes-devtools/python/python-docker_2.5.1.bb      | 11 +++++++++++
> >  .../python/python3-docker-pycreds_0.2.1.bb          |  8 +-------
> >  recipes-devtools/python/python3-docker_2.5.1.bb     | 13 +++----------
> >  6 files changed, 30 insertions(+), 17 deletions(-)
> >  create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
> >  create mode 100644 recipes-devtools/python/
> python-docker-pycreds_0.2.1.bb
> >  create mode 100644 recipes-devtools/python/python-docker.inc
> >  create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb
> >
> > diff --git a/recipes-devtools/python/python-docker-pycreds.inc
> b/recipes-devtools/python/python-docker-pycreds.inc
> > new file mode 100644
> > index 0000000..e76267d
> > --- /dev/null
> > +++ b/recipes-devtools/python/python-docker-pycreds.inc
> > @@ -0,0 +1,7 @@
> > +SUMMARY =3D "Python bindings for the docker credentials store API"
> > +HOMEPAGE =3D "https://github.com/shin-/dockerpy-creds"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +
> > +SRC_URI[md5sum] =3D "0d80d5aebab771faf7e422b759c3055b"
> > +SRC_URI[sha256sum] =3D
> "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
> > diff --git a/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
> b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
> > new file mode 100644
> > index 0000000..f6ddc8d
> > --- /dev/null
> > +++ b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
> > @@ -0,0 +1,3 @@
> > +inherit pypi setuptools
> > +
> > +require python-docker-pycreds.inc
> > diff --git a/recipes-devtools/python/python-docker.inc
> b/recipes-devtools/python/python-docker.inc
> > new file mode 100644
> > index 0000000..f23b537
> > --- /dev/null
> > +++ b/recipes-devtools/python/python-docker.inc
> > @@ -0,0 +1,5 @@
> > +SRC_URI[md5sum] =3D "7d917152976df075e6e90ee853df641f"
> > +SRC_URI[sha256sum] =3D
> "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
> > +
> > +DEPENDS +=3D "${PYTHON_PN}-pip-native"
> > +
> > diff --git a/recipes-devtools/python/python-docker_2.5.1.bb
> b/recipes-devtools/python/python-docker_2.5.1.bb
> > new file mode 100644
> > index 0000000..9dc83e8
> > --- /dev/null
> > +++ b/recipes-devtools/python/python-docker_2.5.1.bb
> > @@ -0,0 +1,11 @@
> > +inherit pypi setuptools
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +       python-backports-ssl \
> > +       python-docker-pycreds \
> > +       python-requests \
> > +       python-websocket-client \
> > +"
> > +
> > +require python-docker.inc
> > +
> > diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> > index 4038410..52423d2 100644
> > --- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> > +++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> > @@ -1,9 +1,3 @@
> > -SUMMARY =3D "Python bindings for the docker credentials store API"
> > -HOMEPAGE =3D "https://github.com/shin-/dockerpy-creds"
> > -LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > -
> >  inherit pypi setuptools3
> >
> > -SRC_URI[md5sum] =3D "0d80d5aebab771faf7e422b759c3055b"
> > -SRC_URI[sha256sum] =3D
> "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
> > +require python-docker-pycreds.inc
> > diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb
> b/recipes-devtools/python/python3-docker_2.5.1.bb
> > index 341d95c..0dca028 100644
> > --- a/recipes-devtools/python/python3-docker_2.5.1.bb
> > +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
> > @@ -1,17 +1,10 @@
> > -SUMMARY =3D "A Python library for the Docker Engine API."
> > -HOMEPAGE =3D "https://github.com/docker/docker-py"
> > -LICENSE =3D "Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34f3846f940453127309b920eeb=
89660"
> > -
> >  inherit pypi setuptools3
> >
> > -SRC_URI[md5sum] =3D "7d917152976df075e6e90ee853df641f"
> > -SRC_URI[sha256sum] =3D
> "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
> > -
> > -DEPENDS +=3D "${PYTHON_PN}-pip-native"
> > -
> >  RDEPENDS_${PN} +=3D " \
> >         python3-docker-pycreds \
> >         python3-requests \
> >         python3-websocket-client \
> >  "
> > +
> > +require python-docker.inc
> > +
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--=20

*David Bensoussan*
Robotique / Ing=C3=A9nieur logiciel embarqu=C3=A9
------------------------------

*Synapticon*  | Syst=C3=A8mes de contr=C3=B4le robotiques
mobile: 004915779804515/0033659971070

--0000000000004610dd0580bc9f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would need it for sumo. Could you cherry pick it and add it there? <br><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 30 Jan 2019, 08:04 Br=
uce Ashfield, &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfiel=
d@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">What bra=
nch is this for ? The following is already on master:<br>
<br>
commit cbefd4d88c0878c259c53c02a61b713679379124<br>
Author: Ting Yu &lt;<a href=3D"mailto:tyu@cisco.com" target=3D"_blank">tyu@=
cisco.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Dec 13 20:41:04 2018 +0000<br>
<br>
=C2=A0 =C2=A0 add the py2 version for python-docker and python-docker-pycre=
ds packages<br>
<br>
=C2=A0 =C2=A0 add the py2 version for python-docker and python-docker-pycre=
ds packages.<br>
=C2=A0 =C2=A0 add python-six and python-backport_ssl (for ph2 only) as<br>
python-docker dependencies.<br>
<br>
=C2=A0 =C2=A0 verify the connection to docker engine at run time -<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; import docker<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; client =3D docker.from_env()<br>
=C2=A0 =C2=A0 &gt;&gt;&gt; client.images.list()<br>
=C2=A0 =C2=A0 [&lt;Image: &#39;hello-world:latest&#39;&gt;]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;=
<br>
<br>
:000000 100644 0000000 ca0995f A<br>
recipes-devtools/python/python-docker-pycreds.inc<br>
<br>
Which obviously will conflict with the python-docker-pycreds.inc that<br>
you have below.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
On Fri, Jan 25, 2019 at 8:19 AM David Bensoussan &lt;<a href=3D"mailto:mini=
pada@gmail.com" target=3D"_blank">minipada@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-devtools/python/python-docker-pycreds.inc=C2=A0 =C2=A0|=
=C2=A0 7 +++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python-docker-pycreds_0.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0.2.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 recipes-devtools/python/python-docker.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 recipes-devtools/python/<a href=3D"http://python-docker_2.5.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python-docker_2.5.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 11 +++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-docker-pycreds_0.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.2.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +-------<br>
&gt;=C2=A0 recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-docker_2.5.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0| 13 +++----------<br>
&gt;=C2=A0 6 files changed, 30 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 create mode 100644 recipes-devtools/python/python-docker-pycreds=
.inc<br>
&gt;=C2=A0 create mode 100644 recipes-devtools/python/<a href=3D"http://pyt=
hon-docker-pycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-do=
cker-pycreds_0.2.1.bb</a><br>
&gt;=C2=A0 create mode 100644 recipes-devtools/python/python-docker.inc<br>
&gt;=C2=A0 create mode 100644 recipes-devtools/python/<a href=3D"http://pyt=
hon-docker_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_2.5=
.1.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recip=
es-devtools/python/python-docker-pycreds.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..e76267d<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-devtools/python/python-docker-pycreds.inc<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +SUMMARY =3D &quot;Python bindings for the docker credentials store AP=
I&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/shin-/dockerpy-creds=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/shin-/dockerpy-cr=
eds</a>&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;0d80d5aebab771faf7e422b759c3055b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;93833a2cf280b7d8abbe1b8121530413250c6cd4=
ffed2c1cf085f335262f7348&quot;<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python-docker-p=
ycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds=
_0.2.1.bb</a> b/recipes-devtools/python/<a href=3D"http://python-docker-pyc=
reds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0=
.2.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..f6ddc8d<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-devtools/python/<a href=3D"http://python-docker-pycreds_=
0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-docker-pycreds_0.2.1.=
bb</a><br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +inherit pypi setuptools<br>
&gt; +<br>
&gt; +require python-docker-pycreds.inc<br>
&gt; diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devto=
ols/python/python-docker.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f23b537<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-devtools/python/python-docker.inc<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +SRC_URI[md5sum] =3D &quot;7d917152976df075e6e90ee853df641f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b876e6909d8d2360e0540364c3a952a62847137f=
4674f2439320ede16d6db880&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;${PYTHON_PN}-pip-native&quot;<br>
&gt; +<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python-docker_2=
.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python-docker_2.5.1.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-docker_2.5.1.bb" rel=3D"no=
referrer" target=3D"_blank">python-docker_2.5.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..9dc83e8<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-devtools/python/<a href=3D"http://python-docker_2.5.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python-docker_2.5.1.bb</a><br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +inherit pypi setuptools<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python-backports-ssl \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python-docker-pycreds \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python-requests \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0python-websocket-client \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +require python-docker.inc<br>
&gt; +<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python3-docker-=
pycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycre=
ds_0.2.1.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-docker-=
pycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycre=
ds_0.2.1.bb</a><br>
&gt; index 4038410..52423d2 100644<br>
&gt; --- a/recipes-devtools/python/<a href=3D"http://python3-docker-pycreds=
_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.2.=
1.bb</a><br>
&gt; +++ b/recipes-devtools/python/<a href=3D"http://python3-docker-pycreds=
_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-pycreds_0.2.=
1.bb</a><br>
&gt; @@ -1,9 +1,3 @@<br>
&gt; -SUMMARY =3D &quot;Python bindings for the docker credentials store AP=
I&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/shin-/dockerpy-creds=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/shin-/dockerpy-cr=
eds</a>&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
&gt; -<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;0d80d5aebab771faf7e422b759c3055b&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;93833a2cf280b7d8abbe1b8121530413250c6cd4=
ffed2c1cf085f335262f7348&quot;<br>
&gt; +require python-docker-pycreds.inc<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python3-docker_=
2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker_2.5.1.bb</a> =
b/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-docker_2.5.1.bb</a><br>
&gt; index 341d95c..0dca028 100644<br>
&gt; --- a/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-docker_2.5.1.bb</a><br>
&gt; +++ b/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-docker_2.5.1.bb</a><br>
&gt; @@ -1,17 +1,10 @@<br>
&gt; -SUMMARY =3D &quot;A Python library for the Docker Engine API.&quot;<b=
r>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/docker/docker-py" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/docker/docker-py</a>&=
quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34f3846f940453127309b=
920eeb89660&quot;<br>
&gt; -<br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;7d917152976df075e6e90ee853df641f&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;b876e6909d8d2360e0540364c3a952a62847137f=
4674f2439320ede16d6db880&quot;<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;${PYTHON_PN}-pip-native&quot;<br>
&gt; -<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-docker-pycreds \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-requests \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-websocket-client \<br>
&gt;=C2=A0 &quot;<br>
&gt; +<br>
&gt; +require python-docker.inc<br>
&gt; +<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><p id=3D"inbox-inbox-inbox-in=
box-inbox-inbox-inbox-inbox-person-name" style=3D"box-sizing:border-box;fon=
t-family:arial,helvetica,sans-serif;font-size:13.3333px;color:rgb(0,0,0);pa=
dding:0px;margin:1em 0px"><strong style=3D"box-sizing:border-box"><font sty=
le=3D"vertical-align:inherit"><font style=3D"vertical-align:inherit">David =
Bensoussan</font></font></strong><br style=3D"box-sizing:border-box"><font =
style=3D"vertical-align:inherit"><font style=3D"vertical-align:inherit"> Ro=
botique / Ing=C3=A9nieur logiciel embarqu=C3=A9</font></font></p><hr style=
=3D"box-sizing:border-box;margin:0px;padding:0px;height:1px;background:rgb(=
229,27,65);border:none;color:rgb(17,17,17);font-family:arial,helvetica,sans=
-serif;font-size:13.3333px"><p id=3D"inbox-inbox-inbox-inbox-inbox-inbox-in=
box-inbox-tag-line" style=3D"box-sizing:border-box;font-family:arial,helvet=
ica,sans-serif;font-size:12pt;color:rgb(0,0,0);padding:0px;margin:1em 0px">=
<strong style=3D"box-sizing:border-box"><font style=3D"vertical-align:inher=
it"><font style=3D"vertical-align:inherit">Synapticon</font></font></strong=
><span class=3D"inbox-inbox-inbox-inbox-inbox-inbox-inbox-inbox-Apple-conve=
rted-space">=C2=A0</span><font style=3D"vertical-align:inherit"><font style=
=3D"vertical-align:inherit"> | </font><font style=3D"vertical-align:inherit=
">Syst=C3=A8mes de contr=C3=B4le robotiques</font></font></p><table cellpad=
ding=3D"0" cellspacing=3D"0" style=3D"box-sizing:border-box;font-family:ari=
al,helvetica,sans-serif;font-size:13.3333px;color:rgb(17,17,17);padding:0px=
"><tbody style=3D"box-sizing:border-box"><tr style=3D"box-sizing:border-box=
"><td style=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px =
0px"><font style=3D"vertical-align:inherit"><font style=3D"vertical-align:i=
nherit">mobile:</font></font></td><td style=3D"box-sizing:border-box;color:=
rgb(0,0,0);padding:0px 15px 3px 0px"><font style=3D"vertical-align:inherit"=
><font style=3D"vertical-align:inherit">004915779804515/0033659971070</font=
></font><br></td></tr><tr style=3D"box-sizing:border-box"><td style=3D"box-=
sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px 0px"><br></td><td s=
tyle=3D"box-sizing:border-box;color:rgb(0,0,0);padding:0px 15px 3px 0px"><b=
r></td></tr></tbody></table></div></div>

--0000000000004610dd0580bc9f21--
