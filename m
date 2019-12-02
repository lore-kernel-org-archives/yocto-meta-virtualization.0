Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.132.1575260650183847402
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aOoVDxxh;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: ticotimo@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4AAEE010ED; Sun,  1 Dec 2019 20:24:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (ticotimo[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.166.51 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DD6EE010EB
	for <meta-virtualization@yoctoproject.org>; Sun,  1 Dec 2019 20:24:08 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id k24so28155095ioc.4
        for <meta-virtualization@yoctoproject.org>; Sun, 01 Dec 2019 20:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FH1Q0eSlrXrutCFHHSG09Vint8V9nkp2kzn0wZnYlSc=;
        b=aOoVDxxhh8vNhqPXIC66c0zNzMvIO8pp6l6hDhJELmLO30n/3msfMipvqs4cidQzRg
         hYTNJvxWenbwbReNe01gGq3QYb4AXiSQZiWJsT5yt5xV6zooDrQkSyco7/0c+7Mf3CEZ
         rrDtLxPSHx3AcNtarDxIG49YkxMm3M8N59DYSU53BI61fE9Qsfl9kVn8WWUQ69i6ob4k
         skVd8sLuIhkcmqKdy92MCilBL8ys70UBOjrDLFm4PGWxwwNbPJfuwukTHoCvXmR65KJr
         oQclL1a4pmaLomZP2k6b2FpLjGTROu4EoyI4kK2J4Q+geLmaTSCQMjrBXYcxYpoHxmdB
         4Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FH1Q0eSlrXrutCFHHSG09Vint8V9nkp2kzn0wZnYlSc=;
        b=OR3/PUu7uUTK4u9zHgopKTWk+yuc6qCVAoHhcjMs/HKAbu3zC/eu+HU0NOVXGuWjEj
         AesJTE077UvpWRRLKiWPfYQ2zzUuOOHqzAY5LzK/Ihcr53MJryiekI19aJCjTzMB8P1k
         bzjlv6In2KPEPp7wRJVCTHbWGil2Nl21p6EYKZBIDqXf5q+HocVYK+MyerC0x2QUEebe
         h0lYb4CNyKWkxpwX/uJW45b2nSe9aDK6Ev3WdjruixJwoU7c75kIwjubqcS7JJ03CU+c
         M+gJqLwxsaodOGlObAYGwMNTDEzf9xEB4vuwG6p9aN9GJEbLbESIPVcaVbjl1iC3aJ2l
         pIZA==
X-Gm-Message-State: APjAAAU16dzZRlG6xFjqAzcW61elLLoteXVzXIphIHn1zwBpMA/RAYOi
	wYCe+yFgSYHCgm5yv/3+T4cfxCX10dMXBfWUd+qDb457
X-Google-Smtp-Source: APXvYqz6OpvzYWj4IxTzO1BvylTqlUwMLrSaBdyIAANYVUaSNdZN7TAU2h1B8mUu1iwpq/oEL+qfFVCFdvBbum2B1i0=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr21313375iob.122.1575260647605;
 Sun, 01 Dec 2019 20:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20191128063011.16384-1-zangrc.fnst@cn.fujitsu.com> <CADkTA4N3qR6AKK5z0Mu-A1r86nAo2oh1XCLBXYioucbucpdi=g@mail.gmail.com>
In-Reply-To: <CADkTA4N3qR6AKK5z0Mu-A1r86nAo2oh1XCLBXYioucbucpdi=g@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sun, 1 Dec 2019 20:23:56 -0800
Message-ID: <CANx9H-BJHOaatP0EMa4M32CnLumUXVnwK4tyU-8qPSvi4Oo9mQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python-anyjson: Add python3 version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	zangrc <zangrc.fnst@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="000000000000544bfb0598b0f3b2"

--000000000000544bfb0598b0f3b2
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 1, 2019 at 8:21 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I've merged all of the python3 additions.
>
> That being said, we really should be making meta-virt master python3
> only, since only python3 testing is going to happening for all new
> releases.
>
> I'll do the cleanup a bit later in the cycle, once we are sure that
> the python3 updates are working .. at that point, we can decide if the
> python2 variants are deleted, or move to a sub-layer.
>

meta-python2 will go live ~tomorrow. If that makes sense, py2 recipes can
move there.


> Cheers,
>
> Bruce
>
> On Thu, Nov 28, 2019 at 1:29 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  .../recipes-devtools/python/python-anyjson.inc     | 12 ++++++++++++
> >  .../python/python-anyjson_0.3.3.bb                 | 14 ++------------
> >  .../python/python3-anyjson_0.3.3.bb                |  2 ++
> >  3 files changed, 16 insertions(+), 12 deletions(-)
> >  create mode 100644
> meta-openstack/recipes-devtools/python/python-anyjson.inc
> >  create mode 100644 meta-openstack/recipes-devtools/python/
> python3-anyjson_0.3.3.bb
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc
> b/meta-openstack/recipes-devtools/python/python-anyjson.inc
> > new file mode 100644
> > index 0000000..19e03e9
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-anyjson.inc
> > @@ -0,0 +1,12 @@
> > +DESCRIPTION = "Loads the best available JSON implementation available
> in a common interface"
> > +HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> > +
> > +inherit pypi
> > +
> > +SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> > +SRC_URI[sha256sum] =
> "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> > +
> > +RDEPENDS_${PN} = "${PYTHON_PN}-simplejson"
> > diff --git a/meta-openstack/recipes-devtools/python/
> python-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/
> python-anyjson_0.3.3.bb
> > index cffff66..2b90a2a 100644
> > --- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> > @@ -1,12 +1,2 @@
> > -DESCRIPTION = "Loads the best available JSON implementation available
> in a common interface"
> > -HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> > -
> > -inherit setuptools pypi
> > -
> > -SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> > -SRC_URI[sha256sum] =
> "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> > -
> > -RDEPENDS_${PN} = "python-simplejson"
> > +require python-anyjson.inc
> > +inherit setuptools
> > diff --git a/meta-openstack/recipes-devtools/python/
> python3-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/
> python3-anyjson_0.3.3.bb
> > new file mode 100644
> > index 0000000..d4d13ac
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> > @@ -0,0 +1,2 @@
> > +require python-anyjson.inc
> > +inherit setuptools3
> > --
> > 2.20.1
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4769):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4769
> > Mute This Topic: https://lists.yoctoproject.org/mt/63859622/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4796):
> https://lists.yoctoproject.org/g/meta-virtualization/message/4796
> Mute This Topic: https://lists.yoctoproject.org/mt/63859622/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--000000000000544bfb0598b0f3b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 1, 2019 at 8:21 PM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">I&#39;ve merged all of the python=
3 additions.<br>
<br>
That being said, we really should be making meta-virt master python3<br>
only, since only python3 testing is going to happening for all new<br>
releases.<br>
<br>
I&#39;ll do the cleanup a bit later in the cycle, once we are sure that<br>
the python3 updates are working .. at that point, we can decide if the<br>
python2 variants are deleted, or move to a sub-layer.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">meta-python2 wil=
l go live ~tomorrow. If that makes sense, py2 recipes can move there.</div>=
<div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Bruce<br>
<br>
On Thu, Nov 28, 2019 at 1:29 AM zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn=
.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujit=
su.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-devtools/python/python-anyjson.inc=C2=A0 =C2=A0 =C2=
=A0| 12 ++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python-anyjson_0.3.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-anyjson_0.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++------------<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-anyjson_0.3.3.bb" rel=3D"no=
referrer" target=3D"_blank">python3-anyjson_0.3.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 3 files changed, 16 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-openstack/recipes-devtools/python/python=
-anyjson.inc<br>
&gt;=C2=A0 create mode 100644 meta-openstack/recipes-devtools/python/<a hre=
f=3D"http://python3-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-anyjson_0.3.3.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc=
 b/meta-openstack/recipes-devtools/python/python-anyjson.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..19e03e9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-openstack/recipes-devtools/python/python-anyjson.inc<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +DESCRIPTION =3D &quot;Loads the best available JSON implementation av=
ailable in a common interface&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://bitbucket.org/runeh/anyjson" re=
l=3D"noreferrer" target=3D"_blank">https://bitbucket.org/runeh/anyjson</a>&=
quot;<br>
&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D989aa97e73c912a83a3c8=
73fa11deb08&quot;<br>
&gt; +<br>
&gt; +inherit pypi<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;2ea28d6ec311aeeebaf993cb3008b27c&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;37812d863c9ad3e35c0734c42e0bf0320ce8c3be=
d82cd20ad54cb34d158157ba&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} =3D &quot;${PYTHON_PN}-simplejson&quot;<br>
&gt; diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-anyjso=
n_0.3.3.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://p=
ython-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-anyjson=
_0.3.3.bb</a><br>
&gt; index cffff66..2b90a2a 100644<br>
&gt; --- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-anyjson_0.3.3=
.bb</a><br>
&gt; +++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python-anyjson_0.3.3=
.bb</a><br>
&gt; @@ -1,12 +1,2 @@<br>
&gt; -DESCRIPTION =3D &quot;Loads the best available JSON implementation av=
ailable in a common interface&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://bitbucket.org/runeh/anyjson" re=
l=3D"noreferrer" target=3D"_blank">https://bitbucket.org/runeh/anyjson</a>&=
quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D989aa97e73c912a83a3c8=
73fa11deb08&quot;<br>
&gt; -<br>
&gt; -inherit setuptools pypi<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;2ea28d6ec311aeeebaf993cb3008b27c&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;37812d863c9ad3e35c0734c42e0bf0320ce8c3be=
d82cd20ad54cb34d158157ba&quot;<br>
&gt; -<br>
&gt; -RDEPENDS_${PN} =3D &quot;python-simplejson&quot;<br>
&gt; +require python-anyjson.inc<br>
&gt; +inherit setuptools<br>
&gt; diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python3-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-anyj=
son_0.3.3.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http:/=
/python3-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-any=
json_0.3.3.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..d4d13ac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python3=
-anyjson_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-anyjson_0.3=
.3.bb</a><br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +require python-anyjson.inc<br>
&gt; +inherit setuptools3<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt;<br>
&gt; View/Reply Online (#4769): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/4769" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/4769</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/63859622=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/63859622/1050810</a><br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
<br>
View/Reply Online (#4796): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/4796" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/4796</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/63859622/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
63859622/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a>=C2=A0 [<a href=3D"mailto:ticotimo@gmail.c=
om" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--000000000000544bfb0598b0f3b2--
