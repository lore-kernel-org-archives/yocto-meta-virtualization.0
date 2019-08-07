Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 914BEE00D90; Wed,  7 Aug 2019 05:23:57 -0700 (PDT)
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
	*      [209.85.167.65 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 037EFE00D8C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Aug 2019 05:23:56 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id p197so63840335lfa.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Aug 2019 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UR3uRVNbwP/CjptOyOeXvM4gJwTcJCgYltwvaQ4nG+o=;
	b=ZHZKgjw1K93UOQP4gxB+7TVXEKKfKOQyYuWbmkipuqRz2T8AurIR6MD48CLCSMtx9Q
	K/SM+grwh/j7zFlgEGJYnZQgQErfSMo7pHB8jdRPAhiyN3edC4DLPpac/szTQY3MueVj
	iOyc1zrRC0pnVrlMQ5/6WC95SgFdY8LDdLWS3llgEK1Eqr7TymlVhnUqxognt0ds3N9D
	oOIoqQE1ZtHhhZiUwNeGmghfwUBlYQflKR9t4gCaGJu1WqqPBRi2Y/yqSmhUj8ShTcsN
	1t1k2UST2a0nx7Z2l3aG7PM7Ne5IJv8tC355zg9UVcoFKOhzo6ZcYkFMq50C7kJPLTyv
	nSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UR3uRVNbwP/CjptOyOeXvM4gJwTcJCgYltwvaQ4nG+o=;
	b=t8XDzGhaMyXW1/FnVcRIFD9cyhdyL+iS3t/LLykD98gccHnjIuIBP3SVPnguqB7eSP
	Vuhm/oDjxq6xapkqIRl1jg8WlpO5bKM2YTafV/LbatMa+Ic+nyXCO/o/5RTvYQoMZdNB
	2xv5U/N39aWzIQve/bIgRQ8UQwc3YzcDo6JYoUFCSPddMgwCRp8JvV6DoE0vcyWCV4NI
	soDBF1GqJH/wToJPMHfFjLbkwGqQxIK/On9FcDbVR04UtqHcN+rFbL8QmOktzYIavA2I
	aOLrAA9KCLeCo7xNhCxEaa7QYf4YZ1pmj+9blDEV85QIbJFiLFjE50rBcLdEeSJwsHP/
	8/wA==
X-Gm-Message-State: APjAAAVL80V7AuyaQNafrsOV8+ngXAUXMYLdiEtHn+FDY0+LPLE6TM7Q
	oD41aFdCLpBUrv5RnP4+McSgImMPsHx3OUXDMvY=
X-Google-Smtp-Source: APXvYqwydm363b71PY/6FoL3tZ2NGReIxHJvibAmSICsDyFpEkAnRIMZWaxaqjyFE0zUPv0rsVfFai8WpPPBXI6vkg4=
X-Received: by 2002:a19:491d:: with SMTP id w29mr5800824lfa.149.1565180635110; 
	Wed, 07 Aug 2019 05:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <a1fa73d3-7dcd-b985-b092-5508c0c0de8b@windriver.com>
	<f6562849-276e-2f8a-a347-bb3f4b578265@windriver.com>
In-Reply-To: <f6562849-276e-2f8a-a347-bb3f4b578265@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 09:23:45 -0300
Message-ID: <CADkTA4MAkANWgQ3P7BOmERqV10Cazr1X8GwhGnztq5Uc_=f6KA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: docker used to depend on git
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
X-List-Received-Date: Wed, 07 Aug 2019 12:23:57 -0000
Content-Type: multipart/alternative; boundary="000000000000c3e50f058f86033e"

--000000000000c3e50f058f86033e
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 5:18 AM He Zhe <zhe.he@windriver.com> wrote:

>
>
> On 8/7/19 11:56 AM, He Zhe wrote:
> > Hi Bruce,
> >
> > The package git was added as RDEPENDS of docker
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e8af6127743b0d32e1acecb2e5e165d6e7b7f031
> > and was removed since
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=4b6d33c87f368b22d75c7fea569797e9d852c31f
> > , both without clarification.
> >
> > Is this what we expected?
>
> docker build git://
> may use git
>

I removed it on purpose, since docker build was never something that I
fully supported on target. Hence, adding git as a dependency made docker
bigger then it needed to be.

It could return as a packageconfig dependency, but never should have been
in the defaults.

Bruce



>
> Zhe
>
> >
> > Thanks,
> > Zhe
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

--000000000000c3e50f058f86033e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 7, 2019 at 5:18 AM He Zhe &lt;<a href=
=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/7/19 11:56 AM, He Zhe wrote:<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; The package git was added as RDEPENDS of docker<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizati=
on/commit/?id=3De8af6127743b0d32e1acecb2e5e165d6e7b7f031" rel=3D"noreferrer=
" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtuali=
zation/commit/?id=3De8af6127743b0d32e1acecb2e5e165d6e7b7f031</a><br>
&gt; and was removed since<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizati=
on/commit/?id=3D4b6d33c87f368b22d75c7fea569797e9d852c31f" rel=3D"noreferrer=
" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtuali=
zation/commit/?id=3D4b6d33c87f368b22d75c7fea569797e9d852c31f</a><br>
&gt; , both without clarification.<br>
&gt;<br>
&gt; Is this what we expected?<br>
<br>
docker build git://<br>
may use git<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">I removed it on purpose, since docker build was=
 never something that I fully supported on target. Hence, adding git as a d=
ependency made docker bigger then it needed to be.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">It could return as a packageconfig dependency, bu=
t never should have been in the defaults.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Zhe<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Zhe<br>
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
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c3e50f058f86033e--
