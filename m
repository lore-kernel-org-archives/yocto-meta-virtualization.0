Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29EA3E00B49; Thu,  1 Jun 2017 09:00:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.172 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0681E00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu,  1 Jun 2017 09:00:03 -0700 (PDT)
Received: by mail-qk0-f172.google.com with SMTP id 19so39975761qke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 01 Jun 2017 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tafOQCK3xFqHsqATpaeyQQKkJT1KUZSAL1xSTdsOPVU=;
	b=Fz88CwxFgGNn4gHHK8tA3yQwA15D5pW353qF8wE5SbTRrsk6pxb0lTvyu0GVb8jPWS
	sE3JnxPNefEHurTBBEAIoff23AedZ9kDlLWUvv8GeD4APc6WAKuaypqPp+MJsQK7jcWA
	J7CSD2UMP0NpMBapaf2JaTJrpgIrnrL7cOtBhWUKxcoRlR5s5o0L1RFRGYp92Gmp7hxV
	2xPI9lmnP7iA2dA2eddVFu/Jdg6oJL8xCeOuZZ0Bh33xKjGLbgT2e59jVyuHUWAC18I8
	hlGMdFk0UviID+mgVgf6r18O3OR3E96fVdVxordiGT0W1R6biUDFaEFAQrlJI+7HZ5yx
	0oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tafOQCK3xFqHsqATpaeyQQKkJT1KUZSAL1xSTdsOPVU=;
	b=RAr50QoiNLEHGOj1HIG28Cb+SL/MJWiqcySp2H6kUi2TH4BkMTyy1bcCSSnQnkts0z
	FRbBv9pz7sF53smd+AD9UpPoxyBeKuirsfTqt3g5UAp42vNwjhzDfRcFQlpzOvPekCjt
	babhVTLGSB01oCErd1Pw08rlJF+ZkJYhug8xVwj/2vsiaJ6qXvFXPfYlWGC7fp9rDprk
	QklsO4ZEdvVSTApU8tD9Ms7EBE89AruhwR7u5qxc0UXObGKtXecQqDwa+ef4gIXdjsh0
	Vk+xJE8TzAqK8xkEnkjUxSTYa2HtovMaBN/Qg1srx9KFbP+fU0ve7wcoIUEoJqx12Zm5
	wDjA==
X-Gm-Message-State: AKS2vOyy3q73/TitmWSLUTUqxrLYAglrhwaWvyaFsSV0LO6mwIX3+Obz
	ZNja44rdhF2cyqczvHPcnqeUNz1RxA==
X-Received: by 10.55.118.199 with SMTP id r190mr2763059qkc.43.1496332802638;
	Thu, 01 Jun 2017 09:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Thu, 1 Jun 2017 09:00:02 -0700 (PDT)
In-Reply-To: <CAPuovEKKWNCbadFVa3gViV_x2CcD-rSzV2dwO2smw7M7XQ85Tw@mail.gmail.com>
References: <1495541635-40607-1-git-send-email-adrian.dudau@enea.com>
	<CAPuovEKKWNCbadFVa3gViV_x2CcD-rSzV2dwO2smw7M7XQ85Tw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Jun 2017 12:00:02 -0400
Message-ID: <CADkTA4Mgp1b7DSqaLbn3HDF+C12-f5qaWZcphXsnZXmFxLrjAA@mail.gmail.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python: Inherit setuptools instead of distutils for several packages
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
X-List-Received-Date: Thu, 01 Jun 2017 16:00:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c05e3642ac7f70550e8214b"

--94eb2c05e3642ac7f70550e8214b
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 1:14 PM, M. Asselstine <asselsm@mcmaster.ca> wrote:

