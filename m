Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E639E01798
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Nov 2013 13:38:26 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id ea20so2318817lab.14
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Nov 2013 13:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OXGzdThRFi3+KPQ4hyvaVxR8RFFiuFXtYDKnm7yv0dU=;
	b=WPRcatLPxY7GNb0PU0OTqgCyNqxZBV4gZ1lbF7SKHrBF/DHvn9RNZiH7fLNV7waqit
	L6EvTW2D3mUnT756Q9EBZXDpxqqG8wD3/bLgCcyYNSjoYUvxAn7YFiQEib04fkpsB+Fy
	FGi4z9GNWSx7MvO9v2JlAt0unw+3KkDoRnuFPSddnh6GbwL1w7Swx7JIehmeVv62foJz
	hfgj1xjTzk0GJLaiiVEN50t+drZPvF68S7vGr62nVU6TOCOVs4gqlmdkis+NLVs57s+G
	p78yN3PXuQ477v62GfyIRR+F2PlPbfFbL45dobP/ETISAxPCZNFc/BeHT3S/sis3YLaD
	dYHg==
MIME-Version: 1.0
X-Received: by 10.112.167.3 with SMTP id zk3mr12230912lbb.23.1383946705173;
	Fri, 08 Nov 2013 13:38:25 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Fri, 8 Nov 2013 13:38:25 -0800 (PST)
In-Reply-To: <527D2ED8.2090709@twobit.us>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
	<1383883267-31992-11-git-send-email-cjp256@gmail.com>
	<527D2ED8.2090709@twobit.us>
Date: Fri, 8 Nov 2013 16:38:25 -0500
Message-ID: <CABZSBQcy88sTwgKqHT0Q7EB-bRqSA_6tZ_C86c15ZQ-_Z-LUxA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 10/10] xen: add xen_git recipe.
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
X-List-Received-Date: Fri, 08 Nov 2013 21:38:28 -0000
Content-Type: multipart/alternative; boundary=001a11c264a4c0028304eab13312

--001a11c264a4c0028304eab13312
Content-Type: text/plain; charset=ISO-8859-1

Both are no longer built by default: libblktap is for blktap1, and flask is
now only built if you have xsm enabled.


On Fri, Nov 8, 2013 at 1:35 PM, Philip Tricca <flihp@twobit.us> wrote:

