Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83FDCE006D2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Dec 2013 19:17:35 -0800 (PST)
Received: by mail-la0-f42.google.com with SMTP id ec20so2254344lab.15
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Dec 2013 19:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7WNtDwgZexVnA+7NOs9fMlHZ/0BiRTeB/i1iS1EMUpU=;
	b=RcN/sqSiJxP2oivo+QnAvjpZN87Gtw4ASx4q4rblVidcra8pXLIYd6gKo+BWx3hj7L
	02S5YTrSfQYOiO4pzk92QNokr6EHB8PyySw3CFP+nruWGRjEXZC+KCxrnFCHbS+UCQmS
	O73jzYgGhsPCOq4XIqt7UfX+txG4SNqNlL3sjiPCPO2sAmtv9p4zGks/7swWmu987GBf
	H6XLY6jIQpdDWCu7uot7CsmZxtQb6/dJqxVum1MfE3TiFGo23jH3ibkd41rzzUFOzD9I
	ga8mibA8yVL+4IqQhSMqA0C8zlc813W8dird/qLNtVP9MO5BXCw6gjro3nxtO/OdGL1m
	Irig==
MIME-Version: 1.0
X-Received: by 10.152.21.74 with SMTP id t10mr3581503lae.65.1386645453985;
	Mon, 09 Dec 2013 19:17:33 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Mon, 9 Dec 2013 19:17:33 -0800 (PST)
In-Reply-To: <CADkTA4O0-FYcn=REuwno2UFiDZX++yes892FEOWAsfo5boS9rA@mail.gmail.com>
References: <1386123634-5877-1-git-send-email-flihp@twobit.us>
	<CADkTA4NCOjwCH524=zFx-wyw3E0A+02bnMLswE5HLnAjmHbfBA@mail.gmail.com>
	<CABZSBQd54bgBVsfW+wq0QH6vcv6oW3OVcE6d2G24EA4U5HQpRw@mail.gmail.com>
	<CADkTA4O0-FYcn=REuwno2UFiDZX++yes892FEOWAsfo5boS9rA@mail.gmail.com>
Date: Mon, 9 Dec 2013 22:17:33 -0500
Message-ID: <CABZSBQfqAnYkJf9jqtk_hdoj2QN-FrFDsPiVfdXpmTXTPOU49A@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Dec 2013 03:17:40 -0000
Content-Type: multipart/alternative; boundary=089e01494164b6db3304ed258df1

--089e01494164b6db3304ed258df1
Content-Type: text/plain; charset=ISO-8859-1

I applied the patch and had a couple notes:

- rename pkg_postinst_${PN}-base -> pkg_postinst_${PN}-volatiles.  As it
stands, 'populate-volatile.sh update' supposedly only executes when one
installs xen-base, but it is only there for handling the volatiles.  In my
testing, I don't think this step is required (it doesn't look like it is
generating the volatile.cache in the rootfs as I expected) - but it is the
common practice from what I've seen.

- volatiles indirectly rdepends xen-volatiles now via the script packages.
I don't see a problem with this as the job is still getting done - but I
wouldn't mind better defining and cleaning up xen-base a bit (or perhaps
outright removing it and moving the bits into the appropriate places).

Either way, I'm ok with merging. :)

Cheers,
-Chris


