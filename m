Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EC2B0E0070F; Mon, 18 Jan 2016 08:19:13 -0800 (PST)
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
	*      [209.85.213.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 90E4AE00444
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 08:19:09 -0800 (PST)
Received: by mail-vk0-f52.google.com with SMTP id k1so333922511vkb.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hs/n4YQmX5LUeUHvqrxl/Qq+w9KMfw9F033cjfyrjSs=;
	b=OBYTn83d6TJ9J271TiauwMALNegCYSamyOUXfG0isXF91kC0+7GFNk/wiK3hjjL7e3
	p65eP97AIt8iz15iWZDzYse/3k31gLr3p1B71wapl6TrIf+VGuP1B0UKQAX0scuGJUu/
	vpYDMkyxVoUral4YAZQ93drCGGnq/0Ehmq8lGr8frroOImraBfaaHy+IYZqSv8FOPMEd
	9S8Ry7lgsOn2M2nOtOKgeEBg+SeQANwzS1uJ5davDn3nuxzcLMRB56uTCNfeP5osAYlj
	yTDli0+2V3sOfi6cQ1UQhoAzLj1KQJoHtbaD9ZCho9eHArP5IOZpg36YGCRAY5TjJFLg
	7yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hs/n4YQmX5LUeUHvqrxl/Qq+w9KMfw9F033cjfyrjSs=;
	b=BQrAxHBL+sD+NY/K29PEB1S46QH5QEEO903IQ0AVULN/eqAO/cAwtJJy8/EOEE7tK5
	J1EyA2Hml0E1zK3+tkoIzPHW/x4NbHNUMXdpKKz1P8Pa5WvkIRaOyv3Hywcsh9PKz+eA
	ABW3REPkaihBL9LxZ3ytYp3H/q6RKQfxHnpvVKf8OefN5TdjZj/MR87YI2UJ8zKDyQ7d
	6ux/1kvNahxusQ51HELs7UbbUr2xtkDOKQ3sS3aJMVQfZqHSvXhy1HM8Lcr5wG07Mx4N
	eGpAuDxHoIjBQhpPWyvM3RXSDiUE70+qn7VN2vnR+j84042pyXySCde9i8rqajwcZKx0
	j/Cw==
X-Gm-Message-State: ALoCoQmyxU2YP8b6NsdheEVqVdQG2GihtNIS975NKgm9iVaQIKssI3P/R2gObJTg27u3TUCVo58iEFrjOD97KlvHtrjGrJ+aoQ==
MIME-Version: 1.0
X-Received: by 10.31.172.135 with SMTP id v129mr15993042vke.154.1453133948445; 
	Mon, 18 Jan 2016 08:19:08 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 18 Jan 2016 08:19:08 -0800 (PST)
In-Reply-To: <569D0DBF.2020007@cardoe.com>
References: <569962FB.8070601@tycho.nsa.gov> <56996543.9070709@mvista.com>
	<569D0DBF.2020007@cardoe.com>
Date: Mon, 18 Jan 2016 11:19:08 -0500
Message-ID: <CADkTA4PFkbhtMk0FZdU9_11fu6L2P+UDr3hzy2fJ43MW3i9MRA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Mon, 18 Jan 2016 16:19:14 -0000
Content-Type: multipart/alternative; boundary=001a1143e3dcceef4205299e1cfe

--001a1143e3dcceef4205299e1cfe
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 18, 2016 at 11:07 AM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/15/16 3:31 PM, akuster wrote:
> > Machon,
> >
> >
> > On 01/15/2016 01:22 PM, M. Gregory wrote:
> >> I am still new to openembedded and I have not encountered the error
> >> below before. It is occurring when building the xen-image-minimal
> >> recipe. I added {PN}-devd, which contains xendriverdomain, to the
> >> PACKAGE variable which solved the problem. Is that the correct solution?
> >> -Machon
> >
> > You might need to add something like:
> >
> > FILES_${PN}-devd += "${sysconfdir}/init.d/xendriverdomain"
> >
>
> Yes. That change should have been merged as part of:
>
>
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2015-December/001617.html
>
> We might have to audit the different patches and make sure everything
> has landed and if not repost them.
>

Definitely do that audit! I was trying to track the various threads, but
with the
discussion and partially overlapping series, I very well could have missed
some
parts.

Bruce


>
> --
> Doug Goldstein
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143e3dcceef4205299e1cfe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 18, 2016 at 11:07 AM, Doug Goldstein <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1=
/15/16 3:31 PM, akuster wrote:<br>
&gt; Machon,<br>
&gt;<br>
&gt;<br>
&gt; On 01/15/2016 01:22 PM, M. Gregory wrote:<br>
&gt;&gt; I am still new to openembedded and I have not encountered the erro=
r<br>
&gt;&gt; below before. It is occurring when building the xen-image-minimal<=
br>
&gt;&gt; recipe. I added {PN}-devd, which contains xendriverdomain, to the<=
br>
&gt;&gt; PACKAGE variable which solved the problem. Is that the correct sol=
ution?<br>
&gt;&gt; -Machon<br>
&gt;<br>
&gt; You might need to add something like:<br>
&gt;<br>
&gt; FILES_${PN}-devd +=3D &quot;${sysconfdir}/init.d/xendriverdomain&quot;=
<br>
&gt;<br>
<br>
</span>Yes. That change should have been merged as part of:<br>
<br>
<a href=3D"https://lists.yoctoproject.org/pipermail/meta-virtualization/201=
5-December/001617.html" rel=3D"noreferrer" target=3D"_blank">https://lists.=
yoctoproject.org/pipermail/meta-virtualization/2015-December/001617.html</a=
><br>
<br>
We might have to audit the different patches and make sure everything<br>
has landed and if not repost them.<br></blockquote><div><br></div><div>Defi=
nitely do that audit! I was trying to track the various threads, but with t=
he<br></div><div>discussion and partially overlapping series, I very well c=
ould have missed some<br></div><div>parts.<br><br></div><div>Bruce<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span><br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail=
_signature">&quot;Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end&quot;</div>
</div></div>

--001a1143e3dcceef4205299e1cfe--
