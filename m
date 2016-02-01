Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9059BE00C05; Sun, 31 Jan 2016 21:28:25 -0800 (PST)
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
	*      [209.85.213.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A03BE00BFF
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jan 2016 21:28:22 -0800 (PST)
Received: by mail-vk0-f45.google.com with SMTP id e64so71317913vkg.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jan 2016 21:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p9X0Z7rPfe4NAAX6UY0lI7+LvezoanskNzHRU9IiWvA=;
	b=R6ugU2sCNUVkKkv1AqzKWkW4neI1Ya9jsxgP+xLGSKkRESyqWBgw/pemaVfflmt7UH
	2r8cUMopd1VOCAH9oYwLCQU57yxFxXomY4iC4dcr2W5OerBLLmCn/9Zxn8OcgTKZsvkm
	lCyg4lCtF4urcn7kGrsNtwKedFhTbXhGeby2m7pwMpYVgBV0N8E5ecU2HYIM11rh0HS+
	PhI//iiCNfHkqha6JKiparptFCCxfZKgItjBEFCX+aT3i3kG4ngld3rkDjiJ94lNkha+
	cJD7pNGktgwb8F6Qpt3A1ko8nWrDhFpxdDQp1U/uRZRT8wdZTgGR9SAENzsxFTKPKQj4
	WzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=p9X0Z7rPfe4NAAX6UY0lI7+LvezoanskNzHRU9IiWvA=;
	b=iDgyktZ0BYsQ+gmWc5+KsEZRc9sJYPJDpbHf13VbG8ES7mPyc/ac1EE5J4z4YVVwhr
	2OKXrj+ypIR3a9UAHxqPNPQZzlWfDsR4wZ/fJZFXlzQkaDf0yt7/Rh/MXVzOvJ1NlAQO
	EsP/GBCMrUrBs+PYKwIbwmpSkHh6aTsBWzb72nl/jqE4p0NvWRO/uWm+NxBaTVmzaNYt
	/+Qvl+J/IERD4pEsR2l200VnhWbgmWjt9vZCXH3702/zpLlg/AoYRS+IWVFuuziGA/Ja
	L8AF+CZEx3DO92e4121R1MqOiNmuaPPr9B5F4enKG3tr8K3IaOiozVBSahYgEDrSO67q
	hX8A==
X-Gm-Message-State: AG10YOQKsYvLWrQcgOTC/UHlFxqSCjfRXAhshVA0qud+l5OvHEs+vRs8Tdg28BW3FJ1MdzU0tqCZbzOe+icUmQ==
MIME-Version: 1.0
X-Received: by 10.31.150.215 with SMTP id y206mr14350385vkd.63.1454304502166; 
	Sun, 31 Jan 2016 21:28:22 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Sun, 31 Jan 2016 21:28:22 -0800 (PST)
In-Reply-To: <56AAD00D.2010708@cardoe.com>
References: <56AA7638.2070204@cardoe.com>
	<CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
	<56AAD00D.2010708@cardoe.com>
Date: Mon, 1 Feb 2016 00:28:22 -0500
Message-ID: <CADkTA4OXKN7hsWxRVHVDWvtxiFDC5vrcksHRJqi7c1y=psw90A@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Feb 2016 05:28:25 -0000
Content-Type: multipart/alternative; boundary=001a1140fdd83f3a1e052aaea708

--001a1140fdd83f3a1e052aaea708
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 28, 2016 at 9:35 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/28/16 6:25 PM, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <cardoe@cardoe.com
> > <mailto:cardoe@cardoe.com>> wrote:
> >
> >     Hi all,
> >
> >     With the addition of the linux-yocto_4.4.bbappend, master no longer
> >     works with jethro. Could we land the Xen patches I proposed and then
> >     create a jethro branch and drop linux-yocto_4.4.bbappend from that
> >     branch?
> >
> >
> > I actually have a jethro branch prep'd already. Once I've merged the
> pending
> > changes to master, I'll cherry pick them to the jethro and push both
> > branches.
> >
> > Bruce
>
> Thanks Bruce.
>

I just pushed a preliminary jethro branch.

oe-core/yocto branched jethro Nov 3rd 2015, and I did the same at the time.
Looking
at the newer changes in meta-virt, I updated my jethro branch up to the
point where
I cloned the 4.1 xen config to 4.4 .. since that creates a dangling
bbappend in the
context of jethro.

At this point, I'd like enlist the help of those that are building xen
regularly, to
point out the additional commits that should be merged.

Either a branch for a pull request, or just a list of hashes in master will
work.

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1140fdd83f3a1e052aaea708
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jan 28, 2016 at 9:35 PM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1/=
28/16 6:25 PM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein &lt;<a href=3D"mailto:=
cardoe@cardoe.com">cardoe@cardoe.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:cardoe@cardoe.com=
">cardoe@cardoe.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi all,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0With the addition of the linux-yocto_4.4.bbappend, =
master no longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0works with jethro. Could we land the Xen patches I =
proposed and then<br>
&gt;=C2=A0 =C2=A0 =C2=A0create a jethro branch and drop linux-yocto_4.4.bba=
ppend from that<br>
&gt;=C2=A0 =C2=A0 =C2=A0branch?<br>
&gt;<br>
&gt;<br>
&gt; I actually have a jethro branch prep&#39;d already. Once I&#39;ve merg=
ed the pending<br>
&gt; changes to master, I&#39;ll cherry pick them to the jethro and push bo=
th<br>
&gt; branches.<br>
&gt;<br>
&gt; Bruce<br>
<br>
</span>Thanks Bruce.<br></blockquote><div><br></div><div>I just pushed a pr=
eliminary jethro branch.=C2=A0</div><div><br></div><div>oe-core/yocto branc=
hed jethro Nov 3rd 2015, and I did the same at the time. Looking</div><div>=
at the newer changes in meta-virt, I updated my jethro branch up to the poi=
nt where</div><div>I cloned the 4.1 xen config to 4.4 .. since that creates=
 a dangling bbappend in the</div><div>context of jethro.</div><div><br></di=
v><div>At this point, I&#39;d like enlist the help of those that are buildi=
ng xen regularly, to=C2=A0</div><div>point out the additional commits that =
should be merged.</div><div><br></div><div>Either a branch for a pull reque=
st, or just a list of hashes in master will work.</div><div><br></div><div>=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1140fdd83f3a1e052aaea708--
