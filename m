Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B925DE00BA2; Thu, 24 Aug 2017 06:57:40 -0700 (PDT)
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
	*      [209.85.213.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B99EE0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:57:39 -0700 (PDT)
Received: by mail-vk0-f47.google.com with SMTP id j189so2211563vke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UkhS8BC9hztHHxfaT7LaIv3rocSCsZRyZkeL827Bl54=;
	b=fS3nMpB+W4lbVE4DTY/CrG2xHYscH6k6r5Xx682Q/xhBMB4Wjt5WO9jWCDlAS1rXcC
	NEpG+m/Z4ybNY5Q42XoEM3c+mx9XcifVZ/YOCfegN8vKnXGnPr4r7AY/Jg0Z2MARfmQb
	mOtHp/4EuAqn8WRcQQTiNTzOMmAkIHFQw9mzXpcJ6N8MSDdom5tKPufgXBS0Vci42wji
	MUycAb/wweltDGqYlSTSH93YjXaAe5qaMh90REPznf1z8bSZ7plD97ibMexCmiV355YG
	g7xDLgBpXF+kvg9WW6vFZZ0oj5ekbZnqIp4pzLVvBJ2G8GjGTsRTWQCdwyzznAYKHGcV
	Qd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UkhS8BC9hztHHxfaT7LaIv3rocSCsZRyZkeL827Bl54=;
	b=XVTE7amgrQu2hInXCUYpYUKowbwIPc9hrWdnVNDtGSvIr6PqFOaZ/5cti2RQipPJlU
	CE/kPhNqMFArST1UVx0kFOnwCalDYh/monoPp0bjmQLqmkvmrUlKxOmvWzj8z1VcUBRQ
	Xy+9Qj4D8A+/pB7zS1bhWqzuREUeq2zuHauCEaq8GCrISO4kXhP411/7LZjIGLPTcP1v
	r0cHSZQ5e1yQZtlQAdZ4u4eLfbVGMI3izZ8U1KIv4dP/xrc+LfYQi8N19mwGdYBAC2aR
	JJWVqcZn4YfXn2KrIsq2VOTbV+gNdSMehdTAy43Z8qu2Ly20ZhKG7FkFkAHiCmwaIGjg
	9/TA==
X-Gm-Message-State: AHYfb5gO9EJNLAumo6FcipTE/LsVqL1YDGzBlSzFFtXdb7kgPbpNgW0C
	azMXWCBx5QXQDVUgvzSXF9lGZZYQzg==
X-Received: by 10.31.209.71 with SMTP id i68mr3383888vkg.188.1503583059311;
	Thu, 24 Aug 2017 06:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:57:38 -0700 (PDT)
In-Reply-To: <CACMJ4Ga6aMP8=6B04TJ42S0nZTXkJ0b+aza4XaAMdXxEt4KN5w@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
	<CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
	<CADkTA4OOmrktgV+BHS=K2dEKUvJ_scO5mfk1nW5myNeS17VzLw@mail.gmail.com>
	<CACMJ4GYuq01TGd3Py-Twhi4Hs5iWO9S85hsH9aVBU1WyuRap4w@mail.gmail.com>
	<CACMJ4Ga6aMP8=6B04TJ42S0nZTXkJ0b+aza4XaAMdXxEt4KN5w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:57:38 -0400
Message-ID: <CADkTA4OszS4+0jMxjpXBbO=K-P=1mqvt++AqPdtpWZxCUkrouA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Thu, 24 Aug 2017 13:57:40 -0000
Content-Type: multipart/alternative; boundary="001a114e2482240142055780361b"

--001a114e2482240142055780361b
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 5:13 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Wed, Aug 23, 2017 at 1:18 PM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> > On Wed, Aug 23, 2017 at 5:54 AM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> >>
> >>
> >> On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark
> >> <christopher.w.clark@gmail.com> wrote:
> >>>
> >>> On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield
> >>> <bruce.ashfield@gmail.com> wrote:
> >>> > On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com>
> wrote:
> >>> >> From: Christopher Clark <christopher.clark6@baesystems.com>
> >>> >>
> >>> >> The biossums tool is used to generate the vgabios build product.
> >>> >>
> >>> >> This patch:
> >>> >> * adds a separate recipe "biossums" for the tool
> >>> >> * makes the vgabios recipe depend upon biossums-native
> >>> >> * makes the vgabios recipe use the native binary rather than a
> locally
> >>> >> built one
> >
> >>> >> +
> >>> >> +do_compile() {
> >>> >> +    oe_runmake clean
> >>> >
> >>> >
> >>> > What actually happens if the clean isn't run before each compile ?
>
> I figured it out: a 32-bit biossums binary is distributed inside the
> upstream source tarball, and make decides that it doesn't need to
> rebuild it since the timestamp is newer than the source code file.
>

Aha. Thanks for the information .. gives more confidence in the approach.
We could
also just rm the files, but using the clean mechanism to take care of it
properly makes
sense.

I've now merged the 4 patch series.

Bruce


>
> I think that makes the "clean" seem like a reasonable step to put
> before compile.
>
> Christopher
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114e2482240142055780361b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 23, 2017 at 5:13 PM, Christopher Clark <span dir=3D"ltr">&l=
t;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christ=
opher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Wed, Aug 23, 2017 at 1:18 PM, Christopher Clark<br>
<span class=3D"">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com">chris=
topher.w.clark@gmail.com</a><wbr>&gt; wrote:<br>
&gt; On Wed, Aug 23, 2017 at 5:54 AM, Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark<br>
&gt;&gt; &lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w=
.clark@gmail.com</a><wbr>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield=
@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; On Tue, Aug 22, 2017 at 1:08 AM, &lt;<a href=3D"mailto:ch=
ristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wro=
te:<br>
&gt;&gt;&gt; &gt;&gt; From: Christopher Clark &lt;<a href=3D"mailto:christo=
pher.clark6@baesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<=
br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; The biossums tool is used to generate the vgabios bui=
ld product.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; This patch:<br>
&gt;&gt;&gt; &gt;&gt; * adds a separate recipe &quot;biossums&quot; for the=
 tool<br>
&gt;&gt;&gt; &gt;&gt; * makes the vgabios recipe depend upon biossums-nativ=
e<br>
&gt;&gt;&gt; &gt;&gt; * makes the vgabios recipe use the native binary rath=
er than a locally<br>
&gt;&gt;&gt; &gt;&gt; built one<br>
&gt;<br>
&gt;&gt;&gt; &gt;&gt; +<br>
&gt;&gt;&gt; &gt;&gt; +do_compile() {<br>
&gt;&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 oe_runmake clean<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; What actually happens if the clean isn&#39;t run before e=
ach compile ?<br>
<br>
</span>I figured it out: a 32-bit biossums binary is distributed inside the=
<br>
upstream source tarball, and make decides that it doesn&#39;t need to<br>
rebuild it since the timestamp is newer than the source code file.<br></blo=
ckquote><div><br></div><div>Aha. Thanks for the information .. gives more c=
onfidence in the approach. We could</div><div>also just rm the files, but u=
sing the clean mechanism to take care of it properly makes</div><div>sense.=
</div><div><br></div><div>I&#39;ve now merged the 4 patch series.</div><div=
><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I think that makes the &quot;clean&quot; seem like a reasonable step to put=
<br>
before compile.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Christopher<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114e2482240142055780361b--
