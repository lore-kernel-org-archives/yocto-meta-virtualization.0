Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FF87E008D9; Sat, 21 Sep 2019 07:11:23 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1BF5E007E1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Sep 2019 07:11:21 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id m13so9630126ljj.11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Sep 2019 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JzdFNAsIXjLBxAdhe/hIEXXdyMSpKzfShqenqbPWgSw=;
	b=ZNpx43IauNLeR7Ugi+9P+7mK1jOB45cUQ+OGIHCE+J/TOJMx/KHUTzZBx+Ry6lqfPR
	91O0owPO1uog6lNE4n5gSu6a1u9VtCrB4B5YBicNZ4IGrry4/wHa8pUBDH5yQ9DQeeWd
	55T1pMPqUOp50LLCVTiA+9c830Z1vsrmGU2LOwVkjoWL89T0z06LJpNUXgyrIbNNse8l
	a08VWJQBkD4h0IGEGpSYE/Miko/AwTY7fLB6AIRzDIFKjyHqiQI5S8wj+qfnnFeUX5BZ
	IPc7aNy5cbW5Sefke6jDI0R3gDbqiMaqfb4Fkl5HiJ4je0v9J6BO3CUwTgpZQ/yw4Y0R
	maSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JzdFNAsIXjLBxAdhe/hIEXXdyMSpKzfShqenqbPWgSw=;
	b=ogbFNCDr5xQf4zvR1PzKnPMZ8XCX8ewNbgyaV8LrV4mC7Rei8FkYfioN31DIPKNy/V
	T2q/lUp2xvzerqMaXljVDq/GAzB4cCuFYlSlPcCApZisJfrkPXfzdcb8V5791poyyNtn
	GAs6Z3ci2E/U3CvPtfD3XfMQzcqRtZcC6tM2a5TlRJlMFUReI2X9+IH+F8A9LUxJHPj5
	DeQ6tT4GO6OXdfEYotfZWWkRxY3OgKLhbBqTl8XFc/gSbxanst997FD+EKcaSXHD/5hO
	KBMpUKwJGwsKoAhM9iXY6dkHhkJrH65D/11zwiGLu7+73WoQqNV1bcuzpLPJ6EGb+5LX
	lD3g==
X-Gm-Message-State: APjAAAVzEOmwkLaTAQBAMCb13YmX4kKiRjYIUZlFPIQhHJniziWKo/zC
	43EJOiYfDtSi8AWEjeebw+XgkKQicUtbwPhwMKaUcud+
X-Google-Smtp-Source: APXvYqw3RTkN8B9BgFisCwKu3Z0qiN16EEnYC91a2IAac8v4URj55IHoxyAXWA5NJrVDouFMTT+ny4bcccO0VB+2YLU=
X-Received: by 2002:a2e:9a45:: with SMTP id k5mr11831442ljj.87.1569075080103; 
	Sat, 21 Sep 2019 07:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
	<CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
	<adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
	<CADkTA4OsSD7_THHFuuT4-pu7z3=CY+NuirpTm4wTM0x-1y_3Bw@mail.gmail.com>
	<CADkTA4NivDzr5nWBKRWxQvG5oUEN1+60-fMy9RtQRQcxwdj=Fg@mail.gmail.com>
	<e202ad0f7539595bf3a8e04d3298eae3@agner.ch>
In-Reply-To: <e202ad0f7539595bf3a8e04d3298eae3@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 21 Sep 2019 10:11:08 -0400
Message-ID: <CADkTA4N_T=R4xd4aTNgBAVnu-BieaBq1_17Y81iFE+RL=+3KdA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v2 2/2] docker-ce: update to v19.03.2
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
X-List-Received-Date: Sat, 21 Sep 2019 14:11:23 -0000
Content-Type: multipart/alternative; boundary="000000000000c68947059310c299"

--000000000000c68947059310c299
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 21, 2019 at 2:31 AM Stefan Agner <stefan@agner.ch> wrote:

> On 2019-09-21 05:35, Bruce Ashfield wrote:
>
>
>
> On Fri, Sep 20, 2019 at 11:28 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Fri, Sep 20, 2019 at 3:16 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>>> On 2019-09-18 19:52, Bruce Ashfield wrote:
>>> > On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
>>> >>
>>> >> From: Stefan Agner <stefan.agner@toradex.com>
>>> >>
>>> >> Bump the git hashes to Docker CE v19.03.2.
>>> >>
>>> >> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>> >> ---
>>> >> Changes in v2:
>>> >> - Bump to v19.03.2 final release
>>> >> - Drop docker (non-ce) recipe patch as that recipe can not be bumped
>>> to a
>>> >>   Docker stable patch release
>>> >
>>> > Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
>>> > for testing.
>>>
>>> Thx. Just FYI, this recipe currently does not build. So it would be nice
>>> to have this fixed soon.
>>
>>
>> Yup. I've been seeing the issue as well, but the 5.2 kernel intro to
>> oe-core has preempted some things for the last little while.
>>
>>
>
> Actually, I take that back.
>
> What configuration are you using that the current docker (non-ce) recipe
> isn't building ?
>
>
>
> The non-ce recipe builds fine for me too. I was referring to this
> (docker-ce) recipe. Patch 1/2 makes it build again.
>

