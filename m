Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E5A1E00D15; Mon, 25 Sep 2017 21:45:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 108C7E00D10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 21:45:14 -0700 (PDT)
Received: by mail-pf0-f171.google.com with SMTP id g65so4965198pfe.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 21:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UANi3NWJkC2NpwAUy/eT7Gn+WWWnf8GFYlKdu3ZQIQA=;
	b=uWTiQQo86u+QgZ2mwVHlX1D7mI94if5eD0TIvHhdCr+3g0TKTc7gW1UinFNA5kiFY9
	DpRZLjSdFN6Z2bGrVGGdiahHwUzKoQEt2lrBklSu4ir9b77Sko6bEb7AH4zXR+F/k55N
	MglCeklMCT6IdYdLNiGz4X6l0XVp31YPcqUjCjj2vCxOIt2cXB3DpHWG/M7mqB3/q6Pm
	1E3fsu6BPm1gghVAeetZjz/TuQuOSV97bmO4XgLaKVBuORX2KV7C5cR23/Wwr0ktVXun
	XHQuizleuyYer7bdHPLKDLT3Y5wL6KnJ9A1WHMULooOtoG+QyDXTIV/YEPG4HEZ7tk1v
	idrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UANi3NWJkC2NpwAUy/eT7Gn+WWWnf8GFYlKdu3ZQIQA=;
	b=g6efvVpZK8euIkdazeSnAa2yDIKyyAXKXua9ix7OBBiNFgGdTajiw5Jrm79KW3n67t
	VYOC/YgEev+1613bML9lirABsbejcX/FQJrcBToZ6A9UMbem9MwHZi+mNGgb283Fkg/W
	Ro64NPBJPca94I9tSDfBuQUvVG+aPsRtn1qg5D/laCpqDGFyeMFFwodOM0q28MBYHm/k
	aketSxKyLKRdN86Z3xj7rkDrsZx4zsiBuAcecoexU9jNTPU5hvTKT7MWP+Qhyc1fVkzk
	j0o0kskFQkWQbljwWoXza/Jid/QVmUDxt0zU9SPvPYqBhTypyurta1D96qYLEo96S506
	/x1Q==
X-Gm-Message-State: AHPjjUhceCJ7EQF2wVFs8PzLWOnRylrda33EViBMhAk/2xJe7bkcA+so
	BAhoRPMgyCf3FJ7cCpCWmc3o9ulHIJ/aa10mTTs=
X-Google-Smtp-Source: AOwi7QDvedj704JIEAU8Nk4GvTqlC+JB5Ywdket2gH8UMLcVuapTw1NwVIacPP/7nAQdAtifH49UULS1td8fK3A0qNE=
X-Received: by 10.98.211.193 with SMTP id z62mr9820918pfk.118.1506401113638;
	Mon, 25 Sep 2017 21:45:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.151 with HTTP; Mon, 25 Sep 2017 21:45:13 -0700 (PDT)
In-Reply-To: <CADkTA4OBuR=WWsiHW1r07nboKUtPuZNQBR9dN_uPPfv5zfvBzA@mail.gmail.com>
References: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
	<CADkTA4PtpJV3uBra68_7A3KZY_CzmzP=DXUn8-8d3vE1SvROhw@mail.gmail.com>
	<CADkTA4OzLagWJdr1Dwqs8Yx9eCFF=qva7z-O+izZ76cYXvz3RA@mail.gmail.com>
	<CACrgodcPs1JqxAvOueJAUPEyRcmW_et-onGS22-SGcQ+7O9PCQ@mail.gmail.com>
	<CADkTA4MLfyXNEZg5ifOeK5TEep0hBDMd79iFa0k=N1WKP-Txiw@mail.gmail.com>
	<CACrgodeqimG6u8tg0iTMyBUu2zU-Ua615fh5y+e1iBap5qg_fw@mail.gmail.com>
	<CADkTA4OBuR=WWsiHW1r07nboKUtPuZNQBR9dN_uPPfv5zfvBzA@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Tue, 26 Sep 2017 12:45:13 +0800
Message-ID: <CACrgodfeQFn5abG+ThP+gB2tZ0sM81x-CWwVd8C8d+pHCk0rYg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Tue, 26 Sep 2017 04:45:16 -0000
Content-Type: multipart/alternative; boundary="f403045cc4b2448d35055a1057b1"

