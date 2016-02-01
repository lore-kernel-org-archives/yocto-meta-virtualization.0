Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B03C5E0079A; Mon,  1 Feb 2016 12:34:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 750EFE00444
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Feb 2016 12:34:13 -0800 (PST)
Received: by mail-vk0-f48.google.com with SMTP id n1so84295424vkb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Feb 2016 12:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HJGNsiHzulihr4+wtfRgKQr9hhBIbdIfhR+vRF7tPWE=;
	b=oxNyFky0hq+ZYgQvF0MFVkI7NW4C3QwdKuBh87CEyLxosplxYKTF2Tf/X84fkW/oGa
	NJGJEGhM7f2tVZhSNEt+EqPNxfAxVjRe0Yxm80gNFJ8inUfHFa4AoSsoqvSUnyxF/kNp
	VRjBcAPqB+IlSkjBa14nihXRfTI3U5ZA/pNjYrGZBEfOOsxjjlLjZs1qM7L7BG76ZcJL
	W2Z4+UntTwVqNk2HCLPH2wvXDQDkZ9j24S/kGWWR6Q9o0PX9OeIUGRzm7HtPciB84OrD
	S/bXxE2iwg6VBMkccN7MOpLLk/nP/j+i7mUejRsrpks9RrOhhRyEmsYiOZhUohNCGGw9
	NmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HJGNsiHzulihr4+wtfRgKQr9hhBIbdIfhR+vRF7tPWE=;
	b=NNctjbW63dbTmdbmHK9uBHOAu8a56FEZWP07eOXJh7Kvsl3EUCVJBfo8387Tr+upIO
	p7MadVKPBjfnBaIHZeku4sJmskua6n2KnffQH+xez87M69OIciFj4D0BWtD/sbta5PcD
	7WmLmol7b8C3nC8vpzNJGquY0IhpHvUrjlOXAXBckO2zmvHunCWlSCbKdUu+KAqvlyqn
	TdC5il2RL/dwzNw7/MnWm+upueLlAMqBhEtDCb/j8ACVPP1K2MZ0WffBnTQ2KRYtkekE
	PjcMjb0s8PZw6x2czaEGqr4w3dvrS/SKdjrr/NvMMwsBWOtueked112nZIedn310ROkc
	m9+w==
X-Gm-Message-State: AG10YORP736knt/9oObXRI5hgWhELLLzpJJ3/XFiz9Y/fQx5klw/jf3XHqbTqa60G8R8bw8K+CLcyaHeWwpiXw==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr17492778vky.11.1454358853089;
	Mon, 01 Feb 2016 12:34:13 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 1 Feb 2016 12:34:13 -0800 (PST)
In-Reply-To: <56AF811C.6090001@cardoe.com>
References: <56AA7638.2070204@cardoe.com>
	<CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
	<56AAD00D.2010708@cardoe.com>
	<CADkTA4OXKN7hsWxRVHVDWvtxiFDC5vrcksHRJqi7c1y=psw90A@mail.gmail.com>
	<56AF811C.6090001@cardoe.com>
Date: Mon, 1 Feb 2016 15:34:13 -0500
Message-ID: <CADkTA4OzTyC7M4wUVc9gggdiLsTWZPs-F5uoKX71abJ3LboAfg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: jethro branch?
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
X-List-Received-Date: Mon, 01 Feb 2016 20:34:20 -0000
Content-Type: multipart/alternative; boundary=001a1143158ad07e99052abb4e6f

--001a1143158ad07e99052abb4e6f
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 11:00 AM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/31/16 11:28 PM, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jan 28, 2016 at 9:35 PM, Doug Goldstein <cardoe@cardoe.com
> > <mailto:cardoe@cardoe.com>> wrote:
> >
> >     On 1/28/16 6:25 PM, Bruce Ashfield wrote:
> >     >
> >     >
> >     > On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <cardoe@cardoe.com
> <mailto:cardoe@cardoe.com>
> >     > <mailto:cardoe@cardoe.com <mailto:cardoe@cardoe.com>>> wrote:
> >     >
> >     >     Hi all,
> >     >
> >     >     With the addition of the linux-yocto_4.4.bbappend, master no
> longer
> >     >     works with jethro. Could we land the Xen patches I proposed
> and then
> >     >     create a jethro branch and drop linux-yocto_4.4.bbappend from
> that
> >     >     branch?
> >     >
> >     >
> >     > I actually have a jethro branch prep'd already. Once I've merged
> the pending
> >     > changes to master, I'll cherry pick them to the jethro and push
> both
> >     > branches.
> >     >
> >     > Bruce
> >
> >     Thanks Bruce.
> >
> >
> > I just pushed a preliminary jethro branch.
> >
> > oe-core/yocto branched jethro Nov 3rd 2015, and I did the same at the
> > time. Looking
> > at the newer changes in meta-virt, I updated my jethro branch up to the
> > point where
> > I cloned the 4.1 xen config to 4.4 .. since that creates a dangling
> > bbappend in the
> > context of jethro.
> >
> > At this point, I'd like enlist the help of those that are building xen
> > regularly, to
> > point out the additional commits that should be merged.
> >
> > Either a branch for a pull request, or just a list of hashes in master
> > will work.
> >
> > Bruce
>
> Thanks Bruce. The changes that I'm building for jethro are the following:
>
> 45de52d11c68cf023566c0d6d4fd341adfb04c7b
> ec4b409bd6567e430511e767ac043066ddfc850c
> 12a7d544f40fb911b706c681b611a7cbdd303c39
> a19e5567dc9f34d0c52fdb40544f82bba41bf0d0
> 5817c4a29b361812b87eddb2bbb623344dccbdc2
> 663463da0c29e1f22b0740335d193f637174c104
> 3915d59fdf7af575b7e26a82efb0f998864d8692
> f5649753869888606de09701ea9f9a56424cd3d8
>

