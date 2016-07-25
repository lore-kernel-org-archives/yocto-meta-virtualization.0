Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A8E1E00A48; Mon, 25 Jul 2016 14:15:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8454AE00A00
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jul 2016 14:15:43 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id u134so12609956ywg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jul 2016 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3YsDpTgg03btcKok0xzTgHmyEMu6OYonc3drow9IYkU=;
	b=YS9OrExt1eoCrgib3fEG+FdAT42PHAklhQmkk8yeYvBtMIEiN2PtMUSGFdlSVHkd4v
	15G7SGwiofwyoHjJc30FrGC3+lmtVLS+QebnyovzSVzFXPQMqU9LHodTr+t2Xba+pDMA
	74loBtqogylqpOlZ9Np8lir3hc4kaP/rJiS3TUtwsqO4iLLa0UqZjC++Qu8G12YnsjYm
	NdSZTcgKbkLQQuq1qY/lNonrs5sPE2TCD+/IdL33XGsb7HVBzx2XW6O5L1C1hLchuTfZ
	W9OswNsS7xqahKfae15lJs8LZ/nqkraV7UUendxH95wlrv+zVahzHH4WOu24e4EuV3UU
	/Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3YsDpTgg03btcKok0xzTgHmyEMu6OYonc3drow9IYkU=;
	b=AyapRd9zxYtXCZgLsb934fXRdmqwhpN0Uz7cFshw/Ts7Nbgcl2Ba6qFzFLBaKGTKrB
	Kj8hWf6I7wzaljQF3Dqv35hwFRH+j+eumER2xnB5WWUdVCLs3pbKsTGvq2Zi2W/Zg+gV
	e8N6Kx3mCOZQc3jNWipEUW5eAxBNMaGMAUTgtdKVW7j6qyg7KEiv/Ndkpu1xsia+wMUa
	WOqBToZi5n/h1kQ6Kx/7qZ6+wcz+NeENhqkKnP+FPiD+9Jq93Q7LsX9boa8UGU12HeTr
	KEBQH08FtcNFwCy4gAIVCvZTll1rTPW9TzaoAJUjjv9pxlE1ua83o7KzZpYfPFULQCXs
	WgvQ==
X-Gm-Message-State: AEkoouupPQ2dKE03f/v3XGACUX6cn0fVyPqS4GnT0zQ2jrpJE9XcAkWbmNZol0JCd7sOV5wFBrIQG5kfbR+uAA==
X-Received: by 10.159.33.201 with SMTP id 67mr9631275uac.90.1469481342210;
	Mon, 25 Jul 2016 14:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.51.133 with HTTP; Mon, 25 Jul 2016 14:15:22 -0700 (PDT)
In-Reply-To: <392f2d1b-4b0b-4d2c-9d16-eb54bea986b6@cardoe.com>
References: <1466715778-32065-1-git-send-email-cjp256@gmail.com>
	<392f2d1b-4b0b-4d2c-9d16-eb54bea986b6@cardoe.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Mon, 25 Jul 2016 17:15:22 -0400
Message-ID: <CABZSBQejirjSoZCdZYSdBkjSWOoiyJPt1UdKVCBPpH0NVauJRQ@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: uprev to 4.7.0
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
X-List-Received-Date: Mon, 25 Jul 2016 21:15:47 -0000
Content-Type: multipart/alternative; boundary=001a113d0c9c68178c05387c49e9