--f403045cc4b2448d35055a1057b1
Content-Type: text/plain; charset="UTF-8"

under the openembedded-core folder
only meta , meta-selftest , meta-skeleton 3 sub-folder found
no openembedded-core/meta-oe
                                        meta-networking
                                        meta-ruby
                                        meta-python...

2017-09-26 8:47 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

> On Mon, Sep 25, 2017 at 8:16 PM, Lai Eddy <eddy.lai.tw@gmail.com> wrote:
> >
> > Thanks Bruce,
> >
> > but I still don't understand,now I have following in my bblayrs.conf
> >
> > BBLAYERS ?= " \
> >   /home/user/poky/meta \
> >   /home/user/poky/meta-poky \
> >   /home/user/poky/meta-yocto-bsp \
> >   /home/user/poky/openembedded-core/meta \
> >   /home/user/poky/meta-cloud-services \
> >   /home/user/poky/meta-cloud-services/meta-openstack \
> >   /home/user/poky/meta-intel \
> > "
> > anything else I should add?
>
>
> You do need more. The meta-openstack README states:
>
> layers: meta-oe
> meta-networking
>         meta-ruby
>         meta-filesystems
>         meta-webserver
>         meta-python
>
>
> Which means:
>
> meta-openembedded/meta-oe
> meta-openembedded/meta-networking
>
> ... etc
>
> And as Paul just pointed out, you don't repeat poky/meta and
> poky/open-embedded-core/meta,
> since poky/meta is a combination of openembedded-core/meta and some
> other layers
>
> Cheers,
>
> Bruce
>
>
> >
> > 2017-09-26 8:07 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
> >>
> >>
> >>
> >> On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy <eddy.lai.tw@gmail.com>
> wrote:
> >>>
> >>> after clone the oe-core: git://git.openembedded.org/openembedded-core
> >>> there are only 3 folder inside (meta, meta-selftest meta-skeleton)
> >>> seems meta-cloud-services need things like meta-networking and
> meta-python
> >>> where can I found them?
> >>>
> >>> (that's why I think the needed dependency is  git://
> github.com/openembedded/meta-openembedded.git )
> >>
> >>
> >> They are sublayers of that repo, the single clone gets you all the
> layers you need, but
> >> you do need to add them to your bblayers.conf file as they sit in the
> clone.
> >>
> >> Bruce
> >>
> >>>
> >>>
> >>> 2017-09-20 10:28 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
> >>>>
> >>>>
> >>>>
> >>>> On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >>>>>
> >>>>> Clearly the README is out of date (and wrong).
> >>>>>
> >>>>> That should be oe-core: git://git.openembedded.org/openembedded-core
> >>>>>
> >>>>> Plus that isn't nearly the only layer dependency
> >>>>>
> >>>>> I'll have a look at what has gone wrong and update the README.
> >>>>
> >>>>
> >>>> I pushed a fix for the meta-cloud-services/README, which is mostly
> empty since the
> >>>> majority of the packages are actually in the meta-openstack
> sublayer.  That layer had
> >>>> the same issue with the layer references, so I fixed it as well.
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Bruce
> >>>>
> >>>>>
> >>>>>
> >>>>> Bruce
> >>>>>
> >>>>> On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy <eddy.lai.tw@gmail.com>
> wrote:
> >>>>>>
> >>>>>> according to layer README
> >>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-
> services/about/
> >>>>>> it said
> >>>>>>
> >>>>>> This layer depends on:
> >>>>>>
> >>>>>> URI: git://github.com/openembedded/oe-core.git
> >>>>>>
> >>>>>> but seems failed to clone from that URL
> >>>>>> should that be
> >>>>>> git://github.com/openembedded/meta-openembedded.git
> >>>>>> or other repo available?
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> meta-virtualization mailing list
> >>>>>> meta-virtualization@yoctoproject.org
> >>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> --
> >>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> >>>
> >>>
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--f403045cc4b2448d35055a1057b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">under the openembedded-core folder<div>only meta , meta-se=
lftest , meta-skeleton 3 sub-folder found</div><div>no openembedded-core/me=
ta-oe</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 meta-networking</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 meta-ruby</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-python...<br><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">2017-09-26 8:47 GMT+08:00 Bruce Ash=
field <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span>:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On Mon, Sep 25, 20=
17 at 8:16 PM, Lai Eddy &lt;<a href=3D"mailto:eddy.lai.tw@gmail.com">eddy.l=
ai.tw@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks Bruce,<br>
&gt;<br>
&gt; but I still don&#39;t understand,now I have following in my bblayrs.co=
nf<br>
&gt;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-poky \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-yocto-bsp \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/openembedded-<wbr>core/meta \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-cloud-<wbr>services \<br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-cloud-<wbr>services/meta-openstack \<=
br>
&gt;=C2=A0 =C2=A0/home/user/poky/meta-intel \<br>
&gt; &quot;<br>
&gt; anything else I should add?<br>
<br>
<br>
</span>You do need more. The meta-openstack README states:<br>
<br>
layers: meta-oe<br>
meta-networking<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-ruby<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-filesystems<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-webserver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-python<br>
<br>
<br>
Which means:<br>
<br>
meta-openembedded/meta-oe<br>
meta-openembedded/meta-<wbr>networking<br>
<br>
... etc<br>
<br>
And as Paul just pointed out, you don&#39;t repeat poky/meta and<br>
poky/open-embedded-core/meta,<br>
since poky/meta is a combination of openembedded-core/meta and some<br>
other layers<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
&gt;<br>
&gt; 2017-09-26 8:07 GMT+08:00 Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 25, 2017 at 5:26 PM, Lai Eddy &lt;<a href=3D"mailto:ed=
dy.lai.tw@gmail.com">eddy.lai.tw@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; after clone the oe-core: git://<a href=3D"http://git.openembed=
ded.org/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.openemb=
edded.org/<wbr>openembedded-core</a><br>
&gt;&gt;&gt; there are only 3 folder inside (meta, meta-selftest meta-skele=
ton)<br>
&gt;&gt;&gt; seems meta-cloud-services need things like meta-networking and=
 meta-python<br>
