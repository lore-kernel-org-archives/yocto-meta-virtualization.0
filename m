Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF639E00C61; Tue, 29 May 2018 07:32:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45DC0E009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:32:52 -0700 (PDT)
Received: by mail-wr0-f195.google.com with SMTP id f16-v6so10581646wrm.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ISAF/PfXjlEr2LcZI/c4QhChglx+la5XUrWFTVOaOMg=;
	b=DHhLhryfFi0ftbegLDrneYsNcWSH7FlHuqbCt/EdM4QUWq+tmQAboirrKOe4K58v7T
	urQMnFzHe1KZpeutt+DeAIbtTFKQuLL16utzJshzRL/Qiw1LNlkeaO+A1yTLmnAwj+J2
	0Z2j8RIaU9rvmI8Y/aXrhrM3UndyhPz/+LiNn/vknOyW4ekCSYWAM/9P2IzIM57SKc9K
	SzREoSyaoGpbmtUQPonp/5hekHJTV0FSNbmCW4X9XcF7V1aIvJo1M7gEh5ucMPm5iE7W
	nvpLd0lISt8Pdsh6QmmBrIFOdKlgMHLIYVWwEx1YlcYySxtZvaWP5UyQGrhtjoCBxoZd
	ZLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ISAF/PfXjlEr2LcZI/c4QhChglx+la5XUrWFTVOaOMg=;
	b=coGRoNVKF7a38ZSBUO2UAWHVEQilqSO4yG8JooowWCHCdKmtk/j5Ap8zKjAJUet6xX
	tjEM35qwYNopuGQWEgHse1M90ENuQHL4H3BTrkcVdyH23QFlBsMx0YTfu0vQFnDnOydn
	VeeQBJoadfzaDQxBitjTiPPVQ7AuS29Umz8LrVQzBRtgjjBxQ32ttOlC1pBXSNRHIsAm
	SlLB3qXGDL3zOJ25D6H2/LajnkkAmAHStYAxzIk3cRQ57QyBKw6f/iwyExl7LblvMyQI
	v5ydl7yY/Vi1CJ2qh7/SYhPjxRo1sdBncFESTD40jmckoVxFnyTwRLta/fNyAGxTPME/
	CFQg==
X-Gm-Message-State: ALKqPweY2Rw4caE5JiVwPemnVRa995czRfitCJE+Hkfx27RkIsgFzYzj
	PimEtAhCPbl/D5/itnoEB4aWuAYIh7KPgYKrfS/KYg==
X-Google-Smtp-Source: ADUXVKLnF0PvEL1QcuEo8JmwId7hpdpzxT4ZuIHTOfyupGDt3VYOo9cXAYpr9knEull+OBKOGCIN4iyMv4VJQd5jNwA=
X-Received: by 2002:a19:54da:: with SMTP id b87-v6mr9191953lfl.3.1527604372039;
	Tue, 29 May 2018 07:32:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:32:51
	-0700 (PDT)
In-Reply-To: <CAPuovE+sxDa6oHLx-YQyWdxDPK7jU4giLhXf9WYb5aNWKts-tw@mail.gmail.com>
References: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
	<CAPuovE+sxDa6oHLx-YQyWdxDPK7jU4giLhXf9WYb5aNWKts-tw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:32:51 -0400
Message-ID: <CADkTA4M4SQo0ZtVGdZyfc+iX558yn55L1pEQow=jBi4w-k+VvQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][PATCH] python-glanceclient: 2.8.0 -> 2.11.0
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
X-List-Received-Date: Tue, 29 May 2018 14:32:54 -0000
Content-Type: multipart/alternative; boundary="000000000000f3efc0056d591b4f"