ahaha! Sorry about that.

Yes, I'll push that fix this weekend, while I sort out the last details on
the other parts.

Bruce



>
> Best regards,
> Stefan
>
>
>
> The build error that I was dealing with was due to my SRCREV bumps and
> other fixing, but when I do a build of docker on an unmodified master
> branch, I have no issues.
>
> Bruce
>
>>
>> I have the virtual/docker and moby switch pretty much done, so it'll all
>> be fixed up shortly.
>>
>> Bruce
>>
>>>
>>> --
>>> Stefan
>>>
>>> >
>>> > Bruce
>>> >
>>> >>
>>> >>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
>>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>>> >>
>>> >> diff --git a/recipes-containers/docker/docker-ce_git.bb
>>> b/recipes-containers/docker/docker-ce_git.bb
>>> >> index 215f114..52b146d 100644
>>> >> --- a/recipes-containers/docker/docker-ce_git.bb
>>> >> +++ b/recipes-containers/docker/docker-ce_git.bb
>>> >> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>>> >>   subtle and/or glaring issues. \
>>> >>   "
>>> >>
>>> >> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
>>> >> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>>> >>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>>> >>  SRC_URI = "\
>>> >>         git://
>>> github.com/docker/docker-ce.git;branch=19.03;name=docker \
>>> >> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>>> >>
>>> >>  S = "${WORKDIR}/git"
>>> >>
>>> >> -DOCKER_VERSION = "19.03.0-rc3-ce"
>>> >> +DOCKER_VERSION = "19.03.2-ce"
>>> >>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>>> >>
>>> >>  PACKAGES =+ "${PN}-contrib"
>>> >> --
>>> >> 2.20.1
>>> >>
>>> >> --
>>> >> _______________________________________________
>>> >> meta-virtualization mailing list
>>> >> meta-virtualization@yoctoproject.org
>>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c68947059310c299
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Sep 21, 2019 at 2:31 AM Stefan Agner &lt;<a=
 href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"font-size:10p=
t">
<p>On 2019-09-21 05:35, Bruce Ashfield wrote:</p>
<blockquote type=3D"cite" style=3D"padding:0px 0.4em;border-left:2px solid =
rgb(16,16,255);margin:0px">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small">=C2=A0</div>
</div>
<br>
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Sep 20, 2019 at 11:28 PM Bruc=
e Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank=
">bruce.ashfield@gmail.com</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small">=C2=A0</div>
</div>
<br>
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Sep 20, 2019 at 3:16 AM Stefa=
n Agner &lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agn=
er.ch</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 2019-09-18 19:52, Bruc=
e Ashfield wrote:<br> &gt; On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner &lt=
;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&g=
t; wrote:<br> &gt;&gt;<br> &gt;&gt; From: Stefan Agner &lt;<a href=3D"mailt=
o:stefan.agner@toradex.com" target=3D"_blank">stefan.agner@toradex.com</a>&=
gt;<br> &gt;&gt;<br> &gt;&gt; Bump the git hashes to Docker CE v19.03.2.<br=
> &gt;&gt;<br> &gt;&gt; Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:s=
tefan.agner@toradex.com" target=3D"_blank">stefan.agner@toradex.com</a>&gt;=
<br> &gt;&gt; ---<br> &gt;&gt; Changes in v2:<br> &gt;&gt; - Bump to v19.03=
.2 final release<br> &gt;&gt; - Drop docker (non-ce) recipe patch as that r=
ecipe can not be bumped to a<br> &gt;&gt;=C2=A0 =C2=A0Docker stable patch r=
elease<br> &gt; <br> &gt; Ack&#39;d. I&#39;ll take care of the moby recipe =
shortly. I&#39;ve pulled this in<br> &gt; for testing.<br><br> Thx. Just FY=
I, this recipe currently does not build. So it would be nice<br> to have th=
is fixed soon.</blockquote>
<div>=C2=A0</div>
<div>
<div style=3D"font-size:small">Yup. I&#39;ve been seeing the issue as well,=
 but the 5.2 kernel intro to oe-core has preempted some things for the last=
 little while.</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
</div>
</blockquote>
<div>=C2=A0</div>
<div>
<div style=3D"font-size:small">Actually, I take that back.=C2=A0</div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">What configuration are you using that the cu=
rrent docker (non-ce) recipe isn&#39;t building ?=C2=A0</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
</div>
</blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">The non-ce recipe builds fine for me too. I=
=C2=A0was referring to this (docker-ce) recipe. Patch 1/2 makes it build ag=
ain.</div></div></div></div></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">ahaha! Sorry about that.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Yes, I&#39;ll push that fix this w=
eekend, while I sort out the last details on the other parts.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"font-size:1=
0pt"><div dir=3D"ltr"><div class=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">Best regards,</div>
<div style=3D"font-size:small">Stefan</div>
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
<blockquote type=3D"cite" style=3D"padding:0px 0.4em;border-left:2px solid =
rgb(16,16,255);margin:0px">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">The build error that I was dealing with was =
due to my SRCREV bumps and other fixing, but when I do a build of docker on=
 an unmodified master branch, I have no issues.</div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">Bruce</div>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">I have the virtual/docker and moby switch pr=
