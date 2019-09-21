Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45B02E00AB6; Fri, 20 Sep 2019 20:35:54 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1371CE009CE
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 20:35:52 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id b20so3494076ljj.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 20:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tpbJdCagcfJ3oGBBt0lSWBOJWIxyRhaTEEwhWLKACow=;
	b=ehakLheDCqYfLxfzMFdARSHeCQD5Wkihqpm0AFje8eqX2wGV1YCo1dOiM/pQw4Nwbd
	k2ex9bZhQZfk9M9fususcrBovtn2hcCKixZknW6baeb9JbcASmB3JSjqbMXtXSp95RVL
	tyLj3urnCGJ/dO7Ig3j5uW3n0LqeJVd1zx7XF4w/KF9WTraydg11r6y9uIQGVtIdy2X5
	Udb1T3lyzMcLXPVqML/9t1sAUCLGb+d8bAHh3LAyYOoFI4P26vBC+07pYgnVqTF6t2aC
	xHJP2gCkxCx3zLSLY/e6OP5X/2++YGEkwnJC9BUZ2Ha59UE4BU7Uq1TJdfKCyl113kw6
	/IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tpbJdCagcfJ3oGBBt0lSWBOJWIxyRhaTEEwhWLKACow=;
	b=A2T+bzaQkOHOjYJl7Ly7AgG3ovcaE5ixwEkf+mDPFDBZsb+BVj7E2ZQ7yhoUgIRyVF
	Vga4EqK/0VIkcThtZ3fQqyozSe8h//UCDQ2vVEptYR8ZBGS7RBfOYs4hW0fS7GEyuPh1
	6pnN7ckHahn0B+yl4SCUtNGARdEfYgC8M2RnIuzlRUhPA5xwz/+UPNtNBpA+IPQqRQFS
	AglbwdfT5dUPom/GefT7gJZ5zfmHK9li6uaBHKCnxqRtioGkU1/2VJXp44p6cAUFWznm
	GChT3gfgXP4zqyWmzTugxximr49PZVjWjwo04SaW/W3fPIcZdvGdnfVQa95+BU1CTTN8
	3TjQ==
X-Gm-Message-State: APjAAAVvDUwjUg75PA74i/nSHz7M7exgc95sBAdrk6/1fffAPP4YRW0T
	VlRoPWj6gHYZgag83Ix0QPHydnKfQxgfmpriIU8PXdwCjtM=
X-Google-Smtp-Source: APXvYqylFUw9L3XoXn9v5PqYA+qsPVVO15JB+WH3SM0qrJ8gda7dSfJ4od1p2bkVDoWsszpQ1+AxFIgcNXorTOw9ARE=
X-Received: by 2002:a2e:9a45:: with SMTP id k5mr10719573ljj.87.1569036951855; 
	Fri, 20 Sep 2019 20:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
	<CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
	<adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
	<CADkTA4OsSD7_THHFuuT4-pu7z3=CY+NuirpTm4wTM0x-1y_3Bw@mail.gmail.com>
In-Reply-To: <CADkTA4OsSD7_THHFuuT4-pu7z3=CY+NuirpTm4wTM0x-1y_3Bw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Sep 2019 23:35:40 -0400
Message-ID: <CADkTA4NivDzr5nWBKRWxQvG5oUEN1+60-fMy9RtQRQcxwdj=Fg@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Sep 2019 03:35:54 -0000
Content-Type: multipart/alternative; boundary="00000000000027a617059307e263"

--00000000000027a617059307e263
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 20, 2019 at 11:28 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Sep 20, 2019 at 3:16 AM Stefan Agner <stefan@agner.ch> wrote:
>
>> On 2019-09-18 19:52, Bruce Ashfield wrote:
>> > On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
>> >>
>> >> From: Stefan Agner <stefan.agner@toradex.com>
>> >>
>> >> Bump the git hashes to Docker CE v19.03.2.
>> >>
>> >> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> >> ---
>> >> Changes in v2:
>> >> - Bump to v19.03.2 final release
>> >> - Drop docker (non-ce) recipe patch as that recipe can not be bumped
>> to a
>> >>   Docker stable patch release
>> >
>> > Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
>> > for testing.
>>
>> Thx. Just FYI, this recipe currently does not build. So it would be nice
>> to have this fixed soon.
>>
>
> Yup. I've been seeing the issue as well, but the 5.2 kernel intro to
> oe-core has preempted some things for the last little while.
>
>
Actually, I take that back.

What configuration are you using that the current docker (non-ce) recipe
isn't building ?

The build error that I was dealing with was due to my SRCREV bumps and
other fixing, but when I do a build of docker on an unmodified master
branch, I have no issues.

Bruce



