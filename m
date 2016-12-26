Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46CF7E00519; Sun, 25 Dec 2016 17:45:32 -0800 (PST)
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
	*      [209.85.220.175 listed in list.dnswl.org]
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00CC2E0050B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 17:45:28 -0800 (PST)
Received: by mail-qk0-f175.google.com with SMTP id u25so177722308qki.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 17:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrocQ+stJJeIoPFz9K3baXbJ5m+wXgXbwBX2Khb1OWo=;
	b=cI6KIG5f5tdGQC9TDBJqQiXBgQoLrObJ1+IKYsOOyxT3ZcUPC5Ei+erJxNGiklBpK7
	RBMPWKGMnFhz0AKTEvv8Z+pN23jFaN9QqsE8SKZkz99O6Hc8mLBbGjYIck55zPmkuALj
	dSwRaru7/xkhj7uz3Kjqs3VB1BkqYhNkH9V4QrCuKJ6pGC64nlD+NpLyyutk5jHlaMu2
	ZZIIDEsyEK8zkF3lzMXk1gjZhm/c2JkdA1J4FIM6xT+gNouaoCptPmJCTiSMKBY+fvgm
	Gva4Q67bxc5fKr/nroZwTBqKjAiqdAfI/yrSqa/S0/fLhlHJ4T6cXxJHOvYzpybASXGN
	sboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrocQ+stJJeIoPFz9K3baXbJ5m+wXgXbwBX2Khb1OWo=;
	b=fcWlfyVSCZkcjCEl6Km8PwcoVsmE5ZSnfLrajA6OHwnKnzBLmOcrywnT11SJ4ua42L
	03lv0xHb7yqHbmpEXkHHbxLomWzIpPZf6NzRTtNeWUaEcI6ZQ0tMChQv7aCHlbP1OJWA
	P8+UjZZbUZSifFGvoIw0HZtD5TFgj9TKi0FxVRzJv8DJQzLAljwqomsYdJ/9cEoxgcxF
	4Rx1DdtIHNlK9fgOkNfg6fF1cHF3ErJeSfzeNyCyQNaWG2lMfNJ2Ud/OrSqz5zGZ1Qm/
	/uFmZsuJrDpaMR+nB1TiB1ZiwiVD6o42Z1nuc/V7GsRCSaR1lGG9idTbRY8yDoU5mSmI
	OhfQ==
X-Gm-Message-State: AIkVDXL1jve9Jqk4zdweu9yss/VHDTBEoAqOmAI40WCidRK55X0dgt6HG4R0Est7GaTLMtpGzl+muXa2+h0VTQ==
X-Received: by 10.233.221.135 with SMTP id r129mr24400178qkf.56.1482716728277; 
	Sun, 25 Dec 2016 17:45:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sun, 25 Dec 2016 17:45:27 -0800 (PST)
In-Reply-To: <CAPuovE+xJZcTBNjES0ijs1DZmG-ButLbs0ub+Qeoxopa-eLBDQ@mail.gmail.com>
References: <1401414421-25902-1-git-send-email-akuster@mvista.com>
	<CAPuovELsykZqBXJ1tYz-w6tJjtqi+0w8HLcFXxS8P4zFj-rXvg@mail.gmail.com>
	<CAPuovE+xJZcTBNjES0ijs1DZmG-ButLbs0ub+Qeoxopa-eLBDQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Dec 2016 20:45:27 -0500
Message-ID: <CADkTA4PD-5dkxv-pi225hokLYFP5s0nsA24DD+8-Oy6asbcexg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: akuster808 <akuster808@gmail.com>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-barbican fix fetch error.
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
X-List-Received-Date: Mon, 26 Dec 2016 01:45:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c0438a8e4471a054485e3f2

--94eb2c0438a8e4471a054485e3f2
Content-Type: text/plain; charset=UTF-8

It did the same thing to me .. and I nearly replied to a few myself. Not
cool gmail .. not cool!

Bruce

