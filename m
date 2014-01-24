Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 774B8E008EC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jan 2014 13:11:19 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id mc6so2902832lab.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jan 2014 13:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zzmbge4qNRQGdMu7N9AYATVn3AUFETaqf5Rd/IIDGek=;
	b=DzLxglpm26b1yIlYBs+cxza7QNlOYkRWcYOWlJDrqiX9tS3tMg6vZRaoLIkoknblhz
	GeUlyPK1H90rro4pai+4+Yj5H7wVltmnGFhYFJFfv12dcMVXX+2upR6Vo2icGwO2vmSS
	1/o0TDVDVS1P2MniMkL6Zm4khZmzJ3npgpNSpebrb/lAM7mmwBmWTCw+Ab0zpz6h84GC
	/ABdNMbKDciycpOPv99fqH5WjNxuXOwoIkH2I5DNOPSWOgLKiDGaOL5IqBHYWjZm00fc
	seNLfUBfksVC/3JJQ6eamTFTzRj3t3PiBi+cvsiBYCcJknN99VLkrbnDCLaGHJ+IIz4K
	69Xg==
MIME-Version: 1.0
X-Received: by 10.112.164.5 with SMTP id ym5mr1969lbb.48.1390597877683; Fri,
	24 Jan 2014 13:11:17 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Fri, 24 Jan 2014 13:11:17 -0800 (PST)
In-Reply-To: <52E04F4F.7070003@twobit.us>
References: <52E04F4F.7070003@twobit.us>
Date: Fri, 24 Jan 2014 16:11:17 -0500
Message-ID: <CABZSBQf84tJNhwdkjGE3MpXhVrtOX_fvmUkk+YBZ52W6FRrA5A@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: xendomains init script from xen recipe hangs
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
X-List-Received-Date: Fri, 24 Jan 2014 21:11:27 -0000
Content-Type: multipart/alternative; boundary=001a11c2681886591204f0bdccba

--001a11c2681886591204f0bdccba
Content-Type: text/plain; charset=ISO-8859-1

It works for me (on a slightly modified xen-image-minimal) with some
complaints about head (-c flag not implemented in busybox) if you don't
have coreutils installed (add coreutils to your image and that should go
away).

Can you try it on the command line?

bash -x /etc/init.d/xendomains stop

bash -x /etc/init.d/xendomains start

Depending on what you are seeing, you may need to adjust your values in
/etc/default/xendomains.


On Wed, Jan 22, 2014 at 6:07 PM, Philip Tricca <flihp@twobit.us> wrote:

> Hey Chris,
>
> I'm guessing you're the only one who may have tried to use this script
> before. I've got a simple test VM I want to start on boot. The
> xendomains script (from the xen recipe) starts my VM but then hangs for
> what seems to be forever. Have you had luck or even tried to use this
> script before?
>
> This may not even be the right tool for what I'm trying to do but it's
> there for free so I thought I'd give it a try.
>
> Thanks,
> Philip
>

--001a11c2681886591204f0bdccba
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It works for me (on a slightly modified xen-image-minimal)=
 with some complaints about head (-c flag not implemented in busybox) if yo=
u don&#39;t have coreutils installed (add coreutils to your image and that =
should go away).<div>
<br></div><div>Can you try it on the command line?<div><br></div><div>bash =
-x /etc/init.d/xendomains stop</div><div><br></div><div>bash -x /etc/init.d=
/xendomains start<br></div><div><br></div><div>Depending on what you are se=
eing, you may need to adjust your values in /etc/default/xendomains.</div>
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Wed, Jan 22, 2014 at 6:07 PM, Philip Tricca <span dir=3D"ltr">&lt;<a href=
=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hey Chris,<br>
<br>
I&#39;m guessing you&#39;re the only one who may have tried to use this scr=
ipt<br>
before. I&#39;ve got a simple test VM I want to start on boot. The<br>
xendomains script (from the xen recipe) starts my VM but then hangs for<br>
what seems to be forever. Have you had luck or even tried to use this<br>
script before?<br>
<br>
This may not even be the right tool for what I&#39;m trying to do but it&#3=
9;s<br>
there for free so I thought I&#39;d give it a try.<br>
<br>
Thanks,<br>
Philip<br>
</blockquote></div><br></div>

--001a11c2681886591204f0bdccba--
