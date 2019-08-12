Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1F06E00E0E; Mon, 12 Aug 2019 08:01:07 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88CD8E00D8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:00:56 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 62so69553334lfa.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rATI17S2ehJTtZFAWvBulKSWWO8hzRQ+2eQ3DsLLeQc=;
	b=ny8b0BqkyWts06QM6dqBQvDQDO7lYVnt9GBORo2YqTPZFgDdzqtuXsU6IEsBOyNX5y
	CAQpM88etQy08ACMYEiFYErIYnTXZozp2bLEjUGl9dY06vUAwTVDGSf7FyVo0M7nIP52
	DM1YgLQcseSG/kvWD+6ljc/+tT6nSUfQMnvh9n54R1ua9NY/R8f8d5CISll1cBVpaYmf
	/9zHWHmRG6tYWm9RVP+slrsnyZDTHEZ92xsJg9Zrk2qgmc6DpzBAvyLAU4uloi5XQK9p
	f1Zir8DKfDiOYrvma+RTZ6ze1NJrDAR6afoYGFxmcVklumYbFeOHWB3hD0AqNvmCX2+Y
	sFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rATI17S2ehJTtZFAWvBulKSWWO8hzRQ+2eQ3DsLLeQc=;
	b=kq3vthtNAkkzP3meW28mRI2Us3zCIF0/MSzFd0quhsX6R+QFd88gV3+z8i1mImyMfi
	W4hEZAN1Bsg7Ip5Mh/OGkaI0JR3Dadkx+tp71xBY+31TnOWUR6BIB/b/WuDblVFOuEKn
	TYG/188WHkLHJET/zZ8mfv+b5Q1owVUStsS6BuzUMRMwyRe8fqIGhKZiWL1oLh6i30uu
	qh9bLofuexsUdztdNPJqahNcOrF5jtISZesL33BABSmRAtKgB5RfYRfW6xQMKrXB/O15
	jRh/go2IYHfoqyXpB2c0S9EIaygNgJOk37kaUCTemmzwk1g76+T8Aeaqt6XXlkRS/KxX
	7gjA==
X-Gm-Message-State: APjAAAXicSsSHVoAvvSAU09LstJLxbqzqFnoajGJDbS0chFJGIMJf5wr
	axq4zTEeKySPqY2wZSnIsVHAiOP5QSmWaOW3mrg=
X-Google-Smtp-Source: APXvYqx+w+okixQYke7Rnt+ayFYSyadaiq1CUlGEwVI1/04wbhk8xXWkZZENKq+BHx+j2awru3IYans4/HjEKoSx84g=
X-Received: by 2002:a19:f24e:: with SMTP id d14mr21077300lfk.184.1565622055387;
	Mon, 12 Aug 2019 08:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190809025801.24125-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190809025801.24125-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:00:43 -0400
Message-ID: <CADkTA4ODLEJD5xJiVvF=AzeC0iS=caWi7HyGiL44ZFBOqKe0yA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-manilaclient: upgrade 1.4.0 -> 1.27.0
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
X-List-Received-Date: Mon, 12 Aug 2019 15:01:07 -0000
Content-Type: multipart/alternative; boundary="00000000000076c6a2058fecca81"

--00000000000076c6a2058fecca81
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 8, 2019 at 10:58 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-manilaclient_git.bb | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/
> python-manilaclient_git.bb
> index d547717..f733d56 100644
> --- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> @@ -33,8 +33,8 @@ RDEPENDS_${PN} +=" \
>  SRCNAME = "manilaclient"
>  SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master
> <http://github.com/openstack/$%7BBPN%7D.git;branch=master>"
>
> -PV = "1.4.0+git${SRCPV}"
> -SRCREV = "0bbd2144f701df3408b1435b16611c2ba3c22221"
> +PV = "1.27.0+git${SRCPV}"
> +SRCREV = "07564879ae4bdcb73e856b3aedcb79e4420fa7eb"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools rmargparse
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000076c6a2058fecca81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Au=
g 8, 2019 at 10:58 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=
=3D"mailto:zangrc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-devtools/python/<a href=3D"http://python-manil=
aclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-manilaclient_gi=
t.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-manilacl=
ient_git.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python-manilaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-man=
ilaclient_git.bb</a><br>
index d547717..f733d56 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-manil=
aclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-manilaclient_gi=
t.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-manil=
aclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-manilaclient_gi=
t.bb</a><br>
@@ -33,8 +33,8 @@ RDEPENDS_${PN} +=3D&quot; \<br>
=C2=A0SRCNAME =3D &quot;manilaclient&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/openstack/$%7BBP=
N%7D.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/o=
penstack/${BPN}.git;branch=3Dmaster</a>&quot;<br>
<br>
-PV =3D &quot;1.4.0+git${SRCPV}&quot;<br>
-SRCREV =3D &quot;0bbd2144f701df3408b1435b16611c2ba3c22221&quot;<br>
+PV =3D &quot;1.27.0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;07564879ae4bdcb73e856b3aedcb79e4420fa7eb&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit setuptools rmargparse<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000076c6a2058fecca81--
