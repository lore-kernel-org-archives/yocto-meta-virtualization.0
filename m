Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA594E00928; Thu, 28 Jan 2016 16:25:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC758E00803
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 16:25:14 -0800 (PST)
Received: by mail-vk0-f53.google.com with SMTP id e185so33558798vkb.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QW6TiFfVU+VAt8czgjFk+86+VtyZBDPqiRnhBWYCaJg=;
	b=cnnGVZr9TWs/cvx+fgHrRNmh2FpTVUEyW5sM5GC6mpLLVbizfDX6oEFsUvtSDD2R3N
	uoMm6ztJ3x3qbc3ozNst805jYycU6MkRaP54V0tF5Dq3DzdbBsapQbo4zQxwEiEaAF4T
	SjhdWNOCBNbDB7RCXr9WAYy766YbygMmnZjmk/hJQghPj2QVF/CdWo8AZNfSgVlGipUr
	aLYm8a/YmwH/pus7q40B0T/twqAgTq7tsEonsjxPWa6GXMR1TFeMUpDJT4hD+wd/M0Iv
	ShMEpJUrzzaowmJHQchNQmKqYTax0i6qUcCqCBR/uLVBf/bCl90c1e9wciYLyyLdsm/R
	6SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=QW6TiFfVU+VAt8czgjFk+86+VtyZBDPqiRnhBWYCaJg=;
	b=RlVfH1E2YCXgz4X7H99emuvwBIDDD1C076QGP6ApA+N/w9+8e02oRhCm2wvXflI/47
	3RHjQsU4g4sZrxcDWjXkUJOFY4KypMgYmYUQ77BeVOLrOWAjPX/gHagWuIesPhpokDQL
	nRQQY+zJ16mD5t3ZFQCxYWRG7MA+1phgjXJw78btiBjX8NWdxSdYIlu6BX7bPyD1z3bF
	hZ9YAEFStc/3xraw75b33BbhcretCred1rPVb6KyeRg3GjKqHx6sx7iKsqNwY29d50Yv
	wlfH8EIcdNWouO6v7On2+DD9P3c1NWDKseL79uLoety2474qYndKdZemGB6chfdORkl2
	iiNQ==
X-Gm-Message-State: AG10YOSpodlbSIWbpJaCB1UYX+id6lPzbDcTg/EkpEk0uWu7/zsduw/lfYXVGKki5LjqWoYkBZ4+lcmdLs7bzA==
MIME-Version: 1.0
X-Received: by 10.31.172.135 with SMTP id v129mr3824719vke.154.1454027113701; 
	Thu, 28 Jan 2016 16:25:13 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Thu, 28 Jan 2016 16:25:13 -0800 (PST)
In-Reply-To: <56AA7638.2070204@cardoe.com>
References: <56AA7638.2070204@cardoe.com>
Date: Thu, 28 Jan 2016 19:25:13 -0500
Message-ID: <CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Jan 2016 00:25:26 -0000
Content-Type: multipart/alternative; boundary=001a1143e3dc9b25d2052a6e1161

--001a1143e3dc9b25d2052a6e1161
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> Hi all,
>
> With the addition of the linux-yocto_4.4.bbappend, master no longer
> works with jethro. Could we land the Xen patches I proposed and then
> create a jethro branch and drop linux-yocto_4.4.bbappend from that branch?
>
>
I actually have a jethro branch prep'd already. Once I've merged the pending
changes to master, I'll cherry pick them to the jethro and push both
branches.

Bruce


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

--001a1143e3dc9b25d2052a6e1161
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
With the addition of the linux-yocto_4.4.bbappend, master no longer<br>
works with jethro. Could we land the Xen patches I proposed and then<br>
create a jethro branch and drop linux-yocto_4.4.bbappend from that branch?<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>I actually have a jethro branch prep&#39;d already. =
Once I&#39;ve merged the pending</div><div>changes to master, I&#39;ll cher=
ry pick them to the jethro and push both branches.</div><div><br></div><div=
>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
HOEnZb"><font color=3D"#888888">
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
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;</div>
</div></div>

--001a1143e3dc9b25d2052a6e1161--
