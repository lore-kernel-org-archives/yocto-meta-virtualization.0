Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32EA1E00C89; Mon, 25 Sep 2017 07:02:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E76FFE009F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 07:02:37 -0700 (PDT)
Received: by mail-qk0-f175.google.com with SMTP id b23so6740074qkg.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V451xTpUEA6YVe4qhHpAcOooR1cFvBt+BP0FiD6DrWo=;
	b=pn0TN3P8RhwNstafdNpreCAxjBfXL6XyelxcGFv8Jhi3B8itBM4yXPRP+YChuEfnTz
	aQVyZuRNfti8cz5MWLZJLtfDyYqwMRwen8AoMg4hvAJlKzPq8kgzaOMoN27CbbHMcM13
	OIYpaNZI4+Mlh0XL9nJl8tAq63G0T0HQSRnvZDzoA5Al2c8Q1mPWV872UuFM0hiqJMFU
	HtYVVsNjuIXZPhl8Rs1so9quVEA0s6q87W2jhNDUdcbiya+uNWD8VDFkV+IxGkz438Ur
	Ljn4z9VjWwOv8+bw88j68bhTvYGhBuIiMHystieYgR5erSs099VZ5HvnDq9fAoHw/nYH
	+v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V451xTpUEA6YVe4qhHpAcOooR1cFvBt+BP0FiD6DrWo=;
	b=IZMwZLnNE1TfZcf6xG7xXJV/G/GjNyibKquQhTj7UQmPBicWpn7vcu9Ap0jtbijUJv
	kUFSish5AI+CjgnXD/16FEUeG/2iPjj8jQz8i2SioSn87fHd0PZy2WO3MJMoVIlJ6oVp
	VTafBNI3GNWuXemmY/zHcYn67H2PqvqrUfQXDpa0ysFi1tNmCRAVx6uLaIrDLhxbHRsQ
	XP0WBBHG565umZwATQESLd1se2Dq69pzOEcxxbI2vDXZWGyk2LA9QN1vuJNwA2HthaoW
	XbBIVUpJAPe8moGQlJwg7xkYwYjPc+b/wTeB7eKkyS3ubVAlEAbHghHDVkpcyxzOA9l9
	sbnA==
X-Gm-Message-State: AHPjjUibasDCvwfggX8v08Ba+2W4+nN3ca4XruNV48dE9gIWFwcNEBGu
	TijSgwxOyTv6X+L909jmEZFbfMKljn2/KYU4cHE=
X-Google-Smtp-Source: AOwi7QAoHsuh1DXpW0ivljmIORIe7VNFZBCKZp17x6z2FyVmGLCWmLfX12YeycTOpntrQjGPgMssKEspm3oIwj4aTvk=
X-Received: by 10.55.109.66 with SMTP id i63mr9788069qkc.19.1506348152098;
	Mon, 25 Sep 2017 07:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Mon, 25 Sep 2017 07:02:31 -0700 (PDT)
In-Reply-To: <1506345027.31732.34.camel@linuxfoundation.org>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
	<1506336011.31732.13.camel@linuxfoundation.org>
	<CADkTA4M5aiZw8d=cGjempdwjy_gtOpDfiQ_uok5w4h2i2WRmjg@mail.gmail.com>
	<1506345027.31732.34.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 10:02:31 -0400
Message-ID: <CADkTA4NPA8n0a=H4Q0rjuEkeEOwvFg0+jL1T6YVf25sXnQUeFA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 14:02:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c2a6839b19055a040201"