--001a113d0c9c68178c05387c49e9
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 26, 2016 at 2:40 PM, Doug Goldstein <cardoe@cardoe.com> wrote:
>
> On 6/23/16 4:02 PM, Chris Patterson wrote:
> > From: Chris Patterson <pattersonc@ainfosec.com>
> >
> > - update packages and add additional ones for new binaries
> >   (cpuid and livepatch)
> > - update xen_git to point to 4.7, make branch= fully variable,
> >   and remove assumed .0 from release version.
> >
> > Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> > ---
> >  recipes-extended/xen/xen.inc      | 15 +++++++++++++++
> >  recipes-extended/xen/xen_4.6.1.bb | 10 ----------
> >  recipes-extended/xen/xen_4.7.0.bb | 10 ++++++++++
> >  recipes-extended/xen/xen_git.bb   |  9 +++++----
> >  4 files changed, 30 insertions(+), 14 deletions(-)
> >  delete mode 100644 recipes-extended/xen/xen_4.6.1.bb
> >  create mode 100644 recipes-extended/xen/xen_4.7.0.bb
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index de8c168..ff502ff 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -151,6 +151,7 @@ PACKAGES = "\
> >      ${PN}-base \
> >      ${PN}-blktap \
> >      ${PN}-console \
> > +    ${PN}-cpuid \
> >      ${PN}-dbg \
> >      ${PN}-dev \
> >      ${PN}-devd \
> > @@ -196,6 +197,7 @@ PACKAGES = "\
> >      ${PN}-libxenvchan-dev \
> >      ${PN}-libxlutil \
> >      ${PN}-libxlutil-dev \
> > +    ${PN}-livepatch \
> >      ${PN}-misc \
> >      ${PN}-pygrub \
> >      ${PN}-python \
> > @@ -369,6 +371,10 @@ FILES_${PN}-console = "\
> >      ${sbindir}/xenconsoled \
> >      "
> >
> > +FILES_${PN}-cpuid = "\
> > +    ${bindir}/xen-cpuid \
> > +    "
> > +
> >  FILES_${PN}-devd = "\
> >      ${sysconfdir}/init.d/xendriverdomain \
> >      "
> > @@ -399,6 +405,10 @@ FILES_${PN}-kdd = "\
> >      ${sbindir}/kdd \
> >      "
> >
> > +FILES_${PN}-livepatch += " \
> > +    ${sbindir}/xen-livepatch \
> > +    "
> > +
> >  FILES_${PN}-misc = "\
> >      ${bindir}/xencons \
> >      ${bindir}/xencov_split \
> > @@ -527,6 +537,7 @@ FILES_${PN}-remus = "\
> >      "
> >
> >  FILES_${PN}-scripts-network = " \
> > +    ${sysconfdir}/xen/scripts/colo-proxy-setup \
> >      ${sysconfdir}/xen/scripts/network-bridge \
> >      ${sysconfdir}/xen/scripts/network-nat \
> >      ${sysconfdir}/xen/scripts/network-route \
> > @@ -544,6 +555,7 @@ FILES_${PN}-scripts-block = " \
> >      ${sysconfdir}/xen/scripts/blktap \
> >      ${sysconfdir}/xen/scripts/block \
> >      ${sysconfdir}/xen/scripts/block-common.sh \
> > +    ${sysconfdir}/xen/scripts/block-dummy \
> >      ${sysconfdir}/xen/scripts/block-enbd \
> >      ${sysconfdir}/xen/scripts/block-iscsi \
> >      ${sysconfdir}/xen/scripts/block-nbd \
> > @@ -837,6 +849,9 @@ do_configure() {
> >  }
> >
> >  do_compile() {
> > +    # workaround for build bug when CFLAGS is exported
> > +    #
https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
> > +    unset CFLAGS
>
> You'll actually also need:
>
>     export HOSTCXX="${BUILD_CXX}"
>     export HOSTCC="${BUILD_CC}"
>
> for things to compile properly for cross compiles as well. You'll need
> that added to do_install() as well.
>

export HOSTCC="${BUILD_CC}" is already in xen.inc, but I will fix and add
HOSTCXX in v2.  Good catch.

>
> >      oe_runmake
> >  }
> >
> > diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/
xen_4.6.1.bb
> > deleted file mode 100644
> > index 0adf8ad..0000000
> > --- a/recipes-extended/xen/xen_4.6.1.bb
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -require xen.inc
> > -
> > -SRC_URI = " \
> > -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> > -    "
> > -
> > -SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
> > -SRC_URI[sha256sum] =
"44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589"
> > -
> > -S = "${WORKDIR}/xen-${PV}"
> > diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/
xen_4.7.0.bb
> > new file mode 100644
> > index 0000000..0565596
> > --- /dev/null
> > +++ b/recipes-extended/xen/xen_4.7.0.bb
> > @@ -0,0 +1,10 @@
> > +require xen.inc
> > +
> > +SRC_URI = " \
> > +    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> > +    "
> > +
> > +SRC_URI[md5sum] = "3aa4e01bf37a3a5bc8572907cb88e649"
> > +SRC_URI[sha256sum] =
"be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623"
> > +
> > +S = "${WORKDIR}/xen-${PV}"
> > diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
xen_git.bb
> > index a86a501..391b47e 100644
> > --- a/recipes-extended/xen/xen_git.bb
> > +++ b/recipes-extended/xen/xen_git.bb
> > @@ -1,15 +1,16 @@
> >  require xen.inc
> >
> > -SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
> > +SRCREV = "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"
>
> If you're going to make the branch variable then I don't think you can
> set this since someone setting the branch will find that this revision
> isn't necessarily in that branch. Granted this was already broken in a
> way due to the ability to change the release.
>
> I'd personally just make this ${AUTOREV} to compensate for that fact.
>

