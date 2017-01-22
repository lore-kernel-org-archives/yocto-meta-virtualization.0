Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79502E00595; Sat, 21 Jan 2017 20:18:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.173 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D57EE0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 20:18:35 -0800 (PST)
Received: by mail-qt0-f173.google.com with SMTP id v23so78794284qtb.0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 20:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iVIz+q9Pxtmunj9bwvYeJHNQpSTqLGz5cDDErfq5plA=;
	b=mOPVAryYAr/KSjtwBNIqrhuKi9BMwS+ZV+MgA0etzHHjT9wggrXl4Qe/+Fqxj838mR
	H39rwTLpc+/TZn4N7Jx1gOqa0FZD/SUCAfJhFScGRauOHXKFOIjpiHCVmpyNqhBJgAC2
	of5dhGVVxwcGvSFUbCQds8nLFXt7z2e2yHbMQA9DPs0sRfD6m9S/cigydYiSD5NLttue
	zScN20Ary1xd0pFjJyKALHsw8lxTsRTjCeet5O8P2xf3NY52dup4IM2Gm4wjgCkXd0+V
	jGtB2/3WcSgujr4zjfpXnIlpSVTbt/rTtYb0jWgoOeLstoZUBZJDO8xqsEs5jYDzdTRa
	EcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iVIz+q9Pxtmunj9bwvYeJHNQpSTqLGz5cDDErfq5plA=;
	b=gFfV53bLL0lWzEXFcx0NRJDhkjK3tPq0VOrWWDG84GI693QBmOUGTUN9hP+0m9pxEa
	UMG9Ck5NezXAaxCkjAsiNtXUWcdxR4F0wQY7eywd29WL+qJLq1RcNBTfkMEYW6Et85Yx
	9PBUTZJn7yR+BDDVRBgBlYYtugrYDnBfCXGg6+HflqQBRaV2jNUfJekkDJzSx7U9WvOa
	xolSkJESMzoUOqcXdiE9T3I/AJqNsjHcKJP27Yz7NiftNPIeBgfGGx0Yi092sNtwa+5f
	o9dLxh/CEYc1tMYjZT09Av4gKWFMp/095ySwQ9bR7Of8K0ID6uPGz/FV4w+35hcSGBoa
	7C8A==
X-Gm-Message-State: AIkVDXKp6u5Cr4/eFIFJ5D3p5Qb9IcPgJNr63iubvx7y3f+oNbIeiNqj+TsguiuCnTCEyHfs9+1zsF7tqpWG9w==
X-Received: by 10.200.58.231 with SMTP id x94mr20018466qte.87.1485058714787;
	Sat, 21 Jan 2017 20:18:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Sat, 21 Jan 2017 20:18:34 -0800 (PST)
In-Reply-To: <CAPuovEKwbb78xLsmBu+iPh-CtQpkwCAjN=f_nfM02GUW9DM9KQ@mail.gmail.com>
References: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
	<CAPuovEKwbb78xLsmBu+iPh-CtQpkwCAjN=f_nfM02GUW9DM9KQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 21 Jan 2017 23:18:34 -0500
Message-ID: <CADkTA4Nkq5roU-2wuzqsm30L8FoWrAq=OkKYHJmBsdTW7mhZLA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 1/4] python-futurist: uprev to v0.21.0
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
X-List-Received-Date: Sun, 22 Jan 2017 04:18:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c1254c82a74c70546a72d18

--94eb2c1254c82a74c70546a72d18
Content-Type: text/plain; charset=UTF-8

nope. The email are fine this time. mutt sorts them quite nicely.

These are all now merged.

Bruce

