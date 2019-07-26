Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70E80E00D30; Thu, 25 Jul 2019 19:38:46 -0700 (PDT)
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
	*      [209.85.128.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8022AE00C22
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:38:45 -0700 (PDT)
Received: by mail-wm1-f67.google.com with SMTP id x15so46618770wmj.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q6DK34uqISaSwCj1BZ7F/dHBbb4r+b/VuwmFH0d28bA=;
	b=ryLiLAvAWV7HOUxg1ueEJB9tfvfEkq1RH5z0Xc3HeMTFPd4iavD3wavAxvlCRuE4dZ
	LvsnvymPIJswG2AYbhJYYmRGGZg2j7STRh2t7pg9nhJCRbJILvrS+rjHjh507/8BA1Xu
	0BDQBXpZAfWLHZZCqRFBwyxO3fIE/KX/qwgzED6JLo1pGdCj52DNwzkVMcZttAC1BNOl
	/uELzJnuYWJrtChazRNtTWcrOImaL9p4nlNigoOLbidbO4k7fpyYr4nfL1nrRLgPpp4s
	t5BHcpZ8AQgvn5d+WAUTzzhvwnt5Ivf1LXbd9+WVFkkzzddDhUidmrv8TGefheStOITY
	vyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q6DK34uqISaSwCj1BZ7F/dHBbb4r+b/VuwmFH0d28bA=;
	b=Atxq+u32KnvF1SaOH3K+vjcrykf7IQbInMO+cqNtk/GdJPMXJMqQaxlzWsa704EgDJ
	jbPjlEn1seM8GTHeAqvTvl5keqqdH4uI5zMexOllyzMZvEiGdVZKMsl15sMNjonxJJwr
	uTSrE1QH5Pw8pQCQ16SsEFlSGtd5UZu9Baz0bs//eVx59FEQl92EDjglNqMEzS1MXhSE
	CJOgzd3BR43ehyyLAydprCA4YWmuveWWCuoEaXcznwy+YyGqBe26jj6wgT007qnMo4TZ
	mkvj3q5Yiy0ubQocLMAX1mxHeFd4QGoiCRJ2SHYugBfgOpOH+U2qfXlfd4X1aHv917I7
	mStg==
X-Gm-Message-State: APjAAAW8T7iHqt2ZEbOh6/FgvEqYWq7czKP5+8/oT1lsociQ+pgPBCgS
	2zfmPzgF41VDCxigFj485YHT2XNqXwm7iZGgUKwBwnNA
X-Google-Smtp-Source: APXvYqzuop7DJM1ikI0xjciSm+dEmiTw02nO6phSLZ5CvBANgnJfM8/CP/f1M3mUMdl8C2Y3mD2c/LIvd6bCNHgkblU=
X-Received: by 2002:a1c:b457:: with SMTP id d84mr86667667wmf.153.1564108724247;
	Thu, 25 Jul 2019 19:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NTnUsV_MzAgCT-tdZ4ikr_dYcg29oDquDrUkqRfiDZ=Q@mail.gmail.com>
	<5D3A5EBF.9080200@windriver.com>
	<CADkTA4POZkdoq1OHts8a+f6Srtv2qGRZkLPHV7KNqVFJ3z0UNw@mail.gmail.com>
In-Reply-To: <CADkTA4POZkdoq1OHts8a+f6Srtv2qGRZkLPHV7KNqVFJ3z0UNw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:38:33 -0400
Message-ID: <CADkTA4P7-_t63fJOzBS6odh07a3Kc+7d_hQ6grni+dEBKTULGA@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Jul 2019 02:38:46 -0000
Content-Type: multipart/alternative; boundary="000000000000e61ef5058e8c7005"

--000000000000e61ef5058e8c7005
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 10:31 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Thu, Jul 25, 2019 at 9:57 PM Yu, Mingli <mingli.yu@windriver.com>
> wrote:
>
>>
>>
>> On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 02:28, Bruce Ashfield wrote:
>> > On Wed, Jul 24, 2019 at 11:43 PM <mingli.yu@windriver.com> wrote:
>> >>
>> >> From: Mingli Yu <Mingli.Yu@windriver.com>
>> >>
>> >> Since cri-o of meta-virtualization depends on
>> >> libselinux which comes from selinux, add missing
>> >> layer depends back.
>> >
>> > This is already covered in the README. Since cri-o is optional, I
>> > didn't want it to be a hard depends.
>>
>> Not matter cri-o is optional or not, but first the cri-o recipe indeed
>> exists in meta-virtualization layer until now as
>> ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb and second
>> there is below logic in
>>
>
> considering that I wrote the recipe .. I know this.
>
>
>
>> ./meta-virtualization/recipes-containers/cri-o/cri-o_git.bb and clearly
>> it depends on libselinux.
>> DEPENDS =3D " \
>>      glib-2.0 \
>>      btrfs-tools \
>>      gpgme \
>>      ostree \
>>      libdevmapper \
>>      libseccomp \
>>      libselinux \
>>      "
>>
>> So we should add the layer depends selinux(libselinux in selinux layer)
>> for meta-virtualization layer, otherwise there comes below error when do
>> yocto compliance check:
>> ERROR: Nothing PROVIDES 'libselinux' (but
>> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
>> cri-o_git.bb
>> DEPENDS on or otherwise requires it)
>>
>>
> My point is that I disagree with that compliance check. Unless I'm
> building the recipe, I don't have that dependency, I want a way to expres=
s
> that.
>

That being said, I did merge the patch so the layer will be in compliance
while I look into options for not always requiring that dependency.

Bruce



>
> Bruce
>
>
>
>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>> providers.
>>
>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>> 'cri-o', 'libselinux'
>> ]
>>
>> Thanks,
>>
>> >
>> > Required for cri-o:
>> > URI: git://github.com/advancedtelematic/meta-updater
>> > URI: git://git.yoctoproject.org/meta-selinux
>> > URI: git://git.yoctoproject.org/meta-security
>> > branch: master
>> > revision: HEAD
>> > prio: default
>> >
>> >
>> > I haven't seen a way to do a conditional depends .. has anyone else ?
>> >
>> > Bruce
>> >
>> >>
>> >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> >> ---
>> >>   conf/layer.conf | 1 +
>> >>   1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/conf/layer.conf b/conf/layer.conf
>> >> index be1f222..23efcb8 100644
>> >> --- a/conf/layer.conf
>> >> +++ b/conf/layer.conf
>> >> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer =3D " \
>> >>       networking-layer \
>> >>       filesystems-layer \
>> >>       meta-python \
>> >> +    selinux \
>> >>   "
>> >>
>> >>   # webserver: naigos requires apache2
>> >> --
>> >> 2.7.4
>> >>
>> >
>> >
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e61ef5058e8c7005
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 25, 2019 at 10:31 PM Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Jul 25, 2019 at 9:57 PM Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windri=
ver.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
there is below logic in <br></blockquote><div><br></div><div><div style=3D"=
font-size:small">considering that I wrote the recipe .. I know this.</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
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
<br></blockquote><div><br></div><div><div style=3D"font-size:small">My poin=
t is that I disagree with that compliance check. Unless I&#39;m building th=
e recipe, I don&#39;t have that dependency, I want a way to express that.</=
div></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">That being said, I did merge the patch s=
o the layer will be in compliance while I look into options for not always =
requiring that dependency.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
 class=3D"gmail-m_5446795031555675934gmail_signature">- Thou shalt not foll=
ow the NULL pointer, for chaos and madness await thee at its end<br>- &quot=
;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000e61ef5058e8c7005--