I think AUTOREV is discouraged as a default.  The user is likely to
override this value anyways, possibly in conjunction with XEN_BRANCH (they
can set it to AUTOREV if they want to).  The purpose here was to enable
that without fully overriding SRC_URI and fix the previously hardcoded
assumptions.

I'm not sure if it makes any difference in practice, but I'm going to
update it to SRCREV ?= ... in v2.

Cheers,
-Chris

--001a113d0c9c68178c05387c49e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br><br>On Sun, Jun 26, 2016 at 2:40 PM, Doug Goldste=
in &lt;<a target=3D"_blank" href=3D"mailto:cardoe@cardoe.com">cardoe@cardoe=
.com</a>&gt; wrote:<br>&gt;<br>&gt; On 6/23/16 4:02 PM, Chris Patterson wro=
te:<br>&gt; &gt; From: Chris Patterson &lt;<a target=3D"_blank" href=3D"mai=
lto:pattersonc@ainfosec.com">pattersonc@ainfosec.com</a>&gt;<br>&gt; &gt;<b=
r>&gt; &gt; - update packages and add additional ones for new binaries<br>&=
gt; &gt; =C2=A0 (cpuid and livepatch)<br>&gt; &gt; - update xen_git to poin=
t to 4.7, make branch=3D fully variable,<br>&gt; &gt; =C2=A0 and remove ass=
umed .0 from release version.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Chri=
s Patterson &lt;<a target=3D"_blank" href=3D"mailto:pattersonc@ainfosec.com=
">pattersonc@ainfosec.com</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0recip=
es-extended/xen/xen.inc =C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>&gt; &g=
t; =C2=A0recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_4.6.1=
.bb">xen_4.6.1.bb</a> | 10 ----------<br>&gt; &gt; =C2=A0recipes-extended/x=
en/<a target=3D"_blank" href=3D"http://xen_4.7.0.bb">xen_4.7.0.bb</a> | 10 =
++++++++++<br>&gt; &gt; =C2=A0recipes-extended/xen/<a target=3D"_blank" hre=
f=3D"http://xen_git.bb">xen_git.bb</a> =C2=A0 | =C2=A09 +++++----<br>&gt; &=
gt; =C2=A04 files changed, 30 insertions(+), 14 deletions(-)<br>&gt; &gt; =
=C2=A0delete mode 100644 recipes-extended/xen/<a target=3D"_blank" href=3D"=
http://xen_4.6.1.bb">xen_4.6.1.bb</a><br>&gt; &gt; =C2=A0create mode 100644=
 recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_4.7.0.bb">xen=
_4.7.0.bb</a><br>&gt; &gt;<br>&gt; &gt; diff --git a/recipes-extended/xen/x=
en.inc b/recipes-extended/xen/xen.inc<br>&gt; &gt; index de8c168..ff502ff 1=
00644<br>&gt; &gt; --- a/recipes-extended/xen/xen.inc<br>&gt; &gt; +++ b/re=
cipes-extended/xen/xen.inc<br>&gt; &gt; @@ -151,6 +151,7 @@ PACKAGES =3D &q=
uot;\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-base \<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0${PN}-blktap \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-console \<b=
r>&gt; &gt; + =C2=A0 =C2=A0${PN}-cpuid \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0$=
{PN}-dbg \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-dev \<br>&gt; &gt; =C2=A0=
 =C2=A0 =C2=A0${PN}-devd \<br>&gt; &gt; @@ -196,6 +197,7 @@ PACKAGES =3D &q=
uot;\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-libxenvchan-dev \<br>&gt; &gt;=
 =C2=A0 =C2=A0 =C2=A0${PN}-libxlutil \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${P=
N}-libxlutil-dev \<br>&gt; &gt; + =C2=A0 =C2=A0${PN}-livepatch \<br>&gt; &g=
t; =C2=A0 =C2=A0 =C2=A0${PN}-misc \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-=
pygrub \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${PN}-python \<br>&gt; &gt; @@ -3=
69,6 +371,10 @@ FILES_${PN}-console =3D &quot;\<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0${sbindir}/xenconsoled \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0&quot;<br>&=
gt; &gt;<br>&gt; &gt; +FILES_${PN}-cpuid =3D &quot;\<br>&gt; &gt; + =C2=A0 =
=C2=A0${bindir}/xen-cpuid \<br>&gt; &gt; + =C2=A0 =C2=A0&quot;<br>&gt; &gt;=
 +<br>&gt; &gt; =C2=A0FILES_${PN}-devd =3D &quot;\<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/init.d/xendriverdomain \<br>&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0&quot;<br>&gt; &gt; @@ -399,6 +405,10 @@ FILES_${PN}-kdd =3D &quot;\=
