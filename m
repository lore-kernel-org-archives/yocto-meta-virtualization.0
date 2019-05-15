Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AE53E00D5F; Wed, 15 May 2019 07:22:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48475E00CAB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 07:22:45 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id 14so1243186ljj.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hXk9YECrH1wRZGYFcq7uQRE9h1K/o52GnwMf0bdMj4g=;
	b=iH/QjyWP2brkkud6m4Xl+enHpAjVbfvMfbSx3yDt7O9Gt6vtpTOImS00xwDMWVN1Xp
	YhZpcFjCLs/GxN9EZArVYh3aH3AAE9ORmUglmD47hdd0bhSDs5tt/Yr4TuHMeA9g8wDv
	OKPgEvoTpkogwczVwMHZLAPT2P3Rz3XB0mt9aTx+AiR/3wV7jFqHge6j+GIlYh2upMJm
	8yzhqvn2ZcKeBbbTFZsRSfVJkn4tCT7gDbyGkXQZQbCKzoAfn3FCFgU2Q+nm69eFKIgb
	hLTs++plfOwmj8j2BrwrDspPVe4mvl7GFiemCVt2GMoF3bTU/yNAg3vy6UtUkCNGBGr0
	wi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hXk9YECrH1wRZGYFcq7uQRE9h1K/o52GnwMf0bdMj4g=;
	b=DzP+FUI9UWRAZLfNHdP/astW7gBO8dMmxq5gH+lquuKuCCrSY0fy6NIdCW9VKm9Xrc
	OtLphWltpqJDunUQ+4kyY7tT76LMvHSP7DZt1jpmlScBPG5WJDaQjRlsVPJfqxPl3XRR
	2HSR9akfQC6CtyxwqsEIgRn/aVrjDO/a6f6ZBYQRJitt6Q7PPmSdqIp82snYJy3w4D0U
	TpILi6vS5ga4E3Wsu3c03zeKDX0bsg89w+aOKca+dO7Se2rLWZFIj7K8XfoDW2IlQwha
	0gVPliv7Ym03+KxUovN/s/NqjB84eJ+5l/oJp3/7vvNv6s08djyWimKHqM2pG5QSSFmL
	JwFw==
X-Gm-Message-State: APjAAAXgKWMLgxBRQaNgbxVqP+j/x8CeBneqyxJPQyv2wJzLV/qHzbPN
	pjffYz2IOpj3brTmsi9U4F4jYURPYwf2G48kqFk=
X-Google-Smtp-Source: APXvYqwUEa5j7/tb+fHgklJ1EIWPHO+BuLjVtA5/HDKbK8l/OqDYLNZxTuhQ9W6bxhUNfEbNn+jtiL03au9v3Ehotys=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr22471832ljy.109.1557930164051;
	Wed, 15 May 2019 07:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAOx=Z6EgeB7_yxozw-spZaXhL0j3O8xoRyWF3auQCdA-aP=Kxw@mail.gmail.com>
	<f03fb341-7245-5563-58a2-7f44d48126f3@windriver.com>
In-Reply-To: <f03fb341-7245-5563-58a2-7f44d48126f3@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 May 2019 10:22:33 -0400
Message-ID: <CADkTA4MnJQaTQ6z1TWh3VF9_BGNB1V-y6a4w7Y_EH0sgFhrsEw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Does the meta-virtualization layer support building kvm on aarch64 archiecture?
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
X-List-Received-Date: Wed, 15 May 2019 14:22:46 -0000
Content-Type: multipart/alternative; boundary="0000000000000361c40588ede26b"

--0000000000000361c40588ede26b
Content-Type: text/plain; charset="UTF-8"

On Wed, May 15, 2019 at 6:24 AM Mark Hatle <mark.hatle@windriver.com> wrote:

