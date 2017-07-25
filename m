Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20E70E00C44; Tue, 25 Jul 2017 06:02:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.47 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8258E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:02:28 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id p2so40415152lfg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KYHzcU396YweLbIVuMB0xWt/OEvlhLTivWyI0PwK/PE=;
	b=o4sAy51AldVUJQICNHf+PD7OfIJnhSvC+455xYLh5a95EOBTRSIXEOzHy8sTTo8/V3
	hj8HK4IIgNwIL3nLuWVytFbytC5UEEWzK0JuRDg9kfnDYAsDhDjRhjFR8FO4uza+Vqr3
	0J2b/P+kASc91LrPjr4lGRGmh+7HVnctij4XRxgeGt/1nkS8nqrsrM8Z/1do1EJLl00l
	GJ7Ft5zsCHdWquFjtTRVFMI0ZjU5NekSU5oPgDdsH2DpfeBVGKBj+mbqiXfJIwjt+hxD
	ne6nzgkL3TGItS7mEG3zo/n+tGUpzEi55n82q9jytCYeEbQW4wxgqDTdDgq6lZGr+vKt
	178w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KYHzcU396YweLbIVuMB0xWt/OEvlhLTivWyI0PwK/PE=;
	b=pC3HRLpBLpGBdNcCVJQuN+YQTRXhUAPaV5aWzEwnRxz0UDf6ubJRPwzPE7iwutrnnM
	AEBDd9SAY4FQwSaYmwO8euQvhO4yM5hQm2WTwetG6Qc4aoOPSH+uF2ZRgUkxCj0entA9
	Epyyzja93KyLwh4SeAY1Tsqr9jDMUx6272n7B/m2DkTtafLNxr1f1o0tZ2YEM2mGCwFJ
	DF8rwLWBQWgwTVExpxmOqnm5FZqWwUHXCW5s0+6PtuBOMFIT1Rs0+hbPWrW2Y6AEUR0f
	Vps+G1MHh6GVswqNYbchpFVCPp6B59Q5rsAcK4yAsPlf036RDEQ9lK6ed9MIMunOIktk
	92Sw==
X-Gm-Message-State: AIVw111T/WhvV+0OKTWsWJezPhTNjw1g2Y2fyhV6lSZa6PZ1o1BbGdAM
	6nmyLdw5K0g58fr332p3KkXiQcUudA==
X-Received: by 10.46.71.17 with SMTP id u17mr1455225lja.73.1500987747333; Tue,
	25 Jul 2017 06:02:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Tue, 25 Jul 2017 06:02:26 -0700 (PDT)
In-Reply-To: <5891948.Vm2DIDaPVG@yow-masselst-lx1>
References: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
	<CAPuovEKujQt1p+5+03X30p0NVQSOUxh1RXtAi+pjdywZZsgA1Q@mail.gmail.com>
	<b5250488-6970-f6f8-3cbf-5666313b5fd9@windriver.com>
	<5891948.Vm2DIDaPVG@yow-masselst-lx1>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jul 2017 09:02:26 -0400
Message-ID: <CADkTA4Ot7=+ycsd1jc7DrG58Bu4yHcCqKT7Y9J0ci2itYCWZhw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/3] libibverbs: add new recpie
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
X-List-Received-Date: Tue, 25 Jul 2017 13:02:50 -0000
Content-Type: multipart/alternative; boundary="001a1141173e7dfa79055523f17c"

--001a1141173e7dfa79055523f17c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 8:44 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Tuesday, July 25, 2017 3:38:24 PM EDT Yi Zhao wrote:
> > =E5=9C=A8 2017=E5=B9=B407=E6=9C=8825=E6=97=A5 03:29, Mark Asselstine =
=E5=86=99=E9=81=93:
> > > On Mon, Jul 24, 2017 at 1:14 AM, Yi Zhao <yi.zhao@windriver.com>
> wrote:
> > >> Libibverbs is a library that allows userspace processes to use
> > >> InfiniBand/RDMA 'verbs' directly.
> > >>
> > >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > >> ---
> > >>
> > >>   recipes-extended/libibverbs/libibverbs_1.1.7.bb | 27
> > >>   +++++++++++++++++++++++++ 1 file changed, 27 insertions(+)
> > >>   create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
> > >>
> > >> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> > >> b/recipes-extended/libibverbs/libibverbs_1.1.7.bb new file mode
> 100644
> > >> index 0000000..e75f90d
> > >> --- /dev/null
> > >> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> > >> @@ -0,0 +1,27 @@
> > >> +SUMMARY =3D "Support InfiniBand verbs"
> > >> +DESCRIPTION =3D "Libibverbs is a library that allows userspace
> processes
> > >> to use InfiniBand/RDMA 'verbs' directly." +HOMEPAGE =3D
> > >> "http://www.openfabrics.org/downloads/verbs/"
> > >
> > > I am fine with this series overall. It is nice to see an uprev to
> > > gluster and an effort to get it working again. I only have one
> > > request. The page above basically indicates that software which used
> > > libibverbs should transition to rdma_core and that this software is
> > > basically deprecated. Are we using this instead of rdma_core because
> > > Gluster has yet to make this transition? We need to capture whatever
> > > the reasons are in the commit log.
> >
> > I checked the commit log for glusterfs, there is no explicit message
> > said it only depend on old libibverbs.
> > For rdma-core, it is a collection including libibverbs and librdmacm. I
> > did a quick test that glusterfs can be built when depending on it.
> > So maybe we could using rdma-core instead of libibverbs and librdmacm ?
>
> I am fine with the current approach but please add the above to the commi=
t
> log
> for the libibverbs commit. Something like
>
> "libibverbs is now part of rdma-core and the standalone libibverbs projec=
t
> has
> been deprecated. Rough testing shows that we can move to use rdma-core
> however
> we have yet to perform extensive testing with this change. We therefor wi=
ll
> continue to use the standalone libibverbs at this point in time. This is
> also
> inline with the upstream glusterfs project that still lists libibverbs as=
 a