> Can I get you to explain the reason for removing libblktap and flask
> from RDEPENDS in xen.inc? Other than that the patch set looks good to
> me. Deleting stuff is a very good thing :)
>
> - Philip
>
> On 11/07/2013 11:01 PM, Chris Patterson wrote:
> > Added recipe for xen unstable from git repository.
> >
> > Moved now empty xen-flask and xen-libblktap packages from
> > required dependencies from xen.inc into xen_4.3.1.bb.
> >
> > Signed-off-by: Chris Patterson <cjp256@gmail.com>
> > ---
> >  recipes-extended/xen/xen.inc      |  2 --
> >  recipes-extended/xen/xen_4.3.1.bb |  5 +++++
> >  recipes-extended/xen/xen_git.bb   | 18 ++++++++++++++++++
> >  3 files changed, 23 insertions(+), 2 deletions(-)
> >  create mode 100644 recipes-extended/xen/xen_git.bb
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index fff3dc1..9d43814 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -35,9 +35,7 @@ RDEPENDS_${PN}-base = "\
> >      ${PN}-libvhd \
> >      ${PN}-libxenstat \
> >      ${PN}-libxenstore \
> > -    ${PN}-libblktap \
> >      ${PN}-libfsimage \
> > -    ${PN}-flask \
> >      ${PN}-fsimage \
> >      ${PN}-hvmloader \
> >      ${PN}-scripts-block \
> > diff --git a/recipes-extended/xen/xen_4.3.1.bb b/recipes-extended/xen/
> xen_4.3.1.bb
> > index 46563ce..2c9806b 100644
> > --- a/recipes-extended/xen/xen_4.3.1.bb
> > +++ b/recipes-extended/xen/xen_4.3.1.bb
> > @@ -10,6 +10,11 @@ SRC_URI[sha256sum] =
> "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d
> >
> >  S = "${WORKDIR}/xen-${PV}"
> >
> > +RDEPENDS_${PN}-base += "\
> > +    ${PN}-libblktap \
> > +    ${PN}-flask \
> > +    "
> > +
> >  do_configure_prepend() {
> >      # fixup qemu-xen-traditional pciutils check hardcoded to test
> /usr/include/pci
> >      sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g'
> ${S}/tools/qemu-xen-traditional/xen-hooks.mak
> > diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> > new file mode 100644
> > index 0000000..f333157
> > --- /dev/null
> > +++ b/recipes-extended/xen/xen_git.bb
> > @@ -0,0 +1,18 @@
> > +require xen.inc
> > +
> > +SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
> > +
> > +PV = "4.4.0+git${SRCPV}"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +SRC_URI = " \
> > +    git://xenbits.xen.org/xen.git \
> > +    "
> > +
> > +DEFAULT_PREFERENCE = "-1"
> > +
> > +PACKAGES += "${PN}-xen-mfndump"
> > +
> > +FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
> > +
> >
>
>

--001a11c264a4c0028304eab13312
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Both are no longer built by default: libblktap is for blkt=
ap1, and flask is now only built if you have xsm enabled.<br></div><div cla=
ss=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Nov 8, 2013 a=
t 1:35 PM, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"mailto:flihp@twob=
it.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Can I get you to explain the reason for remo=
ving libblktap and flask<br>
from RDEPENDS in xen.inc? Other than that the patch set looks good to<br>
me. Deleting stuff is a very good thing :)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
- Philip<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On 11/07/2013 11:01 PM, Chris Patterson wrote:<br>
&gt; Added recipe for xen unstable from git repository.<br>
&gt;<br>
&gt; Moved now empty xen-flask and xen-libblktap packages from<br>
&gt; required dependencies from xen.inc into <a href=3D"http://xen_4.3.1.bb=
" target=3D"_blank">xen_4.3.1.bb</a>.<br>
&gt;<br>
&gt; Signed-off-by: Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com"=
>cjp256@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0recipes-extended/xen/xen.inc =A0 =A0 =A0| =A02 --<br>
&gt; =A0recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_bla=
nk">xen_4.3.1.bb</a> | =A05 +++++<br>
&gt; =A0recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_blank=
">xen_git.bb</a> =A0 | 18 ++++++++++++++++++<br>
&gt; =A03 files changed, 23 insertions(+), 2 deletions(-)<br>
&gt; =A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_git.b=
b" target=3D"_blank">xen_git.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index fff3dc1..9d43814 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -35,9 +35,7 @@ RDEPENDS_${PN}-base =3D &quot;\<br>
&gt; =A0 =A0 =A0${PN}-libvhd \<br>
&gt; =A0 =A0 =A0${PN}-libxenstat \<br>
&gt; =A0 =A0 =A0${PN}-libxenstore \<br>
&gt; - =A0 =A0${PN}-libblktap \<br>
&gt; =A0 =A0 =A0${PN}-libfsimage \<br>
&gt; - =A0 =A0${PN}-flask \<br>
&gt; =A0 =A0 =A0${PN}-fsimage \<br>
&gt; =A0 =A0 =A0${PN}-hvmloader \<br>
&gt; =A0 =A0 =A0${PN}-scripts-block \<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" targ=
et=3D"_blank">xen_4.3.1.bb</a> b/recipes-extended/xen/<a href=3D"http://xen=
_4.3.1.bb" target=3D"_blank">xen_4.3.1.bb</a><br>
&gt; index 46563ce..2c9806b 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_=
blank">xen_4.3.1.bb</a><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_=
blank">xen_4.3.1.bb</a><br>
&gt; @@ -10,6 +10,11 @@ SRC_URI[sha256sum] =3D &quot;3b5b7cc508b1739753585b=
5c25635471cdcef680e8770a78bf6ef9333d<br>
&gt;<br>
&gt; =A0S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>
&gt;<br>
&gt; +RDEPENDS_${PN}-base +=3D &quot;\<br>
&gt; + =A0 =A0${PN}-libblktap \<br>
&gt; + =A0 =A0${PN}-flask \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; =A0do_configure_prepend() {<br>
&gt; =A0 =A0 =A0# fixup qemu-xen-traditional pciutils check hardcoded to te=
st /usr/include/pci<br>
&gt; =A0 =A0 =A0sed -i &#39;s/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g&=
#39; ${S}/tools/qemu-xen-traditional/xen-hooks.mak<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" target=
=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a href=3D"http://xen_git=
.bb" target=3D"_blank">xen_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..f333157<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_bl=
ank">xen_git.bb</a><br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +require xen.inc<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;68bd172e6fa565899c846eb72755c8ffd8562c8a&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;4.4.0+git${SRCPV}&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; + =A0 =A0git://<a href=3D"http://xenbits.xen.org/xen.git" target=3D"_b=
lank">xenbits.xen.org/xen.git</a> \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; +<br>
&gt; +PACKAGES +=3D &quot;${PN}-xen-mfndump&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xen-mfndump =3D &quot;${sbindir}/xen-mfndump&quot;<br>
&gt; +<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--001a11c264a4c0028304eab13312--