Thanks!

I did the cherry picks and push the result to the jethro branch. Let me
know if there
are any issues.

Bruce


>
> You can also pull it from here:
>
> https://github.com/cardoe/meta-virtualization/tree/jethro-updates
>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143158ad07e99052abb4e6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 1, 2016 at 11:00 AM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1/=
31/16 11:28 PM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Jan 28, 2016 at 9:35 PM, Doug Goldstein &lt;<a href=3D"mailto:=
cardoe@cardoe.com">cardoe@cardoe.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:cardoe@cardoe.com=
">cardoe@cardoe.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/28/16 6:25 PM, Bruce Ashfield wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstei=
n &lt;<a href=3D"mailto:cardoe@cardoe.com">cardoe@cardoe.com</a> &lt;mailto=
:<a href=3D"mailto:cardoe@cardoe.com">cardoe@cardoe.com</a>&gt;<br>
</span><div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a hr=
ef=3D"mailto:cardoe@cardoe.com">cardoe@cardoe.com</a> &lt;mailto:<a href=3D=
"mailto:cardoe@cardoe.com">cardoe@cardoe.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0With the addition of the li=
nux-yocto_4.4.bbappend, master no longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0works with jethro. Could we=
 land the Xen patches I proposed and then<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0create a jethro branch and =
drop linux-yocto_4.4.bbappend from that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0branch?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I actually have a jethro branch prep&#39;d alr=
eady. Once I&#39;ve merged the pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; changes to master, I&#39;ll cherry pick them t=
o the jethro and push both<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; branches.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Bruce<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks Bruce.<br>
&gt;<br>
&gt;<br>
&gt; I just pushed a preliminary jethro branch.<br>
&gt;<br>
&gt; oe-core/yocto branched jethro Nov 3rd 2015, and I did the same at the<=
br>
&gt; time. Looking<br>
&gt; at the newer changes in meta-virt, I updated my jethro branch up to th=
e<br>
&gt; point where<br>
&gt; I cloned the 4.1 xen config to 4.4 .. since that creates a dangling<br=
>
&gt; bbappend in the<br>
&gt; context of jethro.<br>
&gt;<br>
&gt; At this point, I&#39;d like enlist the help of those that are building=
 xen<br>
&gt; regularly, to<br>
&gt; point out the additional commits that should be merged.<br>
&gt;<br>
&gt; Either a branch for a pull request, or just a list of hashes in master=
<br>
&gt; will work.<br>
&gt;<br>
&gt; Bruce<br>
<br>
</div></div>Thanks Bruce. The changes that I&#39;m building for jethro are =
the following:<br>
<br>
45de52d11c68cf023566c0d6d4fd341adfb04c7b<br>
ec4b409bd6567e430511e767ac043066ddfc850c<br>
12a7d544f40fb911b706c681b611a7cbdd303c39<br>
a19e5567dc9f34d0c52fdb40544f82bba41bf0d0<br>
5817c4a29b361812b87eddb2bbb623344dccbdc2<br>
663463da0c29e1f22b0740335d193f637174c104<br>
3915d59fdf7af575b7e26a82efb0f998864d8692<br>
f5649753869888606de09701ea9f9a56424cd3d8<br></blockquote><div><br></div><di=
v>Thanks!<br><br></div><div>I did the cherry picks and push the result to t=
he jethro branch. Let me know if there<br></div><div>are any issues.<br><br=
></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
You can also pull it from here:<br>
<br>
<a href=3D"https://github.com/cardoe/meta-virtualization/tree/jethro-update=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/cardoe/meta-virt=
ualization/tree/jethro-updates</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a1143158ad07e99052abb4e6f--