> dependency."
>

Agreed.

I'm going to drop this series and wait for a v2 with the updated commit log=
.

Make sure to send all three patches in the series again.

Cheers,

Bruce


>
> MarkA
>
> >
> > Regards,
> > Yi
> >
> > > Regards,
> > > Mark
> > >
> > >> +SECTION =3D "libs/devel"
> > >> +
> > >> +LICENSE =3D "BSD"
> > >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c557f27dd
> 795ba77cc419dddc656b51"
> > >> +
> > >> +# Official repo is at
> > >> git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git +SRC_URI
> =3D
> > >> "http://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz" +
> > >> +SRC_URI[md5sum] =3D "5aea59e4766ae4548419010ac84032ff"
> > >> +SRC_URI[sha256sum] =3D
> > >> "31b4114bf32d41c9fc81a862ec5febed1e982975f21fa177ea9c7516c9064690" +
> > >> +inherit autotools
> > >> +
> > >> +PACKAGES +=3D "${PN}-utils"
> > >> +FILES_${PN} =3D "${sysconfdir} ${libdir}/*.so.*"
> > >> +FILES_${PN}-utils =3D "${bindir}"
> > >> +
> > >> +PACKAGECONFIG ??=3D ""
> > >> +PACKAGECONFIG[valgrind] =3D "--with-valgrind,--without-val
> grind,valgrind,"
> > >> +
> > >> +do_install_append() {
> > >> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
> > >> +        rm -f ${D}${libdir}/libibverbs.la
> > >> +}
> > >> --
> > >> 2.7.4
> > >>
> > >> --
> > >> _______________________________________________
> > >> meta-virtualization mailing list
> > >> meta-virtualization@yoctoproject.org
> > >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1141173e7dfa79055523f17c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 25, 2017 at 8:44 AM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div class=3D"m_-4011838666333753800HOEnZb"><div class=3D"m_-401183=
8666333753800h5">On Tuesday, July 25, 2017 3:38:24 PM EDT Yi Zhao wrote:<br=
>
&gt; =E5=9C=A8 2017=E5=B9=B407=E6=9C=8825=E6=97=A5 03:29, Mark Asselstine =
=E5=86=99=E9=81=93:<br>
&gt; &gt; On Mon, Jul 24, 2017 at 1:14 AM, Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt; wrote:=
<br>
&gt; &gt;&gt; Libibverbs is a library that allows userspace processes to us=
e<br>
&gt; &gt;&gt; InfiniBand/RDMA &#39;verbs&#39; directly.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0recipes-extended/libibverbs/<a href=3D"http://lib=
ibverbs_1.1.7.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr>ibibverbs_1.1.=
7.bb</a> | 27<br>
&gt; &gt;&gt;=C2=A0 =C2=A0+++++++++++++++++++++++++ 1 file changed, 27 inse=
rtions(+)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0create mode 100644 recipes-extended/libibverbs/<a=
 href=3D"http://libibverbs_1.1.7.bb" rel=3D"noreferrer" target=3D"_blank">l=
i<wbr>bibverbs_1.1.7.bb</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/recipes-extended/libibverbs/<a href=3D"http://li=
bibverbs_1.1.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libibverbs_1.1=
.7.bb</a><br>
&gt; &gt;&gt; b/recipes-extended/libibverbs/<a href=3D"http://libibverbs_1.=
1.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libibverbs_1.1.7.bb</a> n=
ew file mode 100644<br>
&gt; &gt;&gt; index 0000000..e75f90d<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/recipes-extended/libibverbs/<a href=3D"http://libibverb=
s_1.1.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libibverbs_1.1.7.bb</=
a><br>
&gt; &gt;&gt; @@ -0,0 +1,27 @@<br>
&gt; &gt;&gt; +SUMMARY =3D &quot;Support InfiniBand verbs&quot;<br>
&gt; &gt;&gt; +DESCRIPTION =3D &quot;Libibverbs is a library that allows us=
erspace processes<br>
&gt; &gt;&gt; to use InfiniBand/RDMA &#39;verbs&#39; directly.&quot; +HOMEP=
AGE =3D<br>
&gt; &gt;&gt; &quot;<a href=3D"http://www.openfabrics.org/downloads/verbs/"=
 rel=3D"noreferrer" target=3D"_blank">http://www.openfabrics.org/do<wbr>wnl=
