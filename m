Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAC2EE00B81; Tue, 15 Dec 2015 06:15:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3917E0048C
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 06:15:49 -0800 (PST)
Received: by mail-vk0-f42.google.com with SMTP id y187so6035134vka.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 06:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L1Tq7NUGdTQQxTjR3FYDsZbt4AkBbM/gOhryRMGANFw=;
	b=MLzqKrwJvTtCKrA328zxa687Fo6jMOmrM1x2XaqmO3raSriAq19ABtzP2PYCD/rWZw
	kl/P/s52h9wGtV91FEjQP7ijkYRBUdLdzJdA2Nlp+b4Xp7XNo0OYcjuMRhMDDKkNAkTc
	h8aCtKrI4Si5m3F/2Q0XZC8g8yodzXv+mi1iLIX5VrIf4KiwKOWkDQdhNWKTeYKqe+iE
	vxiktcRUwhPJ/xy+47ewhME845nazmxtnnd05DgXJuwEcuwlJmzDBjkLKPGecxFXqPGv
	d7qT6p8kgyvKSUz6Cl11lRDnzW7/nC6WINgOxlSB8mq0T/xijSWBdzCc08fi/vKFCY4v
	/Nyg==
MIME-Version: 1.0
X-Received: by 10.31.140.199 with SMTP id o190mr28933919vkd.63.1450188949145; 
	Tue, 15 Dec 2015 06:15:49 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 15 Dec 2015 06:15:49 -0800 (PST)
In-Reply-To: <CAPuovEJZmJNXt4EF168fWeU=g94dhdgaak3k4B3__oH4xZp_ag@mail.gmail.com>
References: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
	<1449871112-12401-4-git-send-email-cardoe@cardoe.com>
	<CAPuovEJZmJNXt4EF168fWeU=g94dhdgaak3k4B3__oH4xZp_ag@mail.gmail.com>
Date: Tue, 15 Dec 2015 09:15:49 -0500
Message-ID: <CADkTA4NVtyMdC9Ayg72Ki-wJqTRaWuWWCMEs_c8O4yR4n4S60Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] xen: move PR variable from include file
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
X-List-Received-Date: Tue, 15 Dec 2015 14:15:52 -0000
Content-Type: multipart/alternative; boundary=001a11425b202bcfd30526f06d65

--001a11425b202bcfd30526f06d65
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 14, 2015 at 11:08 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

>
> On Dec 11, 2015 4:59 PM, "Doug Goldstein" <cardoe@cardoe.com> wrote:
> >
> > It appears inapporpriate to have this variable in the include file and
> > should live within the bitbake files themselves.
>
> Actually you should drop this completely, the PR server will take care of
> this for you.
>

Indeed. I merged the first three patches, and modified this one to drop the
PR
completely.

Cheers,

Bruce


> Mark
>
> >
> > Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> > ---
> >  recipes-extended/xen/xen.inc      | 1 -
> >  recipes-extended/xen/xen_4.5.0.bb | 1 +
> >  recipes-extended/xen/xen_git.bb   | 1 +
> >  3 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 1bb0e6a..00f1823 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -2,7 +2,6 @@ DESCRIPTION = "Xen hypervisor"
> >  HOMEPAGE = "http://xen.org"
> >  LICENSE = "GPLv2"
> >  SECTION = "console/tools"
> > -PR = "r0"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
> >
> > diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/
> xen_4.5.0.bb
> > index 6c17b90..73d01c4 100644
> > --- a/recipes-extended/xen/xen_4.5.0.bb
> > +++ b/recipes-extended/xen/xen_4.5.0.bb
> > @@ -1,4 +1,5 @@
> >  require xen.inc
> > +PR = "r0"
> >
> >  SRC_URI = " \
> >      http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> > diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> > index 88145a3..4def3bf 100644
> > --- a/recipes-extended/xen/xen_git.bb
> > +++ b/recipes-extended/xen/xen_git.bb
> > @@ -1,4 +1,5 @@
> >  require xen.inc
> > +PR = "r0"
> >
> >  SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
> >
> > --
> > 2.4.10
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11425b202bcfd30526f06d65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Dec 14, 2015 at 11:08 PM, Mark Asselstine <span dir=3D"ltr">&lt=
;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.as=
selstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D""><p dir=3D"ltr"><br>
On Dec 11, 2015 4:59 PM, &quot;Doug Goldstein&quot; &lt;<a href=3D"mailto:c=
ardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It appears inapporpriate to have this variable in the include file and=
<br>
&gt; should live within the bitbake files themselves.<br></p>
</span><p dir=3D"ltr">Actually you should drop this completely, the PR serv=
er will take care of this for you. </p></blockquote><div><br></div><div>Ind=
eed. I merged the first three patches, and modified this one to drop the PR=
<br></div><div>completely.<br><br></div><div>Cheers,<br><br></div><div>Bruc=
e<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"H=
OEnZb"><font color=3D"#888888">
<p dir=3D"ltr">Mark </p></font></span><div class=3D"HOEnZb"><div class=3D"h=
5">
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com"=
 target=3D"_blank">cardoe@cardoe.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; =C2=A0recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_=
blank">xen_4.5.0.bb</a> | 1 +<br>
&gt; =C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_bl=
ank">xen_git.bb</a>=C2=A0 =C2=A0| 1 +<br>
&gt; =C2=A03 files changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index 1bb0e6a..00f1823 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -2,7 +2,6 @@ DESCRIPTION =3D &quot;Xen hypervisor&quot;<br>
&gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://xen.org" target=3D"_blank">=
http://xen.org</a>&quot;<br>
&gt; =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt; =C2=A0SECTION =3D &quot;console/tools&quot;<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De0f0f3ac55608719=
a82394cc353928df&quot;<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" targ=
et=3D"_blank">xen_4.5.0.bb</a> b/recipes-extended/xen/<a href=3D"http://xen=
_4.5.0.bb" target=3D"_blank">xen_4.5.0.bb</a><br>
&gt; index 6c17b90..73d01c4 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_=
blank">xen_4.5.0.bb</a><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_=
blank">xen_4.5.0.bb</a><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; =C2=A0require xen.inc<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI =3D &quot; \<br>
&gt; =C2=A0 =C2=A0 =C2=A0<a href=3D"http://bits.xensource.com/oss-xen/relea=
se/$%7BPV%7D/xen-$%7BPV%7D.tar.gz" target=3D"_blank">http://bits.xensource.=
com/oss-xen/release/${PV}/xen-${PV}.tar.gz</a> \<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" target=
=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a href=3D"http://xen_git=
.bb" target=3D"_blank">xen_git.bb</a><br>
&gt; index 88145a3..4def3bf 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_bl=
ank">xen_git.bb</a><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_bl=
ank">xen_git.bb</a><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; =C2=A0require xen.inc<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0SRCREV =3D &quot;68bd172e6fa565899c846eb72755c8ffd8562c8a&quot;<=
br>
&gt;<br>
&gt; --<br>
&gt; 2.4.10<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
</p>
</div></div><br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail=
_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end&quot;</div>
</div></div>

--001a11425b202bcfd30526f06d65--
