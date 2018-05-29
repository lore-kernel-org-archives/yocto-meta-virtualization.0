Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC4B0E00C61; Tue, 29 May 2018 07:28:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C8AEE00C4D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:28:19 -0700 (PDT)
Received: by mail-wr0-f178.google.com with SMTP id a15-v6so25904245wrm.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qnz8ipOdu9oTkXyLxGVavLedlFtOZjRK0/mCz4TqITQ=;
	b=os4BquuKVcyNzywF3rCcMyGBI/3W/vwqsjCpQDBESKBDVtzG+BgcxP21wkK4bx7ewV
	pucANZXMti0ChWJ5VJHVdy9FCdoZIsgvA/SSJpY4dgS4xo8cLlMzI3NFLg78hjxV11Oq
	B8wQ1ubEVi6Vm7PYC8+OZiPnhULThPFur1jW4ZJgUtaQXDyv7eLiIN9THkkqqROTqWI5
	Kk3ORGCOwLpUAYwhtszHr+ZSm6f32CjukpX4TihfSXH7oMsuLo2VRoDCsKPG63Q3s9T6
	GmYvLuKY6RjOHsJwVEneUDSRdFeUlONHiWq7RzfqlxeSvMvVaeUyVKyz7RMJmVhyuCaw
	vYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qnz8ipOdu9oTkXyLxGVavLedlFtOZjRK0/mCz4TqITQ=;
	b=Jd5w/Eyaaa4hXMAtAx+fGy0tcG0sutbR6xSv+RVNkMPbwhwGhOtiyVgHYR1QNjfU7p
	KtOLMf89yDoridwF1SGCGeTfmiZxH2BXpcd/OQu0p5bZWYk3TKJBtza/tYFTV5oKWfoA
	luaUp2Uh0e7XbjSWv9wew6B4UjfyUbzVEjbRFyHFyIfbVIhah8ui3V0+CuN77utbK6j3
	baCK401WZwdiZROF2iFAObDFZztfQz+zmQbFPS7ep75QuC93kdnttScXcRQhPHlKvyzx
	E4WQSOCNJDkHi6rP0vWYThK+Xe/OqvQNE27kjDfpHQ4k5edtc9V3KNWdowDO5JHkpaMc
	GDgA==
X-Gm-Message-State: ALKqPwevtarvbhyUxaD5V0qDfXltbtZkQ6Aa3H5VyXfLRZX8jrnr9Cbo
	+H7L3TPGkBZWdNk1XGasuRde0EL5EmclHwjpmKBp9A==
X-Google-Smtp-Source: ADUXVKI6tdOAIcK6sXQblp5gqlqo7cFxN4iUQ7ygCyPxGAGQ5ej1NLBknUALx+buOmWqhJ67TarFrA2jn7RhsvnydNU=
X-Received: by 2002:a19:14ca:: with SMTP id
	71-v6mr9343570lfu.126.1527604098439; 
	Tue, 29 May 2018 07:28:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:28:17
	-0700 (PDT)
In-Reply-To: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
References: <1527513289-5463-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:28:17 -0400
Message-ID: <CADkTA4N3bzQfBcJqq+480vjxevQYcgBCtCu7j5P+KFoVmAZ5_A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 0/4] lxc updates
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
X-List-Received-Date: Tue, 29 May 2018 14:28:20 -0000
Content-Type: multipart/alternative; boundary="000000000000a51e9a056d590b50"

--000000000000a51e9a056d590b50
Content-Type: text/plain; charset="UTF-8"

They all look good to me.

Thanks for the cleanup, these are now merged.

Bruce

On Mon, May 28, 2018 at 9:14 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

>
> Before doing an uprev of lxc I wanted to do some housekeeping on the
> current version, the result of some runtime testing with sysvinit and
> systemd along with some feedback from users. There were some
> inconsistencies between the packaging and handling of the two init
> systems which these change address, making the runtime experience
> match more closely. This also addresses some of the bugs we have
> recieved due to the -setup package which had (d)evolved from its
> initial intent. There is nothing groundbreaking here, and the end
> result should just be that there is less confusion when one wants to
> get lxc up and running in an image. These changes were tested
> thoroughly with 'cgroup-lite', 'lxc' and optionally 'lxc-networking'
> packages added to core-image-minimal when either sysvinit or systemd
> is in use.
>
> Mark Asselstine
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000a51e9a056d590b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">They all look good to me.<div><br></div><div>Thanks for th=
e cleanup, these are now merged.</div><div><br></div><div>Bruce</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 28, 2=
018 at 9:14 AM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mar=
k.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Before doing an uprev of lxc I wanted to do some housekeeping on the<br>
current version, the result of some runtime testing with sysvinit and<br>
systemd along with some feedback from users. There were some<br>
inconsistencies between the packaging and handling of the two init<br>
systems which these change address, making the runtime experience<br>
match more closely. This also addresses some of the bugs we have<br>
recieved due to the -setup package which had (d)evolved from its<br>
initial intent. There is nothing groundbreaking here, and the end<br>
result should just be that there is less confusion when one wants to<br>
get lxc up and running in an image. These changes were tested<br>
thoroughly with &#39;cgroup-lite&#39;, &#39;lxc&#39; and optionally &#39;lx=
c-networking&#39;<br>
packages added to core-image-minimal when either sysvinit or systemd<br>
is in use.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark Asselstine<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000a51e9a056d590b50--