oads/verbs/</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; I am fine with this series overall. It is nice to see an uprev to=
<br>
&gt; &gt; gluster and an effort to get it working again. I only have one<br=
>
&gt; &gt; request. The page above basically indicates that software which u=
sed<br>
&gt; &gt; libibverbs should transition to rdma_core and that this software =
is<br>
&gt; &gt; basically deprecated. Are we using this instead of rdma_core beca=
use<br>
&gt; &gt; Gluster has yet to make this transition? We need to capture whate=
ver<br>
&gt; &gt; the reasons are in the commit log.<br>
&gt;<br>
&gt; I checked the commit log for glusterfs, there is no explicit message<b=
r>
&gt; said it only depend on old libibverbs.<br>
&gt; For rdma-core, it is a collection including libibverbs and librdmacm. =
I<br>
&gt; did a quick test that glusterfs can be built when depending on it.<br>
&gt; So maybe we could using rdma-core instead of libibverbs and librdmacm =
?<br>
<br>
</div></div>I am fine with the current approach but please add the above to=
 the commit log<br>
for the libibverbs commit. Something like<br>
<br>
&quot;libibverbs is now part of rdma-core and the standalone libibverbs pro=
ject has<br>
been deprecated. Rough testing shows that we can move to use rdma-core howe=
ver<br>
we have yet to perform extensive testing with this change. We therefor will=
<br>
continue to use the standalone libibverbs at this point in time. This is al=
so<br>
inline with the upstream glusterfs project that still lists libibverbs as a=
<br>
dependency.&quot;<br></blockquote><div><br></div><div>Agreed.</div><div><br=
></div><div>I&#39;m going to drop this series and wait for a v2 with the up=
dated commit log.</div><div><br></div><div>Make sure to send all three patc=
hes in the series again.</div><div><br></div><div>Cheers,</div><div><br></d=
iv><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
MarkA<br>
<div class=3D"m_-4011838666333753800HOEnZb"><div class=3D"m_-40118386663337=
53800h5"><br>
&gt;<br>
&gt; Regards,<br>
&gt; Yi<br>
&gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Mark<br>
&gt; &gt;<br>
&gt; &gt;&gt; +SECTION =3D &quot;libs/devel&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +LICENSE =3D &quot;BSD&quot;<br>
&gt; &gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D7c557f27dd<w=
br>795ba77cc419dddc656b51&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +# Official repo is at<br>
&gt; &gt;&gt; git://<a href=3D"http://git.kernel.org/pub/scm/libs/infiniban=
d/libibverbs.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/s=
cm/l<wbr>ibs/infiniband/libibverbs.git</a> +SRC_URI =3D<br>
&gt; &gt;&gt; &quot;<a href=3D"http://www.openfabrics.org/downloads/verbs/$=
%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.openfabrics.org/do<wbr>wnloads/verbs/${BPN}-${PV}.tar<wbr>.gz</a>&quot; +<=
br>
&gt; &gt;&gt; +SRC_URI[md5sum] =3D &quot;5aea59e4766ae4548419010ac8403<wbr>=
2ff&quot;<br>
&gt; &gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt;&gt; &quot;31b4114bf32d41c9fc81a862ec5fe<wbr>bed1e982975f21fa177ea=
9c7516c90<wbr>64690&quot; +<br>
&gt; &gt;&gt; +inherit autotools<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +PACKAGES +=3D &quot;${PN}-utils&quot;<br>
&gt; &gt;&gt; +FILES_${PN} =3D &quot;${sysconfdir} ${libdir}/*.so.*&quot;<b=
r>
&gt; &gt;&gt; +FILES_${PN}-utils =3D &quot;${bindir}&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; &gt;&gt; +PACKAGECONFIG[valgrind] =3D &quot;--with-valgrind,--without-=
val<wbr>grind,valgrind,&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +do_install_append() {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${sysconfdir}/libib=
verbs.d<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${libdir}/<a href=3D"h=
ttp://libibverbs.la" rel=3D"noreferrer" target=3D"_blank">libibverbs.la</a>=
<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.7.4<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; ______________________________<wbr>_________________<br>
&gt; &gt;&gt; meta-virtualization mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
&gt; &gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org<wbr>/listinfo/meta-virtualization</a><br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"m_-4011838666333753800gmail_signature" data-smartmail=3D"gmai=
l_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and ma=
dness await thee at its end&quot;</div>
</div></div>

--001a1141173e7dfa79055523f17c--
