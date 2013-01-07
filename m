Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E46ACE01454
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 19:21:44 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id fk20so13921700lab.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 19:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UVrugSlo++6aUIVpzUrHuPTZ9cApIn5CGaKHVhqoCBs=;
	b=TtaXOLYBpIrUrgLAA9TN1PO+71nycROLzUdCX2qFamoeXrUoje35R0UotpiX1aHaXG
	DhZP+QomJoWpTGnrRR2j+SyTfmiJOQ29sKa7OAH/qGYgXOAuSqp1fHZY1R0kW4qUv5vs
	dqRzTrx8PKIhYCtA8rwV4Xztw/jCIX9dtALbtYPkePkYRncX0LuI+XORtOSDg1X5dk++
	euivmkBqqVy0JWm5Um1PyjIWap+WA9h+jy6ik4hSYWm2tuK5WECHEbbD5LgQvSTDJKl5
	zQewGoB8Q3bkKbTxrljE0Vw5Ny8ONeb7b7Gq1UXGxqN8rjDP7TDot05QrgRre1Nh/dTs
	jv/g==
MIME-Version: 1.0
Received: by 10.112.87.104 with SMTP id w8mr24609939lbz.49.1357528903370; Sun,
	06 Jan 2013 19:21:43 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sun, 6 Jan 2013 19:21:42 -0800 (PST)
In-Reply-To: <20130107014615.GD9356@windriver.com>
References: <1357449457-2669-1-git-send-email-lei.yang@windriver.com>
	<20130107014615.GD9356@windriver.com>
Date: Sun, 6 Jan 2013 22:21:42 -0500
Message-ID: <CADkTA4MVDp9iO+2U0S2_54VQwLXK-x=TMPg=6auKfmsqfE1nGA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Mon, 07 Jan 2013 03:21:45 -0000
Content-Type: multipart/alternative; boundary=bcaec554e0f60ec7e604d2aa5481

--bcaec554e0f60ec7e604d2aa5481
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 6, 2013 at 8:46 PM, Joe MacDonald
<Joe.MacDonald@windriver.com>wrote:

> [[meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt
> virt-test)] On 13.01.06 (Sun 13:17) lei.yang@windriver.com wrote:
>
> > From: Lei Yang <lei.yang@windriver.com>
> >
> > The netcat-openbsd in meta-virtualization layer has bugs.
> > This update version will fix "nc: Protocol no available." error.
> > As bruce point, we want to keep netcat in the meta-networking,
> > which meta-virtualization will depend on
>
> That's fine with me if that works for him, and having both netcat
> versions available is fine, I personally prefer the obsd one.  I'll keep
> an eye out for your next version with the per-recipe alternative
> priorities.
>
> I didn't notice the discussion with Bruce, though, so at the risk of
> re-stating what you guys have already agreed upon, this will mean you're
> at least going to be cloning meta-oe to use meta-virtualization.
> meta-networking isn't a standalone layer for the most part.  I maintain
> a read-only subtree project on github that is meta-networking separated
> from the rest of meta-oe, but it necessarily trails the meta-networking
> in meta-oe.
>


This all sounds good to me. I see the other thread where you've indicated
you'll
merge the obsd netcat, and like you say there, that's the important part.

The summary of the conversation (on meta-virt) was the big item I was trying
to avoid was having two supported netcat variants in different layers with
no
obvious (to the casual observer) reason why there were two layers that
contained "netcat". I didn't expect this to move to oe-dev quite so fast,
or
I would have gotten around to giving my own heads up!

There are two ideas about how to consume obsd netcat if it comes from
meta-networking, depend directly on the layer (whether it be the
meta-oe, or your read only github/standalone variant) or to use the layer
combo tools to track what you merge to meta-networking within meta-virt.

We'll just document the requirement(s) in the READMEs once everything
is nailed down.

Either approach I mention above will work, and while we do want to keep
dependencies low, I'm inclined to use the layer dependency approach, since
there are bound to be more parts of meta-networking that will be required
as the virtualization usecases progress.

Right now, I'm not too concerned about a meta-oe dependency (but I'm just
one voice), but it is good to know that there's the github option as well.
And
there's the fallback of the layer combo-tooling as well.

If anyone has experience to offer here .. it would be appreciated, since
there's
no sense causing ourselves undo pain and suffering.

Cheers,

Bruce



