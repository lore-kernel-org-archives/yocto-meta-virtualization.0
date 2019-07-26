Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B46D0E00D94; Thu, 25 Jul 2019 19:31:14 -0700 (PDT)
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
	*      [209.85.221.68 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1193BE00D46
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:31:13 -0700 (PDT)
Received: by mail-wr1-f68.google.com with SMTP id 31so52757071wrm.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ag3Sei8daFilDYSRBZLRsgB3mbTrwD3Gfu7L9BI3X/A=;
	b=RsrBZopU/Hz3Y4bm8eX+bg15g261YgY2Qk8VsZMlvAVLljkT9nfZ/Av+PHbDf4abDi
	TUMRWNG5O5q2lXlCwx/Uvu0MF+oCrn7o3KswTpnnao+DTmzv3tspFrd8FGftbJzZlNWh
	Ec9ZD3yK5SxR1nca4VsSfTQxpcKtIDDJdkjOgZzysuIjD5pK2pk3AGm1PiUgxO/xa99G
	6Rdl3QHqLxqsQ/o0fTxQ2+O6Gs/JSHUCznDJc+VywuME5N2wpX5YEYsNONvJSEM5zq8K
	MZMzFC0D4fpO8wLEzM9sqBP+rVK3G9RD3S8khVbMtvuw5+Ukdcd61JpMr8Nz+fVqwsw1
	+Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ag3Sei8daFilDYSRBZLRsgB3mbTrwD3Gfu7L9BI3X/A=;
	b=K7DmtjL+3r2qSixQMk4Lj8gEl5FI/3fKH3Klfl7TbnI3qqJ0N9Lok1JNw4hVBq6OBv
	HnAK9pDUyyVavEJQZdg593RaTHBrHPe/hiJCTVfziGjEL5FIAZA2H04r4qA3kSBL5W1a
	cs/16FHndv7JznfwRnc5I3fuDDSrWvLh96tWKConIVpl/4SCbht+8IJZZCaUxpS1NAO7
	SH06wsQRrBm22jpGdxNbn1JfEjK2EHMQmnGqRox5ioRq3oA0C/WRX40ZO2YrXlVsPjx6
	mriUIail76f21blBynJsDKvutKPyko2ogubyJ1Z1feE98I1/bYJt9LoCZqFtbCfan1qm
	qz9A==
X-Gm-Message-State: APjAAAVT0pXB5VR/ifLVqCChSXl5+FEjMcY6ZOOqaocPnvJqNKs0f/gE
	Tqw8JQ+OySdp1d/dV8KfAztQaj4sHbk6gRZYglk7jiXv
X-Google-Smtp-Source: APXvYqxoCUj9AihFWl3cnG4iuXlqd4X0F1+4Zy5Nc+Ze4yNfnwgdWV4YanngGPiZL9i55DeH/b7pN/AH8+GkQFNydRY=
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr84813029wrm.55.1564108272856; 
	Thu, 25 Jul 2019 19:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NTnUsV_MzAgCT-tdZ4ikr_dYcg29oDquDrUkqRfiDZ=Q@mail.gmail.com>
	<5D3A5EBF.9080200@windriver.com>
In-Reply-To: <5D3A5EBF.9080200@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:31:01 -0400
Message-ID: <CADkTA4POZkdoq1OHts8a+f6Srtv2qGRZkLPHV7KNqVFJ3z0UNw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] meta-virtualization: add layer depends on selinux
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
X-List-Received-Date: Fri, 26 Jul 2019 02:31:14 -0000
Content-Type: multipart/alternative; boundary="000000000000fe76f8058e8c55fa"

--000000000000fe76f8058e8c55fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 9:57 PM Yu, Mingli <mingli.yu@windriver.com> wrote:

>
>
> On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 02:28, Bruce Ashfield wrote:
> > On Wed, Jul 24, 2019 at 11:43 PM <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <Mingli.Yu@windriver.com>
> >>
> >> Since cri-o of meta-virtualization depends on
> >> libselinux which comes from selinux, add missing
> >> layer depends back.
> >
> > This is already covered in the README. Since cri-o is optional, I
> > didn't want it to be a hard depends.
>
> Not matter cri-o is optional or not, but first the cri-o recipe indeed
> exists in meta-virtualization layer until now as
> ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb and second
> there is below logic in
>

considering that I wrote the recipe .. I know this.



> ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb and clearly
> it depends on libselinux.
> DEPENDS =3D " \
>      glib-2.0 \
>      btrfs-tools \
>      gpgme \
>      ostree \
>      libdevmapper \
>      libseccomp \
>      libselinux \
>      "
>
> So we should add the layer depends selinux(libselinux in selinux layer)
> for meta-virtualization layer, otherwise there comes below error when do
> yocto compliance check:
> ERROR: Nothing PROVIDES 'libselinux' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb
> DEPENDS on or otherwise requires it)
>
>
My point is that I disagree with that compliance check. Unless I'm building
the recipe, I don't have that dependency, I want a way to express that.

