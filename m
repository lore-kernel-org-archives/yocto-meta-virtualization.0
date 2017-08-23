Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33EF8E00C8B; Wed, 23 Aug 2017 05:54:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.44 listed in dnsbl.sorbs.net]
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9D81E00C2B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 05:54:27 -0700 (PDT)
Received: by mail-vk0-f44.google.com with SMTP id l132so32938vke.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MD5cSx1nJ2ND8kmRN/t78jgT7HF6c6ZcX19m8bGeyyg=;
	b=aVvz2oY2UsgYhoqKyOjYQgY+57rLs9n/KmITYQP7sd1r7FJLrkaRyTzXsr2dPXeVfH
	az2IpPcBB0nG8H65qkQ4PborH3aZISx5Q9zdN7jFumfUcYSffH2C0Nl5EGPB3Vq0st1f
	8YXsJyx3jqXJgX4Ho2f8KzORZGYZ5Gbqm5WdG6MXJpOHN+FtxnoDIqTwc1ltjXgT5L5d
	ReuymLuFbjxiPSlB+h/LjHZuwQ4bMudZmeE7i5QE/3BxMYPzRpf6R6OriOB7Q3cUsFzO
	6QwPku1pmRzOz7yjAEzXE9bVKygDmSKZ/iy+33IVKyfie1sOhAxQgkR8Do/AtukFYKKH
	bSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MD5cSx1nJ2ND8kmRN/t78jgT7HF6c6ZcX19m8bGeyyg=;
	b=AT4yFjy2x3xzil0QTAQ1XDI+SucADcJvsGbmJ3R32Pzi0puUg3y+Nh6/aWGOdlxZbN
	zNXIAP1pnS0WvxIEkPTuXV2YeWDBL3ftNxat0hN0tg+WopSbZYiBAj7hF9fiMnYOOUjP
	QTa0AHVYM+Q1ShDldQN/EStClCovnw8O4Y6YF1k8/2PrsQhfMAZ56Jub+1noLpAks0Yd
	Q71lJno/oQMq/cEYMLA9zO4CqbIZQS7Uj2qGMRNogHf/FIycYyFH52kXf/e+XRgl3tUC
	NL+SFVX4SxUEcdRZRpScDhH4Agzo/nH4AtSoY6UGULNwVGcE4xqJrM1CZumEO7LXvBHn
	3kKQ==
X-Gm-Message-State: AHYfb5iU/jyBMxrymsBazsj7cj/ReWIQBT0hlMYZupudfKWa3HDXsVH9
	Bfd6Wvgdd5BVX5VE56PKh6ETCGQwbg==
X-Received: by 10.31.198.135 with SMTP id w129mr1611188vkf.169.1503492866994; 
	Wed, 23 Aug 2017 05:54:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Wed, 23 Aug 2017 05:54:26 -0700 (PDT)
In-Reply-To: <CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
	<CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2017 08:54:26 -0400
Message-ID: <CADkTA4OOmrktgV+BHS=K2dEKUvJ_scO5mfk1nW5myNeS17VzLw@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 12:54:30 -0000
Content-Type: multipart/alternative; boundary="001a114d5b04427aaf05576b3691"

