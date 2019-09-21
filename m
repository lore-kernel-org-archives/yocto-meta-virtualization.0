Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1A9BE00A48; Fri, 20 Sep 2019 23:31:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061F2E0098A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 23:31:11 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 827505C00BB;
	Sat, 21 Sep 2019 08:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1569047469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=9h7cPkHP0h6Fp7fZTvOkf/QUYw6f3NjsB6g8Cxrt+g8=;
	b=k45lt9Z7KGBGKn2iASdYhUNogwXMkvt4LEyY+d7PDo3rpyYmbzuGVTTv+FTegZhfSY1bOL
	tYEAHAMsrXYItxcAJBS8QLUW5nB+mDa2XARph4kJFTyYa3Zfq2DWbwSl89SjGhHhf11JOy
	d6vhMs4AQNid2o5nS4RfCsDSU5rMuzQ=
MIME-Version: 1.0
Date: Sat, 21 Sep 2019 08:31:09 +0200
From: Stefan Agner <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4NivDzr5nWBKRWxQvG5oUEN1+60-fMy9RtQRQcxwdj=Fg@mail.gmail.com>
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
	<CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
	<adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
	<CADkTA4OsSD7_THHFuuT4-pu7z3=CY+NuirpTm4wTM0x-1y_3Bw@mail.gmail.com>
	<CADkTA4NivDzr5nWBKRWxQvG5oUEN1+60-fMy9RtQRQcxwdj=Fg@mail.gmail.com>
Message-ID: <e202ad0f7539595bf3a8e04d3298eae3@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
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
X-List-Received-Date: Sat, 21 Sep 2019 06:31:13 -0000
Content-Type: multipart/alternative;
	boundary="=_3bf69e18ab5c801d4d16456d60e7627b"

--=_3bf69e18ab5c801d4d16456d60e7627b
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On 2019-09-21 05:35, Bruce Ashfield wrote:

> On Fri, Sep 20, 2019 at 11:28 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote: 
> 
> On Fri, Sep 20, 2019 at 3:16 AM Stefan Agner <stefan@agner.ch> wrote: On 2019-09-18 19:52, Bruce Ashfield wrote:
>> On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
>>> 
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>> 
>>> Bump the git hashes to Docker CE v19.03.2.
>>> 
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>>> ---
>>> Changes in v2:
>>> - Bump to v19.03.2 final release
>>> - Drop docker (non-ce) recipe patch as that recipe can not be bumped to a
>>> Docker stable patch release
>> 
>> Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
>> for testing.
> 
> Thx. Just FYI, this recipe currently does not build. So it would be nice
> to have this fixed soon. 
> 
> Yup. I've been seeing the issue as well, but the 5.2 kernel intro to oe-core has preempted some things for the last little while.

Actually, I take that back.  

What configuration are you using that the current docker (non-ce) recipe
isn't building ?  

The non-ce recipe builds fine for me too. I was referring to this
(docker-ce) recipe. Patch 1/2 makes it build again. 

Best regards, 
Stefan 

> The build error that I was dealing with was due to my SRCREV bumps and other fixing, but when I do a build of docker on an unmodified master branch, I have no issues. 
> 
> Bruce 
> 
> I have the virtual/docker and moby switch pretty much done, so it'll all be fixed up shortly. 
> 
> Bruce 
> --
> Stefan
> 
>> 
>> Bruce
>> 
>>> 
>>> recipes-containers/docker/docker-ce_git.bb [1] | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/recipes-containers/docker/docker-ce_git.bb [1] b/recipes-containers/docker/docker-ce_git.bb [1]
>>> index 215f114..52b146d 100644
>>> --- a/recipes-containers/docker/docker-ce_git.bb [1]
>>> +++ b/recipes-containers/docker/docker-ce_git.bb [1]
>>> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>>> subtle and/or glaring issues. \
>>> "
>>> 
>>> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
>>> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>>> SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>>> SRC_URI = "\
>>> git://github.com/docker/docker-ce.git;branch=19.03;name=docker [2] \
>>> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>>> 
>>> S = "${WORKDIR}/git"
>>> 
>>> -DOCKER_VERSION = "19.03.0-rc3-ce"
>>> +DOCKER_VERSION = "19.03.2-ce"
>>> PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>>> 
>>> PACKAGES =+ "${PN}-contrib"
>>> --
>>> 2.20.1
>>> 
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

  -- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

 