>
> I'm fine with the new recipe, just wanted to make sure you had all the
> information you needed.
>
> -J.
>
> >
> > Lei
> >
> > Signed-off-by: Lei Yang <lei.yang@windriver.com>
> > ---
> >  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   29
> ++++++++++++++++++++
> >  meta-networking/recipes-support/netcat/netcat.inc  |    6 ++++
> >  .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
> >  3 files changed, 40 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb
> >  create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
> >
> > diff --git a/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.89.bb
> > new file mode 100644
> > index 0000000..9fe406c
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> > @@ -0,0 +1,29 @@
> > +require netcat.inc
> > +DESCRIPTION = "OpenBSD Netcat"
> > +HOMEPAGE = "http://ftp.debian.org"
> > +LICENSE = "BSD-3-Clause"
> > +PR = "r0"
> > +
> > +SRC_URI =
> "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat
> \
> > +
> ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
> > +
> > +SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
> > +SRC_URI[netcat.sha256sum] =
> "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
> > +SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
> > +SRC_URI[netcat-patch.sha256sum] =
> "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
> > +
> > +S = "${WORKDIR}/${PN}-${PV}.orig"
> > +
> > +do_configure[noexec] = "1"
> > +
> > +do_compile() {
> > +     cd ${S}
> > +        while read line; do patch -p1 <debian/patches/$line; done
> <debian/patches/series
> > +     pkgrel=4
> > +     oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
> > +}
> > +
> > +do_install() {
> > +        install -d ${D}${bindir}
> > +        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> > +}
> > diff --git a/meta-networking/recipes-support/netcat/netcat.inc
> b/meta-networking/recipes-support/netcat/netcat.inc
> > new file mode 100644
> > index 0000000..4098668
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/netcat/netcat.inc
> > @@ -0,0 +1,6 @@
> > +SECTION = "console/network"
> > +inherit update-alternatives gettext
> > +
> > +ALTERNATIVE_${PN} = "nc"
> > +ALTERNATIVE_PRIORITY = "100"
> > +
> > diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bbb/meta-networking/recipes-support/netcat/
> netcat_0.7.1.bb
> > index c5ab85d..e09202b 100644
> > --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> > +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> > @@ -1,21 +1,20 @@
> > +require netcat.inc
> >  DESCRIPTION = "GNU Netcat"
> >  HOMEPAGE = "http://netcat.sourceforge.net"
> > -SECTION = "console/network"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> >
> > -PR = "r0"
> > +PR = "r1"
> >
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
> >
> >  SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
> >  SRC_URI[sha256sum] =
> "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
> >
> > -inherit autotools update-alternatives gettext
> > +inherit autotools
> >
> >  do_install_append() {
> > -     mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> > +        install -d ${D}${bindir}
> > +        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> >  }
> >
> > -ALTERNATIVE_${PN} = "nc"
> > -ALTERNATIVE_PRIORITY = "100"
> --
> -Joe MacDonald.
> :wq
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec554e0f60ec7e604d2aa5481
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Jan 6, 2013 at 8:46 PM, Joe MacDonald <span dir=3D"ltr">&lt=
;<a href=3D"mailto:Joe.MacDonald@windriver.com" target=3D"_blank">Joe.MacDo=
nald@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">[[meta-networking][PATCH] =
Add netcat-openbsd for virtualization (libvirt virt-test)] On 13.01.06 (Sun=
 13:17) <a href=3D"mailto:lei.yang@windriver.com">lei.yang@windriver.com</a=
> wrote:<br>