&gt;&gt;&gt; where can I found them?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; (that&#39;s why I think the needed dependency is=C2=A0 git://<=
a href=3D"http://github.com/openembedded/meta-openembedded.git" rel=3D"nore=
ferrer" target=3D"_blank">github.com/openembedded/<wbr>meta-openembedded.gi=
t</a> )<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; They are sublayers of that repo, the single clone gets you all the=
 layers you need, but<br>
&gt;&gt; you do need to add them to your bblayers.conf file as they sit in =
the clone.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2017-09-20 10:28 GMT+08:00 Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Sep 19, 2017 at 10:15 PM, Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Clearly the README is out of date (and wrong).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; That should be oe-core: git://<a href=3D"http://git.op=
enembedded.org/openembedded-core" rel=3D"noreferrer" target=3D"_blank">git.=
openembedded.org/<wbr>openembedded-core</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Plus that isn&#39;t nearly the only layer dependency<b=
r>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I&#39;ll have a look at what has gone wrong and update=
 the README.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I pushed a fix for the meta-cloud-services/README, which i=
s mostly empty since the<br>
&gt;&gt;&gt;&gt; majority of the packages are actually in the meta-openstac=
k sublayer.=C2=A0 That layer had<br>
&gt;&gt;&gt;&gt; the same issue with the layer references, so I fixed it as=
 well.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Bruce<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Bruce<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Tue, Sep 19, 2017 at 8:23 PM, Lai Eddy &lt;<a href=
=3D"mailto:eddy.lai.tw@gmail.com">eddy.lai.tw@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; according to layer README<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.c=
gi/meta-cloud-services/about/" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/<wbr>cgit/cgit.cgi/meta-cloud-<wbr>services/about/</a>=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; it said<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; This layer depends on:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; URI: git://<a href=3D"http://github.com/openembedd=
ed/oe-core.git" rel=3D"noreferrer" target=3D"_blank">github.com/openembedde=
d/<wbr>oe-core.git</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; but seems failed to clone from that URL<br>
&gt;&gt;&gt;&gt;&gt;&gt; should that be<br>
&gt;&gt;&gt;&gt;&gt;&gt; git://<a href=3D"http://github.com/openembedded/me=
ta-openembedded.git" rel=3D"noreferrer" target=3D"_blank">github.com/openem=
bedded/<wbr>meta-openembedded.git</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; or other repo available?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt; ______________________________<wbr>_______________=
__<br>
&gt;&gt;&gt;&gt;&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject=
.org">meta-virtualization@<wbr>yoctoproject.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo=
/meta-virtualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos an=
d madness await thee at its end&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div></div></div>

--f403045cc4b2448d35055a1057b1--