Links:
------
[1] http://docker-ce_git.bb
[2] http://github.com/docker/docker-ce.git;branch=19.03;name=docker

--=_3bf69e18ab5c801d4d16456d60e7627b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt'>
<p>On 2019-09-21 05:35, Bruce Ashfield wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Sep 20, 2019 at 11:28 PM Bruc=
e Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@g=
mail.com</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size: small;">&nbsp;</div>
</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Sep 20, 2019 at 3:16 AM Stefa=
n Agner &lt;<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrot=
e:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">On 2019-09-18 19:52, Bruce A=
shfield wrote:<br /> &gt; On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner &lt;=
<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br /> &gt=
;&gt;<br /> &gt;&gt; From: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@=
toradex.com">stefan.agner@toradex.com</a>&gt;<br /> &gt;&gt;<br /> &gt;&gt;=
 Bump the git hashes to Docker CE v19.03.2.<br /> &gt;&gt;<br /> &gt;&gt; S=
igned-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com">=
stefan.agner@toradex.com</a>&gt;<br /> &gt;&gt; ---<br /> &gt;&gt; Changes =
in v2:<br /> &gt;&gt; - Bump to v19.03.2 final release<br /> &gt;&gt; - Dro=
p docker (non-ce) recipe patch as that recipe can not be bumped to a<br /> =
&gt;&gt;&nbsp; &nbsp;Docker stable patch release<br /> &gt; <br /> &gt; Ack=
'd. I'll take care of the moby recipe shortly. I've pulled this in<br /> &g=
t; for testing.<br /><br /> Thx. Just FYI, this recipe currently does not b=
uild. So it would be nice<br /> to have this fixed soon.</blockquote>
<div>&nbsp;</div>
<div>
<div style=3D"font-size: small;">Yup. I've been seeing the issue as well, b=
ut the 5.2 kernel intro to oe-core has preempted some things for the last l=
ittle while.</div>
<div style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
</div>
</blockquote>
<div>&nbsp;</div>
<div>
<div class=3D"gmail_default" style=3D"font-size: small;">Actually, I take t=
hat back.&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">What configuration=
 are you using that the current docker (non-ce) recipe isn't building ?&nbs=
p;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
</div>
</blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">The non-ce recipe =
builds fine for me too. I&nbsp;was referring to this (docker-ce) recipe. Pa=
tch 1/2 makes it build again.</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Best regards,</div=
>
<div class=3D"gmail_default" style=3D"font-size: small;">Stefan</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">The build error th=
at I was dealing with was due to my SRCREV bumps and other fixing, but when=
 I do a build of docker on an unmodified master branch, I have no issues.</=
