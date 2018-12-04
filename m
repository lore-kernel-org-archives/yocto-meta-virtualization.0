Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4A5FE00C75; Tue,  4 Dec 2018 15:16:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.54 listed in list.dnswl.org]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED790E00C4E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Dec 2018 15:16:52 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id v5so13278436lfe.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 04 Dec 2018 15:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LaS/AR4gNtWbuPQwMWXsawRSlF5PC5VC7Za+NfoUwdQ=;
	b=httD59uFfLlIl70pIdNjZ2FvDVEinxZDvqicwRBvQBvwlrcPYsWa0SOdWx602/dOMz
	+4A0fbB78hr075dQdX/ENDCc3NztvxTKWMi1aqTvBIGBBzkI6mpMjjgfAOpoKTihBmVz
	DbFQqlbq6CZJ4bj+t+DZP1udwqC0lQf8/hP3ftWSTBSInw2oAEkAH56pzCTwd54BoRnN
	cTvsZwkzuhQokcFYDvQ0LXVYyy3vMr2dfAzfPgOuzY7vdSmYU5L3USd92I7vJqtraeZ4
	TH3gtsanE9nG3bsnjPE6DRnwtBcHBE4FgVkIs8U89I6ufaEOjnXECVqy91MUg97psVMf
	g8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LaS/AR4gNtWbuPQwMWXsawRSlF5PC5VC7Za+NfoUwdQ=;
	b=pCHhsCX3UwbVGmREiuvF4xi2uEM9oeTOogpnaG6XtzXNgFNxmUVXdbBQGeKSj02cdd
	Ih+fytWy+2z+kdOXjMIJ29FEwFje+J8INvlbz1CPRsI8+PvVRr3s+9lJm85ZmmPjItLZ
	+kZOXgULSnxjRBQr/fVixnLxni/NX/HhQLBDWJNAM/a9obxZ9XOykkgrMqHEzZvpt7GA
	nB5ibPv5Eg550d5bgxErzC4hYOkEIyjff7oLkJDDMYx4U+Xvrc4eOIPGfLSSi4mSOkCp
	NbMi96hjOK9gR8CJobFGRwo3gKDiE7OljF4aV73bGGumFrV7kXFwW8tmUZjRPVnj9pmq
	c5MQ==
X-Gm-Message-State: AA+aEWbgnQf65nPLlkBsI8R/Zup2JIhxD7g7hYXRX1HRWrPZTKA2AGH7
	aLgrJoJNCzC72XYgnG+V3UMJ8Eh6vRxnxhn40+A=
X-Google-Smtp-Source: AFSGD/VG+6DAjzimWKxZVRUzv6qlmGr2DUNuGeLEUDolg37LmK6TWuwrtzEVkkQniP86GOu5jZqpD3XFuh9myvC16EA=
X-Received: by 2002:ac2:41cb:: with SMTP id d11mr13595262lfi.3.1543965411692; 
	Tue, 04 Dec 2018 15:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20181129201401.25972-1-tyu@cisco.com>
In-Reply-To: <20181129201401.25972-1-tyu@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Dec 2018 18:16:38 -0500
Message-ID: <CADkTA4Pr34NL=UW1_kdHWm8BYMDVVxMn5fcjjcWuvSRJGSQrZQ@mail.gmail.com>
To: tyu@cisco.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Add pidfile flag to store dockerd PID in /var/run/dockerd.pid
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
X-List-Received-Date: Tue, 04 Dec 2018 23:16:53 -0000
Content-Type: multipart/alternative; boundary="000000000000e8d5dc057c3a75f5"

--000000000000e8d5dc057c3a75f5
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Nov 29, 2018 at 3:15 PM Ting Yu <tyu@cisco.com> wrote:

> ---
>  recipes-containers/docker/files/docker.init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/files/docker.init
> b/recipes-containers/docker/files/docker.init
> index 0aea8d0..b37ddc9 100644
> --- a/recipes-containers/docker/files/docker.init
> +++ b/recipes-containers/docker/files/docker.init
> @@ -28,7 +28,7 @@ exec="/usr/bin/$prog"
>  pidfile="/var/run/$prog.pid"
>  lockfile="/var/lock/subsys/$prog"
>  logfile="/var/log/$prog"
> -other_args="--registry-mirror=http://localhost:5000 --insecure-registry=
> http://localhost:5000 --raw-logs"
> +other_args="--pidfile $pidfile --registry-mirror=http://localhost:5000
> --insecure-registry=http://localhost:5000 --raw-logs"
>
>  [ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
>
> --
> 2.19.1
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

--000000000000e8d5dc057c3a75f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 29, 2018 at 3:1=
5 PM Ting Yu &lt;<a href=3D"mailto:tyu@cisco.com">tyu@cisco.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0recipes-containers/docker/files/docker.init | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/docker/files/docker.init b/recipes-containe=
rs/docker/files/docker.init<br>
index 0aea8d0..b37ddc9 100644<br>
--- a/recipes-containers/docker/files/docker.init<br>
+++ b/recipes-containers/docker/files/docker.init<br>
@@ -28,7 +28,7 @@ exec=3D&quot;/usr/bin/$prog&quot;<br>
=C2=A0pidfile=3D&quot;/var/run/$prog.pid&quot;<br>
=C2=A0lockfile=3D&quot;/var/lock/subsys/$prog&quot;<br>
=C2=A0logfile=3D&quot;/var/log/$prog&quot;<br>
-other_args=3D&quot;--registry-mirror=3D<a href=3D"http://localhost:5000" r=
el=3D"noreferrer" target=3D"_blank">http://localhost:5000</a> --insecure-re=
gistry=3D<a href=3D"http://localhost:5000" rel=3D"noreferrer" target=3D"_bl=
ank">http://localhost:5000</a> --raw-logs&quot;<br>
+other_args=3D&quot;--pidfile $pidfile --registry-mirror=3D<a href=3D"http:=
//localhost:5000" rel=3D"noreferrer" target=3D"_blank">http://localhost:500=
0</a> --insecure-registry=3D<a href=3D"http://localhost:5000" rel=3D"norefe=
rrer" target=3D"_blank">http://localhost:5000</a> --raw-logs&quot;<br>
<br>
=C2=A0[ -e /etc/sysconfig/$prog ] &amp;&amp; . /etc/sysconfig/$prog<br>
<br>
-- <br>
2.19.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">- Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, =
Star Trek II<br><br></div>

--000000000000e8d5dc057c3a75f5--