> On Tue, May 23, 2017 at 8:13 AM, Adrian Dudau <adrian.dudau@enea.com>
> wrote:
> > python-appdirs
> > python-keystoneauth
> > python-lesscpy
> > python-os-client-config
> >
> > The setup scripts of these modules use setuptools instead of distutils,
> > resulting in errors like this:
> >
> > |   File "setup.py", line 5, in <module>
> > |     from setuptools import setup
> > | ImportError: No module named setuptools
> >
> > Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
>
>
> Agreed. The setup.py for all of these packages have some form of
> 'import setuptools' so this is the correct change. I mentioned to
> Bruce I would have a look at these as I know in the past we have had
> some flip-flopping in this regard. Anyways, Bruce this change is fine
> and at least in my mind OK to merge.
>

Thanks for the review, I was looking for another opinion!

This is now merged.

Bruce


>
> Mark
>
> > ---
> >  meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> | 2 +-
> >  meta-openstack/recipes-devtools/python/python-keystoneauth1_2.18.0.bb
> | 2 +-
> >  meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
>  | 2 +-
> >  meta-openstack/recipes-devtools/python/python-os-client-config_git.bb
> | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> appdirs_git.bb b/meta-openstack/recipes-devtools/python/python-
> appdirs_git.bb
> > index 8e40f26..2482871 100644
> > --- a/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-appdirs_git.bb
> > @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ActiveState/${SRCNAME}.git
> "
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit distutils
> > +inherit setuptools
> >
> >  DEPENDS += " \
> >          python-pip \
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> keystoneauth1_2.18.0.bb b/meta-openstack/recipes-devtools/python/python-
> keystoneauth1_2.18.0.bb
> > index 1fdf9e1..83582c5 100644
> > --- a/meta-openstack/recipes-devtools/python/python-
> keystoneauth1_2.18.0.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-
> keystoneauth1_2.18.0.bb
> > @@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "075a9ca7a8877c5885fa2487699015
> e45260c4e6be119683effe0ad2ab
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > -inherit distutils
> > +inherit setuptools
> >
> >  DEPENDS += " \
> >          python-pbr \
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> lesscpy_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-
> lesscpy_0.10.2.bb
> > index 61ae935..71e0dc0 100644
> > --- a/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-lesscpy_0.10.2.bb
> > @@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "ccad1ad2a89ced1875c5ca4e16e547
> 8b791d31fb187fe29f1541859318
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > -inherit distutils
> > +inherit setuptools
> >
> >  DISTUTILS_INSTALL_ARGS = "--root=${D} \
> >      --prefix=${prefix} \
> > diff --git a/meta-openstack/recipes-devtools/python/python-os-
> client-config_git.bb b/meta-openstack/recipes-devtools/python/python-os-
> client-config_git.bb
> > index 7b55dbb..5393bb7 100644
> > --- a/meta-openstack/recipes-devtools/python/python-os-
> client-config_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-os-
> client-config_git.bb
> > @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openstack/${
> SRCNAME}.git;branch=stable/newton"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit distutils
> > +inherit setuptools
> >
> >  DEPENDS += " \
> >          python-pbr \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05e3642ac7f70550e8214b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 31, 2017 at 1:14 PM, M. Asselstine <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:asselsm@mcmaster.ca" target=3D"_blank">asselsm@mcmaster.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On=
 Tue, May 23, 2017 at 8:13 AM, Adrian Dudau &lt;<a href=3D"mailto:adrian.du=
