Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C69DCE017EF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Nov 2013 17:14:06 -0800 (PST)
Received: by mail-la0-f46.google.com with SMTP id el20so228768lab.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Nov 2013 17:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QJobqetSEwVlKk3PgOYUBd3q8K5ORP1iQWtAFkzhW4M=;
	b=arToLQlHL5WxfLoTaYs6lNxlIvx3qJNzgK4wA1gRUFbZCnGAG0jYfiCecDsdGAaUIg
	2snqjRMUzM8EqS6cZlwax/DKDLQaU5iJuxdO2gc+GqNGqlLc2lag/THIje5VMiYyvawL
	9upYEaDPEa5mP8BRd00VT5qjaCNVd65v9pAskm9F9JHktDANTFFNDqGqP4XXUNL7XNno
	BOEtUorJ6H0or7i92BufXGvhPQApGve7BtAGH1Ye5WZnH7Gi0HxMvw6K8v9rOI57qxNa
	2m8JrDXE3wlEasg86iC7gm8sWHHldmCLDXZ/WXiIUz2KcmjMejEdNj4i1WQsBQIAjVgP
	gvVw==
MIME-Version: 1.0
X-Received: by 10.152.21.133 with SMTP id v5mr4295763lae.14.1383786845171;
	Wed, 06 Nov 2013 17:14:05 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Wed, 6 Nov 2013 17:14:05 -0800 (PST)
In-Reply-To: <527A4247.80105@twobit.us>
References: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
	<1383707342-3827-4-git-send-email-cjp256@gmail.com>
	<527A4247.80105@twobit.us>
Date: Wed, 6 Nov 2013 20:14:05 -0500
Message-ID: <CABZSBQeWExL283w8xDZoNN=zd71ddKUVdavbtEBce8sfyC5P=A@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] xen: upgrade to 4.3.1
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
X-List-Received-Date: Thu, 07 Nov 2013 01:14:08 -0000
Content-Type: multipart/alternative; boundary=089e0158ad5a59f38404ea8bfbda

--089e0158ad5a59f38404ea8bfbda
Content-Type: text/plain; charset=ISO-8859-1

I've tried sending twice, it doesn't seem to want to go through (and no
delivery failed message).

It is a patch cleaning out the old xen bits, and is rather large (~8k
lines, ~250k chars). I wonder if that's why?


On Wed, Nov 6, 2013 at 8:21 AM, Philip Tricca <flihp@twobit.us> wrote:

> All of this looks good to me but I'm not seeing PATCH 2/4.
>
> - Philip
>
> On 11/05/2013 10:09 PM, Chris Patterson wrote:
> > Changelog available at:
> >
> http://xenproject.org/downloads/xen-archives/supported-xen-43-series/xen-431.html
> >
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} (99%)
> >
> > diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/
> xen_4.3.1.bb
> > similarity index 99%
> > rename from recipes-extended/xen/xen_4.3.0.bb
> > rename to recipes-extended/xen/xen_4.3.1.bb
> > index f1067bc..6985624 100644
> > --- a/recipes-extended/xen/xen_4.3.0.bb
> > +++ b/recipes-extended/xen/xen_4.3.1.bb
> > @@ -11,8 +11,8 @@ SRC_URI = " \
> >      file://flask-avoid-installing-policy-file-as-boot.patch \
> >      "
> >
> > -SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
> > -SRC_URI[sha256sum] =
> "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
> > +SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
> > +SRC_URI[sha256sum] =
> "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
> >
> >  S = "${WORKDIR}/xen-${PV}"
> >
> > @@ -215,11 +215,11 @@ FILES_${PN}-libfsimage-dev =
> "${libdir}/libfsimage.so"
> >  FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
> >
> >  FILES_${PN}-hypervisor = "\
> > -    /boot/xen-4.3.0.gz \
> > +    /boot/xen-4.3.1.gz \
> >      /boot/xen-4.3.gz \
> >      /boot/xen-4.gz \
> >      /boot/xen.gz \
> > -    /boot/xen-syms-4.3.0 \
> > +    /boot/xen-syms-4.3.1 \
> >      "
> >
> >  FILES_${PN}-base = "\
> >
>
>