<br>
&gt; From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">lei.yang@=
windriver.com</a>&gt;<br>
&gt;<br>
&gt; The netcat-openbsd in meta-virtualization layer has bugs.<br>
&gt; This update version will fix &quot;nc: Protocol no available.&quot; er=
ror.<br>
&gt; As bruce point, we want to keep netcat in the meta-networking,<br>
&gt; which meta-virtualization will depend on<br>
<br>
</div>That&#39;s fine with me if that works for him, and having both netcat=
<br>
versions available is fine, I personally prefer the obsd one. =A0I&#39;ll k=
eep<br>
an eye out for your next version with the per-recipe alternative<br>
priorities.<br>
<br>
I didn&#39;t notice the discussion with Bruce, though, so at the risk of<br=
>
re-stating what you guys have already agreed upon, this will mean you&#39;r=
e<br>
at least going to be cloning meta-oe to use meta-virtualization.<br>
meta-networking isn&#39;t a standalone layer for the most part. =A0I mainta=
in<br>
a read-only subtree project on github that is meta-networking separated<br>
from the rest of meta-oe, but it necessarily trails the meta-networking<br>
in meta-oe.<br></blockquote><div><br></div><div><br></div><div style>This a=
ll sounds good to me. I see the other thread where you&#39;ve indicated you=
&#39;ll</div><div style>merge the obsd netcat, and like you say there, that=
&#39;s the important part.</div>
<div style><br></div><div style>The summary of the conversation (on meta-vi=
rt) was the big item I was trying</div><div style>to avoid was having two s=
upported netcat variants=A0in different layers with no</div><div style>obvi=
ous (to the casual observer) reason why there=A0were two layers that=A0</di=
v>
<div style>contained &quot;netcat&quot;. I didn&#39;t expect this to move t=
o oe-dev quite so fast, or=A0</div><div style>I would have gotten around to=
 giving my own heads up!</div><div style><br></div><div style>There are two=
 ideas about how to consume obsd netcat if it comes from=A0</div>
<div style>meta-networking, depend directly on the layer (whether it be the=
=A0</div><div style>meta-oe, or your read only github/standalone variant) o=
r to use the layer</div><div style>combo tools to track what you merge to m=
eta-networking within meta-virt.</div>
<div style><br></div><div style>We&#39;ll just document the requirement(s) =
in the READMEs once everything</div><div style>is nailed down.</div><div st=
yle><br></div><div style>Either approach I mention above will work, and whi=
le we do want to keep=A0</div>
<div style>dependencies low, I&#39;m inclined to use the layer dependency a=
pproach, since</div><div style>there are bound to be more parts of meta-net=
working that will be required</div><div style>as the virtualization usecase=
s progress.</div>
<div style><br></div><div style>Right now, I&#39;m not too concerned about =
a meta-oe dependency (but I&#39;m just</div><div style>one voice), but it i=
s good to know that there&#39;s the github option as well. And</div><div st=
yle>
there&#39;s the fallback of the layer combo-tooling as well.</div><div styl=
e><br></div><div style>If anyone has experience to offer here .. it would b=
e appreciated, since there&#39;s</div><div style>no sense causing ourselves=
 undo pain and suffering.</div>
<div style><br></div><div style>Cheers,</div><div style><br></div><div styl=
e>Bruce</div><div style><br></div><div>=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">

<br>
I&#39;m fine with the new recipe, just wanted to make sure you had all the<=
br>
information you needed.<br>
<br>
-J.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Lei<br>
&gt;<br>
&gt; Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com">=
lei.yang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../recipes-support/netcat/<a href=3D"http://netcat-openbsd_1.89.bb=
" target=3D"_blank">netcat-openbsd_1.89.bb</a> =A0| =A0 29 ++++++++++++++++=
++++<br>
&gt; =A0meta-networking/recipes-support/netcat/netcat.inc =A0| =A0 =A06 +++=
+<br>
&gt; =A0.../recipes-support/netcat/<a href=3D"http://netcat_0.7.1.bb" targe=
t=3D"_blank">netcat_0.7.1.bb</a> =A0 =A0 =A0 =A0 | =A0 11 +++----<br>
&gt; =A03 files changed, 40 insertions(+), 6 deletions(-)<br>
&gt; =A0create mode 100644 meta-networking/recipes-support/netcat/<a href=
=3D"http://netcat-openbsd_1.89.bb" target=3D"_blank">netcat-openbsd_1.89.bb=
</a><br>
&gt; =A0create mode 100644 meta-networking/recipes-support/netcat/netcat.in=
c<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/netcat/<a href=3D"http://=
netcat-openbsd_1.89.bb" target=3D"_blank">netcat-openbsd_1.89.bb</a> b/meta=
-networking/recipes-support/netcat/<a href=3D"http://netcat-openbsd_1.89.bb=
" target=3D"_blank">netcat-openbsd_1.89.bb</a><br>

&gt; new file mode 100644<br>
&gt; index 0000000..9fe406c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/netcat/<a href=3D"http://netcat-=
openbsd_1.89.bb" target=3D"_blank">netcat-openbsd_1.89.bb</a><br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +require netcat.inc<br>
&gt; +DESCRIPTION =3D &quot;OpenBSD Netcat&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://ftp.debian.org" target=3D"_blank=
">http://ftp.debian.org</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openb=
sd_1.89.orig.tar.gz;name=3Dnetcat \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-op=
enbsd_1.89-4.diff.gz;name=3Dnetcat-patch&quot;<br>
&gt; +<br>
&gt; +SRC_URI[netcat.md5sum] =3D &quot;7238ce15aae43069e96ba7faf03f153e&quo=
t;<br>
&gt; +SRC_URI[netcat.sha256sum] =3D &quot;72e844dde8a2a7cba61971d493758dbea=
9ef0b164bccef15fd4a36490dc77f2b&quot;<br>
&gt; +SRC_URI[netcat-patch.md5sum] =3D &quot;00c65aa22243b76998174c733cbb64=
cc&quot;<br>
&gt; +SRC_URI[netcat-patch.sha256sum] =3D &quot;d5b6b2bd9788114bdcfbb71acad=
0263720b4fdc41529e287adf451b8610f84f1&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/${PN}-${PV}.orig&quot;<br>
&gt; +<br>
&gt; +do_configure[noexec] =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; + =A0 =A0 cd ${S}<br>
&gt; + =A0 =A0 =A0 =A0while read line; do patch -p1 &lt;debian/patches/$lin=
e; done &lt;debian/patches/series<br>
&gt; + =A0 =A0 pkgrel=3D4<br>
&gt; + =A0 =A0 oe_runmake CFLAGS=3D&quot;$CFLAGS -DDEBIAN_VERSION=3D\&quot;=
\\\&quot;${pkgrel}\\\&quot;\&quot;&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; + =A0 =A0 =A0 =A0install -d ${D}${bindir}<br>
&gt; + =A0 =A0 =A0 =A0install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
&gt; +}<br>
&gt; diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-=
networking/recipes-support/netcat/netcat.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4098668<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/netcat/netcat.inc<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +SECTION =3D &quot;console/network&quot;<br>
&gt; +inherit update-alternatives gettext<br>
&gt; +<br>
&gt; +ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
&gt; +ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-support/netcat/<a href=3D"http://=
netcat_0.7.1.bb" target=3D"_blank">netcat_0.7.1.bb</a> b/meta-networking/re=
cipes-support/netcat/<a href=3D"http://netcat_0.7.1.bb" target=3D"_blank">n=
etcat_0.7.1.bb</a><br>

