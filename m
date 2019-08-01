Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0820DE00D90; Wed, 31 Jul 2019 18:49:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DFC1E00D75
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 18:49:54 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id r9so67642397ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Jul 2019 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mKBgfUkvIP2fvPKiVOMPruZqyPeDmTjndGEK4jixQfo=;
	b=V5jXF8LQ/ouR41vPsGUA1e8JJ92LEzrfSGLtOMuLJB6aTIe/BgYiuyLXzZFluik3Kd
	xIbMB7W8y8A7aiI9afYVQWYnclVcEQNboVFwbz6iS/V51XKufKp6MdonJq4T5h40ewOL
	94m6j6i17en2bzsz47poxpqlxF+wzpgu3l1xadqStmXAlP7cKX9Xjz42SF3ieTPxPtBT
	7YHxVsQT539CczPgfhrVCDWT1Kv7fhYFpOKZ5W8oe0+2cF1qRwaZGkO5/vo8QdMArc1y
	W9KOlKe2vjtb+10ejMR8LzNQ7ZGbSNn6rqi2Gk+u0SCZOKP3izvXebWd9z03vuY8YOgp
	mE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mKBgfUkvIP2fvPKiVOMPruZqyPeDmTjndGEK4jixQfo=;
	b=roVyJMR4WySOyksDGOk5CdiDM7FxctSYClGE0OG4BA8r+Twp7n1BjxuiZpSad2c8yW
	0kT4C8Q7r1FcktRV12S6eRo/3XSvmZJdgh1ZaU6dCOJJHxR0uAwQAYGHY3UIwr87yQRl
	3lQBZ6QZ5x9yWGfjUkeJRPAcogxQwC/BG/ceEo/naAR2wSXrPKAYRDeShsL8CinKpKjX
	Um7DachJrsQKyyKadUkZUzDCLY21mJfRlK3b7R5ucLzfCbFmBRlXP3ebnOMvT2Z+ew69
	2Vo5nereiy0NZiKae3ds+HjP2fG6N7LZJ/IIjxb/mOktXtHsRv2vSBk56ysQrFG9zYZz
	ls4g==
X-Gm-Message-State: APjAAAWA4Lv6UtX3wv1kgZ1PyiIxLuKZCwGhq7DEiHGKlVgRzE8TNBTx
	KqzVMVvnVPVTAEGhTuE4NLFSTrlTYk6v/V+AmAcO/w==
X-Google-Smtp-Source: APXvYqzqm4hbEVNHBirXTKEQzr+ZqXGjnW7VsvqmMA25bTaV/D/PA65YZ182hsXZAZWM6uVj6/KrMOrFQDaMaLRLFJE=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr65579915ljj.78.1564624193106; 
	Wed, 31 Jul 2019 18:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <5D3AC37B.2090709@windriver.com>
	<1564132251-408200-1-git-send-email-mingli.yu@windriver.com>
	<5D414290.4020606@windriver.com>
In-Reply-To: <5D414290.4020606@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Jul 2019 21:49:44 -0400
Message-ID: <CADkTA4NffWe=7vKh7pTnkRYAcoga=Yb67ZUtrnFicj4eEYb77A@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] cri-o: skip it when depends not found
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
X-List-Received-Date: Thu, 01 Aug 2019 01:49:58 -0000
Content-Type: multipart/alternative; boundary="0000000000003cb782058f04750f"

--0000000000003cb782058f04750f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 3:23 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> Ping.
>
>

I'm currently out of the office and won't be back until Aug 7th, so I'm not
getting to any reviews/merges as fast as I normally do.

The approach that this takes is interesting. I personally don't have a
problem with it, but I suppose things don't scale as well if everyone did
depends like this on a per-recipe basis.

I'm going to stage the patch and test it locally, while I wait to see if
anyone else has any objections to the approach

Bruce