--94eb2c05c2a6839b19055a040201
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 9:10 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-09-25 at 08:49 -0400, Bruce Ashfield wrote:
> > On Mon, Sep 25, 2017 at 6:40 AM, Richard Purdie <richard.purdie@linux
> > foundation.org> wrote:
> > >
> > > >  conf/layer.conf                 |  4 ++++
> > > >  2 files changed, 14 insertions(+)
> > > >  create mode 100644 classes/sanity-bbappend.bbclass
> > >
> > > Looking at this patch series, I suspect this is partly related to
> > > YP Compatibility v2.
> > It is.
> >
> > The first series arrived that created a magic distro variable
> > 'virtualization' that no one would know about, and have no idea how
> > to use it .. as a result existing configurations would have a silent
> > and drastic change on the behaviour.
> >
> > I wasn't about to merge that change, so I suggested that if
> > everything was to be triggered off a variable, that variable needed
> > to be advertised by more than just its use in the code, and more than
> > a mention in a README.
> >
> > That led to this first effort at making the new distro variable
> > visible.
> >
> > >
> > > I do think that its highlighting an issue here in that we have
> > > several
> > > very similar bbappends where the functionality would likely be
> > > better
> > > in a common file and secondly, better in the core recipes.
> > >
> > > This layer would then just need to configure it rather than adding
> > > the
> > > config fragements and so on as well.
> > >
> > > So yes, I think there is a valid issue here and in many senses, YP
> > > Compat v2 is probably highlighting a real problem but I suspect
> > > this
> > > patch series is not the way to fix it...
> > >
> > > Is there a good reason we wouldn't want "virt" markup in the main
> > > recipes and it being a configuration option?
> >
> > I'm not following the configuration option 100%. Do you just mean
> > setting 'virtualization' in distro features or some other similar
> > configuration variable ? If that had to be manually done via distro
> > or local.conf that would leave my original concern outstanding.
>
> I'll spell this out from the ground up since I know you understand this
> but I think others reading might not have thought about all of this
> quite as much.
>
> One of the bigger problems we have today is that as you add layers,
> your build subtly changes and most users have any idea that it happens.
> This means sstate becomes invalid, things rebuild and people don't
> really understand or control what they're building.
>
> In this case, changing the kernel to enable virtualisation when adding
> a virtualisation layer isn't totally unexpected but there are other
> cases which are more subtle and problematic. Even here, spelling it out
> as a configuration option which users (or distro) opt into is a good
> thing.
>

Agreed. I don't object to this being controlled by a variable, I object to
a silent change to require that variable.


>
> I'm fine with the warning in this patch series, that makes a lot of
> sense. The naming of the class is horrible IMO though.
>

I don't disagree on that point. A better namespace-safe name for the
class could be used. As long as the functionality is there, I'm happy.


>
> What I am a little more worried about is that we have to bbappend
> recipes like linux-yocto. I have to ask the question, why not put the
> configuration markup into the upstream recipe?
>

I'm not following on this one. You mean have the relevant recipes be
able to inject changes that impact how the kernel is configured or
built ? i.e. pkg-config or something similar ?


>
> There still may be something in meta-virt that warns if key
> configuration isn't enabled but the actual code that handles the option
> perhaps shouldn't be there now its established?
>
> In new layers pushing the boundaries of technology with things that are
> rapidly changing, bbappends in layers make sense. In this case I have
> to wonder why we don't just put some configuration options in linux-
> yocto in OE-Core. Its not rapid changing, its well established and
> fairly universally useful.
>

We've been using fragments to that end, and with my code that makes the
fragments available to any kernel, that should help on this front.


>
> We could consider whether it should be based on DISTRO_FEATURE or we
> whether we add 'PACKAGECONFIG' for the kernel?
>

I have lots of thoughts on this topic, but I want to understand before I
head
off on a tangent. The kernel is a royal pain in this area given the drastic
difference in capabilities, versions, h/w, etc. I have old bugzilla entries
on this
topic, and have the first stage of code ready to make available early in the
next release cycle.


>
> Whilst there are easy ways to make the YP Compat tests pass, I do want
> us to think about what actually makes sense...
>

Agreed.

Bruce