etty much done, so it&#39;ll all be fixed up shortly.</div>
<div style=3D"font-size:small">=C2=A0</div>
<div style=3D"font-size:small">Bruce</div>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br> --<br> Stefan<br><br=
> &gt; <br> &gt; Bruce<br> &gt; <br> &gt;&gt;<br> &gt;&gt;=C2=A0 recipes-co=
ntainers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"noopener norefer=
rer" target=3D"_blank">docker-ce_git.bb</a> | 4 ++--<br> &gt;&gt;=C2=A0 1 f=
ile changed, 2 insertions(+), 2 deletions(-)<br> &gt;&gt;<br> &gt;&gt; diff=
 --git a/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" rel=
=3D"noopener noreferrer" target=3D"_blank">docker-ce_git.bb</a> b/recipes-c=
ontainers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"noopener norefe=
rrer" target=3D"_blank">docker-ce_git.bb</a><br> &gt;&gt; index 215f114..52=
b146d 100644<br> &gt;&gt; --- a/recipes-containers/docker/<a href=3D"http:/=
/docker-ce_git.bb" rel=3D"noopener noreferrer" target=3D"_blank">docker-ce_=
git.bb</a><br> &gt;&gt; +++ b/recipes-containers/docker/<a href=3D"http://d=
ocker-ce_git.bb" rel=3D"noopener noreferrer" target=3D"_blank">docker-ce_gi=
t.bb</a><br> &gt;&gt; @@ -18,7 +18,7 @@ DESCRIPTION =3D &quot;Linux contain=
er runtime \<br> &gt;&gt;=C2=A0 =C2=A0subtle and/or glaring issues. \<br> &=
gt;&gt;=C2=A0 =C2=A0&quot;<br> &gt;&gt;<br> &gt;&gt; -SRCREV_docker =3D &qu=
ot;2416d7f930859912c883f964b1cee6909635f951&quot;<br> &gt;&gt; +SRCREV_dock=
er =3D &quot;6a30dfca03664a0b6bf0646a7d389ee7d0318e6e&quot;<br> &gt;&gt;=C2=
=A0 SRCREV_libnetwork =3D &quot;5ac07abef4eee176423fdc1b870d435258e2d381&qu=
ot;<br> &gt;&gt;=C2=A0 SRC_URI =3D &quot;\<br> &gt;&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0git://<a href=3D"http://github.com/docker/docker-ce.git;branc=
h=3D19.03;name=3Ddocker" rel=3D"noopener noreferrer" target=3D"_blank">gith=
ub.com/docker/docker-ce.git;branch=3D19.03;name=3Ddocker</a> \<br> &gt;&gt;=
 @@ -38,7 +38,7 @@ GO_IMPORT =3D &quot;import&quot;<br> &gt;&gt;<br> &gt;&g=
t;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br> &gt;&gt;<br> &gt;&gt; -DOCKER=
_VERSION =3D &quot;19.03.0-rc3-ce&quot;<br> &gt;&gt; +DOCKER_VERSION =3D &q=
uot;19.03.2-ce&quot;<br> &gt;&gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git$=
{SRCREV_docker}&quot;<br> &gt;&gt;<br> &gt;&gt;=C2=A0 PACKAGES =3D+ &quot;$=
{PN}-contrib&quot;<br> &gt;&gt; --<br> &gt;&gt; 2.20.1<br> &gt;&gt;<br> &gt=
;&gt; --<br> &gt;&gt; _______________________________________________<br> &=
gt;&gt; meta-virtualization mailing list<br> &gt;&gt; <a href=3D"mailto:met=
a-virtualization@yoctoproject.org" target=3D"_blank">meta-virtualization@yo=
ctoproject.org</a><br> &gt;&gt; <a href=3D"https://lists.yoctoproject.org/l=
istinfo/meta-virtualization" rel=3D"noopener noreferrer" target=3D"_blank">=
https://lists.yoctoproject.org/listinfo/meta-virtualization</a></blockquote=
>
</div>
<br clear=3D"all">
<div>=C2=A0</div>
-- <br>
<div class=3D"gmail-m_6334428820903599824gmail-m_7264107620680629132gmail_s=
ignature" dir=3D"ltr">- Thou shalt not follow the NULL pointer, for chaos a=
nd madness await thee at its end<br>- &quot;Use the force Harry&quot; - Gan=
dalf, Star Trek II<br><br></div>
</div>
</blockquote>
</div>
<br clear=3D"all">
<div>=C2=A0</div>
-- <br>
<div class=3D"gmail-m_6334428820903599824gmail_signature" dir=3D"ltr">- Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><br><=
/div>
</div>
</blockquote>
<p><br></p>

</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c68947059310c299--