<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${sbindir}/kdd \<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0&quot;<br>&gt; &gt;<br>&gt; &gt; +FILES_${PN}-livepatch +=3D &quo=
t; \<br>&gt; &gt; + =C2=A0 =C2=A0${sbindir}/xen-livepatch \<br>&gt; &gt; + =
=C2=A0 =C2=A0&quot;<br>&gt; &gt; +<br>&gt; &gt; =C2=A0FILES_${PN}-misc =3D =
&quot;\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0${bindir}/xencons \<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0${bindir}/xencov_split \<br>&gt; &gt; @@ -527,6 +537,7 =
@@ FILES_${PN}-remus =3D &quot;\<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0&quot;<br=
>&gt; &gt;<br>&gt; &gt; =C2=A0FILES_${PN}-scripts-network =3D &quot; \<br>&=
gt; &gt; + =C2=A0 =C2=A0${sysconfdir}/xen/scripts/colo-proxy-setup \<br>&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-bridge \<br>&g=
t; &gt; =C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-nat \<br>&gt;=
 &gt; =C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/network-route \<br>&gt;=
 &gt; @@ -544,6 +555,7 @@ FILES_${PN}-scripts-block =3D &quot; \<br>&gt; &g=
t; =C2=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/blktap \<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0${sysconfdir}/xen/scripts/block \<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/xen/scripts/block-common.sh \<br>&gt; &gt; + =C2=A0=
 =C2=A0${sysconfdir}/xen/scripts/block-dummy \<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0${sysconfdir}/xen/scripts/block-enbd \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/xen/scripts/block-iscsi \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/xen/scripts/block-nbd \<br>&gt; &gt; @@ -837,6 +849,9 @@ d=
o_configure() {<br>&gt; &gt; =C2=A0}<br>&gt; &gt;<br>&gt; &gt; =C2=A0do_com=
pile() {<br>&gt; &gt; + =C2=A0 =C2=A0# workaround for build bug when CFLAGS=
 is exported<br>&gt; &gt; + =C2=A0 =C2=A0# <a target=3D"_blank" href=3D"htt=
ps://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html">https://ww=
w.mail-archive.com/xen-devel@lists.xen.org/msg67822.html</a><br>&gt; &gt; +=
 =C2=A0 =C2=A0unset CFLAGS<br>&gt;<br>&gt; You&#39;ll actually also need:<b=
r>&gt;<br>&gt; =C2=A0 =C2=A0 export HOSTCXX=3D&quot;${BUILD_CXX}&quot;<br>&=
gt; =C2=A0 =C2=A0 export HOSTCC=3D&quot;${BUILD_CC}&quot;<br>&gt;<br>&gt; f=
or things to compile properly for cross compiles as well. You&#39;ll need<b=
r>&gt; that added to do_install() as well.<br>&gt;<br><br></div><div>export=
 HOSTCC=3D&quot;${BUILD_CC}&quot; is already in xen.inc, but I will fix and=
 add HOSTCXX in v2.=C2=A0 Good catch.<br></div><div><br></div><div>&gt;<br>=
&gt; &gt; =C2=A0 =C2=A0 =C2=A0oe_runmake<br>&gt; &gt; =C2=A0}<br>&gt; &gt;<=
br>&gt; &gt; diff --git a/recipes-extended/xen/<a target=3D"_blank" href=3D=
"http://xen_4.6.1.bb">xen_4.6.1.bb</a> b/recipes-extended/xen/<a target=3D"=
_blank" href=3D"http://xen_4.6.1.bb">xen_4.6.1.bb</a><br>&gt; &gt; deleted =
file mode 100644<br>&gt; &gt; index 0adf8ad..0000000<br>&gt; &gt; --- a/rec=
ipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_4.6.1.bb">xen_4.6=
.1.bb</a><br>&gt; &gt; +++ /dev/null<br>&gt; &gt; @@ -1,10 +0,0 @@<br>&gt; =
&gt; -require xen.inc<br>&gt; &gt; -<br>&gt; &gt; -SRC_URI =3D &quot; \<br>=
&gt; &gt; - =C2=A0 =C2=A0<a target=3D"_blank" href=3D"http://bits.xensource=
.com/oss-xen/release/$%7BPV%7D/xen-$%7BPV%7D.tar.gz">http://bits.xensource.=
com/oss-xen/release/${PV}/xen-${PV}.tar.gz</a> \<br>&gt; &gt; - =C2=A0 =C2=
=A0&quot;<br>&gt; &gt; -<br>&gt; &gt; -SRC_URI[md5sum] =3D &quot;df2d854c3c=
90ffeefaf71e7f868fb326&quot;<br>&gt; &gt; -SRC_URI[sha256sum] =3D &quot;44c=
c2fccba1e147ef4c8da0584ce0f24189c8743de0e3e9a9226da88ddb5f589&quot;<br>&gt;=
 &gt; -<br>&gt; &gt; -S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>&gt; &gt; d=
