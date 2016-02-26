Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01AECE00DA6; Fri, 26 Feb 2016 09:28:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URIBL_BLACK autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.44 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: cardoe.com]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BAD6E00D90
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Feb 2016 09:28:03 -0800 (PST)
Received: by mail-vk0-f44.google.com with SMTP id c3so83414750vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Feb 2016 09:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=+iGSF6aPTUrpeTEmJN5gecneqdPtQkYVd2W5a4KYADU=;
	b=PKHNwaaCC4/MKgS7gR5wUI6YKRHKitxayBza+SeWnQT9uCjviDiSe+xlwI2nY32/UE
	1d/7htMMkfPZJ5AVrd9ta2/QzygqDBFeuInnkBsWu2y7tcqhRN22ee5sPNLs7HmcHl1H
	wWCC4K/KRr3kQrVTP6B+YyQ3R3F5j01AxNjEwOv+US6LtbrPnQN4TpvatVFLxvr6scEB
	R2fAp0tY7n0FCHWI+5mmCy3oPmAwMISYRKYRN8xT6SCoRvfhzUfmRTMkK9KLT8v5k87s
	+Yf8LUNNAx4i6nOZdjjcZCHQDCv37GN6Rn2W0Wnu3DbGNCQ1YHP0jPVhqwhWNXn/uGiE
	ZUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=+iGSF6aPTUrpeTEmJN5gecneqdPtQkYVd2W5a4KYADU=;
	b=dQIcScZoq30yhx+svwOpXaCb0+x3WCrc2TojD+JWBZKf9d/aSj1D8M1MrQa7YT6Mme
	XiAAXPSZxiOOViv/i+Fd14YWOuVm3kQsFj0D0nBVlC5OgaOC/Vau6RUH7yu9M6TdaPuy
	nM4j14ue/M/0g5gQtxhD9wL/pTP7plf6lk1MwVi2mF8Mw+DVaJ8pFEVswTS0gIxS0VK8
	Z1SdaU1jbb4tNF/9h22nqBUiodvwXFU+xqjAg1o/6sea6DgC/R4MkLgCXgh58ZJxfx+T
	zTtWWB+ePjHYaO32XDbxc2M56Tvdf4Nshh6Kbsl8vak/oURwUHfoY/t2UILUHTAtSUOI
	25Qg==
X-Gm-Message-State: AD7BkJKj1wUb7Ew+8pHK9STQy20OzQykWkAjupTqdTF3UpLGHaP4lFluvNbIPIkD70J3f+dBBnlO/ybI9MSpMg==
MIME-Version: 1.0
X-Received: by 10.31.167.195 with SMTP id q186mr2041787vke.113.1456507682634; 
	Fri, 26 Feb 2016 09:28:02 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Fri, 26 Feb 2016 09:28:02 -0800 (PST)
In-Reply-To: <56CFBF77.5050700@cardoe.com>
References: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
	<CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
	<CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
	<56CFBF77.5050700@cardoe.com>
Date: Fri, 26 Feb 2016 12:28:02 -0500
Message-ID: <CADkTA4PXCzzo=irtKjf6aRrVwxw5TLi41U35hoC=sK924g72KA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: fix ordering of stubs task
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
X-List-Received-Date: Fri, 26 Feb 2016 17:28:05 -0000
Content-Type: multipart/alternative; boundary=001a11425fba093ffb052caf9f81

--001a11425fba093ffb052caf9f81
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 9:59 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 2/24/16 10:04 AM, Bruce Ashfield wrote:
> > Someone was pinging me about cherry-picking a patch to Jethro, but I
> can't
> > find any trace of that email any more.
> >
> > I can't even remember 100% who it was, but this patch rings a bell.
> >
> > Does anyone know of this, or other Xen patches that should also be
> > pulled into
> > the jethro branch ?
> >
> > Bruce
>
> Bruce,
>
> They likely pinged you off list because they dropped me a note and I
> told them to ask you to backport this. As far as I'm aware this is the
> only fix needed and its necessary into jethro and master.
>

Great. No worries about pinging me, whatever way works, I just read the
email
filed it .. and then couldn't find it again.

So I figured that I had better broadcast before it was completely swapped
out
of my memory.

This should now be on master and jethro.

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11425fba093ffb052caf9f81
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 25, 2016 at 9:59 PM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2/=
24/16 10:04 AM, Bruce Ashfield wrote:<br>
&gt; Someone was pinging me about cherry-picking a patch to Jethro, but I c=
an&#39;t<br>
&gt; find any trace of that email any more.<br>
&gt;<br>
&gt; I can&#39;t even remember 100% who it was, but this patch rings a bell=
.<br>
&gt;<br>
&gt; Does anyone know of this, or other Xen patches that should also be<br>
&gt; pulled into<br>
&gt; the jethro branch ?<br>
&gt;<br>
&gt; Bruce<br>
<br>
</span>Bruce,<br>
<br>
They likely pinged you off list because they dropped me a note and I<br>
told them to ask you to backport this. As far as I&#39;m aware this is the<=
br>
only fix needed and its necessary into jethro and master.<br></blockquote><=
div><br></div><div>Great. No worries about pinging me, whatever way works, =
I just read the email</div><div>filed it .. and then couldn&#39;t find it a=
gain.</div><div><br></div><div>So I figured that I had better broadcast bef=
ore it was completely swapped out</div><div>of my memory.</div><div><br></d=
iv><div>This should now be on master and jethro.</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11425fba093ffb052caf9f81--