On Mon, Dec 9, 2013 at 12:01 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Thu, Dec 5, 2013 at 5:20 PM, Chris Patterson <cjp256@gmail.com> wrote:
> > Looks good to me.
> >
>
> So to confirm for everyone, no objections if this merges as-is ?
>
> Bruce
>
> >
> > On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield <bruce.ashfield@gmail.com
> >
> > wrote:
> >>
> >> On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca <flihp@twobit.us> wrote:
> >> > The Xen scripts for handling block and vif udev events depend on
> >> > directories created by the Xen volatile directories. In a situation
> >> > where the 'base' Xen package isn't installed (NDVM etc) these
> >> > scripts fail silently. The most simple approach I could come up
> >> > with is just breaking the Xen volatiles config out into it's own
> >> > package and setting up the logical dependencies.
> >> >
> >> > Creating a new package for just a single file seems like overkill
> >> > to me but it's the most straightforward thing I could come up with.
> >>
> >> This seems reasonable to me, there are plenty of other one file package
> >> examples (in particular since the update-rc.d only works for one
> >> initscript
> >> per package), so that isn't all that out of the ordinary.
> >>
> >> So to my eye, this looks ok.
> >>
> >> Bruce
> >>
> >> >
> >> > Regards,
> >> > Philip
> >> >
> >> > Signed-off-by: Philip Tricca <flihp@twobit.us>
> >> > ---
> >> >  recipes-extended/xen/xen.inc |    8 +++++++-
> >> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/recipes-extended/xen/xen.inc
> b/recipes-extended/xen/xen.inc
> >> > index 9d43814..e31e996 100644
> >> > --- a/recipes-extended/xen/xen.inc
> >> > +++ b/recipes-extended/xen/xen.inc
> >> > @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base = "\
> >> >  RDEPENDS_${PN}-scripts-block = "\
> >> >      ${PN}-scripts-common \
> >> >      ${PN}-udev \
> >> > +    ${PN}-volatiles \
> >> >      "
> >> >
> >> >  RDEPENDS_${PN}-scripts-network = "\
> >> >      bridge-utils \
> >> >      ${PN}-scripts-common \
> >> >      ${PN}-udev \
> >> > +    ${PN}-volatiles \
> >> >      "
> >> >
> >> >  PACKAGES = "\
> >> > @@ -106,6 +108,7 @@ PACKAGES = "\
> >> >      ${PN}-scripts-network \
> >> >      ${PN}-staticdev \
> >> >      ${PN}-udev \
> >> > +    ${PN}-volatiles \
> >> >      ${PN}-xcutils \
> >> >      ${PN}-xencommons \
> >> >      ${PN}-xend \
> >> > @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor = "\
> >> >      "
> >> >
> >> >  FILES_${PN}-base = "\
> >> > -    ${sysconfdir}/default/volatiles/99_xen \
> >> >      ${sysconfdir}/default/xencommons \
> >> >      ${sysconfdir}/default/xendomains \
> >> >      ${sysconfdir}/xen/auto \
> >> > @@ -425,6 +427,10 @@ FILES_${PN}-udev = "\
> >> >      ${sysconfdir}/udev/rules.d/xend.rules \
> >> >      "
> >> >
> >> > +FILES_${PN}-volatiles = "\
> >> > +    ${sysconfdir}/default/volatiles/99_xen \
> >> > +    "
> >> > +
> >> >  FILES_${PN}-xcutils = "\
> >> >      ${libdir}/xen/bin/lsevtchn \
> >> >      ${libdir}/xen/bin/readnotes \
> >> > --
> >> > 1.7.10.4
> >> >
> >> > _______________________________________________
> >> > meta-virtualization mailing list
> >> > meta-virtualization@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--089e01494164b6db3304ed258df1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I applied the patch and had a couple notes:<div><br></div>=
<div>- rename=A0pkg_postinst_${PN}-base=A0-&gt;=A0pkg_postinst_${PN}-volati=
les. =A0As it stands, &#39;populate-volatile.sh update&#39; supposedly only=
 executes when one installs xen-base, but it is only there for handling the=
 volatiles. =A0In my testing, I don&#39;t think this step is required (it d=
oesn&#39;t look like it is generating the volatile.cache in the rootfs as I=
 expected) - but it is the common practice from what I&#39;ve seen.</div>
<div><br></div><div>- volatiles indirectly rdepends xen-volatiles now via t=
he script packages. I don&#39;t see a problem with this as the job is still=
 getting done - but I wouldn&#39;t mind better defining and cleaning up xen=
-base a bit (or perhaps outright removing it and moving the bits into the a=
ppropriate places).</div>
<div><br></div><div>Either way, I&#39;m ok with merging. :)</div><div><br><=
/div><div>Cheers,</div><div>-Chris</div></div><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">On Mon, Dec 9, 2013 at 12:01 PM, Bruce Ash=
field <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Thu, Dec 5, 2013 at 5:20 PM, Chris Patter=
son &lt;<a href=3D"mailto:cjp256@gmail.com">cjp256@gmail.com</a>&gt; wrote:=
<br>

&gt; Looks good to me.<br>
&gt;<br>
<br>
So to confirm for everyone, no objections if this merges as-is ?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Bruce<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Thu, Dec 5, 2013 at 7:09 PM, Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Dec 3, 2013 at 9:20 PM, Philip Tricca &lt;<a href=3D"mailt=
o:flihp@twobit.us">flihp@twobit.us</a>&gt; wrote:<br>
&gt;&gt; &gt; The Xen scripts for handling block and vif udev events depend=
 on<br>