> I have the virtual/docker and moby switch pretty much done, so it'll all
> be fixed up shortly.
>
> Bruce
>
>
>
>>
>> --
>> Stefan
>>
>> >
>> > Bruce
>> >
>> >>
>> >>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/recipes-containers/docker/docker-ce_git.bb
>> b/recipes-containers/docker/docker-ce_git.bb
>> >> index 215f114..52b146d 100644
>> >> --- a/recipes-containers/docker/docker-ce_git.bb
>> >> +++ b/recipes-containers/docker/docker-ce_git.bb
>> >> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>> >>   subtle and/or glaring issues. \
>> >>   "
>> >>
>> >> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
>> >> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>> >>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>> >>  SRC_URI = "\
>> >>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker
>> \
>> >> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>> >>
>> >>  S = "${WORKDIR}/git"
>> >>
>> >> -DOCKER_VERSION = "19.03.0-rc3-ce"
>> >> +DOCKER_VERSION = "19.03.2-ce"
>> >>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>> >>
>> >>  PACKAGES =+ "${PN}-contrib"
>> >> --
>> >> 2.20.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> meta-virtualization mailing list
>> >> meta-virtualization@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000027a617059307e263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 20, 2019 at 11:28 PM Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Sep 20, 2019 at 3:16 AM Stefan Agner &lt;<a href=3D"mailto:stefan@agner.c=
h" target=3D"_blank">stefan@agner.ch</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 2019-09-18 19:52, Bruce Ashfield wro=
te:<br>
&gt; On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner &lt;<a href=3D"mailto:ste=
fan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com"=
 target=3D"_blank">stefan.agner@toradex.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bump the git hashes to Docker CE v19.03.2.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@tor=
adex.com" target=3D"_blank">stefan.agner@toradex.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Bump to v19.03.2 final release<br>
&gt;&gt; - Drop docker (non-ce) recipe patch as that recipe can not be bump=
ed to a<br>
&gt;&gt;=C2=A0 =C2=A0Docker stable patch release<br>
&gt; <br>
&gt; Ack&#39;d. I&#39;ll take care of the moby recipe shortly. I&#39;ve pul=
led this in<br>
&gt; for testing.<br>
<br>
Thx. Just FYI, this recipe currently does not build. So it would be nice<br=
>
to have this fixed soon.<br></blockquote><div><br></div><div><div style=3D"=
font-size:small">Yup. I&#39;ve been seeing the issue as well, but the 5.2 k=
ernel intro to oe-core has preempted some things for the last little while.=
</div><div style=3D"font-size:small"><br></div></div></div></div></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Actually, I take that back.=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">What configuration are you using that the current docker (non-c=
e) recipe isn&#39;t building ?=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">The build error that I was dealing with was due to my SRCREV bu=
mps and other fixing, but when I do a build of docker on an unmodified mast=
er branch, I have no issues.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div styl=
e=3D"font-size:small"></div><div style=3D"font-size:small">I have the virtu=
al/docker and moby switch pretty much done, so it&#39;ll all be fixed up sh=
ortly.</div><div style=3D"font-size:small"><br></div><div style=3D"font-siz=
e:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
--<br>
Stefan<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 recipes-containers/docker/<a href=3D"http://docker-ce_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a> | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/docker/<a href=3D"http://docker-ce=
_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a> b/recipe=
s-containers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"noreferrer" =
target=3D"_blank">docker-ce_git.bb</a><br>
&gt;&gt; index 215f114..52b146d 100644<br>
&gt;&gt; --- a/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
&gt;&gt; +++ b/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
&gt;&gt; @@ -18,7 +18,7 @@ DESCRIPTION =3D &quot;Linux container runtime \<=
br>
&gt;&gt;=C2=A0 =C2=A0subtle and/or glaring issues. \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV_docker =3D &quot;2416d7f930859912c883f964b1cee6909635f951&=
quot;<br>
&gt;&gt; +SRCREV_docker =3D &quot;6a30dfca03664a0b6bf0646a7d389ee7d0318e6e&=
quot;<br>
&gt;&gt;=C2=A0 SRCREV_libnetwork =3D &quot;5ac07abef4eee176423fdc1b870d4352=
58e2d381&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/docker/docker-ce.git;branch=3D19.03;name=3Ddocker" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/docker/docker-ce.git;branch=3D19.03;name=3Ddocker=
</a> \<br>
&gt;&gt; @@ -38,7 +38,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;<br>
&gt;&gt; -DOCKER_VERSION =3D &quot;19.03.0-rc3-ce&quot;<br>
&gt;&gt; +DOCKER_VERSION =3D &quot;19.03.2-ce&quot;<br>
&gt;&gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_docker}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-contrib&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"=
_blank">meta-virtualization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/l=
istinfo/meta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_7264107620680629132gmail_signature">- Thou shalt not foll=
ow the NULL pointer, for chaos and madness await thee at its end<br>- &quot=
;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000027a617059307e263--