>
> Cheers,
>
> Richard
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05c2a6839b19055a040201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 25, 2017 at 9:10 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Mon, 2017-09-25 at 08:49 -0400, Bruce Ash=
field wrote:<br>
&gt; On Mon, Sep 25, 2017 at 6:40 AM, Richard Purdie &lt;richard.purdie@lin=
ux<br>
&gt; <a href=3D"http://foundation.org" rel=3D"noreferrer" target=3D"_blank"=
>foundation.org</a>&gt; wrote:<br>
&gt; &gt;=C2=A0<br>
</span><div><div class=3D"h5">&gt; &gt; &gt; =C2=A0conf/layer.conf=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 ++++<br>
&gt; &gt; &gt; =C2=A02 files changed, 14 insertions(+)<br>
&gt; &gt; &gt; =C2=A0create mode 100644 classes/sanity-bbappend.<wbr>bbclas=
s<br>
&gt; &gt;<br>
&gt; &gt; Looking at this patch series, I suspect this is partly related to=
<br>
&gt; &gt; YP Compatibility v2.<br>
&gt; It is.<br>
&gt;<br>
&gt; The first series arrived that created a magic distro variable<br>
&gt; &#39;virtualization&#39; that no one would know about, and have no ide=
a how<br>
&gt; to use it .. as a result existing configurations would have a silent<b=
r>
&gt; and drastic change on the behaviour.<br>
&gt;<br>
&gt; I wasn&#39;t about to merge that change, so I suggested that if<br>
&gt; everything was to be triggered off a variable, that variable needed<br=
>
&gt; to be advertised by more than just its use in the code, and more than<=
br>
&gt; a mention in a README.<br>
&gt;<br>
&gt; That led to this first effort at making the new distro variable<br>
&gt; visible.<br>
&gt; =C2=A0<br>
&gt; &gt;<br>
&gt; &gt; I do think that its highlighting an issue here in that we have<br=
>
&gt; &gt; several<br>
&gt; &gt; very similar bbappends where the functionality would likely be<br=
>
&gt; &gt; better<br>
&gt; &gt; in a common file and secondly, better in the core recipes.<br>
&gt; &gt;<br>
&gt; &gt; This layer would then just need to configure it rather than addin=
g<br>
&gt; &gt; the<br>
&gt; &gt; config fragements and so on as well.<br>
&gt; &gt;<br>
&gt; &gt; So yes, I think there is a valid issue here and in many senses, Y=
P<br>
&gt; &gt; Compat v2 is probably highlighting a real problem but I suspect<b=
r>
&gt; &gt; this<br>
&gt; &gt; patch series is not the way to fix it...<br>
&gt; &gt;<br>
&gt; &gt; Is there a good reason we wouldn&#39;t want &quot;virt&quot; mark=
up in the main<br>
&gt; &gt; recipes and it being a configuration option?<br>
&gt;<br>
&gt; I&#39;m not following the configuration option 100%. Do you just mean<=
br>
&gt; setting &#39;virtualization&#39; in distro features or some other simi=
lar<br>
&gt; configuration variable ? If that had to be manually done via distro<br=
>
&gt; or local.conf that would leave my original concern outstanding.<br>
<br>
</div></div>I&#39;ll spell this out from the ground up since I know you und=
erstand this<br>
but I think others reading might not have thought about all of this<br>
quite as much.<br>
<br>
One of the bigger problems we have today is that as you add layers,<br>
your build subtly changes and most users have any idea that it happens.<br>
This means sstate becomes invalid, things rebuild and people don&#39;t<br>
really understand or control what they&#39;re building.<br>
<br>
In this case, changing the kernel to enable virtualisation when adding<br>
a virtualisation layer isn&#39;t totally unexpected but there are other<br>
cases which are more subtle and problematic. Even here, spelling it out<br>
as a configuration option which users (or distro) opt into is a good<br>
thing.<br></blockquote><div><br></div><div>Agreed. I don&#39;t object to th=
is being controlled by a variable, I object to</div><div>a silent change to=
 require that variable.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
I&#39;m fine with the warning in this patch series, that makes a lot of<br>
sense. The naming of the class is horrible IMO though.<br></blockquote><div=
><br></div><div>I don&#39;t disagree on that point. A better namespace-safe=
 name for the</div><div>class could be used. As long as the functionality i=
s there, I&#39;m happy.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
What I am a little more worried about is that we have to bbappend<br>
recipes like linux-yocto. I have to ask the question, why not put the<br>
configuration markup into the upstream recipe?<br></blockquote><div><br></d=
iv><div>I&#39;m not following on this one. You mean have the relevant recip=
es be</div><div>able to inject changes that impact how the kernel is config=
ured or</div><div>built ? i.e. pkg-config or something similar ?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
There still may be something in meta-virt that warns if key<br>
configuration isn&#39;t enabled but the actual code that handles the option=
<br>
perhaps shouldn&#39;t be there now its established?<br>
<br>
In new layers pushing the boundaries of technology with things that are<br>
rapidly changing, bbappends in layers make sense. In this case I have<br>
to wonder why we don&#39;t just put some configuration options in linux-<br=
>
yocto in OE-Core. Its not rapid changing, its well established and<br>
fairly universally useful.<br></blockquote><div><br></div><div>We&#39;ve be=
en using fragments to that end, and with my code that makes the</div><div>f=
ragments available to any kernel, that should help on this front.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
We could consider whether it should be based on DISTRO_FEATURE or we<br>
whether we add &#39;PACKAGECONFIG&#39; for the kernel?<br></blockquote><div=
><br></div><div>I have lots of thoughts on this topic, but I want to unders=
tand before I head</div><div>off on a tangent. The kernel is a royal pain i=
n this area given the drastic</div><div>difference in capabilities, version=
s, h/w, etc. I have old bugzilla entries on this</div><div>topic, and have =
the first stage of code ready to make available early in the</div><div>next=
 release cycle.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Whilst there are easy ways to make the YP Compat tests pass, I do want<br>
us to think about what actually makes sense...<br></blockquote><div><br></d=
iv><div>Agreed.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c05c2a6839b19055a040201--
