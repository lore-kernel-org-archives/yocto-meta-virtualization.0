Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1376E00AB6; Fri, 20 Sep 2019 20:28:30 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D6FCE0098A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 20:28:29 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id y23so8846517lje.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O3XlNlp4EDgnd95Azj1HDd/2BQS6st3Y5OUw5KU1PEs=;
	b=hW7ag/Lq6A3zy2UL5QWNsc8vzsLxWEHeFpGwakDYWlIWFGw44CKoS8IkdMyt/vmpIq
	oLy8yP6xsc6YEOeq50U0zOobPLG0CHuV4xVplGs1pXIrl5PEVG5BImJMTCBHJJhL0oEs
	tT7bnLewxXDSvYZlvlhfQ6dKeqganKF7kyonLvwtLB2toPehQnD+NEnumTkT7CMo7QvJ
	o432h/5SAZQ2ZEyKRbpikidSXGK+oTuGtGQ/+xQEcUH2mhQqxfsIIYg3budMDyPK0goh
	1CrETJWf10/i2ln2wed98ecpBqF6Havr4B5EZNHxJGcqbb9Bwz/bXXe9PKzi4qyHqB9w
	T+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O3XlNlp4EDgnd95Azj1HDd/2BQS6st3Y5OUw5KU1PEs=;
	b=mg1weGZqjusRkTDvrB7TqUlXEvkhE91Fit9dLreuhKhAxTqJY+oYKY/kh12aSMUhPR
	g7KOJDlaZGbUkHw6SffWg0rfIzDmmV9v3d8N+qMXj56osOnr38X1lXWWhB6mdB6ux1N8
	dXY8XnIukbbbIALlTdqNSj/Auzr6DtotHbes5Q5g92rYeNOl1d6km8uTqHlc+f/pJKk3
	5zatNf5C15W2Od2ZHer4EANzRdKBPChLPwJiBOOpQEl35kGswSsHR3/tnGZsHA6uDKP9
	gJNASjeaX0W+MQkAs91TqxYQ5VLA3tEB/nUnF5t7oqDCO5qSHnegm0sC9y+Gtt7aDNeS
	5y1A==
X-Gm-Message-State: APjAAAWwSkQLv2U45mWkYFezMk5k/VSVh76Tz+etA64nMMdUgpBHKk2x
	MmA+dd5M+EDzs/hFmNpUUTxOj87ReWHwDoPddjKuYWCtbag=
X-Google-Smtp-Source: APXvYqw5wt1Aqui6w0Mxz8KZQQYUNDyqJmLBiSu0nuaLscjHdE17i918/lpfdwEJWUSJYnOEt6Lyqiotciu5bTV6nPQ=
X-Received: by 2002:a2e:9a45:: with SMTP id k5mr10708092ljj.87.1569036508057; 
	Fri, 20 Sep 2019 20:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190918075841.2099-1-stefan@agner.ch>
	<20190918075841.2099-2-stefan@agner.ch>
	<CADkTA4M5cj=8XOjP=nri6Sec8nP1xY-zmcvaE92rUyS__PWkCg@mail.gmail.com>
	<adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
In-Reply-To: <adb2efc6a91bdc474164ba7b53a97f9b@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Sep 2019 23:28:16 -0400
Message-ID: <CADkTA4OsSD7_THHFuuT4-pu7z3=CY+NuirpTm4wTM0x-1y_3Bw@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Sep 2019 03:28:30 -0000
Content-Type: multipart/alternative; boundary="000000000000b3d322059307c737"

--000000000000b3d322059307c737
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 20, 2019 at 3:16 AM Stefan Agner <stefan@agner.ch> wrote:

> On 2019-09-18 19:52, Bruce Ashfield wrote:
> > On Wed, Sep 18, 2019 at 3:59 AM Stefan Agner <stefan@agner.ch> wrote:
> >>
> >> From: Stefan Agner <stefan.agner@toradex.com>
> >>
> >> Bump the git hashes to Docker CE v19.03.2.
> >>
> >> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> >> ---
> >> Changes in v2:
> >> - Bump to v19.03.2 final release
> >> - Drop docker (non-ce) recipe patch as that recipe can not be bumped to
> a
> >>   Docker stable patch release
> >
> > Ack'd. I'll take care of the moby recipe shortly. I've pulled this in
> > for testing.
>
> Thx. Just FYI, this recipe currently does not build. So it would be nice
> to have this fixed soon.
>

Yup. I've been seeing the issue as well, but the 5.2 kernel intro to
oe-core has preempted some things for the last little while.

I have the virtual/docker and moby switch pretty much done, so it'll all be
fixed up shortly.

Bruce



>
> --
> Stefan
>
> >
> > Bruce
> >
> >>
> >>  recipes-containers/docker/docker-ce_git.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/recipes-containers/docker/docker-ce_git.bb
> b/recipes-containers/docker/docker-ce_git.bb
> >> index 215f114..52b146d 100644
> >> --- a/recipes-containers/docker/docker-ce_git.bb
> >> +++ b/recipes-containers/docker/docker-ce_git.bb
> >> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
> >>   subtle and/or glaring issues. \
> >>   "
> >>
> >> -SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
> >> +SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
> >>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
> >>  SRC_URI = "\
> >>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker
> \
> >> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
> >>
> >>  S = "${WORKDIR}/git"
> >>
> >> -DOCKER_VERSION = "19.03.0-rc3-ce"
> >> +DOCKER_VERSION = "19.03.2-ce"
> >>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
> >>
> >>  PACKAGES =+ "${PN}-contrib"
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b3d322059307c737
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 20, 2019 at 3:16 AM Stefan Agner &lt;<a=
 href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 2019-09-18 19:52, Bruce =
Ashfield wrote:<br>
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
to have this fixed soon.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Yup. I&#39;ve been seeing the issu=
e as well, but the 5.2 kernel intro to oe-core has preempted some things fo=
r the last little while.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
I have the virtual/docker and moby switch pretty much done, so it&#39;ll al=
l be fixed up shortly.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000b3d322059307c737--