> On 5/15/19 12:21 PM, Peter Smith wrote:
> > I have been experimenting with using kvm on aarch64 based SoC's and after
> > studying the contents of the meta-virtualization layer I came to the
> conclusion
> > (maybe wrongly) that the layer does not provide full support for
> building a kvm
> > kernel on aarch64.
>
> I know people have done this in the past.  So unless Bruce or someone says
> it's
> specifically not designed to do that.  I would expect it should work, and
> if it
> doesn't...
>

That's correct. The layer is designed to support aarch64 virtualization
(and definitely containers), but chances are that a lot of that aarch64
virtualization is currently using Xen. So depending on what you are
building, it may be a less tested path.



>
> > For example the enabling kernel configurations appear to currently be
> incorrect.
>
> ...this sounds like a bug.  So if you have ideas how to resolve it, then
> please
> bring them up to the list.  (Even better if you have a patch.)
>
>
Agreed. I only just got a platform that should be capable of running 64 bit
ARM virtualization, so bug reports and patches would be great.



> > I would appreciate it if someone with greater knowledge than me could
> put me
> > straight.
>
> meta-virtualization is intended to be a general purpose virtualization
> enabling
> layer.  It is used pretty heavily on IA machines, just because a lot of
> virtualization is being done on that architecture.  But as long as the
> architecture itself supports the virtualization aspects, I'm not aware of
> any
> reason that fixes for those architectures wouldn't be allowed.
>

Confirmed. They are allowed, and may just need some tweaking. IF something
isn't allowed, we've masked the recipe and you'll get a clear error message
about the lack of support.

Bruce



>
> --Mark
>
> >
> > Thanks in advance.
> > Peter
> >
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

--0000000000000361c40588ede26b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 15, 2019 at 6:24 AM Mark Hatle &lt;<a h=
ref=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/15/19 =
12:21 PM, Peter Smith wrote:<br>
&gt; I have been experimenting with using kvm on aarch64 based SoC&#39;s an=
d after<br>
&gt; studying the contents of the meta-virtualization layer I came to the c=
onclusion<br>
&gt; (maybe wrongly) that the layer does not provide full support for build=
ing a kvm<br>
&gt; kernel on aarch64.<br>
<br>
I know people have done this in the past.=C2=A0 So unless Bruce or someone =
says it&#39;s<br>
specifically not designed to do that.=C2=A0 I would expect it should work, =
and if it<br>
doesn&#39;t...<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">That&#39;s correct. The layer is designed to=
 support aarch64 virtualization (and definitely containers), but chances ar=
e that a lot of that aarch64 virtualization is currently using Xen. So depe=
nding on what you are building, it may be a less tested path.</div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; For example the enabling kernel configurations appear to currently be =
incorrect.<br>
<br>
...this sounds like a bug.=C2=A0 So if you have ideas how to resolve it, th=
en please<br>
bring them up to the list.=C2=A0 (Even better if you have a patch.)<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Agreed. I only just got a platform that should be capable =
of running 64 bit ARM virtualization, so bug reports and patches would be g=
reat.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt; I would appreciate it if someone with greater knowledge than me could =
put me<br>
&gt; straight.=C2=A0<br>
<br>
meta-virtualization is intended to be a general purpose virtualization enab=
ling<br>
layer.=C2=A0 It is used pretty heavily on IA machines, just because a lot o=
f<br>
virtualization is being done on that architecture.=C2=A0 But as long as the=
<br>
architecture itself supports the virtualization aspects, I&#39;m not aware =
of any<br>
reason that fixes for those architectures wouldn&#39;t be allowed.<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">Confirmed. They are allowed, and may just need some tweaking. IF so=
mething isn&#39;t allowed, we&#39;ve masked the recipe and you&#39;ll get a=
 clear error message about the lack of support.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
--Mark<br>
<br>
&gt; <br>
&gt; Thanks in advance.<br>
&gt; Peter<br>
&gt; <br>
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

--0000000000000361c40588ede26b--
