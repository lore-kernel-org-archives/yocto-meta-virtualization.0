Return-Path: <cjp256@gmail.com>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62837E00498
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jan 2014 17:02:30 -0800 (PST)
Received: by mail-bk0-f51.google.com with SMTP id w10so1850575bkz.24
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jan 2014 17:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ALvkHFE4n5XTVSGvLFWf0OvzhtDHpfDUtPNjS+q5Unk=;
	b=xjyD284HB93UjPIY5hWgqSgfNTSXGXGjhPMmVM81Rak93ZUDqvCjJvHOwUS6e+RKm7
	rWSAOOqSZbhJkGOxB6FJih3OsEPKuOn1743KQCMiRYhFxkK8CuIGnyJFUpkTgJ44crTH
	Y/TcBxhktLHsOxz7PbNyXZ7MFgthholGu3X6VDX9nNinoeflH0qyCBSnG0+/KOPflKAh
	oAHzhfR6jKHVOcrwezgvuPC5bIcID/iYgo3PWb2eTCuChBZD/tbcdQnMw6rnVZp6ndt/
	64lBg1x9Z+eUTqIvvhMMAV5gtaC4ECgOf+n5NgdxiQkbWSfM+r8OLRXoJwYCvF/guZrw
	SMSQ==
MIME-Version: 1.0
X-Received: by 10.152.203.193 with SMTP id ks1mr11647900lac.0.1391130148587;
	Thu, 30 Jan 2014 17:02:28 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Thu, 30 Jan 2014 17:02:28 -0800 (PST)
In-Reply-To: <52EA562A.4090806@twobit.us>
References: <52E04F4F.7070003@twobit.us>
	<CABZSBQf84tJNhwdkjGE3MpXhVrtOX_fvmUkk+YBZ52W6FRrA5A@mail.gmail.com>
	<52EA562A.4090806@twobit.us>
Date: Thu, 30 Jan 2014 20:02:28 -0500
Message-ID: <CABZSBQczDTucrdbK7o6x=Fxx9b+mz5Qb4+xuDd+1dk9tCUnyQw@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Jan 2014 01:02:34 -0000
Content-Type: multipart/alternative; boundary=001a113470d257cb4c04f139ba8e

--001a113470d257cb4c04f139ba8e
Content-Type: text/plain; charset=ISO-8859-1

Try changing up the arguments to xl - remove the quiet arg and add the -v /
-d flags:

e.g.: xl -v create -d vm.cfg