--000000000000f3efc0056d591b4f
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 9:10 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Tue, May 29, 2018 at 7:00 AM, Hong Liu <hongl.fnst@cn.fujitsu.com>
> wrote:
> > Upgrade python-glanceclient from 2.8.0 to 2.11.0.
> >
> > Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> > ---
> >  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 6
> +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-
> glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> glanceclient_git.bb
> > index 00ea2ab..07cf42d 100644
> > --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > @@ -9,11 +9,11 @@ DEPENDS += " \
> >          python-pbr \
> >          "
> >
> > -SRCREV = "13b25ff1fed908cfe7b4e719a97efd7121e3be96"
> > -PV = "2.8.0+git${SRCPV}"
> > +SRCREV = "314a29f6a6e64f69fd07fd5a0fdcf7aeb5574c1b"
> > +PV = "2.11.0+git${SRCPV}"
> >
> >  SRC_URI = "\
> > -       git://github.com/openstack/${BPN}.git;branch=stable/pike \
> > +       git://github.com/openstack/${BPN}.git;branch=master \
>
> We can't be moving these off of the stable/pike branch without a plan.
> You need to work with Bruce to figure something out. As is these are
> not acceptable in my view. What is the motivation for the uprevs? That
> might help with the assessment of these.
>

Indeed.

If we want to track master, along with the latest stable release, we can
always do a branching strategy like I used to have:

  <oe/yocto release>-<openstack release>

It is a bit more work, but doable.

I'd just like to see the motivations and how the different branches are
being used, so we can be sure the extra effort is worth it.

Cheers,

Bruce


> Mark
>
>
> >         file://glance-api-check.sh \
> >         "
> >
> > --
> > 2.7.4
> >
> >
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

--000000000000f3efc0056d591b4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 29, 2018 at 9:10 AM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Tue, May 29, 2018 at 7:00 AM, Hong Liu &lt;<a href=
=3D"mailto:hongl.fnst@cn.fujitsu.com">hongl.fnst@cn.fujitsu.com</a>&gt; wro=
te:<br>
&gt; Upgrade python-glanceclient from 2.8.0 to 2.11.0.<br>
&gt;<br>
&gt; Signed-off-by: Hong Liu &lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.co=
m">hongl.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-glanceclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
glanceclient_git.bb</a> | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"ht=
tp://python-glanceclient_git.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-<wbr>glanceclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/pytho=
n/<a href=3D"http://python-glanceclient_git.bb" rel=3D"noreferrer" target=
=3D"_blank">python-<wbr>glanceclient_git.bb</a><br>
&gt; index 00ea2ab..07cf42d 100644<br>
&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-glanceclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
glanceclient_git.bb</a><br>
&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://py=
thon-glanceclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
glanceclient_git.bb</a><br>
&gt; @@ -9,11 +9,11 @@ DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pbr \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;<wbr>13b25ff1fed908cfe7b4e719a97efd<wbr>7121e3be96&q=
uot;<br>
&gt; -PV =3D &quot;2.8.0+git${SRCPV}&quot;<br>
&gt; +SRCREV =3D &quot;<wbr>314a29f6a6e64f69fd07fd5a0fdcf7<wbr>aeb5574c1b&q=
uot;<br>
&gt; +PV =3D &quot;2.11.0+git${SRCPV}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/opensta=
ck/${BPN}.git;branch=3Dstable/pike" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/openstack/${<wbr>BPN}.git;branch=3Dstable/pike</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/opensta=
ck/${BPN}.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.=
com/openstack/${<wbr>BPN}.git;branch=3Dmaster</a> \<br>
<br>
</span>We can&#39;t be moving these off of the stable/pike branch without a=
 plan.<br>
You need to work with Bruce to figure something out. As is these are<br>
not acceptable in my view. What is the motivation for the uprevs? That<br>
might help with the assessment of these.<br></blockquote><div><br></div><di=
v>Indeed.</div><div><br></div><div>If we want to track master, along with t=
he latest stable release, we can always do a branching strategy like I used=
 to have:</div><div><br></div><div>=C2=A0 &lt;oe/yocto release&gt;-&lt;open=
stack release&gt;</div><div>=C2=A0</div><div>It is a bit more work, but doa=
ble.</div><div><br></div><div>I&#39;d just like to see the motivations and =
how the different branches are being used, so we can be sure the extra effo=
rt is worth it.</div><div><br></div><div>Cheers,</div><div><br></div><div>B=
ruce</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glance-api-check.sh \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
-- <br>
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

--000000000000f3efc0056d591b4f--