On Sat, Jan 21, 2017 at 10:51 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Bruce, I know there are a bunch of commits now queued up. If you want
> me to put them in a repo so you can pull instead of merging from email
> let me know and I will set something up.
>
> Mark
>
> On Sat, Jan 21, 2017 at 10:48 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> > This version is required to support python-oslo.messaging. Other than
> > the typical version and checksum updates, minor updates to the runtime
> > dependencies were required.
> >
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> >  .../{python-futurist_0.8.0.bb => python-futurist_0.21.0.bb}   | 11
> ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >  rename meta-openstack/recipes-devtools/python/{python-futurist_0.8.0.bb
> => python-futurist_0.21.0.bb} (56%)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> futurist_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-
> futurist_0.21.0.bb
> > similarity index 56%
> > rename from meta-openstack/recipes-devtools/python/python-
> futurist_0.8.0.bb
> > rename to meta-openstack/recipes-devtools/python/python-
> futurist_0.21.0.bb
> > index 3ad3993..27f2860 100644
> > --- a/meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
> > @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 1dece7821bf3fd70fe1309eaa37d52a2"
> >
> >  SRCNAME = "futurist"
> >
> > -SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
> > +SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}
> -${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] = "ccef2f5a651fffcfe13c71d91262be4d"
> > -SRC_URI[sha256sum] = "36f48b56af54c44db848fe4a23c2cb
> 70bd334237e11212a16885a55aca881ddd"
> > +SRC_URI[md5sum] = "da7e87d273f1982c24e9fe8a24f81259"
> > +SRC_URI[sha256sum] = "086dd646c067d4ef6dc9c04000828a
> cfbdc00842bd37c64825b596a6976509b4"
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > @@ -17,10 +17,15 @@ inherit setuptools
> >
> >  DEPENDS += " \
> >          python-pip \
> > +        python-pbr-native \
> >          "
> >
> >  RDEPENDS_${PN} += " \
> > +        python-pbr \
> > +        python-six \
> > +        python-monotonic \
> >          python-futures \
> >          python-contextlib2 \
> > +        python-prettytable \
> >          "
> >
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

--94eb2c1254c82a74c70546a72d18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">nope. The email are fine this time. mutt sorts them quite =
nicely.<div><br></div><div>These are all now merged.</div><div><br></div><d=
iv>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Sat, Jan 21, 2017 at 10:51 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Bruce, I know there are a bunch of commits now queued up. If you want<br=
>
me to put them in a repo so you can pull instead of merging from email<br>
let me know and I will set something up.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Sat, Jan 21, 2017 at 10:48 PM, Mark Asselstine<br>
&lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windri=
ver.com</a><wbr>&gt; wrote:<br>
&gt; This version is required to support python-oslo.messaging. Other than<=
br>
&gt; the typical version and checksum updates, minor updates to the runtime=
<br>
&gt; dependencies were required.<br>
&gt;<br>
&gt; Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://python-futurist_0.8.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-futurist_0.8.0.bb</a> =3D&gt; <a href=3D"http:=
//python-futurist_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-fu=
turist_0.21.0.bb</a>}=C2=A0 =C2=A0| 11 ++++++++---<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"h=
ttp://python-futurist_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
-<wbr>futurist_0.8.0.bb</a> =3D&gt; <a href=3D"http://python-futurist_0.21.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python-futurist_0.21.0.bb</a>} (=
56%)<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-futurist_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-=
<wbr>futurist_0.8.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a=
 href=3D"http://python-futurist_0.21.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python-<wbr>futurist_0.21.0.bb</a><br>
&gt; similarity index 56%<br>
&gt; rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"htt=
p://python-futurist_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<=
wbr>futurist_0.8.0.bb</a><br>
&gt; rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http:=
//python-futurist_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<w=
br>futurist_0.21.0.bb</a><br>
&gt; index 3ad3993..27f2860 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-futurist_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>fu=
turist_0.8.0.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-futurist_0.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>f=
uturist_0.21.0.bb</a><br>
&gt; @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr=
>1dece7821bf3fd70fe1309eaa37d52<wbr>a2&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCNAME =3D &quot;futurist&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/=
f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://pypi.python.org/<wbr>packages/source/f/${SRCNAME}/$<wbr>{SRCNAME}-$=
{PV}.tar.gz</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://pypi.io/packages/source/f/${SRCN=
AME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://=
pypi.io/packages/<wbr>source/f/${SRCNAME}/${SRCNAME}<wbr>-${PV}.tar.gz</a>&=
quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>ccef2f5a651fffcfe13c71d91262be<wbr>4d&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>36f48b56af54c44db848fe4a23c2cb<wbr>=
70bd334237e11212a16885a55aca88<wbr>1ddd&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>da7e87d273f1982c24e9fe8a24f812<wbr>59&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>086dd646c067d4ef6dc9c04000828a<wbr>=
cfbdc00842bd37c64825b596a69765<wbr>09b4&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt;<br>
&gt; @@ -17,10 +17,15 @@ inherit setuptools<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pip \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr-native \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-six \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-monotonic \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-futures \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-contextlib2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-prettytable \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
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
</div>

--94eb2c1254c82a74c70546a72d18--
