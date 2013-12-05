Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEFEAE0078D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 14:20:27 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id er20so10488685lab.36
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Dec 2013 14:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aG8xdFYnR7K+NmlDC/rqX0IKuXysufHKV98vWyPfcgc=;
	b=lJClNFipMJ+C7PcqKe4YWi4B3TeqLACRDH6/yj2Dj0qsVcl2z6OartyrDlTQtpMyOk
	NoGhFSBGnGs5ABfXkNK9yATl77cIetnOAJ0AsBKOQ/lTjSsgTjWlREFnotB9PjkY6qNP
	AnYYYE8VwrItdl1pLvOjxKBfo+JT6uoFPadNaQ9OpZ/nPyC/tJ5x3xFsp06GstKl7H1x
	8ih0MH+3h5wWjISrTVU8KTBANDARLCPjaHjrlrid9N+G4+yW/QDgCTeGlfxLcJoE8BGj
	RzsJEnphm/KimJWF6w/Irqei1SjVYgunb7FeQh/EsHzWNjthtFKNoW5X3Be17fQ1/Nme
	y4UA==
MIME-Version: 1.0
X-Received: by 10.112.184.169 with SMTP id ev9mr7690lbc.25.1386282025746; Thu,
	05 Dec 2013 14:20:25 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Thu, 5 Dec 2013 14:20:25 -0800 (PST)
In-Reply-To: <CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
	<CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
Date: Thu, 5 Dec 2013 22:20:25 +0000
Message-ID: <CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Break volatiles out into separate package.
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
X-List-Received-Date: Thu, 05 Dec 2013 22:20:31 -0000
Content-Type: multipart/alternative; boundary=001a11c3bfa8b4065704ecd0ef2a

--001a11c3bfa8b4065704ecd0ef2a
Content-Type: text/plain; charset=ISO-8859-1

Looks good to me.


On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
> > The Xen scripts for handling block and vif udev events depend on
> > directories created by the Xen volatile directories. In a situation
> > where the 'base' Xen package isn't installed (NDVM etc) these
> > scripts fail silently. The most simple approach I could come up
> > with is just breaking the Xen volatiles config out into it's own
> > package and setting up the logical dependencies.
> >
> > Creating a new package for just a single file seems like overkill
> > to me but it's the most straightforward thing I could come up with.
>
> This seems reasonable to me, there are plenty of other one file package
> examples (in particular since the update-rc.d only works for one initscript
> per package), so that isn't all that out of the ordinary.
>
> So to my eye, this looks ok.
>
> Bruce
>
> >
> > Regards,
> > Philip
> >
> > Signed-off-by: Philip Tricca <flihp@twobit.us>
> > ---
> >  recipes-extended/xen/xen.inc |    8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 9d43814..e31e996 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
> >  RDEPENDS_${PN}-scripts-block = "\
> >      ${PN}-scripts-common \
> >      ${PN}-udev \
> > +    ${PN}-volatiles \
> >      "
> >
> >  RDEPENDS_${PN}-scripts-network = "\
> >      bridge-utils \
> >      ${PN}-scripts-common \
> >      ${PN}-udev \
> > +    ${PN}-volatiles \
> >      "
> >
> >  PACKAGES = "\
> > @@ -106,6 +108,7 @@ PACKAGES = "\
> >      ${PN}-scripts-network \
> >      ${PN}-staticdev \
> >      ${PN}-udev \
> > +    ${PN}-volatiles \
> >      ${PN}-xcutils \
> >      ${PN}-xencommons \
> >      ${PN}-xend \
> > @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
> >      "
> >
> >  FILES_${PN}-base = "\
> > -    ${sysconfdir}/default/volatiles/99_xen \
> >      ${sysconfdir}/default/xencommons \
> >      ${sysconfdir}/default/xendomains \
> >      ${sysconfdir}/xen/auto \
> > @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
> >      ${sysconfdir}/udev/rules.d/xend.rules \
> >      "
> >
> > +FILES_${PN}-volatiles = "\
> > +    ${sysconfdir}/default/volatiles/99_xen \
> > +    "
> > +
> >  FILES_${PN}-xcutils = "\
> >      ${libdir}/xen/bin/lsevtchn \
> >      ${libdir}/xen/bin/readnotes \
> > --
> > 1.7.10.4
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a11c3bfa8b4065704ecd0ef2a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good to me.<br></div><div class=3D"gmail_extra"><br>=
<br><div class=3D"gmail_quote">On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfie=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Dec 3, 2013 at 9:2=
0 PM, Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">flihp@twobit.us<=
/a>&gt; wrote:<br>