--089e0158ad5a59f38404ea8bfbda
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve tried sending twice, it doesn&#39;t seem to want =
to go through (and no delivery failed message).<br><br>It is a patch cleani=
ng out the old xen bits, and is rather large (~8k lines, ~250k chars). I wo=
nder if that&#39;s why?<br>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed,=
 Nov 6, 2013 at 8:21 AM, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
All of this looks good to me but I&#39;m not seeing PATCH 2/4.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
- Philip<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On 11/05/2013 10:09 PM, Chris Patterson wrote:<br>
&gt; Changelog available at:<br>
&gt; <a href=3D"http://xenproject.org/downloads/xen-archives/supported-xen-=
43-series/xen-431.html" target=3D"_blank">http://xenproject.org/downloads/x=
en-archives/supported-xen-43-series/xen-431.html</a><br>
&gt;<br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-extended/xen/{<a href=3D"http://xen_4.3.0.bb" target=3D"_bl=
ank">xen_4.3.0.bb</a> =3D&gt; <a href=3D"http://xen_4.3.1.bb" target=3D"_bl=
ank">xen_4.3.1.bb</a>} | 8 ++++----<br>
&gt; =A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; =A0rename recipes-extended/xen/{<a href=3D"http://xen_4.3.0.bb" target=
=3D"_blank">xen_4.3.0.bb</a> =3D&gt; <a href=3D"http://xen_4.3.1.bb" target=
=3D"_blank">xen_4.3.1.bb</a>} (99%)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" targ=
et=3D"_blank">xen_4.3.0.bb</a> b/recipes-extended/xen/<a href=3D"http://xen=
_4.3.1.bb" target=3D"_blank">xen_4.3.1.bb</a><br>
&gt; similarity index 99%<br>
&gt; rename from recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" targe=
t=3D"_blank">xen_4.3.0.bb</a><br>
&gt; rename to recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=
=3D"_blank">xen_4.3.1.bb</a><br>
&gt; index f1067bc..6985624 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_=
blank">xen_4.3.0.bb</a><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_=
blank">xen_4.3.1.bb</a><br>
&gt; @@ -11,8 +11,8 @@ SRC_URI =3D &quot; \<br>
&gt; =A0 =A0 =A0file://flask-avoid-installing-policy-file-as-boot.patch \<b=
r>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;7b18cfb58f1ac2ce39cf35a1867f0c0a&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;e1e9faabe4886e2227aacdbde74410653b233d66=
642ca1972a860cbec6439961&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;7616b8704e1ab89c81f011f0e3703bc8&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;3b5b7cc508b1739753585b5c25635471cdcef680=
e8770a78bf6ef9333d26a9fd&quot;<br>
&gt;<br>
&gt; =A0S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>
&gt;<br>
&gt; @@ -215,11 +215,11 @@ FILES_${PN}-libfsimage-dev =3D &quot;${libdir}/l=
ibfsimage.so&quot;<br>
&gt; =A0FILES_${PN}-fsimage =3D &quot;${libdir}/fs/*/*fsimage.so&quot;<br>
&gt;<br>
&gt; =A0FILES_${PN}-hypervisor =3D &quot;\<br>
&gt; - =A0 =A0/boot/xen-4.3.0.gz \<br>
&gt; + =A0 =A0/boot/xen-4.3.1.gz \<br>
&gt; =A0 =A0 =A0/boot/xen-4.3.gz \<br>
&gt; =A0 =A0 =A0/boot/xen-4.gz \<br>
&gt; =A0 =A0 =A0/boot/xen.gz \<br>
&gt; - =A0 =A0/boot/xen-syms-4.3.0 \<br>
&gt; + =A0 =A0/boot/xen-syms-4.3.1 \<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0FILES_${PN}-base =3D &quot;\<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--089e0158ad5a59f38404ea8bfbda--
