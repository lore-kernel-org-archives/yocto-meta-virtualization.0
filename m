Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D0D1E00D07; Tue, 14 Nov 2017 09:14:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04AB9E00C84
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:14:35 -0800 (PST)
Received: by mail-io0-f169.google.com with SMTP id 134so25155786ioo.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 09:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5tAEMO3fuTSgFdyLcKCbPkzR77J4TO1HIFX9/pgvYng=;
	b=UFb6qbXOVYyDN0vfJoTDU4cOV5y3GNFKPOLQs94Fj0dxtObtK4gNXKNZUVo453JjK2
	3lXGHgHfkkCPXC750r+22V8JaSMPGmgAHMYf4SfjyvxthNgNezjOW/3vXEphLA2xorHq
	0k0hUUAUS/TOI+Sylnw2Q9MVcvcmnXY+aSsz+1uRgFSL7j0V3wsDpkTFG9wn9aluz3Op
	Vp3Qv8hFo7XUNsTcllZGycJAjd63bbXB0lDyYUPR6wQcY+DKqWZzvZGISAJitnVDNAsk
	RBTQ9/rrjsfRqlg/Il4QgsjLYje4IFkKjzIj/dtDUR+kmtiLhRDlsIsfGsil2t0ZKLjq
	frYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5tAEMO3fuTSgFdyLcKCbPkzR77J4TO1HIFX9/pgvYng=;
	b=Yav/y6XxS+qYKOUOgotyYb4SYIXRfrdNpBUjHrLlowkb8idcu7P3xJ74XWHYMmUuwo
	vldFRV7SCgzQUIukTajCMS1VHn+k5Gh+kOceI8KNY6pcnZb4lo/XwcXZk/0ikn34HEd8
	vRdscs321V15J1X1dbEwrVhEl8Suv41yUc/AHWTQMeBvs56DYMOzzV8SE/hnTbJJqmt6
	6kyuMxLyP90YycD9oZF78Xaqw2Asyl3nFAg1NKtj8Sn+Tnm7IqO5bGxcBnWkqKoJUwgD
	MNHX5ctlJYqDUiiw4Km9GSthDDmAunoH3k93G8T9FSbaiS+i/zfoTJgKU50RIQt471Ku
	Y4rA==
X-Gm-Message-State: AJaThX5A5Eq1f7UlnVK1pXo+4E+AtZsjCU3eIT9CBzFsaYHfA+WNSCj4
	YxW4RorPe8eEmJn/byfswhZJ4bE+2PctVbz75vBJJw==
X-Google-Smtp-Source: AGs4zMYMIrWdftSfNaWpdQDkXsZl7LbsqYWySKOm2qzYI25U21U2K2t5RcYKhcEYteOTP0zlWUbBkVy4g3JJ+HP4w+s=
X-Received: by 10.107.147.135 with SMTP id v129mr14608803iod.289.1510679674730;
	Tue, 14 Nov 2017 09:14:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.48.205 with HTTP; Tue, 14 Nov 2017 09:14:14 -0800 (PST)
X-Originating-IP: [181.220.79.73]
In-Reply-To: <3643043.t5deORmW9L@peggleto-mobl.ger.corp.intel.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<CADkTA4MnT-KcNSZzhvpU_dQKV0rvKGApKJB6CgF7OnsZP0t=RQ@mail.gmail.com>
	<CAPuovE+=FS96vc_V4BHhXr6iq4c0jy5hJkEWZQBs=35rK=zfdg@mail.gmail.com>
	<3643043.t5deORmW9L@peggleto-mobl.ger.corp.intel.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 14 Nov 2017 15:14:14 -0200
Message-ID: <CAAPZna2fMCQ6qxZEKek=RdBsC7MdyxpiPOpMv4-y+OoDehvbAw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: mark.asselstine@windriver.com, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Tue, 14 Nov 2017 17:14:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c0559be61f27e055df4856f"

--94eb2c0559be61f27e055df4856f
Content-Type: text/plain; charset="UTF-8"

Hi,

We have a customer using krogoth branch and is failing to fetch from pypi.
And branches morty, pyro and rocko have http URLs for python recipes. This
patch can be backported to older branches?

Fabio

On Mon, Nov 13, 2017 at 1:59 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday, 13 November 2017 2:28:34 PM NZDT Mark Asselstine wrote:
> > On Sun, Nov 12, 2017 at 8:21 PM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > First I've seen of this.  It was filed as spam by gmail.
> > >
> > > Was I actually copied on the original ? That's the best way to make
> > > sure it doesn't
> > > get lost.
> > >
> > > I'll have a look at it in the next day or so, now that it has been
> > > yanked out of the bin :)
> >
> > I have been moving things to inherit pypi while moving things to
> > stable/pike. By doing so we can most often drop the SRC_URI line and
> > in this way we *should* stay current with the pypi best practices.
> > This commit will conflict with my webob update that off the top of my
> > head you merged this week Bruce. Instead of merging this I will move
> > any recipes that remain to inherit pypi if that is alright with the
> > two of you.
>
> Works for me too. Thanks!
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--94eb2c0559be61f27e055df4856f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi,</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-family:monospace,monospace;font-size:small">We =
have a customer using krogoth branch and is failing to fetch from pypi. And=
 branches morty, pyro and rocko have http URLs for python recipes. This pat=
ch can be backported to older branches?</div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace,monospace;font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sma=
ll">Fabio=C2=A0</div></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Nov 13, 2017 at 1:59 AM, Paul Eggleton <span dir=3D"ltr">=
&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul=
.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On Monday, 13 November 2017 2:28:34 PM NZDT Mark As=
selstine wrote:<br>
&gt; On Sun, Nov 12, 2017 at 8:21 PM, Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; First I&#39;ve seen of this.=C2=A0 It was filed as spam by gmail.=
<br>
&gt; &gt;<br>
&gt; &gt; Was I actually copied on the original ? That&#39;s the best way t=
o make<br>
&gt; &gt; sure it doesn&#39;t<br>
&gt; &gt; get lost.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll have a look at it in the next day or so, now that it has=
 been<br>
&gt; &gt; yanked out of the bin :)<br>
&gt;<br>
&gt; I have been moving things to inherit pypi while moving things to<br>
&gt; stable/pike. By doing so we can most often drop the SRC_URI line and<b=
r>
&gt; in this way we *should* stay current with the pypi best practices.<br>
&gt; This commit will conflict with my webob update that off the top of my<=
br>
&gt; head you merged this week Bruce. Instead of merging this I will move<b=
r>
&gt; any recipes that remain to inherit pypi if that is alright with the<br=
>
&gt; two of you.<br>
<br>
</span>Works for me too. Thanks!<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0559be61f27e055df4856f--