&gt; The Xen scripts for handling block and vif udev events depend on<br>
&gt; directories created by the Xen volatile directories. In a situation<br=
>
&gt; where the &#39;base&#39; Xen package isn&#39;t installed (NDVM etc) th=
ese<br>
&gt; scripts fail silently. The most simple approach I could come up<br>
&gt; with is just breaking the Xen volatiles config out into it&#39;s own<b=
r>
&gt; package and setting up the logical dependencies.<br>
&gt;<br>
&gt; Creating a new package for just a single file seems like overkill<br>
&gt; to me but it&#39;s the most straightforward thing I could come up with=
.<br>
<br>
</div>This seems reasonable to me, there are plenty of other one file packa=
ge<br>
examples (in particular since the update-rc.d only works for one initscript=
<br>
per package), so that isn&#39;t all that out of the ordinary.<br>
<br>
So to my eye, this looks ok.<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Regards,<br>
&gt; Philip<br>
&gt;<br>
&gt; Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twobit.us">fl=
ihp@twobit.us</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-extended/xen/xen.inc | =A0 =A08 +++++++-<br>
&gt; =A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index 9d43814..e31e996 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base =3D &quot;\<br>
&gt; =A0RDEPENDS_${PN}-scripts-block =3D &quot;\<br>
&gt; =A0 =A0 =A0${PN}-scripts-common \<br>
&gt; =A0 =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0${PN}-volatiles \<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0RDEPENDS_${PN}-scripts-network =3D &quot;\<br>
&gt; =A0 =A0 =A0bridge-utils \<br>
&gt; =A0 =A0 =A0${PN}-scripts-common \<br>
&gt; =A0 =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0${PN}-volatiles \<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0PACKAGES =3D &quot;\<br>
&gt; @@ -106,6 +108,7 @@ PACKAGES =3D &quot;\<br>
&gt; =A0 =A0 =A0${PN}-scripts-network \<br>
&gt; =A0 =A0 =A0${PN}-staticdev \<br>
&gt; =A0 =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0${PN}-volatiles \<br>
&gt; =A0 =A0 =A0${PN}-xcutils \<br>
&gt; =A0 =A0 =A0${PN}-xencommons \<br>
&gt; =A0 =A0 =A0${PN}-xend \<br>
&gt; @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor =3D &quot;\<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0FILES_${PN}-base =3D &quot;\<br>
&gt; - =A0 =A0${sysconfdir}/default/volatiles/99_xen \<br>
&gt; =A0 =A0 =A0${sysconfdir}/default/xencommons \<br>
&gt; =A0 =A0 =A0${sysconfdir}/default/xendomains \<br>
&gt; =A0 =A0 =A0${sysconfdir}/xen/auto \<br>
&gt; @@ -425,6 +427,10 @@ FILES_${PN}-udev =3D &quot;\<br>
&gt; =A0 =A0 =A0${sysconfdir}/udev/rules.d/xend.rules \<br>
&gt; =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; +FILES_${PN}-volatiles =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/default/volatiles/99_xen \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; =A0FILES_${PN}-xcutils =3D &quot;\<br>
&gt; =A0 =A0 =A0${libdir}/xen/bin/lsevtchn \<br>
&gt; =A0 =A0 =A0${libdir}/xen/bin/readnotes \<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br></div>

--001a11c3bfa8b4065704ecd0ef2a--