If there are no hints in the extra output - then check out the logs in
/var/log/xen/* see if there are any clues?



On Thu, Jan 30, 2014 at 8:39 AM, Philip Tricca <flihp@twobit.us> wrote:

> On 01/24/2014 04:11 PM, Chris Patterson wrote:
> > It works for me (on a slightly modified xen-image-minimal) with some
> > complaints about head (-c flag not implemented in busybox) if you don't
> > have coreutils installed (add coreutils to your image and that should go
> > away).
> >
> > Can you try it on the command line?
> >
> > bash -x /etc/init.d/xendomains stop
> >
> > bash -x /etc/init.d/xendomains start
> >
> > Depending on what you are seeing, you may need to adjust your values in
> > /etc/default/xendomains.
>
> Oddly enough the script is blocking on the call to 'xl create --quiet
> --defconfig ...'. While the script is blocked on this call, I can
> background it (Ctrl+z) and connect a console to the VM that it started.
> I can log into it and everything so I'm pretty convinced it started fine.
>
> Killing off the console I can then bring the call to the xendomains
> script to the foreground again. When I do this it's still blocked on the
> call to 'xl create'. Creating the VM manually using xl works as
> expected.  Pretty sure this isn't just a timeout issue as
> 'XENDOMAINS_CREATE_USLEEP' is 5 seconds by default. This seems to be
> hanging indefinitely. Starting VMs is the simple case so I'm at a bit of
> a loss.
>
> Thanks,
> Philip
>
> > On Wed, Jan 22, 2014 at 6:07 PM, Philip Tricca <flihp@twobit.us
> > <mailto:flihp@twobit.us>> wrote:
> >
> >     Hey Chris,
> >
> >     I'm guessing you're the only one who may have tried to use this
> script
> >     before. I've got a simple test VM I want to start on boot. The
> >     xendomains script (from the xen recipe) starts my VM but then hangs
> for
> >     what seems to be forever. Have you had luck or even tried to use this
> >     script before?
> >
> >     This may not even be the right tool for what I'm trying to do but
> it's
> >     there for free so I thought I'd give it a try.
> >
> >     Thanks,
> >     Philip
> >
> >
>
>

--001a113470d257cb4c04f139ba8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Try changing up the arguments to xl - remove the quiet arg=
 and add the -v / -d flags:<div><br></div><div>e.g.: xl -v create -d vm.cfg=
</div><div><br></div><div>If there are no hints in the extra output - then =
check out the logs in /var/log/xen/* see if there are any clues?</div>
<div><br></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 30, 2014 at 8:39 AM, Philip Tricca <span dir=3D"ltr">&l=
t;<a href=3D"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 01/24/2014 04:11 PM, Ch=
ris Patterson wrote:<br>
&gt; It works for me (on a slightly modified xen-image-minimal) with some<b=
r>
&gt; complaints about head (-c flag not implemented in busybox) if you don&=
#39;t<br>
&gt; have coreutils installed (add coreutils to your image and that should =
go<br>
&gt; away).<br>
&gt;<br>
&gt; Can you try it on the command line?<br>
&gt;<br>
&gt; bash -x /etc/init.d/xendomains stop<br>
&gt;<br>
&gt; bash -x /etc/init.d/xendomains start<br>
&gt;<br>
&gt; Depending on what you are seeing, you may need to adjust your values i=
n<br>
&gt; /etc/default/xendomains.<br>
<br>
</div>Oddly enough the script is blocking on the call to &#39;xl create --q=
uiet<br>
--defconfig ...&#39;. While the script is blocked on this call, I can<br>
background it (Ctrl+z) and connect a console to the VM that it started.<br>
I can log into it and everything so I&#39;m pretty convinced it started fin=
e.<br>
<br>
Killing off the console I can then bring the call to the xendomains<br>
script to the foreground again. When I do this it&#39;s still blocked on th=
e<br>
call to &#39;xl create&#39;. Creating the VM manually using xl works as<br>
expected. =A0Pretty sure this isn&#39;t just a timeout issue as<br>
&#39;XENDOMAINS_CREATE_USLEEP&#39; is 5 seconds by default. This seems to b=
e<br>
hanging indefinitely. Starting VMs is the simple case so I&#39;m at a bit o=
f<br>
a loss.<br>
<br>
Thanks,<br>
Philip<br>
<div class=3D"im HOEnZb"><br>
&gt; On Wed, Jan 22, 2014 at 6:07 PM, Philip Tricca &lt;<a href=3D"mailto:f=
lihp@twobit.us">flihp@twobit.us</a><br>
</div><div class=3D"HOEnZb"><div class=3D"h5">&gt; &lt;mailto:<a href=3D"ma=
ilto:flihp@twobit.us">flihp@twobit.us</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 Hey Chris,<br>
&gt;<br>
&gt; =A0 =A0 I&#39;m guessing you&#39;re the only one who may have tried to=
 use this script<br>
&gt; =A0 =A0 before. I&#39;ve got a simple test VM I want to start on boot.=
 The<br>
&gt; =A0 =A0 xendomains script (from the xen recipe) starts my VM but then =
hangs for<br>
&gt; =A0 =A0 what seems to be forever. Have you had luck or even tried to u=
se this<br>
&gt; =A0 =A0 script before?<br>
&gt;<br>
&gt; =A0 =A0 This may not even be the right tool for what I&#39;m trying to=
 do but it&#39;s<br>
&gt; =A0 =A0 there for free so I thought I&#39;d give it a try.<br>
&gt;<br>
&gt; =A0 =A0 Thanks,<br>
&gt; =A0 =A0 Philip<br>
&gt;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--001a113470d257cb4c04f139ba8e--