dau@enea.com">adrian.dudau@enea.com</a>&gt; wrote:<br>
&gt; python-appdirs<br>
&gt; python-keystoneauth<br>
&gt; python-lesscpy<br>
&gt; python-os-client-config<br>
&gt;<br>
&gt; The setup scripts of these modules use setuptools instead of distutils=
,<br>
&gt; resulting in errors like this:<br>
&gt;<br>
&gt; |=C2=A0 =C2=A0File &quot;setup.py&quot;, line 5, in &lt;module&gt;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0from setuptools import setup<br>
&gt; | ImportError: No module named setuptools<br>
&gt;<br>
&gt; Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.co=
m">adrian.dudau@enea.com</a>&gt;<br>
<br>
<br>
</span>Agreed. The setup.py for all of these packages have some form of<br>
&#39;import setuptools&#39; so this is the correct change. I mentioned to<b=
r>
Bruce I would have a look at these as I know in the past we have had<br>
some flip-flopping in this regard. Anyways, Bruce this change is fine<br>
and at least in my mind OK to merge.<br></blockquote><div><br></div><div>Th=
anks for the review, I was looking for another opinion!</div><div><br></div=
><div>This is now merged.</div><div><br></div><div>Bruce</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Mark<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-appdirs_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>appdi=
rs_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-keystoneauth1_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<=
wbr>keystoneauth1_2.18.0.bb</a> | 2 +-<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-lesscpy_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>le=
sscpy_0.10.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-os-client-config_git.bb" rel=3D"noreferrer" target=3D"_blank">python-o=
s-<wbr>client-config_git.bb</a> | 2 +-<br>
&gt;=C2=A0 4 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-appdirs_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wb=
r>appdirs_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-appdirs_git.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on-<wbr>appdirs_git.bb</a><br>
&gt; index 8e40f26..2482871 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-appdirs_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>appdi=
rs_git.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-appdirs_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>appdi=
rs_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/ActiveState/${SRCNAME}.git" rel=3D"noreferrer" target=3D"_blank">github.co=
m/ActiveState/<wbr>${SRCNAME}.git</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit distutils<br>
&gt; +inherit setuptools<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pip \<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-keystoneauth1_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-<wbr>keystoneauth1_2.18.0.bb</a> b/meta-openstack/recipes-<wbr>devtoo=
ls/python/<a href=3D"http://python-keystoneauth1_2.18.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-<wbr>keystoneauth1_2.18.0.bb</a><br>
&gt; index 1fdf9e1..83582c5 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-keystoneauth1_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<=
wbr>keystoneauth1_2.18.0.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-keystoneauth1_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<=
wbr>keystoneauth1_2.18.0.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D &quot;<wbr>075a9ca7a8877c5885=
fa2487699015<wbr>e45260c4e6be119683effe0ad2ab<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt;<br>
&gt; -inherit distutils<br>
&gt; +inherit setuptools<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-lesscpy_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">python-=
<wbr>lesscpy_0.10.2.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a=
 href=3D"http://python-lesscpy_0.10.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python-<wbr>lesscpy_0.10.2.bb</a><br>
&gt; index 61ae935..71e0dc0 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-lesscpy_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>le=
sscpy_0.10.2.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-lesscpy_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>le=
sscpy_0.10.2.bb</a><br>
&gt; @@ -17,7 +17,7 @@ SRC_URI[sha256sum] =3D &quot;<wbr>ccad1ad2a89ced1875=
c5ca4e16e547<wbr>8b791d31fb187fe29f1541859318<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt;<br>
&gt; -inherit distutils<br>
&gt; +inherit setuptools<br>
&gt;<br>
&gt;=C2=A0 DISTUTILS_INSTALL_ARGS =3D &quot;--root=3D${D} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --prefix=3D${prefix} \<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-os-client-config_git.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-os-<wbr>client-config_git.bb</a> b/meta-openstack/recipes-<wbr>devtoo=
ls/python/<a href=3D"http://python-os-client-config_git.bb" rel=3D"noreferr=
er" target=3D"_blank">python-os-<wbr>client-config_git.bb</a><br>
&gt; index 7b55dbb..5393bb7 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-os-client-config_git.bb" rel=3D"noreferrer" target=3D"_blank">python-o=
s-<wbr>client-config_git.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-os-client-config_git.bb" rel=3D"noreferrer" target=3D"_blank">python-o=
s-<wbr>client-config_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/openstack/${SRCNAME}.git;branch=3Dstable/newton" rel=3D"noreferrer" target=
=3D"_blank">github.com/openstack/${<wbr>SRCNAME}.git;branch=3Dstable/<wbr>n=
ewton</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit distutils<br>
&gt; +inherit setuptools<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c05e3642ac7f70550e8214b--