> Thanks,
>
> On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 17:10, mingli.yu@windriver.com wro=
te:
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > cri-o depends on ostree, libselinux and libseccomp
> > and we should check if the layer which provides these
> > recipes exist or not before go on.
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > ---
> >   recipes-containers/cri-o/cri-o_git.bb | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/recipes-containers/cri-o/cri-o_git.bb
> b/recipes-containers/cri-o/cri-o_git.bb
> > index c27aef7..b0c0ce4 100644
> > --- a/recipes-containers/cri-o/cri-o_git.bb
> > +++ b/recipes-containers/cri-o/cri-o_git.bb
> > @@ -42,6 +42,28 @@ RDEPENDS_${PN} =3D " \
> >       cni \
> >       "
> >
> > +python __anonymous() {
> > +    msg =3D ""
> > +    # ERROR: Nothing PROVIDES 'libseccomp' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb DEPENDS on or otherwise requires it).
> > +    # ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> > +    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'cri-o', 'libseccomp']
> > +    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> > +        msg +=3D "Make sure meta-security should be present as it
> provides 'libseccomp'"
> > +        raise bb.parse.SkipRecipe(msg)
> > +    # ERROR: Nothing PROVIDES 'ostree' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb DEPENDS on or otherwise requires it).
> > +    # ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> > +    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'cri-o', 'ostree']
> > +    elif 'cube' not in d.getVar('BBFILE_COLLECTIONS').split():
> > +        msg +=3D "Make sure meta-cube should be present as it provides
> 'ostree'"
> > +        raise bb.parse.SkipRecipe(msg)
> > +    # ERROR: Nothing PROVIDES 'libselinux' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb DEPENDS on or otherwise requires it).
> > +    # ERROR: Required build target 'meta-world-pkgdata' has no
> buildable providers.
> > +    # Missing or unbuildable dependency chain was:
> ['meta-world-pkgdata', 'cri-o', 'libselinux']
> > +    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
> > +        msg +=3D "Make sure meta-selinux should be present as it provi=
des
> 'libselinux'"
> > +        raise bb.parse.SkipRecipe(msg)
> > +}
> > +
> >   PACKAGES =3D+ "${PN}-config"
> >
> >   RDEPENDS_${PN} +=3D " virtual/containerd virtual/runc"
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003cb782058f04750f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 31, 2019 at 3:23 AM Yu, Mingli &lt;<a h=
ref=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ping.<br>
<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">I&#39;m currently out of the office and won&#39;=
t be back until Aug 7th, so I&#39;m not getting to any reviews/merges as fa=
st as I normally do.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">The =
approach that this takes is interesting. I personally don&#39;t have a prob=
lem with it, but I suppose things don&#39;t scale as well if everyone did d=
epends like this on a per-recipe basis.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">I&#39;m going to stage the patch and test it locally, while =
I wait to see if anyone else has any objections to the approach</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Thanks,<br>
<br>
On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 17:10, <a href=3D"mailto:mingli.yu@w=
indriver.com" target=3D"_blank">mingli.yu@windriver.com</a> wrote:<br>
&gt; From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" target=
=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt;<br>
&gt; cri-o depends on ostree, libselinux and libseccomp<br>
&gt; and we should check if the layer which provides these<br>
&gt; recipes exist or not before go on.<br>
&gt;<br>
&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com=
" target=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" r=
el=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> | 22 +++++++++++++++++=
+++++<br>
&gt;=C2=A0 =C2=A01 file changed, 22 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" =
rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> b/recipes-containers/=
cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">=
cri-o_git.bb</a><br>
&gt; index c27aef7..b0c0ce4 100644<br>
&gt; --- a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"=
noreferrer" target=3D"_blank">cri-o_git.bb</a><br>
&gt; +++ b/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"=
noreferrer" target=3D"_blank">cri-o_git.bb</a><br>
&gt; @@ -42,6 +42,28 @@ RDEPENDS_${PN} =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cni \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; +python __anonymous() {<br>
&gt; +=C2=A0 =C2=A0 msg =3D &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but /bu=
ildarea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"http=
://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> DEPE=
NDS on or otherwise requires it).<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Required build target &#39;meta-world-pkgdata&=
#39; has no buildable providers.<br>
&gt; +=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;cri-o&#39;, &#39;libseccomp&#39;]<br>
&gt; +=C2=A0 =C2=A0 if &#39;security&#39; not in d.getVar(&#39;BBFILE_COLLE=
CTIONS&#39;).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg +=3D &quot;Make sure meta-security sh=
ould be present as it provides &#39;libseccomp&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(msg)<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;ostree&#39; (but /builda=
rea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"http://c=
ri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> DEPENDS =
on or otherwise requires it).<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Required build target &#39;meta-world-pkgdata&=
#39; has no buildable providers.<br>
&gt; +=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;cri-o&#39;, &#39;ostree&#39;]<br>
&gt; +=C2=A0 =C2=A0 elif &#39;cube&#39; not in d.getVar(&#39;BBFILE_COLLECT=
IONS&#39;).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg +=3D &quot;Make sure meta-cube should=
 be present as it provides &#39;ostree&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(msg)<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Nothing PROVIDES &#39;libselinux&#39; (but /bu=
ildarea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"http=
://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> DEPE=
NDS on or otherwise requires it).<br>
&gt; +=C2=A0 =C2=A0 # ERROR: Required build target &#39;meta-world-pkgdata&=
#39; has no buildable providers.<br>
&gt; +=C2=A0 =C2=A0 # Missing or unbuildable dependency chain was: [&#39;me=
ta-world-pkgdata&#39;, &#39;cri-o&#39;, &#39;libselinux&#39;]<br>
&gt; +=C2=A0 =C2=A0 elif &#39;selinux&#39; not in d.getVar(&#39;BBFILE_COLL=
ECTIONS&#39;).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg +=3D &quot;Make sure meta-selinux sho=
uld be present as it provides &#39;libselinux&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(msg)<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0PACKAGES =3D+ &quot;${PN}-config&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0RDEPENDS_${PN} +=3D &quot; virtual/containerd virtual/runc=
&quot;<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000003cb782058f04750f--