div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Bruce</div>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div style=3D"font-size: small;">&nbsp;</div>
<div style=3D"font-size: small;">I have the virtual/docker and moby switch =
pretty much done, so it'll all be fixed up shortly.</div>
<div style=3D"font-size: small;">&nbsp;</div>
<div style=3D"font-size: small;">Bruce</div>
</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;"><br /> --<br /> Stefan<br />=
<br /> &gt; <br /> &gt; Bruce<br /> &gt; <br /> &gt;&gt;<br /> &gt;&gt;&nbs=
p; recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" target=3D"=
_blank" rel=3D"noopener noreferrer">docker-ce_git.bb</a> | 4 ++--<br /> &gt=
;&gt;&nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)<br /> &gt;&gt;<=
br /> &gt;&gt; diff --git a/recipes-containers/docker/<a href=3D"http://doc=
ker-ce_git.bb" target=3D"_blank" rel=3D"noopener noreferrer">docker-ce_git=
=2Ebb</a> b/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" t=
arget=3D"_blank" rel=3D"noopener noreferrer">docker-ce_git.bb</a><br /> &gt=
;&gt; index 215f114..52b146d 100644<br /> &gt;&gt; --- a/recipes-containers=
/docker/<a href=3D"http://docker-ce_git.bb" target=3D"_blank" rel=3D"noopen=
er noreferrer">docker-ce_git.bb</a><br /> &gt;&gt; +++ b/recipes-containers=
/docker/<a href=3D"http://docker-ce_git.bb" target=3D"_blank" rel=3D"noopen=
er noreferrer">docker-ce_git.bb</a><br /> &gt;&gt; @@ -18,7 +18,7 @@ DESCRI=
PTION =3D "Linux container runtime \<br /> &gt;&gt;&nbsp; &nbsp;subtle and/=
or glaring issues. \<br /> &gt;&gt;&nbsp; &nbsp;"<br /> &gt;&gt;<br /> &gt;=
&gt; -SRCREV_docker =3D "2416d7f930859912c883f964b1cee6909635f951"<br /> &g=
t;&gt; +SRCREV_docker =3D "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"<br /> =
&gt;&gt;&nbsp; SRCREV_libnetwork =3D "5ac07abef4eee176423fdc1b870d435258e2d=
381"<br /> &gt;&gt;&nbsp; SRC_URI =3D "\<br /> &gt;&gt;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;git://<a href=3D"http://github.com/docker/docker-ce.git;branc=
h=3D19.03;name=3Ddocker" target=3D"_blank" rel=3D"noopener noreferrer">gith=
ub.com/docker/docker-ce.git;branch=3D19.03;name=3Ddocker</a> \<br /> &gt;&g=
t; @@ -38,7 +38,7 @@ GO_IMPORT =3D "import"<br /> &gt;&gt;<br /> &gt;&gt;&n=
bsp; S =3D "${WORKDIR}/git"<br /> &gt;&gt;<br /> &gt;&gt; -DOCKER_VERSION =
=3D "19.03.0-rc3-ce"<br /> &gt;&gt; +DOCKER_VERSION =3D "19.03.2-ce"<br /> =
&gt;&gt;&nbsp; PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"<br /> &gt;&gt=
;<br /> &gt;&gt;&nbsp; PACKAGES =3D+ "${PN}-contrib"<br /> &gt;&gt; --<br /=
> &gt;&gt; 2.20.1<br /> &gt;&gt;<br /> &gt;&gt; --<br /> &gt;&gt; _________=
______________________________________<br /> &gt;&gt; meta-virtualization m=
ailing list<br /> &gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproje=
ct.org">meta-virtualization@yoctoproject.org</a><br /> &gt;&gt; <a href=3D"=
https://lists.yoctoproject.org/listinfo/meta-virtualization" target=3D"_bla=
nk" rel=3D"noopener noreferrer">https://lists.yoctoproject.org/listinfo/met=
a-virtualization</a></blockquote>
</div>
<br clear=3D"all" />
<div>&nbsp;</div>
-- <br />
<div class=3D"gmail-m_7264107620680629132gmail_signature" dir=3D"ltr">- Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end<br />- "Use the force Harry" - Gandalf, Star Trek II<br /><br /></div=
>
</div>
</blockquote>
</div>
<br clear=3D"all" />
<div>&nbsp;</div>
-- <br />
<div class=3D"gmail_signature" dir=3D"ltr">- Thou shalt not follow the NULL=
 pointer, for chaos and madness await thee at its end<br />- "Use the force=
 Harry" - Gandalf, Star Trek II<br /><br /></div>
</div>
</blockquote>
<p><br /></p>

</body></html>

--=_3bf69e18ab5c801d4d16456d60e7627b--
