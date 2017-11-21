Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19BBCE00B48; Mon, 20 Nov 2017 19:08:28 -0800 (PST)
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
	*      [209.85.216.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F33A7E00AF2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 19:08:26 -0800 (PST)
Received: by mail-qt0-f175.google.com with SMTP id r37so9350984qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Nov 2017 19:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TGjYIei/Y6DOJMKIieiDMfCbNE0P74d8lBNy6M+6mo8=;
	b=dg3tecNUXWMQtsn7RC2AhR1BNPcg2Fk/IvrGf/9af0EmYcF6okh1onuoxYW/Yqxmd1
	omRuM2WAmhXxA4mrW1sjXS4CJBU1Ss5fdSsuXRHrS9WsftcP7jL4MNDz2YMyJm+EzMqt
	+tDNk5tm4LsFKl4xNUHkS8NkXBYA9C8aGd8ASiDPmXbJz+o65TP4qe9xMTQoUEyLKFyi
	YoQVruvskWG58FZ+yDp55PLhuOJcwas0vFsE+eqpf+ZWxjg4VbCp6I9s6yuCGOMMv0im
	Vnrnxcw5nl3OB1bZf/2mhNwwAxnbRLtvjkBBvywshstU/e5gHWDndvTgg91K65VeWSfu
	jn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TGjYIei/Y6DOJMKIieiDMfCbNE0P74d8lBNy6M+6mo8=;
	b=IR4tIhls694pu55+rH92k5I/PBMLrMY1UgqyqRnbjxfYpIdBTS4JumObBLdE3qINxs
	qfenTNAYEU+PTwYCJY49OcN999lbtTl2W8y1azygBLsRsPMNqgFEDXNX8jNqvQvDgX9n
	7DtoVG5GMI1b/UravtA1Ka06xxajxGyRDvHyhM9Pjer0F7nxL1xwiWIRiFHX+nNQvtiu
	PpXxVLgwQ84H/3wMLSaNGM2fliiumn6fioCBH20FXrNd720nIbvP0PLR+2hTjWqq1yFT
	0q8Qvj6qJS3dj0YkQ54pBElypjbhrrgzK50wrTPIhV7NI58fTfRoIK7XwlyMsCFEJPFF
	rL+Q==
X-Gm-Message-State: AJaThX6T+2fYSj6K0scLlqvo2zZm5UKqp9bqa6Am80fTXlDcIEGI1X7N
	X7+n9jKYrS4DkFcYTp0LzkLWctlGv0IiUDWknIE=
X-Google-Smtp-Source: AGs4zMY6GQeDIwt7oozcjAY+qt6cLd2/ynjbNdxPXOXJmxIPHKdkkQZ6S72OKni3GbY2x9hHSZX+7S8xhqNhPBehAgE=
X-Received: by 10.200.47.12 with SMTP id j12mr25044188qta.204.1511233706084;
	Mon, 20 Nov 2017 19:08:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 20 Nov 2017 19:08:25 -0800 (PST)
In-Reply-To: <1560592.BgqbcP64FP@peggleto-mobl.ger.corp.intel.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<CAAPZna2fMCQ6qxZEKek=RdBsC7MdyxpiPOpMv4-y+OoDehvbAw@mail.gmail.com>
	<CADkTA4OjsZ5cRyzDDUOhgx8oYx97XH9WdzHCxngb9mfVo_F2WQ@mail.gmail.com>
	<1560592.BgqbcP64FP@peggleto-mobl.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 20 Nov 2017 22:08:25 -0500
Message-ID: <CADkTA4OnTbFcBwxpObO68bxaex=mpX5FuTBSiPt==go_3rA7TA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Tue, 21 Nov 2017 03:08:28 -0000
Content-Type: multipart/alternative; boundary="001a11411d68394f25055e75844c"

--001a11411d68394f25055e75844c
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 20, 2017 at 3:20 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday, 15 November 2017 6:33:31 AM NZDT Bruce Ashfield wrote:
> > On Tue, Nov 14, 2017 at 12:14 PM, Fabio Berton
> > <fabio.berton@ossystems.com.br> wrote:
> > > Hi,
> > >
> > > We have a customer using krogoth branch and is failing to fetch from
> pypi.
> > > And branches morty, pyro and rocko have http URLs for python recipes.
> This
> > > patch can be backported to older branches?
> >
> > Does the pypi class take care of things in the old branches as well ?
> > If not, propose different patches for those branches, since as you'll
> > see in the thread:
> >
> > "Bruce. Instead of merging this I will move any recipes that remain to
> > inherit pypi if that is alright with the two of you."
> >
> > So that is the plan for master, not merging this patch as it sits.
>
> The pypi class used https URLs back in morty, FYI.
>
> So just to clarify - you want pypi inherit patches going back to morty? I
> can
> do that, but it's slightly less safe than just tweaking the URLs for the
> stable branches. Let me know what you'd like me to do.
>

Just tweaking the URLs is fine, we've fixed it in master, so making sure it
is done there first
has been accomplished.  Since the structure/context is different in the
older branches,
different patches are fine (I just hadn't gone back to see when the pypi
bbclass had been
introduced, hence wasn't sure if the patch would apply to the older
branches as well).

Bruce


>
> Cheers,
> Paul
>
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11411d68394f25055e75844c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 20, 2017 at 3:20 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Wednesday, 15 November 2017 6:33:31 AM NZDT Bruce Ashf=
ield wrote:<br>
&gt; On Tue, Nov 14, 2017 at 12:14 PM, Fabio Berton<br>
&gt; &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossy=
stems.com.br</a><wbr>&gt; wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; We have a customer using krogoth branch and is failing to fetch f=
rom pypi.<br>
&gt; &gt; And branches morty, pyro and rocko have http URLs for python reci=
pes. This<br>
&gt; &gt; patch can be backported to older branches?<br>
&gt;<br>
&gt; Does the pypi class take care of things in the old branches as well ?<=
br>
&gt; If not, propose different patches for those branches, since as you&#39=
;ll<br>
&gt; see in the thread:<br>
&gt;<br>
&gt; &quot;Bruce. Instead of merging this I will move any recipes that rema=
in to<br>
&gt; inherit pypi if that is alright with the two of you.&quot;<br>
&gt;<br>
&gt; So that is the plan for master, not merging this patch as it sits.<br>
<br>
</span>The pypi class used https URLs back in morty, FYI.<br>
<br>
So just to clarify - you want pypi inherit patches going back to morty? I c=
an<br>
do that, but it&#39;s slightly less safe than just tweaking the URLs for th=
e<br>
stable branches. Let me know what you&#39;d like me to do.<br></blockquote>=
<div><br></div><div>Just tweaking the URLs is fine, we&#39;ve fixed it in m=
aster, so making sure it is done there first</div><div>has been accomplishe=
d.=C2=A0 Since the structure/context is different in the older branches,</d=
iv><div>different patches are fine (I just hadn&#39;t gone back to see when=
 the pypi bbclass had been</div><div>introduced, hence wasn&#39;t sure if t=
he patch would apply to the older branches as well).</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a11411d68394f25055e75844c--