Bruce



> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'cri-o', 'libselinux'
> ]
>
> Thanks,
>
> >
> > Required for cri-o:
> > URI: git://github.com/advancedtelematic/meta-updater
> > URI: git://git.yoctoproject.org/meta-selinux
> > URI: git://git.yoctoproject.org/meta-security
> > branch: master
> > revision: HEAD
> > prio: default
> >
> >
> > I haven't seen a way to do a conditional depends .. has anyone else ?
> >
> > Bruce
> >
> >>
> >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> >> ---
> >>   conf/layer.conf | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/conf/layer.conf b/conf/layer.conf
> >> index be1f222..23efcb8 100644
> >> --- a/conf/layer.conf
> >> +++ b/conf/layer.conf
> >> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer =3D " \
> >>       networking-layer \
> >>       filesystems-layer \
> >>       meta-python \
> >> +    selinux \
> >>   "
> >>
> >>   # webserver: naigos requires apache2
> >> --
> >> 2.7.4
> >>
> >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000fe76f8058e8c55fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 25, 2019 at 9:57 PM Yu, Mingli &lt;<a h=
ref=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 02:28, Bruce Ashfield wrote:<br>
&gt; On Wed, Jul 24, 2019 at 11:43 PM &lt;<a href=3D"mailto:mingli.yu@windr=
iver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" tar=
get=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Since cri-o of meta-virtualization depends on<br>
&gt;&gt; libselinux which comes from selinux, add missing<br>
&gt;&gt; layer depends back.<br>
&gt;<br>
&gt; This is already covered in the README. Since cri-o is optional, I<br>
&gt; didn&#39;t want it to be a hard depends.<br>
<br>
Not matter cri-o is optional or not, but first the cri-o recipe indeed <br>
exists in meta-virtualization layer until now as<br>
./meta-virtualization/recipes-containers/cri-o/<a href=3D"http://cri-o_git.=
bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> and second <br>
there is below logic in <br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">considering that I wrote the recip=
e .. I know this.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
./meta-virtualization/recipes-containers/cri-o/<a href=3D"http://cri-o_git.=
bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> and clearly <br>
it depends on libselinux.<br>
DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
=C2=A0 =C2=A0 =C2=A0btrfs-tools \<br>
=C2=A0 =C2=A0 =C2=A0gpgme \<br>
=C2=A0 =C2=A0 =C2=A0ostree \<br>
=C2=A0 =C2=A0 =C2=A0libdevmapper \<br>
=C2=A0 =C2=A0 =C2=A0libseccomp \<br>
=C2=A0 =C2=A0 =C2=A0libselinux \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
So we should add the layer depends selinux(libselinux in selinux layer) <br=
>
for meta-virtualization layer, otherwise there comes below error when do <b=
r>
yocto compliance check:<br>
ERROR: Nothing PROVIDES &#39;libselinux&#39; (but <br>
/buildarea/layers/meta-virtualization/recipes-containers/cri-o/<a href=3D"h=
ttp://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> <=
br>
DEPENDS on or otherwise requires it)<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">My point is that I disagree with that compliance check. Un=
less I&#39;m building the recipe, I don&#39;t have that dependency, I want =
a way to express that.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
<br>
providers.<br>
<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 <br>
&#39;cri-o&#39;, &#39;libselinux&#39;<br>
]<br>
<br>
Thanks,<br>
<br>
&gt;<br>
&gt; Required for cri-o:<br>
&gt; URI: git://<a href=3D"http://github.com/advancedtelematic/meta-updater=
" rel=3D"noreferrer" target=3D"_blank">github.com/advancedtelematic/meta-up=
dater</a><br>
&gt; URI: git://<a href=3D"http://git.yoctoproject.org/meta-selinux" rel=3D=
"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-selinux</a><br>
&gt; URI: git://<a href=3D"http://git.yoctoproject.org/meta-security" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-security</a><br=
>
&gt; branch: master<br>
&gt; revision: HEAD<br>
&gt; prio: default<br>
&gt;<br>
&gt;<br>
&gt; I haven&#39;t seen a way to do a conditional depends .. has anyone els=
e ?<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver=
.com" target=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0conf/layer.conf | 1 +<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/conf/layer.conf b/conf/layer.conf<br>
&gt;&gt; index be1f222..23efcb8 100644<br>
&gt;&gt; --- a/conf/layer.conf<br>
&gt;&gt; +++ b/conf/layer.conf<br>
&gt;&gt; @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer =3D &quot; \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0networking-layer \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0filesystems-layer \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta-python \<br>
&gt;&gt; +=C2=A0 =C2=A0 selinux \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# webserver: naigos requires apache2<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000fe76f8058e8c55fa--