On Sun, Dec 25, 2016 at 1:16 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Please ignore my previous message. I see gmail decided to pull a
> number on me and move old email from 2014 to the top of my
> meta-virtualization folder.
>
> Mark
>
> On Sun, Dec 25, 2016 at 1:05 PM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
> > Be sure to include [mcs] in your subject to ensure Bruce doesn't have
> > to search to determine which repo to apply the change to.
> >
> >
> > On Thu, May 29, 2014 at 9:47 PM, Armin Kuster <akuster@mvista.com>
> wrote:
> >> It appears the that git repo has moved. This is causing a do_fetch
> error.
> >>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> ---
> >>  meta-openstack/recipes-devtools/python/python-barbican_git.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-openstack/recipes-devtools/python/python-
> barbican_git.bb b/meta-openstack/recipes-devtools/python/python-
> barbican_git.bb
> >> index bc12fcd..8ae0b21 100644
> >> --- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
> >> +++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
> >> @@ -4,10 +4,10 @@ SECTION = "devel/python"
> >>  LICENSE = "Apache-2.0"
> >>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fc8be9e7dffe97390d1216b01fd0be
> 01"
> >>
> >> -PR = "r0"
> >> +PR = "r1"
> >
> > You can drop the PR, since the advent of the PR server assigning a PR
> > number is not necessary and is actually unwanted.
> >
> >
> >>  SRCNAME = "barbican"
> >>
> >> -SRC_URI = "git://github.com/stackforge/barbican.git;branch=master \
> >> +SRC_URI = "git://github.com/cloudkeep/barbican.git;branch=master \
> >>             file://barbican.init \
> >>            "
> >>
> >
> > This is step backwards as this repo even declares:
> > Barbican moved to openstack/barbican. https://github.com/openstack/
> barbican
> >
> > Additionally the current recipe doesn't use 'branch=master' so this
> > patch will not apply, do you have local changes?
> >
> > I am in the process of resurrecting meta-cloud-services so you might
> > get this fetching issue fixed for free in the coming days if you want
> > to wait for me, otherwise feel free to send out a V2 with the above
> > corrected.
> >
> > Mark
> >
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0438a8e4471a054485e3f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It did the same thing to me .. and I nearly replied to a f=
ew myself. Not cool gmail .. not cool!<div><br></div><div>Bruce</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Dec 25, 2=
016 at 1:16 PM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mar=
k.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Please ignore my p=
revious message. I see gmail decided to pull a<br>
number on me and move old email from 2014 to the top of my<br>
meta-virtualization folder.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
On Sun, Dec 25, 2016 at 1:05 PM, Mark Asselstine<br>
&lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windri=
ver.com</a><wbr>&gt; wrote:<br>
&gt; Be sure to include [mcs] in your subject to ensure Bruce doesn&#39;t h=
ave<br>
&gt; to search to determine which repo to apply the change to.<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 29, 2014 at 9:47 PM, Armin Kuster &lt;<a href=3D"mailto:ak=
uster@mvista.com">akuster@mvista.com</a>&gt; wrote:<br>
&gt;&gt; It appears the that git repo has moved. This is causing a do_fetch=
 error.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.c=
om">akuster@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http:=
//python-barbican_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
barbican_git.bb</a> | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-barbican_git.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon-<wbr>barbican_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/=
<a href=3D"http://python-barbican_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python-<wbr>barbican_git.bb</a><br>
&gt;&gt; index bc12fcd..8ae0b21 100644<br>
&gt;&gt; --- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http:=
//python-barbican_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
barbican_git.bb</a><br>
&gt;&gt; +++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http:=
//python-barbican_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
barbican_git.bb</a><br>
&gt;&gt; @@ -4,10 +4,10 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>fc8be9e=
7dffe97390d1216b01fd0be<wbr>01&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PR =3D &quot;r0&quot;<br>
&gt;&gt; +PR =3D &quot;r1&quot;<br>
&gt;<br>
&gt; You can drop the PR, since the advent of the PR server assigning a PR<=
br>
&gt; number is not necessary and is actually unwanted.<br>
&gt;<br>
&gt;<br>
&gt;&gt;=C2=A0 SRCNAME =3D &quot;barbican&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/stackforge/b=
arbican.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.co=
m/stackforge/<wbr>barbican.git;branch=3Dmaster</a> \<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/cloudkeep/ba=
rbican.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com=
/cloudkeep/<wbr>barbican.git;branch=3Dmaster</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://barbican.ini=
t \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; This is step backwards as this repo even declares:<br>
&gt; Barbican moved to openstack/barbican. <a href=3D"https://github.com/op=
enstack/barbican" rel=3D"noreferrer" target=3D"_blank">https://github.com/o=
penstack/<wbr>barbican</a><br>
&gt;<br>
&gt; Additionally the current recipe doesn&#39;t use &#39;branch=3Dmaster&#=
39; so this<br>
&gt; patch will not apply, do you have local changes?<br>
&gt;<br>
&gt; I am in the process of resurrecting meta-cloud-services so you might<b=
r>
&gt; get this fetching issue fixed for free in the coming days if you want<=
br>
&gt; to wait for me, otherwise feel free to send out a V2 with the above<br=
>
&gt; corrected.<br>
&gt;<br>
&gt; Mark<br>
&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 1.9.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@<wbr>yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>=
org/listinfo/meta-<wbr>virtualization</a><br>
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

--94eb2c0438a8e4471a054485e3f2--