--001a114d5b04427aaf05576b3691
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:
> >> From: Christopher Clark <christopher.clark6@baesystems.com>
> >>
> >> The biossums tool is used to generate the vgabios build product.
> >>
> >> This patch:
> >> * adds a separate recipe "biossums" for the tool
> >> * makes the vgabios recipe depend upon biossums-native
> >> * makes the vgabios recipe use the native binary rather than a locally
> >> built one
> ...
>
> >> +PR = "r0"
> >
> > Minor issue, no need for a PR value in a new recipe. The PR server will
> > handle it.
>
> Oh yes - thanks, good catch.
>
> >> +
> >> +do_compile() {
> >> +    oe_runmake clean
> >
> >
> > What actually happens if the clean isn't run before each compile ?
>
> It's a good question. Here's where I see different behaviour with and
> without that clean:
>
> bitbake -c cleansstate vgabios biossums-native
> bitbake vgabios
>
> With the clean present, building vgabios will trigger biossums-native
> to be built to satisfy the dependency, and vgabios's compile will
> succeed. Without the clean present, biossums-native does get its build
> triggered, but the vgabios build fails with:
>
> "make: execvp: biossums: Accessing a corrupted shared library"
>


Interesting. So it sounds like whatever is installed from biossums-native
in a
previous build is checked for .. something ... and declared invalid on a
subsequent run.

.. but since the clean is before the make of biosums-native, I'm at a loss
to
understand why on a later build of vgabios it makes a difference. Is it some
sort of host vs target issue ?

When that error happens, and you look in the native sysroot, what does
the .so look like ? What does file say about it ?

Bruce


>
> I think if bitbake has calculated that running the compile step is
> required, then it needs to actually do the compile and not have "make"
> make its own local decision to skip it, and the clean forces that to
> happen.
>
> Christopher
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114d5b04427aaf05576b3691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 23, 2017 at 2:43 AM, Christopher Clark <span dir=3D"ltr">&l=
t;<a href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christ=
opher.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><span class=3D"gmail-">On Tue, Aug 22, 2017 at 7:42=
 PM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a=
>&gt; wrote:<br>
&gt; On Tue, Aug 22, 2017 at 1:08 AM, &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wrote:<br>
&gt;&gt; From: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The biossums tool is used to generate the vgabios build product.<b=
r>
&gt;&gt;<br>
&gt;&gt; This patch:<br>
&gt;&gt; * adds a separate recipe &quot;biossums&quot; for the tool<br>
&gt;&gt; * makes the vgabios recipe depend upon biossums-native<br>
&gt;&gt; * makes the vgabios recipe use the native binary rather than a loc=
ally<br>
&gt;&gt; built one<br>
</span>...<br>
<span class=3D"gmail-"><br>
&gt;&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; Minor issue, no need for a PR value in a new recipe. The PR server wil=
l<br>
&gt; handle it.<br>
<br>
</span>Oh yes - thanks, good catch.<br>
<span class=3D"gmail-"><br>
&gt;&gt; +<br>
&gt;&gt; +do_compile() {<br>
&gt;&gt; +=C2=A0 =C2=A0 oe_runmake clean<br>
&gt;<br>
&gt;<br>
&gt; What actually happens if the clean isn&#39;t run before each compile ?=
<br>
<br>
</span>It&#39;s a good question. Here&#39;s where I see different behaviour=
 with and<br>
without that clean:<br>
<br>
bitbake -c cleansstate vgabios biossums-native<br>
bitbake vgabios<br>
<br>
With the clean present, building vgabios will trigger biossums-native<br>
to be built to satisfy the dependency, and vgabios&#39;s compile will<br>
succeed. Without the clean present, biossums-native does get its build<br>
triggered, but the vgabios build fails with:<br>
<br>
&quot;make: execvp: biossums: Accessing a corrupted shared library&quot;<br=
></blockquote><div><br></div><div><br></div><div>Interesting. So it sounds =
like whatever is installed from=C2=A0biossums-native in a</div><div>previou=
s build is checked for .. something ... and declared invalid on a</div><div=
>subsequent run.</div><div><br></div><div>.. but since the clean is before =
the make of biosums-native, I&#39;m at a loss to</div><div>understand why o=
n a later build of vgabios it makes a difference. Is it some</div><div>sort=
 of host vs target issue ?</div><div><br></div><div>When that error happens=
, and you look in the native sysroot, what does</div><div>the .so look like=
 ? What does file say about it ?</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think if bitbake has calculated that running the compile step is<br>
required, then it needs to actually do the compile and not have &quot;make&=
quot;<br>
make its own local decision to skip it, and the clean forces that to<br>
happen.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Christopher<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114d5b04427aaf05576b3691--