&gt; index c5ab85d..e09202b 100644<br>
&gt; --- a/meta-networking/recipes-support/netcat/<a href=3D"http://netcat_=
0.7.1.bb" target=3D"_blank">netcat_0.7.1.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/netcat/<a href=3D"http://netcat_=
0.7.1.bb" target=3D"_blank">netcat_0.7.1.bb</a><br>
&gt; @@ -1,21 +1,20 @@<br>
&gt; +require netcat.inc<br>
&gt; =A0DESCRIPTION =3D &quot;GNU Netcat&quot;<br>
&gt; =A0HOMEPAGE =3D &quot;<a href=3D"http://netcat.sourceforge.net" target=
=3D"_blank">http://netcat.sourceforge.net</a>&quot;<br>
&gt; -SECTION =3D &quot;console/network&quot;<br>
&gt; =A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9=
b7df079bae19f&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; +PR =3D &quot;r1&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2=
&quot;<br>
&gt;<br>
&gt; =A0SRC_URI[md5sum] =3D &quot;0a29eff1736ddb5effd0b1ec1f6fe0ef&quot;<br=
>
&gt; =A0SRC_URI[sha256sum] =3D &quot;b55af0bbdf5acc02d1eb6ab18da2acd77a400b=
afd074489003f3df09676332bb&quot;<br>
&gt;<br>
&gt; -inherit autotools update-alternatives gettext<br>
&gt; +inherit autotools<br>
&gt;<br>
&gt; =A0do_install_append() {<br>
&gt; - =A0 =A0 mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}<br>
&gt; + =A0 =A0 =A0 =A0install -d ${D}${bindir}<br>
&gt; + =A0 =A0 =A0 =A0mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}<br>
&gt; =A0}<br>
&gt;<br>
&gt; -ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
&gt; -ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
--<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">-Joe MacDonald.<=
br>
:wq<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;
</div></div>

--bcaec554e0f60ec7e604d2aa5481--