&gt;&gt; &gt; directories created by the Xen volatile directories. In a sit=
uation<br>
&gt;&gt; &gt; where the &#39;base&#39; Xen package isn&#39;t installed (NDV=
M etc) these<br>
&gt;&gt; &gt; scripts fail silently. The most simple approach I could come =
up<br>
&gt;&gt; &gt; with is just breaking the Xen volatiles config out into it&#3=
9;s own<br>
&gt;&gt; &gt; package and setting up the logical dependencies.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Creating a new package for just a single file seems like over=
kill<br>
&gt;&gt; &gt; to me but it&#39;s the most straightforward thing I could com=
e up with.<br>
&gt;&gt;<br>
&gt;&gt; This seems reasonable to me, there are plenty of other one file pa=
ckage<br>
&gt;&gt; examples (in particular since the update-rc.d only works for one<b=
r>
&gt;&gt; initscript<br>
&gt;&gt; per package), so that isn&#39;t all that out of the ordinary.<br>
&gt;&gt;<br>
&gt;&gt; So to my eye, this looks ok.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Philip<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Philip Tricca &lt;<a href=3D"mailto:flihp@twob=
it.us">flihp@twobit.us</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; =A0recipes-extended/xen/xen.inc | =A0 =A08 +++++++-<br>
&gt;&gt; &gt; =A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/=
xen/xen.inc<br>
&gt;&gt; &gt; index 9d43814..e31e996 100644<br>
&gt;&gt; &gt; --- a/recipes-extended/xen/xen.inc<br>
&gt;&gt; &gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt;&gt; &gt; @@ -53,12 +53,14 @@ RDEPENDS_${PN}-base =3D &quot;\<br>
&gt;&gt; &gt; =A0RDEPENDS_${PN}-scripts-block =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-scripts-common \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-udev \<br>
&gt;&gt; &gt; + =A0 =A0${PN}-volatiles \<br>
&gt;&gt; &gt; =A0 =A0 =A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0RDEPENDS_${PN}-scripts-network =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0bridge-utils \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-scripts-common \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-udev \<br>
&gt;&gt; &gt; + =A0 =A0${PN}-volatiles \<br>
&gt;&gt; &gt; =A0 =A0 =A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0PACKAGES =3D &quot;\<br>
&gt;&gt; &gt; @@ -106,6 +108,7 @@ PACKAGES =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-scripts-network \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-staticdev \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-udev \<br>
&gt;&gt; &gt; + =A0 =A0${PN}-volatiles \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-xcutils \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-xencommons \<br>
&gt;&gt; &gt; =A0 =A0 =A0${PN}-xend \<br>
&gt;&gt; &gt; @@ -210,7 +213,6 @@ FILES_${PN}-hypervisor =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =A0FILES_${PN}-base =3D &quot;\<br>
&gt;&gt; &gt; - =A0 =A0${sysconfdir}/default/volatiles/99_xen \<br>
&gt;&gt; &gt; =A0 =A0 =A0${sysconfdir}/default/xencommons \<br>
&gt;&gt; &gt; =A0 =A0 =A0${sysconfdir}/default/xendomains \<br>
&gt;&gt; &gt; =A0 =A0 =A0${sysconfdir}/xen/auto \<br>
&gt;&gt; &gt; @@ -425,6 +427,10 @@ FILES_${PN}-udev =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0${sysconfdir}/udev/rules.d/xend.rules \<br>
&gt;&gt; &gt; =A0 =A0 =A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +FILES_${PN}-volatiles =3D &quot;\<br>
&gt;&gt; &gt; + =A0 =A0${sysconfdir}/default/volatiles/99_xen \<br>
&gt;&gt; &gt; + =A0 =A0&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; =A0FILES_${PN}-xcutils =3D &quot;\<br>
&gt;&gt; &gt; =A0 =A0 =A0${libdir}/xen/bin/lsevtchn \<br>
&gt;&gt; &gt; =A0 =A0 =A0${libdir}/xen/bin/readnotes \<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 1.7.10.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; meta-virtualization mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-=
virtualization@yoctoproject.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-v=
irtualization</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtua=
lization</a><br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>

--089e01494164b6db3304ed258df1--