iff --git a/recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_4.=
7.0.bb">xen_4.7.0.bb</a> b/recipes-extended/xen/<a target=3D"_blank" href=
=3D"http://xen_4.7.0.bb">xen_4.7.0.bb</a><br>&gt; &gt; new file mode 100644=
<br>&gt; &gt; index 0000000..0565596<br>&gt; &gt; --- /dev/null<br>&gt; &gt=
; +++ b/recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_4.7.0.=
bb">xen_4.7.0.bb</a><br>&gt; &gt; @@ -0,0 +1,10 @@<br>&gt; &gt; +require xe=
n.inc<br>&gt; &gt; +<br>&gt; &gt; +SRC_URI =3D &quot; \<br>&gt; &gt; + =C2=
=A0 =C2=A0<a target=3D"_blank" href=3D"http://bits.xensource.com/oss-xen/re=
lease/$%7BPV%7D/xen-$%7BPV%7D.tar.gz">http://bits.xensource.com/oss-xen/rel=
ease/${PV}/xen-${PV}.tar.gz</a> \<br>&gt; &gt; + =C2=A0 =C2=A0&quot;<br>&gt=
; &gt; +<br>&gt; &gt; +SRC_URI[md5sum] =3D &quot;3aa4e01bf37a3a5bc8572907cb=
88e649&quot;<br>&gt; &gt; +SRC_URI[sha256sum] =3D &quot;be5876144d49729572a=
e06142e0bb93f1c1f2695578141eff2931995add24623&quot;<br>&gt; &gt; +<br>&gt; =
&gt; +S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>&gt; &gt; diff --git a/reci=
pes-extended/xen/<a target=3D"_blank" href=3D"http://xen_git.bb">xen_git.bb=
</a> b/recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_git.bb"=
>xen_git.bb</a><br>&gt; &gt; index a86a501..391b47e 100644<br>&gt; &gt; ---=
 a/recipes-extended/xen/<a target=3D"_blank" href=3D"http://xen_git.bb">xen=
_git.bb</a><br>&gt; &gt; +++ b/recipes-extended/xen/<a target=3D"_blank" hr=
ef=3D"http://xen_git.bb">xen_git.bb</a><br>&gt; &gt; @@ -1,15 +1,16 @@<br>&=
gt; &gt; =C2=A0require xen.inc<br>&gt; &gt;<br>&gt; &gt; -SRCREV =3D &quot;=
1fd615aa0108490ffc558d27627f509183cbfdaf&quot;<br>&gt; &gt; +SRCREV =3D &qu=
ot;9a6cc4f5c14b3d7542b7523f88a1b65464733d3a&quot;<br>&gt;<br>&gt; If you&#3=
9;re going to make the branch variable then I don&#39;t think you can<br>&g=
t; set this since someone setting the branch will find that this revision<b=
r>&gt; isn&#39;t necessarily in that branch. Granted this was already broke=
n in a<br>&gt; way due to the ability to change the release.<br>&gt;<br>&gt=
; I&#39;d personally just make this ${AUTOREV} to compensate for that fact.=
<br>&gt;<br><br></div>I think AUTOREV is discouraged as a default.=C2=A0 Th=
e user is likely to override this value anyways, possibly in conjunction wi=
th XEN_BRANCH (they can set it to AUTOREV if they want to).=C2=A0 The purpo=
se here was to enable that without fully overriding SRC_URI and fix the pre=
viously hardcoded assumptions.<br><br>I&#39;m not sure if it makes any diff=
erence in practice, but I&#39;m going to update it to SRCREV ?=3D ... in v2=
.<br><br><div>Cheers,<br></div><div>-Chris<br></div></div>

--001a113d0c9c68178c05387c49e9--
